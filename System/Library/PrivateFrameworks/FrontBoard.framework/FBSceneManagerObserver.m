@implementation FBSceneManagerObserver

- (void)sceneManager:(id)a3 updateForScene:(id)a4 appliedWithContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[FBSceneManagerObserver observer](self, "observer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (self->_updateAppliedDEPRECATED)
  {
    objc_msgSend(v10, "sceneManager:updateForScene:appliedWithContext:", v12, v8, v9);
  }
  else if (self->_willCommitDEPRECATED)
  {
    objc_msgSend(v10, "sceneManager:willCommitUpdateForScene:transactionID:", v12, v8, objc_msgSend(v9, "transactionID"));
  }

}

- (BOOL)isInternalObserver
{
  return self->_internalObserver;
}

- (void)sceneManagerDidEndSceneUpdateSynchronization:(id)a3
{
  id v4;
  id v5;

  if (self->_didSynchronizeLEGACY)
  {
    v4 = a3;
    -[FBSceneManagerObserver _internalObserver](self, "_internalObserver");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneManagerDidEndSceneUpdateSynchronization:", v4);

  }
}

- (void)sceneManagerWillBeginSceneUpdateSynchronization:(id)a3
{
  id v4;
  id v5;

  if (self->_willSynchronizeLEGACY)
  {
    v4 = a3;
    -[FBSceneManagerObserver _internalObserver](self, "_internalObserver");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneManagerWillBeginSceneUpdateSynchronization:", v4);

  }
}

- (id)_internalObserver
{
  void *v2;

  if (self->_internalObserver)
  {
    -[FBSceneManagerObserver observer](self, "observer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)observer
{
  return objc_loadWeakRetained((id *)&self->_observer);
}

- (void)sceneManager:(id)a3 scene:(id)a4 didUpdateClientSettingsWithDiff:(id)a5 oldClientSettings:(id)a6 transitionContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  if (self->_didUpdateClientSettingsDEPRECATED)
  {
    v12 = a7;
    v13 = a6;
    v14 = a5;
    v15 = a4;
    v16 = a3;
    -[FBSceneManagerObserver delegate](self, "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sceneManager:scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v16, v15, v14, v13, v12);

  }
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 preparedWithContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[FBSceneManagerObserver observer](self, "observer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (self->_updatePreparedDEPRECATED)
  {
    objc_msgSend(v10, "sceneManager:updateForScene:preparedWithContext:", v14, v8, v9);
  }
  else if (self->_willUpdateSceneDEPRECATED && (unint64_t)objc_msgSend(v9, "transactionID") >= 2)
  {
    objc_msgSend(v9, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneManager:willUpdateScene:withSettings:transitionContext:", v14, v8, v12, v13);

  }
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 completedWithContext:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[FBSceneManagerObserver observer](self, "observer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (self->_updateCompletedDEPRECATED)
  {
    objc_msgSend(v13, "sceneManager:updateForScene:completedWithContext:error:", v15, v10, v11, v12);
  }
  else if (self->_didCommitDEPRECATED2)
  {
    objc_msgSend(v13, "sceneManager:didCommitUpdateForScene:transactionID:success:", v15, v10, objc_msgSend(v11, "transactionID"), v12 == 0);
  }
  else if (self->_didCommitDEPRECATED)
  {
    objc_msgSend(v13, "sceneManager:didCommitUpdateForScene:transactionID:", v15, v10, objc_msgSend(v11, "transactionID"));
  }

}

- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (self->_interceptSceneUpdatesLEGACY)
  {
    v9 = a5;
    v10 = a3;
    FBLogScene();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_INFO, "Client intercepting scene update for scene: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[FBSceneManagerObserver _privateDelegate](self, "_privateDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sceneManager:interceptUpdateForScene:withNewSettings:", v10, v8, v9);

  }
}

- (id)_privateDelegate
{
  void *v2;

  if (self->_privateDelegate)
  {
    -[FBSceneManagerObserver delegate](self, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (id *)a4;
  -[FBSceneManagerObserver observer](self, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_supportLegacy)
  {
    if (self->_didAddLEGACY)
      objc_msgSend(v7, "sceneManager:didAddScene:", __LegacyManager_0, v6);
    if (self->_didCreateDEPRECATED)
    {
      objc_msgSend(v8, "sceneManager:didCreateScene:", __LegacyManager_0, v6);
    }
    else if (self->_didCreateSceneDEPRECATED)
    {
      v9 = __LegacyManager_0;
      -[FBScene client](v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sceneManager:didCreateScene:withClient:", v9, v6, v10);

    }
  }
  else if (self->_didAdd)
  {
    objc_msgSend(v7, "workspace:didAddScene:", v11, v6);
  }

}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  FBSceneManagerObserver *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no longer used"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544642;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("FBSceneManagerObserver.m");
    v21 = 1024;
    v22 = 293;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (BOOL)isEqual:(id)a3
{
  FBSceneManagerObserver *v4;
  BOOL v5;
  id WeakRetained;
  id v8;

  v4 = (FBSceneManagerObserver *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_observerAddress == self->_observerAddress
      && v4->_observerClass == self->_observerClass)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v4->_observer);
      v8 = objc_loadWeakRetained((id *)&self->_observer);
      v5 = WeakRetained == v8;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FBSceneManagerObserver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "remnants", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "invalidate");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v12);
    }
LABEL_11:

    goto LABEL_14;
  }
  if (!self->_clientDidConnect)
  {
    if (self->_clientDidConnectLEGACY)
    {
      objc_msgSend(v8, "sceneManager:clientDidConnectWithHandshake:", __LegacyManager_0, v7);
      goto LABEL_14;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v7, "remnants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "invalidate");
        }
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v16);
    }
    goto LABEL_11;
  }
  objc_msgSend(v8, "workspace:clientDidConnectWithHandshake:", v6, v7);
LABEL_14:

}

- (id)delegate
{
  id WeakRetained;

  if (self->_isDelegate)
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  else
    WeakRetained = 0;
  return WeakRetained;
}

- (id)_initWithObserver:(id)a3 supportLegacy:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  FBSceneManagerObserver *v9;
  FBSceneManagerObserver *v10;
  uint64_t v11;
  char v12;
  objc_super v14;

  v6 = a3;
  if (!__LegacyManager_0)
  {
    +[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)__LegacyManager_0;
    __LegacyManager_0 = v7;

  }
  v14.receiver = self;
  v14.super_class = (Class)FBSceneManagerObserver;
  v9 = -[FBSceneManagerObserver init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_supportLegacy = a4;
    v11 = objc_opt_class();
    v10->_observerAddress = (unint64_t)v6;
    v10->_observerClass = (Class)v11;
    objc_storeWeak((id *)&v10->_observer, v6);
    v10->_didAdd = objc_opt_respondsToSelector() & 1;
    v10->_willRemove = objc_opt_respondsToSelector() & 1;
    if (v10->_supportLegacy)
    {
      v10->_didAddLEGACY = objc_opt_respondsToSelector() & 1;
      v10->_willRemoveLEGACY = objc_opt_respondsToSelector() & 1;
      v10->_didCreateDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willDestroyDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_didDestroyDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_updatePreparedDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_updateAppliedDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_updateCompletedDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_didCreateSceneDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willUpdateSceneDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willCommitDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_didCommitDEPRECATED2 = objc_opt_respondsToSelector() & 1;
      v10->_didCommitDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willSynchronizeLEGACY = objc_opt_respondsToSelector() & 1;
      v12 = objc_opt_respondsToSelector();
      v10->_didSynchronizeLEGACY = v12 & 1;
      v10->_internalObserver = v10->_willSynchronizeLEGACY | v12 & 1;
    }
  }

  return v10;
}

- (FBSceneManagerObserver)initWithDelegate:(id)a3 supportLegacy:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FBSceneManagerObserver *v7;
  FBSceneManagerObserver *v8;
  char v9;

  v4 = a4;
  v6 = a3;
  v7 = -[FBSceneManagerObserver _initWithObserver:supportLegacy:](self, "_initWithObserver:supportLegacy:", v6, v4);
  v8 = v7;
  if (v7)
  {
    v7->_isDelegate = 1;
    v7->_clientDidConnect = objc_opt_respondsToSelector() & 1;
    v8->_didReceiveSceneRequest = objc_opt_respondsToSelector() & 1;
    v8->_didReceiveScene = objc_opt_respondsToSelector() & 1;
    v8->_didReceiveActions = objc_opt_respondsToSelector() & 1;
    if (v4)
    {
      v8->_clientDidConnectLEGACY = objc_opt_respondsToSelector() & 1;
      v8->_didReceiveSceneRequestLEGACY = objc_opt_respondsToSelector() & 1;
      v8->_didReceiveActionsDEPRECATED = objc_opt_respondsToSelector() & 1;
      v8->_didUpdateClientSettingsDEPRECATED = objc_opt_respondsToSelector() & 1;
      v9 = objc_opt_respondsToSelector();
      v8->_interceptSceneUpdatesLEGACY = v9 & 1;
      v8->_privateDelegate = v9 & 1;
    }
  }

  return v8;
}

- (BOOL)isDelegate
{
  return self->_isDelegate;
}

- (BOOL)delegateReceivesActions
{
  return self->_isDelegate && self->_didReceiveActions;
}

- (BOOL)delegateHandlesClientScenes
{
  return self->_isDelegate && self->_didReceiveScene;
}

- (BOOL)delegateHandlesLegacyInterception
{
  return self->_interceptSceneUpdatesLEGACY;
}

- (BOOL)delegateReceivesSceneActions
{
  return self->_didReceiveActionsDEPRECATED;
}

- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  -[FBSceneManagerObserver delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (!self->_didReceiveSceneRequest)
  {
    if (self->_didReceiveSceneRequestLEGACY)
    {
      objc_msgSend(v13, "sceneManager:didReceiveSceneRequestWithOptions:fromProcess:completion:", __LegacyManager_0, v10, v11, v12);
      goto LABEL_8;
    }
LABEL_7:
    FBSWorkspaceErrorCreate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v15);

    goto LABEL_8;
  }
  objc_msgSend(v13, "workspace:didReceiveSceneRequestWithOptions:fromProcess:completion:", v16, v10, v11, v12);
LABEL_8:

}

- (void)workspace:(id)a3 didReceiveScene:(id)a4 withContext:(id)a5 fromProcess:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[FBSceneManagerObserver delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && self->_didReceiveScene)
    objc_msgSend(v13, "workspace:didReceiveScene:withContext:fromProcess:", v15, v10, v11, v12);

}

- (void)workspace:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[FBSceneManagerObserver delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && self->_didReceiveActions)
    objc_msgSend(v7, "workspace:didReceiveActions:", v9, v6);

}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[FBSceneManagerObserver observer](self, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_willRemove)
  {
    objc_msgSend(v7, "workspace:willRemoveScene:", v9, v6);
  }
  else if (self->_willRemoveLEGACY)
  {
    objc_msgSend(v7, "sceneManager:willRemoveScene:", __LegacyManager_0, v6);
  }

}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (self->_willDestroyDEPRECATED)
  {
    v6 = a4;
    v7 = a3;
    -[FBSceneManagerObserver observer](self, "observer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneManager:willDestroyScene:", v7, v6);

  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (self->_didDestroyDEPRECATED)
  {
    v6 = a4;
    v7 = a3;
    -[FBSceneManagerObserver observer](self, "observer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneManager:didDestroyScene:", v7, v6);

  }
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  FBSceneManagerObserver *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no longer used"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544642;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("FBSceneManagerObserver.m");
    v21 = 1024;
    v22 = 341;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneManager:(id)a3 willRemoveScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  FBSceneManagerObserver *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no longer used"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544642;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("FBSceneManagerObserver.m");
    v21 = 1024;
    v22 = 345;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_didReceiveActionsDEPRECATED)
  {
    -[FBSceneManagerObserver delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject sceneManager:scene:didReceiveActions:](v11, "sceneManager:scene:didReceiveActions:", v8, v9, v10);
  }
  else
  {
    FBLogScene();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "Dropping actions since manager delegate does not implement handler: %{public}@", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id result;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  FBSceneManagerObserver *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no longer used"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544642;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 2048;
    v19 = self;
    v20 = 2114;
    v21 = CFSTR("FBSceneManagerObserver.m");
    v22 = 1024;
    v23 = 363;
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)sceneManager:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  FBSceneManagerObserver *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no longer used"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544642;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("FBSceneManagerObserver.m");
    v21 = 1024;
    v22 = 368;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (NSString)description
{
  return (NSString *)-[FBSceneManagerObserver descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSceneManagerObserver succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v5 = (id)objc_msgSend(v3, "appendPointer:withName:", WeakRetained, CFSTR("observer"));

  if (self->_isDelegate)
    v6 = (id)objc_msgSend(v3, "appendBool:withName:", 1, CFSTR("isDelegate"));
  if (self->_internalObserver)
    v7 = (id)objc_msgSend(v3, "appendBool:withName:", 1, CFSTR("isInternalObserver"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSceneManagerObserver descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
