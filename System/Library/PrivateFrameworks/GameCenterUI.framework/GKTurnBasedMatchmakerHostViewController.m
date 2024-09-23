@implementation GKTurnBasedMatchmakerHostViewController

+ (id)turnBasedMatchmakerExtension
{
  if (turnBasedMatchmakerExtension_onceToken != -1)
    dispatch_once(&turnBasedMatchmakerExtension_onceToken, &__block_literal_global_38);
  return (id)turnBasedMatchmakerExtension_extension;
}

void __71__GKTurnBasedMatchmakerHostViewController_turnBasedMatchmakerExtension__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB35D8], "_gkExtensionWithIdentifier:error:", CFSTR("com.apple.GameCenterUI.GameCenterTurnBasedMatchmakerExtension"), &v11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v11;
  v2 = (void *)turnBasedMatchmakerExtension_extension;
  turnBasedMatchmakerExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __71__GKTurnBasedMatchmakerHostViewController_turnBasedMatchmakerExtension__block_invoke_cold_1((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
  }

}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
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
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __63__GKTurnBasedMatchmakerHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
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

- (void)setMatchRequestInternal:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7[0] = CFSTR("MessageCommandKey");
    v7[1] = CFSTR("MessageParamKey");
    v8[0] = &unk_1E5A5E1D8;
    v8[1] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
  }
}

- (void)setShowExistingMatches:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E1F0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)setShowPlay:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E208;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)setShowQuit:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E220;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)refreshMatches
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("MessageCommandKey");
  v5[0] = &unk_1E5A5E238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v3);

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
  objc_super v23;
  id v24;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;

  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    v10 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKTurnBasedMatchmakerHostViewController messageFromExtension:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageParamKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 == 19)
  {
    -[GKTurnBasedMatchmakerHostViewController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "finishWithError:", v19);

  }
  else
  {
    if (v18 == 11)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D253E0]), "initWithInternalRepresentation:", v19);
      -[GKTurnBasedMatchmakerHostViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "playerQuitMatch:", v20);
    }
    else
    {
      if (v18 != 10)
      {
        v23.receiver = self;
        v23.super_class = (Class)GKTurnBasedMatchmakerHostViewController;
        -[GKExtensionRemoteViewController messageFromExtension:](&v23, sel_messageFromExtension_, v4);
        goto LABEL_14;
      }
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D253E0]), "initWithInternalRepresentation:", v19);
      -[GKTurnBasedMatchmakerHostViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "finishWithMatch:", v20);
    }

  }
LABEL_14:

}

- (void)extensionIsCanceling
{
  id v2;

  -[GKTurnBasedMatchmakerHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (GKTurnBasedMatchmakerViewController)delegate
{
  return (GKTurnBasedMatchmakerViewController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__GKTurnBasedMatchmakerHostViewController_turnBasedMatchmakerExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Error loading Game Center turn based matchmaker extension, %@", a5, a6, a7, a8, 2u);
}

- (void)messageFromExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "error while decoding messageFromExtension archive in GKTurnBasedMatchmakerHostViewController:%@", a5, a6, a7, a8, 2u);
}

@end
