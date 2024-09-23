@implementation LNEntitlementsValidator

+ (BOOL)validateEntitlement:(id)a3 forCurrentTaskWithValidator:(id)a4
{
  id v6;
  id v7;
  SecTaskRef v8;
  SecTaskRef v9;
  uint64_t v10;
  char v11;
  _QWORD aBlock[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = SecTaskCreateFromSelf(0);
  if (v8)
  {
    v9 = v8;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__LNEntitlementsValidator_validateEntitlement_forCurrentTaskWithValidator___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v8;
    v10 = (uint64_t)_Block_copy(aBlock);
    v11 = objc_msgSend(a1, "validateEntitlement:secTaskRef:validator:", v6, v9, v7);
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
  else
  {
    getLNLogCategorySecurity();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, (os_log_t)v10, OS_LOG_TYPE_FAULT, "SecTaskCreateFromSelf() failed, assuming this task is NOT entitled.", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

void __75__LNEntitlementsValidator_validateEntitlement_forCurrentTaskWithValidator___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (BOOL)validateEntitlement:(id)a3 secTaskRef:(__SecTask *)a4 validator:(id)a5
{
  uint64_t (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  char v10;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t (**)(id, void *))a5;
  error = 0;
  v8 = (void *)SecTaskCopyValueForEntitlement(a4, (CFStringRef)a3, &error);
  if (error)
  {
    getLNLogCategorySecurity();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = error;
      _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_FAULT, "SecTaskCopyValueForEntitlement() failed with error %{public}@", buf, 0xCu);
    }

    CFRelease(error);
    v10 = 0;
  }
  else
  {
    v10 = v7[2](v7, v8);
  }

  return v10;
}

+ (BOOL)validateEntitlement:(id)a3 auditToken:(id *)a4 validator:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  SecTaskRef v11;
  SecTaskRef v12;
  uint64_t v13;
  char v14;
  _QWORD aBlock[5];
  audit_token_t token;

  v8 = a3;
  v9 = a5;
  v10 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&token.val[4] = v10;
  v11 = SecTaskCreateWithAuditToken(0, &token);
  if (v11)
  {
    v12 = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__LNEntitlementsValidator_validateEntitlement_auditToken_validator___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v11;
    v13 = (uint64_t)_Block_copy(aBlock);
    v14 = objc_msgSend(a1, "validateEntitlement:secTaskRef:validator:", v8, v12, v9);
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }
  else
  {
    getLNLogCategorySecurity();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl(&dword_1A18F6000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed, assuming the task is NOT entitled.", (uint8_t *)&token, 2u);
    }
    v14 = 0;
  }

  return v14;
}

+ (NSString)bundleIdentifierForCurrentProcess
{
  SecTaskRef v2;
  __SecTask *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v8;
  _QWORD aBlock[5];

  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__LNEntitlementsValidator_bundleIdentifierForCurrentProcess__block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v2;
    v4 = (uint64_t)_Block_copy(aBlock);
    v8 = 0;
    v5 = (void *)SecTaskCopyValueForEntitlement(v3, CFSTR("application-identifier"), 0);
    if (v5)
    {
      v6 = CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
      CFRelease(v5);
      if (v6)
        v5 = v8;
      else
        v5 = 0;
    }
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    getLNLogCategorySecurity();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A18F6000, (os_log_t)v4, OS_LOG_TYPE_FAULT, "SecTaskCreateFromSelf() failed, assuming this task is NOT entitled.", (uint8_t *)&v8, 2u);
    }
    v5 = 0;
  }

  return (NSString *)v5;
}

void __60__LNEntitlementsValidator_bundleIdentifierForCurrentProcess__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __68__LNEntitlementsValidator_validateEntitlement_auditToken_validator___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
