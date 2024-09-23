@implementation FBWorkspaceEventDispatcher

void __67__FBWorkspaceEventDispatcher_noteHandshakeFromSource_withRemnants___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 16);
  v2 = (void *)*((_QWORD *)a1[4] + 3);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1[5], "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "rbs_pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];

  if (v6 == v7)
  {
    objc_msgSend(a1[5], "noteHandshakeWithRemnants:", a1[6]);
    NSAllMapTableValues(*((NSMapTable **)a1[4] + 4));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 16);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v16;
    v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v10);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v22 = (void *)*((_QWORD *)a1[4] + 5);
          objc_msgSend(v21, "workspaceIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = objc_msgSend(v22, "containsObject:", v23);

          if ((v22 & 1) == 0)
            objc_msgSend(a1[4], "_mainThread_dispatchHandshakeFromSource:toTarget:", a1[5], v21);
        }
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v18);
    }

  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 16);
    FBLogProcessWorkspace();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "processHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67240192;
      v34 = objc_msgSend(v9, "rbs_pid");
      _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring invalid source registration for %{public}i", buf, 8u);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = a1[6];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "invalidate", (_QWORD)v24);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v12);
    }
  }

}

- (void)_mainThread_dispatchHandshakeFromSource:(id)a3 toTarget:(id)a4
{
  id v5;
  id v6;
  void *v7;
  FBSceneClientHandshake *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  v5 = a4;
  BSDispatchQueueAssertMain();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__FBWorkspaceEventDispatcher__mainThread_dispatchHandshakeFromSource_toTarget___block_invoke;
  v12[3] = &unk_1E4A12230;
  v6 = v5;
  v13 = v6;
  objc_msgSend(v11, "consumeRemnantsPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [FBSceneClientHandshake alloc];
    objc_msgSend(v11, "processHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FBSceneClientHandshake _initWithHandle:remnants:](v8, "_initWithHandle:remnants:", v9, v7);
    objc_msgSend(v6, "didReceiveHandshake:", v10);

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_0);
  return (id)sharedInstance___sharedInstance_0;
}

- (void)noteHandshakeFromSource:(id)a3 withRemnants:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("FBWorkspaceEventDispatcherSource"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD0CCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceEventDispatcherSourceClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD130);
  }

  v9 = v7;
  NSClassFromString(CFSTR("NSSet"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:].cold.2();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD194);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSSetClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD1F8);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v14);
        NSClassFromString(CFSTR("FBSceneRemnant"));
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:].cold.3();
          objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35BD004);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:].cold.3();
          objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35BD068);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__FBWorkspaceEventDispatcher_noteHandshakeFromSource_withRemnants___block_invoke;
  block[3] = &unk_1E4A120D0;
  block[4] = self;
  v25 = v8;
  v26 = v10;
  v16 = v10;
  v17 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)registerSourceWithProcessHandle:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableDictionary *lock_restartAssertionsByPidNumber;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t *v36;
  SEL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  FBWorkspaceEventDispatcher *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("RBSProcessHandle"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher registerSourceWithProcessHandle:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD5B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher registerSourceWithProcessHandle:].cold.4();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD61CLL);
  }

  v6 = objc_msgSend(v5, "pid");
  if ((int)v6 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid for %@"), v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher registerSourceWithProcessHandle:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD678);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v8 = objc_alloc(MEMORY[0x1E0D23050]);
  objc_msgSend(v5, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke;
  v33[3] = &unk_1E4A121E0;
  v33[4] = self;
  v10 = v7;
  v34 = v10;
  v36 = &v38;
  v37 = a2;
  v11 = v5;
  v35 = v11;
  v12 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.frontboard.workspace-events.registration"), v9, v33);

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_restartAssertionsByPidNumber, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_lock_restartAssertionsByPidNumber, "removeObjectForKey:", v10);
    if (!-[NSMutableDictionary count](self->_lock_restartAssertionsByPidNumber, "count"))
    {
      lock_restartAssertionsByPidNumber = self->_lock_restartAssertionsByPidNumber;
      self->_lock_restartAssertionsByPidNumber = 0;

    }
  }
  -[NSMutableDictionary objectForKey:](self->_lock_sourcesByPidNumber, "objectForKey:", v10);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already have a source registered for %@: %@"), v10, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C81028];
    v28 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v45 = v29;
      v46 = 2114;
      v47 = v31;
      v48 = 2048;
      v49 = self;
      v50 = 2114;
      v51 = CFSTR("FBWorkspaceEventDispatcher.m");
      v52 = 1024;
      v53 = 250;
      v54 = 2114;
      v55 = v26;
      _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    v32 = _bs_set_crash_log_message();
    -[FBWorkspaceEventDispatcher registerTarget:].cold.2(v32);
  }
  v16 = -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:]([FBWorkspaceEventDispatcherSource alloc], "_initWithProcessHandle:underlyingAssertion:", v11, v12);
  v17 = (void *)v39[5];
  v39[5] = (uint64_t)v16;

  -[NSMutableDictionary setObject:forKey:](self->_lock_sourcesByPidNumber, "setObject:forKey:", v39[5], v10);
  FBLogProcessWorkspace();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)v39[5];
    *(_DWORD *)buf = 138543618;
    v45 = v10;
    v46 = 2114;
    v47 = v19;
    _os_log_impl(&dword_1A359A000, v18, OS_LOG_TYPE_DEFAULT, "Registering Source for %{public}@ : %{public}@", buf, 0x16u);
  }

  v20 = objc_msgSend(v10, "rbs_pid");
  if (v20 != getpid()
    && -[FBMutableWorkspaceConnectionsState addProcessIdentifier:](self->_lock_mutableState, "addProcessIdentifier:", v10))
  {
    -[FBWorkspaceConnectionsStateStore setState:](self->_store, "setState:", self->_lock_mutableState);
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v13, "invalidate");
  v21 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  return v21;
}

- (id)_initWithConnectionStore:(id)a3 preregisteredWorkspaces:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  FBWorkspaceEventDispatcher *v17;
  FBWorkspaceEventDispatcher *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *preregisteredWorkspaces;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMapTable *lock_targetsByIdentifier;
  uint64_t v26;
  NSCountedSet *main_incompleteTargetRegistrations;
  uint64_t v28;
  NSMutableDictionary *lock_sourcesByPidNumber;
  uint64_t v30;
  FBMutableWorkspaceConnectionsState *lock_mutableState;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSMutableDictionary *lock_restartAssertionsByPidNumber;
  uint64_t v44;
  NSMutableDictionary *v45;
  NSObject *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  os_unfair_lock_s *lock;
  id v55;
  void *v56;
  uint64_t v57;
  FBWorkspaceEventDispatcher *v58;
  id obj;
  FBWorkspaceEventDispatcher *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  FBWorkspaceEventDispatcher *v68;
  objc_super v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("FBWorkspaceConnectionsStateStore"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:].cold.1();
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C31B4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceConnectionsStateStoreClass]"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:].cold.1();
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C3218);
  }

  v10 = v8;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:].cold.2();
    objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C327CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:].cold.2();
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C32E0);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v56 = v10;
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v71 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v70 + 1) + 8 * i);
        NSClassFromString(CFSTR("FBWorkspaceRegistration"));
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:].cold.3();
          objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35C30ECLL);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceRegistrationClass]"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:].cold.3();
          objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35C3150);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v13);
  }

  v69.receiver = self;
  v69.super_class = (Class)FBWorkspaceEventDispatcher;
  v17 = -[FBWorkspaceEventDispatcher init](&v69, sel_init);
  v18 = v17;
  v19 = v56;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_store, a3);
    v20 = objc_msgSend(v56, "copy");
    preregisteredWorkspaces = v18->_preregisteredWorkspaces;
    v18->_preregisteredWorkspaces = (NSDictionary *)v20;

    -[FBWorkspaceConnectionsStateStore state](v18->_store, "state");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "processIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0x10000, 517);
    v24 = objc_claimAutoreleasedReturnValue();
    lock_targetsByIdentifier = v18->_lock_targetsByIdentifier;
    v18->_lock_targetsByIdentifier = (NSMapTable *)v24;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v26 = objc_claimAutoreleasedReturnValue();
    main_incompleteTargetRegistrations = v18->_main_incompleteTargetRegistrations;
    v18->_main_incompleteTargetRegistrations = (NSCountedSet *)v26;

    v18->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    lock_sourcesByPidNumber = v18->_lock_sourcesByPidNumber;
    v18->_lock_sourcesByPidNumber = (NSMutableDictionary *)v28;

    v30 = objc_opt_new();
    lock_mutableState = v18->_lock_mutableState;
    v18->_lock_mutableState = (FBMutableWorkspaceConnectionsState *)v30;

    v57 = objc_msgSend(v23, "count");
    if (v57)
    {
      v55 = v9;
      lock = &v18->_lock;
      os_unfair_lock_lock(&v18->_lock);
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke;
      v67[3] = &unk_1E4A12140;
      v58 = v18;
      v60 = v18;
      v68 = v60;
      v61 = (void *)objc_msgSend(v67, "copy");
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = v23;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v64;
        do
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v64 != v34)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v35);
            v37 = objc_alloc(MEMORY[0x1E0D87C98]);
            objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", objc_msgSend(v36, "rbs_pid"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("AfterLife-Interrupted"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v39;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)objc_msgSend(v37, "initWithExplanation:target:attributes:", CFSTR("com.apple.frontboard.workspace.reconnect"), v38, v40);

            objc_msgSend(v41, "setInvalidationHandler:", v61);
            v62 = 0;
            LODWORD(v39) = objc_msgSend(v41, "acquireWithError:", &v62);
            v42 = v62;
            if ((_DWORD)v39)
            {
              lock_restartAssertionsByPidNumber = v60->_lock_restartAssertionsByPidNumber;
              if (!lock_restartAssertionsByPidNumber)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v57);
                v44 = objc_claimAutoreleasedReturnValue();
                v45 = v60->_lock_restartAssertionsByPidNumber;
                v60->_lock_restartAssertionsByPidNumber = (NSMutableDictionary *)v44;

                lock_restartAssertionsByPidNumber = v60->_lock_restartAssertionsByPidNumber;
              }
              -[NSMutableDictionary setObject:forKey:](lock_restartAssertionsByPidNumber, "setObject:forKey:", v41, v36);
              -[FBMutableWorkspaceConnectionsState addProcessIdentifier:](v58->_lock_mutableState, "addProcessIdentifier:", v36);
            }
            else
            {
              FBLogProcessWorkspace();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v75 = v36;
                v76 = 2112;
                v77 = v42;
                _os_log_error_impl(&dword_1A359A000, v46, OS_LOG_TYPE_ERROR, "failed to acquire restart assertion on %@ : %@", buf, 0x16u);
              }

              objc_msgSend(v41, "invalidate");
            }

            ++v35;
          }
          while (v33 != v35);
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
        }
        while (v33);
      }

      v18 = v58;
      -[FBWorkspaceConnectionsStateStore setState:](v58->_store, "setState:", v58->_lock_mutableState);
      os_unfair_lock_unlock(lock);

      v9 = v55;
      v19 = v56;
    }

  }
  return v18;
}

void __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke_2;
  v41[3] = &unk_1E4A12118;
  v5 = v3;
  v42 = v5;
  objc_msgSend(v4, "keysOfEntriesPassingTest:", v41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v9);
    }

    v12 = objc_opt_new();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 56);
    *(_QWORD *)(v13 + 56) = v12;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          v21 = objc_msgSend(v20, "rbs_pid");
          if (v21 != getpid())
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addProcessIdentifier:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      }
      while (v17);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addProcessIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k), (_QWORD)v29);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v24);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count", (_QWORD)v29))
  {
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(v27 + 48);
    *(_QWORD *)(v27 + 48) = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));

}

BOOL __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(a1 + 32) == a3;
}

- (void)_flushCalloutsWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__FBWorkspaceEventDispatcher__flushCalloutsWithCompletion___block_invoke;
    block[3] = &unk_1E4A12168;
    v7 = v3;
    v4 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher _flushCalloutsWithCompletion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __59__FBWorkspaceEventDispatcher__flushCalloutsWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (FBWorkspaceEventDispatcher)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBWorkspaceEventDispatcher *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBWorkspaceEventDispatcher *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on FBWorkspaceEventDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBWorkspaceEventDispatcher.m");
    v17 = 1024;
    v18 = 127;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBWorkspaceEventDispatcher *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __44__FBWorkspaceEventDispatcher_sharedInstance__block_invoke()
{
  FBWorkspaceConnectionsStateStore *v0;
  void *v1;
  id v2;
  FBWorkspaceEventDispatcher *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[FBWorkspaceDomain sharedInstance]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [FBWorkspaceConnectionsStateStore alloc];
  -[FBWorkspaceDomain machName]((uint64_t)v7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[FBWorkspaceConnectionsStateStore _initWithIdentifier:](v0, "_initWithIdentifier:", v1);

  v3 = [FBWorkspaceEventDispatcher alloc];
  -[FBWorkspaceDomain preregisteredWorkspaces]((uint64_t)v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:](v3, "_initWithConnectionStore:preregisteredWorkspaces:", v2, v4);
  v6 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = v5;

}

- (id)registerTarget:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28[2];
  id location;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  FBWorkspaceEventDispatcher *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("target"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher registerTarget:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C3B88);
  }
  objc_msgSend(v5, "workspaceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);
  v7 = objc_alloc(MEMORY[0x1E0D23050]);
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke;
  v26[3] = &unk_1E4A12190;
  objc_copyWeak(v28, &location);
  v26[4] = self;
  v9 = v6;
  v27 = v9;
  v28[1] = (id)a2;
  v10 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.frontboard.workspace-events.registration.target"), v9, v26);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_targetsByIdentifier, "objectForKey:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already have a target registered for %@: %@"), v9, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v19;
      v32 = 2114;
      v33 = v21;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("FBWorkspaceEventDispatcher.m");
      v38 = 1024;
      v39 = 170;
      v40 = 2114;
      v41 = v16;
      _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    v22 = _bs_set_crash_log_message();
    -[FBWorkspaceEventDispatcher registerTarget:].cold.2(v22);
  }
  -[NSMapTable setObject:forKey:](self->_lock_targetsByIdentifier, "setObject:forKey:", v5, v9);
  FBLogProcessWorkspace();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = v9;
    v32 = 2114;
    v33 = v5;
    _os_log_impl(&dword_1A359A000, v12, OS_LOG_TYPE_DEFAULT, "Registering Target for %{public}@: %{public}@", buf, 0x16u);
  }

  os_unfair_lock_unlock(&self->_lock);
  -[NSCountedSet addObject:](self->_main_incompleteTargetRegistrations, "addObject:", v9);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_51;
  block[3] = &unk_1E4A121B8;
  objc_copyWeak(&v25, &location);
  block[4] = self;
  v24 = v9;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

  return v10;
}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("target for %@ dealloced before invalidation"), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C3E5CLL);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != WeakRetained)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("target mismatch for %@ : actual=%p expected=%p"), v10, v11, WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_2();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C3EDCLL);
  }
  FBLogProcessWorkspace();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A359A000, v6, OS_LOG_TYPE_DEFAULT, "Removing target registration for workspaceIdentifier: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));

}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_51(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  if (WeakRetained
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40)),
        v3 = (id)objc_claimAutoreleasedReturnValue(),
        v3,
        v3 == WeakRetained))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "_mainThread_dispatchHandshakeFromSource:toTarget:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10++), WeakRetained);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(a1 + 32), "_mainThread_dispatchSceneRequestsFromSource:toTarget:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), WeakRetained, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

void __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  os_unfair_lock_s **v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_unfair_lock_s **)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);

  if (v5 != v6)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = a1[5];
    objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("source mismatch for %@ : actual=%p expected=%p"), v25, v26, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C4410);
  }
  FBLogProcessWorkspace();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[6];
    *(_DWORD *)buf = 138543362;
    v39 = v8;
    _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "Removing source registration for processHandle: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", a1[5]);
  v9 = objc_opt_new();
  v10 = a1[4];
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v9;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = *(id *)(a1[4] + 24);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "rbs_pid");
        if (v18 != getpid())
          objc_msgSend(*(id *)&(*v4)[14]._os_unfair_lock_opaque, "addProcessIdentifier:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v14);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = *(id *)&(*v4)[12]._os_unfair_lock_opaque;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)&(*v4)[14]._os_unfair_lock_opaque, "addProcessIdentifier:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  objc_msgSend(*(id *)&(*v4)[2]._os_unfair_lock_opaque, "setState:", *(_QWORD *)&(*v4)[14]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(*v4 + 16);

}

- (BOOL)handleSceneRequest:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("FBWorkspaceSceneRequest"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C45F0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceSceneRequestClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C4654);
  }

  v9 = v7;
  NSClassFromString(CFSTR("FBWorkspaceEventDispatcherSource"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:].cold.2();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C46B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceEventDispatcherSourceClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:].cold.2();
    goto LABEL_22;
  }

  objc_msgSend(v8, "targetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_preregisteredWorkspaces, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (v11 || (objc_msgSend(v8, "requiresTargetPreregistration") & 1) == 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FBWorkspaceEventDispatcher_handleSceneRequest_fromSource___block_invoke;
    block[3] = &unk_1E4A12208;
    block[4] = self;
    v18 = v9;
    v19 = v10;
    v21 = v11 != 0;
    v20 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __60__FBWorkspaceEventDispatcher_handleSceneRequest_fromSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "rbs_pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);

  v8 = *(_QWORD *)(a1 + 32);
  if (v6 != v7)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 64));
    FBLogProcessWorkspace();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "processHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67240192;
      LODWORD(v23) = objc_msgSend(v10, "rbs_pid");
      _os_log_impl(&dword_1A359A000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring scene request from invalid source registration for %{public}i", buf, 8u);

    }
    v11 = *(void **)(a1 + 56);
    FBSWorkspaceErrorCreate();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateWithError:", v12);

LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(v8 + 32), "objectForKey:", *(_QWORD *)(a1 + 48));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!*(_BYTE *)(a1 + 64) && !v13)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 40), "enqueueSceneRequest:", *(_QWORD *)(a1 + 56));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  if (!v14)
  {
LABEL_11:
    if (!*(_BYTE *)(a1 + 64))
    {
      FBLogProcessWorkspace();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v23 = v18;
        _os_log_impl(&dword_1A359A000, v17, OS_LOG_TYPE_DEFAULT, "Denying scene request because target workspace \"%{public}@\" does not exist", buf, 0xCu);
      }

      v19 = *(void **)(a1 + 56);
      v21 = *(_QWORD *)(a1 + 48);
      FBSWorkspaceErrorCreate();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "invalidateWithError:", v20, v21);

    }
    goto LABEL_15;
  }
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v14, "workspaceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v15, "containsObject:", v16);

  if ((v15 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_mainThread_dispatchSceneRequestsFromSource:toTarget:", *(_QWORD *)(a1 + 40), v14);
LABEL_16:

}

uint64_t __79__FBWorkspaceEventDispatcher__mainThread_dispatchHandshakeFromSource_toTarget___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalWorkspaceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workspaceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (void)_mainThread_dispatchSceneRequestsFromSource:(id)a3 toTarget:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  BSDispatchQueueAssertMain();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "workspaceIdentifier", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueSceneRequestsForTargetIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(v5, "processHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "didReceiveSceneRequest:fromHandle:", v13, v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_mutableState, 0);
  objc_storeStrong((id *)&self->_lock_restartAssertionsByPidNumber, 0);
  objc_storeStrong((id *)&self->_main_incompleteTargetRegistrations, 0);
  objc_storeStrong((id *)&self->_lock_targetsByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_sourcesByPidNumber, 0);
  objc_storeStrong((id *)&self->_preregisteredWorkspaces, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)_initWithConnectionStore:preregisteredWorkspaces:.cold.1()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithConnectionStore:preregisteredWorkspaces:.cold.2()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithConnectionStore:preregisteredWorkspaces:.cold.3()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_flushCalloutsWithCompletion:.cold.1()
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

- (void)registerTarget:.cold.1()
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

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v1 + 56));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v1 + 56));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)registerSourceWithProcessHandle:.cold.1()
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

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)registerSourceWithProcessHandle:.cold.2()
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

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)registerSourceWithProcessHandle:.cold.4()
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

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v1 + 64));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)noteHandshakeFromSource:withRemnants:.cold.1()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)noteHandshakeFromSource:withRemnants:.cold.2()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)noteHandshakeFromSource:withRemnants:.cold.3()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)handleSceneRequest:fromSource:.cold.1()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)handleSceneRequest:fromSource:.cold.2()
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
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
