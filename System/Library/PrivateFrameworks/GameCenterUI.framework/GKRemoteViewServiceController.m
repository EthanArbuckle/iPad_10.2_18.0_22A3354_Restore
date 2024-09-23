@implementation GKRemoteViewServiceController

- (void)dealloc
{
  GKRemoteViewServiceController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(self);
  if (-[GKRemoteViewServiceController observationInfo](v2, "observationInfo"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[GKRemoteViewServiceController observedKeyPaths](v2, "observedKeyPaths");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[GKRemoteViewServiceController removeObserver:forKeyPath:context:](v2, "removeObserver:forKeyPath:context:", v2, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  v8.receiver = v2;
  v8.super_class = (Class)GKRemoteViewServiceController;
  -[_UIRemoteViewController dealloc](&v8, sel_dealloc);
}

+ (id)exportedInterface
{
  return +[GKViewServiceInterface extensionHostInterface](GKViewServiceInterface, "extensionHostInterface");
}

+ (id)serviceViewControllerInterface
{
  return +[GKViewServiceInterface extensionInterface](GKViewServiceInterface, "extensionInterface");
}

- (id)observedKeyPaths
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (BOOL)serviceNeedsLocalPlayer
{
  return 1;
}

- (BOOL)serviceNeedsFriendCode
{
  void *v2;
  char isKindOfClass;

  -[GKRemoteViewServiceController managingViewController](self, "managingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)populateInitialStateForRemoteView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v4, CFSTR("HostPID"));

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 0.0;
  if (v6 != 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "statusBarHeight");
    v7 = v9;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v10, CFSTR("StatusBarHeight"));

  if (-[GKRemoteViewServiceController serviceNeedsLocalPlayer](self, "serviceNeedsLocalPlayer"))
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v11, CFSTR("LocalPlayer"));

  }
  if (-[GKRemoteViewServiceController serviceNeedsFriendCode](self, "serviceNeedsFriendCode"))
  {
    -[GKRemoteViewServiceController managingViewController](self, "managingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "friendCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "friendCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v14, CFSTR("GKFriendCodeKey"));

    }
    objc_msgSend(v12, "friendSupportPageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v12, "friendSupportPageURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v16, CFSTR("GKFriendSupportPageURLKey"));

    }
    objc_msgSend(v12, "recipients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v12, "recipients");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v18, CFSTR("GKFriendRecipientsKey"));

    }
    objc_msgSend(v12, "chatGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v12, "chatGUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("GKChatGUIDKey"));

    }
  }

}

- (void)nudge
{
  id v2;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nudge");

}

- (void)setupRemoteView
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "setting game and player", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__GKRemoteViewServiceController_setupRemoteView__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    __48__GKRemoteViewServiceController_setupRemoteView__block_invoke_cold_1();
  objc_msgSend(WeakRetained, "setDidSetRemoteGame:", a2);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[GKRemoteViewServiceController observedKeyPaths](self, "observedKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v10);

  if (v8)
  {
    -[GKRemoteViewServiceController valueForKeyPath:](self, "valueForKeyPath:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRemoteViewServiceController setValue:forKeyPath:](self, "setValue:forKeyPath:", v9, v10);

  }
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  os_log_t *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  os_log_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  GKRemoteViewServiceController *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (!self->_dirtyProperties)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRemoteViewServiceController setDirtyProperties:](self, "setDirtyProperties:", v8);

  }
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteViewServiceController managingViewController](self, "managingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v12 = (id)GKOSLoggers();
  v13 = (os_log_t *)MEMORY[0x1E0D25468];
  v14 = *MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController setValue:forKeyPath:].cold.2((uint64_t)v7, v14, v15);
  -[GKRemoteViewServiceController dirtyProperties](self, "dirtyProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v6)
    objc_msgSend(v16, "setObject:forKey:", v6, v7);
  else
    objc_msgSend(v16, "removeObjectForKey:", v7);

  objc_msgSend(v10, "_beginDelayingPresentation");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke;
  v23[3] = &unk_1E59C5338;
  v18 = v7;
  v24 = v18;
  v19 = v6;
  v25 = v19;
  v26 = self;
  v20 = v10;
  v27 = v20;
  objc_msgSend(v9, "setValue:forKeyPath:withReply:", v19, v18, v23);
  if (!*v11)
    v21 = (id)GKOSLoggers();
  v22 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController setValue:forKeyPath:].cold.1((uint64_t)v18, v22, self);

}

uint64_t __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke(uint64_t a1, int a2)
{
  _QWORD *v3;
  uint64_t v4;
  os_log_t *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;

  v3 = (_QWORD *)MEMORY[0x1E0D25460];
  v4 = *MEMORY[0x1E0D25460];
  v5 = (os_log_t *)MEMORY[0x1E0D25468];
  if (a2)
  {
    if (!v4)
      v6 = (id)GKOSLoggers();
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_2();
    objc_msgSend(*(id *)(a1 + 48), "dirtyProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    if (!v4)
      v8 = (id)GKOSLoggers();
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_3();
  }
  if (!*v3)
    v9 = (id)GKOSLoggers();
  v10 = *v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_1(a1, v10);

  return objc_msgSend(*(id *)(a1 + 56), "_endDelayingPresentation");
}

- (int64_t)_desiredStatusBarStyle
{
  return 300;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAccessPoint");

  -[GKRemoteViewServiceController setupRemoteView](self, "setupRemoteView");
  v9.receiver = self;
  v9.super_class = (Class)GKRemoteViewServiceController;
  -[_UIRemoteViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewWillAppear:].cold.1();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 1 || *MEMORY[0x1E0D253F8] && !*MEMORY[0x1E0D25B68])
    -[UIViewController _gkSaveStatusBarStyleAnimated:setToStyle:](self, "_gkSaveStatusBarStyleAnimated:setToStyle:", v3, -[GKRemoteViewServiceController _desiredStatusBarStyle](self, "_desiredStatusBarStyle"));
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKRemoteViewServiceController;
  -[_UIRemoteViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = (void *)*MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewDidAppear:].cold.1(v5);
  -[GKRemoteViewServiceController setViewDidAppear:](self, "setViewDidAppear:", 1);
  -[GKRemoteViewServiceController _performBlockAfterViewDidAppearIfNeeded](self, "_performBlockAfterViewDidAppearIfNeeded");
}

- (void)_performBlockAfterViewDidAppearIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "EXECUTE CLEANUP BLOCK?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __72__GKRemoteViewServiceController__performBlockAfterViewDidAppearIfNeeded__block_invoke(uint64_t a1)
{
  id v2;

  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    __72__GKRemoteViewServiceController__performBlockAfterViewDidAppearIfNeeded__block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBlockToPerformAfterViewDidAppear:", 0);
}

- (void)_performSelectorAfterAppearingOrTimeOut:(SEL)a3
{
  uint64_t v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke;
  v8[3] = &unk_1E59C5360;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  -[GKRemoteViewServiceController setBlockToPerformAfterViewDidAppear:](self, "setBlockToPerformAfterViewDidAppear:", v8);
  v6 = dispatch_time(0, 3000000000);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke_2;
  v7[3] = &unk_1E59C4148;
  v7[4] = self;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_gkPerformSelector:", *(_QWORD *)(a1 + 40));

}

uint64_t __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setViewDidAppear:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_performBlockAfterViewDidAppearIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKRemoteViewServiceController;
  -[_UIRemoteViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewWillDisappear:].cold.1();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKRemoteViewServiceController;
  -[_UIRemoteViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewDidDisappear:].cold.1();
  -[UIViewController _gkRestoreStatusBarStyle:](self, "_gkRestoreStatusBarStyle:", v3);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showAccessPoint");

}

- (BOOL)_dismissSelfAfterGettingShouldFinish
{
  return 1;
}

- (void)remoteViewControllerIsFinishing
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "DISMISSED (FINISHING - WAITING FOR viewDidAppear)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)remoteViewControllerIsCanceling
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "DISMISSED (CANCELLING - WAITING FOR viewDidAppear)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKRemoteViewServiceController viewServiceDidTerminateWithError:].cold.1((uint64_t)v4, v6);
  -[GKRemoteViewServiceController managingViewController](self, "managingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteViewControllerDidCancel");

    -[GKRemoteViewServiceController remoteViewControllerIsCanceling](self, "remoteViewControllerIsCanceling");
    -[GKRemoteViewServiceController managingViewController](self, "managingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetRemoteViewController");

  }
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)didSetRemoteGame
{
  return self->_didSetRemoteGame;
}

- (void)setDidSetRemoteGame:(BOOL)a3
{
  self->_didSetRemoteGame = a3;
}

- (BOOL)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(BOOL)a3
{
  self->_viewDidAppear = a3;
}

- (NSMutableDictionary)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyProperties, a3);
}

- (GKHostedViewController)managingViewController
{
  return (GKHostedViewController *)objc_loadWeakRetained((id *)&self->_managingViewController);
}

- (void)setManagingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_managingViewController, a3);
}

- (UIColor)previousStatusBarColor
{
  return self->_previousStatusBarColor;
}

- (void)setPreviousStatusBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_previousStatusBarColor, a3);
}

- (id)blockToPerformAfterViewDidAppear
{
  return self->_blockToPerformAfterViewDidAppear;
}

- (void)setBlockToPerformAfterViewDidAppear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1504);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_blockToPerformAfterViewDidAppear, 0);
  objc_storeStrong((id *)&self->_previousStatusBarColor, 0);
  objc_destroyWeak((id *)&self->_managingViewController);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
}

void __48__GKRemoteViewServiceController_setupRemoteView__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "did set game and player", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setValue:(void *)a3 forKeyPath:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "dirtyProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_3(&dword_1AB361000, v5, v7, "dirty properties after adding %@: %@", (uint8_t *)&v8);

}

- (void)setValue:(uint64_t)a3 forKeyPath:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1AB361000, a2, a3, "changed key %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  int v11;
  const __CFString *v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "dirtyProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "dirtyProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = *(void **)(a1 + 48);
  if (v8)
  {
    objc_msgSend(v9, "dirtyProperties");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "managingViewController");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v11 = -[__CFString shouldPresentRemoteViewController](v10, "shouldPresentRemoteViewController");
    v12 = CFSTR("don't present");
    if (v11)
      v12 = CFSTR("present");
  }
  v13[0] = 67109634;
  v13[1] = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2112;
  v17 = v12;
  _os_log_debug_impl(&dword_1AB361000, a2, OS_LOG_TYPE_DEBUG, "%u dirty properties after purging %@: %@", (uint8_t *)v13, 0x1Cu);

}

void __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v0, v1, "service changed key %@ to %@", v2);
  OUTLINED_FUNCTION_4();
}

void __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v0, v1, "service failed to change key %@ to %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)viewWillAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "APPEARING", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)viewDidAppear:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3978];
  v2 = a1;
  objc_msgSend(v1, "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_6(&dword_1AB361000, v2, v4, "APPEARED (%@)", (uint8_t *)&v5);

}

void __72__GKRemoteViewServiceController__performBlockAfterViewDidAppearIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "EXECUTE CLEANUP BLOCK", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)viewWillDisappear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "DISAPPEARING", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)viewDidDisappear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "DISAPPEARED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "view service dead: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
