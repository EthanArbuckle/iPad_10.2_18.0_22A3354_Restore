@implementation MIGlobalConfiguration

- (MIGlobalConfiguration)init
{
  MIGlobalConfiguration *v2;
  NSURL *v3;
  NSURL *installdPath;
  NSURL *v5;
  unsigned int v6;
  NSURL *v7;
  NSURL *mobilePath;
  NSURL *v9;
  uint64_t v10;
  NSURL *rootPath;
  void *v12;
  id v14;
  id v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MIGlobalConfiguration;
  v2 = -[MIGlobalConfiguration init](&v17, sel_init);
  if (v2)
  {
    v15 = 0;
    v16 = 0;
    MIFetchInfoForUsername("_installd", (uid_t *)&v16 + 1, (gid_t *)&v16, &v15);
    v3 = (NSURL *)v15;
    installdPath = v2->_installdPath;
    v2->_installdPath = v3;
    v5 = v3;

    v6 = v16;
    v2->_uid = HIDWORD(v16);
    v2->_gid = v6;
    v14 = 0;
    MIFetchInfoForUsername("mobile", 0, 0, &v14);
    v7 = (NSURL *)v14;
    mobilePath = v2->_mobilePath;
    v2->_mobilePath = v7;
    v9 = v7;

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/"), 1);
    v10 = objc_claimAutoreleasedReturnValue();
    rootPath = v2->_rootPath;
    v2->_rootPath = (NSURL *)v10;

    objc_msgSend(getUMUserManagerClass_0(), "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_isSharediPad = objc_msgSend(v12, "isSharedIPad");

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MIGlobalConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_instance;
}

void __39__MIGlobalConfiguration_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (BOOL)allowDeletableSystemApps
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MIGlobalConfiguration_allowDeletableSystemApps__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  if (allowDeletableSystemApps_onceToken != -1)
    dispatch_once(&allowDeletableSystemApps_onceToken, block);
  return self->_allowDeletableSystemApps;
}

uint64_t __49__MIGlobalConfiguration_allowDeletableSystemApps__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t result;

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disableSystemAppDeletionCanaryFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "itemExistsAtURL:", v3);

  if (v4)
  {
    result = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      result = MOLogWrite();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
  else
  {
    result = +[ICLFeatureFlags systemAppDeletionEnabled](ICLFeatureFlags, "systemAppDeletionEnabled");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  }
  return result;
}

- (BOOL)hasEAPFSVolumeSplit
{
  return 1;
}

- (NSURL)oldDataDirectoryPath
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration mobilePath](self, "mobilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/MobileInstallation"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)oldLoggingPath
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration mobilePath](self, "mobilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Logs/MobileInstallation"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)oldArchiveDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration mobilePath](self, "mobilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Media/ApplicationArchives"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)roleUserMigrationMarkerFilePath
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("RoleUserMigration.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)systemAppInstallStateFilePath
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration backedUpStateDirectory](self, "backedUpStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("SystemAppInstallState.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)backupSystemAppInstallStateFilePath
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration backedUpStateDirectory](self, "backedUpStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("BackupSystemAppInstallState.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)logDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration installdLibraryPath](self, "installdLibraryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Logs/MobileInstallation"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)helperLogDirectory
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSURL *v7;
  NSURL *helperLogDirectory;
  void *v9;
  NSURL *v10;
  char v11;
  id v12;
  NSURL *v13;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;

  if (self->_helperLogDirectory)
  {
    v3 = 493;
  }
  else
  {
    v18 = 1;
    v4 = container_system_group_path_for_identifier();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Logs"), 1);
      v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
      helperLogDirectory = self->_helperLogDirectory;
      self->_helperLogDirectory = v7;

      free(v5);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v15 = v18;
      MOLogWrite();
    }
    v3 = 511;
  }
  +[MIFileManager defaultManager](MIFileManager, "defaultManager", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_helperLogDirectory;
  v17 = 0;
  v11 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v10, 1, v3, &v17);
  v12 = v17;

  if ((v11 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    -[NSURL path](self->_helperLogDirectory, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v13 = self->_helperLogDirectory;

  return v13;
}

- (NSURL)internalRootDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppleInternal"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)developerRootDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Developer"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)systemDeveloperRootDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Developer"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)coreServicesDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/CoreServices"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)systemAppsDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Applications"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)systemAppPlaceholdersDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/AppPlaceholders"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)systemAppDetachedSignaturesDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/AppSignatures"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)disableSystemAppDeletionCanaryFile
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/disableSystemAppDeletion"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)internalAppsDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration internalRootDirectory](self, "internalRootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Applications"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSSet)developerDirectories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[MIGlobalConfiguration developerRootDirectory](self, "developerRootDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIGlobalConfiguration systemDeveloperRootDirectory](self, "systemDeveloperRootDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (NSURL)stagedSystemAppsDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("private/var/staged_system_apps"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)cryptexAppsDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Cryptexes/App"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)cryptexOSDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Cryptexes/OS"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSSet)cryptexFrameworksDirectories
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MIGlobalConfiguration_cryptexFrameworksDirectories__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  if (cryptexFrameworksDirectories_onceToken != -1)
    dispatch_once(&cryptexFrameworksDirectories_onceToken, block);
  return self->_cryptexFrameworksDirectories;
}

void __53__MIGlobalConfiguration_cryptexFrameworksDirectories__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "cryptexOSDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "systemFrameworksRootDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Frameworks"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v6);

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("PrivateFrameworks"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v7);

  v8 = objc_msgSend(v11, "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v8;

}

- (NSURL)systemFrameworksRootDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)internalFrameworksRootDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration internalRootDirectory](self, "internalRootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSSet)allFrameworksDirectories
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MIGlobalConfiguration_allFrameworksDirectories__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  if (allFrameworksDirectories_onceToken != -1)
    dispatch_once(&allFrameworksDirectories_onceToken, block);
  return self->_allFrameworksDirectories;
}

void __49__MIGlobalConfiguration_allFrameworksDirectories__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "systemFrameworksRootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Frameworks"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "systemFrameworksRootDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("PrivateFrameworks"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v5);

  if (objc_msgSend(*(id *)(a1 + 32), "hasInternalContent"))
  {
    objc_msgSend(*(id *)(a1 + 32), "internalRootDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Frameworks"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v7);

    objc_msgSend(*(id *)(a1 + 32), "internalRootDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("PrivateFrameworks"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v9);

    objc_msgSend(*(id *)(a1 + 32), "internalFrameworksRootDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Frameworks"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v11);

    objc_msgSend(*(id *)(a1 + 32), "internalFrameworksRootDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("PrivateFrameworks"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v13);

  }
  v14 = objc_msgSend(v17, "copy");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (NSURL)systemExtensionKitExtensionsDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/ExtensionKit/Extensions"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)internalExtensionKitExtensionsDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration internalRootDirectory](self, "internalRootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/ExtensionKit/Extensions"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)cryptexExtensionKitExtensionsDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration cryptexOSDirectory](self, "cryptexOSDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/ExtensionKit/Extensions"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSSet)builtInExtensionKitExtensionsDirectories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[MIGlobalConfiguration systemExtensionKitExtensionsDirectory](self, "systemExtensionKitExtensionsDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (-[MIGlobalConfiguration hasInternalContent](self, "hasInternalContent"))
  {
    -[MIGlobalConfiguration internalExtensionKitExtensionsDirectory](self, "internalExtensionKitExtensionsDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v6;
}

- (NSSet)cryptexExtensionKitExtensionsDirectories
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[MIGlobalConfiguration cryptexExtensionKitExtensionsDirectory](self, "cryptexExtensionKitExtensionsDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)allExtensionKitExtensionsDirectories
{
  void *v3;
  void *v4;
  void *v5;

  -[MIGlobalConfiguration builtInExtensionKitExtensionsDirectories](self, "builtInExtensionKitExtensionsDirectories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIGlobalConfiguration cryptexExtensionKitExtensionsDirectories](self, "cryptexExtensionKitExtensionsDirectories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSURL)installdLibraryPath
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration installdPath](self, "installdPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dataDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration installdLibraryPath](self, "installdLibraryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("MobileInstallation"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)cachesDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration installdLibraryPath](self, "installdLibraryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)backedUpStateDirectory
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("BackedUpState"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSSet)appBundleMetadataItemNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Manifest.plist"), CFSTR("iTunesArtwork"), CFSTR("iTunesMetadata.plist"), CFSTR("GeoJSON"), 0);
}

- (NSSet)dataContainerRootItemNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Documents"), CFSTR("Library"), CFSTR("tmp"), CFSTR("StoreKit"), 0);
}

- (NSSet)installationBlacklist
{
  if (installationBlacklist_onceToken != -1)
    dispatch_once(&installationBlacklist_onceToken, &__block_literal_global_5);
  return (NSSet *)(id)installationBlacklist_blacklist;
}

void __46__MIGlobalConfiguration_installationBlacklist__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.iOS6Updater"), CFSTR("is.workflow.my.app"), CFSTR("com.apple.mobileme.fmf1"), CFSTR("com.apple.mobileme.fmip1"), 0);
  v1 = (void *)installationBlacklist_blacklist;
  installationBlacklist_blacklist = v0;

}

- (NSSet)standardInfoMapInfoPlistKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE78], *MEMORY[0x1E0C9AE90], 0);
}

- (id)_bundleIDMapForBundlesInDirectory:(id)a3 withExtension:(id)a4 loadingAdditionalKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIGlobalConfiguration standardInfoMapInfoPlistKeys](self, "standardInfoMapInfoPlistKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    objc_msgSend(v12, "setByAddingObjectsFromSet:", v10);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __95__MIGlobalConfiguration__bundleIDMapForBundlesInDirectory_withExtension_loadingAdditionalKeys___block_invoke;
  v25[3] = &unk_1E6CB7448;
  v16 = v9;
  v26 = v16;
  v17 = v13;
  v27 = v17;
  v18 = v11;
  v28 = v18;
  objc_msgSend(v15, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v8, 1, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v22 = objc_msgSend(v18, "copy");
    goto LABEL_8;
  }
  objc_msgSend(v19, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v21 = objc_msgSend(v19, "code");

    if (v21 == 2)
    {
      v22 = objc_opt_new();
LABEL_8:
      v23 = (void *)v22;
      goto LABEL_14;
    }
  }
  else
  {

  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v23 = 0;
LABEL_14:

  return v23;
}

uint64_t __95__MIGlobalConfiguration__bundleIDMapForBundlesInDirectory_withExtension_loadingAdditionalKeys___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v5 = a2;
  v6 = v5;
  if (a3 == 4)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      MILoadInfoPlist(v6, *(void **)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;

        if (v12)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("com.apple.MobileInstallation.bundleURL"));
          v13 = (void *)objc_msgSend(v9, "copy");
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v13, v12);

        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          MOLogWrite();
        }

      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
      }

    }
  }

  return 1;
}

- (id)_bundleIDMapForBundlesInDirectory:(id)a3 withExtension:(id)a4
{
  return -[MIGlobalConfiguration _bundleIDMapForBundlesInDirectory:withExtension:loadingAdditionalKeys:](self, "_bundleIDMapForBundlesInDirectory:withExtension:loadingAdditionalKeys:", a3, a4, 0);
}

- (id)_bundleIDMapForAppsInDirectory:(id)a3 loadingAdditionalKeys:(id)a4
{
  return -[MIGlobalConfiguration _bundleIDMapForBundlesInDirectory:withExtension:loadingAdditionalKeys:](self, "_bundleIDMapForBundlesInDirectory:withExtension:loadingAdditionalKeys:", a3, CFSTR("app"), a4);
}

- (id)_bundleIDMapForAppsInDirectory:(id)a3
{
  return -[MIGlobalConfiguration _bundleIDMapForAppsInDirectory:loadingAdditionalKeys:](self, "_bundleIDMapForAppsInDirectory:loadingAdditionalKeys:", a3, 0);
}

- (NSSet)builtInApplicationBundleIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MIGlobalConfiguration systemAppBundleIDToInfoMap](self, "systemAppBundleIDToInfoMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIGlobalConfiguration internalAppBundleIDToInfoMap](self, "internalAppBundleIDToInfoMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "addObjectsFromArray:", v4);
  objc_msgSend(v7, "addObjectsFromArray:", v6);
  v8 = (void *)objc_msgSend(v7, "copy");

  return (NSSet *)v8;
}

- (NSDictionary)coreServicesAppBundleIDToInfoMap
{
  MIGlobalConfiguration *v2;
  NSDictionary *coreServicesAppBundleIDToInfoMap;
  void *v4;
  uint64_t v5;
  NSDictionary *v6;
  NSDictionary *v7;

  v2 = self;
  objc_sync_enter(v2);
  coreServicesAppBundleIDToInfoMap = v2->_coreServicesAppBundleIDToInfoMap;
  if (!coreServicesAppBundleIDToInfoMap)
  {
    -[MIGlobalConfiguration coreServicesDirectory](v2, "coreServicesDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIGlobalConfiguration _bundleIDMapForAppsInDirectory:](v2, "_bundleIDMapForAppsInDirectory:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_coreServicesAppBundleIDToInfoMap;
    v2->_coreServicesAppBundleIDToInfoMap = (NSDictionary *)v5;

    coreServicesAppBundleIDToInfoMap = v2->_coreServicesAppBundleIDToInfoMap;
  }
  v7 = coreServicesAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSDictionary)systemAppBundleIDToInfoMap
{
  MIGlobalConfiguration *v2;
  NSDictionary *systemAppBundleIDToInfoMap;
  void *v4;
  uint64_t v5;
  NSDictionary *v6;
  NSDictionary *v7;

  v2 = self;
  objc_sync_enter(v2);
  systemAppBundleIDToInfoMap = v2->_systemAppBundleIDToInfoMap;
  if (!systemAppBundleIDToInfoMap)
  {
    -[MIGlobalConfiguration systemAppsDirectory](v2, "systemAppsDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIGlobalConfiguration _bundleIDMapForAppsInDirectory:](v2, "_bundleIDMapForAppsInDirectory:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_systemAppBundleIDToInfoMap;
    v2->_systemAppBundleIDToInfoMap = (NSDictionary *)v5;

    systemAppBundleIDToInfoMap = v2->_systemAppBundleIDToInfoMap;
  }
  v7 = systemAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSDictionary)stagedSystemAppBundleIDToInfoMap
{
  MIGlobalConfiguration *v2;
  NSDictionary *stagedSystemAppBundleIDToInfoMap;
  void *v4;
  uint64_t v5;
  NSDictionary *v6;
  NSDictionary *v7;

  v2 = self;
  objc_sync_enter(v2);
  stagedSystemAppBundleIDToInfoMap = v2->_stagedSystemAppBundleIDToInfoMap;
  if (!stagedSystemAppBundleIDToInfoMap)
  {
    -[MIGlobalConfiguration stagedSystemAppsDirectory](v2, "stagedSystemAppsDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIGlobalConfiguration _bundleIDMapForAppsInDirectory:](v2, "_bundleIDMapForAppsInDirectory:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_stagedSystemAppBundleIDToInfoMap;
    v2->_stagedSystemAppBundleIDToInfoMap = (NSDictionary *)v5;

    stagedSystemAppBundleIDToInfoMap = v2->_stagedSystemAppBundleIDToInfoMap;
  }
  v7 = stagedSystemAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSDictionary)systemAppPlaceholderBundleIDToInfoMap
{
  MIGlobalConfiguration *v2;
  NSDictionary *systemAppPlaceholderBundleIDToInfoMap;
  void *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *v7;
  NSDictionary *v8;

  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderBundleIDToInfoMap = v2->_systemAppPlaceholderBundleIDToInfoMap;
  if (!systemAppPlaceholderBundleIDToInfoMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("UIRequiredDeviceCapabilities"), CFSTR("UIDeviceFamily"), CFSTR("LSRequiredFeatureFlags"), CFSTR("LSEligibilityPredicatesValidAtEraseInstallDataMigration"), CFSTR("LSEligibilityInstallPredicate"), CFSTR("LSEligibilityUninstallPredicate"), CFSTR("LSInstallByDefault"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIGlobalConfiguration systemAppPlaceholdersDirectory](v2, "systemAppPlaceholdersDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIGlobalConfiguration _bundleIDMapForAppsInDirectory:loadingAdditionalKeys:](v2, "_bundleIDMapForAppsInDirectory:loadingAdditionalKeys:", v5, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v2->_systemAppPlaceholderBundleIDToInfoMap;
    v2->_systemAppPlaceholderBundleIDToInfoMap = (NSDictionary *)v6;

    systemAppPlaceholderBundleIDToInfoMap = v2->_systemAppPlaceholderBundleIDToInfoMap;
  }
  v8 = systemAppPlaceholderBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v8;
}

- (void)setSystemAppPlaceholderBundleIDToInfoMap:(id)a3
{
  NSDictionary *v4;
  NSDictionary *systemAppPlaceholderBundleIDToInfoMap;
  MIGlobalConfiguration *obj;

  v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  systemAppPlaceholderBundleIDToInfoMap = obj->_systemAppPlaceholderBundleIDToInfoMap;
  obj->_systemAppPlaceholderBundleIDToInfoMap = v4;

  objc_sync_exit(obj);
}

- (NSDictionary)internalAppBundleIDToInfoMap
{
  MIGlobalConfiguration *v2;
  NSDictionary *internalAppBundleIDToInfoMap;
  void *v4;
  uint64_t v5;
  NSDictionary *v6;
  NSDictionary *v7;

  v2 = self;
  objc_sync_enter(v2);
  internalAppBundleIDToInfoMap = v2->_internalAppBundleIDToInfoMap;
  if (!internalAppBundleIDToInfoMap)
  {
    -[MIGlobalConfiguration internalAppsDirectory](v2, "internalAppsDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIGlobalConfiguration _bundleIDMapForAppsInDirectory:](v2, "_bundleIDMapForAppsInDirectory:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_internalAppBundleIDToInfoMap;
    v2->_internalAppBundleIDToInfoMap = (NSDictionary *)v5;

    internalAppBundleIDToInfoMap = v2->_internalAppBundleIDToInfoMap;
  }
  v7 = internalAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSSet)builtInFrameworkBundleIDs
{
  MIGlobalConfiguration *v2;
  NSSet *builtInFrameworkBundleIDs;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *v12;
  NSSet *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  builtInFrameworkBundleIDs = v2->_builtInFrameworkBundleIDs;
  if (!builtInFrameworkBundleIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[MIGlobalConfiguration allFrameworksDirectories](v2, "allFrameworksDirectories", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          -[MIGlobalConfiguration _bundleIDMapForBundlesInDirectory:withExtension:](v2, "_bundleIDMapForBundlesInDirectory:withExtension:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8), CFSTR("framework"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "allKeys");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    v11 = objc_msgSend(v4, "copy");
    v12 = v2->_builtInFrameworkBundleIDs;
    v2->_builtInFrameworkBundleIDs = (NSSet *)v11;

    builtInFrameworkBundleIDs = v2->_builtInFrameworkBundleIDs;
  }
  v13 = builtInFrameworkBundleIDs;
  objc_sync_exit(v2);

  return v13;
}

- (NSSet)systemAppPlaceholderBundleIDs
{
  MIGlobalConfiguration *v2;
  NSSet *systemAppPlaceholderBundleIDs;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *v8;
  NSSet *v9;

  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderBundleIDs = v2->_systemAppPlaceholderBundleIDs;
  if (!systemAppPlaceholderBundleIDs)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[MIGlobalConfiguration systemAppPlaceholderBundleIDToInfoMap](v2, "systemAppPlaceholderBundleIDToInfoMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v2->_systemAppPlaceholderBundleIDs;
    v2->_systemAppPlaceholderBundleIDs = (NSSet *)v7;

    systemAppPlaceholderBundleIDs = v2->_systemAppPlaceholderBundleIDs;
  }
  v9 = systemAppPlaceholderBundleIDs;
  objc_sync_exit(v2);

  return v9;
}

- (NSSet)systemAppPlaceholderAppExtensionBundleIDs
{
  MIGlobalConfiguration *v2;
  NSSet *systemAppPlaceholderAppExtensionBundleIDs;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *v18;
  NSSet *v19;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderAppExtensionBundleIDs = v2->_systemAppPlaceholderAppExtensionBundleIDs;
  if (!systemAppPlaceholderAppExtensionBundleIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIGlobalConfiguration systemAppPlaceholderBundleIDToInfoMap](v2, "systemAppPlaceholderBundleIDToInfoMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v24;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.bundleURL"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlugIns"), 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIGlobalConfiguration _bundleIDMapForBundlesInDirectory:withExtension:](v2, "_bundleIDMapForBundlesInDirectory:withExtension:", v11, CFSTR("appex"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              objc_msgSend(v12, "allKeys");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObjectsFromArray:", v13);

            }
            objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Extensions"), 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIGlobalConfiguration _bundleIDMapForBundlesInDirectory:withExtension:](v2, "_bundleIDMapForBundlesInDirectory:withExtension:", v14, CFSTR("appex"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v15, "count"))
            {
              objc_msgSend(v15, "allKeys");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObjectsFromArray:", v16);

            }
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v17 = objc_msgSend(v22, "copy");
    v18 = v2->_systemAppPlaceholderAppExtensionBundleIDs;
    v2->_systemAppPlaceholderAppExtensionBundleIDs = (NSSet *)v17;

    systemAppPlaceholderAppExtensionBundleIDs = v2->_systemAppPlaceholderAppExtensionBundleIDs;
  }
  v19 = systemAppPlaceholderAppExtensionBundleIDs;
  objc_sync_exit(v2);

  return v19;
}

- (NSSet)systemAppPlaceholderXPCServiceBundleIDs
{
  MIGlobalConfiguration *v2;
  NSSet *systemAppPlaceholderXPCServiceBundleIDs;
  MIGlobalConfiguration *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *v17;
  NSSet *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderXPCServiceBundleIDs = v2->_systemAppPlaceholderXPCServiceBundleIDs;
  if (!systemAppPlaceholderXPCServiceBundleIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2;
    -[MIGlobalConfiguration systemAppPlaceholderBundleIDToInfoMap](v2, "systemAppPlaceholderBundleIDToInfoMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.bundleURL"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("XPCServices"), 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIGlobalConfiguration _bundleIDMapForBundlesInDirectory:withExtension:](v4, "_bundleIDMapForBundlesInDirectory:withExtension:", v13, CFSTR("xpc"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "count"))
            {
              objc_msgSend(v14, "allKeys");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObjectsFromArray:", v15);

            }
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v16 = objc_msgSend(v20, "copy");
    v17 = v4->_systemAppPlaceholderXPCServiceBundleIDs;
    v4->_systemAppPlaceholderXPCServiceBundleIDs = (NSSet *)v16;

    systemAppPlaceholderXPCServiceBundleIDs = v4->_systemAppPlaceholderXPCServiceBundleIDs;
    v2 = v4;
  }
  v18 = systemAppPlaceholderXPCServiceBundleIDs;
  objc_sync_exit(v2);

  return v18;
}

- (void)reScanSystemApps
{
  NSDictionary *systemAppBundleIDToInfoMap;
  NSDictionary *systemAppPlaceholderBundleIDToInfoMap;
  NSSet *builtInFrameworkBundleIDs;
  MIGlobalConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  systemAppBundleIDToInfoMap = obj->_systemAppBundleIDToInfoMap;
  obj->_systemAppBundleIDToInfoMap = 0;

  systemAppPlaceholderBundleIDToInfoMap = obj->_systemAppPlaceholderBundleIDToInfoMap;
  obj->_systemAppPlaceholderBundleIDToInfoMap = 0;

  builtInFrameworkBundleIDs = obj->_builtInFrameworkBundleIDs;
  obj->_builtInFrameworkBundleIDs = 0;

  objc_sync_exit(obj);
}

- (void)reScanCoreServicesApps
{
  NSDictionary *coreServicesAppBundleIDToInfoMap;
  MIGlobalConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  coreServicesAppBundleIDToInfoMap = obj->_coreServicesAppBundleIDToInfoMap;
  obj->_coreServicesAppBundleIDToInfoMap = 0;

  objc_sync_exit(obj);
}

- (void)reScanInternalApps
{
  NSDictionary *internalAppBundleIDToInfoMap;
  NSSet *builtInFrameworkBundleIDs;
  MIGlobalConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  internalAppBundleIDToInfoMap = obj->_internalAppBundleIDToInfoMap;
  obj->_internalAppBundleIDToInfoMap = 0;

  builtInFrameworkBundleIDs = obj->_builtInFrameworkBundleIDs;
  obj->_builtInFrameworkBundleIDs = 0;

  objc_sync_exit(obj);
}

- (NSString)alternateThinningModelIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.itunesstored"));
  objc_msgSend(v2, "stringForKey:", CFSTR("ThinnedAppVariantID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)migrationPlistURL
{
  void *v2;
  void *v3;
  id v4;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("MigrationInfo.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return (NSURL *)v3;
}

- (NSURL)lastBuildInfoFileURL
{
  void *v2;
  void *v3;
  id v4;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("LastBuildInfo.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return (NSURL *)v3;
}

- (BOOL)_isInternalReleaseType
{
  if (_isInternalReleaseType_onceToken != -1)
    dispatch_once(&_isInternalReleaseType_onceToken, &__block_literal_global_146);
  return _isInternalReleaseType_isInternalReleaseType;
}

void __47__MIGlobalConfiguration__isInternalReleaseType__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)_CFCopySystemVersionDictionary();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _isInternalReleaseType_isInternalReleaseType = objc_msgSend(v0, "isEqualToString:", CFSTR("Internal"));

}

- (BOOL)allowsInternalSecurityPolicy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MIGlobalConfiguration_allowsInternalSecurityPolicy__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  if (allowsInternalSecurityPolicy_onceToken != -1)
    dispatch_once(&allowsInternalSecurityPolicy_onceToken, block);
  return allowsInternalSecurityPolicy_allowsInternalSecurityPolicy;
}

uint64_t __53__MIGlobalConfiguration_allowsInternalSecurityPolicy__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  allowsInternalSecurityPolicy_allowsInternalSecurityPolicy = result;
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isInternalReleaseType");
    if ((_DWORD)result)
    {
      result = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        return MOLogWrite();
    }
  }
  return result;
}

- (BOOL)hasInternalContent
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MIGlobalConfiguration_hasInternalContent__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  if (hasInternalContent_onceToken != -1)
    dispatch_once(&hasInternalContent_onceToken, block);
  return hasInternalContent_hasInternalContent;
}

uint64_t __43__MIGlobalConfiguration_hasInternalContent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = os_variant_has_internal_content();
  hasInternalContent_hasInternalContent = result;
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isInternalReleaseType");
    if ((_DWORD)result)
    {
      result = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        return MOLogWrite();
    }
  }
  return result;
}

- (unint64_t)installdJetsamLimit
{
  return 78643200;
}

- (unint64_t)helperServiceJetsamLimit
{
  return 5242880;
}

- (NSString)primaryPersonaString
{
  if (primaryPersonaString_onceToken != -1)
    dispatch_once(&primaryPersonaString_onceToken, &__block_literal_global_156);
  return (NSString *)(id)primaryPersonaString_personalPersona;
}

void __45__MIGlobalConfiguration_primaryPersonaString__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getUMUserManagerClass_0(), "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "listAllPersonaWithAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "isPersonalPersona", (_QWORD)v10))
        {
          objc_msgSend(v7, "userPersonaUniqueString");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)primaryPersonaString_personalPersona;
          primaryPersonaString_personalPersona = v8;

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSURL)testFileSentinelForSyncURL
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("TestFileForSync"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)rootPath
{
  return self->_rootPath;
}

- (NSURL)installdPath
{
  return self->_installdPath;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- (BOOL)isSharediPad
{
  return self->_isSharediPad;
}

- (NSURL)mobilePath
{
  return self->_mobilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobilePath, 0);
  objc_storeStrong((id *)&self->_installdPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderXPCServiceBundleIDs, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderAppExtensionBundleIDs, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderBundleIDs, 0);
  objc_storeStrong((id *)&self->_builtInFrameworkBundleIDs, 0);
  objc_storeStrong((id *)&self->_internalAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_stagedSystemAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_systemAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_coreServicesAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_allFrameworksDirectories, 0);
  objc_storeStrong((id *)&self->_cryptexFrameworksDirectories, 0);
  objc_storeStrong((id *)&self->_helperLogDirectory, 0);
}

@end
