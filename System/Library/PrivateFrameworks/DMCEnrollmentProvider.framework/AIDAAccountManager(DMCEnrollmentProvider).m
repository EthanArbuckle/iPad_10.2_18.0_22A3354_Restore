@implementation AIDAAccountManager(DMCEnrollmentProvider)

- (id)dmc_remoteManagementAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  objc_msgSend(a1, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dmc_remoteManagingAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dmc_remoteManagingAccountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dmc_remoteManagementAccountForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_216358000, v8, OS_LOG_TYPE_ERROR, "iCloud account does not have an RM account identifier", v10, 2u);
    }
    v7 = 0;
  }

  return v7;
}

@end
