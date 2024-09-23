@implementation FBSceneWorkspace

uint64_t __44__FBSceneWorkspace__endSynchronizationBlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneManagerDidEndSceneUpdateSynchronization:", __LegacyManager);
}

uint64_t __46__FBSceneWorkspace__beginSynchronizationBlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneManagerWillBeginSceneUpdateSynchronization:", __LegacyManager);
}

- (void)_executeNextIdleEventIfAppropriate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _executeNextIdleEventIfAppropriate]");
    if ((objc_msgSend(*(id *)(a1 + 40), "isLocked") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "executingEvent");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v2)
      {
        objc_msgSend(*(id *)(a1 + 40), "pendingEvents");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "count");

        if (v4 || !objc_msgSend(*(id *)(a1 + 48), "count"))
          return;
        objc_msgSend(*(id *)(a1 + 48), "firstObject");
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "removeObjectAtIndex:", 0);
        objc_msgSend(*(id *)(a1 + 40), "executeOrInsertEvent:atPosition:", v5, 1);
        v2 = (void *)v5;
      }

    }
  }
}

- (void)_beginSynchronizationBlock
{
  OUTLINED_FUNCTION_0_1(&dword_1A359A000, a1, a3, "Begin scene update synchronization.", a5, a6, a7, a8, 0);
}

- (void)_endSynchronizationBlock
{
  OUTLINED_FUNCTION_0_1(&dword_1A359A000, a1, a3, "End scene update synchronization.", a5, a6, a7, a8, 0);
}

- (void)_executeEventWhenIdle:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3;
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _executeEventWhenIdle:]");
    v3 = v4;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
      -[FBSceneWorkspace _executeNextIdleEventIfAppropriate](a1);
      v3 = v4;
    }
  }

}

- (void)_enqueueEventForScene:(void *)a3 withName:(void *)a4 block:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _enqueueEventForScene:withName:block:]");
    -[FBSceneWorkspace _eventForScene:withName:block:](a1, v9, v7, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(*(id *)(a1 + 40), "executeOrInsertEvent:atPosition:", v10, 1);

  }
}

- (id)_eventForScene:(void *)a3 withName:(uint64_t)a4 block:
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = 0;
  if (a1 && a4)
  {
    objc_msgSend(MEMORY[0x1E0D22FC8], "eventWithName:handler:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSString)workspaceIdentifier
{
  return self->_identifier;
}

- (void)didReceiveHandshake:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  FBSceneManagerObserver *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_suppressConnectionHandshakes || (v10 = self->_delegate) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v4, "remnants", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "invalidate");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
  else
  {
    v5 = v10;
    -[FBSceneManagerObserver workspace:clientDidConnectWithHandshake:](v10, "workspace:clientDidConnectWithHandshake:", self, v4);
  }

}

- (void)_synchronizeChanges:(uint64_t)a1
{
  void (**v3)(_QWORD);

  if (a1)
  {
    if (a2)
    {
      v3 = a2;
      -[FBSceneWorkspace _beginSynchronizationBlock](a1);
      v3[2](v3);

      -[FBSceneWorkspace _endSynchronizationBlock](a1);
    }
  }
}

- (BOOL)_isSynchronizingSceneUpdates
{
  if (result)
    return *(_QWORD *)(result + 56) != 0;
  return result;
}

- (void)addWorkspaceObserver:(uint64_t)a1
{
  id v3;
  FBSceneManagerObserver *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace addWorkspaceObserver:]");
    v3 = v5;
    if (v5)
    {
      v4 = -[FBSceneManagerObserver initWithObserver:supportLegacy:]([FBSceneManagerObserver alloc], "initWithObserver:supportLegacy:", v5, *(unsigned __int8 *)(a1 + 85));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      if ((objc_msgSend(*(id *)(a1 + 24), "containsObject:", v4) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 24), "addObject:", v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));

      v3 = v5;
    }
  }

}

- (id)sceneWithIdentityToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id result;
  void *v11;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace sceneWithIdentityToken:]");
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSceneWorkspace sceneWithIdentifier:](self, "sceneWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      && (objc_msgSend(v6, "identityToken"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqual:", v4),
          v7,
          v8))
    {
      v9 = v6;
    }
    else
    {
      v9 = 0;
    }

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("token"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace sceneWithIdentityToken:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)sceneWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(1, (uint64_t)"-[FBSceneWorkspace sceneWithIdentifier:]");
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_allScenesByID, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allScenes
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace allScenes]");
  return (id)-[NSMutableDictionary allValues](self->_allScenesByID, "allValues");
}

- (char)_createSceneWithDefinition:(void *)a3 settings:(void *)a4 initialClientSettings:(void *)a5 transitionContext:(void *)a6 fromRemnant:(void *)a7 usingClientProvider:(void *)a8 completion:
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  unint64_t v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
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
  uint64_t v73;
  unint64_t v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;

  v80 = a2;
  v15 = a3;
  v79 = a4;
  v77 = a5;
  v16 = a6;
  v76 = a7;
  v75 = a8;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_55;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]");
  if (*(_BYTE *)(a1 + 84))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_invalidated"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.25();
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B251CLL);
  }
  if ((objc_msgSend(v80, "isValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[definition isValid]"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.24();
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B2580);
  }
  objc_msgSend(v80, "identity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v18;
  NSClassFromString(CFSTR("NSString"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B25E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B2648);
  }

  objc_msgSend(v80, "specification");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B26ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B2710);
  }

  v78 = v19;
  if (v16)
  {
    v21 = v16;
    NSClassFromString(CFSTR("FBSceneRemnant"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.21();
      objc_msgSend(objc_retainAutorelease(v61), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B29C8);
    }

    objc_msgSend(v21, "definition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "internalWorkspaceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = a1;
    v25 = BSEqualObjects();

    if ((v25 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSEqualObjects([[[remnant definition] identity] internalWorkspaceIdentifier], _identifier)"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.20();
      objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2A28);
    }
    a1 = v73;
    if (objc_msgSend(v21, "_hasBeenInvalidated"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot create a scene from an invalidated remnant"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.3();
      objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2A80);
    }
  }
  v26 = v77;
  if (v26)
  {
    NSClassFromString(CFSTR("FBSSceneTransitionContext"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneTransitionContextClass]"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.19();
      objc_msgSend(objc_retainAutorelease(v64), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2AE4);
    }
  }

  v27 = v76;
  v28 = (unint64_t)v27;
  if (v27)
  {
    if ((objc_msgSend(v27, "conformsToProtocol:", &unk_1EE6CC128) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(FBSceneClientProvider)]"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.16();
      objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2B48);
    }

    if (!*(_BYTE *)(a1 + 85))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("legacy scenes can only be created on a legacy workspace"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.4();
      objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2BA0);
    }
    objc_msgSend(v15, "displayConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("FBSDisplayConfiguration"));
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.5();
      objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2C04);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayConfigurationClass]"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.5();
      objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2C68);
    }

  }
  else
  {
    if (v26 && !v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("remnant != nil || transitionContext == nil"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.18();
      objc_msgSend(objc_retainAutorelease(v70), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2D28);
    }
    if (v75)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion == nil"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.17();
      objc_msgSend(objc_retainAutorelease(v71), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2D8CLL);
    }
    if (!v15)
    {
      objc_msgSend((id)objc_msgSend(v20, "settingsClass"), "settings");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v79)
    {
      objc_msgSend((id)objc_msgSend(v20, "clientSettingsClass"), "settings");
      v79 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v15 = v15;
  NSClassFromString(CFSTR("FBSSceneSettings"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.6();
    objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B2774);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.6();
    objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B27D8);
  }

  v30 = v79;
  NSClassFromString(CFSTR("FBSSceneClientSettings"));
  v79 = v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.7();
    objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B283CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.7();
    objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B28A0);
  }
  v74 = (unint64_t)v16;

  v31 = *(unsigned __int8 *)(a1 + 85);
  objc_msgSend(v80, "identity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "workspaceIdentifier");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v31)
  {
    v35 = a1;
    if (v33)
    {
      objc_msgSend((id)__Workspaces, "objectForKey:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("modern workspace \"%@\" already exists"), v34);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.12();
        objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B2CC4);
      }
    }
    v37 = (void *)objc_msgSend(v32, "mutableCopy");
    v38 = v37;
    v39 = CFSTR("FBSceneManager");
LABEL_41:
    objc_msgSend(v37, "setInternalWorkspaceIdentifier:", v39);
    v40 = (void *)objc_msgSend(v80, "mutableCopy");
    objc_msgSend(v40, "setIdentity:", v38);

    goto LABEL_42;
  }
  v35 = a1;
  if ((BSEqualStrings() & 1) == 0)
  {
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provided workspaceID \"%@\" does not match actual workspaceID \"%@\"), v34, *(_QWORD *)(a1 + 88));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.11();
      objc_msgSend(objc_retainAutorelease(v72), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B2DECLL);
    }
    v38 = (void *)objc_msgSend(v32, "mutableCopy");
    objc_msgSend(v38, "setWorkspaceIdentifier:", *(_QWORD *)(a1 + 88));
    v37 = v38;
    v39 = 0;
    goto LABEL_41;
  }
  v40 = 0;
LABEL_42:

  if (v40)
  {
    v41 = objc_msgSend(v40, "copy");

    v80 = (id)v41;
  }
  v42 = v35;
  v16 = (id)v74;
  v43 = -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:]([FBScene alloc], v80, (void *)v74, v15, v79, (void *)v28, (void *)v42);
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene != nil"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.8();
    objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B2904);
  }
  v44 = v43;
  objc_msgSend(*(id *)(v42 + 32), "objectForKey:", v78);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scene \"%@\" already exists in workspace \"%@\"), v78, *(_QWORD *)(v42 + 88));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.10();
    objc_msgSend(objc_retainAutorelease(v60), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B2964);
  }
  objc_msgSend(*(id *)(v42 + 32), "setObject:forKey:", v44, v78);
  if (v74 | v28)
  {
    objc_msgSend(v44, "activateWithTransitionContext:completion:", v26, v75);
    if (v28)
    {
      if ((objc_msgSend(v44, "isActive") & 1) == 0)
      {
        objc_msgSend(v44, "invalidate");
        objc_msgSend(*(id *)(v42 + 32), "objectForKey:", v78);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_allScenesByID objectForKey:identifier] == nil"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.9();
          objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35B2444);
        }
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(v42 + 16), "workspace:didAddScene:", v42, v44);
  }

LABEL_55:
  return v44;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)sceneIdentityTokenForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v10;

  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace sceneIdentityTokenForIdentifier:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B371CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace sceneIdentityTokenForIdentifier:].cold.1();
    goto LABEL_9;
  }

  v5 = (void *)MEMORY[0x1E0D231F8];
  +[FBWorkspaceDomain sharedInstance]();
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceDomain endpoint](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenWithHostEndpoint:workspace:identifier:", v7, self->_identifier, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8;
  id v9;
  NSMutableDictionary *allScenesByID;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  Class v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:didReceiveActions:forExtension:]");
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:didReceiveActions:forExtension:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B5DF8);
  }
  allScenesByID = self->_allScenesByID;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](allScenesByID, "objectForKey:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene && (scene == [_allScenesByID objectForKey:[scene identifier]])"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:didReceiveActions:forExtension:].cold.2();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B5E5CLL);
  }
  objc_msgSend(v8, "loggingIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FBLogScene();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (a5)
  {
    if (v15)
    {
      NSStringFromClass(a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fbs_singleLineDescriptionOfBSActions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v13;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = v17;
      _os_log_impl(&dword_1A359A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) for \"%{public}@\": %{public}@", buf, 0x20u);

LABEL_10:
    }
  }
  else if (v15)
  {
    objc_msgSend(v9, "fbs_singleLineDescriptionOfBSActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v13;
    v32 = 2114;
    v33 = v16;
    _os_log_impl(&dword_1A359A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s): %{public}@", buf, 0x16u);
    goto LABEL_10;
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke;
  v25[3] = &unk_1E4A13A98;
  v25[4] = self;
  v26 = v9;
  v28 = v13;
  v29 = a5;
  v27 = v8;
  v18 = v13;
  v19 = v8;
  v20 = v9;
  -[FBSceneWorkspace _eventForScene:withName:block:]((uint64_t)self, v21, CFSTR("didReceiveActions"), (uint64_t)v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace _executeEventWhenIdle:]((uint64_t)self, v22);

}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v1 = a1;
  v73 = *MEMORY[0x1E0C80C00];
  -[FBSceneWorkspace _beginSynchronizationBlock](*(_QWORD *)(a1 + 32));
  v2 = *(id *)(v1 + 40);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(id **)(v1 + 48);
  if (v3)
    -[FBScene _componentProxiesForExtension:]((uint64_t)v4, v3);
  else
    -[FBScene _allComponentProxies](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v50 = v2;
    v6 = (void *)objc_msgSend(v2, "mutableCopy");
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v63;
      v52 = v7;
LABEL_7:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v11);
        v13 = *(_QWORD *)(v1 + 48);
        if (*(_QWORD *)(v1 + 64))
          objc_msgSend(v12, "scene:handlePrivateActions:", v13, v6);
        else
          objc_msgSend(v12, "scene:handleActions:", v13, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          FBLogScene();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *(_QWORD *)(v1 + 56);
            objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "fbs_singleLineDescriptionOfBSActions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v67 = v16;
            v7 = v52;
            v68 = 2114;
            v69 = v17;
            v70 = 2112;
            v71 = v18;
            _os_log_impl(&dword_1A359A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Component %{public}@ handled action(s): %@", buf, 0x20u);

          }
          objc_msgSend(v6, "minusSet:", v14);
        }
        v19 = objc_msgSend(v6, "count");

        if (!v19)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          if (v9)
            goto LABEL_7;
          break;
        }
      }
    }

    v2 = (id)objc_msgSend(v6, "copy");
  }
  if (*(_QWORD *)(v1 + 64) && objc_msgSend(v2, "count"))
  {
    FBLogScene();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v46 = v1;
      v47 = *(_QWORD *)(v1 + 56);
      NSStringFromClass(*(Class *)(v46 + 64));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "fbs_singleLineDescriptionOfBSActions");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v67 = v47;
      v1 = v46;
      v68 = 2114;
      v69 = v48;
      v70 = 2114;
      v71 = v49;
      _os_log_error_impl(&dword_1A359A000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Extension \"%{public}@\" did not handle actions: %{public}@", buf, 0x20u);

    }
    v2 = 0;
  }
  v21 = objc_msgSend(v2, "count");
  v22 = MEMORY[0x1E0C809B0];
  if (v21)
  {
    -[FBScene delegateProxy](*(id **)(v1 + 48));
    v23 = (id *)objc_claimAutoreleasedReturnValue();
    if (-[FBSceneObserver delegateReceivesActions]((uint64_t)v23))
    {
      FBLogScene();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

      if (v25)
      {
        v26 = v1;
        -[FBSceneObserver delegate](v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        FBLogScene();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_1(v26, (uint64_t)v27);

        v1 = v26;
      }
      objc_msgSend(v23, "scene:didReceiveActions:", *(_QWORD *)(v1 + 48), v2);
    }
    else if (-[FBScene _isLegacy](*(_QWORD *)(v1 + 48))
           && objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "delegateReceivesSceneActions"))
    {
      FBLogScene();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);

      if (v30)
      {
        v31 = v1;
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        FBLogScene();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_2(v31, (uint64_t)v32);

        v1 = v31;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "sceneManager:scene:didReceiveActions:", __LegacyManager, *(_QWORD *)(v1 + 48), v2);
    }
    else
    {
      v34 = v2;
      v35 = (void *)objc_msgSend(v2, "mutableCopy");
      v36 = *(_QWORD *)(v1 + 32);
      v37 = *(void **)(v1 + 48);
      v57[0] = v22;
      v57[1] = 3221225472;
      v57[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_252;
      v57[3] = &unk_1E4A13A70;
      v38 = v1;
      v39 = v35;
      v58 = v39;
      v59 = v23;
      v60 = *(id *)(v38 + 48);
      v40 = v38;
      v61 = *(id *)(v38 + 56);
      if (v36)
        -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v36, *(void **)(v36 + 40), v37, CFSTR("handleActions-sceneObserver"), 0, v57, 0);
      v41 = *(_QWORD *)(v38 + 32);
      v54[0] = v22;
      v54[1] = 3221225472;
      v54[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_257;
      v54[3] = &unk_1E4A11FD0;
      v55 = v39;
      v42 = *(void **)(v40 + 48);
      v56 = *(id *)(v40 + 56);
      v43 = v39;
      -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v41, v42, CFSTR("handleActions-cleanup"), v54);

      v1 = v40;
      v2 = v34;
    }

  }
  v44 = *(_QWORD *)(v1 + 32);
  v45 = *(void **)(v1 + 48);
  v53[0] = v22;
  v53[1] = 3221225472;
  v53[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_263;
  v53[3] = &unk_1E4A12348;
  v53[4] = v44;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v44, v45, CFSTR("didReceiveActionsCompletion"), v53);

}

- (FBSceneWorkspace)init
{
  void *v3;
  void *v4;
  FBSceneWorkspace *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (FBSceneWorkspace *)-[FBSceneWorkspace _initWithIdentifier:legacy:](self, v4, 0);

  return v5;
}

- (id)_initWithIdentifier:(int)a3 legacy:
{
  __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  _DWORD *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  FBSceneEventQueue *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  objc_super v39;
  _QWORD v40[4];
  __CFString *v41;

  v5 = a2;
  if (!a1)
    goto LABEL_19;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _initWithIdentifier:legacy:]");
  if (_initWithIdentifier_legacy__onceToken == -1)
  {
    if (a3)
    {
LABEL_6:
      v6 = CFSTR("FBSceneManager");

      v5 = v6;
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_once(&_initWithIdentifier_legacy__onceToken, &__block_literal_global_17);
    if (a3)
      goto LABEL_6;
  }
  if (!v5 || objc_msgSend(CFSTR("FBSceneManager"), "isEqualToString:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid identifier for workspace : %@"), v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _initWithIdentifier:legacy:].cold.5();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_35:
    JUMPOUT(0x1A35E5470);
  }
LABEL_10:
  os_unfair_lock_lock((os_unfair_lock_t)&__WorkspacesMutationLock);
  if (!__Workspaces)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)__Workspaces;
    __Workspaces = (uint64_t)v7;

  }
  v9 = v5;
  NSClassFromString(CFSTR("NSString"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _initWithIdentifier:legacy:].cold.1();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E54D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _initWithIdentifier:legacy:].cold.1();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E5538);
  }

  objc_msgSend((id)__Workspaces, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("workspace already exists with identifier \"%@\"), v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _initWithIdentifier:legacy:].cold.3();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E5594);
  }
  v11 = (void *)__LegacyManager;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke_18;
  v40[3] = &unk_1E4A13718;
  v5 = v9;
  v41 = v5;
  objc_msgSend(v11, "scenesPassingTest:", v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("legacy scene manager contains scene with workspaceID \"%@\"), v5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace _initWithIdentifier:legacy:].cold.2();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_35;
  }
  v39.receiver = a1;
  v39.super_class = (Class)FBSceneWorkspace;
  v13 = objc_msgSendSuper2(&v39, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[20] = 0;
    v15 = -[__CFString copy](v5, "copy");
    v16 = (void *)*((_QWORD *)v14 + 11);
    *((_QWORD *)v14 + 11) = v15;

    *((_BYTE *)v14 + 85) = a3;
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = (void *)*((_QWORD *)v14 + 4);
    *((_QWORD *)v14 + 4) = v17;

    v19 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v20 = (void *)*((_QWORD *)v14 + 3);
    *((_QWORD *)v14 + 3) = v19;

    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = (void *)*((_QWORD *)v14 + 6);
    *((_QWORD *)v14 + 6) = v21;

    v23 = [FBSceneEventQueue alloc];
    v24 = (void *)MEMORY[0x1E0C80D38];
    v25 = -[BSEventQueue initWithName:onQueue:](v23, "initWithName:onQueue:", *((_QWORD *)v14 + 11), MEMORY[0x1E0C80D38]);
    v26 = (void *)*((_QWORD *)v14 + 5);
    *((_QWORD *)v14 + 5) = v25;

    objc_msgSend(*((id *)v14 + 5), "setDelegate:", v14);
    +[FBWorkspaceEventDispatcher sharedInstance](FBWorkspaceEventDispatcher, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerTarget:", v14);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v28;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSceneWorkspace minus scenes - %@"), *((_QWORD *)v14 + 11));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v14;
    v31 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_msgSend((id)__Workspaces, "setObject:forKey:", v38, *((_QWORD *)v14 + 11));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__WorkspacesMutationLock);
  a1 = v14;

LABEL_19:
  return a1;
}

uint64_t __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke()
{
  objc_opt_class();
  return _class_setCustomDeallocInitiation();
}

uint64_t __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "workspaceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualStrings();

  return v3;
}

uint64_t __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
}

- (FBSceneWorkspace)initWithIdentifier:(id)a3
{
  return (FBSceneWorkspace *)-[FBSceneWorkspace _initWithIdentifier:legacy:](self, a3, 0);
}

- (id)_initWithLegacySceneManager:(id)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    a1 = -[FBSceneWorkspace _initWithIdentifier:legacy:](a1, 0, 1);
    if (a1)
      objc_storeStrong((id *)&__LegacyManager, a2);
  }

  return a1;
}

+ (id)workspaceWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[FBSceneWorkspace _initWithIdentifier:legacy:]([FBSceneWorkspace alloc], v3, 0);

  return v4;
}

- (void)_objc_initiateDealloc
{
  if (pthread_main_np())
    _objc_deallocOnMainThreadHelper();
  else
    dispatch_async_f(MEMORY[0x1E0C80D38], self, (dispatch_function_t)MEMORY[0x1E0DE7980]);
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

- (FBSceneWorkspaceDelegate)delegate
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace delegate]");
  return (FBSceneWorkspaceDelegate *)-[FBSceneManagerObserver delegate](self->_delegate, "delegate");
}

- (void)setDelegate:(id)a3
{
  void *v4;
  id v5;
  FBSceneManagerObserver *v6;
  FBSceneManagerObserver *delegate;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  if ((objc_msgSend(v4, "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setDelegate:]");
  v6 = -[FBSceneManagerObserver initWithDelegate:supportLegacy:]([FBSceneManagerObserver alloc], "initWithDelegate:supportLegacy:", v5, self->_supportsLegacy);

  delegate = self->_delegate;
  self->_delegate = v6;

}

- (void)removeWorkspaceObserver:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "observer");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v13 = v11 == a2;
          else
            v13 = 1;
          if (v13)
            objc_msgSend(*(id *)(a1 + 24), "removeObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock(v4);
  }
}

+ (id)sceneIdentityTokenForIdentifier:(id)a3 workspaceIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E5B58);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E5BBCLL);
  }

  v8 = v6;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E5C20);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:].cold.2();
    goto LABEL_17;
  }

  v9 = (void *)MEMORY[0x1E0D231F8];
  +[FBWorkspaceDomain sharedInstance]();
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceDomain endpoint](v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tokenWithHostEndpoint:workspace:identifier:", v11, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)createScene:(id)a3
{
  _QWORD *v5;
  FBSMutableSceneDefinition *v6;
  FBSMutableSceneDefinition *buildingDefinition;
  void (*v8)(_QWORD *, FBSceneWorkspace *);
  FBSMutableSceneDefinition *v9;
  void *v10;
  void *v11;
  FBSMutableSceneDefinition *v12;
  FBSMutableSceneParameters *buildingParameters;
  void *v14;
  id result;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace createScene:]");
  if (self->_buildingDefinition)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ was called reentrantly"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace createScene:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D23140], "definition");
    v6 = (FBSMutableSceneDefinition *)objc_claimAutoreleasedReturnValue();
    buildingDefinition = self->_buildingDefinition;
    self->_buildingDefinition = v6;

    v8 = (void (*)(_QWORD *, FBSceneWorkspace *))v5[2];
    v9 = v6;
    v8(v5, self);
    -[FBSMutableSceneParameters settings](self->_buildingParameters, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSMutableSceneParameters clientSettings](self->_buildingParameters, "clientSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_buildingDefinition;
    self->_buildingDefinition = 0;

    buildingParameters = self->_buildingParameters;
    self->_buildingParameters = 0;

    -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self, v9, v10, v11, 0, 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  return result;
}

- (id)createSceneWithDefinition:(id)a3
{
  return -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self, a3, 0, 0, 0, 0, 0, 0);
}

- (id)createSceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "definition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_clientSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self, v11, v9, v12, v8, v10, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)invalidate
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

- (void)_executeWhenIdle:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D22FC8], "eventWithName:handler:", CFSTR("external"), a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSceneWorkspace _executeEventWhenIdle:](a1, v3);

  }
}

- (void)_enqueueObserverCallouts:(void *)a3 forScene:(void *)a4 eventName:(char)a5 preferInternal:(void *)a6 sceneObserverBlock:(void *)a7 sceneManagerObserverBlock:
{
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (!a1)
  {
LABEL_8:

    return;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]");
  if (v13)
  {
    if (v15)
    {
      if (v16 | v17)
      {
        v18 = v15;
        v19 = (void *)MEMORY[0x1E0D22FC8];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke;
        v23[3] = &unk_1E4A137F0;
        v28 = (id)v16;
        v24 = v14;
        v29 = (id)v17;
        v25 = a1;
        v26 = v18;
        v30 = a5;
        v20 = v13;
        v27 = v20;
        objc_msgSend(v19, "eventWithName:handler:", v18, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "executeOrInsertEvent:atPosition:", v21, 1);

      }
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("eventQueue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:].cold.1();
  objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;

  if (*(_QWORD *)(a1 + 64))
  {
    -[FBScene delegateProxy](*(id **)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    -[FBScene _allComponentProxies](*(id **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    -[FBScene observerProxies](*(char **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = *(void **)(a1 + 72);
  if (v5)
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v6 = v5;
  if (*(_QWORD *)(a1 + 72))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)MEMORY[0x1E0D22FC8];
  v10 = *(_QWORD *)(a1 + 48);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke_2;
  v21 = &unk_1E4A137C8;
  v22 = v6;
  v27 = *(id *)(a1 + 72);
  v23 = v2;
  v11 = *(id *)(a1 + 64);
  v29 = *(_BYTE *)(a1 + 80);
  v24 = v8;
  v25 = v3;
  v28 = v11;
  v26 = v4;
  v12 = v4;
  v13 = v3;
  v14 = v8;
  v15 = v2;
  v16 = v6;
  objc_msgSend(v9, "eventWithName:handler:", v10, &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "executeOrInsertEvent:atPosition:", v17, 0, v18, v19, v20, v21);

}

void __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  if (*(_BYTE *)(a1 + 88))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v2 = *(id *)(a1 + 48);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v35 != v5)
            objc_enumerationMutation(v2);
          if (*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i) != *(_QWORD *)(a1 + 32)
            && objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "isInternalObserver"))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v4);
    }

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        if (*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j) != *(_QWORD *)(a1 + 32)
          && (!*(_BYTE *)(a1 + 88)
           || (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "isInternalObserver") & 1) == 0))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v9);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = *(id *)(a1 + 56);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v14; ++k)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = *(id *)(a1 + 64);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (m = 0; m != v19; ++m)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        if (*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * m) != *(_QWORD *)(a1 + 40))
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
    }
    while (v19);
  }

}

- (void)setIdentifier:(id)a3
{
  id v4;
  FBSMutableSceneDefinition *buildingDefinition;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setIdentifier:]");
  if (!self->_buildingDefinition)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_buildingDefinition != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setIdentifier:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E6960);
  }
  v9 = v4;
  NSClassFromString(CFSTR("NSString"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E69C4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setIdentifier:].cold.2();
    goto LABEL_15;
  }

  buildingDefinition = self->_buildingDefinition;
  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:workspaceIdentifier:", v9, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSMutableSceneDefinition setIdentity:](buildingDefinition, "setIdentity:", v6);

}

- (void)setSpecification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setSpecification:]");
  if (!self->_buildingDefinition)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_buildingDefinition != nil"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setSpecification:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E6B30);
  }
  v7 = v4;
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setSpecification:].cold.2();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E6B94);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setSpecification:].cold.2();
    goto LABEL_15;
  }

  -[FBSMutableSceneDefinition setSpecification:](self->_buildingDefinition, "setSpecification:", v7);
}

- (void)setClientIdentity:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setClientIdentity:]");
  if (!self->_buildingDefinition)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_buildingDefinition != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setClientIdentity:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E6CE8);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("clientID != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setClientIdentity:].cold.2();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E6D4CLL);
  }
  objc_msgSend(v8, "fbs_sceneClientIdentity");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("realID != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace setClientIdentity:].cold.3();
    goto LABEL_15;
  }
  v5 = (void *)v4;
  -[FBSMutableSceneDefinition setClientIdentity:](self->_buildingDefinition, "setClientIdentity:", v4);

}

- (void)configureParameters:(id)a3
{
  void (**v4)(id, FBSMutableSceneParameters *);
  FBSMutableSceneDefinition *buildingDefinition;
  uint64_t v6;
  void *v7;
  FBSMutableSceneParameters *buildingParameters;
  FBSMutableSceneParameters *v9;
  FBSMutableSceneParameters *v10;
  void *v11;
  void (**v12)(id, FBSMutableSceneParameters *);

  v4 = (void (**)(id, FBSMutableSceneParameters *))a3;
  buildingDefinition = self->_buildingDefinition;
  if (!buildingDefinition)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_buildingDefinition != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace configureParameters:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E6EA8);
  }
  v12 = v4;
  -[FBSMutableSceneDefinition specification](buildingDefinition, "specification");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("specification != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace configureParameters:].cold.2();
    goto LABEL_11;
  }
  v7 = (void *)v6;
  buildingParameters = self->_buildingParameters;
  if (!buildingParameters)
  {
    objc_msgSend(MEMORY[0x1E0D23148], "parametersForSpecification:", v6);
    v9 = (FBSMutableSceneParameters *)objc_claimAutoreleasedReturnValue();
    v10 = self->_buildingParameters;
    self->_buildingParameters = v9;

    buildingParameters = self->_buildingParameters;
  }
  v12[2](v12, buildingParameters);

}

- (void)scene:(id)a3 performCalloutsToObservers:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D22FC0];
  v8 = a3;
  v9 = [v7 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithName:onQueue:", 0, MEMORY[0x1E0C80D38]);
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke;
  v18[3] = &unk_1E4A13818;
  v19 = v6;
  v13 = v11;
  v14 = 3221225472;
  v15 = __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke_2;
  v16 = &unk_1E4A13840;
  v17 = v19;
  v12 = v19;
  -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, v10, v8, CFSTR("performCallouts"), 0, v18, &v13);

  objc_msgSend(v10, "flushAllEvents", v13, v14, v15, v16);
}

uint64_t __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scene:(id)a3 enqueueCalloutsToObserversWithEventName:(id)a4 block:(id)a5
{
  if (self)
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, a3, a4, 0, a5, 0);
}

- (void)scene:(id)a3 handleUpdate:(id)a4 withCompletion:(id)a5
{
  id v9;
  char *v10;
  id v11;
  NSMutableDictionary *allScenesByID;
  void *v13;
  id v14;
  int *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int *v26;
  int *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  NSObject *v46;
  int v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  NSString *identifier;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  _QWORD *v72;
  id v73;
  id v74;
  id v75;
  char *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id *v88;
  id *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  _BOOL4 v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  char *v99;
  FBSceneWorkspace *v100;
  id v101;
  id v102;
  uint64_t v103;
  BOOL v104;
  BOOL v105;
  _QWORD v106[4];
  id v107;
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  _BYTE v115[10];
  void *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (char *)a4;
  v11 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:handleUpdate:withCompletion:]");
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("update != nil"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v79), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E7A14);
  }
  if (objc_msgSend(v9, "_isInTransaction"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("![scene _isInTransaction]"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v80), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E7A78);
  }
  allScenesByID = self->_allScenesByID;
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](allScenesByID, "objectForKey:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene == [_allScenesByID objectForKey:[scene identifier]]"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.6();
    objc_msgSend(objc_retainAutorelease(v81), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E7ADCLL);
  }
  v90 = v11;
  -[FBSceneWorkspace _beginSynchronizationBlock]((uint64_t)self);
  objc_msgSend(v9, "loggingIdentifier");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[FBScene _isLegacy]((_BOOL8)v9);
  v93 = -[FBScene _beginTransaction]((uint64_t)v9);
  v15 = (int *)MEMORY[0x1E0D232F0];
  v16 = *(id *)&v10[*MEMORY[0x1E0D232F0]];
  v89 = (id *)a2;
  if (v16)
  {
    v17 = v16;
    v18 = (void *)objc_msgSend(v16, "copy");
    v19 = *v15;
    v20 = *(void **)&v10[v19];
    *(_QWORD *)&v10[v19] = v18;

    v92 = v18;
  }
  else
  {
    objc_msgSend(v9, "_createTransitionContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *v15;
    v23 = *(void **)&v10[v22];
    *(_QWORD *)&v10[v22] = v21;

    v92 = v21;
  }
  objc_msgSend(v10, "settings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mutableSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (int *)MEMORY[0x1E0D23308];
  if (!v25)
  {
    v25 = (void *)objc_msgSend(v24, "mutableCopy");
    objc_storeStrong((id *)&v10[*v26], v25);
  }
  if (self->_supportsLegacy)
  {
    if (-[FBSceneManagerObserver delegateHandlesLegacyInterception](self->_delegate, "delegateHandlesLegacyInterception"))
    {
      -[FBSceneManagerObserver sceneManager:interceptUpdateForScene:withNewSettings:](self->_delegate, "sceneManager:interceptUpdateForScene:withNewSettings:", __LegacyManager, v9, v25);
      v27 = (int *)MEMORY[0x1E0D23318];
      if ((objc_msgSend(*(id *)&v10[*MEMORY[0x1E0D23318]], "isEqual:", v25) & 1) == 0)
      {
        -[FBSceneManagerObserver delegate](self->_delegate, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        FBLogScene();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v28);
          v88 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", *(_QWORD *)&v10[*v27], v25);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v113 = v91;
          v114 = 2112;
          *(_QWORD *)v115 = v88;
          *(_WORD *)&v115[8] = 2112;
          v116 = v87;
          _os_log_debug_impl(&dword_1A359A000, v29, OS_LOG_TYPE_DEBUG, "[%@] manager delegate %@ mutated settings: %@", buf, 0x20u);

        }
        v30 = objc_msgSend(v25, "_copyClearingProgenitor:", 0);
        v31 = *v27;
        v32 = *(void **)&v10[v31];
        *(_QWORD *)&v10[v31] = v30;

        objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", *(_QWORD *)&v10[*MEMORY[0x1E0D23310]], *(_QWORD *)&v10[*v27]);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (int)*MEMORY[0x1E0D232F8];
        v35 = *(void **)&v10[v34];
        *(_QWORD *)&v10[v34] = v33;

      }
    }
  }
  -[FBScene delegateProxy]((id *)v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FBSceneObserver receiverImplementsWillUpdate]((unint64_t)v36))
  {
    objc_msgSend(v36, "scene:willUpdateSettings:", v9, v10);
    v37 = (int *)MEMORY[0x1E0D23318];
    if ((objc_msgSend(*(id *)&v10[*MEMORY[0x1E0D23318]], "isEqual:", v25) & 1) == 0)
    {
      -[FBSceneObserver delegate]((id *)v36);
      v88 = (id *)objc_claimAutoreleasedReturnValue();
      FBLogScene();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v88);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", *(_QWORD *)&v10[*v37], v25);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v113 = v91;
        v114 = 2112;
        *(_QWORD *)v115 = v86;
        *(_WORD *)&v115[8] = 2112;
        v116 = v85;
        _os_log_debug_impl(&dword_1A359A000, v38, OS_LOG_TYPE_DEBUG, "[%@] delegate %@ mutated settings: %@", buf, 0x20u);

      }
      v39 = objc_msgSend(v25, "_copyClearingProgenitor:", 0);
      v40 = *v37;
      v41 = *(void **)&v10[v40];
      *(_QWORD *)&v10[v40] = v39;

      objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", *(_QWORD *)&v10[*MEMORY[0x1E0D23310]], *(_QWORD *)&v10[*v37]);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (int)*MEMORY[0x1E0D232F8];
      v44 = *(void **)&v10[v43];
      *(_QWORD *)&v10[v43] = v42;

    }
  }
  v45 = objc_msgSend(v24, "isForeground");
  if (v45 != objc_msgSend(v25, "isForeground"))
  {
    FBLogScene();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v24, "isForeground");
      v48 = objc_msgSend(v25, "isForeground");
      *(_DWORD *)buf = 138543874;
      v113 = v91;
      v114 = 1024;
      *(_DWORD *)v115 = v47;
      *(_WORD *)&v115[4] = 1024;
      *(_DWORD *)&v115[6] = v48;
      _os_log_impl(&dword_1A359A000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] isForeground changed from %{BOOL}u to %{BOOL}u after interception", buf, 0x18u);
    }

  }
  if (v94 && v93 == 1)
  {
    objc_msgSend(v10, "settings");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene _adjustInitialSettings:]((uint64_t)v9, v49);

  }
  v50 = *v26;
  v51 = *(void **)&v10[v50];
  *(_QWORD *)&v10[v50] = 0;

  objc_msgSend(v10, "settings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "interruptionPolicy");

  if (v53 == 2)
  {
    objc_msgSend(v9, "definition");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "clientIdentity");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "targetsClientEndpoint");

    if (v56)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reconnect not supported for direct connections"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.3();
      objc_msgSend(objc_retainAutorelease(v82), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35E7B34);
    }
    +[FBWorkspaceDomain sharedInstance]();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceDomain reconnectableWorkspaces]((uint64_t)v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "containsObject:", self->_identifier);

    if ((v59 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("workspace (%@) of scene (%@) does not support reconnect"), self->_identifier, v91);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.5();
      objc_msgSend(objc_retainAutorelease(v83), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35E7B98);
    }
    objc_msgSend(v9, "workspaceIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      identifier = self->_identifier;
      objc_msgSend(v9, "workspaceIdentifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v62);

      if ((identifier & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reconnect not supported for (legacy) scenes with conflicting workspace identifiers : workspace (%@) != scene (%@)"), self->_identifier, v91);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.4();
        objc_msgSend(objc_retainAutorelease(v84), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35E7BFCLL);
      }
    }
  }
  -[BSEventQueue pendingEvents](self->_eventQueue, "pendingEvents");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue acquireLockForReason:](self->_eventQueue, "acquireLockForReason:", CFSTR("FBSceneUpdate"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settings");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settingsDiff");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSceneUpdateContext contextWithSceneID:transactionID:settings:settingsDiff:transitionContext:](FBSceneUpdateContext, "contextWithSceneID:transactionID:settings:settingsDiff:transitionContext:", v65, v93, v66, v67, v92);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v92, "setUpdateContext:", v68);
  v69 = MEMORY[0x1E0C809B0];
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke;
  v109[3] = &unk_1E4A13868;
  v70 = v9;
  v110 = v70;
  v71 = v68;
  v111 = v71;
  if (v94)
  {
    v106[0] = v69;
    v106[1] = 3221225472;
    v106[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2;
    v106[3] = &unk_1E4A13890;
    v72 = v106;
    v89 = &v107;
    v107 = v70;
    v88 = &v108;
    v108 = v71;
  }
  else
  {
    v72 = 0;
  }
  -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, v70, CFSTR("sceneUpdatePrepared"), 0, v109, v72);
  if (objc_msgSend(v63, "count"))
    -[BSEventQueue flushEvents:](self->_eventQueue, "flushEvents:", v63);
  v95[0] = v69;
  v95[1] = 3221225472;
  v95[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3;
  v95[3] = &unk_1E4A139D0;
  v73 = v92;
  v96 = v73;
  v74 = v91;
  v97 = v74;
  v75 = v70;
  v98 = v75;
  v76 = v10;
  v99 = v76;
  v100 = self;
  v77 = v71;
  v104 = v94;
  v101 = v77;
  v103 = v93;
  v105 = v93 == 1;
  v78 = v90;
  v102 = v78;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:]((uint64_t)self, v75, CFSTR("applySettings"), v95);
  -[BSEventQueue flushAllEvents](self->_eventQueue, "flushAllEvents");
  -[BSEventQueue relinquishLock:](self->_eventQueue, "relinquishLock:", v64);
  -[FBSceneWorkspace _endSynchronizationBlock]((uint64_t)self);

  if (v94)
  {

  }
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scene:didPrepareUpdateWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneManager:updateForScene:preparedWithContext:", __LegacyManager, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "fbs_singleLineDescriptionOfBSActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    FBLogScene();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v29 = v5;
      v30 = 2114;
      v31 = v3;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) in update: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "animationFence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    FBGetFencingProvider();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "animationFence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronizeDrawingWithFence:", v8);

  }
  v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_197;
  v20[3] = &unk_1E4A13930;
  v20[4] = *(_QWORD *)(a1 + 64);
  v21 = v9;
  v22 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 72);
  v26 = *(_BYTE *)(a1 + 96);
  v13 = *(_QWORD *)(a1 + 88);
  v23 = v12;
  v25 = v13;
  v24 = *(id *)(a1 + 40);
  v27 = *(_BYTE *)(a1 + 97);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_6;
  v14[3] = &unk_1E4A139A8;
  v14[4] = *(_QWORD *)(a1 + 64);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 80);
  v17 = *(id *)(a1 + 72);
  v19 = *(_BYTE *)(a1 + 96);
  -[FBScene _applyUpdate:postStateApplicator:completion:]((unint64_t)v21, v10, v20, v14);

}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_197(uint64_t a1, void *a2)
{
  id *v2;
  id *v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v5 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_200;
  v29[3] = &unk_1E4A138B8;
  v9 = v6;
  v30 = v9;
  v31 = *(id *)(a1 + 48);
  v32 = *(id *)(a1 + 56);
  v10 = *(unsigned __int8 *)(a1 + 80);
  if (*(_BYTE *)(a1 + 80))
  {
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3_201;
    v26[3] = &unk_1E4A13890;
    v11 = v26;
    v2 = &v27;
    v27 = *(id *)(a1 + 40);
    v3 = &v28;
    v28 = *(id *)(a1 + 56);
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 0;
  if (v7)
LABEL_3:
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v7, *(void **)(v7 + 40), v9, CFSTR("didUpdateSettings"), 0, v29, v11);
LABEL_4:
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), CFSTR("sceneUpdateSend"), v5);
  v13 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_4;
  v19[3] = &unk_1E4A13908;
  v14 = v12;
  v16 = *(void **)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v20 = v14;
  v24 = v15;
  v21 = v16;
  v17 = *(id *)(a1 + 48);
  v25 = *(_BYTE *)(a1 + 81);
  v18 = *(_QWORD *)(a1 + 32);
  v22 = v17;
  v23 = v18;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v13, v14, CFSTR("sceneMutationCompletion"), v19);

  if (v10)
  {

  }
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_200(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "scene:didUpdateSettings:", v3, v4);
  objc_msgSend(v5, "scene:didApplyUpdateWithContext:", a1[4], a1[6]);

}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3_201(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneManager:updateForScene:appliedWithContext:", __LegacyManager, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[FBScene _endTransaction:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = (int)*MEMORY[0x1E0D232F0];
  v4 = *(void **)(v2 + v3);
  *(_QWORD *)(v2 + v3) = 0;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = (int)*MEMORY[0x1E0D23300];
  v7 = *(void **)(v5 + v6);
  *(_QWORD *)(v5 + v6) = 0;

  if (*(_BYTE *)(a1 + 72))
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_5;
    v11[3] = &unk_1E4A138E0;
    v10 = v9;
    v12 = v10;
    if (v8)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v8, *(void **)(v8 + 40), v10, CFSTR("sceneDidActivate"), 0, v11, 0);
      v10 = v12;
    }

  }
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneDidActivate:", *(_QWORD *)(a1 + 32));
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  char v19;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:handleUpdate:withCompletion:]_block_invoke_6");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7;
  v11[3] = &unk_1E4A13980;
  v18 = a2;
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v17 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = *(id *)(a1 + 56);
  v19 = *(_BYTE *)(a1 + 72);
  v10 = v5;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v6, v7, CFSTR("updateComplete"), v11);

}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7(uint64_t a1)
{
  id *v1;
  id *v2;
  id *v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  if (!*(_BYTE *)(a1 + 80))
  {
    FBLogScene();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7_cold_1(a1, v5);

  }
  v6 = *(_QWORD *)(a1 + 72);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "isActive"))
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_213;
    v17[3] = &unk_1E4A138B8;
    v10 = v7;
    v18 = v10;
    v19 = *(id *)(a1 + 64);
    v20 = *(id *)(a1 + 40);
    v11 = *(unsigned __int8 *)(a1 + 81);
    if (*(_BYTE *)(a1 + 81))
    {
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_214;
      v13[3] = &unk_1E4A13958;
      v12 = v13;
      v1 = &v14;
      v14 = *(id *)(a1 + 48);
      v2 = &v15;
      v15 = *(id *)(a1 + 64);
      v3 = &v16;
      v16 = *(id *)(a1 + 40);
      if (!v8)
      {
LABEL_11:
        if (v11)
        {

        }
        return;
      }
    }
    else
    {
      v12 = 0;
      if (!v8)
        goto LABEL_11;
    }
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v8, *(void **)(v8 + 40), v10, CFSTR("sceneUpdateCompleted"), 0, v17, v12);
    goto LABEL_11;
  }
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_213(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "scene:didCompleteUpdateWithContext:error:", a1[4], a1[5], a1[6]);
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_214(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "sceneManager:updateForScene:completedWithContext:error:", __LegacyManager, a1[4], a1[5], a1[6]);
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *allScenesByID;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:didUpdateClientSettings:]");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:didUpdateClientSettings:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E8664);
  }
  allScenesByID = self->_allScenesByID;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](allScenesByID, "objectForKey:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v6)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = self->_allScenesByID;
    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v17, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("the scene must match our own mapped scene : %@ != %@"), v6, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:didUpdateClientSettings:].cold.2();
    goto LABEL_11;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke;
  v20[3] = &unk_1E4A120D0;
  v20[4] = self;
  v21 = v6;
  v22 = v7;
  v11 = v7;
  v12 = v6;
  -[FBSceneWorkspace _eventForScene:withName:block:]((uint64_t)self, v13, CFSTR("handleDidUpdateClientSettings"), (uint64_t)v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace _executeEventWhenIdle:]((uint64_t)self, v14);

}

void __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke(uint64_t a1)
{
  id *v1;
  id *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _BOOL4 v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  -[FBSceneWorkspace _beginSynchronizationBlock](*(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_2;
  v16[3] = &unk_1E4A13868;
  v7 = v4;
  v17 = v7;
  v18 = *(id *)(a1 + 48);
  v8 = -[FBScene _isLegacy](*(_QWORD *)(a1 + 40));
  if (v8)
  {
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_3;
    v13[3] = &unk_1E4A13890;
    v9 = v13;
    v1 = &v14;
    v14 = *(id *)(a1 + 40);
    v2 = &v15;
    v15 = *(id *)(a1 + 48);
  }
  else
  {
    v9 = 0;
  }
  if (v5)
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v5, *(void **)(v5 + 40), v7, CFSTR("didUpdateClientSettings"), 0, v16, v9);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_4;
  v12[3] = &unk_1E4A12348;
  v12[4] = v10;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v10, v11, CFSTR("didUpdateClientSettingsCompletion"), v12);
  if (v8)
  {

  }
}

uint64_t __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scene:didUpdateClientSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = __LegacyManager;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "settingsDiff");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "previousSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "transitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneManager:scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v3, v4, v9, v7, v8);

}

void __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_4(uint64_t a1)
{
  -[FBSceneWorkspace _endSynchronizationBlock](*(_QWORD *)(a1 + 32));
}

- (void)scene:(id)a3 deactivateAndInvalidate:(BOOL)a4 withContext:(id)a5 block:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSMutableDictionary *allScenesByID;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  id *v36;
  void *v37;
  BOOL v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  FBSceneWorkspace *v43;
  id v44;
  id v45;
  uint64_t v46;
  char v47;
  BOOL v48;
  char v49;
  BOOL v50;
  _QWORD v51[4];
  id v52;
  BOOL v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v8 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v40 = a5;
  v11 = a6;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:deactivateAndInvalidate:withContext:block:]");
  if (!v10 || objc_msgSend(v10, "_isInTransaction"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene && ![scene _isInTransaction]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:deactivateAndInvalidate:withContext:block:].cold.1();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E8DB4);
  }
  allScenesByID = self->_allScenesByID;
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](allScenesByID, "objectForKey:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene == [_allScenesByID objectForKey:[scene identifier]]"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneWorkspace scene:deactivateAndInvalidate:withContext:block:].cold.2();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E8E18);
  }
  FBLogScene();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  v39 = v11;
  if (v8)
  {
    if (v16)
    {
      objc_msgSend(v10, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v17;
      v18 = "Invalidating scene: %{public}@";
LABEL_11:
      _os_log_impl(&dword_1A359A000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

    }
  }
  else if (v16)
  {
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v58 = v17;
    v18 = "Deactivating scene: %{public}@";
    goto LABEL_11;
  }

  -[FBSceneWorkspace _beginSynchronizationBlock]((uint64_t)self);
  -[BSEventQueue pendingEvents](self->_eventQueue, "pendingEvents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue acquireLockForReason:](self->_eventQueue, "acquireLockForReason:", CFSTR("FBSceneDeactivate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v10, "isActive");
  v22 = v21;
  v23 = 0;
  if (v8 && v21)
    v23 = -[FBScene _isLegacy]((_BOOL8)v10);
  if (objc_msgSend(v10, "contentState"))
    LODWORD(v24) = !-[FBScene _isLegacy]((_BOOL8)v10);
  else
    LOBYTE(v24) = 0;
  v25 = MEMORY[0x1E0C809B0];
  v38 = v8;
  if ((v22 & 1) != 0)
  {
    v34 = v19;
    v26 = (char)v24;
    v37 = v20;
    v27 = -[FBScene _beginTransaction]((uint64_t)v10);
    v54[0] = v25;
    v54[1] = 3221225472;
    v54[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke;
    v54[3] = &unk_1E4A13868;
    v28 = v54;
    v36 = &v55;
    v24 = v10;
    v55 = v24;
    v35 = &v56;
    v56 = v40;
    if (!v23)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, v24, CFSTR("willInvalidate/willDestroy"), 0, v54, 0);
      v20 = v37;
      LOBYTE(v24) = v26;
      v19 = v34;
      goto LABEL_26;
    }
    LOBYTE(v24) = v26;
    v19 = v34;
  }
  else
  {
    if (!v23)
    {
      v27 = 0;
      goto LABEL_28;
    }
    v37 = v20;
    v28 = 0;
    v27 = 0;
  }
  v51[0] = v25;
  v51[1] = 3221225472;
  v51[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_2;
  v51[3] = &unk_1E4A139F8;
  v53 = v23;
  v52 = v10;
  -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, v52, CFSTR("willInvalidate/willDestroy"), 0, v28, v51);

  v20 = v37;
  if (v22)
  {
LABEL_26:

  }
LABEL_28:
  if (objc_msgSend(v19, "count"))
    -[BSEventQueue flushEvents:](self->_eventQueue, "flushEvents:", v19);
  v41[0] = v25;
  v41[1] = 3221225472;
  v41[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_3;
  v41[3] = &unk_1E4A13A48;
  v47 = v22;
  v48 = v38;
  v42 = v10;
  v43 = self;
  v49 = (char)v24;
  v45 = v39;
  v46 = v27;
  v44 = v40;
  v50 = v23;
  v29 = v40;
  v30 = v39;
  v31 = v10;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:]((uint64_t)self, v31, CFSTR("sceneDeactivation"), v41);
  -[BSEventQueue flushAllEvents](self->_eventQueue, "flushAllEvents");
  -[BSEventQueue relinquishLock:](self->_eventQueue, "relinquishLock:", v20);
  -[FBSceneWorkspace _endSynchronizationBlock]((uint64_t)self);

}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneWillDeactivate:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_2(uint64_t result, void *a2)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(a2, "sceneManager:willDestroyScene:", __LegacyManager, *(_QWORD *)(result + 32));
  return result;
}

void __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;

  if (*(_BYTE *)(a1 + 72))
    -[FBScene _endTransaction:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v2 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 73))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_4;
    v34[3] = &unk_1E4A13890;
    v34[4] = v4;
    v5 = v3;
    v35 = v5;
    if (v4)
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v4, *(void **)(v4 + 40), v5, CFSTR("willRemoveScene-sceneManager"), 0, 0, v34);
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v32[0] = v2;
    v32[1] = 3221225472;
    v32[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_5;
    v32[3] = &unk_1E4A11FD0;
    v32[4] = v7;
    v33 = v6;
    -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v7, v33, CFSTR("sceneRemoval"), v32);

  }
  if (*(_BYTE *)(a1 + 74))
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v30[0] = v2;
    v30[1] = 3221225472;
    v30[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_6;
    v30[3] = &unk_1E4A138E0;
    v10 = v8;
    v31 = v10;
    if (v9)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v9, *(void **)(v9 + 40), v10, CFSTR("contentStateDidChange-sceneObserver"), 0, v30, 0);
      v10 = v31;
    }

  }
  if (*(_BYTE *)(a1 + 72))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v27[0] = v2;
    v27[1] = 3221225472;
    v27[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_7;
    v27[3] = &unk_1E4A13868;
    v13 = v11;
    v28 = v13;
    v14 = *(id *)(a1 + 48);
    v29 = v14;
    if (v12)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v12, *(void **)(v12 + 40), v13, CFSTR("didDeactivate-sceneObserver"), 0, v27, 0);
      v14 = v29;
    }

  }
  if (*(_BYTE *)(a1 + 73))
  {
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v24[0] = v2;
    v24[1] = 3221225472;
    v24[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_8;
    v24[3] = &unk_1E4A13868;
    v17 = v15;
    v25 = v17;
    v18 = *(id *)(a1 + 48);
    v26 = v18;
    if (v16)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v16, *(void **)(v16 + 40), v17, CFSTR("didInvalidate-sceneObserver"), 0, v24, 0);
      v18 = v26;
    }

  }
  if (*(_BYTE *)(a1 + 75))
  {
    v19 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v22[0] = v2;
    v22[1] = 3221225472;
    v22[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_9;
    v22[3] = &unk_1E4A13A20;
    v21 = v19;
    v23 = v21;
    if (v20)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v20, *(void **)(v20 + 40), v21, CFSTR("didDestroyScene-sceneManager"), 0, 0, v22);
      v21 = v23;
    }

  }
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workspace:willRemoveScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneContentStateDidChange:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneDidDeactivate:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneDidInvalidate:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneManager:didDestroyScene:", __LegacyManager, *(_QWORD *)(a1 + 32));
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_252(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    -[FBSceneObserver component]((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else if (-[FBSceneObserver observerHandlesActions]((uint64_t)v3))
    {
      v5 = *(id **)(a1 + 40);
      -[FBSceneObserver observer](v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scene:handleActions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      FBLogScene();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 56);
          if (v5 == v3)
            v12 = "Delegate";
          else
            v12 = "Observer";
          objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "fbs_singleLineDescriptionOfBSActions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138544130;
          v19 = v11;
          v20 = 2082;
          v21 = v12;
          v22 = 2114;
          v23 = v13;
          v24 = 2112;
          v25 = v14;
          _os_log_impl(&dword_1A359A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}s %{public}@ handled action(s): %@", (uint8_t *)&v18, 0x2Au);

        }
        objc_msgSend(*(id *)(a1 + 32), "minusSet:", v7);
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v15 = *(_QWORD *)(a1 + 56);
          if (v5 == v3)
            v16 = "Delegate";
          else
            v16 = "Observer";
          objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v15;
          v20 = 2082;
          v21 = v16;
          v22 = 2114;
          v23 = v17;
          _os_log_debug_impl(&dword_1A359A000, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}s %{public}@ handled no actions.", (uint8_t *)&v18, 0x20u);

        }
      }

    }
  }

}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_257(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    FBLogScene();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "fbs_singleLineDescriptionOfBSActions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v3;
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_1A359A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dropping unhandled action(s): %{public}@", buf, 0x16u);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "canSendResponse", (_QWORD)v14))
          {
            v11 = (void *)MEMORY[0x1E0D22F68];
            FBSceneErrorCreate(3uLL, CFSTR("No handler for action."), 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "responseForError:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "sendResponse:", v13);

          }
          objc_msgSend(v10, "invalidate");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_263(uint64_t a1)
{
  -[FBSceneWorkspace _endSynchronizationBlock](*(_QWORD *)(a1 + 32));
}

- (void)didReceiveSceneRequest:(id)a3 fromHandle:(id)a4
{
  id v6;
  id v7;
  FBSceneManagerObserver *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *identifier;
  NSString *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  FBSceneWorkspace *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;

  v6 = a3;
  v7 = a4;
  v8 = self->_delegate;
  objc_msgSend(v6, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_FBSceneClientProcess _initWithHandle:]([_FBSceneClientProcess alloc], "_initWithHandle:", v7);
  if (!objc_msgSend(v9, "isClientFuture"))
  {
    objc_msgSend(v6, "actions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if (-[FBSceneManagerObserver delegateReceivesActions](v8, "delegateReceivesActions"))
      {
        objc_msgSend(v6, "actions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSceneManagerObserver workspace:didReceiveActions:](v8, "workspace:didReceiveActions:", self, v25);

        objc_msgSend(v6, "respondWithScene:", 0);
LABEL_25:

        return;
      }
      identifier = self->_identifier;
    }
    else
    {
      if (v8)
      {
        v26 = (void *)MEMORY[0x1E0D22F88];
        v27 = MEMORY[0x1E0C809B0];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_280;
        v37[3] = &unk_1E4A13B38;
        v38 = v6;
        v39 = self;
        objc_msgSend(v26, "sentinelWithCompletion:", v37);
        v35[0] = v27;
        v35[1] = 3221225472;
        v35[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2_287;
        v35[3] = &unk_1E4A12EA0;
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v36;
        -[FBSceneManagerObserver workspace:didReceiveSceneRequestWithOptions:fromProcess:completion:](v8, "workspace:didReceiveSceneRequestWithOptions:fromProcess:completion:", self, v9, v10, v35);

        goto LABEL_25;
      }
      identifier = self->_identifier;
    }
    FBSWorkspaceErrorCreate();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateWithError:", v29, identifier);

    goto LABEL_25;
  }
  v34 = v10;
  +[FBWorkspaceDomain sharedInstance]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceDomain preregisteredWorkspaces]((uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "acceptsClientScenes") & 1) == 0
    && !-[FBSceneManagerObserver delegateHandlesClientScenes](v8, "delegateHandlesClientScenes"))
  {
    v33 = self->_identifier;
    FBSWorkspaceErrorCreate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateWithError:", v15, v33);
    goto LABEL_22;
  }
  objc_msgSend(v9, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneWorkspace sceneWithIdentifier:](self, "sceneWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
LABEL_7:
    if ((objc_msgSend(v16, "isActive") & 1) != 0
      || (objc_msgSend(v16, "settings"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isClientFuture"),
          v21,
          !v22))
    {
      v31 = self->_identifier;
      FBSWorkspaceErrorCreate();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateWithError:", v23, v31, v15);
    }
    else
    {
      objc_msgSend(v6, "observeScene:", v16);
      if (!objc_msgSend(v16, "isValid"))
      {
LABEL_17:

LABEL_22:
        v10 = v34;
        goto LABEL_25;
      }
      if (!-[FBSceneManagerObserver delegateHandlesClientScenes](v8, "delegateHandlesClientScenes"))
      {
        objc_msgSend(v16, "activate:", 0);
        goto LABEL_17;
      }
      objc_msgSend(v9, "transitionContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSceneManagerObserver workspace:didReceiveScene:withContext:fromProcess:](v8, "workspace:didReceiveScene:withContext:fromProcess:", self, v16, v23, v34);
    }

    goto LABEL_17;
  }
  v17 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(v7, "identity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultIdentityForProcessIdentity:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke;
  v40[3] = &unk_1E4A13B10;
  v41 = v9;
  v20 = v19;
  v42 = v20;
  v43 = v34;
  -[FBSceneWorkspace createScene:](self, "createScene:", v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isActive"))
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("it's not valid to activate this kind of scene from workspace:didAddScene:"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSceneWorkspace didReceiveSceneRequest:fromHandle:].cold.1();
  objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v8, "setIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v5);

  }
  objc_msgSend(v8, "setClientIdentity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "setSpecification:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D23240], "specification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpecification:", v7);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2;
  v9[3] = &unk_1E4A13AE8;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v8, "configureParameters:", v9);

}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "initialSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSettings:", v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_3;
  v7[3] = &unk_1E4A13AC0;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v4, "updateSettingsWithBlock:", v7);
  objc_msgSend(*(id *)(a1 + 32), "initialClientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientSettings:", v6);

}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setClientFuture:", 1);
  objc_msgSend(v3, "setClientProcess:", *(_QWORD *)(a1 + 32));

}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_280(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  objc_msgSend(a2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v14 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v14;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithScene:", v6);
  }
  else
  {
    v7 = objc_opt_class();
    v8 = v14;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v11 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
    FBSWorkspaceErrorCreate();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateWithError:", v12, v13);

  }
}

uint64_t __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2_287(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    a3 = a2;
  return objc_msgSend(v3, "signalWithContext:", a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[FBSceneWorkspace descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (id)debugDescription
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__FBSceneWorkspace_debugDescription__block_invoke;
  v7[3] = &unk_1E4A12348;
  v8 = v2;
  v3 = v2;
  v4 = (id)objc_msgSend(v3, "modifyProem:", v7);
  os_unfair_lock_lock((os_unfair_lock_t)&__WorkspacesMutationLock);
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", __Workspaces, 0, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&__WorkspacesMutationLock);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __36__FBSceneWorkspace_debugDescription__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("All Workspaces"), 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSceneWorkspace succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace succinctDescriptionBuilder]");
  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, 0);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableDictionary count](self->_allScenesByID, "count"), CFSTR("scenes"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSceneWorkspace descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  FBSceneWorkspace *v9;

  v4 = a3;
  -[FBSceneWorkspace succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_allScenesByID, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__FBSceneWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke;
    v7[3] = &unk_1E4A11FD0;
    v8 = v5;
    v9 = self;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  }
  return v5;
}

void __58__FBSceneWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "allValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("scenes"), 1);

}

- (BOOL)_suppressConnectionHandshakes
{
  if (result)
    return *(_BYTE *)(result + 86) != 0;
  return result;
}

- (uint64_t)_setSuppressConnectionHandshakes:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 86) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_buildingParameters, 0);
  objc_storeStrong((id *)&self->_buildingDefinition, 0);
  objc_storeStrong((id *)&self->_pendingIdleEvents, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_allScenesByID, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_eventDispatcherTargetRegistration, 0);
}

- (void)_initWithIdentifier:legacy:.cold.1()
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

- (void)_initWithIdentifier:legacy:.cold.2()
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

- (void)_initWithIdentifier:legacy:.cold.3()
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

- (void)_initWithIdentifier:legacy:.cold.5()
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

- (void)sceneWithIdentityToken:.cold.1()
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

- (void)sceneIdentityTokenForIdentifier:.cold.1()
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

+ (void)sceneIdentityTokenForIdentifier:workspaceIdentifier:.cold.1()
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

+ (void)sceneIdentityTokenForIdentifier:workspaceIdentifier:.cold.2()
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

- (void)createScene:.cold.1()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.1()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.2()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.3()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.4()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.5()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.6()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.7()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.8()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.9()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.10()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.11()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.12()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.16()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.17()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.18()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.19()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.20()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.21()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.24()
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

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.25()
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

- (void)_enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:.cold.1()
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

- (void)setIdentifier:.cold.1()
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

- (void)setIdentifier:.cold.2()
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

- (void)setSpecification:.cold.1()
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

- (void)setSpecification:.cold.2()
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

- (void)setClientIdentity:.cold.1()
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

- (void)setClientIdentity:.cold.2()
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

- (void)setClientIdentity:.cold.3()
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

- (void)configureParameters:.cold.1()
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

- (void)configureParameters:.cold.2()
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

- (void)scene:handleUpdate:withCompletion:.cold.1()
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

- (void)scene:handleUpdate:withCompletion:.cold.2()
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

- (void)scene:handleUpdate:withCompletion:.cold.3()
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

- (void)scene:handleUpdate:withCompletion:.cold.4()
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

- (void)scene:handleUpdate:withCompletion:.cold.5()
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

- (void)scene:handleUpdate:withCompletion:.cold.6()
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

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "descriptionWithMultilinePrefix:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_1A359A000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Update failed: %{public}@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_8_2();
}

- (void)scene:didUpdateClientSettings:.cold.1()
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

- (void)scene:didUpdateClientSettings:.cold.2()
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

- (void)scene:deactivateAndInvalidate:withContext:block:.cold.1()
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

- (void)scene:deactivateAndInvalidate:withContext:block:.cold.2()
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

- (void)scene:didReceiveActions:forExtension:.cold.1()
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

- (void)scene:didReceiveActions:forExtension:.cold.2()
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

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_8_4(&dword_1A359A000, v3, v4, "[%{public}@] Handing all actions to delegate: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8_2();
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_8_4(&dword_1A359A000, v3, v4, "[%{public}@] Handing all actions to legacy delegate: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8_2();
}

- (void)didReceiveSceneRequest:fromHandle:.cold.1()
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
