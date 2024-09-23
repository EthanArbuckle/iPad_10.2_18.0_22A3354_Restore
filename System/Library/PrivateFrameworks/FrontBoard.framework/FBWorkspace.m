@implementation FBWorkspace

- (id)_sceneForIdentity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v8;

  v4 = a3;
  NSClassFromString(CFSTR("FBSSceneIdentity"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace _sceneForIdentity:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A359D3A0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace _sceneForIdentity:].cold.1();
    goto LABEL_9;
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_identityToSceneMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)host:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  FBWorkspace *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke;
  v33[3] = &unk_1E4A12F18;
  v34 = v15;
  v17 = a3;
  v18 = (void *)MEMORY[0x1A8590C4C](v33);
  -[FBWorkspace _sceneForHost:](self, "_sceneForHost:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2;
  block[3] = &unk_1E4A12970;
  v27 = v19;
  v28 = self;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v32 = v18;
  v21 = v18;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v25 = v19;
  dispatch_async(queue, block);

}

- (id)_sceneForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspace _sceneForIdentity:](self, "_sceneForIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "host");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v4)
  {

    v7 = 0;
  }
  return v7;
}

- (void)sceneID:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  NSObject *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  -[FBWorkspace _sceneForIdentity:](self, "_sceneForIdentity:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[FBWorkspaceConnection currentWorkspaceConnection]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceScene workspace:handleUpdatedClientSettings:transitionContext:fromConnection:]((uint64_t)v14, self, v11, v12, v15);

    if (v13)
LABEL_3:
      v13[2](v13, 0);
  }
  else
  {
    FBLogProcessScene();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FBWorkspace sceneID:didUpdateClientSettingsWithDiff:transitionContext:completion:].cold.1();

    if (v13)
      goto LABEL_3;
  }

}

- (FBProcess)process
{
  return (FBProcess *)objc_loadWeakRetained((id *)&self->_weak_process);
}

uint64_t __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_resolveSceneLifecycleStateAndInterruptionPolicy
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[FBProcess logProem](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_15(&dword_1A359A000, a3, v5, "%{public}@ Workspace afterlife assertion failed: %{public}@", v6);

  OUTLINED_FUNCTION_8_2();
}

uint64_t __37__FBWorkspace_initWithParentProcess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProcessAssertionState");
}

uint64_t __77__FBWorkspace_registerHost_settings_initialClientSettings_fromRemnant_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveSceneLifecycleStateAndInterruptionPolicy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_afterlifeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_connectAssertion, 0);
  objc_storeStrong((id *)&self->_lock_lifeAssertion, 0);
  objc_storeStrong((id *)&self->_compoundAssertion, 0);
  objc_storeStrong((id *)&self->_workspaceQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock_identityToSceneMap, 0);
  objc_storeStrong((id *)&self->_lock_outgoingConnection, 0);
  objc_storeStrong((id *)&self->_lock_outgoingEndpoint, 0);
  objc_storeStrong((id *)&self->_workspaceServiceInjector, 0);
  objc_storeStrong((id *)&self->_lock_pendedRequests, 0);
  objc_storeStrong((id *)&self->_lock_identityToRemnantsMap, 0);
  objc_storeStrong((id *)&self->_lock_eventDispatcherSource, 0);
  objc_storeStrong((id *)&self->_lock_incomingConnection, 0);
  objc_destroyWeak((id *)&self->_weak_process);
  objc_destroyWeak((id *)&self->_weak_delegate);
}

void __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[FBWorkspaceScene workspace:sendUpdatedSettings:withDiff:transitionContext:completion:](v2, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 72);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2D68];
    v8[0] = CFSTR("Scene client is invalid.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FBWorkspace"), 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v6);

  }
}

- (void)_workspaceSceneLifecycleStateChanged:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    if (v3)
    {
      v6 = v3;
      objc_msgSend(v3, "identity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_sceneForIdentity:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v3 = v6;
      if (v5 == v6)
      {
        objc_msgSend(a1, "_resolveSceneLifecycleStateAndInterruptionPolicy");
        v3 = v6;
      }
    }
  }

}

- (id)_acquireAssertionForReason:(uint64_t)a3 withState:
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a2;
    objc_msgSend(v5, "numberWithUnsignedChar:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acquireForReason:withContext:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSString)description
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, 0);

  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_enableLegacyRequests:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];

  v3 = a2;
  if (!a1)
    goto LABEL_5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

  if (WeakRetained == v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    v5 = *(_QWORD *)(a1 + 48);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    if (v5)
    {
      +[FBProcess calloutQueue](FBProcess, "calloutQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__FBWorkspace__enableLegacyRequests___block_invoke;
      block[3] = &unk_1E4A12348;
      block[4] = a1;
      dispatch_async(v6, block);

    }
LABEL_5:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process == _weak_process"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBWorkspace _enableLegacyRequests:].cold.1();
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)registerHost:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 fromRemnant:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  FBWorkspace *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  NSMutableDictionary *lock_identityToSceneMap;
  NSMutableDictionary *v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  NSMutableDictionary *lock_identityToRemnantsMap;
  NSMutableDictionary *v39;
  NSMutableDictionary *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString **v44;
  uint64_t *v45;
  _QWORD *WeakRetained;
  void *v47;
  FBWorkspaceIncomingConnection *v48;
  void *v49;
  void *v50;
  NSObject *queue;
  id v52;
  BSServiceConnectionEndpoint *lock_outgoingEndpoint;
  NSObject *v55;
  FBWorkspaceOutgoingConnection *lock_outgoingConnection;
  FBWorkspaceOutgoingConnection *v57;
  FBWorkspaceOutgoingConnection *v58;
  BSServiceConnectionEndpoint *v59;
  objc_class *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v88;
  void *v89;
  _QWORD block[5];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  int v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  const __CFString *v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  _QWORD v104[3];

  v104[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("host"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B832CLL);
  }
  v89 = v14;
  objc_msgSend(v11, "definition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "targetsClientEndpoint");

  objc_msgSend(v15, "specification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16;
  NSClassFromString(CFSTR("FBSSceneIdentity"));
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B8390);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v64), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B83F4);
  }
  v21 = v18;

  v22 = v19;
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B8458);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B84BCLL);
  }
  v86 = v15;

  v23 = v12;
  NSClassFromString(CFSTR("FBSSceneSettings"));
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B8520);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B8584);
  }

  objc_msgSend(v22, "settingsClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("settings of an unexpected class: expected %@, got %@"), objc_msgSend(v22, "settingsClass"), objc_opt_class());
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.16();
    objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B85F8);
  }
  v88 = v11;
  v24 = v13;
  NSClassFromString(CFSTR("FBSSceneClientSettings"));
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    objc_msgSend(objc_retainAutorelease(v70), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B865CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    objc_msgSend(objc_retainAutorelease(v71), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B86C0);
  }

  objc_msgSend(v22, "clientSettingsClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("initialClientSettings of an unexpected class: expected %@, got %@"), objc_msgSend(v22, "clientSettingsClass"), objc_opt_class());
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.14();
    objc_msgSend(objc_retainAutorelease(v72), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B8734);
  }
  v25 = (uint64_t)v89;
  if (v89)
  {
    v26 = v89;
    NSClassFromString(CFSTR("FBSceneRemnant"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.13();
      objc_msgSend(objc_retainAutorelease(v77), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B8824);
    }

    if (objc_msgSend(v26, "_hasBeenInvalidated"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot create a scene from an invalidated remnant"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.10();
      objc_msgSend(objc_retainAutorelease(v78), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B887CLL);
    }
    objc_msgSend(v26, "_workspace");
    v27 = (FBWorkspace *)objc_claimAutoreleasedReturnValue();

    if (v27 != self)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("remnant doesn't match this workspace"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.12();
      objc_msgSend(objc_retainAutorelease(v79), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B88D4);
    }
    objc_msgSend(v26, "definition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "specification");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_class();
    v31 = objc_opt_class();

    v32 = v30 == v31;
    v25 = (uint64_t)v89;
    if (!v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("specification must match the remnant"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.11();
      objc_msgSend(objc_retainAutorelease(v80), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B892CLL);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  lock_identityToSceneMap = self->_lock_identityToSceneMap;
  if (!lock_identityToSceneMap)
  {
    v34 = (NSMutableDictionary *)objc_opt_new();
    v35 = self->_lock_identityToSceneMap;
    self->_lock_identityToSceneMap = v34;

    lock_identityToSceneMap = self->_lock_identityToSceneMap;
  }
  -[NSMutableDictionary objectForKey:](lock_identityToSceneMap, "objectForKey:", v20);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v73 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableDictionary objectForKey:](self->_lock_identityToSceneMap, "objectForKey:", v20);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "debugDescription");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "stringWithFormat:", CFSTR("cannot register a host that is already registered : existing=%@ : host=%@"), v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.9();
    objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B87C0);
  }
  if (self->_lock_didReceiveHandshake)
  {
    -[NSMutableDictionary objectForKey:](self->_lock_identityToRemnantsMap, "objectForKey:", v20);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("how could you call createWithRemnant: if we haven't made any remnants"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.8();
      objc_msgSend(objc_retainAutorelease(v82), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B8984);
    }
    lock_identityToRemnantsMap = self->_lock_identityToRemnantsMap;
    if (!lock_identityToRemnantsMap)
    {
      v39 = (NSMutableDictionary *)objc_opt_new();
      v40 = self->_lock_identityToRemnantsMap;
      self->_lock_identityToRemnantsMap = v39;

      lock_identityToRemnantsMap = self->_lock_identityToRemnantsMap;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](lock_identityToRemnantsMap, "setObject:forKey:", v41, v20);

    v37 = 0;
  }
  if (self->_lock_invalidated)
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v103 = *MEMORY[0x1E0CB2D68];
    v104[0] = CFSTR("Workspace has been invalidated (process has exited).");
    v43 = (void *)MEMORY[0x1E0C99D80];
    v44 = (const __CFString **)v104;
    v45 = &v103;
LABEL_31:
    objc_msgSend(v43, "dictionaryWithObjects:forKeys:count:", v44, v45, 1);
    WeakRetained = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("FBWorkspace"), 1, WeakRetained);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v49 = 0;
LABEL_32:

    goto LABEL_33;
  }
  if (self->_test_rejectAllSceneClients)
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v101 = *MEMORY[0x1E0CB2D68];
    v102 = CFSTR("Workspace is rejecting all clients for unit tests.");
    v43 = (void *)MEMORY[0x1E0C99D80];
    v44 = &v102;
    v45 = &v101;
    goto LABEL_31;
  }
  if (v21)
  {
    lock_outgoingEndpoint = self->_lock_outgoingEndpoint;
    if (lock_outgoingEndpoint
      && -[BSServiceConnectionEndpoint isNullEndpoint](lock_outgoingEndpoint, "isNullEndpoint"))
    {
      v42 = (void *)MEMORY[0x1E0CB35C8];
      v99 = *MEMORY[0x1E0CB2D68];
      v100 = CFSTR("Workspace cannot establish a connection to a null endpoint.");
      v43 = (void *)MEMORY[0x1E0C99D80];
      v44 = &v100;
      v45 = &v99;
      goto LABEL_31;
    }
    lock_outgoingConnection = self->_lock_outgoingConnection;
    if (lock_outgoingConnection)
    {
      v48 = lock_outgoingConnection;
      v25 = 0;
LABEL_53:
      if (!-[FBWorkspaceConnection workspaceLock_isValid]((_BOOL8)v48))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("internal state error : connection is invalidated"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.6();
        objc_msgSend(objc_retainAutorelease(v83), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B89DCLL);
      }
      v60 = (objc_class *)objc_opt_class();
      if (objc_msgSend(v23, "_uikitShimming_isUISubclass"))
        v60 = (objc_class *)objc_opt_class();
      v85 = v25;
      v49 = (void *)objc_msgSend([v60 alloc], "initWithConnection:host:settings:clientSettings:fromRemnant:", v48, v88, v23, v24, v25);
      -[NSMutableDictionary setObject:forKey:](self->_lock_identityToSceneMap, "setObject:forKey:", v49, v20);
      WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
      FBLogProcessWorkspace();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        -[FBProcess logProem](WeakRetained);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v92 = v84;
        v93 = 2114;
        v94 = v49;
        v95 = 1024;
        v96 = v85;
        _os_log_impl(&dword_1A359A000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered new scene: %{public}@ (fromRemnant = %d)", buf, 0x1Cu);

      }
      v47 = 0;
      goto LABEL_32;
    }
    v57 = (FBWorkspaceOutgoingConnection *)-[FBWorkspaceOutgoingConnection initWithWorkspace:]((id *)[FBWorkspaceOutgoingConnection alloc], self);
    v58 = self->_lock_outgoingConnection;
    self->_lock_outgoingConnection = v57;

    v48 = v57;
    v59 = self->_lock_outgoingEndpoint;
    if (v59)
      -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:]((uint64_t)self->_lock_outgoingConnection, v59);
    v25 = 0;
  }
  else if (v25)
  {
    if (v37 != (void *)v25)
    {
      FBLogProcessWorkspace();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.7();

      v42 = (void *)MEMORY[0x1E0CB35C8];
      v97 = *MEMORY[0x1E0CB2D68];
      v98 = CFSTR("Invalid scene remnant provided.");
      v43 = (void *)MEMORY[0x1E0C99D80];
      v44 = &v98;
      v45 = &v97;
      goto LABEL_31;
    }
    -[NSMutableDictionary removeObjectForKey:](self->_lock_identityToRemnantsMap, "removeObjectForKey:", v20);
    v48 = self->_lock_incomingConnection;
    v25 = 1;
  }
  else
  {
    v48 = self->_lock_incomingConnection;
  }
  if (v48)
    goto LABEL_53;
  v47 = 0;
  v49 = 0;
LABEL_33:
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v37, "_assertion");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "invalidate");

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FBWorkspace_registerHost_settings_initialClientSettings_fromRemnant_error___block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_async(queue, block);
  if (a7)
    *a7 = objc_retainAutorelease(v47);
  v52 = v49;

  return v52;
}

- (id)_queue
{
  if (a1)
    a1 = (id *)a1[12];
  return a1;
}

- (id)initWithParentProcess:(id *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  id *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id *v35;
  id v36;
  NSObject *v37;
  void *v39;
  _QWORD v40[4];
  id *v41;
  objc_super v42;
  uint8_t buf[4];
  id *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace initWithParentProcess:].cold.1();
      objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35BB958);
    }
    v42.receiver = a1;
    v42.super_class = (Class)FBWorkspace;
    v5 = (id *)objc_msgSendSuper2(&v42, sel_init);
    a1 = v5;
    if (v5)
    {
      *((_DWORD *)v5 + 36) = 0;
      objc_msgSend(v4, "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "bundleIdentifier");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9)
          v9 = CFSTR("unknown");
        -[__CFString description](v9, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if ((int)objc_msgSend(v4, "pid") <= 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "pid"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBProcess:%@-%@"), v8, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D22FB0], "serial");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serviceClass:", 33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = BSDispatchQueueCreate();
      v17 = a1[11];
      a1[11] = (id)v16;

      objc_msgSend(MEMORY[0x1E0D23258], "_queueWithSerialDispatchQueue:", a1[11]);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = a1[12];
      a1[12] = (id)v18;

      objc_storeWeak(a1 + 2, v4);
      objc_msgSend(v4, "rbsHandle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        FBLogProcessWorkspace();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          -[FBProcess logProem](v4);
          v22 = (id *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v22;
          _os_log_impl(&dword_1A359A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering event dispatcher at init", buf, 0xCu);

        }
        +[FBWorkspaceEventDispatcher sharedInstance](FBWorkspaceEventDispatcher, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "registerSourceWithProcessHandle:", v20);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = a1[4];
        a1[4] = (id)v24;

      }
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = a1[6];
      a1[6] = v26;

      v28 = (void *)MEMORY[0x1E0D22F98];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __37__FBWorkspace_initWithParentProcess___block_invoke;
      v40[3] = &unk_1E4A12E00;
      a1 = a1;
      v41 = a1;
      objc_msgSend(v28, "assertionWithIdentifier:stateDidChangeHandler:", v8, v40);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = a1[13];
      a1[13] = (id)v29;

      *((_BYTE *)a1 + 149) = 1;
      if (objc_msgSend(v4, "isExtensionProcess"))
      {
        objc_msgSend(v4, "extensionInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "extensionIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          +[FBPreferences sharedInstance](FBPreferences, "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "disableXPCServicesEndpointHack");

          if ((v34 & 1) == 0)
            *((_BYTE *)a1 + 149) = 0;
        }
      }
      v35 = -[FBWorkspaceIncomingConnection initWithWorkspace:]((id *)[FBWorkspaceIncomingConnection alloc], a1);
      v36 = a1[3];
      a1[3] = v35;

      FBLogProcessWorkspace();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = a1;
        _os_log_impl(&dword_1A359A000, v37, OS_LOG_TYPE_DEFAULT, "Created %{public}@", buf, 0xCu);
      }

    }
  }

  return a1;
}

- (void)_updateProcessAssertionState
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[FBProcess logProem](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_15(&dword_1A359A000, a3, v5, "%{public}@ Workspace assertion failed: %{public}@", v6);

  OUTLINED_FUNCTION_8_2();
}

- (void)handshakeWithRemnants:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *p_lock;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  FBWorkspaceEventDispatcherSource *lock_eventDispatcherSource;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  BOOL v41;
  void *v43;
  uint64_t lock_incomingConnection;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  NSMutableDictionary *lock_identityToRemnantsMap;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSMutableDictionary *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  NSMutableDictionary *v70;
  void *v71;
  void *v72;
  void *v73;
  os_unfair_lock_s *v74;
  void *v75;
  id v76;
  id v77;
  NSObject *v78;
  void *v79;
  FBWorkspace *v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[5];
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  NSObject *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  int v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  -[FBWorkspace process](self, "process");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBWorkspaceConnection currentWorkspaceConnection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    FBLogProcessWorkspace();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBWorkspace handshakeWithRemnants:].cold.1();
    goto LABEL_13;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    if (-[FBWorkspaceOutgoingConnection queue_isVerified]((_BOOL8)v5) && !objc_msgSend(v4, "count"))
    {
      FBLogProcessWorkspace();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v79, "debugDescription");
        v53 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v97 = v53;
        _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_DEFAULT, "received outgoing handshake : process=%@", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v79, "description");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remoteToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("outgoing connection handshake wasn't verified or included remnants: process=%@ remote=%@ remnants=%@"), v8, v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBWorkspace _terminateWithReason:](self, "_terminateWithReason:", v13);

      FBLogProcessWorkspace();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v97 = v8;
        v98 = 2112;
        v99 = v10;
        v100 = 1024;
        v101 = objc_msgSend(v4, "count");
        _os_log_fault_impl(&dword_1A359A000, v14, OS_LOG_TYPE_FAULT, "outgoing connection handshake included remnants : process=%@ remote=%@ remnants=%u", buf, 0x1Cu);
      }

    }
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_didReceiveHandshake)
  {
    self->_lock_didReceiveHandshake = 1;
    if (self->_lock_invalidated)
    {
      FBLogProcessWorkspace();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[FBWorkspace handshakeWithRemnants:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
      goto LABEL_68;
    }
    lock_eventDispatcherSource = self->_lock_eventDispatcherSource;
    FBLogProcessWorkspace();
    v24 = objc_claimAutoreleasedReturnValue();
    v15 = v24;
    if (!lock_eventDispatcherSource)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[FBWorkspace handshakeWithRemnants:].cold.2(v15, v54, v55, v56, v57, v58, v59, v60);
      goto LABEL_68;
    }
    v74 = &self->_lock;
    v75 = v5;
    v80 = self;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v79, "debugDescription");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "remoteToken");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v97 = v25;
      v98 = 2112;
      v99 = v27;
      v100 = 1024;
      v101 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1A359A000, v15, OS_LOG_TYPE_DEFAULT, "received incoming handshake : process=%@ remote=%@ remnants=%u", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v78 = objc_claimAutoreleasedReturnValue();
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v76 = v4;
    v28 = v4;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    if (v29)
    {
      v30 = v29;
      v81 = *(_QWORD *)v91;
      v77 = v28;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v91 != v81)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v32, "identity");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            objc_msgSend(v33, "internalWorkspaceIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "identity");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "parameters");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v35)
              goto LABEL_36;
            +[FBWorkspaceDomain sharedInstance]();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[FBWorkspaceDomain reconnectableWorkspaces]((uint64_t)v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "containsObject:", v35);

            v41 = !v40 || v36 == 0;
            if (v41 || v37 == 0)
            {
LABEL_36:
              -[NSMutableDictionary objectForKey:](v80->_lock_identityToRemnantsMap, "objectForKey:", v34);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v43)
              {
                lock_incomingConnection = (uint64_t)v80->_lock_incomingConnection;
                v86[0] = MEMORY[0x1E0C809B0];
                v86[1] = 3221225472;
                v86[2] = __37__FBWorkspace_handshakeWithRemnants___block_invoke_4;
                v86[3] = &unk_1E4A12EC8;
                v87 = v34;
                -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](lock_incomingConnection, v86);
                v45 = v87;
                goto LABEL_42;
              }
            }
            else
            {
              -[NSMutableDictionary objectForKey:](v80->_lock_identityToRemnantsMap, "objectForKey:", v34);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                v45 = 0;
              }
              else
              {
                v47 = objc_alloc(MEMORY[0x1E0D23050]);
                objc_msgSend(v34, "description");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v88[0] = MEMORY[0x1E0C809B0];
                v88[1] = 3221225472;
                v88[2] = __37__FBWorkspace_handshakeWithRemnants___block_invoke;
                v88[3] = &unk_1E4A12FB0;
                v88[4] = v80;
                v89 = v34;
                v45 = (void *)objc_msgSend(v47, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.frontboard.workspace.remnant"), v48, v88);

              }
              objc_msgSend(MEMORY[0x1E0D231C0], "identityForProcessIdentity:", v36);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = -[FBSceneRemnant _initWithIdentity:client:workspace:parameters:assertionQueue:assertion:]([FBSceneRemnant alloc], "_initWithIdentity:client:workspace:parameters:assertionQueue:assertion:", v34, v49, v80, v37, 0, v45);
              -[NSObject addObject:](v78, "addObject:", v50);

              v28 = v77;
LABEL_42:

            }
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      }
      while (v30);
    }

    v15 = v78;
    v51 = -[NSObject count](v78, "count");
    lock_identityToRemnantsMap = v80->_lock_identityToRemnantsMap;
    if (v51)
    {
      v5 = v75;
      if (lock_identityToRemnantsMap)
      {
        -[NSMutableDictionary removeAllObjects](lock_identityToRemnantsMap, "removeAllObjects");
      }
      else
      {
        v61 = objc_opt_new();
        v62 = v80->_lock_identityToRemnantsMap;
        v80->_lock_identityToRemnantsMap = (NSMutableDictionary *)v61;

      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v63 = v78;
      v64 = -[NSObject countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v83;
        do
        {
          for (j = 0; j != v65; ++j)
          {
            if (*(_QWORD *)v83 != v66)
              objc_enumerationMutation(v63);
            v68 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
            objc_msgSend(v68, "_assertion");
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
            {
              v70 = v80->_lock_identityToRemnantsMap;
              objc_msgSend(v68, "definition");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "identity");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v70, "setObject:forKey:", v68, v72);

            }
          }
          v65 = -[NSObject countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
        }
        while (v65);
      }

      v4 = v76;
      p_lock = v74;
      v15 = v78;
      if (-[NSMutableDictionary count](v80->_lock_identityToRemnantsMap, "count"))
        goto LABEL_67;
      lock_identityToRemnantsMap = v80->_lock_identityToRemnantsMap;
    }
    else
    {
      v5 = v75;
      v4 = v76;
      p_lock = v74;
    }
    v80->_lock_identityToRemnantsMap = 0;

LABEL_67:
    +[FBWorkspaceEventDispatcher sharedInstance](FBWorkspaceEventDispatcher, "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "noteHandshakeFromSource:withRemnants:", v80->_lock_eventDispatcherSource, v15);

LABEL_68:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_14;
  }
  os_unfair_lock_unlock(&self->_lock);
  -[FBWorkspace _terminateWithReason:](self, "_terminateWithReason:", CFSTR("double handshake"));
  FBLogProcessWorkspace();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[FBWorkspace handshakeWithRemnants:].cold.4();
LABEL_13:

LABEL_14:
}

- (void)dealloc
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

void __37__FBWorkspace__enableLegacyRequests___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
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
        objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_requestScene:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (FBWorkspace)init
{
  return (FBWorkspace *)-[FBWorkspace initWithParentProcess:]((id *)&self->super.isa, 0);
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_weak_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (FBWorkspaceDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_delegate);
  os_unfair_lock_unlock(p_lock);
  return (FBWorkspaceDelegate *)WeakRetained;
}

- (BSAuditToken)auditToken
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  objc_msgSend(WeakRetained, "auditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAuditToken *)v3;
}

- (void)sendActions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *p_lock;
  FBSSerialQueue *workspaceQueue;
  _QWORD *WeakRetained;
  NSObject *v14;
  void *v15;
  void *v16;
  FBWorkspaceIncomingConnection *lock_incomingConnection;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_opt_class();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("only actions of type BSAction can be sent : tried to send %@"), v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBWorkspace sendActions:].cold.1();
            objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A35D638CLL);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v7);
    }

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      workspaceQueue = self->_workspaceQueue;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __27__FBWorkspace_sendActions___block_invoke;
      v21[3] = &unk_1E4A12348;
      v22 = v5;
      -[FBSSerialQueue performAsync:](workspaceQueue, "performAsync:", v21);
      WeakRetained = v22;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
      FBLogProcessWorkspace();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[FBProcess logProem](WeakRetained);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fbs_singleLineDescriptionOfBSActions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v15;
        v29 = 2114;
        v30 = v16;
        _os_log_impl(&dword_1A359A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending action(s): %{public}@", buf, 0x16u);

      }
      lock_incomingConnection = self->_lock_incomingConnection;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __27__FBWorkspace_sendActions___block_invoke_91;
      v19[3] = &unk_1E4A12E28;
      v19[4] = self;
      v20 = v5;
      -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:]((uint64_t)lock_incomingConnection, v19);

    }
    os_unfair_lock_unlock(p_lock);
  }

}

void __27__FBWorkspace_sendActions___block_invoke(uint64_t a1)
{
  id v1;
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
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidate", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __27__FBWorkspace_sendActions___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  dispatch_time_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && v5)
  {
    -[FBWorkspace _acquireAssertionForReason:withState:](*(_QWORD *)(a1 + 32), CFSTR("Send Actions"), 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __27__FBWorkspace_sendActions___block_invoke_2;
    v25[3] = &unk_1E4A11FD0;
    v26 = v7;
    v27 = v6;
    v9 = v6;
    v10 = v7;
    v11 = (void *)MEMORY[0x1A8590C4C](v25);
    v12 = *(_QWORD *)(a1 + 40);
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __27__FBWorkspace_sendActions___block_invoke_3;
    v23[3] = &unk_1E4A12B00;
    v24 = v11;
    v13 = v11;
    objc_msgSend(v3, "sendActions:completion:", v12, v23);
    v14 = dispatch_time(0, 5000000000);
    dispatch_after(v14, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 88), v13);

  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = *(id *)(a1 + 40);
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "invalidate", (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      }
      while (v16);
    }
  }

}

uint64_t __27__FBWorkspace_sendActions___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "signal");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "invalidate");
  return result;
}

uint64_t __27__FBWorkspace_sendActions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (os_unfair_lock_s)assertionState
{
  os_unfair_lock_s *os_unfair_lock_opaque_low;
  os_unfair_lock_s *v2;

  os_unfair_lock_opaque_low = a1;
  if (a1)
  {
    v2 = a1 + 36;
    os_unfair_lock_lock(a1 + 36);
    if (HIBYTE(os_unfair_lock_opaque_low[37]._os_unfair_lock_opaque))
      os_unfair_lock_opaque_low = 0;
    else
      os_unfair_lock_opaque_low = (os_unfair_lock_s *)LOBYTE(os_unfair_lock_opaque_low[37]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v2);
  }
  return os_unfair_lock_opaque_low;
}

- (id)_unregisterSceneForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *WeakRetained;
  NSObject *v12;
  void *v13;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  NSClassFromString(CFSTR("FBSSceneIdentity"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace _unregisterSceneForHost:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35D693CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspace _unregisterSceneForHost:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35D69A0);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_identityToSceneMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "host"), v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 == v4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
    FBLogProcessWorkspace();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](WeakRetained);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1A359A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Unregistering scene: %{public}@", buf, 0x16u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_lock_identityToSceneMap, "removeObjectForKey:", v7);

  }
  else
  {

    v9 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)_terminateWithReason:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D23198], "requestForProcess:withLabel:", WeakRetained, CFSTR("FBWorkspace misbehaving process"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReportType:", 1);
    objc_msgSend(v5, "setExceptionCode:", 1269680657);
    objc_msgSend(v5, "setExplanation:", v6);
    objc_msgSend(v5, "execute");

  }
}

- (void)_dropLaunchAssertion
{
  os_unfair_lock_s *p_lock;
  RBSAssertion *v4;
  RBSAssertion *lock_connectAssertion;
  _QWORD *WeakRetained;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_connectAssertion;
  lock_connectAssertion = self->_lock_connectAssertion;
  self->_lock_connectAssertion = 0;

  os_unfair_lock_unlock(p_lock);
  -[FBWorkspace _updateProcessAssertionState](self, "_updateProcessAssertionState");
  if (-[RBSAssertion isValid](v4, "isValid"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
    FBLogProcessWorkspace();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](WeakRetained);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping launch assertion.", (uint8_t *)&v9, 0xCu);

    }
    -[RBSAssertion invalidate](v4, "invalidate");

  }
}

- (id)createServiceQueue
{
  return -[FBWorkspaceServiceDispatchingQueue _initWithTargetQueue:]([FBWorkspaceServiceDispatchingQueue alloc], "_initWithTargetQueue:", self->_queue);
}

- (void)_handleSceneRequest:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSMutableArray *lock_pendedRequests;
  NSObject *v14;
  _QWORD block[5];
  id v16;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    FBLogProcessWorkspace();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FBWorkspace _handleSceneRequest:].cold.3(v6);
LABEL_4:

    FBSWorkspaceErrorCreate();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateWithError:", v7);
    goto LABEL_5;
  }
  if (!self->_lock_eventDispatcherSource)
  {
    FBLogProcessWorkspace();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FBWorkspace _handleSceneRequest:].cold.1(v6);
    goto LABEL_4;
  }
  if (self->_lock_didReceiveHandshake)
  {
    +[FBWorkspaceEventDispatcher sharedInstance](FBWorkspaceEventDispatcher, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "handleSceneRequest:fromSource:", v4, self->_lock_eventDispatcherSource);

    if ((v9 & 1) != 0)
      goto LABEL_6;
    if (!objc_msgSend(v4, "requiresModernDispatcher"))
    {
      lock_pendedRequests = self->_lock_pendedRequests;
      if (lock_pendedRequests)
      {
        -[NSMutableArray addObject:](lock_pendedRequests, "addObject:", v4);
      }
      else
      {
        +[FBProcess calloutQueue](FBProcess, "calloutQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __35__FBWorkspace__handleSceneRequest___block_invoke;
        block[3] = &unk_1E4A11FD0;
        block[4] = self;
        v16 = v4;
        dispatch_async(v14, block);

      }
      goto LABEL_6;
    }
    objc_msgSend(v4, "targetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FBSWorkspaceErrorCreate();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateWithError:", v10, v7);

LABEL_5:
LABEL_6:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_7;
  }
  FBLogProcessWorkspace();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[FBWorkspace _handleSceneRequest:].cold.2(v11);

  os_unfair_lock_unlock(&self->_lock);
  -[FBWorkspace _terminateWithReason:](self, "_terminateWithReason:", CFSTR("scene request before handshake"));
  FBSWorkspaceErrorCreate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateWithError:", v12);

LABEL_7:
}

void __35__FBWorkspace__handleSceneRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 151);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 144));
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    FBSWorkspaceErrorCreate();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateWithError:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_requestScene:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_setIncomingConnection:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;
  _QWORD *WeakRetained;
  NSObject *v6;

  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 144);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (*(_BYTE *)(a1 + 151))
    {
      FBLogProcessWorkspace();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[FBWorkspace _setIncomingConnection:].cold.1(WeakRetained, v6);

      objc_msgSend(v3, "invalidate");
    }
    else
    {
      -[FBWorkspaceIncomingConnection workspaceLock_setConnection:](*(_QWORD *)(a1 + 24), v3);
    }
    os_unfair_lock_unlock(v4);

  }
}

- (void)_noteProcessBootstrapped:(void *)a3 withHandle:(void *)a4 assertion:(void *)a5 outgoingEndpoint:
{
  _QWORD *v9;
  id v10;
  id v11;
  id v12;
  _QWORD *WeakRetained;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void (**v34)(_QWORD);
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[4];
  _QWORD *v45;
  _QWORD v46[4];
  _QWORD *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained != v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process == _weak_process"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:].cold.5();
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D743CLL);
    }
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:].cold.1();
      objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D74A0);
    }
    if (!v10 && (objc_msgSend(v12, "isNullEndpoint") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("workspace's process bootstrapped without a handle but still had a valid outgoing endpoint : process=%@ endpoint=%@"), v9, v12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:].cold.4();
      objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D755CLL);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already noted bootstrap of process : previousEndpoint=%@ newEndpoint=%@ newHandle=%@"), v14, v12, v10);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:].cold.3();
      objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D7500);
    }
    objc_storeStrong((id *)(a1 + 64), a5);
    if (!v10 || *(_BYTE *)(a1 + 151))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_3;
      v44[3] = &unk_1E4A12348;
      v45 = v9;
      objc_msgSend(v45, "_launchDidComplete:finalizeBlock:", 0, v44);
      objc_msgSend(v11, "invalidate");
      v15 = v45;
LABEL_31:

      goto LABEL_32;
    }
    v43 = objc_msgSend(*(id *)(a1 + 80), "count");
    if (*(_QWORD *)(a1 + 32))
    {
      if (!v11)
      {
LABEL_20:
        FBAnalyticsLogHangTracerEvent(v9, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 24);
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke;
        v49[3] = &unk_1E4A12E50;
        v15 = v24;
        v53 = v15;
        v26 = v9;
        v50 = v26;
        v51 = v11;
        v52 = a1;
        -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](v25, v49);
        v27 = *(_QWORD *)(a1 + 72);
        if (v27)
          -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:](v27, *(void **)(a1 + 64));
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
        if (*(_BYTE *)(a1 + 149))
        {
          +[FBWorkspaceDomain sharedInstance]();
          v28 = objc_claimAutoreleasedReturnValue();
          -[FBWorkspaceDomain endpointInjectorTargetingProcess:]((uint64_t)v28, v10);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(a1 + 56);
          *(_QWORD *)(a1 + 56) = v29;

          v31 = v43;
        }
        else
        {
          FBLogProcessWorkspace();
          v28 = objc_claimAutoreleasedReturnValue();
          v31 = v43;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            -[FBProcess logProem](v26);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v55 = v32;
            _os_log_impl(&dword_1A359A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping workspace endpoint injector.", buf, 0xCu);

          }
        }
        v33 = MEMORY[0x1E0C809B0];

        if (v31)
        {
          objc_msgSend((id)a1, "_updateProcessAssertionState");
          objc_msgSend((id)a1, "_resolveSceneLifecycleStateAndInterruptionPolicy");
        }
        v46[0] = v33;
        v46[1] = 3221225472;
        v46[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_147;
        v46[3] = &unk_1E4A11FD0;
        v47 = v26;
        v48 = v10;
        v34 = (void (**)(_QWORD))MEMORY[0x1A8590C4C](v46);
        if (qos_class_self() <= 0x18)
        {
          v35 = BSDispatchBlockCreateWithQualityOfService();

          v34 = (void (**)(_QWORD))v35;
        }
        v34[2](v34);

        goto LABEL_31;
      }
    }
    else
    {
      FBLogProcessWorkspace();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[FBProcess logProem](v9);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v41;
        _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering event dispatcher after bootstrap", buf, 0xCu);

      }
      +[FBWorkspaceEventDispatcher sharedInstance](FBWorkspaceEventDispatcher, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerSourceWithProcessHandle:", v10);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v18;

      if (!v11)
        goto LABEL_20;
    }
    v20 = objc_msgSend(v11, "fb_workspaceAssertionState");
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("workspace assertion but no workspace assertion state"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:].cold.2();
      objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D75B4);
    }
    v21 = v20;
    FBLogProcessWorkspace();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](v9);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromFBWorkspaceAssertionState(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v42;
      v56 = 2114;
      v57 = v23;
      _os_log_impl(&dword_1A359A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Initial launch assertion state: %{public}@.", buf, 0x16u);

    }
    objc_storeStrong((id *)(a1 + 120), a4);
    objc_msgSend(*(id *)(a1 + 120), "addObserver:", a1);
    goto LABEL_20;
  }
LABEL_32:

}

void __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, a2 != 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2;
  v8[3] = &unk_1E4A11FD0;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v5, "_launchDidComplete:finalizeBlock:", a2 != 0, v8);

}

uint64_t __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_dropLaunchAssertion");
  return result;
}

void __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_147(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2_148;
  v3[3] = &unk_1E4A12E78;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "monitorForDeath:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2_148(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  FBProcessExitContext *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = -[FBProcessExitContext initWithUnderlyingContext:]([FBProcessExitContext alloc], "initWithUnderlyingContext:", v6);
    objc_msgSend(WeakRetained, "_processDidExitWithContext:", v5);

  }
}

uint64_t __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processDidExitWithContext:", 0);
}

- (void)_callOutQueue_requestScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FBWorkspace delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__FBWorkspace__callOutQueue_requestScene___block_invoke;
    v8[3] = &unk_1E4A12EA0;
    v9 = v4;
    objc_msgSend(v5, "workspace:didReceiveSceneRequestWithOptions:completion:", self, v6, v8);

  }
  else
  {
    FBSWorkspaceErrorCreate();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateWithError:", v7);

  }
}

void __42__FBWorkspace__callOutQueue_requestScene___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithScene:", a2);
  }
  else
  {
    FBSWorkspaceErrorCreate();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidateWithError:", v3);

  }
}

- (void)_noteProcessDidInvalidate:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const os_unfair_lock **v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  NSObject *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD block[4];
  id v56;
  _QWORD *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained != v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process == _weak_process"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspace _noteProcessDidInvalidate:].cold.1();
      objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35D7E58);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if (*(_BYTE *)(a1 + 151))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    }
    else
    {
      *(_BYTE *)(a1 + 151) = 1;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v5 = *(id *)(a1 + 48);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v59 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            FBSWorkspaceErrorCreate();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "invalidateWithError:", v11);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        }
        while (v7);
      }

      v12 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      FBLogProcessWorkspace();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[FBProcess logProem](v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v65 = v14;
        _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating workspace.", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "allValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 80), "allValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "removeAllObjects");
      -[FBWorkspaceConnection workspaceLock_invalidate](*(const os_unfair_lock ***)(a1 + 24));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = *(const os_unfair_lock ***)(a1 + 72);
      if (v18)
      {
        -[FBWorkspaceConnection workspaceLock_invalidate](v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          if (v17)
            objc_msgSend(v17, "addObjectsFromArray:", v19);
          else
            v17 = v19;
        }

      }
      v21 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      v22 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      objc_msgSend(*(id *)(a1 + 56), "invalidate");
      v23 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      objc_msgSend(*(id *)(a1 + 120), "invalidate");
      v24 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = 0;

      objc_msgSend(*(id *)(a1 + 112), "invalidate");
      v25 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = 0;

      objc_msgSend(*(id *)(a1 + 128), "invalidate");
      v26 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = 0;

      v27 = objc_msgSend(v16, "count");
      v28 = MEMORY[0x1E0C809B0];
      if (v27)
      {
        +[FBProcess calloutQueue](FBProcess, "calloutQueue");
        v29 = objc_claimAutoreleasedReturnValue();
        block[0] = v28;
        block[1] = 3221225472;
        block[2] = __41__FBWorkspace__noteProcessDidInvalidate___block_invoke;
        block[3] = &unk_1E4A11FD0;
        v56 = v16;
        v57 = v3;
        dispatch_async(v29, block);

      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
      objc_msgSend(*(id *)(a1 + 104), "invalidate");
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v30 = v15;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v52 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v35, "_assertion");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "invalidate");

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        }
        while (v32);
      }

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v37 = v16;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      v39 = MEMORY[0x1E0C809B0];
      if (v38)
      {
        v40 = v38;
        v41 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v48 != v41)
              objc_enumerationMutation(v37);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "invalidate");
          }
          v40 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        }
        while (v40);
      }

      if (objc_msgSend(v17, "count"))
      {
        v43 = *(NSObject **)(a1 + 88);
        v45[0] = v39;
        v45[1] = 3221225472;
        v45[2] = __41__FBWorkspace__noteProcessDidInvalidate___block_invoke_2;
        v45[3] = &unk_1E4A12348;
        v46 = v17;
        dispatch_async(v43, v45);

      }
    }
  }

}

void __41__FBWorkspace__noteProcessDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "host");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "exitContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "createError");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        FBSceneErrorCreate(4uLL, CFSTR("Client process exited."), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "clientToken:didInvalidateWithError:", v6, v10);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __41__FBWorkspace__noteProcessDidInvalidate___block_invoke_2(uint64_t a1)
{
  id v1;
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
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_terminateGracefully:(void *)a3 withTransitionContext:
{
  id v5;
  id v6;
  id WeakRetained;
  os_unfair_lock_s *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  if (!a1)
  {
LABEL_6:

    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

  if (WeakRetained == v5)
  {
    v8 = (os_unfair_lock_s *)(a1 + 144);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if (!*(_BYTE *)(a1 + 151))
    {
      v9 = *(_QWORD *)(a1 + 24);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__FBWorkspace__terminateGracefully_withTransitionContext___block_invoke;
      v11[3] = &unk_1E4A12EC8;
      v12 = v6;
      -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](v9, v11);

    }
    os_unfair_lock_unlock(v8);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("process == _weak_process"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBWorkspace _terminateGracefully:withTransitionContext:].cold.1();
  objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __58__FBWorkspace__terminateGracefully_withTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willTerminateWithTransitionContext:", *(_QWORD *)(a1 + 32));
}

- (void)_lock
{
  if (a1)
    os_unfair_lock_lock(a1 + 36);
}

- (void)_unlock
{
  if (a1)
    os_unfair_lock_unlock(a1 + 36);
}

- (void)_assertLocked
{
  if (a1)
    os_unfair_lock_assert_owner(a1 + 36);
}

- (id)_connectionQueue
{
  if (a1)
    a1 = (id *)a1[11];
  return a1;
}

- (void)_queue_unverifiedOutgoingConnection:(void *)a3 didError:
{
  const os_unfair_lock **v5;
  id v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (os_unfair_lock_s *)(a1 + 144);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if (*(_BYTE *)(a1 + 151))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    }
    else
    {
      if (*(const os_unfair_lock ***)(a1 + 72) != v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unverified outgoingConnection is unknown : expected=%@ actual=%@"), *(_QWORD *)(a1 + 72), v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspace _queue_unverifiedOutgoingConnection:didError:].cold.1();
        objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35D85A8);
      }
      v10 = *(void **)(a1 + 80);
      v11 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke;
      v39[3] = &unk_1E4A12EF0;
      v12 = v7;
      v40 = v12;
      v13 = v8;
      v41 = v13;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v39);
      objc_msgSend(*(id *)(a1 + 80), "removeObjectsForKeys:", v12);
      -[FBWorkspaceConnection workspaceLock_invalidate](v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      if (objc_msgSend(v13, "count"))
      {
        +[FBProcess calloutQueue](FBProcess, "calloutQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke_2;
        block[3] = &unk_1E4A11FD0;
        v37 = v13;
        v38 = v6;
        dispatch_async(v16, block);

      }
      os_unfair_lock_unlock(v9);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = v13;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v21++), "invalidate");
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        }
        while (v19);
      }

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v22 = v14;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v29;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v29 != v25)
              objc_enumerationMutation(v22);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v26++) + 16))();
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        }
        while (v24);
      }

    }
  }

}

void __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "usesOutgoingConnection"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "host", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "clientToken:didInvalidateWithError:", v7, *(_QWORD *)(a1 + 40));

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)unregisterHost:(id)a3
{
  -[FBWorkspace host:didInvalidateWithTransitionContext:completion:](self, "host:didInvalidateWithTransitionContext:completion:", a3, 0, 0);
}

- (void)host:(id)a3 didInvalidateWithTransitionContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  FBWorkspace *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke;
  v23[3] = &unk_1E4A12F18;
  v24 = v9;
  v11 = a3;
  v12 = (void *)MEMORY[0x1A8590C4C](v23);
  -[FBWorkspace _unregisterSceneForHost:](self, "_unregisterSceneForHost:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_2;
  block[3] = &unk_1E4A12920;
  v19 = v13;
  v20 = self;
  v21 = v8;
  v22 = v12;
  v15 = v12;
  v16 = v8;
  v17 = v13;
  dispatch_async(queue, block);

}

uint64_t __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_3;
    v9[3] = &unk_1E4A12F40;
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 32);
    -[FBWorkspaceScene workspace:sendInvalidationWithTransitionContext:completion:](v2, v3, v4, v9);
    objc_msgSend(*(id *)(a1 + 40), "_resolveSceneLifecycleStateAndInterruptionPolicy");

    v5 = v11;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D68];
    v13[0] = CFSTR("Scene client is invalid.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("FBWorkspace"), 1, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);

  }
}

uint64_t __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)host:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  FBWorkspace *v15;
  id v16;
  Class v17;

  v8 = a4;
  -[FBWorkspace _sceneForHost:](self, "_sceneForHost:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__FBWorkspace_host_didReceiveActions_forExtension___block_invoke;
  v13[3] = &unk_1E4A12F68;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v17 = a5;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, v13);

}

void __51__FBWorkspace_host_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
  -[FBWorkspaceScene workspace:sendActions:toExtension:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __37__FBWorkspace_handshakeWithRemnants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 151))
  {
    objc_msgSend(*(id *)(v4 + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_assertion");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(a1 + 32);
    if (v6 == v3)
    {
      objc_msgSend(*(id *)(v4 + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = 0;

      }
      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __37__FBWorkspace_handshakeWithRemnants___block_invoke_2;
      v11[3] = &unk_1E4A12EC8;
      v12 = v9;
      -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](v10, v11);

      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 144));

}

uint64_t __37__FBWorkspace_handshakeWithRemnants___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneID:destroyWithTransitionContext:completion:", *(_QWORD *)(a1 + 32), 0, &__block_literal_global_10);
}

uint64_t __37__FBWorkspace_handshakeWithRemnants___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneID:destroyWithTransitionContext:completion:", *(_QWORD *)(a1 + 32), 0, &__block_literal_global_238);
}

- (void)workspaceID:(id)a3 sendActions:(id)a4 completion:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  _QWORD *WeakRetained;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  FBWorkspaceSceneRequest *v18;
  FBWorkspaceSceneRequest *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
    FBLogProcessWorkspace();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[FBProcess logProem](WeakRetained);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v14 = v8;
      else
        v14 = CFSTR("(default)");
      objc_msgSend(v9, "fbs_singleLineDescriptionOfBSActions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_1A359A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Received action(s) for workspace %{public}@: %{public}@", buf, 0x20u);

    }
    if (v8)
    {
      v16 = v8;
    }
    else
    {
      +[FBWorkspaceDomain sharedInstance]();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBWorkspaceDomain defaultWorkspace]((uint64_t)v17);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v18 = [FBWorkspaceSceneRequest alloc];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__FBWorkspace_workspaceID_sendActions_completion___block_invoke;
    v20[3] = &unk_1E4A12FF8;
    v21 = v10;
    v19 = -[FBWorkspaceSceneRequest initWithTargetIdentifier:actions:completion:](v18, "initWithTargetIdentifier:actions:completion:", v16, v9, v20);
    -[FBWorkspace _handleSceneRequest:](self, "_handleSceneRequest:", v19);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __50__FBWorkspace_workspaceID_sendActions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)createSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  FBWorkspaceSceneRequest *v15;
  FBWorkspaceSceneRequest *v16;
  _QWORD v17[4];
  void (**v18)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[FBWorkspaceConnection currentWorkspaceConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v7)
      goto LABEL_11;
LABEL_8:
    FBSWorkspaceErrorCreate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13);

    goto LABEL_11;
  }
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    if (!v7)
      goto LABEL_11;
    goto LABEL_8;
  }
  objc_msgSend(v6, "workspaceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    +[FBWorkspaceDomain sharedInstance]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceDomain defaultWorkspace]((uint64_t)v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = [FBWorkspaceSceneRequest alloc];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__FBWorkspace_createSceneWithOptions_completion___block_invoke;
  v17[3] = &unk_1E4A12FF8;
  v18 = v7;
  v16 = -[FBWorkspaceSceneRequest initWithTargetIdentifier:options:completion:](v15, "initWithTargetIdentifier:options:completion:", v12, v6, v17);
  -[FBWorkspace _handleSceneRequest:](self, "_handleSceneRequest:", v16);

LABEL_11:
}

uint64_t __49__FBWorkspace_createSceneWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  FBWorkspaceSceneRequest *v17;
  FBWorkspaceSceneRequest *v18;
  _QWORD v19[5];
  void (**v20)(id, _QWORD, void *);
  char v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  +[FBWorkspaceConnection currentWorkspaceConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v7)
      goto LABEL_15;
LABEL_9:
    FBSWorkspaceErrorCreate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);

    goto LABEL_15;
  }
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    if (!v7)
      goto LABEL_15;
    goto LABEL_9;
  }
  if (v7)
  {
    objc_msgSend(v6, "workspaceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[FBWorkspaceDomain sharedInstance]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBWorkspaceDomain defaultWorkspace]((uint64_t)v14);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v6, "isKeyboardScene"))
    {
      -[FBWorkspace process](self, "process");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasEntitlement:", CFSTR("com.apple.frontboard.keyboard-provider"));

    }
    else
    {
      v16 = 0;
    }
    v17 = [FBWorkspaceSceneRequest alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke;
    v19[3] = &unk_1E4A13048;
    v21 = v16;
    v19[4] = self;
    v20 = v7;
    v18 = -[FBWorkspaceSceneRequest initWithTargetIdentifier:options:completion:](v17, "initWithTargetIdentifier:options:completion:", v12, v6, v19);
    -[FBWorkspace _handleSceneRequest:](self, "_handleSceneRequest:", v18);

  }
LABEL_15:

}

void __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 48))
      +[FBSceneManager setKeyboardScene:](FBSceneManager, "setKeyboardScene:", v5);
    objc_msgSend(v5, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sceneForIdentity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "host"), v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 == v5))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke_2;
      v14[3] = &unk_1E4A13020;
      v14[4] = *(_QWORD *)(a1 + 32);
      v15 = v7;
      v16 = v9;
      v17 = *(id *)(a1 + 40);
      -[FBWorkspaceScene _enqueueSceneCreateCompletionBlock:]((uint64_t)v16, v14);

    }
    else
    {
      if (objc_msgSend(v5, "isValid") && (objc_msgSend(v5, "isActive") & 1) != 0)
        v11 = *(_QWORD *)(a1 + 40);
      else
        v11 = *(_QWORD *)(a1 + 40);
      FBSWorkspaceErrorCreate();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);

    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v6);
  }

}

void __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "_sceneForIdentity:", *(_QWORD *)(a1 + 40)),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = *(void **)(a1 + 48),
        v5,
        v5 == v6))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    FBSWorkspaceErrorCreate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

- (void)sceneID:(id)a3 didReceiveActions:(id)a4 forExtension:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  Class v12;
  NSObject *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = (NSString *)a5;
  -[FBWorkspace _sceneForIdentity:](self, "_sceneForIdentity:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    FBLogProcessScene();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FBWorkspace sceneID:didReceiveActions:forExtension:].cold.1();
    goto LABEL_8;
  }
  if (!v10)
  {
    v12 = 0;
    goto LABEL_10;
  }
  v12 = NSClassFromString(v10);
  if (v12)
  {
LABEL_10:
    +[FBWorkspaceConnection currentWorkspaceConnection]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceScene workspace:handleActions:forExtension:fromConnection:]((uint64_t)v11, self, v9, (uint64_t)v12, v14);

    goto LABEL_11;
  }
  FBLogProcessScene();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[FBWorkspace sceneID:didReceiveActions:forExtension:].cold.2();
LABEL_8:

LABEL_11:
}

- (void)sceneID:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a5;
  FBLogProcessScene();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[FBWorkspace sceneID:sendMessage:withResponse:].cold.1();

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  FBLogProcessWorkspace();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[FBProcess logProem](WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "succinctDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Launch assertion invalidated: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[FBWorkspace _dropLaunchAssertion](self, "_dropLaunchAssertion");

}

- (void)assertionWillInvalidate:(id)a3
{
  _QWORD *WeakRetained;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  FBLogProcessWorkspace();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[FBProcess logProem](WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Launch assertion will expire.", (uint8_t *)&v6, 0xCu);

  }
}

- (BOOL)test_rejectAllSceneClients
{
  return self->_test_rejectAllSceneClients;
}

- (void)test_setRejectAllSceneClients:(BOOL)a3
{
  self->_test_rejectAllSceneClients = a3;
}

- (void)initWithParentProcess:.cold.1()
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

- (void)sendActions:.cold.1()
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

- (void)_sceneForIdentity:.cold.1()
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

- (void)_unregisterSceneForHost:.cold.1()
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

- (void)_handleSceneRequest:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, a1, v4, "ignoring scene request because we have no dispatcher registration : from=%@", v5);

  OUTLINED_FUNCTION_8_2();
}

- (void)_handleSceneRequest:(NSObject *)a1 .cold.2(NSObject *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, a1, v4, "ignoring request before handshake : from=%@", v5);

  OUTLINED_FUNCTION_8_2();
}

- (void)_handleSceneRequest:(NSObject *)a1 .cold.3(NSObject *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, a1, v4, "ignoring scene request because we're already invalidating : from=%@", v5);

  OUTLINED_FUNCTION_8_2();
}

- (void)_setIncomingConnection:(_QWORD *)a1 .cold.1(_QWORD *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[FBProcess logProem](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, v4, "%{public}@ attempted to assign a new connection to an invalidated workspace server.", v5);

}

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.1()
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

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.2()
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

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.3()
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

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.4()
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

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.5()
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

- (void)_enableLegacyRequests:.cold.1()
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

- (void)_noteProcessDidInvalidate:.cold.1()
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

- (void)_terminateGracefully:withTransitionContext:.cold.1()
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

- (void)_queue_unverifiedOutgoingConnection:didError:.cold.1()
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
  OUTLINED_FUNCTION_10();
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
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = 0;
  OUTLINED_FUNCTION_15(&dword_1A359A000, v0, v1, "invalid remnant specified: remnant=%{public}@ connection=%{public}@", v2);
  OUTLINED_FUNCTION_12();
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.9()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.11()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.12()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.13()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.14()
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

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.16()
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

- (void)handshakeWithRemnants:.cold.1()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint8_t v5[40];
  uint64_t v6;

  OUTLINED_FUNCTION_6_0();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteToken");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_1();
  _os_log_error_impl(&dword_1A359A000, v0, OS_LOG_TYPE_ERROR, "ignoring handshake for unknown connection : process=%@ remote=%@ remnants=%u", v5, 0x1Cu);

  OUTLINED_FUNCTION_13_2();
}

- (void)handshakeWithRemnants:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "ignoring handshake because we have no dispatcher registration", a5, a6, a7, a8, 0);
}

- (void)handshakeWithRemnants:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "ignoring handshake because we're already invalidating", a5, a6, a7, a8, 0);
}

- (void)handshakeWithRemnants:.cold.4()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint8_t v5[40];
  uint64_t v6;

  OUTLINED_FUNCTION_6_0();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteToken");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_1();
  _os_log_fault_impl(&dword_1A359A000, v0, OS_LOG_TYPE_FAULT, "double handshake detected : process=%@ remote=%@ remnants=%u", v5, 0x1Cu);

  OUTLINED_FUNCTION_13_2();
}

- (void)sceneID:didUpdateClientSettingsWithDiff:transitionContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, v0, v1, "[%{public}@] No scene exists for this identity (didUpdateClientSettingsWithDiff)", v2);
  OUTLINED_FUNCTION_12();
}

- (void)sceneID:didReceiveActions:forExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, v0, v1, "[%{public}@] Unable to deliver actions because no scene exists with this identity.", v2);
  OUTLINED_FUNCTION_12();
}

- (void)sceneID:didReceiveActions:forExtension:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = v0;
  OUTLINED_FUNCTION_15(&dword_1A359A000, v1, (uint64_t)v1, "[%{public}@] Unable to deliver actions to extension \"%{public}@\" because that class does not exist.", v2);
  OUTLINED_FUNCTION_12();
}

- (void)sceneID:sendMessage:withResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7(&dword_1A359A000, v0, v1, "[%{public}@] Ignoring scene message since this functionality is no longer supported.", v2);
  OUTLINED_FUNCTION_12();
}

@end
