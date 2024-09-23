@implementation GKLocalPlayer

+ (id)authenticatedLocalPlayers
{
  return (id)objc_msgSend(a1, "authenticatedLocalPlayersWithStatus:", 4);
}

+ (id)authenticatedLocalPlayersWithStatus:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticatedLocalPlayersWithStatus:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __22__GKLocalPlayer_local__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)local_sLocalPlayer;
  local_sLocalPlayer = (uint64_t)v1;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = local_sLocalPlayer;
    +[GKApplicationNotificationNames willEnterForeground](GKApplicationNotificationNames, "willEnterForeground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v4, sel_applicationWillEnterForeground_, v5, 0);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = local_sLocalPlayer;
    +[GKApplicationNotificationNames didEnterBackground](GKApplicationNotificationNames, "didEnterBackground");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v7, sel_applicationDidEnterBackground_, v8, 0);

  }
  v14[0] = &unk_1EF4D31F0;
  v14[1] = &unk_1EF4CC038;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKEventEmitter eventEmitterForProtocols:](GKEventEmitter, "eventEmitterForProtocols:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)local_sLocalPlayer, "setEventEmitter:", v10);

  if ((objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess") & 1) == 0)
  {
    v11 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v11, v12, &__block_literal_global_96);

  }
  getpid();
  return proc_disable_wakemon();
}

- (void)setEventEmitter:(id)a3
{
  objc_storeStrong((id *)&self->_eventEmitter, a3);
}

+ (GKLocalPlayer)local
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__GKLocalPlayer_local__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (local_sDispatchOnceToken != -1)
    dispatch_once(&local_sDispatchOnceToken, block);
  return (GKLocalPlayer *)(id)local_sLocalPlayer;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

+ (id)localPlayerAccessQueue
{
  if (localPlayerAccessQueue_onceToken != -1)
    dispatch_once(&localPlayerAccessQueue_onceToken, &__block_literal_global_22);
  return (id)localPlayerAccessQueue_sLocalPlayerAccessQueue;
}

void __39__GKLocalPlayer_localPlayerAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.gamecenter.localplayer", v2);
  v1 = (void *)localPlayerAccessQueue_sLocalPlayerAccessQueue;
  localPlayerAccessQueue_sLocalPlayerAccessQueue = (uint64_t)v0;

}

+ (void)performSync:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  objc_msgSend(a1, "localPlayerAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, v4);

}

+ (void)performAsync:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  objc_msgSend(a1, "localPlayerAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

uint64_t __22__GKLocalPlayer_local__block_invoke_2()
{
  return objc_msgSend((id)local_sLocalPlayer, "setupForCloudSavedGames");
}

- (id)matchmaker
{
  return +[GKMatchmaker sharedMatchmaker](GKMatchmaker, "sharedMatchmaker");
}

+ (id)localPlayers
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  objc_msgSend(a1, "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticated");

  if (!v4)
    return MEMORY[0x1E0C9AA60];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29__GKLocalPlayer_localPlayers__block_invoke;
  v13[3] = &unk_1E75B3180;
  v13[4] = &v14;
  v13[5] = a1;
  objc_msgSend(a1, "performSync:", v13);
  objc_msgSend(a1, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v15[5], "indexOfObject:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      +[GKLocalPlayer localPlayers].cold.1(v8, v9, v10);
  }
  else
  {
    objc_msgSend((id)v15[5], "removeObjectAtIndex:", v6);
  }
  objc_msgSend((id)v15[5], "insertObject:atIndex:", v5, 0);
  v12 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v12;
}

void __29__GKLocalPlayer_localPlayers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "_localPlayersFromInternals:authenticated:", sLocalPlayers, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKLocalPlayer;
  -[GKPlayer dealloc](&v4, sel_dealloc);
}

- (BOOL)appIsInBackground
{
  return sAppIsInBackground;
}

- (void)setAppIsInBackground:(BOOL)a3
{
  sAppIsInBackground = a3;
}

- (BOOL)isShowingInGameUI
{
  GKLocalPlayer *v3;
  GKLocalPlayer *v4;
  BOOL showingInGameUI;

  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v3 = (GKLocalPlayer *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self)
    showingInGameUI = self->_showingInGameUI;
  else
    showingInGameUI = -[GKLocalPlayer isShowingInGameUI](v3, "isShowingInGameUI");

  return showingInGameUI;
}

- (void)setShowingInGameUI:(BOOL)a3
{
  _BOOL8 v3;
  GKLocalPlayer *v5;
  GKLocalPlayer *v6;

  v3 = a3;
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v5 = (GKLocalPlayer *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    self->_showingInGameUI = v3;
  }
  else
  {
    v6 = v5;
    -[GKLocalPlayer setShowingInGameUI:](v5, "setShowingInGameUI:", v3);
    v5 = v6;
  }

}

- (void)setStatus:(id)a3
{
  -[GKLocalPlayer setStatus:withCompletionHandler:](self, "setStatus:withCompletionHandler:", a3, 0);
}

- (void)setStatus:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  GKLocalPlayer *v15;
  id v16;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  -[GKLocalPlayer status](self, "status");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)GKLocalPlayer;
  -[GKLocalPlayer setStatus:](&v17, sel_setStatus_, v7);
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileServicePrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E75B2050;
  v14 = v8;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v10, "setStatus:handler:", v7, v13);

}

void __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[5];
  objc_super v7;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7.receiver = *(id *)(a1 + 40);
    v7.super_class = (Class)GKLocalPlayer;
    objc_msgSendSuper2(&v7, sel_setStatus_, v4);
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E75B1590;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __49__GKLocalPlayer_setStatus_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postChangeNotification");
}

- (BOOL)shouldPreserveOnboardingUI
{
  GKLocalPlayer *v3;
  GKLocalPlayer *v4;
  BOOL shouldPreserveOnboardingUI;

  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v3 = (GKLocalPlayer *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self)
    shouldPreserveOnboardingUI = self->_shouldPreserveOnboardingUI;
  else
    shouldPreserveOnboardingUI = -[GKLocalPlayer shouldPreserveOnboardingUI](v3, "shouldPreserveOnboardingUI");

  return shouldPreserveOnboardingUI;
}

- (void)setShouldPreserveOnboardingUI:(BOOL)a3
{
  _BOOL8 v3;
  GKLocalPlayer *v5;
  GKLocalPlayer *v6;

  v3 = a3;
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v5 = (GKLocalPlayer *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    self->_shouldPreserveOnboardingUI = v3;
  }
  else
  {
    v6 = v5;
    -[GKLocalPlayer setShouldPreserveOnboardingUI:](v5, "setShouldPreserveOnboardingUI:", v3);
    v5 = v6;
  }

}

- (id)displayNameWithOptions:(unsigned __int8)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKLocalPlayer;
  -[GKPlayer displayNameWithOptions:](&v4, sel_displayNameWithOptions_, a3 | 1u);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isMultiplayerGamingRestricted
{
  void *v2;
  void *v3;
  BOOL v4;

  +[GKPreferences shared](GKPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "multiplayerAllowedPlayerType"))
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "multiplayerAllowedPlayerType") == 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)isPersonalizedCommunicationRestricted
{
  void *v2;
  char v3;

  +[GKPreferences shared](GKPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAllowCustomCommunication") ^ 1;

  return v3;
}

- (void)promotePlayerInternalToLocalPlayerInternal:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  GKLocalPlayerInternal *v9;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    GKStackTraceWithFrameLimit(12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412290;
    v34 = v8;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "A GKLocalPlayer contains a GKPlayerInternal object. This is wrong and should be a GKLocalPlayerInternal object. Promoting to correct the issue. Stack trace:%@", (uint8_t *)&v33, 0xCu);

  }
  v9 = objc_alloc_init(GKLocalPlayerInternal);
  objc_msgSend(v4, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal setPlayerID:](v9, "setPlayerID:", v11);

  objc_msgSend(v4, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scopedIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal setScopedIDs:](v9, "setScopedIDs:", v13);

  objc_msgSend(v4, "internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerInternal setAccountName:](v9, "setAccountName:", v15);

  objc_msgSend(v4, "internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerInternal setDefaultNickname:](v9, "setDefaultNickname:", objc_msgSend(v16, "isDefaultNickname"));

  objc_msgSend(v4, "internal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerInternal setDefaultPrivacyVisibility:](v9, "setDefaultPrivacyVisibility:", objc_msgSend(v17, "isDefaultPrivacyVisibility"));

  objc_msgSend(v4, "internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerInternal setDefaultContactsIntegrationConsent:](v9, "setDefaultContactsIntegrationConsent:", objc_msgSend(v18, "isDefaultContactsIntegrationConsent"));

  objc_msgSend(v4, "internal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "alias");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal setAlias:](v9, "setAlias:", v20);

  objc_msgSend(v4, "internal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFamiliarPlayerInternal setFirstName:](v9, "setFirstName:", v22);

  objc_msgSend(v4, "internal");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFamiliarPlayerInternal setLastName:](v9, "setLastName:", v24);

  objc_msgSend(v4, "internal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerInternal setUnderage:](v9, "setUnderage:", objc_msgSend(v25, "isUnderage"));

  objc_msgSend(v4, "internal");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal setNumberOfAchievementPoints:](v9, "setNumberOfAchievementPoints:", objc_msgSend(v26, "numberOfAchievementPoints"));

  objc_msgSend(v4, "internal");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal setNumberOfAchievements:](v9, "setNumberOfAchievements:", objc_msgSend(v27, "numberOfAchievements"));

  objc_msgSend(v4, "internal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal setNumberOfFriends:](v9, "setNumberOfFriends:", objc_msgSend(v28, "numberOfFriends"));

  objc_msgSend(v4, "internal");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal setNumberOfGames:](v9, "setNumberOfGames:", objc_msgSend(v29, "numberOfGames"));

  objc_msgSend(v4, "internal");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerInternal setNumberOfTurns:](v9, "setNumberOfTurns:", objc_msgSend(v30, "numberOfTurns"));

  objc_msgSend(v4, "internal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "compositeName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFamiliarPlayerInternal setCompositeName:](v9, "setCompositeName:", v32);

  -[GKPlayer setInternal:](self, "setInternal:", v9);
}

- (void)updateFromLocalPlayer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLocalPlayer");

  if (v6)
  {
    objc_msgSend(v4, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayer setInternal:](self, "setInternal:", v7);

  }
  else
  {
    -[GKLocalPlayer promotePlayerInternalToLocalPlayerInternal:](self, "promotePlayerInternalToLocalPlayerInternal:", v4);
  }
  v8 = objc_msgSend(v4, "isAuthenticated");

  self->_authenticated = v8;
}

- (NSArray)friends
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKLocalPlayer friends].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v15[0] = CFSTR("playerID is no longer available");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)GKLocalPlayer;
    -[GKPlayer friends](&v14, sel_friends);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v12;
}

- (void)_loadFriendPlayersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "friendService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayer internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__GKLocalPlayer__loadFriendPlayersWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E75B1CF0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "getFriendsForPlayer:handler:", v7, v9);

}

void __57__GKLocalPlayer__loadFriendPlayersWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "_gkMapWithBlock:", &__block_literal_global_117);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);

}

GKPlayer *__57__GKLocalPlayer__loadFriendPlayersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GKPlayer *v3;

  v2 = a2;
  v3 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

- (void)loadChallengableFriendsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = completionHandler;
  objc_initWeak(&location, self);
  -[GKLocalPlayer friendService](self, "friendService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayer internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__GKLocalPlayer_loadChallengableFriendsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E75B31E8;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "getChallengableFriendsForPlayer:handler:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __62__GKLocalPlayer_loadChallengableFriendsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "handleChallengableFriendsResults:error:completion:", v7, v6, *(_QWORD *)(a1 + 32));

}

- (void)loadChallengableFriendsWithFetchOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[GKLocalPlayer friendServicePrivate](self, "friendServicePrivate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayer internal](self, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__GKLocalPlayer_loadChallengableFriendsWithFetchOptions_completion___block_invoke;
  v10[3] = &unk_1E75B31E8;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v7, "getChallengableFriendsForPlayer:fetchOptions:completion:", v8, a3, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __68__GKLocalPlayer_loadChallengableFriendsWithFetchOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "handleChallengableFriendsResults:error:completion:", v7, v6, *(_QWORD *)(a1 + 32));

}

- (void)handleChallengableFriendsResults:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke;
    block[3] = &unk_1E75B1BF0;
    v20 = v8;
    v19 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v10 = v20;
  }
  else
  {
    objc_msgSend(a3, "_gkMapWithBlock:", &__block_literal_global_120);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("friendBiDirectional == %@"), &unk_1E75FB010);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_127);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_2_128;
    v15[3] = &unk_1E75B1BF0;
    v16 = v14;
    v17 = v9;
    v10 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
}

uint64_t __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

GKPlayer *__67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GKPlayer *v3;

  v2 = a2;
  v3 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

uint64_t __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "sortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

uint64_t __67__GKLocalPlayer_handleChallengableFriendsResults_error_completion___block_invoke_2_128(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 32))
    v1 = *(_QWORD *)(a1 + 32);
  else
    v1 = MEMORY[0x1E0C9AA60];
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v1, 0);
}

- (void)loadRecentPlayersWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 443, "-[GKLocalPlayer loadRecentPlayersWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E75B1788;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v8, "perform:", v12);
  if (v4)
  {
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E75B23E8;
    v10 = v8;
    v11 = v4;
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v9);

  }
}

void __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E75B1C58;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "_loadFriendPlayersWithCompletionHandler:", v6);

}

uint64_t __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("friends"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__GKLocalPlayer_loadRecentPlayersWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("friends"));
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v5;
    if (v5)
      v6 = v5;
    else
      v6 = MEMORY[0x1E0C9AA60];
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v6, 0);
  }

}

- (void)loadFriendsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v4 = completionHandler;
  if (!GKApplicationLinkedOnOrAfter())
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "friendService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayer internal](self, "internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__GKLocalPlayer_loadFriendsWithCompletionHandler___block_invoke;
    v18[3] = &unk_1E75B1C58;
    v18[4] = self;
    v19 = v4;
    objc_msgSend(v16, "getFriendsForPlayer:handler:", v17, v18);

    goto LABEL_8;
  }
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKLocalPlayer loadFriendsWithCompletionHandler:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    if (!v4)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (v4)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 34, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v4 + 2))(v4, 0, v14);

  }
LABEL_8:

}

void __50__GKLocalPlayer_loadFriendsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "_gkValuesForKeyPath:", CFSTR("playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFriends:", v5);
  objc_msgSend(*(id *)(a1 + 32), "postChangeNotification");
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);

}

- (BOOL)isAvatarEditingRestricted
{
  return 0;
}

- (void)signOutWithCompletionHandler:(id)a3
{
  -[GKLocalPlayer signOutAndOptOut:completionHandler:](self, "signOutAndOptOut:completionHandler:", 0, a3);
}

- (void)signOutAndOptOut:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v7)(id, void *);
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(id, void *);
  _BYTE *v35;
  _BYTE buf[24];
  char v37;
  uint64_t v38;
  _QWORD v39[2];

  v4 = a3;
  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = v8;
    -[GKPlayer alias](self, "alias");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "GKLocalPlayer: signOutAndOptOut: %@, %d", buf, 0x12u);

  }
  if (!os_log_GKGeneral)
    v12 = GKOSLoggers();
  v13 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "GKLocalPlayer: signOutAndOptOut:", buf, 2u);
  }
  +[GKLocalPlayer authenticatedLocalPlayers](GKLocalPlayer, "authenticatedLocalPlayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || (objc_msgSend(v15, "internal"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "playerID"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = v17 == 0,
        v17,
        v16,
        v18))
  {
    if (!os_log_GKGeneral)
      v28 = GKOSLoggers();
    v29 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR))
      -[GKLocalPlayer signOutAndOptOut:completionHandler:].cold.1(v29, a2);
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D68];
    v39[0] = CFSTR("No Game Center player to sign out.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "userErrorForCode:userInfo:", 8, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v32);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v37 = 1;
    objc_msgSend(v15, "internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "playerID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayer internal](self, "internal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playerID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqualToString:", v22);

    if ((v23 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
      if (!os_log_GKGeneral)
        v24 = GKOSLoggers();
      v25 = os_log_GKAccount;
      if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR))
        -[GKLocalPlayer signOutAndOptOut:completionHandler:].cold.2(v25);
    }
    +[GKDaemonProxy proxyForPlayer:](GKDaemonProxy, "proxyForPlayer:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDaemonProxy removeProxyForPlayer:](GKDaemonProxy, "removeProxyForPlayer:", v15);
    objc_msgSend(v26, "accountService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __52__GKLocalPlayer_signOutAndOptOut_completionHandler___block_invoke;
    v33[3] = &unk_1E75B3270;
    v35 = buf;
    v34 = v7;
    objc_msgSend(v27, "signOutPlayerWithOptOut:handler:", v4, v33);

    _Block_object_dispose(buf, 8);
  }

}

void __52__GKLocalPlayer_signOutAndOptOut_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "GKLocalPlayer: signOut error:%@", buf, 0xCu);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (!objc_msgSend(v3, "gkIsNotConnectedToInternetError"))
      goto LABEL_12;
    v6 = 0;
    goto LABEL_11;
  }
  if (!v3 || objc_msgSend(v3, "gkIsNotConnectedToInternetError"))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D68];
    v11 = CFSTR("The player that was asked to be signed out was not the current local player. The current local player has been signed out.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userErrorForCode:userInfo:", 8, v8);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
LABEL_11:

    v3 = (id)v6;
  }
LABEL_12:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

+ (id)authenticatedLocalPlayersFiltered:(int64_t)a3
{
  uint64_t v3;

  if ((a3 & 2) != 0)
    v3 = 5;
  else
    v3 = 1;
  return (id)objc_msgSend((id)objc_opt_class(), "authenticatedLocalPlayersWithStatus:", v3);
}

- (void)updateLoginStatus:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v22 = a3;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "GKLocalPlayer: updateLoginStatus: %lX", buf, 0xCu);
  }
  if (!os_log_GKGeneral)
    v9 = GKOSLoggers();
  v10 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "GKLocalPlayer: setLoginStatus:", buf, 2u);
  }
  if ((a3 & 0x1C) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ ((status & GKLocalPlayerLoginStatusSettableMask) != 0)\n[%s (%s:%d)]"), v12, "-[GKLocalPlayer updateLoginStatus:completionHandler:]", objc_msgSend(v14, "UTF8String"), 582);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  -[GKLocalPlayer daemonProxy](self, "daemonProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountServicePrivate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke;
  v19[3] = &unk_1E75B29C8;
  v20 = v6;
  v18 = v6;
  objc_msgSend(v17, "setLoginStatus:handler:", a3, v19);

}

void __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    v5 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke_cold_1((uint64_t)v3, v5, v6);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

+ (id)localPlayerForCredential:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  objc_msgSend(a1, "authenticatedLocalPlayersWithStatus:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__GKLocalPlayer_localPlayerForCredential___block_invoke;
  v9[3] = &unk_1E75B3298;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__GKLocalPlayer_localPlayerForCredential___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playerInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)insideAuthenticatorInvocation
{
  return sInvokedAuthenticator;
}

- (void)setInsideAuthenticatorInvocation:(BOOL)a3
{
  sInvokedAuthenticator = a3;
}

+ (id)_localPlayersFromInternals:(id)a3 authenticated:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  if (!a3)
    return 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__GKLocalPlayer__localPlayersFromInternals_authenticated___block_invoke;
  v5[3] = &__block_descriptor_41_e49___GKLocalPlayer_24__0__GKLocalPlayerInternal_8Q16l;
  v5[4] = a1;
  v6 = a4;
  objc_msgSend(a3, "_gkMapWithBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __58__GKLocalPlayer__localPlayersFromInternals_authenticated___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = *(objc_class **)(a1 + 32);
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setInternal:", v4);

  objc_msgSend(v5, "setAuthenticated:", *(unsigned __int8 *)(a1 + 40));
  return v5;
}

+ (id)_userInfoForAuthAPINotificationForLoggedInPlayerInternals:(id)a3 loggedOutPlayerInternals:(id)a4 oldPrimary:(id)a5 newPrimary:(id)a6
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

  v10 = a5;
  v11 = a6;
  v12 = a4;
  objc_msgSend(a1, "_localPlayersFromInternals:authenticated:", a3, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localPlayersFromInternals:authenticated:", v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v16 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("GKPlayersSignedIn"));

  }
  if (objc_msgSend(v14, "count"))
  {
    v17 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("GKPlayersSignedOut"));

  }
  if (objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess"))
  {
    objc_msgSend(v11, "playerID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v11, "playerID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("GKPlayerDidAuthenticateNewPlayerID"));

    }
    objc_msgSend(v10, "playerID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v10, "playerID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      objc_msgSend(v15, "setObject:forKey:", v23, CFSTR("GKPlayerDidAuthenticateOldPlayerID"));

    }
  }

  return v15;
}

+ (void)authenticatedLocalPlayersDidChange:(id)a3 complete:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  char v35;
  id v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  uint64_t *v41;
  id v42;
  char v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[4];
  id v52;
  _BYTE *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _BYTE *v59;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = GKOSLoggers();
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = v10;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);

  }
  v14 = objc_msgSend(v9, "appIsInBackground");
  v15 = os_log_GKGeneral;
  if (v14)
  {
    if (!os_log_GKGeneral)
    {
      v16 = GKOSLoggers();
      v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = v15;
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "%@: skipping, in background", buf, 0xCu);

    }
    if (v8)
      v8[2](v8);
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v19 = GKOSLoggers();
      v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = v15;
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "%@: appear not to be in the background!", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v61 = __Block_byref_object_copy__5;
    v62 = __Block_byref_object_dispose__5;
    v23 = MEMORY[0x1E0C809B0];
    v63 = 0;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke;
    v57[3] = &unk_1E75B32E0;
    v59 = buf;
    v24 = v7;
    v58 = v24;
    objc_msgSend(a1, "performSync:", v57);
    objc_msgSend(a1, "local");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "internal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(a1, "local");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "internal");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v28;
    }

    v37 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v54[0] = v23;
    v54[1] = 3221225472;
    v54[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_2;
    v54[3] = &unk_1E75B3308;
    v31 = v22;
    v55 = v31;
    v32 = v29;
    v56 = v32;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v54);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51[0] = v23;
    v51[1] = 3221225472;
    v51[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_3;
    v51[3] = &unk_1E75B3330;
    v53 = buf;
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v52 = v33;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v51);
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__5;
    v49 = __Block_byref_object_dispose__5;
    v50 = 0;
    v44[0] = v23;
    v44[1] = 3221225472;
    v44[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_4;
    v44[3] = &unk_1E75B3358;
    v44[4] = &v45;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v44);
    if (objc_msgSend(v33, "count")
      || objc_msgSend(v32, "count")
      || v27 != (void *)v46[5] && (objc_msgSend(v27, "isEqual:") & 1) == 0)
    {
      objc_msgSend(a1, "_userInfoForAuthAPINotificationForLoggedInPlayerInternals:loggedOutPlayerInternals:oldPrimary:newPrimary:", v33, v32, v27, v46[5]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 1;
    }
    else
    {
      v35 = 0;
      v34 = 0;
    }
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_5;
    block[3] = &unk_1E75B33A8;
    v41 = &v45;
    v39 = v9;
    v43 = v35;
    v36 = v34;
    v40 = v36;
    v42 = a1;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (v8)
      v8[2](v8);

    v7 = v37;
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(buf, 8);
  }

}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = sLocalPlayers;
  if (sLocalPlayers)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", sLocalPlayers);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v2)

  objc_storeStrong((id *)&sLocalPlayers, *(id *)(a1 + 32));
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "playerID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v6);

    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "loginStatus") & 4) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "playerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v2 != 0) != objc_msgSend(*(id *)(a1 + 32), "isAuthenticated"))
    objc_msgSend(*(id *)(a1 + 32), "setAuthenticated:", v2 != 0);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    +[GKInternalRepresentation internalRepresentation](GKUnauthenticatedPlayerInternal, "internalRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", v3);

  }
  if (*(_BYTE *)(a1 + 64))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_6;
    v7[3] = &unk_1E75B3380;
    v4 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = v5;
    v9 = v6;
    objc_msgSend(v4, "updateScopedIDs:", v7);

  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_7;
  block[3] = &unk_1E75B3380;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 40), "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "insideAuthenticatorInvocation") & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v5, "isShowingInGameUI") & 1) == 0)
  {
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_166;
    v7[3] = &unk_1E75B1590;
    v8 = v5;
    v6 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  NSNotificationName v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v3 = GKOSLoggers();
    v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1BCDE3000, v2, OS_LOG_TYPE_INFO, "sending auth did change %@", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = GKPlayerAuthenticationDidChangeNotificationName;
  objc_msgSend(*(id *)(a1 + 40), "local");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v8 = *(_QWORD *)(a1 + 32);
  else
    v8 = 0;
  objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, v7, v8);

}

uint64_t __61__GKLocalPlayer_authenticatedLocalPlayersDidChange_complete___block_invoke_166(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShouldPreserveOnboardingUI:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "authenticationDidCompleteWithError:signInOrigin:", 0, 7);
}

- (GKDaemonProxy)daemonProxy
{
  return (GKDaemonProxy *)+[GKDaemonProxy proxyForPlayer:](GKDaemonProxy, "proxyForPlayer:", self);
}

+ (id)accountServicePrivate
{
  void *v2;
  void *v3;

  +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountServicePrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)friendServicePrivate
{
  void *v2;
  void *v3;

  -[GKLocalPlayer daemonProxy](self, "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendServicePrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)friendService
{
  void *v2;
  void *v3;

  -[GKLocalPlayer daemonProxy](self, "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)authenticateWithUsername:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (completionHandler != ((void *)0))\n[%s (%s:%d)]"), v11, "+[GKLocalPlayer authenticateWithUsername:password:completionHandler:]", objc_msgSend(v13, "UTF8String"), 814);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  v15 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v16 = GKOSLoggers();
    v15 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "authenticateWithUsername:%@", buf, 0xCu);
  }
  +[GKLocalPlayer accountServicePrivate](GKLocalPlayer, "accountServicePrivate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__GKLocalPlayer_authenticateWithUsername_password_completionHandler___block_invoke;
  v20[3] = &unk_1E75B33D0;
  v21 = v7;
  v22 = v9;
  v18 = v9;
  v19 = v7;
  objc_msgSend(v17, "authenticatePlayerWithUsername:password:altDSID:usingFastPath:handler:", v19, v8, 0, 1, v20);

}

void __69__GKLocalPlayer_authenticateWithUsername_password_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "authenticateWithUsername:%@ response:%@ error:%@", (uint8_t *)&v11, 0x20u);
  }
  if (v6)
  {
    v10 = 0;
  }
  else
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)authenticateHandler
{
  void *v2;
  void *v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = _Block_copy((const void *)sAuthenticateHandler);
  objc_sync_exit(v2);

  return v3;
}

- (void)refreshInternalWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKLocalPlayer *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 951, "-[GKLocalPlayer refreshInternalWithCompletion:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke;
  v15[3] = &unk_1E75B1788;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  objc_msgSend(v8, "perform:", v15);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_3;
  v11[3] = &unk_1E75B30F8;
  v12 = v8;
  v13 = self;
  v14 = v4;
  v9 = v4;
  v10 = v8;
  objc_msgSend(v10, "notifyOnQueue:block:", MEMORY[0x1E0C80D38], v11);

}

void __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baseProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_2;
  v7[3] = &unk_1E75B1C58;
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "authenticatedLocalPlayersWithStatus:completion:", 4, v7);

}

uint64_t __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __47__GKLocalPlayer_refreshInternalWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void (*v4)(void);
  id v5;
  NSObject *v6;
  GKUnauthenticatedPlayerInternal *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "updateFromLocalPlayer:", v3);
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "The local player could have signed out outside of Settings. Now, there is no authenticated local player to load the profile for Settings.", v8, 2u);
    }
    v7 = objc_alloc_init(GKUnauthenticatedPlayerInternal);
    objc_msgSend(*(id *)(a1 + 40), "setInternal:", v7);

    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v4();

}

- (void)callAuthHandlerWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_DEFAULT, "Calling AuthenticateHandlerWithError: %@", buf, 0xCu);
  }
  -[GKPlayer playerID](self, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v9 = GKOSLoggers();
      v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_DEFAULT, "Game Center has authenticated the player", buf, 2u);
    }
  }
  -[GKPlayer internal](self, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInternal:", v10);

  v12 = -[GKLocalPlayer isAuthenticated](self, "isAuthenticated");
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAuthenticated:", v12);

  if (-[GKLocalPlayer isAuthenticated](self, "isAuthenticated"))
    v14 = 2;
  else
    v14 = 3;
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAuthenticationState:", v14);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__GKLocalPlayer_callAuthHandlerWithError___block_invoke;
  v17[3] = &unk_1E75B1A28;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

void __42__GKLocalPlayer_callAuthHandlerWithError___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "setIsShowingFriendRequestUI:", 0);
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "callAuthHandlerWithError:Setting the Authentication Handler", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "authenticateHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(_QWORD *)(a1 + 40));

}

- (void)setAuthenticateHandler:(void *)authenticateHandler
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];

  v8 = authenticateHandler;
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  if ((id)sAuthenticateHandler == v8)
  {
    objc_sync_exit(v4);

  }
  else
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = (void *)sAuthenticateHandler;
    sAuthenticateHandler = v5;

    v7 = sAuthenticateHandler;
    objc_sync_exit(v4);

    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__GKLocalPlayer_setAuthenticateHandler___block_invoke;
      block[3] = &unk_1E75B1590;
      block[4] = self;
      if (setAuthenticateHandler__once != -1)
        dispatch_once(&setAuthenticateHandler__once, block);
    }
  }

}

uint64_t __40__GKLocalPlayer_setAuthenticateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  +[GKReporter reporter](GKReporter, "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordAuthenticateResponseTimestamp");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__GKLocalPlayer_setAuthenticateHandler___block_invoke_2;
  v4[3] = &unk_1E75B1590;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[GKActivity named:execute:](GKActivity, "named:execute:", CFSTR("GC Activity: Starting Authentication for Existing Primary Player"), v4);
}

uint64_t __40__GKLocalPlayer_setAuthenticateHandler___block_invoke_2(uint64_t a1)
{
  char v2;
  void *v3;

  v2 = objc_opt_respondsToSelector();
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "startAuthenticationForExistingPrimaryPlayer");
  else
    return objc_msgSend(v3, "_startAuthenticationForExistingPrimaryPlayer");
}

- (void)removeFriend:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "friendServicePrivate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__GKLocalPlayer_removeFriend_block___block_invoke;
  v12[3] = &unk_1E75B17D8;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "removeFriendWithPlayer:handler:", v10, v12);

}

void __36__GKLocalPlayer_removeFriend_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfFriends");
    v3 = 0;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setNumberOfFriends:", objc_msgSend(*(id *)(a1 + 32), "numberOfFriends") - 1);
      objc_msgSend(*(id *)(a1 + 32), "postChangeNotification");
      v3 = 0;
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)removeAllFriendsWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[GKLocalPlayer removeAllFriendsWithBlock:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "friendServicePrivate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __43__GKLocalPlayer_removeAllFriendsWithBlock___block_invoke;
  v17[3] = &unk_1E75B17D8;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  objc_msgSend(v15, "removeAllFriendsWithHandler:", v17);

}

void __43__GKLocalPlayer_removeAllFriendsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfFriends");
    v3 = 0;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setNumberOfFriends:", 0);
      objc_msgSend(*(id *)(a1 + 32), "postChangeNotification");
      v3 = 0;
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)_startAuthenticationForExistingPrimaryPlayer
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  -[GKLocalPlayer setAuthenticationState:](self, "setAuthenticationState:", 1);
  -[GKLocalPlayer daemonProxy](self, "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke;
  v6[3] = &unk_1E75B3420;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v5, "authenticatePlayerWithExistingCredentialsWithHandler:", v6);

}

void __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  const char *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD, _QWORD);
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  _BYTE *v53;
  uint8_t buf[4];
  void *v55;
  _BYTE v56[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_cold_1((uint64_t)v6, v8, v9);
  }
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = GKOSLoggers();
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v35 = *(const char **)(a1 + 40);
    v36 = v10;
    NSStringFromSelector(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v56 = 138412802;
    *(_QWORD *)&v56[4] = v37;
    *(_WORD *)&v56[12] = 2112;
    *(_QWORD *)&v56[14] = v5;
    *(_WORD *)&v56[22] = 2112;
    v57 = v6;
    _os_log_debug_impl(&dword_1BCDE3000, v36, OS_LOG_TYPE_DEBUG, "%@ auth response:%@ error:%@", v56, 0x20u);

  }
  *(_QWORD *)v56 = 0;
  *(_QWORD *)&v56[8] = v56;
  *(_QWORD *)&v56[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__5;
  v58 = __Block_byref_object_dispose__5;
  v59 = 0;
  objc_msgSend(v5, "playerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer authenticatedLocalPlayersWithStatus:](GKLocalPlayer, "authenticatedLocalPlayersWithStatus:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_176;
  v50[3] = &unk_1E75B33F8;
  v14 = v12;
  v15 = *(_QWORD *)(a1 + 32);
  v51 = v14;
  v52 = v15;
  v53 = v56;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v50);

  objc_msgSend(*(id *)(*(_QWORD *)&v56[8] + 40), "internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInternal:", v16);

  if (v6 || (objc_msgSend(v5, "loginDisabled") & 1) != 0)
  {
    if (objc_msgSend(v5, "loginDisabled"))
    {
      if (!os_log_GKGeneral)
        v17 = GKOSLoggers();
      v18 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "_handleAuthResponse:Login has been disabled", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
      v19 = objc_claimAutoreleasedReturnValue();

LABEL_18:
      v6 = (uint64_t (*)(uint64_t, uint64_t))v19;
      goto LABEL_63;
    }
    objc_msgSend(v6, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", GKErrorDomain);

    if (v21)
    {
      v22 = objc_msgSend(v6, "code");
      if ((unint64_t)(v22 - 5) < 2)
      {
        if (!os_log_GKGeneral)
          v23 = GKOSLoggers();
        v24 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v24, OS_LOG_TYPE_INFO, "_handleAuthResponse:Auth Error: GKErrorInvalidCredentials", buf, 2u);
        }
        objc_msgSend(v6, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CB3388]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v26, "code");
        switch(v27)
        {
          case 5029:
            if (!os_log_GKGeneral)
              v40 = GKOSLoggers();
            v29 = os_log_GKTrace;
            if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
              goto LABEL_62;
            *(_WORD *)buf = 0;
            v30 = "_handleAuthResponse:Underlying Error: GKServerNotAuthorizedError";
            break;
          case 5047:
            if (!os_log_GKGeneral)
              v41 = GKOSLoggers();
            v29 = os_log_GKTrace;
            if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
              goto LABEL_62;
            *(_WORD *)buf = 0;
            v30 = "_handleAuthResponse:Underlying Error: GKServerForcePasswordChangeError";
            break;
          case 5170:
            if (!os_log_GKGeneral)
              v28 = GKOSLoggers();
            v29 = os_log_GKTrace;
            if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
            {
LABEL_62:

              goto LABEL_63;
            }
            *(_WORD *)buf = 0;
            v30 = "_handleAuthResponse:Underlying Error: GKServerNeedsType15Repair";
            break;
          default:
            +[GKReachability _gkReachabilityForInternetConnection](GKReachability, "_gkReachabilityForInternetConnection");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "_gkCurrentReachabilityStatus") == 0;

            if (v43)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "gkNotConnectedToInternetError");
              v44 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 3, 0);
              v44 = objc_claimAutoreleasedReturnValue();

              if (!os_log_GKGeneral)
                v45 = GKOSLoggers();
              v46 = (id)os_log_GKTrace;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "code"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v55 = v47;
                _os_log_impl(&dword_1BCDE3000, v46, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: %@", buf, 0xCu);

              }
            }
            v6 = (uint64_t (*)(uint64_t, uint64_t))v44;
            goto LABEL_62;
        }
        _os_log_impl(&dword_1BCDE3000, v29, OS_LOG_TYPE_INFO, v30, buf, 2u);
        goto LABEL_62;
      }
      if (v22 == 15)
      {
        if (!os_log_GKGeneral)
          v33 = GKOSLoggers();
        v34 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v34, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKErrorGameUnrecognized", buf, 2u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 15, 0);
        v19 = objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      if (!*(_QWORD *)(*(_QWORD *)&v56[8] + 40))
      {
        +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = *(void **)(*(_QWORD *)&v56[8] + 40);
        *(_QWORD *)(*(_QWORD *)&v56[8] + 40) = v38;

      }
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v31 = GKOSLoggers();
    v32 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v32, OS_LOG_TYPE_INFO, "_handleAuthResponse:Login success", buf, 2u);
    }
    v6 = 0;
  }
LABEL_63:
  objc_msgSend(*(id *)(a1 + 32), "setAuthenticationError:", v6);
  objc_msgSend(*(id *)(a1 + 32), "authenticateHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticateHandler");
    v49 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, uint64_t (*)(uint64_t, uint64_t)))v49)[2](v49, 0, v6);

  }
  _Block_object_dispose(v56, 8);

}

void __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_176(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint8_t v13[16];

  v7 = a2;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "_handleAuthResponse:Authenticated Local Player with Status", v13, 2u);
  }
  objc_msgSend(v7, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "setAuthenticated:", 1);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)fetchTurnBasedEvent
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "fetchTurnBasedEvent", v5, 2u);
  }
  +[GKTurnBasedEventHandler sharedTurnBasedEventHandler](GKTurnBasedEventHandler, "sharedTurnBasedEventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lookForEvent");

}

- (void)cancelGameInvite:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKInvite *acceptedInvite;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  uint8_t buf[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKLocalPlayer: daemonCancelledGameInvite", buf, 2u);
  }
  if (v4)
  {
    acceptedInvite = self->_acceptedInvite;
    if (acceptedInvite
      && (-[GKInvite inviteID](acceptedInvite, "inviteID"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", v4),
          v8,
          v9))
    {
      v10 = (void *)MEMORY[0x1E0C99D20];
      -[GKInvite inviter](self->_acceptedInvite, "inviter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __34__GKLocalPlayer_cancelGameInvite___block_invoke;
      v24[3] = &unk_1E75B3448;
      v24[4] = self;
      +[GKPlayer loadPlayersForIdentifiersPrivate:withCompletionHandler:](GKPlayer, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v12, v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("invite-id"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("GKInviterCancelledGameInvite"), self, v13);

    }
  }
  else
  {
    v15 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v16 = GKOSLoggers();
      v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[GKLocalPlayer cancelGameInvite:].cold.1(v15, v17, v18, v19, v20, v21, v22, v23);
  }

}

void __34__GKLocalPlayer_cancelGameInvite___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "lastObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "showCancelledAlertForPlayer:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCancelled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAcceptedInvite:", 0);

}

- (void)inviteeAcceptedGameInviteWithNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("GKInviteeAcceptedGameInvite"), self, v5);

}

- (void)inviteeDeclinedGameInviteWithNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("GKInviteeDeclinedGameInvite"), self, v5);

}

- (void)inviteeUpdateGameInviteWithNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("GKUpdateGameInviteNotification"), self, v5);

}

- (void)cancelInviteWithNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "posting GKCancelledGameInviteNotification", v8, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("GKInviterCancelledGameInvite"), self, v4);

}

- (void)setDefaultLeaderboardIdentifier:(NSString *)leaderboardIdentifier completionHandler:(void *)completionHandler
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  NSString *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v6 = leaderboardIdentifier;
  v7 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 1238, "-[GKLocalPlayer setDefaultLeaderboardIdentifier:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKGame currentGame](GKGame, "currentGame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v20 = 0;
    v18 = 0u;
    v19 = 0u;
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v10, "gameInfo");
  if (*((_QWORD *)&v18 + 1) >= 2uLL)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E75B1800;
    v15[4] = self;
    v16 = v9;
    v17 = v6;
    objc_msgSend(v16, "perform:", v15);

  }
  if (v7)
  {
LABEL_5:
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_5;
    v12[3] = &unk_1E75B1BF0;
    v14 = v7;
    v13 = v9;
    objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v12);

  }
LABEL_6:

}

void __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_1E75B3470;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadDefaultLeaderboardIdentifierWithCompletionHandler:", v6);

}

uint64_t __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setError:", a3);
  LOBYTE(a3) = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((a3 & 1) == 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_3;
    v12[3] = &unk_1E75B1788;
    v10 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v10, "perform:", v12);

  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7, v8, v9);
}

void __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_4;
  v8[3] = &unk_1E75B17D8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "setDefaultLeaderboardID:handler:", v6, v8);

}

uint64_t __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__GKLocalPlayer_setDefaultLeaderboardIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)loadDefaultLeaderboardIdentifierWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  void *v4;
  id v5;

  if (completionHandler)
  {
    v3 = completionHandler;
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gameStatService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getDefaultLeaderboardIDWithHandler:", v3);

  }
}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = completionHandler;
  if (v3)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__GKLocalPlayer_generateIdentityVerificationSignatureWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E75B3498;
    v7 = v3;
    objc_msgSend(v5, "generateIdentityVerificationSignatureWithCompletionHandler:", v6);

  }
}

void __76__GKLocalPlayer_generateIdentityVerificationSignatureWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v8 = a2;
    objc_msgSend(v8, "objectForKey:", CFSTR("signature"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("salt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("timestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unsignedLongLongValue");

    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "objectForKey:", CFSTR("public-key-url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "URLWithString:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchItemsForIdentityVerificationSignature:(void *)completionHandler
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = completionHandler;
  if (v3)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__GKLocalPlayer_fetchItemsForIdentityVerificationSignature___block_invoke;
    v6[3] = &unk_1E75B3498;
    v7 = v3;
    objc_msgSend(v5, "fetchItemsForIdentityVerificationSignature:", v6);

  }
}

void __60__GKLocalPlayer_fetchItemsForIdentityVerificationSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v8 = a2;
    objc_msgSend(v8, "objectForKey:", CFSTR("signature"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("salt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("timestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unsignedLongLongValue");

    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "objectForKey:", CFSTR("public-key-url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "URLWithString:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getPlayerIDFromFriendCode:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 1342, "-[GKLocalPlayer getPlayerIDFromFriendCode:handler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke;
  v17[3] = &unk_1E75B1788;
  v18 = v5;
  v10 = v8;
  v19 = v10;
  v11 = v5;
  objc_msgSend(v10, "perform:", v17);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_3;
  v14[3] = &unk_1E75B1BF0;
  v15 = v10;
  v16 = v6;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v14);

}

void __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_2;
  v8[3] = &unk_1E75B1C58;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "getFriendCodeDetailWithIdentifiers:handler:", v6, v8);

}

void __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (!a3 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creatorPlayerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "friendCodeUsageCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("friendCodeUsageCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "friendCodeState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("friendCodeState"));

    objc_msgSend(v5, "alreadyUsedPlayerIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "alreadyUsedPlayerIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("usedPlayerIDs"));

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __51__GKLocalPlayer_getPlayerIDFromFriendCode_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("usedPlayerIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friendCodeUsageCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friendCodeState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, void *, void *))(v2 + 16))(v2, v7, v3, v4, v5, v6);

}

- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 1366, "-[GKLocalPlayer createFriendRequestWithIdentifier:handler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke;
  v17[3] = &unk_1E75B1788;
  v18 = v5;
  v10 = v8;
  v19 = v10;
  v11 = v5;
  objc_msgSend(v10, "perform:", v17);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_5;
  v14[3] = &unk_1E75B1BF0;
  v15 = v10;
  v16 = v6;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v14);

}

void __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_2;
  v12[3] = &unk_1E75B2C28;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v3;
  v8 = v3;
  objc_msgSend(v5, "createFriendRequestWithIdentifier:handler:", v7, v12);

  v9 = *(void **)(a1 + 40);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_3;
  v10[3] = &unk_1E75B1C80;
  v11 = v9;
  objc_msgSend(v11, "perform:", v10);

}

uint64_t __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setError:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_4;
  v7[3] = &unk_1E75B2C28;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "getFriendSupportPageURLWithHandler:", v7);

}

uint64_t __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("friendUrl"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__GKLocalPlayer_createFriendRequestWithIdentifier_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friendUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 1390, "-[GKLocalPlayer cancelFriendRequestWithIdentifier:handler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke;
  v17[3] = &unk_1E75B1788;
  v18 = v5;
  v10 = v8;
  v19 = v10;
  v11 = v5;
  objc_msgSend(v10, "perform:", v17);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_3;
  v14[3] = &unk_1E75B1BF0;
  v15 = v10;
  v16 = v6;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v14);

}

void __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_2;
  v8[3] = &unk_1E75B17D8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "cancelFriendRequestWithIdentifier:handler:", v6, v8);

}

uint64_t __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__GKLocalPlayer_cancelFriendRequestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 1406, "-[GKLocalPlayer acceptFriendRequestWithIdentifier:sendPush:handler:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke;
  v19[3] = &unk_1E75B34C0;
  v20 = v7;
  v22 = a4;
  v12 = v10;
  v21 = v12;
  v13 = v7;
  objc_msgSend(v12, "perform:", v19);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_3;
  v16[3] = &unk_1E75B1BF0;
  v17 = v12;
  v18 = v8;
  v14 = v12;
  v15 = v8;
  objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v16);

}

void __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_2;
  v9[3] = &unk_1E75B17D8;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "acceptFriendRequestWithIdentifier:sendPush:handler:", v7, v6, v9);

}

uint64_t __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__GKLocalPlayer_acceptFriendRequestWithIdentifier_sendPush_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 1422, "-[GKLocalPlayer rejectFriendRequestWithIdentifier:handler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke;
  v17[3] = &unk_1E75B1788;
  v18 = v5;
  v10 = v8;
  v19 = v10;
  v11 = v5;
  objc_msgSend(v10, "perform:", v17);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_3;
  v14[3] = &unk_1E75B1BF0;
  v15 = v10;
  v16 = v6;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v14);

}

void __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_2;
  v8[3] = &unk_1E75B17D8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "rejectFriendRequestWithIdentifier:handler:", v6, v8);

}

uint64_t __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__GKLocalPlayer_rejectFriendRequestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)shouldDisplayWelcomeBannerForPlayer:(id)a3 lastAuthDate:(id)a4 remoteUI:(BOOL)a5 timeBetweenBanners:(double)a6
{
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;

  v10 = a3;
  v11 = a4;
  if (+[GKGame isGameCenter](GKGame, "isGameCenter"))
  {
    v12 = 0;
  }
  else
  {
    -[GKLocalPlayer authenticateHandler](self, "authenticateHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (v13 && !a5)
    {
      if (+[GKGame isPreferences](GKGame, "isPreferences")
        || +[GKGame isFirstParty](GKGame, "isFirstParty"))
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "_gkIsPurpleBuddy") & 1) != 0)
        {
          v12 = 0;
        }
        else
        {
          v12 = 1;
          if (v10 && v11)
          {
            -[GKPlayer internal](self, "internal");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "playerID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "isEqualToString:", v16))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "timeIntervalSinceDate:", v11);
              v12 = v18 >= a6;

            }
          }
        }

      }
    }

  }
  return v12;
}

- (BOOL)isWelcomeBannerTooLate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  _BOOL8 v16;
  void *v17;
  unint64_t v18;
  __CFString **v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  int v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authStartTimeStamp");
  v5 = v4;

  if (v5 <= 0.0)
  {
    LOBYTE(v16) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authStartTimeStamp");
    v11 = v8 - v10;

    if (v11 <= 5.0)
    {
      LOBYTE(v16) = 0;
    }
    else
    {
      -[GKPlayer playerID](self, "playerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(":"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v13, "count") < 2)
      {
        LOBYTE(v16) = 0;
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "longLongValue");

        v16 = (v15 >> 2) & 1;
      }

    }
    +[GKReporter reporter](GKReporter, "reporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[GKLocalPlayer authenticationType](self, "authenticationType");
    v19 = GKReporterPlayerAuthenticationElapsedTime;
    if (v18)
      v19 = GKReporterPlayerAuthenticationElapsedTimeWithUI;
    v20 = *v19;
    v21 = (void *)MEMORY[0x1E0C99D68];
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "authStartTimeStamp");
    objc_msgSend(v21, "dateWithTimeIntervalSince1970:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reportEvent:type:startTime:", CFSTR("com.apple.GameKit.PlayerAuthentication"), v20, v23);

    v24 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v25 = GKOSLoggers();
      v24 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v27 = 134217984;
      v28 = v11;
      _os_log_impl(&dword_1BCDE3000, v24, OS_LOG_TYPE_INFO, "shouldDisplayWelcomeBannerForPlayer: Welcome banner displayed in %g seconds", (uint8_t *)&v27, 0xCu);
    }
  }
  return v16;
}

- (void)reportAuthenticationStartForPlayer
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  +[GKReporter reporter](GKReporter, "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerAuthentication"), CFSTR("Start"));

  v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v4 = GKOSLoggers();
    v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationStartForPlayer: Account login starts", v5, 2u);
  }
}

- (void)reportAuthenticationPlayerAuthenticated
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  +[GKReporter reporter](GKReporter, "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerAuthentication"), CFSTR("PlayerAuthenticated"));

  v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v4 = GKOSLoggers();
    v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationPlayerAuthenticated: Player authenticated", v5, 2u);
  }
}

- (void)reportAuthenticationErrorNoInternetConnection
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  +[GKReporter reporter](GKReporter, "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerAuthentication"), CFSTR("DeviceOffline"));

  v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v4 = GKOSLoggers();
    v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationErrorNoInternetConnection: Authentication bypassed because device is offline", v5, 2u);
  }
}

- (void)reportAuthenticatingWithGreenBuddyInvocation
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAuthenticationType:", 1);

  +[GKReporter reporter](GKReporter, "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerAuthentication"), CFSTR("GreenBuddyInvocation"));

  v4 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v5 = GKOSLoggers();
    v4 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "reportAuthenticatingWithGreenBuddyInvocation: Authentication requires GreenBuddy UI invocation", v6, 2u);
  }
}

- (void)reportAuthenticatingWithAuthKitInvocation
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  -[GKLocalPlayer setAuthenticationType:](self, "setAuthenticationType:", 2);
  +[GKReporter reporter](GKReporter, "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerAuthentication"), CFSTR("AuthKitInvocation"));

  v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v4 = GKOSLoggers();
    v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "reportAuthenticatingWithAuthKitInvocation: Authentication requires AuthKit UI invocation", v5, 2u);
  }
}

- (void)reportAuthenticationLoginCanceled
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  +[GKReporter reporter](GKReporter, "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerAuthentication"), CFSTR("LoginCancel"));

  v3 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v4 = GKOSLoggers();
    v3 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "reportAuthenticationLoginCanceled: Account login was canceled", v5, 2u);
  }
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (NSError)authenticationError
{
  return self->_authenticationError;
}

- (void)setAuthenticationError:(id)a3
{
  self->_authenticationError = (NSError *)a3;
}

- (GKInvite)acceptedInvite
{
  return self->_acceptedInvite;
}

- (void)setAcceptedInvite:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedInvite, a3);
}

- (id)validateAccountCompletionHandler
{
  return self->_validateAccountCompletionHandler;
}

- (void)setValidateAccountCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIAlertView)currentAlert
{
  return self->_currentAlert;
}

- (void)setCurrentAlert:(id)a3
{
  self->_currentAlert = (UIAlertView *)a3;
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (BOOL)validatingAccount
{
  return self->_validatingAccount;
}

- (void)setValidatingAccount:(BOOL)a3
{
  self->_validatingAccount = a3;
}

- (BOOL)enteringForeground
{
  return self->_enteringForeground;
}

- (void)setEnteringForeground:(BOOL)a3
{
  self->_enteringForeground = a3;
}

- (int64_t)environment
{
  return self->_environment;
}

- (BOOL)isNewToGameCenter
{
  return self->_newToGameCenter;
}

- (void)setNewToGameCenter:(BOOL)a3
{
  self->_newToGameCenter = a3;
}

- (GKLocalPlayerListenerPrivate)eventEmitter
{
  return self->_eventEmitter;
}

- (double)authStartTimeStamp
{
  return self->_authStartTimeStamp;
}

- (void)setAuthStartTimeStamp:(double)a3
{
  self->_authStartTimeStamp = a3;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (BOOL)isShowingFriendRequestUI
{
  return self->_isShowingFriendRequestUI;
}

- (void)setIsShowingFriendRequestUI:(BOOL)a3
{
  self->_isShowingFriendRequestUI = a3;
}

- (unint64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(unint64_t)a3
{
  self->_authenticationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventEmitter, 0);
  objc_storeStrong(&self->_validateAccountCompletionHandler, 0);
  objc_storeStrong((id *)&self->_acceptedInvite, 0);
}

- (GKLocalPlayer)initWithCoder:(id)a3
{
  id v4;
  GKLocalPlayer *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKLocalPlayer;
  v5 = -[GKPlayer initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_authenticated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authenticated"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKLocalPlayer;
  v4 = a3;
  -[GKPlayer encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_authenticated, CFSTR("authenticated"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)registerListener:(id)listener
{
  id v4;

  -[GKLocalPlayerListenerPrivate registerListener:](self->_eventEmitter, "registerListener:", listener);
  -[GKLocalPlayer matchmaker](self, "matchmaker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredListentersChanged");

}

- (void)unregisterListener:(id)listener
{
  id v4;

  -[GKLocalPlayerListenerPrivate unregisterListener:](self->_eventEmitter, "unregisterListener:", listener);
  -[GKLocalPlayer matchmaker](self, "matchmaker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredListentersChanged");

}

- (void)unregisterAllListeners
{
  id v3;

  -[GKLocalPlayerListenerPrivate unregisterAllListeners](self->_eventEmitter, "unregisterAllListeners");
  -[GKLocalPlayer matchmaker](self, "matchmaker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registeredListentersChanged");

}

- (void)setFriendListAuthorizationStatus:(int64_t)a3 forBundleID:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setBundleID:", v8);

  objc_msgSend(v9, "setAllowFriendListAccess:", a3);
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gameService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__GKLocalPlayer_FriendsListPrivate__setFriendListAuthorizationStatus_forBundleID_handler___block_invoke;
  v13[3] = &unk_1E75B29C8;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "setPerGameSettings:handler:", v9, v13);

}

uint64_t __90__GKLocalPlayer_FriendsListPrivate__setFriendListAuthorizationStatus_forBundleID_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resetTCCAuthorization
{
  void *v2;
  id v3;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gameService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetTCCAuthorization:", &__block_literal_global_441);

}

- (void)loadFriendsAuthorizationStatus:(void *)completionHandler
{
  void (**v4)(void *, uint64_t, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  void (**v28)(void *, uint64_t, void *);
  uint8_t buf[16];

  v4 = completionHandler;
  +[GKReporter reporter](GKReporter, "reporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:type:bundleID:", CFSTR("com.apple.GameKit.PlayerProfileDashboard"), CFSTR("FriendsAPICheckAuthorizationStatusCalled"), v7);

  if (+[GKReachability _gkIsOnline](GKReachability, "_gkIsOnline"))
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFriendsSharingRestricted");

    if (v9)
    {
      +[GKReporter reporter](GKReporter, "reporter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKGame currentGame](GKGame, "currentGame");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reportEvent:type:bundleID:", CFSTR("com.apple.GameKit.PlayerProfileDashboard"), CFSTR("FriendsAPIDeveloperAccessRestricted"), v12);

      if (!os_log_GKGeneral)
        v13 = GKOSLoggers();
      v14 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusRestricted", buf, 2u);
      }
      -[GKLocalPlayer _friendsAPIRestrictedError](self, "_friendsAPIRestrictedError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 1, v15);
      goto LABEL_13;
    }
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "globalFriendListAccess");

    if ((v20 - 1) < 2)
    {
      if (!os_log_GKGeneral)
        v21 = GKOSLoggers();
      v22 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v22, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusDenied", buf, 2u);
      }
      -[GKLocalPlayer _friendsAPIDeniedError](self, "_friendsAPIDeniedError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 2, v15);
      goto LABEL_13;
    }
    if (!v20)
    {
      -[GKLocalPlayer daemonProxy](self, "daemonProxy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "gameService");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKGame currentGame](GKGame, "currentGame");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __61__GKLocalPlayer_FriendsList__loadFriendsAuthorizationStatus___block_invoke;
      v27[3] = &unk_1E75B3508;
      v27[4] = self;
      v28 = v4;
      objc_msgSend(v24, "getPerGameSettingsForBundleID:handler:", v26, v27);

      goto LABEL_14;
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v16 = GKOSLoggers();
    v17 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusNotDetermined", buf, 2u);
    }
  }
  -[GKLocalPlayer _friendsAPICommunicationsError](self, "_friendsAPICommunicationsError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v15);
LABEL_13:

LABEL_14:
}

void __61__GKLocalPlayer_FriendsList__loadFriendsAuthorizationStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[16];
  uint8_t v13[16];
  uint8_t v14[16];

  switch(objc_msgSend(a2, "allowFriendListAccess"))
  {
    case 0:
    case 3:
      if (!os_log_GKGeneral)
        v3 = GKOSLoggers();
      v4 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusNotDetermined", buf, 2u);
      }
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_18;
    case 1:
      if (!os_log_GKGeneral)
        v7 = GKOSLoggers();
      v8 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusDenied", v13, 2u);
      }
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_18;
    case 2:
      if (!os_log_GKGeneral)
        v9 = GKOSLoggers();
      v10 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "Friends API: loadFriendsAuthorizationStatus returning GKFriendsAuthorizationStatusAuthorized", v14, 2u);
      }
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_18:
      v5();
      break;
    default:
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_friendsAPICommunicationsError");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v11);

      break;
  }
}

- (void)loadFriends:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void (**v19)(id, _QWORD, uint64_t);

  v19 = completionHandler;
  +[GKReporter reporter](GKReporter, "reporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:bundleID:", CFSTR("com.apple.GameKit.PlayerProfileDashboard"), CFSTR("FriendsAPILoadFriendsListCalled"), v6);

  if (!+[GKReachability _gkIsOnline](GKReachability, "_gkIsOnline"))
    goto LABEL_10;
  -[GKLocalPlayer _gkFriendListUsageDescription](self, "_gkFriendListUsageDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    -[GKLocalPlayer _friendsAPIDescriptionMissingError](self, "_friendsAPIDescriptionMissingError");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFriendsSharingRestricted");

  if (v10)
  {
    +[GKReporter reporter](GKReporter, "reporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKGame currentGame](GKGame, "currentGame");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportEvent:type:bundleID:", CFSTR("com.apple.GameKit.PlayerProfileDashboard"), CFSTR("FriendsAPIDeveloperAccessRestricted"), v13);

    -[GKLocalPlayer _friendsAPIRestrictedError](self, "_friendsAPIRestrictedError");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v18 = (void *)v14;
    v19[2](v19, 0, v14);

    goto LABEL_12;
  }
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "globalFriendListAccess");

  if ((v17 - 1) < 2)
  {
    -[GKLocalPlayer _friendsAPIDeniedError](self, "_friendsAPIDeniedError");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v17)
  {
LABEL_10:
    -[GKLocalPlayer _friendsAPICommunicationsError](self, "_friendsAPICommunicationsError");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[GKLocalPlayer _loadFriendsListGlobalAccessOptInFlow:](self, "_loadFriendsListGlobalAccessOptInFlow:", v19);
LABEL_12:

}

- (void)loadFriendsWithIdentifiers:(NSArray *)identifiers completionHandler:(void *)completionHandler
{
  NSArray *v6;
  void *v7;
  NSArray *v8;
  id v9;
  _QWORD v10[4];
  NSArray *v11;
  id v12;

  v6 = identifiers;
  v7 = completionHandler;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__GKLocalPlayer_FriendsList__loadFriendsWithIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E75B3530;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[GKLocalPlayer loadFriends:](self, "loadFriends:", v10);

}

void __75__GKLocalPlayer_FriendsList__loadFriendsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v12, "scopedIDsArePersistent"))
          {
            objc_msgSend(v12, "gamePlayerID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

            objc_msgSend(v12, "teamPlayerID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = *(id *)(a1 + 32);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v15, "addObject:", v24);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v25;
  }

}

- (void)_loadFriendsListGlobalAccessOptInFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[GKLocalPlayer daemonProxy](self, "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gameService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__GKLocalPlayer_FriendsList___loadFriendsListGlobalAccessOptInFlow___block_invoke;
  v10[3] = &unk_1E75B3558;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v6, "getPerGameSettingsForBundleID:handler:", v8, v10);

}

void __68__GKLocalPlayer_FriendsList___loadFriendsListGlobalAccessOptInFlow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  switch(objc_msgSend(a2, "allowFriendListAccess"))
  {
    case 0:
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_loadFriendsListPerGameNotDeterminedFlow:", *(_QWORD *)(a1 + 40));
      break;
    case 1:
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_friendsAPIDeniedError");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_loadFriendsListPerGameAuthorizedFlow:", *(_QWORD *)(a1 + 40));
      break;
    default:
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_friendsAPICommunicationsError");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v5 = (id)v4;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, v4);

      break;
  }
}

- (void)_loadFriendsListPerGameNotDeterminedFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gameService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke;
  v8[3] = &unk_1E75B35A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "checkTCCAuthorization:", v8);

}

void __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id *v4;
  id v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  id v21;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_2;
    v19 = &unk_1E75B3580;
    v4 = &v21;
    v5 = *(id *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = v5;
    v6 = &v16;
    v7 = v3;
    v8 = 3;
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_3;
    v13 = &unk_1E75B3580;
    v4 = &v15;
    v9 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v6 = &v10;
    v7 = v3;
    v8 = 2;
  }
  objc_msgSend(v7, "_updatePerGameSettings:withCompletionHandler:", v8, v6, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);

}

uint64_t __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_loadFriendsListPerGameAuthorizedFlow:", *(_QWORD *)(a1 + 40));
}

void __71__GKLocalPlayer_FriendsList___loadFriendsListPerGameNotDeterminedFlow___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_friendsAPIDeniedError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

- (void)_loadFriendsListPerGameAuthorizedFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  +[GKGame currentGame](GKGame, "currentGame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLocalPlayer daemonProxy](self, "daemonProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gameService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__GKLocalPlayer_FriendsList___loadFriendsListPerGameAuthorizedFlow___block_invoke;
  v10[3] = &unk_1E75B1CF0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "getPerGameFriendsForBundleID:handler:", v6, v10);

}

void __68__GKLocalPlayer_FriendsList___loadFriendsListPerGameAuthorizedFlow___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GKPlayer *v14;
  GKPlayer *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[GKReporter reporter](GKReporter, "reporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportEvent:type:count:", CFSTR("com.apple.GameKit.PlayerProfileDashboard"), CFSTR("FriendsAPILoadFriendsListCount"), objc_msgSend(v5, "count"));

    v7 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = [GKPlayer alloc];
          v15 = -[GKPlayer initWithInternalRepresentation:](v14, "initWithInternalRepresentation:", v13, (_QWORD)v16);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_updatePerGameSettings:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3 == 3)
  {
    v6 = 2;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v6 = 1;
LABEL_5:
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKGame currentGame](GKGame, "currentGame");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__GKLocalPlayer_FriendsList___updatePerGameSettings_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E75B29C8;
    v13 = v5;
    objc_msgSend(v7, "setFriendListAuthorizationStatus:forBundleID:handler:", v6, v9, v12);

    goto LABEL_6;
  }
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v11 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[GKLocalPlayer(FriendsList) _updatePerGameSettings:withCompletionHandler:]";
    _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "%s is trying to set an invalid game settings", buf, 0xCu);
  }
LABEL_6:

}

uint64_t __75__GKLocalPlayer_FriendsList___updatePerGameSettings_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_gkFriendListUsageDescription
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSGKFriendListUsageDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_friendsAPIRestrictedError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 101, 0);
}

- (id)_friendsAPIDeniedError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 102, 0);
}

- (id)_friendsAPICommunicationsError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 3, 0);
}

- (id)_friendsAPIDescriptionMissingError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 100, 0);
}

- (void)setLastWelcomeWhatsNewCopyVersion:(unint64_t)a3
{
  void *v4;
  id v5;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:", a3);

}

- (void)setLastPrivacyNoticeVersion:(unint64_t)a3
{
  void *v4;
  id v5;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:", a3);

}

- (void)setLastPersonalizationVersion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastPersonalizationVersionDisplayedForSignedInPlayer:", v3);

}

- (void)setLastProfilePrivacyVersion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastProfilePrivacyVersionDisplayedForSignedInPlayer:", v3);

}

- (void)setLastFriendSuggestionsVersion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:", v3);

}

- (void)setLastContactsIntegrationConsentVersion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:", v3);

}

+ (void)loadHighlightsDataWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLocalPlayer.m", 1903, "+[GKLocalPlayer(DashboardHighlight) loadHighlightsDataWithCompletionHandler:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResult:", v6);

    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E75B1C80;
    v8 = v5;
    v17 = v8;
    objc_msgSend(v8, "perform:", v16);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E75B1C80;
    v9 = v8;
    v15 = v9;
    objc_msgSend(v9, "perform:", v14);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_1E75B1BF0;
    v12 = v9;
    v13 = v3;
    v10 = v9;
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v11);

  }
}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E75B1C58;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadFriendsAsPlayersWithCompletionHandler:", v6);

}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("friendBiDirectional == %@"), &unk_1E75FB010);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("friendsCount"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E75B35D0;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  +[GKDaemonProxy getActiveFriendRequestCount:](GKDaemonProxy, "getActiveFriendRequestCount:", v5);

}

uint64_t __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setError:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestsCount"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__GKLocalPlayer_DashboardHighlight__loadHighlightsDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("friendsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestsCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v7, v8);

}

- (void)setupForCloudSavedGames
{
  id v2;

  v2 = +[GKSavedGameManager sharedManager](GKSavedGameManager, "sharedManager");
}

- (void)fetchSavedGamesWithCompletionHandler:(void *)handler
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = handler;
  v4 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v5 = GKOSLoggers();
    v4 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[GKLocalPlayer(GKSavedGame) fetchSavedGamesWithCompletionHandler:].cold.1();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__GKLocalPlayer_GKSavedGame__fetchSavedGamesWithCompletionHandler___block_invoke;
  block[3] = &unk_1E75B1520;
  v8 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__GKLocalPlayer_GKSavedGame__fetchSavedGamesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  +[GKSavedGameManager sharedManager](GKSavedGameManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchSavedGamesWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

- (void)saveGameData:(NSData *)data withName:(NSString *)name completionHandler:(void *)handler
{
  NSData *v7;
  NSString *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD block[4];
  NSData *v14;
  NSString *v15;
  id v16;

  v7 = data;
  v8 = name;
  v9 = handler;
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = GKOSLoggers();
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[GKLocalPlayer(GKSavedGame) saveGameData:withName:completionHandler:].cold.1();
    if (!v7)
      goto LABEL_8;
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  if (-[NSData length](v7, "length"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__GKLocalPlayer_GKSavedGame__saveGameData_withName_completionHandler___block_invoke;
    block[3] = &unk_1E75B30F8;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v12 = v14;
LABEL_10:

    goto LABEL_11;
  }
LABEL_8:
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v9 + 2))(v9, 0, v12);
    goto LABEL_10;
  }
LABEL_11:

}

void __70__GKLocalPlayer_GKSavedGame__saveGameData_withName_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;

  +[GKSavedGameManager sharedManager](GKSavedGameManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveGameData:withName:completionHandler:", a1[4], a1[5], a1[6]);

}

- (void)deleteSavedGamesWithName:(NSString *)name completionHandler:(void *)handler
{
  NSString *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSString *v10;
  _QWORD v11[4];
  NSString *v12;
  id v13;

  v5 = name;
  v6 = handler;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[GKLocalPlayer(GKSavedGame) deleteSavedGamesWithName:completionHandler:].cold.1();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__GKLocalPlayer_GKSavedGame__deleteSavedGamesWithName_completionHandler___block_invoke;
  v11[3] = &unk_1E75B23E8;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __73__GKLocalPlayer_GKSavedGame__deleteSavedGamesWithName_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  +[GKSavedGameManager sharedManager](GKSavedGameManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteSavedGamesWithName:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)resolveConflictingSavedGames:(NSArray *)conflictingSavedGames withData:(NSData *)data completionHandler:(void *)handler
{
  NSArray *v7;
  NSData *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSData *v13;
  NSArray *v14;
  _QWORD block[4];
  NSArray *v16;
  NSData *v17;
  id v18;

  v7 = conflictingSavedGames;
  v8 = data;
  v9 = handler;
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = GKOSLoggers();
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[GKLocalPlayer(GKSavedGame) resolveConflictingSavedGames:withData:completionHandler:].cold.1();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__GKLocalPlayer_GKSavedGame__resolveConflictingSavedGames_withData_completionHandler___block_invoke;
  block[3] = &unk_1E75B30F8;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__GKLocalPlayer_GKSavedGame__resolveConflictingSavedGames_withData_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;

  +[GKSavedGameManager sharedManager](GKSavedGameManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveConflictingSavedGames:withData:completionHandler:", a1[4], a1[5], a1[6]);

}

+ (void)localPlayers
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "+[GKLocalPlayer localPlayers]";
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, a1, a3, "primary not found in %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)friends
{
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)loadFriendsWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)signOutAndOptOut:(void *)a1 completionHandler:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v3, v5, "%@:Game Center signout was invoked with no player logged in. Notifying the caller.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)signOutAndOptOut:(os_log_t)log completionHandler:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "WARNING: trying to log out a player that is not currently logged in. The correct and current local player will be logged out", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __53__GKLocalPlayer_updateLoginStatus_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, a2, a3, "error from setLoginStatus:%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)removeAllFriendsWithBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, a1, a3, "removeAllFriendsWithBlock", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __61__GKLocalPlayer__startAuthenticationForExistingPrimaryPlayer__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, a2, a3, "_authenticateUsingAlert:Failed to authenticate player with existing credentials.Error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)cancelGameInvite:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, a1, a3, "ignoring cancelled invite notification without ID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
