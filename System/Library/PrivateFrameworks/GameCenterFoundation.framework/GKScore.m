@implementation GKScore

- (id)copyWithZone:(_NSZone *)a3
{
  GKScore *v4;
  void *v5;
  void *v6;
  GKScore *v7;

  v4 = [GKScore alloc];
  -[GKScore internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[GKScore initWithInternalRepresentation:](v4, "initWithInternalRepresentation:", v6);

  return v7;
}

- (GKScore)initWithInternalRepresentation:(id)a3 playerInternal:(id)a4
{
  id v6;
  id v7;
  GKScore *v8;
  uint64_t v9;
  GKGame *game;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKScore;
  v8 = -[GKScore init](&v13, sel_init);
  if (v8)
  {
    if (!v6)
    {
      +[GKInternalRepresentation internalRepresentation](GKScoreInternal, "internalRepresentation");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_internal, v6);
    +[GKGame currentGame](GKGame, "currentGame");
    v9 = objc_claimAutoreleasedReturnValue();
    game = v8->_game;
    v8->_game = (GKGame *)v9;

    -[GKScoreInternal player](v8->_internal, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[GKScoreInternal setPlayer:](v8->_internal, "setPlayer:", v7);
  }

  return v8;
}

- (GKScore)initWithInternalRepresentation:(id)a3 playerID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GKScore *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "player");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (v7)
    {
      v10 = 0;
    }
    else
    {
      +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "internal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playerID");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "alias");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v9 = 0;
        goto LABEL_7;
      }
    }
    +[GKInternalRepresentation internalRepresentation](GKPlayerInternal, "internalRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlayerID:", v7);
    objc_msgSend(v9, "setAlias:", v10);
LABEL_7:

    goto LABEL_8;
  }
  v9 = (void *)v8;
LABEL_8:
  v13 = -[GKScore initWithInternalRepresentation:playerInternal:](self, "initWithInternalRepresentation:playerInternal:", v6, v9);

  return v13;
}

- (GKScore)initWithInternalRepresentation:(id)a3
{
  return -[GKScore initWithInternalRepresentation:playerID:](self, "initWithInternalRepresentation:playerID:", a3, 0);
}

- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier
{
  NSString *v4;
  void *v5;
  void *v6;
  GKScore *v7;

  v4 = identifier;
  +[GKInternalRepresentation internalRepresentation](GKScoreInternal, "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeaderboardIdentifier:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v6);

  v7 = -[GKScore initWithInternalRepresentation:playerID:](self, "initWithInternalRepresentation:playerID:", v5, 0);
  return v7;
}

- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier player:(GKPlayer *)player
{
  GKPlayer *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GKScore *v12;

  v6 = player;
  v7 = identifier;
  +[GKInternalRepresentation internalRepresentation](GKScoreInternal, "internalRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeaderboardIdentifier:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDate:", v9);

  -[GKPlayer internal](v6, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "minimalInternal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GKScore initWithInternalRepresentation:playerInternal:](self, "initWithInternalRepresentation:playerInternal:", v8, v11);

  return v12;
}

- (GKScore)initWithLeaderboardIdentifier:(NSString *)identifier forPlayer:(NSString *)playerID
{
  NSString *v6;
  NSString *v7;
  id v8;
  NSObject *v9;
  GKScore *v10;
  void *v11;
  void *v12;

  v6 = identifier;
  v7 = playerID;
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKScore initWithLeaderboardIdentifier:forPlayer:].cold.1(v9);
    v10 = 0;
  }
  else
  {
    +[GKInternalRepresentation internalRepresentation](GKScoreInternal, "internalRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeaderboardIdentifier:", v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDate:", v12);

    self = -[GKScore initWithInternalRepresentation:playerID:](self, "initWithInternalRepresentation:playerID:", v11, v7);
    v10 = self;
  }

  return v10;
}

- (GKScore)init
{
  void *v3;
  void *v4;
  GKScore *v5;

  +[GKGame currentGame](GKGame, "currentGame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GKScore initWithLeaderboardIdentifier:](self, "initWithLeaderboardIdentifier:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKScore)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GKScore *v6;
  GKScore *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKScore initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v5);
  v7 = v6;
  if (!v5)
  {
    -[GKScore internal](v6, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("value")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formattedValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattedValue:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeaderboardIdentifier:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKInternalRepresentation internalRepresentation](GKPlayerInternal, "internalRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlayerID:", v11);
    objc_msgSend(v5, "setPlayer:", v12);
    objc_msgSend(v5, "setRank:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rank")));
    objc_msgSend(v5, "setContext:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("context")));

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKScore internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("internal"));

}

- (NSString)playerID
{
  void *v2;
  void *v3;

  -[GKScoreInternal player](self->_internal, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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

  -[GKScoreInternal player](self->_internal, "player");
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
      -[GKScore player].cold.1((uint64_t)self, v9);
    v7 = 0;
  }

  return (GKPlayer *)v7;
}

+ (void)reportScores:(NSArray *)scores withCompletionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "reportScores:whileScreeningChallenges:withEligibleChallenges:withCompletionHandler:", scores, 0, MEMORY[0x1E0C9AA60], completionHandler);
}

+ (void)reportScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 withCompletionHandler:(id)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id *v31;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  BOOL v41;
  _QWORD block[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a5;
  v33 = a6;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = CFSTR("GKInvalidArgumentException");
    v12 = *(_QWORD *)v45;
    v35 = *(_QWORD *)v45;
    do
    {
      v13 = 0;
      v36 = v10;
      do
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v13);
        objc_msgSend(v14, "leaderboardIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

        }
        else if (GKApplicationLinkedOnOrAfter())
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v11, CFSTR("A GKScore must specify a leaderboard."));
        }
        if ((objc_msgSend(v14, "valueSet") & 1) == 0 && GKApplicationLinkedOnOrAfter())
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v11, CFSTR("A GKScore must contain an initialized value."));
        objc_msgSend(v14, "player");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          if ((objc_msgSend(v16, "isLocalPlayer") & 1) != 0)
            goto LABEL_22;
          v18 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(v17, "internal");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "conciseDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "raise:format:", v11, CFSTR("A GKScore can only be submitted for another player when ending a turn-based match (trying to submit score for %@)"), v20);

        }
        else
        {
          objc_msgSend(v14, "playerID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v21 = v11;
            v22 = v8;
            +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "internal");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "playerID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v19, "isEqualToString:", v25);

            if ((v26 & 1) != 0)
            {
              v8 = v22;
              v11 = v21;
            }
            else
            {
              v11 = v21;
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v21, CFSTR("A GKScore can only be submitted for another player when ending a turn-based match (trying to submit score for %@)"), v19);
              v8 = v22;
            }
            v12 = v35;
            v10 = v36;
          }
        }

LABEL_22:
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v10);
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isStoreDemoModeEnabled");

  if (!v28)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2;
    v37[3] = &unk_1E75B4C20;
    v31 = &v38;
    v38 = v8;
    v41 = a4;
    v29 = v34;
    v39 = v34;
    v30 = v33;
    v40 = v33;
    gk_dispatch_as_group(v37);

    goto LABEL_28;
  }
  v30 = v33;
  v29 = v34;
  if (v33)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke;
    block[3] = &unk_1E75B1520;
    v31 = &v43;
    v43 = v33;
    dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_28:

  }
}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;
  _QWORD aBlock[5];
  _QWORD v20[5];
  id v21;

  v3 = a2;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__8;
  v20[4] = __Block_byref_object_dispose__8;
  v4 = MEMORY[0x1E0C809B0];
  v21 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_37;
  aBlock[3] = &unk_1E75B4B80;
  aBlock[4] = v20;
  v5 = _Block_copy(aBlock);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2_39;
  v14[3] = &unk_1E75B4BD0;
  v15 = *(id *)(a1 + 32);
  v18 = *(_BYTE *)(a1 + 56);
  v16 = *(id *)(a1 + 40);
  v6 = v5;
  v17 = v6;
  gk_dispatch_group_do(v3, v14);
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "shouldSetDefaultLeaderboard"))
  {
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4;
    v11[3] = &unk_1E75B4BF8;
    v12 = v7;
    v13 = v6;
    gk_dispatch_group_do(v3, v11);

  }
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_6;
  block[3] = &unk_1E75B3058;
  v9 = *(id *)(a1 + 48);
  v10 = v20;
  dispatch_group_notify(v3, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v20, 8);
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_37(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_2_39(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  objc_msgSend(*(id *)(a1 + 32), "_gkValuesForKeyPath:", CFSTR("internal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_gkValuesForKeyPath:", CFSTR("challengeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E75B4BA8;
  v11 = *(id *)(a1 + 48);
  v12 = v3;
  v9 = v3;
  objc_msgSend(v5, "submitScores:whileScreeningChallenges:withEligibleChallenges:handler:", v6, v7, v8, v10);

}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leaderboardIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E75B4BA8;
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "setDefaultLeaderboardIdentifier:completionHandler:", v5, v7);

}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __94__GKScore_reportScores_whileScreeningChallenges_withEligibleChallenges_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)reportScoreWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = completionHandler;
  objc_msgSend(v4, "arrayWithObject:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[GKScore reportScores:withCompletionHandler:](GKScore, "reportScores:withCompletionHandler:", v6, v5);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSInteger v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKScore;
  -[GKScore description](&v16, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScore player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conciseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKScore rank](self, "rank");
  -[GKScore date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[GKScore value](self, "value");
  -[GKScore formattedValue](self, "formattedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GKScore context](self, "context");
  -[GKScore leaderboardIdentifier](self, "leaderboardIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScore groupLeaderboardIdentifier](self, "groupLeaderboardIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("player:%@ rank:%ld date:%@ value:%lld formattedValue:%@ context:0x%llx leaderboard:%@ group:%@"), v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKScore internal](self, "internal");
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
    -[GKScore internal](self, "internal");
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

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKScore;
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
  v10.super_class = (Class)GKScore;
  -[GKScore methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKScore forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
  v8.super_class = (Class)GKScore;
  if (-[GKScore respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKScore forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
    return +[GKScoreInternal instancesRespondToSelector:](GKScoreInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKScore internal](self, "internal");
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
  -[GKScore internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (GKScoreInternal)internal
{
  return (GKScoreInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)shouldSetDefaultLeaderboard
{
  return self->_shouldSetDefaultLeaderboard;
}

- (void)setShouldSetDefaultLeaderboard:(BOOL)shouldSetDefaultLeaderboard
{
  self->_shouldSetDefaultLeaderboard = shouldSetDefaultLeaderboard;
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
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)initWithLeaderboardIdentifier:(os_log_t)log forPlayer:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = 136446722;
  v2 = "-[GKScore initWithLeaderboardIdentifier:forPlayer:]";
  v3 = 2114;
  v4 = CFSTR("14.0");
  v5 = 2114;
  v6 = CFSTR("11.0");
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

- (void)player
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "<GKScore %p> has a nil or invalid internal player, will return a nil player", (uint8_t *)&v2, 0xCu);
}

@end
