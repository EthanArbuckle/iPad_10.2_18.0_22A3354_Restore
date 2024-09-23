@implementation GKLeaderboard

- (GKLeaderboard)initWithInternalRepresentation:(id)a3
{
  id v5;
  char *v6;
  GKLeaderboard *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboard;
  v6 = -[GKLeaderboard init](&v9, sel_init);
  v7 = (GKLeaderboard *)v6;
  if (v6)
  {
    *((_OWORD *)v6 + 2) = xmmword_1BCF3F3F0;
    *(_OWORD *)(v6 + 72) = xmmword_1BCF3F400;
    objc_storeStrong((id *)v6 + 6, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (GKLeaderboard)init
{
  void *v3;
  GKLeaderboard *v4;

  +[GKInternalRepresentation internalRepresentation](GKLeaderboardInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKLeaderboard initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v3);

  return v4;
}

- (GKLeaderboard)initWithPlayers:(NSArray *)players
{
  NSArray *v5;
  void *v6;
  GKLeaderboard *v7;

  v5 = players;
  if (!v5 && GKApplicationLinkedOnOrAfter())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GKInvalidParameter"), CFSTR("players argument is nil -- you must pass a valid player array to -[GKLeaderboard initWithPlayers:]. Or use -[GKLeaderboard init] instead."));
  +[GKInternalRepresentation internalRepresentation](GKLeaderboardInternal, "internalRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKLeaderboard initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v6);

  if (v7)
    objc_storeStrong((id *)&v7->_players, players);

  return v7;
}

- (GKLeaderboard)initWithPlayerIDs:(NSArray *)playerIDs
{
  void *v4;
  GKLeaderboard *v5;

  -[NSArray _gkIncompletePlayersFromPlayerIDs](playerIDs, "_gkIncompletePlayersFromPlayerIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GKLeaderboard initWithPlayers:](self, "initWithPlayers:", v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  GKLeaderboardTimeScope v6;
  GKLeaderboardPlayerScope v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[GKLeaderboard timeScope](self, "timeScope");
    if (v6 == objc_msgSend(v5, "timeScope"))
    {
      v7 = -[GKLeaderboard playerScope](self, "playerScope");
      if (v7 == objc_msgSend(v5, "playerScope"))
      {
        v8 = -[GKLeaderboard range](self, "range");
        v10 = v9;
        v12 = 0;
        if (v8 != objc_msgSend(v5, "range") || v10 != v11)
          goto LABEL_11;
        -[GKLeaderboard identifier](self, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v15)
        {
          -[GKLeaderboard players](self, "players");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "players");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v16 == (void *)v17)
          {
            v12 = 1;
            v18 = v16;
          }
          else
          {
            v18 = (void *)v17;
            -[GKLeaderboard players](self, "players");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "players");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v19, "isEqual:", v20);

          }
          goto LABEL_11;
        }
      }
    }
    v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  GKLeaderboardTimeScope v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GKLeaderboard identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[GKLeaderboard timeScope](self, "timeScope");
  v6 = v5 ^ -[GKLeaderboard playerScope](self, "playerScope") ^ v4;
  v7 = -[GKLeaderboard range](self, "range");
  -[GKLeaderboard range](self, "range");
  return v6 ^ v7 ^ v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)GKLeaderboard;
  -[GKLeaderboard description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard baseLeaderboardID](self, "baseLeaderboardID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKLeaderboard type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard nextStartDate](self, "nextStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[GKLeaderboard duration](self, "duration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ baseLeaderboardID:%@ title:%@ type:%@ startDate:%@ nextStartDate:%@ duration:%@"), v4, v5, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  length = range.length;
  location = range.location;
  -[GKLeaderboard players](self, "players");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!location || length >= 0x65)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99858];
      +[GCFLocalizedStrings LEADERBOARD_RANGE_LIMITS_EXECPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "LEADERBOARD_RANGE_LIMITS_EXECPTION");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, v9, location, length, 1, 100);

    }
    self->_range.location = location;
    self->_range.length = length;
  }
}

- (NSRange)range
{
  os_unfair_lock_s *p_lock;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSRange result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  location = self->_range.location;
  length = self->_range.length;
  os_unfair_lock_unlock(p_lock);
  v6 = location;
  v7 = length;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)isLoading
{
  return self->_loadingCount != 0;
}

- (NSTimeInterval)duration
{
  void *v2;
  double v3;
  double v4;
  int v5;
  NSTimeInterval result;

  -[GKLeaderboard internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  v5 = GKApplicationLinkedOnOrAfter();
  result = v4 / 1000.0;
  if (!v5)
    return v4;
  return result;
}

- (void)loadScoresWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;

  v4 = completionHandler;
  +[GKGame currentGame](GKGame, "currentGame");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard loadScoresForGame:withCompletionHandler:](self, "loadScoresForGame:withCompletionHandler:", v5, v4);

}

- (id)scoreRequestForGame:(id)a3
{
  id v4;
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
  void *v16;

  v4 = a3;
  -[GKLeaderboard players](self, "players");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkInternalsFromPlayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboard players](self, "players");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[GKLeaderboardScoreRequest requestForPlayerInternals:](GKLeaderboardScoreRequest, "requestForPlayerInternals:", v6);
  }
  else
  {
    v8 = -[GKLeaderboard range](self, "range");
    +[GKLeaderboardScoreRequest requestForRankRange:](GKLeaderboardScoreRequest, "requestForRankRange:", v8, v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minimalInternal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlayerInternal:", v13);

  objc_msgSend(v4, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setGameBundleID:", v14);
  -[GKLeaderboard identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v15);

  -[GKLeaderboard groupIdentifier](self, "groupIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGroupIdentifier:", v16);

  objc_msgSend(v10, "setTimeScope:", -[GKLeaderboard timeScope](self, "timeScope"));
  objc_msgSend(v10, "setFriendsOnly:", -[GKLeaderboard playerScope](self, "playerScope") == GKLeaderboardPlayerScopeFriendsOnly);

  return v10;
}

- (void)loadScoresForRequest:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gameStatService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getLeaderboardForRequest:handler:", v6, v5);

}

- (void)loadScoresForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[GKLeaderboard incrementLoadingCountAtomically](self, "incrementLoadingCountAtomically");
  -[GKLeaderboard delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "leaderboardDidBeginLoading:", self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 210, "-[GKLeaderboard loadScoresForGame:withCompletionHandler:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke;
  v19[3] = &unk_1E75B1800;
  v19[4] = self;
  v20 = v6;
  v12 = v10;
  v21 = v12;
  v13 = v6;
  objc_msgSend(v12, "perform:", v19);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_4;
  v16[3] = &unk_1E75B2BB0;
  v17 = v12;
  v18 = v7;
  v16[4] = self;
  v14 = v12;
  v15 = v7;
  objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v16);

}

void __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scoreRequestForGame:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B2B88;
  v5 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  v13 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v9, "loadScoresForRequest:handler:", v7, v8);

}

void __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  GKScore *v12;
  void *v13;
  GKScore *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInternal:", v5);
    objc_msgSend(v5, "scores");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v5, "scores");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_3;
      v19[3] = &unk_1E75B2B60;
      v20 = *(id *)(a1 + 40);
      objc_msgSend(v9, "_gkMapConcurrentlyWithBlock:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setScores:", v10);
    objc_msgSend(v5, "playerScore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (v12 = [GKScore alloc],
          objc_msgSend(v5, "playerScore"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = -[GKScore initWithInternalRepresentation:](v12, "initWithInternalRepresentation:", v13),
          v13,
          -[GKScore setGame:](v14, "setGame:", *(_QWORD *)(a1 + 40)),
          !v14))
    {
      if ((GKApplicationLinkedOnOrAfter() & 1) != 0)
      {
        v14 = 0;
      }
      else
      {
        +[GKInternalRepresentation internalRepresentation](GKScoreInternal, "internalRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setLeaderboardIdentifier:", v16);

        objc_msgSend(*(id *)(a1 + 48), "groupIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setGroupLeaderboardIdentifier:", v17);

        objc_msgSend(*(id *)(a1 + 48), "playerInternal");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPlayer:", v18);

        v14 = -[GKScore initWithInternalRepresentation:]([GKScore alloc], "initWithInternalRepresentation:", v15);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setLocalPlayerScore:", v14);

  }
  objc_msgSend(*(id *)(a1 + 56), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

GKScore *__57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  GKScore *v4;

  v3 = a2;
  v4 = -[GKScore initWithInternalRepresentation:]([GKScore alloc], "initWithInternalRepresentation:", v3);

  -[GKScore setGame:](v4, "setGame:", *(_QWORD *)(a1 + 32));
  return v4;
}

void __57__GKLeaderboard_loadScoresForGame_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "decrementLoadingCountAtomically");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leaderboardDidFinishLoading:", *(_QWORD *)(a1 + 32));

  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "scores");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

  }
}

+ (void)loadCategoriesWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = completionHandler;
  +[GKGame currentGame](GKGame, "currentGame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__GKLeaderboard_loadCategoriesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E75B2BD8;
  v7 = v3;
  v5 = v3;
  +[GKLeaderboard loadLeaderboardsForGame:withCompletionHandler:](GKLeaderboard, "loadLeaderboardsForGame:withCompletionHandler:", v4, v6);

}

void __53__GKLeaderboard_loadCategoriesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v15, "localizedTitle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v15, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v19);

            objc_msgSend(v15, "localizedTitle");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v20);

          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    (*(void (**)(uint64_t, void *, void *, id))(v21 + 16))(v21, v8, v9, v6);

}

+ (void)loadLeaderboardsWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = completionHandler;
  +[GKGame currentGame](GKGame, "currentGame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__GKLeaderboard_loadLeaderboardsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E75B2BD8;
  v7 = v3;
  v5 = v3;
  +[GKLeaderboard loadLeaderboardsForGame:withCompletionHandler:](GKLeaderboard, "loadLeaderboardsForGame:withCompletionHandler:", v4, v6);

}

void __55__GKLeaderboard_loadLeaderboardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v8);
    }
    else if (v12)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v10 + 16))(v10, v12, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

    }
  }

}

+ (void)loadLeaderboardsForGame:(id)a3 forSet:(id)a4 withPlayer:(id)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 309, "+[GKLeaderboard loadLeaderboardsForGame:forSet:withPlayer:withCompletionHandler:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke;
    v25[3] = &unk_1E75B2C00;
    v26 = v9;
    v16 = v11;
    v27 = v16;
    v28 = v10;
    v17 = v14;
    v29 = v17;
    objc_msgSend(v17, "perform:", v25);
    if (objc_msgSend(v16, "isLocalPlayer"))
    {
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_3;
      v22[3] = &unk_1E75B1788;
      v23 = v16;
      v24 = v17;
      objc_msgSend(v24, "perform:", v22);

    }
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_5;
    v19[3] = &unk_1E75B23E8;
    v20 = v17;
    v21 = v12;
    v18 = v17;
    objc_msgSend(v18, "notifyOnMainQueueWithBlock:", v19);

  }
}

void __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "gameDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E75B1C58;
  v11 = a1[7];
  v12 = v3;
  v9 = v3;
  objc_msgSend(v5, "getLeaderboardsForGameDescriptor:player:setIdentifier:handler:", v6, v7, v8, v10);

}

uint64_t __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("results"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
  v6[2] = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E75B2C28;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadDefaultLeaderboardIdentifierWithCompletionHandler:", v6);

}

uint64_t __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("default"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  GKLeaderboard *(*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("default"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_6;
    v12 = &unk_1E75B2C50;
    v13 = v2;
    v14 = &v15;
    objc_msgSend(v3, "_gkMapConcurrentlyWithBlock:", &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v16[3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", v16[3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "error", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *))(v5 + 16))(v5, v4, v7, v8);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  _Block_object_dispose(&v15, 8);
}

GKLeaderboard *__81__GKLeaderboard_loadLeaderboardsForGame_forSet_withPlayer_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  GKLeaderboard *v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a2;
  v6 = -[GKLeaderboard initWithInternalRepresentation:]([GKLeaderboard alloc], "initWithInternalRepresentation:", v5);

  -[GKLeaderboard identifier](v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {

LABEL_4:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    return v6;
  }
  -[GKLeaderboard groupIdentifier](v6, "groupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
    goto LABEL_4;
  return v6;
}

+ (void)loadLeaderboardWithIdentifier:(id)a3 forGame:(id)a4 withPlayer:(id)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 357, "+[GKLeaderboard loadLeaderboardWithIdentifier:forGame:withPlayer:withCompletionHandler:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E75B2C00;
    v22 = v10;
    v23 = v11;
    v24 = v9;
    v16 = v14;
    v25 = v16;
    objc_msgSend(v16, "perform:", v21);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_3;
    v18[3] = &unk_1E75B1BF0;
    v19 = v16;
    v20 = v12;
    v17 = v16;
    objc_msgSend(v17, "notifyOnMainQueueWithBlock:", v18);

  }
}

void __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "gameDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E75B2C78;
  v10 = a1[6];
  v11 = a1[7];
  v12 = v3;
  v8 = v3;
  objc_msgSend(v5, "getLeaderboardsForGameDescriptor:player:setIdentifier:handler:", v6, v7, 0, v9);

}

void __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  GKLeaderboard *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "groupIdentifier", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32)))
        {

LABEL_12:
          v16 = *(void **)(a1 + 40);
          v17 = -[GKLeaderboard initWithInternalRepresentation:]([GKLeaderboard alloc], "initWithInternalRepresentation:", v12);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("leaderboard"));

          goto LABEL_13;
        }
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v15)
          goto LABEL_12;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  objc_msgSend(*(id *)(a1 + 40), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __88__GKLeaderboard_loadLeaderboardWithIdentifier_forGame_withPlayer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("leaderboard"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

+ (void)loadLeaderboardsForGame:(id)a3 withPlayer:(id)a4 withCompletionHandler:(id)a5
{
  +[GKLeaderboard loadLeaderboardsForGame:forSet:withPlayer:withCompletionHandler:](GKLeaderboard, "loadLeaderboardsForGame:forSet:withPlayer:withCompletionHandler:", a3, 0, a4, a5);
}

+ (void)loadLeaderboardsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[GKLeaderboard loadLeaderboardsForGame:withPlayer:withCompletionHandler:](GKLeaderboard, "loadLeaderboardsForGame:withPlayer:withCompletionHandler:", v6, v7, v5);

}

- (void)incrementLoadingCountAtomically
{
  GKAtomicIncrement32((unsigned int *)&self->_loadingCount);
}

- (void)decrementLoadingCountAtomically
{
  GKAtomicDecrement32((unsigned int *)&self->_loadingCount);
}

+ (void)setDefaultLeaderboard:(NSString *)leaderboardIdentifier withCompletionHandler:(void *)completionHandler
{
  void *v5;
  NSString *v6;
  id v7;

  v5 = completionHandler;
  v6 = leaderboardIdentifier;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultLeaderboardIdentifier:completionHandler:", v6, v5);

}

+ (void)loadLeaderboardsWithIDs:(NSArray *)leaderboardIDs completionHandler:(void *)completionHandler
{
  void *v6;
  NSArray *v7;
  id v8;

  v6 = completionHandler;
  v7 = leaderboardIDs;
  +[GKGame currentGame](GKGame, "currentGame");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadLeaderboardsWithIDs:game:completionHandler:", v7, v8, v6);

}

+ (void)loadLeaderboardsWithIDs:(id)a3 game:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__GKLeaderboard_loadLeaderboardsWithIDs_game_completionHandler___block_invoke;
  v10[3] = &unk_1E75B1CF0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "loadLeaderboardsWithIDs:setIdentifier:game:completionHandler:", a3, 0, a4, v10);

}

void __64__GKLeaderboard_loadLeaderboardsWithIDs_game_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

    }
  }

}

+ (void)loadLeaderboardsWithIDs:(id)a3 setIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[GKGame currentGame](GKGame, "currentGame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_1E75B1CF0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(a1, "loadLeaderboardsWithIDs:setIdentifier:game:completionHandler:", v10, v9, v11, v13);

}

void __73__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

    }
  }

}

+ (void)loadLeaderboardsWithIDs:(id)a3 setIdentifier:(id)a4 game:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 446, "+[GKLeaderboard loadLeaderboardsWithIDs:setIdentifier:game:completionHandler:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke;
  v25[3] = &unk_1E75B2C00;
  v26 = v9;
  v27 = v11;
  v28 = v10;
  v16 = v14;
  v29 = v16;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  objc_msgSend(v16, "perform:", v25);
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_4;
  v22[3] = &unk_1E75B1BF0;
  v23 = v16;
  v24 = v12;
  v20 = v16;
  v21 = v12;
  objc_msgSend(v20, "notifyOnMainQueueWithBlock:", v22);

}

void __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gameStatService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gameDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_2;
  v12[3] = &unk_1E75B1C58;
  v10 = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = v3;
  v11 = v3;
  objc_msgSend(v6, "getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:", v7, v9, v4, v10, v12);

}

void __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "_gkMapWithBlock:", &__block_literal_global_19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

GKLeaderboard *__78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboard *v3;

  v2 = a2;
  v3 = -[GKLeaderboard initWithInternalRepresentation:]([GKLeaderboard alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

void __78__GKLeaderboard_loadLeaderboardsWithIDs_setIdentifier_game_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)loadPreviousOccurrenceWithGameDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 470, "-[GKLeaderboard loadPreviousOccurrenceWithGameDescriptor:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke;
  v18[3] = &unk_1E75B1800;
  v18[4] = self;
  v19 = v6;
  v11 = v9;
  v20 = v11;
  v12 = v6;
  objc_msgSend(v11, "perform:", v18);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_3;
  v15[3] = &unk_1E75B1BF0;
  v16 = v11;
  v17 = v7;
  v13 = v11;
  v14 = v7;
  objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v15);

}

void __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_2;
  v11[3] = &unk_1E75B2CE0;
  v12 = *(id *)(a1 + 48);
  v13 = v3;
  v10 = v3;
  objc_msgSend(v5, "getPreviousInstanceForLeaderboard:gameDescriptor:player:handler:", v6, v7, v9, v11);

}

void __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  GKLeaderboard *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    v5 = a2;
    v6 = -[GKLeaderboard initWithInternalRepresentation:]([GKLeaderboard alloc], "initWithInternalRepresentation:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__GKLeaderboard_loadPreviousOccurrenceWithGameDescriptor_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)loadPreviousOccurrenceWithCompletionHandler:(void *)completionHandler
{
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
  _QWORD v14[5];
  id v15;

  v4 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 491, "-[GKLeaderboard loadPreviousOccurrenceWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E75B1788;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v8, "perform:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E75B1BF0;
  v12 = v8;
  v13 = v4;
  v9 = v8;
  v10 = v4;
  objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v11);

}

void __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gameDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E75B2CE0;
  v13 = *(id *)(a1 + 40);
  v14 = v3;
  v11 = v3;
  objc_msgSend(v5, "getPreviousInstanceForLeaderboard:gameDescriptor:player:handler:", v6, v8, v10, v12);

}

void __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  GKLeaderboard *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    v5 = a2;
    v6 = -[GKLeaderboard initWithInternalRepresentation:]([GKLeaderboard alloc], "initWithInternalRepresentation:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61__GKLeaderboard_loadPreviousOccurrenceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

+ (void)submitScore:(NSInteger)score context:(NSUInteger)context player:(GKPlayer *)player leaderboardIDs:(NSArray *)leaderboardIDs completionHandler:(void *)completionHandler
{
  GKPlayer *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *v17;
  GKPlayer *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  NSArray *v24;
  GKPlayer *v25;
  id v26;
  NSInteger v27;
  NSUInteger v28;

  v11 = player;
  v12 = leaderboardIDs;
  v13 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 516, "+[GKLeaderboard submitScore:context:player:leaderboardIDs:completionHandler:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke;
  v23[3] = &unk_1E75B2D08;
  v27 = score;
  v28 = context;
  v17 = v12;
  v24 = v17;
  v18 = v11;
  v25 = v18;
  v19 = v15;
  v26 = v19;
  objc_msgSend(v19, "perform:", v23);
  if (v13)
  {
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_3;
    v20[3] = &unk_1E75B1BF0;
    v22 = v13;
    v21 = v19;
    objc_msgSend(v21, "notifyOnMainQueueWithBlock:", v20);

  }
}

void __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[GKGame currentGame](GKGame, "currentGame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gameDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_2;
  v15[3] = &unk_1E75B17D8;
  v16 = *(id *)(a1 + 48);
  v17 = v3;
  v12 = v3;
  objc_msgSend(v5, "submitScore:context:leaderboardIDs:forPlayer:whileScreeningChallenges:withEligibleChallenges:gameDescriptor:handler:", v14, v6, v7, v9, 0, 0, v11, v15);

  if (!v8)
  {

  }
}

uint64_t __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__GKLeaderboard_submitScore_context_player_leaderboardIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)submitScore:(NSInteger)score context:(NSUInteger)context player:(GKPlayer *)player completionHandler:(void *)completionHandler
{
  GKPlayer *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  GKPlayer *v21;
  id v22;
  NSInteger v23;
  NSUInteger v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = player;
  v11 = completionHandler;
  if (-[GKLeaderboard type](self, "type"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 548, "-[GKLeaderboard submitScore:context:player:completionHandler:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke;
    v20[3] = &unk_1E75B2D08;
    v23 = score;
    v24 = context;
    v20[4] = self;
    v21 = v10;
    v15 = v13;
    v22 = v15;
    objc_msgSend(v15, "perform:", v20);
    if (v11)
    {
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_3;
      v17[3] = &unk_1E75B1BF0;
      v19 = v11;
      v18 = v15;
      objc_msgSend(v18, "notifyOnMainQueueWithBlock:", v17);

    }
  }
  else
  {
    -[GKLeaderboard baseLeaderboardID](self, "baseLeaderboardID");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLeaderboard submitScore:context:player:leaderboardIDs:completionHandler:](GKLeaderboard, "submitScore:context:player:leaderboardIDs:completionHandler:", score, context, v10, v16, v11);

  }
}

void __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gameStatService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_2;
  v13[3] = &unk_1E75B17D8;
  v14 = *(id *)(a1 + 48);
  v15 = v4;
  v12 = v4;
  objc_msgSend(v6, "submitInstanceScore:context:leaderboard:forPlayer:whileScreeningChallenges:withEligibleChallenges:handler:", v7, v8, v9, v11, 0, 0, v13);
  if (!v10)
  {

  }
}

uint64_t __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__GKLeaderboard_submitScore_context_player_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)loadEntriesForPlayerScope:(GKLeaderboardPlayerScope)playerScope timeScope:(GKLeaderboardTimeScope)timeScope range:(NSRange)range completionHandler:(void *)completionHandler
{
  -[GKLeaderboard loadEntriesForPlayerScope:timeScope:range:locale:completionHandler:](self, "loadEntriesForPlayerScope:timeScope:range:locale:completionHandler:", playerScope, timeScope, range.location, range.length, 0, completionHandler);
}

- (void)loadEntriesForPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 range:(_NSRange)a5 locale:(id)a6 completionHandler:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  length = a5.length;
  location = a5.location;
  v19 = a6;
  v13 = a7;
  if (!location || length >= 0x65)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99858];
    +[GCFLocalizedStrings LEADERBOARD_RANGE_LIMITS_EXECPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "LEADERBOARD_RANGE_LIMITS_EXECPTION");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", v15, v16, location, length, 1, 100);

  }
  +[GKGame currentGame](GKGame, "currentGame");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gameDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:](self, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:", v18, a3, a4, location, length, v19, v13);

}

- (void)loadEntriesWithGameDescriptor:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 range:(_NSRange)a6 completionHandler:(id)a7
{
  -[GKLeaderboard loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:](self, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:", a3, a4, a5, a6.location, a6.length, 0, a7);
}

+ (id)leaderboardEntriesHandlerForGroup:(id)a3 gameBundleID:(id)a4 proxy:(id)a5 done:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__GKLeaderboard_leaderboardEntriesHandlerForGroup_gameBundleID_proxy_done___block_invoke;
  v13[3] = &unk_1E75B2D70;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  v11 = _Block_copy(v13);

  return v11;
}

void __75__GKLeaderboard_leaderboardEntriesHandlerForGroup_gameBundleID_proxy_done___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  GKLeaderboardEntry *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", a5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("totalPlayerCount"));

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v9, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playerID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = v10;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v22, "player");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "playerID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v22, "player");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "playerID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v26);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

    if (v9)
    {
      v27 = -[GKLeaderboardEntry initWithInternalRepresentation:]([GKLeaderboardEntry alloc], "initWithInternalRepresentation:", v9);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v27, CFSTR("localPlayerEntry"));

    }
    objc_msgSend(v17, "_gkMapWithBlock:", &__block_literal_global_55_0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = v28;
    else
      v30 = MEMORY[0x1E0C9AA60];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v30, CFSTR("entries"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v10 = v31;
  }

}

GKLeaderboardEntry *__75__GKLeaderboard_leaderboardEntriesHandlerForGroup_gameBundleID_proxy_done___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboardEntry *v3;

  v2 = a2;
  v3 = -[GKLeaderboardEntry initWithInternalRepresentation:]([GKLeaderboardEntry alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

- (void)loadEntriesWithGameDescriptor:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 range:(_NSRange)a6 locale:(id)a7 completionHandler:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  int64_t v32;
  int64_t v33;
  NSUInteger v34;
  NSUInteger v35;

  length = a6.length;
  location = a6.location;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 652, "-[GKLeaderboard loadEntriesWithGameDescriptor:playerScope:timeScope:range:locale:completionHandler:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke;
  v28[3] = &unk_1E75B2D98;
  v28[4] = self;
  v29 = v14;
  v33 = a5;
  v34 = location;
  v35 = length;
  v32 = a4;
  v30 = v15;
  v20 = v18;
  v31 = v20;
  v21 = v15;
  v22 = v14;
  objc_msgSend(v20, "perform:", v28);
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke_2;
  v25[3] = &unk_1E75B1BF0;
  v26 = v20;
  v27 = v16;
  v23 = v20;
  v24 = v16;
  objc_msgSend(v23, "notifyOnMainQueueWithBlock:", v25);

}

void __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "gameStatService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLeaderboard leaderboardEntriesHandlerForGroup:gameBundleID:proxy:done:](GKLeaderboard, "leaderboardEntriesHandlerForGroup:gameBundleID:proxy:done:", v9, v10, v15, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:handler:", v12, v13, v5, v7, v6, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), 0, v8, v11);
}

void __100__GKLeaderboard_loadEntriesWithGameDescriptor_playerScope_timeScope_range_locale_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0, 0);
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localPlayerEntry"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("entries"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("totalPlayerCount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, uint64_t, _QWORD))(v4 + 16))(v4, v7, v5, objc_msgSend(v6, "integerValue"), 0);

    }
  }
}

- (void)loadEntriesWithGameDescriptor:(id)a3 fetchOptions:(unint64_t)a4 playerScope:(int64_t)a5 timeScope:(int64_t)a6 range:(_NSRange)a7 completionHandler:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  NSUInteger v32;
  NSUInteger v33;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 693, "-[GKLeaderboard loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke;
  v26[3] = &unk_1E75B2DC0;
  v26[4] = self;
  v27 = v14;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = location;
  v33 = length;
  v19 = v17;
  v28 = v19;
  v20 = v14;
  objc_msgSend(v19, "perform:", v26);
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke_2;
  v23[3] = &unk_1E75B1BF0;
  v24 = v19;
  v25 = v15;
  v21 = v19;
  v22 = v15;
  objc_msgSend(v21, "notifyOnMainQueueWithBlock:", v23);

}

void __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "gameStatServicePrivate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLeaderboard leaderboardEntriesHandlerForGroup:gameBundleID:proxy:done:](GKLeaderboard, "leaderboardEntriesHandlerForGroup:gameBundleID:proxy:done:", v9, v10, v15, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "getEntriesForLeaderboard:fetchOptions:gameDescriptor:localPlayer:playerScope:timeScope:range:players:handler:", v4, v13, v12, v6, v7, v8, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), 0, v11);
}

void __106__GKLeaderboard_loadEntriesWithGameDescriptor_fetchOptions_playerScope_timeScope_range_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0, 0);
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localPlayerEntry"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("entries"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("totalPlayerCount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, uint64_t, _QWORD))(v4 + 16))(v4, v7, v5, objc_msgSend(v6, "integerValue"), 0);

    }
  }
}

- (void)loadEntriesForPlayers:(NSArray *)players timeScope:(GKLeaderboardTimeScope)timeScope completionHandler:(void *)completionHandler
{
  -[GKLeaderboard loadEntriesForPlayers:timeScope:locale:completionHandler:](self, "loadEntriesForPlayers:timeScope:locale:completionHandler:", players, timeScope, 0, completionHandler);
}

- (void)loadEntriesForPlayers:(id)a3 timeScope:(int64_t)a4 locale:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  GKLeaderboard *v23;
  id v24;
  int64_t v25;

  v9 = a3;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 734, "-[GKLeaderboard loadEntriesForPlayers:timeScope:locale:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke;
  v21[3] = &unk_1E75B1BC8;
  v22 = v9;
  v23 = self;
  v25 = a4;
  v14 = v12;
  v24 = v14;
  v15 = v9;
  objc_msgSend(v14, "perform:", v21);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke_3;
  v18[3] = &unk_1E75B1BF0;
  v19 = v14;
  v20 = v10;
  v16 = v14;
  v17 = v10;
  objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v18);

}

void __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_gkMapWithBlock:", &__block_literal_global_60_0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gameDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "gameStatService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "gameDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a1 + 48;
  v12 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(v13 + 8);
  objc_msgSend(v7, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLeaderboard leaderboardEntriesHandlerForGroup:gameBundleID:proxy:done:](GKLeaderboard, "leaderboardEntriesHandlerForGroup:gameBundleID:proxy:done:", v12, v14, v5, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:handler:", v16, v8, v10, 0, v11, 1, 0, v19, v15);
}

uint64_t __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "internal");
}

void __74__GKLeaderboard_loadEntriesForPlayers_timeScope_locale_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      objc_msgSend(v3, "error");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localPlayerEntry"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("entries"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, _QWORD))(v4 + 16))(v4, v6, v5, 0);

    }
  }
}

- (void)loadSummaryWithTimeScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  int64_t v18;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 767, "-[GKLeaderboard loadSummaryWithTimeScope:completionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke;
  v16[3] = &unk_1E75B2E50;
  v16[4] = self;
  v18 = a3;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v10, "perform:", v16);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_3;
  v13[3] = &unk_1E75B1BF0;
  v14 = v10;
  v15 = v6;
  v11 = v10;
  v12 = v6;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v13);

}

void __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "gameStatService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "gameDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseLeaderboardID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_2;
  v16[3] = &unk_1E75B2E28;
  v11 = *(_QWORD *)(a1 + 48);
  v17 = *(id *)(a1 + 40);
  v18 = v3;
  v12 = v3;
  objc_msgSend(v13, "getLeaderboardSummaryForGameDescriptor:localPlayer:baseLeaderboardID:leaderboardID:timeScope:handler:", v4, v6, v8, v10, v11, v16);

}

void __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  GKLeaderboardSummary *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    v6 = a2;
    v7 = -[GKLeaderboardSummary initWithInternalRepresentation:]([GKLeaderboardSummary alloc], "initWithInternalRepresentation:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setResult:", v7);
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__GKLeaderboard_loadSummaryWithTimeScope_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

+ (void)loadHighlightsWithPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  +[GKGame currentGame](GKGame, "currentGame");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadHighlightsWithPlayerScope:timeScope:game:handler:", a3, a4, v9, v8);

}

+ (void)loadHighlightsWithPlayerScope:(int64_t)a3 timeScope:(int64_t)a4 game:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  int64_t v21;
  int64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGameRecord gameRecordForPlayer:game:](GKGameRecord, "gameRecordForPlayer:game:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "defaultLeaderboardIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "defaultLeaderboardIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke;
  v18[3] = &unk_1E75B2EC8;
  v21 = a3;
  v22 = a4;
  v19 = v9;
  v20 = v10;
  v16 = v10;
  v17 = v9;
  +[GKLeaderboard loadLeaderboardsWithIDs:game:completionHandler:](GKLeaderboard, "loadLeaderboardsWithIDs:game:completionHandler:", v15, v17, v18);

}

void __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 48) == 1)
      v5 = 600;
    else
      v5 = 100;
    objc_msgSend(*(id *)(a1 + 32), "gameDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_2;
    v11[3] = &unk_1E75B2EA0;
    v9 = *(void **)(a1 + 40);
    v14 = v8;
    v12 = v4;
    v13 = v9;
    v10 = v4;
    objc_msgSend(v10, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:", v6, v8, v7, 1, v5, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9 || v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (*(_QWORD *)(a1 + 48) == 1)
    {
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v24[3] = 1;
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_3;
      v21 = &unk_1E75B2E78;
      v23 = v24;
      v22 = v8;
      objc_msgSend(v9, "_gkFilterWithBlock:", &v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "count", v18, v19, v20, v21);
      _Block_object_dispose(v24, 8);
      v9 = v12;
    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    if (objc_msgSend(v8, "rank") >= 1 && (v14 = objc_msgSend(v8, "rank"), v14 <= objc_msgSend(v9, "count")))
    {
      if (objc_msgSend(v8, "rank") < 2)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "rank") - 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(v8, "rank");
      if (v16 >= objc_msgSend(v9, "count"))
      {
        v17 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "rank"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

id __70__GKLeaderboard_loadHighlightsWithPlayerScope_timeScope_game_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocalPlayer");

  objc_msgSend(v3, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "friendBiDirectional");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", &unk_1E75FAFF8);

  if ((v8 & 1) != 0 || v5)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v3, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRank:", v10);

    if (v5)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRank:", v12);

    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v9 = v3;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)creator
{
  GKPlayer *v3;
  void *v4;
  void *v5;
  GKPlayer *v6;

  v3 = [GKPlayer alloc];
  -[GKLeaderboard internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKPlayer initWithInternalRepresentation:](v3, "initWithInternalRepresentation:", v5);

  return v6;
}

- (void)startWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 854, "-[GKLeaderboard startWithHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__GKLeaderboard_startWithHandler___block_invoke;
  v12[3] = &unk_1E75B1788;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v8, "perform:", v12);
  if (v4)
  {
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __34__GKLeaderboard_startWithHandler___block_invoke_3;
    v9[3] = &unk_1E75B1BF0;
    v11 = v4;
    v10 = v8;
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v9);

  }
}

void __34__GKLeaderboard_startWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__GKLeaderboard_startWithHandler___block_invoke_2;
  v9[3] = &unk_1E75B17D8;
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "startLeaderboardWithID:handler:", v7, v9);

}

uint64_t __34__GKLeaderboard_startWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __34__GKLeaderboard_startWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)endWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 871, "-[GKLeaderboard endWithHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__GKLeaderboard_endWithHandler___block_invoke;
  v12[3] = &unk_1E75B1788;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v8, "perform:", v12);
  if (v4)
  {
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __32__GKLeaderboard_endWithHandler___block_invoke_3;
    v9[3] = &unk_1E75B1BF0;
    v11 = v4;
    v10 = v8;
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v9);

  }
}

void __32__GKLeaderboard_endWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__GKLeaderboard_endWithHandler___block_invoke_2;
  v9[3] = &unk_1E75B17D8;
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "endLeaderboardWithID:handler:", v7, v9);

}

uint64_t __32__GKLeaderboard_endWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __32__GKLeaderboard_endWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)deleteWithHandler:(id)a3
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
  int v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKLeaderboard.m", 888, "-[GKLeaderboard deleteWithHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboard internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "internal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqualToString:", v12);

  v14 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __35__GKLeaderboard_deleteWithHandler___block_invoke;
    v19[3] = &unk_1E75B1788;
    v19[4] = self;
    v20 = v6;
    objc_msgSend(v20, "perform:", v19);

    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 32, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setError:", v15);

  if (v4)
  {
LABEL_5:
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __35__GKLeaderboard_deleteWithHandler___block_invoke_3;
    v16[3] = &unk_1E75B1BF0;
    v18 = v4;
    v17 = v6;
    objc_msgSend(v17, "notifyOnMainQueueWithBlock:", v16);

  }
LABEL_6:

}

void __35__GKLeaderboard_deleteWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__GKLeaderboard_deleteWithHandler___block_invoke_2;
  v9[3] = &unk_1E75B17D8;
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "deleteLeaderboardWithID:handler:", v7, v9);

}

uint64_t __35__GKLeaderboard_deleteWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __35__GKLeaderboard_deleteWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKLeaderboard;
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
  v10.super_class = (Class)GKLeaderboard;
  -[GKLeaderboard methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKLeaderboard forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
  v8.super_class = (Class)GKLeaderboard;
  if (-[GKLeaderboard respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKLeaderboard forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
    return +[GKLeaderboardInternal instancesRespondToSelector:](GKLeaderboardInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKLeaderboard internal](self, "internal");
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
  -[GKLeaderboard internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (GKLeaderboardTimeScope)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(GKLeaderboardTimeScope)timeScope
{
  self->_timeScope = timeScope;
}

- (GKLeaderboardPlayerScope)playerScope
{
  return self->_playerScope;
}

- (void)setPlayerScope:(GKLeaderboardPlayerScope)playerScope
{
  self->_playerScope = playerScope;
}

- (GKLeaderboardInternal)internal
{
  return (GKLeaderboardInternal *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (GKLeaderboardDelegate)delegate
{
  return (GKLeaderboardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GKScore)localPlayerScore
{
  return self->_localPlayerScore;
}

- (void)setLocalPlayerScore:(id)a3
{
  objc_storeStrong((id *)&self->_localPlayerScore, a3);
}

- (int)loadingCount
{
  return self->_loadingCount;
}

- (void)setLoadingCount:(int)a3
{
  self->_loadingCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPlayerScore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_players, 0);
}

@end
