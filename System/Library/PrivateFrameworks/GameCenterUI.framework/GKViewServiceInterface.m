@implementation GKViewServiceInterface

+ (void)setClassesForHostInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D253D0];
  v4 = a3;
  objc_msgSend(v3, "plistClasses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_messageFromExtension_, 0, 0);

}

+ (void)setClassesForExtensionInterface:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D253D0];
  v5 = a3;
  objc_msgSend(v4, "plistClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_messageFromClient_, 0, 0);
  objc_msgSend(a1, "_configureKVOTypes:", v5);

}

+ (id)extensionHostInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GKViewServiceInterface_extensionHostInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extensionHostInterface_onceToken != -1)
    dispatch_once(&extensionHostInterface_onceToken, block);
  return (id)extensionHostInterface_sHostInterface;
}

uint64_t __48__GKViewServiceInterface_extensionHostInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EEC7F698);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)extensionHostInterface_sHostInterface;
  extensionHostInterface_sHostInterface = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setClassesForHostInterface:", extensionHostInterface_sHostInterface);
}

+ (id)extensionInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GKViewServiceInterface_extensionInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extensionInterface_onceToken != -1)
    dispatch_once(&extensionInterface_onceToken, block);
  return (id)extensionInterface_sExtensionInterface;
}

uint64_t __44__GKViewServiceInterface_extensionInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EEC84720);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)extensionInterface_sExtensionInterface;
  extensionInterface_sExtensionInterface = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setClassesForExtensionInterface:", extensionInterface_sExtensionInterface);
}

+ (id)gameCenterHostViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__GKViewServiceInterface_gameCenterHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gameCenterHostViewControllerInterface_onceToken != -1)
    dispatch_once(&gameCenterHostViewControllerInterface_onceToken, block);
  return (id)gameCenterHostViewControllerInterface_sServiceInterface;
}

uint64_t __63__GKViewServiceInterface_gameCenterHostViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECA2520);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gameCenterHostViewControllerInterface_sServiceInterface;
  gameCenterHostViewControllerInterface_sServiceInterface = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setClassesForHostInterface:", gameCenterHostViewControllerInterface_sServiceInterface);
}

+ (id)gameCenterServiceViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GKViewServiceInterface_gameCenterServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gameCenterServiceViewControllerInterface_onceToken != -1)
    dispatch_once(&gameCenterServiceViewControllerInterface_onceToken, block);
  return (id)gameCenterServiceViewControllerInterface_sRemoteInterface;
}

uint64_t __66__GKViewServiceInterface_gameCenterServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECA2318);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gameCenterServiceViewControllerInterface_sRemoteInterface;
  gameCenterServiceViewControllerInterface_sRemoteInterface = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setClassesForExtensionInterface:", gameCenterServiceViewControllerInterface_sRemoteInterface);
}

+ (id)remoteSignInViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GKViewServiceInterface_remoteSignInViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (remoteSignInViewControllerInterface_onceToken != -1)
    dispatch_once(&remoteSignInViewControllerInterface_onceToken, block);
  return (id)remoteSignInViewControllerInterface_sServiceInterface;
}

uint64_t __61__GKViewServiceInterface_remoteSignInViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECA4090);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)remoteSignInViewControllerInterface_sServiceInterface;
  remoteSignInViewControllerInterface_sServiceInterface = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setClassesForHostInterface:", remoteSignInViewControllerInterface_sServiceInterface);
}

+ (id)signInServiceViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__GKViewServiceInterface_signInServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signInServiceViewControllerInterface_onceToken != -1)
    dispatch_once(&signInServiceViewControllerInterface_onceToken, block);
  return (id)signInServiceViewControllerInterface_sRemoteInterface;
}

uint64_t __62__GKViewServiceInterface_signInServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECD5840);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)signInServiceViewControllerInterface_sRemoteInterface;
  signInServiceViewControllerInterface_sRemoteInterface = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setClassesForExtensionInterface:", signInServiceViewControllerInterface_sRemoteInterface);
}

+ (id)remoteFriendRequestViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__GKViewServiceInterface_remoteFriendRequestViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (remoteFriendRequestViewControllerInterface_onceToken != -1)
    dispatch_once(&remoteFriendRequestViewControllerInterface_onceToken, block);
  return (id)remoteFriendRequestViewControllerInterface_sServiceInterface;
}

void __68__GKViewServiceInterface_remoteFriendRequestViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECD58A0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)remoteFriendRequestViewControllerInterface_sServiceInterface;
  remoteFriendRequestViewControllerInterface_sServiceInterface = v2;

  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)remoteFriendRequestViewControllerInterface_sServiceInterface;
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didRequestFriends_, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setClassesForHostInterface:", remoteFriendRequestViewControllerInterface_sServiceInterface);
}

+ (id)serviceFriendRequestViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__GKViewServiceInterface_serviceFriendRequestViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serviceFriendRequestViewControllerInterface_onceToken != -1)
    dispatch_once(&serviceFriendRequestViewControllerInterface_onceToken, block);
  return (id)serviceFriendRequestViewControllerInterface_sRemoteInterface;
}

void __69__GKViewServiceInterface_serviceFriendRequestViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECD5900);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)serviceFriendRequestViewControllerInterface_sRemoteInterface;
  serviceFriendRequestViewControllerInterface_sRemoteInterface = v2;

  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceFriendRequestViewControllerInterface_sRemoteInterface;
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_addRecipientPlayerInternals_, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setClassesForExtensionInterface:", serviceFriendRequestViewControllerInterface_sRemoteInterface);
}

+ (id)challengeIssueHostViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__GKViewServiceInterface_challengeIssueHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (challengeIssueHostViewControllerInterface_onceToken != -1)
    dispatch_once(&challengeIssueHostViewControllerInterface_onceToken, block);
  return (id)challengeIssueHostViewControllerInterface_sServiceInterface;
}

void __67__GKViewServiceInterface_challengeIssueHostViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EEC983B0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)challengeIssueHostViewControllerInterface_sServiceInterface;
  challengeIssueHostViewControllerInterface_sServiceInterface = v2;

  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)challengeIssueHostViewControllerInterface_sServiceInterface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_didFinishWithPlayerIDs_message_, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "setClassesForHostInterface:", challengeIssueHostViewControllerInterface_sServiceInterface);

}

+ (id)challengeIssueServiceViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__GKViewServiceInterface_challengeIssueServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (challengeIssueServiceViewControllerInterface_onceToken != -1)
    dispatch_once(&challengeIssueServiceViewControllerInterface_onceToken, block);
  return (id)challengeIssueServiceViewControllerInterface_sRemoteInterface;
}

void __70__GKViewServiceInterface_challengeIssueServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECD5960);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)challengeIssueServiceViewControllerInterface_sRemoteInterface;
  challengeIssueServiceViewControllerInterface_sRemoteInterface = v2;

  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)challengeIssueServiceViewControllerInterface_sRemoteInterface;
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromArray:", v6, v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setValue_forKeyPath_withReply_, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setClassesForExtensionInterface:", challengeIssueServiceViewControllerInterface_sRemoteInterface);
}

+ (id)matchmakerHostViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__GKViewServiceInterface_matchmakerHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (matchmakerHostViewControllerInterface_onceToken != -1)
    dispatch_once(&matchmakerHostViewControllerInterface_onceToken, block);
  return (id)matchmakerHostViewControllerInterface_sServiceInterface;
}

void __63__GKViewServiceInterface_matchmakerHostViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECA7028);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  matchmakerHostViewControllerInterface_sServiceInterface = v2;

  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  objc_msgSend(v4, "setByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_startMatchingWithRequest_, 0, 0);

  v7 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  objc_msgSend(v4, "setByAddingObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_cancelPendingInviteToPlayer_, 0, 0);

  v9 = (void *)matchmakerHostViewControllerInterface_sServiceInterface;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_setShareInvitees_, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setClassesForHostInterface:", matchmakerHostViewControllerInterface_sServiceInterface);
}

+ (id)matchmakerServiceViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GKViewServiceInterface_matchmakerServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (matchmakerServiceViewControllerInterface_onceToken != -1)
    dispatch_once(&matchmakerServiceViewControllerInterface_onceToken, block);
  return (id)matchmakerServiceViewControllerInterface_sRemoteInterface;
}

void __66__GKViewServiceInterface_matchmakerServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECA7118);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)matchmakerServiceViewControllerInterface_sRemoteInterface;
  matchmakerServiceViewControllerInterface_sRemoteInterface = v2;

  objc_msgSend(*(id *)(a1 + 32), "setClassesForExtensionInterface:", matchmakerServiceViewControllerInterface_sRemoteInterface);
  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)matchmakerServiceViewControllerInterface_sRemoteInterface;
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromArray:", v6, v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setValue_forKeyPath_withReply_, 0, 0);

}

+ (id)turnBasedHostViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__GKViewServiceInterface_turnBasedHostViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (turnBasedHostViewControllerInterface_onceToken != -1)
    dispatch_once(&turnBasedHostViewControllerInterface_onceToken, block);
  return (id)turnBasedHostViewControllerInterface_sServiceInterface;
}

void __62__GKViewServiceInterface_turnBasedHostViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECA2718);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)turnBasedHostViewControllerInterface_sServiceInterface;
  turnBasedHostViewControllerInterface_sServiceInterface = v2;

  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)turnBasedHostViewControllerInterface_sServiceInterface;
  objc_msgSend(v8, "setByAddingObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_finishWithMatch_, 0, 0);

  v6 = (void *)turnBasedHostViewControllerInterface_sServiceInterface;
  objc_msgSend(v8, "setByAddingObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_playerQuitMatch_, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setClassesForHostInterface:", turnBasedHostViewControllerInterface_sServiceInterface);
}

+ (id)turnBasedServiceViewControllerInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__GKViewServiceInterface_turnBasedServiceViewControllerInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (turnBasedServiceViewControllerInterface_onceToken != -1)
    dispatch_once(&turnBasedServiceViewControllerInterface_onceToken, block);
  return (id)turnBasedServiceViewControllerInterface_sRemoteInterface;
}

void __65__GKViewServiceInterface_turnBasedServiceViewControllerInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "interfaceWithProtocol:", &unk_1EECA27C8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)turnBasedServiceViewControllerInterface_sRemoteInterface;
  turnBasedServiceViewControllerInterface_sRemoteInterface = v2;

  objc_msgSend(*(id *)(a1 + 32), "setClassesForExtensionInterface:", turnBasedServiceViewControllerInterface_sRemoteInterface);
  objc_msgSend(MEMORY[0x1E0D253D0], "plistClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)turnBasedServiceViewControllerInterface_sRemoteInterface;
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_setValue_forKeyPath_withReply_, 0, 0);

}

+ (void)_configureKVOTypes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D253D0];
  v4 = a3;
  objc_msgSend(v3, "plistClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromArray:", v6, v8, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setValue_forKeyPath_withReply_, 0, 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setInitialState_withReply_, 0, 0);

}

@end
