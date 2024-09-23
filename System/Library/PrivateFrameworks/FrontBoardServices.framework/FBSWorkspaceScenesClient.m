@implementation FBSWorkspaceScenesClient

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *queue;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v16, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke;
    block[3] = &unk_1E38ECB68;
    block[4] = self;
    v18 = v13;
    v19 = v16;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    dispatch_sync(queue, block);

  }
}

void __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    FBLogSceneClient();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2_cold_1(a1, (uint64_t)v3);

  }
}

- (id)scenes
{
  os_unfair_lock_s *p_reportingLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  p_reportingLock = &self->_reportingLock;
  os_unfair_lock_lock(&self->_reportingLock);
  v4 = -[NSMutableDictionary count](self->_reportingLock_scenesByIdentity, "count");
  v5 = (void *)MEMORY[0x1E0C99E60];
  if (v4)
  {
    -[NSMutableDictionary allValues](self->_reportingLock_scenesByIdentity, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_reportingLock);
  return v7;
}

void __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_3;
  v6[3] = &unk_1E38ECD48;
  v6[4] = v2;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v1, "updater:didUpdateSettings:withDiff:transitionContext:completion:", v2, v3, v4, v5, v6);

}

uint64_t __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "activeMessageBatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commitWithReason:", CFSTR("update-completion"));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "definition");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "specification");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_isSignificantTransitionContext:", *(_QWORD *)(a1 + 72));

      if (!v6)
        return;
      FBLogSceneClient();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v16 = v8;
        _os_log_impl(&dword_19A6D4000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dropping transition context because the scene is reconnecting", buf, 0xCu);
      }
    }
    else
    {
      -[FBSWorkspaceScenesClient _remoteTarget](*(os_unfair_lock_s **)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 64);
      v11 = *(_QWORD *)(a1 + 72);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2;
      v13[3] = &unk_1E38ECB40;
      v14 = v10;
      objc_msgSend(v9, "sceneID:didUpdateClientSettingsWithDiff:transitionContext:completion:", v14, v12, v11, v13);

      v7 = v14;
    }

  }
}

- (id)_remoteTarget
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 28;
    os_unfair_lock_lock(a1 + 28);
    v1 = (id *)v1[12];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void __92__FBSWorkspaceScenesClient_createSceneWithIdentity_parameters_transitionContext_completion___block_invoke(uint64_t a1)
{
  -[FBSWorkspaceScenesClient _callOutQueue_sendDidCreateForScene:transitionContext:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)createSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  FBSSerialQueue *callOutQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a5;
  v11 = a6;
  -[FBSWorkspaceScenesClient _createSceneWithIdentity:parameters:]((uint64_t)self, a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__FBSWorkspaceScenesClient_createSceneWithIdentity_parameters_transitionContext_completion___block_invoke;
  v17[3] = &unk_1E38ECAA0;
  v17[4] = self;
  v18 = v12;
  v19 = v10;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v17);

}

void __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  if (v2
    && (v3 = *(_QWORD *)(a1 + 40),
        objc_msgSend(*(id *)(a1 + 32), "identity"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](v3, v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v2 == v5))
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:](v7, v8, *(void **)(a1 + 32));

    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_2;
    v14[3] = &unk_1E38ECCF8;
    v12 = v9;
    v13 = *(_QWORD *)(a1 + 40);
    v15 = v12;
    v16 = v13;
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 72);
    objc_msgSend(v11, "_calloutQueue_executeCalloutFromSource:withBlock:", v10, v14);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 72);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

- (void)_configureReceivedActions:(void *)a3 forScene:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "setScene:", v6);
            objc_msgSend(v11, "setCallOutQueue:", *(_QWORD *)(a1 + 32));
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }

}

- (id)_reportedSceneWithIdentity:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 116));
    objc_msgSend(*(id *)(a1 + 104), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 116));
  }

  return v5;
}

- (BOOL)canHaveAgent
{
  return 1;
}

- (id)callOutQueue
{
  return self->_callOutQueue;
}

- (void)sceneID:(id)a3 updateWithSettingsDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[FBSWorkspaceScenesClient _queue_connectedSceneWithIdentity:]((id *)&self->super.isa, (uint64_t)a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSWorkspaceScenesClient _queue_updateScene:withSettings:diff:transitionContext:completion:]((uint64_t)self, v13, 0, v12, v11, v10);

}

- (void)_queue_updateScene:(void *)a3 withSettings:(void *)a4 diff:(void *)a5 transitionContext:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke;
    v17[3] = &unk_1E38ECCF8;
    v18 = v11;
    v19 = a1;
    v20 = v14;
    v21 = v12;
    v22 = v13;
    v23 = v15;
    objc_msgSend(v16, "performAsync:", v17);

  }
}

- (id)_queue_connectedSceneWithIdentity:(id *)a1
{
  id *v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a1[7], "objectForKey:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_msgSend(v2[9], "containsObject:", v3) & 1) == 0)
      v2 = v3;
    else
      v2 = 0;

  }
  return v2;
}

- (void)queue_activate
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

- (void)_queue_sendHandshake
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

+ (BSServiceQuality)serviceQuality
{
  objc_opt_self();
  return +[FBSWorkspaceServiceSpecification serviceQuality](FBSWorkspaceServiceSpecification, "serviceQuality");
}

- (id)initWithEndpoint:(void *)a3 queue:(void *)a4 calloutQueue:(void *)a5 workspace:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v13 = v9;
    NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:].cold.1();
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6F6480);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:].cold.1();
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6F64E4);
    }

    objc_msgSend(v13, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provided endpoint is not for a workspace service"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:].cold.3();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6F653CLL);
    }
    objc_msgSend(v13, "instance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provided endpoint must not be instanced"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:].cold.2();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6F6594);
    }
    objc_msgSend(off_1E38E9E60, "connectionWithEndpoint:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      +[FBSWorkspaceScenesClientIdentifier identifierWithHostEndpoint:]((uint64_t)FBSWorkspaceScenesClientIdentifier, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:](a1, v19, v18, v10, v11, v12);

      v20 = a1;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_identifier;
}

- (FBSWorkspaceScenesClient)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSWorkspaceScenesClient *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSWorkspaceScenesClient *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[FBSWorkspaceScenesClient init] is unavailable."));
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
    v16 = CFSTR("FBSWorkspaceScenesClient.m");
    v17 = 1024;
    v18 = 191;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSWorkspaceScenesClient *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithIdentifier:(void *)a3 connection:(void *)a4 queue:(void *)a5 calloutQueue:(void *)a6 workspace:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id *v38;
  id v39;
  id v40;
  objc_super v41;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (!a1)
    goto LABEL_9;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:].cold.1();
LABEL_24:
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71F88CLL);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("connection"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:].cold.2();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71F8F4);
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:].cold.3();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71F95CLL);
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("calloutQueue"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:].cold.4();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71F9C4);
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("workspace"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:].cold.5();
    goto LABEL_24;
  }
  v41.receiver = a1;
  v41.super_class = (Class)FBSWorkspaceScenesClient;
  a1 = (id *)objc_msgSendSuper2(&v41, sel_init);
  if (a1)
  {
    v17 = objc_msgSend(v11, "copy");
    v18 = a1[6];
    a1[6] = (id)v17;

    objc_storeStrong(a1 + 3, a4);
    objc_storeStrong(a1 + 4, a5);
    objc_storeStrong(a1 + 5, a3);
    objc_storeStrong(a1 + 1, a6);
    objc_msgSend(a1[1], "_queue_registerSource:", a1);
    objc_msgSend(v16, "delegate");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = a1[2];
    a1[2] = (id)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = a1[7];
    a1[7] = (id)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = a1[8];
    a1[8] = (id)v23;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = a1[9];
    a1[9] = (id)v25;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = a1[10];
    a1[10] = (id)v27;

    a1[14] = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = a1[13];
    a1[13] = (id)v29;

    v31 = a1[5];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke;
    v37[3] = &unk_1E38ECA08;
    a1 = a1;
    v38 = a1;
    v39 = v11;
    v40 = v14;
    objc_msgSend(v31, "configureConnection:", v37);

  }
LABEL_9:

  return a1;
}

- (id)initWithPeer:(void *)a3 queue:(void *)a4 calloutQueue:(void *)a5 workspace:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v13 = v9;
    NSClassFromString(CFSTR("BSServiceConnection"));
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:].cold.1();
      objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A71FBF8);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionClass]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:].cold.1();
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A71FC5CLL);
    }

    objc_msgSend(v13, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provided peer is not for a workspace service"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:].cold.3();
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A71FCB4);
    }
    objc_msgSend(v13, "instance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provided peer must not be instanced"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:].cold.2();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A71FD0CLL);
    }
    +[FBSWorkspaceScenesClientIdentifier identifierWithPeer:]((uint64_t)FBSWorkspaceScenesClientIdentifier, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      a1 = -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:](a1, v18, v13, v10, v11, v12);
      v19 = a1;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  +[FBSWorkspaceServiceSpecification serviceQuality](FBSWorkspaceServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5 && *(_QWORD *)(v5 + 16))
  {
    +[FBSWorkspaceServiceSpecification invertedInterface](FBSWorkspaceServiceSpecification, "invertedInterface");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[FBSWorkspaceServiceSpecification interface](FBSWorkspaceServiceSpecification, "interface");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v3, "setInterface:", v6);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2;
  v16[3] = &unk_1E38EC718;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setActivationHandler:", v16);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_80;
  v14[3] = &unk_1E38EC9B8;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setBatchingHandler:", v14);
  v9 = *(_QWORD *)(a1 + 40);
  if (!v9 || !*(_QWORD *)(v9 + 16))
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_4;
    v12[3] = &unk_1E38EC718;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v3, "setInterruptionHandler:", v12);

  }
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_94;
  v10[3] = &unk_1E38EC9E0;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v10);

}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v4)
  {
    v5 = *(void **)(v4 + 8);
    if (v5)
    {
      if (objc_msgSend(v5, "isNonLaunching"))
      {
        FBLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_QWORD *)(a1 + 32);
          v8 = *(_QWORD *)(v7 + 48);
          v13 = 134218242;
          v14 = v7;
          v15 = 2112;
          v16 = v8;
          _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> attempting delayed handshake from activation handler", (uint8_t *)&v13, 0x16u);
        }

        -[FBSWorkspaceScenesClient _queue_sendHandshake](*(_QWORD *)(a1 + 32));
      }
    }
  }
  objc_msgSend(v3, "remoteToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneHostHandle handleWithAuditToken:](FBSSceneHostHandle, "handleWithAuditToken:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 88);
  *(_QWORD *)(v11 + 88) = v10;

}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_80(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  Class v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = NSClassFromString(CFSTR("CATransaction"));
    -[objc_class activate](v7, "activate");
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2_84;
    v12[3] = &unk_1E38EAE78;
    v13 = v4;
    -[objc_class addCommitHandler:forPhase:](v7, "addCommitHandler:forPhase:", v12, 0);

  }
  v8 = *(void **)(a1 + 32);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_3;
  v10[3] = &unk_1E38EAE78;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "performAsync:", v10);

}

uint64_t __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2_84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitWithReason:", CFSTR("commit-handler"));
}

uint64_t __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitWithReason:", CFSTR("runloop-turned"));
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  FBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 48);
    *(_DWORD *)buf = 134218242;
    v51 = v5;
    v52 = 2112;
    v53 = v6;
    _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> was interrupted", buf, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 88);
  *(_QWORD *)(v7 + 88) = 0;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v14, "settings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "interruptionPolicy");

        v17 = *(id **)(a1 + 32);
        if (v16 == 2)
        {
          objc_msgSend(v17[9], "addObject:", v14);
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_91;
          v43[3] = &unk_1E38EAE78;
          v43[4] = v14;
          objc_msgSend(v18, "performAsync:", v43);
        }
        else
        {
          -[FBSWorkspaceScenesClient _queue_invalidateScene:withTransitionContext:completion:](v17, v14, 0, 0);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v11);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v19 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v20)
  {
    v26 = v20;
    v27 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v19);
        v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        FBSWorkspaceErrorCreate(0, 3uLL, CFSTR("service was interrupted (did the server crash?) : %@"), v21, v22, v23, v24, v25, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v30);

      }
      v26 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 80);
  *(_QWORD *)(v32 + 80) = v31;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "activate");
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (!v34 || (v35 = *(void **)(v34 + 8)) == 0 || (objc_msgSend(v35, "isNonLaunching") & 1) == 0)
  {
    FBLogCommon();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(_QWORD *)(v37 + 48);
      *(_DWORD *)buf = 134218242;
      v51 = v37;
      v52 = 2112;
      v53 = v38;
      _os_log_impl(&dword_19A6D4000, v36, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> attempting immediate handshake from interruption handler", buf, 0x16u);
    }

    -[FBSWorkspaceScenesClient _queue_sendHandshake](*(_QWORD *)(a1 + 32));
  }
}

uint64_t __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_91(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_didUpdateHostHandle:", 0);
}

- (void)_queue_invalidateScene:(void *)a3 withTransitionContext:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v7, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "removeObjectForKey:", v10);
    objc_msgSend(a1[8], "removeObjectForKey:", v10);
    objc_msgSend(a1[9], "removeObject:", v7);
    objc_msgSend(v8, "actions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:]((uint64_t)a1, v11, v7);

    v12 = a1[4];
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke;
    v24[3] = &unk_1E38ECD70;
    v25 = v12;
    v14 = v7;
    v26 = v14;
    v27 = v9;
    v15 = v12;
    objc_msgSend(off_1E38E9DE0, "sentinelWithCompletion:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_3;
    v19[3] = &unk_1E38ECCD0;
    v19[4] = a1;
    v20 = v10;
    v21 = v14;
    v22 = v8;
    v23 = v16;
    v17 = v16;
    v18 = v10;
    objc_msgSend(v15, "performAsync:", v19);

  }
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_94(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  FBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 48);
    *(_DWORD *)buf = 134218242;
    v37 = v3;
    v38 = 2112;
    v39 = v4;
    _os_log_impl(&dword_19A6D4000, v2, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> was invalidated", buf, 0x16u);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        -[FBSWorkspaceScenesClient _queue_invalidateScene:withTransitionContext:completion:](*(id **)(a1 + 32), *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9++), 0, 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_queue_unregisterSource:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v13)
  {
    v19 = v13;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v12);
        v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21);
        FBSWorkspaceErrorCreate(0, 3uLL, CFSTR("service was invalidated : %@"), v14, v15, v16, v17, v18, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 80);
  *(_QWORD *)(v24 + 80) = 0;

}

+ (id)sourceIdentifierForHostEndpoint:(uint64_t)a1
{
  id v2;
  void *v3;
  id result;
  void *v5;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    +[FBSWorkspaceScenesClientIdentifier identifierWithHostEndpoint:]((uint64_t)FBSWorkspaceScenesClientIdentifier, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostEndpoint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSWorkspaceScenesClient sourceIdentifierForHostEndpoint:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)sceneWithIdentity:(id)a3
{
  os_unfair_lock_s *p_reportingLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_reportingLock = &self->_reportingLock;
    v5 = a3;
    os_unfair_lock_lock(p_reportingLock);
    -[NSMutableDictionary objectForKey:](self->_reportingLock_scenesByIdentity, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_reportingLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__FBSWorkspaceScenesClient_sendActions_toWorkspaceID_completion___block_invoke;
    v18[3] = &unk_1E38EBC60;
    v19 = v10;
    objc_msgSend(v16, "workspaceID:sendActions:completion:", v9, v8, v18);

  }
  else if (v10)
  {
    FBSWorkspaceErrorCreate(0, 3uLL, CFSTR("no proxy available for %@"), v11, v12, v13, v14, v15, (uint64_t)self->_identifier);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v17);

  }
}

uint64_t __65__FBSWorkspaceScenesClient_sendActions_toWorkspaceID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

- (id)createSceneFutureWithDefinition:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  id result;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
    objc_msgSend(v4, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSettingsWithBlock:", &__block_literal_global_14);
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__6;
    v22 = __Block_byref_object_dispose__6;
    v23 = 0;
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__FBSWorkspaceScenesClient_createSceneFutureWithDefinition___block_invoke_112;
    v14[3] = &unk_1E38ECA50;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    v17 = &v18;
    v9 = v7;
    v10 = v6;
    dispatch_sync(queue, v14);
    v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identity is not specified"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient createSceneFutureWithDefinition:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

uint64_t __60__FBSWorkspaceScenesClient_createSceneFutureWithDefinition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClientFuture:", 1);
}

void __60__FBSWorkspaceScenesClient_createSceneFutureWithDefinition___block_invoke_112(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[FBSWorkspaceScenesClient _createSceneWithIdentity:parameters:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_createSceneWithIdentity:(void *)a3 parameters:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_8;
  }
  BSDispatchQueueAssert();
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", v7))
    {
      FBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient _createSceneWithIdentity:parameters:].cold.2(a1, v7);

      -[FBSWorkspaceScenesClient _queue_invalidateScene:withTransitionContext:completion:]((id *)a1, v7, 0, 0);
      objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_7;
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "identityToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("failed to purge remnant for incoming scene : token=%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient _createSceneWithIdentity:parameters:].cold.1();
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "identityToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("already have a scene for \"%@\" : parameters=%@"), v19, v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceScenesClient _createSceneWithIdentity:parameters:].cold.3();
    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A720F40);
  }
LABEL_7:
  -[FBSWorkspaceScenesClientIdentifier tokenWithIdentity:](*(_QWORD *)(a1 + 48), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:]([FBSScene alloc], "_initWithUpdater:identityToken:identity:parameters:hostHandle:", a1, v10, v5, v6, *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v11, v5);
  v12 = *(void **)(a1 + 64);
  objc_msgSend(v11, "clientSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, v5);

LABEL_8:
  return v11;
}

- (void)activateSceneFuture:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *queue;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (**v33)(_QWORD, _QWORD);
  NSObject *v34;
  FBSWorkspaceScenesClientIdentifier *identifier;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  FBSWorkspaceScenesClient *v47;
  id v48;
  id v49;
  _QWORD block[4];
  id v51;
  FBSWorkspaceScenesClient *v52;
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  FBSWorkspaceScenesClientIdentifier *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
  objc_msgSend(v7, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isClientFuture");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scene is not a client future"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient activateSceneFuture:completion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A721404);
  }
  objc_msgSend(v7, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v13);

  objc_msgSend(v7, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workspaceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWorkspaceIdentifier:", v15);

  objc_msgSend(v7, "specification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSpecification:", v16);

  objc_msgSend(v7, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInitialSettings:", v17);

  objc_msgSend(v7, "clientSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInitialClientSettings:", v18);

  objc_msgSend(v12, "setClientFuture:", 1);
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v19 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke;
  block[3] = &unk_1E38ECA50;
  v54 = &v55;
  v21 = v7;
  v51 = v21;
  v52 = self;
  v22 = v11;
  v53 = v22;
  dispatch_sync(queue, block);
  objc_msgSend(off_1E38E9DF0, "builderWithObject:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "appendObject:withName:", v22, 0);
  objc_msgSend(v23, "build");
  v45[0] = v19;
  v45[1] = 3221225472;
  v45[2] = __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2;
  v45[3] = &unk_1E38ECA78;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v25;
  v47 = self;
  v26 = v22;
  v48 = v26;
  v27 = v8;
  v49 = v27;
  v33 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AECA324](v45);
  if (*((_BYTE *)v56 + 24))
  {
    FBLogCommon();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543618;
      v60 = v25;
      v61 = 2114;
      v62 = identifier;
      _os_log_impl(&dword_19A6D4000, v34, OS_LOG_TYPE_DEFAULT, "Requesting scene %{public}@ from %{public}@", buf, 0x16u);
    }

    -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)self);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v36;
    if (v36)
    {
      objc_msgSend(v36, "createSceneWithOptions:completion:", v12, v33);
    }
    else
    {
      FBSWorkspaceErrorCreate(0, 3uLL, CFSTR("no proxy available for %@"), v37, v38, v39, v40, v41, (uint64_t)self->_identifier);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v33)[2](v33, v43);

    }
    -[FBSWorkspaceScenesClient _callOutQueue_sendDidCreateForScene:transitionContext:completion:]((uint64_t)self, v21, 0, v33);
  }
  else
  {
    FBSWorkspaceErrorCreate(0, 1uLL, CFSTR("scene %@ was invalidated before activation %@"), v28, v29, v30, v31, v32, (uint64_t)v25);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v33)[2](v33, v42);
  }

  _Block_object_dispose(&v55, 8);
}

void __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 56), "objectForKey:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v2 == v3;

  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    objc_msgSend(*(id *)(a1[5] + 72), "addObject:", a1[4]);
}

void __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  FBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2_cold_1(a1, (uint64_t)v3);

    -[FBSWorkspaceScenesClient _sceneID:destroyWithTransitionContext:completion:](*(id **)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEFAULT, "Request for %{public}@ complete!", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v3 == 0, v3);

}

- (void)_sceneID:(void *)a3 destroyWithTransitionContext:(void *)a4 completion:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(a1[7], "objectForKey:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[FBSWorkspaceScenesClient _queue_invalidateScene:withTransitionContext:completion:](a1, v9, v7, v8);
    }
    else if (v8)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D68];
      v14[0] = CFSTR("No FBSScene exists with provided identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("FBSWorkspaceScenesClient"), 1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v8 + 2))(v8, v12);

    }
  }

}

- (void)_callOutQueue_sendDidCreateForScene:(void *)a3 transitionContext:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[4];
  id v32;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "assertOnQueue");
    objc_msgSend(v7, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke;
    v31[3] = &unk_1E38ECC30;
    v17 = v9;
    v32 = v9;
    objc_msgSend(off_1E38E9DE0, "sentinelWithCompletion:", v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v13 = *(NSObject **)(a1 + 24);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2;
    block[3] = &unk_1E38ECC58;
    block[4] = a1;
    v14 = v10;
    v23 = v14;
    v15 = v7;
    v25 = &v27;
    v26 = sel__callOutQueue_sendDidCreateForScene_transitionContext_completion_;
    v24 = v15;
    dispatch_sync(v13, block);
    if (*((_BYTE *)v28 + 24))
    {
      v16 = *(void **)(a1 + 8);
      v18[0] = v11;
      v18[1] = 3221225472;
      v18[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_156;
      v18[3] = &unk_1E38ECCA8;
      v18[4] = a1;
      v19 = v8;
      v20 = v15;
      v21 = v12;
      objc_msgSend(v16, "_calloutQueue_executeCalloutFromSource:withBlock:", a1, v18);

    }
    else
    {
      objc_msgSend(v12, "signal");
    }

    _Block_object_dispose(&v27, 8);
    v9 = v17;
  }

}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *queue;
  id v14;
  _QWORD block[5];
  id v16;
  SEL v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke;
  v18[3] = &unk_1E38ECAF0;
  v18[4] = self;
  v19 = v7;
  v20 = v8;
  v21 = a2;
  v10 = v8;
  v11 = v7;
  v12 = (void *)objc_msgSend(v18, "copy");
  queue = self->_queue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3;
  block[3] = &unk_1E38ECB18;
  block[4] = self;
  v16 = v12;
  v17 = a2;
  v14 = v12;
  dispatch_sync(queue, block);

}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v5 = a2;
  v6 = a3;
  v12 = v6;
  if (!v5)
  {
    if (!v6)
    {
      FBSWorkspaceErrorCreate(0, 3uLL, CFSTR("proxy to %@ was unexpectedly nil"), v7, v8, v9, v10, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    FBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_1(a1, v12);

    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_128;
    v19[3] = &unk_1E38EB5D8;
    v16 = *(id *)(a1 + 48);
    v20 = v12;
    v21 = v16;
    v19[4] = *(_QWORD *)(a1 + 32);
    v17 = v12;
    objc_msgSend(v15, "performAsync:", v19);

    goto LABEL_9;
  }
  if (!v6)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_121;
    v22[3] = &unk_1E38ECAC8;
    v13 = *(_QWORD *)(a1 + 40);
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = *(id *)(a1 + 48);
    objc_msgSend(v5, "requestSceneWithOptions:completion:", v13, v22);

LABEL_9:
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we shouldn't have an error if we have a proxy : %@"), v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_2(a1);
  objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2;
  v12[3] = &unk_1E38ECAA0;
  v13 = v6;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v9, "performAsync:", v12);

}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    -[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](*(_QWORD *)(a1 + 48), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      FBSWorkspaceErrorCreate(*(void **)(a1 + 32), 1uLL, CFSTR("failed to find expected scene from %@ with identifier=%@"), v4, v5, v6, v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
      v10 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v10;
    }
  }
  else
  {
    v9 = 0;
  }
  if (v2)
  {
    FBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(_QWORD *)(v13 + 48);
        objc_msgSend(v2, "succinctDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v24 = v13;
        v25 = 2112;
        v26 = v14;
        v27 = 2114;
        v28 = v15;
        _os_log_impl(&dword_19A6D4000, v12, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> scene request received error response : %{public}@", buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_cold_1(a1, v2);
    }

  }
  v16 = *(void **)(a1 + 56);
  if (v16)
  {
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(void **)(v17 + 8);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_124;
    v19[3] = &unk_1E38EB5D8;
    v22 = v16;
    v20 = v9;
    v21 = v2;
    objc_msgSend(v18, "_calloutQueue_executeCalloutFromSource:withBlock:", v17, v19);

  }
}

uint64_t __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_124(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_128(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_129;
    v5[3] = &unk_1E38EB888;
    v7 = v1;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_calloutQueue_executeCalloutFromSource:withBlock:", v3, v5);

  }
}

uint64_t __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_129(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD block[5];
  id v18;

  v3 = (uint64_t *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v2 + 48);
  if (v4)
  {
    v5 = *(void **)(v4 + 8);
    if (v5)
    {
      v6 = objc_msgSend(v5, "isNonLaunching");
      v2 = *v3;
      if (v6)
      {
        v7 = *(void **)(v2 + 80);
        v8 = *(_QWORD *)(a1 + 40);
        if (v7)
        {
          v9 = (void *)MEMORY[0x19AECA324](*(_QWORD *)(a1 + 40));
          objc_msgSend(v7, "addObject:", v9);

          v10 = dispatch_time(0, 30000000000);
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(void **)(a1 + 40);
          v13 = *(NSObject **)(v11 + 24);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_4;
          block[3] = &unk_1E38EBB98;
          block[4] = v11;
          v18 = v12;
          dispatch_after(v10, v13, block);

          return;
        }
        -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)v2);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v16, 0);
        goto LABEL_8;
      }
    }
  }
  if (!*(_QWORD *)(v2 + 80))
  {
    v14 = *(_QWORD *)(a1 + 40);
    -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)v2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v14 + 16))(v14, v16, 0);
LABEL_8:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("internal state inconsistency - we should never be pending send blocks for !isNonLaunching (%@) connections"), *(_QWORD *)(v2 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3_cold_1();
  objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v3 = (void *)MEMORY[0x19AECA324](*(_QWORD *)(a1 + 40));
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  if ((_DWORD)v2)
  {
    v9 = *(_QWORD *)(a1 + 40);
    FBSWorkspaceErrorCreate(0, 3uLL, CFSTR("non-launching service failed to become available within 30s : %@"), v4, v5, v6, v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v13 = (id)MEMORY[0x19AECA324](v11);
    objc_msgSend(v12, "removeObject:", v13);

  }
}

- (id)hostProcess
{
  return (id)-[BSServiceConnection remoteProcess](self->_connection, "remoteProcess");
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  Class v17;

  v12 = a3;
  v8 = a4;
  objc_msgSend(v12, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__FBSWorkspaceScenesClient_scene_didReceiveActions_forExtension___block_invoke;
    block[3] = &unk_1E38ECB90;
    block[4] = self;
    v14 = v9;
    v15 = v12;
    v16 = v8;
    v17 = a5;
    dispatch_sync(queue, block);

  }
}

void __65__FBSWorkspaceScenesClient_scene_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      FBLogSceneClient();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v13 = v5;
        _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dropping actions because the scene is reconnecting", buf, 0xCu);
      }

    }
    else
    {
      -[FBSWorkspaceScenesClient _remoteTarget](*(os_unfair_lock_s **)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 56);
      v8 = *(objc_class **)(a1 + 64);
      v11 = v6;
      if (v8)
      {
        NSStringFromClass(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sceneID:didReceiveActions:forExtension:", v7, v9, v10);

      }
      else
      {
        objc_msgSend(v6, "sceneID:didReceiveActions:forExtension:", v7, v9, 0);
      }

    }
  }
}

- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *queue;
  void *v14;
  FBSSerialQueue *callOutQueue;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke;
    block[3] = &unk_1E38ECC08;
    block[4] = self;
    v20 = v11;
    v21 = v8;
    v22 = v9;
    v23 = v10;
    dispatch_sync(queue, block);

    v14 = v20;
LABEL_5:

    goto LABEL_6;
  }
  if (v10)
  {
    callOutQueue = self->_callOutQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_9;
    v16[3] = &unk_1E38EBD20;
    v16[4] = self;
    v17 = 0;
    v18 = v10;
    -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v16);

    v14 = v18;
    goto LABEL_5;
  }
LABEL_6:

}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 != *(void **)(a1 + 48))
  {

    goto LABEL_4;
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v2);

  if ((v4 & 1) == 0)
  {
    -[FBSWorkspaceScenesClient _remoteTarget](*(os_unfair_lock_s **)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_2;
      v22[3] = &unk_1E38ECBE0;
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(id *)(a1 + 64);
      v22[4] = *(_QWORD *)(a1 + 32);
      v23 = v11;
      objc_msgSend(v8, "sceneID:sendMessage:withResponse:", v9, v10, v22);
      v12 = v23;
    }
    else
    {
      v13 = *(void **)(a1 + 64);
      if (!v13)
      {
LABEL_11:

        return;
      }
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_5;
      v19[3] = &unk_1E38EBD20;
      v19[4] = v14;
      v21 = v13;
      v20 = *(id *)(a1 + 40);
      objc_msgSend(v15, "performAsync:", v19);

      v12 = v21;
    }

    goto LABEL_11;
  }
LABEL_4:
  v5 = *(void **)(a1 + 64);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_7;
    v16[3] = &unk_1E38EBD20;
    v16[4] = v6;
    v18 = v5;
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performAsync:", v16);

  }
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_3;
    v10[3] = &unk_1E38ECBB8;
    v10[4] = v8;
    v13 = v7;
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "performAsync:", v10);

  }
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_4;
  v4[3] = &unk_1E38EB5D8;
  v7 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_calloutQueue_executeCalloutFromSource:withBlock:", v2, v4);

}

uint64_t __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_6;
  v4[3] = &unk_1E38EB888;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_calloutQueue_executeCalloutFromSource:withBlock:", v2, v4);

}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 1uLL, CFSTR("the remote target isn't valid : identifier=%@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);

}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_8;
  v4[3] = &unk_1E38EB888;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_calloutQueue_executeCalloutFromSource:withBlock:", v2, v4);

}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 1uLL, CFSTR("scene is not valid : identifier=%@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);

}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_10;
  v4[3] = &unk_1E38EB888;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_calloutQueue_executeCalloutFromSource:withBlock:", v2, v4);

}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 1uLL, CFSTR("scene is not valid : identifier=%@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);

}

- (void)willTerminateWithTransitionContext:(id)a3
{
  id v4;
  FBSSerialQueue *callOutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  callOutQueue = self->_callOutQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke;
  v7[3] = &unk_1E38EAE08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v7);

}

void __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke_2;
  v4[3] = &unk_1E38EAE08;
  v4[4] = v2;
  v5 = v1;
  objc_msgSend(v3, "_calloutQueue_executeCalloutFromSource:withBlock:", v2, v4);

}

void __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "workspaceShouldExit:withTransitionContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));

}

uint64_t __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = a1 + 4;
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[2];

  if (v3 == v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 116));
    objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = a1[5];
      objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("already have a reported scene with identifier \"%@\" : old=%@ new=%@"), v7, v8, a1[6]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_cold_1();
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKey:", a1[6], a1[5]);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 116));
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    }
  }
}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_156(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:](v2, v3, *(void **)(a1 + 48));

  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_157;
  v9[3] = &unk_1E38ECCA8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 56);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_4;
  v7[3] = &unk_1E38EAE78;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v10, "_callOutQueue_didCreateWithTransitionContext:alternativeCreationCallout:completion:", v5, v9, v7);

}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_157(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(v2 + 8);
    v4 = *(void **)(v2 + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_3;
    v7[3] = &unk_1E38ECC80;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v4, "workspace:didCreateScene:withTransitionContext:completion:", v5, v3, v6, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "signal");
  }
}

uint64_t __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

uint64_t __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)reconnectSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  FBSWorkspaceScenesClientIdentifier *identifier;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  FBSSceneHostHandle *v28;
  FBSSerialQueue *callOutQueue;
  void *v30;
  FBSSceneHostHandle *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  FBSSceneHostHandle *v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  FBSWorkspaceScenesClient *v46;
  __int16 v47;
  FBSWorkspaceScenesClientIdentifier *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  FBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 134218498;
    v46 = self;
    v47 = 2112;
    v48 = identifier;
    v49 = 2114;
    v50 = v10;
    _os_log_impl(&dword_19A6D4000, v14, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> Reconnecting scene %{public}@", buf, 0x20u);
  }

  -[NSMutableDictionary objectForKey:](self->_scenesByIdentity, "objectForKey:", v10);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v33 = CFSTR("not-found");
    goto LABEL_15;
  }
  v17 = (void *)v16;
  if (!-[NSHashTable containsObject:](self->_reconnectingScenes, "containsObject:", v16))
  {
    v33 = CFSTR("not-waiting");
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to reconnect '%@' : remnant=%@"), v10, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient reconnectSceneWithIdentity:parameters:transitionContext:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7233DCLL);
  }
  -[NSHashTable removeObject:](self->_reconnectingScenes, "removeObject:", v17);
  objc_msgSend(v17, "specification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "specification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  v21 = objc_opt_class();

  if (v20 != v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("specification mismatch in reconnect"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient reconnectSceneWithIdentity:parameters:transitionContext:completion:].cold.4();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A723434);
  }
  objc_msgSend(v11, "clientSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientSettingsClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientSettings mismatch in reconnect"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient reconnectSceneWithIdentity:parameters:transitionContext:completion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A72348CLL);
  }
  -[NSMutableDictionary objectForKey:](self->_clientSettingsByIdentity, "objectForKey:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    +[FBSSceneClientSettingsDiff diffFromSettings:toSettings:](FBSSceneClientSettingsDiff, "diffFromSettings:toSettings:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)self);
      v38 = v13;
      v25 = v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __95__FBSWorkspaceScenesClient_reconnectSceneWithIdentity_parameters_transitionContext_completion___block_invoke;
      v43[3] = &unk_1E38ECB40;
      v44 = v10;
      objc_msgSend(v26, "sceneID:didUpdateClientSettingsWithDiff:transitionContext:completion:", v44, v24, 0, v43);

      v12 = v25;
      v13 = v38;

    }
  }
  objc_msgSend(v11, "settings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "settingsClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("settings mismatch in reconnect"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceScenesClient reconnectSceneWithIdentity:parameters:transitionContext:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7234E4);
  }
  -[FBSWorkspaceScenesClient _queue_updateScene:withSettings:diff:transitionContext:completion:]((uint64_t)self, v17, v27, 0, v12, v13);
  v28 = self->_hostHandle;
  callOutQueue = self->_callOutQueue;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __95__FBSWorkspaceScenesClient_reconnectSceneWithIdentity_parameters_transitionContext_completion___block_invoke_174;
  v40[3] = &unk_1E38EAE08;
  v41 = v17;
  v42 = v28;
  v39 = v10;
  v30 = v12;
  v31 = v28;
  v32 = v17;
  -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v40);

}

void __95__FBSWorkspaceScenesClient_reconnectSceneWithIdentity_parameters_transitionContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    FBLogSceneClient();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2_cold_1(a1, (uint64_t)v3);

  }
}

uint64_t __95__FBSWorkspaceScenesClient_reconnectSceneWithIdentity_parameters_transitionContext_completion___block_invoke_174(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_didUpdateHostHandle:", *(_QWORD *)(a1 + 40));
}

- (void)sceneID:(id)a3 destroyWithTransitionContext:(id)a4 completion:(id)a5
{
  -[FBSWorkspaceScenesClient _sceneID:destroyWithTransitionContext:completion:]((id *)&self->super.isa, (uint64_t)a3, a4, a5);
}

- (void)sendActions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  FBSSerialQueue *callOutQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  callOutQueue = self->_callOutQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke;
  v11[3] = &unk_1E38EB8D8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v11);

}

uint64_t __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  _QWORD v6[5];
  id v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v2 = (void *)a1[5];
    v4 = *(void **)(v3 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke_2;
    v6[3] = &unk_1E38EAE08;
    v6[4] = v3;
    v7 = v2;
    objc_msgSend(v4, "_calloutQueue_executeCalloutFromSource:withBlock:", v3, v6);

  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "workspace:didReceiveActions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

- (void)sceneID:(id)a3 sendActions:(id)a4 toExtension:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  FBSSerialQueue *callOutQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  FBSWorkspaceScenesClient *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[FBSWorkspaceScenesClient _queue_connectedSceneWithIdentity:]((id *)&self->super.isa, (uint64_t)v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke;
  v21[3] = &unk_1E38ECCF8;
  v22 = v14;
  v23 = self;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  v20 = v14;
  -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v21);

}

uint64_t __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    -[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == v3)
    {
      -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 56), *(void **)(a1 + 32));
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 8);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2;
      v9[3] = &unk_1E38ECCD0;
      v10 = *(id *)(a1 + 64);
      v6 = *(id *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = v6;
      v12 = v7;
      v13 = *(id *)(a1 + 56);
      v14 = *(id *)(a1 + 48);
      objc_msgSend(v5, "_calloutQueue_executeCalloutFromSource:withBlock:", v4, v9);

    }
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2(uint64_t a1)
{
  NSString *v2;
  uint64_t *v3;
  Class v4;
  Class v5;
  BOOL v6;
  NSObject *v7;

  v3 = (uint64_t *)(a1 + 32);
  v2 = *(NSString **)(a1 + 32);
  if (!v2)
  {
    v5 = 0;
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "updater:didReceiveActions:forExtension:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5);
    return;
  }
  v4 = NSClassFromString(v2);
  v5 = v4;
  if (*v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (!v6)
    goto LABEL_11;
  FBLogSceneClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2_cold_1(a1, v3, v7);

}

- (void)sceneID:(id)a3 sendMessage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  FBSSerialQueue *callOutQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  FBSWorkspaceScenesClient *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBSWorkspaceScenesClient _queue_connectedSceneWithIdentity:]((id *)&self->super.isa, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke;
  v17[3] = &unk_1E38ECC08;
  v18 = v11;
  v19 = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v17);

}

void __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;

  v9 = *(void **)(a1 + 32);
  if (v9
    && (-[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48)),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9 == v10))
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 8);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_2;
    v18[3] = &unk_1E38ECAA0;
    v15 = v12;
    v16 = *(_QWORD *)(a1 + 40);
    v19 = v15;
    v20 = v16;
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    objc_msgSend(v14, "_calloutQueue_executeCalloutFromSource:withBlock:", v13, v18);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
    {
      FBSWorkspaceErrorCreate(0, 1uLL, CFSTR("failed to find expected scene with identifier=%@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v17);

    }
  }
}

void __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_3;
  v4[3] = &unk_1E38ECD20;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "updater:didReceiveMessage:withResponse:", v2, v3, v4);

}

uint64_t __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_2;
  v3[3] = &unk_1E38EBB98;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performAsync:", v3);

}

uint64_t __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_invalidate");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 116));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 116));
  if (v2 == v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_4;
    v11 = &unk_1E38ECCA8;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v6 = *(id *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 32);
    v14 = v6;
    v15 = v7;
    objc_msgSend(v5, "_calloutQueue_executeCalloutFromSource:withBlock:", v4, &v8);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 116));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectForKey:", *(_QWORD *)(a1 + 40), v8, v9, v10, v11);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 116));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "signal");
  }
}

void __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_5;
  v13[3] = &unk_1E38EAE78;
  v14 = *(id *)(a1 + 48);
  if ((objc_msgSend(v3, "_callOutQueue_willDestroyWithTransitionContext:completion:", v4, v13) & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = *(void **)(a1 + 48);
      v5 = *(_QWORD *)(a1 + 56);
      v8 = *(_QWORD *)(v5 + 8);
      v7 = *(void **)(v5 + 16);
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11[0] = v2;
      v11[1] = 3221225472;
      v11[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_6;
      v11[3] = &unk_1E38ECD98;
      v12 = v6;
      objc_msgSend(v7, "workspace:willDestroyScene:withTransitionContext:completion:", v8, v10, v9, v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "signal");
    }
  }

}

uint64_t __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

uint64_t __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingLock_scenesByIdentity, 0);
  objc_storeStrong((id *)&self->_handshakeLock_remoteTarget, 0);
  objc_storeStrong((id *)&self->_hostHandle, 0);
  objc_storeStrong((id *)&self->_pendedSendBlocks, 0);
  objc_storeStrong((id *)&self->_reconnectingScenes, 0);
  objc_storeStrong((id *)&self->_clientSettingsByIdentity, 0);
  objc_storeStrong((id *)&self->_scenesByIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workspaceDelegate, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)initWithEndpoint:queue:calloutQueue:workspace:.cold.1()
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

- (void)initWithEndpoint:queue:calloutQueue:workspace:.cold.2()
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

- (void)initWithEndpoint:queue:calloutQueue:workspace:.cold.3()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.1()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.2()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.3()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.4()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.5()
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

- (void)initWithPeer:queue:calloutQueue:workspace:.cold.1()
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

- (void)initWithPeer:queue:calloutQueue:workspace:.cold.2()
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

- (void)initWithPeer:queue:calloutQueue:workspace:.cold.3()
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

+ (void)sourceIdentifierForHostEndpoint:.cold.1()
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

- (void)createSceneFutureWithDefinition:.cold.1()
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

- (void)_createSceneWithIdentity:parameters:.cold.1()
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

- (void)_createSceneWithIdentity:(uint64_t)a1 parameters:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "identityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1(&dword_19A6D4000, v2, v3, "<FBSWorkspaceScenesClient:%p %@> purging remnant for incoming scene : token=%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11_2();
}

- (void)_createSceneWithIdentity:parameters:.cold.3()
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

- (void)activateSceneFuture:(const char *)a1 completion:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_14_0(a1, a2), "descriptionWithMultilinePrefix:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v3, v4, "Error creating %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "succinctDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9_1(&dword_19A6D4000, v3, v4, "<FBSWorkspaceScenesClient:%p %@> failed to send scene request with error : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11_2();
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_2(uint64_t a1)
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

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "succinctDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9_1(&dword_19A6D4000, v3, v4, "<FBSWorkspaceScenesClient:%p %@> scene request failed to return scene with error response : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11_2();
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3_cold_1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v1 + 48));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_17_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_14_0(a1, a2), "descriptionWithMultilinePrefix:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v3, v4, "[%{public}@] error updating client settings: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8();
}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_cold_1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v1 + 64));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_17_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.1()
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

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.2()
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

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.3()
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

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.4()
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

void __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *a2;
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_19A6D4000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to deliver actions to extension \"%{public}@\" because that class does not exist.", (uint8_t *)&v5, 0x16u);
}

@end
