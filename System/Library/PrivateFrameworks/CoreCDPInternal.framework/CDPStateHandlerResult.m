@implementation CDPStateHandlerResult

+ (id)resultWithCloudDataProtectionEnabled:(BOOL)a3 shouldCompleteSignIn:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  v8 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v8, "setCloudDataProtectionEnabled:", v6);
  objc_msgSend(v8, "setShouldCompleteSignIn:", v5);
  objc_msgSend(v8, "setPeeriCloudKeychainState:", 0);
  objc_msgSend(v8, "setError:", v7);

  return v8;
}

+ (id)resultWithCloudDataProtectionEnabled:(BOOL)a3 shouldCompleteSignIn:(BOOL)a4 peeriCloudKeychainState:(unint64_t)a5 error:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = a6;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "setCloudDataProtectionEnabled:", v8);
  objc_msgSend(v10, "setShouldCompleteSignIn:", v7);
  objc_msgSend(v10, "setPeeriCloudKeychainState:", a5);
  objc_msgSend(v10, "setError:", v9);

  return v10;
}

+ (id)resultWithError:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)successResult
{
  return (id)objc_msgSend((id)objc_opt_class(), "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 1, 1, 0);
}

- (BOOL)cloudDataProtectionEnabled
{
  return self->_cloudDataProtectionEnabled;
}

- (void)setCloudDataProtectionEnabled:(BOOL)a3
{
  self->_cloudDataProtectionEnabled = a3;
}

- (BOOL)shouldCompleteSignIn
{
  return self->_shouldCompleteSignIn;
}

- (void)setShouldCompleteSignIn:(BOOL)a3
{
  self->_shouldCompleteSignIn = a3;
}

- (unint64_t)peeriCloudKeychainState
{
  return self->_peeriCloudKeychainState;
}

- (void)setPeeriCloudKeychainState:(unint64_t)a3
{
  self->_peeriCloudKeychainState = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
