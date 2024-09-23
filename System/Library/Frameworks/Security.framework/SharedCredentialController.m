@implementation SharedCredentialController

- (void)dealloc
{
  objc_super v3;

  -[ASAuthorizationController setDelegate:](self->_controller, "setDelegate:", 0);
  -[ASAuthorizationController setPresentationContextProvider:](self->_controller, "setPresentationContextProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SharedCredentialController;
  -[SharedCredentialController dealloc](&v3, sel_dealloc);
}

- (void)_requestCredential
{
  ASAuthorizationPasswordProvider *v3;
  ASAuthorizationPasswordProvider *provider;
  ASAuthorizationController *controller;
  id v6;
  void *v7;
  void *v8;
  ASAuthorizationController *v9;
  ASAuthorizationController *v10;
  OS_dispatch_semaphore *v11;
  OS_dispatch_semaphore *semaphore;
  NSError *error;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!self->_provider)
  {
    if (loadAuthenticationServices_onceToken != -1)
      dispatch_once(&loadAuthenticationServices_onceToken, &__block_literal_global_8400);
    v3 = (ASAuthorizationPasswordProvider *)objc_alloc_init((Class)objc_retainAutorelease((id)kASAuthorizationPasswordProviderClass));
    provider = self->_provider;
    self->_provider = v3;

  }
  controller = self->_controller;
  if (!controller)
  {
    if (loadAuthenticationServices_onceToken != -1)
      dispatch_once(&loadAuthenticationServices_onceToken, &__block_literal_global_8400);
    v6 = objc_alloc((Class)objc_retainAutorelease((id)kASAuthorizationControllerClass));
    -[ASAuthorizationPasswordProvider createRequest](self->_provider, "createRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (ASAuthorizationController *)objc_msgSend(v6, "initWithAuthorizationRequests:", v8);
    v10 = self->_controller;
    self->_controller = v9;

    controller = self->_controller;
  }
  -[ASAuthorizationController setDelegate:](controller, "setDelegate:", self);
  -[ASAuthorizationController setPresentationContextProvider:](self->_controller, "setPresentationContextProvider:", self);
  v11 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v11;

  self->_result = -25300;
  error = self->_error;
  self->_error = 0;

  -[ASAuthorizationController performRequests](self->_controller, "performRequests");
}

- (id)passwordCredential
{
  ASPasswordCredential *passwordCredential;

  passwordCredential = self->_passwordCredential;
  if (!passwordCredential)
  {
    -[SharedCredentialController _requestCredential](self, "_requestCredential");
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    passwordCredential = self->_passwordCredential;
  }
  return passwordCredential;
}

- (id)error
{
  return self->_error;
}

- (int)result
{
  return self->_result;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  ASPasswordCredential *v9;
  int v10;
  ASPasswordCredential *passwordCredential;
  uint8_t v12[16];

  v5 = a4;
  secLogObjForScope("swcagent");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEBUG, "SWC received didCompleteWithAuthorization", v12, 2u);
  }

  objc_msgSend(v5, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (loadAuthenticationServices_onceToken != -1)
    dispatch_once(&loadAuthenticationServices_onceToken, &__block_literal_global_8400);
  v8 = objc_retainAutorelease((id)kASPasswordCredentialClass);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v10 = 0;
  }
  else
  {
    v9 = 0;
    v10 = -25300;
  }
  passwordCredential = self->_passwordCredential;
  self->_passwordCredential = v9;

  self->_result = v10;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  NSError *v5;
  NSObject *v6;
  ASPasswordCredential *passwordCredential;
  NSError *error;
  NSError *v9;
  uint8_t v10[16];

  v5 = (NSError *)a4;
  secLogObjForScope("swcagent");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEBUG, "SWC received didCompleteWithError", v10, 2u);
  }

  passwordCredential = self->_passwordCredential;
  self->_passwordCredential = 0;

  error = self->_error;
  self->_error = v5;
  v9 = v5;

  self->_result = -25300;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  void *v3;
  void *v4;

  if (loadUIKit_onceToken != -1)
    dispatch_once(&loadUIKit_onceToken, &__block_literal_global_88);
  objc_msgSend(objc_retainAutorelease((id)kUIApplicationClass), "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_passwordCredential, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
