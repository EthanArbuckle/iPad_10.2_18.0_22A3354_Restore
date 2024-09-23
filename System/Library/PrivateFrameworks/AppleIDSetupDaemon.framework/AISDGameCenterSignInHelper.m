@implementation AISDGameCenterSignInHelper

- (AISDGameCenterSignInHelper)initWithAuthenticationResults:(id)a3
{
  id v5;
  AISDGameCenterSignInHelper *v6;
  AISDGameCenterSignInHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISDGameCenterSignInHelper;
  v6 = -[AISDGameCenterSignInHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authenticationResults, a3);

  return v7;
}

- (void)signInWithCompletionHandler:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  void *v4;

  v3 = (void (**)(id, _QWORD, void *))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[AISDGameCenterSignInHelper signInWithCompletionHandler:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AppleIDSetupDaemon.GameCenterSignInHelper"), 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0, v4);

}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationResults, 0);
}

- (void)signInWithCompletionHandler:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236602000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AISDGameCenterSignInHelper: Not expected to be called for non-tvOS platform", v0, 2u);
}

@end
