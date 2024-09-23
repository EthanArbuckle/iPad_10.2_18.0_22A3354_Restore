@implementation CPTemplateApplicationScene

- (CPTemplateApplicationScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  id v6;
  id v7;
  CPTemplateApplicationScene *v8;
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
  CPTemplateApplicationScene *v21;
  uint64_t v22;
  NSObject *didFinishLaunchingObserver;
  void *v24;
  void *v25;
  uint64_t v26;
  CPTemplateApplicationScene *v27;
  uint64_t v28;
  NSObject *sceneWillConnectObserver;
  uint64_t v30;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsInterfaceStyleDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v32;
  CPUIContentStyleDiffInspector *v33;
  CPUIContentStyleDiffInspector *mapStyleInspector;
  CPUIContentStyleDiffInspector *v35;
  CPUIFrameRateLimitDiffInspector *v36;
  CPUIFrameRateLimitDiffInspector *frameRateLimitInspector;
  CPUIFrameRateLimitDiffInspector *v38;
  void *v39;
  CPTemplateApplicationScene *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  id location;
  _QWORD v52[4];
  CPTemplateApplicationScene *v53;
  _QWORD v54[4];
  CPTemplateApplicationScene *v55;
  objc_super v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)CPTemplateApplicationScene;
  v8 = -[CPTemplateApplicationScene initWithSession:connectionOptions:](&v56, sel_initWithSession_connectionOptions_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "_specification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v9, "sceneSubstrateClass");

    v11 = objc_alloc(MEMORY[0x24BDF7088]);
    v12 = [v10 alloc];
    -[CPTemplateApplicationScene _FBSScene](v8, "_FBSScene");
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
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke;
    v54[3] = &unk_24C77C4F8;
    v21 = v8;
    v55 = v21;
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v19, 0, v18, v54);
    v22 = objc_claimAutoreleasedReturnValue();
    didFinishLaunchingObserver = v21->_didFinishLaunchingObserver;
    v21->_didFinishLaunchingObserver = v22;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x24BDF7D30];
    v52[0] = v20;
    v52[1] = 3221225472;
    v52[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_4;
    v52[3] = &unk_24C77C4F8;
    v27 = v21;
    v53 = v27;
    objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", v26, v27, v25, v52);
    v28 = objc_claimAutoreleasedReturnValue();
    sceneWillConnectObserver = v27->_sceneWillConnectObserver;
    v27->_sceneWillConnectObserver = v28;

    v30 = objc_opt_new();
    sceneSettingsInterfaceStyleDiffInspector = v27->_sceneSettingsInterfaceStyleDiffInspector;
    v27->_sceneSettingsInterfaceStyleDiffInspector = (UIApplicationSceneSettingsDiffInspector *)v30;

    objc_initWeak(&location, v27);
    v32 = v27->_sceneSettingsInterfaceStyleDiffInspector;
    v49[0] = v20;
    v49[1] = 3221225472;
    v49[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_6;
    v49[3] = &unk_24C77C520;
    objc_copyWeak(&v50, &location);
    -[UIApplicationSceneSettingsDiffInspector observeUserInterfaceStyleWithBlock:](v32, "observeUserInterfaceStyleWithBlock:", v49);
    v33 = objc_alloc_init(CPUIContentStyleDiffInspector);
    mapStyleInspector = v27->_mapStyleInspector;
    v27->_mapStyleInspector = v33;

    v35 = v27->_mapStyleInspector;
    v47[0] = v20;
    v47[1] = 3221225472;
    v47[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_2;
    v47[3] = &unk_24C77C520;
    objc_copyWeak(&v48, &location);
    -[CPUIContentStyleDiffInspector observeMapStyleWithBlock:](v35, "observeMapStyleWithBlock:", v47);
    -[CPTemplateApplicationScene _updateContentStyle](v27, "_updateContentStyle");
    v36 = objc_alloc_init(CPUIFrameRateLimitDiffInspector);
    frameRateLimitInspector = v27->_frameRateLimitInspector;
    v27->_frameRateLimitInspector = v36;

    v38 = v27->_frameRateLimitInspector;
    v45[0] = v20;
    v45[1] = 3221225472;
    v45[2] = __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_3;
    v45[3] = &unk_24C77C520;
    objc_copyWeak(&v46, &location);
    -[CPUIFrameRateLimitDiffInspector observeFrameRateLimitWithBlock:](v38, "observeFrameRateLimitWithBlock:", v45);
    -[CPTemplateApplicationScene _updateFrameRateLimit](v27, "_updateFrameRateLimit");
    v57[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPTemplateApplicationScene _registerSettingsDiffActionArray:forKey:](v27, "_registerSettingsDiffActionArray:forKey:", v39, CFSTR("settingsObserver"));

    v40 = v27;
    v41 = (void *)_templateScenes;
    if (!_templateScenes)
    {
      v42 = objc_opt_new();
      v43 = (void *)_templateScenes;
      _templateScenes = v42;

      v41 = (void *)_templateScenes;
    }
    objc_msgSend(v41, "insertObject:atIndex:", v40, 0);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);

  }
  return v8;
}

uint64_t __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke(uint64_t a1)
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

  return objc_msgSend(*(id *)(a1 + 32), "_deliverInterfaceControllerToDelegate");
}

uint64_t __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_4(uint64_t a1)
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

  return objc_msgSend(*(id *)(a1 + 32), "_deliverInterfaceControllerToDelegate");
}

void __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshTraitCollection");

}

void __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateContentStyle");

}

void __64__CPTemplateApplicationScene_initWithSession_connectionOptions___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFrameRateLimit");

}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsInterfaceStyleDiffInspector;
  id v10;

  sceneSettingsInterfaceStyleDiffInspector = self->_sceneSettingsInterfaceStyleDiffInspector;
  v10 = a5;
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](sceneSettingsInterfaceStyleDiffInspector, "inspectDiff:withContext:", v10, 0);
  -[FBSSettingsDiffInspector inspectDiff:withContext:](self->_mapStyleInspector, "inspectDiff:withContext:", v10, 0);
  -[FBSSettingsDiffInspector inspectDiff:withContext:](self->_frameRateLimitInspector, "inspectDiff:withContext:", v10, 0);

}

- (void)_updateContentStyle
{
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  self->_contentStyle = -[CPTemplateApplicationScene _mapStyle](self, "_mapStyle");
  CarPlayFrameworkGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_contentStyle == 2)
      v4 = CFSTR("dark");
    else
      v4 = CFSTR("light");
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "Template scene content style updated to %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[CPTemplateApplicationScene delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    CarPlayFrameworkGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "Informing delegate of style update", (uint8_t *)&v10, 2u);
    }

    -[CPTemplateApplicationScene delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentStyleDidChange:", self->_contentStyle);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("CPTemplateApplicationSceneContentStyleUpdated"), self);

}

- (int64_t)_mapStyle
{
  void *v2;
  int64_t v3;

  -[CPTemplateApplicationScene _templateSettings](self, "_templateSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapStyle");

  return v3;
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
  self->_frameRateLimit = (NSNumber *)-[CPTemplateApplicationScene _frameRateLimit](self, "_frameRateLimit");
  -[CPTemplateApplicationScene _templateSettings](self, "_templateSettings");
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
      _os_log_impl(&dword_20D6F4000, v9, OS_LOG_TYPE_DEFAULT, "Template app scene frameRateLimit updated to %{public}f fps", buf, 0xCu);
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
      _os_log_impl(&dword_20D6F4000, v11, OS_LOG_TYPE_DEFAULT, "Template app scene updated to unrestricted frame rate", buf, 2u);
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

- (id)_frameRateLimit
{
  void *v2;
  void *v3;

  -[CPTemplateApplicationScene _templateSettings](self, "_templateSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameRateLimit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_templateSettings
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[CPTemplateApplicationScene _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CPTemplateApplicationScene _FBSScene](self, "_FBSScene");
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

+ (BOOL)_hostsWindows
{
  return 1;
}

- (UITraitCollection)_traitCollection
{
  UITraitCollection *traitCollection;

  traitCollection = self->_traitCollection;
  if (!traitCollection)
  {
    -[CPTemplateApplicationScene _refreshTraitCollection](self, "_refreshTraitCollection");
    traitCollection = self->_traitCollection;
  }
  return traitCollection;
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CPTemplateApplicationScene _refreshTraitCollection](self, "_refreshTraitCollection");
  v5.receiver = self;
  v5.super_class = (Class)CPTemplateApplicationScene;
  -[CPTemplateApplicationScene _updateSceneTraitsAndPushTraitsToScreen:](&v5, sel__updateSceneTraitsAndPushTraitsToScreen_, v3);
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
    -[CPTemplateApplicationScene _FBSScene](self, "_FBSScene");
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

  -[CPTemplateApplicationScene _FBSScene](self, "_FBSScene");
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

  -[CPTemplateApplicationScene _FBSScene](self, "_FBSScene");
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
  -[CPTemplateApplicationScene _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  objc_msgSend(v4, "traitCollectionWithDisplayScale:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[CPTemplateApplicationScene _FBSScene](self, "_FBSScene");
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
    -[CPTemplateApplicationScene __captureWindow:](self, "__captureWindow:", v5);
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
  -[CPTemplateApplicationScene __releaseWindow:](self, "__releaseWindow:", v5);

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
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __85__CPTemplateApplicationScene__allWindowsIncludingInternalWindows_onlyVisibleWindows___block_invoke()
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

  -[CPTemplateApplicationScene _FBSScene](self, "_FBSScene", a3);
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
  CPWindow *v11;
  CPWindow *carWindow;
  CPInterfaceController *v13;
  CPInterfaceController *interfaceController;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CPTemplateApplicationScene;
  -[CPTemplateApplicationScene _readySceneForConnection](&v15, sel__readySceneForConnection);
  -[CPTemplateApplicationScene bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CPTemplateApplicationScene _shouldCreateCarWindow](self, "_shouldCreateCarWindow"))
  {
    v11 = -[CPWindow initWithFrame:templateScene:]([CPWindow alloc], "initWithFrame:templateScene:", self, v4, v6, v8, v10);
    carWindow = self->_carWindow;
    self->_carWindow = v11;

    -[CPWindow _setWindowHostingScene:](self->_carWindow, "_setWindowHostingScene:", self);
    -[CPWindow setAutoresizesSubviews:](self->_carWindow, "setAutoresizesSubviews:", 1);
    -[CPWindow setAutoresizingMask:](self->_carWindow, "setAutoresizingMask:", 18);
    -[CPWindow setFrame:](self->_carWindow, "setFrame:", v4, v6, v8, v10);
    -[CPWindow makeKeyAndVisible](self->_carWindow, "makeKeyAndVisible");
  }
  v13 = -[CPInterfaceController _init]([CPInterfaceController alloc], "_init");
  interfaceController = self->_interfaceController;
  self->_interfaceController = v13;

  -[CPInterfaceController setWindowProvider:](self->_interfaceController, "setWindowProvider:", self);
  -[CPInterfaceController _sceneConnect:](self->_interfaceController, "_sceneConnect:", self);
}

- (void)_invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *didFinishLaunchingObserver;
  NSObject *sceneWillConnectObserver;
  objc_super v11;

  -[CPInterfaceController _invalidate](self->_interfaceController, "_invalidate");
  -[CPTemplateApplicationScene delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPTemplateApplicationScene _shouldCreateCarWindow](self, "_shouldCreateCarWindow")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "templateApplicationScene:didDisconnectInterfaceController:fromWindow:", self, self->_interfaceController, self->_carWindow);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "templateApplicationScene:didDisconnectInterfaceController:", self, self->_interfaceController);
  }
  else if (-[CPTemplateApplicationScene _shouldCallAppDelegate](self, "_shouldCallAppDelegate"))
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "application:didDisconnectCarInterfaceController:fromWindow:", v6, self->_interfaceController, self->_carWindow);

  }
  -[CPWindow setHidden:](self->_carWindow, "setHidden:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self->_sceneWillConnectObserver);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self->_didFinishLaunchingObserver);

  didFinishLaunchingObserver = self->_didFinishLaunchingObserver;
  self->_didFinishLaunchingObserver = 0;

  sceneWillConnectObserver = self->_sceneWillConnectObserver;
  self->_sceneWillConnectObserver = 0;

  if (_templateScenes)
    objc_msgSend((id)_templateScenes, "removeObject:", self);
  -[CPTemplateApplicationScene _unregisterSettingsDiffActionArrayForKey:](self, "_unregisterSettingsDiffActionArrayForKey:", CFSTR("InterfaceStyle"));
  v11.receiver = self;
  v11.super_class = (Class)CPTemplateApplicationScene;
  -[CPTemplateApplicationScene _invalidate](&v11, sel__invalidate);

}

+ (CPTemplateApplicationScene)activeTemplateScene
{
  return (CPTemplateApplicationScene *)objc_msgSend((id)_templateScenes, "firstObject");
}

- (void)updateLayoutGuideWithInsets:(UIEdgeInsets)a3
{
  -[CPWindow updateLayoutGuideWithInsets:](self->_carWindow, "updateLayoutGuideWithInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (UITraitCollection)carTraitCollection
{
  UITraitCollection *traitCollection;

  traitCollection = self->_traitCollection;
  if (!traitCollection)
  {
    -[CPTemplateApplicationScene _refreshTraitCollection](self, "_refreshTraitCollection");
    traitCollection = self->_traitCollection;
  }
  return traitCollection;
}

- (BOOL)_sceneWillConnect
{
  return self->_sceneWillConnect;
}

- (BOOL)_shouldCreateCarWindow
{
  if (_shouldCreateCarWindow_onceToken != -1)
    dispatch_once(&_shouldCreateCarWindow_onceToken, &__block_literal_global_44);
  return _shouldCreateCarWindow___shouldCreateWindow;
}

uint64_t __52__CPTemplateApplicationScene__shouldCreateCarWindow__block_invoke()
{
  uint64_t result;

  result = CPCurrentProcessHasMapsEntitlement();
  _shouldCreateCarWindow___shouldCreateWindow = result;
  return result;
}

- (BOOL)_shouldCallAppDelegate
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CPTemplateApplicationScene _shouldCreateCarWindow](self, "_shouldCreateCarWindow")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_opt_respondsToSelector();
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (void)_deliverInterfaceControllerToDelegate
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  CarPlayFrameworkGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to deliver interface controller...", buf, 2u);
  }

  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_hasApplicationCalledLaunchDelegate")
    && self->_sceneWillConnect)
  {
    CarPlayFrameworkGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "App ready to receive interface controller", buf, 2u);
    }

    -[CPTemplateApplicationScene delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPTemplateApplicationScene _shouldCreateCarWindow](self, "_shouldCreateCarWindow")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      CarPlayFrameworkGeneralLogging();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D6F4000, v6, OS_LOG_TYPE_DEFAULT, "App supports CPTemplateApplicationScene method with window", buf, 2u);
      }

      -[CPTemplateApplicationScene interfaceController](self, "interfaceController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPTemplateApplicationScene carWindow](self, "carWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "templateApplicationScene:didConnectInterfaceController:toWindow:", self, v7, v8);

    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if (-[CPTemplateApplicationScene _shouldCallAppDelegate](self, "_shouldCallAppDelegate"))
        {
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __67__CPTemplateApplicationScene__deliverInterfaceControllerToDelegate__block_invoke;
          v12[3] = &unk_24C77C5B0;
          v12[4] = self;
          v10 = (void (**)(_QWORD))MEMORY[0x212BA7CA8](v12);
          if (dyld_program_sdk_at_least())
            v10[2](v10);
          else
            dispatch_async(MEMORY[0x24BDAC9B8], v10);

        }
        else
        {
          CarPlayFrameworkGeneralLogging();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D6F4000, v11, OS_LOG_TYPE_DEFAULT, "App does not support any CarPlay template connection", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Application does not implement CarPlay template application lifecycle methods in its scene delegate."));
        }
        goto LABEL_25;
      }
      CarPlayFrameworkGeneralLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D6F4000, v9, OS_LOG_TYPE_DEFAULT, "App supports CPTemplateApplicationScene method without window", buf, 2u);
      }

      -[CPTemplateApplicationScene interfaceController](self, "interfaceController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "templateApplicationScene:didConnectInterfaceController:", self, v7);
    }

LABEL_25:
  }
}

void __67__CPTemplateApplicationScene__deliverInterfaceControllerToDelegate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "App supports CPApplicationDelegate method", v8, 2u);
  }

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "interfaceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "carWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application:didConnectCarInterfaceController:toWindow:", v5, v6, v7);

}

- (CPWindow)carWindow
{
  return self->_carWindow;
}

- (void)setCarWindow:(id)a3
{
  objc_storeStrong((id *)&self->_carWindow, a3);
}

- (CPInterfaceController)interfaceController
{
  return self->_interfaceController;
}

- (UIUserInterfaceStyle)contentStyle
{
  return self->_contentStyle;
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsInterfaceStyleDiffInspector
{
  return self->_sceneSettingsInterfaceStyleDiffInspector;
}

- (void)setSceneSettingsInterfaceStyleDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsInterfaceStyleDiffInspector, a3);
}

- (CPUIContentStyleDiffInspector)mapStyleInspector
{
  return self->_mapStyleInspector;
}

- (void)setMapStyleInspector:(id)a3
{
  objc_storeStrong((id *)&self->_mapStyleInspector, a3);
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
  objc_storeStrong((id *)&self->_mapStyleInspector, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInterfaceStyleDiffInspector, 0);
  objc_storeStrong((id *)&self->_interfaceController, 0);
  objc_storeStrong((id *)&self->_carWindow, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_contextBinder, 0);
  objc_storeStrong((id *)&self->_didFinishLaunchingObserver, 0);
  objc_storeStrong((id *)&self->_sceneWillConnectObserver, 0);
}

@end
