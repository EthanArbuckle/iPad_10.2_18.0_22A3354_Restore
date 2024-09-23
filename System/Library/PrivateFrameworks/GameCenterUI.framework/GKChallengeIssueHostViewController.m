@implementation GKChallengeIssueHostViewController

+ (id)challengeExtension
{
  if (challengeExtension_onceToken != -1)
    dispatch_once(&challengeExtension_onceToken, &__block_literal_global_24);
  return (id)challengeExtension_extension;
}

void __56__GKChallengeIssueHostViewController_challengeExtension__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB35D8], "_gkExtensionWithIdentifier:error:", CFSTR("com.apple.GameCenterUI.GameCenterChallengeIssueExtension"), &v11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v11;
  v2 = (void *)challengeExtension_extension;
  challengeExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __56__GKChallengeIssueHostViewController_challengeExtension__block_invoke_cold_1((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
  }

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
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  id v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    v10 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKChallengeIssueHostViewController messageFromExtension:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v18 == 45)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PlayerList"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "_gkMapWithBlock:", &__block_literal_global_3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ChallengeMessage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeIssueHostViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doneWithPlayers:message:", v21, v22);

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)GKChallengeIssueHostViewController;
    -[GKExtensionRemoteViewController messageFromExtension:](&v24, sel_messageFromExtension_, v4);
  }

}

id __59__GKChallengeIssueHostViewController_messageFromExtension___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D25358];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithInternalRepresentation:", v3);

  return v4;
}

- (void)extensionIsCanceling
{
  id v2;

  -[GKChallengeIssueHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doneWithPlayers:message:", 0, 0);

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
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
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

- (GKHostedChallengeIssueController)delegate
{
  return (GKHostedChallengeIssueController *)objc_loadWeakRetained((id *)&self->_delegateWeak);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegateWeak, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegateWeak);
}

void __56__GKChallengeIssueHostViewController_challengeExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Error loading Game Center challenge issue extension, %@", a5, a6, a7, a8, 2u);
}

- (void)messageFromExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "error while decoding messageFromExtension in GKChallengeIssueHostViewController:%@", a5, a6, a7, a8, 2u);
}

void __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1AB361000, v3, OS_LOG_TYPE_DEBUG, "error calling extension - %@", (uint8_t *)&v5, 0xCu);

}

@end
