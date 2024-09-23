@implementation MCMContainerClassTransientPath

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_categoryComponentForContainerClass:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_classComponentForContainerClass:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posixUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "posixOwnerForContainerClass:user:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(a1, "_modeForContainerClass:", a4);
  v12 = containermanager_copy_global_configuration();
  v13 = objc_msgSend(v12, "isGlobalContainerClass:", a4);

  if (v13)
  {
    v14 = containermanager_copy_global_configuration();
    v15 = objc_msgSend(v14, "isGlobalBundleContainerWithContainerClass:", a4);

    if (v15)
      objc_msgSend(a1, "transientGlobalBundleURL");
    else
      objc_msgSend(a1, "transientGlobalURL");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
    {
      container_log_handle_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v21 = a4;
        _os_log_fault_impl(&dword_1CF807000, v17, OS_LOG_TYPE_FAULT, "Container class [%llu] requires a user identity.", buf, 0xCu);
      }
      v18 = 0;
      goto LABEL_14;
    }
    objc_msgSend(a1, "transientURLWithUserIdentity:withContainerClass:", v6, a4);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBaseURL:categoryComponent:classComponent:containerClass:POSIXOwner:POSIXMode:userIdentity:", v16, v7, v8, a4, v10, v11, v6);
LABEL_14:

    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:

  return v18;
}

+ (id)transientGlobalBundleURL
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "sharedContainersDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_globalTemporaryComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)transientGlobalURL
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "managedPathRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containermanagerCaches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_globalTemporaryComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)transientURLWithUserIdentity:(id)a3 withContainerClass:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "_temporaryComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_baseURLForUserIdentity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_globalTemporaryComponent
{
  return CFSTR("Temp");
}

+ (id)_temporaryComponent
{
  return CFSTR("Temp");
}

@end
