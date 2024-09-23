@implementation FBSceneMonitor

- (void)sceneManagerWillBeginSceneUpdateSynchronization:(id)a3
{
  self->_isSynchronizing = 1;
}

- (void)sceneManagerDidEndSceneUpdateSynchronization:(id)a3
{
  id v4;

  v4 = a3;
  self->_isSynchronizing = 0;
  if (self->_updateSettingsAfterSync)
  {
    self->_updateSettingsAfterSync = 0;
    -[FBSceneMonitor _updateSceneSettings:](self, "_updateSceneSettings:", 0);
  }
  if (self->_updateExternalScenesAfterSync)
  {
    self->_updateExternalScenesAfterSync = 0;
    -[FBSceneMonitor _updateExternalScenes:](self, "_updateExternalScenes:", 0);
  }

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  FBScene *v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  NSMutableSet *externalSceneIDs;
  void *v16;
  FBSSceneClientSettingsDiffInspector *diffInspector;
  FBSSceneClientSettingsDiffInspector *v18;
  FBSSceneClientSettingsDiffInspector *v19;
  FBSSceneClientSettingsDiffInspector *v20;
  uint64_t v21;
  FBSSceneClientSettingsDiffInspector *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  v10 = (FBScene *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_scene == v10
    && -[FBSceneMonitorBehaviors monitorsClientSettings](self->_effectiveMonitorBehaviors, "monitorsClientSettings"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sceneMonitor:sceneClientSettingsDidChangeWithDiff:transitionContext:", self, v11, v13);

  }
  else
  {
    externalSceneIDs = self->_externalSceneIDs;
    -[FBScene identifier](v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(externalSceneIDs) = -[NSMutableSet containsObject:](externalSceneIDs, "containsObject:", v16);

    if ((_DWORD)externalSceneIDs)
    {
      diffInspector = self->_diffInspector;
      if (!diffInspector)
      {
        objc_initWeak(&location, self);
        v18 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0D231D0]);
        v19 = self->_diffInspector;
        self->_diffInspector = v18;

        v20 = self->_diffInspector;
        v21 = MEMORY[0x1E0C809B0];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
        v25[3] = &unk_1E4A126C0;
        objc_copyWeak(&v26, &location);
        -[FBSSceneClientSettingsDiffInspector observePreferredSceneHostIdentifierWithBlock:](v20, "observePreferredSceneHostIdentifierWithBlock:", v25);
        v22 = self->_diffInspector;
        v23[0] = v21;
        v23[1] = 3221225472;
        v23[2] = __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
        v23[3] = &unk_1E4A126C0;
        objc_copyWeak(&v24, &location);
        -[FBSSceneClientSettingsDiffInspector observePreferredSceneHostIdentityWithBlock:](v22, "observePreferredSceneHostIdentityWithBlock:", v23);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
        diffInspector = self->_diffInspector;
      }
      -[FBSSceneClientSettingsDiffInspector inspectDiff:withContext:](diffInspector, "inspectDiff:withContext:", v11, 0);
    }
  }

}

- (void)_updateSceneSettings:(BOOL)a3
{
  FBSMutableSceneSettings *v4;
  void *v5;
  FBSMutableSceneSettings *v6;
  FBSMutableSceneSettings *sceneSettings;
  id WeakRetained;
  FBSMutableSceneSettings *v9;

  if (!self->_isSynchronizing || a3)
  {
    -[FBScene settings](self->_scene, "settings", a3);
    v9 = (FBSMutableSceneSettings *)objc_claimAutoreleasedReturnValue();
    v4 = self->_sceneSettings;
    if (-[FBSceneMonitorBehaviors monitorsSettings](self->_effectiveMonitorBehaviors, "monitorsSettings"))
    {
      objc_msgSend(MEMORY[0x1E0D23210], "diffFromSettings:toSettings:", self->_sceneSettings, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    if (v9 != self->_sceneSettings)
    {
      v6 = (FBSMutableSceneSettings *)-[FBSMutableSceneSettings copy](v9, "copy");
      sceneSettings = self->_sceneSettings;
      self->_sceneSettings = v6;

    }
    if (-[FBSceneMonitorBehaviors monitorsSettings](self->_effectiveMonitorBehaviors, "monitorsSettings"))
    {
      if (v5)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "sceneMonitor:sceneSettingsDidChangeWithDiff:previousSettings:", self, v5, v4);

      }
    }

  }
  else
  {
    self->_updateSettingsAfterSync = 1;
  }
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  if (self->_scene == a3)
    -[FBSceneMonitor _updateSceneSettings:](self, "_updateSceneSettings:", 0, a4);
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v6;
  void *v7;
  NSString *sceneID;
  void *v9;
  FBSSceneIdentityToken *v10;
  FBSSceneIdentityToken *identityToken;
  void *v12;
  NSMutableSet *externalSceneIDs;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_scene
    || (sceneID = self->_sceneID,
        objc_msgSend(v6, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(sceneID) = -[NSString isEqualToString:](sceneID, "isEqualToString:", v9),
        v9,
        !(_DWORD)sceneID))
  {
    externalSceneIDs = self->_externalSceneIDs;
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(externalSceneIDs) = -[NSMutableSet containsObject:](externalSceneIDs, "containsObject:", v14);

    if ((_DWORD)externalSceneIDs)
    {
      objc_msgSend(v7, "addObserver:", self);
      -[FBSceneMonitor _updateExternalScenes:](self, "_updateExternalScenes:", 0);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_scene, a4);
    objc_msgSend(v7, "addObserver:", self);
    objc_msgSend(v7, "identityToken");
    v10 = (FBSSceneIdentityToken *)objc_claimAutoreleasedReturnValue();
    identityToken = self->_identityToken;
    self->_identityToken = v10;

    -[FBSceneMonitor _updateAllSceneStateIgnoringDelegate](self, "_updateAllSceneStateIgnoringDelegate");
    -[FBSceneMonitor delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "sceneMonitor:sceneWasCreated:", self, v7);

  }
}

- (FBSceneMonitorDelegate)delegate
{
  return (FBSceneMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateExternalScenes:(BOOL)a3
{
  _BOOL8 v3;
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
  uint64_t v15;
  NSMutableSet *externalSceneIDs;
  NSMutableSet *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_isSynchronizing || a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[FBScene layerManager](self->_scene, "layerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "externalSceneID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "externalSceneID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    if ((objc_msgSend(v5, "isEqualToSet:", self->_externalSceneIDs) & 1) == 0)
    {
      v15 = MEMORY[0x1E0C809B0];
      externalSceneIDs = self->_externalSceneIDs;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __40__FBSceneMonitor__updateExternalScenes___block_invoke;
      v19[3] = &unk_1E4A12670;
      v19[4] = self;
      -[NSMutableSet enumerateObjectsUsingBlock:](externalSceneIDs, "enumerateObjectsUsingBlock:", v19);
      -[NSMutableSet removeAllObjects](self->_externalSceneIDs, "removeAllObjects");
      -[NSMutableSet unionSet:](self->_externalSceneIDs, "unionSet:", v5);
      v17 = self->_externalSceneIDs;
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __40__FBSceneMonitor__updateExternalScenes___block_invoke_2;
      v18[3] = &unk_1E4A12670;
      v18[4] = self;
      -[NSMutableSet enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", v18);
    }
    -[FBSceneMonitor _updateScenePairingState:](self, "_updateScenePairingState:", v3);

  }
  else
  {
    self->_updateExternalScenesAfterSync = 1;
  }
}

- (void)_updateScenePairingState:(BOOL)a3
{
  void *v4;
  NSMutableSet *externalSceneIDs;
  void *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  id v10;

  if (!self->_isSynchronizing || a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    externalSceneIDs = self->_externalSceneIDs;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__FBSceneMonitor__updateScenePairingState___block_invoke;
    v9[3] = &unk_1E4A12698;
    v9[4] = self;
    v8 = v4;
    v10 = v8;
    -[NSMutableSet enumerateObjectsUsingBlock:](externalSceneIDs, "enumerateObjectsUsingBlock:", v9);
    if (-[FBSceneMonitorBehaviors monitorsPairingStatus](self->_effectiveMonitorBehaviors, "monitorsPairingStatus")
      && (-[NSMutableSet isEqualToSet:](self->_pairedExternalSceneIDs, "isEqualToSet:", v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_pairedExternalSceneIDs);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v8);
    }
    else
    {
      v6 = 0;
    }
    -[NSMutableSet removeAllObjects](self->_pairedExternalSceneIDs, "removeAllObjects");
    -[NSMutableSet unionSet:](self->_pairedExternalSceneIDs, "unionSet:", v8);
    if (-[FBSceneMonitorBehaviors monitorsPairingStatus](self->_effectiveMonitorBehaviors, "monitorsPairingStatus"))
    {
      if (objc_msgSend(v6, "count"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "sceneMonitor:pairingStatusDidChangeForExternalSceneIDs:", self, v6);

      }
    }

  }
  else
  {
    self->_updateExternalScenesAfterSync = 1;
  }
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  -[FBSceneMonitor _updateExternalScenes:](self, "_updateExternalScenes:", 0);
}

- (BOOL)isPairedWithExternalSceneID:(id)a3
{
  return -[NSMutableSet containsObject:](self->_pairedExternalSceneIDs, "containsObject:", a3);
}

- (FBSceneMonitor)initWithSceneID:(id)a3
{
  id v4;
  void *v5;
  FBSceneMonitor *v6;

  v4 = a3;
  +[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBSceneMonitor _initWithSceneManager:sceneID:](self, "_initWithSceneManager:sceneID:", v5, v4);

  return v6;
}

- (id)_initWithSceneManager:(id)a3 sceneID:(id)a4
{
  id v8;
  id v9;
  void *v10;
  FBSceneMonitor *v11;
  FBSceneMonitor *v12;
  uint64_t v13;
  NSString *sceneID;
  void *v15;
  uint64_t v16;
  FBSSceneIdentityToken *identityToken;
  NSMutableSet *v18;
  NSMutableSet *externalSceneIDs;
  NSMutableSet *v20;
  NSMutableSet *pairedExternalSceneIDs;
  id result;
  void *v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v9;
    v24.receiver = self;
    v24.super_class = (Class)FBSceneMonitor;
    v11 = -[FBSceneMonitor init](&v24, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_sceneManager, a3);
      v13 = objc_msgSend(v10, "copy");
      sceneID = v12->_sceneID;
      v12->_sceneID = (NSString *)v13;

      -[FBSceneManager sceneWithIdentifier:](v12->_sceneManager, "sceneWithIdentifier:", v12->_sceneID);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isValid"))
      {
        objc_storeStrong((id *)&v12->_scene, v15);
        -[FBScene addObserver:](v12->_scene, "addObserver:", v12);
        objc_msgSend(v15, "identityToken");
        v16 = objc_claimAutoreleasedReturnValue();
        identityToken = v12->_identityToken;
        v12->_identityToken = (FBSSceneIdentityToken *)v16;

      }
      v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      externalSceneIDs = v12->_externalSceneIDs;
      v12->_externalSceneIDs = v18;

      v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      pairedExternalSceneIDs = v12->_pairedExternalSceneIDs;
      v12->_pairedExternalSceneIDs = v20;

      v12->_isSynchronizing = -[FBSceneManager _isSynchronizingSceneUpdates](v12->_sceneManager, "_isSynchronizingSceneUpdates");
      -[FBSceneMonitor _evaluateEffectiveMonitorBehaviors](v12, "_evaluateEffectiveMonitorBehaviors");

    }
    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sceneManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneMonitor _initWithSceneManager:sceneID:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  FBSceneMonitorBehaviors *delegateMonitorBehaviors;
  FBSceneMonitorBehaviors *v6;
  FBSceneMonitorBehaviors *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    delegateMonitorBehaviors = self->_delegateMonitorBehaviors;
    self->_delegateMonitorBehaviors = 0;

    if (obj)
    {
      v6 = objc_alloc_init(FBSceneMonitorBehaviors);
      v7 = self->_delegateMonitorBehaviors;
      self->_delegateMonitorBehaviors = v6;

      -[FBSceneMonitorBehaviors setMonitorsSettings:](self->_delegateMonitorBehaviors, "setMonitorsSettings:", objc_opt_respondsToSelector() & 1);
      -[FBSceneMonitorBehaviors setMonitorsPairingStatus:](self->_delegateMonitorBehaviors, "setMonitorsPairingStatus:", objc_opt_respondsToSelector() & 1);
      -[FBSceneMonitorBehaviors setMonitorsClientSettings:](self->_delegateMonitorBehaviors, "setMonitorsClientSettings:", objc_opt_respondsToSelector() & 1);
      -[FBSceneMonitor _evaluateEffectiveMonitorBehaviors](self, "_evaluateEffectiveMonitorBehaviors");
      if (!WeakRetained)
      {
        -[FBSceneManager addObserver:](self->_sceneManager, "addObserver:", self);
        if (!self->_scene)
        {
          -[FBSceneManager sceneWithIdentifier:](self->_sceneManager, "sceneWithIdentifier:", self->_sceneID);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isValid"))
            objc_storeStrong((id *)&self->_scene, v8);

        }
        -[FBSceneMonitor _updateAllSceneStateIgnoringDelegate](self, "_updateAllSceneStateIgnoringDelegate");
      }
    }
    else
    {
      -[FBSceneMonitor _evaluateEffectiveMonitorBehaviors](self, "_evaluateEffectiveMonitorBehaviors");
    }
    objc_storeWeak((id *)&self->_delegate, obj);
  }

}

- (void)_setEffectiveMonitorBehaviors:(id)a3
{
  FBSceneMonitorBehaviors *v5;
  FBSceneMonitorBehaviors *v6;

  v5 = (FBSceneMonitorBehaviors *)a3;
  if (self->_effectiveMonitorBehaviors != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_effectiveMonitorBehaviors, a3);
    -[FBSceneMonitor _updateAllSceneStateIgnoringDelegate](self, "_updateAllSceneStateIgnoringDelegate");
    v5 = v6;
  }

}

- (void)_updateAllSceneStateIgnoringDelegate
{
  FBSceneMonitorDelegate **p_delegate;
  void *v4;
  id obj;

  if (self->_scene)
  {
    p_delegate = &self->_delegate;
    obj = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)p_delegate, 0);
    -[FBScene layerManager](self->_scene, "layerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", self);

    -[FBSceneMonitor _updateSceneSettings:](self, "_updateSceneSettings:", 1);
    -[FBSceneMonitor _updateExternalScenes:](self, "_updateExternalScenes:", 1);
    objc_storeWeak((id *)p_delegate, obj);

  }
}

- (void)_evaluateEffectiveMonitorBehaviors
{
  FBSceneMonitorBehaviors *givenMonitorBehaviors;

  givenMonitorBehaviors = self->_givenMonitorBehaviors;
  if (!givenMonitorBehaviors)
    givenMonitorBehaviors = self->_delegateMonitorBehaviors;
  -[FBSceneMonitor _setEffectiveMonitorBehaviors:](self, "_setEffectiveMonitorBehaviors:", givenMonitorBehaviors);
}

- (FBScene)scene
{
  return self->_scene;
}

- (FBSceneMonitor)initWithScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  FBSceneMonitor *v8;
  FBSceneMonitor *result;
  void *v10;

  v5 = a3;
  if (-[FBScene _isLegacy]((_BOOL8)v5))
  {
    +[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FBSceneMonitor _initWithSceneManager:sceneID:](self, "_initWithSceneManager:sceneID:", v6, v7);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this deprecated class only supports legacy scenes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneMonitor initWithScene:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (FBSceneMonitor *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
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
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_sceneID, CFSTR("sceneID"));
  v5 = (void *)MEMORY[0x1E0D22FA0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "descriptionForObject:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("delegate"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)invalidate
{
  void *v3;
  NSMutableSet *externalSceneIDs;
  _QWORD v5[5];

  self->_invalidated = 1;
  objc_storeWeak((id *)&self->_delegate, 0);
  -[FBSSceneClientSettingsDiffInspector removeAllObservers](self->_diffInspector, "removeAllObservers");
  -[FBScene layerManager](self->_scene, "layerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[FBSceneManager removeObserver:](self->_sceneManager, "removeObserver:", self);
  externalSceneIDs = self->_externalSceneIDs;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__FBSceneMonitor_invalidate__block_invoke;
  v5[3] = &unk_1E4A12648;
  v5[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](externalSceneIDs, "enumerateObjectsUsingBlock:", v5);
}

void __28__FBSceneMonitor_invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sceneWithIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)setBehaviors:(id)a3
{
  FBSceneMonitorBehaviors *v4;
  FBSceneMonitorBehaviors *givenMonitorBehaviors;

  if (self->_givenMonitorBehaviors != a3)
  {
    v4 = (FBSceneMonitorBehaviors *)objc_msgSend(a3, "copy");
    givenMonitorBehaviors = self->_givenMonitorBehaviors;
    self->_givenMonitorBehaviors = v4;

    -[FBSceneMonitor _evaluateEffectiveMonitorBehaviors](self, "_evaluateEffectiveMonitorBehaviors");
  }
}

void __40__FBSceneMonitor__updateExternalScenes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sceneWithIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(a1 + 32));

}

void __40__FBSceneMonitor__updateExternalScenes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sceneWithIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", *(_QWORD *)(a1 + 32));

}

void __43__FBSceneMonitor__updateScenePairingState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sceneWithIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "clientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v5, "preferredSceneHostIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {

    }
    else
    {
      objc_msgSend(v5, "preferredSceneHostIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = BSEqualObjects();

      if (!v9)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)_effectiveBehaviors
{
  return self->_effectiveMonitorBehaviors;
}

void __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateScenePairingState:", 0);

}

void __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateScenePairingState:", 0);

}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v5;

  if (self->_scene == a4)
  {
    objc_msgSend(a4, "layerManager", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  FBScene *v6;
  FBScene *v7;
  NSMutableSet *externalSceneIDs;
  void *v9;
  void *v10;
  FBScene *scene;
  id v12;

  v12 = a3;
  v6 = (FBScene *)a4;
  v7 = v6;
  if (self->_scene == v6)
  {
    -[FBScene removeObserver:](v6, "removeObserver:", self);
    -[FBSceneMonitor delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "sceneMonitor:sceneWasDestroyed:", self, self->_scene);
    scene = self->_scene;
    self->_scene = 0;

    -[FBSceneMonitor _updateExternalScenes:](self, "_updateExternalScenes:", 0);
  }
  else
  {
    externalSceneIDs = self->_externalSceneIDs;
    -[FBScene identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(externalSceneIDs) = -[NSMutableSet containsObject:](externalSceneIDs, "containsObject:", v9);

    if ((_DWORD)externalSceneIDs)
    {
      -[FBScene removeObserver:](v7, "removeObserver:", self);
      -[FBSceneMonitor _updateExternalScenes:](self, "_updateExternalScenes:", 0);
    }
  }

}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (FBSSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (FBSceneMonitorBehaviors)behaviors
{
  return self->_givenMonitorBehaviors;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_effectiveMonitorBehaviors, 0);
  objc_storeStrong((id *)&self->_delegateMonitorBehaviors, 0);
  objc_storeStrong((id *)&self->_givenMonitorBehaviors, 0);
  objc_storeStrong((id *)&self->_sceneSettings, 0);
  objc_storeStrong((id *)&self->_diffInspector, 0);
  objc_storeStrong((id *)&self->_pairedExternalSceneIDs, 0);
  objc_storeStrong((id *)&self->_externalSceneIDs, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)_initWithSceneManager:(const char *)a1 sceneID:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithScene:(const char *)a1 .cold.1(const char *a1)
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
