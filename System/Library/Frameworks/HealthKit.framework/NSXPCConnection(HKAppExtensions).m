@implementation NSXPCConnection(HKAppExtensions)

- (BOOL)hk_isAppExtension
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL8 v7;
  id v9;
  _BYTE v10[32];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "auditToken");
  +[_HKXPCAuditToken signingIdentifierFromAuditToken:](_HKXPCAuditToken, "signingIdentifierFromAuditToken:", v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v2, &v9);
    v4 = v9;
    v5 = v4;
    if (v4)
    {
      if ((objc_msgSend(v4, "hk_isErrorInDomain:code:", *MEMORY[0x1E0CB2F90], -10814) & 1) == 0)
      {
        _HKInitializeLogging();
        v6 = HKLogDefault;
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v12 = a1;
          v13 = 2114;
          v14 = v2;
          v15 = 2114;
          v16 = v5;
          _os_log_error_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_ERROR, "Failed to create bundle record for connection %{public}@ with bundleID %{public}@, error %{public}@", buf, 0x20u);
        }
      }
    }
    v7 = v3 != 0;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }

  return v7;
}

@end
