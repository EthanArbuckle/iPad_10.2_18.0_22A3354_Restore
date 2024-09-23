@implementation ICLocalAuthentication

+ (int64_t)biometricsPolicy
{
  if (ICInternalSettingsIsOnenessUnlockEnabled())
    return 4;
  else
    return 1;
}

+ (LAContext)biometricsContext
{
  id v2;
  void *v3;
  id v4;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)_biometricsContext;
  if (!_biometricsContext)
  {
    objc_msgSend(v2, "refreshBiometricsContext");
    v3 = (void *)_biometricsContext;
  }
  v4 = v3;
  objc_sync_exit(v2);

  return (LAContext *)v4;
}

+ (void)setBiometricsContext:(id)a3
{
  id v4;
  void *v5;
  id obj;

  v4 = a3;
  obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)_biometricsContext;
  _biometricsContext = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (NSError)biometricsContextError
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)_biometricsContextError;
  objc_sync_exit(v2);

  return (NSError *)v3;
}

+ (void)setBiometricsContextError:(id)a3
{
  id v4;
  void *v5;
  id obj;

  v4 = a3;
  obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)_biometricsContextError;
  _biometricsContextError = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (void)refreshBiometricsContext
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests") & 1) == 0)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    objc_msgSend(v3, "setBiometricsContext:", v4);

    objc_msgSend(v3, "biometricsContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v5, "canEvaluatePolicy:error:", objc_msgSend(v3, "biometricsPolicy"), &v7);
    v6 = v7;

    objc_msgSend(v3, "setBiometricsContextError:", v6);
    objc_sync_exit(v3);

  }
}

+ (BOOL)biometricsAvailable
{
  id v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = a1;
  objc_sync_enter(v2);
  objc_msgSend(v2, "biometricsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "biometricsContextError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "code") != -6;

  }
  else
  {
    v5 = 0;
  }

  objc_sync_exit(v2);
  return v5;
}

+ (BOOL)biometricsEnrolled
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (objc_msgSend(v2, "biometricsAvailable"))
  {
    objc_msgSend(v2, "biometricsContextError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "code") != -7;

  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

+ (BOOL)biometricsLockedOut
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (objc_msgSend(v2, "biometricsAvailable"))
  {
    objc_msgSend(v2, "biometricsContextError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "code") == -8;

  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

+ (int64_t)biometricsType
{
  id v2;
  void *v3;
  int64_t v4;

  v2 = a1;
  objc_sync_enter(v2);
  objc_msgSend(v2, "biometricsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "biometryType");

  objc_sync_exit(v2);
  return v4;
}

+ (NSData)biometricsPolicyState
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a1;
  objc_sync_enter(v2);
  objc_msgSend(v2, "biometricsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluatedPolicyDomainState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(v2);
  return (NSData *)v5;
}

+ (void)checkBiometricsPolicyState
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];

  v2 = a1;
  objc_sync_enter(v2);
  objc_msgSend(v2, "biometricsContextError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_24;
  }
  if ((objc_msgSend(MEMORY[0x1E0D641E0], "isRunningInApp") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests") & 1) != 0)
  {
    +[ICKeychain dataForIdentifier:account:](ICKeychain, "dataForIdentifier:account:", CFSTR("ICPasswordPolicyDomainStateKey"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "biometricsPolicyState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v4)
      v7 = 0;
    else
      v7 = v4;
    v8 = v7;
    if (v6 == v5)
      v9 = 0;
    else
      v9 = v5;
    v10 = v9;
    if (v8 | v10)
    {
      v11 = (void *)v10;
      if (v8)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (v12)
      {

      }
      else
      {
        v13 = objc_msgSend((id)v8, "isEqual:", v10);

        if ((v13 & 1) != 0)
          goto LABEL_23;
      }
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Cached biometrics policy state has changed", v16, 2u);
      }

      objc_msgSend(v2, "biometricsPolicyState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICKeychain setData:forIdentifier:account:error:](ICKeychain, "setData:forIdentifier:account:error:", v15, CFSTR("ICPasswordPolicyDomainStateKey"), 0, 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICLocalAuthenticationDidChangeBiometricsPolicyStateNotification"), v2);
    }

LABEL_23:
  }
LABEL_24:
  objc_sync_exit(v2);

}

+ (BOOL)hasPasscode
{
  id v2;
  void *v3;
  char v4;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)_hasPasscode;
  if (!_hasPasscode)
  {
    objc_msgSend(v2, "refreshHasPasscode");
    v3 = (void *)_hasPasscode;
  }
  v4 = objc_msgSend(v3, "BOOLValue");
  objc_sync_exit(v2);

  return v4;
}

+ (void)setHasPasscode:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = a3;
  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_hasPasscode;
  _hasPasscode = v4;

  objc_sync_exit(obj);
}

+ (void)refreshHasPasscode
{
  uint64_t v2;
  void *v3;
  id v4;

  if ((objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests") & 1) == 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "canEvaluatePolicy:error:", 2, 0));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_hasPasscode;
    _hasPasscode = v2;

  }
}

@end
