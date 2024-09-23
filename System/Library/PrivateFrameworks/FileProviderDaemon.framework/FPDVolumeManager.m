@implementation FPDVolumeManager

- (FPDVolumeManager)init
{
  return -[FPDVolumeManager initWithServer:](self, "initWithServer:", 0);
}

- (FPDVolumeManager)initWithServer:(id)a3
{
  id v4;
  FPDVolumeManager *v5;
  FPDVolumeManager *v6;
  uint64_t v7;
  NSMutableArray *volumes;
  uint64_t v9;
  NSMutableDictionary *versionsProvidersByVolumeID;
  FPDVersionsFileCoordinationProviderDelegate *delegate;
  os_log_t v12;
  OS_os_log *log;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FPDVolumeManager;
  v5 = -[FPDVolumeManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_server, v4);
    v7 = objc_opt_new();
    volumes = v6->_volumes;
    v6->_volumes = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    versionsProvidersByVolumeID = v6->_versionsProvidersByVolumeID;
    v6->_versionsProvidersByVolumeID = (NSMutableDictionary *)v9;

    delegate = v6->_delegate;
    v6->_delegate = 0;

    v12 = os_log_create("com.apple.FileProvider", "volumes");
    log = v6->_log;
    v6->_log = (OS_os_log *)v12;

    fpfs_adopt_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __fp_pop_log();

  }
  return v6;
}

- (BOOL)shouldMountAdditionalVolume
{
  return 1;
}

- (statfs)getAllEligibleVolumesWithError:(id *)a3 count:(int *)a4
{
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  statfs *v10;
  statfs *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int *v16;
  char *v17;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = getfsstat(0, 0, 2);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    __fp_create_section();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FPDVolumeManager getAllEligibleVolumesWithError:count:].cold.4();

    v9 = 2168 * v7;
    v10 = (statfs *)malloc_type_malloc(2168 * v7, 0x36199936uLL);
    v11 = v10;
    if (v10)
    {
      v12 = getfsstat(v10, v9, 2);
      if ((v12 & 0x80000000) == 0)
      {
        *a4 = v12;
LABEL_21:
        __fp_leave_section_Error();
        return v11;
      }
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = __error();
        v17 = strerror(*v16);
        -[FPDVolumeManager getAllEligibleVolumesWithError:count:].cold.3((uint64_t)v17, (uint64_t)v19, v15);
      }

      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      free(v11);
    }
    else
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[FPDVolumeManager getAllEligibleVolumesWithError:count:].cold.2(v14);

      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 12);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    v11 = 0;
    goto LABEL_21;
  }
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[FPDVolumeManager getAllEligibleVolumesWithError:count:].cold.1(v13);

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
  v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (id)loadSingleVolume:(const statfs *)a3 role:(unsigned int)a4
{
  uint64_t v4;
  FPDVolumeManager *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  FPDVolumeManager *v17;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  char *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  char *f_mntfromname;
  uint64_t v28;

  v4 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __42__FPDVolumeManager_loadSingleVolume_role___block_invoke;
  v23[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
  v23[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filteredArrayUsingPredicate:](v6->_volumes, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "root");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->f_mntonname);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (!v12)
  {
LABEL_7:
    v14 = 1;
    goto LABEL_8;
  }
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "root");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fp_prettyPath");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v9;
    v26 = 2112;
    f_mntfromname = v22;
    _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Volume %@ already loaded at %@", buf, 0x16u);

  }
  v9 = v9;
  v14 = 0;
LABEL_8:

  objc_sync_exit(v6);
  if (v14)
  {
    -[FPDVolumeManager invalidateDevice:reason:](v6, "invalidateDevice:reason:", objc_msgSend(v9, "dev"), CFSTR("Volume description changed"));
    -[FPDVolumeManager createVolumeWithStatFS:role:](v6, "createVolumeWithStatFS:role:", a3, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (objc_msgSend(v15, "role") == 3
        && !-[FPDVolumeManager shouldMountAdditionalVolume](v6, "shouldMountAdditionalVolume"))
      {
        fp_current_or_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[FPDVolumeManager loadSingleVolume:role:].cold.2();

        v9 = 0;
      }
      else
      {
        fp_current_or_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v25 = v15;
          v26 = 2082;
          f_mntfromname = a3->f_mntfromname;
          _os_log_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_INFO, "[INFO] Loaded volume %{public}@ with file system %{public}s", buf, 0x16u);
        }

        v17 = v6;
        objc_sync_enter(v17);
        -[NSMutableArray addObject:](v6->_volumes, "addObject:", v15);
        objc_sync_exit(v17);

        -[FPDVolumeManager registerVersionsFileCoordinatorForVolume:volumeIgnoringOwnership:](v17, "registerVersionsFileCoordinatorForVolume:volumeIgnoringOwnership:", v15, (a3->f_flags >> 21) & 1);
        v9 = v15;
        v15 = v9;
      }
    }
    else
    {
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[FPDVolumeManager loadSingleVolume:role:].cold.1();

      v9 = 0;
      v15 = 0;
    }
  }
  else
  {
    v15 = v9;
  }

  return v9;
}

BOOL __42__FPDVolumeManager_loadSingleVolume_role___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Only FPDVolume are allowed to be evaluated."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __42__FPDVolumeManager_loadSingleVolume_role___block_invoke_cold_1();

    __assert_rtn("-[FPDVolumeManager loadSingleVolume:role:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolumeManager.m", 188, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  }
  v7 = objc_msgSend(v5, "dev") == *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);

  return v7;
}

- (id)createVolumeWithStatFS:(const statfs *)a3 role:(unsigned int)a4
{
  uint64_t v4;
  FPDExternalVolume *v7;
  const statfs *v8;
  uint64_t v9;
  FPDExternalVolume *v10;
  NSObject *v11;

  v4 = *(_QWORD *)&a4;
  if (!a4)
    v4 = +[FPDVolume volumeRoleForStatFS:](FPDVolume, "volumeRoleForStatFS:", a3);
  if ((v4 - 1) < 2)
  {
    v7 = [FPDVolume alloc];
    v8 = a3;
    v9 = v4;
LABEL_7:
    v10 = -[FPDExternalVolume initWithStatFS:knownRole:volumeManager:](v7, "initWithStatFS:knownRole:volumeManager:", v8, v9, self);
    return v10;
  }
  if ((_DWORD)v4 == 3)
  {
    v7 = [FPDExternalVolume alloc];
    v8 = a3;
    v9 = 3;
    goto LABEL_7;
  }
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[FPDVolumeManager createVolumeWithStatFS:role:].cold.1((uint64_t)a3, v4, v11);

  v10 = 0;
  return v10;
}

- (BOOL)loadVolumeWithURL:(id)a3 role:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  statfs v14;
  uint64_t v15;

  v6 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  bzero(&v14, 0x878uLL);
  v9 = objc_retainAutorelease(v8);
  v10 = statfs((const char *)objc_msgSend(v9, "fileSystemRepresentation"), &v14);
  if (v10 < 0)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FPDVolumeManager loadVolumeWithURL:role:error:].cold.1(v9, v12);

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = -[FPDVolumeManager loadSingleVolume:role:](self, "loadSingleVolume:role:", &v14, v6);
  }

  return v10 >= 0;
}

- (BOOL)loadEnterpriseVolumeWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  uint64_t section;
  void *v13;

  fpfs_adopt_log();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDVolumeManager loadEnterpriseVolumeWithError:].cold.2();

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager", section);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEnterprisePersona") & 1) == 0)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[FPDVolumeManager loadEnterpriseVolumeWithError:].cold.1(v8);

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_personaSharedDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FPDVolumeManager loadVolumeWithURL:role:error:](self, "loadVolumeWithURL:role:error:", v9, 2, a3);

  __fp_leave_section_Debug();
  __fp_pop_log();

  return v10;
}

- (BOOL)loadHomeVolume
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10[2];
  id v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10[1] = (id)__fp_create_section();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[FPDVolumeManager loadHomeVolume].cold.2();

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v5 = -[FPDVolumeManager loadVolumeWithURL:role:error:](self, "loadVolumeWithURL:role:error:", v4, 1, v10);
  v6 = v10[0];
  if (!v5)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v6, "fp_prettyDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDVolumeManager loadHomeVolume].cold.1(v8, (uint64_t)v12, v7);
    }

  }
  __fp_leave_section_Debug();
  __fp_pop_log();

  return 1;
}

- (void)loadAdditionalVolumesWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;

  v3 = (void (**)(id, _QWORD))a3;
  fpfs_adopt_log();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((FPFeatureFlagEbihilIsEnabled() & 1) == 0)
    v3[2](v3, 0);
  __fp_pop_log();

}

- (id)libraryForVolume:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __58__FPDVolumeManager_libraryForVolume_createIfNeeded_error___block_invoke;
  v16 = &unk_1E8C76820;
  v8 = v7;
  v17 = v8;
  v18 = &v19;
  -[FPDVolumeManager enumerateLibrariesWithBlock:](self, "enumerateLibrariesWithBlock:", &v13);
  if (!v20[5])
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "fp_UUID", v13, v14, v15, v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDVolumeManager libraryForVolume:createIfNeeded:error:].cold.1(v10, (uint64_t)v25, v9);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 6);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __58__FPDVolumeManager_libraryForVolume_createIfNeeded_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;

  v4 = a2;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v6 ^ 1u;
}

- (void)enumerateLibrariesForPersona:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  FPDVolumeManager *v24;
  void *v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  int v42;
  __int128 v43;
  uint64_t (**v44)(id, void *);
  void *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  _BYTE buf[12];
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[32];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = (uint64_t (**)(id, void *))a4;
  v45 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPersona");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    objc_msgSend(v8, "userPersonaUniqueString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == v6
      || (objc_msgSend(v9, "isEqualToString:") & 1) != 0
      || !voucher_process_can_use_arbitrary_personas())
    {
      v15 = 0;
    }
    else
    {
      v53 = 0;
      v11 = objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v53);
      v12 = v53;
      v13 = *(void **)buf;
      *(_QWORD *)buf = v11;

      if (v12)
      {
        fp_current_or_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

      }
      objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        fp_current_or_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[FPDVolumeManager enumerateLibrariesForPersona:withBlock:].cold.2();

      }
    }
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentPersona");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "isEnterprisePersona");
    if (v19)
    {
      v52 = 0;
      v20 = -[FPDVolumeManager loadEnterpriseVolumeWithError:](self, "loadEnterpriseVolumeWithError:", &v52);
      v21 = v52;
      if (!v20)
      {
        fp_current_or_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v21, "fp_prettyDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPDVolumeManager enumerateLibrariesForPersona:withBlock:].cold.1((uint64_t)v6, v23, (uint64_t)v58, v22);
        }

      }
    }

    _FPRestorePersona();
  }
  else
  {
    v19 = 0;
  }
  v24 = self;
  objc_sync_enter(v24);
  v25 = (void *)-[NSMutableArray copy](v24->_volumes, "copy");
  objc_sync_exit(v24);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v27)
  {
    v29 = *(_QWORD *)v49;
    *(_QWORD *)&v28 = 138412546;
    v43 = v28;
LABEL_24:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v30);
      if (((v19 ^ (objc_msgSend(v31, "role", v43) != 2)) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "currentPersona");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = 0;
        objc_msgSend(v33, "userPersonaUniqueString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34 == v45
          || (objc_msgSend(v34, "isEqualToString:") & 1) != 0
          || !voucher_process_can_use_arbitrary_personas())
        {
          v40 = 0;
        }
        else
        {
          v46 = 0;
          v36 = (void *)objc_msgSend(v33, "copyCurrentPersonaContextWithError:", &v46);
          v37 = v46;
          v38 = v47;
          v47 = v36;

          if (v37)
          {
            fp_current_or_default_log();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v37;
              _os_log_error_impl(&dword_1CF55F000, v39, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v33, "generateAndRestorePersonaContextWithPersonaUniqueString:", v45);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            fp_current_or_default_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              *(_QWORD *)&buf[4] = v45;
              v55 = 2112;
              v56 = v40;
              _os_log_error_impl(&dword_1CF55F000, v41, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
            }

          }
        }
        v42 = v44[2](v44, v31);

        _FPRestorePersona();
        if (!v42)
          break;
      }
      if (v27 == ++v30)
      {
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v27)
          goto LABEL_24;
        break;
      }
    }
  }

}

- (void)enumerateLibrariesWithBlock:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  FPDVolumeManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableArray copy](v5->_volumes, "copy");
  objc_sync_exit(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(v7);
      if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)) & 1) == 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)defaultVolumeForCurrentPersona
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEnterprisePersona");
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FPDVolumeManager defaultVolumeForCurrentPersona].cold.1(v5, v6);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__FPDVolumeManager_defaultVolumeForCurrentPersona__block_invoke;
  v9[3] = &unk_1E8C76848;
  v10 = v5;
  v9[4] = &v11;
  -[FPDVolumeManager enumerateLibrariesWithBlock:](self, "enumerateLibrariesWithBlock:", v9);
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __50__FPDVolumeManager_defaultVolumeForCurrentPersona__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  v5 = v4;
  if (!*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend(v4, "role") == 1)
      goto LABEL_5;
    if (!*(_BYTE *)(a1 + 40))
      goto LABEL_3;
  }
  if (objc_msgSend(v5, "role") == 2)
  {
LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = 0;
    goto LABEL_6;
  }
LABEL_3:
  v6 = 1;
LABEL_6:

  return v6;
}

- (void)invalidateDevice:(int)a3 reason:(id)a4
{
  id v6;
  FPDVolumeManager *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7->_volumes;
  v9 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "dev", (_QWORD)v14) == a3)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v7);
  if (v9)
  {
    -[FPDVolumeManager invalidateVolume:reason:](v7, "invalidateVolume:reason:", v9, v6);
  }
  else
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v19 = a3;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_INFO, "[INFO] No volume found for dev:%d", buf, 8u);
    }

  }
}

- (void)invalidateVolume:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  FPDVolumeManager *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if ((-[NSMutableArray containsObject:](v9->_volumes, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("FPDVolumeManager.m"), 447, CFSTR("Trying to remove nonexistent volume %@ (existing volumes are %@)"), v7, v9->_volumes);

  }
  -[NSMutableArray removeObject:](v9->_volumes, "removeObject:", v7);
  objc_sync_exit(v9);

  -[FPDVolumeManager server](v9, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateProviderOnDisappearingVolume:reason:", v7, v8);

  -[FPDVolumeManager unregisterVersionsFileCoordinatorForVolume:](v9, "unregisterVersionsFileCoordinatorForVolume:", v7);
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_INFO, "[INFO] Invalidated volume %{public}@ (reason: %{public}@)", buf, 0x16u);
  }

}

- (void)unregisterVersionsFileCoordinatorForVolume:(id)a3
{
  id v4;
  FPDVolumeManager *v5;
  NSMutableDictionary *versionsProvidersByVolumeID;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  versionsProvidersByVolumeID = v5->_versionsProvidersByVolumeID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "dev"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](versionsProvidersByVolumeID, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5->_versionsProvidersByVolumeID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "dev"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

  objc_sync_exit(v5);
  if (v8)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "root");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_INFO, "[INFO] 🅾️ Deregistered versions provider %@ for volume %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3600], "_removeFileProvider:", v8);
  }

}

- (void)registerVersionsFileCoordinatorForVolume:(id)a3 volumeIgnoringOwnership:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FPDVolumeManager *v7;
  FPDVersionsFileCoordinationProviderDelegate *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  FPDVersionsFileCoordinationProviderDelegate *delegate;
  NSMutableDictionary *versionsProvidersByVolumeID;
  void *v14;
  void *v15;
  void *v16;
  FPDFileCoordinationProvider *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  FPDFileCoordinationProvider *v23;
  id v24;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_delegate)
  {
    v8 = [FPDVersionsFileCoordinationProviderDelegate alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v7->_server);
    objc_msgSend(WeakRetained, "extensionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FPDVersionsFileCoordinationProviderDelegate initWithExtensionManager:](v8, "initWithExtensionManager:", v10);
    delegate = v7->_delegate;
    v7->_delegate = (FPDVersionsFileCoordinationProviderDelegate *)v11;

  }
  versionsProvidersByVolumeID = v7->_versionsProvidersByVolumeID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "dev"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](versionsProvidersByVolumeID, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = 0;
    v17 = 0;
  }
  else
  {
    objc_msgSend(v6, "root");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDVolumeManager getGenstoreVersionsRootURL:volumeIgnoringOwnership:](v7, "getGenstoreVersionsRootURL:volumeIgnoringOwnership:", v18, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[FPDFileCoordinationProvider initWithRootURL:]([FPDFileCoordinationProvider alloc], "initWithRootURL:", v16);
    -[FPDFileCoordinationProvider setDelegate:](v17, "setDelegate:", v7->_delegate);
    v19 = v7->_versionsProvidersByVolumeID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "dev"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v17, v20);

  }
  objc_sync_exit(v7);

  if (v17)
  {
    v21 = (void *)MEMORY[0x1E0CB3600];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__FPDVolumeManager_registerVersionsFileCoordinatorForVolume_volumeIgnoringOwnership___block_invoke;
    v22[3] = &unk_1E8C75850;
    v23 = v17;
    v24 = v16;
    objc_msgSend(v21, "_addFileProvider:completionHandler:", v23, v22);

  }
}

void __85__FPDVolumeManager_registerVersionsFileCoordinatorForVolume_volumeIgnoringOwnership___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] 🅿️ Registered versions provider %@ for path %@", (uint8_t *)&v5, 0x16u);
  }

}

- (id)getGenstoreVersionsRootURL:(id)a3 volumeIgnoringOwnership:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E98];
  if (a4)
  {
    v14[0] = a3;
    v14[1] = CFSTR(".DocumentRevisions-V100/AllUIDs");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a3;
    objc_msgSend(v5, "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPathComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13[0] = a3;
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = a3;
    objc_msgSend(v9, "numberWithUnsignedInt:", getuid(), v13[0], CFSTR(".DocumentRevisions-V100/PerUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPathComponents:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (FPDServer)server
{
  return (FPDServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_versionsProvidersByVolumeID, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
}

- (void)getAllEligibleVolumesWithError:(NSObject *)a1 count:.cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a1, v3, "[ERROR] Unable to count mount points: %s", v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)getAllEligibleVolumesWithError:(os_log_t)log count:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] Unable to allocate memory to load libraries", v1, 2u);
}

- (void)getAllEligibleVolumesWithError:(NSObject *)a3 count:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a3, (uint64_t)a3, "[ERROR] Unable to retrieve mount points: %s", (uint8_t *)a2);
}

- (void)getAllEligibleVolumesWithError:count:.cold.4()
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_3_4(&dword_1CF55F000, v1, (uint64_t)v1, "[ERROR] ┏%llx Loading libraries from all eligible volumes %d mounted)", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)loadSingleVolume:role:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] Volume %{public}s not eligible to store FP library, skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)loadSingleVolume:role:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] Volume %{public}s not eligible because it is additional and we're not running in the foreground session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __42__FPDVolumeManager_loadSingleVolume_role___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_3(&dword_1CF55F000, v0, v1, "[CRIT] %{public}@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)createVolumeWithStatFS:(NSObject *)a3 role:.cold.1(uint64_t a1, int a2, NSObject *a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2082;
  v5 = a1 + 1112;
  OUTLINED_FUNCTION_3_4(&dword_1CF55F000, a3, (uint64_t)a3, "[ERROR] Unknown / unsupported volume role %u on %{public}s", (uint8_t *)v3);
  OUTLINED_FUNCTION_8_0();
}

- (void)loadVolumeWithURL:(void *)a1 role:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *__error();
  v6 = 138543618;
  v7 = v3;
  v8 = 1024;
  v9 = v4;
  OUTLINED_FUNCTION_3_4(&dword_1CF55F000, a2, v5, "[ERROR] Unable to statfs for enterprise path '%{public}@': %{errno}d", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)loadEnterpriseVolumeWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1CF55F000, log, OS_LOG_TYPE_FAULT, "[CRIT] EDS persona must be adopted to load an EDS volume", v1, 2u);
}

- (void)loadEnterpriseVolumeWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx Loading EDS libraries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)loadHomeVolume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx Loading home libraries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)libraryForVolume:(void *)a1 createIfNeeded:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a3, (uint64_t)a3, "[ERROR] Volume not found for UUID: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_6_1();
}

- (void)enumerateLibrariesForPersona:(uint64_t)a3 withBlock:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a4, a3, "[ERROR] Could not load EDS volume for %{public}@: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_6_1();
}

- (void)enumerateLibrariesForPersona:withBlock:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v1, (uint64_t)v1, "[ERROR] Can't adopt persona %@: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)defaultVolumeForCurrentPersona
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[FPDVolumeManager defaultVolumeForCurrentPersona]";
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: eds:%d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_8_0();
}

@end
