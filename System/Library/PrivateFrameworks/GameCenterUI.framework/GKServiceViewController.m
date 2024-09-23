@implementation GKServiceViewController

- (GKServiceViewController)init
{
  GKServiceViewController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKServiceViewController;
  v2 = -[GKNavigationController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 1)
    {
      -[GKServiceViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formSheetSize");
      -[GKServiceViewController setFormSheetSize:](v2, "setFormSheetSize:");

      *MEMORY[0x1E0D25B68] = 0;
    }
    v2->_alwaysShowDoneButton = 1;
    -[GKServiceViewController _startObservingChangesToProperties](v2, "_startObservingChangesToProperties");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_serviceViewControllerCreated_, CFSTR("GKServiceViewControllerCreatedNotification"), 0);
    objc_storeStrong(&GKServiceInterfaceController, v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[GKServiceViewController _stopObservingChangesToProperties](self, "_stopObservingChangesToProperties");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKServiceViewController;
  -[GKServiceViewController dealloc](&v4, sel_dealloc);
}

- (id)daemonProxy
{
  return (id)objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
}

+ (id)_exportedInterface
{
  return +[GKRemoteViewServiceController serviceViewControllerInterface](GKRemoteViewServiceController, "serviceViewControllerInterface");
}

+ (id)_remoteViewControllerInterface
{
  return +[GKRemoteViewServiceController exportedInterface](GKRemoteViewServiceController, "exportedInterface");
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
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "WILL DISMISS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)remoteViewControllerDidFinish
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "DISMISSED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)remoteViewControllerIsCanceling
{
  id v3;
  void *v4;

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKServiceViewController remoteViewControllerIsFinishing].cold.1();
  -[GKServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteViewControllerIsCanceling");

}

- (void)remoteViewControllerDidCancel
{
  id v3;

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKServiceViewController remoteViewControllerDidFinish].cold.1();
  -[GKServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, &__block_literal_global_11);
}

- (void)cancelServiceViewController
{
  if (*MEMORY[0x1E0D253F8])
    -[GKServiceViewController remoteViewControllerIsFinishing](self, "remoteViewControllerIsFinishing");
  else
    -[GKServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_12);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[GKServiceViewController setValue:forKeyPath:](self, "setValue:forKeyPath:", v8, v9);
  if (!*MEMORY[0x1E0D25460])
    v11 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
  {
    -[GKServiceViewController setValue:forKeyPath:withReply:].cold.1();
    if (!v10)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v10)
LABEL_5:
    v10[2](v10, 1);
LABEL_6:

}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("LocalPlayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("StatusBarHeight"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    self->_statusBarHeight = v11;
  }
  if (!*MEMORY[0x1E0D25460])
    v12 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
  {
    -[GKServiceViewController setInitialState:withReply:].cold.1();
    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateFromLocalPlayer:", v8);

  }
LABEL_8:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HostPID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKServiceViewController setHostPID:](self, "setHostPID:", objc_msgSend(v14, "integerValue"));

  -[GKServiceViewController daemonProxy](self, "daemonProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHostPID:", -[GKServiceViewController hostPID](self, "hostPID"));

  if (!self->_privateViewController && -[GKServiceViewController isViewLoaded](self, "isViewLoaded"))
    -[GKServiceViewController constructPrivateViewController](self, "constructPrivateViewController");
  if (v7)
    v7[2](v7, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("GKServiceViewControllerNewHostPIDKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[GKServiceViewController hostPID](self, "hostPID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("GKServiceViewControllerCreatedNotification"), self, v18);

}

- (void)serviceViewControllerCreated:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GKServiceViewControllerNewHostPIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 != -[GKServiceViewController hostPID](self, "hostPID"))
    -[GKServiceViewController cancelServiceViewController](self, "cancelServiceViewController");
}

- (void)nudge
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "NUDGE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (UIViewController)privateViewController
{
  if (!self->_privateViewController && -[GKServiceViewController isViewLoaded](self, "isViewLoaded"))
    -[GKServiceViewController constructPrivateViewController](self, "constructPrivateViewController");
  return self->_privateViewController;
}

- (BOOL)shouldAnimatePresentationForPrivateViewController:(id)a3
{
  return 0;
}

- (void)presentInitialViewController:(id)a3
{
  _BOOL8 v4;
  id v5;

  v5 = a3;
  v4 = -[GKServiceViewController shouldAnimatePresentationForPrivateViewController:](self, "shouldAnimatePresentationForPrivateViewController:", v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[GKServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, v4, &__block_literal_global_17);
  else
    -[GKServiceViewController pushViewController:animated:](self, "pushViewController:animated:", v5, v4);

}

- (void)constructPrivateViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_privateViewController)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 1)
    {
      -[GKServiceViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formSheetSize");
      -[GKServiceViewController setFormSheetSize:](self, "setFormSheetSize:");

    }
    else
    {
      -[GKServiceViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
    }
    -[GKServiceViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemInteractionColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v7);

    -[GKServiceViewController visibleViewController](self, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self->_privateViewController);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKServiceViewController setViewControllers:animated:](self, "setViewControllers:animated:", v9, 0);

    }
    -[GKServiceViewController presentInitialViewController:](self, "presentInitialViewController:", self->_privateViewController);

  }
}

- (void)resetPrivateViewController
{
  UIViewController *privateViewController;
  void *v4;

  privateViewController = self->_privateViewController;
  if (privateViewController)
  {
    -[UIViewController view](privateViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[GKServiceViewController setPrivateViewController:](self, "setPrivateViewController:", 0);
  }
}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  id v6;
  os_log_t *v7;
  id v8;
  os_log_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v3 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (os_log_t *)MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewWillAppear:].cold.1();
  if (!*v5)
    v8 = (id)GKOSLoggers();
  v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    -[GKServiceViewController viewWillAppear:].cold.1(v9);
  -[GKServiceViewController daemonProxy](self, "daemonProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHostPID:", -[GKServiceViewController hostPID](self, "hostPID"));

  -[GKServiceViewController daemonProxy](self, "daemonProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDataUpdateDelegate:", self);

  v17.receiver = self;
  v17.super_class = (Class)GKServiceViewController;
  -[GKServiceViewController viewWillAppear:](&v17, sel_viewWillAppear_, v3);
  if (-[GKServiceViewController _useBackdropViewForWindowBackground](self, "_useBackdropViewForWindowBackground"))
  {
    -[GKServiceViewController navigationBar](self, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_backdropViewLayerGroupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKServiceViewController parentViewController](self, "parentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_gkUseAsModalSheetBackgroundWithGroupName:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKServiceViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  id v6;
  os_log_t *v7;
  id v8;
  os_log_t v9;
  objc_super v10;

  v3 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (os_log_t *)MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKHostedViewController viewDidAppear:].cold.1();
  if (!*v5)
    v8 = (id)GKOSLoggers();
  v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    -[GKServiceViewController viewWillAppear:].cold.1(v9);
  v10.receiver = self;
  v10.super_class = (Class)GKServiceViewController;
  -[GKServiceViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  id v6;
  os_log_t *v7;
  id v8;
  os_log_t v9;
  objc_super v10;

  v3 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (os_log_t *)MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewWillDisappear:].cold.1();
  if (!*v5)
    v8 = (id)GKOSLoggers();
  v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    -[GKServiceViewController viewWillAppear:].cold.1(v9);
  v10.receiver = self;
  v10.super_class = (Class)GKServiceViewController;
  -[GKServiceViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  id v6;
  os_log_t *v7;
  id v8;
  os_log_t v9;
  void *v10;
  GKServiceViewController *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (os_log_t *)MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewDidDisappear:].cold.1();
  if (!*v5)
    v8 = (id)GKOSLoggers();
  v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    -[GKServiceViewController viewWillAppear:].cold.1(v9);
  v13.receiver = self;
  v13.super_class = (Class)GKServiceViewController;
  -[GKServiceViewController viewDidDisappear:](&v13, sel_viewDidDisappear_, v3);
  -[GKServiceViewController daemonProxy](self, "daemonProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUpdateDelegate");
  v11 = (GKServiceViewController *)objc_claimAutoreleasedReturnValue();

  if (v11 == self)
  {
    -[GKServiceViewController daemonProxy](self, "daemonProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDataUpdateDelegate:", 0);

  }
}

- (void)finishAndPlayChallenge:(id)a3
{
  id v4;

  objc_msgSend(a3, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_playPressedForChallenge_, v4);

}

- (void)finishWithTurnBasedMatch:(id)a3
{
  id v4;

  objc_msgSend(a3, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_finishWithMatch_, v4);

}

- (void)quitTurnBasedMatch:(id)a3
{
  id v4;

  objc_msgSend(a3, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_playerQuitMatch_, v4);

}

- (void)dashboardDidChangeToViewState:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_setViewState_, v4);

}

- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_setLeaderboardTimeScope_, v4);

}

- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3
{
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_setLeaderboardIdentifier_, a3);
}

- (void)requestDashboardLogoImageWithHandler:(id)a3
{
  id v4;

  v4 = _Block_copy(a3);
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_requestDashboardLogoImageWithHandler_, v4);

}

- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3
{
  id v4;

  v4 = _Block_copy(a3);
  -[GKServiceViewController performSelectorOnHostController:withObject:](self, "performSelectorOnHostController:withObject:", sel_requestImagesForLeaderboardSetsWithHandler_, v4);

}

- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = _Block_copy(a4);
  -[GKServiceViewController performSelectorOnHostController:withObject:withObject:](self, "performSelectorOnHostController:withObject:withObject:", sel_requestImagesForLeaderboardsInSet_handler_, v6, v7);

}

- (void)performSelectorOnHostController:(SEL)a3
{
  id v4;

  -[GKServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_gkPerformSelector:", a3);

}

- (void)performSelectorOnHostController:(SEL)a3 withObject:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[GKServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkPerformSelector:withObject:", a3, v6);

}

- (void)performSelectorOnHostController:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[GKServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_gkPerformSelector:withObject:withObject:", a3, v9, v8);

}

- (id)observedKeyPaths
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (void)_startObservingChangesToProperties
{
  GKServiceViewController *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  os_log_t *v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(self);
  if (!-[GKServiceViewController observationInfo](v2, "observationInfo"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[GKServiceViewController observedKeyPaths](v2, "observedKeyPaths");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v16;
      v8 = (_QWORD *)MEMORY[0x1E0D25460];
      v9 = (os_log_t *)MEMORY[0x1E0D25468];
      *(_QWORD *)&v5 = 138412290;
      v14 = v5;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v3);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[GKServiceViewController addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, v11, 0, 0, v14);
          if (!*v8)
            v12 = (id)GKOSLoggers();
          v13 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_debug_impl(&dword_1AB361000, v13, OS_LOG_TYPE_DEBUG, "observing keyPath %@", buf, 0xCu);
          }
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v6);
    }

  }
}

- (void)_stopObservingChangesToProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GKServiceViewController observedKeyPaths](self, "observedKeyPaths", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[GKServiceViewController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v7 = a3;
  -[GKServiceViewController observedKeyPaths](self, "observedKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    -[GKServiceViewController valueForKeyPath:](self, "valueForKeyPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*MEMORY[0x1E0D25460])
      v11 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
      -[GKServiceViewController observeValueForKeyPath:ofObject:change:context:].cold.1();

  }
}

- (void)_addDoneButtonToViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "_gkServiceWantsCustomRightBarButtonItemInViewService") & 1) == 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 2, self, sel_donePressed_);
    objc_msgSend(v9, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  if (-[GKServiceViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
    -[GKServiceViewController _addDoneButtonToViewController:](self, "_addDoneButtonToViewController:", v6);
  v7.receiver = self;
  v7.super_class = (Class)GKServiceViewController;
  -[GKNavigationController pushViewController:animated:](&v7, sel_pushViewController_animated_, v6, v4);

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (-[GKServiceViewController alwaysShowDoneButton](self, "alwaysShowDoneButton"))
          -[GKServiceViewController _addDoneButtonToViewController:](self, "_addDoneButtonToViewController:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKServiceViewController;
  -[GKServiceViewController setViewControllers:animated:](&v12, sel_setViewControllers_animated_, v6, v4);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v5;
  void *v6;
  objc_super v7;

  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = (void *)*MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKServiceViewController didRotateFromInterfaceOrientation:].cold.1(a3, v6, self);
  v7.receiver = self;
  v7.super_class = (Class)GKServiceViewController;
  -[GKServiceViewController didRotateFromInterfaceOrientation:](&v7, sel_didRotateFromInterfaceOrientation_, a3);
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  return self->_statusBarHeight;
}

- (void)setPrivateViewController:(id)a3
{
  objc_storeStrong((id *)&self->_privateViewController, a3);
}

- (BOOL)alwaysShowDoneButton
{
  return self->_alwaysShowDoneButton;
}

- (void)setAlwaysShowDoneButton:(BOOL)a3
{
  self->_alwaysShowDoneButton = a3;
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void)setHostPID:(int)a3
{
  self->_hostPID = a3;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setStatusBarHeight:(double)a3
{
  self->_statusBarHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateViewController, 0);
}

- (void)setValue:forKeyPath:withReply:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v0, (uint64_t)v0, "host changed keyPath %@ to %@", v1);
  OUTLINED_FUNCTION_4();
}

- (void)setInitialState:withReply:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1AB361000, v0, OS_LOG_TYPE_DEBUG, "setting player LP:%@", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)viewWillAppear:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_2_1(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AB361000, v4, v5, "%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v0, (uint64_t)v0, "changed keyPath %@ to %@", v1);
  OUTLINED_FUNCTION_4();
}

- (void)didRotateFromInterfaceOrientation:(void *)a3 .cold.1(unint64_t a1, void *a2, void *a3)
{
  const __CFString *v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1 >= 5)
    v4 = CFSTR("UIInterfaceOrientationPortrait");
  else
    v4 = off_1E59C7CA0[a1];
  v5 = a2;
  v6 = objc_msgSend(a3, "interfaceOrientation");
  if (v6 >= 5)
    v8 = CFSTR("UIInterfaceOrientationPortrait");
  else
    v8 = off_1E59C7CA0[v6];
  v9 = 138412546;
  v10 = v4;
  v11 = 2112;
  v12 = v8;
  OUTLINED_FUNCTION_3(&dword_1AB361000, v5, v7, "rotated from %@ to %@", (uint8_t *)&v9);

}

@end
