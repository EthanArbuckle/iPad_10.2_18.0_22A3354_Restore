@implementation GKAchievement

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKAchievement percentComplete](self, "percentComplete");
    v7 = v6;
    objc_msgSend(v5, "percentComplete");
    if (v7 == v8)
    {
      -[GKAchievement internal](self, "internal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "internal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKAchievement internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (GKAchievement)initWithInternalRepresentation:(id)a3
{
  return -[GKAchievement initWithInternalRepresentation:playerID:](self, "initWithInternalRepresentation:playerID:", a3, 0);
}

- (GKAchievement)initWithInternalRepresentation:(id)a3 playerID:(id)a4
{
  id v6;
  id v7;
  GKAchievement *v8;
  GKAchievement *v9;
  void *v10;
  GKGame *v11;
  void *v12;
  uint64_t v13;
  GKGame *game;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[GKInternalRepresentation internalRepresentation](GKAchievementInternal, "internalRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22.receiver = self;
  v22.super_class = (Class)GKAchievement;
  v8 = -[GKAchievement init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v6, "gameHint"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      v11 = [GKGame alloc];
      objc_msgSend(v6, "gameHint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[GKGame initWithInternalRepresentation:](v11, "initWithInternalRepresentation:", v12);
      game = v9->_game;
      v9->_game = (GKGame *)v13;

    }
    else
    {
      +[GKGame currentGame](GKGame, "currentGame");
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = v9->_game;
      v9->_game = (GKGame *)v15;
    }

    v9->_showsCompletionBanner = 1;
    -[GKAchievementInternal player](v9->_internal, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if (v7)
      {
        v17 = 0;
      }
      else
      {
        +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "internal");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "playerID");
        v7 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "alias");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[GKInternalRepresentation internalRepresentation](GKPlayerInternal, "internalRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPlayerID:", v7);
      objc_msgSend(v20, "setAlias:", v17);
      -[GKAchievementInternal setPlayer:](v9->_internal, "setPlayer:", v20);

    }
  }

  return v9;
}

- (GKAchievement)initWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  void *v5;
  void *v6;
  GKAchievement *v7;

  v4 = identifier;
  +[GKInternalRepresentation internalRepresentation](GKAchievementInternal, "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastReportedDate:", v6);

  v7 = -[GKAchievement initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v5);
  return v7;
}

- (GKAchievement)initWithIdentifier:(NSString *)identifier player:(GKPlayer *)player
{
  NSString *v6;
  GKPlayer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GKAchievement *v12;

  v6 = identifier;
  v7 = player;
  if (!v7)
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v7 = (GKPlayer *)objc_claimAutoreleasedReturnValue();
  }
  +[GKInternalRepresentation internalRepresentation](GKAchievementInternal, "internalRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastReportedDate:", v9);

  -[GKPlayer internal](v7, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalInternal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlayer:", v11);

  v12 = -[GKAchievement initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v8);
  return v12;
}

- (GKAchievement)initWithIdentifier:(NSString *)identifier forPlayer:(NSString *)playerID
{
  NSString *v6;
  NSString *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  GKAchievement *v17;
  void *v18;
  void *v19;

  v6 = identifier;
  v7 = playerID;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKAchievement initWithIdentifier:forPlayer:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = 0;
  }
  else
  {
    +[GKInternalRepresentation internalRepresentation](GKAchievementInternal, "internalRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIdentifier:", v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLastReportedDate:", v19);

    self = -[GKAchievement initWithInternalRepresentation:playerID:](self, "initWithInternalRepresentation:playerID:", v18, v7);
    v17 = self;
  }

  return v17;
}

- (GKAchievement)init
{
  return -[GKAchievement initWithIdentifier:](self, "initWithIdentifier:", CFSTR("*uninitialized achievement identifier*"));
}

- (NSString)playerID
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
  __CFString *v12;
  void *v13;

  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKAchievement playerID].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = CFSTR("playerID is no longer available");
  }
  else
  {
    -[GKAchievementInternal player](self->_internal, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playerID");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v12;
}

- (GKPlayer)player
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  -[GKAchievementInternal player](self->_internal, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "alias"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      -[GKAchievement player].cold.1((uint64_t)self, v9, v10);
    v7 = 0;
  }

  return (GKPlayer *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAchievement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GKAchievement *v6;
  GKAchievement *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKAchievement initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v5);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      -[GKAchievement internal](v6, "internal");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIdentifier:", v8);

      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentComplete"));
      objc_msgSend(v5, "setPercentComplete:");
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastReportedDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLastReportedDate:", v9);

    }
    -[GKAchievement setShowsCompletionBanner:](v7, "setShowsCompletionBanner:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsCompletionBanner")));
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKAchievement internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("internal"));

  objc_msgSend(v5, "encodeBool:forKey:", -[GKAchievement showsCompletionBanner](self, "showsCompletionBanner"), CFSTR("showsCompletionBanner"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  GKAchievement *v4;
  void *v5;
  void *v6;
  GKAchievement *v7;

  v4 = [GKAchievement alloc];
  -[GKAchievement internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[GKAchievement initWithInternalRepresentation:](v4, "initWithInternalRepresentation:", v6);

  return v7;
}

- (BOOL)isCompleted
{
  double v2;

  -[GKAchievement percentComplete](self, "percentComplete");
  return v2 >= 100.0;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKAchievement;
  -[GKAchievement description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievement identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievement percentComplete](self, "percentComplete");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("id: %@\t%f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)loadAchievementsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = completionHandler;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGame currentGame](GKGame, "currentGame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__GKAchievement_loadAchievementsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E75B1CF0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(a1, "loadAchievementsForGameV2:player:includeUnreported:includeHidden:withCompletionHandler:", v6, v5, 0, 1, v8);

}

void __55__GKAchievement_loadAchievementsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (void)loadAchievementsForGameV2:(id)a3 player:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 withCompletionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v8 = a6;
  v9 = a5;
  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a7;
  v21[0] = v11;
  v13 = (void *)MEMORY[0x1E0C99D20];
  v14 = a3;
  objc_msgSend(v13, "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__GKAchievement_loadAchievementsForGameV2_player_includeUnreported_includeHidden_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E75B28B0;
  v19 = v11;
  v20 = v12;
  v16 = v11;
  v17 = v12;
  +[GKAchievement loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:](GKAchievement, "loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:", v14, v15, v9, v8, v18);

}

void __104__GKAchievement_loadAchievementsForGameV2_player_includeUnreported_includeHidden_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "referenceKey");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);
  }
}

+ (void)loadAchievementsForGameV2:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
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
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  BOOL v33;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = objc_msgSend(v12, "count");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKAchievement.m", 245, "+[GKAchievement loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E75B2950;
  v19 = v11;
  v28 = v19;
  v20 = v12;
  v29 = v20;
  v32 = a5;
  v33 = a6;
  v21 = v15;
  v30 = v21;
  v22 = v17;
  v31 = v22;
  objc_msgSend(v22, "perform:", v27);
  if (v13)
  {
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_5;
    v23[3] = &unk_1E75B17B0;
    v26 = v13;
    v24 = v21;
    v25 = v22;
    objc_msgSend(v25, "notifyOnMainQueueWithBlock:", v23);

  }
}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  id v13;
  id v14;
  __int16 v15;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gameDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_gkInternalsFromPlayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E75B2928;
  v10 = *(id *)(a1 + 40);
  v15 = *(_WORD *)(a1 + 64);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = v3;
  v8 = v3;
  objc_msgSend(v5, "getAchievementsForGameDescriptor:players:handler:", v6, v7, v9);

}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int16 v13;

  v5 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E75B2900;
  v10 = v5;
  v13 = *(_WORD *)(a1 + 72);
  v6 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v8 = v5;
  v7 = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(*(id *)(a1 + 56), "setError:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int16 v14;

  v3 = a2;
  objc_msgSend(v3, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_4;
    v11[3] = &unk_1E75B28D8;
    v14 = *(_WORD *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    v7 = v3;
    v13 = v7;
    objc_msgSend(v6, "_gkFilterWithBlock:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(a1 + 48);
      objc_msgSend(v7, "referenceKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v10);

    }
  }

}

GKAchievement *__105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  GKAchievement *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48)
    || (objc_msgSend(v3, "lastReportedDate"),
        v5 = (GKAchievement *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (*(_BYTE *)(a1 + 49)
      || !objc_msgSend(v4, "isHidden")
      || objc_msgSend(v4, "isCompleted"))
    {
      v5 = -[GKAchievement initWithInternalRepresentation:]([GKAchievement alloc], "initWithInternalRepresentation:", v4);
      -[GKAchievement setGame:](v5, "setGame:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "internal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minimalInternal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKAchievement internal](v5, "internal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPlayer:", v7);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

void __105__GKAchievement_loadAchievementsForGameV2_players_includeUnreported_includeHidden_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

+ (void)loadAchievementWithID:(id)a3 forGame:(id)a4 players:(id)a5 complete:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKAchievement.m", 284, "+[GKAchievement loadAchievementWithID:forGame:players:complete:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v12, "count");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v16);
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke;
  v28[3] = &unk_1E75B29A0;
  v34 = a1;
  v19 = v11;
  v29 = v19;
  v20 = v12;
  v30 = v20;
  v21 = v10;
  v31 = v21;
  v22 = v17;
  v32 = v22;
  v23 = v15;
  v33 = v23;
  objc_msgSend(v23, "perform:", v28);
  if (v13)
  {
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_3;
    v24[3] = &unk_1E75B17B0;
    v27 = v13;
    v25 = v22;
    v26 = v23;
    objc_msgSend(v26, "notifyOnMainQueueWithBlock:", v24);

  }
}

void __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_2;
  v8[3] = &unk_1E75B2978;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = v3;
  v7 = v3;
  objc_msgSend(v4, "loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:", v5, v6, 0, 0, v8);

}

void __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t i;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a2, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v12, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32)))
              {

              }
              else
              {
                objc_msgSend(v12, "groupIdentifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32));

                if (!v15)
                  continue;
              }
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v9);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(a1 + 48), "setError:", v16);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __64__GKAchievement_loadAchievementWithID_forGame_players_complete___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

+ (void)resetAchievementsWithCompletionHandler:(void *)completionHandler
{
  void (**v3)(void *, _QWORD);
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(void *, _QWORD);

  v3 = completionHandler;
  +[GKPreferences shared](GKPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStoreDemoModeEnabled");

  if (v5)
  {
    if (v3)
      v3[2](v3, 0);
  }
  else
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gameStatService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__GKAchievement_resetAchievementsWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E75B29C8;
    v9 = v3;
    objc_msgSend(v7, "resetAchievementsWithHandler:", v8);

  }
}

uint64_t __56__GKAchievement_resetAchievementsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)reportAchievements:(NSArray *)achievements withCompletionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "reportAchievements:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:", achievements, 0, 0, completionHandler);
}

+ (void)reportAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  void (**v39)(id, _QWORD);
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  +[GKPreferences shared](GKPreferences, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isStoreDemoModeEnabled");

  if (v13)
  {
    if (v11)
      v11[2](v11, 0);
  }
  else
  {
    v35 = a4;
    v36 = v10;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    v46 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v47 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v19, "player");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            objc_msgSend(v19, "player");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isLocalPlayer");

            if ((v23 & 1) == 0)
            {
              if (!os_log_GKGeneral)
                v30 = GKOSLoggers();
              v31 = os_log_GKError;
              if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
                +[GKAchievement reportAchievements:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:].cold.1((uint64_t)v19, v31);
              v32 = (void *)MEMORY[0x1E0CB35C8];
              v50[0] = CFSTR("achievement");
              v50[1] = CFSTR("description");
              v51[0] = v19;
              v51[1] = CFSTR("A GKAchievement for another player can only be submitted when ending a turn-based match.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "userErrorForCode:userInfo:", 17, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              ((void (**)(id, void *))v11)[2](v11, v34);
              v10 = v36;
              goto LABEL_21;
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v16)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKAchievement.m", 351, "+[GKAchievement reportAchievements:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke;
    v40[3] = &unk_1E75B2A40;
    v28 = v26;
    v41 = v28;
    v29 = v25;
    v42 = v29;
    v43 = v14;
    v45 = v35;
    v10 = v36;
    v44 = v36;
    objc_msgSend(v29, "perform:", v40);
    if (v11)
    {
      v37[0] = v27;
      v37[1] = 3221225472;
      v37[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5;
      v37[3] = &unk_1E75B1BF0;
      v39 = v11;
      v38 = v29;
      objc_msgSend(v38, "notifyOnMainQueueWithBlock:", v37);

    }
  }
LABEL_21:

}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  +[GKGame currentGame](GKGame, "currentGame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E75B2A18;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = v3;
  v9 = *(id *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  +[GKAchievementDescription loadAchievementDescriptionsForGame:withCompletionHandler:](GKAchievementDescription, "loadAchievementDescriptionsForGame:withCompletionHandler:", v4, v6);

}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  +[GKGame currentGame](GKGame, "currentGame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E75B29F0;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v13 = *(_BYTE *)(a1 + 72);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  +[GKAchievement loadAchievementsForGameV2:player:includeUnreported:includeHidden:withCompletionHandler:](GKAchievement, "loadAchievementsForGameV2:player:includeUnreported:includeHidden:withCompletionHandler:", v4, v5, 1, 1, v7);

}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          +[GKAchievement descriptionForAchievement:achievementDescriptions:](GKAchievement, "descriptionForAchievement:achievementDescriptions:", v11, *(_QWORD *)(a1 + 48));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (+[GKAchievement shouldShowBannerOnReport:achievementDescription:reportedAchievements:](GKAchievement, "shouldShowBannerOnReport:achievementDescription:reportedAchievements:", v11, v12, v5))
            {
              objc_msgSend(v12, "showBanner");
            }
            objc_msgSend(v12, "rarityPercent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "internal");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setRarityPercent:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "gameStatService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_gkValuesForKeyPath:", CFSTR("internal"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(unsigned __int8 *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 56), "_gkValuesForKeyPath:", CFSTR("challengeID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4;
    v20[3] = &unk_1E75B17D8;
    v21 = *(id *)(a1 + 32);
    v22 = *(id *)(a1 + 64);
    objc_msgSend(v16, "submitAchievements:whileScreeningChallenges:withEligibleChallenges:handler:", v17, v18, v19, v20);

  }
}

uint64_t __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __106__GKAchievement_reportAchievements_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)descriptionForAchievement:(id)a3 achievementDescriptions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("identifier == %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      if (!os_log_GKGeneral)
        v11 = GKOSLoggers();
      v12 = (void *)os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        +[GKAchievement descriptionForAchievement:achievementDescriptions:].cold.2(v12, v5);
    }
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_GKGeneral)
      v14 = GKOSLoggers();
    v15 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      +[GKAchievement descriptionForAchievement:achievementDescriptions:].cold.1(v15, v5);
    v13 = 0;
  }

  return v13;
}

+ (BOOL)showBannerIsSupported
{
  if (showBannerIsSupported_supportsShowBannerOnceToken != -1)
    dispatch_once(&showBannerIsSupported_supportsShowBannerOnceToken, &__block_literal_global_17);
  return showBannerIsSupported_supportsShowBanner;
}

uint64_t __38__GKAchievement_showBannerIsSupported__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_showBanner);
  showBannerIsSupported_supportsShowBanner = result;
  return result;
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 reportedAchievements:(id)a4
{
  return +[GKAchievement shouldShowBannerOnReport:achievementDescription:reportedAchievements:](GKAchievement, "shouldShowBannerOnReport:achievementDescription:reportedAchievements:", a3, 0, a4);
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 achievementDescription:(id)a4 reportedAchievements:(id)a5
{
  return +[GKAchievement shouldShowBannerOnReport:achievementDescription:reportedAchievements:uiFrameworkMethodsRequired:](GKAchievement, "shouldShowBannerOnReport:achievementDescription:reportedAchievements:uiFrameworkMethodsRequired:", a3, a4, a5, 1);
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 reportedAchievements:(id)a4 uiFrameworkMethodsRequired:(BOOL)a5
{
  return +[GKAchievement shouldShowBannerOnReport:achievementDescription:reportedAchievements:uiFrameworkMethodsRequired:](GKAchievement, "shouldShowBannerOnReport:achievementDescription:reportedAchievements:uiFrameworkMethodsRequired:", a3, 0, a4, a5);
}

+ (BOOL)shouldShowBannerOnReport:(id)a3 achievementDescription:(id)a4 reportedAchievements:(id)a5 uiFrameworkMethodsRequired:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11
     && objc_msgSend(v11, "isReplayable")
     && +[GKUtils applicationLinkedOnOrAfter:macVersion:](GKUtils, "applicationLinkedOnOrAfter:macVersion:", 1179648, 983040);
  if (objc_msgSend(v10, "showsCompletionBanner")
    && objc_msgSend(v10, "isCompleted")
    && (!v6 || objc_msgSend(a1, "showBannerIsSupported")))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __113__GKAchievement_shouldShowBannerOnReport_achievementDescription_reportedAchievements_uiFrameworkMethodsRequired___block_invoke;
    v16[3] = &unk_1E75B2A88;
    v17 = v10;
    v18 = &v20;
    v19 = v13;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);
    v14 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __113__GKAchievement_shouldShowBannerOnReport_achievementDescription_reportedAchievements_uiFrameworkMethodsRequired___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  v9 = v12;
  if (v8)
  {
    v10 = objc_msgSend(v12, "isCompleted");
    v11 = 1;
    if (v10)
      v11 = *(_BYTE *)(a1 + 48) != 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
    *a4 = 1;
    v9 = v12;
  }

}

- (void)reportAchievementWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = completionHandler;
  objc_msgSend(v4, "arrayWithObject:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[GKAchievement reportAchievements:withCompletionHandler:](GKAchievement, "reportAchievements:withCompletionHandler:", v6, v5);

}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKAchievement;
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
  v10.super_class = (Class)GKAchievement;
  -[GKAchievement methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKAchievement forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
  v8.super_class = (Class)GKAchievement;
  if (-[GKAchievement respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKAchievement forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
    return +[GKAchievementInternal instancesRespondToSelector:](GKAchievementInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKAchievement internal](self, "internal");
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
  -[GKAchievement internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (GKAchievementInternal)internal
{
  return (GKAchievementInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)showsCompletionBanner
{
  return self->_showsCompletionBanner;
}

- (void)setShowsCompletionBanner:(BOOL)showsCompletionBanner
{
  self->_showsCompletionBanner = showsCompletionBanner;
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (id)_achievementDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  GKAchievementDescription *v9;
  void *v10;

  -[GKAchievement game](self, "game");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gameDescriptorDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKContentPropertyList localPropertyListForGameDescriptor:](GKContentPropertyList, "localPropertyListForGameDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[GKAchievement identifier](self, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "achievementDescriptionForIdentifier:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    +[GKAchievementDescription _achievementDescriptionFromGame:propertyListDictionary:](GKAchievementDescription, "_achievementDescriptionFromGame:propertyListDictionary:", v3, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = [GKAchievementDescription alloc];
    -[GKAchievement internal](self, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[GKAchievementDescription initWithInternalRepresentation:](v9, "initWithInternalRepresentation:", v7);
  }
  v10 = (void *)v8;

  return v10;
}

- (void)initWithIdentifier:(uint64_t)a3 forPlayer:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)playerID
{
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)player
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, a2, a3, "<GKAchievement %p> has a nil or invalid internal player, will return a nil player", (uint8_t *)&v3);
}

+ (void)reportAchievements:(uint64_t)a1 whileScreeningChallenges:(NSObject *)a2 withEligibleChallenges:withCompletionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("A GKAchievement for another player can only be submitted when ending a turn-based match.");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "%@ %@", (uint8_t *)&v2, 0x16u);
}

+ (void)descriptionForAchievement:(void *)a1 achievementDescriptions:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v3, v5, "No AchievementDescription could be found for Achievement with ID: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

+ (void)descriptionForAchievement:(void *)a1 achievementDescriptions:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v3, v5, "More than one AchievementDescription found for Achievement with ID: %@. Using the first one found.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

@end
