@implementation MRNotificationServiceClient

- (void)_handleActivePlayerDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = 0;
  else
    v7 = CFSTR("kMRMediaRemoteActivePlayerDidChange");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v10, v7, CFSTR("kMRMediaRemoteOriginNowPlayingPlayerDidChange"), CFSTR("kMRMediaRemoteNowPlayingPlayerDidChange"));
  objc_msgSend(v10, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNotificationServiceClient _postDefaultPlayerNotificationsWithUserInfo:object:](self, "_postDefaultPlayerNotificationsWithUserInfo:object:", v8, v9);

  -[MRNotificationServiceClient _processActivePlayerInvalidationHandlersForNotification:](self, "_processActivePlayerInvalidationHandlersForNotification:", v10);
}

- (void)_processApplicationInvalidationHandlersForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MRMediaRemoteServiceClient *serviceClient;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetOriginFromUserInfo(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetClientFromUserInfo(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("kMRActiveNowPlayingPlayerPathUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  serviceClient = self->_serviceClient;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__MRNotificationServiceClient__processApplicationInvalidationHandlersForNotification___block_invoke;
  v15[3] = &unk_1E30CB678;
  v16 = v10;
  v17 = v6;
  v18 = v8;
  v12 = v8;
  v13 = v6;
  v14 = v10;
  -[MRMediaRemoteServiceClient processPlayerPathInvalidationHandlersWithBlock:](serviceClient, "processPlayerPathInvalidationHandlersWithBlock:", v15);

}

- (void)_handlePlayerDidRegisterNotification:(id)a3
{
  MRMediaRemoteServiceClient *serviceClient;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  serviceClient = self->_serviceClient;
  v8 = a3;
  -[MRMediaRemoteServiceClient notificationClient](serviceClient, "notificationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteNowPlayingPlayerDidRegister"), v6, v7);

  -[MRNotificationServiceClient _processPlayerInvalidationHandlersForNotification:](self, "_processPlayerInvalidationHandlersForNotification:", v8);
}

- (void)_processPlayerInvalidationHandlersForNotification:(id)a3
{
  id v4;
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
  MRMediaRemoteServiceClient *serviceClient;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetOriginFromUserInfo(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetClientFromUserInfo(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerFromUserInfo(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("kMRActiveNowPlayingPlayerPathUserInfoKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("kMROriginActiveNowPlayingPlayerPathUserInfoKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  serviceClient = self->_serviceClient;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__MRNotificationServiceClient__processPlayerInvalidationHandlersForNotification___block_invoke;
  v21[3] = &unk_1E30CB6A0;
  v22 = v12;
  v23 = v6;
  v24 = v14;
  v25 = v8;
  v26 = v10;
  v16 = v10;
  v17 = v8;
  v18 = v14;
  v19 = v6;
  v20 = v12;
  -[MRMediaRemoteServiceClient processPlayerPathInvalidationHandlersWithBlock:](serviceClient, "processPlayerPathInvalidationHandlersWithBlock:", v21);

}

- (void)_processActivePlayerInvalidationHandlersForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MRMediaRemoteServiceClient *serviceClient;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MRGetOriginFromUserInfo(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MRGetClientFromUserInfo(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("kMRActiveNowPlayingPlayerPathUserInfoKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("kMROriginActiveNowPlayingPlayerPathUserInfoKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    serviceClient = self->_serviceClient;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __87__MRNotificationServiceClient__processActivePlayerInvalidationHandlersForNotification___block_invoke;
    v21[3] = &unk_1E30CB650;
    v22 = v13;
    v23 = v9;
    v24 = v15;
    v25 = v11;
    v17 = v11;
    v18 = v15;
    v19 = v9;
    v20 = v13;
    -[MRMediaRemoteServiceClient processPlayerPathInvalidationHandlersWithBlock:](serviceClient, "processPlayerPathInvalidationHandlersWithBlock:", v21);

  }
}

- (void)_handlePlayerStateDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v5, v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "existingPlayerClientRequestsForPlayerPath:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlayerProperties:", v14);

  if ((_DWORD)v5)
    v15 = 0;
  else
    v15 = CFSTR("kMRMediaRemotePlayerStateDidChange");
  if (v11)
    v16 = 0;
  else
    v16 = CFSTR("kMRMediaRemoteOriginNowPlayingPlayerStateDidChange");
  if (v11)
    v17 = 0;
  else
    v17 = CFSTR("kMRMediaRemoteNowPlayingPlayerStateDidChange");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v4, v15, v16, v17);

}

- (void)_handlePlayerPlaybackQueueDidChangeNotification:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isLocal") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v23, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "BOOLValue");

  }
  objc_msgSend(v23, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "existingPlayerClientRequestsForPlayerPath:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "subscriptionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

    objc_msgSend(v23, "mr_playbackQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlaybackQueue:", v16);

  }
  if (v7)
    v17 = 0;
  else
    v17 = CFSTR("kMRPlayerPlaybackQueueChangedNotification");
  if (v12)
    v18 = 0;
  else
    v18 = CFSTR("kMROriginNowPlayingPlaybackQueueChangedNotification");
  if (v12)
    v19 = 0;
  else
    v19 = CFSTR("kMRNowPlayingPlaybackQueueChangedNotification");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v23, v17, v18, v19);
  -[MRNotificationServiceClient _maybePostPlaybackQueueNowPlayingItemChangedNotificationFromPlaybackQueueChangedNotification:](self, "_maybePostPlaybackQueueNowPlayingItemChangedNotificationFromPlaybackQueueChangedNotification:", v23);
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "object");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification"), v21, v22);

}

- (void)_handlePlayerSupportedCommandsDidChangeNotification:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isLocal") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v20, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "BOOLValue");

  }
  objc_msgSend(v20, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "existingPlayerClientRequestsForPlayerPath:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v20, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kMRSupportedCommandsUserInfoKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSupportedCommands:", v16);

  }
  if (v7)
    v17 = 0;
  else
    v17 = CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification");
  if (v12)
    v18 = 0;
  else
    v18 = CFSTR("kMRMediaRemoteOriginSupportedCommandsDidChangeNotification");
  if (v12)
    v19 = 0;
  else
    v19 = CFSTR("kMRMediaRemoteSupportedCommandsDidChangeNotification");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v20, v17, v18, v19);

}

- (void)_handlePlayerPlaybackStateDidChangeNotification:(id)a3
{
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v22, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v22, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePlaybackStateUserInfoKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNotificationServiceClient.m"), 599, CFSTR("playbackState UserInfoKey not present in notification %@"), v22);

  }
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "existingPlayerClientRequestsForPlayerPath:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPlaybackState:", objc_msgSend(v15, "intValue"));
  if (v10)
    v18 = 0;
  else
    v18 = CFSTR("_kMRMediaRemotePlayerPlaybackStateDidChangeNotification");
  if (v13)
    v19 = 0;
  else
    v19 = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationPlaybackStateDidChangeNotification");
  if (v13)
    v20 = 0;
  else
    v20 = CFSTR("kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v22, v18, v19, v20);

}

- (void)_maybePostPlaybackQueueNowPlayingItemChangedNotificationFromPlaybackQueueChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRPlayerPlaybackQueueNowPlayingItemDidChangeUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(v16, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v16, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v9)
      v13 = 0;
    else
      v13 = CFSTR("MRPlayerPlaybackQueueNowPlayingItemChangedNotification");
    if (v12)
      v14 = 0;
    else
      v14 = CFSTR("MROriginNowPlayingPlaybackQueueNowPlayingItemChangedNotification");
    if (v12)
      v15 = 0;
    else
      v15 = CFSTR("MRNowPlayingPlaybackQueueNowPlayingItemChangedNotification");
    -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v16, v13, v14, v15);
  }

}

- (void)_postDefaultPlayerNotificationsWithUserInfo:(id)a3 object:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = (id)objc_msgSend(a3, "mutableCopy");
  v7 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("_MRPlayerPlaybackQueueNowPlayingItemDidChangeUserInfoKey"));
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerPlaybackStateDidChangeNotification"), v13, v6);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerIsPlayingDidChangeNotification"), v13, v6);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotification:userInfo:object:", CFSTR("_kMRNowPlayingPlaybackQueueChangedNotification"), v13, v6);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerSupportedCommandsDidChangeNotification"), v13, v6);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerStateDidChange"), v13, v6);

}

- (void)_notificationFired:(id)a3 playerPathNotifcation:(id)a4 originNotification:(id)a5 nowPlayingNotification:(id)a6
{
  id v10;
  id v11;
  id v12;
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
  int v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v25 = a6;
  v12 = a4;
  objc_msgSend(v10, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("kMRActiveNowPlayingPlayerPathUserInfoKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("kMROriginActiveNowPlayingPlayerPathUserInfoKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "object");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotification:userInfo:object:", v12, v13, v18);

  if ((objc_msgSend(v14, "isEqual:", v16) & 1) != 0
    || -[MRNotificationServiceClient _shouldPostNotifications](self, "_shouldPostNotifications"))
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "object");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotification:userInfo:object:", v11, v13, v20);

  }
  if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0
    || -[MRNotificationServiceClient _shouldPostNotifications](self, "_shouldPostNotifications"))
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "object");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "postNotification:userInfo:object:", v25, v13, v22);

    if (v23)
    {
      if (MRProcessIsMediaRemoteDaemon())
      {
        _MRLogForCategory(0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v27 = v25;
          v28 = 2114;
          v29 = v14;
          _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "Posted Active Now Playing Notification %{public}@ for path %{public}@", buf, 0x16u);
        }

      }
    }
  }

}

- (BOOL)_processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport
{
  if (_processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_onceToken != -1)
    dispatch_once(&_processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_onceToken, &__block_literal_global_7_3);
  return _processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_allowed;
}

- (void)_handlePlayerNowPlayingInfoDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = 0;
  else
    v7 = CFSTR("kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v8, v7, CFSTR("kMRMediaRemoteOriginNowPlayingInfoDidChangeNotification"), CFSTR("kMRMediaRemoteNowPlayingInfoDidChangeNotification"));

}

- (void)_handleApplicationDidRegisterNotification:(id)a3
{
  MRMediaRemoteServiceClient *serviceClient;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  serviceClient = self->_serviceClient;
  v8 = a3;
  -[MRMediaRemoteServiceClient notificationClient](serviceClient, "notificationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteNowPlayingApplicationDidRegister"), v6, v7);

  -[MRNotificationServiceClient _processApplicationInvalidationHandlersForNotification:](self, "_processApplicationInvalidationHandlersForNotification:", v8);
}

void __106__MRNotificationServiceClient__processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E3143C08);
  v3 = objc_msgSend(v2, "containsObject:", v1);
  _processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_allowed = v3;
  if (v3)
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Allowing Process for non-playerPath based notifications", v5, 2u);
    }

  }
}

- (MRNotificationServiceClient)initWithServiceClient:(id)a3
{
  id v5;
  MRNotificationServiceClient *v6;
  MRNotificationServiceClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNotificationServiceClient;
  v6 = -[MRNotificationServiceClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    -[MRNotificationServiceClient registerCallbacks](v7, "registerCallbacks");
  }

  return v7;
}

- (void)registerCallbacks
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleActiveOriginDidChangeNotification_, CFSTR("_MRMediaRemoteActiveOriginDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleOriginDidRegisterNotification_, CFSTR("_MRMediaRemoteOriginDidRegisterNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleOriginDidUnregisterNotification_, CFSTR("_MRMediaRemoteOriginDidUnregisterNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeControlCapabilitiesDidChangeNotification_, CFSTR("_MPMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleVolumeDidChangeNotification_, CFSTR("_MPMediaRemotePickedRouteVolumeDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDeviceInfoDidChangeNotification_, CFSTR("_MRDeviceInfoDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleActiveApplicationDidChangeNotification_, CFSTR("_MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDidRegisterNotification_, CFSTR("_MRMediaRemoteNowPlayingApplicationDidRegister"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDidUnregisterNotification_, CFSTR("_MRMediaRemoteNowPlayingApplicationDidUnregister"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationClientStateDidChangeNotification_, CFSTR("_MRMediaRemoteApplicationClientStateDidChange"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDisplayNameDidChangeNotification_, CFSTR("_MRMediaRemoteApplicationDisplayNameDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDidForegroundNotification_, CFSTR("_MRMediaRemoteApplicationDidForegroundNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleActivePlayerDidChangeNotification_, CFSTR("_MRMediaRemoteActivePlayerDidChange"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerDidRegisterNotification_, CFSTR("_MRMediaRemoteNowPlayingPlayerDidRegister"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerDidUnregisterNotification_, CFSTR("_MRMediaRemoteNowPlayingPlayerDidUnregister"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerPlaybackQueueDidChangeNotification_, CFSTR("_kMRNowPlayingPlaybackQueueChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerContentItemsDidChangeNotification_, CFSTR("_MRPlayerPlaybackQueueContentItemsChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerContentItemArtworkDidChangeNotification_, CFSTR("_MRPlayerPlaybackQueueContentItemArtworkChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerSupportedCommandsDidChangeNotification_, CFSTR("_MRMediaRemotePlayerSupportedCommandsDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerNowPlayingInfoDidChangeNotification_, CFSTR("_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerPlaybackStateDidChangeNotification_, CFSTR("_MRMediaRemotePlayerPlaybackStateDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerIsPlayingDidChangeNotification_, CFSTR("_MRMediaRemotePlayerIsPlayingDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlayerStateDidChangeNotification_, CFSTR("_MRMediaRemotePlayerStateDidChange"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleActiveSystemEndpointDidChangeNotification_, CFSTR("_kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleActiveGroupSessionInfoDidChangeNotification_, CFSTR("_MRGroupSessionInfoDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLocalUserIdentityDidChangeNotification_, CFSTR("_MRUserIdentityDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLocalGroupSessionEligibilityDidChangeNotification_, CFSTR("_MRGroupSessionEligibilityDidChangeNotification"), 0);

}

- (void)_handlePlayerIsPlayingDidChangeNotification:(id)a3
{
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v26, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v26, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNotificationServiceClient.m"), 619, CFSTR("IsPlaying UserInfoKey not present in notification %@"), v26);

  }
  objc_msgSend(v26, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteOriginLastPlayingTimestampUserInfoKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "existingOriginClientRequestsForPlayerPath:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v17, "doubleValue");
    v21 = (void *)objc_msgSend(v20, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v19, "setLastPlayingDate:", v21);

  }
  if (v10)
    v22 = 0;
  else
    v22 = CFSTR("kMRMediaRemotePlayerIsPlayingDidChangeNotification");
  if (v13)
    v23 = 0;
  else
    v23 = CFSTR("kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification");
  if (v13)
    v24 = 0;
  else
    v24 = CFSTR("kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v26, v22, v23, v24);

}

uint64_t __81__MRNotificationServiceClient__processPlayerInvalidationHandlersForNotification___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1[4], "origin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(a1[5], "isEqual:", v4))
  {
    objc_msgSend(v3, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1[6], "client");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingOriginClientRequestsForPlayerPath:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "deviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvePlaceholdersForDeviceInfo:", v8);

    if (objc_msgSend(a1[7], "isEqual:", v5))
    {
      objc_msgSend(v3, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(a1[8], "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __87__MRNotificationServiceClient__processActivePlayerInvalidationHandlersForNotification___block_invoke(id *a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if ((objc_msgSend(v3, "isResolved") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "origin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1[4], "origin");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(a1[5], "isEqual:", v5))
    {
      objc_msgSend(v3, "client");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(a1[6], "client");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "existingOriginClientRequestsForPlayerPath:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "deviceInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resolvePlaceholdersForDeviceInfo:", v9);

      if (objc_msgSend(a1[7], "isEqual:", v6))
      {
        objc_msgSend(v3, "player");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v10 == 0;

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

uint64_t __86__MRNotificationServiceClient__processApplicationInvalidationHandlersForNotification___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1[4], "origin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(a1[5], "isEqual:", v4))
    goto LABEL_6;
  objc_msgSend(v3, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingOriginClientRequestsForPlayerPath:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvePlaceholdersForDeviceInfo:", v8);

  v9 = objc_msgSend(a1[6], "isEqual:", v5);
  if ((v9 & 1) != 0)
    v10 = 1;
  else
LABEL_6:
    v10 = 0;

  return v10;
}

- (void)_handlePlayerContentItemsDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  CFTypeRef RequestIdentifier;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingPlayerClientRequestsForPlayerPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateContentItems:", v11);
  v26 = v7;
  if (objc_msgSend(v7, "isLocal"))
    v12 = 0;
  else
    v12 = CFSTR("kMRPlayerPlaybackQueueContentItemsChangedNotification");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v4, v12, CFSTR("kMROriginPlaybackQueueContentItemsChangedNotification"), CFSTR("kMRPlaybackQueueContentItemsChangedNotification"), self);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        RequestIdentifier = MRContentItemGetRequestIdentifier(v19);
        objc_msgSend(v9, "subscriptionController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(RequestIdentifier) = objc_msgSend(v21, "hasRequest:", RequestIdentifier);

        if ((RequestIdentifier & 1) == 0)
          objc_msgSend(v13, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(*(id *)(v25 + 8), "notificationClient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification"), v23, v24);

  }
}

- (void)_handleActiveGroupSessionInfoDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MRActiveGroupSessionInfoUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateGroupSessionInfo:", v6);

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "postNotification:userInfo:object:", CFSTR("MRActiveGroupSessionInfoDidChangeNotification"), v9, v11);
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("kMRMediaRemoteActiveEndpointTypeUserInfoKey");
  v15[0] = &unk_1E3143708;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), v13, 0);

}

- (void)_handleLocalGroupSessionEligibilityDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MRGroupSessionEligibilityStatusUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "updateGroupSessionEligibility:", v5);

  if (v7)
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotification:userInfo:object:", CFSTR("MRGroupSessionEligibilityDidChangeNotification"), v9, 0);

  }
}

- (void)_processActiveOriginInvalidationHandlersForNotification:(id)a3
{
  -[MRMediaRemoteServiceClient processPlayerPathInvalidationHandlersWithBlock:](self->_serviceClient, "processPlayerPathInvalidationHandlersWithBlock:", &__block_literal_global_62);
}

BOOL __87__MRNotificationServiceClient__processActiveOriginInvalidationHandlersForNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "origin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)_processActiveApplicationInvalidationHandlersForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MRMediaRemoteServiceClient *serviceClient;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MRGetOriginFromUserInfo(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("kMRActiveNowPlayingPlayerPathUserInfoKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    serviceClient = self->_serviceClient;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__MRNotificationServiceClient__processActiveApplicationInvalidationHandlersForNotification___block_invoke;
    v15[3] = &unk_1E30CB628;
    v16 = v11;
    v17 = v9;
    v13 = v9;
    v14 = v11;
    -[MRMediaRemoteServiceClient processPlayerPathInvalidationHandlersWithBlock:](serviceClient, "processPlayerPathInvalidationHandlersWithBlock:", v15);

  }
}

BOOL __92__MRNotificationServiceClient__processActiveApplicationInvalidationHandlersForNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if ((objc_msgSend(v3, "isResolved") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "origin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "origin");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v5))
    {
      objc_msgSend(v3, "client");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v3, "client");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v4 = 0;
        }
        else
        {
          objc_msgSend(v3, "client");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v9, "processIdentifier") == 0;

        }
      }
      else
      {
        v4 = 1;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)_processOriginInvalidationHandlersForNotification:(id)a3
{
  void *v4;
  void *v5;
  MRMediaRemoteServiceClient *serviceClient;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetOriginFromUserInfo(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  serviceClient = self->_serviceClient;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__MRNotificationServiceClient__processOriginInvalidationHandlersForNotification___block_invoke;
  v8[3] = &unk_1E30CAF58;
  v9 = v5;
  v7 = v5;
  -[MRMediaRemoteServiceClient processPlayerPathInvalidationHandlersWithBlock:](serviceClient, "processPlayerPathInvalidationHandlersWithBlock:", v8);

}

uint64_t __81__MRNotificationServiceClient__processOriginInvalidationHandlersForNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)_postDefaultAppilicationNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotification:userInfo:object:", CFSTR("_MRMediaRemoteApplicationClientStateDidChange"), v10, v7);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotification:userInfo:object:", CFSTR("_MRMediaRemoteActivePlayerDidChange"), v10, v9);
}

- (void)_postDefaultOriginNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotification:userInfo:object:", CFSTR("_MRDeviceInfoDidChangeNotification"), v10, v7);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotification:userInfo:object:", CFSTR("_MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification"), v10, v9);
}

- (void)_notificationFired:(id)a3 clientNotification:(id)a4 originNotification:(id)a5 nowPlayingNotification:(id)a6
{
  id v10;
  id v11;
  id v12;
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
  int v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v28 = a5;
  v11 = a6;
  v12 = a4;
  objc_msgSend(v10, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_msgSend(v15, "setPlayer:", 0);
  objc_msgSend(v13, "objectForKey:", CFSTR("kMRActiveNowPlayingPlayerPathUserInfoKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(v17, "setPlayer:", 0);
  objc_msgSend(v13, "objectForKey:", CFSTR("kMROriginActiveNowPlayingPlayerPathUserInfoKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  objc_msgSend(v19, "setPlayer:", 0);
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "object");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotification:userInfo:object:", v12, v13, v21);

  if ((objc_msgSend(v15, "isEqual:", v19) & 1) != 0
    || -[MRNotificationServiceClient _shouldPostNotifications](self, "_shouldPostNotifications"))
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "object");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotification:userInfo:object:", v28, v13, v23);

  }
  if ((objc_msgSend(v15, "isEqual:", v17) & 1) != 0
    || -[MRNotificationServiceClient _shouldPostNotifications](self, "_shouldPostNotifications"))
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "object");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "postNotification:userInfo:object:", v11, v13, v25);

    if (v26)
    {
      if (MRProcessIsMediaRemoteDaemon())
      {
        _MRLogForCategory(0);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v11;
          v31 = 2114;
          v32 = v15;
          _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "Posted Active Now Playing Notification %{public}@ for path %{public}@", buf, 0x16u);
        }

      }
    }
  }

}

- (void)_notificationFired:(id)a3 originNotification:(id)a4 nowPlayingNotification:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("kMRActiveNowPlayingPlayerPathUserInfoKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "object");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotification:userInfo:object:", v10, v11, v15);

  objc_msgSend(v12, "origin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "origin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqual:", v17) & 1) != 0
    || -[MRNotificationServiceClient _shouldPostNotifications](self, "_shouldPostNotifications"))
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "object");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "postNotification:userInfo:object:", v9, v11, v19);

    if (v20)
    {
      if (MRProcessIsMediaRemoteDaemon())
      {
        _MRLogForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 138543618;
          v23 = v9;
          v24 = 2114;
          v25 = v12;
          _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Posted Active Now Playing Notification %{public}@ for path %{public}@", (uint8_t *)&v22, 0x16u);
        }

      }
    }
  }

}

- (void)_handleActiveOriginDidChangeNotification:(id)a3
{
  MRMediaRemoteServiceClient *serviceClient;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  serviceClient = self->_serviceClient;
  v8 = a3;
  -[MRMediaRemoteServiceClient notificationClient](serviceClient, "notificationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteActiveOriginDidChangeNotification"), v6, v7);

  -[MRNotificationServiceClient _postDefaultOriginNotifications:](self, "_postDefaultOriginNotifications:", v8);
  -[MRNotificationServiceClient _processActiveOriginInvalidationHandlersForNotification:](self, "_processActiveOriginInvalidationHandlersForNotification:", v8);

}

- (void)_handleOriginDidRegisterNotification:(id)a3
{
  MRMediaRemoteServiceClient *serviceClient;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  serviceClient = self->_serviceClient;
  v11 = a3;
  -[MRMediaRemoteServiceClient notificationClient](serviceClient, "notificationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteOriginDidRegisterNotification"), v6, v7);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteAvailableOriginsDidChangeNotification"), v9, v10);

  -[MRNotificationServiceClient _processOriginInvalidationHandlersForNotification:](self, "_processOriginInvalidationHandlersForNotification:", v11);
}

- (void)_handleOriginDidUnregisterNotification:(id)a3
{
  MRMediaRemoteServiceClient *serviceClient;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  serviceClient = self->_serviceClient;
  v5 = a3;
  -[MRMediaRemoteServiceClient notificationClient](serviceClient, "notificationClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteOriginDidUnregisterNotification"), v7, v8);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteAvailableOriginsDidChangeNotification"), v10, v11);

  -[MRNotificationServiceClient _processOriginInvalidationHandlersForNotification:](self, "_processOriginInvalidationHandlersForNotification:", v5);
  objc_msgSend(v5, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  MRGetOriginFromUserInfo(v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeOriginRequests:", v14);

}

- (void)_handleActiveApplicationDidChangeNotification:(id)a3
{
  id v4;

  v4 = a3;
  -[MRNotificationServiceClient _notificationFired:originNotification:nowPlayingNotification:](self, "_notificationFired:originNotification:nowPlayingNotification:", v4, CFSTR("kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification"), CFSTR("kMRMediaRemoteNowPlayingApplicationDidChangeNotification"));
  -[MRNotificationServiceClient _postDefaultAppilicationNotifications:](self, "_postDefaultAppilicationNotifications:", v4);
  -[MRNotificationServiceClient _processActiveApplicationInvalidationHandlersForNotification:](self, "_processActiveApplicationInvalidationHandlersForNotification:", v4);

}

- (void)_handleApplicationDidUnregisterNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  MRPlayerPath *v20;
  void *v21;
  MRClient *v22;
  void *v23;
  void *v24;
  MRClient *v25;
  MRPlayerPath *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteNowPlayingApplicationDidUnregister"), v5, v6);

  -[MRNotificationServiceClient _processApplicationInvalidationHandlersForNotification:](self, "_processApplicationInvalidationHandlersForNotification:", v30);
  objc_msgSend(v30, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingOriginClientRequestsForPlayerPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeClient:", v9);
  objc_msgSend(v30, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteApplicationHasSupportedCommandsUserInfoKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    objc_msgSend(v30, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    MRGetPlayerPathFromUserInfo(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    v20 = [MRPlayerPath alloc];
    objc_msgSend(v19, "origin");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [MRClient alloc];
    objc_msgSend(v19, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MRClient initWithBundleIdentifier:](v22, "initWithBundleIdentifier:", v24);
    v26 = -[MRPlayerPath initWithOrigin:client:player:](v20, "initWithOrigin:client:player:", v21, v25, 0);
    MRAddPlayerPathToUserInfo(v16, v26);

    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    MRCreateDecodedUserInfo(v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "object");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerSupportedCommandsDidChangeNotification"), v28, v29);

  }
}

- (void)_handleApplicationClientStateDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v5, v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingClientRequestsForPlayerPath:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientProperties:", v12);

  if (v9)
    v13 = 0;
  else
    v13 = CFSTR("kMRMediaRemoteApplicationClientStateDidChange");
  -[MRNotificationServiceClient _notificationFired:clientNotification:originNotification:nowPlayingNotification:](self, "_notificationFired:clientNotification:originNotification:nowPlayingNotification:", v4, v13, CFSTR("kMRMediaRemoteOriginNowPlayingApplicationClientStateDidChange"), CFSTR("kMRMediaRemoteNowPlayingApplicationClientStateDidChange"));
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "postNotification:userInfo:object:", CFSTR("_MRMediaRemoteApplicationDisplayNameDidChangeNotification"), v15, v16);
}

- (void)_handleApplicationDisplayNameDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = 0;
  else
    v7 = CFSTR("kMRMediaRemoteApplicationDisplayNameDidChangeNotification");
  -[MRNotificationServiceClient _notificationFired:clientNotification:originNotification:nowPlayingNotification:](self, "_notificationFired:clientNotification:originNotification:nowPlayingNotification:", v8, v7, CFSTR("kMRMediaRemoteOriginNowPlayingApplicationDisplayNameDidChangeNotification"), CFSTR("kMRMediaRemoteNowPlayingApplicationDisplayNameDidChangeNotification"));

}

- (void)_handleApplicationDidForegroundNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = 0;
  else
    v7 = CFSTR("kMRMediaRemoteApplicationDidForeground");
  -[MRNotificationServiceClient _notificationFired:clientNotification:originNotification:nowPlayingNotification:](self, "_notificationFired:clientNotification:originNotification:nowPlayingNotification:", v8, v7, CFSTR("kMRMediaRemoteOriginNowPlayingApplicationDidForegroundNotification"), CFSTR("kMRMediaRemoteNowPlayingApplicationDidForegroundNotification"));

}

- (void)_handlePlayerDidUnregisterNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString **v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePlaybackStateUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v25, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E31436F0, CFSTR("kMRMediaRemotePlaybackStateUserInfoKey"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"));
  if (MRMediaRemotePlaybackStateIsAdvancing(v6))
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MRCreateDecodedUserInfo(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerPlaybackStateDidChangeNotification"), v10, v11);

    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _MRMediaRemotePlayerIsPlayingDidChangeNotification;
LABEL_5:
    v14 = *v13;
    MRCreateDecodedUserInfo(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "object");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotification:userInfo:object:", v14, v15, v16);

    goto LABEL_6;
  }
  if (v6)
  {
    -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _MRMediaRemotePlayerPlaybackStateDidChangeNotification;
    goto LABEL_5;
  }
LABEL_6:
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "object");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteNowPlayingPlayerDidUnregister"), v18, v19);

  -[MRNotificationServiceClient _processPlayerInvalidationHandlersForNotification:](self, "_processPlayerInvalidationHandlersForNotification:", v25);
  objc_msgSend(v25, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "existingClientRequestsForPlayerPath:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "removePlayer:", v22);
}

- (void)_handlePlayerContentItemArtworkDidChangeNotification:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingPlayerClientRequestsForPlayerPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v16, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MRGetContentItemsFromUserInfo(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "updateContentItemArtwork:", v11);
  }
  if (objc_msgSend(v6, "isLocal"))
    v12 = 0;
  else
    v12 = CFSTR("kMRPlayerPlaybackQueueContentItemArtworkChangedNotification");
  -[MRNotificationServiceClient _notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:](self, "_notificationFired:playerPathNotifcation:originNotification:nowPlayingNotification:", v16, v12, CFSTR("kMROriginPlaybackQueueContentItemArtworkChangedNotification"), CFSTR("kMRPlaybackQueueContentItemArtworkChangedNotification"));
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "object");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotification:userInfo:object:", CFSTR("_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification"), v14, v15);

}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0 && (MRProcessIsMediaRemoteDaemon() & 1) == 0)
  {
    objc_msgSend(v16, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MRGetPlayerPathFromUserInfo(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "existingOriginClientRequestsForPlayerPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MRGetDeviceInfoFromUserInfo(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceInfo:", v14);

  }
  if (v6)
    v15 = 0;
  else
    v15 = CFSTR("kMRDeviceInfoDidChangeNotification");
  -[MRNotificationServiceClient _notificationFired:originNotification:nowPlayingNotification:](self, "_notificationFired:originNotification:nowPlayingNotification:", v16, v15, CFSTR("kMRActiveDeviceInfoDidChangeNotification"));

}

- (void)_handleVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v5, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingOriginClientRequestsForPlayerPath:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePickedRouteVolumeControlCapabilitiesUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVolumeCapabilities:", v10);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "postNotification:userInfo:object:", CFSTR("kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification"), v12, v13);
}

- (void)_handleVolumeDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetPlayerPathFromUserInfo(v5, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingOriginClientRequestsForPlayerPath:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePickedRouteVolumeUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVolume:", v10);

  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "postNotification:userInfo:object:", CFSTR("kMRMediaRemotePickedRouteVolumeDidChangeNotification"), v12, v13);
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *active;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteActiveEndpointTypeUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "intValue");

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateActiveSystemEndpointOutputDeviceUID:forType:", v6, v9);

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_MRMediaRemoteIsRestoringClientStateUserInfoKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    _MRLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(v9);
      v19 = 138412546;
      v20 = active;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Restoring %@SystemEndpoint with UID=%@", (uint8_t *)&v19, 0x16u);

    }
  }
  -[MRMediaRemoteServiceClient notificationClient](self->_serviceClient, "notificationClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotification:userInfo:object:", CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), v17, v18);

}

- (void)_handleLocalUserIdentityDidChangeNotification:(id)a3
{
  void *v3;
  MRUserIdentity *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_MRUserIdentityDataUserInfoKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[MRUserIdentity initWithProtobufData:]([MRUserIdentity alloc], "initWithProtobufData:", v6);
  +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateLocalIdentity:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
}

@end
