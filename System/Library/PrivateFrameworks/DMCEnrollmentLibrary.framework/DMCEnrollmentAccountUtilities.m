@implementation DMCEnrollmentAccountUtilities

+ (void)removeOrphanedEnrollmentAccounts
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_DEFAULT, "DMCAccountUtilities: Searching for orphaned enrollment account...", v5, 2u);
  }
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dmc_accountsWithPredicateBlock:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dmc_removeAccounts:asynchronous:", v4, 0);

}

uint64_t __65__DMCEnrollmentAccountUtilities_removeOrphanedEnrollmentAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if ((objc_msgSend(v2, "dmc_isPrimaryAccount") & 1) != 0)
  {
    v3 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v2, "dmc_personaIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x24BE2A838];
    objc_msgSend(v2, "dmc_personaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "personaWithUniqueIdentifierExists:", v7);

    if ((v6 & 1) == 0)
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        objc_msgSend(v2, "dmc_personaIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "accountType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v17;
        v32 = 2114;
        v33 = v18;
        v34 = 2114;
        v35 = v20;
        v21 = "DMCAccountUtilities: Persona (%{public}@) for orphaned account (%{public}@, %{public}@) does not exist.";
LABEL_18:
        _os_log_impl(&dword_219D1D000, v16, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v30, 0x20u);

      }
LABEL_19:
      v3 = 1;
      goto LABEL_20;
    }
  }
  objc_msgSend(v2, "dmc_remoteManagingAccountIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v2, "dmc_remoteManagementAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v28 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v16 = v28;
        objc_msgSend(v2, "dmc_remoteManagingAccountIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "accountType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v17;
        v32 = 2114;
        v33 = v18;
        v34 = 2114;
        v35 = v20;
        v21 = "DMCAccountUtilities: Remote Management account (%{public}@) for orphaned account (%{public}@, %{public}@) does not exist.";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "memberQueueManagingProfileIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dmc_managementProfileIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "dmc_managementProfileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v22 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        objc_msgSend(v2, "dmc_managementProfileIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "accountType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v24;
        v32 = 2114;
        v33 = v25;
        v34 = 2114;
        v35 = v27;
        _os_log_impl(&dword_219D1D000, v23, OS_LOG_TYPE_ERROR, "DMCAccountUtilities: Enrollment profile (%{public}@) for orphaned account (%{public}@, %{public}@) does not exist.", (uint8_t *)&v30, 0x20u);

      }
      v3 = 1;
    }
  }

LABEL_20:
  return v3;
}

@end
