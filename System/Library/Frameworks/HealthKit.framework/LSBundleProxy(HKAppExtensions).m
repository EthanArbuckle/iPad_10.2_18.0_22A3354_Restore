@implementation LSBundleProxy(HKAppExtensions)

+ (id)hk_appExtensionContainerBundleForConnection:()HKAppExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _OWORD v15[2];

  v3 = a3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0CA5898];
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(v15, 0, sizeof(v15));
  v14 = 0;
  objc_msgSend(v5, "bundleRecordForAuditToken:error:", v15, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[LSBundleProxy(HKAppExtensions) hk_appExtensionContainerBundleForConnection:].cold.1();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      +[LSBundleProxy(HKAppExtensions) hk_appExtensionContainerBundleForConnection:].cold.2();
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v8 = v6;
  objc_msgSend(v8, "containingBundleRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CA5890];
  objc_msgSend(v9, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleProxyForURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v12;
}

+ (void)hk_appExtensionContainerBundleForConnection:()HKAppExtensions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Failed to create bundle record for %{public}@ with error %{public}@");
}

+ (void)hk_appExtensionContainerBundleForConnection:()HKAppExtensions .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Expected application extension record for %{public}@ but got %{public}@");
}

@end
