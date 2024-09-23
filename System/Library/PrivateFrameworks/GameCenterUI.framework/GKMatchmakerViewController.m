@implementation GKMatchmakerViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)matchmaker
{
  return (id)objc_msgSend(MEMORY[0x1E0D25350], "sharedMatchmaker");
}

- (id)initWithMatchRequest:(GKMatchRequest *)request
{
  GKMatchRequest *v4;
  void *v5;
  GKMatchmakerViewController *v6;
  uint64_t v7;
  GKMatchRequest *matchRequest;
  NSMutableArray *v9;
  NSMutableArray *hostedPlayers;
  GKMatchRequest *v11;
  void *v12;
  objc_super v14;

  v4 = request;
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:reportable:", *MEMORY[0x1E0D250C8], v4);

  v14.receiver = self;
  v14.super_class = (Class)GKMatchmakerViewController;
  v6 = -[GKMatchmakerViewController init](&v14, sel_init);
  if (v6)
  {
    v7 = -[GKMatchRequest copy](v4, "copy");
    matchRequest = v6->_matchRequest;
    v6->_matchRequest = (GKMatchRequest *)v7;

    if (-[GKMatchRequest restrictToAutomatch](v4, "restrictToAutomatch"))
      v6->_matchmakingMode = 2;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hostedPlayers = v6->_hostedPlayers;
    v6->_hostedPlayers = v9;

    -[GKMatchmakerViewController setupNotifications](v6, "setupNotifications");
    -[GKMatchmakerViewController _setupChildViewController](v6, "_setupChildViewController");
    v11 = v6->_matchRequest;
    -[GKMatchmakerViewController matchmaker](v6, "matchmaker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentMatchRequest:", v11);

  }
  return v6;
}

- (id)initWithInvite:(GKInvite *)invite
{
  GKInvite *v4;
  GKMatchmakerViewController *v5;
  GKMatchmakerViewController *v6;
  objc_super v8;

  v4 = invite;
  v8.receiver = self;
  v8.super_class = (Class)GKMatchmakerViewController;
  v5 = -[GKMatchmakerViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKMatchmakerViewController setAcceptedInvite:](v5, "setAcceptedInvite:", v4);
    -[GKMatchmakerViewController setHosted:](v6, "setHosted:", -[GKInvite isHosted](v4, "isHosted"));
    -[GKMatchmakerViewController setupNotifications](v6, "setupNotifications");
    -[GKMatchmakerViewController _setupChildViewController](v6, "_setupChildViewController");
  }

  return v6;
}

- (GKMatchmakerViewController)initWithPlayerPickerDelegate:(id)a3 andPlayerPickerContext:(id)a4
{
  id v6;
  id v7;
  GKMatchmakerViewController *v8;
  GKMatchmakerViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKMatchmakerViewController;
  v8 = -[GKMatchmakerViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_internalPlayerPickerDelegate, v6);
    objc_storeStrong((id *)&v9->_playerPickerContext, a4);
    -[GKMatchmakerViewController _setupChildViewController](v9, "_setupChildViewController");
  }

  return v9;
}

- (GKMatchmakerViewController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: must use one of the designated initializers"), self);

  return 0;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "GKMatchmakerViewController dealloc", buf, 2u);
  }
  -[GKExtensionRemoteViewController cancelExtension](self->_remoteViewController, "cancelExtension");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[GKMatchmakerViewController playerPickerContext](self, "playerPickerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[GKMatchmakerViewController matchmaker](self, "matchmaker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

  }
  v8.receiver = self;
  v8.super_class = (Class)GKMatchmakerViewController;
  -[GKMatchmakerViewController dealloc](&v8, sel_dealloc);
}

- (void)setupNotifications
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D24B08];
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_localPlayerAcceptedGameInvite_, v3, v4);

  v5 = *MEMORY[0x1E0D24F30];
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_playersToInvite_, v5, v6);

  v7 = *MEMORY[0x1E0D24EA8];
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_authenticationChanged_, v7, v8);

  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_inviteSharePlayPlayer_, *MEMORY[0x1E0D24D38], 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_sharePlayEligibilityChanged_, *MEMORY[0x1E0D24D30], 0);

}

- (void)_setupChildViewController
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__GKMatchmakerViewController__setupChildViewController__block_invoke;
  v5[3] = &unk_1E59C4148;
  v5[4] = self;
  -[GKMatchmakerViewController _gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:](self, "_gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:", 2, v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerViewController setAlertController:](self, "setAlertController:", v3);

  -[GKMatchmakerViewController alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[GKMatchmakerViewController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
    -[GKMatchmakerViewController setWantsFullScreenLayout:](self, "setWantsFullScreenLayout:", 1);
    -[GKMatchmakerViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
    -[GKMatchmakerViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 2);
    if (!self->_remoteViewController)
      -[GKMatchmakerViewController _setupRemoteViewController](self, "_setupRemoteViewController");
  }
}

uint64_t __55__GKMatchmakerViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)_setupRemoteViewController
{
  void *v3;
  _QWORD v4[5];

  +[GKMatchmakerHostViewController matchmakerExtension](GKMatchmakerHostViewController, "matchmakerExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:withParentViewController:](GKExtensionRemoteViewController, "setupCallbackBlocksForExtension:withParentViewController:", v3, self);
    -[GKMatchmakerViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_35, 5.0);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_36;
    v4[3] = &unk_1E59C7448;
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:inputItems:completionHandler:](GKExtensionRemoteViewController, "viewControllerForExtension:inputItems:completionHandler:", v3, 0, v4);
  }

}

uint64_t __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1();
  }
  return a2 ^ 1u;
}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    if (!*MEMORY[0x1E0D25460])
      v8 = (id)GKOSLoggers();
    v9 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      v18 = v7;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_1AB361000, v9, OS_LOG_TYPE_INFO, "Setting remoteViewController[%p] for GKMatchmakerViewController[%p]", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerStackWithViewController:", v7);
    v11 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKMatchmakerViewController_iOS.m", 216, "-[GKMatchmakerViewController _setupRemoteViewController]_block_invoke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchGroupWithName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_2;
    v16[3] = &unk_1E59C4A28;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "perform:", v16);
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_45;
    v15[3] = &unk_1E59C4148;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionDidFinishWithError:", v6);
  }

}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplayerService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "acceptedInvite");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_3;
  v9[3] = &unk_1E59C5BA0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v8 = v3;
  objc_msgSend(v5, "hasCanceledMultiplayerInitiateBulletinForSessionToken:handler:", v7, v9);

}

uint64_t __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_3(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "the acceptedInvite is canceled, need to dismiss the extension. set inviterCancelNotificaitonReceived = YES", v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setInviterCancelNotificaitonReceived:", 1);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_45(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(a1 + 32), "inviterCancelNotificaitonReceived"))
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inviterCancelled");

    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "GKMatchmakterViewController: inviterCancelledNotification - Invite Cancelled", v5, 2u);
    }
  }
}

- (void)extensionDidFinishWithError:(id)a3
{
  -[GKMatchmakerViewController finishWithError:](self, "finishWithError:", a3);
  -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", 0);
  -[GKMatchmakerViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
}

- (void)setRemoteViewController:(id)a3
{
  GKMatchmakerHostViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  GKMatchRequest *matchRequest;
  void *v21;
  GKInvite *acceptedInvite;
  void *v23;
  GKMatch *match;
  void *v25;
  void *v26;
  GKMatchmakerHostViewController *remoteViewController;
  GKMatchmakerViewController *v28;
  _QWORD v29[5];

  v5 = (GKMatchmakerHostViewController *)a3;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    -[GKMatchmakerViewController remoteViewController](self, "remoteViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    v7 = (void *)MEMORY[0x1E0C99E08];
    +[GKExtensionRemoteViewController initialItemsForExtension](GKExtensionRemoteViewController, "initialItemsForExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hosted);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("MatchesHosted"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_matchmakingMode);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("MatchesMatchmakingMode"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canStartWithMinimumPlayers);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("MatchesFastStartEnabled"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[GKMatchmakerViewController matchmaker](self, "matchmaker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isEligibleForGroupSession"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("MatchesGroupSessionEligible"));

    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[GKMatchmakerViewController matchmaker](self, "matchmaker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isEntitledToUseGroupActivities"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("EntitledToGroupActivities"));

    -[GKMatchmakerViewController playerPickerContext](self, "playerPickerContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("playerPickerContext"));

    matchRequest = self->_matchRequest;
    if (matchRequest)
    {
      -[GKMatchRequest internal](matchRequest, "internal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("MatchesMatchRequestInternal"));

    }
    acceptedInvite = self->_acceptedInvite;
    if (acceptedInvite)
    {
      -[GKInvite internal](acceptedInvite, "internal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("MatchesAcceptedInviteInternal"));

    }
    match = self->_match;
    if (match)
    {
      -[GKMatch players](match, "players");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_gkMapWithBlock:", &__block_literal_global_52_0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("PlayerInternalsKey"));
    }
    remoteViewController = self->_remoteViewController;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_2;
    v29[3] = &unk_1E59C4430;
    v29[4] = self;
    v28 = self;
    -[GKExtensionRemoteViewController setInitialState:withReply:](remoteViewController, "setInitialState:withReply:", v9, v29);

  }
}

uint64_t __54__GKMatchmakerViewController_setRemoteViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "internal");
}

void __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_3;
  block[3] = &unk_1E59C4148;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__GKMatchmakerViewController_setRemoteViewController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
}

- (void)viewDidLoad
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1AB361000, v0, v1, "<Warning>: matchmakerDelegate not found for GKMatchmakerViewController instance: %{public}p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
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
  GKInvite *acceptedInvite;
  void *v12;
  int v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAccessPoint");

  -[GKMatchmakerViewController remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GKMatchmakerViewController alertController](self, "alertController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[GKMatchmakerViewController viewControllers](self, "viewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
        goto LABEL_5;
      -[GKMatchmakerViewController remoteViewController](self, "remoteViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _updateViewControllerStackWithViewController:](self, "_updateViewControllerStackWithViewController:", v7);
    }

LABEL_5:
    -[GKMatchmakerViewController remoteViewController](self, "remoteViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

  }
  v15.receiver = self;
  v15.super_class = (Class)GKMatchmakerViewController;
  -[GKMatchmakerViewController viewWillAppear:](&v15, sel_viewWillAppear_, v3);
  acceptedInvite = self->_acceptedInvite;
  if (acceptedInvite && !-[GKInvite isHosted](acceptedInvite, "isHosted"))
  {
    -[GKMatchmakerViewController createMatchForAcceptedInvite](self, "createMatchForAcceptedInvite");
  }
  else
  {
    -[GKMatchmakerViewController matchRequest](self, "matchRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isIncorrectlyInvitingPlayers");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 30, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatchmakerViewController finishWithError:](self, "finishWithError:", v14);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKMatchmakerViewController;
  -[GKMatchmakerViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[GKMatchmakerViewController alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKMatchmakerViewController alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmakerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, &__block_literal_global_62);

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
  v8.super_class = (Class)GKMatchmakerViewController;
  -[GKMatchmakerViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
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
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "GKMatchmakerVC viewDidDisappear: cancelExtension", v7, 2u);
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

- (void)setHosted:(BOOL)hosted
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = hosted;
  self->_hosted = hosted;
  -[GKMatchmakerHostViewController setHosted:](self->_remoteViewController, "setHosted:");
  -[GKMatchmakerViewController matchRequest](self, "matchRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMatchType:", v3);

}

- (void)setMatchmakingMode:(GKMatchmakingMode)matchmakingMode
{
  void *v5;
  char v6;
  GKMatchRequest *matchRequest;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;

  self->_matchmakingMode = matchmakingMode;
  if (matchmakingMode == GKMatchmakingModeNearbyOnly)
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldAllowNearbyMultiplayer");

    if ((v6 & 1) != 0)
    {
      matchRequest = self->_matchRequest;
      if (!matchRequest || !-[GKMatchRequest restrictToAutomatch](matchRequest, "restrictToAutomatch"))
        goto LABEL_5;
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("unable to set nearby only when restrictToAutomatch of the match request has been set to YES.");
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("unable to set nearby only due to player restrictions");
    }
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
LABEL_5:
  -[GKMatchmakerHostViewController setMatchmakingMode:](self->_remoteViewController, "setMatchmakingMode:", matchmakingMode);
}

- (void)setHostedPlayer:(GKPlayer *)player didConnect:(BOOL)connected
{
  _BOOL8 v4;
  GKMatchmakerHostViewController *remoteViewController;
  id v6;

  v4 = connected;
  remoteViewController = self->_remoteViewController;
  -[GKPlayer internal](player, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerHostViewController setPlayer:connected:](remoteViewController, "setPlayer:connected:", v6, v4);

}

- (void)setHostedPlayer:(NSString *)playerID connected:(BOOL)connected
{
  _BOOL8 v4;
  NSString *v6;
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

  v4 = connected;
  v6 = playerID;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x1E0D25448];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKMatchmakerViewController setHostedPlayer:connected:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253A8], "internalRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlayerID:", v6);
    -[GKMatchmakerHostViewController setPlayer:connected:](self->_remoteViewController, "setPlayer:connected:", v16, v4);

  }
}

- (void)setCanStartWithMinimumPlayers:(BOOL)canStartWithMinimumPlayers
{
  self->_canStartWithMinimumPlayers = canStartWithMinimumPlayers;
  -[GKMatchmakerHostViewController setCanStartWithMinimumPlayers:](self->_remoteViewController, "setCanStartWithMinimumPlayers:");
}

- (void)addPlayersToMatch:(GKMatch *)match
{
  GKMatch *v5;
  void *v6;
  void *v7;
  GKMatchmakerHostViewController *remoteViewController;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_match, match);
  v5 = match;
  -[GKMatchmakerViewController match](self, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInviteDelegate:", self);

  -[GKMatchmakerViewController match](self, "match");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFastStartStateActive:", 0);

  remoteViewController = self->_remoteViewController;
  -[GKMatch players](v5, "players");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_gkMapWithBlock:", &__block_literal_global_75);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerHostViewController setExistingPlayers:](remoteViewController, "setExistingPlayers:", v9);

}

uint64_t __48__GKMatchmakerViewController_addPlayersToMatch___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "internal");
}

- (void)setDefaultInvitationMessage:(NSString *)defaultInvitationMessage
{
  GKMatchRequest *matchRequest;
  NSString *v5;
  id v6;

  if (defaultInvitationMessage)
  {
    matchRequest = self->_matchRequest;
    if (matchRequest)
    {
      v5 = defaultInvitationMessage;
      -[GKMatchRequest setInviteMessage:](matchRequest, "setInviteMessage:", v5);
      -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDefaultInvitationMessage:", v5);

    }
  }
}

- (NSString)defaultInvitationMessage
{
  return -[GKMatchRequest inviteMessage](self->_matchRequest, "inviteMessage");
}

- (void)setHostedPlayerReady:(NSString *)playerID
{
  NSString *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = playerID;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!*MEMORY[0x1E0D25460])
      v5 = (id)GKOSLoggers();
    v6 = *MEMORY[0x1E0D25448];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
      -[GKMatchmakerViewController setHostedPlayerReady:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    -[GKMatchmakerViewController setHostedPlayer:connected:](self, "setHostedPlayer:connected:", v4, 1);
  }

}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "<Warning>: matchmakerViewControllerWasCancelled: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cancelWithoutNotifyingDelegate
{
  void *v3;
  void *v4;
  void *v5;
  GKMatch *match;
  void *v7;
  int v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopBrowsingForNearbyPlayers");

  -[GKMatchRequest setRecipientResponseHandler:](self->_matchRequest, "setRecipientResponseHandler:", 0);
  match = self->_match;
  if (match)
  {
    v8 = 5;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v8, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch sendInviteData:](match, "sendInviteData:", v7);

    -[GKMatch setInviteDelegate:](self->_match, "setInviteDelegate:", 0);
    -[GKMatchmakerViewController setMatch:](self, "setMatch:", 0);
  }
}

- (OS_dispatch_queue)cancellingQueue
{
  if (cancellingQueue_onceToken != -1)
    dispatch_once(&cancellingQueue_onceToken, &__block_literal_global_81);
  return (OS_dispatch_queue *)(id)cancellingQueue_sCancellingQueue;
}

void __45__GKMatchmakerViewController_cancellingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.gamecenter.matchmakerviewcontroller.cancelqueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)cancellingQueue_sCancellingQueue;
  cancellingQueue_sCancellingQueue = (uint64_t)v0;

}

- (OS_dispatch_queue)invitationQueue
{
  if (invitationQueue_onceTokenForInvitationQueue != -1)
    dispatch_once(&invitationQueue_onceTokenForInvitationQueue, &__block_literal_global_83);
  return (OS_dispatch_queue *)(id)invitationQueue_sInvitationQueue;
}

void __45__GKMatchmakerViewController_invitationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.gamecenter.matchmakerviewcontroller.invitationQueue", v2);
  v1 = (void *)invitationQueue_sInvitationQueue;
  invitationQueue_sInvitationQueue = (uint64_t)v0;

}

- (BOOL)userCancelledMatching
{
  GKMatchmakerViewController *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[GKMatchmakerViewController cancellingQueue](self, "cancellingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__GKMatchmakerViewController_userCancelledMatching__block_invoke;
  v5[3] = &unk_1E59C6828;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __51__GKMatchmakerViewController_userCancelledMatching__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1408);
  return result;
}

- (void)setUserCancelledMatching:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[GKMatchmakerViewController cancellingQueue](self, "cancellingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__GKMatchmakerViewController_setUserCancelledMatching___block_invoke;
  v6[3] = &unk_1E59C5278;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

uint64_t __55__GKMatchmakerViewController_setUserCancelledMatching___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1408) = *(_BYTE *)(result + 40);
  return result;
}

- (void)cancelMatching
{
  _QWORD *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "GKMatchmakerViewController: cancelMatching", buf, 2u);
  }
  -[GKMatchmakerViewController setUserCancelledMatching:](self, "setUserCancelledMatching:", 1);
  if (!*v3)
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "userCancelledMatching, set shared matchmaker matching to NO", v10, 2u);
  }
  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userCancelledMatching");

  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

}

- (void)finishWithError:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GKMatch *match;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "GKMatchmakerViewController finish with error: %@", buf, 0xCu);
  }
  if (!-[GKMatchmakerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

    -[GKMatchmakerViewController matchmaker](self, "matchmaker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancel");

    -[GKMatchmakerViewController matchmaker](self, "matchmaker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopBrowsingForNearbyPlayers");

    -[GKMatchRequest setRecipientResponseHandler:](self->_matchRequest, "setRecipientResponseHandler:", 0);
  }
  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
  {
    objc_msgSend(v11, "endGroupActivity");

    -[GKMatchmakerViewController match](self, "match");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInviteDelegate:", 0);

    -[GKMatchmakerViewController matchmaker](self, "matchmaker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "promptForRadarWithDescriptionAddition:", v15);

    match = self->_match;
    self->_match = 0;

    -[GKMatchmakerViewController matchmakerDelegate](self, "matchmakerDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v17, "matchmakerViewController:didFailWithError:", self, v4);
      }
      else
      {
        if (!*v5)
          v19 = (id)GKOSLoggers();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
          -[GKMatchmakerViewController finishWithError:].cold.2();
      }
    }
    else
    {
      if (!*v5)
        v18 = (id)GKOSLoggers();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
        -[GKMatchmakerViewController finishWithError:].cold.1();
    }
    objc_msgSend(v4, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D24C28]);

    if (v21 && objc_msgSend(v4, "code") == 35)
    {
      objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "utilityService");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "openICloudSettings");

    }
  }
  else
  {
    objc_msgSend(v11, "resetGroupActivity");

    if (self->_hosted)
    {
      -[GKMatchmakerViewController finishWithPlayers](self, "finishWithPlayers");
    }
    else
    {
      -[GKMatchmakerViewController finishWithMatch](self, "finishWithMatch");
      -[GKMatch setFastStartStateActive:](self->_match, "setFastStartStateActive:", -[GKMatchmakerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers"));
    }
  }

}

- (void)finishWithMatch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "<Warning>: matchmakerViewController:didFindMatch: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finishWithPlayers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "<Warning>: matchmakerViewController:didFindHostedPlayers: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

id __47__GKMatchmakerViewController_finishWithPlayers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)playerPickerDidPickPlayers:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "_gkPlayersFromInternals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "Client - player picker - didPickPlayers: %@", (uint8_t *)&v8, 0xCu);
  }
  -[GKMatchmakerViewController internalPlayerPickerDelegate](self, "internalPlayerPickerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalPlayerPickerDidPickPlayers:", v4);

}

- (void)playerPickerDidCancel
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "Client - player picker - playerPickerDidCancel, didCancel", v6, 2u);
  }
  -[GKMatchmakerViewController internalPlayerPickerDelegate](self, "internalPlayerPickerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalPlayerPickerDidCancel");

}

- (void)createMatchForAcceptedInvite
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordInviteeUILaunchTimestamp");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke;
  v4[3] = &unk_1E59C4148;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0D25260], "named:execute:", CFSTR("createMatchForAcceptedInvite"), v4);
}

void __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "matchmaker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "acceptedInvite");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2;
  v4[3] = &unk_1E59C7550;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "matchForInvite:completionHandler:", v3, v4);

}

void __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMatch:", v5);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "match");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInviteDelegate:", v8);

  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v10 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2_cold_1();
  }

}

- (void)shareMatchWithRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GKMatch *match;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    -[GKMatchmakerViewController match](self, "match");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[GKMatchmakerViewController matchmaker](self, "matchmaker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "newMatch");
      -[GKMatchmakerViewController setMatch:](self, "setMatch:", v10);

      -[GKMatchmakerViewController match](self, "match");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setInviteDelegate:", self);

    }
    -[GKMatchmakerViewController matchmaker](self, "matchmaker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    match = self->_match;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__GKMatchmakerViewController_shareMatchWithRequest_handler___block_invoke;
    v14[3] = &unk_1E59C7578;
    v15 = v6;
    objc_msgSend(v12, "loadURLForMatch:matchRequest:completionHandler:", match, v7, v14);

  }
}

uint64_t __60__GKMatchmakerViewController_shareMatchWithRequest_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setShareInvitees:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;

  v4 = a3;
  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerViewController match](self, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShareInvitees:forMatch:propagateToDaemon:", v4, v6, 1);

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v9, &location);
  -[GKMatchmakerViewController matchmaker](self, "matchmaker", v8, 3221225472, __47__GKMatchmakerViewController_setShareInvitees___block_invoke, &unk_1E59C75A0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecipientResponseHandler:", &v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __47__GKMatchmakerViewController_setShareInvitees___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "invitedPlayer:responded:", v5, a3);

}

- (void)startMatchingWithRequest:(id)a3 devicePushToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  GKMatchmakerViewController *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v9 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v10 = (id)GKOSLoggers();
  v11 = (os_log_t *)MEMORY[0x1E0D25470];
  v12 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_1AB361000, v12, OS_LOG_TYPE_INFO, "GKMatchmakerVC start matching with request: %@, pushToken: %@. UUID: %@", buf, 0x20u);
  }
  -[GKMatchmakerViewController invitationGroup](self, "invitationGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (!*v9)
      v14 = (id)GKOSLoggers();
    v15 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "Creating invitation group for matchmakerVC. UUID: %@", buf, 0xCu);
    }
    v16 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKMatchmakerViewController_iOS.m", 713, "-[GKMatchmakerViewController startMatchingWithRequest:devicePushToken:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dispatchGroupWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmakerViewController setInvitationGroup:](self, "setInvitationGroup:", v18);

  }
  -[GKMatchmakerViewController invitationQueue](self, "invitationQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke;
  block[3] = &unk_1E59C7108;
  v24 = v8;
  v25 = v6;
  v26 = self;
  v27 = v7;
  v20 = v7;
  v21 = v6;
  v22 = v8;
  dispatch_async(v19, block);

}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  os_log_t *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = (os_log_t *)MEMORY[0x1E0D25470];
  v5 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "GKMatchmakerVC entered async queue. UUID: %@", buf, 0xCu);
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25340]), "initWithInternalRepresentation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setMatchRequest:", v7);
  objc_msgSend(*(id *)(a1 + 48), "setUserCancelledMatching:", 0);
  objc_msgSend(*(id *)(a1 + 48), "invitationGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_106;
  v19 = &unk_1E59C4D58;
  v20 = *(id *)(a1 + 32);
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v21 = v9;
  v22 = v10;
  v23 = v11;
  objc_msgSend(v8, "perform:", &v16);

  objc_msgSend(*(id *)(a1 + 48), "invitationGroup", v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "waitWithTimeout:", 2.0);

  if (!*v2)
    v13 = (id)GKOSLoggers();
  v14 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_impl(&dword_1AB361000, v14, OS_LOG_TYPE_INFO, "After invitation group wait or timeout. UUID: %@", buf, 0xCu);
  }

}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "Performed invitation group. UUID: %@", buf, 0xCu);
  }
  v7 = (void *)MEMORY[0x1E0D25260];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKMatchmakerViewController_iOS.m", 725, "-[GKMatchmakerViewController startMatchingWithRequest:devicePushToken:]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2;
  v12[3] = &unk_1E59C76B8;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v13 = v9;
  v14 = v10;
  v15 = *(id *)(a1 + 32);
  v17 = v3;
  v16 = *(id *)(a1 + 56);
  v11 = v3;
  objc_msgSend(v7, "named:execute:", v8, v12);

}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id *v23;
  id v24;
  id *v25;
  id *v26;
  id *v27;
  id v28;
  void *v29;
  _QWORD *v30;
  os_log_t *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  os_log_t v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  os_log_t v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  int8x16_t v50;
  int8x16_t v51;
  _QWORD v52[4];
  int8x16_t v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  _QWORD v58[4];
  int8x16_t v59;
  id v60;
  void *v61;
  _QWORD v62[2];
  BOOL v63;
  _QWORD aBlock[5];
  BOOL v65;
  _QWORD v66[5];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "removeLocalPlayerFromPlayersToInvite");
  objc_msgSend(a1[4], "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkNonGuestPlayersFromPlayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = v4 != 0;

  v6 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_3;
    v66[3] = &unk_1E59C75C8;
    v7 = a1[4];
    v66[4] = a1[5];
    objc_msgSend(v7, "setRecipientResponseHandler:", v66);
  }
  aBlock[0] = v6;
  aBlock[1] = 3221225472;
  aBlock[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_4;
  aBlock[3] = &unk_1E59C75F0;
  v65 = v4 != 0;
  aBlock[4] = a1[5];
  v8 = _Block_copy(aBlock);
  v9 = objc_msgSend(a1[5], "isHosted");
  v10 = a1[5];
  if (v9)
  {
    objc_msgSend(v10, "hostedPlayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    objc_msgSend(a1[5], "hostedPlayers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    if (!*MEMORY[0x1E0D25460])
      v16 = (id)GKOSLoggers();
    v17 = v12 + (v15 ^ 1u);
    v18 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      v19 = a1[5];
      v20 = v18;
      objc_msgSend(v19, "hostedPlayers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v68 = v21;
      _os_log_impl(&dword_1AB361000, v20, OS_LOG_TYPE_INFO, "Adding players for Hosted Match Request: %@", buf, 0xCu);

    }
    v22 = (void *)MEMORY[0x1E0D25260];
    v58[0] = v6;
    v58[1] = 3221225472;
    v58[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_110;
    v58[3] = &unk_1E59C7640;
    v23 = (id *)&v59.i64[1];
    v50 = *((int8x16_t *)a1 + 2);
    v24 = (id)v50.i64[0];
    v59 = vextq_s8(v50, v50, 8uLL);
    v25 = &v61;
    v62[1] = v17;
    v61 = v8;
    v63 = v5;
    v26 = &v60;
    v60 = a1[6];
    v27 = (id *)v62;
    v62[0] = a1[8];
    v28 = v8;
    objc_msgSend(v22, "named:execute:", CFSTR("Adding Players for Hosted Match Request"), v58);
  }
  else
  {
    objc_msgSend(v10, "match");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (_QWORD *)MEMORY[0x1E0D25460];
    v31 = (os_log_t *)MEMORY[0x1E0D25470];
    if (!v29)
    {
      objc_msgSend(a1[5], "matchmaker");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "newMatch");
      objc_msgSend(a1[5], "setMatch:", v33);

      v34 = a1[5];
      objc_msgSend(v34, "match");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setInviteDelegate:", v34);

      if (!*v30)
        v36 = (id)GKOSLoggers();
      v37 = *v31;
      if (os_log_type_enabled(*v31, OS_LOG_TYPE_INFO))
      {
        v38 = a1[5];
        v39 = v37;
        objc_msgSend(v38, "match");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = a1[6];
        *(_DWORD *)buf = 138412546;
        v68 = v40;
        v69 = 2112;
        v70 = v41;
        _os_log_impl(&dword_1AB361000, v39, OS_LOG_TYPE_INFO, "Created a new GKMatch: %@. UUID: %@", buf, 0x16u);

      }
    }
    if (!*v30)
      v42 = (id)GKOSLoggers();
    v43 = *v31;
    if (os_log_type_enabled(*v31, OS_LOG_TYPE_INFO))
    {
      v44 = a1[5];
      v45 = v43;
      objc_msgSend(v44, "match");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v68 = v46;
      _os_log_impl(&dword_1AB361000, v45, OS_LOG_TYPE_INFO, "Adding players to Match: %@", buf, 0xCu);

    }
    v47 = (void *)MEMORY[0x1E0D25260];
    v52[0] = v6;
    v52[1] = 3221225472;
    v52[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_115;
    v52[3] = &unk_1E59C7690;
    v23 = (id *)&v53.i64[1];
    v51 = *((int8x16_t *)a1 + 2);
    v48 = (id)v51.i64[0];
    v53 = vextq_s8(v51, v51, 8uLL);
    v25 = &v54;
    v26 = &v56;
    v54 = a1[7];
    v56 = v8;
    v27 = &v55;
    v55 = a1[6];
    v57 = a1[8];
    v49 = v8;
    objc_msgSend(v47, "named:execute:", CFSTR("Add Players To Match"), v52);

  }
}

uint64_t __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "invitedPlayer:responded:", a2, a3);
}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_4(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
    objc_msgSend(v5, "setInvitesFailedWithError:", v4);
  else
    objc_msgSend(v5, "setAutomatchFailedWithError:", v4);

}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_110(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  char v11;

  objc_msgSend(*(id *)(a1 + 32), "matchmaker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_111;
  v7[3] = &unk_1E59C7618;
  v5 = *(id *)(a1 + 56);
  v11 = *(_BYTE *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7[4] = v6;
  v8 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "addPlayersForHostedMatchRequest:existingPlayerCount:completionHandler:", v3, v4, v7);

}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (!*(_BYTE *)(a1 + 64))
  {
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(*(id *)(a1 + 32), "hostedPlayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v5);

    objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutomatchPlayerCount:", v7);

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "finishWithPlayers");
  }
  if (!*MEMORY[0x1E0D25460])
    v10 = (id)GKOSLoggers();
  v11 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1AB361000, v11, OS_LOG_TYPE_INFO, "Done invitation group from addPlayersForHosted. UUID: %@", (uint8_t *)&v13, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_115(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "matchmaker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "match");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_116;
  v6[3] = &unk_1E59C7668;
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "addPlayersToMatch:matchRequest:devicePushToken:completionHandler:", v3, v5, v4, v6);

}

void __71__GKMatchmakerViewController_startMatchingWithRequest_devicePushToken___block_invoke_2_116(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "userCancelledMatching"))
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "setUserCancelledMatching:", 0);
  }
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "match");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promptRadarAndRequestRemoteLogsWithDescriptionAddition:", v5);

  }
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "Done invitation group from addPlayersToMatch. UUID: %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)cancelPendingInviteToPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D25260];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKMatchmakerViewController_iOS.m", 804, "-[GKMatchmakerViewController cancelPendingInviteToPlayer:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__GKMatchmakerViewController_cancelPendingInviteToPlayer___block_invoke;
  v8[3] = &unk_1E59C4708;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "named:execute:", v6, v8);

}

void __58__GKMatchmakerViewController_cancelPendingInviteToPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "matchmaker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPendingInviteToPlayer:", v2);

}

- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject **v11;
  NSObject *v12;
  id v13;
  GKMatchmakerHostViewController *remoteViewController;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (NSObject **)MEMORY[0x1E0D25460];
  v12 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v13 = (id)GKOSLoggers();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1AB361000, v12, OS_LOG_TYPE_DEFAULT, "groupActivityJoiningPlayer player: %@, participantID: %@", (uint8_t *)&v16, 0x16u);
  }
  remoteViewController = self->_remoteViewController;
  objc_msgSend(v8, "internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerHostViewController groupActivityJoiningPlayer:devicePushToken:participantServerIdentifier:](remoteViewController, "groupActivityJoiningPlayer:devicePushToken:participantServerIdentifier:", v15, v9, v10);

}

- (void)invitedPlayer:(id)a3 responded:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  NSObject *v9;
  id v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  GKMatchmakerHostViewController *remoteViewController;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1AB361000, v9, OS_LOG_TYPE_INFO, "GKMatchMakerViewController: invitedPlayer: responded:", (uint8_t *)&v25, 2u);
  }
  if (!*v7)
    v10 = (id)GKOSLoggers();
  v11 = (os_log_t *)MEMORY[0x1E0D25470];
  v12 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v6, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_1AB361000, v13, OS_LOG_TYPE_INFO, "Invited player: %@ responded: %@", (uint8_t *)&v25, 0x16u);

  }
  if (!a4 && self->_hosted)
  {
    if (!*v7)
      v17 = (id)GKOSLoggers();
    v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1AB361000, v18, OS_LOG_TYPE_INFO, "    ---> GKInviteeResponseAccepted", (uint8_t *)&v25, 2u);
    }
    -[NSMutableArray addObject:](self->_hostedPlayers, "addObject:", v6);
    -[GKMatchmakerViewController matchmakerDelegate](self, "matchmakerDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v19, "matchmakerViewController:hostedPlayerDidAccept:", self, v6);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "internal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "playerID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "matchmakerViewController:didReceiveAcceptFromHostedPlayer:", self, v21);

    }
    else
    {
      if (!*v7)
        v22 = (id)GKOSLoggers();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25448], OS_LOG_TYPE_ERROR))
        -[GKMatchmakerViewController invitedPlayer:responded:].cold.1();
    }

  }
  remoteViewController = self->_remoteViewController;
  objc_msgSend(v6, "internal");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerHostViewController setPlayer:responded:](remoteViewController, "setPlayer:responded:", v24, a4);

}

- (void)match:(id)a3 didFailWithError:(id)a4
{
  -[GKMatchmakerViewController finishWithError:](self, "finishWithError:", a4);
}

- (void)match:(id)a3 didReceiveData:(id)a4 fromRemotePlayer:(id)a5
{
  GKMatchmakerHostViewController *remoteViewController;
  id v7;
  id v8;

  remoteViewController = self->_remoteViewController;
  v7 = a4;
  objc_msgSend(a5, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerHostViewController setPlayer:sentData:](remoteViewController, "setPlayer:sentData:", v8, v7);

}

- (void)match:(id)a3 player:(id)a4 didChangeConnectionState:(int64_t)a5
{
  GKMatchmakerHostViewController *remoteViewController;
  id v7;

  remoteViewController = self->_remoteViewController;
  objc_msgSend(a4, "internal", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerHostViewController setPlayer:connected:](remoteViewController, "setPlayer:connected:", v7, a5 == 1);

}

- (void)sendData:(id)a3
{
  -[GKMatch sendInviteData:](self->_match, "sendInviteData:", a3);
}

- (void)setBrowsingForNearbyPlayers:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = (void *)MEMORY[0x1E0D25260];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKMatchmakerViewController_iOS.m", 863, "-[GKMatchmakerViewController setBrowsingForNearbyPlayers:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke;
  v7[3] = &unk_1E59C5278;
  v8 = a3;
  v7[4] = self;
  objc_msgSend(v5, "named:execute:", v6, v7);

}

void __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "matchmaker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke_2;
    v5[3] = &unk_1E59C76E0;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "startBrowsingForNearbyPlayersWithHandler:", v5);

  }
  else
  {
    objc_msgSend(v3, "stopBrowsingForNearbyPlayers");

  }
}

void __58__GKMatchmakerViewController_setBrowsingForNearbyPlayers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "remoteViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNearbyPlayer:reachable:", v7, a3);

}

- (void)activateGroupActivities
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "Game Center trying to activate GroupActivity", v6, 2u);
  }
  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateGroupActivityWithHandler:", &__block_literal_global_123);

}

void __53__GKMatchmakerViewController_activateGroupActivities__block_invoke(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "Game Center done activating GroupActivity, success: %hhd", (uint8_t *)v5, 8u);
  }
}

- (void)endGroupActivities
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "Game Center trying to activate GroupActivity", v6, 2u);
  }
  -[GKMatchmakerViewController matchmaker](self, "matchmaker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endGroupActivity");

}

- (void)presentSharePlaySharingController
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1AB361000, v0, OS_LOG_TYPE_DEBUG, "will not presentSharePlaySharingController for Game Center internal processes.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)disconnectFromMatch
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint8_t buf[16];

  -[GKMatchmakerViewController match](self, "match");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!*MEMORY[0x1E0D25460])
      v4 = (id)GKOSLoggers();
    v5 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "Game Center trying to disconnect from match.", buf, 2u);
    }
    v9 = 5;
    -[GKMatchmakerViewController match](self, "match");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendInviteData:", v7);

    -[GKMatchmakerViewController match](self, "match");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInviteDelegate:", 0);

    -[GKMatchmakerViewController setMatch:](self, "setMatch:", 0);
  }
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  -[GKMatchmakerHostViewController setAutomatchPlayerCount:](self->_remoteViewController, "setAutomatchPlayerCount:", a3);
}

- (void)setConnectingStateForPlayer:(id)a3
{
  GKMatchmakerHostViewController *remoteViewController;
  id v4;

  remoteViewController = self->_remoteViewController;
  objc_msgSend(a3, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMatchmakerHostViewController setConnectingStateForPlayer:](remoteViewController, "setConnectingStateForPlayer:", v4);

}

- (void)inviterCancelledNotification:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "GKMatchmakterViewController: inviterCancelledNotification", buf, 2u);
  }
  -[GKMatchmakerViewController acceptedInvite](self, "acceptedInvite");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D24DE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v4, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("session-token"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    -[GKMatchmakerViewController acceptedInvite](self, "acceptedInvite");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inviteID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v10);

    if (v15)
    {
      -[GKMatchmakerViewController remoteViewController](self, "remoteViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[GKMatchmakerViewController remoteViewController](self, "remoteViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "inviterCancelled");

        if (!*v5)
          v18 = (id)GKOSLoggers();
        v19 = *MEMORY[0x1E0D25470];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_1AB361000, v19, OS_LOG_TYPE_INFO, "GKMatchmakterViewController: inviterCancelledNotification - Invite Cancelled", v22, 2u);
        }
      }
      else
      {
        if (!*v5)
          v20 = (id)GKOSLoggers();
        v21 = *MEMORY[0x1E0D25470];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1AB361000, v21, OS_LOG_TYPE_INFO, "the remote view controller has not been up yet, set inviterCancelNotificaitonReceived = YES", v23, 2u);
        }
        -[GKMatchmakerViewController setInviterCancelNotificaitonReceived:](self, "setInviterCancelNotificaitonReceived:", 1);
      }
    }

  }
}

- (void)inviteSharePlayPlayer:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (os_log_t *)MEMORY[0x1E0D25470];
  v8 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1AB361000, v8, OS_LOG_TYPE_INFO, "inviteSharePlayPlayer: %@", (uint8_t *)&v15, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("player"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pushToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("participantIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && v11)
  {
    -[GKMatchmakerViewController groupActivityJoiningPlayer:devicePushToken:participantServerIdentifier:](self, "groupActivityJoiningPlayer:devicePushToken:participantServerIdentifier:", v10, v11, v12);
  }
  else
  {
    if (!*v5)
      v13 = (id)GKOSLoggers();
    v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1AB361000, v14, OS_LOG_TYPE_INFO, "cannot call groupActivityJoiningPlayer as something is nil. player: %@, pushToken: %@", (uint8_t *)&v15, 0x16u);
    }
  }

}

- (void)sharePlayEligibilityChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "sharePlayEligibilityChanged: %@", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isEligibleForGroupSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[GKMatchmakerHostViewController setEligibilityForGroupSession:](self->_remoteViewController, "setEligibilityForGroupSession:", v9);
}

- (void)sharePlaySharingControllerResultSucceeded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    objc_msgSend(v7, "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1AB361000, v8, OS_LOG_TYPE_INFO, "sharePlaySharingControllerResultSucceeded: %@", (uint8_t *)&v10, 0xCu);

  }
  -[GKMatchmakerHostViewController setSharePlaySharingControllerResult:](self->_remoteViewController, "setSharePlaySharingControllerResult:", v3);
}

- (void)recipientPropertiesNeededForPlayer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__GKMatchmakerViewController_recipientPropertiesNeededForPlayer___block_invoke;
  v6[3] = &unk_1E59C7728;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[GKMatchmakerViewController handleRecipientPropertiesNeededForPlayer:completionHandler:](self, "handleRecipientPropertiesNeededForPlayer:completionHandler:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __65__GKMatchmakerViewController_recipientPropertiesNeededForPlayer___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  if (a2)
  {
    v3 = (id *)(a1 + 40);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipientPropertiesProvided:forPlayer:", v4, *(_QWORD *)(a1 + 32));

  }
}

- (void)authenticationChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D24EB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_alertController)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isAuthenticated") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "internal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playerID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v6);

      if ((v11 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    if (!*MEMORY[0x1E0D25460])
      v12 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      -[GKMatchmakerViewController authenticationChanged:].cold.1();
    -[GKMatchmakerViewController cancel](self, "cancel");
  }
LABEL_11:

}

- (void)applicationWillEnterForeground:(id)a3
{
  -[GKMatchmakerHostViewController applicationWillEnterForeground](self->_remoteViewController, "applicationWillEnterForeground", a3);
}

- (id)matchmakerDelegate
{
  return objc_loadWeakRetained((id *)&self->matchmakerDelegate);
}

- (void)setMatchmakerDelegate:(id)matchmakerDelegate
{
  objc_storeWeak((id *)&self->matchmakerDelegate, matchmakerDelegate);
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_matchRequest, a3);
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (GKMatchmakingMode)matchmakingMode
{
  return self->_matchmakingMode;
}

- (BOOL)canStartWithMinimumPlayers
{
  return self->_canStartWithMinimumPlayers;
}

- (GKMatchmakerHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedInvite, a3);
}

- (GKMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (NSMutableArray)hostedPlayers
{
  return self->_hostedPlayers;
}

- (void)setHostedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_hostedPlayers, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (BOOL)inviterCancelNotificaitonReceived
{
  return self->_inviterCancelNotificaitonReceived;
}

- (void)setInviterCancelNotificaitonReceived:(BOOL)a3
{
  self->_inviterCancelNotificaitonReceived = a3;
}

- (GKDispatchGroup)invitationGroup
{
  return self->_invitationGroup;
}

- (void)setInvitationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_invitationGroup, a3);
}

- (GKInternalPlayerPickerDelegate)internalPlayerPickerDelegate
{
  return (GKInternalPlayerPickerDelegate *)objc_loadWeakRetained((id *)&self->_internalPlayerPickerDelegate);
}

- (GKPlayerPickerContext)playerPickerContext
{
  return self->_playerPickerContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPickerContext, 0);
  objc_destroyWeak((id *)&self->_internalPlayerPickerDelegate);
  objc_storeStrong((id *)&self->_invitationGroup, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_hostedPlayers, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_acceptedInvite, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);
  objc_destroyWeak((id *)&self->matchmakerDelegate);
}

- (id)registerGroupActivitySharingControllerItemProvider:(id)a3
{
  id v4;
  GKMatchmakerViewController *v5;
  UIViewController *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  GKMatchmakerViewController.registerSharingControllerItemProvider(itemProvider:)(v6, (NSItemProvider)v4);
  v8 = v7;

  return v8;
}

- (void)handleRecipientPropertiesNeededForPlayer:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  GKMatchmakerViewController *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1AB6F8350(a3, v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

}

void __56__GKMatchmakerViewController__setupRemoteViewController__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "We failed to present Game Center matchmaker extension.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setHostedPlayer:(uint64_t)a3 connected:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1AB361000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
}

- (void)setHostedPlayerReady:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1AB361000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
}

- (void)finishWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1AB361000, v0, v1, "<Warning>: matchmakerDelegate not found for %{public}p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)finishWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "<Warning>: matchmakerViewController:didFailWithError: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__GKMatchmakerViewController_createMatchForAcceptedInvite__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "matchForInvite done without a valid match or any error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)invitedPlayer:responded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, v0, v1, "<Warning>: matchmakerViewController:hostedPlayerDidAccept: delegate method not implemented for GKMatchmakerViewControllerDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)authenticationChanged:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1AB361000, v0, OS_LOG_TYPE_DEBUG, "GKMatchmakerViewController_iOS authenticationChanged with notification: %@", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
