@implementation FBProcessManager

void __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  os_unfair_lock_s *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v5 = a2;
  objc_msgSend(v4, "addObject:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  LODWORD(v3) = objc_msgSend(v5, "bootstrapWithDelegate:", *(_QWORD *)(a1 + 32));

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!(_DWORD)v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    return;
  }
  FBLogProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v42 = v7;
    _os_log_impl(&dword_1A359A000, v6, OS_LOG_TYPE_DEFAULT, "Adding: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v8);

  }
  v13 = objc_msgSend(*(id *)(a1 + 40), "pid");
  if ((int)v13 >= 1)
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, v16);

  }
  v17 = objc_msgSend(*(id *)(a1 + 40), "versionedPID");
  if (v17 != -1)
  {
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v18, v20);

  }
  +[FBWorkspaceDomain sharedInstance]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FBWorkspaceDomain monitorAllSuspendableProcesses]((_BOOL8)v21))
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 40), "rbsHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "fb_canTaskSuspend");

  if (!v24)
  {
    v22 = 0;
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 40), "processPredicate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", v21) & 1) != 0)
  {
LABEL_13:
    v22 = 0;
  }
  else
  {
    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    if (v25)
    {
      objc_msgSend(v25, "addObject:", v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v21);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1 + 32);
      v33 = *(void **)(v32 + 64);
      *(_QWORD *)(v32 + 64) = v31;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:
  v26 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_86;
  v38[3] = &unk_1E4A13FF8;
  v27 = *(void **)(a1 + 40);
  v39 = *(id *)(a1 + 32);
  v40 = v27;
  v36[0] = v26;
  v36[1] = 3221225472;
  v36[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_2;
  v36[3] = &unk_1E4A11FD0;
  v28 = *(void **)(a1 + 40);
  v36[4] = *(_QWORD *)(a1 + 32);
  v37 = v28;
  objc_msgSend(v39, "_notifyObserversUsingBlock:completion:", v38, v36);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  v29 = *(os_unfair_lock_s **)(a1 + 32);
  if (v22)
  {
    os_unfair_lock_lock(v29 + 11);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    v30 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v34[0] = v26;
    v34[1] = 3221225472;
    v34[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_3;
    v34[3] = &unk_1E4A13F88;
    v35 = v22;
    objc_msgSend(v30, "updateConfiguration:", v34);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 44));

  }
  else
  {
    os_unfair_lock_unlock(v29 + 10);
  }

}

- (id)processForIdentity:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_processesByIdentity, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)launchProcessWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *bootstrapQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");

    bootstrapQueue = self->_bootstrapQueue;
    v11 = v6;
    v8 = v6;
    v9 = (void *)BSDispatchBlockCreateWithCurrentQualityOfService();
    dispatch_async(bootstrapQueue, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[context identity] != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessManager launchProcessWithContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_notifyObserversUsingBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *callOutQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FBProcessManager__notifyObserversUsingBlock_completion___block_invoke;
  block[3] = &unk_1E4A14088;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(callOutQueue, block);

}

- (id)_createProcessFutureWithExecutionContext:(id)a3 error:(id *)a4
{
  return -[FBProcessManager _bootstrapProcessWithExecutionContext:synchronously:error:](self, "_bootstrapProcessWithExecutionContext:synchronously:error:", a3, 0, a4);
}

void __24__FBProcessManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v8, "auditToken");
  objc_msgSend(v10, "processForVersionedPID:", BSVersionedPIDForAuditToken());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "_noteStateDidUpdate:", v9);

}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  void *v3;
  _QWORD block[5];

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__FBProcessManager__sharedInstanceCreateIfNeeded___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_sharedInstanceCreateIfNeeded__onceToken != -1)
      dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken, block);
  }
  v3 = (void *)atomic_load(&_sharedInstanceCreateIfNeeded____SharedManager);
  return v3;
}

+ (id)sharedInstance
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 1);
}

- (id)registerProcessForHandle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[2];

  objc_msgSend(a3, "auditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "realToken");
  else
    memset(v8, 0, sizeof(v8));
  -[FBProcessManager registerProcessForAuditToken:](self, "registerProcessForAuditToken:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)registerProcessForAuditToken:(id *)a3
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  __int128 v15;
  __int128 v16;

  v4 = *(_OWORD *)&a3->var0[4];
  v15 = *(_OWORD *)a3->var0;
  v16 = v4;
  v5 = BSVersionedPIDForAuditToken();
  if (v5 == -1)
    return 0;
  v6 = v5;
  -[FBProcessManager processForVersionedPID:](self, "processForVersionedPID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v8, "handleForIdentifier:error:", v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v10)
    {
      -[FBProcessManager _reallyRegisterProcessForHandle:](self, "_reallyRegisterProcessForHandle:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v7, "versionedPID"))
      {
LABEL_12:

        return v7;
      }
      FBLogProcess();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FBProcessManager registerProcessForAuditToken:].cold.2();
    }
    else
    {
      FBLogProcess();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FBProcessManager registerProcessForAuditToken:].cold.1(v11, v6, v12);
      v7 = 0;
    }

    goto LABEL_12;
  }
  return v7;
}

- (id)processForVersionedPID:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_processesByVersionedPID;
  void *v7;
  void *v8;
  NSMutableDictionary *lock_processesByPID;
  void *v10;
  NSObject *v11;

  if (a3 == -1)
  {
    v8 = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_processesByVersionedPID = self->_lock_processesByVersionedPID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](lock_processesByVersionedPID, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      lock_processesByPID = self->_lock_processesByPID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](lock_processesByPID, "objectForKey:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        FBLogProcess();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[FBProcessManager processForVersionedPID:].cold.1();

      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  return v8;
}

- (id)processForPID:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_processesByPID;
  void *v7;
  void *v8;

  if (a3 < 1)
  {
    v8 = 0;
  }
  else
  {
    v3 = *(_QWORD *)&a3;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_processesByPID = self->_lock_processesByPID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](lock_processesByPID, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
  }
  return v8;
}

uint64_t __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 32))
    a3 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3);
}

- (id)_reallyRegisterProcessForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id result;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    v11 = 0;
LABEL_8:

    return v11;
  }
  NSClassFromString(CFSTR("RBSProcessHandle"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v4, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[FBProcessManager processForPID:](self, "processForPID:", objc_msgSend(v6, "pid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v7, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[FBProcessManager _reallyRegisterProcessForHandle:](self, "_reallyRegisterProcessForHandle:", v9);

      }
    }
    -[FBProcessManager _bootstrapProcessWithHandle:synchronously:error:](self, "_bootstrapProcessWithHandle:synchronously:error:", v4, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBProcessManager _reallyRegisterProcessForHandle:].cold.1();
  objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)processesForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBProcessManager allProcesses](self, "allProcesses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)allProcesses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_lock_processesByPID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  return v7;
}

- (id)_bootstrapProcessWithHandle:(id)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *p_bootstrapLock;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSMutableSet *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  _BOOL4 v43;
  id *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  const __CFString *v52;
  uint8_t buf[4];
  _BYTE v54[18];
  uint64_t v55;
  const __CFString *v56;
  _BYTE v57[128];
  uint64_t v58;
  _QWORD v59[4];

  v6 = a4;
  v59[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("processHandle != ((void *)0)"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessManager _bootstrapProcessWithHandle:synchronously:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AE2C8);
  }
  v9 = v8;
  objc_msgSend(v8, "auditToken");
  v10 = BSVersionedPIDForAuditToken();
  if (v10 != -1)
  {
    v11 = v10;
    p_bootstrapLock = &self->_bootstrapLock;
    os_unfair_lock_lock(&self->_bootstrapLock);
    FBLogProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v54 = v9;
      _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "Asked to bootstrap a new process for handle: %{public}@", buf, 0xCu);
    }

    -[FBProcessManager processForVersionedPID:](self, "processForVersionedPID:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (id)v14;
      FBLogProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v54 = v15;
        _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "A process already exists for this handle: %{public}@", buf, 0xCu);
      }

      v17 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D68];
      v52 = CFSTR("A process already exists for this handle.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("FBProcessManager"), 2, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(p_bootstrapLock);
      if (!a5)
        goto LABEL_10;
    }
    else
    {
      v43 = v6;
      v44 = a5;
      objc_msgSend(v9, "identity");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v24 = self->_bootstrap_pendingProcesses;
      v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v48;
LABEL_19:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v48 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v28);
          v30 = objc_msgSend(v29, "versionedPID");
          if (v11 == v30)
            break;
          if (v30 == -1)
          {
            objc_msgSend(v29, "identity");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v45, "isEqual:", v31);

            if ((v32 & 1) != 0)
              break;
          }
          if (v26 == ++v28)
          {
            v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            if (v26)
              goto LABEL_19;
            goto LABEL_27;
          }
        }
        v15 = v29;

        if (!v15)
          goto LABEL_32;
        FBLogProcess();
        v33 = objc_claimAutoreleasedReturnValue();
        a5 = v44;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v54 = v15;
          _os_log_impl(&dword_1A359A000, v33, OS_LOG_TYPE_DEFAULT, "A pending process already exists for this handle: %{public}@", buf, 0xCu);
        }

        v34 = (void *)MEMORY[0x1E0CB35C8];
        v55 = *MEMORY[0x1E0CB2D68];
        v56 = CFSTR("A pending process already exists for this handle.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("FBProcessManager"), 2, v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        p_bootstrapLock = &self->_bootstrapLock;
        v36 = v43;
      }
      else
      {
LABEL_27:

LABEL_32:
        FBLogProcess();
        v37 = objc_claimAutoreleasedReturnValue();
        a5 = v44;
        v36 = v43;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = v43;
          *(_WORD *)&v54[4] = 2114;
          *(_QWORD *)&v54[6] = v9;
          _os_log_impl(&dword_1A359A000, v37, OS_LOG_TYPE_DEFAULT, "Creating process (sync=%{BOOL}u) for handle: %{public}@", buf, 0x12u);
        }

        +[FBProcess createProcessWithHandle:](FBProcess, "createProcessWithHandle:", v9);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](self->_bootstrap_pendingProcesses, "addObject:", v15);
        v19 = 0;
        p_bootstrapLock = &self->_bootstrapLock;
      }
      -[FBProcessManager _bootstrap_consumeLock_addProcess:synchronously:](self, "_bootstrap_consumeLock_addProcess:synchronously:", v15, v36);
      if (v36 && v11 != objc_msgSend(v15, "versionedPID"))
      {
        FBLogProcess();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromBSVersionedPID();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v54 = v39;
          *(_WORD *)&v54[8] = 2114;
          *(_QWORD *)&v54[10] = v15;
          _os_log_impl(&dword_1A359A000, v38, OS_LOG_TYPE_DEFAULT, "resolved process does not match handle %{public}@: %{public}@", buf, 0x16u);

        }
        v46 = 0;
        -[FBProcessManager _bootstrapProcessWithHandle:synchronously:error:](self, "_bootstrapProcessWithHandle:synchronously:error:", v9, 1, &v46);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v46;

        v15 = (id)v40;
        v19 = v41;
      }

      if (!a5)
        goto LABEL_10;
    }
    *a5 = objc_retainAutorelease(v19);
LABEL_10:
    os_unfair_lock_assert_not_owner(p_bootstrapLock);
    goto LABEL_15;
  }
  FBLogProcess();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[FBProcessManager _bootstrapProcessWithHandle:synchronously:error:].cold.2((uint64_t)v9, v20, v21);

  if (!a5)
  {
    v15 = 0;
    goto LABEL_16;
  }
  v22 = (void *)MEMORY[0x1E0CB35C8];
  v58 = *MEMORY[0x1E0CB2D68];
  v59[0] = CFSTR("Specified process is not valid.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("FBProcessManager"), 1, v19);
  v15 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

LABEL_16:
  return v15;
}

id __45__FBProcessManager_launchProcessWithContext___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_createProcessWithExecutionContext:error:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_bootstrapProcessWithExecutionContext:(id)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSMutableSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  id *v35;
  FBProcessManager *v36;
  _BOOL4 v37;
  _QWORD block[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  _BYTE v55[14];
  _BYTE v56[128];
  uint64_t v57;

  v6 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("executionContext != ((void *)0)"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessManager _bootstrapProcessWithExecutionContext:synchronously:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B01A0);
  }
  v9 = v8;
  v10 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v10, "completion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompletion:", 0);
  objc_msgSend(v10, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12 || !objc_msgSend(v12, "supportsLaunchingDirectly"))
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_3;
    v44[3] = &unk_1E4A12D88;
    v45 = v13;
    objc_msgSend(v19, "bs_errorWithDomain:code:configuration:", CFSTR("FBProcessManager"), 1, v44);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_11:
      if (v18)
        goto LABEL_12;
      v16 = 0;
      goto LABEL_38;
    }
LABEL_10:
    +[FBProcess calloutQueue](FBProcess, "calloutQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_5;
    block[3] = &unk_1E4A13090;
    v40 = v11;
    v18 = v18;
    v39 = v18;
    dispatch_async(v20, block);

    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_bootstrapLock);
  FBLogProcess();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v55 = v13;
    _os_log_impl(&dword_1A359A000, v14, OS_LOG_TYPE_DEFAULT, "Asked to bootstrap a new process with identity: %{public}@", buf, 0xCu);
  }

  -[FBProcessManager processForIdentity:](self, "processForIdentity:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (id)v15;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_2;
    v46[3] = &unk_1E4A12D88;
    v47 = v13;
    objc_msgSend(v17, "bs_errorWithDomain:code:configuration:", CFSTR("FBProcessManager"), 2, v46);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_bootstrapLock);

    if (!v11)
      goto LABEL_34;
    goto LABEL_32;
  }
  v37 = v6;
  v35 = a5;
  v36 = self;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v22 = self->_bootstrap_pendingProcesses;
  v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v51;
LABEL_19:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v26);
      objc_msgSend(v27, "identity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqual:", v13);

      if ((v29 & 1) != 0)
        break;
      if (v24 == ++v26)
      {
        v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v24)
          goto LABEL_19;
        goto LABEL_25;
      }
    }
    v16 = v27;

    if (!v16)
      goto LABEL_28;
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke;
    v48[3] = &unk_1E4A12D88;
    v49 = v13;
    objc_msgSend(v30, "bs_errorWithDomain:code:configuration:", CFSTR("FBProcessManager"), 2, v48);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    self = v36;
  }
  else
  {
LABEL_25:

LABEL_28:
    FBLogProcess();
    v31 = objc_claimAutoreleasedReturnValue();
    self = v36;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v55 = v37;
      *(_WORD *)&v55[4] = 2114;
      *(_QWORD *)&v55[6] = v13;
      _os_log_impl(&dword_1A359A000, v31, OS_LOG_TYPE_DEFAULT, "Creating process (sync=%{BOOL}u) with identity: %{public}@", buf, 0x12u);
    }

    +[FBProcess createProcessWithExecutionContext:](FBProcess, "createProcessWithExecutionContext:", v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v36->_bootstrap_pendingProcesses, "addObject:", v16);
    v18 = 0;
  }
  a5 = v35;
  -[FBProcessManager _bootstrap_consumeLock_addProcess:synchronously:](self, "_bootstrap_consumeLock_addProcess:synchronously:", v16, v37);
  if (v11)
  {
LABEL_32:
    if (v16)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_4;
      v41[3] = &unk_1E4A13FD0;
      v43 = v11;
      v42 = v18;
      objc_msgSend(v16, "_executeBlockAfterBootstrap:", v41);

      goto LABEL_34;
    }
    goto LABEL_10;
  }
LABEL_34:
  if (v18)
  {
    if (v16)
    {
      FBLogProcess();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v18, "localizedFailureReason");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v55 = v32;
        _os_log_impl(&dword_1A359A000, v21, OS_LOG_TYPE_DEFAULT, "Did not create a new process: %{public}@", buf, 0xCu);

      }
LABEL_15:

      goto LABEL_38;
    }
LABEL_12:
    FBLogProcess();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[FBProcessManager _bootstrapProcessWithExecutionContext:synchronously:error:].cold.2(v18, v21);
    v16 = 0;
    goto LABEL_15;
  }
LABEL_38:
  if (a5)
    *a5 = objc_retainAutorelease(v18);
  os_unfair_lock_assert_not_owner(&self->_bootstrapLock);

  return v16;
}

- (void)_bootstrap_consumeLock_addProcess:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  os_unfair_lock_s *p_bootstrapLock;
  NSObject *bootstrapQueue;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    p_bootstrapLock = &self->_bootstrapLock;
    os_unfair_lock_assert_owner(&self->_bootstrapLock);
    if (v4)
    {
      -[FBProcessManager _bootstrap_consumeLock_addProcess:](self, "_bootstrap_consumeLock_addProcess:", v7);
    }
    else
    {
      bootstrapQueue = self->_bootstrapQueue;
      v12 = v7;
      v10 = (void *)BSDispatchBlockCreateWithCurrentQualityOfService();
      dispatch_async(bootstrapQueue, v10);

      os_unfair_lock_unlock(p_bootstrapLock);
    }
    os_unfair_lock_assert_not_owner(p_bootstrapLock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessManager _bootstrap_consumeLock_addProcess:synchronously:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_bootstrap_consumeLock_addProcess:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    os_unfair_lock_assert_owner(&self->_bootstrapLock);
    if (-[NSMutableSet containsObject:](self->_bootstrap_bootstrappingProcesses, "containsObject:", v5))
    {
      os_unfair_lock_unlock(&self->_bootstrapLock);
      objc_msgSend(v5, "bootstrapLock:", 0);
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke;
      v6[3] = &unk_1E4A14020;
      v6[4] = self;
      v7 = v5;
      objc_msgSend(v7, "bootstrapLock:", v6);
      os_unfair_lock_assert_not_owner(&self->_bootstrapLock);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessManager _bootstrap_consumeLock_addProcess:].cold.1();
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)noteProcessDidLaunch:(id)a3
{
  objc_msgSend(a3, "bootstrapLock:", 0);
}

- (id)_createProcessWithExecutionContext:(id)a3 error:(id *)a4
{
  return -[FBProcessManager _bootstrapProcessWithExecutionContext:synchronously:error:](self, "_bootstrapProcessWithExecutionContext:synchronously:error:", a3, 1, a4);
}

void __58__FBProcessManager__notifyObserversUsingBlock_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
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
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 112), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(a1[5] + 16))(a1[5]);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = a1[6];
  if (v8)
    (*(void (**)(uint64_t))(v8 + 16))(v8);

}

void __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 128);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 80));
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "noteProcessPublished");
}

+ (id)sharedInstanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 0);
}

- (void)noteProcessAssertionStateDidChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  os_unfair_lock_s *p_lock;
  RBSAssertion **p_lock_assertion;
  RBSAssertion *lock_assertion;
  RBSAssertion *v14;
  NSObject *v15;
  void *v16;
  RBSAssertion *v17;
  void *v18;
  void **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  +[FBWorkspaceDomain sharedInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBWorkspaceDomain selfAssertRuntime]((_BOOL8)v4);

  if (!v5)
    return;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[FBProcessManager allProcesses](self, "allProcesses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v7)
  {
    LOBYTE(v8) = 0;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v8 = FBWorkspaceAssertionStateCombine(v8, objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "assertionState"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v7);

    if (v8)
    {
      if (FBWorkspaceAssertionStateIsForeground(v8))
        v7 = 5;
      else
        v7 = 2;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_assertion = self->_lock_assertion;
  p_lock_assertion = &self->_lock_assertion;
  if ((_DWORD)v7 == -[RBSAssertion fb_workspaceAssertionState](lock_assertion, "fb_workspaceAssertionState"))
  {
    v14 = 0;
  }
  else
  {
    FBLogProcess();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromFBWorkspaceAssertionState(v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_impl(&dword_1A359A000, v15, OS_LOG_TYPE_DEFAULT, "Updating self-assertion for unified workspace state: %{public}@", buf, 0xCu);

    }
    v14 = *p_lock_assertion;
    v17 = *p_lock_assertion;
    *p_lock_assertion = 0;

    if ((_DWORD)v7)
    {
      if (FBWorkspaceAssertionStateIsForeground(v7))
      {
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-ForegroundActive-NoSuspend"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v18;
        v19 = &v37;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("Workspace-BackgroundActive-NoSuspend"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v18;
        v19 = &v36;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromFBWorkspaceAssertionState(v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("FBProcessManager (%@)"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_alloc(MEMORY[0x1E0D87C98]);
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v25, "initWithExplanation:target:attributes:", v24, v26, v21);
      objc_storeStrong((id *)p_lock_assertion, v20);

      -[RBSAssertion fb_setWorkspaceAssertionState:](*p_lock_assertion, "fb_setWorkspaceAssertionState:", v7);
      os_unfair_lock_unlock(p_lock);
      if (v20)
      {
        v31 = 0;
        v27 = objc_msgSend(v20, "acquireWithError:", &v31);
        v28 = v31;
        if ((v27 & 1) == 0)
        {
          FBLogProcess();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[FBProcessManager noteProcessAssertionStateDidChange:].cold.1((uint64_t)v28, v29, v30);

        }
      }
      goto LABEL_30;
    }
  }
  os_unfair_lock_unlock(p_lock);
  v20 = 0;
LABEL_30:
  if (v14)
    -[RBSAssertion invalidate](v14, "invalidate");

}

void __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFailureDescription:", CFSTR("Ignoring execution context."));
  objc_msgSend(v3, "setFailureReason:", CFSTR("A pending process for %@ already exists."), *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setCodeDescription:", CFSTR("already-exists"));

}

uint64_t __68__FBProcessManager__bootstrap_consumeLock_addProcess_synchronously___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_bootstrap_consumeLock_addProcess:synchronously:", *(_QWORD *)(a1 + 40), 1);
}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[FBProcessManager defaultWatchdogPolicy](self, "defaultWatchdogPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "watchdogPolicyForProcess:eventContext:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (FBProcessWatchdogProviding)defaultWatchdogPolicy
{
  return (FBProcessWatchdogProviding *)objc_getProperty(self, a2, 72, 1);
}

void __50__FBProcessManager__sharedInstanceCreateIfNeeded___block_invoke(uint64_t a1)
{
  id v1;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  atomic_store((unint64_t)v1, &_sharedInstanceCreateIfNeeded____SharedManager);

}

- (FBProcessManager)init
{
  FBProcessManager *v2;
  void *v3;
  uint64_t v4;
  OS_dispatch_queue *bootstrapQueue;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *callOutQueue;
  uint64_t v10;
  NSMutableDictionary *lock_processesByPID;
  uint64_t v12;
  NSMutableDictionary *lock_processesByVersionedPID;
  uint64_t v14;
  NSMutableDictionary *lock_processesByIdentity;
  uint64_t v16;
  NSHashTable *lock_observers;
  uint64_t v18;
  NSMutableSet *bootstrap_pendingProcesses;
  uint64_t v20;
  NSMutableSet *bootstrap_bootstrappingProcesses;
  uint64_t v22;
  FBProcessWatchdogProviding *noDirectAccess_defaultWatchdogPolicy;
  uint64_t v24;
  FBProcess *currentProcess;
  FBProcess *v26;
  uint64_t v27;
  FBProcessManager *v28;
  FBProcess *v29;
  NSMutableDictionary *v30;
  void *v31;
  NSMutableDictionary *v32;
  FBProcess *v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  FBProcessManager *v39;
  uint64_t v40;
  RBSProcessMonitor *processMonitor;
  id v42;
  FBProcessManager *result;
  void *v44;
  FBProcessManager *v45;
  _QWORD v46[4];
  FBProcessManager *v47;
  _QWORD v48[4];
  FBProcessManager *v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)FBProcessManager;
  v2 = -[FBProcessManager init](&v50, sel_init);
  if (!v2)
    return v2;
  objc_msgSend(MEMORY[0x1E0D22FB0], "concurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BSDispatchQueueCreate();
  bootstrapQueue = v2->_bootstrapQueue;
  v2->_bootstrapQueue = (OS_dispatch_queue *)v4;

  objc_msgSend(MEMORY[0x1E0D22FB0], "serial");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceClass:", 33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BSDispatchQueueCreate();
  callOutQueue = v2->_callOutQueue;
  v2->_callOutQueue = (OS_dispatch_queue *)v8;

  v2->_lock._os_unfair_lock_opaque = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = objc_claimAutoreleasedReturnValue();
  lock_processesByPID = v2->_lock_processesByPID;
  v2->_lock_processesByPID = (NSMutableDictionary *)v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = objc_claimAutoreleasedReturnValue();
  lock_processesByVersionedPID = v2->_lock_processesByVersionedPID;
  v2->_lock_processesByVersionedPID = (NSMutableDictionary *)v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = objc_claimAutoreleasedReturnValue();
  lock_processesByIdentity = v2->_lock_processesByIdentity;
  v2->_lock_processesByIdentity = (NSMutableDictionary *)v14;

  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
  lock_observers = v2->_lock_observers;
  v2->_lock_observers = (NSHashTable *)v16;

  v2->_bootstrapLock._os_unfair_lock_opaque = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = objc_claimAutoreleasedReturnValue();
  bootstrap_pendingProcesses = v2->_bootstrap_pendingProcesses;
  v2->_bootstrap_pendingProcesses = (NSMutableSet *)v18;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = objc_claimAutoreleasedReturnValue();
  bootstrap_bootstrappingProcesses = v2->_bootstrap_bootstrappingProcesses;
  v2->_bootstrap_bootstrappingProcesses = (NSMutableSet *)v20;

  +[FBApplicationProcessWatchdogPolicy defaultPolicy](FBApplicationProcessWatchdogPolicy, "defaultPolicy");
  v22 = objc_claimAutoreleasedReturnValue();
  noDirectAccess_defaultWatchdogPolicy = v2->_noDirectAccess_defaultWatchdogPolicy;
  v2->_noDirectAccess_defaultWatchdogPolicy = (FBProcessWatchdogProviding *)v22;

  +[FBProcess createCurrentProcess](FBProcess, "createCurrentProcess");
  v24 = objc_claimAutoreleasedReturnValue();
  currentProcess = v2->_currentProcess;
  v2->_currentProcess = (FBProcess *)v24;

  v26 = v2->_currentProcess;
  v27 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __24__FBProcessManager_init__block_invoke;
  v48[3] = &unk_1E4A13F38;
  v28 = v2;
  v49 = v28;
  -[FBProcess bootstrapLock:](v26, "bootstrapLock:", v48);
  v29 = v2->_currentProcess;
  if (v29)
  {
    v30 = v2->_lock_processesByPID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v29, v31);

    v32 = v2->_lock_processesByVersionedPID;
    v33 = v2->_currentProcess;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[FBProcess versionedPID](v33, "versionedPID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v33, v34);

    v35 = v2->_lock_processesByIdentity;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v2->_currentProcess);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBProcess identity](v2->_currentProcess, "identity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v36, v37);

    v38 = (void *)MEMORY[0x1E0D87D90];
    v46[0] = v27;
    v46[1] = 3221225472;
    v46[2] = __24__FBProcessManager_init__block_invoke_18;
    v46[3] = &unk_1E4A13F88;
    v39 = v28;
    v47 = v39;
    objc_msgSend(v38, "monitorWithConfiguration:", v46);
    v40 = objc_claimAutoreleasedReturnValue();
    processMonitor = v39->_processMonitor;
    v39->_processMonitor = (RBSProcessMonitor *)v40;

    v45 = v39;
    v42 = (id)BSLogAddStateCaptureBlockWithTitle();

    return v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have a current process."));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBProcessManager init].cold.1();
  objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
  result = (FBProcessManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __24__FBProcessManager_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bootstrapWithDelegate:", *(_QWORD *)(a1 + 32));
}

void __24__FBProcessManager_init__block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D87DC0]);
  objc_msgSend(v4, "setValues:", 3);
  objc_msgSend(v3, "setServiceClass:", 25);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  +[FBWorkspaceDomain sharedInstance]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBWorkspaceDomain monitorAllSuspendableProcesses]((_BOOL8)v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingSuspendableProcesses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicates:", v8);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __24__FBProcessManager_init__block_invoke_2;
  v9[3] = &unk_1E4A13F60;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setUpdateHandler:", v9);

}

uint64_t __24__FBProcessManager_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "description");
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  FBProcessManager *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this object shouldn't go away"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("FBProcessManager.m");
    v16 = 1024;
    v17 = 138;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)currentProcess
{
  return self->_currentProcess;
}

- (FBApplicationProcess)systemApplicationProcess
{
  FBProcess *v3;

  if (-[FBProcess isApplicationProcess](self->_currentProcess, "isApplicationProcess"))
    v3 = self->_currentProcess;
  else
    v3 = 0;
  return (FBApplicationProcess *)v3;
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSHashTable containsObject:](self->_lock_observers, "containsObject:", v4))
    -[NSHashTable addObject:](self->_lock_observers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSHashTable containsObject:](self->_lock_observers, "containsObject:", v4))
    -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FBProcessManager allProcesses](self, "allProcesses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("processes"), 0);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

uint64_t __31__FBProcessManager_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "pid");
  v5 = objc_msgSend(v4, "pid");

  if ((int)a2 < v5)
    return -1;
  else
    return 1;
}

- (id)allApplicationProcesses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_lock_processesByPID, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isApplicationProcess"))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)applicationProcessForPID:(int)a3
{
  void *v3;
  id v4;

  -[FBProcessManager processForPID:](self, "processForPID:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isApplicationProcess"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)applicationProcessesForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBProcessManager allProcesses](self, "allProcesses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isApplicationProcess"))
        {
          objc_msgSend(v11, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_createProcessFutureForProcessHandle:(id)a3 error:(id *)a4
{
  return -[FBProcessManager _bootstrapProcessWithHandle:synchronously:error:](self, "_bootstrapProcessWithHandle:synchronously:error:", a3, 0, a4);
}

- (void)_noteShellInitializationComplete
{
  NSObject *callOutQueue;
  _QWORD block[5];

  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__FBProcessManager__noteShellInitializationComplete__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_async(callOutQueue, block);
}

void __52__FBProcessManager__noteShellInitializationComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "noteProcessPublished", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFailureDescription:", CFSTR("Ignoring execution context."));
  objc_msgSend(v3, "setFailureReason:", CFSTR("A process for %@ already exists."), *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setCodeDescription:", CFSTR("already-exists"));

}

void __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFailureDescription:", CFSTR("Ignoring execution context."));
  objc_msgSend(v3, "setFailureReason:", CFSTR("RunningBoard does not support directly launching %@"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setCodeDescription:", CFSTR("not-supported"));

}

uint64_t __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_86(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processManager:didAddProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPredicates:", *(_QWORD *)(a1 + 32));
}

- (void)_removeProcess:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *lock_processesByIdentity;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *lock_processesByPID;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *lock_processesByVersionedPID;
  void *v20;
  uint64_t v21;
  RBSProcessMonitor *processMonitor;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessManager _removeProcess:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F45D4);
  }
  v5 = v4;
  objc_msgSend(v4, "bootstrapLock:", &__block_literal_global_88);
  FBLogProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v5;
    _os_log_impl(&dword_1A359A000, v6, OS_LOG_TYPE_DEFAULT, "Removing: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_bootstrapLock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    lock_processesByIdentity = self->_lock_processesByIdentity;
    objc_msgSend(v5, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](lock_processesByIdentity, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "containsObject:", v5))
    {
      if (objc_msgSend(v10, "count") == 1)
        -[NSMutableDictionary removeObjectForKey:](self->_lock_processesByIdentity, "removeObjectForKey:", v7);
      else
        objc_msgSend(v10, "removeObject:", v5);
    }

  }
  v11 = objc_msgSend(v5, "pid");
  if ((int)v11 >= 1)
  {
    lock_processesByPID = self->_lock_processesByPID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lock_processesByPID, "removeObjectForKey:", v13);

  }
  +[FBWorkspaceDomain sharedInstance]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FBWorkspaceDomain monitorAllSuspendableProcesses]((_BOOL8)v14);

  if (v15)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v5, "processPredicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      && -[NSMutableSet containsObject:](self->_bootstrap_processPredicates, "containsObject:", v17))
    {
      -[NSMutableSet removeObject:](self->_bootstrap_processPredicates, "removeObject:", v17);
      -[NSMutableSet allObjects](self->_bootstrap_processPredicates, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  v18 = objc_msgSend(v5, "versionedPID");
  if (v18 != -1)
  {
    lock_processesByVersionedPID = self->_lock_processesByVersionedPID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lock_processesByVersionedPID, "removeObjectForKey:", v20);

  }
  os_unfair_lock_unlock(&self->_lock);
  v21 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    os_unfair_lock_lock(&self->_bootstrapPredicatesLock);
    os_unfair_lock_unlock(&self->_bootstrapLock);
    processMonitor = self->_processMonitor;
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __35__FBProcessManager__removeProcess___block_invoke_89;
    v27[3] = &unk_1E4A13F88;
    v28 = v16;
    -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v27);
    os_unfair_lock_unlock(&self->_bootstrapPredicatesLock);

  }
  else
  {
    os_unfair_lock_unlock(&self->_bootstrapLock);
  }
  v25[0] = v21;
  v25[1] = 3221225472;
  v25[2] = __35__FBProcessManager__removeProcess___block_invoke_2;
  v25[3] = &unk_1E4A13FF8;
  v25[4] = self;
  v26 = v5;
  v23 = v5;
  -[FBProcessManager _notifyObserversUsingBlock:completion:](self, "_notifyObserversUsingBlock:completion:", v25, 0);

}

uint64_t __35__FBProcessManager__removeProcess___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __35__FBProcessManager__removeProcess___block_invoke_89(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPredicates:", *(_QWORD *)(a1 + 32));
}

uint64_t __35__FBProcessManager__removeProcess___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processManager:didRemoveProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setDefaultWatchdogPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_assertion, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_processesByIdentity, 0);
  objc_storeStrong((id *)&self->_lock_processesByVersionedPID, 0);
  objc_storeStrong((id *)&self->_lock_processesByPID, 0);
  objc_storeStrong((id *)&self->_noDirectAccess_defaultWatchdogPolicy, 0);
  objc_storeStrong((id *)&self->_bootstrap_processPredicates, 0);
  objc_storeStrong((id *)&self->_bootstrap_bootstrappingProcesses, 0);
  objc_storeStrong((id *)&self->_bootstrap_pendingProcesses, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_bootstrapQueue, 0);
  objc_storeStrong((id *)&self->_currentProcess, 0);
}

- (void)init
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)processForVersionedPID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromBSVersionedPID();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_9_2(&dword_1A359A000, v1, v2, "Returning %{public}@, even though it does not match provided vpid %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_8_2();
}

- (void)registerProcessForAuditToken:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a2;
  v7 = 2114;
  v8 = v5;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "Unable to resolve process %d: %{public}@", (uint8_t *)v6, 0x12u);

  OUTLINED_FUNCTION_8_2();
}

- (void)registerProcessForAuditToken:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromBSVersionedPID();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_9_2(&dword_1A359A000, v1, v2, "Resolved %{public}@, even though it does not match provided audit token %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_8_2();
}

- (void)launchProcessWithContext:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)noteProcessAssertionStateDidChange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, a3, "Assertion acquisition failed: %{public}@", (uint8_t *)&v3);
}

- (void)_reallyRegisterProcessForHandle:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_bootstrapProcessWithExecutionContext:synchronously:error:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_bootstrapProcessWithExecutionContext:(void *)a1 synchronously:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedFailureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, v4, "Failed to create a new process: %{public}@", (uint8_t *)&v5);

}

- (void)_bootstrapProcessWithHandle:synchronously:error:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_bootstrapProcessWithHandle:(uint64_t)a1 synchronously:(NSObject *)a2 error:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, a3, "Not registering process %{public}@ with an invalid audit token.", (uint8_t *)&v3);
}

- (void)_bootstrap_consumeLock_addProcess:synchronously:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_bootstrap_consumeLock_addProcess:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_removeProcess:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
