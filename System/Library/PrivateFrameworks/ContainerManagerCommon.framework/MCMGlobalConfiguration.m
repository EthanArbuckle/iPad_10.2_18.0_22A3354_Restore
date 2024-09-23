@implementation MCMGlobalConfiguration

- (unsigned)dispositionForContainerClass:(unint64_t)a3
{
  return -[MCMGlobalConfiguration dispositionForContainerClass:forUser:](self, "dispositionForContainerClass:forUser:", a3, 0);
}

- (unsigned)dispositionForContainerClass:(unint64_t)a3 forUser:(id)a4
{
  id v6;
  id v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  int v17;

  v6 = a4;
  if (a3 <= 8 && ((1 << a3) & 0x12A) != 0)
  {
    v7 = containermanager_copy_global_configuration();
    v8 = objc_msgSend(v7, "bundleContainerMode");

    v9 = v8 - 1;
  }
  else
  {
    v11 = a3 & 0xFFFFFFFFFFFFFFFELL;
    v12 = containermanager_copy_global_configuration();
    v13 = v12;
    if (v11 != 12)
    {
      v15 = objc_msgSend(v12, "userContainerMode");

      if (v15 == 2
        || v15 == 1
        && (!v6
         || (-[MCMGlobalConfiguration defaultUser](self, "defaultUser"),
             v16 = (void *)objc_claimAutoreleasedReturnValue(),
             v17 = objc_msgSend(v6, "isEqual:", v16),
             v16,
             v17)))
      {
        v10 = 1;
        goto LABEL_14;
      }
LABEL_13:
      v10 = 0;
      goto LABEL_14;
    }
    v14 = objc_msgSend(v12, "systemContainerMode");

    v9 = v14 - 1;
  }
  if (v9 >= 3)
    goto LABEL_13;
  v10 = dword_1CF8D9C4C[v9];
LABEL_14:

  return v10;
}

- (unsigned)userContainerMode
{
  return self->_userContainerMode;
}

- (BOOL)isGlobalSystemContainerWithContainerClass:(unint64_t)a3
{
  id v3;
  BOOL v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
    return 0;
  v3 = containermanager_copy_global_configuration();
  v4 = objc_msgSend(v3, "systemContainerMode") == 1;

  return v4;
}

- (BOOL)isGlobalBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3;
  id v4;

  v3 = 0;
  if (a3 <= 8 && ((1 << a3) & 0x12A) != 0)
  {
    v4 = containermanager_copy_global_configuration();
    v3 = objc_msgSend(v4, "bundleContainerMode") == 1;

  }
  return v3;
}

- (unsigned)systemContainerMode
{
  return self->_systemContainerMode;
}

- (BOOL)isUnsupportedSystemContainerWithContainerClass:(unint64_t)a3
{
  id v3;
  BOOL v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
    return 0;
  v3 = containermanager_copy_global_configuration();
  v4 = objc_msgSend(v3, "systemContainerMode") == 0;

  return v4;
}

- (MCMPOSIXUser)currentUser
{
  return self->_currentUser;
}

- (unsigned)runmode
{
  return self->_runmode;
}

- (MCMContainerClassPathCache)classPathCache
{
  MCMGlobalConfiguration *v2;
  MCMContainerClassPathCache *v3;
  void *v4;
  uint64_t v5;
  MCMContainerClassPathCache *classPathCache;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_classPathCache)
  {
    v3 = [MCMContainerClassPathCache alloc];
    +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MCMContainerClassPathCache initWithUserIdentityCache:](v3, "initWithUserIdentityCache:", v4);
    classPathCache = v2->_classPathCache;
    v2->_classPathCache = (MCMContainerClassPathCache *)v5;

  }
  objc_sync_exit(v2);

  return v2->_classPathCache;
}

- (MCMPOSIXUser)defaultUser
{
  return self->_defaultUser;
}

- (MCMGlobalConfiguration)initWithStaticConfig:(id)a3 runMode:(unsigned int)a4 userContainerMode:(unsigned int)a5 bundleContainerMode:(unsigned int)a6 bundleContainerOwner:(id)a7 systemContainerMode:(unsigned int)a8 systemContainerOwner:(id)a9 kernelUpcallEnabled:(BOOL)a10
{
  id v17;
  id v18;
  MCMGlobalConfiguration *v19;
  MCMContainerClassIterator *v20;
  MCMContainerClassIterator *classIterator;
  void *v22;
  void *v23;
  MCMPOSIXUser *v24;
  MCMPOSIXUser *defaultUser;
  uint64_t v26;
  MCMPOSIXUser *currentUser;
  uint64_t v28;
  NSURL *homeDirectory;
  MCMManagedPathRegistry *v30;
  MCMManagedPathRegistry *managedPathRegistry;
  MCMLibraryRepair *v32;
  MCMManagedPathRegistry *v33;
  void *v34;
  uint64_t v35;
  MCMLibraryRepair *libraryRepair;
  NSObject *v37;
  MCMGlobalConfiguration *result;
  MCMPOSIXUser *v39;
  MCMPOSIXUser *v40;
  MCMPOSIXUser *bundleContainerOwner;
  NSURL *v42;
  NSObject *v43;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  MCMPOSIXUser *v47;
  __int16 v48;
  MCMPOSIXUser *v49;
  __int16 v50;
  MCMPOSIXUser *v51;
  __int16 v52;
  NSURL *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a7;
  v44 = a9;
  v45.receiver = self;
  v45.super_class = (Class)MCMGlobalConfiguration;
  v19 = -[MCMGlobalConfiguration init](&v45, sel_init);
  if (!v19)
  {
LABEL_9:

    return v19;
  }
  container_class_for_each_normalized_class();
  objc_storeStrong((id *)&v19->_staticConfig, a3);
  v20 = -[MCMContainerClassIterator initWithStaticConfig:]([MCMContainerClassIterator alloc], "initWithStaticConfig:", v17);
  classIterator = v19->_classIterator;
  v19->_classIterator = v20;

  v19->_runmode = a4;
  v19->_userContainerMode = a5;
  v19->_bundleContainerMode = a6;
  objc_storeStrong((id *)&v19->_bundleContainerOwner, a7);
  v19->_systemContainerMode = a8;
  objc_storeStrong((id *)&v19->_systemContainerOwner, a9);
  objc_msgSend(v17, "defaultUser");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
    v24 = (MCMPOSIXUser *)objc_claimAutoreleasedReturnValue();
  }
  defaultUser = v19->_defaultUser;
  v19->_defaultUser = v24;

  +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
  v26 = objc_claimAutoreleasedReturnValue();
  currentUser = v19->_currentUser;
  v19->_currentUser = (MCMPOSIXUser *)v26;

  v19->_kernelUpcallEnabled = a10;
  -[MCMPOSIXUser homeDirectoryURL](v19->_currentUser, "homeDirectoryURL");
  v28 = objc_claimAutoreleasedReturnValue();
  homeDirectory = v19->_homeDirectory;
  v19->_homeDirectory = (NSURL *)v28;

  if (v19->_homeDirectory)
  {
    v30 = -[MCMManagedPathRegistry initWithDaemonUser:privileged:]([MCMManagedPathRegistry alloc], "initWithDaemonUser:privileged:", v19->_currentUser, a4 == 0);
    managedPathRegistry = v19->_managedPathRegistry;
    v19->_managedPathRegistry = v30;

    v32 = [MCMLibraryRepair alloc];
    v33 = v19->_managedPathRegistry;
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[MCMLibraryRepair initWithManagedPathRegistry:fileManager:classIterator:](v32, "initWithManagedPathRegistry:fileManager:classIterator:", v33, v34, v19->_classIterator);
    libraryRepair = v19->_libraryRepair;
    v19->_libraryRepair = (MCMLibraryRepair *)v35;

    container_log_handle_for_category();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = v19->_defaultUser;
      v40 = v19->_currentUser;
      bundleContainerOwner = v19->_bundleContainerOwner;
      v42 = v19->_homeDirectory;
      *(_DWORD *)buf = 138413058;
      v47 = v39;
      v48 = 2112;
      v49 = v40;
      v50 = 2112;
      v51 = bundleContainerOwner;
      v52 = 2112;
      v53 = v42;
      _os_log_error_impl(&dword_1CF807000, v37, OS_LOG_TYPE_ERROR, "Default user: %@, current user: %@, bundle owner: %@, home dir: [%@]", buf, 0x2Au);
    }

    goto LABEL_9;
  }
  container_log_handle_for_category();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CF807000, v43, OS_LOG_TYPE_ERROR, "could not get home directory...aborting\n", buf, 2u);
  }

  result = (MCMGlobalConfiguration *)_os_crash();
  __break(1u);
  return result;
}

- (void)signpostFirstContainerClass:(unint64_t)a3
{
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 <= 0xD)
  {
    v3 = container_class_normalized();
    os_unfair_lock_lock_with_options();
    v4 = gSignpostedFirstContainerOfClass[v3];
    gSignpostedFirstContainerOfClass[v3] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&gSignpostedFirstContainerOfClassLock + v3);
    if (v4)
    {
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v4 != -1 && os_signpost_enabled(v5))
      {
        v7 = 134349056;
        v8 = v3;
        _os_signpost_emit_with_name_impl(&dword_1CF807000, v6, OS_SIGNPOST_INTERVAL_END, v4, "VendFirstContainerOfClass", " class=%{public, signpost.description:attribute}llu ", (uint8_t *)&v7, 0xCu);
      }

    }
  }
}

- (NSURL)sharedContainersDirectory
{
  void *v3;
  int v4;
  MCMGlobalConfiguration *v5;
  uint64_t v6;
  NSURL *sharedContainersDirectory;
  void *v8;
  NSURL *v9;
  char v10;
  id v11;
  NSObject *v12;
  NSURL *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MCMGlobalConfiguration currentUser](self, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRoot");

  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (!v5->_sharedContainersDirectory)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/containers"), 1);
      v6 = objc_claimAutoreleasedReturnValue();
      sharedContainersDirectory = v5->_sharedContainersDirectory;
      v5->_sharedContainersDirectory = (NSURL *)v6;

    }
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5->_sharedContainersDirectory;
    v16 = 0;
    v10 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v9, 1, 493, &v16);
    v11 = v16;

    if ((v10 & 1) == 0)
    {
      container_log_handle_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](v5->_sharedContainersDirectory, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v11;
        _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Failed to create shared container dir at \"%@\": %@", buf, 0x16u);

      }
      v13 = v5->_sharedContainersDirectory;
      v5->_sharedContainersDirectory = 0;

    }
    objc_sync_exit(v5);

  }
  return self->_sharedContainersDirectory;
}

- (NSArray)appUserDataItemNames
{
  return (NSArray *)&unk_1E8CD6A20;
}

- (NSArray)excludedFromAppUserData
{
  return (NSArray *)&unk_1E8CD6A38;
}

- (BOOL)isInternalImage
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__MCMGlobalConfiguration_isInternalImage__block_invoke;
  v4[3] = &unk_1E8CB6458;
  v4[4] = self;
  if (isInternalImage_onceToken != -1)
    dispatch_once(&isInternalImage_onceToken, v4);
  return self->_isInternalImage;
}

- (BOOL)isUserSystemContainerWithContainerClass:(unint64_t)a3
{
  id v3;
  BOOL v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
    return 0;
  v3 = containermanager_copy_global_configuration();
  v4 = objc_msgSend(v3, "systemContainerMode") == 2;

  return v4;
}

- (BOOL)isPerUserBundleContainerWithContainerClass:(unint64_t)a3
{
  id v3;
  BOOL v4;

  if (a3 != 14)
    return 0;
  v3 = containermanager_copy_global_configuration();
  v4 = objc_msgSend(v3, "bundleContainerMode") != 0;

  return v4;
}

- (BOOL)isUserBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3;
  id v4;

  v3 = 0;
  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x12A) != 0)
    {
      v4 = containermanager_copy_global_configuration();
      v3 = objc_msgSend(v4, "bundleContainerMode") == 2;
    }
    else
    {
      if (a3 != 14)
        return v3;
      v4 = containermanager_copy_global_configuration();
      v3 = objc_msgSend(v4, "bundleContainerMode") != 0;
    }

  }
  return v3;
}

- (BOOL)isUnsupportedBundleContainerWithContainerClass:(unint64_t)a3
{
  BOOL v3;
  id v4;

  v3 = 0;
  if (a3 <= 0xE && ((1 << a3) & 0x412A) != 0)
  {
    v4 = containermanager_copy_global_configuration();
    v3 = objc_msgSend(v4, "bundleContainerMode") == 0;

  }
  return v3;
}

- (BOOL)isGlobalContainerClass:(unint64_t)a3
{
  _BOOL4 v5;

  if (a3 - 2 < 0xD && ((0x13B5u >> (a3 - 2)) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else if (-[MCMGlobalConfiguration isGlobalSystemContainerWithContainerClass:](self, "isGlobalSystemContainerWithContainerClass:", a3)|| (v5 = -[MCMGlobalConfiguration isGlobalBundleContainerWithContainerClass:](self, "isGlobalBundleContainerWithContainerClass:", a3)))
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)handlesGlobalContainers
{
  id v2;
  BOOL v3;
  id v4;

  v2 = containermanager_copy_global_configuration();
  if (objc_msgSend(v2, "bundleContainerMode") == 1)
  {
    v3 = 1;
  }
  else
  {
    v4 = containermanager_copy_global_configuration();
    v3 = objc_msgSend(v4, "systemContainerMode") == 1;

  }
  return v3;
}

- (BOOL)handlesUserContainers
{
  id v2;
  BOOL v3;
  id v4;
  id v5;

  v2 = containermanager_copy_global_configuration();
  if (objc_msgSend(v2, "userContainerMode"))
  {
    v3 = 1;
  }
  else
  {
    v4 = containermanager_copy_global_configuration();
    if (objc_msgSend(v4, "bundleContainerMode") == 2)
    {
      v3 = 1;
    }
    else
    {
      v5 = containermanager_copy_global_configuration();
      v3 = objc_msgSend(v5, "systemContainerMode") == 2;

    }
  }

  return v3;
}

- (MCMStaticConfiguration)staticConfig
{
  return self->_staticConfig;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (void)setIsInternalImage:(BOOL)a3
{
  self->_isInternalImage = a3;
}

- (unsigned)bundleContainerMode
{
  return self->_bundleContainerMode;
}

- (MCMPOSIXUser)bundleContainerOwner
{
  return self->_bundleContainerOwner;
}

- (MCMPOSIXUser)systemContainerOwner
{
  return self->_systemContainerOwner;
}

- (MCMManagedPathRegistry)managedPathRegistry
{
  return self->_managedPathRegistry;
}

- (MCMLibraryRepair)libraryRepair
{
  return self->_libraryRepair;
}

- (BOOL)kernelUpcallEnabled
{
  return self->_kernelUpcallEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryRepair, 0);
  objc_storeStrong((id *)&self->_managedPathRegistry, 0);
  objc_storeStrong((id *)&self->_classPathCache, 0);
  objc_storeStrong((id *)&self->_systemContainerOwner, 0);
  objc_storeStrong((id *)&self->_bundleContainerOwner, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_defaultUser, 0);
  objc_storeStrong((id *)&self->_excludedFromAppUserData, 0);
  objc_storeStrong((id *)&self->_appUserDataItemNames, 0);
  objc_storeStrong((id *)&self->_sharedContainersDirectory, 0);
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_staticConfig, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
}

uint64_t __41__MCMGlobalConfiguration_isInternalImage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = os_variant_has_internal_content();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

void __175__MCMGlobalConfiguration_initWithStaticConfig_runMode_userContainerMode_bundleContainerMode_bundleContainerOwner_systemContainerMode_systemContainerOwner_kernelUpcallEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, &gSignpostedFirstContainerOfClass[a2]);

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VendFirstContainerOfClass", ", v7, 2u);
  }

  gSignpostedFirstContainerOfClass[a2] = v4;
  gSignpostedFirstContainerOfClassLock[a2] = 0;
}

@end
