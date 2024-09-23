@implementation GKDashboardHostViewController

+ (id)dashboardExtension
{
  if (dashboardExtension_onceToken != -1)
    dispatch_once(&dashboardExtension_onceToken, &__block_literal_global_37);
  return (id)dashboardExtension_extension;
}

void __51__GKDashboardHostViewController_dashboardExtension__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "_gkExtensionWithIdentifier:error:", CFSTR("com.apple.GameCenterUI.GameCenterDashboardExtension"), &v11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v11;
  v2 = (void *)dashboardExtension_extension;
  dashboardExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __51__GKDashboardHostViewController_dashboardExtension__block_invoke_cold_1((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
  }

}

- (GKDashboardHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  GKDashboardHostViewController *v4;
  NSObject *v5;
  NSObject *dashboardAssetController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDashboardHostViewController;
  v4 = -[GKDashboardHostViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    dashboardAssetController = v4->_dashboardAssetController;
    v4->_dashboardAssetController = v5;

  }
  return v4;
}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideAccessPoint");

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardHostViewController;
  -[GKExtensionRemoteViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardHostViewController;
  -[GKExtensionRemoteViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showAccessPoint");

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
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __53__GKDashboardHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
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

- (void)hostDidChangeViewState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MessageCommandKey");
  v7[1] = CFSTR("MessageParamKey");
  v8[0] = &unk_1E5A5E0D0;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
}

- (void)hostDidChangeLeaderboardIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MessageCommandKey");
  v7[1] = CFSTR("MessageParamKey");
  v8[0] = &unk_1E5A5E0E8;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
}

- (void)hostDidChangeLeaderboardTimeScope:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MessageCommandKey");
  v7[1] = CFSTR("MessageParamKey");
  v8[0] = &unk_1E5A5E100;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
}

- (void)hostDidChangeLeaderboardPlayerScope:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MessageCommandKey");
  v7[1] = CFSTR("MessageParamKey");
  v8[0] = &unk_1E5A5E118;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
}

- (void)hostSupportsShowingPlayForChallenge:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E130;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)hostSupportsShowingPlayForTurnBasedMatch:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E148;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)hostSupportsShowingQuitForTurnBasedMatch:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E160;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)messageFromExtension:(id)a3
{
  id v4;
  void *v5;
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
  void *v20;
  objc_super v21;
  id v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;

  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    v10 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKDashboardHostViewController messageFromExtension:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageParamKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v18)
  {
    case 5:
      -[GKDashboardHostViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setViewStateFromExtension:", objc_msgSend(v19, "integerValue"));
      goto LABEL_13;
    case 6:
      -[GKDashboardHostViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLeaderboardIdentifierFromExtension:", v19);
      goto LABEL_13;
    case 7:
      -[GKDashboardHostViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLeaderboardTimeScopeFromExtension:", objc_msgSend(v19, "integerValue"));
      goto LABEL_13;
    case 8:
      -[GKDashboardHostViewController playPressedForChallenge:](self, "playPressedForChallenge:", v19);
      goto LABEL_17;
    case 9:
      goto LABEL_10;
    case 10:
      -[GKDashboardHostViewController finishWithMatch:](self, "finishWithMatch:", v19);
      goto LABEL_17;
    case 11:
      -[GKDashboardHostViewController playerQuitMatch:](self, "playerQuitMatch:", v19);
      goto LABEL_17;
    default:
      if (v18 == 50)
      {
        -[GKDashboardHostViewController delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setLeaderboardPlayerScopeFromExtension:", objc_msgSend(v19, "integerValue"));
LABEL_13:

      }
      else
      {
LABEL_10:
        v21.receiver = self;
        v21.super_class = (Class)GKDashboardHostViewController;
        -[GKExtensionRemoteViewController messageFromExtension:](&v21, sel_messageFromExtension_, v4);
      }
LABEL_17:

      return;
  }
}

- (void)playPressedForChallenge:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D25280], "challengeForInternalRepresentation:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25288], "challengeEventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "localPlayerDidSelectChallenge:", v7);
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventEmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player:wantsToPlayChallenge:", v5, v7);

}

- (void)finishWithMatch:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0D25330];
  v4 = a3;
  objc_msgSend(v3, "localPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventEmitter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D253E0]), "initWithInternalRepresentation:", v4);

  objc_msgSend(v5, "player:receivedTurnEventForMatch:didBecomeActive:", v7, v6, 1);
}

- (void)playerQuitMatch:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0D25330];
  v4 = a3;
  objc_msgSend(v3, "localPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventEmitter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D253E0]), "initWithInternalRepresentation:", v4);

  objc_msgSend(v5, "player:wantsToQuitMatch:", v7, v6);
}

- (void)extensionIsCanceling
{
  void *v3;
  objc_super v4;

  -[GKDashboardHostViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyDelegateOnWillFinish");

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardHostViewController;
  -[GKExtensionRemoteViewController extensionIsCanceling](&v4, sel_extensionIsCanceling);
}

- (void)extensionIsFinishing
{
  void *v3;
  objc_super v4;

  -[GKDashboardHostViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyDelegateOnWillFinish");

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardHostViewController;
  -[GKExtensionRemoteViewController extensionIsFinishing](&v4, sel_extensionIsFinishing);
}

- (GKGameCenterViewController)delegate
{
  return (GKGameCenterViewController *)objc_loadWeakRetained((id *)&self->_delegateWeak);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegateWeak, a3);
}

- (NSObject)dashboardAssetController
{
  return self->_dashboardAssetController;
}

- (void)setDashboardAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardAssetController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashboardAssetController, 0);
  objc_destroyWeak((id *)&self->_delegateWeak);
}

void __51__GKDashboardHostViewController_dashboardExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Error loading Game Center dashboard extension, %@", a5, a6, a7, a8, 2u);
}

- (void)messageFromExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "error while decoding messageFromExtension in GKDashboardHostViewController:%@", a5, a6, a7, a8, 2u);
}

@end
