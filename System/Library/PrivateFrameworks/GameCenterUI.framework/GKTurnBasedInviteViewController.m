@implementation GKTurnBasedInviteViewController

- (id)pageId
{
  return CFSTR("turnBasedLobby");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedInviteViewController;
  -[GKMultiplayerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutomatchAddedToMinInHeader:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedInviteViewController;
  -[GKMultiplayerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedInviteViewController pageId](self, "pageId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordPageWithID:pageContext:pageType:", v5, CFSTR("turnBasedGame"), CFSTR("multiplayer"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKTurnBasedInviteViewController;
  -[GKMultiplayerViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[GKMultiplayerViewController originalMatchRequest](self, "originalMatchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validateForTurnBased");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[GKTurnBasedInviteViewController finishWithError:](self, "finishWithError:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKTurnBasedInviteViewController;
  -[GKCollectionViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (!-[GKTurnBasedInviteViewController mode](self, "mode"))
  {
    -[GKTurnBasedInviteViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", self);

    if ((v6 & 1) == 0)
      -[GKTurnBasedInviteViewController removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:](self, "removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:", 1, 0);
  }
}

- (void)cleanupStateForCancelOrErrorWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a3;
  objc_msgSend(v4, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[GKTurnBasedInviteViewController removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:](self, "removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:", 1, v6);
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__GKTurnBasedInviteViewController_cancel__block_invoke;
  v2[3] = &unk_1E59C4148;
  v2[4] = self;
  -[GKTurnBasedInviteViewController cleanupStateForCancelOrErrorWithHandler:](self, "cleanupStateForCancelOrErrorWithHandler:", v2);
}

void __41__GKTurnBasedInviteViewController_cancel__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "turnBasedInviteViewControllerWasCancelled:", *(_QWORD *)(a1 + 32));

}

- (void)finishWithMatchID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKTurnBasedInviteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnBasedInviteViewController:didCreateMatchID:", self, v4);

}

- (void)finishWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__GKTurnBasedInviteViewController_finishWithError___block_invoke;
  v6[3] = &unk_1E59C4708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[GKTurnBasedInviteViewController cleanupStateForCancelOrErrorWithHandler:](self, "cleanupStateForCancelOrErrorWithHandler:", v6);

}

void __51__GKTurnBasedInviteViewController_finishWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "turnBasedInviteViewController:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)performActionsForButtonCancelCurrentMatching
{
  -[GKTurnBasedInviteViewController cleanupStateForCancelOrErrorWithHandler:](self, "cleanupStateForCancelOrErrorWithHandler:", 0);
}

- (void)didClickCancelForServiceUnavailableAlert
{
  void *v3;
  id v4;

  -[GKTurnBasedInviteViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GKTurnBasedInviteViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnBasedInviteViewControllerWasCancelled:", self);

  }
}

- (void)setMode:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    if (a3 == 1 || a3 == 2)
    {
      -[GKMultiplayerViewController setAddButtonEnabled:](self, "setAddButtonEnabled:", 0);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRemovingEnabled:", 0);

      GKGameCenterUIFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
    }
    else
    {
      v6 = 1;
      -[GKMultiplayerViewController setAddButtonEnabled:](self, "setAddButtonEnabled:", 1);
      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRemovingEnabled:", 1);
      v12 = 0;
    }

    -[GKTurnBasedInviteViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v6);

    -[GKMultiplayerViewController footerView](self, "footerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFooterStatusString:", v12);

    -[GKMultiplayerViewController footerView](self, "footerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartGameButtonEnabled:", v6);

    -[GKTurnBasedInviteViewController updateStartGameButtonTitle](self, "updateStartGameButtonTitle");
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didChangeMode");

  }
}

- (BOOL)isInSetupMode
{
  return -[GKTurnBasedInviteViewController mode](self, "mode") == 0;
}

- (void)handleNewParticipantCount:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKTurnBasedInviteViewController;
  -[GKMultiplayerViewController handleNewParticipantCount:](&v9, sel_handleNewParticipantCount_);
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaxPlayers:", a3);

  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxPlayers");
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultNumberOfPlayers:", v7);

}

- (int64_t)automatchParticipantStatus
{
  if (-[GKTurnBasedInviteViewController mode](self, "mode") == 1)
    return 13;
  else
    return 0;
}

- (void)updateStartGameButtonTitle
{
  void *v3;
  void *v4;
  id v5;

  if ((unint64_t)-[GKTurnBasedInviteViewController mode](self, "mode") <= 1)
  {
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
  }
}

- (void)startGameButtonPressed
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = v4;
    objc_msgSend(v5, "numberWithInteger:", -[GKTurnBasedInviteViewController mode](self, "mode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "TBGame - startGameButtonPressed, self.mode = %@", (uint8_t *)&v11, 0xCu);

  }
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordButtonClickAction:targetId:", CFSTR("play"), CFSTR("startGame"));

  v9 = -[GKTurnBasedInviteViewController mode](self, "mode");
  if (v9 == 1)
  {
    -[GKTurnBasedInviteViewController performActionsForButtonCancelCurrentMatching](self, "performActionsForButtonCancelCurrentMatching");
  }
  else if (!v9)
  {
    -[GKMultiplayerViewController performActionsForButtonStartGame](self, "performActionsForButtonStartGame");
    -[GKMultiplayerViewController footerView](self, "footerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartGameButtonEnabled:", 0);

  }
}

- (void)inviteFriendsButtonPressed
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedInviteViewController pageId](self, "pageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("inviteFriends"), CFSTR("button"), v4, CFSTR("multiplayer"));

  v5.receiver = self;
  v5.super_class = (Class)GKTurnBasedInviteViewController;
  -[GKMultiplayerViewController inviteFriendsButtonPressed](&v5, sel_inviteFriendsButtonPressed);
}

- (void)createGameWithPlayersToInvite:(id)a3 forSharing:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *inviteMessageDictionary;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke;
  v35[3] = &unk_1E59C4148;
  v35[4] = self;
  objc_msgSend(MEMORY[0x1E0D25260], "named:execute:", CFSTR("TBGame - createGameWithPlayersToInvite"), v35);
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  if (a4)
  {
    objc_msgSend(v12, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreloadedMatch:", 1);
  }
  else
  {
    -[GKTurnBasedInviteViewController setMode:](self, "setMode:", 2);
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentPlayers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStatus:forPlayers:complete:", 7, v15, 0);

  }
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "guestPlayers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRecipients:", v18);

  }
  else
  {
    objc_msgSend(v12, "setRecipients:", v8);
  }
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "playerRange");
  v22 = v21;

  objc_msgSend(v12, "setMinPlayers:", v20 + v22);
  if (!a4)
    objc_msgSend(v12, "setMaxPlayers:", objc_msgSend(v12, "minPlayers"));
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRecentNumberOfPlayers:", objc_msgSend(v12, "maxPlayers"));

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v12, "maxPlayers");
  -[GKMultiplayerViewController game](self, "game");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRecentNumberOfPlayers:forBundleID:", v25, v27);

  objc_msgSend(v12, "setDefaultNumberOfPlayers:", 0);
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "turnBasedService");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "internal");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  inviteMessageDictionary = self->_inviteMessageDictionary;
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_53;
  v33[3] = &unk_1E59C7FC0;
  v33[4] = self;
  v34 = v9;
  v32 = v9;
  objc_msgSend(v29, "createTurnBasedGameForMatchRequest:individualMessages:handler:", v30, inviteMessageDictionary, v33);

}

void __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  v3 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "matchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "TBGame - createGameWithPlayersToInvite, self.matchRequest = %@", (uint8_t *)&v7, 0xCu);

  }
}

void __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_2;
  v10[3] = &unk_1E59C7F98;
  v11 = v5;
  v7 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v12 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __84__GKTurnBasedInviteViewController_createGameWithPlayersToInvite_forSharing_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D253E0]), "initWithInternalRepresentation:", *(_QWORD *)(a1 + 32));
    v7 = v2;
    if (!*(_QWORD *)(a1 + 56))
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(v2, "matchID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "performSelector:withObject:afterDelay:", sel_finishWithMatchID_, v4, 1.0);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setInvitesFailedWithError:", *(_QWORD *)(a1 + 48));
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "setDidStartForcedAutomatch:", 0);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = v7;
  if (v5)
  {
    (*(void (**)(void))(v5 + 16))();
    v6 = v7;
  }

}

- (void)setInvitesFailedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  GKTurnBasedInviteViewController *v22;
  _QWORD aBlock[5];
  _QWORD v24[5];

  v4 = a3;
  -[GKTurnBasedInviteViewController setMode:](self, "setMode:", 0);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D25220]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "intValue") == 5068)
  {
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke;
    v24[3] = &unk_1E59C4148;
    v24[4] = self;
    v11 = v24;
  }
  else
  {
    v12 = objc_msgSend(v6, "intValue");
    GKGameCenterUIFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != 5094)
    {
      GKGetLocalizedStringFromTableInBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      GKGameCenterUIFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_3;
      v20[3] = &unk_1E59C4708;
      v21 = v4;
      v22 = self;
      v15 = _Block_copy(v20);

      goto LABEL_7;
    }
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    GKGameCenterUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_2;
    aBlock[3] = &unk_1E59C4148;
    aBlock[4] = self;
    v11 = aBlock;
  }
  v15 = _Block_copy(v11);
LABEL_7:
  GKGameCenterUIFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)-[GKTurnBasedInviteViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v8, v10, v18, v15);

}

uint64_t __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __61__GKTurnBasedInviteViewController_setInvitesFailedWithError___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnBasedInviteViewController:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(v2, "cancel");
  }
}

- (BOOL)canStartForcedAutomatch
{
  if (-[GKTurnBasedInviteViewController mode](self, "mode"))
    return 0;
  else
    return !-[GKMultiplayerViewController didStartForcedAutomatch](self, "didStartForcedAutomatch");
}

- (void)playNow
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB361000, v4, OS_LOG_TYPE_INFO, "TBGame - playNow", v5, 2u);
  }
  -[GKTurnBasedInviteViewController removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:](self, "removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:", 1, 0);
  -[GKTurnBasedInviteViewController createGameWithPlayersToInvite:forSharing:handler:](self, "createGameWithPlayersToInvite:forSharing:handler:", 0, 0, 0);
}

- (BOOL)isLoadingOrRemovingPreloadedMatch
{
  return self->_deletePreloadedMatch;
}

- (void)sendInvitesToContactPlayers:(id)a3 legacyPlayers:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!*MEMORY[0x1E0D25460])
    v13 = (id)GKOSLoggers();
  v14 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1AB361000, v14, OS_LOG_TYPE_INFO, "TBGame - sendInvitesToContactPlayers, contactPlayers = %@, legacyPlayers = %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0D252A8], "dispatchGroupWithName:", CFSTR("loadShareURLWithCompletion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke;
  v28[3] = &unk_1E59C41C0;
  v28[4] = self;
  v17 = v15;
  v29 = v17;
  objc_msgSend(v17, "perform:", v28);
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_5;
  v22[3] = &unk_1E59C8060;
  v22[4] = self;
  v23 = v17;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = a5;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  v21 = v17;
  objc_msgSend(v21, "notifyOnMainQueueWithBlock:", v22);

}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:", objc_msgSend(*(id *)(a1 + 32), "deletePreloadedMatch"), 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "multiplayerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playersToBeInvited");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2;
  v10[3] = &unk_1E59C8010;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v4, "createGameWithPlayersToInvite:forSharing:handler:", v6, 1, v10);

}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  id v10;
  int8x16_t v11;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "setMatch:", v5);
    if (objc_msgSend(*(id *)(a1 + 40), "deletePreloadedMatch"))
    {
      objc_msgSend(*(id *)(a1 + 40), "removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:", 0, 0);
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3;
      v9[3] = &unk_1E59C42A0;
      v10 = v5;
      v8 = *(int8x16_t *)(a1 + 32);
      v7 = (id)v8.i64[0];
      v11 = vextq_s8(v8, v8, 8uLL);
      objc_msgSend(v6, "perform:", v9);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "matchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_4;
  v7[3] = &unk_1E59C7FE8;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "loadURLWithMatchRequest:completionHandler:", v5, v7);

}

uint64_t __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResult:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setShareURL:", v2);

  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "shareURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v7;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "TBGame - setting self.shareURL = %@", buf, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count") || objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && (objc_msgSend(v8, "domain"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C947D8]),
          v10,
          (v11 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "setMode:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setMode:", 2);
      objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentPlayersNotInvitedViaMessages");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setStatus:forPlayers:complete:", 7, v14, 0);

      objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "playerRange");
      v18 = v17;

      v19 = v16 + v18;
      objc_msgSend(*(id *)(a1 + 32), "matchRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "minPlayers");

      if (v19 < v21)
      {
        objc_msgSend(*(id *)(a1 + 32), "matchRequest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v22, "minPlayers");

      }
      objc_msgSend(*(id *)(a1 + 32), "matchRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "maxPlayers");

      if (v19 > v24)
      {
        objc_msgSend(*(id *)(a1 + 32), "matchRequest");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v25, "maxPlayers");

      }
      objc_msgSend(*(id *)(a1 + 56), "valueForKeyPath:", CFSTR("internal.playerID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "match");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(*(id *)(a1 + 48), "count");
      objc_msgSend(*(id *)(a1 + 32), "matchRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "inviteMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_80;
      v34[3] = &unk_1E59C8038;
      v31 = *(id *)(a1 + 48);
      v32 = *(_QWORD *)(a1 + 32);
      v35 = v31;
      v36 = v32;
      v33 = *(void **)(a1 + 64);
      v38 = *(_QWORD *)(a1 + 72);
      v37 = v33;
      objc_msgSend(v27, "reserveShareParticipantSlots:minPlayerCount:maxPlayerCount:andInvitePlayers:withMessage:handler:", v28, v19, v19, v26, v30, v34);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setMode:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v13 = 138412546;
    v14 = v3;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "TBGame - reserveShareParticipantSlots result, error = %@, contactPlayers = %@", (uint8_t *)&v13, 0x16u);
  }
  if (v3)
  {
    if (!*v4)
      v8 = (id)GKOSLoggers();
    v9 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_80_cold_1((uint64_t)v3, v9);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "inviteContactPlayers:source:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    goto LABEL_13;
  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v10, "match");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "matchID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishWithMatchID:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_13:

}

- (void)didInviteContactPlayers
{
  void *v3;
  id v4;

  -[GKTurnBasedInviteViewController match](self, "match");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedInviteViewController finishWithMatchID:](self, "finishWithMatchID:", v3);

}

- (void)removeCurrentMatchAndSetFlagIfNotLoaded:(BOOL)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  GKTurnBasedInviteViewController *v16;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D252A8], "dispatchGroupWithName:", CFSTR("removeCurrentMatchGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedInviteViewController match](self, "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke;
    v14[3] = &unk_1E59C41C0;
    v15 = v8;
    v16 = self;
    objc_msgSend(v7, "perform:", v14);

  }
  else
  {
    self->_deletePreloadedMatch = a3;
  }
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_4;
  v12[3] = &unk_1E59C4DA8;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "notifyOnMainQueueWithBlock:", v12);

}

void __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchOutcome:", 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_2;
  v10[3] = &unk_1E59C7DB0;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v5, "endMatchInTurnWithMatchData:completionHandler:", v6, v10);

  objc_msgSend(*(id *)(a1 + 40), "setMatch:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setShareURL:", 0);

}

void __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_3;
  v2[3] = &unk_1E59C4D30;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "removeWithCompletionHandler:", v2);

}

uint64_t __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDeletePreloadedMatch:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __87__GKTurnBasedInviteViewController_removeCurrentMatchAndSetFlagIfNotLoaded_withHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invitePlayers:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "TBGame - invitePlayers, players = %@", (uint8_t *)&v7, 0xCu);
  }
  if (objc_msgSend(v4, "count"))
  {
    -[GKTurnBasedInviteViewController removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:](self, "removeCurrentMatchAndSetFlagIfNotLoaded:withHandler:", 1, 0);
    -[GKTurnBasedInviteViewController createGameWithPlayersToInvite:forSharing:handler:](self, "createGameWithPlayersToInvite:forSharing:handler:", v4, 0, 0);
  }
  else
  {
    -[GKTurnBasedInviteViewController setMode:](self, "setMode:", 0);
  }

}

- (NSMutableDictionary)inviteMessageDictionary
{
  return self->_inviteMessageDictionary;
}

- (void)setInviteMessageDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_inviteMessageDictionary, a3);
}

- (GKTurnBasedInviteViewControllerDelegate)delegate
{
  return (GKTurnBasedInviteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (BOOL)deletePreloadedMatch
{
  return self->_deletePreloadedMatch;
}

- (void)setDeletePreloadedMatch:(BOOL)a3
{
  self->_deletePreloadedMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_match, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inviteMessageDictionary, 0);
}

void __95__GKTurnBasedInviteViewController_sendInvitesToContactPlayers_legacyPlayers_source_completion___block_invoke_80_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "Error reserving turn-based slots: %@", (uint8_t *)&v2, 0xCu);
}

@end
