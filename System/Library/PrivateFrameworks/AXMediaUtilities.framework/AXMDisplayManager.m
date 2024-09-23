@implementation AXMDisplayManager

- (AXMDisplayManager)initWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  AXMDisplayManager *v6;
  AXMDisplayManager *v7;
  uint64_t v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  AXMDisplay *v11;
  AXMDisplay *queue_FrontBoardMainDisplay;
  void (**v13)(_QWORD);
  AXMDisplay *v14;
  AXMDisplay *queue_CoreAnimationMainDisplay;
  AXMDisplay *v16;
  void *v17;
  NSObject *v18;
  AXMDisplayManager *v19;
  id v20;
  void *v21;
  AXMDisplayManager *v22;
  _QWORD v24[4];
  AXMDisplayManager *v25;
  id v26;
  _QWORD block[4];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  AXMDisplayManager *v30;
  NSObject *v31;
  objc_super v32;

  v4 = a3;
  v5 = dispatch_group_create();
  v32.receiver = self;
  v32.super_class = (Class)AXMDisplayManager;
  v6 = -[AXMDisplayManager init](&v32, sel_init);
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v6->_mobileGestaltOrientation = -1.0;
    v9 = dispatch_queue_create("AXMDisplayManager", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    if (MGGetSInt32Answer() != 7)
    {
      v11 = -[AXMDisplay _initWithBackingType:]([AXMDisplay alloc], "_initWithBackingType:", 2);
      queue_FrontBoardMainDisplay = v7->_queue_FrontBoardMainDisplay;
      v7->_queue_FrontBoardMainDisplay = v11;

      dispatch_group_enter(v5);
      v29[0] = v8;
      v29[1] = 3221225472;
      v29[2] = __40__AXMDisplayManager_initWithCompletion___block_invoke;
      v29[3] = &unk_1E625CB18;
      v30 = v7;
      v31 = v5;
      v13 = (void (**)(_QWORD))MEMORY[0x1B5E12AE8](v29);
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        v13[2](v13);
      }
      else
      {
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __40__AXMDisplayManager_initWithCompletion___block_invoke_2;
        block[3] = &unk_1E625D100;
        v28 = v13;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }
    v14 = -[AXMDisplay _initWithBackingType:]([AXMDisplay alloc], "_initWithBackingType:", 1);
    queue_CoreAnimationMainDisplay = v7->_queue_CoreAnimationMainDisplay;
    v7->_queue_CoreAnimationMainDisplay = v14;

    v16 = v7->_queue_CoreAnimationMainDisplay;
    objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDisplayManager _updateDisplay:withCADisplay:](v7, "_updateDisplay:withCADisplay:", v16, v17);

  }
  dispatch_get_global_queue(21, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __40__AXMDisplayManager_initWithCompletion___block_invoke_3;
  v24[3] = &unk_1E625C480;
  v19 = v7;
  v25 = v19;
  v26 = v4;
  v20 = v4;
  dispatch_group_notify(v5, v18, v24);

  v21 = v26;
  v22 = v19;

  return v22;
}

void __40__AXMDisplayManager_initWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D23100]);
  objc_msgSend(*(id *)(a1 + 32), "setDisplayMonitor:", v2);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "displayMonitor", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedIdentities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "displayMonitor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "configurationForIdentity:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isMainDisplay"))
          objc_msgSend(*(id *)(a1 + 32), "_updateDisplay:withConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "displayMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:", *(_QWORD *)(a1 + 32));

}

uint64_t __40__AXMDisplayManager_initWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__AXMDisplayManager_initWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)initAndWaitForMainDisplayConfiguration
{
  AXMDisplayManager *v2;
  const __CFString *v3;
  NSObject *v4;

  v2 = -[AXMDisplayManager initWithCompletion:](self, "initWithCompletion:", 0);
  if (!v2->_initialized)
  {
    v3 = (const __CFString *)*MEMORY[0x1E0C9B280];
    do
      CFRunLoopRunInMode(v3, 0.15, 1u);
    while (!v2->_initialized);
  }
  AXLogDisplay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXMDisplayManager initAndWaitForMainDisplayConfiguration].cold.1((uint64_t)v2, v4);

  return v2;
}

- (NSString)description
{
  void *v3;
  _BOOL8 initialized;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  initialized = self->_initialized;
  -[AXMDisplayManager frontBoardMainDisplay](self, "frontBoardMainDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDisplayManager coreAnimationMainDisplay](self, "coreAnimationMainDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDisplayManager _displayPropertiesFromMobileGestalt](self, "_displayPropertiesFromMobileGestalt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXMDisplayManager:<%p> Initialized %ld\n\tFrontbaord Main:%@\n\tCADisplay Main:%@\n\tStatic (gestalt) props: %@"), self, initialized, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXMDisplayManager displayMonitor](self, "displayMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXMDisplayManager;
  -[AXMDisplayManager dealloc](&v4, sel_dealloc);
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (double)mobileGestaltOrientation
{
  double result;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  float v8;
  NSObject *v9;

  result = self->_mobileGestaltOrientation;
  if (result == -1.0)
  {
    v4 = (void *)MGCopyAnswer();
    if (!v4)
    {
      AXLogDisplay();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[AXMDisplayManager mobileGestaltOrientation].cold.2();

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("main-screen-orientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "floatValue");
      self->_mobileGestaltOrientation = v8;
    }
    else
    {
      AXLogDisplay();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[AXMDisplayManager mobileGestaltOrientation].cold.1();

    }
    return self->_mobileGestaltOrientation;
  }
  return result;
}

- (AXMDisplay)frontBoardMainDisplay
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AXMDisplayManager_frontBoardMainDisplay__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXMDisplay *)v3;
}

void __42__AXMDisplayManager_frontBoardMainDisplay__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (AXMDisplay)coreAnimationMainDisplay
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AXMDisplayManager_coreAnimationMainDisplay__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXMDisplay *)v3;
}

void __45__AXMDisplayManager_coreAnimationMainDisplay__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_displayPropertiesFromMobileGestalt
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MGCopyAnswer();
  if (!v3)
  {
    AXLogDisplay();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[AXMDisplayManager mobileGestaltOrientation].cold.2();

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("main-screen-scale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("scale"));
  }
  else
  {
    AXLogDisplay();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[AXMDisplayManager mobileGestaltOrientation].cold.1();

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("main-screen-orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("orientation"));
  }
  else
  {
    AXLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AXMDisplayManager _displayPropertiesFromMobileGestalt].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("supportsDeepColor"));

  return v2;
}

- (void)_updateDisplay:(id)a3 withCADisplay:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  AXMDisplayManager *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AXMDisplayManager__updateDisplay_withCADisplay___block_invoke;
  block[3] = &unk_1E625D9D0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __50__AXMDisplayManager__updateDisplay_withCADisplay___block_invoke(id *a1)
{
  void *v2;
  double v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  id v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[5], "currentMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setScale:", (double)(unint64_t)objc_msgSend(v2, "preferredScale"));

  objc_msgSend(a1[6], "mobileGestaltOrientation");
  objc_msgSend(a1[4], "setOrientation:");
  objc_msgSend(a1[4], "scale");
  v4 = 1.0 / v3;
  objc_msgSend(a1[5], "bounds");
  v6 = v4 * v5;
  v8 = v4 * v7;
  v10 = v4 * v9;
  v12 = v4 * v11;
  objc_msgSend(a1[4], "orientation");
  v14 = v13;
  objc_msgSend(a1[5], "bounds");
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1[4], "setPhysicalOrientation:", objc_msgSend(a1[6], "_discreteOrientationForOrientation:", v14));
  if (AXMFloatApproxEqual(v14, 1.57079633) || AXMFloatApproxEqual(v14, 4.71238898))
  {
    v19 = v16;
    v20 = v10;
  }
  else
  {
    v19 = v18;
    v18 = v16;
    v20 = v12;
    v12 = v10;
  }
  objc_msgSend(a1[4], "setReferenceBounds:", v6, v8, v12, v20);
  objc_msgSend(a1[4], "setSize:", v18, v19);
  objc_msgSend(a1[5], "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setName:", v21);

  AXLogDisplay();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = a1[4];
    v24 = 138412290;
    v25 = v23;
    _os_log_impl(&dword_1B0E3B000, v22, OS_LOG_TYPE_DEFAULT, "Display settings after update from CADisplay.mainDisplay: %@", (uint8_t *)&v24, 0xCu);
  }

}

- (int64_t)_discreteOrientationForOrientation:(double)a3
{
  NSObject *v5;

  if (AXMFloatApproxEqual(a3, 0.0))
    return 1;
  if (AXMFloatApproxEqual(a3, 1.57079633))
    return 3;
  if (AXMFloatApproxEqual(a3, 3.14159265))
    return 2;
  if (!AXMFloatApproxEqual(a3, 4.71238898))
  {
    AXLogDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[AXMDisplayManager _discreteOrientationForOrientation:].cold.1();

    return 1;
  }
  return 4;
}

- (void)_updateDisplay:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  AXMDisplayManager *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AXMDisplayManager__updateDisplay_withConfiguration___block_invoke;
  block[3] = &unk_1E625D9D0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __54__AXMDisplayManager__updateDisplay_withConfiguration___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[5], "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setName:", v2);

  objc_msgSend(a1[5], "pointScale");
  objc_msgSend(a1[4], "setScale:");
  objc_msgSend(a1[5], "pixelSize");
  objc_msgSend(a1[4], "setSize:");
  objc_msgSend(a1[6], "mobileGestaltOrientation");
  objc_msgSend(a1[4], "setOrientation:");
  objc_msgSend(a1[5], "bounds");
  objc_msgSend(a1[4], "setReferenceBounds:");
  v3 = a1[6];
  objc_msgSend(v3, "mobileGestaltOrientation");
  objc_msgSend(a1[4], "setPhysicalOrientation:", objc_msgSend(v3, "_discreteOrientationForOrientation:"));
  objc_msgSend(a1[4], "setSupportsDeepColor:", MGGetBoolAnswer());
  AXLogDisplay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1B0E3B000, v4, OS_LOG_TYPE_DEFAULT, "Display settings after update from FB configuration: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_updateDisplayPropertiesWithConfiguration:(id)a3
{
  AXMDisplay *queue_CoreAnimationMainDisplay;
  void *v5;
  id v6;

  -[AXMDisplayManager _updateDisplay:withConfiguration:](self, "_updateDisplay:withConfiguration:", self->_queue_FrontBoardMainDisplay, a3);
  queue_CoreAnimationMainDisplay = self->_queue_CoreAnimationMainDisplay;
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDisplayManager _updateDisplay:withCADisplay:](self, "_updateDisplay:withCADisplay:", queue_CoreAnimationMainDisplay, v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("AXMDisplayManagerMainDisplayWasUpdatedNotification"), self);

}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a5;
  AXLogDisplay();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEFAULT, "connected new display. Updating AXMDisplay properties", v8, 2u);
  }

  if (objc_msgSend(v6, "isMainDisplay"))
    -[AXMDisplayManager _updateDisplayPropertiesWithConfiguration:](self, "_updateDisplayPropertiesWithConfiguration:", v6);

}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a5;
  AXLogDisplay();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEFAULT, "display config changed. Updating AXMDisplay properties", v8, 2u);
  }

  if (objc_msgSend(v6, "isMainDisplay"))
    -[AXMDisplayManager _updateDisplayPropertiesWithConfiguration:](self, "_updateDisplayPropertiesWithConfiguration:", v6);

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  AXLogDisplay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0E3B000, v4, OS_LOG_TYPE_DEFAULT, "disconnected new display", v5, 2u);
  }

}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (void)setMobileGestaltOrientation:(double)a3
{
  self->_mobileGestaltOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_queue_FrontBoardMainDisplay, 0);
  objc_storeStrong((id *)&self->_queue_CoreAnimationMainDisplay, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initAndWaitForMainDisplayConfiguration
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "AXMDisplayManager initialized: %@", (uint8_t *)&v2, 0xCu);
}

- (void)mobileGestaltOrientation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unable to look up screenInfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_displayPropertiesFromMobileGestalt
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unable to look up screen orientation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_discreteOrientationForOrientation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unexpected physical screen orientation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
