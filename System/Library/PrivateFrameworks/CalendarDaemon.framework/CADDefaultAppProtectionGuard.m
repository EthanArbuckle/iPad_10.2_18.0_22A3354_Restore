@implementation CADDefaultAppProtectionGuard

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  return (id)shared_guard;
}

void __38__CADDefaultAppProtectionGuard_shared__block_invoke()
{
  CADDefaultAppProtectionGuard *v0;
  void *v1;

  v0 = objc_alloc_init(CADDefaultAppProtectionGuard);
  v1 = (void *)shared_guard;
  shared_guard = (uint64_t)v0;

}

- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantedByEntitlement:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];
  _QWORD v16[4];
  id v17;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v13 = 2;
    else
      v13 = 1;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __159__CADDefaultAppProtectionGuard_initiateAuthenticationForApplicationWithBundleIdentifier_onBehalfOfProcessWithAuditToken_accessGrantedByEntitlement_completion___block_invoke;
    v16[3] = &unk_1E6A36758;
    v17 = v10;
    v14 = *(_OWORD *)&a4->var0[4];
    v15[0] = *(_OWORD *)a4->var0;
    v15[1] = v14;
    objc_msgSend(v12, "initiateAuthenticationWithShieldingForSubject:onBehalfOfProcessWithAuditToken:accessGrantReason:completion:", v11, v15, v13, v16);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
  }

}

void __159__CADDefaultAppProtectionGuard_initiateAuthenticationForApplicationWithBundleIdentifier_onBehalfOfProcessWithAuditToken_accessGrantedByEntitlement_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = CADLogHandle;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      v7 = "CADDefaultAppProtectionGuard: initiateAuth error: %@";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 12;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    v7 = "CADDefaultAppProtectionGuard: initiateAuth finished with success.";
    v8 = v6;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 2;
LABEL_7:
    _os_log_impl(&dword_1B6A18000, v8, v9, v7, (uint8_t *)&v11, v10);
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);

}

@end
