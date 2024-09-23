@implementation GKDaemonInterface

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EF4D3610);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAuthenticatedLocalPlayersWithStatus_handler_, 0, 1);

  +[GKServiceInterface interface](GKAccountServiceInterface, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_getServicesForPID_localPlayer_reply_, 0, 1);

  +[GKServiceInterface interface](GKProfileServiceInterface, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_getServicesForPID_localPlayer_reply_, 1, 1);

  +[GKServiceInterface interface](GKFriendServiceInterface, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_getServicesForPID_localPlayer_reply_, 2, 1);

  +[GKServiceInterface interface](GKGameServiceInterface, "interface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_getServicesForPID_localPlayer_reply_, 3, 1);

  +[GKServiceInterface interface](GKGameStatServiceInterface, "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v10, sel_getServicesForPID_localPlayer_reply_, 4, 1);

  +[GKServiceInterface interface](GKChallengeServiceInterface, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_getServicesForPID_localPlayer_reply_, 5, 1);

  +[GKServiceInterface interface](GKMultiplayerServiceInterface, "interface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_getServicesForPID_localPlayer_reply_, 6, 1);

  +[GKServiceInterface interface](GKTurnBasedServiceInterface, "interface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_getServicesForPID_localPlayer_reply_, 7, 1);

  +[GKServiceInterface interface](GKUtilityServiceInterface, "interface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_getServicesForPID_localPlayer_reply_, 8, 1);

  +[GKServiceInterface interface](GKBulletinServiceInterface, "interface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_getServicesForPID_localPlayer_reply_, 9, 1);

  +[GKServiceInterface interface](GKGameSessionServiceInterface, "interface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_getServicesForPID_localPlayer_reply_, 10, 1);

  +[GKServiceInterface interface](GKAccountServicePrivateInterface, "interface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_getPrivateServicesForPID_localPlayer_reply_, 1, 1);

  +[GKServiceInterface interface](GKProfileServicePrivateInterface, "interface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v18, sel_getPrivateServicesForPID_localPlayer_reply_, 2, 1);

  +[GKServiceInterface interface](GKFriendServicePrivateInterface, "interface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v19, sel_getPrivateServicesForPID_localPlayer_reply_, 3, 1);

  +[GKServiceInterface interface](GKGameServicePrivateInterface, "interface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v20, sel_getPrivateServicesForPID_localPlayer_reply_, 4, 1);

  +[GKServiceInterface interface](GKGameStatServicePrivateInterface, "interface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v21, sel_getPrivateServicesForPID_localPlayer_reply_, 5, 1);

  +[GKServiceInterface interface](GKChallengeServicePrivateInterface, "interface");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v22, sel_getPrivateServicesForPID_localPlayer_reply_, 6, 1);

  +[GKServiceInterface interface](GKMultiplayerServicePrivateInterface, "interface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v23, sel_getPrivateServicesForPID_localPlayer_reply_, 7, 1);

  +[GKServiceInterface interface](GKTurnBasedServicePrivateInterface, "interface");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_getPrivateServicesForPID_localPlayer_reply_, 8, 1);

  +[GKServiceInterface interface](GKUtilityServicePrivateInterface, "interface");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v25, sel_getPrivateServicesForPID_localPlayer_reply_, 9, 1);

  +[GKServiceInterface interface](GKBulletinServicePrivateInterface, "interface");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v26, sel_getPrivateServicesForPID_localPlayer_reply_, 10, 1);

  +[GKServiceInterface interface](GKGameSessionServicePrivateInterface, "interface");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v27, sel_getPrivateServicesForPID_localPlayer_reply_, 11, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_loadRemoteImageDataForURL_reply_, 0, 0);
  return v2;
}

@end
