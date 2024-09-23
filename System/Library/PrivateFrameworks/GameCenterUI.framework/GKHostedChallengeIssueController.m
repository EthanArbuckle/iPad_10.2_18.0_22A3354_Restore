@implementation GKHostedChallengeIssueController

+ (id)hostedIssueControllerWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  GKHostedChallengeIssueController *v13;
  id v14;
  GKHostedChallengeIssueController *v15;
  void *v16;
  GKHostedChallengeIssueController *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  v30 = 0;
  v13 = [GKHostedChallengeIssueController alloc];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __112__GKHostedChallengeIssueController_hostedIssueControllerWithChallenge_players_defaultMessage_completionHandler___block_invoke;
  v22 = &unk_1E59C7EC0;
  v14 = v12;
  v23 = v14;
  v24 = &v25;
  v15 = -[GKHostedChallengeIssueController initWithChallenge:players:defaultMessage:completionHandler:](v13, "initWithChallenge:players:defaultMessage:completionHandler:", v9, v10, v11, &v19);
  objc_storeStrong(v26 + 5, v15);
  -[GKHostedChallengeIssueController setForcePicker:](v15, "setForcePicker:", 1, v19, v20, v21, v22);
  v16 = v23;
  v17 = v15;

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __112__GKHostedChallengeIssueController_hostedIssueControllerWithChallenge_players_defaultMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "count");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, BOOL, id))(v4 + 16))(v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3 != 0, v5);

}

- (GKHostedChallengeIssueController)initWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GKHostedChallengeIssueController *v14;
  GKHostedChallengeIssueController *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GKHostedChallengeIssueController;
  v14 = -[GKHostedChallengeIssueController init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[GKHostedChallengeIssueController setPlayers:](v14, "setPlayers:", v11);
    -[GKHostedChallengeIssueController setChallenge:](v15, "setChallenge:", v10);
    -[GKHostedChallengeIssueController setDefaultMessage:](v15, "setDefaultMessage:", v12);
    -[GKHostedChallengeIssueController setCompletionHandler:](v15, "setCompletionHandler:", v13);
    -[GKHostedChallengeIssueController _setupChildViewController](v15, "_setupChildViewController");
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[GKExtensionRemoteViewController cancelExtension](self->_remoteViewController, "cancelExtension");
  -[GKHostedChallengeIssueController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GKHostedChallengeIssueController;
  -[GKHostedChallengeIssueController dealloc](&v3, sel_dealloc);
}

- (void)_setupChildViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[GKHostedChallengeIssueController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[GKHostedChallengeIssueController setWantsFullScreenLayout:](self, "setWantsFullScreenLayout:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    -[GKHostedChallengeIssueController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formSheetSize");
    -[GKHostedChallengeIssueController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
  else
  {
    -[GKHostedChallengeIssueController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
  }
  if (!self->_remoteViewController)
    -[GKHostedChallengeIssueController _setupRemoteViewController](self, "_setupRemoteViewController");
}

+ (id)presentationQueue
{
  if (presentationQueue_onceToken != -1)
    dispatch_once(&presentationQueue_onceToken, &__block_literal_global_43);
  return (id)presentationQueue_sResult;
}

void __53__GKHostedChallengeIssueController_presentationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.gamecenter.gkmodalchallangeissueviewcontroller", v2);
  v1 = (void *)presentationQueue_sResult;
  presentationQueue_sResult = (uint64_t)v0;

}

+ (void)presentHostedIssueControllerWithChallenge:(id)a3 players:(id)a4 defaultMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "presentationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  gk_dispatch_async_do();

}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_2;
  v5[3] = &unk_1E59C5688;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v2 = objc_alloc_init(MEMORY[0x1E0DC4150]);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  objc_msgSend(v2, "setRotationDecider:", v4);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_3;
  v20[3] = &unk_1E59C7F08;
  v13 = v2;
  v21 = v13;
  v22 = *(id *)(a1 + 56);
  +[GKHostedChallengeIssueController hostedIssueControllerWithChallenge:players:defaultMessage:completionHandler:](GKHostedChallengeIssueController, "hostedIssueControllerWithChallenge:players:defaultMessage:completionHandler:", v9, v10, v11, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setForcePicker:", 1);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_5;
  v17[3] = &unk_1E59C7F30;
  v18 = v13;
  v19 = v8;
  v15 = v8;
  v16 = v13;
  objc_msgSend(v14, "setReceivedRemoteHandler:", v17);

}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_4;
  v6[3] = &unk_1E59C53C8;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  id v4;

  v4 = *(id *)(a1 + 32);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "dismissCompletionHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v4, "dismissCompletionHandler");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

      objc_msgSend(v4, "setDismissCompletionHandler:", 0);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __101__GKHostedChallengeIssueController_presentHostedIssueControllerWithChallenge_players_defaultMessage___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewController:sendingView:animated:", a2, *(_QWORD *)(a1 + 40), 1);
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
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

- (void)doneWithPlayers:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (self->_completionHandler)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__GKHostedChallengeIssueController_doneWithPlayers_message___block_invoke;
    block[3] = &unk_1E59C54B8;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __60__GKHostedChallengeIssueController_doneWithPlayers_message___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
}

- (void)_setupRemoteViewController
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  +[GKChallengeIssueHostViewController challengeExtension](GKChallengeIssueHostViewController, "challengeExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:withParentViewController:](GKExtensionRemoteViewController, "setupCallbackBlocksForExtension:withParentViewController:", v3, self);
    -[GKHostedChallengeIssueController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_17_0, 5.0);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_18;
    v4[3] = &unk_1E59C5A08;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:inputItems:completionHandler:](GKExtensionRemoteViewController, "viewControllerForExtension:inputItems:completionHandler:", v3, 0, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

}

uint64_t __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;

  if (a2)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_cold_1(v4);
  }
  return a2 ^ 1u;
}

void __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  id v26;

  v26 = a2;
  v5 = a3;
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v26)
  {
    v8 = v26;
    v9 = objc_loadWeakRetained(v6);
    objc_msgSend(v9, "setRemoteViewController:", v8);

    v10 = objc_loadWeakRetained(v6);
    objc_msgSend(v10, "remoteViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", WeakRetained);

    objc_msgSend(WeakRetained, "addChildViewController:", v8);
    objc_msgSend(WeakRetained, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v8, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    objc_msgSend(WeakRetained, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

    objc_msgSend(v8, "didMoveToParentViewController:", WeakRetained);
    objc_msgSend(WeakRetained, "receivedRemoteHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(WeakRetained, "receivedRemoteHandler");
      v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v25)[2](v25, v8);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionDidFinishWithError:", v5);
  }

}

- (void)setRemoteViewController:(id)a3
{
  GKChallengeIssueHostViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *defaultMessage;
  GKChallenge *challenge;
  void *v14;
  GKChallengeIssueHostViewController *remoteViewController;
  _QWORD v16[4];
  id v17;
  id location;

  v5 = (GKChallengeIssueHostViewController *)a3;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    v6 = (void *)MEMORY[0x1E0C99E08];
    +[GKExtensionRemoteViewController initialItemsForExtension](GKExtensionRemoteViewController, "initialItemsForExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKHostedChallengeIssueController players](self, "players");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_gkMapWithBlock:", &__block_literal_global_22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("PlayerInternalsKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_forcePicker);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("ForcePickerKey"));

    defaultMessage = self->_defaultMessage;
    if (defaultMessage)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", defaultMessage, CFSTR("MessageKey"));
    challenge = self->_challenge;
    if (challenge)
    {
      -[GKChallenge internal](challenge, "internal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("ChallengeKey"));

    }
    objc_initWeak(&location, self);
    remoteViewController = self->_remoteViewController;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_2;
    v16[3] = &unk_1E59C5A30;
    objc_copyWeak(&v17, &location);
    -[GKExtensionRemoteViewController setInitialState:withReply:](remoteViewController, "setInitialState:withReply:", v8, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

uint64_t __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "internal");
}

void __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_3;
  block[3] = &unk_1E59C48A0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __60__GKHostedChallengeIssueController_setRemoteViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_endDelayingPresentation");
    WeakRetained = v2;
  }

}

- (void)extensionDidFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;

  -[GKHostedChallengeIssueController completionHandler](self, "completionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKHostedChallengeIssueController completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, 0);

    -[GKHostedChallengeIssueController setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[GKChallengeIssueHostViewController willMoveToParentViewController:](self->_remoteViewController, "willMoveToParentViewController:", 0);
  -[GKChallengeIssueHostViewController view](self->_remoteViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[GKChallengeIssueHostViewController removeFromParentViewController](self->_remoteViewController, "removeFromParentViewController");
  -[GKHostedChallengeIssueController setRemoteViewController:](self, "setRemoteViewController:", 0);
}

- (GKChallengeIssueHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (NSString)defaultMessage
{
  return self->_defaultMessage;
}

- (void)setDefaultMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (BOOL)forcePicker
{
  return self->_forcePicker;
}

- (void)setForcePicker:(BOOL)a3
{
  self->_forcePicker = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (id)receivedRemoteHandler
{
  return self->_receivedRemoteHandler;
}

- (void)setReceivedRemoteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong(&self->_receivedRemoteHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_defaultMessage, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __62__GKHostedChallengeIssueController__setupRemoteViewController__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "We failed to present challenge issue extension.", v1, 2u);
}

@end
