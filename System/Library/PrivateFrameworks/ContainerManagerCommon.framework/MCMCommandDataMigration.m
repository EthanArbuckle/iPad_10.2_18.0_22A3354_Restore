@implementation MCMCommandDataMigration

+ (unint64_t)command
{
  return 24;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  char v4;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToStartDataMigration");

  return v4;
}

- (void)execute
{
  void *v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  MCMResultBase *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[MCMMigrationStatus currentBuildVersion](MCMMigrationStatus, "currentBuildVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Performing Data Migration on %@", buf, 0xCu);

  }
  v19 = 0;
  v6 = -[MCMCommandDataMigration _performInternalACLMigrationWithError:](self, "_performInternalACLMigrationWithError:", &v19);
  v7 = v19;
  if (!v6)
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Failed to migrate ACLs on system containers : %@", buf, 0xCu);
    }

  }
  v9 = containermanager_copy_global_configuration();
  v10 = objc_msgSend(v9, "dispositionForContainerClass:", 1);

  if (v10 != 1)
  {
    v12 = v7;
LABEL_13:
    if (v6)
      goto LABEL_17;
    goto LABEL_14;
  }
  v18 = v7;
  v11 = -[MCMCommandDataMigration _performBundleContainerOwnershipMigrationWithError:](self, "_performBundleContainerOwnershipMigrationWithError:", &v18);
  v12 = v18;

  if (v11)
    goto LABEL_13;
  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Failed to migrate bundle containers to system location : %@", buf, 0xCu);
  }

LABEL_14:
  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to perform data migration : %@", buf, 0xCu);
  }

LABEL_17:
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_impl(&dword_1CF807000, v15, OS_LOG_TYPE_DEFAULT, "System data migration; error = %@", buf, 0xCu);
  }

  v16 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v12);
  -[MCMCommand resultPromise](self, "resultPromise");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "completeWithResult:", v16);

  objc_autoreleasePoolPop(v3);
}

- (BOOL)_performBundleContainerOwnershipMigrationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MCMError *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  void *v25;
  uint64_t v26;
  MCMError *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[MCMCommand context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentityCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultUserIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "staticConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  objc_msgSend(v8, "configForContainerClass:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = containermanager_copy_global_configuration();
  objc_msgSend(v11, "classPathCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerClassPathForUserIdentity:containerConfig:typeClass:", v6, v10, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v15 = v14;
  if (v13)
  {
    if ((objc_msgSend(v14, "hasMigrationOccurredForType:", CFSTR("BundleMigration")) & 1) != 0)
    {
      v16 = 0;
      v17 = 0;
LABEL_9:
      v9 = 1;
      goto LABEL_10;
    }
    v32 = a3;
    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEFAULT, "Changing ownership of bundle container content.", buf, 2u);
    }

    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "categoryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = containermanager_copy_global_configuration();
    objc_msgSend(v21, "bundleContainerOwner");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v23 = objc_msgSend(v19, "standardizeOwnershipAtURL:toPOSIXUser:error:", v20, v22, &v33);
    v17 = v33;

    if ((v23 & 1) != 0)
    {
LABEL_8:
      objc_msgSend(v15, "setMigrationCompleteForType:", CFSTR("BundleMigration"), v32);
      v16 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v17, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v26 = objc_msgSend(v17, "code");

      if (v26 == 2)
        goto LABEL_8;
    }
    else
    {

    }
    v27 = [MCMError alloc];
    objc_msgSend(v13, "categoryURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MCMError initWithNSError:url:defaultErrorType:](v27, "initWithNSError:url:defaultErrorType:", v17, v28, 127);

    container_log_handle_for_category();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "categoryURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      v36 = 2112;
      v37 = v17;
      _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Failed to change owner of %@: %@", buf, 0x16u);

    }
    if (v32)
    {
      v16 = objc_retainAutorelease(v16);
      v9 = 0;
      *v32 = v16;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
LABEL_10:

  return v9;
}

- (BOOL)_performInternalACLMigrationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  MCMError *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  MCMError *v36;
  _QWORD *v37;
  int v38;
  id *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentityCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultUserIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = containermanager_copy_global_configuration();
  objc_msgSend(v9, "staticConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configForContainerClass:", 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = containermanager_copy_global_configuration();
  objc_msgSend(v12, "staticConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configForContainerClass:", 13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = containermanager_copy_global_configuration();
  LODWORD(v13) = objc_msgSend(v15, "systemContainerMode");

  if ((_DWORD)v13 != 1 || (objc_msgSend(v5, "hasMigrationOccurredForType:", CFSTR("ACLMigration")) & 1) != 0)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
LABEL_4:
    v20 = 1;
    goto LABEL_5;
  }
  v22 = containermanager_copy_global_configuration();
  objc_msgSend(v22, "classPathCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "containerClassPathForUserIdentity:containerConfig:typeClass:", v8, v11, objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "classURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v25, "itemExistsAtURL:", v17);

  v39 = a3;
  if (!(_DWORD)v23)
  {
    v40 = 0;
    goto LABEL_12;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v27 = objc_msgSend(v26, "standardizeAllSystemContainerACLsAtURL:error:", v17, &v42);
  v40 = v42;

  if ((v27 & 1) != 0)
  {
LABEL_12:
    v16 = 0;
    v38 = 1;
    goto LABEL_13;
  }
  container_log_handle_for_category();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v40;
    _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Failed to set ACLs on system containers : %@", buf, 0xCu);
  }

  v16 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v40, v17, 63);
  v38 = 0;
LABEL_13:
  v29 = containermanager_copy_global_configuration();
  objc_msgSend(v29, "classPathCache");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "containerClassPathForUserIdentity:containerConfig:typeClass:", v8, v14, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "classURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = objc_msgSend(v32, "itemExistsAtURL:", v18);

  if ((_DWORD)v31)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v34 = objc_msgSend(v33, "standardizeAllSystemContainerACLsAtURL:error:", v18, &v41);
    v19 = v41;

    if ((v34 & 1) == 0)
    {
      container_log_handle_for_category();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v19;
        _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Failed to set ACLs on system group containers : %@", buf, 0xCu);
      }

      v36 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v19, v18, 63);
      v16 = v36;
      v37 = v39;
      goto LABEL_21;
    }
  }
  else
  {
    v19 = v40;
  }
  v37 = v39;
  if (v38)
  {
    objc_msgSend(v5, "setMigrationCompleteForType:", CFSTR("ACLMigration"));
    goto LABEL_4;
  }
LABEL_21:
  if (v37)
  {
    v16 = objc_retainAutorelease(v16);
    v20 = 0;
    *v37 = v16;
  }
  else
  {
    v20 = 0;
  }
LABEL_5:

  return v20;
}

@end
