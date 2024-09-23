@implementation GKChallenge

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKChallenge internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKChallenge internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (GKChallenge)initWithInternalRepresentation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKChallenge;
  return -[GKChallenge init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKChallenge)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GKChallenge *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GKChallenge initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKChallenge internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("internal"));

}

+ (id)stringForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("GKChallengeStateInvalid");
  else
    return off_1E75B5A78[a3 - 1];
}

+ (id)challengeForInternalRepresentation:(id)a3
{
  id v3;
  __objc2_class **v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = off_1E75AFA30;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = off_1E75AF580;
  }
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithInternalRepresentation:", v3);
LABEL_7:

  return v5;
}

+ (id)challengeForGame:(id)a3 andPlayer:(id)a4 withScore:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  GKScoreChallenge *v19;
  uint64_t v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "leaderboardIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v9, "leaderboardIdentifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E75BB5A8),
        v12,
        v11,
        v13))
  {
    if (v9)
    {
      v23 = CFSTR("score");
      v24[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("GKScore must have a defined category"), v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  +[GKScoreChallengeInternal internalRepresentation](GKScoreChallengeInternal, "internalRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGame:", v15);

  objc_msgSend(v7, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBundleID:", v16);

  objc_msgSend(v8, "internal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIssuingPlayer:", v17);

  objc_msgSend(v9, "internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScore:", v18);

  v19 = -[GKScoreChallenge initWithInternalRepresentation:]([GKScoreChallenge alloc], "initWithInternalRepresentation:", v14);
  return v19;
}

+ (id)challengeForGame:(id)a3 andPlayer:(id)a4 withAchievement:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  GKAchievementChallenge *v19;
  uint64_t v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v9, "identifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E75BB5A8),
        v12,
        v11,
        v13))
  {
    if (v9)
    {
      v23 = CFSTR("achievement");
      v24[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("GKAchievement must have a defined identifier"), v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  +[GKAchievementChallengeInternal internalRepresentation](GKAchievementChallengeInternal, "internalRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGame:", v15);

  objc_msgSend(v7, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBundleID:", v16);

  objc_msgSend(v8, "internal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIssuingPlayer:", v17);

  objc_msgSend(v9, "internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAchievement:", v18);

  v19 = -[GKAchievementChallenge initWithInternalRepresentation:]([GKAchievementChallenge alloc], "initWithInternalRepresentation:", v14);
  return v19;
}

+ (void)getCountOfChallenges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "challengeServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__GKChallenge_getCountOfChallenges___block_invoke;
  v7[3] = &unk_1E75B4550;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "getCountOfChallengesWithHandler:", v7);

}

uint64_t __36__GKChallenge_getCountOfChallenges___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)loadChallengesForGame:(id)a3 receivingPlayer:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKChallenge.m", 188, "+[GKChallenge loadChallengesForGame:receivingPlayer:withCompletionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E75B5948;
  v11 = v6;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  objc_msgSend(v12, "perform:", v17);
  if (v13)
  {
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_5;
    v14[3] = &unk_1E75B1BF0;
    v16 = v13;
    v15 = v12;
    objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v14);

  }
}

void __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
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
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "challengeService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "gameDescriptorDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B5920;
  v9 = a1[5];
  v11 = a1[6];
  v12 = v3;
  v10 = a1[4];
  v7 = v3;
  objc_msgSend(v5, "getChallengesForGameDescriptor:handler:", v6, v8);

}

void __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (*(_QWORD *)(a1 + 48) && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
          v13 = *(void **)(a1 + 40);
          if (v13)
          {
            objc_msgSend(v13, "internal");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setGame:", v14);

          }
          +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v6, "addObject:", v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "_gkMapWithBlock:", &__block_literal_global_38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E75B30F8;
    v19 = *(id *)(a1 + 32);
    v20 = v6;
    v21 = *(id *)(a1 + 56);
    v17 = v6;
    objc_msgSend(v16, "_gkUpdateInternalPlayersScopedIDs:", v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

id __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "score");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "internal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("challenges"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __75__GKChallenge_loadChallengesForGame_receivingPlayer_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("challenges"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

+ (void)loadChallengesForReceivingPlayer:(id)a3 withCompletionHandler:(id)a4
{
  +[GKChallenge loadChallengesForGame:receivingPlayer:withCompletionHandler:](GKChallenge, "loadChallengesForGame:receivingPlayer:withCompletionHandler:", 0, a3, a4);
}

+ (void)loadReceivedPendingChallengesWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E75B1CF0;
  v6 = v3;
  v4 = v3;
  +[GKChallenge loadReceivedChallengesWithCompletionHandler:](GKChallenge, "loadReceivedChallengesWithCompletionHandler:", v5);

}

void __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke_cold_1((uint64_t)v6, v8);
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v10, v6);

}

BOOL __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke_45(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 1;
}

+ (void)loadReceivedChallengesWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = completionHandler;
  +[GKGame currentGame](GKGame, "currentGame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__GKChallenge_loadReceivedChallengesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E75B1CF0;
  v8 = v3;
  v6 = v3;
  +[GKChallenge loadChallengesForGame:receivingPlayer:withCompletionHandler:](GKChallenge, "loadChallengesForGame:receivingPlayer:withCompletionHandler:", v4, v5, v7);

}

void __59__GKChallenge_loadReceivedChallengesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void)issueToPlayers:(id)a3 message:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v6 = a4;
  v7 = objc_msgSend(v20, "count");
  if (!v20 || !v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("players must be provided to issue a challenge"), 0, v20);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v20, "containsObject:", v8);

  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v21[0] = CFSTR("challenge");
    v21[1] = CFSTR("players");
    v22[0] = self;
    v22[1] = v20;
    v21[2] = CFSTR("localPlayer");
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, CFSTR("Issuing challenges to yourself is not allowed"), v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }
  if (objc_msgSend(v20, "count"))
  {
    -[GKChallenge setMessage:](self, "setMessage:", v6);
    objc_msgSend(v20, "_gkMapWithBlock:", &__block_literal_global_61);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "challengeService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallenge internal](self, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "issueChallenge:toPlayers:handler:", v13, v10, &__block_literal_global_63);

  }
}

uint64_t __38__GKChallenge_issueToPlayers_message___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "internal");
}

- (void)declineWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[GKChallenge state](self, "state") != GKChallengeStatePending)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("invalidChallenge");
    v15[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, CFSTR("Canceling challenges that are not currently pending is not allowed"), v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v12);
  }
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "challengeService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallenge internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "abortChallenges:handler:", v8, v4);

}

- (void)decline
{
  -[GKChallenge declineWithCompletionHandler:](self, "declineWithCompletionHandler:", &__block_literal_global_69);
}

- (GKGame)game
{
  GKGame *v3;
  void *v4;
  void *v5;
  GKGame *v6;

  v3 = [GKGame alloc];
  -[GKChallenge internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKGame initWithInternalRepresentation:](v3, "initWithInternalRepresentation:", v5);

  return v6;
}

- (NSString)issuingPlayerID
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
  void *v14;

  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKChallenge issuingPlayerID].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = CFSTR("playerID is no longer available");
  }
  else
  {
    -[GKChallenge internal](self, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "issuingPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playerID");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v12;
}

- (NSString)receivingPlayerID
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
  void *v14;

  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKChallenge receivingPlayerID].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = CFSTR("playerID is no longer available");
  }
  else
  {
    -[GKChallenge internal](self, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "receivingPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playerID");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v12;
}

- (GKPlayer)issuingPlayer
{
  void *v2;
  void *v3;
  void *v4;

  -[GKChallenge internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "issuingPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKPlayer *)v4;
}

- (GKPlayer)receivingPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[GKChallenge internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "receivingPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[GKChallenge internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receivingPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (GKPlayer *)v7;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKChallenge;
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
  v10.super_class = (Class)GKChallenge;
  -[GKChallenge methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKChallenge forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
  v8.super_class = (Class)GKChallenge;
  if (-[GKChallenge respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKChallenge forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
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
    return +[GKChallengeInternal instancesRespondToSelector:](GKChallengeInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKChallenge internal](self, "internal");
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
  -[GKChallenge internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (BOOL)hasLoadedUIDetails
{
  return 0;
}

- (void)loadUIDetailsWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (id)infoTextForIssuingPlayer:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  +[GCFLocalizedStrings CHALLENGE_DETAIL_GOAL_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_DETAIL_GOAL_FORMAT");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)detailsLoaded
{
  return 0;
}

- (void)loadDetailsWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (GKChallengeInternal)internal
{
  return (GKChallengeInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

void __66__GKChallenge_loadReceivedPendingChallengesWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "cannot load received challenges due to error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)issuingPlayerID
{
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
}

- (void)receivingPlayerID
{
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, a1, a3, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", a5, a6, a7, a8, 2u);
}

@end
