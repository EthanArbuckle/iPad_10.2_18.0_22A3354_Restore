@implementation GKTurnBasedMatchmakerViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)initWithMatchRequest:(GKMatchRequest *)request
{
  GKMatchRequest *v4;
  GKTurnBasedMatchmakerViewController *v5;
  uint64_t v6;
  GKMatchRequest *matchRequest;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = request;
  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMatchmakerViewController;
  v5 = -[GKTurnBasedMatchmakerViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[GKMatchRequest copy](v4, "copy");
    matchRequest = v5->_matchRequest;
    v5->_matchRequest = (GKMatchRequest *)v6;

    v5->_showExistingMatches = 1;
    -[GKTurnBasedMatchmakerViewController _setupChildViewController](v5, "_setupChildViewController");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D24EA8];
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel_authenticationChanged_, v9, v10);

    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerListener:", v5);

  }
  return v5;
}

- (void)player:(id)a3 receivedTurnEventForMatch:(id)a4 didBecomeActive:(BOOL)a5
{
  -[GKTurnBasedMatchmakerHostViewController refreshMatches](self->_remoteViewController, "refreshMatches", a3, a4, a5);
}

- (GKTurnBasedMatchmakerViewController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: must use one of the designated initializers"), self);

  return 0;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMatchmakerViewController dealloc", buf, 2u);
  }
  -[GKExtensionRemoteViewController cancelExtension](self->_remoteViewController, "cancelExtension");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchmakerViewController;
  -[GKTurnBasedMatchmakerViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKTurnBasedMatchmakerViewController;
  -[GKTurnBasedMatchmakerViewController loadView](&v2, sel_loadView);
}

- (void)_setupChildViewController
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__GKTurnBasedMatchmakerViewController__setupChildViewController__block_invoke;
  v5[3] = &unk_1E59C4148;
  v5[4] = self;
  -[GKTurnBasedMatchmakerViewController _gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:](self, "_gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:", 2, v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatchmakerViewController setAlertController:](self, "setAlertController:", v3);

  -[GKTurnBasedMatchmakerViewController alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[GKTurnBasedMatchmakerViewController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
    -[GKTurnBasedMatchmakerViewController setWantsFullScreenLayout:](self, "setWantsFullScreenLayout:", 1);
    -[GKTurnBasedMatchmakerViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
    if (!self->_remoteViewController)
      -[GKTurnBasedMatchmakerViewController _setupRemoteViewController](self, "_setupRemoteViewController");
  }
}

uint64_t __64__GKTurnBasedMatchmakerViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)_setupRemoteViewController
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  +[GKTurnBasedMatchmakerHostViewController turnBasedMatchmakerExtension](GKTurnBasedMatchmakerHostViewController, "turnBasedMatchmakerExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:withParentViewController:](GKExtensionRemoteViewController, "setupCallbackBlocksForExtension:withParentViewController:", v3, self);
    -[GKTurnBasedMatchmakerViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_15, 5.0);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_25;
    v4[3] = &unk_1E59C5A08;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:inputItems:completionHandler:](GKExtensionRemoteViewController, "viewControllerForExtension:inputItems:completionHandler:", v3, 0, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

}

uint64_t __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return a2 ^ 1u;
}

void __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_25(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = v7;
    objc_msgSend(WeakRetained, "setRemoteViewController:", v6);
    objc_msgSend(WeakRetained, "_updateViewControllerStackWithViewController:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionDidFinishWithError:", a3);
  }

}

- (void)extensionDidFinishWithError:(id)a3
{
  -[GKTurnBasedMatchmakerViewController finishWithError:](self, "finishWithError:", a3);
  -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", 0);
  -[GKTurnBasedMatchmakerViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
}

- (void)setRemoteViewController:(id)a3
{
  GKTurnBasedMatchmakerHostViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GKMatchRequest *matchRequest;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v5 = (GKTurnBasedMatchmakerHostViewController *)a3;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    -[GKTurnBasedMatchmakerViewController remoteViewController](self, "remoteViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    v7 = (void *)MEMORY[0x1E0C99E08];
    +[GKExtensionRemoteViewController initialItemsForExtension](GKExtensionRemoteViewController, "initialItemsForExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKTurnBasedMatchmakerViewController shouldShowPlayForTurnBasedMatch](self, "shouldShowPlayForTurnBasedMatch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("MatchesShowPlayForMatch"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKTurnBasedMatchmakerViewController shouldShowQuitForTurnBasedMatch](self, "shouldShowQuitForTurnBasedMatch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("MatchesShowQuitForMatch"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showExistingMatches);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("MatchesShowExistingMatches"));

    matchRequest = self->_matchRequest;
    if (matchRequest)
    {
      -[GKMatchRequest internal](matchRequest, "internal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("MatchesMatchRequestInternal"));

    }
    objc_initWeak(&location, self);
    -[GKTurnBasedMatchmakerViewController remoteViewController](self, "remoteViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke;
    v16[3] = &unk_1E59C5A30;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v15, "setInitialState:withReply:", v9, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

void __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke_2;
  block[3] = &unk_1E59C48A0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __63__GKTurnBasedMatchmakerViewController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endDelayingPresentation");

}

- (BOOL)shouldShowPlayForTurnBasedMatch
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventEmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "listenerRegisteredForSelector:", sel_player_receivedTurnEventForMatch_didBecomeActive_);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[GKTurnBasedMatchmakerViewController turnBasedMatchmakerDelegate](self, "turnBasedMatchmakerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

  }
  return v6 & 1;
}

- (BOOL)shouldShowQuitForTurnBasedMatch
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventEmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "listenerRegisteredForSelector:", sel_player_wantsToQuitMatch_);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[GKTurnBasedMatchmakerViewController turnBasedMatchmakerDelegate](self, "turnBasedMatchmakerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

  }
  return v6 & 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedMatchmakerViewController;
  -[GKTurnBasedMatchmakerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[GKTurnBasedMatchmakerViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAccessPoint");

  -[GKTurnBasedMatchmakerViewController remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[GKTurnBasedMatchmakerViewController _setupChildViewController](self, "_setupChildViewController");
    goto LABEL_7;
  }
  -[GKTurnBasedMatchmakerViewController alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[GKTurnBasedMatchmakerViewController viewControllers](self, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      goto LABEL_6;
    -[GKTurnBasedMatchmakerViewController remoteViewController](self, "remoteViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", v7);
  }

LABEL_6:
  -[GKTurnBasedMatchmakerViewController remoteViewController](self, "remoteViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

LABEL_7:
  v14.receiver = self;
  v14.super_class = (Class)GKTurnBasedMatchmakerViewController;
  -[GKTurnBasedMatchmakerViewController viewWillAppear:](&v14, sel_viewWillAppear_, v3);
  -[GKTurnBasedMatchmakerViewController matchRequest](self, "matchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isIncorrectlyInvitingPlayers");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 30, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchmakerViewController finishWithError:](self, "finishWithError:", v13);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedMatchmakerViewController;
  -[GKTurnBasedMatchmakerViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[GKTurnBasedMatchmakerViewController alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKTurnBasedMatchmakerViewController alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchmakerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, &__block_literal_global_45);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatchmakerViewController;
  -[GKTurnBasedMatchmakerViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", 0);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showAccessPoint");

  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMatchmakerVC viewDidDisappear: cancelExtension", v7, 2u);
  }
  -[GKExtensionRemoteViewController cancelExtension](self->_remoteViewController, "cancelExtension");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)setShowExistingMatches:(BOOL)showExistingMatches
{
  self->_showExistingMatches = showExistingMatches;
  -[GKTurnBasedMatchmakerHostViewController setShowExistingMatches:](self->_remoteViewController, "setShowExistingMatches:");
}

- (void)cancel
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[GKTurnBasedMatchmakerViewController turnBasedMatchmakerDelegate](self, "turnBasedMatchmakerDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedMatchmakerViewControllerWasCancelled:", self);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[GKTurnBasedMatchmakerViewController turnBasedMatchmakerDelegate](self, "turnBasedMatchmakerDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "turnBasedMatchmakerViewController:didFailWithError:", self, v5);

}

- (void)finishWithMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[GKTurnBasedMatchmakerViewController turnBasedMatchmakerDelegate](self, "turnBasedMatchmakerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "turnBasedMatchmakerViewController:didFindMatch:", self, v4);
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x1E0D25448];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKTurnBasedMatchmakerViewController finishWithMatch:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__GKTurnBasedMatchmakerViewController_finishWithMatch___block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "eventEmitter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "player:receivedTurnEventForMatch:didBecomeActive:", v16, v4, 1);

}

uint64_t __55__GKTurnBasedMatchmakerViewController_finishWithMatch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)playerQuitMatch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[GKTurnBasedMatchmakerViewController turnBasedMatchmakerDelegate](self, "turnBasedMatchmakerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "turnBasedMatchmakerViewController:playerQuitForMatch:", self, v7);
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventEmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player:wantsToQuitMatch:", v5, v7);

}

- (void)authenticationChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D24EB0]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAuthenticated") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v10);

    if ((v9 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  -[GKTurnBasedMatchmakerViewController cancel](self, "cancel");
LABEL_6:

}

- (id)turnBasedMatchmakerDelegate
{
  return objc_loadWeakRetained((id *)&self->turnBasedMatchmakerDelegate);
}

- (void)setTurnBasedMatchmakerDelegate:(id)turnBasedMatchmakerDelegate
{
  objc_storeWeak((id *)&self->turnBasedMatchmakerDelegate, turnBasedMatchmakerDelegate);
}

- (GKTurnBasedMatchmakerHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_matchRequest, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (BOOL)showExistingMatches
{
  return self->_showExistingMatches;
}

- (GKMatchmakingMode)matchmakingMode
{
  return self->_matchmakingMode;
}

- (void)setMatchmakingMode:(GKMatchmakingMode)matchmakingMode
{
  self->_matchmakingMode = matchmakingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->turnBasedMatchmakerDelegate);
}

void __65__GKTurnBasedMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "We failed to present Game Center matchmaker extension.", a5, a6, a7, a8, 0);
}

- (void)finishWithMatch:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "<Info>: Auto-dismissing GKTurnBasedMatchmakerViewController after match became active because GKTurnBasedMatchmakerViewControllerDelegate does not implement 'turnBasedMatchmakerViewController:didFindMatch:'", a5, a6, a7, a8, 0);
}

@end
