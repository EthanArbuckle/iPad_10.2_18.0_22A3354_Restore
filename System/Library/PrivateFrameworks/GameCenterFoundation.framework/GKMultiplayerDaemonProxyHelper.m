@implementation GKMultiplayerDaemonProxyHelper

- (id)multiplayerService
{
  void *v2;
  void *v3;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "multiplayerService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)utilityService
{
  void *v2;
  void *v3;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "utilityService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:", v10, v9, v8);

}

- (void)getMultiPlayerGroups:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getMultiPlayerGroups:", v4);

}

- (void)initiateRelayRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initiateRelayRequest:handler:", v7, v6);

}

- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "putMultiPlayerGroup:participants:playedAt:bundleID:numberOfAutomatched:handler:", v17, v16, a5, v15, a7, v14);

}

- (void)removeInviteSession
{
  id v2;

  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeInviteSession");

}

- (void)revokePseudonym:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "revokePseudonym:withCompletionHandler:", v7, v6);

}

- (void)sendInvitationUpdate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendInvitationUpdate:handler:", v7, v6);

}

- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendReconnectInvitation:toPlayer:connectionData:sessionToken:pushToken:handler:", v19, v18, v17, v16, v15, v14);

}

- (void)updateRelayRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKMultiplayerDaemonProxyHelper multiplayerService](self, "multiplayerService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateRelayRequest:handler:", v7, v6);

}

- (void)completeGameRecording
{
  id v2;

  -[GKMultiplayerDaemonProxyHelper utilityService](self, "utilityService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeGameRecording");

}

- (void)completeMatchRecording:(id)a3 matchType:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKMultiplayerDaemonProxyHelper utilityService](self, "utilityService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeMatchRecording:matchType:", v7, v6);

}

- (void)emitMultiplayerMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKMultiplayerDaemonProxyHelper utilityService](self, "utilityService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitMultiplayerMessage:", v4);

}

@end
