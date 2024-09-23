@implementation GKHostedViewController

- (id)serviceSideViewControllerClassName
{
  return CFSTR("GKServiceViewController");
}

- (id)hostSideViewControllerClassName
{
  return CFSTR("GKRemoteViewServiceController");
}

- (GKHostedViewController)init
{
  id v3;
  GKHostedViewController *v4;
  uint64_t v5;
  GKGame *game;
  objc_super v8;

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKHostedViewController init].cold.1();
  v8.receiver = self;
  v8.super_class = (Class)GKHostedViewController;
  v4 = -[GKHostedViewController init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
    v5 = objc_claimAutoreleasedReturnValue();
    game = v4->_game;
    v4->_game = (GKGame *)v5;

    -[GKHostedViewController requestRemoteViewControllerIfNeeded](v4, "requestRemoteViewControllerIfNeeded");
  }
  return v4;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)donePressed:(id)a3
{
  id v4;

  -[GKHostedViewController setPresentingRemoteViewController:](self, "setPresentingRemoteViewController:", 0);
  -[GKHostedViewController presentingViewController](self, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_41);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[GKHostedViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  -[GKHostedViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  -[GKHostedViewController requestRemoteViewControllerIfNeeded](self, "requestRemoteViewControllerIfNeeded");
  v6.receiver = self;
  v6.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewWillAppear:].cold.1();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKHostedViewController viewDidAppear:].cold.1();
  -[GKHostedViewController presentRemoteViewControllerIfNeeded](self, "presentRemoteViewControllerIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  -[GKHostedViewController setGkIsDisappearing:](self, "setGkIsDisappearing:", 1);
  v6.receiver = self;
  v6.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewWillDisappear:].cold.1();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[GKHostedViewController setGkIsDisappearing:](self, "setGkIsDisappearing:", 0);
  -[GKHostedViewController requestRemoteViewControllerIfNeeded](self, "requestRemoteViewControllerIfNeeded");
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKRemoteViewServiceController viewDidDisappear:].cold.1();
}

- (void)requestRemoteViewControllerIfNeeded
{
  GKRemoteViewServiceController *remoteViewController;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  id v9;
  NSString *v10;
  Class v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  GKHostedViewController *v19;
  id v20;

  if (!self->_isRequestingRemoteViewController)
  {
    remoteViewController = self->_remoteViewController;
    if (remoteViewController)
    {
      -[GKRemoteViewServiceController setManagingViewController:](remoteViewController, "setManagingViewController:", self);
      -[GKRemoteViewServiceController nudge](self->_remoteViewController, "nudge");
    }
    else
    {
      -[GKHostedViewController _presentingViewController](self, "_presentingViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isRequestingRemoteViewController = 1;
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6 != 1 || (*MEMORY[0x1E0D253F8] ? (v7 = *MEMORY[0x1E0D25B68] == 0) : (v7 = 0), v7))
      {
        -[GKHostedViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
      }
      else
      {
        -[GKHostedViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
        objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "formSheetSize");
        -[GKHostedViewController setFormSheetSize:](self, "setFormSheetSize:");

        v9 = (id)-[GKHostedViewController view](self, "view");
      }
      -[GKHostedViewController setWantsFullScreenLayout:](self, "setWantsFullScreenLayout:", 1);
      -[GKHostedViewController hostSideViewControllerClassName](self, "hostSideViewControllerClassName");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = NSClassFromString(v10);
      -[GKHostedViewController serviceSideViewControllerClassName](self, "serviceSideViewControllerClassName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke;
      v18 = &unk_1E59C5C68;
      v19 = self;
      v20 = v4;
      v13 = v4;
      v14 = (id)-[objc_class requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](v11, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v12, CFSTR("com.apple.gamecenter.GameCenterUIService"), &v15);

      objc_msgSend(v13, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_58, 5.0, v15, v16, v17, v18, v19);
    }
  }
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject **v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 970) = 0;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E0D25460];
    v8 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v9 = (id)GKOSLoggers();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_2((uint64_t)v6, v8, v10);
LABEL_6:
    objc_msgSend(*(id *)(a1 + 40), "_endDelayingPresentation");
    goto LABEL_7;
  }
  if (!v5)
  {
    v29 = (NSObject **)MEMORY[0x1E0D25460];
    v30 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v31 = (id)GKOSLoggers();
      v30 = *v29;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_1(v30, v32, v33);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setManagingViewController:");
  objc_msgSend(*(id *)(a1 + 32), "didGetRemoteViewController");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 != 1 || (*MEMORY[0x1E0D253F8] ? (v13 = *MEMORY[0x1E0D25B68] == 0) : (v13 = 0), v13))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setModalPresentationStyle:", 17);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setModalPresentationStyle:", 16);
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "formSheetSize");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setFormSheetSize:");

    v15 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "view");
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setupRemoteView");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "didMoveToParentViewController:");
  objc_msgSend(*(id *)(a1 + 40), "_endDelayingPresentation");
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992);
  if (v28)
    (*(void (**)(void))(v28 + 16))();
LABEL_7:

}

uint64_t __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_56(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_56_cold_1();
  }
  return a2 ^ 1u;
}

- (void)resetRemoteViewController
{
  void *v3;

  -[GKRemoteViewServiceController willMoveToParentViewController:](self->_remoteViewController, "willMoveToParentViewController:", 0);
  -[GKHostedViewController removeChildViewController:](self, "removeChildViewController:", self->_remoteViewController);
  -[GKRemoteViewServiceController view](self->_remoteViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[GKHostedViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
  -[GKHostedViewController setRemoteViewReadyHandler:](self, "setRemoteViewReadyHandler:", 0);
  if (!-[GKHostedViewController gkIsDisappearing](self, "gkIsDisappearing"))
    -[GKHostedViewController requestRemoteViewControllerIfNeeded](self, "requestRemoteViewControllerIfNeeded");
}

- (BOOL)shouldPresentRemoteViewController
{
  void *v3;
  void *v4;
  char v5;

  if (!-[GKHostedViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[GKHostedViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKHostedViewController remoteViewController](self, "remoteViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "didSetRemoteGame");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)presentRemoteViewControllerIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "presenting now!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dismissModalViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKHostedViewController dismissModalViewControllerAnimated:].cold.1();
  -[GKHostedViewController setPresentingRemoteViewController:](self, "setPresentingRemoteViewController:", 0);
  v6.receiver = self;
  v6.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController dismissModalViewControllerAnimated:](&v6, sel_dismissModalViewControllerAnimated_, v3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v6 = a4;
  if (!*MEMORY[0x1E0D25460])
    v7 = (id)GKOSLoggers();
  v8 = (void *)*MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    -[GKHostedViewController dismissViewControllerAnimated:completion:].cold.1(v8, v6);
  -[GKHostedViewController setPresentingRemoteViewController:](self, "setPresentingRemoteViewController:", 0);
  v9.receiver = self;
  v9.super_class = (Class)GKHostedViewController;
  -[GKHostedViewController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v6);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (GKRemoteViewServiceController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (BOOL)presentingRemoteViewController
{
  return self->_presentingRemoteViewController;
}

- (void)setPresentingRemoteViewController:(BOOL)a3
{
  self->_presentingRemoteViewController = a3;
}

- (void)setShouldPresentRemoteViewController:(BOOL)a3
{
  self->_shouldPresentRemoteViewController = a3;
}

- (id)remoteViewReadyHandler
{
  return self->_remoteViewReadyHandler;
}

- (void)setRemoteViewReadyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)isRequestingRemoteViewController
{
  return self->_isRequestingRemoteViewController;
}

- (void)setIsRequestingRemoteViewController:(BOOL)a3
{
  self->_isRequestingRemoteViewController = a3;
}

- (BOOL)gkIsDisappearing
{
  return self->_gkIsDisappearing;
}

- (void)setGkIsDisappearing:(BOOL)a3
{
  self->_gkIsDisappearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteViewReadyHandler, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_game, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "init'd a GKHostedViewController", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)viewDidAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "APPEARED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_6(&dword_1AB361000, a1, a3, "Didn't get a remote view controller: %@", (uint8_t *)&v3);
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6(&dword_1AB361000, a2, a3, "Error getting a remote view controller: %@", (uint8_t *)&v3);
}

void __61__GKHostedViewController_requestRemoteViewControllerIfNeeded__block_invoke_56_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1AB361000, v0, OS_LOG_TYPE_ERROR, "requestRemoteViewControllerIfNeeded-> _beginDelayingPresentation timed out.We failed to present.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)dismissModalViewControllerAnimated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "DISMISSED (no completion handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dismissViewControllerAnimated:(void *)a1 completion:(const void *)a2 .cold.1(void *a1, const void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = _Block_copy(a2);
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_6(&dword_1AB361000, v3, v5, "DISMISSED (w completion handler %@)", (uint8_t *)&v6);

}

@end
