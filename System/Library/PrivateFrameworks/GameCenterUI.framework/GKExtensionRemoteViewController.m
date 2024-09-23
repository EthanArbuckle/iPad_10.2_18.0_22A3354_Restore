@implementation GKExtensionRemoteViewController

- (GKExtensionRemoteViewController)init
{
  GKExtensionRemoteViewController *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKExtensionRemoteViewController;
  v2 = -[GKExtensionRemoteViewController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1 || (*MEMORY[0x1E0D253F8] ? (v5 = *MEMORY[0x1E0D25B68] == 0) : (v5 = 0), v5))
    {
      -[GKExtensionRemoteViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 17);
    }
    else
    {
      -[GKExtensionRemoteViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formSheetSize");
      -[GKExtensionRemoteViewController setPreferredContentSize:](v2, "setPreferredContentSize:");

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearResourceCache");

  v4.receiver = self;
  v4.super_class = (Class)GKExtensionRemoteViewController;
  -[_UIRemoteViewController dealloc](&v4, sel_dealloc);
}

+ (void)setupCallbackBlocksForExtension:(id)a3 withParentViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v5 = a3;
  v6 = a4;
  objc_initWeak(&location, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke;
  v7[3] = &unk_1E59C72B8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "setRequestInterruptionBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ExtensionErrorDomain"), -5900, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2;
  v4[3] = &unk_1E59C6010;
  v5 = v2;
  v3 = v2;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v6);

}

void __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;

  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  v3 = *MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "extensionDidFinishWithError:", *(_QWORD *)(a1 + 32));

}

+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  _QWORD block[4];
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_2;
    v11[3] = &unk_1E59C7308;
    v14 = v15;
    v12 = v7;
    v13 = v10;
    objc_msgSend(v12, "instantiateViewControllerWithInputItems:connectionHandler:", v8, v11);

    _Block_object_dispose(v15, 8);
  }
  else if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke;
    block[3] = &unk_1E59C4DA8;
    v17 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v10 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Extensions/GKExtensionRemoteViewController.m", 104, "+[GKExtensionRemoteViewController viewControllerForExtension:inputItems:completionHandler:]_block_invoke_2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3;
  v25[3] = &unk_1E59C72E0;
  v26 = v9;
  v14 = *(id *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 48);
  v27 = v14;
  v31 = v15;
  v16 = v12;
  v28 = v16;
  v29 = v8;
  v30 = v7;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  objc_msgSend(v16, "perform:", v25);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_17;
  v22[3] = &unk_1E59C4D80;
  v20 = *(id *)(a1 + 40);
  v23 = v16;
  v24 = v20;
  v21 = v16;
  objc_msgSend(v21, "notifyOnMainQueueWithBlock:", v22);

}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *MEMORY[0x1E0D25460];
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v4)
      v5 = (id)GKOSLoggers();
    v6 = (void *)*MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_2(a1, v6);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("error"));
    v3[2](v3);
  }
  else
  {
    if (!v4)
      v7 = (id)GKOSLoggers();
    v8 = (void *)*MEMORY[0x1E0D25468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
      __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_1(a1, v8);
    objc_msgSend(*(id *)(a1 + 40), "_extensionContextForUUID:", *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v11, "setExtension:", v10);
    objc_msgSend(v11, "setRequestIdentifier:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v9, "setRemoteViewController:", v11);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, CFSTR("remoteViewController"));

    v3[2](v3);
  }

}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("remoteViewController"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("error"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);

  }
}

+ (id)initialItemsForExtension
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
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("StatusBarHeightKey");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarHeight");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("HostPIDKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("CurrentGameKey");
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("LocalPlayerKey");
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  v13[4] = CFSTR("RTLKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", GKShouldLayoutRTL());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  v13[5] = CFSTR("LocalizationsKey");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredLocalizations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKExtensionRemoteViewController;
  -[GKExtensionRemoteViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[GKExtensionRemoteViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  -[GKExtensionRemoteViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  objc_super v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAccessPoint");

  v10.receiver = self;
  v10.super_class = (Class)GKExtensionRemoteViewController;
  -[_UIRemoteViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x1E0D25B48], "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsShowingRemoteUI:", 1);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 1 || (*MEMORY[0x1E0D253F8] ? (v9 = *MEMORY[0x1E0D25B68] == 0) : (v9 = 0), v9))
    -[UIViewController _gkSaveStatusBarStyleAnimated:setToStyle:](self, "_gkSaveStatusBarStyleAnimated:setToStyle:", v3, -[GKExtensionRemoteViewController _desiredStatusBarStyle](self, "_desiredStatusBarStyle"));
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKExtensionRemoteViewController;
  -[_UIRemoteViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  objc_msgSend(MEMORY[0x1E0D25B48], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsShowingRemoteUI:", 0);

  -[UIViewController _gkRestoreStatusBarStyle:](self, "_gkRestoreStatusBarStyle:", v3);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showAccessPoint");

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

- (int64_t)_desiredStatusBarStyle
{
  return 300;
}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
}

- (void)cancelExtension
{
  void *v3;
  id v4;

  -[GKExtensionRemoteViewController extension](self, "extension");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController requestIdentifier](self, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", v3);

}

- (void)sendMessageToExtension:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController extensionObjectProxy](self, "extensionObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageFromClient:", v5);

}

- (void)extensionIsCanceling
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "dismissAutomaticallyAfterExtensionCompletion"))
  {
    -[GKExtensionRemoteViewController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v5 = CFSTR("MessageCommandKey");
  v6[0] = &unk_1E5A5E0A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v4);

}

- (void)extensionIsFinishing
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "dismissAutomaticallyAfterExtensionCompletion"))
  {
    -[GKExtensionRemoteViewController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v5 = CFSTR("MessageCommandKey");
  v6[0] = &unk_1E5A5E0B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v4);

}

- (id)extensionObjectProxy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[GKExtensionRemoteViewController extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_extensionContextForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __55__GKExtensionRemoteViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if (!*MEMORY[0x1E0D25460])
    v3 = (id)GKOSLoggers();
  v4 = (void *)*MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
    __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke_cold_1(v4, v2);

}

- (void)messageFromClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKExtensionRemoteViewController extensionObjectProxy](self, "extensionObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageFromClient:", v4);

}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = (id)objc_msgSend(a3, "mutableCopy");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "userInterfaceIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("HostUserInterfaceIdiom"));

  -[GKExtensionRemoteViewController extensionObjectProxy](self, "extensionObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInitialState:withReply:", v11, v6);

}

- (void)hostApp:(id)a3 grantingAccessExtensionSandbox:(id)a4 replyWithEndpoint:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GKExtensionRemoteViewController extensionObjectProxy](self, "extensionObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hostApp:grantingAccessExtensionSandbox:replyWithEndpoint:", v10, v9, v8);

}

- (void)tearDownExtensionWithReply:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKExtensionRemoteViewController extensionObjectProxy](self, "extensionObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tearDownExtensionWithReply:", v5);

}

- (void)messageFromExtension:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v6, v5, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v20;
  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    v10 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKExtensionRemoteViewController messageFromExtension:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v18 == 2)
  {
    -[GKExtensionRemoteViewController extensionIsFinishing](self, "extensionIsFinishing");
  }
  else if (v18 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reportAuthenticationLoginCanceled");

    -[GKExtensionRemoteViewController extensionIsCanceling](self, "extensionIsCanceling");
  }

}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (id)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

void __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Extension request interrupted with error: %@", a5, a6, a7, a8, 2u);
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v3, "numberWithInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(&dword_1AB361000, v4, OS_LOG_TYPE_DEBUG, "Received _UIRemoteViewController for Game Center extension: %@, connectionHandler call count: %@, remoteViewController: %@", v6, 0x20u);

  OUTLINED_FUNCTION_1_6();
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v3, "numberWithInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6();
  _os_log_error_impl(&dword_1AB361000, v4, OS_LOG_TYPE_ERROR, "Error instantiating remote view controller for extension: %@, connectionHandler call count: %@, error: %@", v6, 0x20u);

  OUTLINED_FUNCTION_1_6();
}

- (void)messageFromExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "error while decoding messageFromExtension archive in UIRemoteViewController:%@", a5, a6, a7, a8, 2u);
}

@end
