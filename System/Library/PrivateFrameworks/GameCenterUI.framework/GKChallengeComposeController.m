@implementation GKChallengeComposeController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKChallengeComposeController;
  -[GKChallengeComposeController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
  objc_msgSend(v3, "_setGroupName:", CFSTR("gameLayerGroup"));
  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundEffects:", v4);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKChallengeComposeController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:atIndex:", v3, 0);

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[GKChallengeComposeController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v3, v7);

}

+ (void)composeAndSendFlowForChallenge:(id)a3 selectPlayers:(id)a4 defaultMessage:(id)a5 forcePicker:(BOOL)a6 readyHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  BOOL v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  BOOL v46;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = v18;
  if (!v17)
  {
    v37 = a6;
    v26 = a1;
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Compose/GKChallengeComposeController.m");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastPathComponent");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ (readyHandler != ((void *)0))\n[%s (%s:%d)]"), v28, "+[GKChallengeComposeController composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:]", objc_msgSend(v30, "UTF8String"), 65);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v26;
    a6 = v37;

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v31);
    if (v19)
      goto LABEL_3;
LABEL_5:
    v38 = a1;
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Compose/GKChallengeComposeController.m");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastPathComponent");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ (handler != ((void *)0))\n[%s (%s:%d)]"), v33, "+[GKChallengeComposeController composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:]", objc_msgSend(v35, "UTF8String"), 66);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v36);
    a1 = v38;
    goto LABEL_3;
  }
  if (!v18)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __135__GKChallengeComposeController_composeAndSendFlowForChallenge_selectPlayers_defaultMessage_forcePicker_readyHandler_completionHandler___block_invoke;
  v39[3] = &unk_1E59C6248;
  v46 = a6;
  v40 = v15;
  v41 = v14;
  v42 = v16;
  v43 = v19;
  v44 = v17;
  v45 = a1;
  v21 = v17;
  v22 = v19;
  v23 = v16;
  v24 = v14;
  v25 = v15;
  objc_msgSend(v20, "loadRecentPlayersWithCompletionHandler:", v39);

}

void __135__GKChallengeComposeController_composeAndSendFlowForChallenge_selectPlayers_defaultMessage_forcePicker_readyHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v10 = v3;
  v5 = objc_msgSend(v10, "count");
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!*(_BYTE *)(a1 + 80) && (v6 || v5 < 2))
  {
    if (!v6)
    {
      v9 = v10;

      v4 = v9;
    }
    objc_msgSend(*(id *)(a1 + 72), "composeFlowForChallenge:players:defaultMessage:completionHandler:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "friendPickerFlowForChallenge:selectPlayers:defaultMessage:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

+ (id)composeFlowForChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  GKChallengeComposeController *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v13 = -[GKChallengeComposeController initWithChallenge:defaultMessage:players:]([GKChallengeComposeController alloc], "initWithChallenge:defaultMessage:players:", v9, v11, 0);
    objc_initWeak(&location, v13);
    -[GKChallengeComposeController setPlayersToLoad:](v13, "setPlayersToLoad:", v10);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke;
    v15[3] = &unk_1E59C6298;
    objc_copyWeak(&v18, &location);
    v16 = v9;
    v17 = v12;
    -[GKSimpleComposeController setDoneHandler:](v13, "setDoneHandler:", v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke_2;
  block[3] = &unk_1E59C6270;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v6;
  v11 = a1[4];
  v12 = v5;
  v13 = a1[5];
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __97__GKChallengeComposeController_composeFlowForChallenge_players_defaultMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "players");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "issueToPlayers:message:", v3, *(_QWORD *)(a1 + 48));
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v3, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setDoneHandler:", 0);

}

+ (id)friendPickerFlowForChallenge:(id)a3 selectPlayers:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  GKChallengePlayerPickerViewController *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[GKChallengePlayerPickerViewController initWithChallenge:initiallySelectedPlayers:]([GKChallengePlayerPickerViewController alloc], "initWithChallenge:initiallySelectedPlayers:", v9, v10);
  -[GKChallengePlayerPickerViewController setMessage:](v13, "setMessage:", v11);
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke;
  v20[3] = &unk_1E59C62C0;
  v15 = v12;
  v21 = v15;
  -[GKChallengePlayerPickerViewController setCompletionHandler:](v13, "setCompletionHandler:", v20);
  objc_initWeak(&location, v13);
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_3;
  v17[3] = &unk_1E59C4AA0;
  objc_copyWeak(&v18, &location);
  -[GKChallengePlayerPickerViewController setInviteFriendHandler:](v13, "setInviteFriendHandler:", v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_2;
  block[3] = &unk_1E59C4620;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "supportsFriendingViaPush"))
    {
      objc_msgSend(v4, "contactAssociationID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        +[GKMetricsBridge recordInviteFriendClickEventWithType:pageType:pageId:](_TtC12GameCenterUI15GKMetricsBridge, "recordInviteFriendClickEventWithType:pageType:pageId:", 0, CFSTR("challenge"), CFSTR("friendSelect"));
        objc_msgSend(v4, "contact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contactAssociationID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[GameCenterObjcHelper sendFriendInvitationViaPushWithContactID:contactAssociationID:completionHandler:](_TtC12GameCenterUI20GameCenterObjcHelper, "sendFriendInvitationViaPushWithContactID:contactAssociationID:completionHandler:", v7, v8, &__block_literal_global_23);

        goto LABEL_11;
      }
    }
    +[GKMetricsBridge recordInviteFriendClickEventWithType:pageType:pageId:](_TtC12GameCenterUI15GKMetricsBridge, "recordInviteFriendClickEventWithType:pageType:pageId:", 1, CFSTR("challenge"), CFSTR("friendSelect"));
    objc_msgSend(v4, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[GKMetricsBridge recordInviteFriendClickEventWithType:pageType:pageId:](_TtC12GameCenterUI15GKMetricsBridge, "recordInviteFriendClickEventWithType:pageType:pageId:", 2, CFSTR("challenge"), CFSTR("friendSelect"));
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  v11 = (id *)(a1 + 32);
  if (*MEMORY[0x1E0D253F8])
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_5;
    v15[3] = &unk_1E59C6308;
    v12 = &v16;
    objc_copyWeak(&v16, v11);
    +[FriendRequestFacilitator makeViewControllerWithRecipients:chatGUID:completionHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerWithRecipients:chatGUID:completionHandler:", v9, 0, v15);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_6;
    v13[3] = &unk_1E59C6330;
    v12 = &v14;
    objc_copyWeak(&v14, v11);
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:", v9, 0, v13);
  }
  objc_destroyWeak(v12);

LABEL_11:
}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

}

void __108__GKChallengeComposeController_friendPickerFlowForChallenge_selectPlayers_defaultMessage_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
    v6 = v9;
  else
    v6 = v5;
  if (v6)
  {
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

- (GKChallengeComposeController)init
{
  GKChallengeComposeController *v2;
  GKChallengeComposeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKChallengeComposeController;
  v2 = -[GKBaseComposeController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GKBaseComposeController setShowHeaderFieldContainer:](v2, "setShowHeaderFieldContainer:", 0);
    GKGameCenterUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKBaseComposeController messageField](v3, "messageField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaceholderText:", v5);

    -[GKBaseComposeController messageField](v3, "messageField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextContainerInset:", 5.0, 0.0, 0.0, 0.0);

  }
  return v3;
}

- (GKChallengeComposeController)initWithChallenge:(id)a3 defaultMessage:(id)a4 players:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKChallengeComposeController *v11;
  GKChallengeComposeController *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GKChallengeComposeController init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[GKChallengeComposeController setChallenge:](v11, "setChallenge:", v8);
    -[GKSimpleComposeController setDefaultMessage:](v12, "setDefaultMessage:", v9);
    -[GKSimpleComposeController setPlayers:](v12, "setPlayers:", v10);
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[GKChallengeComposeController updateChallengeText](self, "updateChallengeText");
  v5.receiver = self;
  v5.super_class = (Class)GKChallengeComposeController;
  -[GKSimpleComposeController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)updateChallengeText
{
  id v3;

  -[GKChallenge composeGoalText](self->_challenge, "composeGoalText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[GKComposeHeaderField setValueText:](self->_challengeField, "setValueText:", v3);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GKChallengeComposeController;
  -[GKSimpleComposeController loadView](&v14, sel_loadView);
  -[GKChallengeComposeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  if (-[NSArray count](self->_playersToLoad, "count")
    || (-[GKChallenge detailsLoaded](self->_challenge, "detailsLoaded") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Compose/GKChallengeComposeController.m", 232, "-[GKChallengeComposeController loadView]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dispatchGroupWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKLoadableContentViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadingState"));
    v9 = -[NSArray count](self->_playersToLoad, "count");
    v10 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __40__GKChallengeComposeController_loadView__block_invoke;
      v13[3] = &unk_1E59C4A28;
      v13[4] = self;
      objc_msgSend(v8, "perform:", v13);
    }
    if ((-[GKChallenge detailsLoaded](self->_challenge, "detailsLoaded") & 1) == 0)
    {
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __40__GKChallengeComposeController_loadView__block_invoke_4;
      v12[3] = &unk_1E59C4A28;
      v12[4] = self;
      objc_msgSend(v8, "perform:", v12);
    }
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __40__GKChallengeComposeController_loadView__block_invoke_6;
    v11[3] = &unk_1E59C4148;
    v11[4] = self;
    objc_msgSend(v8, "notifyOnMainQueueWithBlock:", v11);

  }
}

void __40__GKChallengeComposeController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D25358];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 1192);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__GKChallengeComposeController_loadView__block_invoke_2;
  v8[3] = &unk_1E59C46B8;
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "loadCompletePlayersForPlayers:completionHandler:", v6, v8);

}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setPlayers:", v4);
  objc_msgSend(v4, "_gkMapWithBlock:", &__block_literal_global_60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientNameStrings:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setPlayersToLoad:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayNameWithOptions:", 0);
}

void __40__GKChallengeComposeController_loadView__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1184);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__GKChallengeComposeController_loadView__block_invoke_5;
  v7[3] = &unk_1E59C53C8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "loadDetailsWithCompletionHandler:", v7);

}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateChallengeText");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __40__GKChallengeComposeController_loadView__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", CFSTR("LoadedState"));
}

- (void)cancel
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;

  -[GKBaseComposeController intendedFirstResponder](self, "intendedFirstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  -[GKSimpleComposeController doneHandler](self, "doneHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKSimpleComposeController doneHandler](self, "doneHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);

    -[GKSimpleComposeController setDoneHandler:](self, "setDoneHandler:", 0);
  }
}

- (void)donePressed
{
  void *v3;
  objc_super v4;

  -[GKBaseComposeController intendedFirstResponder](self, "intendedFirstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  v4.receiver = self;
  v4.super_class = (Class)GKChallengeComposeController;
  -[GKSimpleComposeController donePressed](&v4, sel_donePressed);
}

- (GKComposeHeaderField)challengeField
{
  return self->_challengeField;
}

- (void)setChallengeField:(id)a3
{
  objc_storeStrong((id *)&self->_challengeField, a3);
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSArray)playersToLoad
{
  return self->_playersToLoad;
}

- (void)setPlayersToLoad:(id)a3
{
  objc_storeStrong((id *)&self->_playersToLoad, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playersToLoad, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_challengeField, 0);
}

@end
