Rails.application.routes.draw do
  
  resources :gigs do
  	member do
  		delete :delete_photo
  		post :upload_photo
  	end	
    resources :orders, only: [:create]
  end	

  get '/search', to: 'pages#search'

  resources :requests
  get '/all-requests', to: 'requests#list'
  get '/request_offers/:id', to: 'requests#offers', as: 'request_offers'
  get '/my_offers', to: 'requests#my_offers'

  get '/dashboard', to: 'users#dashboard'
  post '/users/edit', to: 'users#update'
  post '/offers', to: 'offers#create'
  post '/reviews', to: 'reviews#create'

  get '/users/:id', to: 'users#show'
  get '/selling_orders', to: 'orders#selling_orders'
  get '/buying_orders', to: 'orders#buying_orders'

  put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'
  put '/offers/:id/accept', to: 'offers#accept', as: 'accept_offer'
  put '/offers/:id/reject', to: 'offers#reject', as: 'reject_offer'

  devise_for :users, 
  				path: '', 
  				path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
  				controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  root to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
