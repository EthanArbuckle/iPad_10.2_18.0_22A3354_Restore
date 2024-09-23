@implementation CPTemplateApplicationDashboardScene

- (CPTemplateApplicationDashboardScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  id v6;
  id v7;
  CPTemplateApplicationDashboardScene *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UIContextBinder *contextBinder;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  CPTemplateApplicationDashboardScene *v21;
  uint64_t v22;
  NSObject *didFinishLaunchingObserver;
  void *v24;
  void *v25;
  uint64_t v26;
  CPTemplateApplicationDashboardScene *v27;
  uint64_t v28;
  NSObject *sceneWillConnectObserver;
  CPUIFrameRateLimitDiffInspector *v30;
  CPUIFrameRateLimitDiffInspector *frameRateLimitInspector;
  CPUIFrameRateLimitDiffInspector *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[4];
  CPTemplateApplicationDashboardScene *v39;
  _QWORD v40[4];
  CPTemplateApplicationDashboardScene *v41;
  objc_super v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)CPTemplateApplicationDashboardScene;
  v8 = -[CPTemplateApplicationDashboardScene initWithSession:connectionOptions:](&v42, sel_initWithSession_connectionOptions_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "_specification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v9, "sceneSubstrateClass");

    v11 = objc_alloc(MEMORY[0x24BDF7088]);
    v12 = [v10 alloc];
    -[CPTemplateApplicationDashboardScene _FBSScene](v8, "_FBSScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithScene:", v13);
    v15 = objc_msgSend(v11, "initWithSubstrate:", v14);
    contextBinder = v8->_contextBinder;
    v8->_contextBinder = (_UIContextBinder *)v15;

    -[_UIContextBinder setContextCreationPolicyHolder:](v8->_contextBinder, "setContextCreationPolicyHolder:", v8);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BDF7530];
    v20 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __73__CPTemplateApplicationDashboardScene_initWithSession_connectionOptions___block_invoke;
    v40[3] = &unk_24C77C4F8;
    v21 = v8;
    v41 = v21;
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v19, 0, v18, v40);
    v22 = objc_claimAutoreleasedReturnValue();
    didFinishLaunchingObserver = v21->_didFinishLaunchingObserver;
    v21->_didFinishLaunchingObserver = v22;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x24BDF7D30];
    v38[0] = v20;
    v38[1] = 3221225472;
    v38[2] = __73__CPTemplateApplicationDashboardScene_initWithSession_connectionOptions___block_invoke_3;
    v38[3] = &unk_24C77C4F8;
    v27 = v21;
    v39 = v27;
    objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", v26, v27, v25, v38);
    v28 = objc_claimAutoreleasedReturnValue();
    sceneWillConnectObserver = v27->_sceneWillConnectObserver;
    v27->_sceneWillConnectObserver = v28;

    objc_initWeak(&location, v27);
    v30 = objc_alloc_init(CPUIFrameRateLimitDiffInspector);
    frameRateLimitInspector = v27->_frameRateLimitInspector;
    v27->_frameRateLimitInspector = v30;

    v32 = v27->_frameRateLimitInspector;
    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __73__CPTemplateApplicationDashboardScene_initWithSession_connectionOptions___block_invoke_5;
    v35[3] = &unk_24C77C520;
    objc_copyWeak(&v36, &location);
    -[CPUIFrameRateLimitDiffInspector observeFrameRateLimitWithBlock:](v32, "observeFrameRateLimitWithBlock:", v35);
    -[CPTemplateApplicationDashboardScene _updateFrameRateLimit](v27, "_updateFrameRateLimit");
    v43[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPTemplateApplicationDashboardScene _registerSettingsDiffActionArray:forKey:](v27, "_registerSettingsDiffActionArray:forKey:", v33, CFSTR("settingsObserver"));

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  return v8;
}

uint64_t __73__CPTemplateApplicationDashboardScene_initWithSession_connectionOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "Did finish launching observer fired", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_deliverDashboardControllerToDelegate");
}

uint64_t __73__CPTemplateApplicationDashboardScene_initWithSession_connectionOptions___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 1;
  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "Scene will connect observer fired", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_deliverDashboardControllerToDelegate");
}

void __73__CPTemplateApplicationDashboardScene_initWithSession_connectionOptions___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFrameRateLimit");

}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  -[FBSSettingsDiffInspector inspectDiff:withContext:](self->_frameRateLimitInspector, "inspectDiff:withContext:", a5, 0);
}

- (void)_updateFrameRateLimit
{
  void *v3;
  void *v4;
  void *v5;
  NSNumber *frameRateLimit;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  self->_frameRateLimit = (NSNumber *)-[CPTemplateApplicationDashboardScene _frameRateLimit](self, "_frameRateLimit");
  -[CPTemplateApplicationDashboardScene _templateSettings](self, "_templateSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  frameRateLimit = self->_frameRateLimit;
  if (frameRateLimit)
  {
    -[NSNumber doubleValue](frameRateLimit, "doubleValue");
    if (v7 <= 0.0)
      v8 = 30.0;
    else
      v8 = v7;
    CarPlayFrameworkGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v17 = v8;
      _os_log_impl(&dword_20D6F4000, v9, OS_LOG_TYPE_DEFAULT, "Template dashboard scene frameRateLimit updated to %{public}f fps", buf, 0xCu);
    }

    v10 = 1.0 / v8;
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D6F4000, v11, OS_LOG_TYPE_DEFAULT, "Template dashboard scene updated to unrestricted frame rate", buf, 2u);
    }

    v10 = 0.0333333333;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10, *MEMORY[0x24BDE5928]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideDisplayTimings:", v13);

}

- (id)_templateSettings
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[CPTemplateApplicationDashboardScene _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CPTemplateApplicationDashboardScene _FBSScene](self, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_frameRateLimit
{
  void *v2;
  void *v3;

  -[CPTemplateApplicationDashboardScene _templateSettings](self, "_templateSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameRateLimit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_refreshTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  UITraitCollection *v16;
  UITraitCollection *traitCollection;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceIdiom:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF6F30];
  -[CPTemplateApplicationDashboardScene _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  objc_msgSend(v4, "traitCollectionWithDisplayScale:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[CPTemplateApplicationDashboardScene _FBSScene](self, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settings");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = (void *)MEMORY[0x24BDF6F30];
  if (v10)
    v12 = objc_msgSend(v10, "userInterfaceStyle");
  else
    v12 = 0;
  objc_msgSend(v11, "traitCollectionWithUserInterfaceStyle:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDF6F30];
  v18[0] = v3;
  v18[1] = v13;
  v18[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollectionWithTraitsFromCollections:", v15);
  v16 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v16;

}

+ (BOOL)_hostsWindows
{
  return 1;
}

- (UIScreen)_screen
{
  UIScreen *screen;
  void *v4;
  void *v5;
  UIScreen *v6;
  UIScreen *v7;

  screen = self->_screen;
  if (!screen)
  {
    v4 = (void *)MEMORY[0x24BDF6D38];
    -[CPTemplateApplicationDashboardScene _FBSScene](self, "_FBSScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_screenForScene:", v5);
    v6 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    v7 = self->_screen;
    self->_screen = v6;

    screen = self->_screen;
  }
  return screen;
}

- (int64_t)_interfaceOrientation
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int64_t v6;

  -[CPTemplateApplicationDashboardScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUISubclass");

  if (v4)
  {
    objc_msgSend(v2, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interfaceOrientation");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (CGRect)_referenceBounds
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CPTemplateApplicationDashboardScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UITraitCollection)_traitCollection
{
  UITraitCollection *traitCollection;

  traitCollection = self->_traitCollection;
  if (!traitCollection)
  {
    -[CPTemplateApplicationDashboardScene _refreshTraitCollection](self, "_refreshTraitCollection");
    traitCollection = self->_traitCollection;
  }
  return traitCollection;
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CPTemplateApplicationDashboardScene _refreshTraitCollection](self, "_refreshTraitCollection");
  v5.receiver = self;
  v5.super_class = (Class)CPTemplateApplicationDashboardScene;
  -[CPTemplateApplicationDashboardScene _updateSceneTraitsAndPushTraitsToScreen:](&v5, sel__updateSceneTraitsAndPushTraitsToScreen_, v3);
}

- (void)_attachWindow:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", self) & 1) == 0)
  {
    objc_msgSend(v4, "_detachWindow:", v5);
    -[CPTemplateApplicationDashboardScene __captureWindow:](self, "__captureWindow:", v5);
    -[_UIContextBinder enrollBindable:](self->_contextBinder, "enrollBindable:", v5);
    objc_msgSend(v5, "_didMoveFromScene:toScene:", v4, self);
  }
  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
    -[_UIContextBinder attachBindable:](self->_contextBinder, "attachBindable:", v5);

}

- (void)_detachWindow:(id)a3
{
  _UIContextBinder *contextBinder;
  id v5;

  contextBinder = self->_contextBinder;
  v5 = a3;
  -[_UIContextBinder expellBindable:](contextBinder, "expellBindable:", v5);
  -[CPTemplateApplicationDashboardScene __releaseWindow:](self, "__releaseWindow:", v5);

}

- (void)_windowUpdatedVisibility:(id)a3
{
  int v4;
  _UIContextBinder *contextBinder;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "isHidden");
  contextBinder = self->_contextBinder;
  if (v4)
    -[_UIContextBinder detachBindable:](contextBinder, "detachBindable:", v6);
  else
    -[_UIContextBinder attachBindable:](contextBinder, "attachBindable:", v6);

}

- (void)_windowUpdatedProperties:(id)a3
{
  -[_UIContextBinder updateBindable:](self->_contextBinder, "updateBindable:", a3);
}

- (id)_allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4
{
  _BOOL4 v4;
  _UIContextBinder *contextBinder;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  contextBinder = self->_contextBinder;
  if (a4)
    -[_UIContextBinder attachedBindables](contextBinder, "attachedBindables");
  else
    -[_UIContextBinder enrolledBindables](contextBinder, "enrolledBindables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __94__CPTemplateApplicationDashboardScene__allWindowsIncludingInternalWindows_onlyVisibleWindows___block_invoke()
{
  return 1;
}

- (BOOL)_permitContextCreationForBindingDescription:(id *)a3
{
  return 1;
}

- (id)_fbsSceneLayerForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_UIContextBinder substrate](self->_contextBinder, "substrate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "clientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v18 = v5;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v14, "CAContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_boundContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v16)
            goto LABEL_12;

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
    v14 = 0;
LABEL_12:
    v5 = v18;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_componentForKey:(id)a3
{
  return 0;
}

- (id)_definition
{
  return 0;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[CPTemplateApplicationDashboardScene _FBSScene](self, "_FBSScene", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUISubclass");

  if (v5)
  {
    objc_msgSend(v3, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaInsetsPortrait");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x24BDF7718];
    v10 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v12 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v14 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)_deliverDashboardControllerToDelegate
{
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  CPDashboardController *dashboardController;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  CarPlayFrameworkGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to deliver dashboard controller...", buf, 2u);
  }

  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_hasApplicationCalledLaunchDelegate"))
  {
    if (self->_sceneWillConnect)
    {
      -[CPTemplateApplicationDashboardScene delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        CarPlayFrameworkGeneralLogging();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_20D6F4000, v6, OS_LOG_TYPE_DEFAULT, "App supports CPTemplateApplicationDashboardScene method", v10, 2u);
        }

        -[CPTemplateApplicationDashboardScene delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        dashboardController = self->_dashboardController;
        -[CPTemplateApplicationDashboardScene dashboardWindow](self, "dashboardWindow");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "templateApplicationDashboardScene:didConnectDashboardController:toWindow:", self, dashboardController, v9);

      }
    }
  }
}

- (void)_readySceneForConnection
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIWindow *v11;
  UIWindow *dashboardWindow;
  CPDashboardController *v13;
  CPDashboardController *dashboardController;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CPTemplateApplicationDashboardScene;
  -[CPTemplateApplicationDashboardScene _readySceneForConnection](&v15, sel__readySceneForConnection);
  -[CPTemplateApplicationDashboardScene bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (UIWindow *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FF8]), "initWithFrame:", v3, v5, v7, v9);
  dashboardWindow = self->_dashboardWindow;
  self->_dashboardWindow = v11;

  -[UIWindow _setWindowHostingScene:](self->_dashboardWindow, "_setWindowHostingScene:", self);
  -[UIWindow setAutoresizesSubviews:](self->_dashboardWindow, "setAutoresizesSubviews:", 1);
  -[UIWindow setAutoresizingMask:](self->_dashboardWindow, "setAutoresizingMask:", 18);
  -[UIWindow setFrame:](self->_dashboardWindow, "setFrame:", v4, v6, v8, v10);
  -[UIWindow makeKeyAndVisible](self->_dashboardWindow, "makeKeyAndVisible");
  v13 = -[CPDashboardController _init]([CPDashboardController alloc], "_init");
  dashboardController = self->_dashboardController;
  self->_dashboardController = v13;

  -[CPDashboardController _sceneConnect:](self->_dashboardController, "_sceneConnect:", self);
}

- (void)_invalidate
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *didFinishLaunchingObserver;
  NSObject *sceneWillConnectObserver;
  objc_super v10;

  -[CPDashboardController _invalidate](self->_dashboardController, "_invalidate");
  -[CPTemplateApplicationDashboardScene delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CPTemplateApplicationDashboardScene delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "templateApplicationDashboardScene:didDisconnectDashboardController:fromWindow:", self, self->_dashboardController, self->_dashboardWindow);

  }
  -[UIWindow setHidden:](self->_dashboardWindow, "setHidden:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self->_sceneWillConnectObserver);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self->_didFinishLaunchingObserver);

  didFinishLaunchingObserver = self->_didFinishLaunchingObserver;
  self->_didFinishLaunchingObserver = 0;

  sceneWillConnectObserver = self->_sceneWillConnectObserver;
  self->_sceneWillConnectObserver = 0;

  v10.receiver = self;
  v10.super_class = (Class)CPTemplateApplicationDashboardScene;
  -[CPTemplateApplicationDashboardScene _invalidate](&v10, sel__invalidate);
}

- (CPDashboardController)dashboardController
{
  return self->_dashboardController;
}

- (UIWindow)dashboardWindow
{
  return self->_dashboardWindow;
}

- (void)setDashboardWindow:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardWindow, a3);
}

- (CPUIFrameRateLimitDiffInspector)frameRateLimitInspector
{
  return self->_frameRateLimitInspector;
}

- (void)setFrameRateLimitInspector:(id)a3
{
  objc_storeStrong((id *)&self->_frameRateLimitInspector, a3);
}

- (NSNumber)frameRateLimit
{
  return self->_frameRateLimit;
}

- (void)setFrameRateLimit:(id)a3
{
  self->_frameRateLimit = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameRateLimitInspector, 0);
  objc_storeStrong((id *)&self->_dashboardWindow, 0);
  objc_storeStrong((id *)&self->_dashboardController, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_contextBinder, 0);
  objc_storeStrong((id *)&self->_didFinishLaunchingObserver, 0);
  objc_storeStrong((id *)&self->_sceneWillConnectObserver, 0);
}

@end
