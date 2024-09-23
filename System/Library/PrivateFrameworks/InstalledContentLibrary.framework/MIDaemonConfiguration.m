@implementation MIDaemonConfiguration

- (MIDaemonConfiguration)init
{
  MIDaemonConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  int64_t v10;
  id v11;
  char v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  objc_super v18;
  _OWORD v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)MIDaemonConfiguration;
  v2 = -[MIGlobalConfiguration init](&v18, sel_init);
  if (!v2)
    return v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobile.installation"));
  objc_msgSend(v3, "stringForKey:", CFSTR("InstallQOSOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isEqualToString:", CFSTR("unspecified")) & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("interactive")))
  {
    v2->_installQOSOverride = 33;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("initiated")))
  {
    v2->_installQOSOverride = 25;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("default")))
  {
    v2->_installQOSOverride = 21;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("utility")))
  {
    v2->_installQOSOverride = 17;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("background")))
  {
    v2->_installQOSOverride = 9;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_25;
LABEL_24:
    MOLogWrite();
    goto LABEL_25;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v14 = v5;
    MOLogWrite();
  }
LABEL_4:
  v2->_installQOSOverride = 0;
LABEL_25:
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("SkipDeviceFamilyCheck"), v14))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  v2->_skipDeviceFamilyCheck = v6;
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("SkipThinningCheck")))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  v2->_skipThinningCheck = v7;
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("AllowPatchInstallationWithoutSinf")))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v2->_allowPatchWithoutSinf = v8;
  v2->_nSimultaneousInstallations = 5;
  v9 = objc_msgSend(v3, "integerForKey:", CFSTR("SimultaneousInstallsNumber"));
  if (v9 >= 1)
  {
    v10 = v9;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v15 = v9;
      MOLogWrite();
    }
    v2->_nSimultaneousInstallations = v10;
  }
  v17.receiver = v2;
  v17.super_class = (Class)MIDaemonConfiguration;
  v11 = -[MIGlobalConfiguration installdJetsamLimit](&v17, sel_installdJetsamLimit, v15);
  if ((unint64_t)v11 <= 0xC00000)
    -[MIDaemonConfiguration init].cold.1(&v16, v19);
  v2->_estimatedAvailableMemoryForValidation = (unint64_t)v11 - 12582912;
  if (-[MIGlobalConfiguration isSharediPad](v2, "isSharediPad") || (MGGetBoolAnswer() & 1) != 0)
    v12 = 0;
  else
    v12 = os_variant_uses_ephemeral_storage() ^ 1;
  v2->_deviceHasPersonas = v12;

  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MIDaemonConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_daemonConfigOnceToken != -1)
    dispatch_once(&sharedInstance_daemonConfigOnceToken, block);
  return (id)sharedInstance_daemonConfigInstance;
}

void __39__MIDaemonConfiguration_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_daemonConfigInstance;
  sharedInstance_daemonConfigInstance = (uint64_t)v0;

}

- (NSURL)daemonUserDataLibraryDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  if (daemonUserDataLibraryDirectory_onceToken != -1)
    dispatch_once(&daemonUserDataLibraryDirectory_onceToken, block);
  return self->_daemonUserDataLibraryDirectory;
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  uint64_t single_result;
  uint64_t v5;
  uint64_t path;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _OWORD v32[5];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = container_query_create();
  if (v2)
  {
    container_query_set_class();
    v3 = xpc_string_create("com.apple.installd");
    container_query_set_identifiers();

    container_query_set_persona_unique_string();
    container_query_operation_set_flags();
    single_result = container_query_get_single_result();
    if (!single_result)
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_2(v2, &v31, v32);
    v5 = single_result;
    path = container_get_path();
    if (!path)
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_3(v5, &v31, v32);
    v7 = path;
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7, 1, 0);
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = container_copy_sandbox_token();
    if (v10)
    {
      v11 = (void *)v10;
      if (sandbox_extension_consume() < 0)
      {
        v28 = *__error();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_5(v28);
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          strerror(v28);
LABEL_29:
          MOLogWrite();
        }
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        goto LABEL_29;
      }
    }
    else
    {
      v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v20)
        __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_4(v20, v21, v22, v23, v24, v25, v26, v27);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v11 = 0;
    }
  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v12)
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v11 = 0;
    v9 = 0;
  }
  container_query_free();
  free(v11);
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 160);
  *(_QWORD *)(v29 + 160) = v9;

}

- (NSURL)currentUserDataDirectory
{
  void *v2;
  void *v3;

  -[MIDaemonConfiguration daemonUserDataLibraryDirectory](self, "daemonUserDataLibraryDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("MobileInstallation"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserCachesDirectory
{
  void *v2;
  void *v3;

  -[MIDaemonConfiguration daemonUserDataLibraryDirectory](self, "daemonUserDataLibraryDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)codeSigningEnforcementIsDisabled
{
  _BOOL4 v3;
  _QWORD block[5];

  v3 = -[MIGlobalConfiguration allowsInternalSecurityPolicy](self, "allowsInternalSecurityPolicy");
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MIDaemonConfiguration_codeSigningEnforcementIsDisabled__block_invoke;
    block[3] = &unk_1E6CB6CA8;
    block[4] = self;
    if (codeSigningEnforcementIsDisabled_onceToken != -1)
      dispatch_once(&codeSigningEnforcementIsDisabled_onceToken, block);
    LOBYTE(v3) = self->_codeSigningEnforcementIsDisabled;
  }
  return v3;
}

void __57__MIDaemonConfiguration_codeSigningEnforcementIsDisabled__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  int bootarg_state;
  id v7;
  char v8;

  v8 = 0;
  +[MITestManager sharedInstance](MITestManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "isRunningInTestMode:outError:", &v8, &v7);
  v4 = v7;

  if (v3)
  {
    if (v8)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        MOLogWrite();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
      goto LABEL_25;
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    MOLogWrite();
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobile.installation"));
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("FakeCodeSigningNotDisabled")))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  }
  else
  {
    bootarg_state = amfi_interface_query_bootarg_state();
    if (bootarg_state)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        strerror(bootarg_state);
        MOLogWrite();
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
      MOLogWrite();
  }

LABEL_25:
}

- (BOOL)localSigningIsUnrestricted
{
  _BOOL4 v3;
  _QWORD block[5];

  v3 = -[MIGlobalConfiguration allowsInternalSecurityPolicy](self, "allowsInternalSecurityPolicy");
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MIDaemonConfiguration_localSigningIsUnrestricted__block_invoke;
    block[3] = &unk_1E6CB6CA8;
    block[4] = self;
    if (localSigningIsUnrestricted_onceToken != -1)
      dispatch_once(&localSigningIsUnrestricted_onceToken, block);
    LOBYTE(v3) = self->_localSigningIsUnrestricted;
  }
  return v3;
}

uint64_t __51__MIDaemonConfiguration_localSigningIsUnrestricted__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = amfi_interface_query_bootarg_state();
  if ((_DWORD)result)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      strerror(result);
      result = MOLogWrite();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 145))
  {
    result = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      return MOLogWrite();
  }
  return result;
}

- (BOOL)wasErroneousContainerCleanupDone
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobile.installation"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ErroneousContainerCleanupDone"));

  return v3;
}

- (void)setErroneousContainerCleanupDone:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobile.installation"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ErroneousContainerCleanupDone"));

}

- (BOOL)haveUpdatedAppExtensionDataContainersWithParentID
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobile.installation"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("ExtensionDataContainerParentIDUpdateVersion")) == 1;

  return v3;
}

- (void)setHaveUpdatedAppExtensionDataContainersWithParentID:(BOOL)a3
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobile.installation"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E6CD4868, CFSTR("ExtensionDataContainerParentIDUpdateVersion"));

}

- (id)builtInApplicationBundleIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIDaemonConfiguration;
  -[MIGlobalConfiguration builtInApplicationBundleIDs](&v8, sel_builtInApplicationBundleIDs);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MIDiskImageManagerProxy();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "diskImageAppBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setByAddingObjectsFromSet:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v6;
  }

  return v2;
}

- (NSURL)journalStorageBaseURL
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Journal"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserJournalStorageBaseURL
{
  void *v2;
  void *v3;

  -[MIDaemonConfiguration currentUserDataDirectory](self, "currentUserDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Journal"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)launchServicesOperationStorageBaseURL
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("LaunchServicesOperations"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)launchServicesOperationLookAsideStorageBaseURL
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration dataDirectory](self, "dataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ReconcilingLSOperations"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserLaunchServicesOperationStorageBaseURL
{
  void *v2;
  void *v3;

  -[MIDaemonConfiguration currentUserDataDirectory](self, "currentUserDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("LaunchServicesOperations"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)currentUserLaunchServicesOperationLookAsideStorageBaseURL
{
  void *v2;
  void *v3;

  -[MIDaemonConfiguration currentUserDataDirectory](self, "currentUserDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ReconcilingLSOperations"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)stagingRootForSystemContent
{
  void *v2;
  void *v3;

  -[MIGlobalConfiguration cachesDirectory](self, "cachesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.mobile.installd.staging"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)stagingRootForUserContent
{
  void *v3;
  void *v4;

  if (-[MIGlobalConfiguration hasEAPFSVolumeSplit](self, "hasEAPFSVolumeSplit"))
  {
    -[MIDaemonConfiguration currentUserCachesDirectory](self, "currentUserCachesDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.mobile.installd.staging"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MIDaemonConfiguration stagingRootForSystemContent](self, "stagingRootForSystemContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v4;
}

- (id)stagingRootForDevice:(int)a3 url:(id)a4 identifier:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v37 = 0;
  v38 = (id *)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIDaemonConfiguration stagingRootForSystemContent](self, "stagingRootForSystemContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIGlobalConfiguration hasEAPFSVolumeSplit](self, "hasEAPFSVolumeSplit"))
  {
    -[MIDaemonConfiguration stagingRootForUserContent](self, "stagingRootForUserContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v12;
    v45[1] = v13;
    v46[0] = &unk_1E6CD4880;
    v46[1] = &unk_1E6CD4898;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v43 = v12;
    v44 = &unk_1E6CD4880;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__MIDaemonConfiguration_stagingRootForDevice_url_identifier_error___block_invoke;
  v21[3] = &unk_1E6CB70B8;
  v15 = v11;
  v22 = v15;
  v23 = &v27;
  v26 = a3;
  v24 = &v37;
  v25 = &v33;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v21);
  v16 = v38;
  v17 = v38[5];
  if (v17)
  {
    if (!a5)
      goto LABEL_10;
    goto LABEL_6;
  }
  if (v28[5])
  {
    v17 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v10, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "hasPrefix:", CFSTR("/private/var/PersonaVolumes/")) & 1) != 0
    || objc_msgSend(v20, "hasPrefix:", CFSTR("/var/PersonaVolumes/")))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) > 4)
LABEL_23:
      MOLogWrite();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      -[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:].cold.1((uint64_t)v20);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      goto LABEL_23;
  }
  objc_storeStrong(v38 + 5, v12);
  v34[3] = 1;

  v16 = v38;
  v17 = v38[5];
  if (!a5)
    goto LABEL_10;
LABEL_6:
  if (v17)
  {
    *a5 = v34[3];
    v17 = v16[5];
  }
LABEL_10:
  if (a6 && !v17)
  {
    *a6 = objc_retainAutorelease((id)v28[5]);
    v17 = v38[5];
  }
  v18 = v17;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v18;
}

void __67__MIDaemonConfiguration_stagingRootForDevice_url_identifier_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v14;

  v8 = a2;
  v9 = a3;
  v10 = *(void **)(a1 + 32);
  v14 = 0;
  v11 = objc_msgSend(v10, "deviceForURLOrFirstAvailableParent:error:", v8, &v14);
  v12 = v14;
  v13 = v14;
  if (v11 == -1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v12);
    goto LABEL_5;
  }
  if (*(_DWORD *)(a1 + 64) == v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v9, "unsignedIntegerValue");
LABEL_5:
    *a4 = 1;
  }

}

- (id)stagingRootForURL:(id)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;

  v8 = a3;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_msgSend(v9, "deviceForURLOrFirstAvailableParent:error:", v8, &v17);
  v11 = v17;
  v12 = v11;
  if ((_DWORD)v10 == -1)
  {
    v13 = 0;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v16 = v11;
    -[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:](self, "stagingRootForDevice:url:identifier:error:", v10, v8, a4, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;

    v12 = v14;
    if (!a5)
      goto LABEL_7;
  }
  if (!v13)
    *a5 = objc_retainAutorelease(v12);
LABEL_7:

  return v13;
}

- (id)stagingRootForIdentifier:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[MIDaemonConfiguration stagingRootForSystemContent](self, "stagingRootForSystemContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    -[MIDaemonConfiguration stagingRootForUserContent](self, "stagingRootForUserContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v3 = 0;
  }
  return v3;
}

- (unsigned)installQOSOverride
{
  return self->_installQOSOverride;
}

- (BOOL)skipDeviceFamilyCheck
{
  return self->_skipDeviceFamilyCheck;
}

- (BOOL)skipThinningCheck
{
  return self->_skipThinningCheck;
}

- (BOOL)allowPatchWithoutSinf
{
  return self->_allowPatchWithoutSinf;
}

- (int64_t)nSimultaneousInstallations
{
  return self->_nSimultaneousInstallations;
}

- (BOOL)deviceHasPersonas
{
  return self->_deviceHasPersonas;
}

- (unint64_t)estimatedAvailableMemoryForValidation
{
  return self->_estimatedAvailableMemoryForValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonUserDataLibraryDirectory, 0);
}

- (void)init
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B76F3000, MEMORY[0x1E0C81028], a3, "%s: Failed to create container query", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_2(uint64_t a1, _QWORD *a2, _OWORD *a3)
{
  container_query_get_last_error();
  container_error_copy_unlocalized_description();
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_3(uint64_t a1, _QWORD *a2, _OWORD *a3)
{
  container_copy_unlocalized_description();
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B76F3000, MEMORY[0x1E0C81028], a3, "%s: container_copy_sandbox_token returned NULL!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_5(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = 136315650;
  v2 = "_DaemonUserDataLibraryDirectory";
  v3 = 1024;
  v4 = a1;
  v5 = 2080;
  v6 = strerror(a1);
  _os_log_fault_impl(&dword_1B76F3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: Failed to consume daemon container sandbox token: %d (%s)", (uint8_t *)&v1, 0x1Cu);
}

- (void)stagingRootForDevice:(uint64_t)a1 url:identifier:error:.cold.1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:]";
  v3 = 2112;
  v4 = a1;
  _os_log_fault_impl(&dword_1B76F3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: Defaulting to system staging root because we could not determine the best one for %@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
