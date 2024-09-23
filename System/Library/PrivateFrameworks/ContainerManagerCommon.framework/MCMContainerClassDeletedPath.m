@implementation MCMContainerClassDeletedPath

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v16;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "posixUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_posixOwnerForDeletedPathForContainerClass:user:", a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1, "_modeForContainerClass:", a4);
  v10 = containermanager_copy_global_configuration();
  v11 = objc_msgSend(v10, "isGlobalContainerClass:", a4);

  if (v11)
  {
    objc_msgSend(a1, "deletedGlobalURL");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(a1, "deletedURLWithUserIdentity:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = a4;
    _os_log_fault_impl(&dword_1CF807000, v16, OS_LOG_TYPE_FAULT, "Container class [%llu] requires a user identity.", buf, 0xCu);
  }

  v13 = 0;
LABEL_6:
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBaseURL:categoryComponent:classComponent:containerClass:POSIXOwner:POSIXMode:userIdentity:", v13, 0, 0, a4, v8, v9, v6);

  return v14;
}

+ (id)deletedGlobalURL
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "managedPathRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containermanagerDeathrow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v6 = containermanager_copy_global_configuration();
  objc_msgSend(v6, "libraryRepair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = a1;
  v16 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__MCMContainerClassDeletedPath_deletedGlobalURL__block_invoke;
  v15[3] = &__block_descriptor_40_e19_B24__0__NSURL_8__16l;
  v9 = objc_msgSend(v7, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v8, &v16, v15);
  v10 = v16;

  if (!v9)
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2114;
      v20 = v10;
      _os_log_fault_impl(&dword_1CF807000, v12, OS_LOG_TYPE_FAULT, "Failed to create deathrow at %@: %{public}@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v5, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = v11;

  return v13;
}

+ (id)deletedURLWithUserIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryRepairForUserIdentity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containermanagerUserDeathrow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_posixOwnerForDeletedPathForContainerClass:(unint64_t)a3 user:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = containermanager_copy_global_configuration();
  LODWORD(a3) = objc_msgSend(v6, "isGlobalContainerClass:", a3);

  if ((_DWORD)a3)
  {
    v7 = containermanager_copy_global_configuration();
    objc_msgSend(v7, "currentUser");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

uint64_t __48__MCMContainerClassDeletedPath_deletedGlobalURL__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = containermanager_copy_global_configuration();
  objc_msgSend(v6, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v5, 493, v7, 0xFFFFFFFFLL, 0, a3);

  return v8;
}

@end
