@implementation _LAAuthenticationBiometricMethodShim

+ (_LAAuthenticationBiometricMethodShim)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (_LAAuthenticationBiometricMethodShim *)(id)sharedInstance_shim;
}

- (_LAAuthenticationBiometricMethodShim)init
{
  _LAAuthenticationBiometricMethodShim *v2;
  LAAuthenticationBiometricMethodConfiguration *v3;
  LAAuthenticationBiometricMethod *v4;
  LAAuthenticationBiometricMethod *biometricMethod;
  void *v6;
  void *v7;
  char v8;
  LAAuthenticationBiometricMethod *v9;
  NSObject *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_LAAuthenticationBiometricMethodShim;
  v2 = -[_LAAuthenticationBiometricMethodShim init](&v12, sel_init);
  if (v2)
  {
    v3 = -[LAAuthenticationBiometricMethodConfiguration initWithAutoRetry:avoidUsingFaceIDCamera:allowedUsers:authenticationContext:]([LAAuthenticationBiometricMethodConfiguration alloc], "initWithAutoRetry:avoidUsingFaceIDCamera:allowedUsers:authenticationContext:", 1, 0, 0, 0);
    v4 = -[LAAuthenticationBiometricMethod initWithConfiguration:]([LAAuthenticationBiometricMethod alloc], "initWithConfiguration:", v3);
    biometricMethod = v2->_biometricMethod;
    v2->_biometricMethod = v4;

    -[_LAAuthenticationBiometricMethodShim biometricMethod](v2, "biometricMethod");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", v2);

    -[_LAAuthenticationBiometricMethodShim biometricMethod](v2, "biometricMethod");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "start");

    if ((v8 & 1) == 0)
    {
      v9 = v2->_biometricMethod;
      v2->_biometricMethod = 0;

    }
    +[_LABKLog log](_LABKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_LAAuthenticationBiometricMethodShim init].cold.1(v2, v10);

  }
  return v2;
}

- (void)authenticationMethod:(id)a3 didStartWithState:(id)a4
{
  id v6;
  LAAuthenticationBiometricMethodState *v7;
  NSObject *v8;
  LAAuthenticationBiometricMethodState *biometricMethodState;

  v6 = a3;
  v7 = (LAAuthenticationBiometricMethodState *)a4;
  +[_LABKLog log](_LABKLog, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_LAAuthenticationBiometricMethodShim authenticationMethod:didStartWithState:].cold.1();

  biometricMethodState = self->_biometricMethodState;
  self->_biometricMethodState = v7;

}

- (void)authenticationMethod:(id)a3 didChangeState:(id)a4
{
  id v6;
  LAAuthenticationBiometricMethodState *v7;
  NSObject *v8;
  void *v9;
  LAAuthenticationBiometricMethodState *biometricMethodState;
  LAAuthenticationBiometricMethodState *v11;
  void *v12;

  v6 = a3;
  v7 = (LAAuthenticationBiometricMethodState *)a4;
  +[_LABKLog log](_LABKLog, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_LAAuthenticationBiometricMethodShim authenticationMethod:didChangeState:].cold.1();

  NSStringFromSelector(sel_biometricMethodState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LAAuthenticationBiometricMethodShim willChangeValueForKey:](self, "willChangeValueForKey:", v9);

  biometricMethodState = self->_biometricMethodState;
  self->_biometricMethodState = v7;
  v11 = v7;

  NSStringFromSelector(sel_biometricMethodState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LAAuthenticationBiometricMethodShim didChangeValueForKey:](self, "didChangeValueForKey:", v12);
}

- (void)authenticationMethod:(id)a3 didAuthenticateWithResult:(id)a4
{
  id v6;
  LAAuthenticationMethodResult *v7;
  NSObject *v8;
  void *v9;
  LAAuthenticationMethodResult *biometricMethodResult;
  LAAuthenticationMethodResult *v11;
  void *v12;

  v6 = a3;
  v7 = (LAAuthenticationMethodResult *)a4;
  +[_LABKLog log](_LABKLog, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_LAAuthenticationBiometricMethodShim authenticationMethod:didAuthenticateWithResult:].cold.1();

  NSStringFromSelector(sel_biometricMethodResult);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LAAuthenticationBiometricMethodShim willChangeValueForKey:](self, "willChangeValueForKey:", v9);

  biometricMethodResult = self->_biometricMethodResult;
  self->_biometricMethodResult = v7;
  v11 = v7;

  NSStringFromSelector(sel_biometricMethodResult);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LAAuthenticationBiometricMethodShim didChangeValueForKey:](self, "didChangeValueForKey:", v12);
}

- (LAAuthenticationBiometricMethod)biometricMethod
{
  return self->_biometricMethod;
}

- (LAAuthenticationBiometricMethodState)biometricMethodState
{
  return (LAAuthenticationBiometricMethodState *)objc_getProperty(self, a2, 16, 1);
}

- (LAAuthenticationMethodResult)biometricMethodResult
{
  return (LAAuthenticationMethodResult *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricMethodResult, 0);
  objc_storeStrong((id *)&self->_biometricMethodState, 0);
  objc_storeStrong((id *)&self->_biometricMethod, 0);
}

- (void)init
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "biometricMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1B971E000, a2, OS_LOG_TYPE_DEBUG, "%@ init, method=%@", (uint8_t *)&v5, 0x16u);

}

- (void)authenticationMethod:didStartWithState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_1B971E000, v0, v1, "%@ didStartWithState:%@");
  OUTLINED_FUNCTION_4_0();
}

- (void)authenticationMethod:didChangeState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_1B971E000, v0, v1, "%@ didChangeState:%@");
  OUTLINED_FUNCTION_4_0();
}

- (void)authenticationMethod:didAuthenticateWithResult:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_1B971E000, v0, v1, "%@ didAuthenticateWithResult:%@");
  OUTLINED_FUNCTION_4_0();
}

@end
