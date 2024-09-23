@implementation MCMContainerClassStagingPath

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
  objc_msgSend(a1, "posixOwnerForContainerClass:user:", a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1, "_modeForContainerClass:", a4);
  v10 = containermanager_copy_global_configuration();
  v11 = objc_msgSend(v10, "isGlobalContainerClass:", a4);

  if (v11)
  {
    objc_msgSend(a1, "stagingGlobalURL");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(a1, "stagingURLWithUserIdentity:", v6);
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

+ (id)stagingGlobalURL
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
  objc_msgSend(a1, "_globalStagingComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stagingURLWithUserIdentity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_baseURLForUserIdentity:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_stagingComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_globalStagingComponent
{
  return CFSTR("Staging");
}

+ (id)_stagingComponent
{
  return CFSTR("Staging");
}

@end
