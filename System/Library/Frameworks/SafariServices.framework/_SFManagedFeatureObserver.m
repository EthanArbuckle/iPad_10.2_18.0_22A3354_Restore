@implementation _SFManagedFeatureObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_25);
  return (id)sharedObserver_sharedObserver;
}

- (int64_t)biometryTypeCurrentlyAvailableForDevice
{
  LAContext *context;
  id v4;
  void *v5;
  LABiometryType v6;
  id v8;

  context = self->_context;
  v8 = 0;
  -[LAContext canEvaluatePolicy:error:](context, "canEvaluatePolicy:error:", 1, &v8);
  v4 = v8;
  v5 = v4;
  if (v4 && (unint64_t)(objc_msgSend(v4, "code") + 7) < 3)
    v6 = LABiometryTypeNone;
  else
    v6 = -[LAContext biometryType](self->_context, "biometryType");

  return v6;
}

- (BOOL)doesUserHavePasscodeSet
{
  LAContext *context;
  BOOL v3;
  id v4;
  void *v5;
  BOOL v6;
  id v8;

  context = self->_context;
  v8 = 0;
  v3 = -[LAContext canEvaluatePolicy:error:](context, "canEvaluatePolicy:error:", 2, &v8);
  v4 = v8;
  v5 = v4;
  v6 = v3 || objc_msgSend(v4, "code") != -5;

  return v6;
}

- (_SFManagedFeatureObserver)init
{
  _SFManagedFeatureObserver *v2;
  void *v3;
  LAContext *v4;
  LAContext *context;
  _SFManagedFeatureObserver *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFManagedFeatureObserver;
  v2 = -[_SFManagedFeatureObserver init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "registerObserver:", v2);
    else
      objc_msgSend(v3, "addObserver:", v2);
    v2->_cachedAuthenticationRequiredToAutoFill = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F60]) == 1;
    v4 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    context = v2->_context;
    v2->_context = v4;

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "unregisterObserver:", self);
  else
    objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SFManagedFeatureObserver;
  -[_SFManagedFeatureObserver dealloc](&v4, sel_dealloc);
}

- (BOOL)isUserEnrolledInBiometricAuthentication
{
  LAContext *context;
  BOOL v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v11;

  context = self->_context;
  v11 = 0;
  v3 = -[LAContext canEvaluatePolicy:error:](context, "canEvaluatePolicy:error:", 4, &v11);
  v4 = v11;
  v5 = v4;
  if (!v3)
  {
    if (v4)
    {
      objc_msgSend(v4, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CC1280]);

      if (v8)
      {
        v6 = (unint64_t)(objc_msgSend(v5, "code") + 4) < 0xFFFFFFFFFFFFFFFDLL;
        goto LABEL_9;
      }
      v9 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_SFManagedFeatureObserver isUserEnrolledInBiometricAuthentication].cold.1(v9, v5);
    }
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)authenticationRequiredToAutoFill
{
  return self->_cachedAuthenticationRequiredToAutoFill
      && -[_SFManagedFeatureObserver isUserEnrolledInBiometricAuthentication](self, "isUserEnrolledInBiometricAuthentication");
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_cachedAuthenticationRequiredToAutoFill = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F60]) == 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)isUserEnrolledInBiometricAuthentication
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Could not get Local Authentication policy information: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
