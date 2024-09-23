@implementation FBSSignatureValidationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_misInterfaceWrapper, 0);
}

- (unint64_t)trustStateForApplication:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t result;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    kdebug_trace();
    if ((unint64_t)objc_msgSend(v6, "type") >= 2)
      v7 = -[FBSSignatureValidationService _validateApp:](self, "_validateApp:", v6);
    else
      v7 = 8;
    kdebug_trace();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("appInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSignatureValidationService trustStateForApplication:].cold.1(a2, (uint64_t)self, (uint64_t)v9);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSSignatureValidationService)init
{
  void *v3;
  FBSSignatureValidationService *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[FBSSignatureValidationService _initWithMISInterfaceWrapper:](self, "_initWithMISInterfaceWrapper:", v3);

  return v4;
}

- (id)_initWithMISInterfaceWrapper:(id)a3
{
  id v5;
  FBSSignatureValidationService *v6;
  FBSSignatureValidationService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSSignatureValidationService;
  v6 = -[FBSSignatureValidationService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_misInterfaceWrapper, a3);

  return v7;
}

- (unint64_t)_validateApp:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isProvisioningProfileValidated") & 1) != 0)
    v5 = -[FBSSignatureValidationService _validateNonAppStoreApp:](self, "_validateNonAppStoreApp:", v4);
  else
    v5 = -[FBSSignatureValidationService _validateAppStoreApp:](self, "_validateAppStoreApp:", v4);
  v6 = v5;

  return v6;
}

- (unsigned)signatureVersionForApp:(id)a3
{
  _FBSMISInterfaceWrapper *misInterfaceWrapper;
  void *v4;
  void *v5;
  unsigned int v7;

  v7 = 0;
  misInterfaceWrapper = self->_misInterfaceWrapper;
  objc_msgSend(a3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FBSMISInterfaceWrapper signatureVersion:version:](misInterfaceWrapper, "signatureVersion:version:", v5, &v7);

  return v7;
}

- (unint64_t)_validateAppStoreApp:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)getMISLaunchWarningDatabaseClass());
  objc_msgSend(v4, "executableURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "queryForExecutableURL:withError:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (!v7)
  {
    FBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBSSignatureValidationService _validateAppStoreApp:].cold.1((uint64_t)v6, (uint64_t)v8, v11);

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "warningState") || (objc_msgSend(v7, "isUserOverridden") & 1) != 0)
  {
LABEL_10:
    v10 = 8;
    goto LABEL_11;
  }
  FBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "Blocking bundle with outstanding launch warning: %{public}@", buf, 0xCu);
  }

  v10 = 2;
  -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 2, v4, CFSTR("Deny-Listed"));
LABEL_11:

  return v10;
}

- (unint64_t)_validateNonAppStoreApp:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _FBSMISInterfaceWrapper *misInterfaceWrapper;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  unint64_t v16;
  int v17;
  int v18;
  int v19;
  NSObject *v20;
  _QWORD block[5];
  id v23;
  const void *v24;

  v4 = a3;
  if (self->_authoritative)
    v5 = (void *)getkMISValidationOptionAuthoritativeLaunch();
  else
    v5 = (void *)getkMISValidationOptionUnauthoritativeLaunch();
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", MEMORY[0x1E0C9AAB0], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, getkMISValidationOptionHintMainExecutablePath());
  misInterfaceWrapper = self->_misInterfaceWrapper;
  objc_msgSend(v4, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_FBSMISInterfaceWrapper validateSignatureForPath:options:userInfo:](misInterfaceWrapper, "validateSignatureForPath:options:userInfo:", v12, v7, 0);

  if ((_DWORD)v13)
  {
    v24 = 0;
    v14 = CFSTR("Provisioning Profile Not Found");
    switch(v13)
    {
      case 0xE8008009:
      case 0xE800800E:
      case 0xE800800F:
      case 0xE8008012:
      case 0xE8008013:
      case 0xE8008014:
      case 0xE8008017:
      case 0xE8008018:
      case 0xE8008019:
      case 0xE800801A:
      case 0xE800801C:
      case 0xE8008021:
      case 0xE8008027:
        v24 = (const void *)soft_MISCopyErrorStringForErrorCode(v13);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error - %d: reason: %@"), v13, v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 1;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 1, v4, v15);
        v17 = 0;
        goto LABEL_9;
      case 0xE8008011:
        v16 = 3;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 3, v4, CFSTR("Provisioning Profile Expired"));
        goto LABEL_21;
      case 0xE8008015:
      case 0xE800801E:
        goto LABEL_14;
      case 0xE8008016:
        v14 = CFSTR("Profile contains entitlements it's not allowed to have (possibly because we're missing a provisioning profile?)");
LABEL_14:
        v16 = 4;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 4, v4, v14);
        goto LABEL_21;
      case 0xE800801D:
        v16 = 2;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 2, v4, CFSTR("Deny-Listed"));
        goto LABEL_21;
      case 0xE8008024:
        v16 = 5;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 5, v4, CFSTR("Profile revoked by originator (banned)"));
        goto LABEL_21;
      case 0xE8008025:
        v16 = 7;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 7, v4, CFSTR("User hasn't trusted the profile."));
        goto LABEL_21;
      case 0xE8008026:
        v16 = 6;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 6, v4, CFSTR("Requires Network Validation"));
        goto LABEL_21;
      case 0xE8008029:
        v16 = 9;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 9, v4, CFSTR("Signature version no longer supported"));
        goto LABEL_21;
      case 0xE800802B:
        v16 = 10;
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 10, v4, CFSTR("Developer mode is required to run this application"));
LABEL_21:
        v17 = 0;
        break;
      default:
        v24 = (const void *)soft_MISCopyErrorStringForErrorCode(v13);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error - %d: reason: %@"), v13, v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSSignatureValidationService _logTrustState:forApp:reason:](self, "_logTrustState:forApp:reason:", 0, v4, v15);
        v16 = 0;
        v17 = 1;
LABEL_9:

        break;
    }
    v18 = objc_msgSend(v4, "isProvisioningProfileValidated");
    if ((_DWORD)v13 == -402620378)
      v19 = 1;
    else
      v19 = v17;
    if ((v18 & v19) == 1)
    {
      if (_validateNonAppStoreApp__onceToken != -1)
        dispatch_once(&_validateNonAppStoreApp__onceToken, &__block_literal_global_0);
      v20 = _validateNonAppStoreApp__queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__FBSSignatureValidationService__validateNonAppStoreApp___block_invoke_2;
      block[3] = &unk_1E38EAE08;
      block[4] = self;
      v23 = v4;
      dispatch_async(v20, block);

    }
    fbs_release(&v24);
  }
  else
  {
    v16 = 8;
  }

  return v16;
}

void __57__FBSSignatureValidationService__validateNonAppStoreApp___block_invoke()
{
  uint64_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)_validateNonAppStoreApp__queue;
  _validateNonAppStoreApp__queue = Serial;

}

void __57__FBSSignatureValidationService__validateNonAppStoreApp___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = getkMISValidationOptionOnlineAuthorization();
  v2 = MEMORY[0x1E0C9AAB0];
  v9[0] = MEMORY[0x1E0C9AAB0];
  v8[1] = getkMISValidationOptionOnlineCheckType();
  v9[1] = &unk_1E390C408;
  v8[2] = getkMISValidationOptionUnauthoritativeLaunch();
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v4, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateSignatureForPath:options:userInfo:", v7, v3, 0);

}

- (void)_logTrustState:(unint64_t)a3 forApp:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  FBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFBSApplicationTrustState(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ - signature state: %{public}@, reason: %{public}@", (uint8_t *)&v12, 0x20u);

  }
}

- (BOOL)authoritative
{
  return self->_authoritative;
}

- (void)setAuthoritative:(BOOL)a3
{
  self->_authoritative = a3;
}

- (void)trustStateForApplication:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSSignatureValidationService.m");
  v16 = 1024;
  v17 = 97;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)_validateAppStoreApp:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19A6D4000, log, OS_LOG_TYPE_ERROR, "Error checking for launch warning mark: %{public}@, %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
