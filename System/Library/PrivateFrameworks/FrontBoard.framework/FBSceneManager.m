@implementation FBSceneManager

- (id)sceneFromIdentityToken:(id)a3
{
  return -[FBSceneWorkspace sceneWithIdentityToken:](self->_workspace, "sceneWithIdentityToken:", a3);
}

- (id)_createSceneWithDefinition:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 transitionContext:(id)a6 fromRemnant:(id)a7 usingClientProvider:(id)a8 completion:(id)a9
{
  return -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self->_workspace, a3, a4, a5, a6, a7, a8, a9);
}

+ (void)synchronizeChanges:(id)a3
{
  id v4;
  uint64_t *v5;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace _synchronizeChanges:](v5[1], v4);

}

+ (FBSceneManager)sharedInstance
{
  if (sharedInstance___once_0 != -1)
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_18);
  return (FBSceneManager *)(id)sharedInstance___instance_2;
}

- (void)addObserver:(id)a3
{
  -[FBSceneWorkspace addWorkspaceObserver:]((uint64_t)self->_workspace, a3);
}

- (BOOL)_isSynchronizingSceneUpdates
{
  return -[FBSceneWorkspace _isSynchronizingSceneUpdates]((_BOOL8)self->_workspace);
}

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  id v5;
  id v6;
  id v7;
  id result;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__6;
    v17 = __Block_byref_object_dispose__6;
    v18 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__FBSceneManager_sceneFromIdentityTokenStringRepresentation___block_invoke;
    v10[3] = &unk_1E4A13C10;
    v6 = v5;
    v11 = v6;
    v12 = &v13;
    -[FBSceneManager enumerateScenesWithBlock:](self, "enumerateScenesWithBlock:", v10);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("tokenString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager sceneFromIdentityTokenStringRepresentation:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)sceneWithIdentifier:(id)a3
{
  return -[FBSceneWorkspace sceneWithIdentifier:](self->_workspace, "sceneWithIdentifier:", a3);
}

- (void)enumerateScenesWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FBSceneWorkspace allScenes](self->_workspace, "allScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __61__FBSceneManager_sceneFromIdentityTokenStringRepresentation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)newSceneIdentityTokenForIdentity:(id)a3
{
  FBSceneWorkspace *workspace;
  void *v4;
  void *v5;

  workspace = self->_workspace;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace sceneIdentityTokenForIdentifier:](workspace, "sceneIdentityTokenForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)keyboardScene
{
  BSDispatchQueueAssertMain();
  return (id)__fbKeyboardScene;
}

+ (id)observeKeyboardSceneAvailability:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id result;
  void *v13;

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    v5 = v4;
    BSDispatchQueueAssertMain();
    if (__fbKeyboardScene)
    {
      v5[2](v5);
      v6 = 0;
    }
    else
    {
      if (!__availabilityObserverMap)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 1);
        v8 = (void *)__availabilityObserverMap;
        __availabilityObserverMap = v7;

      }
      v9 = objc_alloc(MEMORY[0x1E0D23050]);
      v6 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("keyboardAvailableObserverToken"), CFSTR("observation"), MEMORY[0x1E0C80D38], &__block_literal_global_4);
      v10 = (void *)__availabilityObserverMap;
      v11 = (void *)MEMORY[0x1A8590C4C](v5);
      objc_msgSend(v10, "setObject:forKey:", v11, v6);

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneManager(Keyboard) observeKeyboardSceneAvailability:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (void)_clearKeyboardScene
{
  void *v2;

  v2 = (void *)__fbKeyboardScene;
  __fbKeyboardScene = 0;

}

+ (void)setKeyboardScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__fbKeyboardScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set a keyboard scene twice."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneManager(Keyboard) setKeyboardScene:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C9808);
  }
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("keyboardScene"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneManager(Keyboard) setKeyboardScene:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C986CLL);
  }
  BSDispatchQueueAssertMain();
  if (!__fbKeyboardScene)
  {
    objc_storeStrong((id *)&__fbKeyboardScene, a3);
    v7 = (void *)objc_msgSend((id)__availabilityObserverMap, "copy");
    objc_msgSend((id)__availabilityObserverMap, "removeAllObjects");
    v8 = (void *)__availabilityObserverMap;
    __availabilityObserverMap = 0;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v7, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v14[2](v14, __fbKeyboardScene);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
}

uint64_t __61__FBSceneManager_Keyboard__observeKeyboardSceneAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)__availabilityObserverMap, "removeObjectForKey:", a2);
}

void __32__FBSceneManager_sharedInstance__block_invoke()
{
  FBSceneManager *v0;
  void *v1;

  v0 = objc_alloc_init(FBSceneManager);
  v1 = (void *)sharedInstance___instance_2;
  sharedInstance___instance_2 = (uint64_t)v0;

}

- (FBSceneManager)init
{
  FBSceneManager *v2;
  FBSceneWorkspace *v3;
  FBSceneWorkspace *workspace;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBSceneManager;
  v2 = -[FBSceneManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (FBSceneWorkspace *)-[FBSceneWorkspace _initWithLegacySceneManager:]([FBSceneWorkspace alloc], v2);
    workspace = v2->_workspace;
    v2->_workspace = v3;

  }
  return v2;
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
  FBSceneManager *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSceneManager should not deallocate"));
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
    v15 = CFSTR("FBSceneManager.m");
    v16 = 1024;
    v17 = 46;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (FBSceneManagerDelegate)delegate
{
  return -[FBSceneWorkspace delegate](self->_workspace, "delegate");
}

- (void)setDelegate:(id)a3
{
  -[FBSceneWorkspace setDelegate:](self->_workspace, "setDelegate:", a3);
}

- (void)removeObserver:(id)a3
{
  -[FBSceneWorkspace removeWorkspaceObserver:]((uint64_t)self->_workspace, (uint64_t)a3);
}

- (void)add:(id)a3
{
  -[FBSceneWorkspace addWorkspaceObserver:]((uint64_t)self->_workspace, a3);
}

- (void)remove:(id)a3
{
  -[FBSceneWorkspace removeWorkspaceObserver:]((uint64_t)self->_workspace, (uint64_t)a3);
}

- (id)scenesPassingTest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__FBSceneManager_scenesPassingTest___block_invoke;
    v7[3] = &unk_1E4A13BE8;
    v9 = v4;
    v8 = v5;
    -[FBSceneManager enumerateScenesWithBlock:](self, "enumerateScenesWithBlock:", v7);

  }
  return v5;
}

void __36__FBSceneManager_scenesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)createSceneWithDefinition:(id)a3
{
  return -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self->_workspace, a3, 0, 0, 0, 0, 0, 0);
}

- (id)createSceneWithDefinition:(id)a3 initialParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "clientIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isLocal") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", v8),
        v9,
        v10))
  {
    +[FBLocalSynchronousSceneClientProvider sharedInstance](FBLocalSynchronousSceneClientProvider, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
LABEL_4:
      objc_msgSend(v7, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSceneManager _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:](self, "_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:", v6, v12, v13, 0, 0, v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  else
  {
    +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processForIdentity:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "workspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_4;
  }
  FBLogScene();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[FBSceneManager createSceneWithDefinition:initialParameters:].cold.1(v6, v8, v18);

  v14 = 0;
LABEL_9:

  return v14;
}

- (id)createSceneWithIdentifier:(id)a3 parameters:(id)a4 clientProvider:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager createSceneWithIdentifier:parameters:clientProvider:transitionContext:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35ED358);
  }
  v15 = v14;
  if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EE6CC128) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(FBSceneClientProvider)]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager createSceneWithIdentifier:parameters:clientProvider:transitionContext:].cold.1();
    goto LABEL_12;
  }

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v17 = (void *)MEMORY[0x1E0D231C0];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v15, "process");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identityForProcessIdentity:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D231C0], "localIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D23140], "definition");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIdentity:", v22);

  objc_msgSend(v21, "setClientIdentity:", v20);
  objc_msgSend(v11, "specification");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSpecification:", v23);

  objc_msgSend(v11, "settings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneManager _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:](self, "_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:", v21, v24, v25, v13, 0, v15, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)createSceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5
{
  return -[FBSceneWorkspace createSceneFromRemnant:withSettings:transitionContext:](self->_workspace, "createSceneFromRemnant:withSettings:transitionContext:", a3, a4, a5);
}

- (id)createLegacySceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  NSClassFromString(CFSTR("FBSceneRemnant"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager createLegacySceneFromRemnant:withSettings:transitionContext:].cold.1();
LABEL_18:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35ED570);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager createLegacySceneFromRemnant:withSettings:transitionContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35ED5D4);
  }

  if (objc_msgSend(v11, "_hasBeenInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot create a scene from an invalidated remnant"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager createLegacySceneFromRemnant:withSettings:transitionContext:].cold.2();
    goto LABEL_18;
  }
  objc_msgSend(v11, "_workspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
  objc_msgSend(v11, "_assertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isValid");

  if (!v14)
    goto LABEL_8;
  objc_msgSend(v11, "definition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_clientSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneManager _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:](self, "_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:", v15, v9, v16, v10, v11, v12, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "isValid") & 1) == 0)
  {

LABEL_8:
    v17 = 0;
  }

  return v17;
}

- (id)createSceneWithIdentifier:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 clientProvider:(id)a6 transitionContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id result;
  void *v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v15)
  {
    v17 = v16;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v19 = (void *)MEMORY[0x1E0D231C0];
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "process");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identityForProcessIdentity:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D231C0], "localIdentity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "fb_fallbackSpecification");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23140], "definition");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIdentity:", v25);

    objc_msgSend(v24, "setClientIdentity:", v22);
    objc_msgSend(v24, "setSpecification:", v23);
    -[FBSceneManager _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:](self, "_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:", v24, v13, v14, v17, 0, v15, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    return v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("clientProvider != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager createSceneWithIdentifier:settings:initialClientSettings:clientProvider:transitionContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)destroyScene:(id)a3 withTransitionContext:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneManager destroyScene:withTransitionContext:]");
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sceneIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager destroyScene:withTransitionContext:].cold.1();
    goto LABEL_13;
  }
  -[FBSceneManager sceneWithIdentifier:](self, "sceneWithIdentifier:");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    if (-[FBScene _isLegacy](v7))
    {
      objc_msgSend(v8, "deactivateWithTransitionContext:", v6);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[scene _isLegacy]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneManager destroyScene:withTransitionContext:].cold.2();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35ED940);
  }
LABEL_7:

}

- (BOOL)_suppressConnectionHandshakes
{
  return -[FBSceneWorkspace _suppressConnectionHandshakes]((_BOOL8)self->_workspace);
}

- (void)_setSuppressConnectionHandshakes:(BOOL)a3
{
  -[FBSceneWorkspace _setSuppressConnectionHandshakes:]((uint64_t)self->_workspace, a3);
}

- (id)description
{
  return -[FBSceneWorkspace description](self->_workspace, "description");
}

- (id)debugDescription
{
  return -[FBSceneWorkspace descriptionWithMultilinePrefix:](self->_workspace, "descriptionWithMultilinePrefix:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)sceneFromIdentityTokenStringRepresentation:(const char *)a1 .cold.1(const char *a1)
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

- (void)createSceneWithDefinition:(NSObject *)a3 initialParameters:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "processIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "scene %{public}@ cannot be created because there is no running process for %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)createSceneWithIdentifier:parameters:clientProvider:transitionContext:.cold.1()
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

- (void)createLegacySceneFromRemnant:withSettings:transitionContext:.cold.1()
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

- (void)createLegacySceneFromRemnant:withSettings:transitionContext:.cold.2()
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

- (void)createSceneWithIdentifier:settings:initialClientSettings:clientProvider:transitionContext:.cold.1()
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

- (void)destroyScene:withTransitionContext:.cold.1()
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

- (void)destroyScene:withTransitionContext:.cold.2()
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
