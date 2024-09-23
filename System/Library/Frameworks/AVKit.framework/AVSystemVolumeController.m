@implementation AVSystemVolumeController

- (BOOL)currentRouteHasVolumeControl
{
  return self->_currentRouteHasVolumeControl;
}

- (float)volume
{
  return self->_volume;
}

void __58__AVSystemVolumeController_windowSceneVolumeHUDAssertions__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)windowSceneVolumeHUDAssertions_windowSceneVolumeHUDAssertions;
  windowSceneVolumeHUDAssertions_windowSceneVolumeHUDAssertions = v0;

}

- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  AVVolumeHUDAssertion *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  self->_prefersSystemVolumeHUDHidden = a3;
  if (!self->_uniqueIdentifier || !self->_windowSceneSessionIdentifier)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[AVSystemVolumeController setPrefersSystemVolumeHUDHidden:]";
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Attempted to set SystemVolumeHUD visibility before setting Client Identifier or Scene Identifier.", buf, 0xCu);
    }

  }
  objc_msgSend((id)objc_opt_class(), "windowSceneVolumeHUDAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (self->_prefersSystemVolumeHUDHidden)
  {
    if (self->_windowSceneSessionIdentifier)
    {
      v7 = -[AVVolumeHUDAssertion initWithSceneIdentifier:clientIdentifier:]([AVVolumeHUDAssertion alloc], "initWithSceneIdentifier:clientIdentifier:", self->_windowSceneSessionIdentifier, self->_uniqueIdentifier);
      -[AVVolumeHUDAssertion setDelegate:](v7, "setDelegate:", self);
      -[AVVolumeHUDAssertion setPrefersSystemVolumeHUDHidden:](v7, "setPrefersSystemVolumeHUDHidden:", 1);
      objc_msgSend((id)objc_opt_class(), "windowSceneVolumeHUDAssertions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

    }
  }
  else
  {
    -[AVSystemVolumeController _removeVolumeHUDAssertionsForClientID:](self, "_removeVolumeHUDAssertionsForClientID:", self->_uniqueIdentifier);
  }
  objc_msgSend((id)objc_opt_class(), "windowSceneVolumeHUDAssertions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v10, "minusSet:", v6);
  v11 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v11, "minusSet:", v9);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        -[AVSystemVolumeController setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:](self, "setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:", 0, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v11;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[AVSystemVolumeController setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:](self, "setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:", 1, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void)_removeVolumeHUDAssertionsForClientID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "windowSceneVolumeHUDAssertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__AVSystemVolumeController__removeVolumeHUDAssertionsForClientID___block_invoke;
  v8[3] = &unk_1E5BB3B28;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "objectsPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "windowSceneVolumeHUDAssertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v5);

}

+ (NSMutableSet)windowSceneVolumeHUDAssertions
{
  if (windowSceneVolumeHUDAssertions_onceToken != -1)
    dispatch_once(&windowSceneVolumeHUDAssertions_onceToken, &__block_literal_global_17867);
  return (NSMutableSet *)(id)windowSceneVolumeHUDAssertions_windowSceneVolumeHUDAssertions;
}

- (void)setClientWithIdentifier:(id)a3 forWindowSceneSessionWithIdentifier:(id)a4
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
  objc_storeStrong((id *)&self->_windowSceneSessionIdentifier, a4);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__AVSystemVolumeController_setClientWithIdentifier_forWindowSceneSessionWithIdentifier___block_invoke;
    block[3] = &unk_1E5BB3B00;
    block[4] = self;
    v10 = v7;
    v11 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_observeSystemControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (!self->_observingSystemController)
  {
    self->_observingSystemController = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleSystemControllerServerDiedNotification, *MEMORY[0x1E0D48200], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleCurrentRouteHasVolumeControlDidChangeNotification_, *MEMORY[0x1E0D47F48], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleSystemVolumeDidChangeNotification_, *MEMORY[0x1E0D482B0], 0);

  }
}

void __49__AVSystemVolumeController__performOnMainThread___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)_handleSystemVolumeDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  _QWORD v21[4];
  int v22;
  char v23;
  char v24;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D47E98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSystemVolumeController volumeCategory](self, "volumeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EC0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("ExplicitVolumeChange"));
    v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("RouteChange"));
    v17 = v16;
    if ((v15 & 1) != 0 || v16)
    {
      objc_msgSend(v4, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EB8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue") ^ 1;

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __69__AVSystemVolumeController__handleSystemVolumeDidChangeNotification___block_invoke;
      v21[3] = &__block_descriptor_38_e34_v16__0__AVSystemVolumeController_8l;
      v23 = v17;
      v22 = v12;
      v24 = v20;
      -[AVSystemVolumeController _performOnMainThread:](self, "_performOnMainThread:", v21);
    }

  }
}

- (NSString)volumeCategory
{
  return self->_volumeCategory;
}

- (void)_performOnMainThread:(id)a3
{
  void (**v4)(id, AVSystemVolumeController *);
  _QWORD block[4];
  void (**v6)(id, AVSystemVolumeController *);
  id v7;
  id location;

  v4 = (void (**)(id, AVSystemVolumeController *))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v4[2](v4, self);
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AVSystemVolumeController__performOnMainThread___block_invoke;
    block[3] = &unk_1E5BB44A0;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __69__AVSystemVolumeController__handleSystemVolumeDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  float v6;
  float v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (!*(_BYTE *)(a1 + 36))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 32);
LABEL_7:
    objc_msgSend(v8, "setVolume:shouldShowHUD:", *(unsigned __int8 *)(a1 + 37), v4);
    v5 = v8;
    goto LABEL_8;
  }
  objc_msgSend(v3, "volume");
  v5 = v8;
  v6 = *(float *)&v4;
  LODWORD(v4) = *(_DWORD *)(a1 + 32);
  v7 = v6 - *(float *)&v4;
  if (v7 < 0.0)
    v7 = -v7;
  if (v7 > 0.001)
    goto LABEL_7;
LABEL_8:

}

- (void)setVolume:(float)a3 shouldShowHUD:(BOOL)a4
{
  float v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0 || a3 == 1.0)
    goto LABEL_8;
  v6 = self->_volume - a3;
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 0.001)
  {
LABEL_8:
    self->_volume = a3;
    v9 = CFSTR("AVVolumeControllerVolumeDidChangeNotificationShowHUDKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSystemVolumeController _postNotificationForNameIfFullyInitialized:userInfo:](self, "_postNotificationForNameIfFullyInitialized:userInfo:", CFSTR("AVVolumeControllerVolumeChangedNotification"), v8);

  }
}

void __50__AVSystemVolumeController__setupSystemController__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  double v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_observeSystemControllerIfNeeded");
    objc_msgSend(v3, "setSharedSystemController:", *(_QWORD *)(a1 + 32));
    objc_storeStrong(v3 + 7, *(id *)(a1 + 40));
    objc_msgSend(v3, "setCurrentRouteHasVolumeControl:", *(unsigned __int8 *)(a1 + 60));
    LODWORD(v4) = *(_DWORD *)(a1 + 56);
    objc_msgSend(v3, "setVolume:shouldShowHUD:", 1, v4);
    objc_msgSend(v3, "setFullyInitialized:", 1);
    v6 = CFSTR("AVVolumeControllerVolumeDidChangeNotificationIsInitialValueKey");
    v7[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_postNotificationForNameIfFullyInitialized:userInfo:", CFSTR("AVVolumeControllerVolumeChangedNotification"), v5);

  }
}

- (void)_postNotificationForNameIfFullyInitialized:(id)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[AVSystemVolumeController isFullyInitialized](self, "isFullyInitialized"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", v8, self, v6);

  }
}

- (BOOL)isFullyInitialized
{
  return self->_fullyInitialized;
}

- (void)setSharedSystemController:(id)a3
{
  AVSystemController *v5;
  AVSystemController **p_sharedSystemController;
  AVSystemController *sharedSystemController;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v5 = (AVSystemController *)a3;
  sharedSystemController = self->_sharedSystemController;
  p_sharedSystemController = &self->_sharedSystemController;
  if (sharedSystemController != v5)
  {
    objc_storeStrong((id *)p_sharedSystemController, a3);
    if (*p_sharedSystemController)
    {
      v8 = *MEMORY[0x1E0D47F48];
      v10[0] = *MEMORY[0x1E0D48200];
      v10[1] = v8;
      v10[2] = *MEMORY[0x1E0D482B0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSystemController setAttribute:forKey:error:](*p_sharedSystemController, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48280], 0);

    }
  }

}

- (void)setFullyInitialized:(BOOL)a3
{
  self->_fullyInitialized = a3;
}

- (void)setCurrentRouteHasVolumeControl:(BOOL)a3
{
  self->_currentRouteHasVolumeControl = a3;
}

+ (id)volumeController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVSystemVolumeController_volumeController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (volumeController_onceToken != -1)
    dispatch_once(&volumeController_onceToken, block);
  return (id)volumeController_volumeController;
}

void __50__AVSystemVolumeController__setupSystemController__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  char v6;
  id v7;
  _QWORD block[4];
  id v9;
  __CFString *v10;
  id v11;
  int v12;
  char v13;
  int v14;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_requestSharedSystemController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "currentRouteHasVolumeControl");
    v6 = v5;
    v14 = 0;
    if (v5)
      objc_msgSend(v4, "getVolume:forCategory:", &v14, CFSTR("Audio/Video"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AVSystemVolumeController__setupSystemController__block_invoke_2;
    block[3] = &unk_1E5BB3B50;
    objc_copyWeak(&v11, v1);
    v9 = v4;
    v10 = CFSTR("Audio/Video");
    v13 = v6;
    v12 = v14;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v11);
  }

}

- (id)_requestSharedSystemController
{
  return (id)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
}

- (BOOL)isChangingVolume
{
  return self->_changingVolume;
}

void __44__AVSystemVolumeController_volumeController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)volumeController_volumeController;
  volumeController_volumeController = (uint64_t)v1;

}

- (AVSystemVolumeController)init
{
  AVSystemVolumeController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *systemControllerQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVSystemVolumeController;
  v2 = -[AVSystemVolumeController init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AVKit.AVSystemVolumeControllerQueue", v3);
    systemControllerQueue = v2->_systemControllerQueue;
    v2->_systemControllerQueue = (OS_dispatch_queue *)v4;

    -[AVSystemVolumeController _setupSystemController](v2, "_setupSystemController");
  }
  return v2;
}

- (void)_setupSystemController
{
  NSObject *systemControllerQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  systemControllerQueue = self->_systemControllerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AVSystemVolumeController__setupSystemController__block_invoke;
  v4[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v5, &location);
  dispatch_async(systemControllerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  objc_super v3;

  -[AVSystemVolumeController _unobserveSystemControllerIfNeeded](self, "_unobserveSystemControllerIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)AVSystemVolumeController;
  -[AVSystemVolumeController dealloc](&v3, sel_dealloc);
}

- (void)setTargetVolume:(float)a3
{
  NSObject *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[AVSystemVolumeController isChangingVolume](self, "isChangingVolume"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "%@: It is an error to set the target volume without calling -[AVVolumeController begin/endChangingVolume].", (uint8_t *)&v17, 0xCu);

    }
  }
  -[AVSystemVolumeController maximumTargetVolumeSinceChangingVolumeBegan](self, "maximumTargetVolumeSinceChangingVolumeBegan");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    *(float *)&v7 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  *(float *)&v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSystemVolumeController setTargetVolumeInternal:](self, "setTargetVolumeInternal:", v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "floatValue");
  if (*(float *)&v14 <= a3)
    *(float *)&v14 = a3;
  objc_msgSend(v13, "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSystemVolumeController setMaximumTargetVolumeSinceChangingVolumeBegan:](self, "setMaximumTargetVolumeSinceChangingVolumeBegan:", v15);

  -[AVSystemVolumeController _postNotificationForNameIfFullyInitialized:userInfo:](self, "_postNotificationForNameIfFullyInitialized:userInfo:", CFSTR("AVVolumeControllerVolumeChangedNotification"), 0);
  -[AVSystemVolumeController _applyProposedVolumeIfNeeded](self, "_applyProposedVolumeIfNeeded");

}

- (void)beginChangingVolume
{
  void *v3;
  void *v4;

  if (!-[AVSystemVolumeController isChangingVolume](self, "isChangingVolume"))
  {
    -[AVSystemVolumeController setChangingVolume:](self, "setChangingVolume:", 1);
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[AVSystemVolumeController volume](self, "volume");
    objc_msgSend(v3, "numberWithFloat:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSystemVolumeController setTargetVolumeInternal:](self, "setTargetVolumeInternal:", v4);

    -[AVSystemVolumeController setMaximumTargetVolumeSinceChangingVolumeBegan:](self, "setMaximumTargetVolumeSinceChangingVolumeBegan:", 0);
    -[AVSystemVolumeController setPrefersSystemVolumeHUDHidden:](self, "setPrefersSystemVolumeHUDHidden:", self->_prefersSystemVolumeHUDHidden);
  }
}

- (void)endChangingVolume
{
  -[AVSystemVolumeController setChangingVolume:](self, "setChangingVolume:", 0);
  -[AVSystemVolumeController setVolumeChangesThrottled:](self, "setVolumeChangesThrottled:", 0);
  -[AVSystemVolumeController _applyProposedVolumeIfNeeded](self, "_applyProposedVolumeIfNeeded");
  -[AVSystemVolumeController setTargetVolumeInternal:](self, "setTargetVolumeInternal:", 0);
  -[AVSystemVolumeController setMaximumTargetVolumeSinceChangingVolumeBegan:](self, "setMaximumTargetVolumeSinceChangingVolumeBegan:", 0);
}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forSceneVolumeHudAssertion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v8 = CFSTR("Enabling");
    else
      v8 = CFSTR("Disabling");
    objc_msgSend(v6, "sceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[AVSystemVolumeController setSystemVolumeHUDEnabled:forSceneVolumeHudAssertion:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ volume HUD for windowScene with scene ID: %@, unique ID: %@", (uint8_t *)&v13, 0x2Au);

  }
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "_appAdoptsUISceneLifecycle"))
  {
    objc_msgSend(getMPVolumeHUDControllerClass(), "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addVolumeDisplay:", v6);

    objc_msgSend(v6, "setPrefersSystemVolumeHUDHidden:", v4 ^ 1);
    objc_msgSend(getMPVolumeHUDControllerClass(), "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsUpdate");
  }
  else
  {
    objc_msgSend(v6, "sceneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSystemVolumeController setSystemVolumeHUDEnabled:forWindowSceneSessionIdentifier:](self, "setSystemVolumeHUDEnabled:forWindowSceneSessionIdentifier:", v4, v12);
  }

}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forWindowSceneSessionIdentifier:(id)a4
{
  _BOOL8 v4;
  __CFString *v5;
  id *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a4;
  v6 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "avkit_windowSceneWithSessionIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("Disabling");
    *(_DWORD *)buf = 136315906;
    v25 = "-[AVSystemVolumeController setSystemVolumeHUDEnabled:forWindowSceneSessionIdentifier:]";
    if (v4)
      v9 = CFSTR("Enabling");
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v7;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ volume HUD for windowScene: %@ with ID: %@", buf, 0x2Au);
  }

  if (!v7)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*v6, "openSessions", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "persistentIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    _AVLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "-[AVSystemVolumeController setSystemVolumeHUDEnabled:forWindowSceneSessionIdentifier:]";
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "%s WindowScene with ID: %@ is nonexist. Existing session identifiers are %@", buf, 0x20u);

    }
  }
  objc_msgSend(v7, "_setSystemVolumeHUDEnabled:", v4);

}

- (void)_unobserveSystemControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (self->_observingSystemController)
  {
    self->_observingSystemController = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48200], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D47F48], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D482B0], 0);

  }
}

- (void)_handleSystemControllerServerDiedNotification
{
  -[AVSystemVolumeController setSharedSystemController:](self, "setSharedSystemController:", 0);
  -[AVSystemVolumeController setFullyInitialized:](self, "setFullyInitialized:", 0);
  -[AVSystemVolumeController _setupSystemController](self, "_setupSystemController");
}

- (void)_handleCurrentRouteHasVolumeControlDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  _QWORD v7[4];
  char v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47F50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__AVSystemVolumeController__handleCurrentRouteHasVolumeControlDidChangeNotification___block_invoke;
  v7[3] = &__block_descriptor_33_e34_v16__0__AVSystemVolumeController_8l;
  v8 = v6;
  -[AVSystemVolumeController _performOnMainThread:](self, "_performOnMainThread:", v7);
}

- (void)_applyProposedVolumeIfNeeded
{
  uint64_t v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  -[AVSystemVolumeController targetVolumeInternal](self, "targetVolumeInternal");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return;
  v20 = (id)v3;
  -[AVSystemVolumeController targetVolumeInternal](self, "targetVolumeInternal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  -[AVSystemVolumeController volume](self, "volume");
  if (v6 == v7)
  {

    return;
  }
  -[AVSystemVolumeController targetVolumeInternal](self, "targetVolumeInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  if (v9 == 0.0)
  {

LABEL_9:
    if (-[AVSystemVolumeController volumeChangesThrottled](self, "volumeChangesThrottled")
      || !-[AVSystemVolumeController isChangingVolume](self, "isChangingVolume"))
    {
      if (!-[AVSystemVolumeController isChangingVolume](self, "isChangingVolume"))
        -[AVSystemVolumeController _applyProposedVolumeImmediately](self, "_applyProposedVolumeImmediately");
    }
    else
    {
      -[AVSystemVolumeController setVolumeChangesThrottled:](self, "setVolumeChangesThrottled:", 1);
      -[AVSystemVolumeController _applyProposedVolumeImmediately](self, "_applyProposedVolumeImmediately");
      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x1E0C99E88];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __56__AVSystemVolumeController__applyProposedVolumeIfNeeded__block_invoke;
      v21[3] = &unk_1E5BB49A8;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v17, "timerWithTimeInterval:repeats:block:", 0, v21, 0.1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTolerance:", 0.025);
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addTimer:forMode:", v18, *MEMORY[0x1E0C99860]);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    return;
  }
  -[AVSystemVolumeController volume](self, "volume");
  v11 = v10;
  -[AVSystemVolumeController targetVolumeInternal](self, "targetVolumeInternal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v11 - v13;

  v15 = -v14;
  if (v14 >= 0.0)
    v15 = v14;
  v16 = v15;

  if (v16 > 0.01)
    goto LABEL_9;
}

- (void)_applyProposedVolumeImmediately
{
  NSObject *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  double v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[AVSystemVolumeController targetVolumeInternal](self, "targetVolumeInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;
    -[AVSystemVolumeController volumeCategory](self, "volumeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[AVSystemVolumeController _applyProposedVolumeImmediately]";
    v16 = 2048;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting volume on AVSystemController to: %.2f for category: %@", (uint8_t *)&v14, 0x20u);

  }
  -[AVSystemVolumeController sharedSystemController](self, "sharedSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSystemVolumeController targetVolumeInternal](self, "targetVolumeInternal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;
  -[AVSystemVolumeController volumeCategory](self, "volumeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = v11;
  objc_msgSend(v8, "setVolumeTo:forCategory:", v12, v13);

}

- (BOOL)prefersSystemVolumeHUDHidden
{
  return self->_prefersSystemVolumeHUDHidden;
}

- (AVSystemController)sharedSystemController
{
  return self->_sharedSystemController;
}

- (void)setChangingVolume:(BOOL)a3
{
  self->_changingVolume = a3;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)volumeChangesThrottled
{
  return self->_volumeChangesThrottled;
}

- (void)setVolumeChangesThrottled:(BOOL)a3
{
  self->_volumeChangesThrottled = a3;
}

- (NSNumber)targetVolumeInternal
{
  return self->_targetVolumeInternal;
}

- (void)setTargetVolumeInternal:(id)a3
{
  objc_storeStrong((id *)&self->_targetVolumeInternal, a3);
}

- (NSNumber)maximumTargetVolumeSinceChangingVolumeBegan
{
  return self->_maximumTargetVolumeSinceChangingVolumeBegan;
}

- (void)setMaximumTargetVolumeSinceChangingVolumeBegan:(id)a3
{
  objc_storeStrong((id *)&self->_maximumTargetVolumeSinceChangingVolumeBegan, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)windowSceneSessionIdentifier
{
  return self->_windowSceneSessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_volumeCategory, 0);
  objc_storeStrong((id *)&self->_maximumTargetVolumeSinceChangingVolumeBegan, 0);
  objc_storeStrong((id *)&self->_targetVolumeInternal, 0);
  objc_storeStrong((id *)&self->_sharedSystemController, 0);
  objc_storeStrong((id *)&self->_systemControllerQueue, 0);
}

void __56__AVSystemVolumeController__applyProposedVolumeIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVolumeChangesThrottled:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_applyProposedVolumeIfNeeded");

}

void __85__AVSystemVolumeController__handleCurrentRouteHasVolumeControlDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(unsigned __int8 *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCurrentRouteHasVolumeControl:", v2);
  objc_msgSend(v3, "_postNotificationForNameIfFullyInitialized:userInfo:", CFSTR("AVVolumeControllerCurrentRouteHasVolumeControlChangedNotification"), 0);

}

BOOL __66__AVSystemVolumeController__removeVolumeHUDAssertionsForClientID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  return v5;
}

uint64_t __88__AVSystemVolumeController_setClientWithIdentifier_forWindowSceneSessionWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClientWithIdentifier:forWindowSceneSessionWithIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
