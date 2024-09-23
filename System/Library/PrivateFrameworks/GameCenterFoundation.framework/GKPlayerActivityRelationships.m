@implementation GKPlayerActivityRelationships

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_452 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_452, &__block_literal_global_453);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_451;
}

void __56__GKPlayerActivityRelationships_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("players");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("games");
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("leaderboards");
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("achievements");
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_451;
  secureCodedPropertyKeys_sSecureCodedKeys_451 = v12;

}

- (GKPlayerActivityRelationships)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityRelationships *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  GKPlayerActivityRelationshipPlayer *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  GKPlayerActivityRelationshipGame *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  GKPlayerActivityRelationshipLeaderboard *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  GKPlayerActivityRelationshipAchievement *v38;
  void *v40;
  id v41;
  GKPlayerActivityRelationships *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)GKPlayerActivityRelationships;
  v5 = -[GKPlayerActivityRelationships init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("players"));
    v42 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v8 = v6;
    v5 = v42;
    v9 = v8;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v56 != v12)
            objc_enumerationMutation(v9);
          v14 = -[GKPlayerActivityRelationshipPlayer initWithDictionary:]([GKPlayerActivityRelationshipPlayer alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v11);
    }
    v40 = v9;

    -[GKPlayerActivityRelationships setPlayers:](v42, "setPlayers:", v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("games"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v17);
          v22 = -[GKPlayerActivityRelationshipGame initWithDictionary:]([GKPlayerActivityRelationshipGame alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      }
      while (v19);
    }

    -[GKPlayerActivityRelationships setGames:](v42, "setGames:", v16);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leaderboards"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v4;
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leaderboards"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v48 != v28)
              objc_enumerationMutation(v25);
            v30 = -[GKPlayerActivityRelationshipLeaderboard initWithDictionary:]([GKPlayerActivityRelationshipLeaderboard alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
            objc_msgSend(v24, "addObject:", v30);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        }
        while (v27);
      }

      v5 = v42;
      -[GKPlayerActivityRelationships setLeaderboards:](v42, "setLeaderboards:", v24);

      v4 = v41;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("achievements"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("achievements"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v44;
        do
        {
          for (m = 0; m != v35; ++m)
          {
            if (*(_QWORD *)v44 != v36)
              objc_enumerationMutation(v33);
            v38 = -[GKPlayerActivityRelationshipAchievement initWithDictionary:]([GKPlayerActivityRelationshipAchievement alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m));
            objc_msgSend(v32, "addObject:", v38);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
        }
        while (v35);
      }

      v5 = v42;
      -[GKPlayerActivityRelationships setAchievements:](v42, "setAchievements:", v32);

      v4 = v41;
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKPlayerActivityRelationships players](self, "players");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationships games](self, "games");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationships leaderboards](self, "leaderboards");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationships achievements](self, "achievements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("players: %@ \ngames: %@ \nleaderboard: %@ \nachievements: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (NSArray)games
{
  return self->_games;
}

- (void)setGames:(id)a3
{
  objc_storeStrong((id *)&self->_games, a3);
}

- (NSArray)leaderboards
{
  return self->_leaderboards;
}

- (void)setLeaderboards:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboards, a3);
}

- (NSArray)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_achievements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievements, 0);
  objc_storeStrong((id *)&self->_leaderboards, 0);
  objc_storeStrong((id *)&self->_games, 0);
  objc_storeStrong((id *)&self->_players, 0);
}

@end
