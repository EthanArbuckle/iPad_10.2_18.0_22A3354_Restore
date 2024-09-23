@implementation FBScene

- (int64_t)contentState
{
  return self->_contentState;
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (id)delegateProxy
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (char)observerProxies
{
  char *v1;
  os_unfair_lock_s *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene observerProxies]");
    v2 = (os_unfair_lock_s *)(v1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)v1 + 2);
    objc_msgSend(*((id *)v1 + 4), "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (char *)objc_msgSend(v3, "copy");

    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)_allComponentProxies
{
  id *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _allComponentProxies]");
    v2 = objc_msgSend(v1[18], "copy");
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x1E0C9AA60];
    if (v2)
      v4 = (void *)v2;
    v1 = v4;

  }
  return v1;
}

uint64_t __28__FBScene__setContentState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneContentStateDidChange:", *(_QWORD *)(a1 + 32));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)_isLegacy
{
  if (result)
    return *(_BYTE *)(result + 202) != 0;
  return result;
}

- (int64_t)currentInterfaceOrientation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[FBScene settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_uiApplicationSceneSettingsShim");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBScene clientSettings](self, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_uiApplicationSceneClientSettingsShim");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || !v6)
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "deviceOrientationEventsEnabled")
    || (v7 = objc_msgSend(v6, "interfaceOrientation")) == 0)
  {
LABEL_7:
    v7 = objc_msgSend(v4, "interfaceOrientation");
  }
LABEL_9:

  return v7;
}

- (id)uiSettings
{
  void *v3;
  id result;
  void *v5;

  -[FBScene settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_uikitShimming_isUISubclass") & 1) != 0)
    return v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("settings is of an unexpected class : %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBScene(UIApp) uiSettings].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSSceneSettings)settings
{
  void *settings;
  void *v4;
  FBSSceneSettings *v5;

  -[FBSSceneUpdate settings](self->_settingsUpdate, "settings");
  settings = (void *)objc_claimAutoreleasedReturnValue();
  v4 = settings;
  if (!settings)
    settings = self->_settings;
  v5 = settings;

  return v5;
}

- (id)uiClientSettings
{
  void *v3;
  id result;
  void *v5;

  -[FBScene clientSettings](self, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_uikitShimming_isUISubclass") & 1) != 0)
    return v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientSettings is of an unexpected class : %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBScene(UIApp) uiClientSettings].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSSceneClientSettings)clientSettings
{
  return self->_clientSettings;
}

- (BOOL)_isInTransaction
{
  return self->_inTransaction;
}

- (uint64_t)_beginTransaction
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 203))
    {
      if (!*(_BYTE *)(result + 214))
      {
        *(_BYTE *)(result + 214) = 1;
        result = *(_QWORD *)(result + 184) + 1;
        *(_QWORD *)(v1 + 184) = result;
        return result;
      }
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)result, "loggingIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("cannot begin a transition while we're already in one (%@)"), v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _beginTransaction].cold.2();
    }
    else
    {
      v2 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)result, "loggingIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringWithFormat:", CFSTR("scene is not actually active: %@"), v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _beginTransaction].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A359DC48);
  }
  return result;
}

- (id)_componentProxiesForExtension:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 136), "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "copy");
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AA60];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_adjustInitialSettings:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (!a1)
    goto LABEL_5;
  if (*(_QWORD *)(a1 + 184) == 1)
  {
    if (*(id *)(a1 + 96) != v3)
    {
      v7 = v3;
      v4 = objc_msgSend(v3, "_copyClearingProgenitor:", 0);
      v5 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v4;

      v3 = v7;
    }
LABEL_5:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initial settings may only be adjusted at create time before any transactions have begun."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBScene _adjustInitialSettings:].cold.1();
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (FBProcess)clientProcess
{
  if (self->_legacy)
    return self->_clientProcess;
  else
    return (FBProcess *)0;
}

- (NSString)workspaceIdentifier
{
  return self->_workspaceIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  BOOL v7;
  objc_super v9;

  v5 = a3;
  if (objc_msgSend(v5, "isProxy"))
  {
    objc_msgSend(v5, "forwardingTargetForSelector:", a2);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)FBScene;
  v7 = -[FBScene isEqual:](&v9, sel_isEqual_, v5);

  return v7;
}

- (FBSceneClientHandle)clientHandle
{
  return self->_clientHandle;
}

- (FBSSceneDefinition)definition
{
  return self->_definition;
}

- (void)_dispatchClientMessageWithBlock:(uint64_t)a1
{
  void *v3;
  void (**block)(void);

  block = a2;
  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v3 = (void *)MEMORY[0x1A8590A90]();
      block[2]();
      objc_autoreleasePoolPop(v3);
    }
    else
    {
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

- (void)addObserver:(id)a3
{
  char *v4;
  void *v5;
  const char *v6;

  v6 = (const char *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene addObserver:]");
  v4 = (char *)v6;
  if (v6)
  {
    v5 = -[FBSceneObserver initWithObserver:]([FBSceneObserver alloc], v6);
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableOrderedSet addObject:](self->_lock_observerProxies, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);

    v4 = (char *)v6;
  }

}

- (BOOL)isActive
{
  return self->_active || self->_updateShouldActivate;
}

- (FBSceneLayerManager)layerManager
{
  return self->_layerManager;
}

- (id)loggingIdentifier
{
  void *v2;
  void *v3;

  -[FBScene identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBSSceneIdentity)identity
{
  return (FBSSceneIdentity *)-[FBSSceneDefinition identity](self->_definition, "identity");
}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 160) + (int)*MEMORY[0x1E0D232F0]), v7);
  v8 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v8 + 184))
  {
    LOBYTE(v9) = *(_BYTE *)(v8 + 202);
    BYTE1(v9) = *(_BYTE *)(a1 + 48);
    objc_msgSend(*(id *)(v8 + 232), "scene:performCalloutsToObservers:", MEMORY[0x1E0C809B0], 3221225472, __52__FBScene_activateWithTransitionContext_completion___block_invoke_4, &unk_1E4A14210, v8, v9);
    if (objc_msgSend(v5, "isClientFuture"))
    {
      objc_msgSend(v5, "setClientFuture:", 0);
      objc_msgSend(v5, "setClientProcess:", 0);
    }
  }

}

- (uint64_t)_endTransaction:(uint64_t)result
{
  uint64_t v2;
  BOOL v3;
  void *v4;

  if (result)
  {
    v2 = *(_QWORD *)(result + 184);
    if (*(_BYTE *)(result + 214))
      v3 = v2 == a2;
    else
      v3 = 0;
    if (v3)
    {
      *(_BYTE *)(result + 214) = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ending transactionID %llu does not match active transactionID %llu"), a2, v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _endTransaction:].cold.1();
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      result = _bs_set_crash_log_message();
      __break(0);
    }
  }
  return result;
}

uint64_t __48__FBScene__activateWithTransitionContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_removeVolatileSettings");
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id *v11;
  id v12;
  void *v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)-[NSMutableOrderedSet copy](self->_lock_observerProxies, "copy", 0);
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
        v11 = *(id **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[FBSceneObserver observer](v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          v14 = v12 == a3;
        else
          v14 = 1;
        if (v14)
          -[NSMutableOrderedSet removeObject:](self->_lock_observerProxies, "removeObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (FBSSceneIdentityToken)identityToken
{
  return self->_identityToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_clientHandle, 0);
  objc_storeStrong(&self->_updateCompletion, 0);
  objc_storeStrong((id *)&self->_settingsUpdate, 0);
  objc_destroyWeak((id *)&self->_parentScene);
  objc_storeStrong((id *)&self->_orderedComponents, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_settingsAtDeactivation, 0);
  objc_storeStrong((id *)&self->_remnant, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_clientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_workspaceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientProcess, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_clientToken, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_lock_observerProxies, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_layerManager, 0);
}

- (void)updateUISettingsWithTransitionBlock:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  if (v5)
  {
    v7[1] = 3221225472;
    v7[2] = __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke;
    v7[3] = &unk_1E4A11EA0;
    v9 = a2;
    v7[4] = self;
    v6 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v5;
    -[FBScene updateSettingsWithTransitionBlock:](self, "updateSettingsWithTransitionBlock:", v7);

    v5 = v6;
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  NSString *workspaceIdentifier;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  id v12;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  workspaceIdentifier = self->_workspaceIdentifier;
  if (workspaceIdentifier
    && (-[FBSceneWorkspace identifier](self->_workspace, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[NSString isEqualToString:](workspaceIdentifier, "isEqualToString:", v5),
        v5,
        !v6))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = self->_workspaceIdentifier;
    -[FBSceneWorkspace identifier](self->_workspace, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@(%@):%@"), v10, v8, self->_identifier);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[FBSceneWorkspace identifier](self->_workspace, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@"), v8, self->_identifier, v14);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, 0);

  return v3;
}

- (void)updateUISettingsWithBlock:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  if (v5)
  {
    v7[1] = 3221225472;
    v7[2] = __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke;
    v7[3] = &unk_1E4A11E78;
    v9 = a2;
    v7[4] = self;
    v6 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v5;
    -[FBScene updateSettingsWithBlock:](self, "updateSettingsWithBlock:", v7);

    v5 = v6;
  }

}

- (void)updateSettingsWithTransitionBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v9 = v4;
    -[FBScene settings](self, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v9[2](v9, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene updateSettings:withTransitionContext:completion:](self, "updateSettings:withTransitionContext:completion:", v6, v7, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsUpdateBlock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene updateSettingsWithTransitionBlock:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "_uikitShimming_isUISubclass") & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("settings is of an unexpected class : %@"), v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)performUpdate:(id)a3 withCompletion:(id)a4
{
  -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 1, a3, a4);
}

- (void)updateSettings:(id)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  id *v5;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v10 = a4;
  v11 = a5;
  -[FBScene _verifyIntegrityOfExtensionsInSettings:](self, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke;
    v22[3] = &unk_1E4A12F18;
    v14 = v22;
    v5 = &v23;
    v23 = v11;
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)MEMORY[0x1A8590C4C](v14);
  if (v10 && !objc_msgSend(v10, "_indirect_isEmpty"))
  {
    -[FBScene _beginUpdate]((uint64_t)self);
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v19[*MEMORY[0x1E0D23318]], v12);
    objc_storeStrong((id *)&v19[*MEMORY[0x1E0D232F0]], a4);
    -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 0, 0, v15);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D23270];
    -[FBScene settings](self, "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "diffFromSettings:toSettings:", v17, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke_2;
    v20[3] = &unk_1E4A142B0;
    v21 = v18;
    v19 = v18;
    -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 0, v20, v15);

  }
  if (v11)

}

- (char)_beginUpdate
{
  uint64_t v2;
  void *v3;
  void *v4;
  char *v5;
  int *v6;
  id *v7;
  void *v9;
  void *v10;

  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _beginUpdate]");
    if (*(_BYTE *)(a1 + 207))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot re-entrantly begin a new scene update"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _beginUpdate].cold.2();
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B3318);
    }
    if (*(_QWORD *)(a1 + 160))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot begin a new update while one is ongoing"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _beginUpdate].cold.1();
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B3370);
    }
    *(_BYTE *)(a1 + 207) = 1;
    v2 = *(_QWORD *)(a1 + 184);
    v3 = (void *)objc_opt_new();
    v4 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = v3;

    v5 = v3;
    v6 = (int *)MEMORY[0x1E0D23318];
    objc_storeStrong((id *)&v5[*MEMORY[0x1E0D23318]], *(id *)(a1 + 96));
    if (v2)
      v7 = (id *)&v5[*v6];
    else
      v7 = (id *)(a1 + 128);
    objc_storeStrong((id *)&v5[*MEMORY[0x1E0D23310]], *v7);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_verifyIntegrityOfExtensionsInSettings:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "_progenitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)a1[12];

    if (v5 != v6)
    {
      FBLogScene();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[FBScene _verifyIntegrityOfExtensionsInSettings:].cold.2(a1);

    }
    v8 = v4;
    objc_msgSend(a1, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_allSceneExtensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_allSceneExtensions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) == 0)
    {
      FBLogScene();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[FBScene _verifyIntegrityOfExtensionsInSettings:].cold.1(a1, v12);

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50__FBScene__verifyIntegrityOfExtensionsInSettings___block_invoke;
      v15[3] = &unk_1E4A144D0;
      v16 = v10;
      v17 = v9;
      v13 = objc_msgSend(v8, "copy:", v15);

      v8 = (id)v13;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_createTransitionContext
{
  void *v2;
  void *v3;

  -[FBSSceneDefinition specification](self->_definition, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "transitionContextClass"), "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (char)initWithDefiniton:(void *)a3 remnant:(void *)a4 settings:(void *)a5 initialClientSettings:(void *)a6 clientProvider:(void *)a7 workspace:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  id *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id *v45;
  uint64_t v46;
  void *v47;
  id *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id obj;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id location;
  objc_super v80;

  v13 = a2;
  obj = a3;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v77 = a6;
  v17 = a7;
  v75 = v17;
  v76 = v16;
  if (a1)
  {
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("workspace != nil"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:].cold.1();
      objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B3D08);
    }
    if ((objc_msgSend(v13, "isValid") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[definition isValid]"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:].cold.5();
      objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B3D6CLL);
    }
    v18 = v14;
    if (v18)
    {
      NSClassFromString(CFSTR("FBSceneRemnant"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:].cold.4();
        objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B3DE8);
      }
    }

    v19 = v15;
    if (v19)
    {
      NSClassFromString(CFSTR("FBSSceneSettings"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:].cold.3();
        objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B3E4CLL);
      }
    }

    v20 = v16;
    if (v20)
    {
      NSClassFromString(CFSTR("FBSSceneClientSettings"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:].cold.2();
        objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B3EB0);
      }
    }

    if (initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace__onceToken != -1)
      dispatch_once(&initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace__onceToken, &__block_literal_global_25);
    v80.receiver = a1;
    v80.super_class = (Class)FBScene;
    v21 = (char *)objc_msgSendSuper2(&v80, sel_init);
    v22 = v21;
    if (v21)
    {
      v71 = a6;
      v72 = v15;
      v73 = v14;
      *((_DWORD *)v21 + 2) = 0;
      v23 = objc_msgSend(v13, "copy");
      v24 = (void *)*((_QWORD *)v22 + 14);
      *((_QWORD *)v22 + 14) = v23;

      *((_QWORD *)v22 + 23) = 0;
      objc_storeStrong((id *)v22 + 29, a7);
      objc_msgSend(v13, "identity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clientIdentity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "specification");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      v30 = (void *)*((_QWORD *)v22 + 9);
      *((_QWORD *)v22 + 9) = v29;

      objc_msgSend(v25, "workspaceIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "copy");
      v33 = (void *)*((_QWORD *)v22 + 10);
      *((_QWORD *)v22 + 10) = v32;

      v34 = objc_msgSend(v26, "targetsClientEndpoint");
      v35 = (void *)MEMORY[0x1E0D231F8];
      v70 = v26;
      if (v34)
      {
        v36 = getpid();
        objc_msgSend(v26, "processIdentity");
        v37 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "internalWorkspaceIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "tokenWithHostPID:directEndpointTarget:workspace:identifier:", v36, v37, v38, *((_QWORD *)v22 + 9));
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)*((_QWORD *)v22 + 11);
        *((_QWORD *)v22 + 11) = v39;
      }
      else
      {
        +[FBWorkspaceDomain sharedInstance]();
        v37 = (id *)objc_claimAutoreleasedReturnValue();
        -[FBWorkspaceDomain endpoint](v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "internalWorkspaceIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "tokenWithHostEndpoint:workspace:identifier:", v38, v40, *((_QWORD *)v22 + 9));
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)*((_QWORD *)v22 + 11);
        *((_QWORD *)v22 + 11) = v41;

      }
      if (v19)
      {
        v43 = objc_msgSend(v19, "_copyClearingProgenitor:", 0);
      }
      else
      {
        objc_msgSend((id)objc_msgSend(v27, "settingsClass"), "settings");
        v43 = objc_claimAutoreleasedReturnValue();
      }
      v45 = (id *)(v22 + 96);
      v44 = (void *)*((_QWORD *)v22 + 12);
      *((_QWORD *)v22 + 12) = v43;
      v15 = v72;
      v14 = v73;

      if (v20)
      {
        v46 = objc_msgSend(v20, "copy");
      }
      else
      {
        objc_msgSend((id)objc_msgSend(v27, "clientSettingsClass"), "settings");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v48 = (id *)(v22 + 104);
      v47 = (void *)*((_QWORD *)v22 + 13);
      *((_QWORD *)v22 + 13) = v46;

      v49 = -[FBSceneLayerManager _initWithScene:]([FBSceneLayerManager alloc], "_initWithScene:", v22);
      v50 = (void *)*((_QWORD *)v22 + 2);
      *((_QWORD *)v22 + 2) = v49;

      v51 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v52 = (void *)*((_QWORD *)v22 + 4);
      *((_QWORD *)v22 + 4) = v51;

      v22[202] = v77 != 0;
      objc_storeStrong((id *)v22 + 7, v71);
      objc_storeStrong((id *)v22 + 15, obj);
      if (objc_msgSend(*((id *)v22 + 12), "_hasAnySceneExtension"))
      {
        v53 = objc_msgSend(*v45, "_copyClearingProgenitor:", &__block_literal_global_38);
        v54 = *v45;
        *v45 = (id)v53;

      }
      if (objc_msgSend(*v48, "_hasAnySceneExtension"))
      {
        v55 = objc_msgSend(*v48, "copy:", &__block_literal_global_39);
        v56 = *v48;
        *v48 = (id)v55;

      }
      FBSGetDefaultExtensions();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addExtensions:", v57);

      objc_initWeak(&location, v22);
      v58 = MEMORY[0x1E0C80D38];
      v59 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v22, "loggingIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", CFSTR("FBScene - %@"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_copyWeak(&v78, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)*((_QWORD *)v22 + 5);
      *((_QWORD *)v22 + 5) = v62;

      v22[208] = 1;
      objc_destroyWeak(&v78);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id result;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "_uikitShimming_isUISubclass") & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("settings is of an unexpected class : %@"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_verifyIntegrityOfExtensionsInSettings:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9_3(&dword_1A359A000, v2, v3, "[%{public}@] updated settings were not derived from the scene's previous settings", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_4();
}

- (unint64_t)_setContentState:(unint64_t)result
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = *(_QWORD *)(result + 224);
    if (result != a2)
    {
      if (!*(_QWORD *)(v3 + 232))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_workspace != nil"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBScene _setContentState:].cold.1();
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B6020);
      }
      if (*(_BYTE *)(v3 + 201))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromFBSceneContentState(result);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromFBSceneContentState(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("cannot re-entrantly mutate contentState (%@ --> %@)"), v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBScene _setContentState:].cold.2();
        objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B60A4);
      }
      FBLogScene();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v3, "loggingIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromFBSceneContentState(a2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v6;
        _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] scene content state changed: %{public}@", buf, 0x16u);

      }
      *(_QWORD *)(v3 + 224) = a2;
      *(_BYTE *)(v3 + 201) = 1;
      v7 = *(void **)(v3 + 232);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __28__FBScene__setContentState___block_invoke;
      v13[3] = &unk_1E4A143A0;
      v13[4] = v3;
      result = objc_msgSend(v7, "scene:performCalloutsToObservers:", v3, v13);
      *(_BYTE *)(v3 + 201) = 0;
    }
  }
  return result;
}

- (void)activateWithTransitionContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 active;
  FBSceneRemnant *remnant;
  char v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  FBProcess *clientProcess;
  id *v18;
  id *v19;
  id *v20;
  NSObject *v21;
  BOOL v22;
  FBSceneLayerManager *layerManager;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  const char *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  SEL v36;
  char v37;
  _QWORD v38[4];
  id v39;
  FBScene *v40;
  BOOL v41;
  _QWORD block[4];
  const __CFString *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  const __CFString *v47;
  id v48;
  id v49;
  id v50[2];

  v7 = a3;
  v8 = a4;
  if (!self->_finishedInit)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate a scene during init"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene activateWithTransitionContext:completion:].cold.1();
    goto LABEL_29;
  }
  if (self->_midUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate a scene mid update"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene activateWithTransitionContext:completion:].cold.4();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B6FFCLL);
  }
  if (self->_deactivating)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate a scene mid deactivation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene activateWithTransitionContext:completion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B7054);
  }
  v9 = v8;
  if (self->_legacy)
  {
    if (!self->_legacyActivated)
    {
      self->_legacyActivated = 1;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("legacy scenes can only ever be activated once"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene activateWithTransitionContext:completion:].cold.2();
LABEL_29:
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B6FA4);
  }
LABEL_7:
  active = self->_active;
  remnant = self->_remnant;
  v50[0] = 0;
  v12 = -[FBScene _activateWithTransitionContext:error:]((uint64_t)self, v7, v50);
  v13 = v50[0];
  objc_msgSend(v7, "executionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "completion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v32 = a2;
    if (active)
    {
      v16 = CFSTR("Provided execution context was not used because the scene was already active.");
    }
    else if (self->_invalidated)
    {
      v16 = CFSTR("Scene was not activated because it had already been invalidated.");
    }
    else
    {
      v16 = CFSTR("Provided execution context was not used to create a process.");
    }
    v31 = v12;
    clientProcess = self->_clientProcess;
    if (clientProcess)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke;
      v46[3] = &unk_1E4A141C0;
      v18 = &v49;
      v19 = (id *)&v47;
      v49 = v15;
      v47 = v16;
      v20 = &v48;
      v48 = v13;
      -[FBProcess _executeBlockAfterBootstrap:](clientProcess, "_executeBlockAfterBootstrap:", v46);
    }
    else
    {
      +[FBProcess calloutQueue](FBProcess, "calloutQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke_2;
      block[3] = &unk_1E4A141E8;
      v18 = &v45;
      v19 = (id *)&v43;
      v45 = v15;
      v43 = v16;
      v20 = &v44;
      v44 = v13;
      dispatch_async(v21, block);

    }
    a2 = v32;
    v12 = v31;
  }
  v22 = remnant != 0;
  layerManager = self->_layerManager;
  -[FBSSceneClientSettings layers](self->_clientSettings, "layers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneLayerManager _setLayers:](layerManager, "_setLayers:", v24);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke_3;
  v38[3] = &unk_1E4A14238;
  v39 = v7;
  v40 = self;
  v41 = v22;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke_5;
  v33[3] = &unk_1E4A14260;
  v37 = v12;
  v33[4] = self;
  v34 = v13;
  v35 = v9;
  v36 = a2;
  v25 = v9;
  v26 = v13;
  v27 = v7;
  -[FBScene performUpdate:withCompletion:](self, "performUpdate:withCompletion:", v38, v33);

}

- (uint64_t)_activateWithTransitionContext:(_QWORD *)a3 error:
{
  id v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  FBMutableProcessExecutionContext *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  _QWORD v83[5];
  id v84;
  uint64_t v85;
  char *v86;
  id v87;
  id v88;
  id v89;
  unsigned __int8 v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_8;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _activateWithTransitionContext:error:]");
  if (*(_BYTE *)(a1 + 203))
  {
    if (a3)
      *a3 = 0;
    a1 = 1;
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 205))
  {
    if (a3)
    {
      FBSceneErrorCreate(2uLL, CFSTR("Cannot activate an invalidated scene."), 0);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
    goto LABEL_8;
  }
  if (!*(_QWORD *)(a1 + 232))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_workspace"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene _activateWithTransitionContext:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B799CLL);
  }
  if (*(_QWORD *)(a1 + 216))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_clientHandle == nil"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene _activateWithTransitionContext:error:].cold.10();
    objc_msgSend(objc_retainAutorelease(v77), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B7A00);
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 202))
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_client == nil"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _activateWithTransitionContext:error:].cold.7();
      objc_msgSend(objc_retainAutorelease(v80), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B7B20);
    }
    objc_msgSend(*(id *)(a1 + 112), "clientIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isLocal"))
    {
      +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentProcess");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v13;

      +[FBSceneClientHandle handleForScene:clientProcess:](FBSceneClientHandle, "handleForScene:clientProcess:", a1, *(_QWORD *)(a1 + 64));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = v15;

      +[FBLocalSynchronousSceneClientProvider sharedInstance](FBLocalSynchronousSceneClientProvider, "sharedInstance");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v17;

      v19 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v24 = *(void **)(a1 + 120);
    if (v24)
    {
      objc_msgSend(v24, "_workspace");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "process");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v25
        && v26
        && (objc_msgSend(*(id *)(a1 + 120), "_assertion"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v29 = objc_msgSend(v28, "isValid"),
            v28,
            (v29 & 1) != 0))
      {
        v19 = 0;
      }
      else
      {

        FBSceneErrorCreate(1uLL, CFSTR("failed to activate scene from remnant"), 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v27 = 0;
      }
      goto LABEL_46;
    }
    objc_msgSend(v11, "processIdentity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientProcessHandle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 96), "isClientFuture"))
    {
      objc_msgSend(*(id *)(a1 + 96), "clientProcess");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        if (v31 && (objc_msgSend(v31, "isEqual:", v33) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("a client future can only activate for the process that requested it"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene _activateWithTransitionContext:error:].cold.6();
LABEL_100:
          objc_msgSend(objc_retainAutorelease(v74), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35B78A8);
        }
        v34 = v33;

        v31 = v34;
      }

    }
    if (v31)
    {
      objc_msgSend(v31, "identity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqual:", v30);

      if ((v36 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client process identity does not match provided handle's identity"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBScene _activateWithTransitionContext:error:].cold.5();
        objc_msgSend(objc_retainAutorelease(v81), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35B7B78);
      }
      +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 0;
      objc_msgSend(v37, "_createProcessFutureForProcessHandle:error:", v31, &v89);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v89;

LABEL_40:
      if (v27)
      {
        objc_msgSend(v27, "workspace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 0;
LABEL_45:

LABEL_46:
        v38 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v27;
        v39 = v27;

        v40 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = v25;

        goto LABEL_47;
      }
LABEL_44:
      v25 = 0;
      goto LABEL_45;
    }
    if (objc_msgSend(*(id *)(a1 + 96), "isClientFuture"))
    {
      FBSceneErrorCreate(3uLL, CFSTR("client futures must be activated with a specific client process"), 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      goto LABEL_44;
    }
    objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isEqual:", v30);

    if (v65)
    {
      +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "currentProcess");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      +[FBSceneClientHandle handleForScene:clientProcess:](FBSceneClientHandle, "handleForScene:clientProcess:", a1, v27);
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = v67;

      v19 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v5, "executionContext");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (FBMutableProcessExecutionContext *)objc_msgSend(v69, "mutableCopy");

    if (v70)
    {
      -[FBProcessExecutionContext identity](v70, "identity");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        -[FBProcessExecutionContext identity](v70, "identity");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "isEqual:", v30);

        if ((v73 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client process identity does not match execution context identity"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene _activateWithTransitionContext:error:].cold.4();
          goto LABEL_100;
        }
      }
      else
      {
        -[FBProcessExecutionContext setIdentity:](v70, "setIdentity:", v30);
      }
    }
    else
    {
      v70 = -[FBProcessExecutionContext initWithIdentity:]([FBMutableProcessExecutionContext alloc], "initWithIdentity:", v30);
    }
    v82 = -[FBProcessExecutionContext copyOrUpdateForSceneActivationWithSettings:](v70, "copyOrUpdateForSceneActivationWithSettings:", *(_QWORD *)(a1 + 96));

    +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    objc_msgSend(v75, "_createProcessFutureWithExecutionContext:error:", v82, &v88);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v88;

    objc_msgSend(v5, "setExecutionContext:", 0);
    goto LABEL_40;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_client != nil"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene _activateWithTransitionContext:error:].cold.8();
    objc_msgSend(objc_retainAutorelease(v78), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B7A64);
  }
  objc_msgSend(v5, "clientProcessHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("legacy scenes do not support targeting clients by PID"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene _activateWithTransitionContext:error:].cold.9();
    objc_msgSend(objc_retainAutorelease(v79), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B7ABCLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "process");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v9;
  }
  else
  {
    +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentProcess");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v20;

  }
  +[FBSceneClientHandle handleForScene:clientProcess:](FBSceneClientHandle, "handleForScene:clientProcess:", a1, *(_QWORD *)(a1 + 64));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(a1 + 216);
  *(_QWORD *)(a1 + 216) = v22;

  v19 = 0;
LABEL_48:
  objc_msgSend(v5, "executionContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    FBLogScene();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[FBScene _activateWithTransitionContext:error:].cold.3((void *)a1);

  }
  v43 = objc_msgSend(*(id *)(a1 + 104), "copy:", &__block_literal_global_179);
  v44 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v43;

  v45 = *(void **)(a1 + 56);
  if (!v45)
  {
    FBLogScene();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[FBScene _activateWithTransitionContext:error:].cold.2((void *)a1, v19, v53);
    v50 = v19;
    goto LABEL_60;
  }
  v46 = *(_QWORD *)(a1 + 96);
  v47 = *(_QWORD *)(a1 + 104);
  v48 = *(_QWORD *)(a1 + 120);
  v87 = 0;
  objc_msgSend(v45, "registerHost:settings:initialClientSettings:fromRemnant:error:", a1, v46, v47, v48, &v87);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v87;

  v51 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v49;

  if (!*(_QWORD *)(a1 + 48))
  {
    FBLogScene();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)a1, "loggingIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v50, "descriptionWithMultilinePrefix:", 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v92 = v61;
      v93 = 2114;
      v94 = v62;
      v95 = 2114;
      v96 = v63;
      _os_log_error_impl(&dword_1A359A000, v53, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to connect with %{public}@: %{public}@.", buf, 0x20u);

    }
LABEL_60:

    v52 = 0;
    goto LABEL_61;
  }
  v52 = 1;
LABEL_61:
  *(_BYTE *)(a1 + 203) = 1;
  v54 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 120) = 0;

  ++*(_QWORD *)(a1 + 176);
  FBLogScene();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)a1, "loggingIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *(_QWORD *)(a1 + 176);
    *(_DWORD *)buf = 138543618;
    v92 = v56;
    v93 = 2048;
    v94 = v57;
    _os_log_impl(&dword_1A359A000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@][%lu] Scene activated.", buf, 0x16u);

  }
  if (v52 && !*(_QWORD *)(a1 + 216))
  {
    v58 = *(_QWORD *)(a1 + 176);
    v59 = *(id *)(a1 + 64);
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __48__FBScene__activateWithTransitionContext_error___block_invoke_180;
    v83[3] = &unk_1E4A14458;
    v85 = v58;
    v86 = sel__activateWithTransitionContext_error_;
    v83[4] = a1;
    v84 = v59;
    v60 = v59;
    objc_msgSend(v60, "_executeBlockAfterLaunchCompletes:", v83);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v50);
  v90 = v52;

  a1 = v90;
LABEL_8:

  return a1;
}

- (void)performUpdate:(id)a3
{
  -[FBScene performUpdate:withCompletion:](self, "performUpdate:withCompletion:", a3, 0);
}

- (void)updateSettings:(id)a3 withTransitionContext:(id)a4
{
  -[FBScene updateSettings:withTransitionContext:completion:](self, "updateSettings:withTransitionContext:completion:", a3, a4, 0);
}

- (void)setDelegate:(id)a3
{
  FBSceneObserver *delegateProxy;
  void *v5;
  FBSceneObserver *v6;
  FBSceneObserver *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene setDelegate:]");
  delegateProxy = self->_delegateProxy;
  if (delegateProxy)
  {
    self->_delegateProxy = 0;

  }
  v5 = v8;
  if (v8)
  {
    v6 = (FBSceneObserver *)-[FBSceneObserver initWithDelegate:]([FBSceneObserver alloc], v8);
    v7 = self->_delegateProxy;
    self->_delegateProxy = v6;

    v5 = v8;
  }

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

- (void)configureParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FBSSceneClientSettings *v9;
  FBSSceneClientSettings *clientSettings;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene configureParameters:]");
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block != ((void *)0)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene configureParameters:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BFF38);
  }
  if (self->_active)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot call configureParameters on an active scene"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene configureParameters:].cold.3();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BFF90);
  }
  if (self->_configuringParameters)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("re-entrant mutation during configureParameters is not supported"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene configureParameters:].cold.2();
    goto LABEL_15;
  }
  v4 = objc_alloc(MEMORY[0x1E0D23148]);
  -[FBSSceneDefinition specification](self->_definition, "specification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSpecification:", v5);

  -[FBScene settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSettings:", v7);

  objc_msgSend(v6, "setClientSettings:", self->_clientSettings);
  self->_configuringParameters = 1;
  v14[2](v14, v6);
  self->_configuringParameters = 0;
  objc_msgSend(v6, "clientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (FBSSceneClientSettings *)objc_msgSend(v8, "copy");
  clientSettings = self->_clientSettings;
  self->_clientSettings = v9;

  objc_msgSend(v6, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene updateSettings:withTransitionContext:](self, "updateSettings:withTransitionContext:", v11, 0);

}

- (void)activateWithTransitionContext:(id)a3
{
  -[FBScene activateWithTransitionContext:completion:](self, "activateWithTransitionContext:completion:", a3, 0);
}

uint64_t __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke()
{
  objc_opt_class();
  return _class_setCustomDeallocInitiation();
}

uint64_t __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_removeAllSceneExtensions");
}

uint64_t __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_removeAllSceneExtensions");
}

id __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (FBSceneDelegate)delegate
{
  return (FBSceneDelegate *)-[FBSceneObserver delegate]((id *)&self->_delegateProxy->super.isa);
}

- (FBSSceneParameters)parameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene parameters]");
  v3 = (void *)MEMORY[0x1E0D23200];
  -[FBSSceneDefinition specification](self->_definition, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parametersForSpecification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBScene settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSettings:", v6);

  objc_msgSend(v5, "setClientSettings:", self->_clientSettings);
  return (FBSSceneParameters *)v5;
}

- (void)activate:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  if (a3)
  {
    v4 = (void (**)(_QWORD))a3;
    -[FBScene _createTransitionContext](self, "_createTransitionContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4);

  }
  else
  {
    v5 = 0;
  }
  -[FBScene activateWithTransitionContext:](self, "activateWithTransitionContext:", v5);

}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[5];
  v2 = a1[6];
  v4 = (void *)a1[4];
  v5 = a2;
  FBSceneErrorCreate(3uLL, v4, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v6);

}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  FBSceneErrorCreate(3uLL, *(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41)))
    objc_msgSend(v5, "workspace:didAddScene:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
  if (v7 && !*(_BYTE *)(a1 + 40))
    objc_msgSend(v7, "sceneWillActivate:", *(_QWORD *)(a1 + 32));

}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v12;

  v5 = a3;
  if (*(_BYTE *)(a1 + 64))
    v6 = 1;
  else
    v6 = (_DWORD)a2 == 0;
  if (v6)
  {
    v12 = v5;
    if ((a2 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      if (*(_QWORD *)(a1 + 40))
        v8 = *(void **)(a1 + 40);
      else
        v8 = v5;
      FBSceneErrorCreate(1uLL, CFSTR("Scene activation failed."), v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene _deactivateForClientError:](*(void **)(a1 + 32), v7);
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, a2, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activated || !success"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __52__FBScene_activateWithTransitionContext_completion___block_invoke_5_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_deactivateForClientError:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (!a1)
    goto LABEL_4;
  if (v3)
  {
    v6 = v3;
    objc_msgSend(a1, "_createTransitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v6);
    -[FBScene _deactivateAndInvalidate:transitionContext:]((uint64_t)a1, 0, v4);

    v3 = v6;
LABEL_4:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("error != nil"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBScene _deactivateForClientError:].cold.1();
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)deactivate:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  if (a3)
  {
    v4 = (void (**)(_QWORD))a3;
    -[FBScene _createTransitionContext](self, "_createTransitionContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4);

  }
  else
  {
    v5 = 0;
  }
  -[FBScene deactivateWithTransitionContext:](self, "deactivateWithTransitionContext:", v5);

}

- (void)deactivateWithTransitionContext:(id)a3
{
  -[FBScene _deactivateAndInvalidate:transitionContext:]((uint64_t)self, 0, a3);
}

- (void)_deactivateAndInvalidate:(void *)a3 transitionContext:
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _deactivateAndInvalidate:transitionContext:]");
    if (*(_BYTE *)(a1 + 207))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_midUpdate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _deactivateAndInvalidate:transitionContext:].cold.3();
      goto LABEL_31;
    }
    if (*(_BYTE *)(a1 + 204))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot re-entrantly deactivate a scene"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _deactivateAndInvalidate:transitionContext:].cold.2();
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F5FF4);
    }
    v5 = (a2 & 1) != 0 || *(_BYTE *)(a1 + 202) != 0;
    if (!*(_BYTE *)(a1 + 205) && (*(_BYTE *)(a1 + 203) != 0 || !~v5))
    {
      objc_msgSend(v16, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "isEqualToString:", CFSTR("FBSceneErrorDomain"));

      v8 = v6;
      v9 = v8;
      v10 = !v5;
      if (v8)
        v10 = 1;
      v11 = v8;
      if ((v10 & 1) == 0)
      {
        FBSceneErrorCreate(2uLL, CFSTR("Scene was invalidated."), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v5)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 152));
        objc_msgSend(WeakRetained, "removeObserver:", a1);

      }
      if (!v16 && v11)
      {
        objc_msgSend((id)a1, "_createTransitionContext");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setError:", v11);
      }
      *(_BYTE *)(a1 + 204) = 1;
      v13 = *(void **)(a1 + 232);
      if (v13)
      {
        v16 = v16;
        objc_msgSend(v13, "scene:deactivateAndInvalidate:withContext:block:", a1, v5);

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_workspace != nil"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _deactivateAndInvalidate:transitionContext:].cold.1();
LABEL_31:
      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F5F9CLL);
    }
  }
LABEL_22:

}

- (void)invalidate
{
  -[FBScene _deactivateAndInvalidate:transitionContext:]((uint64_t)self, 1, 0);
}

- (void)invalidate:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  if (a3)
  {
    v4 = (void (**)(_QWORD))a3;
    -[FBScene _createTransitionContext](self, "_createTransitionContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4);

  }
  else
  {
    v5 = 0;
  }
  -[FBScene _deactivateAndInvalidate:transitionContext:]((uint64_t)self, 1, v5);

}

- (void)addExtension:(Class)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension != ((void *)0)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene addExtension:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F61C4);
  }
  v6[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene addExtensions:](self, "addExtensions:", v4);

}

- (void)addExtensions:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __25__FBScene_addExtensions___block_invoke;
    v5[3] = &unk_1E4A13AC0;
    v6 = v4;
    -[FBScene updateSettings:](self, "updateSettings:", v5);

  }
}

void __25__FBScene_addExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
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
        objc_msgSend(v3, "_addSceneExtension:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeExtension:(Class)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension != ((void *)0)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene removeExtension:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F6438);
  }
  v6[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene removeExtensions:](self, "removeExtensions:", v4);

}

- (void)removeExtensions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  FBScene *v11;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[FBSSceneDefinition specification](self->_definition, "specification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FBSGetDefaultExtensions();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__FBScene_removeExtensions___block_invoke;
    v8[3] = &unk_1E4A14288;
    v9 = v7;
    v10 = v5;
    v11 = self;
    v6 = v5;
    -[FBScene updateSettings:](self, "updateSettings:", v8);

  }
}

void __28__FBScene_removeExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_class *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v16;
    *(_QWORD *)&v6 = 138543618;
    v14 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(objc_class **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10, v14, (_QWORD)v15) & 1) != 0)
        {
          FBLogScene();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 112), "identity");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v14;
            v20 = v12;
            v21 = 2114;
            v22 = v13;
            _os_log_error_impl(&dword_1A359A000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot remove extension \"%{public}@\" because it is part of this scene's specification", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(v3, "_removeSceneExtension:", v10);
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

}

- (void)setParentScene:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene setParentScene:]");
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  v6 = WeakRetained;
  if (WeakRetained != v4)
  {
    objc_msgSend(WeakRetained, "removeObserver:", self);
    objc_storeWeak((id *)&self->_parentScene, v4);
    objc_msgSend(v4, "addObserver:", self);
    FBLogScene();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        -[FBScene loggingIdentifier](self, "loggingIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "loggingIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v9;
        v24 = 2114;
        v25 = v10;
        _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting parent scene: %{public}@", (uint8_t *)&v22, 0x16u);

      }
      self->_newlyReparented = 1;
      v7 = objc_opt_new();
      objc_msgSend(v4, "settings");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (int *)MEMORY[0x1E0D23318];
      v13 = (int)*MEMORY[0x1E0D23318];
      v14 = *(Class *)((char *)&v7->isa + v13);
      *(Class *)((char *)&v7->isa + v13) = (Class)v11;

      v15 = (int)*MEMORY[0x1E0D23310];
      v16 = *(Class *)((char *)&v7->isa + v15);
      *(Class *)((char *)&v7->isa + v15) = 0;

      objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", 0, *(Class *)((char *)&v7->isa + *v12));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (int)*MEMORY[0x1E0D232F8];
      v19 = *(Class *)((char *)&v7->isa + v18);
      *(Class *)((char *)&v7->isa + v18) = (Class)v17;

      -[FBScene scene:didUpdateSettings:](self, "scene:didUpdateSettings:", v4, v7);
      if (self->_newlyReparented)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reparenting was not completed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBScene setParentScene:].cold.1();
        objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35F68D8);
      }
    }
    else if (v8)
    {
      -[FBScene loggingIdentifier](self, "loggingIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v21;
      _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing parent scene.", (uint8_t *)&v22, 0xCu);

    }
  }

}

uint64_t __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToMutableSettings:", a2);
}

- (void)_joinUpdate:(void *)a3 block:(void *)a4 completion:
{
  void (**v7)(id, id, _QWORD);
  id v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  int *v22;
  id v23;
  int *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  id v44;

  v7 = a3;
  v8 = a4;
  if (!a1)
    goto LABEL_37;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _joinUpdate:block:completion:]");
  if (*(unsigned __int8 *)(a1 + 200) >= 0x10u)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_updateDepth < 16"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene _joinUpdate:block:completion:].cold.1();
LABEL_49:
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F6D84);
  }
  if (a2)
  {
    if (!*(_BYTE *)(a1 + 208))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate a scene during init"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _joinUpdate:block:completion:].cold.2();
      objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F6E34);
    }
    if (*(_BYTE *)(a1 + 211))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot activate a scene during component init"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _joinUpdate:block:completion:].cold.4();
      goto LABEL_49;
    }
  }
  if (*(_BYTE *)(a1 + 212))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("re-entrant mutation during configureParameters is not supported"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene _joinUpdate:block:completion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F6DDCLL);
  }
  v9 = (char *)*(id *)(a1 + 160);
  if (!v9)
  {
    -[FBScene _beginUpdate](a1);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (int *)MEMORY[0x1E0D232F0];
  if (*(_BYTE *)(a1 + 203) || (a2 & 1) != 0 || *(_BYTE *)(a1 + 210))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 160) + (int)*MEMORY[0x1E0D232F0]))
    {
      objc_msgSend((id)a1, "_createTransitionContext");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *v10;
      v13 = *(void **)&v9[v12];
      *(_QWORD *)&v9[v12] = v11;

    }
    v14 = 1;
    if (!v8)
      goto LABEL_21;
    goto LABEL_17;
  }
  v14 = 0;
  if (v8)
  {
LABEL_17:
    if (*(_QWORD *)(a1 + 168))
    {
      v15 = (void *)MEMORY[0x1A8590C4C]();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __40__FBScene__joinUpdate_block_completion___block_invoke;
      v42[3] = &unk_1E4A143C8;
      v43 = v8;
      v44 = v15;
      v16 = v15;
      v17 = MEMORY[0x1A8590C4C](v42);
      v18 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v17;

    }
    else
    {
      v19 = objc_msgSend(v8, "copy");
      v20 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v19;

    }
  }
LABEL_21:
  v21 = *(_BYTE *)(a1 + 200);
  *(_BYTE *)(a1 + 200) = v21 + 1;
  if (v7)
  {
    v22 = (int *)MEMORY[0x1E0D23308];
    v23 = *(id *)&v9[*MEMORY[0x1E0D23308]];
    v24 = (int *)MEMORY[0x1E0D23318];
    if (!v23)
    {
      v23 = (id)objc_msgSend(*(id *)&v9[*MEMORY[0x1E0D23318]], "mutableCopy");
      objc_storeStrong((id *)&v9[*v22], v23);
    }
    v7[2](v7, v23, *(_QWORD *)&v9[*v10]);
    v25 = *(id *)&v9[*v24];
    if ((objc_msgSend(v25, "isEqual:", v23) & 1) == 0)
    {
      v26 = objc_msgSend(v23, "copy");
      v27 = *v24;
      v28 = *(void **)&v9[v27];
      *(_QWORD *)&v9[v27] = v26;

      objc_msgSend(v25, "_allSceneExtensions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_allSceneExtensions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isEqualToOrderedSet:", v29) & 1) == 0)
      {
        v40 = v14;
        v31 = (void *)objc_msgSend(v30, "mutableCopy");
        objc_msgSend(v31, "minusOrderedSet:", v29);
        v32 = (void *)objc_msgSend(v29, "mutableCopy");
        objc_msgSend(v32, "minusOrderedSet:", v30);
        -[FBScene _addExtensions:removeExtensions:settings:](a1, v31, v32, v23);
        if ((objc_msgSend(*(id *)&v9[*MEMORY[0x1E0D23318]], "isEqual:", v23) & 1) == 0)
        {
          v33 = objc_msgSend(v23, "copy");
          v34 = (int)*MEMORY[0x1E0D23318];
          v35 = *(void **)&v9[v34];
          *(_QWORD *)&v9[v34] = v33;

        }
        v14 = v40;
      }

    }
    v21 = *(_BYTE *)(a1 + 200) - 1;
  }
  *(_BYTE *)(a1 + 200) = v21;
  *(_BYTE *)(a1 + 210) = v14;
  if (!v21 && !*(_BYTE *)(a1 + 213))
  {
    *(_BYTE *)(a1 + 213) = 1;
    if (*(_BYTE *)(a1 + 214))
    {
      v36 = *(_QWORD *)(a1 + 232);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __40__FBScene__joinUpdate_block_completion___block_invoke_2;
      v41[3] = &unk_1E4A12348;
      v41[4] = a1;
      -[FBSceneWorkspace _executeWhenIdle:](v36, (uint64_t)v41);
    }
    else
    {
      -[FBScene _finalizeSettingsUpdate](a1);
    }
  }

LABEL_37:
}

- (void)updateSettings:(id)a3
{
  -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 0, a3, 0);
}

- (void)sendActions:(id)a3
{
  -[FBScene sendActions:toExtension:](self, "sendActions:toExtension:", a3, 0);
}

- (void)sendActions:(id)a3 toExtension:(Class)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene sendActions:toExtension:]");
  objc_msgSend(v6, "fbs_singleLineDescriptionOfBSActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FBLogScene();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (!v9)
      goto LABEL_9;
    -[FBScene loggingIdentifier](self, "loggingIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v10;
    v32 = 2114;
    v33 = v11;
    v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) to \"%{public}@\": %{public}@", buf, 0x20u);

  }
  else
  {
    if (!v9)
      goto LABEL_9;
    -[FBScene loggingIdentifier](self, "loggingIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v10;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s): %{public}@", buf, 0x16u);
  }

LABEL_9:
  if (self->_legacy)
  {
    if (self->_invalidated)
    {
      FBLogScene();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FBScene sendActions:toExtension:].cold.6(self);
LABEL_29:

      goto LABEL_30;
    }
  }
  else
  {
    if (!self->_active)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_active"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene sendActions:toExtension:].cold.1();
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F72C4);
    }
    if (self->_invalidated)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_invalidated"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene sendActions:toExtension:].cold.5();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F7328);
    }
  }
  if (a4 && !-[FBScene conformsToExtension:](self, "conformsToExtension:", a4))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("scene does not conform to extension \"%@\"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene sendActions:toExtension:].cold.4();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F7260);
  }
  objc_opt_class();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("only actions of type BSAction can be sent : tried to send %@"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene sendActions:toExtension:].cold.3();
          objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35F71DCLL);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  if (!self->_clientToken)
  {
    FBLogScene();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FBScene sendActions:toExtension:].cold.2(self);
    goto LABEL_29;
  }
  -[FBSceneClient host:didReceiveActions:forExtension:](self->_client, "host:didReceiveActions:forExtension:", self, v13, a4);
LABEL_30:

}

- (BOOL)updateWhenMutable:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__FBScene_updateWhenMutable___block_invoke;
  v7[3] = &unk_1E4A130B8;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[FBScene executeWhenMutable:](self, "executeWhenMutable:", v7);

  return (char)self;
}

void __29__FBScene_updateWhenMutable___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isActive");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "performUpdate:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __29__FBScene_updateWhenMutable___block_invoke_2;
    v4[3] = &unk_1E4A142D8;
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "updateSettings:", v4);

  }
}

uint64_t __29__FBScene_updateWhenMutable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)executeWhenMutable:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[FBScene isMutable](self, "isMutable");
  if (v5)
    v4[2](v4);
  else
    -[FBSceneWorkspace _executeWhenIdle:]((uint64_t)self->_workspace, (uint64_t)v4);

  return v5;
}

- (BOOL)isMutable
{
  return (!self->_inTransaction || !self->_midUpdate)
      && !self->_contentStateIsChanging
      && !self->_deactivating
      && !self->_configuringParameters
      && !self->_invalidated;
}

- (id)createSnapshot
{
  void *v3;
  void *v4;

  -[FBScene snapshotContext](self, "snapshotContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene createSnapshotWithContext:](self, "createSnapshotWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createSnapshotWithContext:(id)a3
{
  id v4;
  FBSceneSnapshot *v5;
  NSObject *v6;

  v4 = a3;
  if (!-[FBScene isValid](self, "isValid") || !self->_active)
  {
    FBLogScene();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FBScene createSnapshotWithContext:].cold.1(self);

    goto LABEL_8;
  }
  if (!v4)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v5 = -[FBSceneSnapshot initWithScene:snapshotContext:]([FBSceneSnapshot alloc], "initWithScene:snapshotContext:", self, v4);
LABEL_9:

  return v5;
}

- (id)snapshotContext
{
  return -[FBSceneSnapshotContext initWithScene:]([FBSceneSnapshotContext alloc], "initWithScene:", self);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene scene:didUpdateSettings:]");
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "otherSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneSettings propagatedSettings](self->_settings, "propagatedSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "settingsDiff");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changedSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_msgSend(v16, "indirect_isPropagating") & 1) != 0
          || objc_msgSend(v9, "containsObject:", v16))
        {
          objc_msgSend(v8, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __35__FBScene_scene_didUpdateSettings___block_invoke;
  v24[3] = &unk_1E4A14300;
  v24[4] = self;
  v25 = v23;
  v26 = v8;
  v27 = v22;
  v28 = v7;
  v29 = v6;
  v17 = v6;
  v18 = v7;
  v19 = v22;
  v20 = v8;
  v21 = v23;
  -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 0, v24, 0);
  self->_newlyReparented = 0;

}

void __35__FBScene_scene_didUpdateSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 209))
  {
    objc_msgSend(v5, "_allSceneExtensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_allSceneExtensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v14) & 1) == 0
            && objc_msgSend(v14, "propagateToSceneWithDefinition:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)))
          {
            objc_msgSend(v5, "_addSceneExtension:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      }
      while (v11);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v15 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 203);
    FBLogScene();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    v40 = v6;
    if (v15)
    {
      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(*(id *)(a1 + 48), "count");
        objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v18;
        v52 = 2048;
        v53 = v19;
        v54 = 2114;
        v55 = v20;
        v21 = "[%{public}@] propagating %lu settings from %{public}@";
LABEL_19:
        _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, v21, buf, 0x20u);

      }
    }
    else if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(*(id *)(a1 + 48), "count");
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v18;
      v52 = 2048;
      v53 = v22;
      v54 = 2114;
      v55 = v20;
      v21 = "[%{public}@ (inactive)] propagating %lu settings from %{public}@";
      goto LABEL_19;
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v23 = *(id *)(a1 + 48);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          FBLogScene();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "indirect_name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v51 = v34;
            v52 = 2112;
            v53 = (uint64_t)v35;
            _os_log_debug_impl(&dword_1A359A000, v29, OS_LOG_TYPE_DEBUG, "[%{public}@] Propagating %@", buf, 0x16u);

          }
          if (objc_msgSend(v28, "indirect_isLegacy"))
          {
            v30 = objc_msgSend(v28, "indirect_legacySetting");
            objc_msgSend(*(id *)(a1 + 56), "objectForSetting:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(*(id *)(a1 + 56), "flagForSetting:", v30);
            objc_msgSend(v5, "otherSettings");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forSetting:", v31, v30);
            objc_msgSend(v33, "setFlag:forSetting:", v32, v30);

          }
          else
          {
            MEMORY[0x1A85906E8](*(_QWORD *)(a1 + 64), v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            FBSSettingsSetValueForSetting();
          }

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v25);
    }

    v6 = v40;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 203))
    {
      v36 = (int *)MEMORY[0x1E0D232F0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + (int)*MEMORY[0x1E0D232F0]), "animationSettings");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAnimationSettings:", v37);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + *v36), "animationFence");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v38, "copy");
      objc_msgSend(v40, "setAnimationFence:", v39);

    }
  }
  objc_msgSend(v6, "setParentUpdate:", *(_QWORD *)(a1 + 72));

}

- (void)sceneWillInvalidate:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene sceneWillInvalidate:]");
  FBLogScene();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene loggingIdentifier](self, "loggingIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Parent scene invalidated", (uint8_t *)&v6, 0xCu);

  }
  -[FBScene setParentScene:](self, "setParentScene:", 0);
}

- (BOOL)conformsToExtension:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene conformsToExtension:]");
  -[FBScene settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[FBSSceneDefinition specification](self->_definition, "specification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FBSGetDefaultExtensions();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", a3);

    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v5, "_allSceneExtensions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "containsObject:", a3);

    }
  }
  else
  {
    v9 = objc_msgSend(v5, "conformsToExtension:", a3);
  }

  return v9;
}

- (id)componentForExtension:(Class)a3 ofClass:(Class)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene componentForExtension:ofClass:]");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectForKey:](self->_components, "objectForKey:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      -[FBSceneObserver component](*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (a4)
        v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
      else
        v13 = 0;
      v14 = v13;

      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    v14 = 0;
  }

  return v14;
}

- (NSString)debugDescription
{
  return (NSString *)-[FBScene descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)client
{
  if (a1)
    a1 = (id *)a1[6];
  return a1;
}

- (void)_applyUpdate:(void *)a3 postStateApplicator:(void *)a4 completion:
{
  _QWORD *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(_QWORD *, _QWORD *);
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  char *v31;
  uint64_t v32;

  v25 = a2;
  v7 = a3;
  v8 = a4;
  if (!a1)
    goto LABEL_9;
  if (*(_BYTE *)(a1 + 214))
  {
    v9 = *(_QWORD *)(a1 + 184);
    if (v9)
    {
      objc_msgSend(v25, "settings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "_copyClearingProgenitor:", 0);

      objc_msgSend(v25, "settingsDiff");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "transitionContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(a1 + 96), v11);
      v14 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = 0;

      *(_BYTE *)(a1 + 207) = 0;
      v15 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = 0;

      *(_BYTE *)(a1 + 213) = 0;
      *(_BYTE *)(a1 + 210) = 0;
      v16 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = 0;

      v17 = objc_msgSend(v11, "isForeground");
      v18 = 0;
      v19 = 0;
      if (v17)
      {
        if (*(_QWORD *)(a1 + 224))
        {
LABEL_8:
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke;
          v26[3] = &unk_1E4A14378;
          v26[4] = a1;
          v27 = v11;
          v28 = v12;
          v29 = v13;
          v31 = sel__applyUpdate_postStateApplicator_completion_;
          v32 = v9;
          v30 = v8;
          v20 = (void (*)(_QWORD *, _QWORD *))v7[2];
          v21 = v13;
          v22 = v12;
          v23 = v11;
          v20(v7, v26);

LABEL_9:
          return;
        }
        v19 = 1;
        v18 = v9;
      }
      *(_QWORD *)(a1 + 192) = v18;
      -[FBScene _setContentState:](a1, v19);
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot perform scene update without first beginning a transaction"), v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBScene _applyUpdate:postStateApplicator:completion:].cold.1();
  objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_resetUpdateState
{
  void *v2;
  void *v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 207) = 0;
    v2 = *(void **)(a1 + 168);
    *(_QWORD *)(a1 + 168) = 0;

    *(_BYTE *)(a1 + 213) = 0;
    *(_BYTE *)(a1 + 210) = 0;
    v3 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;

  }
}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[6])
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_3;
    block[3] = &unk_1E4A12168;
    v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v10;
    goto LABEL_5;
  }
  v2 = v1[12];
  if (v2 == *(_QWORD *)(a1 + 40))
  {
    v3 = (void *)v1[7];
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_125;
    v11[3] = &unk_1E4A14350;
    v6 = *(_QWORD *)(a1 + 80);
    v11[4] = v1;
    v13 = v6;
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v3, "host:didUpdateSettings:withDiff:transitionContext:completion:", v1, v2, v4, v5, v11);
    v7 = v12;
LABEL_5:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_settings == newSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_cold_1();
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_125(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_2;
  v8[3] = &unk_1E4A14328;
  v13 = a2;
  v12 = a1[6];
  v6 = (void *)a1[5];
  v9 = a1[4];
  v10 = v5;
  v11 = v6;
  v7 = v5;
  -[FBScene _dispatchClientMessageWithBlock:](v9, v8);

}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v2 + 203)
      && *(_QWORD *)(v2 + 192) == *(_QWORD *)(a1 + 56)
      && objc_msgSend(*(id *)(v2 + 96), "isForeground"))
    {
      -[FBScene _setContentState:](*(_QWORD *)(a1 + 32), 2uLL);
    }
    v3 = 0;
  }
  else
  {
    FBSceneErrorCreate(1uLL, CFSTR("Scene update failed."), *(void **)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  FBSceneErrorCreate(1uLL, CFSTR("No scene client exists"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __40__FBScene__joinUpdate_block_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, id);
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  v7 = a3;
  v6(v5, a2, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_addExtensions:(void *)a3 removeExtensions:(void *)a4 settings:
{
  uint64_t v7;
  objc_class *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _BYTE *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  id *v37;
  uint64_t v38;
  objc_class *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  objc_class *v50;
  id v51;
  id v52;
  void *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id obj;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  objc_class *v68;
  objc_class *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  objc_class *v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v60 = a2;
  v59 = a3;
  v73 = a4;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 211))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("components cannot mutate extensions during init"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _addExtensions:removeExtensions:settings:].cold.2();
      objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F8F6CLL);
    }
    v72 = a1;
    *(_BYTE *)(a1 + 211) = 1;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = v60;
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    if (v64)
    {
      v62 = *(id *)v91;
      do
      {
        v7 = 0;
        do
        {
          if (*(id *)v91 != v62)
            objc_enumerationMutation(obj);
          v66 = v7;
          v8 = *(objc_class **)(*((_QWORD *)&v90 + 1) + 8 * v7);
          FBLogScene();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(v72 + 112), "identity");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v99 = v36;
            v100 = 2112;
            v101 = v8;
            _os_log_debug_impl(&dword_1A359A000, v9, OS_LOG_TYPE_DEBUG, "[%@] Adding extension: \"%@\", buf, 0x16u);

          }
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D230A0]), "initWithScene:extension:", v72, v8);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v68 = v8;
          -[objc_class hostComponents](v8, "hostComponents");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v87;
            v71 = v11;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v87 != v15)
                  objc_enumerationMutation(v12);
                v17 = objc_alloc(*(Class *)(*((_QWORD *)&v86 + 1) + 8 * i));
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v18 = objc_msgSend(v17, "initWithScene:", v10);
                else
                  v18 = objc_msgSend(v17, "init");
                v19 = (void *)v18;
                if (v18)
                {
                  FBLogScene();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(*(id *)(v72 + 112), "identity");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v19);
                    v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v99 = v22;
                    v100 = 2112;
                    v101 = v23;
                    _os_log_debug_impl(&dword_1A359A000, v20, OS_LOG_TYPE_DEBUG, "[%@] Instantiated component: \"%@\", buf, 0x16u);

                    v11 = v71;
                  }

                  v21 = -[FBSceneObserver initWithComponent:]([FBSceneObserver alloc], v19);
                  objc_msgSend(v11, "addObject:", v21);

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
            }
            while (v14);
          }

          v24 = *(void **)(v72 + 136);
          if (!v24)
          {
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = *(void **)(v72 + 136);
            *(_QWORD *)(v72 + 136) = v25;

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *(void **)(v72 + 144);
            *(_QWORD *)(v72 + 144) = v27;

            v24 = *(void **)(v72 + 136);
          }
          objc_msgSend(v24, "objectForKey:", v68);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v55 = (void *)MEMORY[0x1E0CB3940];
            NSStringFromClass(v68);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "stringWithFormat:", CFSTR("shouldn't have existing components for new extension %@"), v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBScene _addExtensions:removeExtensions:settings:].cold.1();
            objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A35F8F14);
          }
          objc_msgSend(*(id *)(v72 + 136), "setObject:forKey:", v11, v68);
          objc_msgSend(*(id *)(v72 + 144), "addObjectsFromArray:", v11);
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v30 = v11;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v83;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v83 != v33)
                  objc_enumerationMutation(v30);
                -[FBSceneObserver component](*(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v35, "setScene:", v10);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v35, "configureInitialSettings:", v73);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
            }
            while (v32);
          }

          v7 = v66 + 1;
        }
        while (v66 + 1 != v64);
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      }
      while (v64);
    }

    v37 = (id *)v72;
    *(_BYTE *)(v72 + 211) = 0;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v63 = v59;
    v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
    if (v67)
    {
      v65 = *(_QWORD *)v79;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v79 != v65)
            objc_enumerationMutation(v63);
          v70 = v38;
          v39 = *(objc_class **)(*((_QWORD *)&v78 + 1) + 8 * v38);
          FBLogScene();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v37, "loggingIdentifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(v39);
            v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v99 = v53;
            v100 = 2112;
            v101 = v54;
            _os_log_debug_impl(&dword_1A359A000, v40, OS_LOG_TYPE_DEBUG, "[%@] Removing extension: \"%@\", buf, 0x16u);

          }
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v69 = v39;
          objc_msgSend(v37[17], "objectForKey:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v75;
            do
            {
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v75 != v44)
                  objc_enumerationMutation(v41);
                v46 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k);
                -[FBSceneObserver component](v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v47, "componentWillInvalidate:", v73);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v47, "invalidate");
                objc_msgSend(v37[18], "removeObjectIdenticalTo:", v46);
                FBLogScene();
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v37, "loggingIdentifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", v47);
                  v50 = (objc_class *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v99 = v49;
                  v100 = 2112;
                  v101 = v50;
                  _os_log_debug_impl(&dword_1A359A000, v48, OS_LOG_TYPE_DEBUG, "[%@] Invalidated component: \"%@\", buf, 0x16u);

                  v37 = (id *)v72;
                }

              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
            }
            while (v43);
          }

          objc_msgSend(v37[17], "removeObjectForKey:", v69);
          if (!objc_msgSend(v37[17], "count"))
          {
            v51 = v37[17];
            v37[17] = 0;

            v52 = v37[18];
            v37[18] = 0;

          }
          v38 = v70 + 1;
        }
        while (v70 + 1 != v67);
        v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
      }
      while (v67);
    }

  }
}

void __40__FBScene__joinUpdate_block_completion___block_invoke_2(uint64_t a1)
{
  -[FBScene _finalizeSettingsUpdate](*(_QWORD *)(a1 + 32));
}

- (void)_finalizeSettingsUpdate
{
  int *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 210) || *(_BYTE *)(a1 + 203) || *(_BYTE *)(a1 + 202) || *(_BYTE *)(a1 + 205))
    {
      -[FBScene _applySettingsUpdateWithCompletion:](a1, *(void **)(a1 + 168));
    }
    else
    {
      v2 = (int *)MEMORY[0x1E0D232F0];
      v3 = *(_QWORD *)(a1 + 168);
      v4 = *(id *)(*(_QWORD *)(a1 + 160) + (int)*MEMORY[0x1E0D232F0]);
      v8 = (id)MEMORY[0x1A8590C4C](v3);
      v5 = *(_QWORD *)(a1 + 160);
      v6 = *v2;
      v7 = *(void **)(v5 + v6);
      *(_QWORD *)(v5 + v6) = 0;

      -[FBScene _applySettingsUpdateWithCompletion:](a1, 0);
      objc_msgSend((id)a1, "activateWithTransitionContext:completion:", v4, v8);

    }
  }
}

void __48__FBScene__activateWithTransitionContext_error___block_invoke_180(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__FBScene__activateWithTransitionContext_error___block_invoke_2;
  v5[3] = &unk_1E4A14430;
  v10 = a2;
  v2 = a1[6];
  v3 = a1[7];
  v4 = (void *)a1[5];
  v6 = a1[4];
  v8 = v2;
  v9 = v3;
  v7 = v4;
  -[FBScene _dispatchClientMessageWithBlock:](v6, v5);

}

uint64_t __48__FBScene__activateWithTransitionContext_error___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 64))
  {
    v1 = result;
    v3 = (id *)(result + 32);
    v2 = *(_QWORD *)(result + 32);
    if (!*(_BYTE *)(v2 + 205) && *(_BYTE *)(v2 + 203) && *(_QWORD *)(result + 48) == *(_QWORD *)(v2 + 176))
    {
      if (*(_QWORD *)(v2 + 216))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client handle must be nil"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          __48__FBScene__activateWithTransitionContext_error___block_invoke_2_cold_1();
        objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35F92B0);
      }
      +[FBSceneClientHandle handleForScene:clientProcess:](FBSceneClientHandle, "handleForScene:clientProcess:");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(v1 + 32);
      v6 = *(void **)(v5 + 216);
      *(_QWORD *)(v5 + 216) = v4;

      FBLogScene();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v3, "loggingIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *((_QWORD *)*v3 + 27);
        *(_DWORD *)buf = 138543618;
        v19 = v8;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client process connected: %{public}@", buf, 0x16u);

      }
      result = -[FBSceneWorkspace _suppressConnectionHandshakes](*((_QWORD *)*v3 + 29));
      if ((result & 1) == 0)
      {
        v10 = *v3;
        v11 = (void *)*((_QWORD *)*v3 + 29);
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __48__FBScene__activateWithTransitionContext_error___block_invoke_185;
        v16 = &unk_1E4A138E0;
        v17 = v10;
        return objc_msgSend(v11, "scene:enqueueCalloutsToObserversWithEventName:block:");
      }
    }
  }
  return result;
}

uint64_t __48__FBScene__activateWithTransitionContext_error___block_invoke_185(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scene:clientDidConnect:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
}

- (void)_applySettingsUpdateWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  char *v6;
  char *v7;
  int *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD block[4];
  char *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _applySettingsUpdateWithCompletion:]");
    if (*(_BYTE *)(a1 + 214))
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)a1, "loggingIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("re-entrant scene mutation is not supported (%@)"), v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _applySettingsUpdateWithCompletion:].cold.12();
      objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F98A0);
    }
    if (!*(_BYTE *)(a1 + 207))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot finish an update when we are not in an update"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _applySettingsUpdateWithCompletion:].cold.1();
      objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F98F8);
    }
    v4 = *(void **)(a1 + 160);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no active settings update"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _applySettingsUpdateWithCompletion:].cold.2();
      objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F9950);
    }
    if (*(_BYTE *)(a1 + 212))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("re-entrant mutation during configureParameters is not supported"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _applySettingsUpdateWithCompletion:].cold.11();
      objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F99A8);
    }
    if (!*(_BYTE *)(a1 + 213))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot apply another update while the previous one is pending"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBScene _applySettingsUpdateWithCompletion:].cold.3();
      objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35F9A00);
    }
    if (!*(_BYTE *)(a1 + 205))
    {
      v7 = v4;
      v6 = v7;
      if (*(_BYTE *)(a1 + 203))
      {
        if (!*(_QWORD *)(a1 + 232))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_workspace != nil"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene _applySettingsUpdateWithCompletion:].cold.7();
          objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35F9A64);
        }
        v8 = (int *)MEMORY[0x1E0D23308];
        v9 = *(void **)&v7[*MEMORY[0x1E0D23308]];
        v10 = *(void **)&v6[*MEMORY[0x1E0D23318]];
        v58 = v3;
        if (v9)
        {
          if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mutable and non-mutable settings must be equal"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[FBScene _applySettingsUpdateWithCompletion:].cold.9();
            objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A35F9470);
          }
        }
        else
        {
          v18 = objc_msgSend(v10, "mutableCopy");
          v19 = *v8;
          v20 = *(void **)&v6[v19];
          *(_QWORD *)&v6[v19] = v18;

        }
        objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", *(_QWORD *)&v6[*MEMORY[0x1E0D23310]], *(_QWORD *)&v6[*MEMORY[0x1E0D23318]]);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (int)*MEMORY[0x1E0D232F8];
        v23 = *(void **)&v6[v22];
        *(_QWORD *)&v6[v22] = v21;

        objc_msgSend(*(id *)&v6[*MEMORY[0x1E0D232F0]], "parentUpdate");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (int)*MEMORY[0x1E0D23300];
        v26 = *(void **)&v6[v25];
        *(_QWORD *)&v6[v25] = v24;

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        -[FBScene _allComponentProxies]((id *)a1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v63;
          v59 = a1;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v63 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              if (-[FBSceneObserver receiverImplementsWillUpdate]((unint64_t)v32))
              {
                objc_msgSend(v6, "settings");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "scene:willUpdateSettings:", a1, v6);
                if ((objc_msgSend(v33, "isEqual:", *(_QWORD *)&v6[*v8]) & 1) == 0)
                {
                  FBLogScene();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend((id)a1, "loggingIdentifier");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = (void *)MEMORY[0x1E0D22FA0];
                    -[FBSceneObserver component]((uint64_t)v32);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "succinctDescriptionForObject:", v60);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", v33, *(_QWORD *)&v6[*v8]);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v69 = v61;
                    v70 = 2112;
                    v71 = v43;
                    v72 = 2112;
                    v73 = v44;
                    _os_log_debug_impl(&dword_1A359A000, v34, OS_LOG_TYPE_DEBUG, "[%@] component %@ mutated settings: %@", buf, 0x20u);

                    a1 = v59;
                  }

                  v35 = objc_msgSend(*(id *)&v6[*v8], "copy");
                  v36 = (int *)MEMORY[0x1E0D23318];
                  v37 = (int)*MEMORY[0x1E0D23318];
                  v38 = *(void **)&v6[v37];
                  *(_QWORD *)&v6[v37] = v35;

                  objc_msgSend(MEMORY[0x1E0D23270], "diffFromSettings:toSettings:", *(_QWORD *)&v6[*MEMORY[0x1E0D23310]], *(_QWORD *)&v6[*v36]);
                  v39 = objc_claimAutoreleasedReturnValue();
                  v40 = (int)*MEMORY[0x1E0D232F8];
                  v41 = *(void **)&v6[v40];
                  *(_QWORD *)&v6[v40] = v39;

                }
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          }
          while (v29);
        }

        v45 = *(void **)(a1 + 160);
        *(_QWORD *)(a1 + 160) = 0;

        v3 = v58;
        objc_msgSend(*(id *)(a1 + 232), "scene:handleUpdate:withCompletion:", a1, v6, v58);
        if (*(_BYTE *)(a1 + 214))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_inTransaction == NO"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene _applySettingsUpdateWithCompletion:].cold.8();
          objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35F9AC8);
        }
      }
      else
      {
        if (*(_BYTE *)(a1 + 208) && *(_BYTE *)(a1 + 202))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_legacy"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene _applySettingsUpdateWithCompletion:].cold.6();
          objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35F9BF4);
        }
        objc_msgSend(*(id *)(a1 + 112), "specification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "transitionContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "_isSignificantTransitionContext:", v13);

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("![[_definition specification] _isSignificantTransitionContext:[update transitionContext]]"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene _applySettingsUpdateWithCompletion:].cold.4();
          objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35F9B2CLL);
        }
        if (v3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion == nil"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBScene _applySettingsUpdateWithCompletion:].cold.5();
          objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35F9B90);
        }
        objc_msgSend(v6, "settings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_copyClearingProgenitor:", 0);
        v17 = *(void **)(a1 + 96);
        *(_QWORD *)(a1 + 96) = v16;

        -[FBScene _resetUpdateState](a1);
      }
      goto LABEL_41;
    }
    -[FBScene _resetUpdateState](a1);
    FBLogScene();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FBScene _applySettingsUpdateWithCompletion:].cold.10((void *)a1);

    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__FBScene__applySettingsUpdateWithCompletion___block_invoke;
      block[3] = &unk_1E4A12168;
      v67 = (char *)v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v6 = v67;
LABEL_41:

    }
  }

}

void __46__FBScene__applySettingsUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  FBSceneErrorCreate(2uLL, CFSTR("Cannot update an invalidated scene."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  char v26;

  v3 = (_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 207))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_midUpdate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_3();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F9EC4);
  }
  if (!*(_BYTE *)(v2 + 204))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_deactivating"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F9F28);
  }
  if (*(_BYTE *)(v2 + 214))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_inTransaction"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_2();
    goto LABEL_27;
  }
  v4 = *(id *)(v2 + 56);
  if (*(_BYTE *)(*v3 + 203))
  {
    v5 = *(void **)(*v3 + 48);
    if (v5 && *(_BYTE *)(a1 + 64))
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_246;
  v25[3] = &unk_1E4A14480;
  v26 = *(_BYTE *)(a1 + 65);
  v7 = *(_QWORD *)(a1 + 56);
  v25[4] = *(_QWORD *)(a1 + 32);
  v25[5] = v7;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8590C4C](v25);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 203) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 204) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 48);
  *(_QWORD *)(v9 + 48) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 216);
  *(_QWORD *)(v11 + 216) = 0;

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 56);
  *(_QWORD *)(v13 + 56) = 0;

  v15 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v15 + 202))
  {
    v16 = *(void **)(v15 + 64);
    *(_QWORD *)(v15 + 64) = 0;

  }
  v17 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 65))
  {
    *(_BYTE *)(v17 + 205) = 1;
    v18 = *(void **)(*v3 + 232);
    *(_QWORD *)(*v3 + 232) = 0;

    v19 = *(void **)(*v3 + 16);
    *(_QWORD *)(*v3 + 16) = 0;

    objc_msgSend(*(id *)(*v3 + 40), "invalidate");
    v20 = *(void **)(*v3 + 40);
    *(_QWORD *)(*v3 + 40) = 0;

    objc_msgSend(*(id *)(*v3 + 120), "invalidate");
    v21 = *(void **)(*v3 + 120);
    *(_QWORD *)(*v3 + 120) = 0;
  }
  else
  {
    v22 = *(id *)(v17 + 96);
    v21 = *(void **)(v17 + 128);
    *(_QWORD *)(v17 + 128) = v22;
  }

  if (v6)
    objc_msgSend(v4, "host:didInvalidateWithTransitionContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v8);
  else
    v8[2](v8, 1, 0);
  objc_msgSend(v4, "unregisterHost:", *v3);

}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_246(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(unsigned __int8 *)(a1 + 48);
  FBLogScene();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v4)
    {
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v4, "succinctDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v8;
        v18 = 2048;
        v19 = v9;
        v20 = 2114;
        v21 = v10;
        v11 = "[%{public}@][%lu] Scene invalidated with error: %{public}@.";
LABEL_8:
        _os_log_impl(&dword_1A359A000, v6, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0x20u);

LABEL_14:
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (!v7)
      goto LABEL_15;
    objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v8;
    v18 = 2048;
    v19 = v13;
    v14 = "[%{public}@][%lu] Scene invalidated.";
LABEL_13:
    _os_log_impl(&dword_1A359A000, v6, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x16u);
    goto LABEL_14;
  }
  if (!v4)
  {
    if (!v7)
      goto LABEL_15;
    objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v8;
    v18 = 2048;
    v19 = v15;
    v14 = "[%{public}@][%lu] Scene deactivated.";
    goto LABEL_13;
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "succinctDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v8;
    v18 = 2048;
    v19 = v12;
    v20 = 2114;
    v21 = v10;
    v11 = "[%{public}@][%lu] Scene deactivated with error: %{public}@.";
    goto LABEL_8;
  }
LABEL_15:

}

void __50__FBScene__verifyIntegrityOfExtensionsInSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  v3 = a2;
  objc_msgSend(v3, "_removeAllSceneExtensions");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1 + 32);
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
        objc_msgSend(v3, "_addSceneExtension:applyingSettings:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), *(_QWORD *)(a1 + 40), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (FBSSceneSpecification)specification
{
  return (FBSSceneSpecification *)-[FBSSceneDefinition specification](self->_definition, "specification");
}

- (void)clientToken:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  FBScene *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__FBScene_clientToken_didUpdateClientSettings_withDiff_transitionContext___block_invoke;
  v18[3] = &unk_1E4A12D38;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[FBScene _dispatchClientMessageWithBlock:]((uint64_t)self, v18);

}

void __74__FBScene_clientToken_didUpdateClientSettings_withDiff_transitionContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
  {
    v12 = (char *)objc_opt_new();
    objc_storeStrong((id *)&v12[*MEMORY[0x1E0D23310]], *(id *)(*(_QWORD *)(a1 + 40) + 104));
    v6 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 104);
    *(_QWORD *)(v7 + 104) = v6;

    objc_storeStrong((id *)&v12[*MEMORY[0x1E0D23318]], v6);
    objc_storeStrong((id *)&v12[*MEMORY[0x1E0D232F8]], *(id *)(a1 + 56));
    objc_storeStrong((id *)&v12[*MEMORY[0x1E0D232F0]], *(id *)(a1 + 64));
    if (objc_msgSend(*(id *)(a1 + 56), "containsProperty:", sel_layers))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v9 + 16);
      objc_msgSend(*(id *)(v9 + 104), "layers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setLayers:", v11);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "scene:didUpdateClientSettings:", *(_QWORD *)(a1 + 40), v12);

  }
  else
  {
    FBLogScene();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543874;
      v14 = v3;
      v15 = 2048;
      v16 = v5;
      v17 = 2048;
      v18 = v4;
      _os_log_impl(&dword_1A359A000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring scene client update due to token mismatch (probably due to prior deactivation). expected=%p received=%p", buf, 0x20u);

    }
  }
}

- (void)clientToken:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  FBScene *v14;
  id v15;
  Class v16;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__FBScene_clientToken_didReceiveActions_forExtension___block_invoke;
  v12[3] = &unk_1E4A12F68;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a5;
  v10 = v9;
  v11 = v8;
  -[FBScene _dispatchClientMessageWithBlock:]((uint64_t)self, v12);

}

void __54__FBScene_clientToken_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v2 + 48))
  {
    objc_msgSend(*(id *)(v2 + 232), "scene:didReceiveActions:forExtension:");
  }
  else
  {
    FBLogScene();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      v7 = 138543874;
      v8 = v4;
      v9 = 2048;
      v10 = v6;
      v11 = 2048;
      v12 = v5;
      _os_log_impl(&dword_1A359A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring actions due to token mismatch (probably due to prior deactivation). expected=%p received=%p", (uint8_t *)&v7, 0x20u);

    }
  }
}

- (void)clientToken:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  FBScene *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__FBScene_clientToken_didInvalidateWithError___block_invoke;
  v10[3] = &unk_1E4A120D0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[FBScene _dispatchClientMessageWithBlock:]((uint64_t)self, v10);

}

void __46__FBScene_clientToken_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  FBLogScene();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] client invalidated", (uint8_t *)&v10, 0xCu);

    }
    -[FBScene _deactivateForClientError:](*(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      v10 = 138543874;
      v11 = v6;
      v12 = 2048;
      v13 = v8;
      v14 = 2048;
      v15 = v7;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring client invalidation due to token mismatch (probably due to prior deactivation). expected=%p received=%p", (uint8_t *)&v10, 0x20u);

    }
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBScene descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  FBScene *v16;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  if ((objc_msgSend(v4, "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene descriptionBuilderWithMultilinePrefix:]");
  -[FBScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_legacy, CFSTR("legacy"), 1);
  v8 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_invalidated, CFSTR("invalidated"), 1);
  if (!self->_invalidated)
    v9 = (id)objc_msgSend(v6, "appendBool:withName:", self->_active, CFSTR("active"));
  v10 = (id)objc_msgSend(v6, "appendBool:withName:", -[FBSSceneSettings isForeground](self->_settings, "isForeground"), CFSTR("FG"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__FBScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E4A11FD0;
  v11 = v6;
  v15 = v11;
  v16 = self;
  objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v14);

  v12 = v11;
  return v12;
}

id __49__FBScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "specification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendClass:withName:", objc_opt_class(), CFSTR("specification"));

  v5 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 152));
  objc_msgSend(WeakRetained, "succinctDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v7, CFSTR("parentScene"), 1);

  v9 = *(void **)(a1 + 32);
  NSStringFromFBSceneContentState(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 224));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v10, CFSTR("contentState"));

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), CFSTR("settings"), 1);
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("clientSettings"), 1);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v13, "appendObject:withName:", v14, CFSTR("clientProvider"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), CFSTR("clientProcess"));
}

- (FBSScene)parentScene
{
  return (FBSScene *)objc_loadWeakRetained((id *)&self->_parentScene);
}

- (unint64_t)_transactionID
{
  return self->_transactionID;
}

- (id)display
{
  void *v2;
  void *v3;

  -[FBScene settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke_cold_1(uint64_t a1)
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

  NSStringFromSelector(*(SEL *)(a1 + 48));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke_cold_1(uint64_t a1)
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

  NSStringFromSelector(*(SEL *)(a1 + 48));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.1()
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

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.2()
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

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.3()
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

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.4()
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

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.5()
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

- (void)activateWithTransitionContext:completion:.cold.1()
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

- (void)activateWithTransitionContext:completion:.cold.2()
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

- (void)activateWithTransitionContext:completion:.cold.3()
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

- (void)activateWithTransitionContext:completion:.cold.4()
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

- (void)_activateWithTransitionContext:error:.cold.1()
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

- (void)_activateWithTransitionContext:(NSObject *)a3 error:.cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "loggingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to resolve a scene client provider: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)_activateWithTransitionContext:(void *)a1 error:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9_3(&dword_1A359A000, v2, v3, "[%{public}@] Execution contexts are not supported for this scene.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_4();
}

- (void)_activateWithTransitionContext:error:.cold.4()
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

- (void)_activateWithTransitionContext:error:.cold.5()
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

- (void)_activateWithTransitionContext:error:.cold.6()
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

- (void)_activateWithTransitionContext:error:.cold.7()
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

- (void)_activateWithTransitionContext:error:.cold.8()
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

- (void)_activateWithTransitionContext:error:.cold.9()
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

- (void)_activateWithTransitionContext:error:.cold.10()
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

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_5_cold_1(uint64_t a1)
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
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_deactivateForClientError:.cold.1()
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

- (void)_deactivateAndInvalidate:transitionContext:.cold.1()
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

- (void)_deactivateAndInvalidate:transitionContext:.cold.2()
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

- (void)_deactivateAndInvalidate:transitionContext:.cold.3()
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

- (void)addExtension:.cold.1()
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

- (void)removeExtension:.cold.1()
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

- (void)setParentScene:.cold.1()
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

- (void)updateSettingsWithTransitionBlock:.cold.1()
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

- (void)_verifyIntegrityOfExtensionsInSettings:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  _os_log_fault_impl(&dword_1A359A000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] Extension mismatch in new scene settings", v4, 0xCu);

  OUTLINED_FUNCTION_10_4();
}

- (void)_joinUpdate:block:completion:.cold.1()
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

- (void)_joinUpdate:block:completion:.cold.2()
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

- (void)_joinUpdate:block:completion:.cold.3()
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

- (void)_joinUpdate:block:completion:.cold.4()
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

- (void)_beginUpdate
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

- (void)configureParameters:.cold.3()
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

- (void)sendActions:toExtension:.cold.1()
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

- (void)sendActions:(void *)a1 toExtension:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9_3(&dword_1A359A000, v2, v3, "[%{public}@] Dropping actions for scene with no client.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_4();
}

- (void)sendActions:toExtension:.cold.3()
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

- (void)sendActions:toExtension:.cold.4()
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

- (void)sendActions:toExtension:.cold.5()
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

- (void)sendActions:(void *)a1 toExtension:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9_3(&dword_1A359A000, v2, v3, "[%{public}@]  Dropping actions for invalidated scene.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_4();
}

- (void)createSnapshotWithContext:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9_3(&dword_1A359A000, v2, v3, "cannot take a snapshot for an invalid or inactive scene: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_4();
}

- (void)_adjustInitialSettings:.cold.1()
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

- (void)_beginTransaction
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

- (void)_endTransaction:.cold.1()
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

- (void)_applyUpdate:postStateApplicator:completion:.cold.1()
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

- (void)_setContentState:.cold.1()
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

- (void)_setContentState:.cold.2()
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

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v2 + 72));
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_addExtensions:removeExtensions:settings:.cold.1()
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

- (void)_addExtensions:removeExtensions:settings:.cold.2()
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

void __48__FBScene__activateWithTransitionContext_error___block_invoke_2_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v2 + 56));
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_applySettingsUpdateWithCompletion:.cold.1()
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

- (void)_applySettingsUpdateWithCompletion:.cold.2()
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

- (void)_applySettingsUpdateWithCompletion:.cold.3()
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

- (void)_applySettingsUpdateWithCompletion:.cold.4()
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

- (void)_applySettingsUpdateWithCompletion:.cold.5()
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

- (void)_applySettingsUpdateWithCompletion:.cold.6()
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

- (void)_applySettingsUpdateWithCompletion:.cold.7()
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

- (void)_applySettingsUpdateWithCompletion:.cold.8()
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

- (void)_applySettingsUpdateWithCompletion:.cold.9()
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

- (void)_applySettingsUpdateWithCompletion:(void *)a1 .cold.10(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9_3(&dword_1A359A000, v2, v3, "Ignoring update for invalidated scene: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_4();
}

- (void)_applySettingsUpdateWithCompletion:.cold.11()
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

- (void)_applySettingsUpdateWithCompletion:.cold.12()
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

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v2 + 48));
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v2 + 48));
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(*(SEL *)(v2 + 48));
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
