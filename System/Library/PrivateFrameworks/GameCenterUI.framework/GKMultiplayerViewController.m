@implementation GKMultiplayerViewController

- (GKMultiplayerViewController)init
{
  _TtC12GameCenterUI33GKMultiplayerViewControllerLayout *v3;
  GKMultiplayerViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc_init(_TtC12GameCenterUI33GKMultiplayerViewControllerLayout);
  v11.receiver = self;
  v11.super_class = (Class)GKMultiplayerViewController;
  v4 = -[GKCollectionViewController initWithCollectionViewLayout:](&v11, sel_initWithCollectionViewLayout_, v3);

  if (v4)
  {
    v4->_showCancelButton = 1;
    v4->_addButtonEnabled = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D24B08];
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_localPlayerAcceptedGameInvite_, v6, v7);

    v8 = *MEMORY[0x1E0D24F30];
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_playersToInvite_, v8, v9);

    -[GKMultiplayerViewController setInvitationType:](v4, "setInvitationType:", 0);
  }
  return v4;
}

- (GKMultiplayerViewController)initWithMatchRequest:(id)a3
{
  id v4;
  GKMultiplayerViewController *v5;
  uint64_t v6;
  GKMatchRequest *matchRequest;
  uint64_t v8;
  GKMatchRequest *originalMatchRequest;
  void *v10;
  uint64_t v11;
  NSString *defaultInvitationMessage;
  uint64_t v13;
  NSMutableSet *participantsInvitedByLocalPlayer;
  GKBoopHandler *v15;
  GKMultiplayerViewController *v16;
  GKBoopHandler *v17;
  _QWORD v19[4];
  GKMultiplayerViewController *v20;
  id v21;
  id location;

  v4 = a3;
  v5 = -[GKMultiplayerViewController init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    matchRequest = v5->_matchRequest;
    v5->_matchRequest = (GKMatchRequest *)v6;

    v8 = objc_msgSend(v4, "copy");
    originalMatchRequest = v5->_originalMatchRequest;
    v5->_originalMatchRequest = (GKMatchRequest *)v8;

    -[GKMultiplayerViewController configureMatchRequest](v5, "configureMatchRequest");
    -[GKMatchRequest inviteMessage](v5->_matchRequest, "inviteMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    defaultInvitationMessage = v5->_defaultInvitationMessage;
    v5->_defaultInvitationMessage = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    participantsInvitedByLocalPlayer = v5->_participantsInvitedByLocalPlayer;
    v5->_participantsInvitedByLocalPlayer = (NSMutableSet *)v13;

    if (v4)
    {
      objc_initWeak(&location, v5);
      v15 = [GKBoopHandler alloc];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke;
      v19[3] = &unk_1E59C6488;
      objc_copyWeak(&v21, &location);
      v16 = v5;
      v20 = v16;
      v17 = -[GKBoopHandler initWithUrlProvider:](v15, "initWithUrlProvider:", v19);
      -[GKMultiplayerViewController setBoopHandler:](v16, "setBoopHandler:", v17);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return v5;
}

id __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  GKContactDataSource *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_alloc_init(GKContactDataSource);
  -[GKContactDataSource fetchContactWithID:](v5, "fetchContactWithID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "participantsInvitedByLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v3);

    if (!v8)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25358]), "initWithContact:", v6);
      v13 = (void *)MEMORY[0x1E0D252A8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerViewController.m", 138, "-[GKMultiplayerViewController initWithMatchRequest:]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dispatchGroupWithName:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_2;
      v23[3] = &unk_1E59C41C0;
      v17 = WeakRetained;
      v24 = v17;
      v25 = v12;
      v18 = v12;
      objc_msgSend(v15, "perform:", v23);
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_4;
      v21[3] = &unk_1E59C4148;
      v19 = v17;
      v22 = v19;
      objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v21);
      objc_msgSend(v15, "waitWithTimeout:", 60.0);
      objc_msgSend(v19, "shareURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_2();
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v10 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_1();
  }
  v11 = 0;
LABEL_13:

  return v11;
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_3;
  v7[3] = &unk_1E59C4DA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "didPickPlayers:messageGroups:source:completion:", v5, 0, 0, v7);

}

uint64_t __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24D50]);

  objc_msgSend(*(id *)(a1 + 32), "playerPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "dismissPickerViewController");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKMultiplayerViewController;
  -[GKCollectionViewController dealloc](&v4, sel_dealloc);
}

- (void)configureMatchRequest
{
  GKMatchRequest *matchRequest;
  NSUInteger v4;
  NSUInteger v5;
  GKMatchRequest *v6;
  uint64_t v7;
  unint64_t v8;

  matchRequest = self->_matchRequest;
  if (matchRequest)
  {
    -[GKMatchRequest removeLocalPlayerFromPlayersToInvite](matchRequest, "removeLocalPlayerFromPlayersToInvite");
    if (-[GKMatchRequest defaultNumberOfPlayers](self->_matchRequest, "defaultNumberOfPlayers"))
    {
      v4 = -[GKMatchRequest defaultNumberOfPlayers](self->_matchRequest, "defaultNumberOfPlayers");
      v5 = -[GKMatchRequest minPlayers](self->_matchRequest, "minPlayers");
      v6 = self->_matchRequest;
      if (v4 >= v5)
      {
        v8 = -[GKMatchRequest defaultNumberOfPlayers](v6, "defaultNumberOfPlayers");
        if (v8 <= -[GKMatchRequest maxPlayers](self->_matchRequest, "maxPlayers"))
          return;
        v7 = -[GKMatchRequest maxPlayers](self->_matchRequest, "maxPlayers");
      }
      else
      {
        v7 = -[GKMatchRequest minPlayers](v6, "minPlayers");
      }
      -[GKMatchRequest setDefaultNumberOfPlayers:](self->_matchRequest, "setDefaultNumberOfPlayers:", v7);
    }
  }
}

- (void)sendInvitesToPlayersInOriginalMatchRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[GKMultiplayerViewController originalMatchRequest](self, "originalMatchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_initWeak(&location, self);
    -[GKMultiplayerViewController originalMatchRequest](self, "originalMatchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke;
    v7[3] = &unk_1E59C4878;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "loadRecipientsWithCompletionHandler:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(WeakRetained, "defaultInvitationMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "matchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInviteMessage:", v5);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_75;
    v9[3] = &unk_1E59C4148;
    v10 = v3;
    objc_msgSend(WeakRetained, "didPickPlayers:messageGroups:source:completion:", v10, 0, 1, v9);

  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = (void *)*MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_cold_1(v8, WeakRetained);
  }

}

void __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_75(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  v3 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1AB361000, v3, OS_LOG_TYPE_INFO, "Invitation sent to recipients in the match request: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GKMultiplayerViewController;
  -[GKCollectionViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[GKMultiplayerViewController updateTitle](self, "updateTitle");
  -[GKCollectionViewController setShouldSlideInContents:](self, "setShouldSlideInContents:", 0);
  v3 = objc_alloc_init(_TtC12GameCenterUI23GKMultiplayerFooterView);
  -[GKMultiplayerFooterView setFooterStatusString:](v3, "setFooterStatusString:", 0);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__GKMultiplayerViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E59C48A0;
  objc_copyWeak(&v12, &location);
  -[GKMultiplayerFooterView setStartGameHandler:](v3, "setStartGameHandler:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __42__GKMultiplayerViewController_viewDidLoad__block_invoke_2;
  v9[3] = &unk_1E59C48A0;
  objc_copyWeak(&v10, &location);
  -[GKMultiplayerFooterView setInviteFriendsHandler:](v3, "setInviteFriendsHandler:", v9);
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerFooterView configureUsing:](v3, "configureUsing:", v6);

  }
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GKMultiplayerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3);

  }
  -[GKMultiplayerViewController setFooterView:](self, "setFooterView:", v3);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __42__GKMultiplayerViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startGameButtonPressed");

}

void __42__GKMultiplayerViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "inviteFriendsButtonPressed");

}

- (void)viewWillAppear:(BOOL)a3
{
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GKMultiplayerViewController;
  -[GKCollectionViewController viewWillAppear:](&v18, sel_viewWillAppear_, a3);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", 0);
  objc_msgSend(v4, "setOpaque:", 0);
  objc_msgSend(v4, "setDirectionalLockEnabled:", 1);
  objc_msgSend(v4, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v4, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 0);
  -[GKMultiplayerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", -[GKMultiplayerViewController showNavigationBar](self, "showNavigationBar") ^ 1, 0);

  -[GKMultiplayerViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  -[GKMultiplayerViewController setViewNeedsLayout](self, "setViewNeedsLayout");
  -[GKCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

  -[GKCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateLayout");

  if (-[GKMultiplayerViewController matchmakingMode](self, "matchmakingMode") == 2
    || -[GKMultiplayerViewController canStartGroupActivities](self, "canStartGroupActivities"))
  {
    -[GKMultiplayerViewController footerView](self, "footerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
  }
  else
  {
    -[GKMultiplayerViewController footerView](self, "footerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
  }
  objc_msgSend(v12, "setInviteFriendsButtonHidden:", v14);

  -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", 0);

  -[GKMultiplayerViewController footerView](self, "footerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", 0);

  -[GKMultiplayerViewController configureAutoBounce](self, "configureAutoBounce");
  -[GKMultiplayerViewController boopHandler](self, "boopHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startNearbyDiscoveryWithCompletionHandler:", &__block_literal_global_25);

}

void __46__GKMultiplayerViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = a2;
  v3 = *MEMORY[0x1E0D25460];
  if (v2)
  {
    if (!v3)
      v4 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_2();
  }
  else
  {
    if (!v3)
      v5 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_1();
  }

}

- (void)refreshHeaderAndFooterMaterials
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _TtC12GameCenterUI23GKMultiplayerFooterView *footerView;
  double v13;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIView wantsMaterialBackgroundWithScrollOffset:](self->_buttonHeaderView, "wantsMaterialBackgroundWithScrollOffset:", v5 + v8);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSize");
  v11 = v10;

  footerView = self->_footerView;
  -[GKMultiplayerFooterView frame](footerView, "frame");
  -[GKMultiplayerFooterView wantsMaterialBackgroundWithScrollOffset:](footerView, "wantsMaterialBackgroundWithScrollOffset:", v11 - v5 - v13);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerViewController;
  -[GKMultiplayerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[GKMultiplayerViewController layoutSubviews](self, "layoutSubviews");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerViewController;
  -[GKMultiplayerViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[GKMultiplayerViewController updateCollectionViewContentInset](self, "updateCollectionViewContentInset");
  -[GKMultiplayerViewController updateHeaderFooterLayoutMargins](self, "updateHeaderFooterLayoutMargins");
}

- (void)layoutSubviews
{
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  -[GKMultiplayerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView sizeThatFits:](self->_buttonHeaderView, "sizeThatFits:", v9, v11);
  v13 = v12;
  v15 = v14;
  -[GKMultiplayerFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v9, v11);
  v17 = v16;
  v19 = v18;
  -[UIView layoutMargins](self->_buttonHeaderView, "layoutMargins");
  v21 = v15 + v20;
  -[UIView layoutMargins](self->_buttonHeaderView, "layoutMargins");
  v23 = v21 + v22;
  -[GKMultiplayerFooterView layoutMargins](self->_footerView, "layoutMargins");
  v25 = v19 + v24;
  -[GKMultiplayerFooterView layoutMargins](self->_footerView, "layoutMargins");
  v27 = v25 + v26;
  -[UIView setFrame:](self->_buttonHeaderView, "setFrame:", v5, v7, v13, v23);
  -[GKMultiplayerFooterView setFrame:](self->_footerView, "setFrame:", v5, v7 + v11 - v27, v17, v27);
  -[GKMultiplayerViewController updateCollectionViewContentInset](self, "updateCollectionViewContentInset");
  -[GKMultiplayerViewController refreshHeaderAndFooterMaterials](self, "refreshHeaderAndFooterMaterials");
  -[GKMultiplayerViewController updateHeaderFooterLayoutMargins](self, "updateHeaderFooterLayoutMargins");
}

- (void)updateCollectionViewContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[GKMultiplayerViewController collectionViewContentInset](self, "collectionViewContentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[GKCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");
  if (v6 == v15 && v4 == v12 && v10 == v14)
  {
    v18 = v13;

    if (v8 == v18)
      return;
  }
  else
  {

  }
  -[GKCollectionViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentInset:", v4, v6, v8, v10);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentOffset:", -v6, -v4);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "collectionViewLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidateLayout");

}

- (void)updateHeaderFooterLayoutMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  -[GKMultiplayerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKMultiplayerViewControllerLayout minimumContentInsetIn:](_TtC12GameCenterUI33GKMultiplayerViewControllerLayout, "minimumContentInsetIn:", v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[UIView setInsetsLayoutMarginsFromSafeArea:](self->_buttonHeaderView, "setInsetsLayoutMarginsFromSafeArea:", 0);
  if (v5 >= v14)
    v21 = v5;
  else
    v21 = v14;
  if (v7 >= v16)
    v22 = v7;
  else
    v22 = v16;
  if (v11 >= v20)
    v23 = v11;
  else
    v23 = v20;
  -[UIView setLayoutMargins:](self->_buttonHeaderView, "setLayoutMargins:", v21, v22, 0.0, v23);
  -[GKMultiplayerFooterView setInsetsLayoutMarginsFromSafeArea:](self->_footerView, "setInsetsLayoutMarginsFromSafeArea:", 0);
  if (v9 >= v18)
    v24 = v9;
  else
    v24 = v18;
  -[GKMultiplayerFooterView setLayoutMargins:](self->_footerView, "setLayoutMargins:", 0.0, v22, v24, v23);
}

- (UIEdgeInsets)collectionViewContentInset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
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
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  -[GKMultiplayerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKMultiplayerViewControllerLayout minimumContentInsetIn:](_TtC12GameCenterUI33GKMultiplayerViewControllerLayout, "minimumContentInsetIn:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[UIView frame](self->_buttonHeaderView, "frame");
  v18 = v10 + v17;
  if (v5 <= 0.0)
    v5 = v12;
  -[GKMultiplayerFooterView frame](self->_footerView, "frame");
  v20 = v14 + v19;
  if (v7 <= 0.0)
    v21 = v16;
  else
    v21 = v7;
  v22 = v18;
  v23 = v5;
  result.right = v21;
  result.bottom = v20;
  result.left = v23;
  result.top = v22;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKMultiplayerViewController;
  -[GKCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[GKMultiplayerViewController setPlayerPickerViewController:](self, "setPlayerPickerViewController:", 0);
  if (-[GKMultiplayerViewController invitationType](self, "invitationType") == 2)
  {
    if (-[GKMultiplayerViewController canStartForcedAutomatch](self, "canStartForcedAutomatch"))
    {
      -[GKMultiplayerViewController setDidStartForcedAutomatch:](self, "setDidStartForcedAutomatch:", 1);
      -[GKMultiplayerViewController startGameButtonPressed](self, "startGameButtonPressed");
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerViewController;
  -[GKCollectionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[GKMultiplayerViewController boopHandler](self, "boopHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopWithCompletionHandler:", &__block_literal_global_93);

}

void __48__GKMultiplayerViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = a2;
  v3 = *MEMORY[0x1E0D25460];
  if (v2)
  {
    if (!v3)
      v4 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_2();
  }
  else
  {
    if (!v3)
      v5 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_1();
  }

}

- (id)pageId
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Subclasses must provide a valid pageId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerViewController.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKMultiplayerViewController pageId]", objc_msgSend(v5, "UTF8String"), 465);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return CFSTR("lobby");
}

- (void)configureDataSource
{
  -[GKMultiplayerViewController configureDataSourceWithCompletionHandler:](self, "configureDataSourceWithCompletionHandler:", 0);
}

- (void)configureDataSourceWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  GKMultiplayerDataSource *v5;
  void *v6;
  GKMultiplayerDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  GKMatchRequest *v11;
  GKMatchRequest *matchRequest;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  GKMultiplayerDataSource *v46;
  GKMultiplayerViewController *v47;
  void (**v48)(_QWORD);
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = [GKMultiplayerDataSource alloc];
  -[GKMultiplayerViewController pageId](self, "pageId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKMultiplayerDataSource initWithMetricsPageId:](v5, "initWithMetricsPageId:", v6);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerDataSource configureCollectionView:](v7, "configureCollectionView:", v8);

  -[GKMultiplayerDataSource setDelegate:](v7, "setDelegate:", self);
  -[GKMultiplayerViewController originalMatchRequest](self, "originalMatchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GKMultiplayerViewController originalMatchRequest](self, "originalMatchRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (GKMatchRequest *)objc_msgSend(v10, "copy");
    matchRequest = self->_matchRequest;
    self->_matchRequest = v11;

    -[GKMultiplayerViewController configureMatchRequest](self, "configureMatchRequest");
  }
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[GKMatchRequest recipients](self->_matchRequest, "recipients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_gkGuestPlayersFromPlayers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKMultiplayerDataSource addPlayers:withStatus:replaceAutomatches:complete:](v7, "addPlayers:withStatus:replaceAutomatches:complete:", v15, 7, 1, 0);
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerDataSource setMinPlayers:](v7, "setMinPlayers:", objc_msgSend(v16, "minPlayers"));

    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerDataSource setMaxPlayers:](v7, "setMaxPlayers:", objc_msgSend(v17, "maxPlayers"));

    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "defaultNumberOfPlayersIsValid") & 1) != 0)
    {
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "defaultNumberOfPlayers");

      if (v20)
      {
        if (!*MEMORY[0x1E0D25460])
          v21 = (id)GKOSLoggers();
        v22 = (void *)*MEMORY[0x1E0D25470];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
        {
          v23 = v22;
          -[GKMultiplayerViewController matchRequest](self, "matchRequest");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134217984;
          v50 = objc_msgSend(v24, "defaultNumberOfPlayers");
          _os_log_impl(&dword_1AB361000, v23, OS_LOG_TYPE_INFO, "set automatchPlayers by _matchRequest.defaultNumberOfPlayers  %lu. This is to respect what developers set.", buf, 0xCu);

        }
        -[GKMultiplayerViewController matchRequest](self, "matchRequest");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "defaultNumberOfPlayers");
        goto LABEL_23;
      }
    }
    else
    {

    }
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "defaultNumberOfPlayers");

    if (!v28)
    {
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "maxPlayers");
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDefaultNumberOfPlayers:", v30);

    }
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "defaultNumberOfPlayers");

    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController game](self, "game");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bundleIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v34, "recentNumberOfPlayersForBundleID:", v36);

    if (v37 <= 1)
      v38 = v33;
    else
      v38 = v37;
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "minPlayers");

    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v41;
    if (v38 >= v40)
    {
      v42 = objc_msgSend(v41, "maxPlayers");

      if (v38 <= v42)
      {
LABEL_24:
        -[GKMultiplayerDataSource setAutomatchPlayerCount:](v7, "setAutomatchPlayerCount:", v38 + ~objc_msgSend(v15, "count"));
        -[GKMultiplayerDataSource setImplicitAutomatchPlayerCount:](v7, "setImplicitAutomatchPlayerCount:", -[GKMultiplayerDataSource automatchPlayerCount](v7, "automatchPlayerCount"));
        -[GKMultiplayerViewController game](self, "game");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKMultiplayerDataSource setGame:](v7, "setGame:", v43);

        -[GKMultiplayerViewController matchRequest](self, "matchRequest");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke;
        v45[3] = &unk_1E59C6518;
        v46 = v7;
        v47 = self;
        v48 = v4;
        objc_msgSend(v44, "loadRecipientsWithCompletionHandler:", v45);

        goto LABEL_25;
      }
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "maxPlayers");
    }
    else
    {
      v26 = objc_msgSend(v41, "minPlayers");
    }
LABEL_23:
    v38 = v26;

    goto LABEL_24;
  }
  if (v4)
    v4[2](v4);
LABEL_25:
  -[GKCollectionViewController setDataSource:](self, "setDataSource:", v7);
  -[GKMultiplayerViewController updateDataSourceInvitationEnabled](self, "updateDataSourceInvitationEnabled");

}

void __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E59C64F0;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v13 = v5;
  v7 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;

  if (objc_msgSend(*(id *)(a1 + 32), "code") == 10)
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_3;
    v11 = &unk_1E59C53C8;
    v5 = *(void **)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = v5;
    objc_msgSend(v3, "addPlayers:withStatus:replaceAutomatches:complete:", v4, 11, 1, &v8);

  }
  objc_msgSend(*(id *)(a1 + 56), "matchRequest", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipients:", 0);

  objc_msgSend(*(id *)(a1 + 56), "matchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayersToInvite:", 0);

}

uint64_t __72__GKMultiplayerViewController_configureDataSourceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateStartGameButtonTitle");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateTitle
{
  _BOOL4 v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;

  v3 = -[GKMultiplayerViewController allowPlayerCountSelection](self, "allowPlayerCountSelection");
  -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (!v3)
  {
    if ((isKindOfClass & 1) == 0)
    {
      -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v21 = objc_opt_isKindOfClass();

      if ((v21 & 1) == 0)
        goto LABEL_10;
      -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "minPlayers");

      -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "players");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v23 <= v26)
        v23 = v26;
      -[GKMultiplayerViewController matchRequest](self, "matchRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateCountWithMinPlayers:maxPlayers:", v23, objc_msgSend(v8, "maxPlayers"));
      goto LABEL_9;
    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v8, objc_msgSend(v9, "minPlayers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSubtitleText:", v15);

LABEL_8:
LABEL_9:

    goto LABEL_10;
  }
  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "minPlayers");
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v10, objc_msgSend(v11, "maxPlayers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSubtitleText:", v12);

    goto LABEL_8;
  }
  -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
    -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "minPlayers");
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCountWithMinPlayers:maxPlayers:", v19, objc_msgSend(v9, "maxPlayers"));
    goto LABEL_8;
  }
LABEL_10:
  -[GKMultiplayerViewController updateStartGameButtonTitle](self, "updateStartGameButtonTitle");
}

- (void)setCanStartGroupActivities:(BOOL)a3
{
  if (self->_canStartGroupActivities != a3)
  {
    self->_canStartGroupActivities = a3;
    -[GKMultiplayerViewController updateTitle](self, "updateTitle");
  }
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    -[GKMultiplayerViewController setupCancelButton](self, "setupCancelButton");
  }
}

- (void)setupCancelButton
{
  void *v3;
  id v4;

  -[GKMultiplayerViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_showCancelButton)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed);
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  }
  else
  {
    objc_msgSend(v4, "setLeftBarButtonItem:", 0);
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", a4, 0);
}

- (void)addAutomatchPlayer
{
  void *v3;
  id v4;

  if (self->_addButtonEnabled)
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutomatchPlayerCount:complete:", objc_msgSend(v3, "automatchPlayerCount") + 1, 0);

  }
}

- (void)removeAutomatchPlayer
{
  void *v3;
  id v4;

  if (self->_addButtonEnabled)
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutomatchPlayerCount:complete:", objc_msgSend(v3, "automatchPlayerCount") - 1, 0);

  }
}

- (void)removePlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__GKMultiplayerViewController_removePlayer___block_invoke;
  v8[3] = &unk_1E59C4708;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "removePlayers:complete:", v6, v8);

}

void __44__GKMultiplayerViewController_removePlayer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateStartGameButtonTitle");
  objc_msgSend(*(id *)(a1 + 32), "removedPlayer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "participantsInvitedByLocalPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

- (int64_t)maxAvailablePlayers
{
  void *v2;
  int64_t v3;

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxAvailablePlayers");

  return v3;
}

- (void)loadShareURLWithContactPlayers:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)presentPlayerPicker
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  -[GKMultiplayerViewController preparePlayerPicker](self, "preparePlayerPicker");
  -[GKMultiplayerViewController playerPickerViewController](self, "playerPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerViewController willPresentPlayerPicker:](self, "willPresentPlayerPicker:", v3);

  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "Will present player picker view controller", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24DA0]);

  v7 = objc_alloc(MEMORY[0x1E0DC3A40]);
  -[GKMultiplayerViewController playerPickerViewController](self, "playerPickerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithRootViewController:", v8);

  if (GKIsXRUIIdiomShouldUsePadUI())
    v10 = 16;
  else
    v10 = 2;
  objc_msgSend(v9, "setModalPresentationStyle:", v10);
  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(v9, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__GKMultiplayerViewController_presentPlayerPicker__block_invoke;
  v12[3] = &unk_1E59C4148;
  v12[4] = self;
  -[GKMultiplayerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v12);

}

uint64_t __50__GKMultiplayerViewController_presentPlayerPicker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFooterButtonStates");
}

- (void)preparePlayerPicker
{
  int64_t v3;
  void *v4;
  GKDashboardMultiplayerPickerViewController *v5;
  id v6;

  v3 = -[GKMultiplayerViewController maxAvailablePlayers](self, "maxAvailablePlayers");
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPlayers");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[GKDashboardMultiplayerPickerViewController initWithMaxSelectable:hiddenPlayers:nearbyOnly:pickerOrigin:]([GKDashboardMultiplayerPickerViewController alloc], "initWithMaxSelectable:hiddenPlayers:nearbyOnly:pickerOrigin:", v3, v6, -[GKMultiplayerViewController matchmakingMode](self, "matchmakingMode") == 1, 1);
  -[GKDashboardMultiplayerPickerViewController setMultiplayerPickerDelegate:](v5, "setMultiplayerPickerDelegate:", self);
  -[GKMultiplayerViewController setPlayerPickerViewController:](self, "setPlayerPickerViewController:", v5);

}

- (void)multiplayerPicker:(id)a3 didPickPlayers:(id)a4 messageGroups:(id)a5 customMessage:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v9 = (void *)MEMORY[0x1E0D253C0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v9, "reporter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D25068];
  objc_msgSend(v13, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24D88]);

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reportEvent:type:", v14, *MEMORY[0x1E0D24D70]);

  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInviteMessage:", v10);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__GKMultiplayerViewController_multiplayerPicker_didPickPlayers_messageGroups_customMessage___block_invoke;
  v17[3] = &unk_1E59C4148;
  v17[4] = self;
  -[GKMultiplayerViewController didPickPlayers:messageGroups:source:completion:](self, "didPickPlayers:messageGroups:source:completion:", v12, v11, 1, v17);

}

uint64_t __92__GKMultiplayerViewController_multiplayerPicker_didPickPlayers_messageGroups_customMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissPickerViewController");
}

- (void)didPickPlayers:(id)a3 messageGroups:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  unint64_t v22;
  _QWORD v23[5];
  id v24;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedMessageGroups:", v12);

  v14 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerViewController.m", 726, "-[GKMultiplayerViewController didPickPlayers:messageGroups:source:completion:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dispatchGroupWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke;
  v23[3] = &unk_1E59C41C0;
  v23[4] = self;
  v24 = v10;
  v18 = v10;
  objc_msgSend(v16, "perform:", v23);
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_4;
  v20[3] = &unk_1E59C6588;
  v21 = v11;
  v22 = a5;
  v20[4] = self;
  v19 = v11;
  objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v20);

}

void __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_2;
  v7[3] = &unk_1E59C6560;
  objc_copyWeak(&v10, &location);
  v8 = *(id *)(a1 + 40);
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "addPlayers:withStatus:replaceAutomatches:complete:", v5, 11, 1, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "participantsInvitedByLocalPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "_gkMapWithBlock:", &__block_literal_global_119_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "updateStartGameButtonTitle");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_5;
  v4[3] = &unk_1E59C4DA8;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setupInvitesForSource:completion:", v3, v4);

}

uint64_t __78__GKMultiplayerViewController_didPickPlayers_messageGroups_source_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)multiplayerPickerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24D60]);

  -[GKMultiplayerViewController playerPickerViewController](self, "playerPickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[GKMultiplayerViewController dismissPickerViewController](self, "dismissPickerViewController");
}

- (void)dismissPickerViewController
{
  void *v3;
  _QWORD v4[5];

  -[GKMultiplayerViewController playerPickerViewController](self, "playerPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupportsNearby:", 0);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__GKMultiplayerViewController_dismissPickerViewController__block_invoke;
  v4[3] = &unk_1E59C4148;
  v4[4] = self;
  -[GKMultiplayerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
}

uint64_t __58__GKMultiplayerViewController_dismissPickerViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "playerPickerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setViewControllers:", MEMORY[0x1E0C9AA60]);

  objc_msgSend(*(id *)(a1 + 32), "playerPickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromParentViewController");

  return objc_msgSend(*(id *)(a1 + 32), "setPlayerPickerViewController:", 0);
}

- (BOOL)canStartForcedAutomatch
{
  return 0;
}

- (BOOL)allowPlayerCountSelection
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  BOOL v7;

  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maxPlayers");
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 > objc_msgSend(v6, "minPlayers");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setInvitationType:(int64_t)a3
{
  if (self->_invitationType != a3)
  {
    self->_invitationType = a3;
    -[GKMultiplayerViewController updateDataSourceInvitationEnabled](self, "updateDataSourceInvitationEnabled");
  }
}

- (void)updateDataSourceInvitationEnabled
{
  int64_t v3;
  void *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;

  v3 = -[GKMultiplayerViewController invitationType](self, "invitationType");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3)
      return;
    v6 = -[GKMultiplayerViewController isInSetupMode](self, "isInSetupMode");
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v5 = v6;
  }
  else
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v5 = 0;
  }
  objc_msgSend(v4, "setInvitingEnabled:", v5);

}

- (void)setMatchmakingMode:(int64_t)a3
{
  self->_matchmakingMode = a3;
  -[GKMultiplayerViewController determineInvitationType](self, "determineInvitationType");
}

- (void)determineInvitationType
{
  void *v3;
  uint64_t v4;

  -[GKMultiplayerViewController setInvitationType:](self, "setInvitationType:", 0);
  if (-[GKMultiplayerViewController matchmakingMode](self, "matchmakingMode") == 2)
  {
    -[GKMultiplayerViewController footerView](self, "footerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInviteFriendsButtonHidden:", 1);

    if (-[GKMultiplayerViewController allowPlayerCountSelection](self, "allowPlayerCountSelection"))
      v4 = 1;
    else
      v4 = 2;
    -[GKMultiplayerViewController setInvitationType:](self, "setInvitationType:", v4);
  }
}

- (void)inviteFriendsButtonPressed
{
  void *v3;
  void *v4;
  void *v5;

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "revertFailedPlayers");

  -[GKMultiplayerViewController footerView](self, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartGameButtonEnabled:", 0);

  -[GKMultiplayerViewController footerView](self, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInviteFriendsButtonEnabled:", 0);

  -[GKMultiplayerViewController presentPlayerPicker](self, "presentPlayerPicker");
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[GKMultiplayerViewController footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[GKCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setupInvitesForSource:(unint64_t)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
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
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39[2];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "revertFailedPlayers");

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playersToBeInvited");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v7, "count");
  if (v33)
  {
    if (!*MEMORY[0x1E0D25460])
      v8 = (id)GKOSLoggers();
    v9 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      _os_log_impl(&dword_1AB361000, v9, OS_LOG_TYPE_INFO, "Multiplayer - sendInvites, playersToInvite = %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "utilityService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "minPlayers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "maxPlayers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordMatchStart:minPlayers:maxPlayers:", CFSTR("unknown"), v14, v17);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v24, "contact");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            v26 = v19;
          else
            v26 = v18;
          objc_msgSend(v26, "addObject:", v24);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v21);
    }

    objc_initWeak((id *)buf, self);
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke;
    v35[3] = &unk_1E59C65B0;
    objc_copyWeak(v39, (id *)buf);
    v28 = v19;
    v36 = v28;
    v29 = v18;
    v37 = v29;
    v39[1] = v32;
    v38 = v34;
    objc_msgSend(v27, "setStatus:forPlayers:complete:", 1, v20, v35);

    objc_destroyWeak(v39);
    objc_destroyWeak((id *)buf);

  }
  return v33 != 0;
}

void __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke_2;
  block[3] = &unk_1E59C4CE0;
  block[4] = WeakRetained;
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  v9 = v4;
  v8 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__GKMultiplayerViewController_setupInvitesForSource_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendInvitesToContactPlayers:legacyPlayers:source:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)performActionsForButtonStartGame
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24DB0]);

  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB361000, v5, OS_LOG_TYPE_INFO, "Multiplayer Game - performActionsForButtonStartGame - Starting game", v6, 2u);
  }
  -[GKMultiplayerViewController playNow](self, "playNow");
}

- (void)cancelButtonPressed
{
  int v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_matchRequest)
  {
    v3 = -[GKMultiplayerFooterView isUserInteractionEnabled](self->_footerView, "isUserInteractionEnabled");
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = (_QWORD *)MEMORY[0x1E0D24D68];
    if (v3)
      v6 = (_QWORD *)MEMORY[0x1E0D24D98];
    objc_msgSend(v4, "reportEvent:type:", *MEMORY[0x1E0D25068], *v6);

  }
  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerViewController pageId](self, "pageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("dismiss"), CFSTR("close"), CFSTR("button"), v8, CFSTR("multiplayer"));

  -[GKMultiplayerViewController footerView](self, "footerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStartGameButtonEnabled:", 0);

  -[GKMultiplayerViewController footerView](self, "footerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInviteFriendsButtonEnabled:", 0);

  -[GKMultiplayerViewController cancel](self, "cancel");
}

- (void)cancel
{
  -[GKMultiplayerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)inviteContactPlayers:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v23[5];
  _QWORD v24[3];
  char v25;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerViewController.m", 966, "-[GKMultiplayerViewController inviteContactPlayers:source:completion:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v13 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke;
  v23[3] = &unk_1E59C6600;
  v23[4] = v24;
  objc_msgSend(v12, "perform:", v23);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_135;
  v17[3] = &unk_1E59C6718;
  v17[4] = self;
  v21 = v24;
  v14 = v9;
  v20 = v14;
  v15 = v12;
  v18 = v15;
  v16 = v8;
  v19 = v16;
  v22 = a4;
  objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v17);

  _Block_object_dispose(v24, 8);
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplayerService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2;
  v8[3] = &unk_1E59C65D8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "hasExistingInviteSessionWithHandler:", v8);

}

uint64_t __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*MEMORY[0x1E0D25460])
    v4 = (id)GKOSLoggers();
  v5 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "current invite session existence: %@", (uint8_t *)&v10, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_135(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "matchRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  if (!v2)
    goto LABEL_3;
  v4 = (void *)v2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "invitationType");

  if (v5)
    goto LABEL_3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(*(id *)(a1 + 32), "shareURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0) | isKindOfClass;

    if ((v11 & 1) != 0)
    {
      if (!*MEMORY[0x1E0D25460])
        v12 = (id)GKOSLoggers();
      v13 = (void *)*MEMORY[0x1E0D25470];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
      {
        v14 = *(void **)(a1 + 32);
        v15 = v13;
        objc_msgSend(v14, "shareURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "we have previously got the share URL: %@, trying to setShareInvitees", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "setShareInvitees");
      goto LABEL_3;
    }
  }
  if (!*MEMORY[0x1E0D25460])
    v17 = (id)GKOSLoggers();
  v18 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v18, OS_LOG_TYPE_INFO, "loading share URL for Messages invites", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setMessagesInviteStatus:", 0);
  if ((objc_msgSend(MEMORY[0x1E0CC68C8], "canSendText") & 1) != 0)
  {
    v26[0] = v3;
    v26[1] = 3221225472;
    v26[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_138;
    v26[3] = &unk_1E59C42A0;
    v19 = *(void **)(a1 + 40);
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = v19;
    v28 = *(id *)(a1 + 48);
    objc_msgSend(v27, "perform:", v26);

LABEL_3:
    v21[0] = v3;
    v21[1] = 3221225472;
    v21[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_144;
    v21[3] = &unk_1E59C66F0;
    v6 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v6;
    v24 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 72);
    v23 = v7;
    v25 = v8;
    objc_msgSend(v22, "notifyOnMainQueueWithBlock:", v21);

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMessagesInviteStatus:", 1);
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
    (*(void (**)(void))(v20 + 16))();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_139;
  v8[3] = &unk_1E59C6650;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v11 = v3;
  v10 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v5, "isICloudAvailableWithHandler:", v8);

}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_139(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[16];

  v5 = a3;
  if (a2)
    v6 = objc_msgSend(*(id *)(a1 + 32), "messagesInviteStatus");
  else
    v6 = 2;
  objc_msgSend(*(id *)(a1 + 32), "setMessagesInviteStatus:", v6);
  if (v5 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
    if (!*MEMORY[0x1E0D25460])
      v12 = (id)GKOSLoggers();
    v13 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_139_cold_1(v13, a2, (uint64_t)v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB361000, v8, OS_LOG_TYPE_INFO, "CloudKit is available.", buf, 2u);
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_140;
    v14[3] = &unk_1E59C6628;
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v11;
    objc_msgSend(v9, "loadShareURLWithContactPlayers:completion:", v10, v14);

  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D25460];
  if (v6)
  {
    if (!v7)
      v8 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_140_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (!v7)
      v9 = (id)GKOSLoggers();
    v10 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "Received shareURL for Messages invites: %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_141;
    block[3] = &unk_1E59C6118;
    block[4] = *(_QWORD *)(a1 + 40);
    v12 = v5;
    v13 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_141(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8))
    v4 = 4;
  else
    v4 = 3;
  objc_msgSend(v2, "setMessagesInviteStatus:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setShareURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setShareInvitees");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_144(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t v37;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "shareURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(*(id *)(a1 + 40), "error"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24DD8]);

    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "utilityService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "matchRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "minPlayers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "matchRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "maxPlayers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recordMatchStart:minPlayers:maxPlayers:", CFSTR("contact"), v20, v23);

    objc_msgSend(*(id *)(a1 + 32), "matchRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "minPlayers");
    objc_msgSend(*(id *)(a1 + 32), "matchRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "maxPlayers");
    objc_msgSend(*(id *)(a1 + 32), "matchRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27 - objc_msgSend(v28, "minPlayers");

    objc_msgSend(*(id *)(a1 + 32), "shareURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_148;
    v34[3] = &unk_1E59C66C8;
    v34[4] = *(_QWORD *)(a1 + 32);
    v31 = *(id *)(a1 + 48);
    v33 = *(void **)(a1 + 56);
    v32 = *(_QWORD *)(a1 + 64);
    v35 = v31;
    v37 = v32;
    v36 = v33;
    +[GKMessageUtilities linkMetadataWithPlayerRange:shareURL:completionHandler:](GKMessageUtilities, "linkMetadataWithPlayerRange:shareURL:completionHandler:", v25, v29, v30, v34);

  }
  else
  {
    v6 = (_QWORD *)MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = (os_log_t *)MEMORY[0x1E0D25470];
    v9 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_144_cold_2(v2, v9, a1);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleServiceUnavailable:", v12);

      objc_msgSend(*(id *)(a1 + 32), "performActionsForButtonCancelCurrentMatching");
    }
    else
    {
      if (!*v6)
        v13 = (id)GKOSLoggers();
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_144_cold_1();
    }
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
      (*(void (**)(void))(v14 + 16))();
  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_148(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id obj;
  _QWORD v39[4];
  id v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0CC11D8]);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setMetadata:", v33);
    v57 = 0;
    objc_msgSend(v4, "dataRepresentationWithOutOfLineAttachments:", &v57);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v57;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedMessageGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_150;
    v51[3] = &unk_1E59C6678;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v52 = v10;
    v53 = v11;
    v34 = v33;
    v54 = v34;
    v35 = v5;
    v55 = v35;
    v36 = v6;
    v56 = v36;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v51);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    obj = *(id *)(a1 + 40);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v48;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v14);
          v43 = 0;
          v44 = &v43;
          v45 = 0x2020000000;
          v46 = 0;
          objc_msgSend(*(id *)(a1 + 32), "multiplayerDataSource");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "selectedMessageGroups");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_155;
          v39[3] = &unk_1E59C66A0;
          v40 = v10;
          v41 = v15;
          v42 = &v43;
          objc_msgSend(v17, "enumerateObjectsUsingBlock:", v39);

          if (*((_BYTE *)v44 + 24))
          {
            if (!*MEMORY[0x1E0D25460])
              v18 = (id)GKOSLoggers();
            v19 = *MEMORY[0x1E0D25470];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v15;
              _os_log_debug_impl(&dword_1AB361000, v19, OS_LOG_TYPE_DEBUG, "Skipping individual contact already included in group invite: %@", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v15, "contact");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v15, "contact");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[GKMessageUtilities messagesRecipientHandleForContact:](GKMessageUtilities, "messagesRecipientHandleForContact:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22 && *(_QWORD *)(a1 + 56))
              {
                objc_msgSend(*(id *)(a1 + 32), "matchRequest");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "inviteMessage");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "length");

                if (v25)
                {
                  objc_msgSend(*(id *)(a1 + 32), "matchRequest");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "inviteMessage");
                }
                else
                {
                  GKGameCenterUIFrameworkBundle();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  GKGetLocalizedStringFromTableInBundle();
                }
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                IMSPISendMessageWithAttachments();

                objc_msgSend(v34, "originalURL");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                IMSPISendRichLink();

                if (!*MEMORY[0x1E0D25460])
                  v30 = (id)GKOSLoggers();
                v31 = *MEMORY[0x1E0D25470];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v22;
                  _os_log_debug_impl(&dword_1AB361000, v31, OS_LOG_TYPE_DEBUG, "Sent message invitation via IMSPISendRichLink, to: %@", buf, 0xCu);
                }
              }

            }
            else
            {
              objc_msgSend(v15, "displayNameWithOptions:", 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v15, v28);

            }
          }

          _Block_object_dispose(&v43, 8);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v12);
    }

    objc_msgSend(*(id *)(a1 + 32), "didInviteContactPlayers");
  }
  v32 = *(_QWORD *)(a1 + 48);
  if (v32)
    (*(void (**)(void))(v32 + 16))();

}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_150(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "conversationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "conversationIdentifier");
    v27 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "players");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "players");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "contact");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[GKMessageUtilities messagesRecipientHandleForContact:](GKMessageUtilities, "messagesRecipientHandleForContact:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v8, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "players");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = objc_msgSend(v8, "count");

    if (v17 == v18)
    {
      objc_msgSend(a1[5], "matchRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "inviteMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(a1[5], "matchRequest");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "inviteMessage");
      }
      else
      {
        GKGameCenterUIFrameworkBundle();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)v27;

      IMSPISendMessageWithAttachmentsToMany();
      objc_msgSend(a1[6], "originalURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      IMSPISendRichLinkToMany();

      if (!*MEMORY[0x1E0D25460])
        v26 = (id)GKOSLoggers();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
        __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_150_cold_1();

    }
    else
    {
      objc_msgSend(a1[4], "addObject:", v3);
      if (!*MEMORY[0x1E0D25460])
        v22 = (id)GKOSLoggers();
      v23 = (void *)v27;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
        __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_150_cold_2();
    }

  }
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_155(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(v8, "conversationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v8, "players");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40));

      if (v7)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
    else
    {

    }
  }

}

- (void)setShareURL:(id)a3
{
  NSURL **p_shareURL;
  unint64_t v5;

  p_shareURL = &self->_shareURL;
  objc_storeStrong((id *)&self->_shareURL, a3);
  v5 = 3;
  if (*p_shareURL)
    v5 = 4;
  self->_messagesInviteStatus = v5;
}

- (void)handleServiceUnavailable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKMultiplayerViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke;
  v6[3] = &unk_1E59C4708;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke(uint64_t a1)
{
  void *v2;
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
  _QWORD v14[5];

  v2 = (void *)MEMORY[0x1E0DC3450];
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke_2;
  v14[3] = &unk_1E59C4408;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 1, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, &__block_literal_global_168);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v9);
  objc_msgSend(v5, "addAction:", v13);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didClickCancelForServiceUnavailableAlert");
}

void __56__GKMultiplayerViewController_handleServiceUnavailable___block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "utilityService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openICloudSettings");

}

- (void)localPlayerAcceptedGameInvite:(id)a3
{
  -[GKMultiplayerViewController setDidAcceptGameInvite:](self, "setDidAcceptGameInvite:", 1);
  -[GKMultiplayerViewController cancel](self, "cancel");
}

- (void)playersToInvite:(id)a3
{
  -[GKMultiplayerViewController setDidAcceptGameInvite:](self, "setDidAcceptGameInvite:", 1);
  -[GKMultiplayerViewController cancel](self, "cancel");
}

- (void)handleNewParticipantCount:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != a3)
  {
    objc_msgSend(v14, "players");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = a3 - v8;
    if (a3 - v8 >= 0)
      objc_msgSend(v14, "setAutomatchPlayerCount:complete:", v9, 0);
    objc_msgSend(MEMORY[0x1E0D253B0], "shared", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRecentNumberOfPlayers:", a3);

    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerViewController game](self, "game");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRecentNumberOfPlayers:forBundleID:", a3, v13);

  }
}

- (void)didTapRemoveParticipant:(id)a3
{
  id v4;

  objc_msgSend(a3, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerViewController removePlayer:](self, "removePlayer:", v4);

}

- (void)dataSource:(id)a3 didRefreshSections:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD block[4];
  id v13;
  id v14;
  GKMultiplayerViewController *v15;

  v6 = a3;
  v7 = a4;
  if (-[GKMultiplayerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[GKMultiplayerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (-[GKMultiplayerViewController isLoading](self, "isLoading"))
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __61__GKMultiplayerViewController_dataSource_didRefreshSections___block_invoke;
          block[3] = &unk_1E59C54B8;
          v13 = v6;
          v14 = v7;
          v15 = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        else
        {
          v11.receiver = self;
          v11.super_class = (Class)GKMultiplayerViewController;
          -[GKCollectionViewController dataSource:didRefreshSections:](&v11, sel_dataSource_didRefreshSections_, v6, v7);
        }
      }
    }
  }

}

id __61__GKMultiplayerViewController_dataSource_didRefreshSections___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)GKMultiplayerViewController;
  return objc_msgSendSuper2(&v4, sel_dataSource_didRefreshSections_, v2, v1);
}

- (BOOL)isLoading
{
  __CFString *v2;
  BOOL v3;

  -[GKCollectionViewController loadingState](self, "loadingState");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if (v2)
  {
    if (v2 != CFSTR("Initial") && v2 != CFSTR("LoadingState"))
      v3 = v2 == CFSTR("RefreshingState");
  }

  return v3;
}

- (int64_t)multiplayerCellLayoutMode
{
  void *v2;
  int64_t v3;

  -[GKMultiplayerViewController viewControllerLayout](self, "viewControllerLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cellLayoutMode");

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GKMultiplayerViewController;
  -[GKCollectionViewController traitCollectionDidChange:](&v17, sel_traitCollectionDidChange_, v4);
  -[GKMultiplayerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  if (v6 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    -[GKMultiplayerViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verticalSizeClass");
    if (v8 == objc_msgSend(v4, "verticalSizeClass"))
    {
      -[GKMultiplayerViewController traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "layoutDirection");
      if (v10 == objc_msgSend(v4, "layoutDirection"))
      {
        -[GKMultiplayerViewController traitCollection](self, "traitCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "preferredContentSizeCategory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "preferredContentSizeCategory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
          goto LABEL_10;
        goto LABEL_9;
      }

    }
  }

LABEL_9:
  -[GKMultiplayerViewController setViewNeedsLayout](self, "setViewNeedsLayout");
  -[GKCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

  -[GKCollectionViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionViewLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invalidateLayout");

LABEL_10:
  -[GKMultiplayerViewController configureAutoBounce](self, "configureAutoBounce");

}

- (void)configureAutoBounce
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[GKMultiplayerViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
  {
    -[GKCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
LABEL_5:
    objc_msgSend(v5, "setAlwaysBounceVertical:", 1);

    -[GKCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v10 = 0;
    goto LABEL_6;
  }
  -[GKMultiplayerViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "verticalSizeClass");

  -[GKCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v8 != 1)
    goto LABEL_5;
  objc_msgSend(v5, "setAlwaysBounceVertical:", 0);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v10 = 1;
LABEL_6:
  objc_msgSend(v9, "setAlwaysBounceHorizontal:", v10);

}

- (void)didUpdateParticipants
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[GKMultiplayerViewController updateFooterButtonStates](self, "updateFooterButtonStates");
  -[GKMultiplayerViewController buttonHeaderView](self, "buttonHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[GKMultiplayerViewController showNavigationBar](self, "showNavigationBar"))
    {
      -[GKMultiplayerViewController makeDoubleHeaderView](self, "makeDoubleHeaderView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[GKMultiplayerViewController makeButtonHeaderView](self, "makeButtonHeaderView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applyGame:", self->_game);
      -[GKMultiplayerViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", v4);

      if (v4)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
        v9[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPreferredFocusEnvironments:", v7);

        -[GKMultiplayerViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addLayoutGuide:", v6);

        objc_msgSend(MEMORY[0x1E0CB3718], "_gkInstallEdgeConstraintsForLayoutGuide:containedWithinParentView:", v6, v4);
      }
    }
    -[GKMultiplayerViewController setButtonHeaderView:](self, "setButtonHeaderView:", v4);

  }
  -[GKMultiplayerViewController updateTitle](self, "updateTitle");
  -[GKMultiplayerViewController setViewNeedsLayout](self, "setViewNeedsLayout");
}

- (void)updateFooterButtonStates
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = -[GKMultiplayerViewController maxAvailablePlayers](self, "maxAvailablePlayers") > 0;
  -[GKMultiplayerViewController footerView](self, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInviteFriendsButtonEnabled:", v3);

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = v7 >= objc_msgSend(v5, "minPlayers");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "participants", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "player");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isLocalPlayer");

        if ((v16 & 1) == 0
          && (-[GKMultiplayerViewController matchmakingMode](self, "matchmakingMode") == 3
           || -[GKMultiplayerViewController matchmakingMode](self, "matchmakingMode") == 1
           || objc_msgSend(v14, "type") != 1)
          && objc_msgSend(v14, "status") != 7
          && objc_msgSend(v14, "status") != 21
          && objc_msgSend(v14, "status") != 20)
        {
          v8 = 0;
          goto LABEL_17;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_17:

  if (-[GKMultiplayerViewController canStartWithMinimumPlayers](self, "canStartWithMinimumPlayers"))
  {
    -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "readyPlayers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    -[GKMultiplayerViewController matchRequest](self, "matchRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "minPlayers");

    if (v19 >= v21)
      v8 = 1;
  }
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8 & ~objc_msgSend(v22, "hasFutureRecipientProperties");
  -[GKMultiplayerViewController footerView](self, "footerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStartGameButtonEnabled:", v23);

}

- (id)makeButtonHeaderView
{
  void *v3;
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  objc_initWeak(&location, self);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __51__GKMultiplayerViewController_makeButtonHeaderView__block_invoke;
  v20 = &unk_1E59C48A0;
  objc_copyWeak(&v21, &location);
  v3 = _Block_copy(&v17);
  v4 = [_TtC12GameCenterUI29GKMultiplayerButtonHeaderView alloc];
  -[GKMultiplayerViewController matchRequest](self, "matchRequest", v17, v18, v19, v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minPlayers");

  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "players");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v6 <= v9)
    v10 = v9;
  else
    v10 = v6;
  -[GKMultiplayerViewController matchRequest](self, "matchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maxPlayers");
  -[GKMultiplayerViewController multiplayerDataSource](self, "multiplayerDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "participants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GKMultiplayerButtonHeaderView initWithMinimumValue:maximumValue:initialValue:cancelButtonHandler:](v4, "initWithMinimumValue:maximumValue:initialValue:cancelButtonHandler:", v10, v12, objc_msgSend(v14, "count"), v3);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return v15;
}

void __51__GKMultiplayerViewController_makeButtonHeaderView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancelButtonPressed");

}

- (id)makeDoubleHeaderView
{
  _TtC12GameCenterUI26NavigationDoubleHeaderView *v3;
  _TtC12GameCenterUI26NavigationDoubleHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = [_TtC12GameCenterUI26NavigationDoubleHeaderView alloc];
  v4 = -[NavigationDoubleHeaderView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[GKGame name](self->_game, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NavigationDoubleHeaderView setTitleText:](v4, "setTitleText:", v5);

  -[GKMultiplayerViewController updateTitle](self, "updateTitle");
  -[GKMultiplayerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleView:", v4);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed);
  -[GKMultiplayerViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  return v4;
}

- (int64_t)automatchParticipantStatus
{
  return 0;
}

- (BOOL)isInSetupMode
{
  return 0;
}

- (BOOL)isCanceling
{
  return 0;
}

- (BOOL)allowAutoMatch
{
  BOOL v3;
  void *v4;

  if (-[GKMultiplayerViewController matchmakingMode](self, "matchmakingMode") == 3
    || -[GKMultiplayerViewController matchmakingMode](self, "matchmakingMode") == 1)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "multiplayerAllowedPlayerType") == 2;

  return v3;
}

- (BOOL)isParticipantInvitedByLocalPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[GKMultiplayerViewController participantsInvitedByLocalPlayer](self, "participantsInvitedByLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "containsObject:", v8);

  return v9;
}

- (void)setViewNeedsLayout
{
  id v2;

  -[GKMultiplayerViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (GKMatchRequest)originalMatchRequest
{
  return self->_originalMatchRequest;
}

- (NSString)defaultInvitationMessage
{
  return self->_defaultInvitationMessage;
}

- (void)setDefaultInvitationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)showNavigationBar
{
  return self->_showNavigationBar;
}

- (void)setShowNavigationBar:(BOOL)a3
{
  self->_showNavigationBar = a3;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (BOOL)didAcceptGameInvite
{
  return self->_didAcceptGameInvite;
}

- (void)setDidAcceptGameInvite:(BOOL)a3
{
  self->_didAcceptGameInvite = a3;
}

- (GKDashboardNearbyBrowserDelegate)nearbyDelegate
{
  return (GKDashboardNearbyBrowserDelegate *)objc_loadWeakRetained((id *)&self->_nearbyDelegate);
}

- (void)setNearbyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_nearbyDelegate, a3);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (BOOL)didStartForcedAutomatch
{
  return self->_didStartForcedAutomatch;
}

- (void)setDidStartForcedAutomatch:(BOOL)a3
{
  self->_didStartForcedAutomatch = a3;
}

- (int64_t)matchmakingMode
{
  return self->_matchmakingMode;
}

- (_TtC12GameCenterUI23GKMultiplayerFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (BOOL)canStartWithMinimumPlayers
{
  return self->_canStartWithMinimumPlayers;
}

- (void)setCanStartWithMinimumPlayers:(BOOL)a3
{
  self->_canStartWithMinimumPlayers = a3;
}

- (BOOL)canStartGroupActivities
{
  return self->_canStartGroupActivities;
}

- (NSMutableSet)participantsInvitedByLocalPlayer
{
  return self->_participantsInvitedByLocalPlayer;
}

- (void)setParticipantsInvitedByLocalPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_participantsInvitedByLocalPlayer, a3);
}

- (void)setMultiplayerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_multiplayerDataSource, a3);
}

- (BOOL)addButtonEnabled
{
  return self->_addButtonEnabled;
}

- (void)setAddButtonEnabled:(BOOL)a3
{
  self->_addButtonEnabled = a3;
}

- (UIView)buttonHeaderView
{
  return self->_buttonHeaderView;
}

- (void)setButtonHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonHeaderView, a3);
}

- (GKDashboardMultiplayerPickerViewController)playerPickerViewController
{
  return self->_playerPickerViewController;
}

- (void)setPlayerPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerPickerViewController, a3);
}

- (int64_t)invitationType
{
  return self->_invitationType;
}

- (unint64_t)messagesInviteStatus
{
  return self->_messagesInviteStatus;
}

- (void)setMessagesInviteStatus:(unint64_t)a3
{
  self->_messagesInviteStatus = a3;
}

- (GKBoopHandler)boopHandler
{
  return self->_boopHandler;
}

- (void)setBoopHandler:(id)a3
{
  objc_storeStrong((id *)&self->_boopHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boopHandler, 0);
  objc_storeStrong((id *)&self->_playerPickerViewController, 0);
  objc_storeStrong((id *)&self->_buttonHeaderView, 0);
  objc_storeStrong((id *)&self->_multiplayerDataSource, 0);
  objc_storeStrong((id *)&self->_participantsInvitedByLocalPlayer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_destroyWeak((id *)&self->_nearbyDelegate);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_defaultInvitationMessage, 0);
  objc_storeStrong((id *)&self->_originalMatchRequest, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "Unable to find booped contact.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__GKMultiplayerViewController_initWithMatchRequest___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "Contact has already been invited, will not construct a new share URL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__GKMultiplayerViewController_sendInvitesToPlayersInOriginalMatchRequest__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "originalMatchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1AB361000, v3, OS_LOG_TYPE_ERROR, "Failed to load recipients from: %@", v6, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

void __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "Started boop nearby discovery.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__GKMultiplayerViewController_viewWillAppear___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "Error occured while starting boop nearby discovery: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, v0, v1, "Stopped boop handling.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__GKMultiplayerViewController_viewDidDisappear___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "Error occured while stopping boop handler: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_139_cold_1(void *a1, char a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[14];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a1;
  objc_msgSend(v5, "numberWithBool:", a2 & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v10 = a3;
  OUTLINED_FUNCTION_7(&dword_1AB361000, v6, v8, "CloudKit is not available. availibility: %@ error: %@", v9);

  OUTLINED_FUNCTION_1_0();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_140_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = v0;
  OUTLINED_FUNCTION_7(&dword_1AB361000, v1, (uint64_t)v1, "Error encountered for loadShareURLWithContactPlayers:completion:, in Messages invites: %@ error: %@", v2);
  OUTLINED_FUNCTION_4();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_144_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1AB361000, v0, OS_LOG_TYPE_ERROR, "It should not happen. ShareURL is nil but there is no error found.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_144_cold_2(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *a1;
  v7 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "messagesInviteStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "shareURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a3 + 40), "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v8;
  v13 = 2112;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1AB361000, v7, OS_LOG_TYPE_ERROR, "Cannot invite contact players - no shareURL or encountered error. Message Invite Status: %@, shareURL: %@, error: %@", (uint8_t *)&v11, 0x20u);

}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_150_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "Sent group message invitation via IMSPISendRichLink, to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __70__GKMultiplayerViewController_inviteContactPlayers_source_completion___block_invoke_2_150_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "Skipping group message invitation to: %@, due to one or more nil participant handles", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
