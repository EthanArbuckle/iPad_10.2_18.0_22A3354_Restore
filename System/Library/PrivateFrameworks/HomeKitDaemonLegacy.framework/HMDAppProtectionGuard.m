@implementation HMDAppProtectionGuard

- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  __int128 v11;
  _OWORD v12[2];

  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v11;
    objc_msgSend(v10, "initiateAuthenticationWithShieldingForSubject:onBehalfOfProcessWithAuditToken:accessGrantReason:completion:", v9, v12, 1, v8);

  }
  else
  {
    v8[2](v8, 1, 0);
  }

}

@end
