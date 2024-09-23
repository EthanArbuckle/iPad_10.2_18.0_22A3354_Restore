@implementation FBLocalSynchronousSceneClientProvider

uint64_t __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "setPendingTransitionContext:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(v2 + 8))
    return objc_msgSend((id)v2, "_sendSceneCreateFBSWorkspaceDelegateForSceneInfo:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(v2 + 16), "containsObject:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *hostsByIdentity;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = (void *)MEMORY[0x1E0CB3978];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  if ((objc_msgSend(v10, "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider scene:didUpdateClientSettings:withDiff:transitionContext:]");
  hostsByIdentity = self->_hostsByIdentity;
  objc_msgSend(v17, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](hostsByIdentity, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientToken:didUpdateClientSettings:withDiff:transitionContext:", self, v13, v12, v11);

}

- (void)host:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  FBLocalSynchronousSceneClientProvider *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  FBLocalSynchronousSceneClientProvider *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider host:didUpdateSettings:withDiff:transitionContext:completion:]");
  objc_msgSend(v13, "definition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_localSceneInfoByIdentity, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "FBSScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Scene info for %@ was expected, but not found."), v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider host:didUpdateSettings:withDiff:transitionContext:completion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BAA34);
  }
  if ((objc_msgSend(v20, "hasHandledSceneCreate") & 1) != 0)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_85;
    v30[3] = &unk_1E4A13CD0;
    v31 = v17;
    objc_msgSend(v21, "updater:didUpdateSettings:withDiff:transitionContext:completion:", self, v14, v15, v16, v30);

  }
  else
  {
    objc_msgSend(v20, "setHasHandledSceneCreate:", 1);
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke;
    v32[3] = &unk_1E4A12CE8;
    v36 = &v37;
    v33 = v20;
    v34 = v16;
    v35 = self;
    objc_msgSend(v21, "_callOutQueue_didCreateWithTransitionContext:alternativeCreationCallout:completion:", v34, v32, 0);
    if (!*((_BYTE *)v38 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("creation callback was not made in scene's didCreate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v42 = v26;
        v43 = 2114;
        v44 = v28;
        v45 = 2048;
        v46 = self;
        v47 = 2114;
        v48 = CFSTR("FBLocalSynchronousSceneClientProvider.m");
        v49 = 1024;
        v50 = 196;
        v51 = 2114;
        v52 = v23;
        _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      v29 = _bs_set_crash_log_message();
      -[FBWorkspaceEventDispatcher registerTarget:].cold.2(v29);
    }

    _Block_object_dispose(&v37, 8);
    if (v17)
      (*((void (**)(id, uint64_t, _QWORD))v17 + 2))(v17, 1, 0);
  }

}

- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  void *v8;
  id v9;
  NSMutableDictionary *hostsByIdentity;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = a4;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider scene:didReceiveActions:forExtension:]");
  hostsByIdentity = self->_hostsByIdentity;
  objc_msgSend(v13, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](hostsByIdentity, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientToken:didReceiveActions:forExtension:", self, v9, a5);

}

- (FBLocalSynchronousSceneClientProvider)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBLocalSynchronousSceneClientProvider *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBLocalSynchronousSceneClientProvider *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[FBLocalSynchronousSceneClientProvider init] is unavailable."));
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
    v16 = CFSTR("FBLocalSynchronousSceneClientProvider.m");
    v17 = 1024;
    v18 = 53;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBLocalSynchronousSceneClientProvider *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_init
{
  FBLocalSynchronousSceneClientProvider *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingSceneCreatesBeforeFBSWorkspaceInitialization;
  uint64_t v5;
  NSMutableDictionary *localSceneInfoByIdentity;
  uint64_t v7;
  NSMutableDictionary *hostsByIdentity;
  uint64_t v9;
  FBSSerialQueue *callOutQueue;
  void *v11;
  _QWORD v13[4];
  FBLocalSynchronousSceneClientProvider *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FBLocalSynchronousSceneClientProvider;
  v2 = -[FBLocalSynchronousSceneClientProvider init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingSceneCreatesBeforeFBSWorkspaceInitialization = v2->_pendingSceneCreatesBeforeFBSWorkspaceInitialization;
    v2->_pendingSceneCreatesBeforeFBSWorkspaceInitialization = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    localSceneInfoByIdentity = v2->_localSceneInfoByIdentity;
    v2->_localSceneInfoByIdentity = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    hostsByIdentity = v2->_hostsByIdentity;
    v2->_hostsByIdentity = (NSMutableDictionary *)v7;

    v2->_workspaceInitialized = 0;
    objc_msgSend(MEMORY[0x1E0D23258], "mainDispatchQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (FBSSerialQueue *)v9;

    v11 = (void *)MEMORY[0x1E0D23298];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__FBLocalSynchronousSceneClientProvider__init__block_invoke;
    v13[3] = &unk_1E4A12C70;
    v14 = v2;
    objc_msgSend(v11, "_registerBlockForWorkspaceCreation:", v13);

  }
  return v2;
}

void __46__FBLocalSynchronousSceneClientProvider__init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  FBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "LocalSynchronousSceneClientProvider received workspace creation.", buf, 2u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider _init]_block_invoke");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v16 = v3;
  objc_msgSend(v3, "_registerSource:", *(_QWORD *)(a1 + 32));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
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
        FBLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "FBSScene");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "succinctDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v13;
          _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "LocalSynchronousSceneClientProvider sending scene create for: %{public}@", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "_sendSceneCreateFBSWorkspaceDelegateForSceneInfo:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = 0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_19);
  return (id)sharedInstance___instance_3;
}

void __55__FBLocalSynchronousSceneClientProvider_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[FBLocalSynchronousSceneClientProvider _init]([FBLocalSynchronousSceneClientProvider alloc], "_init");
  v1 = (void *)sharedInstance___instance_3;
  sharedInstance___instance_3 = (uint64_t)v0;

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
  FBLocalSynchronousSceneClientProvider *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBLocalSynchronousSceneClientProvider should not deallocate"));
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
    v15 = CFSTR("FBLocalSynchronousSceneClientProvider.m");
    v16 = 1024;
    v17 = 94;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)fbsSceneForScene:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBLocalSynchronousSceneClientProvider sceneWithIdentity:](self, "sceneWithIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fbsSceneWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_localSceneInfoByIdentity, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          -[NSMutableDictionary objectForKey:](self->_localSceneInfoByIdentity, "objectForKey:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "FBSScene");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)registerHost:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 fromRemnant:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _FBSystemAppSceneInfo *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("synchronous-local scenes cannot have remnants"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.15();
LABEL_63:
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F0F00);
  }
  objc_msgSend(v11, "identityToken");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("FBSSceneIdentityToken"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F0F64);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneIdentityTokenClass]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F0FC8);
  }

  objc_msgSend(v11, "definition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v16;
  NSClassFromString(CFSTR("FBSSceneIdentity"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F102CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1090);
  }

  objc_msgSend(v11, "specification");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F10F4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1158);
  }

  v19 = v12;
  NSClassFromString(CFSTR("FBSSceneSettings"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F11BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1220);
  }

  objc_msgSend(v18, "settingsClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("settings of an unexpected class"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.10();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1278);
  }
  v20 = v13;
  NSClassFromString(CFSTR("FBSSceneClientSettings"));
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F12DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1340);
  }

  objc_msgSend(v18, "clientSettingsClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("initialClientSettings of an unexpected class"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.8();
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1398);
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]");
  -[NSMutableDictionary objectForKey:](self->_localSceneInfoByIdentity, "objectForKey:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v42 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableDictionary objectForKey:](self->_localSceneInfoByIdentity, "objectForKey:", v17);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringWithFormat:", CFSTR("trying to register a local scene for an already known identifier : %@ -> previous=%@"), v17, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.7();
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1410);
  }
  -[NSMutableDictionary objectForKey:](self->_hostsByIdentity, "objectForKey:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableDictionary objectForKey:](self->_hostsByIdentity, "objectForKey:", v17);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("trying to register a local host for an already known identifier : %@ -> previous=%@"), v17, v46);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.6();
    goto LABEL_63;
  }
  -[NSMutableDictionary setObject:forKey:](self->_hostsByIdentity, "setObject:forKey:", v11, v17);
  objc_msgSend(MEMORY[0x1E0D23148], "parametersForSpecification:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSettings:", v19);
  objc_msgSend(v23, "setClientSettings:", v20);
  v24 = objc_alloc(MEMORY[0x1E0D231B0]);
  objc_msgSend(MEMORY[0x1E0D231E8], "localHandle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "_initWithUpdater:identityToken:identity:parameters:hostHandle:", self, v14, v17, v23, v25);

  v27 = objc_alloc_init(_FBSystemAppSceneInfo);
  -[_FBSystemAppSceneInfo setFBSScene:](v27, "setFBSScene:", v26);
  -[NSMutableDictionary setObject:forKey:](self->_localSceneInfoByIdentity, "setObject:forKey:", v27, v17);

  return self;
}

- (void)unregisterHost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider unregisterHost:]");
  -[NSMutableDictionary objectForKey:](self->_localSceneInfoByIdentity, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trying to unregister a local scene for an unknown identifier : %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider unregisterHost:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F15B8);
  }
  -[NSMutableDictionary objectForKey:](self->_hostsByIdentity, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trying to unregister a local host for a mismatched identifier : %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider unregisterHost:].cold.2();
    goto LABEL_11;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_localSceneInfoByIdentity, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_hostsByIdentity, "removeObjectForKey:", v5);

}

uint64_t __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_85(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)host:(id)a3 didInvalidateWithTransitionContext:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v21 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider host:didInvalidateWithTransitionContext:completion:]");
  objc_msgSend(v21, "definition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_localSceneInfoByIdentity, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "FBSScene");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have a scene for it to be invalidated."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider host:didInvalidateWithTransitionContext:completion:].cold.1();
    goto LABEL_16;
  }
  v14 = (void *)v13;
  if (self->_workspaceInitialized)
  {
    objc_msgSend(MEMORY[0x1E0D23298], "_sharedWorkspaceIfExists");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __92__FBLocalSynchronousSceneClientProvider_host_didInvalidateWithTransitionContext_completion___block_invoke;
      v22[3] = &unk_1E4A120D0;
      v23 = v14;
      v24 = v8;
      v25 = v16;
      v17 = v16;
      objc_msgSend(v17, "_calloutQueue_executeCalloutFromSource:withBlock:", self, v22);

      goto LABEL_8;
    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "identityToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("cannot note invalidation of %@ without a reference to the workspace"), v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBLocalSynchronousSceneClientProvider host:didInvalidateWithTransitionContext:completion:].cold.2();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F1830);
  }
  -[NSMutableArray removeObject:](self->_pendingSceneCreatesBeforeFBSWorkspaceInitialization, "removeObject:", v12);
  objc_msgSend(v14, "_callOutQueue_willDestroyWithTransitionContext:completion:", v8, 0);
LABEL_8:
  objc_msgSend(v14, "_callOutQueue_invalidate");
  if (v9)
    v9[2](v9, 1, 0);

}

void __92__FBLocalSynchronousSceneClientProvider_host_didInvalidateWithTransitionContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_willDestroyWithTransitionContext:completion:", *(_QWORD *)(a1 + 40), 0) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "workspace:willDestroyScene:withTransitionContext:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_94);

    }
  }
}

- (void)host:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8;
  NSMutableDictionary *localSceneInfoByIdentity;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider host:didReceiveActions:forExtension:]");
  localSceneInfoByIdentity = self->_localSceneInfoByIdentity;
  objc_msgSend(v14, "definition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](localSceneInfoByIdentity, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "FBSScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "updater:didReceiveActions:forExtension:", self, v8, a5);

}

- (id)callOutQueue
{
  return self->_callOutQueue;
}

- (id)hostProcess
{
  void *v2;
  void *v3;

  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canHaveAgent
{
  return 0;
}

- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (NSCopying)identifier
{
  return (NSCopying *)CFSTR("LocalSynchronousWorkspace");
}

- (id)scenes
{
  void *v3;
  NSMutableDictionary *localSceneInfoByIdentity;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localSceneInfoByIdentity = self->_localSceneInfoByIdentity;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__FBLocalSynchronousSceneClientProvider_scenes__block_invoke;
  v7[3] = &unk_1E4A13D38;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](localSceneInfoByIdentity, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __47__FBLocalSynchronousSceneClientProvider_scenes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)sceneWithIdentity:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_localSceneInfoByIdentity, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void (**)(id, _QWORD, void *))a5;
  FBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[FBLocalSynchronousSceneClientProvider sendActions:toWorkspaceID:completion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  if (v5)
  {
    FBSWorkspaceErrorCreate();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v14);

  }
}

- (id)createSceneFutureWithDefinition:(id)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void (**)(id, _QWORD, void *))a4;
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FBLocalSynchronousSceneClientProvider createSceneFutureWithDefinition:completion:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (v4)
  {
    FBSWorkspaceErrorCreate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v13);

  }
  return 0;
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void (**)(id, _QWORD, void *))a4;
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FBLocalSynchronousSceneClientProvider requestSceneWithOptions:completion:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (v4)
  {
    FBSWorkspaceErrorCreate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v13);

  }
}

- (void)_sendSceneCreateFBSWorkspaceDelegateForSceneInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a3;
  if ((objc_msgSend(v12, "hasSentFBSWorkspaceDelegateSceneCreate") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v12, "setHasSentFBSWorkspaceDelegateSceneCreate:", 1);
  objc_msgSend(v12, "FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23298], "_sharedWorkspaceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__FBLocalSynchronousSceneClientProvider__sendSceneCreateFBSWorkspaceDelegateForSceneInfo___block_invoke;
    v13[3] = &unk_1E4A11FD0;
    v14 = v5;
    v7 = v12;
    v15 = v7;
    v8 = v6;
    objc_msgSend(v8, "_calloutQueue_executeCalloutFromSource:withBlock:", self, v13);
    objc_msgSend(v7, "setPendingTransitionContext:", 0);

LABEL_4:
    return;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "identityToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("cannot note creation of %@ without a reference to the workspace"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBLocalSynchronousSceneClientProvider _sendSceneCreateFBSWorkspaceDelegateForSceneInfo:].cold.1();
  objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __90__FBLocalSynchronousSceneClientProvider__sendSceneCreateFBSWorkspaceDelegateForSceneInfo___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "FBSScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "pendingTransitionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workspace:didCreateScene:withTransitionContext:completion:", v4, v5, v6, &__block_literal_global_111);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_hostsByIdentity, 0);
  objc_storeStrong((id *)&self->_localSceneInfoByIdentity, 0);
  objc_storeStrong((id *)&self->_pendingSceneCreatesBeforeFBSWorkspaceInitialization, 0);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.1()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.2()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.3()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.4()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.5()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.6()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.7()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.8()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.10()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.15()
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

- (void)unregisterHost:.cold.1()
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

- (void)unregisterHost:.cold.2()
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

- (void)host:(const char *)a1 didUpdateSettings:withDiff:transitionContext:completion:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)host:didInvalidateWithTransitionContext:completion:.cold.1()
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

- (void)host:didInvalidateWithTransitionContext:completion:.cold.2()
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

- (void)sendActions:(uint64_t)a3 toWorkspaceID:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "sending workspace sync-local actions is not supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_5();
}

- (void)createSceneFutureWithDefinition:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "creating a sync-local client scene future is not supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_5();
}

- (void)requestSceneWithOptions:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "requesting a sync-local client scene is not supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_5();
}

- (void)_sendSceneCreateFBSWorkspaceDelegateForSceneInfo:.cold.1()
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
