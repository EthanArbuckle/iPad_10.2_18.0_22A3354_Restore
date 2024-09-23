@implementation GKGameActivityHandler

+ (void)fetchAndEmitMostRecentGameActivity
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gameService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchMostRecentGameActivityForBundleID:handler:", v4, &__block_literal_global_39);

}

void __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  GKGameActivity *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  GKGameActivity *v12;
  id v13;
  _QWORD v14[4];
  GKGameActivity *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_GKGeneral;
  if (v2)
  {
    if (!os_log_GKGeneral)
    {
      v4 = GKOSLoggers();
      v3 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v2;
      _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "Found most recent game activityInternal: %@", buf, 0xCu);
    }
    v5 = -[GKGameActivity initWithInternalRepresentation:]([GKGameActivity alloc], "initWithInternalRepresentation:", v2);
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventEmitter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "listenerRegisteredForSelector:", sel_player_wantsToPlayGameActivity_completionHandler_);

    if ((v8 & 1) == 0)
    {
      if (!os_log_GKGeneral)
        v9 = GKOSLoggers();
      v10 = os_log_GKDeveloper;
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_cold_1(v10);
    }
    objc_msgSend(v6, "eventEmitter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_4;
    v14[3] = &unk_1E75B1878;
    v15 = v5;
    v12 = v5;
    objc_msgSend(v11, "player:wantsToPlayGameActivity:completionHandler:", v6, v12, v14);

  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v13 = GKOSLoggers();
      v3 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "Found no most recent game activity.", buf, 2u);
    }
  }

}

void __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v3 = GKOSLoggers();
    v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1BCDE3000, v2, OS_LOG_TYPE_INFO, "Done notifying developers about game activity: %@", (uint8_t *)&v5, 0xCu);
  }
}

void __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "<Warning>: listener not registered for: player:wantsToPlayGameActivity:completionHandler: defined in GKGameActivityListener. Please register listener correctly for the local player", v1, 2u);
}

@end
