@implementation FBSApplicationLibrary

void __67__FBSApplicationLibrary__executeOrPendInstallSynchronizationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = (void *)MEMORY[0x19AECA324]();
  objc_msgSend(v2, "addObject:", v3);

  -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](*(_QWORD *)(a1 + 32));
}

- (void)_workQueue_executeInstallSynchronizationBlocksIfAppropriate
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 104);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke;
    block[3] = &unk_1E38EAE78;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[5];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke_2;
  block[3] = &unk_1E38EAE08;
  block[4] = v3;
  v5 = v2;
  v16 = v5;
  dispatch_sync(v4, block);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v8);
  }

}

void __66__FBSApplicationLibrary_installedApplicationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(_QWORD **)(a1 + 32), *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (_QWORD)_workQueue_applicationForIdentity:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *result;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_4;
  if (v3)
  {
    v5 = (void *)a1[8];
    objc_msgSend(v3, "identityString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    return a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSApplicationLibrary _workQueue_applicationForIdentity:].cold.1();
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (_QWORD *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)synchronize:(id)a3
{
  -[FBSApplicationLibrary _executeOrPendInstallSynchronizationBlock:]((uint64_t)self, a3);
}

- (id)applicationInfoForAuditToken:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSApplicationLibrary applicationInfoForBundleIdentifier:](self, "applicationInfoForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)applicationInfoForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[FBSApplicationLibrary installedApplicationsForBundleIdentifier:](self, "installedApplicationsForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)installedApplicationsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__FBSApplicationLibrary_installedApplicationsForBundleIdentifier___block_invoke;
    block[3] = &unk_1E38EC2B0;
    block[4] = self;
    v12 = v4;
    v7 = v5;
    v13 = v7;
    dispatch_sync(workQueue, block);
    v8 = v13;
    v9 = v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __84__FBSApplicationLibrary__workQueue_executeInstallSynchronizationBlocksIfAppropriate__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 88))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 96), "count");
    if (result)
    {
      objc_msgSend(*(id *)(v2 + 40), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 96));
      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 96), "removeAllObjects");
    }
  }
  return result;
}

- (void)_executeOrPendInstallSynchronizationBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__FBSApplicationLibrary__executeOrPendInstallSynchronizationBlock___block_invoke;
    v6[3] = &unk_1E38EB888;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

- (FBSApplicationLibrary)init
{
  FBSApplicationLibraryConfiguration *v3;
  FBSApplicationLibrary *v4;

  v3 = objc_alloc_init(FBSApplicationLibraryConfiguration);
  v4 = -[FBSApplicationLibrary initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (FBSApplicationLibrary)initWithConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  FBSApplicationLibrary *v7;

  v4 = (objc_class *)MEMORY[0x1E0CA5878];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:](self, "_initWithApplicationWorkspace:configuration:", v6, v5);

  return v7;
}

- (id)_initWithApplicationWorkspace:(id)a3 configuration:(id)a4
{
  id v8;
  id v9;
  void *v10;
  FBSApplicationLibrary *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t Serial;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("workspace"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A72B508);
  }
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("configuration"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A72B56CLL);
  }
  v54.receiver = self;
  v54.super_class = (Class)FBSApplicationLibrary;
  v11 = -[FBSApplicationLibrary init](&v54, sel_init);
  v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = objc_msgSend(v10, "copy");
    v14 = *(void **)(v12 + 8);
    *(_QWORD *)(v12 + 8) = v13;

    if ((objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "applicationInfoClass"), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must specify a class that subclasses from FBSApplicationInfo : was passed %@"), objc_msgSend(*(id *)(v12 + 8), "applicationInfoClass"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:].cold.4();
      objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A72B5D4);
    }
    if ((objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "applicationPlaceholderClass"), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must specify a class that subclasses from FBSApplicationPlaceholder : was passed %@"), objc_msgSend(*(id *)(v12 + 8), "applicationPlaceholderClass"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _initWithApplicationWorkspace:configuration:].cold.3();
      objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A72B63CLL);
    }
    FBSLogApplicationLibrary();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v12 + 8), "installedApplicationFilter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("YES");
      if (!v16)
        v17 = CFSTR("NO");
      *(_DWORD *)buf = 134218242;
      v56 = v12;
      v57 = 2112;
      v58 = v17;
      _os_log_impl(&dword_19A6D4000, v15, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary<%p> has custom app inclusion filter defined? %@", buf, 0x16u);

    }
    FBSLogApplicationLibrary();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v12 + 8), "placeholderFilter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("YES");
      if (!v19)
        v20 = CFSTR("NO");
      *(_DWORD *)buf = 134218242;
      v56 = v12;
      v57 = 2112;
      v58 = v20;
      _os_log_impl(&dword_19A6D4000, v18, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary<%p> has custom placeholder inclusion filter defined? %@", buf, 0x16u);

    }
    objc_msgSend(off_1E38E9DF8, "serial");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "serviceClass:", 33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = BSDispatchQueueCreate();
    v24 = *(void **)(v12 + 104);
    *(_QWORD *)(v12 + 104) = v23;

    objc_msgSend(off_1E38E9DF8, "serial");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serviceClass:", 33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = BSDispatchQueueCreate();
    v28 = *(void **)(v12 + 112);
    *(_QWORD *)(v12 + 112) = v27;

    Serial = BSDispatchQueueCreateSerial();
    v30 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = Serial;

    objc_msgSend(off_1E38E9DF8, "serial");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "serviceClass:", 25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = BSDispatchQueueCreate();
    v34 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v33;

    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v36 = *(void **)(v12 + 56);
    *(_QWORD *)(v12 + 56) = v35;

    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v38 = *(void **)(v12 + 72);
    *(_QWORD *)(v12 + 72) = v37;

    v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v40 = *(void **)(v12 + 64);
    *(_QWORD *)(v12 + 64) = v39;

    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = *(void **)(v12 + 96);
    *(_QWORD *)(v12 + 96) = v41;

    v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v44 = *(void **)(v12 + 80);
    *(_QWORD *)(v12 + 80) = v43;

    objc_storeStrong((id *)(v12 + 16), a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObserver:selector:name:object:", v12, sel__reloadPlaceholdersNotificationFired, CFSTR("FBSApplicationLibraryReloadPlaceholdersNotification"), 0);

    -[FBSApplicationLibrary _load](v12);
    objc_initWeak((id *)buf, (id)v12);
    objc_copyWeak(&v53, (id *)buf);
    BSLogAddStateCaptureBlockWithTitle();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = *(void **)(v12 + 128);
    *(_QWORD *)(v12 + 128) = v46;

    objc_destroyWeak(&v53);
    objc_destroyWeak((id *)buf);
  }

  return (id)v12;
}

- (void)_load
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__FBSApplicationLibrary__load__block_invoke;
    block[3] = &unk_1E38EAE78;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

id __69__FBSApplicationLibrary__initWithApplicationWorkspace_configuration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSApplicationLibrary invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FBSApplicationLibrary;
  -[FBSApplicationLibrary dealloc](&v3, sel_dealloc);
}

- (BOOL)isUsingNetwork
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__FBSApplicationLibrary_isUsingNetwork__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__FBSApplicationLibrary_isUsingNetwork__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (id)allInstalledApplications
{
  NSObject *workQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__FBSApplicationLibrary_allInstalledApplications__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__FBSApplicationLibrary_allInstalledApplications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)installedApplicationForIdentity:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FBSApplicationLibrary_installedApplicationForIdentity___block_invoke;
  block[3] = &unk_1E38EBE20;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__FBSApplicationLibrary_installedApplicationForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)installedApplicationForIdentityString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CA5850];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentityString:", v5);

  -[FBSApplicationLibrary installedApplicationForIdentity:](self, "installedApplicationForIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)installedApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (-[FBSApplicationLibraryConfiguration isPersonaAware](self->_configuration, "isPersonaAware"))
  {
    FBSLogApplicationLibrary();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[FBSApplicationLibrary installedApplicationsForBundleIdentifier:](self, "installedApplicationsForBundleIdentifier:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)installedApplicationWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *completionQueue;
  id v17;
  id v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (-[FBSApplicationLibraryConfiguration isPersonaAware](self->_configuration, "isPersonaAware"))
  {
    FBSLogApplicationLibrary();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:completionHandler:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  if (v7)
  {
    completionQueue = self->_completionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__FBSApplicationLibrary_installedApplicationWithBundleIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E38EB5D8;
    v21 = v6;
    v22 = v7;
    block[4] = self;
    v17 = v6;
    v18 = v7;
    dispatch_async(completionQueue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completionHandler != ((void *)0)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:completionHandler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __84__FBSApplicationLibrary_installedApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "installedApplicationWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)allPlaceholders
{
  NSObject *workQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__FBSApplicationLibrary_allPlaceholders__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__FBSApplicationLibrary_allPlaceholders__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)placeholderWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (-[FBSApplicationLibraryConfiguration isPersonaAware](self->_configuration, "isPersonaAware"))
  {
    FBSLogApplicationLibrary();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary placeholderWithBundleIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[FBSApplicationLibrary placeholdersForBundleIdentifier:](self, "placeholdersForBundleIdentifier:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)placeholdersForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__FBSApplicationLibrary_placeholdersForBundleIdentifier___block_invoke;
    block[3] = &unk_1E38EC2B0;
    block[4] = self;
    v12 = v4;
    v7 = v5;
    v13 = v7;
    dispatch_sync(workQueue, block);
    v8 = v13;
    v9 = v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __57__FBSApplicationLibrary_placeholdersForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(_QWORD **)(a1 + 32), *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (_QWORD)_workQueue_placeholderForIdentity:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *result;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_4;
  if (v3)
  {
    v5 = (void *)a1[9];
    objc_msgSend(v3, "identityString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    return a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSApplicationLibrary _workQueue_placeholderForIdentity:].cold.1();
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (_QWORD *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)placeholderForIdentity:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__FBSApplicationLibrary_placeholderForIdentity___block_invoke;
  block[3] = &unk_1E38EBE20;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__FBSApplicationLibrary_placeholderForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)placeholderForIdentityString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CA5850];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentityString:", v5);

  -[FBSApplicationLibrary placeholderForIdentity:](self, "placeholderForIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)uninstallApplication:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__FBSApplicationLibrary_uninstallApplication_completion___block_invoke;
  v8[3] = &unk_1E38EBC60;
  v9 = v6;
  v7 = v6;
  -[FBSApplicationLibrary uninstallApplication:withOptions:completion:](self, "uninstallApplication:withOptions:completion:", a3, 0, v8);

}

uint64_t __57__FBSApplicationLibrary_uninstallApplication_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

- (void)uninstallApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *completionQueue;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[FBSApplicationLibraryConfiguration isPersonaAware](self->_configuration, "isPersonaAware"))
  {
    FBSLogApplicationLibrary();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary uninstallApplication:withOptions:completion:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:](self, "installedApplicationWithBundleIdentifier:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applicationIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20
    || (-[FBSApplicationLibrary placeholderWithBundleIdentifier:](self, "placeholderWithBundleIdentifier:", v8),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v21, "applicationIdentity"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20))
  {
    -[FBSApplicationLibrary uninstallApplicationIdentity:withOptions:completion:](self, "uninstallApplicationIdentity:withOptions:completion:", v20, v9, v10);
LABEL_8:

    goto LABEL_9;
  }
  FBSLogApplicationLibrary();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[FBSApplicationLibrary uninstallApplication:withOptions:completion:].cold.1();

  if (v10)
  {
    completionQueue = self->_completionQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __69__FBSApplicationLibrary_uninstallApplication_withOptions_completion___block_invoke;
    v24[3] = &unk_1E38EB888;
    v26 = v10;
    v25 = v8;
    dispatch_async(completionQueue, v24);

    v20 = v26;
    goto LABEL_8;
  }
LABEL_9:

}

void __69__FBSApplicationLibrary_uninstallApplication_withOptions_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)off_1E38E9A78;
  v6[0] = *MEMORY[0x1E0CB2D68];
  v6[1] = v2;
  v7[0] = CFSTR("No application found.");
  v7[1] = CFSTR("Not Found");
  v6[2] = CFSTR("FBSALIdentity");
  v3 = *(_QWORD *)(a1 + 40);
  v7[2] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("FBSApplicationLibraryErrorDomain"), 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

- (void)uninstallApplicationIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  NSObject *workQueue;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id IXAppInstallCoordinatorClass;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  _QWORD v39[5];
  id v40;
  id v41;
  uint64_t *v42;
  _QWORD *v43;
  SEL v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t *v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  _QWORD v64[4];
  id v65;
  FBSApplicationLibrary *v66;
  id v67;
  uint8_t buf[4];
  _BYTE v69[18];
  __int16 v70;
  FBSApplicationLibrary *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  FBSLogApplicationLibrary();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "fbs_shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v69 = v12;
    _os_log_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_DEFAULT, "Uninstalling %@...", buf, 0xCu);

  }
  v13 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke;
  v64[3] = &unk_1E38ED190;
  v14 = v8;
  v65 = v14;
  v15 = v10;
  v66 = self;
  v67 = v15;
  objc_msgSend(off_1E38E9DE0, "sentinelWithCompletion:", v64);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__9;
  v58 = __Block_byref_object_dispose__9;
  v59 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__9;
  v52[4] = __Block_byref_object_dispose__9;
  v53 = 0;
  workQueue = self->_workQueue;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E38ED1B8;
  v49 = v52;
  block[4] = self;
  v18 = v14;
  v46 = v18;
  v50 = &v60;
  v19 = v9;
  v47 = v19;
  v51 = &v54;
  v20 = v16;
  v48 = v20;
  dispatch_sync(workQueue, block);
  if (*((_BYTE *)v61 + 24))
  {
    FBSLogApplicationLibrary();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v19, "isUserInitiated");
      objc_msgSend(v18, "fbs_shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v69 = v22;
      *(_WORD *)&v69[4] = 2114;
      *(_QWORD *)&v69[6] = v23;
      _os_log_impl(&dword_19A6D4000, v21, OS_LOG_TYPE_DEFAULT, "Requesting uninstallation with prompt=%{BOOL}u of %{public}@ from install coordinator", buf, 0x12u);

    }
    if (FBSApplicationLibraryLogTransactionEnabled())
    {
      v24 = (void *)MEMORY[0x1E0D4E420];
      v25 = v55[5];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting uninstallation from install coordinator."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logStep:byParty:phase:success:forBundleID:description:", 0, 11, 1, 1, v25, v26);

    }
    v27 = objc_alloc_init((Class)getIXUninstallOptionsClass());
    objc_msgSend(v27, "setRequestUserConfirmation:", objc_msgSend(v19, "isUserInitiated"));
    objc_msgSend(v27, "setShowArchiveOption:", objc_msgSend(v19, "showsArchiveOption"));
    v28 = objc_alloc((Class)getIXApplicationIdentityClass());
    v29 = (void *)objc_msgSend(v28, "initWithBundleIdentifier:", v55[5]);
    IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
    if (!IXAppInstallCoordinatorClass)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IXAppInstallCoordinator does not exist"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = MEMORY[0x1E0C81028];
      v33 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)v69 = v34;
        *(_WORD *)&v69[8] = 2114;
        *(_QWORD *)&v69[10] = v36;
        v70 = 2048;
        v71 = self;
        v72 = 2114;
        v73 = CFSTR("FBSApplicationLibrary.m");
        v74 = 1024;
        v75 = 384;
        v76 = 2114;
        v77 = v31;
        _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      v37 = _bs_set_crash_log_message();
      _realizeSettingsExtension_cold_3(v37);
    }
    v39[0] = v13;
    v39[1] = 3221225472;
    v39[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_81;
    v39[3] = &unk_1E38ED208;
    v39[4] = self;
    v40 = v18;
    v42 = &v54;
    v43 = v52;
    v44 = a2;
    v41 = v20;
    objc_msgSend(IXAppInstallCoordinatorClass, "uninstallAppWithIdentity:options:completion:", v29, v27, v39);

  }
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isFailed") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("InstallCoordination dropped uninstall completion block on the floor.");
    v24[0] = v5;
    v24[1] = CFSTR("FBSALIdentity");
    objc_msgSend(*(id *)(a1 + 32), "fbs_mediumDescription");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v24[2] = *(_QWORD *)off_1E38E9A78;
    v25[1] = v6;
    v25[2] = CFSTR("Failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FBSApplicationLibraryErrorDomain"), 1, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v6 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v6;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v8 = v11;

  }
  if (v8)
  {
    FBSLogApplicationLibrary();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "fbs_shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptionWithMultilinePrefix:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v13;
      v22 = 2114;
      v23 = v14;
      _os_log_impl(&dword_19A6D4000, v12, OS_LOG_TYPE_DEFAULT, "Uninstallation of %@ completed with error: %{public}@", buf, 0x16u);

    }
  }
  v15 = *(void **)(a1 + 48);
  if (v15)
  {
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_70;
    v17[3] = &unk_1E38EB888;
    v19 = v15;
    v18 = v8;
    dispatch_async(v16, v17);

  }
}

uint64_t __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!(v6 | v5))
  {
    v7 = *(void **)(a1 + 56);
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D68];
    v22[0] = CFSTR("No application or placeholder found.");
    v21[0] = v15;
    v21[1] = CFSTR("FBSALIdentity");
    objc_msgSend(*(id *)(a1 + 40), "fbs_mediumDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = *(_QWORD *)off_1E38E9A78;
    v22[1] = v10;
    v22[2] = CFSTR("Not Found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v13 = 2;
    goto LABEL_5;
  }
  if ((objc_msgSend((id)v6, "_isPendingUninstall") & 1) != 0)
  {
    v7 = *(void **)(a1 + 56);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D68];
    v24[0] = CFSTR("Uninstallation is already in progress.");
    v23[0] = v9;
    v23[1] = CFSTR("FBSALIdentity");
    objc_msgSend(*(id *)(a1 + 40), "fbs_mediumDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = *(_QWORD *)off_1E38E9A78;
    v24[1] = v10;
    v24[2] = CFSTR("In Progress");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v13 = 3;
LABEL_5:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("FBSApplicationLibraryErrorDomain"), v13, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signalWithContext:", v16);

    goto LABEL_10;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_setPendingUninstall:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_setTentativeUninstall:", objc_msgSend(*(id *)(a1 + 48), "isUserInitiated"));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  else
    v17 = (void *)v5;
  objc_msgSend(v17, "bundleIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

LABEL_10:
}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_81(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2_82;
  v21 = &unk_1E38ED1E0;
  v15 = v5;
  v22 = v15;
  v25 = a2;
  v23 = *(id *)(a1 + 40);
  v24 = *(_OWORD *)(a1 + 56);
  dispatch_sync(v6, &block);
  if (a2)
  {
    if (a2 != 1)
    {
      if (a2 != 2)
      {
        v13 = 0;
LABEL_13:
        objc_msgSend(*(id *)(a1 + 48), "signalWithContext:", v13, v15);

        return;
      }
      v7 = 4;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSApplicationLibraryErrorDomain"), 4, 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = CFSTR("The application was instead archived.");
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v8, block, v19, v20, v21, v22);
LABEL_9:
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, *MEMORY[0x1E0CB2D68]);
      v11 = v16;
      if (v16)
      {
        objc_msgSend(v10, "setObject:forKey:", v16, *MEMORY[0x1E0CB3388]);
        v11 = v16;
      }
      objc_msgSend(*(id *)(a1 + 40), "fbs_mediumDescription", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("FBSALIdentity"));

      objc_msgSend(v10, "setObject:forKey:", *(&off_1E38ED3D8 + v7 - 1), *(_QWORD *)off_1E38E9A78);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSApplicationLibraryErrorDomain"), v7, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    v9 = CFSTR("The user canceled uninstallation.");
    v7 = 5;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v15, block, v19, v20, v21, v22);
    goto LABEL_9;
  }
  if (v15)
  {
    v9 = CFSTR("InstallCoordination reurned an error.");
    v7 = 1;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("recieved IXUninstallDispositionError but the provided error was nil"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_81_cold_1();
  objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_2_82(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  FBSLogApplicationLibrary();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "fbs_shortDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported an error for uninstallation of %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    if (FBSApplicationLibraryLogTransactionEnabled())
    {
      v7 = (void *)MEMORY[0x1E0D4E420];
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IX uninstallation failed."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7;
      v11 = 0;
LABEL_10:
      objc_msgSend(v10, "logStep:byParty:phase:success:forBundleID:description:", 0, 11, 2, v11, v8, v9);

    }
  }
  else
  {
    if (v4)
    {
      soft_IXStringForUninstallDisposition(*(_QWORD *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fbs_shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported success with disposition \"%@\" for %{public}@", (uint8_t *)&v16, 0x16u);

    }
    if (FBSApplicationLibraryLogTransactionEnabled())
    {
      v14 = (void *)MEMORY[0x1E0D4E420];
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IX uninstallation succeeded."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = 1;
      goto LABEL_10;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_setPendingUninstall:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_setTentativeUninstall:", 0);
}

- (NSString)description
{
  NSObject *workQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__FBSApplicationLibrary_description__block_invoke;
  v5[3] = &unk_1E38EB628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__FBSApplicationLibrary_description__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", *(_QWORD *)(a1 + 32));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v10, "appendObject:withName:", v2, CFSTR("placeholders"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v10, "appendObject:withName:", v4, CFSTR("applications"));

  v6 = (id)objc_msgSend(v10, "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48), CFSTR("usingNetwork"));
  objc_msgSend(v10, "build");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)removeObserverForToken:(id)a3
{
  id v4;
  void *v5;
  NSObject *observerQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    observerQueue = self->_observerQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__FBSApplicationLibrary_removeObserverForToken___block_invoke;
    v7[3] = &unk_1E38EAE08;
    v7[4] = self;
    v8 = v4;
    dispatch_async(observerQueue, v7);

  }
}

void __48__FBSApplicationLibrary_removeObserverForToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = 0;

  }
}

- (id)observeDidAddPlaceholdersWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 0, v4);

  return v5;
}

- (_QWORD)_observeType:(void *)a3 withBlock:
{
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (a1 && v5)
  {
    v8 = (void *)objc_msgSend(v5, "copy");
    v9 = (_QWORD *)objc_opt_new();
    v9[1] = a2;
    v10 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__FBSApplicationLibrary__observeType_withBlock___block_invoke;
    block[3] = &unk_1E38EBD20;
    block[4] = a1;
    v15 = v8;
    v7 = v9;
    v14 = v7;
    v11 = v8;
    dispatch_async(v10, block);

  }
  return v7;
}

- (id)observeDidCancelPlaceholdersWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 1, v4);

  return v5;
}

- (id)observeDidAddApplicationsWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 2, v4);

  return v5;
}

- (id)observeDidReplaceApplicationsWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 3, v4);

  return v5;
}

- (id)observeDidUpdateApplicationsWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 6, v4);

  return v5;
}

- (id)observeDidRemoveApplicationsWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 4, v4);

  return v5;
}

- (id)observeDidDemoteApplicationsWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 5, v4);

  return v5;
}

- (id)observeDidChangeNetworkUsageWithBlock:(id)a3
{
  void *v4;
  _QWORD *v5;

  v4 = (void *)MEMORY[0x19AECA324](a3, a2);
  v5 = -[FBSApplicationLibrary _observeType:withBlock:]((uint64_t)self, 7, v4);

  return v5;
}

- (void)addApplicationRecord:(id)a3
{
  id v4;

  objc_msgSend(a3, "fbs_correspondingApplicationProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSApplicationLibrary addApplicationProxy:withOverrideURL:](self, "addApplicationProxy:withOverrideURL:", v4, 0);

}

- (void)addApplicationProxy:(id)a3 withOverrideURL:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("proxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary addApplicationProxy:withOverrideURL:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A72DB0CLL);
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("url == ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationLibrary addApplicationProxy:withOverrideURL:].cold.2();
    goto LABEL_9;
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__FBSApplicationLibrary_addApplicationProxy_withOverrideURL___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v12 = v6;
  v9 = v6;
  dispatch_async(workQueue, block);

}

void __61__FBSApplicationLibrary_addApplicationProxy_withOverrideURL___block_invoke(uint64_t a1)
{
  -[FBSApplicationLibrary _workQueue_addApplicationProxy:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_workQueue_addApplicationProxy:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssert();
    ++*(_QWORD *)(a1 + 88);
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_msgSend(*(id *)(a1 + 80), "containsObject:", v4) & 1) == 0)
    {
      v27 = v4;
      objc_msgSend(*(id *)(a1 + 80), "addObject:", v4);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v30 = 0;
      -[FBSApplicationLibrary _identitiesForProxy:outRecord:]((id *)a1, v3, &v30);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v30;
      obj = v5;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v7)
        goto LABEL_27;
      v8 = v7;
      v9 = *(_QWORD *)v32;
      v28 = v3;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v11, "fbs_mediumDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v13 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to create FBSApplicationInfo for reason: %@"), CFSTR("App manually added"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "logStep:byParty:phase:success:forBundleID:description:", 1, 11, 1, 1, v12, v14);

          }
          objc_msgSend(v6, "fbs_processIdentityForApplicationIdentity:", v11);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (!v6 || (v11 ? (v17 = v15 == 0) : (v17 = 1), v17))
          {
            if (!FBSApplicationLibraryLogTransactionEnabled())
              goto LABEL_25;
            v23 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create FBSApplicationInfo due to missing record info; createReason = %@"),
              CFSTR("App manually added"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            v3 = v28;
            objc_msgSend(v24, "logStep:byParty:phase:success:forBundleID:description:", 1, 11, 2, 0, v12, v18);
          }
          else
          {
            v18 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 8), "applicationInfoClass")), "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v3, v6, v11, v15, 0);
            if (v18)
            {
              -[FBSApplicationLibrary _workQueue_addApplication:](a1, v18);
              if (FBSApplicationLibraryLogTransactionEnabled())
              {
                v19 = (void *)MEMORY[0x1E0D4E420];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Created FBSApplicationInfo; reason = %@"),
                  CFSTR("App manually added"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v19;
                v22 = 1;
LABEL_23:
                objc_msgSend(v21, "logStep:byParty:phase:success:forBundleID:description:", 1, 11, 2, v22, v12, v20);

                v3 = v28;
              }
            }
            else if (FBSApplicationLibraryLogTransactionEnabled())
            {
              v25 = (void *)MEMORY[0x1E0D4E420];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create FBSApplicationInfo due to critical error; createReason = %@"),
                CFSTR("App manually added"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v25;
              v22 = 0;
              goto LABEL_23;
            }
          }

LABEL_25:
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (!v8)
        {
LABEL_27:

          v4 = v27;
          break;
        }
      }
    }
    v26 = *(_QWORD *)(a1 + 88);
    if (v26)
    {
      *(_QWORD *)(a1 + 88) = v26 - 1;
      -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](a1);
    }

  }
}

- (void)_reloadPlaceholdersNotificationFired
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__FBSApplicationLibrary__reloadPlaceholdersNotificationFired__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __61__FBSApplicationLibrary__reloadPlaceholdersNotificationFired__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  FBSLogApplicationLibrary();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A6D4000, v2, OS_LOG_TYPE_INFO, "Reloading all progress for placeholders...", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_19);
}

uint64_t __61__FBSApplicationLibrary__reloadPlaceholdersNotificationFired__block_invoke_107(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_reloadProgress");
}

- (id)_synchronizationQueue
{
  return self->_callOutQueue;
}

- (id)_workQueue_currentProcessProxyWithOutURL:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    BSDispatchQueueAssert();
    v3 = (void *)MEMORY[0x1E0CA5860];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationProxyForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bundleURL");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          objc_msgSend(v6, "appState"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isValid"),
          v9,
          v8,
          v10))
    {
      objc_msgSend(v6, "bundleURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a2)
        goto LABEL_16;
    }
    else
    {
      FBSLogApplicationLibrary();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = v6;
        _os_log_impl(&dword_19A6D4000, v12, OS_LOG_TYPE_DEFAULT, "Application proxy by bundleID is invalid for current process: %@", (uint8_t *)&v23, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForBundleURL:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleURL");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16
        && (v17 = (void *)v16,
            objc_msgSend(v15, "appState"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isValid"),
            v18,
            v17,
            v19))
      {
        v20 = v15;

        objc_msgSend(v20, "bundleURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v20;
      }
      else
      {
        FBSLogApplicationLibrary();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[FBSApplicationLibrary _workQueue_currentProcessProxyWithOutURL:].cold.1();

        v6 = 0;
        v11 = 0;
      }

      if (!a2)
        goto LABEL_16;
    }
    *a2 = objc_retainAutorelease(v11);
LABEL_16:

    return v6;
  }
  return 0;
}

void __48__FBSApplicationLibrary__observeType_withBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 1);
    v4 = a1[4];
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(a1[4] + 32);
  }
  v6 = (id)MEMORY[0x19AECA324](a1[6]);
  objc_msgSend(v2, "setObject:forKey:", v6, a1[5]);

}

- (void)_notifyForType:(int)a3 synchronously:(void *)a4 withCastingBlock:
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v7 = a4;
  v8 = v7;
  if (a1)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke;
    v10[3] = &unk_1E38ECB18;
    v10[4] = a1;
    v12 = a2;
    v11 = v7;
    v9 = (void *)MEMORY[0x19AECA324](v10);
    if (a3)
    {
      BSDispatchQueueAssertNot();
      dispatch_sync(*(dispatch_queue_t *)(a1 + 104), v9);
    }
    else
    {
      dispatch_async(*(dispatch_queue_t *)(a1 + 104), v9);
    }

  }
}

void __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[5];
  id v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke_2;
  block[3] = &unk_1E38ED250;
  v5 = a1[6];
  block[4] = v3;
  v18 = v5;
  v6 = v2;
  v17 = v6;
  dispatch_sync(v4, block);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(a1[5] + 16))(a1[5]);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v9);
  }

}

void __71__FBSApplicationLibrary__notifyForType_synchronously_withCastingBlock___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6) + 8) == a1[6])
        {
          objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", (_QWORD)v11);
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = (void *)v7;
          if (v7)
          {
            v9 = (void *)a1[5];
            v10 = (void *)MEMORY[0x19AECA324](v7);
            objc_msgSend(v9, "addObject:", v10);

          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)_notifyDidAddPlaceholders:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of placeholders added: %{public}@", buf, 0xCu);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "applicationIdentity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fbs_mediumDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v12 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notifying observers of placeholder add."));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "logStep:byParty:phase:success:forBundleID:description:", 8, 11, 3, 1, v11, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__FBSApplicationLibrary__notifyDidAddPlaceholders___block_invoke;
    v15[3] = &unk_1E38EB4A0;
    v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 0, 1, v15);

    v3 = v14;
  }

}

uint64_t __51__FBSApplicationLibrary__notifyDidAddPlaceholders___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_notifyDidCancelPlaceholders:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of placeholders cancelled: %{public}@", buf, 0xCu);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "applicationIdentity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fbs_mediumDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v12 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notifying observers of placeholder cancelled."));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "logStep:byParty:phase:success:forBundleID:description:", 9, 11, 3, 1, v11, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__FBSApplicationLibrary__notifyDidCancelPlaceholders___block_invoke;
    v15[3] = &unk_1E38EB4A0;
    v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 1, 1, v15);

    v3 = v14;
  }

}

uint64_t __54__FBSApplicationLibrary__notifyDidCancelPlaceholders___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_notifyDidAddApplications:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications added: %{public}@", buf, 0xCu);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "applicationIdentity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fbs_mediumDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v12 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notifying observers of application added."));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "logStep:byParty:phase:success:forBundleID:description:", 10, 11, 3, 1, v11, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__FBSApplicationLibrary__notifyDidAddApplications___block_invoke;
    v15[3] = &unk_1E38EB4A0;
    v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 2, 1, v15);

    v3 = v14;
  }

}

uint64_t __51__FBSApplicationLibrary__notifyDidAddApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_notifyDidReplaceApplications:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "objectEnumerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v6;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications replaced: %{public}@", buf, 0xCu);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v3;
    objc_msgSend(v3, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "applicationIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "fbs_mediumDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v14 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notifying observers of application replaced."));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "logStep:byParty:phase:success:forBundleID:description:", 11, 11, 3, 1, v13, v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__FBSApplicationLibrary__notifyDidReplaceApplications___block_invoke;
    v17[3] = &unk_1E38EB4A0;
    v3 = v16;
    v18 = v16;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 3, 1, v17);

  }
}

uint64_t __55__FBSApplicationLibrary__notifyDidReplaceApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_notifyDidUpdateApplications:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "objectEnumerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v6;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications updated: %{public}@", buf, 0xCu);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v3;
    objc_msgSend(v3, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "applicationIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "fbs_mediumDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v14 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notifying observers of application updated."));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "logStep:byParty:phase:success:forBundleID:description:", 14, 11, 3, 1, v13, v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__FBSApplicationLibrary__notifyDidUpdateApplications___block_invoke;
    v17[3] = &unk_1E38EB4A0;
    v3 = v16;
    v18 = v16;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 6, 1, v17);

  }
}

uint64_t __54__FBSApplicationLibrary__notifyDidUpdateApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_notifyDidRemoveApplications:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications removed: %{public}@", buf, 0xCu);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v11 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(v10, "bundleIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notifying observers of application removed."));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "logStep:byParty:phase:success:forBundleID:description:", 12, 11, 3, 1, v12, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__FBSApplicationLibrary__notifyDidRemoveApplications___block_invoke;
    v15[3] = &unk_1E38EB4A0;
    v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 4, 1, v15);

    v3 = v14;
  }

}

uint64_t __54__FBSApplicationLibrary__notifyDidRemoveApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_notifyDidDemoteApplications:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of applications demoted: %{public}@", buf, 0xCu);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (FBSApplicationLibraryLogTransactionEnabled())
          {
            v11 = (void *)MEMORY[0x1E0D4E420];
            objc_msgSend(v10, "bundleIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notifying observers of application demoted."));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "logStep:byParty:phase:success:forBundleID:description:", 13, 11, 3, 1, v12, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__FBSApplicationLibrary__notifyDidDemoteApplications___block_invoke;
    v15[3] = &unk_1E38EB4A0;
    v16 = v5;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 5, 1, v15);

    v3 = v14;
  }

}

uint64_t __54__FBSApplicationLibrary__notifyDidDemoteApplications___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_notifyDidChangeNetworkUsage:(uint64_t)a1
{
  NSObject *v4;
  _QWORD v5[4];
  char v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v8 = a2;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "Notifying observers of network usage changed: usingNetwork=%d", buf, 8u);
    }

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__FBSApplicationLibrary__notifyDidChangeNetworkUsage___block_invoke;
    v5[3] = &__block_descriptor_33_e8_v16__0_8l;
    v6 = a2;
    -[FBSApplicationLibrary _notifyForType:synchronously:withCastingBlock:](a1, 7, 0, v5);
  }
}

uint64_t __54__FBSApplicationLibrary__notifyDidChangeNetworkUsage___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

- (id)_identitiesForProxy:(_QWORD *)a3 outRecord:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("proxy"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:].cold.1();
      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A72F85CLL);
    }
    objc_msgSend(v5, "fbs_correspondingApplicationRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    if (v8)
    {
      v9 = objc_msgSend(a1[1], "isPersonaAware");
      objc_msgSend(v8, "identities");
      v10 = (id *)objc_claimAutoreleasedReturnValue();
      a1 = v10;
      if ((v9 & 1) == 0)
      {
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v12 = objc_claimAutoreleasedReturnValue();

        a1 = (id *)v12;
      }
    }
    else
    {
      a1 = (id *)MEMORY[0x1E0C9AA60];
    }

  }
  return a1;
}

void __30__FBSApplicationLibrary__load__block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  size_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  size_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  id v58;
  uint64_t v59;
  void *v60;
  id *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  NSObject *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *queue;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id objc;
  id obj;
  id obja;
  id objb;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id v112;
  uint64_t v113;
  id v114;
  _QWORD v115[4];
  id v116;
  uint64_t v117;
  id v118;
  id v119;
  id v120;
  uint64_t v121;
  _QWORD block[4];
  id v123;
  id v124;
  uint64_t v125;
  id v126;
  id v127;
  id v128;
  uint64_t v129;
  _QWORD v130[4];
  id v131;
  _QWORD v132[4];
  id v133;
  uint8_t buf[4];
  double v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  void *v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  FBSLogApplicationLibrary();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A6D4000, v2, OS_LOG_TYPE_DEFAULT, "Loading application library...", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObserver:");
  BSContinuousMachTimeNow();
  v4 = v3;
  kdebug_trace();
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = MEMORY[0x1E0C809B0];
  v132[0] = MEMORY[0x1E0C809B0];
  v132[1] = 3221225472;
  v132[2] = __30__FBSApplicationLibrary__load__block_invoke_133;
  v132[3] = &unk_1E38ED298;
  v8 = v5;
  v133 = v8;
  objc_msgSend(v6, "enumerateBundlesOfType:block:", 3, v132);
  kdebug_trace();
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v130[0] = v7;
  v130[1] = 3221225472;
  v130[2] = __30__FBSApplicationLibrary__load__block_invoke_2;
  v130[3] = &unk_1E38ED298;
  v11 = v9;
  v131 = v11;
  objc_msgSend(v10, "enumerateBundlesOfType:block:", 1, v130);
  kdebug_trace();
  LODWORD(v10) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allowConcurrentLoading");
  kdebug_trace();
  v83 = v8;
  v84 = v11;
  if ((_DWORD)v10)
  {
    kdebug_trace();
    objc_msgSend(off_1E38E9DF8, "concurrent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceClass:", 25);
    objc = (id)objc_claimAutoreleasedReturnValue();

    v13 = v8;
    queue = BSDispatchQueueCreate();
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applicationInfoClass");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "installedApplicationFilter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applicationIdentityFilter");
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "count");
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __30__FBSApplicationLibrary__load__block_invoke_3;
    block[3] = &unk_1E38ED2C0;
    v123 = v11;
    v124 = v18;
    v21 = *(_QWORD *)(a1 + 32);
    v127 = v15;
    v125 = v21;
    v128 = v17;
    v129 = v14;
    v22 = v19;
    v126 = v22;
    v82 = v17;
    v81 = v18;
    v80 = v15;
    dispatch_apply(v20, queue, block);
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applicationPlaceholderClass");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "placeholderFilter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "placeholderIdentityFilter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v13, "count");
    v28 = MEMORY[0x1E0C809B0];
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __30__FBSApplicationLibrary__load__block_invoke_4;
    v115[3] = &unk_1E38ED2E8;
    v29 = v13;
    v30 = *(_QWORD *)(a1 + 32);
    v116 = v29;
    v117 = v30;
    v119 = v24;
    v120 = v25;
    v121 = v23;
    v31 = v26;
    v118 = v31;
    v32 = v25;
    v33 = v24;
    dispatch_apply(v27, queue, v115);
    v111[0] = v28;
    v111[1] = 3221225472;
    v111[2] = __30__FBSApplicationLibrary__load__block_invoke_5;
    v111[3] = &unk_1E38EC2B0;
    v34 = *(_QWORD *)(a1 + 32);
    v112 = v22;
    v113 = v34;
    v114 = v31;
    v35 = v31;
    v36 = v22;
    dispatch_barrier_sync(queue, v111);
    kdebug_trace();
    kdebug_trace();

  }
  else
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    obj = v8;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v146, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v108 != v39)
            objc_enumerationMutation(obj);
          v41 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 32), v41, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v103, v145, 16);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v104;
            do
            {
              for (j = 0; j != v44; ++j)
              {
                if (*(_QWORD *)v104 != v45)
                  objc_enumerationMutation(v42);
                v47 = -[FBSApplicationLibrary _workQueue_addPlaceholderWithIdentity:forProxy:](*(id **)(a1 + 32), *(void **)(*((_QWORD *)&v103 + 1) + 8 * j), v41);
              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v103, v145, 16);
            }
            while (v44);
          }

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v146, 16);
      }
      while (v38);
    }

    kdebug_trace();
    kdebug_trace();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    obja = v84;
    v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v144, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v100;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v100 != v50)
            objc_enumerationMutation(obja);
          v52 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * k);
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 32), v52, 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v95, v143, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v96;
            do
            {
              for (m = 0; m != v55; ++m)
              {
                if (*(_QWORD *)v96 != v56)
                  objc_enumerationMutation(v53);
                v58 = -[FBSApplicationLibrary _workQueue_addApplicationWithIdentity:forProxy:](*(id **)(a1 + 32), *(void **)(*((_QWORD *)&v95 + 1) + 8 * m), v52);
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v95, v143, 16);
            }
            while (v55);
          }

        }
        v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v144, 16);
      }
      while (v49);
    }

    kdebug_trace();
  }
  v59 = *(_QWORD *)(a1 + 32);
  v94 = 0;
  -[FBSApplicationLibrary _workQueue_currentProcessProxyWithOutURL:](v59, &v94);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objb = v94;
  if (v60)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v61 = *(id **)(a1 + 32);
    v89 = 0;
    -[FBSApplicationLibrary _identitiesForProxy:outRecord:](v61, v60, &v89);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v89;
    v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v90, v142, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v91;
      do
      {
        for (n = 0; n != v65; ++n)
        {
          if (*(_QWORD *)v91 != v66)
            objc_enumerationMutation(v62);
          v68 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * n);
          -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(_QWORD **)(a1 + 32), v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v69
            && -[FBSApplicationLibrary _workQueue_applicationPassesFilter:record:identity:](*(_QWORD *)(a1 + 32), v60, v63, v68))
          {
            v70 = objc_alloc((Class)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applicationInfoClass"));
            objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = (void *)objc_msgSend(v70, "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v60, v63, v68, v71, objb);

            if (v72)
              -[FBSApplicationLibrary _workQueue_addApplication:](*(_QWORD *)(a1 + 32), v72);

          }
        }
        v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v90, v142, 16);
      }
      while (v65);
    }

  }
  kdebug_trace();
  FBSLogApplicationLibrary();
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    BSContinuousMachTimeNow();
    v75 = v74 - v4;
    MEMORY[0x19AEC9CD0](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allowConcurrentLoading"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValues");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v135 = v75;
    v136 = 2112;
    v137 = v76;
    v138 = 2114;
    v139 = v77;
    v140 = 2114;
    v141 = v78;
    _os_log_impl(&dword_19A6D4000, v73, OS_LOG_TYPE_INFO, "ApplicationLibrary initialized. (timeSpent = %f -- loaded asynchronously: %@) \nKnown Placeholders=%{public}@\nKnown Applications=%{public}@", buf, 0x2Au);

  }
}

void __30__FBSApplicationLibrary__load__block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __30__FBSApplicationLibrary__load__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __30__FBSApplicationLibrary__load__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_proxyPassesInclusionFilter(v3, *(void **)(a1 + 64), *(void **)(a1 + 40)))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = *(id **)(a1 + 48);
    v14 = 0;
    -[FBSApplicationLibrary _identitiesForProxy:outRecord:](v4, v3, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (_proxyPassesIdentityFilter(v11, v6, *(void **)(a1 + 72), *(void **)(a1 + 40)))
          {
            objc_msgSend(v6, "fbs_processIdentityForApplicationIdentity:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 80)), "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v3, v6, v11, v12, 0);
            os_unfair_lock_lock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___ApplicationLock);
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);
            os_unfair_lock_unlock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___ApplicationLock);

          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

void __30__FBSApplicationLibrary__load__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_proxyPassesInclusionFilter(v3, *(void **)(a1 + 56), 0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(id **)(a1 + 40);
    v13 = 0;
    -[FBSApplicationLibrary _identitiesForProxy:outRecord:](v4, v3, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (_proxyPassesIdentityFilter(v11, v6, *(void **)(a1 + 64), 0))
          {
            v12 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "_initWithApplicationProxy:identity:", v3, v11);
            os_unfair_lock_lock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___PlaceholderLock);
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
            os_unfair_lock_unlock((os_unfair_lock_t)&FBSApplicationLibraryErrorIdentityKey_block_invoke___PlaceholderLock);

          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

void __30__FBSApplicationLibrary__load__block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        -[FBSApplicationLibrary _workQueue_addApplication:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[FBSApplicationLibrary _workQueue_addPlaceholder:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

- (void)_workQueue_addApplication:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    NSClassFromString(CFSTR("FBSApplicationInfo"));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _workQueue_addApplication:].cold.1();
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A730C28);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSApplicationInfoClass]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _workQueue_addApplication:].cold.1();
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A730C8CLL);
    }

    objc_msgSend(v5, "applicationIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      FBSLogApplicationLibrary();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _workQueue_addApplication:].cold.2();

    }
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v5, v7);
    -[FBSApplicationLibrary _workQueue_didAddBundleInfo:](a1, v5);
    FBSLogApplicationLibrary();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "succinctDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_19A6D4000, v10, OS_LOG_TYPE_DEFAULT, "Added application: %@", buf, 0xCu);

    }
  }

}

- (void)_workQueue_addPlaceholder:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    NSClassFromString(CFSTR("FBSApplicationPlaceholder"));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _workQueue_addPlaceholder:].cold.1();
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A730E8CLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSApplicationPlaceholderClass]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _workQueue_addPlaceholder:].cold.1();
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A730EF0);
    }

    objc_msgSend(v5, "applicationIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      FBSLogApplicationLibrary();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FBSApplicationLibrary _workQueue_addPlaceholder:].cold.2();

    }
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v5, v7);
    objc_msgSend(v5, "setAppLibrary:", a1);
    -[FBSApplicationLibrary _workQueue_didAddBundleInfo:](a1, v5);
    FBSLogApplicationLibrary();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "succinctDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_19A6D4000, v10, OS_LOG_TYPE_DEFAULT, "Added placeholder: %@", buf, 0xCu);

    }
  }

}

- (id)_workQueue_addPlaceholderWithIdentity:(void *)a3 forProxy:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1
    && (objc_msgSend(v6, "appState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isPlaceholder"),
        v8,
        v9))
  {
    v18 = 0;
    -[FBSApplicationLibrary _identitiesForProxy:outRecord:](a1, v7, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    v12 = objc_msgSend(v10, "containsObject:", v5);

    v13 = 0;
    if (v12)
    {
      if (-[FBSApplicationLibrary _workQueue_placeholderPassesFilter:record:identity:]((uint64_t)a1, v7, v11, v5))
      {
        v14 = (void *)MEMORY[0x19AECA15C]();
        v13 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1[1], "applicationPlaceholderClass")), "_initWithApplicationProxy:identity:", v7, v5);
        -[FBSApplicationLibrary _workQueue_addPlaceholder:]((uint64_t)a1, v13);
        objc_autoreleasePoolPop(v14);
      }
      else
      {
        FBSLogApplicationLibrary();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "fbs_shortDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v20 = v16;
          _os_log_impl(&dword_19A6D4000, v15, OS_LOG_TYPE_DEFAULT, "Not creating placeholder because it is filtered: %@", buf, 0xCu);

        }
        v13 = 0;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_workQueue_addApplicationWithIdentity:(void *)a3 forProxy:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1
    && (objc_msgSend(v6, "appState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isInstalled"),
        v8,
        v9))
  {
    v19 = 0;
    -[FBSApplicationLibrary _identitiesForProxy:outRecord:](a1, v7, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    v12 = objc_msgSend(v10, "containsObject:", v5);

    v13 = 0;
    if (v12)
    {
      if (-[FBSApplicationLibrary _workQueue_applicationPassesFilter:record:identity:]((uint64_t)a1, v7, v11, v5))
      {
        v14 = (void *)MEMORY[0x19AECA15C]();
        objc_msgSend(v11, "fbs_processIdentityForApplicationIdentity:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1[1], "applicationInfoClass")), "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v7, v11, v5, v15, 0);
        -[FBSApplicationLibrary _workQueue_addApplication:]((uint64_t)a1, v13);

        objc_autoreleasePoolPop(v14);
      }
      else
      {
        FBSLogApplicationLibrary();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "fbs_shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v17;
          _os_log_impl(&dword_19A6D4000, v16, OS_LOG_TYPE_DEFAULT, "Not creating app because it is filtered: %@", buf, 0xCu);

        }
        v13 = 0;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)_workQueue_applicationPassesFilter:(void *)a3 record:(void *)a4 identity:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  unsigned int v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = *(void **)(a1 + 8);
    v10 = a2;
    objc_msgSend(v9, "installedApplicationFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _proxyPassesInclusionFilter(v10, v11, *(void **)(a1 + 80));

    v13 = 0;
    if (v7 && v8)
    {
      objc_msgSend(*(id *)(a1 + 8), "applicationIdentityFilter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = _proxyPassesIdentityFilter(v8, v7, v14, *(void **)(a1 + 80));

    }
    a1 = v12 & v13;
  }

  return a1;
}

- (void)_workQueue_didAddBundleInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v5, v4);
    }
    objc_msgSend(v7, "applicationIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v3 = v7;
  }

}

- (uint64_t)_workQueue_placeholderPassesFilter:(void *)a3 record:(void *)a4 identity:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  unsigned int v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = *(void **)(a1 + 8);
    v10 = a2;
    objc_msgSend(v9, "placeholderFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _proxyPassesInclusionFilter(v10, v11, 0);

    v13 = 0;
    if (v7 && v8)
    {
      objc_msgSend(*(id *)(a1 + 8), "placeholderIdentityFilter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = _proxyPassesIdentityFilter(v8, v7, v14, 0);

    }
    a1 = v12 & v13;
  }

  return a1;
}

- (id)_workQueue_removeApplicationForIdentity:(id *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[FBSApplicationLibrary _workQueue_applicationForIdentity:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      FBSLogApplicationLibrary();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "succinctDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEFAULT, "Removed application: %@", (uint8_t *)&v10, 0xCu);

      }
      v7 = a1[8];
      objc_msgSend(v3, "identityString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v8);

      -[FBSApplicationLibrary _workQueue_didRemoveBundleInfo:](a1, v4);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_workQueue_didRemoveBundleInfo:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v11 = v3;
    objc_msgSend(v3, "applicationIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[8], "objectForKey:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[9], "objectForKey:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v6 | v7;

    if (!v8)
    {
      objc_msgSend(v11, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v4);
      if (!objc_msgSend(v10, "count"))
        objc_msgSend(a1[7], "removeObjectForKey:", v9);

    }
    v3 = v11;
  }

}

- (id)_workQueue_removePlaceholderForIdentity:(id *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      FBSLogApplicationLibrary();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "succinctDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEFAULT, "Removed placeholder: %@", (uint8_t *)&v10, 0xCu);

      }
      v7 = a1[9];
      objc_msgSend(v3, "identityString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v8);

      objc_msgSend(v4, "setAppLibrary:", 0);
      -[FBSApplicationLibrary _workQueue_didRemoveBundleInfo:](a1, v4);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_workQueue_applicationsForProxies:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          -[FBSApplicationLibrary _identitiesForProxy:outRecord:](a1, v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v11);
                -[FBSApplicationLibrary _workQueue_applicationForIdentity:](a1, *(void **)(*((_QWORD *)&v20 + 1) + 8 * j));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                  objc_msgSend(v5, "addObject:", v16);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_workQueue_applicationNeedsRegeneration:(void *)a3 fromProxy:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_13;
  }
  if (v5)
  {
    objc_msgSend(v6, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v5, "lastModifiedDate");
      v14 = v13;
      BSModificationDateForPath();
      if (v14 == v15)
      {
        v20 = 0;
        goto LABEL_12;
      }
      FBSLogApplicationLibrary();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "applicationIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fbs_shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v18;
        v19 = "Regenerating application %{public}@ due to modification date mismatch";
LABEL_10:
        _os_log_impl(&dword_19A6D4000, v16, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 0xCu);

      }
    }
    else
    {
      FBSLogApplicationLibrary();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "applicationIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fbs_shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v18;
        v19 = "Regenerating application %{public}@ due to bundle path mismatch";
        goto LABEL_10;
      }
    }

    v20 = 1;
LABEL_12:

    goto LABEL_13;
  }
  v20 = 1;
LABEL_13:

  return v20;
}

- (void)_fixupAdded:(void *)a3 removed:(id *)a4 replaced:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1
    && (objc_msgSend(*(id *)(a1 + 8), "isPersonaAware") & 1) == 0
    && objc_msgSend(v8, "count") == 1
    && objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
    {
      FBSLogApplicationLibrary();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_19A6D4000, v14, OS_LOG_TYPE_DEFAULT, "[59555749] making persona change of %{public}@ a replacement instead of remove+add", (uint8_t *)&v18, 0xCu);

      }
      objc_msgSend(v7, "removeObjectIdenticalTo:", v10);
      objc_msgSend(v8, "removeObjectIdenticalTo:", v9);
      v16 = *a4;
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 512);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        *a4 = v17;
        v16 = v17;
      }
      objc_msgSend(v16, "setObject:forKey:", v10, v9);

    }
  }

}

- (void)applicationInstallsDidStart:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *workQueue;
  id v11;
  _QWORD block[4];
  id v14;
  FBSApplicationLibrary *v15;
  _BYTE *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[FBSApplicationLibrary applicationInstallsDidStart:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v4);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__9;
  v30 = __Block_byref_object_dispose__9;
  v31 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__9;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FBSApplicationLibrary_applicationInstallsDidStart___block_invoke;
  block[3] = &unk_1E38ED310;
  v11 = v3;
  v14 = v11;
  v15 = self;
  v16 = buf;
  v17 = &v18;
  dispatch_sync(workQueue, block);
  if (objc_msgSend((id)v19[5], "count"))
    -[FBSApplicationLibrary _notifyDidAddPlaceholders:]((uint64_t)self, (void *)v19[5]);
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    -[FBSApplicationLibrary _notifyDidDemoteApplications:]((uint64_t)self, *(void **)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(buf, 8);

}

void __53__FBSApplicationLibrary_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v2);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 40), v3, 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v21;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v21 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
              if (FBSInstallTypeIsCloudDemoted(objc_msgSend(v3, "installType")))
              {
                -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(a1 + 40), v9);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                if (v10)
                {
                  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                  v19 = *(id *)(v11 + 40);
                  _addResultToArrayCreatingArrayIfNecessary(&v19, v10);
                  objc_storeStrong((id *)(v11 + 40), v19);
                }

              }
              -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(_QWORD **)(a1 + 40), v9);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                v13 = v12;
                objc_msgSend(v12, "_setProxy:", v3);
                objc_msgSend(v13, "_noteChangedSignificantly");
              }
              else
              {
                -[FBSApplicationLibrary _workQueue_addPlaceholderWithIdentity:forProxy:](*(id **)(a1 + 40), v9, v3);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v18 = *(id *)(v14 + 40);
                _addResultToArrayCreatingArrayIfNecessary(&v18, v13);
                objc_storeStrong((id *)(v14 + 40), v18);
              }

              ++v8;
            }
            while (v6 != v8);
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v6);
        }

        ++v2;
      }
      while (v2 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v17);
  }

}

- (void)applicationInstallsDidChange:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  _QWORD block[4];
  id v15;
  FBSApplicationLibrary *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v22 = "-[FBSApplicationLibrary applicationInstallsDidChange:]";
          v23 = 2114;
          v24 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_INFO, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FBSApplicationLibrary_applicationInstallsDidChange___block_invoke;
  block[3] = &unk_1E38EAE08;
  v15 = v3;
  v16 = self;
  v12 = v3;
  dispatch_async(workQueue, block);

}

void __54__FBSApplicationLibrary_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 32);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v17 = v2;
        v3 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v2);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 40), v3, 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v19 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
              -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(_QWORD **)(a1 + 40), v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v10;
              if (v10)
              {
                objc_msgSend(v10, "_setProxy:", v3);
              }
              else
              {
                FBSLogApplicationLibrary();
                v12 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v9, "fbs_shortDescription");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v27 = v13;
                  _os_log_impl(&dword_19A6D4000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring install did change unknown placeholder %{public}@", buf, 0xCu);

                }
              }

            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
          }
          while (v6);
        }

        v2 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    }
    while (v16);
  }

}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  _QWORD block[4];
  id v15;
  FBSApplicationLibrary *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v22 = "-[FBSApplicationLibrary applicationInstallsDidUpdateIcon:]";
          v23 = 2114;
          v24 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FBSApplicationLibrary_applicationInstallsDidUpdateIcon___block_invoke;
  block[3] = &unk_1E38EAE08;
  v15 = v3;
  v16 = self;
  v12 = v3;
  dispatch_async(workQueue, block);

}

void __58__FBSApplicationLibrary_applicationInstallsDidUpdateIcon___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v20;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v5);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 40), v6, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v16;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(_QWORD **)(a1 + 40), *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              if (v12)
              {
                objc_msgSend(v12, "_setProxy:", v6);
                objc_msgSend(v13, "_noteChangedSignificantly");
              }

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v3);
  }

}

- (void)applicationsDidInstall:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *workQueue;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  _BYTE *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v47 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[FBSApplicationLibrary applicationsDidInstall:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
        objc_msgSend(v7, "appState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isPlaceholder");

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("was handed a placeholder appProxy during applicationsDidInstall: %@"), v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSApplicationLibrary applicationsDidInstall:].cold.1();
          objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A732E9CLL);
        }
        objc_msgSend(v7, "appState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isInstalled");

        if ((v13 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("was handed a not-installed appProxy during applicationsDidInstall: %@"), v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSApplicationLibrary applicationsDidInstall:].cold.2();
          objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A732EF4);
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v4);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v51 = __Block_byref_object_copy__9;
  v52 = __Block_byref_object_dispose__9;
  v53 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__9;
  v44 = __Block_byref_object_dispose__9;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9;
  v38 = __Block_byref_object_dispose__9;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  v33 = 0;
  v14 = MEMORY[0x1E0C809B0];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke;
  block[3] = &unk_1E38ED338;
  block[4] = self;
  v16 = v3;
  v23 = v16;
  v24 = &v34;
  v25 = &v40;
  v26 = buf;
  v27 = &v28;
  dispatch_sync(workQueue, block);
  if (objc_msgSend((id)v35[5], "count"))
    -[FBSApplicationLibrary _notifyDidCancelPlaceholders:]((uint64_t)self, (void *)v35[5]);
  if (objc_msgSend((id)v41[5], "count"))
    -[FBSApplicationLibrary _notifyDidRemoveApplications:]((uint64_t)self, (void *)v41[5]);
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    -[FBSApplicationLibrary _notifyDidAddApplications:]((uint64_t)self, *(void **)(*(_QWORD *)&buf[8] + 40));
  if (objc_msgSend((id)v29[5], "count"))
    -[FBSApplicationLibrary _notifyDidReplaceApplications:]((uint64_t)self, (void *)v29[5]);
  v17 = self->_workQueue;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_175;
  v21[3] = &unk_1E38EAE78;
  v21[4] = self;
  dispatch_sync(v17, v21);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(buf, 8);

}

void __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  BOOL v39;
  uint64_t v41;
  id v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  _BYTE v84[128];
  uint8_t v85[4];
  uint64_t v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v1 = a1;
  v90 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    ++*(_QWORD *)(v2 + 88);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = *(id *)(v1 + 40);
  v58 = v1;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
  if (v59)
  {
    v56 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v79 != v56)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v6, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 56), "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v8);

        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(v1 + 32), v6, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v75;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v75 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
              objc_msgSend(v4, "setObject:forKey:", v6, v14);
              objc_msgSend(v3, "removeObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
          }
          while (v11);
        }

        v1 = v58;
      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    }
    while (v59);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v15 = v3;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v71 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
        FBSLogApplicationLibrary();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_cold_1(v85, v20, &v86, v21);

        -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v1 + 32), v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8);
          v69 = *(id *)(v23 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v69, v22);
          objc_storeStrong((id *)(v23 + 40), v69);
        }
        -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v1 + 32), v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
          v68 = *(id *)(v25 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v68, v24);
          objc_storeStrong((id *)(v25 + 40), v68);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    }
    while (v17);
  }
  v57 = v15;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v26 = v4;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v65;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v65 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * m);
        objc_msgSend(v26, "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v1 + 32), v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSApplicationLibrary _workQueue_applicationForIdentity:](*(_QWORD **)(v1 + 32), v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[FBSApplicationLibrary _workQueue_applicationNeedsRegeneration:fromProxy:](*(_QWORD *)(v1 + 32), v34, v32) & 1) == 0)
        {
          FBSLogApplicationLibrary();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v31, "fbs_shortDescription");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v83 = v44;
            _os_log_impl(&dword_19A6D4000, v43, OS_LOG_TYPE_DEFAULT, "Not regenerating app for identity: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v34, "_setInstalling:", 0);
          v35 = 0;
          goto LABEL_54;
        }
        -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v1 + 32), v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[FBSApplicationLibrary _workQueue_addApplicationWithIdentity:forProxy:](*(id **)(v1 + 32), v31, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
          v38 = v35 == 0;
        else
          v38 = 0;
        if (v38)
        {
          v46 = *(_QWORD *)(*(_QWORD *)(v1 + 64) + 8);
          v63 = *(id *)(v46 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v63, v36);
          objc_storeStrong((id *)(v46 + 40), v63);
          v35 = 0;
          goto LABEL_62;
        }
        if (v36)
          v39 = v35 == 0;
        else
          v39 = 1;
        if (!v39 && v36 != v35)
        {
          v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40);
          if (!v47)
          {
            objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 512);
            v48 = objc_claimAutoreleasedReturnValue();
            v49 = *(_QWORD *)(*(_QWORD *)(v1 + 72) + 8);
            v50 = *(void **)(v49 + 40);
            *(_QWORD *)(v49 + 40) = v48;

            v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40);
          }
          objc_msgSend(v47, "setObject:forKey:", v37, v35);
          goto LABEL_62;
        }
        if (v36)
          goto LABEL_62;
        if (v35)
        {
          v41 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
          v62 = *(id *)(v41 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v62, v35);
          v42 = v62;
          v34 = *(void **)(v41 + 40);
          *(_QWORD *)(v41 + 40) = v42;
          v1 = v58;
LABEL_54:

        }
        if (v33)
        {
          v45 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8);
          v61 = *(id *)(v45 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v61, v33);
          objc_storeStrong((id *)(v45 + 40), v61);
        }
        v37 = 0;
LABEL_62:

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
    }
    while (v28);
  }

  v51 = *(_QWORD *)(v1 + 32);
  v52 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40);
  v53 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40);
  v54 = *(_QWORD *)(*(_QWORD *)(v1 + 72) + 8);
  v60 = *(id *)(v54 + 40);
  -[FBSApplicationLibrary _fixupAdded:removed:replaced:](v51, v52, v53, &v60);
  objc_storeStrong((id *)(v54 + 40), v60);

}

void __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_175(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 88);
    if (v2)
    {
      *(_QWORD *)(v1 + 88) = v2 - 1;
      -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](v1);
    }
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *workQueue;
  id v12;
  NSObject *v13;
  _QWORD v15[5];
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[FBSApplicationLibrary applicationsDidUninstall:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v4);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  v33 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  v25 = 0;
  v10 = MEMORY[0x1E0C809B0];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke;
  block[3] = &unk_1E38ED310;
  block[4] = self;
  v12 = v3;
  v17 = v12;
  v18 = &v20;
  v19 = buf;
  dispatch_sync(workQueue, block);
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    -[FBSApplicationLibrary _notifyDidCancelPlaceholders:]((uint64_t)self, *(void **)(*(_QWORD *)&buf[8] + 40));
  if (objc_msgSend((id)v21[5], "count"))
    -[FBSApplicationLibrary _notifyDidRemoveApplications:]((uint64_t)self, (void *)v21[5]);
  v13 = self->_workQueue;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke_2;
  v15[3] = &unk_1E38EAE78;
  v15[4] = self;
  dispatch_sync(v13, v15);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);

}

void __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    ++*(_QWORD *)(v2 + 88);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 40);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v4, "bundleIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0C99E20];
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(a1 + 32), v4, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setWithArray:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionSet:", v9);

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(a1 + 32), v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                v24 = *(id *)(v17 + 40);
                _addResultToArrayCreatingArrayIfNecessary(&v24, v16);
                objc_storeStrong((id *)(v17 + 40), v24);
              }
              -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(a1 + 32), v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v23 = *(id *)(v19 + 40);
                _addResultToArrayCreatingArrayIfNecessary(&v23, v18);
                objc_storeStrong((id *)(v19 + 40), v23);
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v12);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v22);
  }

}

void __50__FBSApplicationLibrary_applicationsDidUninstall___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 88);
    if (v2)
    {
      *(_QWORD *)(v1 + 88) = v2 - 1;
      -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](v1);
    }
  }
}

- (void)_handleApplicationStateDidChange:(int)a3 notifyForUpdateInsteadOfReplacement:
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__9;
    v47 = __Block_byref_object_dispose__9;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__9;
    v41 = __Block_byref_object_dispose__9;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__9;
    v35 = __Block_byref_object_dispose__9;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__9;
    v29 = __Block_byref_object_dispose__9;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__9;
    v23 = __Block_byref_object_dispose__9;
    v24 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke;
    block[3] = &unk_1E38ED360;
    block[4] = a1;
    v13 = v5;
    v14 = &v37;
    v15 = &v25;
    v16 = &v19;
    v17 = &v31;
    v18 = &v43;
    dispatch_sync(v8, block);
    if (objc_msgSend((id)v44[5], "count"))
      -[FBSApplicationLibrary _notifyDidAddPlaceholders:](a1, (void *)v44[5]);
    if (objc_msgSend((id)v38[5], "count"))
      -[FBSApplicationLibrary _notifyDidCancelPlaceholders:](a1, (void *)v38[5]);
    if (objc_msgSend((id)v32[5], "count"))
      -[FBSApplicationLibrary _notifyDidAddApplications:](a1, (void *)v32[5]);
    if (objc_msgSend((id)v26[5], "count"))
      -[FBSApplicationLibrary _notifyDidRemoveApplications:](a1, (void *)v26[5]);
    if (objc_msgSend((id)v20[5], "count"))
    {
      v9 = (void *)v20[5];
      if (a3)
        -[FBSApplicationLibrary _notifyDidUpdateApplications:](a1, v9);
      else
        -[FBSApplicationLibrary _notifyDidReplaceApplications:](a1, v9);
    }
    v10 = *(NSObject **)(a1 + 40);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke_176;
    v11[3] = &unk_1E38EAE78;
    v11[4] = a1;
    dispatch_sync(v10, v11);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }

}

void __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id obj;
  uint64_t v68;
  id v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    ++*(_QWORD *)(v1 + 88);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v5 = a1;
  obj = *(id *)(a1 + 40);
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
  if (v71)
  {
    v68 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v99 != v68)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 56), "objectForKey:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "unionSet:", v8);

        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        -[FBSApplicationLibrary _identitiesForProxy:outRecord:](*(id **)(v5 + 32), v7, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v95 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j);
              if (objc_msgSend(v2, "containsObject:", v14))
                v15 = v4;
              else
                v15 = v3;
              objc_msgSend(v15, "setObject:forKey:", v7, v14);
              objc_msgSend(v2, "removeObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
          }
          while (v11);
        }

        v5 = a1;
      }
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
    }
    while (v71);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v70 = v2;
  v16 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v91;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v91 != v18)
          objc_enumerationMutation(v70);
        v20 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
        FBSLogApplicationLibrary();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v20, "fbs_shortDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v105 = v22;
          _os_log_impl(&dword_19A6D4000, v21, OS_LOG_TYPE_DEFAULT, "Abandoned identity: %@", buf, 0xCu);

        }
        -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v5 + 32), v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8);
          v89 = *(id *)(v24 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v89, v23);
          objc_storeStrong((id *)(v24 + 40), v89);
        }
        -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v5 + 32), v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8);
          v88 = *(id *)(v26 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v88, v25);
          objc_storeStrong((id *)(v26 + 40), v88);
        }

      }
      v17 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
    }
    while (v17);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v74 = v4;
  v27 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
  if (v27)
  {
    v28 = v27;
    v72 = *(_QWORD *)v85;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v85 != v72)
          objc_enumerationMutation(v74);
        v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * m);
        FBSLogApplicationLibrary();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v30, "fbs_shortDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v105 = v32;
          _os_log_impl(&dword_19A6D4000, v31, OS_LOG_TYPE_DEFAULT, "Updated identity: %@", buf, 0xCu);

        }
        objc_msgSend(v74, "objectForKey:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSApplicationLibrary _workQueue_removeApplicationForIdentity:](*(id **)(v5 + 32), v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          objc_msgSend(v33, "appState");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isInstalled");

          if (v36)
          {
            -[FBSApplicationLibrary _workQueue_addApplicationWithIdentity:forProxy:](*(id **)(v5 + 32), v30, v33);
            v37 = objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(v5 + 64) + 8) + 40);
              if (!v38)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 512);
                v39 = objc_claimAutoreleasedReturnValue();
                v40 = *(_QWORD *)(*(_QWORD *)(v5 + 64) + 8);
                v41 = *(void **)(v40 + 40);
                *(_QWORD *)(v40 + 40) = v39;

                v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(v5 + 64) + 8) + 40);
              }
              objc_msgSend(v38, "setObject:forKey:", v37, v34);
            }
            else
            {
              v42 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8);
              v83 = *(id *)(v42 + 40);
              _addResultToArrayCreatingArrayIfNecessary(&v83, v34);
              objc_storeStrong((id *)(v42 + 40), v83);
            }
          }
          else
          {
            FBSLogApplicationLibrary();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19A6D4000, v37, OS_LOG_TYPE_DEFAULT, "Found an app with updated identity, but proxy is not a app. Ignoring.", buf, 2u);
            }
          }

        }
        -[FBSApplicationLibrary _workQueue_placeholderForIdentity:](*(_QWORD **)(v5 + 32), v30);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(v33, "appState");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isPlaceholder");

          if (v45)
          {
            objc_msgSend(v33, "fbs_correspondingApplicationRecord");
            v46 = objc_claimAutoreleasedReturnValue();
            if (!v46)
            {
              FBSLogApplicationLibrary();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v105 = v33;
                _os_log_error_impl(&dword_19A6D4000, v47, OS_LOG_TYPE_ERROR, "No corresponding record for placeholder: %@", buf, 0xCu);
              }

            }
            if (-[FBSApplicationLibrary _workQueue_placeholderPassesFilter:record:identity:](*(_QWORD *)(v5 + 32), v33, v46, v30))
            {
              objc_msgSend(v43, "_setProxy:", v33);
            }
            else
            {
              v48 = -[FBSApplicationLibrary _workQueue_removePlaceholderForIdentity:](*(id **)(v5 + 32), v30);
              v49 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8);
              v82 = *(id *)(v49 + 40);
              _addResultToArrayCreatingArrayIfNecessary(&v82, v34);
              objc_storeStrong((id *)(v49 + 40), v82);
            }
          }
          else
          {
            FBSLogApplicationLibrary();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19A6D4000, v46, OS_LOG_TYPE_DEFAULT, "Found a placeholder with updated identity, but proxy is not a placeholder. Ignoring.", buf, 2u);
            }
          }

        }
      }
      v28 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    }
    while (v28);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v50 = v3;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v79;
    do
    {
      for (n = 0; n != v52; ++n)
      {
        if (*(_QWORD *)v79 != v53)
          objc_enumerationMutation(v50);
        v55 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * n);
        FBSLogApplicationLibrary();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v55, "fbs_shortDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v105 = v57;
          _os_log_impl(&dword_19A6D4000, v56, OS_LOG_TYPE_DEFAULT, "Added identity: %@", buf, 0xCu);

        }
        objc_msgSend(v50, "objectForKey:", v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSApplicationLibrary _workQueue_addApplicationWithIdentity:forProxy:](*(id **)(v5 + 32), v55, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          v60 = *(_QWORD *)(*(_QWORD *)(v5 + 72) + 8);
          v77 = *(id *)(v60 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v77, v59);
          objc_storeStrong((id *)(v60 + 40), v77);
        }
        -[FBSApplicationLibrary _workQueue_addPlaceholderWithIdentity:forProxy:](*(id **)(v5 + 32), v55, v58);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          v62 = *(_QWORD *)(*(_QWORD *)(v5 + 80) + 8);
          v76 = *(id *)(v62 + 40);
          _addResultToArrayCreatingArrayIfNecessary(&v76, v61);
          objc_storeStrong((id *)(v62 + 40), v76);
        }

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
    }
    while (v52);
  }

  v63 = *(_QWORD *)(v5 + 32);
  v64 = *(void **)(*(_QWORD *)(*(_QWORD *)(v5 + 72) + 8) + 40);
  v65 = *(void **)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 40);
  v66 = *(_QWORD *)(*(_QWORD *)(v5 + 64) + 8);
  v75 = *(id *)(v66 + 40);
  -[FBSApplicationLibrary _fixupAdded:removed:replaced:](v63, v64, v65, &v75);
  objc_storeStrong((id *)(v66 + 40), v75);

}

void __94__FBSApplicationLibrary__handleApplicationStateDidChange_notifyForUpdateInsteadOfReplacement___block_invoke_176(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 88);
    if (v2)
    {
      *(_QWORD *)(v1 + 88) = v2 - 1;
      -[FBSApplicationLibrary _workQueue_executeInstallSynchronizationBlocksIfAppropriate](v1);
    }
  }
}

- (void)applicationStateDidChange:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v17 = "-[FBSApplicationLibrary applicationStateDidChange:]";
          v18 = 2114;
          v19 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v5);
  }
  -[FBSApplicationLibrary _handleApplicationStateDidChange:notifyForUpdateInsteadOfReplacement:]((uint64_t)self, v3, 0);

}

- (void)networkUsageChanged:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__FBSApplicationLibrary_networkUsageChanged___block_invoke;
  v4[3] = &unk_1E38ED388;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

void __45__FBSApplicationLibrary_networkUsageChanged___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = *(_BYTE *)(a1 + 40);
  -[FBSApplicationLibrary _notifyDidChangeNetworkUsage:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v17 = "-[FBSApplicationLibrary deviceManagementPolicyDidChange:]";
          v18 = 2114;
          v19 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v5);
  }
  -[FBSApplicationLibrary _handleApplicationStateDidChange:notifyForUpdateInsteadOfReplacement:]((uint64_t)self, v3, 1);

}

- (void)applicationsDidChangePersonas:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v17 = "-[FBSApplicationLibrary applicationsDidChangePersonas:]";
          v18 = 2114;
          v19 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v5);
  }
  -[FBSApplicationLibrary _handleApplicationStateDidChange:notifyForUpdateInsteadOfReplacement:]((uint64_t)self, v3, 0);

}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v33 = "-[FBSApplicationLibrary applicationInstallsArePrioritized:arePaused:]";
          v34 = 2114;
          v35 = v12;
          _os_log_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@ (prioritized)", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v7);
  }
  v22 = v5;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v21;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        FBSLogApplicationLibraryObserver();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v33 = "-[FBSApplicationLibrary applicationInstallsArePrioritized:arePaused:]";
          v34 = 2114;
          v35 = v20;
          _os_log_impl(&dword_19A6D4000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@ (paused)", buf, 0x16u);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

}

- (void)applicationInstallsDidPause:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v16 = "-[FBSApplicationLibrary applicationInstallsDidPause:]";
          v17 = 2114;
          v18 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

}

- (void)applicationInstallsDidResume:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v16 = "-[FBSApplicationLibrary applicationInstallsDidResume:]";
          v17 = 2114;
          v18 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v16 = "-[FBSApplicationLibrary applicationInstallsDidCancel:]";
          v17 = 2114;
          v18 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v16 = "-[FBSApplicationLibrary applicationInstallsDidPrioritize:]";
          v17 = 2114;
          v18 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

}

- (void)applicationsWillInstall:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  _QWORD block[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v21 = "-[FBSApplicationLibrary applicationsWillInstall:]";
          v22 = 2114;
          v23 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FBSApplicationLibrary_applicationsWillInstall___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v15 = v3;
  v12 = v3;
  dispatch_sync(workQueue, block);

}

void __49__FBSApplicationLibrary_applicationsWillInstall___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FBSLogApplicationLibrary();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v16 = v4;
    v17 = 2114;
    v18 = v2;
    _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_INFO, "Applications will install: %{public}@ (appInfos: %{public}@)", buf, 0x16u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_setInstalling:", 1, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  _QWORD block[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v21 = "-[FBSApplicationLibrary applicationsDidFailToInstall:]";
          v22 = 2114;
          v23 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v15 = v3;
  v12 = v3;
  dispatch_sync(workQueue, block);

}

void __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t *)(a1 + 40);
  -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FBSLogApplicationLibrary();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke_cold_1(v1, (uint64_t)v2, v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setInstalling:", 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applicationsWillUninstall:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  _QWORD block[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v21 = "-[FBSApplicationLibrary applicationsWillUninstall:]";
          v22 = 2114;
          v23 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__FBSApplicationLibrary_applicationsWillUninstall___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v15 = v3;
  v12 = v3;
  dispatch_sync(workQueue, block);

}

void __51__FBSApplicationLibrary_applicationsWillUninstall___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_setUninstalling:", 1);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  _QWORD block[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        FBSLogApplicationLibraryObserver();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v21 = "-[FBSApplicationLibrary applicationsDidFailToUninstall:]";
          v22 = 2114;
          v23 = v10;
          _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__FBSApplicationLibrary_applicationsDidFailToUninstall___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v15 = v3;
  v12 = v3;
  dispatch_sync(workQueue, block);

}

void __56__FBSApplicationLibrary_applicationsDidFailToUninstall___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[FBSApplicationLibrary _workQueue_applicationsForProxies:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_setUninstalling:", 0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  int v7;
  FBSApplicationLibrary *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    self->_lock_invalidated = 1;
    FBSLogApplicationLibrary();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary<%p> invalidated", (uint8_t *)&v7, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("MISProvisioningProfileInstalled"), 0);
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("MISProvisioningProfileRemoved"), 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    -[LSApplicationWorkspace removeObserver:](self->_applicationWorkspace, "removeObserver:", self);
    -[BSInvalidatable invalidate](self->_stateCaptureAssertion, "invalidate");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_pendingSynchronizationExecutionBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue_injectedAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_workQueue_placeholdersByIdentity, 0);
  objc_storeStrong((id *)&self->_workQueue_installedApplicationsByIdentity, 0);
  objc_storeStrong((id *)&self->_workQueue_identitiesByBundleID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue_tokensToBlocks, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_initWithApplicationWorkspace:(const char *)a1 configuration:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithApplicationWorkspace:(const char *)a1 configuration:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithApplicationWorkspace:configuration:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithApplicationWorkspace:configuration:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_workQueue_applicationForIdentity:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)installedApplicationWithBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, a1, a3, "Persona-aware client is using deprecated bundleID-based method: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_21();
}

- (void)installedApplicationWithBundleIdentifier:completionHandler:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)installedApplicationWithBundleIdentifier:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, a1, a3, "Persona-aware client is using deprecated bundleID-based method: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_21();
}

- (void)placeholderWithBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, a1, a3, "Persona-aware client is using deprecated bundleID-based method: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_21();
}

- (void)_workQueue_placeholderForIdentity:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)uninstallApplication:withOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, v0, v1, "Cannot uninstall %@ since no application was found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_21();
}

- (void)uninstallApplication:(uint64_t)a3 withOptions:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, a1, a3, "Persona-aware client is using deprecated bundleID-based method: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_21();
}

void __77__FBSApplicationLibrary_uninstallApplicationIdentity_withOptions_completion___block_invoke_81_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v0 + 72));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)addApplicationProxy:withOverrideURL:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addApplicationProxy:withOverrideURL:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_workQueue_currentProcessProxyWithOutURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, v0, v1, "Application proxy by bundleURL is invalid for current process: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_21();
}

- (void)_identitiesForProxy:outRecord:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_workQueue_addApplication:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_workQueue_addApplication:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, v0, v1, "existing app for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_21();
}

- (void)_workQueue_addPlaceholder:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_workQueue_addPlaceholder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, v0, v1, "existing placeholder for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_21();
}

- (void)applicationsDidInstall:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)applicationsDidInstall:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __48__FBSApplicationLibrary_applicationsDidInstall___block_invoke_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "fbs_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_19A6D4000, a4, OS_LOG_TYPE_ERROR, "Abandoned identity: %{public}@", a1, 0xCu);

}

void __54__FBSApplicationLibrary_applicationsDidFailToInstall___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19A6D4000, log, OS_LOG_TYPE_ERROR, "Applications did fail to install: %{public}@ (appInfos: %{public}@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_21();
}

@end
