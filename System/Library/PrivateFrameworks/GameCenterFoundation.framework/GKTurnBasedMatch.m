@implementation GKTurnBasedMatch

- (NSUInteger)matchDataMaximumSize
{
  void *v2;
  NSUInteger v3;

  +[GKPreferences shared](GKPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxGameStateSizeTurnBased");

  return v3;
}

- (NSUInteger)exchangeDataMaximumSize
{
  void *v2;
  NSUInteger v3;

  +[GKPreferences shared](GKPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exchangeDataMaximumSize");

  return v3;
}

- (NSUInteger)exchangeMaxInitiatedExchangesPerPlayer
{
  void *v2;
  NSUInteger v3;

  +[GKPreferences shared](GKPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exchangeMaxInitiatedExchangesPerPlayer");

  return v3;
}

+ (void)getTurnBasedBadgeCountWithHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if (v3)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnBasedServicePrivate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__GKTurnBasedMatch_getTurnBasedBadgeCountWithHandler___block_invoke;
    v6[3] = &unk_1E75B4550;
    v7 = v3;
    objc_msgSend(v5, "getTurnBasedBadgeCountWithHandler:", v6);

  }
}

uint64_t __54__GKTurnBasedMatch_getTurnBasedBadgeCountWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)matchesWithInternalRepresentations:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  GKTurnBasedMatch *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "matchID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = -[GKTurnBasedMatch initWithInternalRepresentation:]([GKTurnBasedMatch alloc], "initWithInternalRepresentation:", v11);
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (void)findMatchForRequest:(GKMatchRequest *)request withCompletionHandler:(void *)completionHandler
{
  GKMatchRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  GKMatchRequest *v22;
  id v23;

  v5 = request;
  v6 = completionHandler;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 710, "+[GKTurnBasedMatch findMatchForRequest:withCompletionHandler:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKMatchRequest validateForTurnBased](v5, "validateForTurnBased");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      objc_msgSend(v8, "setError:", v9);
    }
    else
    {
      +[GKPreferences shared](GKPreferences, "shared");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "multiplayerAllowedPlayerType");

      if (v12)
      {
        if (!-[GKMatchRequest isIncorrectlyInvitingPlayers](v5, "isIncorrectlyInvitingPlayers"))
        {
          v21[0] = v10;
          v21[1] = 3221225472;
          v21[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke;
          v21[3] = &unk_1E75B1788;
          v22 = v5;
          v23 = v8;
          objc_msgSend(v23, "perform:", v21);

          goto LABEL_10;
        }
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = 30;
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = 10;
      }
      objc_msgSend(v13, "userErrorForCode:underlyingError:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:", v15);

    }
LABEL_10:
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E75B1BF0;
    v19 = v8;
    v20 = v6;
    v16 = v8;
    objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v18);
    +[GKReporter reporter](GKReporter, "reporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reportEvent:type:", CFSTR("com.apple.GameKit.turnBased"), CFSTR("matchFind"));

  }
}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E75B2C78;
  v7 = v4;
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v7, "loadRecipientsWithCompletionHandler:", v6);

}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "code") == 10)
  {
    objc_msgSend(a1[5], "setError:", v4);
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "turnBasedServicePrivate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E75B4DC0;
    v9 = a1[5];
    v10 = a1[6];
    objc_msgSend(v6, "createTurnBasedGameForMatchRequest:individualMessages:handler:", v7, 0, v8);

  }
}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  GKTurnBasedMatch *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    v7 = -[GKTurnBasedMatch initWithInternalRepresentation:]([GKTurnBasedMatch alloc], "initWithInternalRepresentation:", v6);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("match"));
  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__GKTurnBasedMatch_findMatchForRequest_withCompletionHandler___block_invoke_4(uint64_t a1)
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

+ (void)loadMatchesWithCompletionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "loadMatchesIncludingCompatibleBundleID:withCompletionHandler:", 0, completionHandler);
}

+ (void)loadMatchesIncludingCompatibleBundleID:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 757, "+[GKTurnBasedMatch loadMatchesIncludingCompatibleBundleID:withCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E75B4DE8;
  v17 = a3;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v9, "perform:", v15);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E75B1BF0;
  v13 = v9;
  v14 = v5;
  v10 = v9;
  v11 = v5;
  objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v12);

}

void __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E75B1C58;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  +[GKTurnBasedMatch loadTurnBasedMatchSummariesIncludingCompatibleBundleID:withCompletionHandler:](GKTurnBasedMatch, "loadTurnBasedMatchSummariesIncludingCompatibleBundleID:withCompletionHandler:", v4, v6);

}

uint64_t __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("items"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__GKTurnBasedMatch_loadMatchesIncludingCompatibleBundleID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (*(_QWORD *)(a1 + 40))
  {
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
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("items"));
      v5 = objc_claimAutoreleasedReturnValue();
      v7 = (id)v5;
      if (v5)
        v6 = v5;
      else
        v6 = MEMORY[0x1E0C9AA60];
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v6, 0);
    }

  }
}

+ (void)loadTurnBasedMatchSummaries:(id)a3
{
  objc_msgSend(a1, "loadTurnBasedMatchSummariesIncludingCompatibleBundleID:withCompletionHandler:", 0, a3);
}

+ (void)loadTurnBasedMatchSummariesIncludingCompatibleBundleID:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = a4;
  if (v5)
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "turnBasedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__GKTurnBasedMatch_loadTurnBasedMatchSummariesIncludingCompatibleBundleID_withCompletionHandler___block_invoke;
    v8[3] = &unk_1E75B1CF0;
    v9 = v5;
    objc_msgSend(v7, "getTurnBasedMatchesAndCompatibleBundleID:handler:", v4, v8);

  }
}

void __97__GKTurnBasedMatch_loadTurnBasedMatchSummariesIncludingCompatibleBundleID_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  +[GKTurnBasedMatch matchesWithInternalRepresentations:](GKTurnBasedMatch, "matchesWithInternalRepresentations:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)loadTurnBasedMatchDetailsForMatchIDs:(id)a3 loadGameData:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  v9 = objc_msgSend(v7, "count");
  if (!v9 && GKApplicationLinkedOnOrAfter())
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Must pass in a non-nil and non-empty array of matchIDs"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 804, "+[GKTurnBasedMatch loadTurnBasedMatchDetailsForMatchIDs:loadGameData:withCompletionHandler:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke;
      v19[3] = &unk_1E75B34C0;
      v20 = v7;
      v22 = a4;
      v21 = v11;
      objc_msgSend(v21, "perform:", v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setError:", v13);

    }
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_3;
    v16[3] = &unk_1E75B1BF0;
    v17 = v11;
    v18 = v8;
    v14 = v11;
    objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v16);

  }
}

void __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E75B1C58;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "getDetailsForTurnBasedMatchIDs:includeGameData:handler:", v7, v6, v9);

}

uint64_t __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  +[GKTurnBasedMatch matchesWithInternalRepresentations:](GKTurnBasedMatch, "matchesWithInternalRepresentations:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("matches"));

  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __92__GKTurnBasedMatch_loadTurnBasedMatchDetailsForMatchIDs_loadGameData_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("matches"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);

  }
}

+ (void)loadMatchWithID:(NSString *)matchID withCompletionHandler:(void *)completionHandler
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = matchID;
  v6 = completionHandler;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GKInvalidArgumentException"), CFSTR("Must specify a non-nil matchID"));
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__GKTurnBasedMatch_loadMatchWithID_withCompletionHandler___block_invoke;
    v9[3] = &unk_1E75B1CF0;
    v10 = v7;
    +[GKTurnBasedMatch loadTurnBasedMatchDetailsForMatchIDs:loadGameData:withCompletionHandler:](GKTurnBasedMatch, "loadTurnBasedMatchDetailsForMatchIDs:loadGameData:withCompletionHandler:", v8, 1, v9);

  }
LABEL_4:

}

void __58__GKTurnBasedMatch_loadMatchWithID_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(a2, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (uint64_t)v8;
  }
  else
  {

    v7 = (uint64_t)v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = 0;
  }
  v9 = (id)v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (GKTurnBasedMatch)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKTurnBasedMatch *v5;
  GKTurnBasedMatch *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    +[GKInternalRepresentation internalRepresentation](GKTurnBasedMatchInternal, "internalRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatch;
  v5 = -[GKTurnBasedMatch init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_internal, v4);
    -[GKTurnBasedMatch _updateWithInternal:](v6, "_updateWithInternal:", v4);
  }

  return v6;
}

- (GKTurnBasedMatch)init
{
  return -[GKTurnBasedMatch initWithInternalRepresentation:](self, "initWithInternalRepresentation:", 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKTurnBasedMatch internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKTurnBasedMatch internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GKTurnBasedMatchInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
  GKTurnBasedMatch *v5;
  GKTurnBasedMatchInternal *v6;

  v6 = (GKTurnBasedMatchInternal *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_internal != v6)
  {
    objc_storeStrong((id *)&v5->_internal, a3);
    -[GKTurnBasedMatch _updateWithInternal:](v5, "_updateWithInternal:", v6);
  }
  objc_sync_exit(v5);

}

- (void)_updateWithInternal:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *participants;
  NSArray *v7;
  NSArray *exchanges;

  v4 = a3;
  -[GKTurnBasedMatch _participantsForInternalRepresentation:](self, "_participantsForInternalRepresentation:", v4);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  participants = self->_participants;
  self->_participants = v5;

  -[GKTurnBasedMatch _exchangesForInternalRepresentation:participants:](self, "_exchangesForInternalRepresentation:participants:", v4, self->_participants);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  exchanges = self->_exchanges;
  self->_exchanges = v7;

}

- (id)_participantsForInternalRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkMapWithBlock:", &__block_literal_global_233);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

GKTurnBasedParticipant *__59__GKTurnBasedMatch__participantsForInternalRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GKTurnBasedParticipant *v3;

  v2 = a2;
  v3 = -[GKTurnBasedParticipant initWithInternalRepresentation:]([GKTurnBasedParticipant alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

- (id)daemonProxy
{
  return +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
}

- (id)_exchangesForInternalRepresentation:(id)a3 participants:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v5 = a3;
  objc_msgSend(v5, "exchanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[GKTurnBasedMatch participants](self, "participants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(v5, "exchanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke;
    v14[3] = &unk_1E75B4EA0;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v11 = v8;
    objc_msgSend(v10, "_gkMapWithBlock:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

GKTurnBasedExchange *__69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GKTurnBasedExchange *v4;
  void *v5;
  GKTurnBasedExchange *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  GKTurnBasedExchangeReply *(*v18)(uint64_t, void *);
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v3 = a2;
  v4 = [GKTurnBasedExchange alloc];
  objc_msgSend(*(id *)(a1 + 32), "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKTurnBasedExchange initWithInternalRepresentation:daemonProxy:](v4, "initWithInternalRepresentation:daemonProxy:", v3, v5);

  -[GKTurnBasedExchange setMatch:](v6, "setMatch:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v3, "senderIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange setSender:](v6, "setSender:", v7);

  objc_msgSend(v3, "recipientIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_2;
  v22[3] = &unk_1E75B4E50;
  v10 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 48);
  v23 = v10;
  objc_msgSend(v8, "_gkMapWithBlock:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange setRecipients:](v6, "setRecipients:", v11);

  objc_msgSend(v3, "replies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v9;
  v17 = 3221225472;
  v18 = __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_3;
  v19 = &unk_1E75B4E78;
  v13 = *(void **)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = v13;
  objc_msgSend(v12, "_gkMapWithBlock:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchange setReplies:](v6, "setReplies:", v14, v16, v17, v18, v19, v20);

  return v6;
}

uint64_t __69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = v3;
  if (v3 < 0 || v3 >= *(_QWORD *)(a1 + 40))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("recipientIndex %ld is invalid"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (recipientIndex >= 0 && recipientIndex < participantCount)\n[%s (%s:%d)]"), v6, "-[GKTurnBasedMatch _exchangesForInternalRepresentation:participants:]_block_invoke_2", objc_msgSend(v8, "UTF8String"), 928);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v4);
}

GKTurnBasedExchangeReply *__69__GKTurnBasedMatch__exchangesForInternalRepresentation_participants___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  GKTurnBasedExchangeReply *v4;
  void *v5;
  GKTurnBasedExchangeReply *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v3 = a2;
  v4 = [GKTurnBasedExchangeReply alloc];
  objc_msgSend(*(id *)(a1 + 32), "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKTurnBasedExchangeReply initWithInternalRepresentation:daemonProxy:](v4, "initWithInternalRepresentation:daemonProxy:", v3, v5);

  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v3, "recipientIndex");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedExchangeReply setRecipient:](v6, "setRecipient:", v9);

  -[GKTurnBasedExchangeReply setMatch:](v6, "setMatch:", *(_QWORD *)(a1 + 32));
  return v6;
}

- (BOOL)isMyTurn
{
  void *v2;
  void *v3;
  char v4;

  -[GKTurnBasedMatch internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocalPlayer");

  return v4;
}

- (BOOL)localPlayerHasRecentTurn
{
  return -[GKTurnBasedMatch state](self, "state") == 1
      || -[GKTurnBasedMatch state](self, "state") == 3
      || -[GKTurnBasedMatch state](self, "state") == 2;
}

- (GKGame)game
{
  GKGame *v3;
  void *v4;
  void *v5;
  GKGame *v6;

  v3 = [GKGame alloc];
  -[GKTurnBasedMatch internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKGame initWithInternalRepresentation:](v3, "initWithInternalRepresentation:", v5);

  return v6;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedMatch;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedMatch;
  -[GKTurnBasedMatch methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKTurnBasedMatch forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMatch;
  if (-[GKTurnBasedMatch respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKTurnBasedMatch forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL result;
  int v5;

  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  v5 = GKApplicationLinkedOnOrAfter();
  result = 0;
  if (v5)
    return +[GKTurnBasedMatchInternal instancesRespondToSelector:](GKTurnBasedMatchInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKTurnBasedMatch internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKTurnBasedMatch internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (NSString)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[GKTurnBasedMatch internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch daemonProxy](self, "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizableMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedMessageFromDictionary:forBundleID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v3, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v7;
}

- (void)setMessage:(NSString *)message
{
  void *v4;
  NSString *v5;

  v5 = message;
  -[GKTurnBasedMatch internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v5);

  -[GKTurnBasedMatch setLocalizableMessageWithKey:arguments:](self, "setLocalizableMessageWithKey:arguments:", v5, 0);
}

+ (id)_localizableMessageWithKey:(id)a3 arguments:(id)a4 defaultMessage:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  __CFString *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v31 = (__CFString *)a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil key"), 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v10 = (void *)v9;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = (__CFString *)v8;
  v12 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v21 = (void *)MEMORY[0x1E0C99DA0];
            v22 = *MEMORY[0x1E0C99778];
            v38[0] = CFSTR("key");
            v38[1] = CFSTR("arguments");
            v23 = CFSTR("nil");
            if (v11)
              v23 = v11;
            v39[0] = v7;
            v39[1] = v23;
            v24 = (void *)MEMORY[0x1E0C99D80];
            v25 = v39;
            v26 = v38;
LABEL_23:
            objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, CFSTR("localized message arguments must be strings or implement stringValue"), v28);
            v29 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v29);
          }
          objc_msgSend(v16, "stringValue");
          v17 = objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v21 = (void *)MEMORY[0x1E0C99DA0];
            v22 = *MEMORY[0x1E0C99778];
            v40[0] = CFSTR("key");
            v40[1] = CFSTR("arguments");
            v27 = CFSTR("nil");
            if (v11)
              v27 = v11;
            v41[0] = v7;
            v41[1] = v27;
            v24 = (void *)MEMORY[0x1E0C99D80];
            v25 = v41;
            v26 = v40;
            goto LABEL_23;
          }
          v16 = (id)v17;
        }
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v13);
  }

  v36[0] = CFSTR("loc-key");
  v36[1] = CFSTR("loc-args");
  v37[0] = v7;
  v37[1] = v10;
  v36[2] = CFSTR("loc-default");
  if (v31)
    v18 = v31;
  else
    v18 = &stru_1E75BB5A8;
  v37[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setLocalizableMessageWithKey:(NSString *)key arguments:(NSArray *)arguments
{
  NSArray *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;

  v13 = key;
  v6 = arguments;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = v6;
    else
      v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v7, "_gkLocalizedStringForKey:defaultValue:arguments:", v13, v13, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKTurnBasedMatch _localizableMessageWithKey:arguments:defaultMessage:](GKTurnBasedMatch, "_localizableMessageWithKey:arguments:defaultMessage:", v13, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatch internal](self, "internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocalizableMessage:", v11);

  }
  else
  {
    -[GKTurnBasedMatch internal](self, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalizableMessage:", 0);
  }

}

- (unsigned)state
{
  unsigned int result;
  void *v4;
  unsigned int v5;
  GKTurnBasedMatchStatus v6;
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
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  void *v26;

  result = self->_state;
  if (!result)
  {
    -[GKTurnBasedMatch activeExchanges](self, "activeExchanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 2;
LABEL_30:
      self->_state = v5;

      return self->_state;
    }
    v6 = -[GKTurnBasedMatch status](self, "status");
    if (v6 != GKTurnBasedMatchStatusMatching)
    {
      if (v6 == GKTurnBasedMatchStatusEnded)
      {
        v5 = 5;
        goto LABEL_30;
      }
      if (v6 != GKTurnBasedMatchStatusOpen)
      {
        if (!os_log_GKGeneral)
          v17 = GKOSLoggers();
        v18 = (void *)os_log_GKError;
        if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
          -[GKTurnBasedMatch state].cold.1(v18, self);
        v5 = 3;
        goto LABEL_30;
      }
    }
    -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKTurnBasedMatch localPlayerParticipant](self, "localPlayerParticipant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "status") == 5)
    {
      v5 = 5;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v8, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isGuestPlayer") & 1) != 0)
    {
      objc_msgSend(v8, "internal");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hostPlayerInternal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playerID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internal");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playerID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v13, "isEqualToString:", v16);

      if ((v25 & 1) != 0)
      {
        v5 = 6;
        goto LABEL_29;
      }
    }
    else
    {

    }
    if (objc_msgSend(v8, "isLocalPlayer"))
    {
      -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "status");

      if (v20 == 1)
        v5 = 1;
      else
        v5 = 3;
    }
    else
    {
      -[GKTurnBasedMatch participants](self, "participants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {

        v5 = 4;
      }
      else
      {
        -[GKTurnBasedMatch internal](self, "internal");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentPlayer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isLocalPlayer");

        if (v24)
          v5 = 3;
        else
          v5 = 4;
      }
    }
    goto LABEL_29;
  }
  return result;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (GKPlayer)currentPlayer
{
  void *v2;
  void *v3;
  void *v4;

  -[GKTurnBasedMatch internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (GKPlayer *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSUInteger v19;
  void *v20;
  void *v21;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;

  if (description_onceToken_271 != -1)
    dispatch_once(&description_onceToken_271, &__block_literal_global_272_0);
  v3 = (void *)description_matchStatusEnumLookupDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKTurnBasedMatch status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("INVALID");
  v25 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch matchID](self, "matchID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch bundleID](self, "bundleID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("<nil>");
  v26 = (void *)v9;
  if (v9)
    v10 = (const __CFString *)v9;
  v24 = v10;
  -[GKTurnBasedMatch message](self, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v8;
  v28 = (__CFString *)v6;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[GKTurnBasedMatch message](self, "message");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("'%@'"), v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  -[GKTurnBasedMatch creationDate](self, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch participants](self, "participants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch matchData](self, "matchData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");
  v19 = -[GKTurnBasedMatch matchDataMaximumSize](self, "matchDataMaximumSize");
  -[GKTurnBasedMatch exchanges](self, "exchanges");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@ %p - matchID:%@ bundleID:%@ status:%@ message:%@ creationDate:%@ currentParticipant:%@ participants:%@ matchData.length:%ld matchDataMaximumSize:%ld exchanges:%@ state:%u>"), v27, self, v30, v24, v28, v29, v13, v14, v16, v18, v19, v20, -[GKTurnBasedMatch state](self, "state"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {

  }
  return (NSString *)v21;
}

void __31__GKTurnBasedMatch_description__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", CFSTR("GKTurnBasedMatchStatusUnknown"), v6, CFSTR("GKTurnBasedMatchStatusOpen"), v1, CFSTR("GKTurnBasedMatchStatusEnded"), v2, CFSTR("GKTurnBasedMatchStatusMatching"), v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)description_matchStatusEnumLookupDict;
  description_matchStatusEnumLookupDict = v4;

}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("internal.status"));
}

- (GKTurnBasedMatchStatus)status
{
  void *v2;
  void *v3;
  GKTurnBasedMatchStatus v4;

  -[GKTurnBasedMatch internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Active")) & 1) != 0)
    {
      v4 = GKTurnBasedMatchStatusOpen;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Complete")) & 1) != 0)
    {
      v4 = GKTurnBasedMatchStatusEnded;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Matching")))
    {
      v4 = GKTurnBasedMatchStatusMatching;
    }
    else
    {
      v4 = GKTurnBasedMatchStatusUnknown;
    }
  }
  else
  {
    v4 = GKTurnBasedMatchStatusUnknown;
  }

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  v5 = -[GKTurnBasedMatch state](self, "state");
  v6 = objc_msgSend(v4, "state");
  if (v5 == v6)
  {
    -[GKTurnBasedMatch dateSortKey](self, "dateSortKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateSortKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -objc_msgSend(v7, "compare:", v8);

  }
  else if (v5 < v6)
  {
    v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (NSDate)dateSortKey
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[GKTurnBasedMatch internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastTurnDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[GKTurnBasedMatch internal](self, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "creationDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v6;
}

- (void)rematchWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  GKMatchRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GKMatchRequest *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  GKMatchRequest *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  GKMatchRequest *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1207, "-[GKTurnBasedMatch rematchWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKTurnBasedMatch participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("player"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKTurnBasedMatch participants](self, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = +[GKMatchmaker canPlayMultiplayerGameWithPlayers:](GKMatchmaker, "canPlayMultiplayerGameWithPlayers:", v8);
  v12 = MEMORY[0x1E0C809B0];
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 10, 0);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v34 = (void *)v33;
    objc_msgSend(v6, "setError:", v33);

    goto LABEL_22;
  }
  if (v10 < 2 || -[GKTurnBasedMatch status](self, "status") != GKTurnBasedMatchStatusEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 13, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v38 = v6;
  v39 = v8;
  v40 = v4;
  v13 = objc_alloc_init(GKMatchRequest);
  -[GKMatchRequest setMinPlayers:](v13, "setMinPlayers:", v10);
  -[GKMatchRequest setMaxPlayers:](v13, "setMaxPlayers:", v10);
  v37 = v13;
  -[GKMatchRequest internal](v13, "internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMatchType:", 2);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10 - 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[GKTurnBasedMatch participants](self, "participants");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v48;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v48 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v21), "player");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "internal");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "playerID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25 && !objc_msgSend(v23, "isLocalPlayer"))
          {
            v26 = objc_msgSend(v16, "containsObject:", v23);

            if ((v26 & 1) == 0)
            {
              objc_msgSend(v23, "internal");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "playerID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v28);

              objc_msgSend(v16, "addObject:", v23);
            }
          }
          else
          {

          }
        }

        ++v21;
      }
      while (v19 != v21);
      v29 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      v19 = v29;
    }
    while (v29);
  }

  objc_msgSend(v16, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchRequest setRecipients:](v37, "setRecipients:", v30);

  -[GKMatchRequest internal](v37, "internal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setRecipientPlayerIDs:", v15);

  v12 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke;
  v44[3] = &unk_1E75B1788;
  v45 = v37;
  v6 = v38;
  v46 = v38;
  v32 = v37;
  objc_msgSend(v46, "perform:", v44);

  v8 = v39;
  v4 = v40;
LABEL_22:
  v41[0] = v12;
  v41[1] = 3221225472;
  v41[2] = __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_3;
  v41[3] = &unk_1E75B23E8;
  v42 = v6;
  v43 = v4;
  v35 = v4;
  v36 = v6;
  objc_msgSend(v36, "notifyOnMainQueueWithBlock:", v41);

}

void __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B4DC0;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "createTurnBasedGameForMatchRequest:individualMessages:handler:", v6, 0, v8);

}

void __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  GKTurnBasedMatch *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  v10 = v5;
  if (a2 && !v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a2;
    v9 = -[GKTurnBasedMatch initWithInternalRepresentation:]([GKTurnBasedMatch alloc], "initWithInternalRepresentation:", v8);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("match"));
    v6 = v10;
  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __49__GKTurnBasedMatch_rematchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("match"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("match"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

  }
}

- (void)acceptInviteWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1260, "-[GKTurnBasedMatch acceptInviteWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKPreferences shared](GKPreferences, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "multiplayerAllowedPlayerType");

  v9 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setError:", v11);

    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E75B1788;
  v15[4] = self;
  v16 = v6;
  objc_msgSend(v16, "perform:", v15);

  if (v4)
  {
LABEL_3:
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E75B23E8;
    v13 = v6;
    v14 = v4;
    objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v12);

  }
LABEL_4:
  +[GKReporter reporter](GKReporter, "reporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportEvent:type:", CFSTR("com.apple.GameKit.turnBased"), CFSTR("matchAccept"));

}

void __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E75B4EE8;
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "acceptInviteForTurnBasedMatch:handler:", v6, v9);

}

void __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  GKTurnBasedMatch *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", v8);
    if (!v5)
    {
      v6 = *(void **)(a1 + 40);
      v7 = -[GKTurnBasedMatch initWithInternalRepresentation:]([GKTurnBasedMatch alloc], "initWithInternalRepresentation:", v8);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("match"));

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __54__GKTurnBasedMatch_acceptInviteWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("match"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v4);

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("match"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

}

- (void)declineInviteWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  GKTurnBasedMatch *v14;
  id v15;

  v4 = completionHandler;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnBasedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __55__GKTurnBasedMatch_declineInviteWithCompletionHandler___block_invoke;
  v13 = &unk_1E75B4DC0;
  v14 = self;
  v15 = v4;
  v8 = v4;
  objc_msgSend(v6, "declineInviteForTurnBasedMatch:handler:", v7, &v10);

  +[GKReporter reporter](GKReporter, "reporter", v10, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportEvent:type:", CFSTR("com.apple.GameKit.turnBased"), CFSTR("matchDecline"));

}

void __55__GKTurnBasedMatch_declineInviteWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", v9);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v8);

}

- (GKTurnBasedParticipant)currentParticipant
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[GKTurnBasedMatch internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentParticipant");

  if (v4 < 0
    || (-[GKTurnBasedMatch participants](self, "participants"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= v4))
  {
    v8 = 0;
  }
  else
  {
    -[GKTurnBasedMatch participants](self, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GKTurnBasedParticipant *)v8;
}

- (void)setCurrentParticipant:(id)a3
{
  char v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "slot");
  -[GKTurnBasedMatch internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentParticipant:", v4);

}

- (GKTurnBasedParticipant)previousParticipant
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GKTurnBasedMatch participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "lastTurnDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if (!v5
            || (objc_msgSend(v8, "lastTurnDate"),
                v10 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v5, "lastTurnDate"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = objc_msgSend(v10, "compare:", v11),
                v11,
                v10,
                v12 == 1))
          {
            v13 = v8;

            v5 = v13;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (GKTurnBasedParticipant *)v5;
}

- (GKTurnBasedParticipant)previousParticipantOrFirstKnownPlayer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[GKTurnBasedMatch previousParticipant](self, "previousParticipant");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_3;
  objc_msgSend(v3, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocalPlayer");

  v8 = v4;
  if (v7)
  {
LABEL_3:
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[GKTurnBasedMatch participants](self, "participants", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v8 = v4;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "internal");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "player");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 && (objc_msgSend(v16, "isLocalPlayer") & 1) == 0)
          {
            v8 = v14;

            goto LABEL_14;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
      v8 = v4;
    }
LABEL_14:

    if (!v8)
      v8 = v4;
  }

  return (GKTurnBasedParticipant *)v8;
}

- (GKTurnBasedParticipant)playingWithParticipantOrFirstKnownPlayer
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[GKTurnBasedMatch firstWinnerOrTiedOrLastLoser](self, "firstWinnerOrTiedOrLastLoser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLocalPlayer");

  if (v6)
  {
    -[GKTurnBasedMatch previousParticipantOrFirstKnownPlayer](self, "previousParticipantOrFirstKnownPlayer");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return (GKTurnBasedParticipant *)v3;
}

- (GKTurnBasedParticipant)localPlayerParticipant
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  char v9;
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
  -[GKTurnBasedMatch participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "internal");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isLocalPlayer");

        if ((v9 & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (GKTurnBasedParticipant *)v3;
}

- (GKPlayer)showcasePlayer
{
  void *v3;
  void *v4;

  if (-[GKTurnBasedMatch state](self, "state") == 1)
  {
    -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invitedBy");
  }
  else
  {
    -[GKTurnBasedMatch playingWithParticipantOrFirstKnownPlayer](self, "playingWithParticipantOrFirstKnownPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "player");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[GKPlayer automatchPlayer](GKPlayer, "automatchPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (GKPlayer *)v4;
}

- (GKTurnBasedParticipant)firstWinnerOrTiedOrLastLoser
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[GKTurnBasedMatch participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v24)
  {

    v3 = 0;
LABEL_27:
    v3 = v3;
    v4 = v3;
    goto LABEL_29;
  }
  v3 = 0;
  v4 = 0;
  v5 = 0;
  obj = v2;
  v23 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v26 != v23)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if (objc_msgSend(v7, "isWinner"))
      {
        if (v5)
        {
          objc_msgSend(v7, "lastTurnDate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "lastTurnDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "compare:", v9);

          v11 = v5;
          v12 = v3;
          v13 = v4;
          v14 = v7;
LABEL_12:
          if (v10 != -1)
            continue;
        }
        else
        {
          v11 = 0;
          v12 = v3;
          v13 = v4;
          v14 = v7;
        }
LABEL_21:
        v20 = v7;

        v3 = v12;
        v4 = v13;
        v5 = v14;
        continue;
      }
      if (objc_msgSend(v7, "matchOutcome") == 4)
      {
        if (v4)
        {
          objc_msgSend(v7, "lastTurnDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "lastTurnDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v15, "compare:", v16);

          v11 = v4;
          v12 = v3;
          v13 = v7;
          v14 = v5;
          goto LABEL_12;
        }
        v11 = 0;
        v12 = v3;
        v13 = v7;
        goto LABEL_20;
      }
      if (!v3)
      {
        v11 = 0;
        v12 = v7;
        v13 = v4;
LABEL_20:
        v14 = v5;
        goto LABEL_21;
      }
      objc_msgSend(v7, "lastTurnDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastTurnDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "compare:", v18);

      v11 = v3;
      v12 = v7;
      v13 = v4;
      v14 = v5;
      if (v19 == 1)
        goto LABEL_21;
    }
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v24);

  if (!v5)
  {
    if (v4)
      goto LABEL_29;
    goto LABEL_27;
  }

  v4 = v5;
LABEL_29:

  return (GKTurnBasedParticipant *)v4;
}

- (NSArray)activeExchanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  BOOL v19;
  void *v20;
  id v21;
  uint64_t v23;
  void *v24;
  void *v25;
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
  if (-[GKTurnBasedMatch status](self, "status") != GKTurnBasedMatchStatusOpen)
    return (NSArray *)0;
  -[GKTurnBasedMatch localPlayerParticipant](self, "localPlayerParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch exchanges](self, "exchanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v23 = *(_QWORD *)v31;
    v24 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v9, "status") == 1)
        {
          objc_msgSend(v9, "recipients");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "indexOfObject:", v3);

          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v9, "replies");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (!v13)
              goto LABEL_17;
            v14 = v13;
            v15 = 0;
            v16 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "recipient");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v18 == v3;

                v15 |= v19;
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v14);
            v7 = v23;
            v4 = v24;
            if ((v15 & 1) == 0)
LABEL_17:
              objc_msgSend(v25, "addObject:", v9);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v25, "count"))
    v20 = v25;
  else
    v20 = 0;
  v21 = v20;

  return (NSArray *)v21;
}

- (NSArray)completedExchanges
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[GKTurnBasedMatch status](self, "status") != GKTurnBasedMatchStatusOpen)
    return (NSArray *)0;
  -[GKTurnBasedMatch localPlayerParticipant](self, "localPlayerParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatch exchanges](self, "exchanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "status") == 2)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    if (objc_msgSend(v7, "count"))
      v14 = v7;
    else
      v14 = 0;
    v5 = v14;

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)removeWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKTurnBasedMatch *v18;
  id v19;

  v4 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1461, "-[GKTurnBasedMatch removeWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKTurnBasedMatch localPlayerParticipant](self, "localPlayerParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E75B1800;
  v17 = v7;
  v18 = self;
  v9 = v6;
  v19 = v9;
  v10 = v7;
  objc_msgSend(v9, "perform:", v16);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_4;
  v13[3] = &unk_1E75B2BB0;
  v14 = v9;
  v15 = v4;
  v13[4] = self;
  v11 = v9;
  v12 = v4;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v13);

}

void __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  if (objc_msgSend(a1[4], "status") == 1 && objc_msgSend(a1[5], "status") == 3)
  {
    v4 = a1[5];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E75B29C8;
    v5 = &v15;
    v15 = v3;
    v6 = v3;
    objc_msgSend(v4, "declineInviteWithCompletionHandler:", v14);
  }
  else
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "turnBasedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E75B17D8;
    v5 = &v12;
    v12 = a1[6];
    v13 = v3;
    v10 = v3;
    objc_msgSend(v8, "removeTurnBasedMatch:handler:", v9, v11);

  }
}

uint64_t __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __48__GKTurnBasedMatch_removeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (void)loadMatchDataWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnBasedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch matchID](self, "matchID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__GKTurnBasedMatch_loadMatchDataWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E75B1C58;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v6, "getDetailsForTurnBasedMatchIDs:includeGameData:handler:", v8, 1, v10);

}

void __55__GKTurnBasedMatch_loadMatchDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", v6);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "matchData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

  }
}

+ (void)loadTurnBasedMatchWithDetailsForMatchID:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1495, "+[GKTurnBasedMatch loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E75B23E8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v7, v10);

}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1496, "+[GKTurnBasedMatch loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_299;
    v16[3] = &unk_1E75B1788;
    v17 = v4;
    v18 = v3;
    objc_msgSend(v18, "perform:", v16);

    v6 = v17;
  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_cold_1(v8);
    if (GKApplicationLinkedOnOrAfter())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil matchID"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v12);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setError:", v6);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("match"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v11);

    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_300;
    v13[3] = &unk_1E75B1BF0;
    v15 = *(id *)(a1 + 40);
    v14 = v3;
    objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v13);

  }
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_299(uint64_t a1, void *a2)
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
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B2C78;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v7 = v3;
  objc_msgSend(v5, "getDetailsForTurnBasedMatchIDs:includeGameData:handler:", v6, 1, v8);

}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2_cold_1(a1, (uint64_t)v6, v8);
  }
  +[GKTurnBasedMatch matchesWithInternalRepresentations:](GKTurnBasedMatch, "matchesWithInternalRepresentations:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("match"));

  objc_msgSend(*(id *)(a1 + 40), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_300(uint64_t a1)
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

- (void)loadURLWithMatchRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void (**v11)(void *, uint64_t);
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD aBlock[4];
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E75B29C8;
  v9 = v7;
  v36 = v9;
  v33[0] = v8;
  v33[1] = 3221225472;
  v33[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2;
  v33[3] = &unk_1E75B4260;
  v10 = _Block_copy(aBlock);
  v34 = v10;
  v11 = (void (**)(void *, uint64_t))_Block_copy(v33);
  if (!os_log_GKGeneral)
    v12 = GKOSLoggers();
  v13 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "GKMatchmaker: matchWithRequest: currentMatch: - Check for Local Player Authentication", buf, 2u);
  }
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAuthenticated");

  if ((v15 & 1) != 0)
  {
    if (!os_log_GKGeneral)
      v16 = GKOSLoggers();
    v17 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "GKMatchmaker: matchWithRequest: currentMatch: - Check parental controls", buf, 2u);
    }
    +[GKPreferences shared](GKPreferences, "shared");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "multiplayerAllowedPlayerType");

    if (v19)
    {
      objc_msgSend(v6, "validateForTurnBased");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (!os_log_GKGeneral)
          v21 = GKOSLoggers();
        v22 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v6;
          _os_log_impl(&dword_1BCDE3000, v22, OS_LOG_TYPE_INFO, "TBGame - isTurnBasedValid: NO, request = %@", buf, 0xCu);
        }
        (*((void (**)(void *, void *))v10 + 2))(v10, v20);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1568, "-[GKTurnBasedMatch loadURLWithMatchRequest:completionHandler:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v30[0] = v8;
        v30[1] = 3221225472;
        v30[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_303;
        v30[3] = &unk_1E75B1800;
        v30[4] = self;
        v31 = v6;
        v25 = v24;
        v32 = v25;
        objc_msgSend(v25, "perform:", v30);
        v27[0] = v8;
        v27[1] = 3221225472;
        v27[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_306;
        v27[3] = &unk_1E75B1BF0;
        v28 = v25;
        v29 = v9;
        v26 = v25;
        objc_msgSend(v26, "notifyOnMainQueueWithBlock:", v27);

      }
    }
    else
    {
      v11[2](v11, 10);
    }
  }
  else
  {
    v11[2](v11, 6);
  }

}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
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
    __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_cold_1(v5, v3);
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_301;
    v6[3] = &unk_1E75B1BF0;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_301(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_303(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2_304;
  v11[3] = &unk_1E75B4F10;
  v12 = a1[6];
  v13 = v3;
  v10 = v3;
  objc_msgSend(v5, "loadURLWithTBGMatch:player:matchRequest:handler:", v6, v8, v9, v11);

}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_2_304(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "TBGame - turnBasedService loadURLWithTBGMatch result, url = %@, error = %@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_306(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);

  }
}

- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "turnBasedService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch internal](self, "internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reserveShareParticipantSlots:minPlayerCount:maxPlayerCount:andInvitePlayers:withMessage:forMatch:handler:", a3, a4, a5, v16, v15, v18, v14);

}

- (void)endTurnWithNextParticipant:(GKTurnBasedParticipant *)nextParticipant matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  void *v8;
  void *v9;
  NSData *v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = completionHandler;
  v10 = matchData;
  objc_msgSend(v8, "arrayWithObject:", nextParticipant);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch endTurnWithNextParticipants:turnTimeout:matchData:completionHandler:](self, "endTurnWithNextParticipants:turnTimeout:matchData:completionHandler:", v11, v10, v9, GKTurnTimeoutDefault);

}

- (id)indexesForParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v16 = v4;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[GKTurnBasedMatch participants](self, "participants");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "indexOfObject:", v11);

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {

            v5 = 0;
            goto LABEL_12;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
LABEL_12:
      v4 = v16;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)endTurnWithNextParticipants:(NSArray *)nextParticipants turnTimeout:(NSTimeInterval)timeout matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  NSArray *v10;
  NSData *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  NSTimeInterval v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = nextParticipants;
  v11 = matchData;
  v12 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1616, "-[GKTurnBasedMatch endTurnWithNextParticipants:turnTimeout:matchData:completionHandler:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKPreferences shared](GKPreferences, "shared");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "multiplayerAllowedPlayerType");

  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    -[GKTurnBasedMatch indexesForParticipants:](self, "indexesForParticipants:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (GKApplicationLinkedOnOrAfter())
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil matchData"), 0);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v24);
      }
      if (!v18)
      {
        v25 = (void *)MEMORY[0x1E0C99DA0];
        v26 = *MEMORY[0x1E0C99778];
        if (v10)
          v27 = (const __CFString *)v10;
        else
          v27 = CFSTR("nil");
        v37 = CFSTR("nextParticipants");
        v38[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, CFSTR("invalid list of nextParticipants"), v28);
        v29 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v29);
      }
    }
    if (v11 && v18)
    {
      -[NSArray objectAtIndex:](v10, "objectAtIndex:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTurnBasedMatch setCurrentParticipant:](self, "setCurrentParticipant:", v19);

      -[GKTurnBasedMatch internal](self, "internal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMatchData:", v11);

      v33[0] = v17;
      v33[1] = 3221225472;
      v33[2] = __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke;
      v33[3] = &unk_1E75B1BC8;
      v33[4] = self;
      v34 = v18;
      v36 = timeout;
      v35 = v14;
      objc_msgSend(v35, "perform:", v33);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setError:", v21);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setError:", v18);
  }

  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_3;
  v30[3] = &unk_1E75B2BB0;
  v31 = v14;
  v32 = v12;
  v30[4] = self;
  v22 = v14;
  v23 = v12;
  objc_msgSend(v22, "notifyOnMainQueueWithBlock:", v30);

}

void __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(double *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_2;
  v10[3] = &unk_1E75B4EE8;
  v8 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v12 = v3;
  v9 = v3;
  objc_msgSend(v5, "submitTurnForTurnBasedMatch:nextParticipantIndexes:turnTimeout:handler:", v6, v8, v10, v7);

}

void __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", a2);
  objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __88__GKTurnBasedMatch_endTurnWithNextParticipants_turnTimeout_matchData_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (void)participantQuitInTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome nextParticipant:(GKTurnBasedParticipant *)nextParticipant matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  void *v10;
  void *v11;
  NSData *v12;
  id v13;

  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = completionHandler;
  v12 = matchData;
  objc_msgSend(v10, "arrayWithObject:", nextParticipant);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch participantQuitInTurnWithOutcome:nextParticipants:turnTimeout:matchData:completionHandler:](self, "participantQuitInTurnWithOutcome:nextParticipants:turnTimeout:matchData:completionHandler:", matchOutcome, v13, v12, v11, GKTurnTimeoutDefault);

}

- (void)participantQuitInTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome nextParticipants:(NSArray *)nextParticipants turnTimeout:(NSTimeInterval)timeout matchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  NSArray *v12;
  NSData *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  id v31;
  _QWORD block[5];
  id v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v12 = nextParticipants;
  v13 = matchData;
  v14 = completionHandler;
  -[GKTurnBasedMatch indexesForParticipants:](self, "indexesForParticipants:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:](GKTurnBasedParticipant, "matchOutcomeIsValidForDoneState:", matchOutcome);
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil matchData"), 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v20);
    }
    if (!v16)
    {
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v36 = CFSTR("matchOutcome");
      -[GKTurnBasedMatch participants](self, "participants");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:](GKTurnBasedParticipant, "stringForMatchOutcome:totalParticipant:", matchOutcome, objc_msgSend(v23, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, CFSTR("invalid matchOutcome"), v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v26);
    }
    if (!v15)
    {
      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99778];
      if (v12)
        v29 = (const __CFString *)v12;
      else
        v29 = CFSTR("nil");
      v34 = CFSTR("nextParticipants");
      v35 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, CFSTR("invalid nextParticipants"), v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v31);
    }
  }
  if (v15)
    v17 = v16;
  else
    v17 = 0;
  if (v17)
  {
    -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStatus:", 5);

    -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMatchOutcome:", matchOutcome);

    -[GKTurnBasedMatch endTurnWithNextParticipants:turnTimeout:matchData:completionHandler:](self, "endTurnWithNextParticipants:turnTimeout:matchData:completionHandler:", v12, v13, v14, timeout);
  }
  else if (v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__GKTurnBasedMatch_participantQuitInTurnWithOutcome_nextParticipants_turnTimeout_matchData_completionHandler___block_invoke;
    block[3] = &unk_1E75B23E8;
    block[4] = self;
    v33 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __110__GKTurnBasedMatch_participantQuitInTurnWithOutcome_nextParticipants_turnTimeout_matchData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)participantQuitOutOfTurnWithOutcome:(GKTurnBasedMatchOutcome)matchOutcome withCompletionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  GKTurnBasedMatchOutcome v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1687, "-[GKTurnBasedMatch participantQuitOutOfTurnWithOutcome:withCompletionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:](GKTurnBasedParticipant, "matchOutcomeIsValidForDoneState:", matchOutcome);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    -[GKTurnBasedMatch localPlayerParticipant](self, "localPlayerParticipant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatch currentParticipant](self, "currentParticipant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v11))
    {
      if (GKApplicationLinkedOnOrAfter())
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("current turn holder can not quit out of turn"), 0);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v23);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:", v13);

    }
    else
    {
      objc_msgSend(v11, "setStatus:", 5);
      objc_msgSend(v11, "setMatchOutcome:", matchOutcome);
      v27[0] = v10;
      v27[1] = 3221225472;
      v27[2] = __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke;
      v27[3] = &unk_1E75B2E50;
      v27[4] = self;
      v29 = matchOutcome;
      v28 = v8;
      objc_msgSend(v28, "perform:", v27);

    }
  }
  else
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99778];
      v30 = CFSTR("matchOutcome");
      -[GKTurnBasedMatch participants](self, "participants");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:](GKTurnBasedParticipant, "stringForMatchOutcome:totalParticipant:", matchOutcome, objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, CFSTR("invalid matchOutcome"), v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v22);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v14);

  }
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_3;
  v24[3] = &unk_1E75B2BB0;
  v25 = v8;
  v26 = v6;
  v24[4] = self;
  v15 = v8;
  v16 = v6;
  objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v24);

}

void __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E75B4EE8;
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v5, "resignFromTurnBasedGame:outcome:handler:", v6, v8, v10);

}

void __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(v9, "game");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "game");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setGame:", v8);

    }
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", v9);
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __78__GKTurnBasedMatch_participantQuitOutOfTurnWithOutcome_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (void)endMatchInTurnWithMatchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  -[GKTurnBasedMatch endMatchInTurnWithMatchData:scores:achievements:completionHandler:](self, "endMatchInTurnWithMatchData:scores:achievements:completionHandler:", matchData, 0, 0, completionHandler);
}

- (void)endMatchInTurnWithMatchData:(NSData *)matchData scores:(NSArray *)scores achievements:(NSArray *)achievements completionHandler:(void *)completionHandler
{
  NSData *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  NSData *v45;
  GKTurnBasedMatch *v46;
  NSArray *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD v51[5];
  NSArray *v52;
  NSArray *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = matchData;
  v11 = scores;
  v12 = achievements;
  v13 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1730, "-[GKTurnBasedMatch endMatchInTurnWithMatchData:scores:achievements:completionHandler:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v46 = self;
    v47 = v11;
    v45 = v10;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    -[GKTurnBasedMatch participants](self, "participants");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v60;
LABEL_4:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v20)
          objc_enumerationMutation(v17);
        v22 = *(__CFString **)(*((_QWORD *)&v59 + 1) + 8 * v21);
        if ((-[__CFString status](v22, "status") & 0xFFFFFFFFFFFFFFFELL) == 4
          && !+[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:](GKTurnBasedParticipant, "matchOutcomeIsValidForDoneState:", -[__CFString matchOutcome](v22, "matchOutcome")))
        {
          if (GKApplicationLinkedOnOrAfter())
          {
            v36 = (void *)MEMORY[0x1E0C99DA0];
            v37 = *MEMORY[0x1E0C99778];
            v38 = CFSTR("nil");
            if (v22)
              v38 = v22;
            v65[0] = v38;
            v64[0] = CFSTR("participant");
            v64[1] = CFSTR("matchOutcome");
            v39 = -[__CFString matchOutcome](v22, "matchOutcome");
            -[GKTurnBasedMatch participants](v46, "participants");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:](GKTurnBasedParticipant, "stringForMatchOutcome:totalParticipant:", v39, objc_msgSend(v40, "count"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v65[1] = v41;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "exceptionWithName:reason:userInfo:", v37, CFSTR("invalid matchOutcome for participant"), v42);
            v43 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v43);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setError:", v23);

        }
        objc_msgSend(v15, "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          break;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
          if (v19)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_msgSend(v15, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v45;
    self = v46;
    v11 = v47;
    v16 = MEMORY[0x1E0C809B0];
    if (!v25)
    {
      -[GKTurnBasedMatch currentParticipant](v46, "currentParticipant");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setStatus:", 5);

      -[GKTurnBasedMatch internal](v46, "internal");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setMatchData:", v45);

      v57 = 0u;
      v58 = 0u;
      v56 = 0u;
      v55 = 0u;
      -[GKTurnBasedMatch participants](v46, "participants");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v56 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "setStatus:", 5);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v30);
      }

      v16 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke;
      v51[3] = &unk_1E75B2C00;
      v51[4] = v46;
      v11 = v47;
      v52 = v47;
      v53 = v12;
      v54 = v15;
      objc_msgSend(v54, "perform:", v51);

    }
  }
  else
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil matchData"), 0);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v44);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v33);

  }
  v48[0] = v16;
  v48[1] = 3221225472;
  v48[2] = __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_3;
  v48[3] = &unk_1E75B2BB0;
  v49 = v15;
  v50 = v13;
  v48[4] = self;
  v34 = v15;
  v35 = v13;
  objc_msgSend(v34, "notifyOnMainQueueWithBlock:", v48);

}

void __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_gkValuesForKeyPath:", CFSTR("internal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "_gkValuesForKeyPath:", CFSTR("internal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_2;
  v12[3] = &unk_1E75B4EE8;
  v9 = a1[7];
  v10 = a1[4];
  v13 = v9;
  v14 = v10;
  v15 = v3;
  v11 = v3;
  objc_msgSend(v5, "completeTurnBasedMatch:scores:achievements:handler:", v6, v7, v8, v12);

}

void __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setInternal:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __86__GKTurnBasedMatch_endMatchInTurnWithMatchData_scores_achievements_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (void)endMatchInTurnWithMatchData:(NSData *)matchData leaderboardScores:(NSArray *)scores achievements:(NSArray *)achievements completionHandler:(void *)completionHandler
{
  void *v10;
  NSArray *v11;
  NSData *v12;
  id v13;

  v10 = completionHandler;
  v11 = achievements;
  v12 = matchData;
  +[GKLeaderboardScore convertToGKScore:](GKLeaderboardScore, "convertToGKScore:", scores);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch endMatchInTurnWithMatchData:scores:achievements:completionHandler:](self, "endMatchInTurnWithMatchData:scores:achievements:completionHandler:", v12, v13, v11, v10);

}

- (void)saveCurrentTurnWithMatchData:(NSData *)matchData completionHandler:(void *)completionHandler
{
  NSData *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = matchData;
  v7 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1791, "-[GKTurnBasedMatch saveCurrentTurnWithMatchData:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  if (!v6)
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil matchData"), 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v19);
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 17;
    goto LABEL_7;
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "multiplayerAllowedPlayerType");

  if (!v12)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 10;
LABEL_7:
    objc_msgSend(v14, "userErrorForCode:underlyingError:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setError:", v16);

    goto LABEL_8;
  }
  -[GKTurnBasedMatch internal](self, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMatchData:", v6);

  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke;
  v23[3] = &unk_1E75B1788;
  v23[4] = self;
  v24 = v9;
  objc_msgSend(v24, "perform:", v23);

LABEL_8:
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_3;
  v20[3] = &unk_1E75B2BB0;
  v21 = v9;
  v22 = v7;
  v20[4] = self;
  v17 = v9;
  v18 = v7;
  objc_msgSend(v17, "notifyOnMainQueueWithBlock:", v20);

}

void __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_2;
  v9[3] = &unk_1E75B4EE8;
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "saveDataForTurnBasedMatch:resolvedExchangeIDs:handler:", v6, MEMORY[0x1E0C9AA60], v9);

}

void __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", a2);
  objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __67__GKTurnBasedMatch_saveCurrentTurnWithMatchData_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (id)exchangeForID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GKTurnBasedMatch exchanges](self, "exchanges", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "exchangeID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)saveMergedMatchData:(NSData *)matchData withResolvedExchanges:(NSArray *)exchanges completionHandler:(void *)completionHandler
{
  NSData *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSArray *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = matchData;
  v9 = exchanges;
  v10 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1833, "-[GKTurnBasedMatch saveMergedMatchData:withResolvedExchanges:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil matchData"), 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v30);
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = 17;
    goto LABEL_14;
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "multiplayerAllowedPlayerType");

  if (!v15)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = 10;
LABEL_14:
    objc_msgSend(v25, "userErrorForCode:underlyingError:", v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setError:", v27);

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v9, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = v9;
  v17 = v9;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "exchangeID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v19);
  }

  -[GKTurnBasedMatch internal](self, "internal");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMatchData:", v8);

  v13 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke;
  v35[3] = &unk_1E75B1800;
  v35[4] = self;
  v36 = v16;
  v37 = v12;
  v24 = v16;
  objc_msgSend(v37, "perform:", v35);

  v9 = v31;
LABEL_15:
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_3;
  v32[3] = &unk_1E75B2BB0;
  v33 = v12;
  v34 = v10;
  v32[4] = self;
  v28 = v12;
  v29 = v10;
  objc_msgSend(v28, "notifyOnMainQueueWithBlock:", v32);

}

void __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnBasedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_2;
  v9[3] = &unk_1E75B4EE8;
  v7 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "saveDataForTurnBasedMatch:resolvedExchangeIDs:handler:", v6, v7, v9);

}

void __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", a2);
  objc_msgSend(*(id *)(a1 + 40), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __80__GKTurnBasedMatch_saveMergedMatchData_withResolvedExchanges_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (void)sendExchangeToParticipants:(NSArray *)participants data:(NSData *)data localizableMessageKey:(NSString *)key arguments:(NSArray *)arguments timeout:(NSTimeInterval)timeout completionHandler:(void *)completionHandler
{
  NSData *v14;
  NSString *v15;
  NSArray *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  id v33;
  NSArray *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[4];
  NSString *v39;
  NSArray *v40;
  id v41;
  NSData *v42;
  GKTurnBasedMatch *v43;
  id v44;
  NSTimeInterval v45;
  const __CFString *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v34 = participants;
  v14 = data;
  v15 = key;
  v16 = arguments;
  v17 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1870, "-[GKTurnBasedMatch sendExchangeToParticipants:data:localizableMessageKey:arguments:timeout:completionHandler:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKPreferences shared](GKPreferences, "shared");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "multiplayerAllowedPlayerType");

  v22 = MEMORY[0x1E0C809B0];
  if (v21)
  {
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil or invalid localizable message key"), 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v28);
    }
    -[GKTurnBasedMatch indexesForParticipants:](self, "indexesForParticipants:", v34);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v29 = (void *)MEMORY[0x1E0C99DA0];
      v30 = *MEMORY[0x1E0C99778];
      v31 = (const __CFString *)v34;
      if (!v34)
        v31 = CFSTR("nil");
      v46 = CFSTR("participants");
      v47[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, CFSTR("invalid list of recipient participants"), v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v33);
    }
    v24 = (void *)v23;
    if (!v16)
      v16 = (NSArray *)MEMORY[0x1E0C9AA60];
    v38[0] = v22;
    v38[1] = 3221225472;
    v38[2] = __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke;
    v38[3] = &unk_1E75B4F60;
    v39 = v15;
    v16 = v16;
    v40 = v16;
    v41 = v24;
    v45 = timeout;
    v42 = v14;
    v43 = self;
    v44 = v19;
    v25 = v24;
    objc_msgSend(v44, "perform:", v38);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setError:", v25);
  }

  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_3;
  v35[3] = &unk_1E75B2BB0;
  v36 = v19;
  v37 = v17;
  v35[4] = self;
  v26 = v19;
  v27 = v17;
  objc_msgSend(v26, "notifyOnMainQueueWithBlock:", v35);

}

void __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_gkLocalizedStringForKey:defaultValue:arguments:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKTurnBasedMatch _localizableMessageWithKey:arguments:defaultMessage:](GKTurnBasedMatch, "_localizableMessageWithKey:arguments:defaultMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "turnBasedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 64), "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_2;
  v15[3] = &unk_1E75B4F38;
  v13 = *(void **)(a1 + 72);
  v15[4] = *(_QWORD *)(a1 + 64);
  v16 = v13;
  v17 = v3;
  v14 = v3;
  objc_msgSend(v8, "sendExchangeToParticipants:data:message:timeout:match:handler:", v9, v10, v6, v12, v15, v11);

}

void __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3)
  {
    v18 = v8;
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", a3);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "exchanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "exchangeID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v7, "isEqualToString:", v16);

          if (v17)
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, CFSTR("exchange"));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v9 = v18;
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __110__GKTurnBasedMatch_sendExchangeToParticipants_data_localizableMessageKey_arguments_timeout_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "matchID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKInternalTurnBasedGameEvent"), v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("exchange"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);

  }
}

- (void)sendReminderToParticipants:(NSArray *)participants localizableMessageKey:(NSString *)key arguments:(NSArray *)arguments completionHandler:(void *)completionHandler
{
  NSArray *v10;
  NSString *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  NSString *v34;
  NSArray *v35;
  id v36;
  GKTurnBasedMatch *v37;
  id v38;
  _QWORD v39[4];
  NSArray *v40;
  const __CFString *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = participants;
  v11 = key;
  v12 = arguments;
  v13 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKTurnBasedMatch.m", 1914, "-[GKTurnBasedMatch sendReminderToParticipants:localizableMessageKey:arguments:completionHandler:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKPreferences shared](GKPreferences, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "multiplayerAllowedPlayerType");

  v18 = MEMORY[0x1E0C809B0];
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 10, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v23);

    if (!v13)
      goto LABEL_8;
    goto LABEL_7;
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke;
  v39[3] = &unk_1E75B4F88;
  v19 = v10;
  v40 = v19;
  -[NSArray enumerateObjectsUsingBlock:](v19, "enumerateObjectsUsingBlock:", v39);
  -[GKTurnBasedMatch indexesForParticipants:](self, "indexesForParticipants:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    if (v19)
      v26 = (const __CFString *)v19;
    else
      v26 = CFSTR("nil");
    v41 = CFSTR("participants");
    v42[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, CFSTR("invalid list of recipient participants"), v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v28);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil or invalid localizable message key"), 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v21 = (void *)v20;
  if (!v12)
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_2;
  v33[3] = &unk_1E75B4198;
  v34 = v11;
  v12 = v12;
  v35 = v12;
  v36 = v21;
  v37 = self;
  v38 = v15;
  v22 = v21;
  objc_msgSend(v38, "perform:", v33);

  if (v13)
  {
LABEL_7:
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_4;
    v30[3] = &unk_1E75B1BF0;
    v32 = v13;
    v31 = v15;
    objc_msgSend(v31, "notifyOnMainQueueWithBlock:", v30);

  }
LABEL_8:

}

void __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  objc_msgSend(v11, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = *(_QWORD *)(a1 + 32);
    v12 = CFSTR("participants");
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("localPlayer is not a valid participant for reminder"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }

}

void __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_gkLocalizedStringForKey:defaultValue:arguments:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKTurnBasedMatch _localizableMessageWithKey:arguments:defaultMessage:](GKTurnBasedMatch, "_localizableMessageWithKey:arguments:defaultMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "turnBasedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_3;
  v12[3] = &unk_1E75B17D8;
  v13 = *(id *)(a1 + 64);
  v14 = v3;
  v11 = v3;
  objc_msgSend(v8, "sendReminderToParticipants:message:match:handler:", v9, v6, v10, v12);

}

uint64_t __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __97__GKTurnBasedMatch_sendReminderToParticipants_localizableMessageKey_arguments_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (NSArray)participants
{
  return self->_participants;
}

- (NSArray)exchanges
{
  return self->_exchanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchanges, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)state
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_16_0(a1);
  v4[0] = 67109378;
  v4[1] = objc_msgSend(a2, "status");
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_ERROR, "Unexpected match status encountered: %d for match:%@", (uint8_t *)v4, 0x12u);

  OUTLINED_FUNCTION_2_0();
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "loadTurnBasedMatchWithDetailsForMatchID:Failed to load TBG Match Details: No Match ID", v1, 2u);
}

void __82__GKTurnBasedMatch_loadTurnBasedMatchWithDetailsForMatchID_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "loadTurnBasedMatchWithDetailsForMatchID:Failed to get details for TBG MatchID:%@ .Error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __62__GKTurnBasedMatch_loadURLWithMatchRequest_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v3, v5, "GKTurnBasedMatch loadURLWithMatchRequest completed with error: %@", v6);

  OUTLINED_FUNCTION_2_0();
}

@end
