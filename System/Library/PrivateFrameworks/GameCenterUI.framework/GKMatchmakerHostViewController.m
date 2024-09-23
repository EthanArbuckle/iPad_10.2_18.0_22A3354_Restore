@implementation GKMatchmakerHostViewController

+ (id)matchmakerExtension
{
  if (matchmakerExtension_onceToken != -1)
    dispatch_once(&matchmakerExtension_onceToken, &__block_literal_global_50);
  return (id)matchmakerExtension_extension;
}

void __53__GKMatchmakerHostViewController_matchmakerExtension__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB35D8], "_gkExtensionWithIdentifier:error:", CFSTR("com.apple.GameCenterUI.GameCenterMatchmakerExtension"), &v11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v11;
  v2 = (void *)matchmakerExtension_extension;
  matchmakerExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      __53__GKMatchmakerHostViewController_matchmakerExtension__block_invoke_cold_1((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
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
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __54__GKMatchmakerHostViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
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
    v8[0] = &unk_1E5A5E3A0;
    v8[1] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
  }
}

- (void)setAcceptedInviteInternal:(id)a3
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
    v8[0] = &unk_1E5A5E3B8;
    v8[1] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
  }
}

- (void)setHosted:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E3D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)setMatchmakingMode:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E3E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)setCanStartWithMinimumPlayers:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E400;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)setEligibilityForGroupSession:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E418;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)setSharePlaySharingControllerResult:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E430;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)setExistingPlayers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MessageCommandKey");
  v7[1] = CFSTR("MessageParamKey");
  v8[0] = &unk_1E5A5E448;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
}

- (void)setDefaultInvitationMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MessageCommandKey");
  v7[1] = CFSTR("MessageParamKey");
  v8[0] = &unk_1E5A5E460;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("MessageCommandKey");
  v6[1] = CFSTR("MessageParamKey");
  v7[0] = &unk_1E5A5E478;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v5);

}

- (void)groupActivityJoiningPlayer:(id)a3 devicePushToken:(id)a4 participantServerIdentifier:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("MessageCommandKey");
  v16[1] = CFSTR("PlayerInternal");
  v17[0] = &unk_1E5A5E490;
  v17[1] = a3;
  v16[2] = CFSTR("MessageParamKey");
  v14[0] = CFSTR("pushToken");
  v14[1] = CFSTR("participantIdentifier");
  v15[0] = a4;
  v15[1] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v13);
}

- (void)setPlayer:(id)a3 responded:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MessageCommandKey");
  v10[1] = CFSTR("PlayerInternal");
  v11[0] = &unk_1E5A5E4A8;
  v11[1] = a3;
  v10[2] = CFSTR("MessageParamKey");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v9);
}

- (void)setConnectingStateForPlayer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("MessageCommandKey");
  v7[1] = CFSTR("PlayerInternal");
  v8[0] = &unk_1E5A5E4C0;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v6);
}

- (void)setPlayer:(id)a3 connected:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v4 = a4;
  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MessageCommandKey");
  v10[1] = CFSTR("PlayerInternal");
  v11[0] = &unk_1E5A5E4D8;
  v11[1] = a3;
  v10[2] = CFSTR("MessageParamKey");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v9);
}

- (void)setPlayer:(id)a3 sentData:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MessageCommandKey");
  v10[1] = CFSTR("PlayerInternal");
  v11[0] = &unk_1E5A5E4F0;
  v11[1] = a3;
  v10[2] = CFSTR("MessageParamKey");
  v11[2] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v9);
}

- (void)setInvitesFailedWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", &unk_1E5A5E508, CFSTR("MessageCommandKey"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("MessageParamKey"));
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v4);

}

- (void)setAutomatchFailedWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", &unk_1E5A5E520, CFSTR("MessageCommandKey"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("MessageParamKey"));
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v4);

}

- (void)setFailedWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", &unk_1E5A5E538, CFSTR("MessageCommandKey"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("MessageParamKey"));
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v4);

}

- (void)inviterCancelled
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("MessageCommandKey");
  v5[0] = &unk_1E5A5E550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v3);

}

- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v4 = a4;
  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MessageCommandKey");
  v10[1] = CFSTR("PlayerID");
  v11[0] = &unk_1E5A5E568;
  v11[1] = a3;
  v10[2] = CFSTR("MessageParamKey");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v9);
}

- (void)applicationWillEnterForeground
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("MessageCommandKey");
  v5[0] = &unk_1E5A5E580;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v3);

}

- (void)recipientPropertiesProvided:(id)a3 forPlayer:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MessageCommandKey");
  v10[1] = CFSTR("MessageParamKey");
  v11[0] = &unk_1E5A5E598;
  v11[1] = a3;
  v10[2] = CFSTR("PlayerInternal");
  v11[2] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v9);
}

- (void)messageFromExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  os_log_t *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

  v9 = (_QWORD *)MEMORY[0x1E0D25460];
  v10 = (os_log_t *)MEMORY[0x1E0D25470];
  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v11 = (id)GKOSLoggers();
    v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      -[GKMatchmakerHostViewController messageFromExtension:].cold.1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageParamKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*v9)
    v22 = (id)GKOSLoggers();
  v23 = *v10;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl(&dword_1AB361000, v23, OS_LOG_TYPE_INFO, "Got message from extension: %@", buf, 0xCu);
  }
  switch(v20)
  {
    case '5':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("request"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("pushToken"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "startMatchingWithRequest:devicePushToken:", v25, v26);

      goto LABEL_20;
    case '6':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activateGroupActivities");
      break;
    case '7':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endGroupActivities");
      break;
    case '8':
    case ':':
    case '=':
    case '>':
LABEL_22:
      v27.receiver = self;
      v27.super_class = (Class)GKMatchmakerHostViewController;
      -[GKExtensionRemoteViewController messageFromExtension:](&v27, sel_messageFromExtension_, v4);
      goto LABEL_30;
    case '9':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentSharePlaySharingController");
      break;
    case ';':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "disconnectFromMatch");
      break;
    case '<':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "recipientPropertiesNeededForPlayer:", v21);
      break;
    case '?':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("players"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "playerPickerDidPickPlayers:", v25);
LABEL_20:

      break;
    case '@':
      -[GKMatchmakerHostViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "playerPickerDidCancel");
      break;
    default:
      switch(v20)
      {
        case 19:
          -[GKMatchmakerHostViewController delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "finishWithError:", v21);
          goto LABEL_29;
        case 21:
          -[GKMatchmakerHostViewController delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setShareInvitees:", v21);
          goto LABEL_29;
        case 22:
          -[GKMatchmakerHostViewController delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "startMatchingWithRequest:devicePushToken:", v21, 0);
          goto LABEL_29;
        case 23:
          -[GKMatchmakerHostViewController delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "cancelPendingInviteToPlayer:", v21);
          goto LABEL_29;
        case 24:
          -[GKMatchmakerHostViewController delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sendData:", v21);
          goto LABEL_29;
        case 25:
          -[GKMatchmakerHostViewController delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "cancelMatching");
          goto LABEL_29;
        case 26:
          -[GKMatchmakerHostViewController delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setBrowsingForNearbyPlayers:", objc_msgSend(v21, "BOOLValue"));
          goto LABEL_29;
        default:
          goto LABEL_22;
      }
  }
LABEL_29:

LABEL_30:
}

- (void)shareMatchWithRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKMatchmakerHostViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shareMatchWithRequest:handler:", v7, v6);

}

- (void)extensionIsCanceling
{
  id v2;

  -[GKMatchmakerHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)extensionIsFinishing
{
  id v2;

  -[GKMatchmakerHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (GKMatchmakerViewController)delegate
{
  return (GKMatchmakerViewController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__GKMatchmakerHostViewController_matchmakerExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Error loading Game Center matchmaker extension, %@", a5, a6, a7, a8, 2u);
}

- (void)messageFromExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "error while decoding messageFromExtension archive in GKMatchmakerHostViewController:%@", a5, a6, a7, a8, 2u);
}

@end
