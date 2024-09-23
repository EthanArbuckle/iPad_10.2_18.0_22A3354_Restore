@implementation GKMatchmaker

- (GKMatchmaker)init
{
  GKMatchmaker *v2;
  GKMatchmaker *v3;
  _TtC20GameCenterFoundation22GKGroupActivityManager *v4;
  _TtC20GameCenterFoundation22GKGroupActivityManager *groupActivityManager;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *lookForInviteQueue;
  void *v17;
  uint64_t v18;
  GKDispatchGroup *compatibilityHashGroup;
  NSMutableSet *v20;
  NSMutableSet *invitedInvitees;
  NSMutableSet *v22;
  NSMutableSet *invitedShareInvitees;
  NSMutableSet *v24;
  NSMutableSet *invitedNearbyPlayers;
  NSMutableSet *v26;
  NSMutableSet *autoMatchedPlayers;
  NSMutableSet *v28;
  NSMutableSet *siblingInvitees;
  uint64_t v30;
  NSMutableDictionary *sharePlayInviteeTokensFromProgrammaticInvite;
  uint64_t v32;
  NSMutableDictionary *pendingInvitationUpdates;
  NSObject *v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *invitationQueue;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)GKMatchmaker;
  v2 = -[GKMatchmaker init](&v38, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](v2, "shouldRunGroupActivityWithDescription:", CFSTR("matchmakerInit")))
    {
      v4 = -[GKGroupActivityManager initWithMatchmakingSupport:]([_TtC20GameCenterFoundation22GKGroupActivityManager alloc], "initWithMatchmakingSupport:", v3);
      groupActivityManager = v3->_groupActivityManager;
      v3->_groupActivityManager = v4;

    }
    -[GKMatchmaker loadConnectivitySettingsWithCompletionHandler:](v3, "loadConnectivitySettingsWithCompletionHandler:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_inviteeAcceptedNotification_, CFSTR("GKInviteeAcceptedGameInvite"), v7);

    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_inviteeDeclinedNotification_, CFSTR("GKInviteeDeclinedGameInvite"), v8);

    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_inviteeUpdateNotification_, CFSTR("GKUpdateGameInviteNotification"), v9);

    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_localPlayerAcceptedGameInviteNotification_, CFSTR("GKAcceptedGameInvite"), v10);

    +[GKApplicationNotificationNames didEnterBackground](GKApplicationNotificationNames, "didEnterBackground");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_applicationDidEnterBackgroundNotification_, v11, 0);

    +[GKApplicationNotificationNames willTerminate](GKApplicationNotificationNames, "willTerminate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_applicationWillTerminateNotification_, v12, 0);

    +[GKApplicationNotificationNames willEnterForeground](GKApplicationNotificationNames, "willEnterForeground");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_applicationWillEnterForegroundNotification_, v13, 0);

    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_nearbyPlayerFound_, CFSTR("GKNearbyPlayerFoundNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_nearbyPlayerLost_, CFSTR("GKNearbyPlayerLostNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_nearbyDataReceived_, CFSTR("GKNearbyDataReceivedNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_matchRequestRecipientsSet_, CFSTR("GKSetMatchRequestRecipientsNotification"), 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("GKMatchmaker.lookForInviteQueue", v14);
    lookForInviteQueue = v3->_lookForInviteQueue;
    v3->_lookForInviteQueue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 117, "-[GKMatchmaker init]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    compatibilityHashGroup = v3->_compatibilityHashGroup;
    v3->_compatibilityHashGroup = (GKDispatchGroup *)v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    invitedInvitees = v3->_invitedInvitees;
    v3->_invitedInvitees = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    invitedShareInvitees = v3->_invitedShareInvitees;
    v3->_invitedShareInvitees = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    invitedNearbyPlayers = v3->_invitedNearbyPlayers;
    v3->_invitedNearbyPlayers = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    autoMatchedPlayers = v3->_autoMatchedPlayers;
    v3->_autoMatchedPlayers = v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    siblingInvitees = v3->_siblingInvitees;
    v3->_siblingInvitees = v28;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    sharePlayInviteeTokensFromProgrammaticInvite = v3->_sharePlayInviteeTokensFromProgrammaticInvite;
    v3->_sharePlayInviteeTokensFromProgrammaticInvite = (NSMutableDictionary *)v30;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    pendingInvitationUpdates = v3->_pendingInvitationUpdates;
    v3->_pendingInvitationUpdates = (NSMutableDictionary *)v32;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_queue_create("com.apple.GameKit.matchmaker.invitationQueue", v34);
    invitationQueue = v3->_invitationQueue;
    v3->_invitationQueue = (OS_dispatch_queue *)v35;

  }
  return v3;
}

- (void)loadConnectivitySettingsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "GKMatchmaker: loadConnectivitySettingsWithCompletionHandler", buf, 2u);
  }
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "utilityService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKViceroyNATConfiguration settingsKeys](GKViceroyNATConfiguration, "settingsKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E75B3498;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v7, "getStoreBagValuesForKeys:handler:", v8, v10);

}

void __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke_cold_1();
  }
  else
  {
    +[GKViceroyNATConfiguration applySettings:](GKViceroyNATConfiguration, "applySettings:", v5);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKMatchmaker;
  -[GKMatchmaker dealloc](&v4, sel_dealloc);
}

- (void)finishedAuthenticating
{
  NSObject *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v1, v6, "Player %@ is not authenticated, cancel matchmaking", v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)registeredListentersChanged
{
  -[GKMatchmaker updateNearbyAdvertising](self, "updateNearbyAdvertising");
  -[GKMatchmaker lookForInvite](self, "lookForInvite");
}

- (BOOL)hasInviteListener
{
  void *v3;
  void *v4;
  BOOL v5;

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventEmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "listenerRegisteredForSelector:", sel_player_didAcceptInvite_) & 1) != 0
    || self->_inviteHandler != 0;

  return v5;
}

- (BOOL)removeInvitee:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v4, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v9;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "Matchmaking removes invitee: %@", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend(v4, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (-[GKMatchmaker inviteesByUserID](self, "inviteesByUserID"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "objectForKeyedSubscript:", v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    -[GKMatchmaker inviteesByUserID](self, "inviteesByUserID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v11);
    v16 = (void *)objc_msgSend(v15, "copy");
    -[GKMatchmaker setInviteesByUserID:](self, "setInviteesByUserID:", v16);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)allInvitedInvitees
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker invitedNearbyPlayers](self, "invitedNearbyPlayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[GKMatchmaker invitedInvitees](self, "invitedInvitees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[GKMatchmaker invitedShareInvitees](self, "invitedShareInvitees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  return v3;
}

- (id)allInvitedInviteesAndInMatchRequestRecipients
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker allInvitedInvitees](self, "allInvitedInvitees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[GKMatchmaker currentMatchRequest](self, "currentMatchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[GKMatchmaker currentMatchRequest](self, "currentMatchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_gkPlayersIDsFromPlayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v12);

  }
  if (!os_log_GKGeneral)
    v13 = GKOSLoggers();
  v14 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "allInvitedInviteesAndInMatchRequestRecipients: %@", (uint8_t *)&v16, 0xCu);
  }
  return v3;
}

- (int64_t)inviteeCount
{
  void *v2;
  int64_t v3;

  -[GKMatchmaker allInvitedInviteesAndInMatchRequestRecipients](self, "allInvitedInviteesAndInMatchRequestRecipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)totalPlayerCount
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  -[GKMatchmaker match](self, "match");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKMatchmaker match](self, "match");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "players");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[GKMatchmaker match](self, "match");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 + objc_msgSend(v7, "expectedPlayerCount") + 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)reportPlayerConnectedWithPlayerID:(id)a3 forMatch:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  NSObject *v41;
  int v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v9;
    objc_msgSend(v10, "numberWithUnsignedInteger:", -[GKMatchmaker inviteApproach](self, "inviteApproach"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker invitedInvitees](self, "invitedInvitees");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker invitedShareInvitees](self, "invitedShareInvitees");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker invitedNearbyPlayers](self, "invitedNearbyPlayers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker autoMatchedPlayers](self, "autoMatchedPlayers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker siblingInvitees](self, "siblingInvitees");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138413826;
    v43 = v6;
    v44 = 2112;
    v45 = v12;
    v46 = 2112;
    v47 = v13;
    v48 = 2112;
    v49 = v14;
    v50 = 2112;
    v51 = v15;
    v52 = 2112;
    v53 = v16;
    v54 = 2112;
    v55 = v17;
    _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "reportPlayerConnectedWithPlayerID: %@, inviteApproach:%@, push: %@, msg: %@, nearby: %@, automatch: %@, indirect: %@", (uint8_t *)&v42, 0x48u);

  }
  +[GKReporter reporter](GKReporter, "reporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.allMatchSuccess"));

  -[GKMatchmaker invitedShareInvitees](self, "invitedShareInvitees");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "containsObject:", v6))
  {

LABEL_9:
    +[GKReporter reporter](GKReporter, "reporter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.messageBasedMatchSuccess"));

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "utilityService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "completeMatchRecording:matchType:", CFSTR("success"), CFSTR("message"));
    v25 = 2;
    goto LABEL_32;
  }
  if (-[GKMatchmaker inviteApproach](self, "inviteApproach") == 2)
  {
    -[GKMatchmaker inviterPlayerID](self, "inviterPlayerID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v6, "isEqualToString:", v20);

    if (v21)
      goto LABEL_9;
  }
  else
  {

  }
  -[GKMatchmaker invitedInvitees](self, "invitedInvitees");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "containsObject:", v6))
  {

LABEL_15:
    +[GKReporter reporter](GKReporter, "reporter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.pushBasedMatchSuccess"));

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "utilityService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "completeMatchRecording:matchType:", CFSTR("success"), CFSTR("push"));
    v25 = 1;
    goto LABEL_32;
  }
  if (-[GKMatchmaker inviteApproach](self, "inviteApproach") == 1)
  {
    -[GKMatchmaker inviterPlayerID](self, "inviterPlayerID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v6, "isEqualToString:", v27);

    if (v28)
      goto LABEL_15;
  }
  else
  {

  }
  -[GKMatchmaker invitedNearbyPlayers](self, "invitedNearbyPlayers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "containsObject:", v6))
  {

LABEL_21:
    +[GKReporter reporter](GKReporter, "reporter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.nearbyMatchSuccess"));

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "utilityService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "completeMatchRecording:matchType:", CFSTR("success"), CFSTR("nearby"));
    v25 = 3;
    goto LABEL_32;
  }
  if (-[GKMatchmaker inviteApproach](self, "inviteApproach") == 3)
  {
    -[GKMatchmaker inviterPlayerID](self, "inviterPlayerID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v6, "isEqualToString:", v31);

    if (v32)
      goto LABEL_21;
  }
  else
  {

  }
  -[GKMatchmaker siblingInvitees](self, "siblingInvitees");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "containsObject:", v6);

  if (v35)
  {
    +[GKReporter reporter](GKReporter, "reporter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.indirectMatchSuccess"));

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "utilityService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "completeMatchRecording:matchType:", CFSTR("success"), CFSTR("sibling"));
    v25 = 5;
  }
  else
  {
    -[GKMatchmaker autoMatchedPlayers](self, "autoMatchedPlayers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "containsObject:", v6);

    if (v38)
    {
      +[GKReporter reporter](GKReporter, "reporter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.autoMatchSuccess"));

      +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "utilityService");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "completeMatchRecording:matchType:", CFSTR("success"), CFSTR("automatch"));
      v25 = 4;
    }
    else
    {
      if (!os_log_GKGeneral)
        v40 = GKOSLoggers();
      v41 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v42 = 138412290;
        v43 = v6;
        _os_log_impl(&dword_1BCDE3000, v41, OS_LOG_TYPE_INFO, "playerID: %@, not found from any source of GKMatchmaker. It could be invitees of the automatched players.", (uint8_t *)&v42, 0xCu);
      }
      +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "utilityService");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "completeMatchRecording:matchType:", CFSTR("success"), CFSTR("unknown"));
      v25 = 0;
    }
  }
LABEL_32:

  objc_msgSend(v7, "updateJoinedPlayer:joinType:", v6, v25);
}

- (void)userCancelledMatching
{
  -[GKMatchmaker setMatching:](self, "setMatching:", 0);
}

- (void)lookForInvite
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  char v7;
  NSObject *lookForInviteQueue;
  _QWORD *v9;
  _QWORD v10[5];
  _QWORD block[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "lookForInvite", buf, 2u);
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__GKMatchmaker_lookForInvite__block_invoke;
    block[3] = &unk_1E75B1590;
    block[4] = self;
    lookForInviteQueue = MEMORY[0x1E0C80D38];
    v9 = block;
    goto LABEL_12;
  }
  if (!_GKIsRemoteUI)
  {
    if (-[GKMatchmaker hasInviteListener](self, "hasInviteListener"))
    {
      +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isAuthenticated");
      v7 = lookForInvite_lookingForInvite;

      if (v6)
      {
        if ((v7 & 1) == 0)
        {
          lookForInvite_lookingForInvite = 1;
          lookForInviteQueue = self->_lookForInviteQueue;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __29__GKMatchmaker_lookForInvite__block_invoke_2;
          v10[3] = &unk_1E75B1590;
          v10[4] = self;
          v9 = v10;
LABEL_12:
          dispatch_async(lookForInviteQueue, v9);
        }
      }
    }
  }
}

uint64_t __29__GKMatchmaker_lookForInvite__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lookForInvite");
}

void __29__GKMatchmaker_lookForInvite__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 296, "-[GKMatchmaker lookForInvite]_block_invoke_2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__GKMatchmaker_lookForInvite__block_invoke_3;
  v6[3] = &unk_1E75B1788;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "perform:", v6);
  objc_msgSend(v5, "wait");

}

void __29__GKMatchmaker_lookForInvite__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplayerService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__GKMatchmaker_lookForInvite__block_invoke_4;
  v9[3] = &unk_1E75B3CC0;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v5, "getAcceptedGameInviteWithHandler:", v9);

}

void __29__GKMatchmaker_lookForInvite__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  GKInvite *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  GKInvite *v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  GKInvite *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
    goto LABEL_5;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
  {
    __29__GKMatchmaker_lookForInvite__block_invoke_4_cold_1();
    if (v5)
      goto LABEL_6;
  }
  else
  {
LABEL_5:
    if (v5)
    {
LABEL_6:
      v8 = -[GKInvite initWithInternalRepresentation:]([GKInvite alloc], "initWithInternalRepresentation:", v5);
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  if (!os_log_GKGeneral)
    v9 = GKOSLoggers();
  v10 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v8;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "getAcceptedGameInviteWithHandler invite: %@", buf, 0xCu);
  }
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v8)
  {
    v22 = *(void **)(a1 + 32);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __29__GKMatchmaker_lookForInvite__block_invoke_78;
    v35[3] = &unk_1E75B1788;
    v23 = v11;
    v24 = *(_QWORD *)(a1 + 40);
    v36 = v23;
    v37 = v24;
    objc_msgSend(v22, "perform:", v35);
    v25 = v36;
LABEL_24:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_25;
  }
  objc_msgSend(v5, "declineReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (v14 != 5)
  {
    +[GKReporter reporter](GKReporter, "reporter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reportAuthenticateResponseDuration");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKInvite internal](v8, "internal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sessionID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[GKInvite internal](v8, "internal");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("sid"));

    }
    -[GKInvite sender](v8, "sender");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __29__GKMatchmaker_lookForInvite__block_invoke_71;
    v38[3] = &unk_1E75B3C98;
    v39 = v8;
    v33 = *(id *)(a1 + 32);
    v34 = *(_QWORD *)(a1 + 40);
    v40 = v33;
    v41 = v34;
    v42 = v12;
    v43 = v27;
    v25 = v27;
    objc_msgSend(v32, "updateScopedIDs:", v38);

    goto LABEL_24;
  }
  if (!os_log_GKGeneral)
    v15 = GKOSLoggers();
  v16 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "Found an invite declined due to incompatible transport version. Show the alert for users to upgrade.", buf, 2u);
  }
  v44[0] = CFSTR("user-id");
  objc_msgSend(v5, "peerID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v17;
  v44[1] = CFSTR("y");
  objc_msgSend(v5, "declineReason");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("GKInviteeDeclinedGameInvite"), v21, v19);

LABEL_25:
}

void __29__GKMatchmaker_lookForInvite__block_invoke_71(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  if (objc_msgSend(*(id *)(a1 + 32), "isHosted"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __29__GKMatchmaker_lookForInvite__block_invoke_2_72;
    v11[3] = &unk_1E75B2C00;
    v2 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 48);
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v2, "perform:", v11);

    v3 = v12;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "setAcceptedInvite:", *(_QWORD *)(a1 + 32));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__GKMatchmaker_lookForInvite__block_invoke_77;
    v6[3] = &unk_1E75B1AA0;
    v7 = *(id *)(a1 + 56);
    v8 = *(id *)(a1 + 64);
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 48);
    v9 = v4;
    v10 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    lookForInvite_lookingForInvite = 0;

    v3 = v7;
  }

}

void __29__GKMatchmaker_lookForInvite__block_invoke_2_72(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__GKMatchmaker_lookForInvite__block_invoke_3_73;
  v9[3] = &unk_1E75B2168;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v14 = v3;
  v8 = v3;
  objc_msgSend(v4, "respondToHostedInvite:completionHandler:", v5, v9);

}

void __29__GKMatchmaker_lookForInvite__block_invoke_3_73(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __29__GKMatchmaker_lookForInvite__block_invoke_3_73_cold_1();
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__GKMatchmaker_lookForInvite__block_invoke_4_74;
    v10[3] = &unk_1E75B1AA0;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v13 = v8;
    v14 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
  lookForInvite_lookingForInvite = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v5, v6, v7);

}

void __29__GKMatchmaker_lookForInvite__block_invoke_4_74(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GKAcceptedGameInvite"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "listenerRegisteredForSelector:", sel_player_didAcceptInvite_);

  if ((v4 & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      __29__GKMatchmaker_lookForInvite__block_invoke_4_74_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player:didAcceptInvite:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 56), "inviteHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "inviteHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, *(_QWORD *)(a1 + 48), 0);

  }
}

void __29__GKMatchmaker_lookForInvite__block_invoke_77(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GKAcceptedGameInvite"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "listenerRegisteredForSelector:", sel_player_didAcceptInvite_);

  if ((v4 & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      __29__GKMatchmaker_lookForInvite__block_invoke_4_74_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player:didAcceptInvite:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 56), "inviteHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "inviteHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, *(_QWORD *)(a1 + 48), 0);

  }
}

void __29__GKMatchmaker_lookForInvite__block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplayerService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__GKMatchmaker_lookForInvite__block_invoke_2_79;
  v9[3] = &unk_1E75B2C78;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v5, "getPlayersToInviteWithHandlerV2:", v9);

}

void __29__GKMatchmaker_lookForInvite__block_invoke_2_79(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "_gkPlayersFromInternals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkPlayersIDsFromPlayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "got players to invite: %@", buf, 0xCu);
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("GKPlayersToInviteNotification"), *(_QWORD *)(a1 + 32), 0);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __29__GKMatchmaker_lookForInvite__block_invoke_80;
    v13[3] = &unk_1E75B1AA0;
    v14 = *(id *)(a1 + 32);
    v15 = v3;
    v11 = v4;
    v12 = *(_QWORD *)(a1 + 40);
    v16 = v11;
    v17 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
  lookForInvite_lookingForInvite = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7, v8, v9);

}

void __29__GKMatchmaker_lookForInvite__block_invoke_80(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "listenerRegisteredForSelector:", sel_player_didRequestMatchWithRecipients_))
  {
    if ((objc_msgSend(v2, "listenerRegisteredForSelector:", sel_player_didRequestMatchWithRecipients_) & 1) == 0)
    {
      if (!os_log_GKGeneral)
        v3 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        __29__GKMatchmaker_lookForInvite__block_invoke_80_cold_2();
    }
    objc_msgSend(v2, "player:didRequestMatchWithRecipients:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v2, "listenerRegisteredForSelector:", sel_player_didRequestMatchWithPlayers_))
    {
      if (!os_log_GKGeneral)
        v4 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        __29__GKMatchmaker_lookForInvite__block_invoke_80_cold_1();
    }
  }
  else if (objc_msgSend(v2, "listenerRegisteredForSelector:", sel_player_didRequestMatchWithPlayers_))
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      if (!os_log_GKGeneral)
        v5 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        __29__GKMatchmaker_lookForInvite__block_invoke_80_cold_3();
    }
    else
    {
      objc_msgSend(v2, "player:didRequestMatchWithPlayers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "inviteHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = GKApplicationLinkedOnOrAfter();
    objc_msgSend(*(id *)(a1 + 56), "inviteHandler");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
    if (v7)
    {
      v11[0] = CFSTR("playerID is no longer available");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v10);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, *(_QWORD *)(a1 + 48));
    }

  }
}

- (BOOL)shouldRunGroupActivityWithDescription:(id)a3
{
  id v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess");
  if (v4)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Will not do: %@, for Game Center internal processes.", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = (void *)os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)MEMORY[0x1E0CB3978];
      v10 = v8;
      objc_msgSend(v9, "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "%@, callStacK: %@", (uint8_t *)&v13, 0x16u);

    }
  }

  return v4 ^ 1;
}

- (BOOL)isEligibleForGroupSession
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("isEligibleForGroupSession"));
  if (v3)
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEligibleForGroupSession");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isEntitledToUseGroupActivities
{
  if (_os_feature_enabled_impl())
    return +[GKEntitledContextProvider hasBooleanPublicGameCenterEntitlement](GKEntitledContextProvider, "hasBooleanPublicGameCenterEntitlement");
  else
    return +[GKEntitledContextProvider hasPublicGroupActivitiesEntitlement](GKEntitledContextProvider, "hasPublicGroupActivitiesEntitlement");
}

- (void)activateGroupActivityWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("activateGroupActivity")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKGame currentGame](GKGame, "currentGame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__GKMatchmaker_activateGroupActivityWithHandler___block_invoke;
    v7[3] = &unk_1E75B29C8;
    v8 = v4;
    objc_msgSend(v5, "activateWithGame:completionHandler:", v6, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __49__GKMatchmaker_activateGroupActivityWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void)changeGroupActivityStateToGameStarted
{
  id v3;

  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("changeGroupActivityStateToGameStarted")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startGame");

  }
}

- (void)endGroupActivity
{
  id v3;

  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("endGroupActivity")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endWithCompletionHandler:", &__block_literal_global_26);

  }
}

void __32__GKMatchmaker_endGroupActivity__block_invoke()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  if (!os_log_GKGeneral)
    v0 = GKOSLoggers();
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_INFO, "endGroupActivity completed.", v2, 2u);
  }
}

- (void)playerDisconnected:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("playerDisconnected")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerDisconnectWithPlayer:completionHandler:", v5, &__block_literal_global_109);

  }
}

void __35__GKMatchmaker_playerDisconnected___block_invoke()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  if (!os_log_GKGeneral)
    v0 = GKOSLoggers();
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_INFO, "playerDisconnected completed.", v2, 2u);
  }
}

- (id)sharingControllerItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v8;

  -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "sharingControllerItemProviderWithGame:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker sharingControllerItemProvider].cold.1();
  }

  return v4;
}

- (void)leaveGroupActivity
{
  id v3;

  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("leaveGroupActivity")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leaveWithCompletionHandler:", &__block_literal_global_112);

  }
}

void __34__GKMatchmaker_leaveGroupActivity__block_invoke()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  if (!os_log_GKGeneral)
    v0 = GKOSLoggers();
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_INFO, "leaveGroupActivity completed", v2, 2u);
  }
}

- (void)resetGroupActivity
{
  id v3;

  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("resetGroupActivity")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetWithCompletionHandler:", &__block_literal_global_115);

  }
}

void __34__GKMatchmaker_resetGroupActivity__block_invoke()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  if (!os_log_GKGeneral)
    v0 = GKOSLoggers();
  v1 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_INFO, "resetGroupActivity completed.", v2, 2u);
  }
}

- (void)sendGroupActivityInviteTo:(id)a3 participantID:(id)a4 pushToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("groupActivityInvitePlayer")))
  {
    v13[0] = CFSTR("player");
    v13[1] = CFSTR("pushToken");
    v14[0] = v8;
    v14[1] = v10;
    v13[2] = CFSTR("participantIdentifier");
    v14[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("GKGroupActivityPlayerToInviteNotification"), 0, v11);

  }
}

- (void)lookForGroupActivities
{
  id v3;

  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("lookForGroupActivities")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startLookingForSessions");

  }
}

- (void)showSharePlayMatchDeclinedToJoinAlertWithReason:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  NSObject *v13;
  id v14;
  SEL v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  id v25;
  uint8_t v26[16];
  uint8_t buf[16];
  uint8_t v28[2];
  __int16 v29;
  uint8_t v30[2];
  __int16 v31;

  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("showSharePlayMatchDeclinedToJoinAlertWithReason")))
  {
    +[GCFLocalizedStrings SHAREPLAY_DECLINE_UNKNOWN](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHAREPLAY_DECLINE_UNKNOWN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GCFLocalizedStrings SHAREPLAY_DECLINE_UNKNOWN_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHAREPLAY_DECLINE_UNKNOWN_MESSAGE");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a3)
    {
      case 1:
        +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_IS_FULL](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHAREPLAY_DECLINE_GAME_IS_FULL");
        v6 = objc_claimAutoreleasedReturnValue();

        +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_IS_FULL_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHAREPLAY_DECLINE_GAME_IS_FULL_MESSAGE");
        v7 = objc_claimAutoreleasedReturnValue();

        if (!os_log_GKGeneral)
          v8 = GKOSLoggers();
        v9 = os_log_GKTrace;
        if (!os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        v31 = 0;
        v10 = "showSharePlayMatchFullAlert";
        v11 = (uint8_t *)&v31;
        goto LABEL_16;
      case 2:
        +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_HAS_STARTED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHAREPLAY_DECLINE_GAME_HAS_STARTED");
        v6 = objc_claimAutoreleasedReturnValue();

        +[GCFLocalizedStrings SHAREPLAY_DECLINE_GAME_HAS_STARTED_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHAREPLAY_DECLINE_GAME_HAS_STARTED_MESSAGE");
        v7 = objc_claimAutoreleasedReturnValue();

        if (!os_log_GKGeneral)
          v14 = GKOSLoggers();
        v9 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          v10 = "showSharePlayGameHasStartedAlert";
          v11 = v30;
LABEL_16:
          _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
        }
        goto LABEL_17;
      case 3:
        if (!os_log_GKGeneral)
          v21 = GKOSLoggers();
        v22 = os_log_GKMatch;
        if (!os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          break;
        v29 = 0;
        v23 = "Previously joined. Sorry but you cannot join at this time since you have previously joined this session. P"
              "lease try in the next session.";
        v24 = (uint8_t *)&v29;
        goto LABEL_32;
      case 4:
        if (!os_log_GKGeneral)
          v25 = GKOSLoggers();
        v22 = os_log_GKMatch;
        if (!os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          break;
        *(_WORD *)v28 = 0;
        v23 = "Game over. Sorry but you cannot join at this time since this game is over. Please try in the next session.";
        v24 = v28;
LABEL_32:
        _os_log_impl(&dword_1BCDE3000, v22, OS_LOG_TYPE_INFO, v23, v24, 2u);
        break;
      default:
        if (!os_log_GKGeneral)
          v12 = GKOSLoggers();
        v13 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "showSharePlayUnknownAlert", buf, 2u);
        }
        v7 = (uint64_t)v5;
        v6 = (uint64_t)v4;
LABEL_17:
        v15 = NSSelectorFromString(CFSTR("showAlertWithTitle:andMessage:"));
        +[GKLocalPlayer local](GKLocalPlayer, "local");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_opt_respondsToSelector();

        if ((v17 & 1) != 0)
        {
          +[GKLocalPlayer local](GKLocalPlayer, "local");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_gkPerformSelector:withObject:withObject:", v15, v6, v7);

        }
        else
        {
          if (!os_log_GKGeneral)
            v19 = GKOSLoggers();
          v20 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "showSharePlayMatchFullAlert failed since localPlayer does not respond to selector showAlertWithTitle:andMessage:", v26, 2u);
          }
        }
        v5 = (void *)v7;
        v4 = (void *)v6;
        break;
    }

  }
}

- (void)setInviteHandler:(void *)inviteHandler
{
  void *v4;
  id v5;

  if (self->_inviteHandler != inviteHandler)
  {
    v4 = (void *)objc_msgSend(inviteHandler, "copy");
    v5 = self->_inviteHandler;
    self->_inviteHandler = v4;

    -[GKMatchmaker updateNearbyAdvertising](self, "updateNearbyAdvertising");
    -[GKMatchmaker lookForInvite](self, "lookForInvite");
  }
}

- (void)respondToHostedInvite:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  GKTransportContext *v11;
  void *v12;
  void *v13;
  void *v14;
  GKTransportContext *v15;
  uint64_t v16;
  id v17;
  GKTransportContext *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  GKTransportContext *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Matchmaking respond to hosted invite: %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 628, "-[GKMatchmaker respondToHostedInvite:completionHandler:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [GKTransportContext alloc];
  +[GKGame currentGame](GKGame, "currentGame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "supportedTransports");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GKTransportContext initWithSupportedTransports:](v11, "initWithSupportedTransports:", v14);

  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke;
  v23[3] = &unk_1E75B1800;
  v17 = v5;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  v19 = v10;
  v26 = v19;
  objc_msgSend(v19, "perform:", v23);
  if (v6)
  {
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_132;
    v20[3] = &unk_1E75B1BF0;
    v22 = v6;
    v21 = v19;
    objc_msgSend(v21, "notifyOnMainQueueWithBlock:", v20);

  }
}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplayerService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2;
  v9[3] = &unk_1E75B3D68;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v12 = v3;
  v8 = v3;
  objc_msgSend(v5, "acceptGameInvite:transportContext:handler:", v6, v7, v9);

}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2_cold_1();
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAcceptedInvite:", 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_132(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)newMatch
{
  return -[GKMatch initWithMatchmaker:]([GKMatch alloc], "initWithMatchmaker:", self);
}

- (void)matchForNearbyInvite:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  GKMatchmaker *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[GKMatchmaker setInviteApproach:](self, "setInviteApproach:", 3);
  objc_msgSend(v6, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker setInviterPlayerID:](self, "setInviterPlayerID:", v10);

  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Match for nearby invite: %@", buf, 0xCu);
  }
  v13 = -[GKMatchmaker newMatch](self, "newMatch");
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "multiplayerService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke;
  v19[3] = &unk_1E75B3D90;
  v20 = v13;
  v21 = self;
  v22 = v6;
  v23 = v7;
  v16 = v7;
  v17 = v6;
  v18 = v13;
  objc_msgSend(v15, "fetchTransportOverrideWithHandler:", v19);

}

void __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a1[4];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "transportContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithForceEnabledTransports:andForceDisabledTransports:", v7, v6);

  objc_msgSend(a1[4], "nearbyConnectionData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "acceptNearbyInvite:connectionData:", a1[6], v9);
  v10 = a1[4];
  objc_msgSend(a1[6], "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "peerBlob");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connectToNearbyPlayer:withConnectionData:", v11, v13);

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAcceptedInvite:", 0);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke_2;
  v15[3] = &unk_1E75B1BF0;
  v17 = a1[7];
  v16 = a1[4];
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

uint64_t __45__GKMatchmaker_matchForNearbyInvite_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

- (void)matchForRemoteInvite:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  id v23;
  NSObject *v24;
  dispatch_queue_t v25;
  dispatch_semaphore_t v26;
  NSObject *v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  dispatch_queue_t v37;
  GKMatchmaker *v38;
  dispatch_semaphore_t v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker setInviterPlayerID:](self, "setInviterPlayerID:", v10);

  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = (id)os_log_GKMatch;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isNearbyInvite");
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" nearby"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = &stru_1E75BB5A8;
    }
    *(_DWORD *)buf = 138412546;
    v43 = v15;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Match for remote%@ invite: %@", buf, 0x16u);
    if (v14)

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 687, "-[GKMatchmaker matchForRemoteInvite:completionHandler:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v18, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("com.apple.GameKit.matchmaker.remote.%@"), v20);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = (const char *)objc_msgSend(v21, "UTF8String");

  if (!os_log_GKGeneral)
    v23 = GKOSLoggers();
  v24 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v43 = (void *)v22;
    _os_log_impl(&dword_1BCDE3000, v24, OS_LOG_TYPE_INFO, "Created an invitee inner queue with label: %s", buf, 0xCu);
  }
  v25 = dispatch_queue_create(v22, 0);
  v26 = dispatch_semaphore_create(0);
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke;
  block[3] = &unk_1E75B3E58;
  v35 = v18;
  v36 = v17;
  v37 = v25;
  v38 = self;
  v39 = v26;
  v40 = v6;
  v41 = v7;
  v28 = v7;
  v29 = v6;
  v30 = v26;
  v31 = v25;
  v32 = v17;
  v33 = v18;
  dispatch_async(v27, block);

}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  _QWORD block[5];
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v6;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "Entering invitee queue with inner UUID: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "enter");
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_142;
  block[3] = &unk_1E75B1A78;
  v8 = *(NSObject **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 56);
  v43 = *(id *)(a1 + 40);
  v44 = *(id *)(a1 + 64);
  dispatch_async(v8, block);
  objc_msgSend(*(id *)(a1 + 40), "enter");
  v9 = *(NSObject **)(a1 + 48);
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_143;
  v37[3] = &unk_1E75B1AA0;
  v38 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 56);
  v39 = v10;
  v40 = v11;
  v41 = *(id *)(a1 + 72);
  dispatch_async(v9, v37);
  objc_msgSend(*(id *)(a1 + 40), "enter");
  v12 = *(NSObject **)(a1 + 48);
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_151;
  v33[3] = &unk_1E75B1A78;
  v34 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 56);
  v35 = v13;
  v36 = v14;
  dispatch_async(v12, v33);
  objc_msgSend(*(id *)(a1 + 40), "enter");
  v15 = *(NSObject **)(a1 + 48);
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_157;
  v28[3] = &unk_1E75B1AA0;
  v29 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 56);
  v31 = v16;
  v32 = v17;
  dispatch_async(v15, v28);
  if (objc_msgSend(*(id *)(a1 + 40), "waitWithTimeout:", 60.0))
  {
    if (!os_log_GKGeneral)
      v18 = GKOSLoggers();
    v19 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "Timeout handling matchForRemoteInvite.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 28, CFSTR("Connection timeout."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setError:", v20);

  }
  else
  {
    if (!os_log_GKGeneral)
      v21 = GKOSLoggers();
    v22 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v22, OS_LOG_TYPE_INFO, "Done handling matchForRemoteInvite.", buf, 2u);
    }
  }
  v23 = *(void **)(a1 + 80);
  if (v23)
  {
    v24 = *(void **)(a1 + 40);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_167;
    v25[3] = &unk_1E75B1BF0;
    v27 = v23;
    v26 = *(id *)(a1 + 40);
    objc_msgSend(v24, "notifyOnMainQueueWithBlock:", v25);

  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_142(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2;
  v3[3] = &unk_1E75B3800;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "loadConnectivitySettingsWithCompletionHandler:", v3);

}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "leave");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_143(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "leave");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "match");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "newMatch");
      objc_msgSend(*(id *)(a1 + 48), "setMatch:", v4);

    }
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "multiplayerService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_144;
    v8[3] = &unk_1E75B3DB8;
    v7 = *(void **)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 48);
    v9 = v7;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v6, "fetchTransportOverrideWithHandler:", v8);

  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_144(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = (id *)(a1 + 32);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "match");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transportContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateWithForceEnabledTransports:andForceDisabledTransports:", v8, v7);

  objc_msgSend(*v5, "match");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transportContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "supportsTransportRequiredInTheInvite:", v13);

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "leave");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  else
  {
    if (!os_log_GKGeneral)
      v15 = GKOSLoggers();
    v16 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_144_cold_2((void **)(a1 + 40), v16, v5);
    if (!os_log_GKGeneral)
      v17 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_144_cold_1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 28, CFSTR("The Game Center entitlement is required to use multiplayer."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setError:", v18);

    +[GKAPIReporter reporter](GKAPIReporter, "reporter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recordMultiplayerErrorID:", CFSTR("remoteInviteTransportNotSupported"));

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "multiplayerService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "internal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_150;
    v23[3] = &unk_1E75B1A28;
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 56);
    objc_msgSend(v21, "declineGameInvite:reason:handler:", v22, 6, v23);

  }
}

intptr_t __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_150(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "leave");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_151(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "leave");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "match");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_3;
    v6[3] = &unk_1E75B3DE0;
    v5 = *(int8x16_t *)(a1 + 40);
    v4 = (id)v5.i64[0];
    v7 = vextq_s8(v5, v5, 8uLL);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v3, "getLocalConnectionDataWithCompletionHandler:", v6);

  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "match");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject transportContext](v8, "transportContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateForInviteAcceptWithConnectionData:", v5);
LABEL_4:

    goto LABEL_11;
  }
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("match:getLocalConnectionDataWithCompletionHandler returned with no data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userErrorForCode:userInfo:", 3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setError:", v12);

  }
  if (!os_log_GKGeneral)
    v13 = GKOSLoggers();
  v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
  {
    if (v5)
      v15 = &stru_1E75BB5A8;
    else
      v15 = CFSTR("(empty data returned)");
    v16 = *(void **)(a1 + 32);
    v8 = v14;
    objc_msgSend(v16, "match");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v15;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v17;
    _os_log_error_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_ERROR, "Error getting local connection data %@for match %@, error: %@", (uint8_t *)&v18, 0x20u);

    goto LABEL_4;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 40), "leave");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_157(uint64_t a1)
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
  id v12;
  int8x16_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int8x16_t v17;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "leave");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "internal");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "match");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "sender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preLoadInviter:sessionToken:", v6, v4);

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiplayerService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "match");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transportContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_158;
    v14[3] = &unk_1E75B3E30;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    v13 = *(int8x16_t *)(a1 + 48);
    v12 = (id)v13.i64[0];
    v17 = vextq_s8(v13, v13, 8uLL);
    objc_msgSend(v8, "acceptGameInvite:transportContext:handler:", v9, v11, v14);

  }
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_158(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
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
  BOOL v27;
  uint64_t v28;
  __CFString **v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint8_t buf[4];
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_FAULT))
      __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_158_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v7);
    objc_msgSend(*(id *)(a1 + 32), "leave");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v5, "responsePlist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "match");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("match"));

    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAcceptedInvite:", 0);

    if (objc_msgSend(*(id *)(a1 + 56), "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!os_log_GKGeneral)
        v13 = GKOSLoggers();
      v14 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        objc_msgSend(v5, "responsePlist");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v16;
        _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "Invite accept response: %@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 48), "match");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "playerPushTokens");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "internal");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "peerPushToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "internal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "peerID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v20, v22);

      +[GKReporter reporter](GKReporter, "reporter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.allMatchTotal"));

      objc_msgSend(*(id *)(a1 + 56), "internal");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v24, "isMessageBasedInvite");

      +[GKReporter reporter](GKReporter, "reporter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = (_DWORD)v19 == 0;
      if ((_DWORD)v19)
        v28 = 2;
      else
        v28 = 1;
      v29 = GKRTMessageBasedMatchTotal;
      if (v27)
        v29 = GKRTPushBasedMatchTotal;
      objc_msgSend(v25, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), *v29);

      objc_msgSend(*(id *)(a1 + 48), "setInviteApproach:", v28);
      objc_msgSend(*(id *)(a1 + 48), "match");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "transportContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "updateAfterAcceptingRemoveInvite:acceptedResponse:", *(_QWORD *)(a1 + 56), v5);

      objc_msgSend(*(id *)(a1 + 48), "pendingInvitationUpdates");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "match");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "transportContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sessionID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        if (!os_log_GKGeneral)
          v37 = GKOSLoggers();
        v38 = os_log_GKFastSync;
        if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v36;
          _os_log_impl(&dword_1BCDE3000, v38, OS_LOG_TYPE_INFO, "Has previous queued update: %@", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 48), "match");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "transportContext");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "updateWithInviteUpdateInfo:", v36);

        objc_msgSend(*(id *)(a1 + 48), "pendingInvitationUpdates");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "match");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "transportContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "sessionID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "removeObjectForKey:", v44);

      }
      if (!os_log_GKGeneral)
        v45 = GKOSLoggers();
      v46 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v47 = *(void **)(a1 + 48);
        v48 = v46;
        objc_msgSend(v47, "match");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "transportContext");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "peerDictionaries");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "firstObject");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v52;
        _os_log_impl(&dword_1BCDE3000, v48, OS_LOG_TYPE_INFO, "Accepting peer's connectionData : %@", buf, 0xCu);

      }
      if (!os_log_GKGeneral)
        v53 = GKOSLoggers();
      v54 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v54, OS_LOG_TYPE_INFO, "Accepted match for remote invite, starting connection...", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 48), "match");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "transportContext");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "inviteeShouldAwaitInviteUpdate");

      if ((v57 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "match");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "sender");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "updateEventQueueForInviter:", v59);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "enter");
        objc_msgSend(*(id *)(a1 + 48), "match");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "sender");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v61;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "internal");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "version");
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_161;
        v68[3] = &unk_1E75B3E08;
        v69 = *(id *)(a1 + 32);
        v65 = v9;
        v66 = *(_QWORD *)(a1 + 48);
        v67 = *(void **)(a1 + 56);
        v70 = v65;
        v71 = v66;
        v72 = v67;
        objc_msgSend(v60, "connectToPlayers:version:invitedByLocalPlayer:completionHandler:", v62, v64, 0, v68);

        v58 = v69;
      }

      v7 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "leave");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  }
}

uint64_t __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_161(id *a1, uint64_t a2)
{
  void *v3;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 28, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setError:", v3);
  }
  else
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "preemptiveRelay");

    if (!v6)
      return objc_msgSend(a1[4], "leave");
    objc_msgSend(a1[5], "objectForKey:", CFSTR("relay-type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Using preemptive relay, relay-type from response %@", (uint8_t *)&v14, 0xCu);
    }
    if (v3)
    {
      if (!os_log_GKGeneral)
        v9 = GKOSLoggers();
      v10 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "preemptive relay accept response", (uint8_t *)&v14, 2u);
      }
      objc_msgSend(a1[6], "match");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = a1[5];
      objc_msgSend(a1[7], "sender");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "acceptRelayResponse:player:", v12, v13);

    }
  }

  return objc_msgSend(a1[4], "leave");
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_167(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("match"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)matchForInvite:(GKInvite *)invite completionHandler:(void *)completionHandler
{
  GKInvite *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  id v18;
  void *v19;
  void *v20;
  GKInvite *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  GKInvite *v26;
  id v27;
  _QWORD v28[5];
  GKInvite *v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = invite;
  v7 = completionHandler;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    -[GKMatchmaker matchForInvite:completionHandler:].cold.3((uint64_t)v6, v9);
  +[GKReporter reporter](GKReporter, "reporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordProgramaticInviteTimestamp");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 895, "-[GKMatchmaker matchForInvite:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!-[GKInvite isCancelled](v6, "isCancelled"))
    {
      if (-[GKInvite isNearby](v6, "isNearby"))
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke;
        v28[3] = &unk_1E75B1800;
        v28[4] = self;
        v29 = v6;
        v30 = v12;
        objc_msgSend(v30, "perform:", v28);

        v21 = v29;
      }
      else
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_3;
        v25[3] = &unk_1E75B1800;
        v25[4] = self;
        v26 = v6;
        v27 = v12;
        objc_msgSend(v27, "perform:", v25);

        v21 = v26;
      }

      if (v7)
        goto LABEL_18;
      goto LABEL_19;
    }
    if (!os_log_GKGeneral)
      v13 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatchmaker matchForInvite:completionHandler:].cold.2();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = CFSTR("matchForInvite:invite was cancelled");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v32;
    v17 = &v31;
  }
  else
  {
    if (!os_log_GKGeneral)
      v18 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatchmaker matchForInvite:completionHandler:].cold.1();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("matchForInvite:invite doesn't exist");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v34;
    v17 = &v33;
  }
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userErrorForCode:userInfo:", 2, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setError:", v20);

  if (v7)
  {
LABEL_18:
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_5;
    v22[3] = &unk_1E75B1BF0;
    v24 = v7;
    v23 = v12;
    objc_msgSend(v23, "notifyOnMainQueueWithBlock:", v22);

  }
LABEL_19:

}

void __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_2;
  v7[3] = &unk_1E75B3E80;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "matchForNearbyInvite:handler:", v5, v7);

}

uint64_t __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("match"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_4;
  v7[3] = &unk_1E75B3E80;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "matchForRemoteInvite:completionHandler:", v5, v7);

}

uint64_t __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("match"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __49__GKMatchmaker_matchForInvite_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("match"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)reportResponse:(int64_t)a3 forInvitees:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  id v22;
  GKMatchmaker *v23;
  int64_t v24;
  _QWORD block[4];
  id v26;
  GKMatchmaker *v27;
  void (**v28)(_QWORD);
  int64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = v11;
    objc_msgSend(v12, "numberWithLong:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v14;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "Matchmaking reports response: %@  for invitees:%@", buf, 0x16u);

  }
  if (self->_recipientResponseHandler)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke;
    block[3] = &unk_1E75B3EA8;
    v26 = v8;
    v27 = self;
    v29 = a3;
    v28 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (!self->_inviteeResponseHandler)
    {
      if (!os_log_GKGeneral)
        v18 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      {
        -[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:].cold.1();
        if (!v9)
          goto LABEL_14;
      }
      else if (!v9)
      {
        goto LABEL_14;
      }
      v9[2](v9);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 948, "-[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E75B2E50;
    v22 = v8;
    v23 = self;
    v24 = a3;
    objc_msgSend(v16, "perform:", v21);
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_4;
    v19[3] = &unk_1E75B1520;
    v20 = v9;
    objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v19);

  }
LABEL_14:

}

uint64_t __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "recipientResponseHandler", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 40), "recipientResponseHandler");
          v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v9[2](v9, v7, *(_QWORD *)(a1 + 56));

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E75B3EA8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "inviteeResponseHandler", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 40), "inviteeResponseHandler");
          v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "internal");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "playerID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v11, *(_QWORD *)(a1 + 56));

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __65__GKMatchmaker_reportResponse_forInvitees_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invitePlayersWithRequest:(id)a3 serverHosted:(BOOL)a4 onlineConnectionData:(id)a5 devicePushTokenMap:(id)a6 isNearbyInvite:(BOOL)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _BOOL4 v47;
  _BOOL4 v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  BOOL v53;
  BOOL v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v47 = a4;
  v48 = a7;
  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  if (!os_log_GKGeneral)
    v16 = GKOSLoggers();
  v17 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = v17;
    objc_msgSend(v18, "numberWithBool:", v47);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v48);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v57 = v12;
    v58 = 2112;
    v59 = v20;
    v60 = 2112;
    v61 = v21;
    _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "Invite players with request: %@, hosted: %@, nearby: %@", buf, 0x20u);

  }
  -[GKMatchmaker sharePlayInviteeTokensFromProgrammaticInvite](self, "sharePlayInviteeTokensFromProgrammaticInvite");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (!v23)
  {
    objc_msgSend(v12, "internal");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setArchivedSharePlayInviteeTokensFromProgrammaticInvite:", 0);
    goto LABEL_19;
  }
  if (!os_log_GKGeneral)
    v24 = GKOSLoggers();
  v25 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    v27 = v25;
    -[GKMatchmaker sharePlayInviteeTokensFromProgrammaticInvite](self, "sharePlayInviteeTokensFromProgrammaticInvite");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v57 = v29;
    _os_log_impl(&dword_1BCDE3000, v27, OS_LOG_TYPE_INFO, "There seems to be some invitees coming from SharePlay. Adding (%@) device push token(s).", buf, 0xCu);

  }
  v30 = (void *)MEMORY[0x1E0CB36F8];
  -[GKMatchmaker sharePlayInviteeTokensFromProgrammaticInvite](self, "sharePlayInviteeTokensFromProgrammaticInvite");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v30, "archivedDataWithRootObject:requiringSecureCoding:error:", v31, 1, &v55);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v55;

  if (v32)
  {
    objc_msgSend(v12, "internal");
    v34 = objc_claimAutoreleasedReturnValue();
    -[NSObject setArchivedSharePlayInviteeTokensFromProgrammaticInvite:](v34, "setArchivedSharePlayInviteeTokensFromProgrammaticInvite:", v32);
  }
  else
  {
    if (!os_log_GKGeneral)
      v35 = GKOSLoggers();
    v36 = (void *)os_log_GKMatch;
    if (!os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    v34 = v36;
    -[GKMatchmaker sharePlayInviteeTokensFromProgrammaticInvite](self, "sharePlayInviteeTokensFromProgrammaticInvite");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v57 = v37;
    v58 = 2112;
    v59 = v33;
    _os_log_impl(&dword_1BCDE3000, v34, OS_LOG_TYPE_INFO, "failed to archive shareplay invitees from programmatic invite. players: %@ error: %@", buf, 0x16u);

  }
LABEL_18:

LABEL_19:
  -[GKMatchmaker match](self, "match");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    v39 = -[GKMatchmaker newMatch](self, "newMatch");
    -[GKMatchmaker setMatch:](self, "setMatch:", v39);

  }
  -[GKMatchmaker match](self, "match");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "transportContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "updateForInviteInitiationWithOnlineConnectionData:", v13);

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "multiplayerService");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke;
  v49[3] = &unk_1E75B3F98;
  v49[4] = self;
  v50 = v12;
  v53 = v48;
  v54 = v47;
  v51 = v14;
  v52 = v15;
  v44 = v15;
  v45 = v14;
  v46 = v12;
  objc_msgSend(v43, "fetchTransportOverrideWithHandler:", v49);

}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  char v21;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transportContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithForceEnabledTransports:andForceDisabledTransports:", v7, v6);

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multiplayerService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(unsigned __int8 *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "match");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transportContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2;
  v18[3] = &unk_1E75B3F70;
  v17 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_BYTE *)(a1 + 65);
  v18[1] = 3221225472;
  v19 = v17;
  v20 = *(id *)(a1 + 56);
  objc_msgSend(v11, "invitePlayersForMatchRequest:devicePushTokenMap:isNearbyInvite:transportContext:handler:", v12, v13, v14, v16, v18);

}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_cold_1();
  }
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__7;
  v39[4] = __Block_byref_object_dispose__7;
  v8 = v6;
  v40 = v8;
  objc_msgSend(*(id *)(a1 + 32), "match");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "approachUsed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");
  v12 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recipients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportInviteSentWithApproach:isHosted:recipients:", v11, v12 != 0, v14);

  objc_msgSend(*(id *)(a1 + 32), "match");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transportContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateWithInviteInitiateResponse:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 1025, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:]_block_invoke");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "match");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transportContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "allowEarlyConnection");

    if (v22)
    {
      v35[0] = v19;
      v35[1] = 3221225472;
      v35[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_174;
      v35[3] = &unk_1E75B3EF8;
      v35[4] = *(_QWORD *)(a1 + 32);
      v36 = v8;
      v38 = v39;
      v37 = v18;
      objc_msgSend(v37, "perform:", v35);

    }
  }
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_175;
  v28[3] = &unk_1E75B3F48;
  v23 = v18;
  v29 = v23;
  v24 = *(id *)(a1 + 48);
  v25 = *(_QWORD *)(a1 + 32);
  v33 = v24;
  v30 = v25;
  v26 = v5;
  v31 = v26;
  v34 = v39;
  v27 = v8;
  v32 = v27;
  objc_msgSend(v23, "notifyOnMainQueueWithBlock:", v28);

  _Block_object_dispose(v39, 8);
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "match");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3;
  v9[3] = &unk_1E75B3ED0;
  v5 = *(id *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v13 = v6;
  v11 = v7;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v4, "connectToPlayers:version:invitedByLocalPlayer:completionHandler:", MEMORY[0x1E0C9AA60], 1, 0, v9);

}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_cold_1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 28, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_175(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *log;
  os_log_t loga;
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "error"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isGKCompoundError"),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    v38 = *(_QWORD *)(a1 + 64);
    if (v38)
    {
      objc_msgSend(*(id *)(a1 + 40), "match");
      loga = (os_log_t)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "error");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, os_log_t, _QWORD, void *))(v38 + 16))(v38, 0, loga, 0, v39);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "invitedUserIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v50;
      v40 = v6;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v11);
          objc_msgSend(*(id *)(a1 + 48), "invitedUserIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "integerValue");

          if (v15)
          {
            objc_msgSend(*(id *)(a1 + 40), "inviteesByUserID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              if (!os_log_GKGeneral)
                v18 = GKOSLoggers();
              v19 = (void *)os_log_GKMatch;
              if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
              {
                log = v19;
                objc_msgSend(v17, "internal");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "conciseDescription");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v54 = v12;
                v55 = 2112;
                v56 = v22;
                v57 = 2048;
                v58 = v15;
                _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "invite to %@ -- %@ failed with status %ld", buf, 0x20u);

                v6 = v40;
              }
              objc_msgSend(v6, "addObject:", v17);
              objc_msgSend(*(id *)(a1 + 40), "removeInvitee:", v17);
            }
          }
          else
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v17 = *(void **)(v20 + 40);
            *(_QWORD *)(v20 + 40) = 0;
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
    {
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v23)
      {
        objc_msgSend(v23, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "mutableCopy");

        objc_msgSend(v25, "setObject:forKeyedSubscript:", v6, CFSTR("FailedPlayers"));
        v26 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(*(id *)(a1 + 56), "domain");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "code"), v25);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v30 = *(void **)(v29 + 40);
        *(_QWORD *)(v29 + 40) = v28;

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 1081, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:]_block_invoke");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_179;
    v46[3] = &unk_1E75B1788;
    v34 = *(_QWORD *)(a1 + 40);
    v47 = v6;
    v48 = v34;
    v35 = v6;
    objc_msgSend(v32, "perform:", v46);
    v43[0] = v33;
    v43[1] = 3221225472;
    v43[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_4;
    v43[3] = &unk_1E75B3F20;
    v43[4] = *(_QWORD *)(a1 + 40);
    v36 = *(id *)(a1 + 64);
    v37 = *(_QWORD *)(a1 + 72);
    v44 = v36;
    v45 = v37;
    objc_msgSend(v32, "notifyOnMainQueueWithBlock:", v43);

  }
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_179(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = a1 + 32;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v6 + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_180;
    v7[3] = &unk_1E75B1520;
    v8 = v3;
    objc_msgSend(v5, "reportResponse:forInvitees:withCompletionHandler:", 2, v4, v7);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_180(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "allInviteesDidRespond"))
    objc_msgSend(*(id *)(a1 + 32), "doneMatchmaking");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "match");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id, _QWORD, _QWORD))(v2 + 16))(v2, 0, v3, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
}

- (void)invitePlayersWithRequest:(id)a3 serverHosted:(BOOL)a4 devicePushTokenMap:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v8 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!os_log_GKGeneral)
    v13 = GKOSLoggers();
  v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = v14;
    objc_msgSend(v15, "numberWithBool:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "Invite players with request: %@, hosted: %@", buf, 0x16u);

  }
  objc_msgSend(v10, "internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMatchType:", v8);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke;
  v22[3] = &unk_1E75B40B0;
  v22[4] = self;
  v23 = v10;
  v26 = v8;
  v24 = v11;
  v25 = v12;
  v19 = v11;
  v20 = v12;
  v21 = v10;
  objc_msgSend(v21, "loadRecipientsWithCompletionHandler:", v22);

}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  char v15;
  _QWORD v16[5];
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "addInvitees:", a2);
  objc_msgSend(*(id *)(a1 + 40), "inviteeResponseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInviteeResponseHandler:", v3);

  objc_msgSend(*(id *)(a1 + 40), "recipientResponseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecipientResponseHandler:", v4);

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:", *(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 1127, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:devicePushTokenMap:completionHandler:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[GKPreferences shared](GKPreferences, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fastSyncTransportEnabled");

    v9 = MEMORY[0x1E0C809B0];
    if ((v8 & 1) == 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2;
      v16[3] = &unk_1E75B1788;
      v10 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v10;
      objc_msgSend(v6, "perform:", v16);

    }
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_4;
    v11[3] = &unk_1E75B4088;
    v11[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    v15 = *(_BYTE *)(a1 + 64);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v6, "notifyOnMainQueueWithBlock:", v11);

  }
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_3;
  v7[3] = &unk_1E75B1520;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest:handler:", v4, v7);

}

uint64_t __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  char v21;
  _QWORD v22[7];
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 1142, "-[GKMatchmaker invitePlayersWithRequest:serverHosted:devicePushTokenMap:completionHandler:]_block_invoke_4");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__7;
  v29 = __Block_byref_object_dispose__7;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__7;
  v23[4] = __Block_byref_object_dispose__7;
  v24 = 0;
  objc_msgSend(*(id *)(a1 + 32), "match");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previouslyFetchedOnlineConnectionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "match");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transportContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previouslyFetchedOnlineConnectionData");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v26[5];
    v26[5] = v10;

  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_5;
    v22[3] = &unk_1E75B4010;
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = v23;
    v22[6] = &v25;
    objc_msgSend(v3, "perform:", v22);
  }
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_183;
  v15[3] = &unk_1E75B4060;
  v19 = v23;
  v20 = &v25;
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v18 = v12;
  v15[4] = v13;
  v16 = v14;
  v21 = *(_BYTE *)(a1 + 64);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v3, "notifyOnMainQueueWithBlock:", v15);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6;
  v5[3] = &unk_1E75B3FE8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 40);
  v4 = v3;
  objc_msgSend(v6, "loadConnectivitySettingsWithCompletionHandler:", v5);

}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  int8x16_t v9;
  id v10;
  id location;

  v4 = a2;
  if (v4)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6_cold_1();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "match");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_182;
    v7[3] = &unk_1E75B3FC0;
    objc_copyWeak(&v10, &location);
    v9 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "getLocalConnectionDataWithCompletionHandler:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_182(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v11 && !v5)
    {
      v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v8 = v11;
LABEL_7:
      v9 = v8;
      v10 = *v7;
      *v7 = v9;

      goto LABEL_8;
    }
    if (v5)
    {
      v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v8 = v5;
      goto LABEL_7;
    }
  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_183(uint64_t a1)
{
  id v2;
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  _QWORD v11[2];
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  _QWORD block[5];
  _QWORD v17[2];

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
    || (v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) == 0)
  {
    if (!os_log_GKGeneral)
      v2 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_183_cold_1();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_184;
    block[3] = &unk_1E75B2B00;
    v3 = (id *)v17;
    v4 = *(id *)(a1 + 56);
    block[4] = *(_QWORD *)(a1 + 32);
    v17[0] = v4;
    v17[1] = *(_QWORD *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_185;
    v10[3] = &unk_1E75B4038;
    v3 = (id *)v11;
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 32);
    v11[0] = v8;
    v11[1] = v9;
    v15 = *(_BYTE *)(a1 + 80);
    v14 = *(_QWORD *)(a1 + 72);
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v7, "inviteAnyNearbyPlayersViaGCSWithRequest:onlineConnectionData:handler:", v8, v5, v10);

  }
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_184(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "match");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD, _QWORD))(v2 + 16))(v2, 0, v3, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_185(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v7;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "Rest of the players in the request: %@", (uint8_t *)&v23, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recipientPlayerIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "invitedInvitees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recipientPlayerIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionSet:", v15);

    if (!os_log_GKGeneral)
      v16 = GKOSLoggers();
    v17 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v18 = *(void **)(a1 + 32);
      v19 = v17;
      objc_msgSend(v18, "internal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v20;
      _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "Invite non-nearby players with request: %@", (uint8_t *)&v23, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v21 = *(_QWORD *)(a1 + 56);
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 40), "match");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *, _QWORD, _QWORD))(v21 + 16))(v21, 0, v22, 0, 0);

    }
  }
}

- (void)addInvitees:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKMatchmaker inviteesByUserID](self, "inviteesByUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GKMatchmaker inviteesByUserID](self, "inviteesByUserID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "internal", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "playerID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v16 = v7;
  }
  else
  {
    objc_msgSend(v4, "_gkMapDictionaryWithKeyPath:", CFSTR("internal.playerID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
  }
  v17 = (void *)objc_msgSend(v16, "copy", (_QWORD)v18);
  -[GKMatchmaker setInviteesByUserID:](self, "setInviteesByUserID:", v17);

}

- (void)sendMatchmakingRequest:(id)a3 forMatch:(id)a4 rematchID:(id)a5 serverHosted:(BOOL)a6 playerCount:(int64_t)a7 completionHandler:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  GKMatchmaker *v41;
  id v42;
  BOOL v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v10 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v37 = a5;
  v15 = a8;
  if (!os_log_GKGeneral)
    v16 = GKOSLoggers();
  v17 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = v17;
    objc_msgSend(v18, "numberWithInteger:", a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v45 = v13;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v20;
    _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "Matchmaking _request: %@, match %@, playerCount: %@", buf, 0x20u);

  }
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "utilityService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "minPlayers"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "maxPlayers"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "recordMatchStart:minPlayers:maxPlayers:", CFSTR("host"), v23, v24);

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "utilityService");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v10)
    v28 = CFSTR("thirdParty");
  else
    v28 = CFSTR("firstParty");
  objc_msgSend(v26, "recordMatchServer:", v28);

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "multiplayerService");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "internal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transportContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke;
  v38[3] = &unk_1E75B4238;
  v43 = v10;
  v39 = v14;
  v40 = v13;
  v41 = self;
  v42 = v15;
  v33 = v15;
  v34 = v13;
  v35 = v14;
  objc_msgSend(v30, "getPlayersForMatchRequest:playerCount:rematchID:transportContext:handler:", v31, a7, v37, v32, v38);

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  __int128 *p_buf;
  char v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v37 = a2;
  v36 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 1255, "-[GKMatchmaker sendMatchmakingRequest:forMatch:rematchID:serverHosted:playerCount:completionHandler:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v6 = v38;
    objc_msgSend(v38, "setError:");
  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Multiplayer Service getPlayersForMatchRequest returned with response: %@", (uint8_t *)&buf, 0xCu);
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v37, "matches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v58 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("properties"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("player-id"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "updateProperties:playerID:", v15, v16);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v10);
    }

    if (*(_BYTE *)(a1 + 64))
    {
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_198;
      v54[3] = &unk_1E75B1788;
      v55 = v37;
      v56 = v38;
      objc_msgSend(v56, "perform:", v54);

    }
    else
    {
      objc_msgSend(v37, "matches");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3880];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_206;
      v52[3] = &unk_1E75B40D8;
      v53 = *(id *)(a1 + 32);
      objc_msgSend(v18, "predicateWithBlock:", v52);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filteredArrayUsingPredicate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setMatches:", v20);

      objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayerCount:", 0);
      objc_msgSend(*(id *)(a1 + 32), "transportContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateForMatchResponse:serverHosted:", v37, *(unsigned __int8 *)(a1 + 64));

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_210;
      aBlock[3] = &unk_1E75B4198;
      v47 = *(id *)(a1 + 32);
      v22 = v37;
      v48 = v22;
      v49 = *(id *)(a1 + 40);
      v23 = v38;
      v24 = *(_QWORD *)(a1 + 48);
      v50 = v23;
      v51 = v24;
      v25 = _Block_copy(aBlock);
      objc_msgSend(*(id *)(a1 + 32), "transportContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v22) = objc_msgSend(v26, "shouldDelayConnectionForMatchResponse:", v22);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v62 = 0x3032000000;
      v63 = __Block_byref_object_copy__7;
      v64 = __Block_byref_object_dispose__7;
      dispatch_get_current_queue();
      v65 = (id)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_224;
      v42[3] = &unk_1E75B4210;
      v45 = (char)v22;
      v27 = v25;
      v43 = v27;
      p_buf = &buf;
      objc_msgSend(v23, "perform:", v42);

      _Block_object_dispose(&buf, 8);
    }
    v6 = v38;
  }
  objc_msgSend(v6, "error");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (!v29)
  {
    objc_msgSend(v38, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "getUnderlyingErrorWithServerStatusCode:", 5003);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      if (!os_log_GKGeneral)
        v32 = GKOSLoggers();
      v33 = (void *)os_log_GKDeveloper;
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_cold_1(v33, v31);
    }

  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_229;
  v39[3] = &unk_1E75B2BB0;
  v34 = *(void **)(a1 + 56);
  v39[4] = *(_QWORD *)(a1 + 48);
  v40 = v38;
  v41 = v34;
  v35 = v38;
  objc_msgSend(v35, "notifyOnMainQueueWithBlock:", v39);

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_198(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  id obj;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "matches");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("player-id"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[GKLocalPlayer local](GKLocalPlayer, "local");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "internal");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "playerID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v7, "isEqualToString:", v10);

        if ((v11 & 1) == 0)
          objc_msgSend(v14, "addObject:", v7);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2;
  v16[3] = &unk_1E75B1C58;
  v17 = *(id *)(a1 + 40);
  v18 = v13;
  v12 = v13;
  +[GKPlayer loadPlayersForLegacyIdentifiers:withCompletionHandler:](GKPlayer, "loadPlayersForLegacyIdentifiers:withCompletionHandler:", v14, v16);

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (+[GKMatchmaker canPlayMultiplayerGameWithPlayers:](GKMatchmaker, "canPlayMultiplayerGameWithPlayers:", v5))
    {
      v6 = 0;
    }
    else
    {
      if (!os_log_GKGeneral)
        v7 = GKOSLoggers();
      v8 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_cold_1(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (objc_msgSend(v6, "code") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("count"));

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("players"));
  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_206(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("player-id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("client-data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transportContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "representedPlayerIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_msgSend(v11, "containsObject:", v4) & 1) != 0 || objc_msgSend(v9, "count") == 0;

  if (!os_log_GKGeneral)
    v13 = GKOSLoggers();
  v14 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412802;
    v17 = v4;
    v18 = 1024;
    v19 = v8;
    v20 = 1024;
    v21 = v12;
    _os_log_debug_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_DEBUG, "Excluding matched playerID: %@, isLocalPlayer: %d, isRepresentedPlayer: %d", (uint8_t *)&v16, 0x18u);
  }

  return (v8 | v12) ^ 1u;
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_210(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void (**v28)(_QWORD);
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void (**v54)(_QWORD);
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  void *v60;
  void (**v61)(_QWORD);
  uint64_t v62;
  id obj;
  id obja;
  void *v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  int v74;
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  uint64_t v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transportContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldSendInviteUpdate");

  if (v5)
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "Sending invite update to participants in the lobby channel.", buf, 2u);
    }
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "multiplayerService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transportContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formAnInviteUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendInvitationUpdate:handler:", v11, &__block_literal_global_212);

  }
  v61 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v62 = a1;
  objc_msgSend(*(id *)(a1 + 40), "matches");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v12)
  {
    v13 = v12;
    LODWORD(v14) = 0;
    v66 = *(_QWORD *)v81;
    v15 = 1;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v81 != v66)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKey:", CFSTR("num-players"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = v15;
        if (v18)
          v21 = objc_msgSend(v18, "intValue");
        else
          v21 = 1;
        objc_msgSend(v17, "objectForKey:", CFSTR("client-data"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("match-version"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "integerValue");

        if (v24 >= v20)
          v15 = v20;
        else
          v15 = v24;
        objc_msgSend(v17, "objectForKey:", CFSTR("player-id"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v65, "addObject:", v25);
        v14 = (v21 + v14);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
    LOBYTE(v15) = 1;
  }

  if (!os_log_GKGeneral)
    v26 = GKOSLoggers();
  v27 = (void *)os_log_GKMatch;
  v28 = v61;
  v29 = v62;
  v30 = v65;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v31 = *(void **)(v62 + 32);
    v32 = v27;
    objc_msgSend(v31, "transportContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "peerDictionaries");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v86 = (uint64_t)v34;
    _os_log_impl(&dword_1BCDE3000, v32, OS_LOG_TYPE_INFO, "Using peerDictionaries: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(v62 + 48), "guestPlayers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "count"))
  {
    if (!os_log_GKGeneral)
      v36 = GKOSLoggers();
    v37 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v38 = v37;
      v39 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 134217984;
      v86 = v39;
      _os_log_impl(&dword_1BCDE3000, v38, OS_LOG_TYPE_INFO, "Connecting to %lu guest players", buf, 0xCu);

    }
    v79 = 0u;
    v77 = 0u;
    v78 = 0u;
    v76 = 0u;
    obja = v35;
    v40 = v35;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v77 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          if (!os_log_GKGeneral)
            v46 = GKOSLoggers();
          v47 = (void *)os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            v48 = v47;
            objc_msgSend(v45, "internal");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "debugDescription");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v86 = (uint64_t)v50;
            _os_log_impl(&dword_1BCDE3000, v48, OS_LOG_TYPE_INFO, "Connecting to guest player: %@", buf, 0xCu);

            v29 = v62;
          }
          v51 = *(void **)(v29 + 32);
          +[GKLocalPlayer local](GKLocalPlayer, "local");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "connectToGuestPlayer:withHostPlayer:", v45, v52);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      }
      while (v42);
    }

    v28 = v61;
    v35 = obja;
    v30 = v65;
  }
  if (objc_msgSend(v30, "count"))
  {
    v53 = *(void **)(v29 + 56);
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_217;
    v67[3] = &unk_1E75B4170;
    v68 = v30;
    v69 = *(id *)(v29 + 56);
    v54 = v28;
    v55 = *(_QWORD *)(v29 + 64);
    v73 = v54;
    v70 = v55;
    v71 = *(id *)(v29 + 32);
    v75 = v15;
    v72 = *(id *)(v29 + 40);
    v74 = v14;
    objc_msgSend(v53, "perform:", v67);

  }
  else
  {
    objc_msgSend(*(id *)(v29 + 48), "guestPlayers");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "count");

    if (v57)
    {
      if (!os_log_GKGeneral)
        v58 = GKOSLoggers();
      v59 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v86) = v14;
        _os_log_impl(&dword_1BCDE3000, v59, OS_LOG_TYPE_INFO, "GKMatchMaker has no players to load but we have guest players. Call completion handler with matchedPlayerCount: %i", buf, 8u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v29 + 56), "setObject:forKeyedSubscript:", v60, CFSTR("count"));

      objc_msgSend(*(id *)(v29 + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(v29 + 32), CFSTR("match"));
      v28[2](v28);
    }
  }

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_211(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2_cold_1();
  }

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_217(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  char v19;

  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_217_cold_1();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_218;
  v10[3] = &unk_1E75B4148;
  v5 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v3;
  v17 = *(id *)(a1 + 72);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v19 = *(_BYTE *)(a1 + 84);
  v15 = *(id *)(a1 + 64);
  v18 = *(_DWORD *)(a1 + 80);
  v9 = v3;
  +[GKPlayer loadPlayersForLegacyIdentifiers:withCompletionHandler:](GKPlayer, "loadPlayersForLegacyIdentifiers:withCompletionHandler:", v5, v10);

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_218(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  int v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
    goto LABEL_2;
  if (+[GKMatchmaker canPlayMultiplayerGameWithPlayers:](GKMatchmaker, "canPlayMultiplayerGameWithPlayers:", v5))
  {
    goto LABEL_13;
  }
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_218_cold_2(v11);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_2:
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_218_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "utilityService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "completeMatchRecording:matchType:", CFSTR("failure"), 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
LABEL_13:
    +[GKReporter reporter](GKReporter, "reporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportEvent:type:count:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.allMatchTotal"), objc_msgSend(v5, "count"));

    +[GKReporter reporter](GKReporter, "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportEvent:type:count:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.autoMatchTotal"), objc_msgSend(v5, "count"));

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "utilityService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordActiveDevices:", v16);

    if (!os_log_GKGeneral)
      v17 = GKOSLoggers();
    v18 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v39 = v19;
      v40 = 2112;
      v41 = v5;
      _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "matched playerIDs: %@, players: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 48), "autoMatchedPlayers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "_gkPlayersIDsFromPlayers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unionSet:", v23);

    v24 = *(void **)(a1 + 56);
    objc_msgSend(v5, "_gkPlayersIDsFromPlayers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "allInvitedInvitees");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "syncPlayers:forJoinType:toInvitees:", v25, 4, v27);

    v28 = *(void **)(a1 + 56);
    v29 = *(unsigned __int8 *)(a1 + 92);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221;
    v30[3] = &unk_1E75B4120;
    v31 = *(id *)(a1 + 32);
    v35 = *(id *)(a1 + 72);
    v36 = *(id *)(a1 + 80);
    v32 = *(id *)(a1 + 64);
    v33 = *(id *)(a1 + 56);
    v34 = v5;
    v37 = *(_DWORD *)(a1 + 88);
    objc_msgSend(v28, "connectToPlayers:version:invitedByLocalPlayer:completionHandler:", v34, v29, 0, v30);

    v6 = v31;
  }

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 28, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221_cold_3();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "relayPushes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "relayPushes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v48 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
            if (!os_log_GKGeneral)
              v14 = GKOSLoggers();
            v15 = os_log_GKMatch;
            if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
            {
              v16 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138412290;
              v53 = v16;
              _os_log_debug_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_DEBUG, "Relay push for match: %@", buf, 0xCu);
            }
            objc_msgSend(*(id *)(a1 + 48), "handleRelayPushData:onlyIfPreemptive:", v13, 0);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        }
        while (v10);
      }

    }
    +[GKPreferences shared](GKPreferences, "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "preemptiveRelay");

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 56), "_gkMapDictionaryWithKeyPath:", CFSTR("internal.playerID"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "matches");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        if (!os_log_GKGeneral)
          v20 = GKOSLoggers();
        v21 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
          __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221_cold_2(v21);
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v40 = v19;
        obj = v19;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v44 != v24)
                objc_enumerationMutation(obj);
              v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
              objc_msgSend(v26, "objectForKey:", CFSTR("player-id"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", CFSTR("relay"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28 && (objc_msgSend(v28, "BOOLValue") & 1) != 0
                || (+[GKPreferences shared](GKPreferences, "shared"),
                    v30 = (void *)objc_claimAutoreleasedReturnValue(),
                    v31 = objc_msgSend(v30, "forceRelay"),
                    v30,
                    v31))
              {
                +[GKLocalPlayer local](GKLocalPlayer, "local");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "internal");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "playerID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "compare:", v27);

                if (v35 == -1)
                {
                  objc_msgSend(v41, "objectForKey:", v27);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    if (!os_log_GKGeneral)
                      v37 = GKOSLoggers();
                    v38 = (void *)os_log_GKMatch;
                    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
                      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221_cold_1(buf, v38, v36, &v53);
                    objc_msgSend(*(id *)(a1 + 48), "preemptRelay:", v36);
                  }

                }
              }

            }
            v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v23);
        }

        v19 = v40;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v39, CFSTR("count"));

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("match"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_224(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utilityService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("gk-qr-allocation-delay-base-ms");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225;
  v8[3] = &unk_1E75B41E8;
  v12 = *(_BYTE *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "getStoreBagValuesForKeys:handler:", v6, v8);

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225_cold_3();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gk-qr-allocation-delay-base-ms"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && *(_BYTE *)(a1 + 56))
  {
    v10 = dispatch_time(0, 1000000 * objc_msgSend(v8, "integerValue"));
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225_cold_2((unsigned __int8 *)(a1 + 56), v12, (uint64_t)v9);
    v13 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_227;
    v18[3] = &unk_1E75B41C0;
    v14 = &v19;
    v19 = v9;
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    dispatch_after(v10, v13, v18);

  }
  else
  {
    if (!os_log_GKGeneral)
      v15 = GKOSLoggers();
    v16 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225_cold_1((uint64_t)v5, a1, v16);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_226;
    v22[3] = &unk_1E75B1520;
    v14 = &v23;
    v17 = *(_QWORD *)(a1 + 32);
    v23 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, _QWORD *))(v17 + 16))(v17, v22);
  }

}

uint64_t __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_227(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "After delay of delayMs: %@", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_228;
  v6[3] = &unk_1E75B1520;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, _QWORD *))(v5 + 16))(v5, v6);

}

uint64_t __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_229(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  objc_msgSend(*(id *)(a1 + 32), "setMatching:", 0);
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "getPlayersForMatchRequest done, set shared matchmaker's matching to NO", v10, 2u);
  }
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("match"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("players"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, void *, void *))(v4 + 16))(v4, v6, v7, v8, v9);

}

- (void)handleMatchRequest:(id)a3 forCurrentMatch:(id)a4 hostedCurrentPlayerCount:(int64_t)a5 serverHosted:(BOOL)a6 rematchID:(id)a7 devicePushToken:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void (**v23)(void *, uint64_t);
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  GKMatchmaker *v37;
  id v38;
  id v39;
  void (**v40)(void *, uint64_t);
  id v41;
  id v42;
  int64_t v43;
  BOOL v44;
  _QWORD v45[4];
  id v46;
  _QWORD aBlock[4];
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v11 = a6;
  v55 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v33 = a7;
  v15 = a8;
  v16 = a9;
  if (!os_log_GKGeneral)
    v17 = GKOSLoggers();
  v18 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v50 = v13;
    v51 = 1024;
    v52 = v11;
    v53 = 2112;
    v54 = v14;
    _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "matchWithRequest: %@, serverHosted: %d, currentMatch: %@", buf, 0x1Cu);
  }
  if ((GKApplicationLinkedOnOrAfter() & 1) == 0)
    objc_msgSend(v13, "ensureValidityHosted:", v11);
  objc_msgSend(v13, "internal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMatchType:", v11);

  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke;
  aBlock[3] = &unk_1E75B29C8;
  v21 = v16;
  v48 = v21;
  v45[0] = v20;
  v45[1] = 3221225472;
  v45[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2;
  v45[3] = &unk_1E75B4260;
  v22 = _Block_copy(aBlock);
  v46 = v22;
  v23 = (void (**)(void *, uint64_t))_Block_copy(v45);
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isAuthenticated");

  if ((v25 & 1) == 0)
  {
    v23[2](v23, 6);
LABEL_16:
    v30 = v33;
    goto LABEL_17;
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "multiplayerAllowedPlayerType");

  if (!v27)
  {
    v23[2](v23, 10);
    goto LABEL_16;
  }
  -[GKMatchmaker setCurrentMatchRequest:](self, "setCurrentMatchRequest:", v13);
  -[GKMatchmaker setServerHosted:](self, "setServerHosted:", v11);
  if (!os_log_GKGeneral)
    v28 = GKOSLoggers();
  v29 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v29, OS_LOG_TYPE_INFO, "GKMatchmaker: calls loadRecipientsWithCompletionHandler", buf, 2u);
  }
  v34[0] = v20;
  v34[1] = 3221225472;
  v34[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233;
  v34[3] = &unk_1E75B4378;
  v44 = v11;
  v43 = a5;
  v35 = v13;
  v36 = v14;
  v37 = self;
  v40 = v23;
  v38 = v15;
  v41 = v21;
  v42 = v22;
  v30 = v33;
  v39 = v33;
  objc_msgSend(v35, "loadRecipientsWithCompletionHandler:", v34);

LABEL_17:
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_cold_1(v5);
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_231;
    v6[3] = &unk_1E75B1BF0;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  id v38;
  NSObject *v39;
  void *v40;
  void (*v41)(void);
  id v42;
  void (*v43)(void);
  id v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  unint64_t v61;
  BOOL v62;
  char v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  char v68;
  uint8_t buf[4];
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  +[GKPreferences shared](GKPreferences, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*(_BYTE *)(a1 + 104))
  {
    v9 = objc_msgSend(v7, "maxPlayersHosted");
    v10 = *(_QWORD *)(a1 + 96);
  }
  else
  {
    v9 = objc_msgSend(v7, "maxPlayersP2P");
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = v5;
    v13 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 32);
      v15 = v13;
      objc_msgSend(v14, "guestPlayers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v70 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "Loaded recipients with guest player count = %i", buf, 8u);

    }
    objc_msgSend(*(id *)(a1 + 40), "players");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_gkNonGuestPlayersFromPlayers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v20);

    objc_msgSend(*(id *)(a1 + 48), "inviteesByUserID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    v23 = objc_msgSend(v19, "count");
    v24 = v22 + objc_msgSend(*(id *)(a1 + 40), "expectedPlayerCount");
    objc_msgSend(*(id *)(a1 + 32), "guestPlayers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v24 + objc_msgSend(v25, "count") + v23 + 1;

    if (!os_log_GKGeneral)
      v26 = GKOSLoggers();
    v27 = os_log_GKMatch;
    v5 = v12;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v70 = v10;
      _os_log_impl(&dword_1BCDE3000, v27, OS_LOG_TYPE_INFO, "Removed local player from player list, now current player count = %i", buf, 8u);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "initiallyStarted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setIsLateJoin:", 1);

    if (!os_log_GKGeneral)
      v29 = GKOSLoggers();
    v30 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v30, OS_LOG_TYPE_INFO, "This is a late join match request.", buf, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "removeLocalPlayerFromPlayersToInvite");
  v31 = objc_msgSend(v6, "count");

  if (v31 < 1)
  {
    if ((GKAtomicCompareAndSwap32(0, 1u, (unsigned int *)(*(_QWORD *)(a1 + 48) + 16)) & 1) == 0)
    {
      if (!os_log_GKGeneral)
        v42 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_5();
      goto LABEL_39;
    }
    if (!os_log_GKGeneral)
      v33 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_4();
    v34 = objc_msgSend(*(id *)(a1 + 32), "maxPlayers");
    objc_msgSend(*(id *)(a1 + 32), "guestPlayers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count") + 1;
    v37 = v34 == v36;

    if (!os_log_GKGeneral)
      v38 = GKOSLoggers();
    v39 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_3(v34 == v36, v39);
    objc_msgSend(*(id *)(a1 + 32), "validateForHosted:", *(unsigned __int8 *)(a1 + 104));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = *(void (**)(void))(*(_QWORD *)(a1 + 88) + 16);
    }
    else
    {
      if (v10 <= objc_msgSend(*(id *)(a1 + 32), "maxPlayers") || v34 == v36)
      {
        objc_msgSend(*(id *)(a1 + 48), "setMatch:", *(_QWORD *)(a1 + 40));
        v48 = *(unsigned __int8 *)(a1 + 104);
        objc_msgSend(*(id *)(a1 + 32), "internal");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if (v48)
        {
          objc_msgSend(v49, "setMatchType:", 1);

          objc_msgSend(*(id *)(a1 + 48), "sendMatchmakingRequest:forMatch:rematchID:serverHosted:playerCount:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 104), v10, *(_QWORD *)(a1 + 80));
        }
        else
        {
          objc_msgSend(v49, "setMatchType:", 0);

          v51 = *(void **)(a1 + 48);
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_241;
          v56[3] = &unk_1E75B4350;
          v56[4] = v51;
          v60 = *(id *)(a1 + 80);
          v57 = *(id *)(a1 + 40);
          v58 = *(id *)(a1 + 32);
          v62 = v37;
          v52 = *(id *)(a1 + 64);
          v63 = *(_BYTE *)(a1 + 104);
          v59 = v52;
          v61 = v10;
          objc_msgSend(v51, "loadConnectivitySettingsWithCompletionHandler:", v56);

        }
        goto LABEL_54;
      }
      v41 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    }
    v41();
LABEL_54:

    goto LABEL_41;
  }
  if (v31 + v10 > objc_msgSend(*(id *)(a1 + 32), "maxPlayers") || objc_msgSend(*(id *)(a1 + 32), "maxPlayers") > v9)
  {
    if (!os_log_GKGeneral)
      v32 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_1();
LABEL_39:
    v43 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_40:
    v43();
    goto LABEL_41;
  }
  if (objc_msgSend(v5, "code") == 10)
  {
    if (!os_log_GKGeneral)
      v44 = GKOSLoggers();
    v45 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_2(v45);
    v43 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_40;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isConfiguredForAutomatchOnly"))
  {
    v43 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_40;
  }
  if (!*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 48), "match");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      v47 = *(void **)(a1 + 48);
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v47, "setMatch:");
      }
      else
      {
        v53 = (void *)objc_msgSend(v47, "newMatch");
        objc_msgSend(*(id *)(a1 + 48), "setMatch:", v53);

      }
    }
  }
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "multiplayerService");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_234;
  v64[3] = &unk_1E75B42B0;
  v64[4] = *(_QWORD *)(a1 + 48);
  v65 = *(id *)(a1 + 32);
  v66 = *(id *)(a1 + 56);
  v68 = *(_BYTE *)(a1 + 104);
  v67 = *(id *)(a1 + 80);
  objc_msgSend(v55, "fetchTransportOverrideWithHandler:", v64);

LABEL_41:
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "match");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transportContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v5;
  objc_msgSend(v8, "updateWithForceEnabledTransports:andForceDisabledTransports:", v5, v6);

  if (objc_msgSend(*(id *)(a1 + 32), "shouldRunGroupActivityWithDescription:", CFSTR("updateAfterTransportOverride")))
  {
    objc_msgSend(*(id *)(a1 + 32), "groupActivityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "update");

  }
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "guestPlayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v14);
        objc_msgSend(*(id *)(a1 + 32), "match");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[GKLocalPlayer local](GKLocalPlayer, "local");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "connectToGuestPlayer:withHostPlayer:", v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "recipientPlayerIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        if (*(_QWORD *)(a1 + 48))
        {
          v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v24);
          v45 = *(_QWORD *)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v25);

        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v22);
  }

  v28 = *(void **)(a1 + 32);
  v27 = *(void **)(a1 + 40);
  v29 = *(unsigned __int8 *)(a1 + 64);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_237;
  v33[3] = &unk_1E75B4288;
  v30 = v27;
  v31 = *(_QWORD *)(a1 + 32);
  v34 = v30;
  v35 = v31;
  v36 = *(id *)(a1 + 56);
  objc_msgSend(v28, "invitePlayersWithRequest:serverHosted:devicePushTokenMap:completionHandler:", v30, v29, v18, v33);

}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_237(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_237_cold_1();
    objc_msgSend(*(id *)(a1 + 40), "match");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error detected when inviting players. Error: %@"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "promptRadarAndRequestRemoteLogsWithDescriptionAddition:", v14);

  }
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, id, id, id))(v15 + 16))(v15, a2, v9, v10, v11);

}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_241(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  char v22;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMatching:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
      v5 = v4;
    else
      v5 = (id)objc_msgSend(*(id *)(a1 + 32), "newMatch");
    v6 = v5;
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiplayerService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_242;
    v14[3] = &unk_1E75B4328;
    v15 = v6;
    v9 = *(id *)(a1 + 48);
    v21 = *(_BYTE *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 32);
    v16 = v9;
    v17 = v10;
    v19 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 56);
    v22 = *(_BYTE *)(a1 + 81);
    v12 = *(_QWORD *)(a1 + 72);
    v18 = v11;
    v20 = v12;
    v13 = v6;
    objc_msgSend(v8, "fetchTransportOverrideWithHandler:", v14);

  }
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_242(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  char v23;
  char v24;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "transportContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithForceEnabledTransports:andForceDisabledTransports:", v7, v6);

  v9 = objc_msgSend(*(id *)(a1 + 32), "version");
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVersion:", v9);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_3;
  v16[3] = &unk_1E75B4300;
  v23 = *(_BYTE *)(a1 + 80);
  v11 = *(void **)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v18 = v12;
  v19 = v13;
  v21 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 56);
  v24 = *(_BYTE *)(a1 + 81);
  v15 = *(_QWORD *)(a1 + 72);
  v20 = v14;
  v22 = v15;
  objc_msgSend(v11, "getLocalConnectionDataWithCompletionHandler:", v16);

}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id obj;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "setMatching:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else if (*(_BYTE *)(a1 + 80))
  {
    v38 = v5;
    v8 = &os_log_GKGeneral;
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    v10 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "This is a local match with guest players only", buf, 2u);
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "guestPlayers", v7);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (!*v8)
            v16 = GKOSLoggers();
          v17 = (void *)os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            v18 = v17;
            objc_msgSend(v15, "internal");
            v19 = a1;
            v20 = v8;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "debugDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v22;
            _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "Connecting to guest player: %@", buf, 0xCu);

            v8 = v20;
            a1 = v19;
          }
          v23 = *(void **)(a1 + 40);
          +[GKLocalPlayer local](GKLocalPlayer, "local");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "connectToGuestPlayer:withHostPlayer:", v15, v24);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v12);
    }

    objc_msgSend(*(id *)(a1 + 48), "setMatching:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v7 = v37;
    v5 = v38;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "transportContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    objc_msgSend(v25, "updateForMatchRequestWithConnectionData:", v5);

    if (!os_log_GKGeneral)
      v27 = GKOSLoggers();
    v28 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v30 = *(_QWORD *)(a1 + 32);
      v29 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v47 = v29;
      v48 = 2112;
      v49 = v30;
      _os_log_impl(&dword_1BCDE3000, v28, OS_LOG_TYPE_INFO, "Sending matchmaking request to server.\nExisting match: %@.\nRequest: %@", buf, 0x16u);
    }
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(_QWORD *)(a1 + 40);
    v33 = *(void **)(a1 + 48);
    v34 = *(_QWORD *)(a1 + 56);
    v35 = *(unsigned __int8 *)(a1 + 81);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_243;
    v40[3] = &unk_1E75B42D8;
    v36 = *(_QWORD *)(a1 + 72);
    v41 = *(id *)(a1 + 64);
    objc_msgSend(v33, "sendMatchmakingRequest:forMatch:rematchID:serverHosted:playerCount:completionHandler:", v31, v32, v34, v35, v36, v40);

    v5 = v26;
    v7 = 0;
  }

}

uint64_t __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_243(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadURLForMatch:(id)a3 matchRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(void *, uint64_t);
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  GKMatchmaker *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E75B4260;
  v12 = v10;
  v33 = v12;
  v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAuthenticated");

  if ((v15 & 1) != 0)
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "multiplayerAllowedPlayerType");

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 1764, "-[GKMatchmaker loadURLForMatch:matchRequest:completionHandler:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v28[0] = v11;
      v28[1] = 3221225472;
      v28[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_2;
      v28[3] = &unk_1E75B2C00;
      v28[4] = self;
      v20 = v19;
      v29 = v20;
      v21 = v8;
      v30 = v21;
      v31 = v9;
      objc_msgSend(v20, "perform:", v28);
      v23[0] = v11;
      v23[1] = 3221225472;
      v23[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_245;
      v23[3] = &unk_1E75B1850;
      v24 = v20;
      v25 = self;
      v26 = v21;
      v27 = v12;
      v22 = v20;
      objc_msgSend(v22, "notifyOnMainQueueWithBlock:", v23);

    }
    else
    {
      v13[2](v13, 10);
    }
  }
  else
  {
    v13[2](v13, 6);
  }

}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_cold_1(a2, v5);
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_244;
    v6[3] = &unk_1E75B43A0;
    v7 = *(id *)(a1 + 32);
    v8 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_244(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", *(_QWORD *)(a1 + 40), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E75B18A0;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadConnectivitySettingsWithCompletionHandler:", v6);

}

uint64_t __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  if (!a2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_4;
    v6[3] = &unk_1E75B1800;
    v4 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "perform:", v6);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_4(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_5;
  v6[3] = &unk_1E75B43F0;
  v4 = a1[4];
  v7 = a1[5];
  v8 = a1[4];
  v9 = a1[6];
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "getLocalConnectionDataWithCompletionHandler:", v6);

}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_6;
    v10[3] = &unk_1E75B2C00;
    v9 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = v5;
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v9, "perform:", v10);

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v6, v7, v8);

}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transportContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateForInviteInitiationWithOnlineConnectionData:", *(_QWORD *)(a1 + 40));

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multiplayerService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_7;
  v8[3] = &unk_1E75B3D90;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = v3;
  v7 = v3;
  objc_msgSend(v6, "fetchTransportOverrideWithHandler:", v8);

}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a1[4];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "transportContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithForceEnabledTransports:andForceDisabledTransports:", v7, v6);

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "multiplayerService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a1[5];
  objc_msgSend(a1[4], "transportContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8;
  v15[3] = &unk_1E75B43C8;
  v16 = a1[4];
  v17 = a1[6];
  v18 = a1[5];
  v19 = a1[7];
  objc_msgSend(v10, "loadCloudKitShareURLWithPlayer:matchRequest:transportContext:handler:", v12, v13, v14, v15);

}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  void *v13;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "transportContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithInviteInitiateResponse:", v7);

  objc_msgSend(v7, "cloudKitShareURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setResult:", v9);
  objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
  if (v5)
  {
    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8_cold_1();
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    v12 = objc_msgSend(*(id *)(a1 + 48), "matchType") == 1;
    objc_msgSend(*(id *)(a1 + 48), "messagesBasedRecipients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportInviteSentWithApproach:isHosted:recipients:", 2, v12, v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_245(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "setMatch:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);

  }
}

- (void)setShareInvitees:(id)a3 propagateToDaemon:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Matchmaker set shareInvitees: %@", (uint8_t *)&v15, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker setShareInvitees:](self, "setShareInvitees:", v9);

  if (v4)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "multiplayerService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShareInvitees:", v6);

  }
  -[GKMatchmaker invitedShareInvitees](self, "invitedShareInvitees");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unionSet:", v13);

  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("updateAfterSettingShareInvitees")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "update");

  }
}

- (void)setShareInvitees:(id)a3 forMatch:(id)a4 propagateToDaemon:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a5;
  v8 = a4;
  -[GKMatchmaker setShareInvitees:propagateToDaemon:](self, "setShareInvitees:propagateToDaemon:", a3, v5);
  -[GKMatchmaker match](self, "match");
  v9 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v9;
  if (v9)
    v10 = (id)v9;
  else
    v10 = v8;
  -[GKMatchmaker setMatch:](self, "setMatch:", v10);

}

- (void)findMatchForRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = completionHandler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__GKMatchmaker_findMatchForRequest_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E75B4418;
  v9 = v6;
  v7 = v6;
  -[GKMatchmaker findMatchForRequest:devicePushToken:withCompletionHandler:](self, "findMatchForRequest:devicePushToken:withCompletionHandler:", request, 0, v8);

}

void __58__GKMatchmaker_findMatchForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && !v5)
    objc_msgSend(v6, "setInitiallyStarted:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)findMatchForRequest:(id)a3 devicePushToken:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Find match for request: %@", buf, 0xCu);
  }
  -[GKMatchmaker setMatch:](self, "setMatch:", 0);
  -[GKMatchmaker setInviteesByUserID:](self, "setInviteesByUserID:", 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__GKMatchmaker_findMatchForRequest_devicePushToken_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E75B42D8;
  v16 = v10;
  v13 = v10;
  -[GKMatchmaker handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:](self, "handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:", v8, 0, 0, 0, 0, v9, v15);
  +[GKReporter reporter](GKReporter, "reporter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("find"));

}

void __74__GKMatchmaker_findMatchForRequest_devicePushToken_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void (*v14)(void);
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Matchmaker failed to find match due to error: %@", (uint8_t *)&v16, 0xCu);
    }
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
    {
      v14 = *(void (**)(void))(v13 + 16);
LABEL_10:
      v14();
    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      v14 = *(void (**)(void))(v15 + 16);
      goto LABEL_10;
    }
  }

}

- (void)findPlayersForHostedRequest:(id)a3 match:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Find players for hosted request: %@, match: %@", buf, 0x16u);
  }
  +[GKReporter reporter](GKReporter, "reporter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportEvent:reportable:", CFSTR("com.apple.GameKit.match"), v8);

  -[GKMatchmaker setMatch:](self, "setMatch:", v9);
  -[GKMatchmaker setInviteesByUserID:](self, "setInviteesByUserID:", 0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__GKMatchmaker_findPlayersForHostedRequest_match_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E75B4440;
  v16[4] = self;
  v17 = v10;
  v14 = v10;
  -[GKMatchmaker handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:](self, "handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:", v8, v9, 0, 1, 0, 0, v16);
  +[GKReporter reporter](GKReporter, "reporter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("findHosted"));

}

void __72__GKMatchmaker_findPlayersForHostedRequest_match_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setMatch:", 0);

}

- (void)findPlayersForHostedRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  GKMatchRequest *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v6 = request;
  v7 = completionHandler;
  v8 = v7;
  if (v7)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__GKMatchmaker_findPlayersForHostedRequest_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E75B4468;
    v19 = v7;
    -[GKMatchmaker findMatchedPlayers:withCompletionHandler:](self, "findMatchedPlayers:withCompletionHandler:", v6, v18);

  }
  else
  {
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    v10 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker findPlayersForHostedRequest:withCompletionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __66__GKMatchmaker_findPlayersForHostedRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_3:
    v7();
    goto LABEL_13;
  }
  objc_msgSend(v5, "players");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "players", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_13:

}

- (void)findMatchedPlayers:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  GKMatchmaker *v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = -[GKMatchmaker newMatch](self, "newMatch");
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiplayerService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E75B3D90;
    v22 = v8;
    v23 = self;
    v24 = v6;
    v25 = v7;
    v11 = v8;
    objc_msgSend(v10, "fetchTransportOverrideWithHandler:", v21);

  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker findMatchedPlayers:withCompletionHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

void __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "transportContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithForceEnabledTransports:andForceDisabledTransports:", v7, v6);

  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E75B3530;
  v11 = *(_QWORD *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v9, "findPlayersForHostedRequest:match:withCompletionHandler:", v11, v10, v12);

}

void __57__GKMatchmaker_findMatchedPlayers_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  GKMatchedPlayers *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = -[GKMatchedPlayers initWithMatch:players:]([GKMatchedPlayers alloc], "initWithMatch:players:", *(_QWORD *)(a1 + 32), v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)findPlayersForHostedMatchRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  GKMatchRequest *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  GKMatchRequest *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = request;
  v7 = completionHandler;
  if (!GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    v11 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "Find players for hosted match request: %@", buf, 0xCu);
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__GKMatchmaker_findPlayersForHostedMatchRequest_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E75B1CF0;
    v13 = v7;
    -[GKMatchmaker findPlayersForHostedRequest:withCompletionHandler:](self, "findPlayersForHostedRequest:withCompletionHandler:", v6, v12);
    v9 = v13;
    goto LABEL_12;
  }
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKMatchmaker findPlayersForHostedMatchRequest:withCompletionHandler:].cold.1();
    if (!v7)
      goto LABEL_13;
    goto LABEL_6;
  }
  if (v7)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 34, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v7 + 2))(v7, 0, v9);
LABEL_12:

  }
LABEL_13:

}

void __71__GKMatchmaker_findPlayersForHostedMatchRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "_gkMapWithBlock:", &__block_literal_global_251_0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v8)
    v7 = 0;
  else
    v7 = v5;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7);

}

id __71__GKMatchmaker_findPlayersForHostedMatchRequest_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addPlayersToMatch:(GKMatch *)match matchRequest:(GKMatchRequest *)matchRequest completionHandler:(void *)completionHandler
{
  -[GKMatchmaker addPlayersToMatch:matchRequest:devicePushToken:completionHandler:](self, "addPlayersToMatch:matchRequest:devicePushToken:completionHandler:", match, matchRequest, 0, completionHandler);
}

- (void)addPlayersToMatch:(id)a3 matchRequest:(id)a4 devicePushToken:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!os_log_GKGeneral)
    v14 = GKOSLoggers();
  v15 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "Add players to match: %@, with request: %@", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__GKMatchmaker_addPlayersToMatch_matchRequest_devicePushToken_completionHandler___block_invoke;
  v18[3] = &unk_1E75B42D8;
  v19 = v13;
  v16 = v13;
  -[GKMatchmaker handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:](self, "handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:", v11, v10, 0, 0, 0, v12, v18);
  +[GKReporter reporter](GKReporter, "reporter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("add"));

}

uint64_t __81__GKMatchmaker_addPlayersToMatch_matchRequest_devicePushToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a5);
  return result;
}

- (void)addPlayersForHostedMatchRequest:(id)a3 existingPlayerCount:(int64_t)a4 devicePushToken:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!os_log_GKGeneral)
    v13 = GKOSLoggers();
  v14 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "Add players for hosted match request: %@", buf, 0xCu);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__GKMatchmaker_addPlayersForHostedMatchRequest_existingPlayerCount_devicePushToken_completionHandler___block_invoke;
  v17[3] = &unk_1E75B42D8;
  v18 = v12;
  v15 = v12;
  -[GKMatchmaker handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:](self, "handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:", v10, 0, a4, 1, 0, v11, v17);
  +[GKReporter reporter](GKReporter, "reporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("addHosted"));

}

uint64_t __102__GKMatchmaker_addPlayersForHostedMatchRequest_existingPlayerCount_devicePushToken_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addPlayersForHostedMatchRequest:(id)a3 existingPlayerCount:(int64_t)a4 completionHandler:(id)a5
{
  -[GKMatchmaker addPlayersForHostedMatchRequest:existingPlayerCount:devicePushToken:completionHandler:](self, "addPlayersForHostedMatchRequest:existingPlayerCount:devicePushToken:completionHandler:", a3, a4, 0, a5);
}

- (void)findRematchForMatch:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  GKMatchRequest *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "Find rematch for match: %@", buf, 0xCu);
  }
  objc_msgSend(v6, "rematchID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_msgSend(v6, "rematchCount");

    if (v12)
    {
      v13 = objc_alloc_init(GKMatchRequest);
      -[GKMatchRequest setMinPlayers:](v13, "setMinPlayers:", objc_msgSend(v6, "rematchCount") + 1);
      -[GKMatchRequest setMaxPlayers:](v13, "setMaxPlayers:", objc_msgSend(v6, "rematchCount") + 1);
      objc_msgSend(v6, "rematchID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__GKMatchmaker_findRematchForMatch_completionHandler___block_invoke;
      v15[3] = &unk_1E75B42D8;
      v16 = v7;
      -[GKMatchmaker handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:](self, "handleMatchRequest:forCurrentMatch:hostedCurrentPlayerCount:serverHosted:rematchID:devicePushToken:completionHandler:", v13, 0, 0, 0, v14, 0, v15);

LABEL_10:
      goto LABEL_11;
    }
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 13, 0);
    v13 = (GKMatchRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, GKMatchRequest *))v7 + 2))(v7, 0, v13);
    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __54__GKMatchmaker_findRematchForMatch_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a5);
  return result;
}

- (BOOL)allInviteesDidRespond
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[GKMatchmaker inviteesByUserID](self, "inviteesByUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      -[GKMatchmaker inviteesByUserID](self, "inviteesByUserID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Waiting for response from invitees: %@", (uint8_t *)&v18, 0xCu);

    }
    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    v11 = (void *)os_log_GKMatch;
    v12 = os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v12)
    {
      v13 = v11;
      -[GKMatchmaker shareInvitees](self, "shareInvitees");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "Waiting for response from messages invitees: %@", (uint8_t *)&v18, 0xCu);

      LOBYTE(v12) = 0;
    }
    return v12;
  }
  -[GKMatchmaker shareInvitees](self, "shareInvitees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  if (!os_log_GKGeneral)
    v15 = GKOSLoggers();
  v16 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    -[GKMatchmaker allInviteesDidRespond].cold.1(v16);
  LOBYTE(v12) = 1;
  return v12;
}

- (void)doneMatchmaking
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BCDE3000, v4, v5, "Done matchmaking Stack: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)cancelPendingInvites
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BCDE3000, v4, v5, "Cancel pending invites. Call Stack: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __36__GKMatchmaker_cancelPendingInvites__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multiplayerService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__GKMatchmaker_cancelPendingInvites__block_invoke_2;
  v6[3] = &unk_1E75B1520;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "cancelGameInviteWithHandler:", v6);

}

uint64_t __36__GKMatchmaker_cancelPendingInvites__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__GKMatchmaker_cancelPendingInvites__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "doneMatchmaking");
  objc_msgSend(*(id *)(a1 + 32), "invitedShareInvitees");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "invitedInvitees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "invitedNearbyPlayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "autoMatchedPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "siblingInvitees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "sharePlayInviteeTokensFromProgrammaticInvite");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setInviterPlayerID:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setInviteApproach:", 0);
}

- (void)cancelPendingInviteToPlayer:(GKPlayer *)player
{
  GKPlayer *v4;
  id v5;
  void *v6;
  NSObject *v7;
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
  GKPlayer *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = player;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[GKPlayer internal](v4, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "cancel pending invite to player: %@", buf, 0xCu);

  }
  if (-[GKMatchmaker removeInvitee:](self, "removeInvitee:", v4))
  {
    -[GKMatchmaker invitedInvitees](self, "invitedInvitees");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayer internal](v4, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v12);

    v27 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker cancelNearbyInvitesToPlayers:](self, "cancelNearbyInvitesToPlayers:", v13);

    LODWORD(v12) = -[GKMatchmaker allInviteesDidRespond](self, "allInviteesDidRespond");
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "multiplayerService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((_DWORD)v12)
    {
      objc_msgSend(v15, "cancelGameInviteWithHandler:", &__block_literal_global_254);

      -[GKMatchmaker doneMatchmaking](self, "doneMatchmaking");
      goto LABEL_14;
    }
    -[GKPlayer internal](v4, "internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removePlayersFromGameInviteV2:handler:", v19, &__block_literal_global_255);

  }
  else
  {
    -[GKPlayer internal](v4, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alias");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

    }
    else
    {
      -[GKPlayer messagesID](v4, "messagesID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_14;
      -[GKMatchmaker shareInvitees](self, "shareInvitees");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer messagesID](v4, "messagesID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObject:", v22);

      -[GKMatchmaker invitedShareInvitees](self, "invitedShareInvitees");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer messagesID](v4, "messagesID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObject:", v24);

      -[GKMatchmaker shareInvitees](self, "shareInvitees");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatchmaker setShareInvitees:propagateToDaemon:](self, "setShareInvitees:propagateToDaemon:", v14, 1);
    }
  }

LABEL_14:
  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("updateAfterCancelPendingInvite")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "update");

  }
}

- (void)cancelInviteToPlayer:(NSString *)playerID
{
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = playerID;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker cancelInviteToPlayer:].cold.1();
  }
  else
  {
    -[GKMatchmaker inviteesByUserID](self, "inviteesByUserID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[GKMatchmaker cancelPendingInviteToPlayer:](self, "cancelPendingInviteToPlayer:", v7);
    }
    else
    {
      if (!os_log_GKGeneral)
        v8 = GKOSLoggers();
      v9 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        -[GKMatchmaker cancelInviteToPlayer:].cold.2((uint64_t)v4, v9, self);
    }

  }
}

- (void)cancel
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BCDE3000, v4, v5, "GKMatchmaker cancel. Stack: \n%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)finishMatchmakingForMatch:(GKMatch *)match
{
  GKMatch *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  GKMatch *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = match;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Finish matchmaking for match: %@", (uint8_t *)&v14, 0xCu);
  }
  -[GKMatch makeInviteMessageDoneData](v4, "makeInviteMessageDoneData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch sendInviteData:](v4, "sendInviteData:", v7);

  -[GKMatchmaker changeGroupActivityStateToGameStarted](self, "changeGroupActivityStateToGameStarted");
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "recording the realtime match persistence timestamp. game from API.", (uint8_t *)&v14, 2u);
  }
  +[GKReporter reporter](GKReporter, "reporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordCurrentRealtimeMatchPersistenceTimestamp");

  +[GKReporter reporter](GKReporter, "reporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.matchFromAPI"));

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "utilityService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordGameStart");

}

- (void)queryPlayerGroupActivity:(NSUInteger)playerGroup withCompletionHandler:(void *)completionHandler
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v5 = completionHandler;
  if (v5)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "multiplayerService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__GKMatchmaker_queryPlayerGroupActivity_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E75B4550;
    v19 = v5;
    objc_msgSend(v7, "getFlowRateForPlayerGroup:handler:", playerGroup, v18);

    +[GKReporter reporter](GKReporter, "reporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("queryGroup"));

  }
  else
  {
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    v10 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker queryPlayerGroupActivity:withCompletionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

uint64_t __63__GKMatchmaker_queryPlayerGroupActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queryActivityWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v3 = completionHandler;
  if (v3)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiplayerService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__GKMatchmaker_queryActivityWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E75B4550;
    v17 = v3;
    objc_msgSend(v5, "getOverallFlowRateWithHandler:", v16);

    +[GKReporter reporter](GKReporter, "reporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("query"));

  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker queryActivityWithCompletionHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

uint64_t __51__GKMatchmaker_queryActivityWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queryQueueActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiplayerService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__GKMatchmaker_queryQueueActivity_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E75B4550;
    v20 = v6;
    objc_msgSend(v8, "getFlowRateForQueue:handler:", v5, v19);

    +[GKReporter reporter](GKReporter, "reporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("queryQueue"));

  }
  else
  {
    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    v11 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker queryQueueActivity:withCompletionHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  }

}

uint64_t __57__GKMatchmaker_queryQueueActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startBrowsingForNearbyPlayersWithHandler:(void *)reachableHandler
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = reachableHandler;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: startBrowsingForNearbyPlayersWithHandler", v7, 2u);
  }
  -[GKMatchmaker setNearbyPlayerHandler:](self, "setNearbyPlayerHandler:", v4);
  -[GKMatchmaker startNearbyBrowsing](self, "startNearbyBrowsing");

}

- (void)startBrowsingForNearbyPlayersWithReachableHandler:(void *)reachableHandler
{
  void (**v4)(void *, const __CFString *, _QWORD);
  id v5;

  v4 = reachableHandler;
  if (!GKApplicationLinkedOnOrAfter())
  {
    -[GKMatchmaker setNearbyPlayerIDHandler:](self, "setNearbyPlayerIDHandler:", v4);
    -[GKMatchmaker startNearbyBrowsing](self, "startNearbyBrowsing");
    goto LABEL_8;
  }
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKMatchmaker startBrowsingForNearbyPlayersWithReachableHandler:].cold.1();
    if (!v4)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (v4)
LABEL_6:
    v4[2](v4, CFSTR("playerID is no longer available"), 0);
LABEL_8:

}

- (void)stopBrowsingForNearbyPlayers
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker: stopBrowsingForNearbyPlayers", v5, 2u);
  }
  -[GKMatchmaker stopNearbyBrowsing](self, "stopNearbyBrowsing");
  -[GKMatchmaker setNearbyPlayerHandler:](self, "setNearbyPlayerHandler:", 0);
}

- (void)startGroupActivityWithPlayerHandler:(void *)handler
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = handler;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "starting browsing for sharePlay players", buf, 2u);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__GKMatchmaker_startGroupActivityWithPlayerHandler___block_invoke;
  v8[3] = &unk_1E75B35A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[GKMatchmaker activateGroupActivityWithHandler:](self, "activateGroupActivityWithHandler:", v8);

}

void __52__GKMatchmaker_startGroupActivityWithPlayerHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_sharePlayPlayerFound_, CFSTR("GKGroupActivityPlayerToInviteNotification"), 0);
    objc_msgSend(*(id *)(a1 + 32), "setSharePlayPlayerHandler:", *(_QWORD *)(a1 + 40));
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    v5 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "started browsing for sharePlay players", v6, 2u);
    }

  }
}

- (void)stopGroupActivity
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "stopping browsing for sharePlay players", v7, 2u);
  }
  -[GKMatchmaker setSharePlayPlayerHandler:](self, "setSharePlayPlayerHandler:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("GKGroupActivityPlayerToInviteNotification"), 0);
  if (-[GKMatchmaker shouldRunGroupActivityWithDescription:](self, "shouldRunGroupActivityWithDescription:", CFSTR("endGroupActivity")))
  {
    -[GKMatchmaker groupActivityManager](self, "groupActivityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endWithCompletionHandler:", &__block_literal_global_265);

  }
}

void __33__GKMatchmaker_stopGroupActivity__block_invoke()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  if (!os_log_GKGeneral)
    v0 = GKOSLoggers();
  v1 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_INFO, "stopped browsing for sharePlay players", v2, 2u);
  }
}

- (void)sharePlayPlayerFound:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v22 = 138412290;
    v23 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "sharePlayPlayerFound: %@", (uint8_t *)&v22, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("player"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pushToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker sharePlayPlayerHandler](self, "sharePlayPlayerHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GKMatchmaker sharePlayPlayerHandler](self, "sharePlayPlayerHandler");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v8);

    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v22 = 138412546;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "sharePlayInviteeTokensFromProgrammaticInvite gets a new player: %@, with token: %@", (uint8_t *)&v22, 0x16u);
    }
    -[GKMatchmaker sharePlayInviteeTokensFromProgrammaticInvite](self, "sharePlayInviteeTokensFromProgrammaticInvite");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v16);

  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = GKOSLoggers();
    v18 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      objc_msgSend(v8, "internal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v21;
      _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "no sharePlayPlayerHandler is set to call it back for developers. player: %@", (uint8_t *)&v22, 0xCu);

    }
  }

}

- (int64_t)responseForDeclineReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3)
    return 1;
  else
    return qword_1BCF3F460[a3 - 2];
}

- (void)localPlayerAcceptedGameInviteNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GKMatchmaker *v9;

  v4 = a3;
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__GKMatchmaker_localPlayerAcceptedGameInviteNotification___block_invoke;
  v7[3] = &unk_1E75B1A28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__GKMatchmaker_localPlayerAcceptedGameInviteNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "pendingInvitationUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(*(id *)(a1 + 40), "cancel");

}

- (void)inviteeAcceptedNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peer-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke;
  block[3] = &unk_1E75B1A78;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "inviteesByUserID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "Invitee accepted notification - userInfo: %@", (uint8_t *)&v10, 0xCu);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "removeInvitee:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "inviteeAccepted:userInfo:allResponded:", v3, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "allInviteesDidRespond"));
  }
  else if (v3
         || (objc_msgSend(*(id *)(a1 + 32), "shareInvitees"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v9 = objc_msgSend(v8, "count"),
             v8,
             !v9))
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "shareInviteeAcceptedWithUserInfo:", *(_QWORD *)(a1 + 48));
  }

}

- (void)shareInviteeAcceptedWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKMatchmaker *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iCloudID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peer-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 2381, "-[GKMatchmaker shareInviteeAcceptedWithUserInfo:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke;
  v22[3] = &unk_1E75B1800;
  v23 = v6;
  v10 = v5;
  v24 = v10;
  v11 = v8;
  v25 = v11;
  v12 = v6;
  objc_msgSend(v11, "perform:", v22);
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_270;
  v17[3] = &unk_1E75B1AA0;
  v18 = v11;
  v19 = self;
  v20 = v10;
  v21 = v4;
  v14 = v4;
  v15 = v10;
  v16 = v11;
  objc_msgSend(v16, "notifyOnQueue:block:", v13, v17);

}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2;
  v6[3] = &unk_1E75B2C78;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  +[GKPlayer loadPlayersForIdentifiersPrivate:withCompletionHandler:](GKPlayer, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v4, v6);

}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2_cold_1();
  }
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMessagesID:", v9);

  objc_msgSend(*(id *)(a1 + 40), "setResult:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_270(uint64_t a1)
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
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "shareInvitees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "shareInvitees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "invitedShareInvitees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v2, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v10);

    objc_msgSend(*(id *)(a1 + 40), "inviteeAccepted:userInfo:allResponded:", v2, *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "allInviteesDidRespond"));
  }
  else
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_270_cold_1();
  }

}

- (void)inviteeAccepted:(id)a3 userInfo:(id)a4 allResponded:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const char *label;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  id v26;
  BOOL v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  BOOL v33;
  BOOL v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  dispatch_get_current_queue();
  v10 = objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v11 = objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
  {
    v28 = v8;
    v12 = (void *)MEMORY[0x1E0CB3940];
    label = dispatch_queue_get_label(v10);
    -[GKMatchmaker invitationQueue](self, "invitationQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_get_label(v14);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v27 = a5;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKMatchmaker inviteeAccepted:userInfo:allResponded:]", label, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.invitationQueue)\n[%s (%s:%d)]"), v17, "-[GKMatchmaker inviteeAccepted:userInfo:allResponded:]", objc_msgSend(v19, "UTF8String"), 2419);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    a5 = v27;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v20);

    v8 = v28;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("peer-id"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iCloudID"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v8)
  {
    v24 = v22 != 0;
    v35[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke;
    v29[3] = &unk_1E75B4608;
    v29[4] = self;
    v30 = v9;
    v31 = v21;
    v33 = v24;
    v32 = v8;
    v34 = a5;
    -[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:](self, "reportResponse:forInvitees:withCompletionHandler:", 0, v25, v29);

  }
  else
  {
    if (!os_log_GKGeneral)
      v26 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker inviteeAccepted:userInfo:allResponded:].cold.1();
  }

}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  __CFString **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  char v34;
  _QWORD v35[5];
  id v36;
  id v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "match");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m", 2434, "-[GKMatchmaker inviteeAccepted:userInfo:allResponded:]_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(*(id *)(a1 + 32), "serverHosted");
    v6 = MEMORY[0x1E0C809B0];
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentMatchRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "internal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "matchType");

      if (v9 != 1)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("peer-push-token"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("invite-version"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedCharValue");

        objc_msgSend(*(id *)(a1 + 32), "match");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "playerPushTokens");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v10, *(_QWORD *)(a1 + 48));

        +[GKReporter reporter](GKReporter, "reporter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.allMatchTotal"));

        v16 = *(unsigned __int8 *)(a1 + 64);
        +[GKReporter reporter](GKReporter, "reporter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = GKRTPushBasedMatchTotal;
        if (v16)
          v19 = GKRTMessageBasedMatchTotal;
        objc_msgSend(v17, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), *v19);

        objc_msgSend(*(id *)(a1 + 32), "match");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "transportContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updateAfterInviteeAcceptedUserInfo:", *(_QWORD *)(a1 + 40));

        objc_msgSend(*(id *)(a1 + 32), "match");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "transportContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "shouldSendInviteUpdate");

        if (v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "match");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "transportContext");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "formAnInviteUpdate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!os_log_GKGeneral)
            v28 = GKOSLoggers();
          v29 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v27;
            _os_log_impl(&dword_1BCDE3000, v29, OS_LOG_TYPE_INFO, "Sending invite update to participants in the lobby channel: %@", buf, 0xCu);
          }
          +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "multiplayerService");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sendInvitationUpdate:handler:", v27, &__block_literal_global_285);

        }
        v35[0] = v6;
        v35[1] = 3221225472;
        v35[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_286;
        v35[3] = &unk_1E75B45B8;
        v35[4] = *(_QWORD *)(a1 + 32);
        v36 = *(id *)(a1 + 56);
        v38 = v12;
        v37 = *(id *)(a1 + 40);
        objc_msgSend(v4, "perform:", v35);

      }
    }
    v33[0] = v6;
    v33[1] = 3221225472;
    v33[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_287;
    v33[3] = &unk_1E75B45E0;
    v34 = *(_BYTE *)(a1 + 65);
    v33[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "notifyOnMainQueueWithBlock:", v33);

  }
  else
  {
    if (!os_log_GKGeneral)
      v32 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_cold_1();
  }
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_284(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_284_cold_1();
  }

}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_286(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "match");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_2;
  v8[3] = &unk_1E75B2050;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v4, "connectToPlayers:version:invitedByLocalPlayer:completionHandler:", v5, v6, 1, v8);

}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 28, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221_cold_3();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "match");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleRelayPushData:onlyIfPreemptive:", *(_QWORD *)(a1 + 40), 1);

    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_287(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "doneMatchmaking");
  return result;
}

- (void)inviteeDeclinedNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__GKMatchmaker_inviteeDeclinedNotification___block_invoke;
  v7[3] = &unk_1E75B1A28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __44__GKMatchmaker_inviteeDeclinedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inviteeDeclinedWithUserInfo:", *(_QWORD *)(a1 + 40));
}

- (void)inviteeDeclinedWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  const char *label;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  SEL v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  BOOL v35;
  int64_t v36;
  void *v37;
  _QWORD v38[5];
  BOOL v39;
  void *v40;
  _QWORD v41[5];
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    label = dispatch_queue_get_label(v5);
    -[GKMatchmaker invitationQueue](self, "invitationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_get_label(v9);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKMatchmaker inviteeDeclinedWithUserInfo:]", label, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchmaker.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.invitationQueue)\n[%s (%s:%d)]"), v12, "-[GKMatchmaker inviteeDeclinedWithUserInfo:]", objc_msgSend(v14, "UTF8String"), 2503);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("peer-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker inviteesByUserID](self, "inviteesByUserID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!os_log_GKGeneral)
    v19 = GKOSLoggers();
  v20 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v4;
    _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "Invitee declined invite - userInfo: %@", buf, 0xCu);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("y"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("y"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "integerValue");

    if (v23 == 5)
    {
      v24 = NSSelectorFromString(CFSTR("showConfirmationAlertWithTitle:message:buttonTitle:block:cancelAction:"));
      +[GKLocalPlayer local](GKLocalPlayer, "local");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) != 0)
      {
        +[GCFLocalizedStrings SOFTWARE_UPDATE_REQUIRED_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SOFTWARE_UPDATE_REQUIRED_TITLE");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v27;
        +[GCFLocalizedStrings SOFTWARE_UPDATE_REQUIRED_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SOFTWARE_UPDATE_REQUIRED_MESSAGE");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v28;
        +[GCFLocalizedStrings GO_TO_SOFTWARE_UPDATE_SETTINGS_BUTTON](_TtC20GameCenterFoundation19GCFLocalizedStrings, "GO_TO_SOFTWARE_UPDATE_SETTINGS_BUTTON");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v29;
        v41[3] = &__block_literal_global_290;
        v41[4] = &__block_literal_global_291;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        +[GKLocalPlayer local](GKLocalPlayer, "local");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_gkPerformSelector:withObjects:", v24, v30);

        +[GKAPIReporter reporter](GKAPIReporter, "reporter");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "recordMultiplayerErrorID:", CFSTR("inviteeDeclinedIncompatibleTransport"));

      }
      else
      {
        if (!os_log_GKGeneral)
          v33 = GKOSLoggers();
        v34 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v34, OS_LOG_TYPE_INFO, "showSharePlayMatchFullAlert failed since localPlayer does not respond to selector showAlertWithTitle:andMessage:", buf, 2u);
        }
      }
    }
    if (-[GKMatchmaker removeInvitee:](self, "removeInvitee:", v18))
    {
      v35 = -[GKMatchmaker allInviteesDidRespond](self, "allInviteesDidRespond");
      v36 = -[GKMatchmaker responseForDeclineReason:](self, "responseForDeclineReason:", v23);
      v40 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __44__GKMatchmaker_inviteeDeclinedWithUserInfo___block_invoke_294;
      v38[3] = &unk_1E75B45E0;
      v39 = v35;
      v38[4] = self;
      -[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:](self, "reportResponse:forInvitees:withCompletionHandler:", v36, v37, v38);

    }
  }
  else
  {
    -[GKMatchmaker removeInvitee:](self, "removeInvitee:", v18);
  }

}

void __44__GKMatchmaker_inviteeDeclinedWithUserInfo___block_invoke()
{
  void *v0;
  id v1;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "utilityService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSoftwareUpdateSettings");

}

uint64_t __44__GKMatchmaker_inviteeDeclinedWithUserInfo___block_invoke_294(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "doneMatchmaking");
  return result;
}

- (void)inviteeUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GKMatchmaker *v9;

  v4 = a3;
  -[GKMatchmaker invitationQueue](self, "invitationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__GKMatchmaker_inviteeUpdateNotification___block_invoke;
  v7[3] = &unk_1E75B1A28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__GKMatchmaker_inviteeUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  GKUpdateInviteInfo *v9;
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
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  int v33;
  void *v34;
  __int16 v35;
  GKUpdateInviteInfo *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("x"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sid")), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      v33 = 138412290;
      v34 = v2;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Invitee should update invite related info with: %@", (uint8_t *)&v33, 0xCu);
    }
    v9 = objc_alloc_init(GKUpdateInviteInfo);
    -[GKUpdateInviteInfo setSessionID:](v9, "setSessionID:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKUpdateInviteInfo setMatchID:](v9, "setMatchID:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[GKTransportParticipant participantsFrom:withKey:](GKTransportParticipant, "participantsFrom:withKey:", v4, CFSTR("gp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKUpdateInviteInfo setGameParticipants:](v9, "setGameParticipants:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[GKTransportParticipant participantsFrom:withKey:](GKTransportParticipant, "participantsFrom:withKey:", v4, CFSTR("lp"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKUpdateInviteInfo setLobbyParticipants:](v9, "setLobbyParticipants:", v15);

    }
    objc_msgSend(*(id *)(a1 + 40), "pendingInvitationUpdates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[GKUpdateInviteInfo mergeWithUpdate:](v9, "mergeWithUpdate:", v17);
    objc_msgSend(*(id *)(a1 + 40), "match");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 40), "match");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "transportContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateWithInviteUpdateInfo:", v9);

      objc_msgSend(*(id *)(a1 + 40), "match");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transportContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 40), "pendingInvitationUpdates");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "match");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "transportContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sessionID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObjectForKey:", v27);

      }
      objc_msgSend(*(id *)(a1 + 40), "match");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "connectToPlayers:version:invitedByLocalPlayer:completionHandler:", MEMORY[0x1E0C9AA60], 1, 0, &__block_literal_global_300);
    }
    else
    {
      if (!os_log_GKGeneral)
        v31 = GKOSLoggers();
      v32 = os_log_GKFastSync;
      if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
      {
        v33 = 138412546;
        v34 = v6;
        v35 = 2112;
        v36 = v9;
        _os_log_impl(&dword_1BCDE3000, v32, OS_LOG_TYPE_INFO, "No match yet. For sessionID: %@, adding pending invite update: %@", (uint8_t *)&v33, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "pendingInvitationUpdates");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v9, v6);
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v29 = GKOSLoggers();
    v30 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_1BCDE3000, v30, OS_LOG_TYPE_INFO, "Cannot find sessionID from updateInvite notification.", (uint8_t *)&v33, 2u);
    }
  }

}

void __42__GKMatchmaker_inviteeUpdateNotification___block_invoke_299(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 28, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __42__GKMatchmaker_inviteeUpdateNotification___block_invoke_299_cold_1();

  }
}

- (void)setNearbyPlayerAccepted:(id)a3 connectionData:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[GKMatchmaker removeInvitee:](self, "removeInvitee:", v6))
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      objc_msgSend(v6, "internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "Nearby player accepted: %@", buf, 0xCu);

    }
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__GKMatchmaker_setNearbyPlayerAccepted_connectionData___block_invoke;
    v14[3] = &unk_1E75B1A78;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    -[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:](self, "reportResponse:forInvitees:withCompletionHandler:", 0, v13, v14);

  }
}

void __55__GKMatchmaker_setNearbyPlayerAccepted_connectionData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "match");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "match");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connectToNearbyPlayer:withConnectionData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    if (objc_msgSend(*(id *)(a1 + 32), "allInviteesDidRespond"))
      objc_msgSend(*(id *)(a1 + 32), "doneMatchmaking");
  }
}

- (void)setNearbyPlayerDeclined:(id)a3 reason:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[GKMatchmaker removeInvitee:](self, "removeInvitee:", v6))
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      objc_msgSend(v6, "internal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "Nearby player declined: %@", buf, 0xCu);

    }
    v12 = -[GKMatchmaker responseForDeclineReason:](self, "responseForDeclineReason:", a4);
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__GKMatchmaker_setNearbyPlayerDeclined_reason___block_invoke;
    v14[3] = &unk_1E75B1590;
    v14[4] = self;
    -[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:](self, "reportResponse:forInvitees:withCompletionHandler:", v12, v13, v14);

  }
}

uint64_t __47__GKMatchmaker_setNearbyPlayerDeclined_reason___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allInviteesDidRespond");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "doneMatchmaking");
  return result;
}

- (void)setNearbyPlayerFailed:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[GKMatchmaker removeInvitee:](self, "removeInvitee:", v4))
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      objc_msgSend(v4, "internal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "Failed to set nearby player: %@", buf, 0xCu);

    }
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__GKMatchmaker_setNearbyPlayerFailed___block_invoke;
    v11[3] = &unk_1E75B1590;
    v11[4] = self;
    -[GKMatchmaker reportResponse:forInvitees:withCompletionHandler:](self, "reportResponse:forInvitees:withCompletionHandler:", 2, v10, v11);

  }
}

uint64_t __38__GKMatchmaker_setNearbyPlayerFailed___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allInviteesDidRespond");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "doneMatchmaking");
  return result;
}

- (void)promptForRadarWithDescriptionAddition:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[GKPreferences shared](GKPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalBuild");

  if (v6)
  {
    if (-[GKMatchmaker canPromptTapToRadar](self, "canPromptTapToRadar"))
    {
      if (!os_log_GKGeneral)
        v7 = GKOSLoggers();
      v8 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Starting prompting TTR with description: %@", buf, 0xCu);
      }
      +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "multiplayerService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__GKMatchmaker_promptForRadarWithDescriptionAddition___block_invoke;
      v13[3] = &unk_1E75B1590;
      v13[4] = self;
      objc_msgSend(v10, "fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:", &stru_1E75BB5A8, v4, v13);

    }
    else
    {
      if (!os_log_GKGeneral)
        v11 = GKOSLoggers();
      v12 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Already prompted tap to radar. Skip.", buf, 2u);
      }
    }
  }

}

uint64_t __54__GKMatchmaker_promptForRadarWithDescriptionAddition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCanPromptTapToRadar:", 0);
}

- (void)nearbyPlayerFound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discoveryInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v5)
  {
    -[GKMatchmaker foundNearbyDeviceID:discoveryInfo:](self, "foundNearbyDeviceID:discoveryInfo:", v5, v6);
  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker nearbyPlayerFound:].cold.1((uint64_t)v5);
  }

}

- (void)nearbyPlayerLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[GKMatchmaker lostNearbyDeviceID:](self, "lostNearbyDeviceID:", v5);
  }
  else
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker nearbyPlayerLost:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)nearbyDataReceived:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v5)
  {
    -[GKMatchmaker receivedData:fromNearbyDeviceID:](self, "receivedData:fromNearbyDeviceID:", v6, v5);
  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatchmaker nearbyDataReceived:].cold.1((uint64_t)v5);
  }

}

- (void)matchRequestRecipientsSet:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[GKMatchmaker setCurrentMatchRequest:](self, "setCurrentMatchRequest:", v4);

}

+ (GKMatchmaker)sharedMatchmaker
{
  id v2;
  void *v3;
  id v4;

  if (objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess"))
  {
    if (!os_log_GKGeneral)
      v2 = GKOSLoggers();
    v3 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      +[GKMatchmaker sharedMatchmaker].cold.1(v3);
    v4 = 0;
  }
  else
  {
    if (sharedMatchmaker_sDispatchOnceToken != -1)
      dispatch_once(&sharedMatchmaker_sDispatchOnceToken, &__block_literal_global_309);
    v4 = (id)sharedMatchmaker_sSharedMatchmaker;
  }
  return (GKMatchmaker *)v4;
}

void __32__GKMatchmaker_sharedMatchmaker__block_invoke()
{
  id v0;
  void *v1;
  GKMatchmaker *v2;
  void *v3;

  if (!os_log_GKGeneral)
    v0 = GKOSLoggers();
  v1 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __32__GKMatchmaker_sharedMatchmaker__block_invoke_cold_1(v1);
  v2 = objc_alloc_init(GKMatchmaker);
  v3 = (void *)sharedMatchmaker_sSharedMatchmaker;
  sharedMatchmaker_sSharedMatchmaker = (uint64_t)v2;

}

+ (BOOL)canPlayMultiplayerGameWithPlayers:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GKPreferences shared](GKPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "multiplayerAllowedPlayerType");

  if (v5)
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "multiplayerAllowedPlayerType");

    if (v7 == 2
      || (+[GKPreferences shared](GKPreferences, "shared"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "multiplayerAllowedPlayerType"),
          v8,
          v9 != 1))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v3;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isLocalPlayer", (_QWORD)v19) & 1) == 0)
            {
              objc_msgSend(v15, "friendBiDirectional");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_1E75FB058);

              if (!v17)
              {
                LOBYTE(v5) = 0;
                goto LABEL_16;
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            continue;
          break;
        }
      }
      LOBYTE(v5) = 1;
LABEL_16:

    }
  }

  return v5;
}

- (_TtC20GameCenterFoundation22GKGroupActivityManager)groupActivityManager
{
  return self->_groupActivityManager;
}

- (void)setGroupActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupActivityManager, a3);
}

- (void)inviteHandler
{
  return self->_inviteHandler;
}

- (GKMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (id)inviteeResponseHandler
{
  return self->_inviteeResponseHandler;
}

- (void)setInviteeResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)recipientResponseHandler
{
  return self->_recipientResponseHandler;
}

- (void)setRecipientResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)inviteesByUserID
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInviteesByUserID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)nearbyPlayerHandler
{
  return self->_nearbyPlayerHandler;
}

- (void)setNearbyPlayerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)nearbyPlayerIDHandler
{
  return self->_nearbyPlayerIDHandler;
}

- (void)setNearbyPlayerIDHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)lookForInviteQueue
{
  return self->_lookForInviteQueue;
}

- (void)setLookForInviteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lookForInviteQueue, a3);
}

- (int)matching
{
  return self->_matching;
}

- (void)setMatching:(int)a3
{
  self->_matching = a3;
}

- (BOOL)nearbyAdvertising
{
  return self->_nearbyAdvertising;
}

- (void)setNearbyAdvertising:(BOOL)a3
{
  self->_nearbyAdvertising = a3;
}

- (NSMutableDictionary)nearbyPlayers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNearbyPlayers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)wasNearbyBrowsing
{
  return self->_wasNearbyBrowsing;
}

- (void)setWasNearbyBrowsing:(BOOL)a3
{
  self->_wasNearbyBrowsing = a3;
}

- (BOOL)nearbyBrowsing
{
  return self->_nearbyBrowsing;
}

- (void)setNearbyBrowsing:(BOOL)a3
{
  self->_nearbyBrowsing = a3;
}

- (NSDate)nearbyQueryLastCheckDate
{
  return self->_nearbyQueryLastCheckDate;
}

- (void)setNearbyQueryLastCheckDate:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyQueryLastCheckDate, a3);
}

- (double)nearbyQueryAllowance
{
  return self->_nearbyQueryAllowance;
}

- (void)setNearbyQueryAllowance:(double)a3
{
  self->_nearbyQueryAllowance = a3;
}

- (NSSet)nearbyCompatibleVersionHashes
{
  return self->_nearbyCompatibleVersionHashes;
}

- (void)setNearbyCompatibleVersionHashes:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyCompatibleVersionHashes, a3);
}

- (NSSet)nearbyCompatibleShortVersionHashes
{
  return self->_nearbyCompatibleShortVersionHashes;
}

- (void)setNearbyCompatibleShortVersionHashes:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyCompatibleShortVersionHashes, a3);
}

- (BOOL)generatingCompatiblityHashes
{
  return self->_generatingCompatiblityHashes;
}

- (void)setGeneratingCompatiblityHashes:(BOOL)a3
{
  self->_generatingCompatiblityHashes = a3;
}

- (GKDispatchGroup)compatibilityHashGroup
{
  return self->_compatibilityHashGroup;
}

- (void)setCompatibilityHashGroup:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityHashGroup, a3);
}

- (NSMutableDictionary)nearbyInvites
{
  return self->_nearbyInvites;
}

- (void)setNearbyInvites:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyInvites, a3);
}

- (NSMutableArray)shareInvitees
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setShareInvitees:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableArray)acceptedInviteesTokens
{
  return self->_acceptedInviteesTokens;
}

- (void)setAcceptedInviteesTokens:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedInviteesTokens, a3);
}

- (BOOL)canPromptTapToRadar
{
  return self->_canPromptTapToRadar;
}

- (void)setCanPromptTapToRadar:(BOOL)a3
{
  self->_canPromptTapToRadar = a3;
}

- (BOOL)serverHosted
{
  return self->_serverHosted;
}

- (void)setServerHosted:(BOOL)a3
{
  self->_serverHosted = a3;
}

- (NSMutableDictionary)pendingInvitationUpdates
{
  return self->_pendingInvitationUpdates;
}

- (void)setPendingInvitationUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInvitationUpdates, a3);
}

- (BOOL)nearbyDiscoverySetup
{
  return self->_nearbyDiscoverySetup;
}

- (void)setNearbyDiscoverySetup:(BOOL)a3
{
  self->_nearbyDiscoverySetup = a3;
}

- (id)sharePlayPlayerHandler
{
  return self->_sharePlayPlayerHandler;
}

- (void)setSharePlayPlayerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSMutableSet)autoMatchedPlayers
{
  return self->_autoMatchedPlayers;
}

- (void)setAutoMatchedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_autoMatchedPlayers, a3);
}

- (NSMutableSet)invitedInvitees
{
  return self->_invitedInvitees;
}

- (void)setInvitedInvitees:(id)a3
{
  objc_storeStrong((id *)&self->_invitedInvitees, a3);
}

- (NSMutableSet)invitedShareInvitees
{
  return (NSMutableSet *)objc_getProperty(self, a2, 200, 1);
}

- (void)setInvitedShareInvitees:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMutableSet)invitedNearbyPlayers
{
  return self->_invitedNearbyPlayers;
}

- (void)setInvitedNearbyPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_invitedNearbyPlayers, a3);
}

- (NSString)inviterPlayerID
{
  return self->_inviterPlayerID;
}

- (void)setInviterPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_inviterPlayerID, a3);
}

- (unint64_t)inviteApproach
{
  return self->_inviteApproach;
}

- (void)setInviteApproach:(unint64_t)a3
{
  self->_inviteApproach = a3;
}

- (NSMutableSet)siblingInvitees
{
  return self->_siblingInvitees;
}

- (void)setSiblingInvitees:(id)a3
{
  objc_storeStrong((id *)&self->_siblingInvitees, a3);
}

- (NSMutableDictionary)sharePlayInviteeTokensFromProgrammaticInvite
{
  return self->_sharePlayInviteeTokensFromProgrammaticInvite;
}

- (void)setSharePlayInviteeTokensFromProgrammaticInvite:(id)a3
{
  objc_storeStrong((id *)&self->_sharePlayInviteeTokensFromProgrammaticInvite, a3);
}

- (GKMatchRequest)currentMatchRequest
{
  return self->_currentMatchRequest;
}

- (void)setCurrentMatchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentMatchRequest, a3);
}

- (OS_dispatch_queue)invitationQueue
{
  return self->_invitationQueue;
}

- (void)setInvitationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_invitationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationQueue, 0);
  objc_storeStrong((id *)&self->_currentMatchRequest, 0);
  objc_storeStrong((id *)&self->_sharePlayInviteeTokensFromProgrammaticInvite, 0);
  objc_storeStrong((id *)&self->_siblingInvitees, 0);
  objc_storeStrong((id *)&self->_inviterPlayerID, 0);
  objc_storeStrong((id *)&self->_invitedNearbyPlayers, 0);
  objc_storeStrong((id *)&self->_invitedShareInvitees, 0);
  objc_storeStrong((id *)&self->_invitedInvitees, 0);
  objc_storeStrong((id *)&self->_autoMatchedPlayers, 0);
  objc_storeStrong(&self->_sharePlayPlayerHandler, 0);
  objc_storeStrong((id *)&self->_pendingInvitationUpdates, 0);
  objc_storeStrong((id *)&self->_acceptedInviteesTokens, 0);
  objc_storeStrong((id *)&self->_shareInvitees, 0);
  objc_storeStrong((id *)&self->_nearbyInvites, 0);
  objc_storeStrong((id *)&self->_compatibilityHashGroup, 0);
  objc_storeStrong((id *)&self->_nearbyCompatibleShortVersionHashes, 0);
  objc_storeStrong((id *)&self->_nearbyCompatibleVersionHashes, 0);
  objc_storeStrong((id *)&self->_nearbyQueryLastCheckDate, 0);
  objc_storeStrong((id *)&self->_nearbyPlayers, 0);
  objc_storeStrong((id *)&self->_lookForInviteQueue, 0);
  objc_storeStrong(&self->_nearbyPlayerIDHandler, 0);
  objc_storeStrong(&self->_nearbyPlayerHandler, 0);
  objc_storeStrong((id *)&self->_inviteesByUserID, 0);
  objc_storeStrong(&self->_recipientResponseHandler, 0);
  objc_storeStrong(&self->_inviteeResponseHandler, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong(&self->_inviteHandler, 0);
  objc_storeStrong((id *)&self->_groupActivityManager, 0);
}

+ (id)syncQueue
{
  if (syncQueue_onceToken_0 != -1)
    dispatch_once(&syncQueue_onceToken_0, &__block_literal_global_43);
  return (id)syncQueue_sSyncQueue_0;
}

void __33__GKMatchmaker_Nearby__syncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.GameKit.GKMatchmaker.nearby.sync", v2);
  v1 = (void *)syncQueue_sSyncQueue_0;
  syncQueue_sSyncQueue_0 = (uint64_t)v0;

}

- (void)performSync:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  const char *label;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  dispatch_block_t block;

  block = a3;
  objc_msgSend((id)objc_opt_class(), "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    label = dispatch_queue_get_label(v3);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%s invoked on the same queue(\"%s\"), would deadlock at %@"), "-[GKMatchmaker(Nearby) performSync:]", label, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKMatchmaker+Nearby.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]"), v8, "-[GKMatchmaker(Nearby) performSync:]", objc_msgSend(v10, "UTF8String"), 163);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  dispatch_sync(v3, block);

}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  -[GKMatchmaker stopNearbyAdvertising](self, "stopNearbyAdvertising", a3);
  if (-[GKMatchmaker nearbyBrowsing](self, "nearbyBrowsing"))
  {
    -[GKMatchmaker setWasNearbyBrowsing:](self, "setWasNearbyBrowsing:", 1);
    -[GKMatchmaker stopNearbyBrowsing](self, "stopNearbyBrowsing");
  }
  -[GKMatchmaker cancelSentNearbyInvites](self, "cancelSentNearbyInvites");
  -[GKMatchmaker declineReceivedNearbyInvites](self, "declineReceivedNearbyInvites");
}

- (void)applicationWillTerminateNotification:(id)a3
{
  -[GKMatchmaker stopNearbyAdvertising](self, "stopNearbyAdvertising", a3);
  -[GKMatchmaker stopNearbyBrowsing](self, "stopNearbyBrowsing");
  -[GKMatchmaker cancelSentNearbyInvites](self, "cancelSentNearbyInvites");
  -[GKMatchmaker declineReceivedNearbyInvites](self, "declineReceivedNearbyInvites");
  -[GKMatchmaker leaveGroupActivity](self, "leaveGroupActivity");
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[GKMatchmaker wasNearbyBrowsing](self, "wasNearbyBrowsing", a3))
  {
    -[GKMatchmaker setWasNearbyBrowsing:](self, "setWasNearbyBrowsing:", 0);
    -[GKMatchmaker nearbyPlayerHandler](self, "nearbyPlayerHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[GKMatchmaker nearbyPlayers](self, "nearbyPlayers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[GKMatchmaker setNearbyDevice:reachable:](self, "setNearbyDevice:reachable:", v12, 0);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

      -[GKMatchmaker startNearbyBrowsing](self, "startNearbyBrowsing");
    }
  }
}

- (void)setupNearbyDiscovery
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (-[GKMatchmaker nearbyDiscoverySetup](self, "nearbyDiscoverySetup"))
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    v4 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "skip setting up nearbyDiscovery as we have done it", buf, 2u);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: setupNearbyDiscovery", v9, 2u);
    }
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiplayerService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupNearbyDiscovery");

    -[GKMatchmaker setNearbyDiscoverySetup:](self, "setNearbyDiscoverySetup:", 1);
  }
}

- (int64_t)currentEnvironment
{
  return 5;
}

+ (id)descriptionForNearbyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("profile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("photoData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v23 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v13, "length") < 9)
          {
            objc_msgSend(v13, "description");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v13), "bytes"), 8, 0);
            objc_msgSend(v14, "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(">"), CFSTR("...>"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v6, "setObject:forKey:", v16, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(v19, "setObject:forKey:", v6, CFSTR("photoData"));
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("profile"));
    objc_msgSend(v20, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v22;
    v3 = v23;
    v5 = v21;
  }
  else
  {
    objc_msgSend(v3, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)receivedData:(id)a3 fromNearbyDeviceID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    +[GKMatchmaker descriptionForNearbyDictionary:](GKMatchmaker, "descriptionForNearbyDictionary:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    *(_QWORD *)v20 = v11;
    *(_WORD *)&v20[8] = 2112;
    *(_QWORD *)&v20[10] = v6;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "received dict %@ from nearby deviceID %@", (uint8_t *)&v19, 0x16u);

  }
  if (v7)
  {
    -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("usePeerDiscovery"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
      objc_msgSend(v12, "setUsePeerDiscovery:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("message"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    switch(v16)
    {
      case 0:
        if (-[GKMatchmaker nearbyAdvertising](self, "nearbyAdvertising"))
          -[GKMatchmaker handleNearbyProfileQuery:fromDevice:](self, "handleNearbyProfileQuery:fromDevice:", v7, v12);
        break;
      case 1:
        if (-[GKMatchmaker nearbyBrowsing](self, "nearbyBrowsing"))
          -[GKMatchmaker handleNearbyProfileResponse:fromDevice:withCompletionHandler:](self, "handleNearbyProfileResponse:fromDevice:withCompletionHandler:", v7, v12, 0);
        break;
      case 2:
        if (-[GKMatchmaker nearbyAdvertising](self, "nearbyAdvertising"))
          -[GKMatchmaker handleNearbyInvite:fromDevice:](self, "handleNearbyInvite:fromDevice:", v7, v12);
        break;
      case 3:
        -[GKMatchmaker handleNearbyInviteResponse:fromDevice:](self, "handleNearbyInviteResponse:fromDevice:", v7, v12);
        break;
      case 4:
        if (-[GKMatchmaker nearbyAdvertising](self, "nearbyAdvertising"))
          -[GKMatchmaker nearbyInviteWasCancelled:fromDevice:](self, "nearbyInviteWasCancelled:fromDevice:", v7, v12);
        break;
      case 5:
        -[GKMatchmaker establishNearbyFriendRelationships:fromDevice:](self, "establishNearbyFriendRelationships:fromDevice:", v7, v12);
        break;
      default:
        if (!os_log_GKGeneral)
          v17 = GKOSLoggers();
        v18 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        {
          v19 = 67109634;
          *(_DWORD *)v20 = v16;
          *(_WORD *)&v20[4] = 2112;
          *(_QWORD *)&v20[6] = v7;
          *(_WORD *)&v20[14] = 2112;
          *(_QWORD *)&v20[16] = v12;
          _os_log_error_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_ERROR, "Unknown nearby message type: %u dictionary:%@ from deviceID:%@", (uint8_t *)&v19, 0x1Cu);
        }
        break;
    }

  }
}

- (void)determineIfShouldRespondToNearbyPlayer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  dispatch_group_t v15;
  id v16;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    v8 = dispatch_group_create();
    objc_msgSend(v7, "objectForKey:", CFSTR("playerID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[GKPreferences shared](GKPreferences, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke;
    v13[3] = &unk_1E75B5FA8;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    v16 = v6;
    v11 = v8;
    v12 = v9;
    objc_msgSend(v10, "getMultiplayerAllowedPlayerTypeWithHandler:", v13);

  }
}

void __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[4];

  v47[1] = *MEMORY[0x1E0C80C00];
  v4 = a2 == 0;
  +[GKPreferences shared](GKPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDisallowInvitesFromStrangers");
  if (a2 == 1)
    v7 = 1;
  else
    v7 = v6;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  if (v4)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "nearbyAdvertising");
    if (v8)
      LOBYTE(v8) = objc_msgSend(*(id *)(a1 + 32), "shouldRespondToNearbyQuery");
  }
  v36 = v8;
  if (*((_BYTE *)v34 + 24))
    v9 = v7;
  else
    v9 = 0;
  v10 = MEMORY[0x1E0C809B0];
  if (v9 == 1)
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = *(void **)(a1 + 40);
    if (v13)
    {
      -[NSObject internal](v11, "internal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "playerID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isEqualToString:", v15);

      if ((v16 & 1) == 0)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v47[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v10;
        v30[1] = 3221225472;
        v30[2] = __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_2;
        v30[3] = &unk_1E75B5F80;
        v32 = &v33;
        v31 = *(id *)(a1 + 48);
        +[GKPlayer loadPlayersForIdentifiersPrivate:withCompletionHandler:](GKPlayer, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v17, v30);

      }
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v18 = GKOSLoggers();
    v12 = (id)os_log_GKMatch;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 == 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "nearbyAdvertising"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldRespondToNearbyQuery"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v38 = v19;
      v39 = 2112;
      v40 = v20;
      v41 = 2112;
      v42 = v21;
      v43 = 2112;
      v44 = v22;
      v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "should not respond to nearby player: %@. blockMultiplayer = %@, advertising = %@, should respond to query = %@, friends only = %@", buf, 0x34u);

    }
  }

  v24 = *(NSObject **)(a1 + 48);
  dispatch_get_global_queue(0, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_86;
  block[3] = &unk_1E75B2F90;
  v27 = *(id *)(a1 + 40);
  v29 = &v33;
  v28 = *(id *)(a1 + 56);
  dispatch_group_notify(v24, v25, block);

  _Block_object_dispose(&v33, 8);
}

void __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendBiDirectional");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isEqualToNumber:", &unk_1E75FB178);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__GKMatchmaker_Nearby__determineIfShouldRespondToNearbyPlayer_handler___block_invoke_86(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v4 = a1[4];
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v7 = v3;
    objc_msgSend(v5, "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "should respond to nearby player %@:%@", (uint8_t *)&v10, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (BOOL)shouldRespondToNearbyQuery
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "always return YES for shouldRespondToNearbyQuery", v5, 2u);
  }
  return 1;
}

- (id)profileDictionaryForLocalPlayer
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("playerID");
  objc_msgSend(v2, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E75BB5A8;
  v16[0] = v6;
  v15[1] = CFSTR("alias");
  objc_msgSend(v2, "alias");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1E75BB5A8;
  v16[1] = v9;
  v15[2] = CFSTR("photos");
  objc_msgSend(v2, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)

  return v13;
}

- (void)loadPhotoDataDictionaryWithHandler:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v22 = v3;
    v5 = dispatch_group_create();
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v13);
          dispatch_group_enter(v5);
          objc_msgSend(v9, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_get_global_queue(0, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke;
          v26[3] = &unk_1E75B5FD0;
          v27 = v6;
          v28 = v15;
          v29 = v5;
          v19 = v15;
          objc_msgSend(v16, "_gkLoadRemoteImageDataForURL:subdirectory:filename:queue:handler:", v17, 0, 0, v18, v26);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke_2;
    block[3] = &unk_1E75B1BF0;
    v4 = v22;
    v24 = v6;
    v25 = v22;
    v20 = v6;
    dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

  }
}

void __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __59__GKMatchmaker_Nearby__loadPhotoDataDictionaryWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)unreleasedHash
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__GKMatchmaker_Nearby__unreleasedHash__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  if (unreleasedHash_onceToken != -1)
    dispatch_once(&unreleasedHash_onceToken, block);
  return (id)unreleasedHash__unreleasedHash;
}

void __38__GKMatchmaker_Nearby__unreleasedHash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  +[GKGame currentGame](GKGame, "currentGame");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hashForBundleID:version:platform:", v2, CFSTR("-1"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)unreleasedHash__unreleasedHash;
  unreleasedHash__unreleasedHash = v3;

}

- (id)compatibilityHashQueue
{
  if (compatibilityHashQueue_onceToken != -1)
    dispatch_once(&compatibilityHashQueue_onceToken, &__block_literal_global_100);
  return (id)compatibilityHashQueue_sHashQueue;
}

void __46__GKMatchmaker_Nearby__compatibilityHashQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.gamecenter.compatibilityhashqueue", v2);
  v1 = (void *)compatibilityHashQueue_sHashQueue;
  compatibilityHashQueue_sHashQueue = (uint64_t)v0;

}

- (void)getHashedCompatibilitySetsWithHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: getHashedCompatibilitySetsWithHandler", buf, 2u);
  }
  -[GKMatchmaker compatibilityHashQueue](self, "compatibilityHashQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke;
  v9[3] = &unk_1E75B23E8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

void __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "nearbyCompatibleVersionHashes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "generatingCompatiblityHashes") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "compatibilityHashGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_2;
    v8[3] = &unk_1E75B1C80;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "perform:", v8);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "compatibilityHashGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_4;
    v6[3] = &unk_1E75B1BF0;
    v5 = *(id *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v4, "notifyOnMainQueueWithBlock:", v6);

  }
}

void __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setGeneratingCompatiblityHashes:", 1);
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_3;
  v6[3] = &unk_1E75B23E8;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "generateHashedCompatibilitySetWithHandler:", v6);

}

uint64_t __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setGeneratingCompatiblityHashes:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__GKMatchmaker_Nearby__getHashedCompatibilitySetsWithHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "nearbyCompatibleVersionHashes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nearbyCompatibleShortVersionHashes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)generateHashedCompatibilitySetWithHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: generateHashedCompatibilitySet", buf, 2u);
  }
  +[GKGame currentGame](GKGame, "currentGame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "multiplayerService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gameDescriptorDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__GKMatchmaker_Nearby__generateHashedCompatibilitySetWithHandler___block_invoke;
  v13[3] = &unk_1E75B2C78;
  v13[4] = self;
  v14 = v7;
  v15 = v4;
  v11 = v4;
  v12 = v7;
  objc_msgSend(v9, "getCompatibilityMatrix:handler:", v10, v13);

}

void __66__GKMatchmaker_Nearby__generateHashedCompatibilitySetWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v4;
  if (objc_msgSend(v3, "count") < 1)
  {
    v37 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bundleVersion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hashForBundleID:version:platform:", v38, v39, objc_msgSend(*(id *)(a1 + 40), "platform"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObject:", v40);

    v41 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bundleVersion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "hashForBundleID:version:platform:", v42, v43, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObject:", v44);

    v45 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortBundleVersion");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "hashForBundleID:version:platform:", v46, v47, objc_msgSend(*(id *)(a1 + 40), "platform"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v48);

    v49 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortBundleVersion");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "hashForBundleID:version:platform:", v50, v51, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v52);

    v4 = v60;
  }
  else
  {
    v63 = v5;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v54 = v3;
    obj = v3;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    if (v57)
    {
      v56 = *(_QWORD *)v74;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v74 != v56)
            objc_enumerationMutation(obj);
          v58 = v6;
          v7 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v6);
          objc_msgSend(v7, "bundleID", v54);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v7, "platform");
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v61 = v7;
          objc_msgSend(v7, "versions");
          v59 = (id)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v70 != v11)
                  objc_enumerationMutation(v59);
                v13 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                objc_msgSend(*(id *)(a1 + 32), "hashForBundleID:version:platform:", v8, v13, 0);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v14);
                if (!os_log_GKGeneral)
                  v15 = GKOSLoggers();
                v16 = os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v79 = v8;
                  v80 = 2112;
                  v81 = v13;
                  v82 = 2112;
                  v83 = v14;
                  _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, version = %@, compatible hash = %@", buf, 0x20u);
                }
                objc_msgSend(*(id *)(a1 + 32), "hashForBundleID:version:platform:", v8, v13, objc_msgSend(v61, "platform"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v4, "addObject:", v17);
                if (!os_log_GKGeneral)
                  v18 = GKOSLoggers();
                v19 = (void *)os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  v20 = (void *)MEMORY[0x1E0CB37E8];
                  v21 = v19;
                  objc_msgSend(v20, "numberWithInteger:", v64);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v79 = v8;
                  v80 = 2112;
                  v81 = v22;
                  v82 = 2112;
                  v83 = v13;
                  v84 = 2112;
                  v85 = v17;
                  _os_log_impl(&dword_1BCDE3000, v21, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, platform = %@, version = %@, compatible hash = %@", buf, 0x2Au);

                  v4 = v60;
                }

              }
              v10 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
            }
            while (v10);
          }

          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          objc_msgSend(v61, "shortVersions");
          v62 = (id)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v66;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v66 != v25)
                  objc_enumerationMutation(v62);
                v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
                objc_msgSend(*(id *)(a1 + 32), "hashForBundleID:version:platform:", v8, v27, 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "addObject:", v28);
                if (!os_log_GKGeneral)
                  v29 = GKOSLoggers();
                v30 = os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v79 = v8;
                  v80 = 2112;
                  v81 = v27;
                  v82 = 2112;
                  v83 = v28;
                  _os_log_impl(&dword_1BCDE3000, v30, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, shortVersion = %@, compatible hash = %@", buf, 0x20u);
                }
                objc_msgSend(*(id *)(a1 + 32), "hashForBundleID:version:platform:", v8, v27, v64);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v63, "addObject:", v31);
                if (!os_log_GKGeneral)
                  v32 = GKOSLoggers();
                v33 = (void *)os_log_GKMatch;
                if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
                {
                  v34 = (void *)MEMORY[0x1E0CB37E8];
                  v35 = v33;
                  objc_msgSend(v34, "numberWithInteger:", v64);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v79 = v8;
                  v80 = 2112;
                  v81 = v36;
                  v82 = 2112;
                  v83 = v27;
                  v84 = 2112;
                  v85 = v31;
                  _os_log_impl(&dword_1BCDE3000, v35, OS_LOG_TYPE_INFO, "nearby compatibility matrix: bundleID = %@, platform = %@, shortVersion = %@, compatible hash = %@", buf, 0x2Au);

                  v4 = v60;
                }

              }
              v24 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
            }
            while (v24);
          }

          v6 = v58 + 1;
        }
        while (v58 + 1 != v57);
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
      }
      while (v57);
    }

    v3 = v54;
    v5 = v63;
  }
  objc_msgSend(*(id *)(a1 + 32), "setNearbyCompatibleVersionHashes:", v4, v54);
  objc_msgSend(*(id *)(a1 + 32), "setNearbyCompatibleShortVersionHashes:", v5);
  v53 = *(_QWORD *)(a1 + 48);
  if (v53)
    (*(void (**)(void))(v53 + 16))();

}

- (id)_nearbyDeviceWithDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[GKMatchmaker nearbyPlayers](self, "nearbyPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[GKNearbyDevice nearbyDeviceWithID:](GKNearbyDevice, "nearbyDeviceWithID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
  return v6;
}

- (id)nearbyDeviceWithDeviceID:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__GKMatchmaker_Nearby__nearbyDeviceWithDeviceID___block_invoke;
  v8[3] = &unk_1E75B5EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[GKMatchmaker performSync:](self, "performSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__GKMatchmaker_Nearby__nearbyDeviceWithDeviceID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_nearbyDeviceWithDeviceID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)hashForBundleID:(id)a3 version:(id)a4 platform:(int64_t)a5
{
  id v7;
  __CFString *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _BYTE *v20;
  int v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  if (!os_log_GKGeneral)
    v9 = GKOSLoggers();
  v10 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: hashForBundleID", buf, 2u);
  }
  if (!v8)
  {
    v11 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v12 = GKOSLoggers();
      v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "version is nil while retrieving the hash for bundleID: %@", buf, 0xCu);
    }
    v8 = &stru_1E75BB5A8;
  }
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR(".%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v18;
  }
  v19 = objc_retainAutorelease(v14);
  v20 = (_BYTE *)objc_msgSend(v19, "UTF8String");
  v21 = *v20;
  if (*v20)
  {
    v22 = v20 + 1;
    LODWORD(v23) = 5381;
    do
    {
      v23 = (33 * v23 + v21);
      v24 = *v22++;
      v21 = v24;
    }
    while (v24);
  }
  else
  {
    v23 = 5381;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%X"), v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)hashForCurrentGameUsingBundleVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[GKGame currentGame](GKGame, "currentGame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker hashForBundleID:version:platform:](self, "hashForBundleID:version:platform:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hashForCurrentGameUsingShortBundleVersionAndPlatform
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  +[GKGame currentGame](GKGame, "currentGame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortBundleVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "bundleVersion");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v3, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker hashForBundleID:version:platform:](self, "hashForBundleID:version:platform:", v8, v7, objc_msgSend(v3, "platform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)startNearbyAdvertising
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  uint8_t buf[8];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "startNearbyAdvertising", buf, 2u);
  }
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAuthenticated")
    && !-[GKMatchmaker nearbyAdvertising](self, "nearbyAdvertising")
    && !+[GKGame isGameCenter](GKGame, "isGameCenter"))
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "shouldAllowNearbyMultiplayer") & 1) != 0)
    {
      +[GKPreferences shared](GKPreferences, "shared");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "multiplayerAllowedPlayerType");

      if (v8)
      {
        -[GKMatchmaker getHashedCompatibilitySetsWithHandler:](self, "getHashedCompatibilitySetsWithHandler:", 0);
        -[GKMatchmaker setupNearbyDiscovery](self, "setupNearbyDiscovery");
        v9 = MEMORY[0x1E0C809B0];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke;
        v19[3] = &unk_1E75B1590;
        v19[4] = self;
        -[GKMatchmaker performSync:](self, "performSync:", v19);
        v21[0] = CFSTR("e");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), -[GKMatchmaker currentEnvironment](self, "currentEnvironment"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v10;
        v21[1] = CFSTR("h");
        -[GKMatchmaker hashForCurrentGameUsingBundleVersion](self, "hashForCurrentGameUsingBundleVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v11;
        v21[2] = CFSTR("hp");
        -[GKMatchmaker hashForCurrentGameUsingShortBundleVersionAndPlatform](self, "hashForCurrentGameUsingShortBundleVersionAndPlatform");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "multiplayerService");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_2;
        v17[3] = &unk_1E75B3800;
        v17[4] = self;
        v18 = v13;
        v16 = v13;
        objc_msgSend(v15, "startNearbyAdvertisingWithDiscoveryInfo:handler:", v16, v17);

      }
    }
    else
    {

    }
  }

}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNearbyInvites:", v2);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNearbyPlayers:", v3);

}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3;
  block[3] = &unk_1E75B1A78;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setNearbyQueryAllowance:", 10.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNearbyQueryLastCheckDate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setNearbyAdvertising:", 1);
  v3 = a1 + 40;
  if (*(_QWORD *)(a1 + 40))
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    v5 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3_cold_1(v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "startNearbyAdvertising:Started advertising for nearby multiplayer", (uint8_t *)&v17, 2u);
    }
    if (!os_log_GKGeneral)
      v14 = GKOSLoggers();
    v15 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 48);
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "start advertising for nearby multiplayer: %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)stopNearbyAdvertising
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[GKMatchmaker nearbyAdvertising](self, "nearbyAdvertising"))
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "multiplayerService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__GKMatchmaker_Nearby__stopNearbyAdvertising__block_invoke;
    v5[3] = &unk_1E75B1590;
    v5[4] = self;
    objc_msgSend(v4, "stopNearbyAdvertisingWithHandler:", v5);

  }
}

void __45__GKMatchmaker_Nearby__stopNearbyAdvertising__block_invoke(uint64_t a1)
{
  id v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "setNearbyAdvertising:", 0);
  if (!os_log_GKGeneral)
    v1 = GKOSLoggers();
  v2 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v2, OS_LOG_TYPE_INFO, "stopNearbyAdvertising: stopped advertising for nearby players", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "stopped advertising for nearby multiplayer", v5, 2u);
  }
}

- (void)updateNearbyAdvertising
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint8_t v7[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "updateNearbyAdvertising", v7, 2u);
  }
  if (-[GKMatchmaker hasInviteListener](self, "hasInviteListener")
    && (+[GKPreferences shared](GKPreferences, "shared"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "shouldAllowNearbyMultiplayer"),
        v5,
        v6))
  {
    -[GKMatchmaker startNearbyAdvertising](self, "startNearbyAdvertising");
  }
  else
  {
    -[GKMatchmaker stopNearbyAdvertising](self, "stopNearbyAdvertising");
  }
}

- (void)startNearbyBrowsing
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: startNearbyBrowsing", buf, 2u);
  }
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAuthenticated"))
  {
    if (!-[GKMatchmaker nearbyBrowsing](self, "nearbyBrowsing"))
    {
      +[GKPreferences shared](GKPreferences, "shared");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "multiplayerAllowedPlayerType");

      if (v7)
      {
        -[GKMatchmaker getHashedCompatibilitySetsWithHandler:](self, "getHashedCompatibilitySetsWithHandler:", 0);
        -[GKMatchmaker setupNearbyDiscovery](self, "setupNearbyDiscovery");
        v8 = MEMORY[0x1E0C809B0];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke;
        v14[3] = &unk_1E75B1590;
        v14[4] = self;
        -[GKMatchmaker performSync:](self, "performSync:", v14);
        +[GKDaemonProxy proxyForPlayer:](GKDaemonProxy, "proxyForPlayer:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "multiplayerService");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "internal");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "playerID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke_120;
        v13[3] = &unk_1E75B1590;
        v13[4] = self;
        objc_msgSend(v10, "startNearbyBrowsingWithPlayerID:handler:", v12, v13);

      }
    }
  }

}

void __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "nearbyPlayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134217984;
    v9 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: creating new nearbyPlayers cache (clearing %lu previous entries)", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNearbyPlayers:", v7);

}

void __43__GKMatchmaker_Nearby__startNearbyBrowsing__block_invoke_120(uint64_t a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "setNearbyBrowsing:", 1);
  if (!os_log_GKGeneral)
    v1 = GKOSLoggers();
  v2 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BCDE3000, v2, OS_LOG_TYPE_INFO, "started browsing for nearby players", v3, 2u);
  }
}

- (void)stopNearbyBrowsing
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: stopNearbyBrowsing", buf, 2u);
  }
  if (-[GKMatchmaker nearbyBrowsing](self, "nearbyBrowsing"))
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "multiplayerService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__GKMatchmaker_Nearby__stopNearbyBrowsing__block_invoke;
    v7[3] = &unk_1E75B1590;
    v7[4] = self;
    objc_msgSend(v6, "stopNearbyBrowsingWithHandler:", v7);

  }
}

void __42__GKMatchmaker_Nearby__stopNearbyBrowsing__block_invoke(uint64_t a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "setNearbyBrowsing:", 0);
  if (!os_log_GKGeneral)
    v1 = GKOSLoggers();
  v2 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BCDE3000, v2, OS_LOG_TYPE_INFO, "stopped browsing for nearby players", v3, 2u);
  }
}

- (void)foundNearbyDeviceID:(id)a3 discoveryInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "found nearby deviceID: %@ discoveryInfo: %@", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("e"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 == -[GKMatchmaker currentEnvironment](self, "currentEnvironment"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__GKMatchmaker_Nearby__foundNearbyDeviceID_discoveryInfo___block_invoke;
    v14[3] = &unk_1E75B6018;
    v14[4] = self;
    v15 = v7;
    v16 = v6;
    -[GKMatchmaker getHashedCompatibilitySetsWithHandler:](self, "getHashedCompatibilitySetsWithHandler:", v14);

  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "ignoring device %@, environment mismatch", buf, 0xCu);
    }
  }

}

void __58__GKMatchmaker_Nearby__foundNearbyDeviceID_discoveryInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unreleasedHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v7) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v5, "containsObject:", v7);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("hp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("h"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (v6)
  {
    v13 = objc_msgSend(v6, "containsObject:", v12);
    if (!v5)
      goto LABEL_20;
  }
  else
  {
    v13 = 1;
    if (!v5)
    {
LABEL_20:
      if (!os_log_GKGeneral)
        v23 = GKOSLoggers();
      v24 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v24, OS_LOG_TYPE_INFO, "advertised app may be compatible", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "nearbyDeviceWithDeviceID:", *(_QWORD *)(a1 + 48));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKGame currentGame](GKGame, "currentGame");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("message"));

      objc_msgSend(v26, "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("bundleID"));

      objc_msgSend(v26, "bundleVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("bundleVersion"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("isDevelopmentVersion"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "platform"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, CFSTR("platform"));

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("usePeerDiscovery"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = objc_msgSend(v33, "BOOLValue");

      if ((_DWORD)v30)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, CFSTR("usePeerDiscovery"));

        objc_msgSend(v25, "setUsePeerDiscovery:", 1);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("devicePushToken"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("devicePushToken"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setDevicePushToken:", v36);

        }
      }
      +[GKGame currentGame](GKGame, "currentGame");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "shortBundleVersion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v26, "shortBundleVersion");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v39, CFSTR("shortBundleVersion"));

      }
      objc_msgSend(v25, "sendDictionary:withCompletionHandler:", v27, 0);

      goto LABEL_30;
    }
  }
  v14 = objc_msgSend(v5, "containsObject:", v12);
  if (v12)
    v15 = v8;
  else
    v15 = 1;
  if (((v15 | v13) & 1) != 0 || v14)
    goto LABEL_20;
  if (!os_log_GKGeneral)
    v16 = GKOSLoggers();
  v17 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    objc_msgSend(v5, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v20;
    v42 = 2112;
    v43 = v22;
    _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "advertised app not compatible - compatible Version Hashes: %@, compatible Short Version Hashes: %@", buf, 0x16u);

  }
LABEL_30:

}

- (void)lostNearbyDeviceID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "lost nearby deviceID: %@", (uint8_t *)&v8, 0xCu);
  }
  -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker setNearbyDevice:reachable:](self, "setNearbyDevice:reachable:", v7, 0);

}

- (void)handleNearbyProfileResponse:(id)a3 fromDevice:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  GKMatchmaker *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "state") && objc_msgSend(v9, "state") != 1)
  {
    if (!os_log_GKGeneral)
      v18 = GKOSLoggers();
    v19 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      objc_msgSend(v9, "deviceID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "state"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "not handling profile response from deviceID: %@, because the state of this device is: %@", buf, 0x16u);

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend(v9, "deviceID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "state"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "received profile response from deviceID: %@, device state: %@", buf, 0x16u);

    }
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "multiplayerService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E75B6040;
    v24 = v8;
    v25 = v9;
    v26 = self;
    v27 = v10;
    objc_msgSend(v17, "updateCacheWithNearbyProfileDictionary:handler:", v24, v23);

  }
}

void __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      objc_msgSend(v3, "conciseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "deviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "received player %@ response from deviceID: %@", buf, 0x16u);

    }
    if ((objc_msgSend(v4, "isLocalPlayer") & 1) == 0)
    {
      v16 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[GKMatchmaker canPlayMultiplayerGameWithPlayers:](GKMatchmaker, "canPlayMultiplayerGameWithPlayers:", v10);

      if (v11)
      {
        objc_msgSend(a1[5], "setPlayer:", v4);
        objc_msgSend(a1[5], "setState:", 1);
        objc_msgSend(a1[6], "setNearbyDevice:reachable:", a1[5], 1);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_136;
        v14[3] = &unk_1E75B1520;
        v15 = a1[7];
        objc_msgSend(v4, "updateScopedIDs:", v14);

      }
    }

  }
  else
  {
    v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v13 = GKOSLoggers();
      v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_cold_1((uint64_t)a1, v12);
  }

}

uint64_t __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_136(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int)numberOfNearbyDevicesForPlayer:(id)a3 withState:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__GKMatchmaker_Nearby__numberOfNearbyDevicesForPlayer_withState___block_invoke;
  v9[3] = &unk_1E75B6068;
  v9[4] = self;
  v12 = a4;
  v7 = v6;
  v10 = v7;
  v11 = &v13;
  -[GKMatchmaker performSync:](self, "performSync:", v9);
  LODWORD(self) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return (int)self;
}

void __65__GKMatchmaker_Nearby__numberOfNearbyDevicesForPlayer_withState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "nearbyPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_nearbyDeviceWithDeviceID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "state") == *(_QWORD *)(a1 + 56))
        {
          v8 = *(void **)(a1 + 40);
          objc_msgSend(v7, "player");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

          if ((_DWORD)v8)
            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)setNearbyDevice:(id)a3 reachable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id *v11;
  void *v12;
  int v13;
  _QWORD block[5];
  id v15;
  BOOL v16;
  _QWORD v17[5];
  id v18;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (v4)
    {
      objc_msgSend(v6, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[GKMatchmaker numberOfNearbyDevicesForPlayer:withState:](self, "numberOfNearbyDevicesForPlayer:withState:", v8, 1);

      if (v9 != 1)
        goto LABEL_12;
      goto LABEL_10;
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke;
    v17[3] = &unk_1E75B1A28;
    v17[4] = self;
    v10 = v6;
    v18 = v10;
    -[GKMatchmaker performSync:](self, "performSync:", v17);
    if (objc_msgSend(v10, "state") != 1)
    {
      v11 = &v18;
LABEL_11:

      goto LABEL_12;
    }
    if (objc_msgSend(v10, "usePeerDiscovery"))
    {

LABEL_10:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke_2;
      block[3] = &unk_1E75B6090;
      block[4] = self;
      v11 = &v15;
      v15 = v7;
      v16 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      goto LABEL_11;
    }
    objc_msgSend(v10, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GKMatchmaker numberOfNearbyDevicesForPlayer:withState:](self, "numberOfNearbyDevicesForPlayer:withState:", v12, 1);

    if (!v13)
      goto LABEL_10;
  }
LABEL_12:

}

void __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nearbyPlayers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

void __50__GKMatchmaker_Nearby__setNearbyDevice_reachable___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "nearbyPlayerHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "nearbyPlayerHandler");
    v8 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v4, *(unsigned __int8 *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v3, "nearbyPlayerIDHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    objc_msgSend(*(id *)(a1 + 32), "nearbyPlayerIDHandler");
    v8 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v7, *(unsigned __int8 *)(a1 + 48));

  }
}

- (id)nearbyDevicesForPlayer:(id)a3 withState:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint8_t *v14;
  int64_t v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: nearbyDevicesForPlayer:withState", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__13;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__GKMatchmaker_Nearby__nearbyDevicesForPlayer_withState___block_invoke;
  v12[3] = &unk_1E75B6068;
  v12[4] = self;
  v15 = a4;
  v9 = v6;
  v13 = v9;
  v14 = buf;
  -[GKMatchmaker performSync:](self, "performSync:", v12);
  v10 = *((id *)v17 + 5);

  _Block_object_dispose(buf, 8);
  return v10;
}

void __57__GKMatchmaker_Nearby__nearbyDevicesForPlayer_withState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "nearbyPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_nearbyDeviceWithDeviceID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "state") == *(_QWORD *)(a1 + 56))
        {
          if (!*(_QWORD *)(a1 + 40)
            || (objc_msgSend(v7, "player"),
                v8 = (void *)objc_claimAutoreleasedReturnValue(),
                v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40)),
                v8,
                v9))
          {
            v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            if (!v10)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v11 = objc_claimAutoreleasedReturnValue();
              v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v13 = *(void **)(v12 + 40);
              *(_QWORD *)(v12 + 40) = v11;

              v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            }
            objc_msgSend(v10, "addObject:", v7);
          }
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (id)formAGKMatchRequestForNearbyInviteWithOriginalRequest:(id)a3 nearbyPlayerIDs:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  -[GKMatchmaker reduceRecipientsForMatchRequest:toPlayersWithPlayerIDs:](self, "reduceRecipientsForMatchRequest:toPlayersWithPlayerIDs:", v7, v6);

  return v7;
}

- (void)reduceRecipientsForMatchRequest:(id)a3 toPlayersWithPlayerIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v5;
  objc_msgSend(v5, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "internal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "playerID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "containsObject:", v15);

        if (v16)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRecipients:", v17);

  objc_msgSend(v19, "internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRecipientPlayerIDs:", v6);

}

- (void)inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  uint64_t v20;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD);
  void *v40;
  void *v41;
  id obj;
  void *v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  GKMatchmaker *v48;
  id v49;
  id v50;
  void (**v51)(_QWORD);
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[8];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest", buf, 2u);
  }
  objc_msgSend(v6, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "matchType");

  if (v11 == 1)
  {
    v7[2](v7);
  }
  else
  {
    v39 = v7;
    -[GKMatchmaker match](self, "match");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transportContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateForLegacyNearbyInvite");

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v40 = v6;
    objc_msgSend(v6, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recipientPlayerIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v44 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v44)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          +[GKPlayer playerFromPlayerID:](GKPlayer, "playerFromPlayerID:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKMatchmaker nearbyDevicesForPlayer:withState:](self, "nearbyDevicesForPlayer:withState:", v21, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            if (!v18)
            {
              -[GKMatchmaker match](self, "match");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "nearbyConnectionData");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v43, "addObjectsFromArray:", v22);
            +[GKReporter reporter](GKReporter, "reporter");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "reportEvent:type:", CFSTR("com.apple.GameKit.invite"), CFSTR("initiate.nearby"));

            +[GKReporter reporter](GKReporter, "reporter");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "reportEvent:type:", CFSTR("com.apple.GameKit.MultiplayerPlayerSelection"), CFSTR("NearbySelected"));

            -[GKMatchmaker invitedNearbyPlayers](self, "invitedNearbyPlayers");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v21, "internal");
            v28 = v18;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "playerID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setWithObject:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "unionSet:", v31);

            -[GKMatchmaker match](self, "match");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "internal");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v33;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "reportInviteSentWithApproach:isHosted:recipients:", 3, 0, v34);

            v18 = v28;
          }
          else
          {
            objc_msgSend(v41, "addObject:", v20);
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    if (objc_msgSend(v43, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatchmaker setAcceptedInviteesTokens:](self, "setAcceptedInviteesTokens:", v35);

      +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "friendService");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke;
      v45[3] = &unk_1E75B6108;
      v46 = v18;
      v6 = v40;
      v47 = v40;
      v48 = self;
      v49 = v43;
      v38 = v41;
      v50 = v41;
      v7 = v39;
      v51 = v39;
      objc_msgSend(v37, "getNearbyTokenForLocalPlayerWithHandler:", v45);

    }
    else
    {
      v7 = v39;
      v39[2](v39);
      v6 = v40;
      v38 = v41;
    }

  }
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  id v25;
  int8x16_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  int8x16_t v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[7];
  _QWORD v46[9];

  v46[7] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v45[0] = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v46[0] = v4;
  v46[1] = v6;
  v45[1] = CFSTR("connectionData");
  v45[2] = CFSTR("inviteMessage");
  objc_msgSend(v5, "inviteMessage");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E75BB5A8;
  if (v7)
    v9 = (const __CFString *)v7;
  v46[2] = v9;
  v45[3] = CFSTR("playerGroup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "playerGroup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v10;
  v45[4] = CFSTR("playerAttributes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "playerAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v11;
  v45[5] = CFSTR("profile");
  objc_msgSend(*(id *)(a1 + 48), "profileDictionaryForLocalPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = CFSTR("playerNearbyToken");
  v46[5] = v12;
  v46[6] = v3;
  v28 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKMatchmaker+Nearby.m", 956, "-[GKMatchmaker(Nearby) inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest:handler:]_block_invoke");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = a1;
  v17 = *(id *)(a1 + 56);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v22, "setState:", 2);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2;
        v36[3] = &unk_1E75B2C00;
        v36[4] = v22;
        v37 = v29;
        v38 = v15;
        v39 = v16;
        objc_msgSend(v14, "perform:", v36);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v19);
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_154;
  v30[3] = &unk_1E75B60E0;
  v31 = v16;
  v32 = v15;
  v33 = *(id *)(v27 + 64);
  v26 = *(int8x16_t *)(v27 + 40);
  v23 = (id)v26.i64[0];
  v34 = vextq_s8(v26, v26, 8uLL);
  v35 = *(id *)(v27 + 72);
  v24 = v15;
  v25 = v16;
  objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v30);

}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3;
  v9[3] = &unk_1E75B2168;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = v3;
  v8 = v3;
  objc_msgSend(v5, "sendDictionary:withCompletionHandler:", v6, v9);

}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    v5 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3_cold_1((uint64_t)a1, v5, v6);
    v7 = (void *)a1[6];
  }
  else
  {
    v7 = (void *)a1[7];
  }
  objc_msgSend(v7, "addObject:", a1[5]);
  (*(void (**)(void))(a1[8] + 16))();

}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_154(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2_155;
  v24[3] = &unk_1E75B60B8;
  v4 = v2;
  v25 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "player", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "containsObject:", v11);

        if ((v12 & 1) == 0)
        {
          v13 = *(void **)(a1 + 48);
          objc_msgSend(v10, "player");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "internal");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "playerID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v16);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

  v18 = *(void **)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reduceRecipientsForMatchRequest:toPlayersWithPlayerIDs:", v17, v19);

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_2_155(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "player");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)inviteAnyNearbyPlayersViaGCSWithRequest:(id)a3 onlineConnectionData:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD);
  id v36;
  void *v37;
  id obj;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  void (**v49)(_QWORD);
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[16];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v35 = v9;
  v36 = v8;
  v11 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: inviteAnyNearbyPlayersViaGCSWithRequest", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v37 = v7;
  objc_msgSend(v7, "internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recipientPlayerIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v44 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v44)
  {
    v41 = v12;
    v42 = *(_QWORD *)v55;
    v39 = v14;
    v40 = v13;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v55 != v42)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        +[GKPlayer playerFromPlayerID:](GKPlayer, "playerFromPlayerID:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKMatchmaker nearbyDevicesForPlayer:withState:](self, "nearbyDevicesForPlayer:withState:", v19, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          v45 = v19;
          objc_msgSend(v13, "addObject:", v18);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v51;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v51 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
                objc_msgSend(v27, "devicePushToken");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  objc_msgSend(v27, "devicePushToken");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "addObject:", v29);

                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            }
            while (v24);
          }

          v14 = v39;
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v21, v18);

          v13 = v40;
          v12 = v41;
          v19 = v45;
        }
        else
        {
          objc_msgSend(v12, "addObject:", v18);
        }

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v44);
  }

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v37;
    -[GKMatchmaker formAGKMatchRequestForNearbyInviteWithOriginalRequest:nearbyPlayerIDs:](self, "formAGKMatchRequestForNearbyInviteWithOriginalRequest:nearbyPlayerIDs:", v37, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke;
    v46[3] = &unk_1E75B6130;
    v46[4] = self;
    v47 = v37;
    v48 = v12;
    v33 = v35;
    v49 = v35;
    v34 = v36;
    -[GKMatchmaker invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:](self, "invitePlayersWithRequest:serverHosted:onlineConnectionData:devicePushTokenMap:isNearbyInvite:completionHandler:", v32, 0, v36, v14, 1, v46);

  }
  else
  {
    v33 = v35;
    v35[2](v35);
    v34 = v36;
    v31 = v37;
  }

}

void __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke_cold_1((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    v19 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reduceRecipientsForMatchRequest:toPlayersWithPlayerIDs:", v20, v21);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)cancelNearbyInvitesToPlayers:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  _BYTE v35[128];
  const __CFString *v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchMaker: cancelNearbyInvitesToPlayers", buf, 2u);
  }
  v36 = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v9)
  {
    v10 = v9;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[GKMatchmaker nearbyDevicesForPlayer:withState:](self, "nearbyDevicesForPlayer:withState:", v12, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v26 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "sendDictionary:withCompletionHandler:", v8, 0);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
            }
            while (v16);
          }

          -[GKMatchmaker invitedNearbyPlayers](self, "invitedNearbyPlayers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "internal");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "playerID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObject:", v21);

          +[GKReporter reporter](GKReporter, "reporter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "reportEvent:type:", CFSTR("com.apple.GameKit.invite"), CFSTR("cancel.nearby"));

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v10);
  }

}

- (void)cancelSentNearbyInvites
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKMatchmaker nearbyDevicesForPlayer:withState:](self, "nearbyDevicesForPlayer:withState:", 0, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __47__GKMatchmaker_Nearby__cancelSentNearbyInvites__block_invoke;
        v12[3] = &unk_1E75B3800;
        v12[4] = self;
        v12[5] = v11;
        objc_msgSend(v11, "sendDictionary:withCompletionHandler:", v4, v12);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __47__GKMatchmaker_Nearby__cancelSentNearbyInvites__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNearbyPlayerFailed:deviceID:", v3, v4);

  +[GKReporter reporter](GKReporter, "reporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:type:", CFSTR("com.apple.GameKit.invite"), CFSTR("cancel.nearby"));

}

- (void)handleNearbyInviteResponse:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  _QWORD v24[4];
  id v25;
  GKMatchmaker *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "Handle nearby invite response dict: %@", buf, 0xCu);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("accepted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKMatchmaker+Nearby.m", 1087, "-[GKMatchmaker(Nearby) handleNearbyInviteResponse:fromDevice:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKMatchmaker acceptedInviteesTokens](self, "acceptedInviteesTokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v31[0] = CFSTR("message");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v17;
      v31[1] = CFSTR("playerNearbyTokens");
      -[GKMatchmaker acceptedInviteesTokens](self, "acceptedInviteesTokens");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke;
      v28[3] = &unk_1E75B1788;
      v29 = v7;
      v30 = v19;
      v20 = v19;
      objc_msgSend(v13, "perform:", v28);

    }
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_3;
    v24[3] = &unk_1E75B1A78;
    v25 = v6;
    v26 = self;
    v27 = v7;
    objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v24);

    v21 = v25;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("declineReason"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "integerValue");

    objc_msgSend(v7, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker setNearbyPlayerDeclined:deviceID:reason:](self, "setNearbyPlayerDeclined:deviceID:reason:", v13, v21, v23);
  }

}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_2;
  v7[3] = &unk_1E75B29C8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "sendDictionary:withCompletionHandler:", v4, v7);

}

uint64_t __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[4];

  v41[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("playerNearbyToken"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKMatchmaker+Nearby.m", 1104, "-[GKMatchmaker(Nearby) handleNearbyInviteResponse:fromDevice:]_block_invoke_3");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v2, "length");
  v6 = MEMORY[0x1E0C809B0];
  v7 = "sessionObserverTask" + 16;
  if (v5)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "friendService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "establishNearbyRelationshipsUsingPlayerTokens:handler:", v10, &__block_literal_global_163);

    objc_msgSend(*(id *)(a1 + 40), "nearbyDevicesForPlayer:withState:", 0, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v39[0] = CFSTR("message");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = CFSTR("playerNearbyTokens");
      v40[0] = v12;
      v24 = v2;
      v38 = v2;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            v31[0] = v6;
            v31[1] = 3221225472;
            v31[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_5;
            v31[3] = &unk_1E75B1788;
            v31[4] = v20;
            v32 = v14;
            objc_msgSend(v4, "perform:", v31);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v17);
      }

      v2 = v24;
      v7 = "ask";
    }
    v29[0] = v6;
    v29[1] = *((_QWORD *)v7 + 76);
    v29[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_7;
    v29[3] = &unk_1E75B1788;
    v29[4] = *(_QWORD *)(a1 + 40);
    v30 = v2;
    objc_msgSend(v4, "perform:", v29);

  }
  v25[0] = v6;
  v25[1] = *((_QWORD *)v7 + 76);
  v25[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_8;
  v25[3] = &unk_1E75B1A78;
  v21 = *(id *)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 40);
  v23 = *(void **)(a1 + 48);
  v26 = v21;
  v27 = v22;
  v28 = v23;
  objc_msgSend(v4, "notifyOnMainQueueWithBlock:", v25);

}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_6;
  v7[3] = &unk_1E75B29C8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "sendDictionary:withCompletionHandler:", v4, v7);

}

uint64_t __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(void);

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "acceptedInviteesTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  v5[2]();
}

void __62__GKMatchmaker_Nearby__handleNearbyInviteResponse_fromDevice___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("connectionData"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNearbyPlayerAccepted:deviceID:connectionData:", v3, v4, v5);

}

- (void)establishNearbyFriendRelationships:(id)a3 fromDevice:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("playerNearbyTokens"), a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "friendService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "establishNearbyRelationshipsUsingPlayerTokens:handler:", v6, &__block_literal_global_166);

  }
}

- (void)setNearbyPlayerAccepted:(id)a3 deviceID:(id)a4 connectionData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "state") == 2)
  {
    objc_msgSend(v10, "setState:", 3);
    -[GKMatchmaker setNearbyPlayerAccepted:connectionData:](self, "setNearbyPlayerAccepted:connectionData:", v8, v9);
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker cancelNearbyInvitesToPlayers:](self, "cancelNearbyInvitesToPlayers:", v11);

  }
}

- (void)setNearbyPlayerDeclined:(id)a3 deviceID:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "state") == 2)
  {
    objc_msgSend(v10, "setState:", 4);
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "multiplayerService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__GKMatchmaker_Nearby__setNearbyPlayerDeclined_deviceID_reason___block_invoke;
    v13[3] = &unk_1E75B1A50;
    v13[4] = self;
    v14 = v8;
    v15 = a5;
    objc_msgSend(v12, "forgetParticipant:deviceID:handler:", 0, v9, v13);

  }
}

uint64_t __64__GKMatchmaker_Nearby__setNearbyPlayerDeclined_deviceID_reason___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfNearbyDevicesForPlayer:withState:", *(_QWORD *)(a1 + 40), 2);
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setNearbyPlayerDeclined:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)setNearbyPlayerFailed:(id)a3 deviceID:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "state") == 2)
  {
    objc_msgSend(v6, "setState:", 0);
    if (!-[GKMatchmaker numberOfNearbyDevicesForPlayer:withState:](self, "numberOfNearbyDevicesForPlayer:withState:", v7, 2))-[GKMatchmaker setNearbyPlayerFailed:](self, "setNearbyPlayerFailed:", v7);
  }

}

- (void)handleNearbyProfileQuery:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortBundleVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isDevelopmentVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "BOOLValue");
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v13 = 0;
    if (!v8)
      goto LABEL_7;
  }
  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke;
    v16[3] = &unk_1E75B61C0;
    v16[4] = self;
    v17 = v6;
    v18 = v10;
    v19 = v9;
    v22 = v13;
    v20 = v8;
    v21 = v7;
    -[GKMatchmaker getHashedCompatibilitySetsWithHandler:](self, "getHashedCompatibilitySetsWithHandler:", v16);

    goto LABEL_11;
  }
LABEL_7:
  if (!os_log_GKGeneral)
    v14 = GKOSLoggers();
  v15 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "nearby profile query missing bundle info:%@", buf, 0xCu);
  }
LABEL_11:

}

void __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;

  v5 = a2;
  v6 = a3;
  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke_2;
  v13[3] = &unk_1E75B6198;
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v22 = *(_BYTE *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v18 = *(id *)(a1 + 64);
  v19 = v6;
  v20 = v5;
  v21 = *(id *)(a1 + 72);
  v11 = v5;
  v12 = v6;
  objc_msgSend(v8, "determineIfShouldRespondToNearbyPlayer:handler:", v14, v13);

}

void __60__GKMatchmaker_Nearby__handleNearbyProfileQuery_fromDevice___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("platform"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("platform"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "integerValue");

    }
    else
    {
      v5 = 0;
    }

    if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("-1")) & 1) != 0)
      goto LABEL_13;
    if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("-1")) & 1) != 0)
      goto LABEL_13;
    if (*(_BYTE *)(a1 + 96))
      goto LABEL_13;
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 56), "hashForBundleID:version:platform:", *(_QWORD *)(a1 + 64), v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 72), "containsObject:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 56), "hashForBundleID:version:platform:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(*(id *)(a1 + 80), "containsObject:", v12);

    if (v13)
    {
LABEL_13:
      objc_msgSend(*(id *)(a1 + 56), "sendProfileResponseToDevice:", *(_QWORD *)(a1 + 88));
    }
    else
    {
      if (!os_log_GKGeneral)
        v14 = GKOSLoggers();
      v15 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 64);
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = v15;
        objc_msgSend(v17, "numberWithInteger:", v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v22 = 138413058;
        v23 = v16;
        v24 = 2112;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        v28 = 2112;
        v29 = v21;
        _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "Not compatibile with app making profile query: bundleID: %@, platform: %@, short version, %@, version %@", (uint8_t *)&v22, 0x2Au);

      }
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "Nearby - should not respond to nearby profile query:%@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)sendProfileResponseToDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  GKMatchmaker *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v4, "deviceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "sending profile response to device:%@", buf, 0xCu);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke;
  v10[3] = &unk_1E75B6210;
  v11 = v4;
  v12 = self;
  v9 = v4;
  -[GKMatchmaker loadPhotoDataDictionaryWithHandler:](self, "loadPhotoDataDictionaryWithHandler:", v10);

}

void __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    objc_msgSend(v6, "deviceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "did load photo data:%@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "profileDictionaryForLocalPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v3, CFSTR("photoData"));

    v9 = v10;
  }
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "multiplayerService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke_168;
  v14[3] = &unk_1E75B61E8;
  v15 = v9;
  v16 = *(id *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v12, "fetchDevicePushToken:", v14);

}

void __52__GKMatchmaker_Nearby__sendProfileResponseToDevice___block_invoke_168(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "Did get push token for local device: %@.", buf, 0xCu);
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1, CFSTR("message"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v12[0] = v6;
    v12[1] = v7;
    v11[1] = CFSTR("profile");
    v11[2] = CFSTR("pushToken");
    v12[2] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "sendDictionary:withCompletionHandler:", v8, 0);
  }
  else
  {
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    v10 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "Cannot reply to profile query with a nil push token.", buf, 2u);
    }
  }

}

- (void)handleNearbyInvite:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  GKMatchmaker *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke;
  v10[3] = &unk_1E75B6238;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  -[GKMatchmaker determineIfShouldRespondToNearbyPlayer:handler:](self, "determineIfShouldRespondToNearbyPlayer:handler:", v8, v10);

}

void __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") >= 1
      && (objc_msgSend(*(id *)(a1 + 32), "player"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      objc_msgSend(*(id *)(a1 + 40), "presentNearbyInvite:fromDevice:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    }
    else
    {
      v5 = *(void **)(a1 + 40);
      v4 = *(void **)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 32);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke_2;
      v7[3] = &unk_1E75B1A78;
      v7[4] = v5;
      v8 = v4;
      v9 = *(id *)(a1 + 32);
      objc_msgSend(v5, "handleNearbyProfileResponse:fromDevice:withCompletionHandler:", v8, v6, v7);

    }
  }
}

uint64_t __54__GKMatchmaker_Nearby__handleNearbyInvite_fromDevice___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentNearbyInvite:fromDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)presentNearbyInvite:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
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
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v22 = 138412290;
    v23 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "gonna present nearby invite:%@", (uint8_t *)&v22, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adamID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("adamID"));

  objc_msgSend(v11, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("bundleID"));

  objc_msgSend(v11, "bundleVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("bundleVersion"));

  objc_msgSend(v7, "deviceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("deviceID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "platform"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("platform"));

  objc_msgSend(v11, "shortBundleVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v11, "shortBundleVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("shortBundleVersion"));

  }
  objc_msgSend(v7, "player");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchmaker saveNearbyInvite:fromPlayer:](self, "saveNearbyInvite:fromPlayer:", v10, v19);

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "multiplayerService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentNearbyInvite:", v10);

}

- (void)saveNearbyInvite:(id)a3 fromPlayer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__GKMatchmaker_Nearby__saveNearbyInvite_fromPlayer___block_invoke;
  v10[3] = &unk_1E75B1A78;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[GKMatchmaker performSync:](self, "performSync:", v10);

}

void __52__GKMatchmaker_Nearby__saveNearbyInvite_fromPlayer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "nearbyInvites");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "referenceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

- (void)removeNearbyInviteFromPlayer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__GKMatchmaker_Nearby__removeNearbyInviteFromPlayer___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[GKMatchmaker performSync:](self, "performSync:", v6);

}

void __53__GKMatchmaker_Nearby__removeNearbyInviteFromPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nearbyInvites");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "referenceKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (id)nearbyInviteFromPlayer:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__GKMatchmaker_Nearby__nearbyInviteFromPlayer___block_invoke;
  v8[3] = &unk_1E75B5EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[GKMatchmaker performSync:](self, "performSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __47__GKMatchmaker_Nearby__nearbyInviteFromPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "nearbyInvites");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "referenceKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)declineReceivedNearbyInvites
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  v12 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke;
  v6[3] = &unk_1E75B32E0;
  v6[4] = self;
  v6[5] = &v7;
  -[GKMatchmaker performSync:](self, "performSync:", v6);
  v4 = (void *)v8[5];
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke_2;
  v5[3] = &unk_1E75B6260;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  _Block_object_dispose(&v7, 8);

}

void __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "nearbyInvites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "nearbyInvites");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

void __52__GKMatchmaker_Nearby__declineReceivedNearbyInvites__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("deviceID"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nearbyDeviceWithDeviceID:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "declineNearbyInviteFromDevice:reason:", v4, 3);

}

- (void)localPlayerRespondedToNearbyInvite:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  GKInvite *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: localPlayerRespondedToNearbyInvite:", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "local player responded to nearby invite: %@", buf, 0xCu);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("deviceID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[GKMatchmaker nearbyDeviceWithDeviceID:](self, "nearbyDeviceWithDeviceID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKMatchmaker+Nearby.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (device.player)\n[%s (%s:%d)]"), v13, "-[GKMatchmaker(Nearby) localPlayerRespondedToNearbyInvite:]", objc_msgSend(v15, "UTF8String"), 1354);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
    }
    objc_msgSend(v10, "player");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchmaker removeNearbyInviteFromPlayer:](self, "removeNearbyInviteFromPlayer:", v17);

    objc_msgSend(v4, "objectForKey:", CFSTR("participantID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("accepted"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20 && -[GKMatchmaker nearbyAdvertising](self, "nearbyAdvertising"))
    {
      objc_msgSend(v10, "player");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "internal");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("bundleID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("connectionData"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKInviteInternal inviteFromNearbyPlayer:participantID:deviceID:bundleID:connectionData:](GKInviteInternal, "inviteFromNearbyPlayer:participantID:deviceID:bundleID:connectionData:", v22, v18, v9, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKey:", CFSTR("playerGroup"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPlayerGroup:", (int)objc_msgSend(v26, "integerValue"));

      objc_msgSend(v4, "objectForKey:", CFSTR("playerAttributes"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPlayerAttributes:", objc_msgSend(v27, "unsignedIntegerValue"));

      v28 = -[GKInvite initWithInternalRepresentation:]([GKInvite alloc], "initWithInternalRepresentation:", v25);
      -[GKMatchmaker localPlayerAcceptedNearbyInvite:](self, "localPlayerAcceptedNearbyInvite:", v28);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playerNearbyToken"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "length"))
      {
        +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "friendService");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "establishNearbyRelationshipsUsingPlayerTokens:handler:", v32, &__block_literal_global_185);

      }
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("declineReason"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatchmaker declineNearbyInviteFromDevice:reason:](self, "declineNearbyInviteFromDevice:reason:", v10, objc_msgSend(v25, "integerValue"));
    }

  }
}

- (void)localPlayerAcceptedNearbyInvite:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  GKMatchmaker *v12;
  uint8_t buf[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: localPlayerAcceptedNearbyInvite:", buf, 2u);
  }
  if (-[GKMatchmaker hasInviteListener](self, "hasInviteListener"))
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAcceptedInvite:", v4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke;
    block[3] = &unk_1E75B1A78;
    v10 = v7;
    v11 = v4;
    v12 = self;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GKAcceptedGameInvite"), *(_QWORD *)(a1 + 32), 0);

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventEmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "listenerRegisteredForSelector:", sel_player_didAcceptInvite_);

  if ((v5 & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke_cold_1(v7);
  }
  objc_msgSend(v3, "eventEmitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "player:didAcceptInvite:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "inviteHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "inviteHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, *(_QWORD *)(a1 + 40), 0);

  }
}

- (void)acceptNearbyInvite:(id)a3 connectionData:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  GKMatchmaker *v16;
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "GKMatchmaker+Nearby: acceptNearbyInvite: connectionData:", buf, 2u);
  }
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "friendService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke;
  v14[3] = &unk_1E75B62A8;
  v15 = v7;
  v16 = self;
  v17 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "getNearbyTokenForLocalPlayerWithHandler:", v14);

}

void __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("message");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = CFSTR("accepted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v16[1] = v6;
  v16[2] = v7;
  v15[2] = CFSTR("connectionData");
  v15[3] = CFSTR("playerNearbyToken");
  v16[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nearbyDeviceWithDeviceID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2;
  v13[3] = &unk_1E75B1968;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v12, "sendDictionary:withCompletionHandler:", v8, v13);

}

void __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2_cold_1();
  }
  else
  {
    +[GKReporter reporter](GKReporter, "reporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportEvent:type:", CFSTR("com.apple.GameKit.Invite.NearbyResponse"), CFSTR("GKInviteAccepted"));

    +[GKReporter reporter](GKReporter, "reporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportEvent:type:", CFSTR("com.apple.GameKit.invite"), CFSTR("accept.nearby"));

  }
}

- (void)declineNearbyInviteFromDevice:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  GKMatchmaker *v14;
  int64_t v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16[0] = CFSTR("message");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v16[1] = CFSTR("accepted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  v16[2] = CFSTR("declineReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke;
  v12[3] = &unk_1E75B62D0;
  v13 = v6;
  v14 = self;
  v15 = a4;
  v11 = v6;
  objc_msgSend(v11, "sendDictionary:withCompletionHandler:", v10, v12);

}

void __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "declineReasonString:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKReporter reporter](GKReporter, "reporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportEvent:type:", CFSTR("com.apple.GameKit.Invite.NearbyResponse"), v5);

    +[GKReporter reporter](GKReporter, "reporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportEvent:type:", CFSTR("com.apple.GameKit.invite"), CFSTR("decline.nearby"));

  }
}

- (id)declineReasonString:(int64_t)a3
{
  __CFString **v3;

  if ((unint64_t)a3 > 5)
    v3 = GKDeclinedUnknown;
  else
    v3 = off_1E75B62F0[a3];
  return *v3;
}

- (void)nearbyInviteWasCancelled:(id)a3 fromDevice:(id)a4
{
  id v6;
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
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[GKMatchmaker removeNearbyInviteFromPlayer:](self, "removeNearbyInviteFromPlayer:", v7);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKGame currentGame](GKGame, "currentGame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("playerID"));

    objc_msgSend(v6, "deviceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("deviceID"));

    objc_msgSend(v9, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("bundleID"));

    objc_msgSend(v9, "bundleVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("bundleVersion"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "platform"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("platform"));

    objc_msgSend(v9, "shortBundleVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v9, "shortBundleVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v17, CFSTR("shortBundleVersion"));

    }
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "multiplayerService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "nearbyInviteWasCancelled:", v8);

  }
}

void __62__GKMatchmaker_loadConnectivitySettingsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Matchmaker getStoreBagValuesForKeys encountered error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __29__GKMatchmaker_lookForInvite__block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Matchmaking failed to accept game invite due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __29__GKMatchmaker_lookForInvite__block_invoke_3_73_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Matchmaking failed to respond to hosted invite due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __29__GKMatchmaker_lookForInvite__block_invoke_4_74_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "<Warning>: listener not registered for: player:didAcceptInvite: defined in GKInviteEventListener. Please register listener correctly for the local player", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__GKMatchmaker_lookForInvite__block_invoke_80_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "warning: listener registered for both player:didRequestMatchWithPlayers:(array of GKPlayer *) and the deprecated method player:didRequestMatchWithPlayers:(array of NSString *playerID). Game Center doesn't invoke the deprecated method on iOS 8 and later if the non-deprecated method is registered.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__GKMatchmaker_lookForInvite__block_invoke_80_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "<Warning>: listener not registered for: player:didRequestMatchWithRecipients: defined in GKInviteEventListener. Please register listener correctly for the local player", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__GKMatchmaker_lookForInvite__block_invoke_80_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sharingControllerItemProvider
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "error encountered while creating item provider: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__GKMatchmaker_respondToHostedInvite_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Matchmaking failed to accept Game invite due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Matchmaking failed to load connectivity settings due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_144_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "WARNING: The Game Center entitlement is required to use GameKit. To avoid failing App Store Review, follow these instructions:\nhttps://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_game-center", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_144_cold_2(void **a1, void *a2, id *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportVersionToUse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transportContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supportedTransportVersions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412546;
  v13 = v7;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v5, v11, "Cannot accept invite with required transport version: %@. Supported transports are: %@", (uint8_t *)&v12);

}

void __55__GKMatchmaker_matchForRemoteInvite_completionHandler___block_invoke_2_158_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1BCDE3000, v0, OS_LOG_TYPE_FAULT, "GKMatchmaking failed to accept game invite due to error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)matchForInvite:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Matchmaker could not find match for invite which is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)matchForInvite:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Matchmaker could not find match for invite which is cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)matchForInvite:(uint64_t)a1 completionHandler:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_20_0(), "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v2, v6, "Match for invite: %@. Stack: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)reportResponse:forInvitees:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "No recipient or invitee response handler set.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to invite players due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __127__GKMatchmaker_invitePlayersWithRequest_serverHosted_onlineConnectionData_devicePushTokenMap_isNearbyInvite_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to invite players due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to load connectivity settings due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__GKMatchmaker_invitePlayersWithRequest_serverHosted_devicePushTokenMap_completionHandler___block_invoke_2_183_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to invite players due to missing connection data. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v3, v5, "STATUS_BAD_REQUEST: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_20_0(), "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_21_0(v4, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v1, v7, "Cannot create hosted match with automatched players due to allowed player type restriction %@", v8);

  OUTLINED_FUNCTION_1_2();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_217_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "GKMatchMaker calls loadPlayersForLegacyIdentifiers for non-serverHosted match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_218_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Couldn't load player to connect to due to error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_218_cold_2(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_20_0(), "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_21_0(v4, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v1, v7, "Cannot create match with automatched players due to allowed player type restriction %@", v8);

  OUTLINED_FUNCTION_1_2();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221_cold_1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_debug_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_DEBUG, "Preemp relay for player %@", a1, 0xCu);

}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "count");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BCDE3000, v2, v3, "Start to preempt relay for %lu players", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_221_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to connect invitees due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(unsigned __int8 *)(a2 + 56);
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = a1;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v6, v8, "No need to delay connection. Bag values: %@. shouldDelayConnection: %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_1_2();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225_cold_2(unsigned __int8 *a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *a1;
  v6 = a2;
  objc_msgSend(v4, "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v7;
  v11 = 2112;
  v12 = a3;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v6, v8, "Should delay connection: %@. delayMs: %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_1_2();
}

void __101__GKMatchmaker_sendMatchmakingRequest_forMatch_rematchID_serverHosted_playerCount_completionHandler___block_invoke_2_225_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1BCDE3000, v0, OS_LOG_TYPE_DEBUG, "Failed to load bag key for GKMatchmakerQRAllocationDelay. %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v1, v3, "GKMatchmaker matchWithRequest completed with error: %@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "Too many players for match, returning GKErrorMatchRequestInvalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_2(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_20_0(), "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_21_0(v4, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v1, v7, "Cannot play with invited players due to allowed player type restriction %@", v8);

  OUTLINED_FUNCTION_1_2();
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_3(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_DEBUG, "Is local match: %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Atomically set matching to YES.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_233_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "Already matching, throwing GKErrorMatchRequestInvalid. Need wait the previous match request to finish, or cancel it, before sending another one.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __133__GKMatchmaker_handleMatchRequest_forCurrentMatch_hostedCurrentPlayerCount_serverHosted_rematchID_devicePushToken_completionHandler___block_invoke_2_237_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v0, (uint64_t)v0, "error occurred when inviting players. request: %@, error: %@", v1);
  OUTLINED_FUNCTION_2();
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "Matchmaker failed to load url for match due to errorCode: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void __63__GKMatchmaker_loadURLForMatch_matchRequest_completionHandler___block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Matchmaker failed to load URL due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)findPlayersForHostedRequest:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a1, a3, "Skipping execution of '%{public}s' because a nil completion handler was passed to it.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)findMatchedPlayers:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a1, a3, "Skipping execution of '%{public}s' because a nil completion handler was passed to it.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)findPlayersForHostedMatchRequest:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)allInviteesDidRespond
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BCDE3000, v4, v5, "Received responses from all invitees. Stack: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)cancelInviteToPlayer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)cancelInviteToPlayer:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "inviteesByUserID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v5, v7, "GKMatchmaker bug while cancelling invite: playerID %@ not found in invitees:%@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)queryPlayerGroupActivity:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a1, a3, "Skipping execution of '%{public}s' because a nil completion handler was passed to it.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)queryActivityWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a1, a3, "Skipping execution of '%{public}s' because a nil completion handler was passed to it.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)queryQueueActivity:(uint64_t)a3 withCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a1, a3, "Skipping execution of '%{public}s' because a nil completion handler was passed to it.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)startBrowsingForNearbyPlayersWithReachableHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __44__GKMatchmaker_inviteeAcceptedNotification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Cannot handle acceptance of invitee: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Error loading player for accepted invite notification %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__GKMatchmaker_shareInviteeAcceptedWithUserInfo___block_invoke_270_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Cannot handle acceptance of share invitee: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)inviteeAccepted:userInfo:allResponded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "No player found for accepted invite, thus cannot connect to player with ID %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "Cannot start connection since there is no valid match.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__GKMatchmaker_inviteeAccepted_userInfo_allResponded___block_invoke_284_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to send invitation update after getting invitee accepted notification. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __42__GKMatchmaker_inviteeUpdateNotification___block_invoke_299_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Invitee failed to perform invite update due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)nearbyPlayerFound:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v1, (uint64_t)v1, "nearbyDataReceived with invalid deviceID (%@) or discoveryInfo (%@).", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (void)nearbyPlayerLost:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a1, a3, "nearbyDataReceived with invalid deviceID (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)nearbyDataReceived:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v1, (uint64_t)v1, "nearbyDataReceived with invalid deviceID (%@) or data (%@).", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

+ (void)sharedMatchmaker
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v1, v4, "Should not initialize GKMatchmaker for the current process. %@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __32__GKMatchmaker_sharedMatchmaker__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BCDE3000, v4, v5, "GKMatchmaker being initialized in this process. %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __46__GKMatchmaker_Nearby__startNearbyAdvertising__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "error advertising for nearby multiplayer: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __85__GKMatchmaker_Nearby__handleNearbyProfileResponse_fromDevice_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_DEBUG, "no playerInternal for profile response %@, dropping on the floor", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __99__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaLegacyViceroyBonjourConnectionWithRequest_handler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, a2, a3, "failed to send dict: %@, to device: %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

void __93__GKMatchmaker_Nearby__inviteAnyNearbyPlayersViaGCSWithRequest_onlineConnectionData_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "Error encountered when sending invites to nearby players. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __56__GKMatchmaker_Nearby__localPlayerAcceptedNearbyInvite___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "<Warning>: listener not registered for player:didAcceptInvite: defined in GKInviteEventListener. Please register listener correctly for the local player", v1, 2u);
}

void __58__GKMatchmaker_Nearby__acceptNearbyInvite_connectionData___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v0, (uint64_t)v0, "failed to accept nearby invite: %@, due to error: %@", v1);
  OUTLINED_FUNCTION_2();
}

void __61__GKMatchmaker_Nearby__declineNearbyInviteFromDevice_reason___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v0, (uint64_t)v0, "failed to decline nearby invite from device: %@, due to error: %@", v1);
  OUTLINED_FUNCTION_2();
}

@end
