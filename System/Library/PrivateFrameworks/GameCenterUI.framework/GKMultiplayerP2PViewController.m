@implementation GKMultiplayerP2PViewController

- (GKMultiplayerP2PViewController)initWithAcceptedInvite:(id)a3
{
  id v4;
  GKMultiplayerP2PViewController *v5;
  GKMultiplayerP2PViewController *v6;

  v4 = a3;
  v5 = -[GKMultiplayerP2PViewController initWithMatchRequest:](self, "initWithMatchRequest:", 0);
  v6 = v5;
  if (v5)
  {
    -[GKMultiplayerP2PViewController setAcceptedInvite:](v5, "setAcceptedInvite:", v4);
    -[GKMultiplayerP2PViewController setHosted:](v6, "setHosted:", objc_msgSend(v4, "isHosted"));
    -[GKMultiplayerP2PViewController setOrigin:](v6, "setOrigin:", 3);
  }

  return v6;
}

- (GKMultiplayerP2PViewController)initWithMatchRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKMultiplayerP2PViewController;
  return -[GKMultiplayerViewController initWithMatchRequest:](&v4, sel_initWithMatchRequest_, a3);
}

- (void)configureDataSource
{
  -[GKMultiplayerP2PViewController configureDataSourceWithCompletionHandler:](self, "configureDataSourceWithCompletionHandler:", 0);
}

- (void)configureDataSourceWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  _QWORD v15[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 100, "-[GKMultiplayerP2PViewController configureDataSourceWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E59C4A28;
    v15[4] = self;
    objc_msgSend(v7, "perform:", v15);
  }
  objc_initWeak(&location, self);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E59C5FA0;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v7, "notifyOnMainQueueWithBlock:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[1] = 3221225472;
  v7[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E59C4DA8;
  v8 = v3;
  v6.receiver = v4;
  v6.super_class = (Class)GKMultiplayerP2PViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v3;
  objc_msgSendSuper2(&v6, sel_configureDataSourceWithCompletionHandler_, v7);

}

uint64_t __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "acceptedInvite");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setMinPlayers:", 2);
    objc_msgSend(v7, "setMaxPlayers:", 2);
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "acceptedInvite");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_4;
    v17[3] = &unk_1E59C5FA0;
    objc_copyWeak(&v19, v2);
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v7, "addPlayers:withStatus:complete:", v11, 6, v17);

    objc_destroyWeak(&v19);
  }
  else
  {
    objc_msgSend(v5, "setDatasourceConfigured:", 1);

    v12 = objc_loadWeakRetained(v2);
    v13 = objc_msgSend(v12, "sharePlayEnabled");
    v14 = objc_loadWeakRetained(v2);
    objc_msgSend(v14, "multiplayerDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSharePlayEnabled:", v13);

    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      (*(void (**)(void))(v16 + 16))();
  }
}

uint64_t __75__GKMultiplayerP2PViewController_configureDataSourceWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDatasourceConfigured:", 1);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)pageId
{
  unint64_t v2;

  v2 = -[GKMultiplayerP2PViewController origin](self, "origin");
  if (v2 - 1 > 2)
    return CFSTR("sharePlay");
  else
    return off_1E59C6228[v2 - 1];
}

- (void)dealloc
{
  objc_super v3;

  -[GKMultiplayerP2PViewController cancelAlertWithoutDelegateCallback](self, "cancelAlertWithoutDelegateCallback");
  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerP2PViewController;
  -[GKMultiplayerViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerP2PViewController;
  -[GKMultiplayerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[GKMultiplayerViewController sendInvitesToPlayersInOriginalMatchRequest](self, "sendInvitesToPlayersInOriginalMatchRequest");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKMultiplayerP2PViewController;
  -[GKMultiplayerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerP2PViewController pageId](self, "pageId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordPageWithID:pageContext:pageType:", v5, CFSTR("realTimeGame"), CFSTR("multiplayer"));

  if (-[GKMultiplayerP2PViewController isMovingToParentViewController](self, "isMovingToParentViewController"))-[GKMultiplayerP2PViewController configureWhenEnteringTheLobby](self, "configureWhenEnteringTheLobby");
}

- (void)configureWhenEnteringTheLobby
{
  uint64_t v3;
  GKMultiplayerP2PViewController *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (self->_acceptedInvite)
  {
    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 4);
  }
  else
  {
    if (-[GKMultiplayerViewController canStartGroupActivities](self, "canStartGroupActivities"))
    {
      if (-[GKMultiplayerP2PViewController startStagedActivity](self, "startStagedActivity"))
        v3 = 9;
      else
        v3 = 8;
      -[GKMultiplayerP2PViewController setMode:](self, "setMode:", v3);
      v4 = self;
      v5 = 1;
    }
    else
    {
      -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 0);
      v4 = self;
      v5 = 0;
    }
    -[GKMultiplayerP2PViewController setSharePlayEnabled:](v4, "setSharePlayEnabled:", v5);
  }
  if (!-[GKMultiplayerP2PViewController datasourceConfigured](self, "datasourceConfigured"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke;
    v6[3] = &unk_1E59C4148;
    v6[4] = self;
    -[GKMultiplayerP2PViewController configureDataSourceWithCompletionHandler:](self, "configureDataSourceWithCompletionHandler:", v6);
  }
}

void __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "existingRemoteReadyPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "existingRemoteReadyPlayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke_2;
    v6[3] = &unk_1E59C48A0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "addExistingRemoteReadyPlayers:withCompletionHandler:", v5, v6);

    objc_destroyWeak(&v7);
  }
  else
  {
    objc_msgSend(v4, "prepopulateSharePlayActiveParticipants");
  }
  objc_destroyWeak(&location);
}

void __63__GKMultiplayerP2PViewController_configureWhenEnteringTheLobby__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "prepopulateSharePlayActiveParticipants");
    WeakRetained = v2;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKMultiplayerP2PViewController;
  -[GKMultiplayerViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "multiplayerAllowedPlayerType");

  if (v5)
  {
    if ((objc_msgSend(MEMORY[0x1E0D253B8], "_gkIsOnline") & 1) != 0)
    {
      -[GKMultiplayerViewController originalMatchRequest](self, "originalMatchRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "validateForHosted:", self->_hosted);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        -[GKMultiplayerP2PViewController finishWithError:](self, "finishWithError:", v7);
      objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountServicePrivate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke;
      v10[3] = &unk_1E59C5DA0;
      v10[4] = self;
      objc_msgSend(v9, "isICloudAvailableWithHandler:", v10);

    }
    else
    {
      -[GKMultiplayerP2PViewController showNoInternetAlert](self, "showNoInternetAlert");
    }
  }
  else
  {
    -[GKMultiplayerP2PViewController showParentalControlsRestrictionAlert](self, "showParentalControlsRestrictionAlert");
  }
}

void __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 35, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_2;
    block[3] = &unk_1E59C54B8;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v11 = v5;
    v7 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(MEMORY[0x1E0D25238], "reporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordMultiplayerErrorID:", CFSTR("iCloudUnavailable"));

  }
}

void __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v2 = *(void **)(a1 + 32);
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_3;
  v14[3] = &unk_1E59C4708;
  v10 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v10;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_4;
  v12[3] = &unk_1E59C4708;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  v11 = (id)objc_msgSend(v2, "_gkPresentConfirmationAlertWithTitle:message:buttonTitle:block:cancelAction:", v4, v6, v8, v14, v12);

}

uint64_t __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__GKMultiplayerP2PViewController_viewDidAppear___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerP2PViewController;
  -[GKMultiplayerViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[GKMultiplayerP2PViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[GKMultiplayerP2PViewController configureWhenLeavingTheLobby](self, "configureWhenLeavingTheLobby");
    -[GKMultiplayerP2PViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endGroupActivitiesForMultiplayerP2PViewController:", self);

  }
}

- (void)configureWhenLeavingTheLobby
{
  id v3;

  -[GKMultiplayerP2PViewController performActionsForButtonCancelCurrentMatching:](self, "performActionsForButtonCancelCurrentMatching:", 1);
  -[GKMultiplayerP2PViewController cancelAlertWithoutDelegateCallback](self, "cancelAlertWithoutDelegateCallback");
  -[GKMultiplayerP2PViewController cancelPendingInvites](self, "cancelPendingInvites");
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearDataSource");
  -[GKCollectionViewController setDataSource:](self, "setDataSource:", 0);
  -[GKMultiplayerP2PViewController setDatasourceConfigured:](self, "setDatasourceConfigured:", 0);
  -[GKMultiplayerViewController setDidStartForcedAutomatch:](self, "setDidStartForcedAutomatch:", 0);
  -[GKMultiplayerP2PViewController setSharePlayEnabled:](self, "setSharePlayEnabled:", 0);

}

- (void)cancel
{
  void *v3;
  id v4;

  -[GKMultiplayerP2PViewController cancelAlertWithoutDelegateCallback](self, "cancelAlertWithoutDelegateCallback");
  -[GKMultiplayerP2PViewController cancelPendingInvites](self, "cancelPendingInvites");
  if (!-[GKMultiplayerViewController didAcceptGameInvite](self, "didAcceptGameInvite"))
  {
    if (-[GKMultiplayerP2PViewController sharePlayEnabled](self, "sharePlayEnabled"))
    {
      -[GKMultiplayerP2PViewController delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endGroupActivitiesForMultiplayerP2PViewController:", self);

    }
    -[GKMultiplayerP2PViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiplayerP2PViewControllerWasCancelled:", self);

  }
}

- (void)finishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKMultiplayerP2PViewController cancelAlertWithoutDelegateCallback](self, "cancelAlertWithoutDelegateCallback");
  -[GKMultiplayerP2PViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multiplayerP2PViewController:didFinishWithError:", self, v4);

}

- (BOOL)shouldChangeModeFromOldMode:(int64_t)a3 toNewMode:(int64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 2) < 2)
  {
    if (a4 == 1)
    {
      if (!*MEMORY[0x1E0D25460])
        v6 = (id)GKOSLoggers();
      v7 = (void *)*MEMORY[0x1E0D25470];
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO);
      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB37E8];
        v10 = v7;
        objc_msgSend(v9, "numberWithInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v11;
        v25 = 2112;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "should not change mode from: %@, to: %@, call stack: %@", (uint8_t *)&v23, 0x20u);

LABEL_15:
        LOBYTE(v8) = 0;
        return v8;
      }
      return v8;
    }
LABEL_16:
    LOBYTE(v8) = 1;
    return v8;
  }
  if (a3 != 7)
    goto LABEL_16;
  if (!a4
    || (v14 = -[GKMultiplayerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers"),
        LOBYTE(v8) = 1,
        a4 == 1)
    && v14)
  {
    if (!*MEMORY[0x1E0D25460])
      v15 = (id)GKOSLoggers();
    v16 = (void *)*MEMORY[0x1E0D25470];
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO);
    if (v8)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v16;
      objc_msgSend(v17, "numberWithInteger:", 7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_1AB361000, v18, OS_LOG_TYPE_INFO, "should not change mode from: %@, to: %@, call stack: %@", (uint8_t *)&v23, 0x20u);

      goto LABEL_15;
    }
  }
  return v8;
}

- (void)setMode:(int64_t)a3
{
  int64_t v3;
  int64_t mode;

  v3 = a3;
  if (((a3 == 0) & -[GKMultiplayerP2PViewController sharePlayEnabled](self, "sharePlayEnabled")) != 0)
    v3 = 8;
  mode = self->_mode;
  if (mode != v3)
  {
    if (-[GKMultiplayerP2PViewController shouldChangeModeFromOldMode:toNewMode:](self, "shouldChangeModeFromOldMode:toNewMode:", mode, v3))
    {
      self->_mode = v3;
      -[GKMultiplayerP2PViewController updateForNewMode](self, "updateForNewMode");
    }
  }
}

- (void)updateForNewMode
{
  int v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_time_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD block[5];

  switch(-[GKMultiplayerP2PViewController mode](self, "mode"))
  {
    case 0:
      v3 = 1;
      -[GKMultiplayerViewController setAddButtonEnabled:](self, "setAddButtonEnabled:", 1);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRemovingEnabled:", 1);

      v5 = 0;
      goto LABEL_25;
    case 1:
      GKGameCenterUIFrameworkBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "players");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "maxPlayers");

      if (v21 == v23)
        goto LABEL_20;
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "items");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "maxPlayers");

      if (v38 == v40 && !-[GKMultiplayerP2PViewController havePendingPlayers](self, "havePendingPlayers"))
      {
LABEL_20:
        GKGameCenterUIFrameworkBundle();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v42 = objc_claimAutoreleasedReturnValue();

        v5 = (__CFString *)v42;
      }
      goto LABEL_21;
    case 2:
    case 5:
      GKGameCenterUIFrameworkBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[GKMultiplayerViewController setAddButtonEnabled:](self, "setAddButtonEnabled:", 0);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setRemovingEnabled:", 0);
      goto LABEL_23;
    case 3:
    case 4:
      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[GKMultiplayerViewController setAddButtonEnabled:](self, "setAddButtonEnabled:", 0);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRemovingEnabled:", 0);

      goto LABEL_12;
    case 6:
      -[GKMultiplayerP2PViewController setUserCancelledMatching:](self, "setUserCancelledMatching:", 1);
      GKGameCenterUIFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[GKMultiplayerViewController setAddButtonEnabled:](self, "setAddButtonEnabled:", 0);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setRemovingEnabled:", 0);

      -[GKMultiplayerViewController footerView](self, "footerView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setInviteFriendsButtonEnabled:", 0);

      v29 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D24E38] * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__GKMultiplayerP2PViewController_updateForNewMode__block_invoke;
      block[3] = &unk_1E59C4148;
      block[4] = self;
      dispatch_after(v29, MEMORY[0x1E0C80D38], block);
LABEL_12:
      v3 = 0;
      goto LABEL_25;
    case 7:
      -[GKMultiplayerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers");
      GKGameCenterUIFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == objc_msgSend(v12, "maxPlayers"))
      {
        -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "players");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");
        -[GKMultiplayerViewController matchRequest](self, "matchRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "maxPlayers");

        if (v15 == v17)
          goto LABEL_21;
        GKGameCenterUIFrameworkBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v10 = v5;
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {

      }
LABEL_21:
      v3 = 1;
      -[GKMultiplayerViewController setAddButtonEnabled:](self, "setAddButtonEnabled:", 1);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setRemovingEnabled:", 1);

LABEL_25:
      -[GKMultiplayerViewController updateDataSourceInvitationEnabled](self, "updateDataSourceInvitationEnabled");
      -[GKMultiplayerViewController footerView](self, "footerView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFooterStatusString:", v5);

      -[GKMultiplayerP2PViewController updateStartGameButtonTitle](self, "updateStartGameButtonTitle");
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v3 & (objc_msgSend(v45, "hasFutureRecipientProperties") ^ 1);
      -[GKMultiplayerViewController footerView](self, "footerView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setStartGameButtonEnabled:", v46);

      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "didChangeMode");

      if (-[GKMultiplayerP2PViewController datasourceConfigured](self, "datasourceConfigured"))
      {
        -[GKCollectionViewController collectionView](self, "collectionView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKCollectionViewController collectionView](self, "collectionView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "indexPathsForVisibleItems");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "reloadItemsAtIndexPaths:", v51);

      }
      return;
    case 8:
      -[GKMultiplayerP2PViewController activeRemoteParticipants](self, "activeRemoteParticipants");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "maxPlayers");

      if (v31 >= v33)
        goto LABEL_22;
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "automatchPlayerCount");

      if (v35 >= 1)
        goto LABEL_22;
      v5 = &stru_1E59EB978;
      goto LABEL_24;
    case 9:
LABEL_22:
      GKGameCenterUIFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    default:
      v5 = 0;
LABEL_24:
      v3 = 1;
      goto LABEL_25;
  }
}

uint64_t __50__GKMultiplayerP2PViewController_updateForNewMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setUserCancelledMatching:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "mode");
  if (result == 6)
    return objc_msgSend(*(id *)(a1 + 32), "setMode:", 7);
  return result;
}

- (BOOL)isInSetupMode
{
  return -[GKMultiplayerP2PViewController mode](self, "mode") == 0;
}

- (void)updateFooterButtonStates
{
  int64_t mode;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKMultiplayerP2PViewController;
  -[GKMultiplayerViewController updateFooterButtonStates](&v12, sel_updateFooterButtonStates);
  mode = self->_mode;
  if (mode == 2)
  {
    -[GKMultiplayerViewController footerView](self, "footerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInviteFriendsButtonEnabled:", 0);

    mode = self->_mode;
  }
  if ((mode & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasFutureRecipientProperties") ^ 1;
    -[GKMultiplayerViewController footerView](self, "footerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStartGameButtonEnabled:", v6);

    if (-[GKMultiplayerP2PViewController mode](self, "mode") == 9
      && !-[GKMultiplayerP2PViewController havePendingPlayers](self, "havePendingPlayers")
      && !-[GKMultiplayerP2PViewController haveInvitedPlayers](self, "haveInvitedPlayers"))
    {
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "readyPlayers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
        v11 = 7;
      else
        v11 = 8;
      -[GKMultiplayerP2PViewController setMode:](self, "setMode:", v11);
    }
  }
}

- (int64_t)automatchParticipantStatus
{
  int64_t v3;
  int64_t result;

  v3 = -[GKMultiplayerP2PViewController mode](self, "mode") - 1;
  result = 9;
  switch(v3)
  {
    case 0:
      result = 13;
      break;
    case 1:
    case 2:
    case 3:
      return result;
    case 5:
      result = 14;
      break;
    case 6:
      if (-[GKMultiplayerP2PViewController sharePlayEnabled](self, "sharePlayEnabled"))
        result = 20;
      else
        result = 13;
      break;
    case 7:
    case 8:
      result = 20;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isCanceling
{
  return -[GKMultiplayerP2PViewController mode](self, "mode") == 6;
}

- (void)updateStartGameButtonTitle
{
  void *v3;
  void *v4;
  id v5;

  switch(-[GKMultiplayerP2PViewController mode](self, "mode"))
  {
    case 0:
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      GKGameCenterUIFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[GKMultiplayerViewController footerView](self, "footerView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setPrimaryButtonTitle:", v5);

      }
      break;
    default:
      return;
  }
}

- (BOOL)haveInvitedPlayers
{
  void *v2;
  void *v3;
  BOOL v4;

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playersInvited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)havePendingPlayers
{
  void *v2;
  char v3;

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "havePendingPlayers");

  return v3;
}

- (void)addExistingRemoteReadyPlayers:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  id v11;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__GKMultiplayerP2PViewController_addExistingRemoteReadyPlayers_withCompletionHandler___block_invoke;
    v9[3] = &unk_1E59C5FA0;
    objc_copyWeak(&v11, &location);
    v10 = v7;
    objc_msgSend(v8, "addPlayers:withStatus:complete:", v6, 7, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[GKMultiplayerP2PViewController incrementOneAutoMatchPlayerCountIfPossible](self, "incrementOneAutoMatchPlayerCountIfPossible");
    v7[2](v7);
  }

}

void __86__GKMultiplayerP2PViewController_addExistingRemoteReadyPlayers_withCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateMode");
  v3 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "incrementOneAutoMatchPlayerCountIfPossible");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setExistingPlayers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (id)-[GKMultiplayerP2PViewController view](self, "view");
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__GKMultiplayerP2PViewController_setExistingPlayers___block_invoke;
  v11[3] = &unk_1E59C5FC8;
  v9 = v8;
  v12 = v9;
  objc_msgSend(v4, "_gkFilterWithBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_storeStrong((id *)&self->_existingRemoteReadyPlayers, v10);
    -[GKMultiplayerP2PViewController addExistingRemoteReadyPlayers:withCompletionHandler:](self, "addExistingRemoteReadyPlayers:withCompletionHandler:", v10, &__block_literal_global_22);
  }

}

id __53__GKMultiplayerP2PViewController_setExistingPlayers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((a1 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)incrementOneAutoMatchPlayerCountIfPossible
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "players");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + 1 <= (unint64_t)objc_msgSend(v6, "maxPlayers");

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutomatchPlayerCount:complete:", v7, 0);

}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__GKMultiplayerP2PViewController_setAutomatchPlayerCount___block_invoke;
  v6[3] = &unk_1E59C6010;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setAutomatchPlayerCount:complete:", a3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__GKMultiplayerP2PViewController_setAutomatchPlayerCount___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(a1 + 32), "mode") == 2 && (objc_msgSend(*(id *)(a1 + 32), "havePendingPlayers") & 1) == 0)
  {
    if (!*MEMORY[0x1E0D25460])
      v2 = (id)GKOSLoggers();
    v3 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AB361000, v3, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode, and need no pending players. Start game!", v5, 2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "startGame");

  }
}

- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v12 = (id)GKOSLoggers();
  v13 = (os_log_t *)MEMORY[0x1E0D25470];
  v14 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    objc_msgSend(v8, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v16;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "Player joining from Shareplay = %@, pushToken: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 632, "-[GKMultiplayerP2PViewController groupActivityJoiningPlayer:devicePushToken:participantServerIdentifier:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dispatchGroupWithName:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke;
    v30[3] = &unk_1E59C42A0;
    v30[4] = self;
    v22 = v17;
    v31 = v22;
    v32 = v10;
    objc_msgSend(v20, "perform:", v30);
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_3;
    v27[3] = &unk_1E59C54B8;
    v27[4] = self;
    v28 = v22;
    v29 = v9;
    objc_msgSend(v20, "notifyOnMainQueueWithBlock:", v27);

  }
  else
  {
    if (!*v11)
      v23 = (id)GKOSLoggers();
    v24 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v25 = v24;
      objc_msgSend(v8, "debugDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v26;
      _os_log_impl(&dword_1AB361000, v25, OS_LOG_TYPE_INFO, "No responding player found for player: %@", buf, 0xCu);

    }
  }

}

void __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_2;
  v8[3] = &unk_1E59C4DA8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "replacePrepopulatedPlayerWithNormalPlayer:participantServerIdentifier:completionHandler:", v6, v5, v8);

}

uint64_t __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __105__GKMultiplayerP2PViewController_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendInvitesToSharePlayPlayer:devicePushToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "updateStartGameButtonTitle");
}

- (void)sendInvitesToSharePlayPlayer:(id)a3 devicePushToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRecipients:", v9);
  -[GKMultiplayerP2PViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multiplayerP2PViewController:startMatchingWithRequest:devicePushToken:", self, v8, v6);

  -[GKMultiplayerP2PViewController sendStatusUpdate](self, "sendStatusUpdate");
  if (!-[GKMultiplayerP2PViewController mode](self, "mode"))
    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 1);

}

+ (void)addContactCheckTaskForMessageID:(id)a3 respondingPlayer:(id)a4 dataSource:(id)a5 toGroup:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
  {
    if (v10)
    {
      objc_msgSend(v11, "players");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v10);

      if ((v14 & 1) == 0)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v11, "players");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v34;
          v27 = v11;
          v28 = v10;
          v26 = v12;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v20, "contact", v26);
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v22 = (void *)v21;
                objc_msgSend(v20, "internal");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "messagesID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "isEqualToString:", v9);

                if (v25)
                {
                  v29[0] = MEMORY[0x1E0C809B0];
                  v29[1] = 3221225472;
                  v29[2] = __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke;
                  v29[3] = &unk_1E59C42A0;
                  v11 = v27;
                  v30 = v27;
                  v31 = v20;
                  v10 = v28;
                  v32 = v28;
                  v12 = v26;
                  objc_msgSend(v26, "perform:", v29);

                  goto LABEL_15;
                }
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            v11 = v27;
            v10 = v28;
            v12 = v26;
            if (v17)
              continue;
            break;
          }
        }
LABEL_15:

      }
    }
  }

}

void __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  v11[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke_2;
  v8[3] = &unk_1E59C4DA8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "replacePlayers:withGKPlayers:completionHandler:", v5, v6, v8);

}

uint64_t __102__GKMultiplayerP2PViewController_addContactCheckTaskForMessageID_respondingPlayer_dataSource_toGroup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPlayer:(id)a3 responded:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
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
  os_log_t v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  GKMultiplayerP2PViewController *v28;
  int64_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = (os_log_t *)MEMORY[0x1E0D25470];
  v10 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v6, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v12;
    _os_log_impl(&dword_1AB361000, v11, OS_LOG_TYPE_INFO, "Player responded = %@", buf, 0xCu);

  }
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (!a4
      && -[GKMultiplayerP2PViewController needRecipientPropertiesForPlayer:](self, "needRecipientPropertiesForPlayer:", v6))
    {
      -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "requestRecipientProperties:", v6);

    }
    v16 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 707, "-[GKMultiplayerP2PViewController setPlayer:responded:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dispatchGroupWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_opt_class();
    objc_msgSend(v6, "messagesID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addContactCheckTaskForMessageID:respondingPlayer:dataSource:toGroup:", v20, v14, v13, v18);

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke;
    v25[3] = &unk_1E59C6060;
    v26 = v13;
    v28 = self;
    v29 = a4;
    v27 = v14;
    objc_msgSend(v18, "notifyOnMainQueueWithBlock:", v25);

  }
  else
  {
    if (!*v7)
      v21 = (id)GKOSLoggers();
    v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      objc_msgSend(v6, "debugDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v24;
      _os_log_impl(&dword_1AB361000, v23, OS_LOG_TYPE_INFO, "No responding player found for player: %@", buf, 0xCu);

    }
  }

}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v2 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 716, "-[GKMultiplayerP2PViewController setPlayer:responded:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "statusForPlayer:", *(_QWORD *)(a1 + 40));
  if (v5 == 1)
  {
    v9 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)(v9 - 2) >= 4)
    {
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSince1970");
        objc_msgSend(*(id *)(a1 + 48), "setInviteeConnectionTimeStamp:");

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_4;
        v18[3] = &unk_1E59C41C0;
        v19 = *(id *)(a1 + 32);
        v20 = *(id *)(a1 + 40);
        objc_msgSend(v4, "perform:", v18);

        v8 = v19;
        goto LABEL_11;
      }
      v11 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24DB8]);

      v11 = 4;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_6;
    v14[3] = &unk_1E59C6038;
    v15 = *(id *)(a1 + 32);
    v17 = v11;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v4, "perform:", v14);
    objc_msgSend(*(id *)(a1 + 48), "updateMode");

    v8 = v15;
    goto LABEL_11;
  }
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstInvitedContactPlayer");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_2;
      v21[3] = &unk_1E59C42A0;
      v22 = *(id *)(a1 + 32);
      v23 = v7;
      v24 = *(id *)(a1 + 40);
      v8 = v7;
      objc_msgSend(v4, "perform:", v21);

LABEL_11:
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_8;
      v13[3] = &unk_1E59C4148;
      v13[4] = *(_QWORD *)(a1 + 48);
      objc_msgSend(v4, "notifyOnMainQueueWithBlock:", v13);
    }
  }

}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  v11[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_3;
  v8[3] = &unk_1E59C4DA8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "replacePlayers:withGKPlayers:completionHandler:", v5, v6, v8);

}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_5;
  v7[3] = &unk_1E59C4DA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "setStatus:forPlayers:complete:", 12, v5, v7);

}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_6(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[6];
  v5 = (void *)a1[4];
  v10[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_7;
  v8[3] = &unk_1E59C4DA8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "setStatus:forPlayers:complete:", v4, v6, v8);

}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_responded___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendStatusUpdate");
}

- (void)setConnectingStateForPlayer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  uint64_t *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v4, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "Player: %@ is connecting", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 781, "-[GKMultiplayerP2PViewController setConnectingStateForPlayer:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchGroupWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "currentPlayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v9);

  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    v23 = MEMORY[0x1E0C809B0];
    v17 = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke;
    v18 = &v23;
  }
  else
  {
    v22 = MEMORY[0x1E0C809B0];
    v17 = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_3;
    v18 = &v22;
  }
  v18[1] = 3221225472;
  v18[2] = (uint64_t)v17;
  v18[3] = (uint64_t)&unk_1E59C41C0;
  v19 = v10;
  v18[4] = (uint64_t)v19;
  v20 = v9;
  v18[5] = (uint64_t)v20;
  objc_msgSend(v13, "perform:", v18);

  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_5;
  v21[3] = &unk_1E59C4148;
  v21[4] = self;
  objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v21);

}

void __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_2;
  v7[3] = &unk_1E59C4DA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "setStatus:forPlayers:complete:", 6, v5, v7);

}

uint64_t __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_4;
  v7[3] = &unk_1E59C4DA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "addPlayers:withStatus:replaceAutomatches:complete:", v5, 6, 1, v7);

}

uint64_t __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__GKMultiplayerP2PViewController_setConnectingStateForPlayer___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendStatusUpdate");
}

- (void)setPlayer:(id)a3 connected:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!*MEMORY[0x1E0D25460])
    v7 = (id)GKOSLoggers();
  v8 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v6, "debugDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("is not");
    if (v4)
      v12 = CFSTR("is");
    *(_DWORD *)buf = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_1AB361000, v9, OS_LOG_TYPE_INFO, "Player: %@ %@ connected", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 808, "-[GKMultiplayerP2PViewController setPlayer:connected:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dispatchGroupWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[GKMultiplayerP2PViewController isHosted](self, "isHosted"))
  {
    v17 = (void *)objc_opt_class();
    objc_msgSend(v6, "messagesID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addContactCheckTaskForMessageID:respondingPlayer:dataSource:toGroup:", v18, v19, v20, v16);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__GKMultiplayerP2PViewController_setPlayer_connected___block_invoke;
  v22[3] = &unk_1E59C6088;
  v24 = v4;
  v22[4] = self;
  v23 = v13;
  v21 = v13;
  objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v22);

}

uint64_t __54__GKMultiplayerP2PViewController_setPlayer_connected___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "playerConnected:", v4);
  else
    return objc_msgSend(v3, "playerDisconnected:", v4);
}

- (void)setPlayer:(id)a3 sentData:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  void *v10;
  GKInvite *acceptedInvite;
  void *v12;
  int v13;
  unsigned int *v14;
  unsigned int *v15;
  unint64_t v16;
  id v17;
  os_log_t *v18;
  NSObject *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  unsigned int v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  if ((v8 & 0xFFFFFFFC) != 0)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0D25358], "canonicalizedPlayerForInternal:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      acceptedInvite = self->_acceptedInvite;
      if (acceptedInvite)
      {
        -[GKInvite sender](acceptedInvite, "sender");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }
      v14 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v15 = v14 + 1;
      v16 = *v14;
      if (!*MEMORY[0x1E0D25460])
        v17 = (id)GKOSLoggers();
      v30 = v9 - 4;
      v18 = (os_log_t *)MEMORY[0x1E0D25470];
      v19 = (id)*MEMORY[0x1E0D25470];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v29 = v13;
        v20 = objc_msgSend(&unk_1E5A5EBA8, "count");
        if (v20 <= v16)
        {
          v21 = CFSTR("unknown");
        }
        else
        {
          objc_msgSend(&unk_1E5A5EBA8, "objectAtIndex:", v16);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "conciseDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v33 = v16;
        v34 = 2112;
        v35 = v21;
        v36 = 1024;
        v37 = v30;
        v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_1AB361000, v19, OS_LOG_TYPE_INFO, "header = %d (%@) length = %d from playerID: %@", buf, 0x22u);
        if (v20 > v16)

        v13 = v29;
        v18 = (os_log_t *)MEMORY[0x1E0D25470];
      }

      switch((int)v16)
      {
        case 0:
        case 2:
        case 3:
        case 6:
          break;
        case 1:
          -[GKMultiplayerP2PViewController processStatusUpdateMessageFromPlayer:bytes:withLength:](self, "processStatusUpdateMessageFromPlayer:bytes:withLength:", v10, v15, v30);
          break;
        case 4:
          if (v13)
          {
            if (!*MEMORY[0x1E0D25460])
              v25 = (id)GKOSLoggers();
            v26 = *v18;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AB361000, v26, OS_LOG_TYPE_INFO, "Invitee got start game message", buf, 2u);
            }
            -[GKMultiplayerP2PViewController playNow](self, "playNow");
          }
          break;
        case 5:
          if (-[GKMultiplayerP2PViewController mode](self, "mode") != 5
            && -[GKMultiplayerP2PViewController mode](self, "mode"))
          {
            -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setStatus:forPlayers:complete:", 3, v28, 0);

          }
          if (v13)
            -[GKMultiplayerP2PViewController showInviterDisconnectedAlert](self, "showInviterDisconnectedAlert");
          break;
        default:
          if (!*MEMORY[0x1E0D25460])
            v23 = (id)GKOSLoggers();
          v24 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AB361000, v24, OS_LOG_TYPE_INFO, "unknown header", buf, 2u);
          }
          break;
      }
    }

  }
}

- (void)setInvitesFailedWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "code") != 2)
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FailedPlayers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failedToInvitePlayers:", v6);

  }
  if (!-[GKMultiplayerP2PViewController userCancelledMatching](self, "userCancelledMatching"))
    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 0);

}

- (void)setAutomatchFailedWithError:(id)a3
{
  if (objc_msgSend(a3, "code") == 2)
  {
    if (!-[GKMultiplayerP2PViewController userCancelledMatching](self, "userCancelledMatching"))
      -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 0);
  }
  else
  {
    -[GKMultiplayerP2PViewController showAutomatchingErrorAlert](self, "showAutomatchingErrorAlert");
  }
  -[GKMultiplayerViewController setDidStartForcedAutomatch:](self, "setDidStartForcedAutomatch:", 0);
}

- (void)applicationWillEnterForeground
{
  void *v3;
  GKMultiplayerP2PViewController *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (!-[GKMultiplayerP2PViewController isHosted](self, "isHosted"))
  {
    -[GKMultiplayerP2PViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topViewController");
    v4 = (GKMultiplayerP2PViewController *)objc_claimAutoreleasedReturnValue();

    if (v4 != self)
    {
      -[GKMultiplayerP2PViewController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewControllers");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v9, "indexOfObject:", self) + 1;
      if (v6 >= objc_msgSend(v9, "count"))
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndex:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D253B0], "shared");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSupportsNearby:", objc_msgSend(v8, "shouldAllowNearbyMultiplayer"));

      }
    }
  }
}

- (void)presentSharePlaySharingController
{
  id v3;

  -[GKMultiplayerP2PViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multiplayerP2PViewControllerPresentSharePlaySharingController:", self);

}

- (BOOL)needRecipientPropertiesForPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expectFutureRecipientPropertiesForPlayers:", v9);

    -[GKMultiplayerP2PViewController updateFooterButtonStates](self, "updateFooterButtonStates");
  }

  return v7 != 0;
}

- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateRecipientProperties:forPlayer:", v7, v6);

  -[GKMultiplayerP2PViewController updateFooterButtonStates](self, "updateFooterButtonStates");
}

- (BOOL)canStartForcedAutomatch
{
  if (-[GKMultiplayerP2PViewController mode](self, "mode"))
    return 0;
  else
    return !-[GKMultiplayerViewController didStartForcedAutomatch](self, "didStartForcedAutomatch");
}

- (void)playNow
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *log;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[GKMultiplayerP2PViewController startGame](self, "startGame");
    return;
  }
  if (-[GKMultiplayerP2PViewController haveInvitedPlayers](self, "haveInvitedPlayers")
    && -[GKMultiplayerP2PViewController mode](self, "mode") != 7)
  {
    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 1);
    return;
  }
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "automatchPlayerCount") > 0
    || (objc_msgSend(v4, "guestPlayers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v4, "playerRange");
    v11 = v10;
    objc_msgSend(v8, "setMinPlayers:", v9);
    objc_msgSend(v8, "setMaxPlayers:", v9 + v11);
    objc_msgSend(v8, "setDefaultNumberOfPlayers:", 0);
    objc_msgSend(v4, "currentPlayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_gkGuestPlayersFromPlayers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRecipients:", v13);

    -[GKMultiplayerP2PViewController delegate](self, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "multiplayerP2PViewController:startMatchingWithRequest:", self, v8);

    LOBYTE(v14) = objc_msgSend(v4, "havePendingPlayers");
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasFutureRecipientProperties");

    if ((v14 & 1) != 0)
    {
      v17 = !-[GKMultiplayerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers") | v16;
      -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 2);
      if ((v17 & 1) != 0)
      {
        if (!*MEMORY[0x1E0D25460])
          v18 = (id)GKOSLoggers();
        v19 = (void *)*MEMORY[0x1E0D25470];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
        {
          v20 = (void *)MEMORY[0x1E0CB37E8];
          log = v19;
          objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v4, "automatchPlayerCount"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "readyPlayers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB37E8];
          -[GKMultiplayerViewController matchRequest](self, "matchRequest");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "minPlayers"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v62 = v21;
          v63 = 2112;
          v64 = v24;
          v65 = 2112;
          v66 = v27;
          v67 = 2112;
          v68 = v28;
          _os_log_impl(&dword_1AB361000, log, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode. automatchPlayerCount: %@, fast start: disabled, readyPlayersCount: %@, minPlayers required: %@, hasFutureRecipientProperties: %@. Start matching.", buf, 0x2Au);

        }
LABEL_23:
        -[GKMultiplayerP2PViewController sendStatusUpdate](self, "sendStatusUpdate");
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(v4, "readyPlayers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "minPlayers");

      v35 = *MEMORY[0x1E0D25460];
      if (v32 < v34)
      {
        if (!v35)
          v36 = (id)GKOSLoggers();
        v37 = (void *)*MEMORY[0x1E0D25470];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
        {
          v38 = (void *)MEMORY[0x1E0CB37E8];
          v39 = v37;
          objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v4, "automatchPlayerCount"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "readyPlayers");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)MEMORY[0x1E0CB37E8];
          -[GKMultiplayerViewController matchRequest](self, "matchRequest");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "numberWithUnsignedInteger:", objc_msgSend(v45, "minPlayers"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v62 = v40;
          v63 = 2112;
          v64 = v43;
          v65 = 2112;
          v66 = v46;
          v67 = 2112;
          v68 = v47;
          _os_log_impl(&dword_1AB361000, v39, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode, automatchPlayerCount: %@, fast start: enabled, readyPlayersCount: %@, minPlayers required: %@, hasFutureRecipientProperties: %@. Start matching.", buf, 0x2Au);

        }
        goto LABEL_23;
      }
      if (!v35)
        v48 = (id)GKOSLoggers();
      v49 = (void *)*MEMORY[0x1E0D25470];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
      {
        v50 = (void *)MEMORY[0x1E0CB37E8];
        v51 = v49;
        objc_msgSend(v50, "numberWithInteger:", objc_msgSend(v4, "automatchPlayerCount"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "readyPlayers");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0CB37E8];
        -[GKMultiplayerViewController matchRequest](self, "matchRequest");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "numberWithUnsignedInteger:", objc_msgSend(v57, "minPlayers"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v62 = v52;
        v63 = 2112;
        v64 = v55;
        v65 = 2112;
        v66 = v58;
        v67 = 2112;
        v68 = v59;
        _os_log_impl(&dword_1AB361000, v51, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeMatching mode, automatchPlayerCount: %@, fast start: enabled, readyPlayersCount: %@, minPlayers required: %@, hasFutureRecipientProperties: %@. Start game while matching is in the background.", buf, 0x2Au);

      }
    }
    else
    {
      -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 3);
      if (!*MEMORY[0x1E0D25460])
        v29 = (id)GKOSLoggers();
      v30 = *MEMORY[0x1E0D25470];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AB361000, v30, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PModeStartingGame mode, which is an all guest game. Start game!", buf, 2u);
      }
    }
    -[GKMultiplayerP2PViewController startGame](self, "startGame");
    goto LABEL_30;
  }
  -[GKMultiplayerP2PViewController startGame](self, "startGame");
LABEL_31:

}

- (void)startGameButtonPressed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordButtonClickAction:targetId:", CFSTR("play"), CFSTR("startGame"));

  switch(-[GKMultiplayerP2PViewController mode](self, "mode"))
  {
    case 0:
    case 7:
      -[GKMultiplayerViewController performActionsForButtonStartGame](self, "performActionsForButtonStartGame");
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v4 = *MEMORY[0x1E0D25068];
      v5 = *MEMORY[0x1E0D24DC8];
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentRemotePlayers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reportEvent:type:count:", v4, v5, objc_msgSend(v7, "count"));

      goto LABEL_7;
    case 1:
    case 2:
      -[GKMultiplayerP2PViewController performActionsForButtonCancelCurrentMatching:](self, "performActionsForButtonCancelCurrentMatching:", 0);
      break;
    case 5:
      -[GKMultiplayerP2PViewController acceptedInvite](self, "acceptedInvite");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[GKMultiplayerP2PViewController resetInviteesStatus](self, "resetInviteesStatus");
        -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 0);
      }
      break;
    case 8:
      -[GKMultiplayerP2PViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activateGroupActivitiesForMultiplayerP2PViewController:", self);

      objc_msgSend(MEMORY[0x1E0D25238], "reporter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMultiplayerP2PViewController pageId](self, "pageId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("startGame"), CFSTR("button"), v11, CFSTR("multiplayer"));

      -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 9);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shareplayPrepopulatedPlayers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStatus:forPlayers:complete:", 21, v12, 0);

LABEL_7:
      break;
    case 9:
      -[GKMultiplayerP2PViewController performActionsForButtonCancelCurrentMatching:](self, "performActionsForButtonCancelCurrentMatching:", 1);
      -[GKMultiplayerP2PViewController configureWhenLeavingTheLobby](self, "configureWhenLeavingTheLobby");
      -[GKMultiplayerP2PViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endGroupActivitiesForMultiplayerP2PViewController:", self);

      if (-[GKMultiplayerP2PViewController startStagedActivity](self, "startStagedActivity"))
        -[GKMultiplayerP2PViewController setStartStagedActivity:](self, "setStartStagedActivity:", 0);
      -[GKMultiplayerP2PViewController configureWhenEnteringTheLobby](self, "configureWhenEnteringTheLobby");
      break;
    default:
      return;
  }
}

- (void)inviteFriendsButtonPressed
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerP2PViewController pageId](self, "pageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("inviteFriends"), CFSTR("button"), v4, CFSTR("multiplayer"));

  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerP2PViewController;
  -[GKMultiplayerViewController inviteFriendsButtonPressed](&v5, sel_inviteFriendsButtonPressed);
}

- (void)displayCancelConfirmationDialog
{
  void *v3;
  void *v4;
  void *v5;
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
  _QWORD v17[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__GKMultiplayerP2PViewController_displayCancelConfirmationDialog__block_invoke;
  v17[3] = &unk_1E59C4408;
  v17[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12);
  objc_msgSend(v8, "addAction:", v16);
  objc_msgSend(v8, "setPreferredAction:", v16);
  -[GKMultiplayerP2PViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __65__GKMultiplayerP2PViewController_displayCancelConfirmationDialog__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performActionsForButtonCancelCurrentMatching:", 0);
}

- (void)startGame
{
  _BOOL4 v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v3 = -[GKMultiplayerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers");
  v4 = (uint64_t *)MEMORY[0x1E0D25068];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *v4;
    objc_msgSend(v5, "reportEvent:type:", *v4, *MEMORY[0x1E0D24D90]);

    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "readyPlayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "participants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = (_QWORD *)MEMORY[0x1E0D24D80];
    if (v9 >= v12)
      v15 = (_QWORD *)MEMORY[0x1E0D24D78];
    objc_msgSend(v13, "reportEvent:type:", v6, *v15);

  }
  -[GKMultiplayerP2PViewController inviteeConnectionTimeStamp](self, "inviteeConnectionTimeStamp");
  if (v16 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *v4;
    v19 = *MEMORY[0x1E0D24DC0];
    v20 = (void *)MEMORY[0x1E0C99D68];
    -[GKMultiplayerP2PViewController inviteeConnectionTimeStamp](self, "inviteeConnectionTimeStamp");
    objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reportEvent:type:startTime:", v18, v19, v21);

  }
  -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 3);
  -[GKMultiplayerP2PViewController finishWithError:](self, "finishWithError:", 0);
}

- (void)willPresentPlayerPicker:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  if (-[GKMultiplayerP2PViewController isHosted](self, "isHosted"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "shouldAllowNearbyMultiplayer");

  }
  objc_msgSend(v4, "setSupportsNearby:", v5);
  -[GKMultiplayerViewController nearbyDelegate](self, "nearbyDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNearbyDelegate:", v7);

}

- (void)loadShareURLWithContactPlayers:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a3, "_gkInternalsFromUncheckedPlayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMessagesBasedRecipients:", v7);

  -[GKMultiplayerP2PViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "multiplayerP2PViewController:shareMatchWithRequest:handler:", self, v10, v6);

}

- (void)prepopulateSharePlayActiveParticipants
{
  _QWORD v3[5];

  if (-[GKMultiplayerP2PViewController sharePlayEnabled](self, "sharePlayEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke;
    v3[3] = &unk_1E59C60B0;
    v3[4] = self;
    -[GKMultiplayerP2PViewController sharePlayFetchFirstActiveConversationWithHandler:](self, "sharePlayFetchFirstActiveConversationWithHandler:", v3);
  }
}

void __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  os_log_t *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  uint8_t v37[16];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "activeRemoteParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActiveRemoteParticipants:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setFirstActiveConversation:", v3);
  objc_msgSend(*(id *)(a1 + 32), "activeRemoteParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(*(id *)(a1 + 32), "matchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxPlayers");

  v9 = (_QWORD *)MEMORY[0x1E0D25460];
  v10 = *MEMORY[0x1E0D25460];
  if (v6 >= v8)
  {
    if (!v10)
      v21 = (id)GKOSLoggers();
    v22 = (os_log_t *)MEMORY[0x1E0D25470];
    v23 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      v24 = *(void **)(a1 + 32);
      v25 = v23;
      objc_msgSend(v24, "activeRemoteParticipants");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");
      objc_msgSend(*(id *)(a1 + 32), "matchRequest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v39 = v27;
      v40 = 2048;
      v41 = objc_msgSend(v28, "maxPlayers");
      _os_log_impl(&dword_1AB361000, v25, OS_LOG_TYPE_INFO, "Do not pre-populate remote participants from the call to the game. Active remote participant count=%lu, maxPlayers of matchRequest=%lu", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activeRemoteParticipants");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");
    objc_msgSend(v18, "players");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (((v30 + 1 - v32) & 0x8000000000000000) == 0)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      if (!*v9)
        v33 = (id)GKOSLoggers();
      v34 = *v22;
      if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1AB361000, v34, OS_LOG_TYPE_INFO, "Setting reserved automatch spot for share play players.", v37, 2u);
      }
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke_151;
      v35[3] = &unk_1E59C48A0;
      objc_copyWeak(&v36, (id *)buf);
      objc_msgSend(v18, "setAutomatchPlayerCount:complete:", v30 + 1 - v32, v35);
      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (!v10)
      v11 = (id)GKOSLoggers();
    v12 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      objc_msgSend(v13, "activeRemoteParticipants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(*(id *)(a1 + 32), "matchRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v39 = v16;
      v40 = 2048;
      v41 = objc_msgSend(v17, "maxPlayers");
      _os_log_impl(&dword_1AB361000, v14, OS_LOG_TYPE_INFO, "Pre-populating remote participants from the call to the game. Active remote participant count=%lu, maxPlayers of matchRequest=%lu", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activeRemoteParticipants");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "prepopulateConversationParticipants:complete:", v20, 0);

  }
}

void __72__GKMultiplayerP2PViewController_prepopulateSharePlayActiveParticipants__block_invoke_151(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didUpdateAutoMatchPlayerCount");

}

- (void)sharePlayFetchFirstActiveConversationWithHandler:(id)a3
{
  void (**v4)(id, void *);
  _QWORD *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *conversationManagerQueue;
  void *v12;
  os_log_t *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  id v23;
  os_log_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25480];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
  {
    LOWORD(v38) = 0;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "fetching first active TUConversation.", (uint8_t *)&v38, 2u);
  }
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conversationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamed.multiplayerService.conversationManager", 0);
  conversationManagerQueue = self->_conversationManagerQueue;
  self->_conversationManagerQueue = v10;

  -[GKMultiplayerP2PViewController conversationManagerQueue](self, "conversationManagerQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDelegate:queue:", self, v12);

  v13 = (os_log_t *)MEMORY[0x1E0D25470];
  if (!v9)
  {
    if (!*v5)
      v19 = (id)GKOSLoggers();
    v20 = *v13;
    if (!os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
      goto LABEL_17;
    LOWORD(v38) = 0;
    v21 = "conversation manager is nil from TUCallCenter";
    goto LABEL_16;
  }
  objc_msgSend(v9, "activeConversations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v9, "activeConversations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_gkFilterWithBlock:", &__block_literal_global_156);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if (!*v5)
    v22 = (id)GKOSLoggers();
  v20 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v38) = 0;
    v21 = "no active conversations found from conversation manager.";
LABEL_16:
    _os_log_impl(&dword_1AB361000, v20, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v38, 2u);
  }
LABEL_17:
  v18 = 0;
LABEL_18:
  if (!*v5)
    v23 = (id)GKOSLoggers();
  v24 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    v26 = v24;
    objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138412290;
    v39 = v27;
    _os_log_impl(&dword_1AB361000, v26, OS_LOG_TYPE_INFO, "found %@ active conversations that the local player is joined.", (uint8_t *)&v38, 0xCu);

  }
  if (v4)
  {
    objc_msgSend(v18, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v28);

  }
  else
  {
    if (!*v5)
      v29 = (id)GKOSLoggers();
    v30 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKMultiplayerP2PViewController sharePlayFetchFirstActiveConversationWithHandler:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
  }

}

id __83__GKMultiplayerP2PViewController_sharePlayFetchFirstActiveConversationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 3)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)sendInvitesToContactPlayers:(id)a3 legacyPlayers:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  GKMultiplayerP2PViewController *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  unint64_t v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 1);
  if (!*MEMORY[0x1E0D25460])
    v13 = (id)GKOSLoggers();
  v14 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl(&dword_1AB361000, v14, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:contactPlayers: %@", buf, 0xCu);
  }
  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    v15 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 1211, "-[GKMultiplayerP2PViewController sendInvitesToContactPlayers:legacyPlayers:source:completion:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dispatchGroupWithName:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v10, "count");
    v19 = MEMORY[0x1E0C809B0];
    if (v18)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke;
      v24[3] = &unk_1E59C6038;
      v24[4] = self;
      v25 = v10;
      v26 = a5;
      objc_msgSend(v17, "perform:", v24);

    }
    v20[0] = v19;
    v20[1] = 3221225472;
    v20[2] = __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3;
    v20[3] = &unk_1E59C6118;
    v21 = v11;
    v22 = self;
    v23 = v12;
    objc_msgSend(v17, "notifyOnMainQueueWithBlock:", v20);

  }
  else
  {
    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 0);
  }

}

void __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2;
  v8[3] = &unk_1E59C4DA8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "inviteContactPlayers:source:completion:", v5, v6, v8);

}

uint64_t __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__GKMultiplayerP2PViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 40), "invitePlayers:", *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)setShareInvitees
{
  _QWORD *v3;
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = (os_log_t *)MEMORY[0x1E0D25470];
  v6 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playersInvited");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v9;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:listOfInvitedPlayers: %@", buf, 0xCu);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playersInvited");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (!*v3)
          v17 = (id)GKOSLoggers();
        v18 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          v19 = v18;
          objc_msgSend(v16, "internal");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "messagesID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v40 = v21;
          _os_log_impl(&dword_1AB361000, v19, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:going to add a player (not formatted): %@", buf, 0xCu);

        }
        objc_msgSend(v16, "internal");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "messagesID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          if (!*v3)
            v24 = (id)GKOSLoggers();
          v25 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
          {
            v26 = v25;
            objc_msgSend(v16, "internal");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "messagesID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v40 = v28;
            _os_log_impl(&dword_1AB361000, v26, OS_LOG_TYPE_INFO, "GK-InviteMessage:Sender side:going to add a player (formatted): %@", buf, 0xCu);

          }
          objc_msgSend(v16, "internal");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "messagesID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v30);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }

  objc_msgSend(v32, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "multiplayerP2PViewController:setShareInvitees:", v32, v33);

}

- (void)invitePlayers:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "invitePlayers - players: %@", (uint8_t *)&v14, 0xCu);
  }
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guestPlayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecipients:", v10);

  objc_msgSend(v7, "recipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[GKMultiplayerP2PViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "multiplayerP2PViewController:startMatchingWithRequest:", self, v7);

    -[GKMultiplayerP2PViewController sendStatusUpdate](self, "sendStatusUpdate");
  }
  else
  {
    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 0);
  }

}

- (void)cancelPendingInvites
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playersInvited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[GKMultiplayerP2PViewController delegate](self, "delegate", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "internal");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "multiplayerP2PViewController:cancelInviteToPlayer:", self, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removePlayers:complete:", v5, 0);

  }
}

- (void)resetInviteesStatus
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRemotePlayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[GKMultiplayerP2PViewController delegate](self, "delegate", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "internal");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "multiplayerP2PViewController:cancelInviteToPlayer:", self, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStatus:forPlayers:complete:", 11, v5, 0);

  }
}

- (void)performActionsForButtonCancelCurrentMatching:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canCancelCurrentMatchmaking");

  if ((v6 & 1) != 0 || v3)
  {
    -[GKMultiplayerViewController setShareURL:](self, "setShareURL:", 0);
    -[GKMultiplayerP2PViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiplayerP2PViewControllerCancelMatching:", self);

    -[GKMultiplayerP2PViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "disconnectMatchForMultiplayerP2PViewController:", self);

    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 6);
    -[GKMultiplayerViewController footerView](self, "footerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStartGameButtonEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24D58]);

    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordButtonClickAction:targetId:", CFSTR("cancel"), CFSTR("cancelGame"));

  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      -[GKMultiplayerP2PViewController performActionsForButtonCancelCurrentMatching:].cold.1(v8, self);
  }
}

- (void)removedPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[16];

  v4 = a3;
  -[GKMultiplayerP2PViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "multiplayerP2PViewController:cancelInviteToPlayer:", self, v6);
  -[GKMultiplayerP2PViewController updateMode](self, "updateMode");
  -[GKMultiplayerP2PViewController sendStatusUpdate](self, "sendStatusUpdate");
  if (-[GKMultiplayerP2PViewController mode](self, "mode") == 9)
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "readyPlayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectingPlayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8 + objc_msgSend(v10, "count");
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shareplayInvitedPlayers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11 + objc_msgSend(v13, "count") - 1;
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shareplayPrepopulatedPlayers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!(v14 + v17))
    {
      if (!*MEMORY[0x1E0D25460])
        v18 = (id)GKOSLoggers();
      v19 = *MEMORY[0x1E0D25470];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AB361000, v19, OS_LOG_TYPE_INFO, "in GKMultiplayerP2PModeSharePlayStarted and each shareplay pre-populated or invited player has been removed.", buf, 2u);
      }
      -[GKMultiplayerP2PViewController startGameButtonPressed](self, "startGameButtonPressed");
    }
  }
}

- (void)updateMode
{
  void *v3;
  unint64_t v4;
  void *v5;
  GKMultiplayerP2PViewController *v6;
  uint64_t v7;
  int64_t v8;
  id v9;

  if (-[GKMultiplayerP2PViewController mode](self, "mode") == 1
    && !-[GKMultiplayerP2PViewController haveInvitedPlayers](self, "haveInvitedPlayers"))
  {
    v6 = self;
    v7 = 0;
LABEL_10:
    -[GKMultiplayerP2PViewController setMode:](v6, "setMode:", v7);
    return;
  }
  if (-[GKMultiplayerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers"))
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "readyPlayers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 < objc_msgSend(v5, "minPlayers"))
    {

      return;
    }
    v8 = -[GKMultiplayerP2PViewController mode](self, "mode");

    if (v8 != 7)
    {
      v6 = self;
      v7 = 7;
      goto LABEL_10;
    }
  }
}

- (void)playerConnected:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  uint64_t *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v4, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "Player connected = %@", buf, 0xCu);

  }
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 1338, "-[GKMultiplayerP2PViewController playerConnected:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchGroupWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "currentPlayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v4);

  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    v23 = MEMORY[0x1E0C809B0];
    v17 = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke;
    v18 = &v23;
  }
  else
  {
    v22 = MEMORY[0x1E0C809B0];
    v17 = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_3;
    v18 = &v22;
  }
  v18[1] = 3221225472;
  v18[2] = (uint64_t)v17;
  v18[3] = (uint64_t)&unk_1E59C41C0;
  v19 = v10;
  v18[4] = (uint64_t)v19;
  v20 = v4;
  v18[5] = (uint64_t)v20;
  objc_msgSend(v13, "perform:", v18);

  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_5;
  v21[3] = &unk_1E59C4148;
  v21[4] = self;
  objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v21);

}

void __50__GKMultiplayerP2PViewController_playerConnected___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_2;
  v7[3] = &unk_1E59C4DA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "setStatus:forPlayers:complete:", 7, v5, v7);

}

uint64_t __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_4;
  v7[3] = &unk_1E59C4DA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "addPlayers:withStatus:replaceAutomatches:complete:", v5, 7, 1, v7);

}

uint64_t __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__GKMultiplayerP2PViewController_playerConnected___block_invoke_5(uint64_t a1)
{
  void *v2;
  char v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _QWORD *v12;
  id v13;
  os_log_t *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  char v26;
  void *v27;
  uint64_t v28;
  id v29;
  os_log_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  id v36;
  NSObject *v37;
  const char *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  char v44;
  void *v45;
  unint64_t v46;
  id v47;
  os_log_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  NSObject *v54;
  const char *v55;
  id v56;
  id v57;
  os_log_t v58;
  void *v59;
  void *v60;
  id v61;
  char v62;
  id v63;
  uint64_t v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  const __CFString *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sendStatusUpdate");
  objc_msgSend(*(id *)(a1 + 32), "matchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "havePendingPlayers");
    v4 = objc_msgSend(*(id *)(a1 + 32), "haveInvitedPlayers");
    objc_msgSend(*(id *)(a1 + 32), "matchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "maxPlayers");
    objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "players");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v8, "count");

    objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "readyPlayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v12 = (_QWORD *)MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
      v13 = (id)GKOSLoggers();
    v14 = (os_log_t *)MEMORY[0x1E0D25470];
    v15 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = *(void **)(a1 + 32);
      v18 = v15;
      objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "mode"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "playersInvited");
      v21 = v4;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "havePendingPlayers");
      v25 = CFSTR("No");
      *(_DWORD *)buf = 138412802;
      v66 = v19;
      v67 = 2112;
      if (v24)
        v25 = CFSTR("Has");
      v68 = v22;
      v69 = 2112;
      v70 = v25;
      _os_log_impl(&dword_1AB361000, v18, OS_LOG_TYPE_INFO, "mode = %@ - invited players = %@ - %@ pending players", buf, 0x20u);

      v4 = v21;
      v14 = (os_log_t *)MEMORY[0x1E0D25470];
      v12 = (_QWORD *)MEMORY[0x1E0D25460];

    }
    if (objc_msgSend(*(id *)(a1 + 32), "mode") == 2)
      v26 = v3;
    else
      v26 = 1;
    if ((v26 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "matchRequest");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "maxPlayers");

      if (v28 == v11)
      {
        if (!*v12)
          v29 = (id)GKOSLoggers();
        v30 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        v31 = (void *)MEMORY[0x1E0CB37E8];
        v32 = *(void **)(a1 + 32);
        v33 = v30;
        objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "mode"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v66 = v34;
        v35 = "In GKMultiplayerP2PMode %@, have enough players. Start game!";
        goto LABEL_17;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "mode") == 9)
      {
        objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "players");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (v11 >= v41)
        {
          if (!*v12)
            v53 = (id)GKOSLoggers();
          v54 = *v14;
          if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
            goto LABEL_52;
          *(_WORD *)buf = 0;
          v55 = "In GKMultiplayerP2PModeSharePlayStarted and no pending players. Change to GKMultiplayerP2PModeInviteOrStart";
LABEL_51:
          _os_log_impl(&dword_1AB361000, v54, OS_LOG_TYPE_INFO, v55, buf, 2u);
          goto LABEL_52;
        }
      }
      if (!objc_msgSend(*(id *)(a1 + 32), "canStartWithMinimumPlayers")
        || (objc_msgSend(*(id *)(a1 + 32), "matchRequest"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            v43 = objc_msgSend(v42, "minPlayers"),
            v42,
            v11 < v43))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "mode") == 1)
        {
          if ((v4 & 1) != 0)
            goto LABEL_24;
        }
        else
        {
          if (objc_msgSend(*(id *)(a1 + 32), "mode") == 7)
            v44 = v4;
          else
            v44 = 1;
          if ((v44 & 1) != 0)
            goto LABEL_24;
        }
        objc_msgSend(*(id *)(a1 + 32), "matchRequest");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "maxPlayers");

        if (v11 >= v46)
        {
          if ((v3 & 1) != 0)
            goto LABEL_24;
          if (!*v12)
            v57 = (id)GKOSLoggers();
          v58 = *v14;
          if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
            goto LABEL_23;
          v59 = (void *)MEMORY[0x1E0CB37E8];
          v60 = *(void **)(a1 + 32);
          v33 = v58;
          objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "mode"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v66 = v34;
          v35 = "In GKMultiplayerP2PMode:%@ , and no pending players. Start game!";
LABEL_17:
          _os_log_impl(&dword_1AB361000, v33, OS_LOG_TYPE_INFO, v35, buf, 0xCu);

LABEL_23:
          objc_msgSend(*(id *)(a1 + 32), "startGame");
LABEL_24:
          objc_msgSend(*(id *)(a1 + 32), "updateFooterButtonStates");
          return;
        }
        if (!*v12)
          v47 = (id)GKOSLoggers();
        v48 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
        {
          v49 = (void *)MEMORY[0x1E0CB37E8];
          v50 = *(void **)(a1 + 32);
          v51 = v48;
          objc_msgSend(v49, "numberWithInteger:", objc_msgSend(v50, "mode"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v66 = v52;
          _os_log_impl(&dword_1AB361000, v51, OS_LOG_TYPE_INFO, "In GKMultiplayerP2PMode: %@, all invited players connected but there are less players than maxPlayers. Set mode to GKMultiplayerP2PModeInviteOrStart.", buf, 0xCu);

        }
LABEL_52:
        objc_msgSend(*(id *)(a1 + 32), "setMode:", 7);
        goto LABEL_24;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "mode") == 1)
      {
        if (!*v12)
          v56 = (id)GKOSLoggers();
        v54 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
          goto LABEL_52;
        *(_WORD *)buf = 0;
        v55 = "In GKMultiplayerP2PModeInviting mode, have enough players for fast start but players can invite more.";
        goto LABEL_51;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "mode") == 2 || objc_msgSend(*(id *)(a1 + 32), "mode") == 3)
      {
        if (!*v12)
          v61 = (id)GKOSLoggers();
        v37 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v38 = "In GKMultiplayerP2PModeMatching / GKMultiplayerP2PModeStartingGame mode, have enough players for fast start. Start game!";
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 32), "mode") == 7)
          v62 = v3;
        else
          v62 = 1;
        if ((v62 & 1) != 0 || v6 != v64)
          goto LABEL_24;
        if (!*v12)
          v63 = (id)GKOSLoggers();
        v37 = *v14;
        if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v38 = "In GKMultiplayerP2PModeInviteOrStart mode with fast start enabled, and all invited players are ready.. Start game!";
      }
    }
    else
    {
      if (!*v12)
        v36 = (id)GKOSLoggers();
      v37 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v38 = "In GKMultiplayerP2PModeMatching mode, and no pending players. Start game!";
    }
    _os_log_impl(&dword_1AB361000, v37, OS_LOG_TYPE_INFO, v38, buf, 2u);
    goto LABEL_23;
  }
}

- (void)playerDisconnected:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GKInvite *acceptedInvite;
  void *v15;
  int v16;
  id v17;
  os_log_t v18;
  id v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (os_log_t *)MEMORY[0x1E0D25470];
  v8 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v4, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v11;
    _os_log_impl(&dword_1AB361000, v9, OS_LOG_TYPE_INFO, "Player disconnected: %@", buf, 0xCu);

  }
  if (-[GKMultiplayerP2PViewController mode](self, "mode") == 5
    || !-[GKMultiplayerP2PViewController mode](self, "mode"))
  {
    if (!*v5)
      v19 = (id)GKOSLoggers();
    v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB361000, v20, OS_LOG_TYPE_INFO, "Some player disconnected but we should do nothing because the local player is in either GKMultiplayerP2PModeFailed or GKMultiplayerP2PModeSetup mode", buf, 2u);
    }
  }
  else
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStatus:forPlayers:complete:", 3, v13, 0);

    acceptedInvite = self->_acceptedInvite;
    if (!acceptedInvite
      || (-[GKInvite sender](acceptedInvite, "sender"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v4, "isEqual:", v15),
          v15,
          v16))
    {
      if (!*v5)
        v17 = (id)GKOSLoggers();
      v18 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        -[GKMultiplayerP2PViewController playerDisconnected:].cold.1(v18, v4, self);
      -[GKMultiplayerP2PViewController showMatchDisconnectedAlertForPlayer:](self, "showMatchDisconnectedAlertForPlayer:", v4);
    }
  }

}

- (void)sendStatusUpdate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  _QWORD v40[4];
  uint8_t buf[4];
  void *v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!self->_acceptedInvite && !self->_hosted)
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v2, "currentPlayers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v36;
      v32 = *MEMORY[0x1E0D24EB8];
      v31 = *MEMORY[0x1E0D24B60];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v36 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v8 = v2;
          v9 = objc_msgSend(v2, "statusForPlayer:", v7);
          objc_msgSend(v7, "internal");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "playerID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v44[0] = v11;
            v43[0] = v32;
            v43[1] = v31;
            objc_msgSend(v7, "alias");
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v12)
              v14 = (const __CFString *)v12;
            else
              v14 = &stru_1E59EB978;
            v44[1] = v14;
            v43[2] = CFSTR("GKInviteStatusKey");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v44[2] = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "addObject:", v16);
          }
          else
          {
            if (!*MEMORY[0x1E0D25460])
              v17 = (id)GKOSLoggers();
            v18 = *MEMORY[0x1E0D25470];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v7;
              _os_log_error_impl(&dword_1AB361000, v18, OS_LOG_TYPE_ERROR, "we don't have a playerID for player: %@", buf, 0xCu);
            }
          }

          v2 = v8;
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v4);
    }

    if (objc_msgSend(v2, "automatchPlayerCount") >= 1)
    {
      v19 = 0;
      v20 = *MEMORY[0x1E0D24EB8];
      v21 = *MEMORY[0x1E0D24B60];
      do
      {
        v39[0] = v20;
        v39[1] = v21;
        v40[0] = &stru_1E59EB978;
        v40[1] = &stru_1E59EB978;
        v39[2] = CFSTR("automatchParticipant");
        v39[3] = CFSTR("GKInviteStatusKey");
        v40[2] = MEMORY[0x1E0C9AAB0];
        v40[3] = &unk_1E5A5DFE0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v22);

        ++v19;
      }
      while (v19 < objc_msgSend(v2, "automatchPlayerCount"));
    }
    v34 = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v33, CFSTR("involvedPlayers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*MEMORY[0x1E0D25460])
      v24 = (id)GKOSLoggers();
    v25 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v23;
      _os_log_impl(&dword_1AB361000, v25, OS_LOG_TYPE_INFO, "sending status message: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v23, 200, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v26, "length") + 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appendBytes:length:", &v34, 4);
    objc_msgSend(v27, "appendData:", v26);
    -[GKMultiplayerP2PViewController delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "multiplayerP2PViewController:sendData:", self, v27);

  }
}

- (void)processStatusUpdateMessageFromPlayer:(id)a3 bytes:(const char *)a4 withLength:(unsigned int)a5
{
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  os_log_t *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  char v50;
  GKMultiplayerP2PViewController *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  _QWORD v60[4];
  id v61;
  id v62;
  GKMultiplayerP2PViewController *v63;
  id v64;
  uint64_t v65;
  char v66;
  _QWORD v67[4];
  id v68;
  id v69;
  GKMultiplayerP2PViewController *v70;
  id v71;
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v11 = (id)GKOSLoggers();
  v12 = (os_log_t *)MEMORY[0x1E0D25470];
  v13 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v9;
    _os_log_impl(&dword_1AB361000, v13, OS_LOG_TYPE_INFO, "Process status update - %@ - start", buf, 0xCu);
  }
  v56 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, a5);
  v77 = 0;
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = v14;
  objc_msgSend(v14, "objectForKey:", CFSTR("involvedPlayers"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = self;
  -[GKMultiplayerP2PViewController acceptedInvite](self, "acceptedInvite");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sender");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "internal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "playerID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v16, "isEqualToString:", v20);

  if (!*v10)
    v21 = (id)GKOSLoggers();
  v22 = *v12;
  v23 = v56;
  v24 = v52;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v80 = (uint64_t)v56;
    v81 = 2112;
    v82 = v52;
    _os_log_impl(&dword_1AB361000, v22, OS_LOG_TYPE_INFO, "Process status update - %@ - playerInfos = %@", buf, 0x16u);
  }
  v26 = v54;
  v25 = (void *)v55;
  v27 = v53;
  if (v55 && !v53 && v54 && v52 && objc_msgSend(v52, "count"))
  {
    v49 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v52, "count"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v52;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (!v28)
    {
      v30 = 0;
      goto LABEL_31;
    }
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v74;
    v32 = *MEMORY[0x1E0D24EB8];
    while (1)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v74 != v31)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v34, "objectForKey:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
        {
          if (!objc_msgSend(v35, "length"))
          {
            v37 = 1;
            goto LABEL_24;
          }
          objc_msgSend(v58, "addObject:", v36);
        }
        v37 = 0;
LABEL_24:
        objc_msgSend(v34, "objectForKey:", CFSTR("automatchParticipant"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "BOOLValue");

        objc_msgSend(v34, "objectForKey:", CFSTR("GKInviteStatusKey"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40 && objc_msgSend(v36, "length"))
          objc_msgSend(v57, "setObject:forKey:", v40, v36);
        v30 += v37 | v39;

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      if (!v29)
      {
LABEL_31:

        v41 = (void *)MEMORY[0x1E0D252A8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 1526, "-[GKMultiplayerP2PViewController processStatusUpdateMessageFromPlayer:bytes:withLength:]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "dispatchGroupWithName:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = objc_msgSend(v58, "count");
        v45 = MEMORY[0x1E0C809B0];
        if (v44)
        {
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke;
          v67[3] = &unk_1E59C6168;
          v68 = v58;
          v72 = v50;
          v69 = v43;
          v70 = v51;
          v71 = v48;
          objc_msgSend(v69, "perform:", v67);

        }
        v60[0] = v45;
        v60[1] = 3221225472;
        v60[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3;
        v60[3] = &unk_1E59C61B8;
        v23 = v56;
        v61 = v56;
        v62 = v43;
        v63 = v51;
        v64 = v57;
        v66 = v50;
        v65 = v30;
        v46 = v57;
        v47 = v43;
        objc_msgSend(v47, "notifyOnMainQueueWithBlock:", v60);

        v8 = v49;
        v26 = v54;
        v25 = (void *)v55;
        v24 = v52;
        v27 = 0;
        break;
      }
    }
  }

}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D25358];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2;
  v9[3] = &unk_1E59C6140;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v15 = *(_BYTE *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v6;
  v11 = v7;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 56);
  v14 = v3;
  v8 = v3;
  objc_msgSend(v4, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v5, v9);

}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0D25350], "canPlayMultiplayerGameWithPlayers:", v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 10, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("players"));
  if (*(_BYTE *)(a1 + 72))
  {
    v18 = v3;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "multiplayerDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "players");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "internal");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "playerID");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            v15 = *(void **)(a1 + 48);
            objc_msgSend(v11, "internal");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "playerID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v15) = objc_msgSend(v15, "containsObject:", v17);

            if ((v15 & 1) == 0)
              objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
          }
          else
          {

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("playersToRemove"));
    v3 = v18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  os_log_t *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = (os_log_t *)MEMORY[0x1E0D25470];
  v5 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "Process status update - %@ - mainQueue", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "code");

  if (v8 == 10)
  {
    if (!*v2)
      v9 = (id)GKOSLoggers();
    v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend(*(id *)(a1 + 48), "showParentalControlsRestrictionAlert");
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerP2PViewController.m", 1559, "-[GKMultiplayerP2PViewController processStatusUpdateMessageFromPlayer:bytes:withLength:]_block_invoke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dispatchGroupWithName:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("playersToRemove"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    v23 = MEMORY[0x1E0C809B0];
    if (v22)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_183;
      v35[3] = &unk_1E59C41C0;
      v24 = v21;
      v25 = *(_QWORD *)(a1 + 48);
      v36 = v24;
      v37 = v25;
      objc_msgSend(v20, "perform:", v35);

    }
    v28[0] = v23;
    v28[1] = 3221225472;
    v28[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_185;
    v28[3] = &unk_1E59C61B8;
    v29 = *(id *)(a1 + 40);
    v30 = *(id *)(a1 + 56);
    v26 = *(id *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 48);
    v31 = v26;
    v32 = v27;
    v34 = *(_BYTE *)(a1 + 72);
    v33 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v20, "notifyOnMainQueueWithBlock:", v28);

  }
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_183(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "according to the status update from sender, remove players: %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "multiplayerDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_184;
  v10[3] = &unk_1E59C4DA8;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v7, "removePlayers:complete:", v8, v10);

}

uint64_t __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_2_185(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("players"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_186;
  v17[3] = &unk_1E59C6190;
  v18 = *(id *)(a1 + 40);
  v5 = v3;
  v19 = v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v17);
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v7;
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v2;
    _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "Process status update - %@ - %@ players = %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 56));
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 56), "multiplayerDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 64);
    v14 = *(_BYTE *)(a1 + 72) != 0;
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_188;
    v15[3] = &unk_1E59C48A0;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v12, "setParticipantsWithPlayers:automatchPlayerCount:shouldUpdateAutomatchPlayerCount:andStatuses:complete:", v2, v13, v14, v5, v15);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak((id *)buf);

}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_186(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  objc_msgSend(v3, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v10, "referenceKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_188(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "havePendingPlayers");

  v4 = objc_loadWeakRetained(v1);
  v5 = objc_msgSend(v4, "mode");

  if (v5 == 2 && (v3 & 1) == 0)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "startGame");

  }
}

- (void)showParentalControlsRestrictionAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__GKMultiplayerP2PViewController_showParentalControlsRestrictionAlert__block_invoke;
  v10[3] = &unk_1E59C4148;
  v10[4] = self;
  v9 = (id)-[GKMultiplayerP2PViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v4, v6, v8, v10);

}

void __70__GKMultiplayerP2PViewController_showParentalControlsRestrictionAlert__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (void)showInviterDisconnectedAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInvite sender](self->_acceptedInvite, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNameWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__GKMultiplayerP2PViewController_showInviterDisconnectedAlert__block_invoke;
  v14[3] = &unk_1E59C4148;
  v14[4] = self;
  v13 = (id)-[GKMultiplayerP2PViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v4, v10, v12, v14);

}

uint64_t __62__GKMultiplayerP2PViewController_showInviterDisconnectedAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)showAutomatchingErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__GKMultiplayerP2PViewController_showAutomatchingErrorAlert__block_invoke;
  v10[3] = &unk_1E59C4148;
  v10[4] = self;
  v9 = (id)-[GKMultiplayerP2PViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v4, v6, v8, v10);

}

uint64_t __60__GKMultiplayerP2PViewController_showAutomatchingErrorAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMode:", 0);
}

- (void)showNoInternetAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__GKMultiplayerP2PViewController_showNoInternetAlert__block_invoke;
  v10[3] = &unk_1E59C4148;
  v10[4] = self;
  v9 = (id)-[GKMultiplayerP2PViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v4, v6, v8, v10);

}

void __53__GKMultiplayerP2PViewController_showNoInternetAlert__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (void)showMatchDisconnectedAlertForPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];

  v4 = a3;
  if (self->_acceptedInvite)
  {
    -[GKMultiplayerP2PViewController setMode:](self, "setMode:", 5);
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayNameWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke;
    v27[3] = &unk_1E59C4148;
    v27[4] = self;
    v14 = (id)-[GKMultiplayerP2PViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v6, v11, v13, v27);

  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayNameWithOptions:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_2;
    v25[3] = &unk_1E59C4708;
    v25[4] = self;
    v26 = v4;
    v24 = (id)-[GKMultiplayerP2PViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v16, v21, v23, v25);

    v5 = v26;
  }

}

uint64_t __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_3;
  v5[3] = &unk_1E59C4708;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "removePlayers:complete:", v3, v5);

}

void __70__GKMultiplayerP2PViewController_showMatchDisconnectedAlertForPlayer___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "mode") == 7
    || objc_msgSend(*(id *)(a1 + 32), "mode") == 1
    || objc_msgSend(*(id *)(a1 + 32), "mode") == 9)
  {
    if (!*MEMORY[0x1E0D25460])
      v2 = (id)GKOSLoggers();
    v3 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "internal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "after disconnection, player removed: %@.", (uint8_t *)&v14, 0xCu);

    }
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v8 = (id)GKOSLoggers();
    v9 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 40);
      v11 = v9;
      objc_msgSend(v10, "internal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1AB361000, v11, OS_LOG_TYPE_INFO, "after disconnection, player removed: %@. and matching has started so we need to cancel this game.", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setMode:", 5);
    objc_msgSend(*(id *)(a1 + 32), "performActionsForButtonCancelCurrentMatching:", 0);
  }
}

- (void)cancelAlertWithoutDelegateCallback
{
  void *v3;
  char isKindOfClass;

  -[GKMultiplayerP2PViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[GKMultiplayerP2PViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[GKMultiplayerP2PViewController firstActiveConversation](self, "firstActiveConversation");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  objc_msgSend(v5, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerP2PViewController firstActiveConversation](self, "firstActiveConversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
LABEL_4:
    if (objc_msgSend(v5, "state") == 3 || objc_msgSend(v5, "state") == 4)
    {
      if (!*MEMORY[0x1E0D25460])
        v12 = (id)GKOSLoggers();
      v13 = (void *)*MEMORY[0x1E0D25470];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = v13;
        objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v5, "state"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v5;
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "State of conversation(%@) changed to: %@", buf, 0x16u);

      }
      if (objc_msgSend(v5, "state") == 4)
      {
        -[GKMultiplayerViewController setCanStartGroupActivities:](self, "setCanStartGroupActivities:", 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __82__GKMultiplayerP2PViewController_conversationManager_stateChangedForConversation___block_invoke;
        block[3] = &unk_1E59C4148;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      else if (objc_msgSend(v5, "state") == 3)
      {
        -[GKMultiplayerViewController setCanStartGroupActivities:](self, "setCanStartGroupActivities:", 1);
        -[GKMultiplayerP2PViewController setFirstActiveConversation:](self, "setFirstActiveConversation:", v5);
      }
    }
  }

}

uint64_t __82__GKMultiplayerP2PViewController_conversationManager_stateChangedForConversation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  GKMultiplayerP2PViewController *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a4;
  objc_msgSend(v5, "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeRemoteParticipants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke;
  v28[3] = &unk_1E59C61E0;
  v11 = v8;
  v29 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v28);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerP2PViewController activeRemoteParticipants](self, "activeRemoteParticipants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_2;
  v23[3] = &unk_1E59C6208;
  v14 = v11;
  v24 = v14;
  v25 = self;
  v15 = v12;
  v26 = v15;
  v16 = v7;
  v27 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v23);

  if (objc_msgSend(v15, "count"))
  {
    if (!*MEMORY[0x1E0D25460])
      v17 = (id)GKOSLoggers();
    v18 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v15;
      _os_log_impl(&dword_1AB361000, v18, OS_LOG_TYPE_INFO, "remote members changed and someone has left: %@", buf, 0xCu);
    }
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_213;
    v21[3] = &unk_1E59C4708;
    v21[4] = self;
    v22 = v16;
    objc_msgSend(v19, "removePrepopulatedPlayersIfExisted:completionHandler:", v20, v21);

  }
}

void __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a2, "identifier"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a2;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v13, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v5);

  if ((v3 & 1) != 0)
  {
    v6 = *(void **)(a1 + 56);
    v7 = (uint64_t)v13;
  }
  else
  {
    objc_msgSend(v13, "identifier");

    objc_msgSend(*(id *)(a1 + 40), "game");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = IDSIDAliasHashUInt64();

    v12 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v11);
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = v12;
    v13 = (id)v7;
  }
  objc_msgSend(v6, "addObject:", v7);

}

uint64_t __101__GKMultiplayerP2PViewController_conversationManager_activeRemoteParticipantsChangedForConversation___block_invoke_213(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveRemoteParticipants:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_hosted = a3;
}

- (GKMultiplayerP2PViewControllerDelegate)delegate
{
  return (GKMultiplayerP2PViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_activeRemoteParticipants, a3);
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (BOOL)startStagedActivity
{
  return self->_startStagedActivity;
}

- (void)setStartStagedActivity:(BOOL)a3
{
  self->_startStagedActivity = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedInvite, a3);
}

- (double)inviteeConnectionTimeStamp
{
  return self->_inviteeConnectionTimeStamp;
}

- (void)setInviteeConnectionTimeStamp:(double)a3
{
  self->_inviteeConnectionTimeStamp = a3;
}

- (BOOL)userCancelledMatching
{
  return self->_userCancelledMatching;
}

- (void)setUserCancelledMatching:(BOOL)a3
{
  self->_userCancelledMatching = a3;
}

- (BOOL)datasourceConfigured
{
  return self->_datasourceConfigured;
}

- (void)setDatasourceConfigured:(BOOL)a3
{
  self->_datasourceConfigured = a3;
}

- (BOOL)sharePlayEnabled
{
  return self->_sharePlayEnabled;
}

- (void)setSharePlayEnabled:(BOOL)a3
{
  self->_sharePlayEnabled = a3;
}

- (NSArray)existingRemoteReadyPlayers
{
  return self->_existingRemoteReadyPlayers;
}

- (void)setExistingRemoteReadyPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_existingRemoteReadyPlayers, a3);
}

- (TUConversation)firstActiveConversation
{
  return self->_firstActiveConversation;
}

- (void)setFirstActiveConversation:(id)a3
{
  objc_storeStrong((id *)&self->_firstActiveConversation, a3);
}

- (OS_dispatch_queue)conversationManagerQueue
{
  return self->_conversationManagerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationManagerQueue, 0);
  objc_storeStrong((id *)&self->_firstActiveConversation, 0);
  objc_storeStrong((id *)&self->_existingRemoteReadyPlayers, 0);
  objc_storeStrong((id *)&self->_acceptedInvite, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sharePlayFetchFirstActiveConversationWithHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "handler not set for sharePlayFetchLiveConversationByUUID", a5, a6, a7, a8, 0);
}

- (void)performActionsForButtonCancelCurrentMatching:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(a2, "multiplayerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "players");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "multiplayerDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readyPlayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "multiplayerDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "automatchPlayerCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 138412802;
  v17 = v7;
  v18 = 2112;
  v19 = v11;
  v20 = 2112;
  v21 = v14;
  OUTLINED_FUNCTION_1_4(&dword_1AB361000, v4, v15, "cannot cancel current matching. players count = %@, ready players count = %@, automatch player count = %@", (uint8_t *)&v16);

}

- (void)playerDisconnected:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "acceptedInvite");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "mode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = v9;
  OUTLINED_FUNCTION_1_4(&dword_1AB361000, v5, v10, "Player: %@ disconnected while making match. Accepted invite: %@, Matchmaker mode %@", (uint8_t *)&v11);

}

void __88__GKMultiplayerP2PViewController_processStatusUpdateMessageFromPlayer_bytes_withLength___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1AB361000, a1, a3, "Match contains a player that is not a friend and restriction prevents playing with non-friends.", a5, a6, a7, a8, 0);
}

@end
