@implementation GKPlayerActivityRelationshipLeaderboard

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GKPlayerActivityRelationshipLeaderboard_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_416 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_416, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_415;
}

void __66__GKPlayerActivityRelationshipLeaderboard_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipLeaderboard;
  objc_msgSendSuper2(&v8, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v9[0] = CFSTR("scores");
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("leaderboardInternal");
  v10[0] = v5;
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v6);

  v7 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_415;
  secureCodedPropertyKeys_sSecureCodedKeys_415 = (uint64_t)v2;

}

- (GKPlayerActivityRelationshipLeaderboard)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityRelationshipLeaderboard *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GKPlayerActivityRelationshipLeaderboardScore *v16;
  GKPlayerActivityRelationshipLeaderboardScore *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)GKPlayerActivityRelationshipLeaderboard;
  v5 = -[GKPlayerActivityRelationshipBase initWithDictionary:](&v32, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("FRIENDS")))
      v7 = 1;
    else
      v7 = 2;
    -[GKPlayerActivityRelationshipLeaderboard setLeaderboardType:](v5, "setLeaderboardType:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scores"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v16 = [GKPlayerActivityRelationshipLeaderboardScore alloc];
          v17 = -[GKPlayerActivityRelationshipLeaderboardScore initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v28);
          objc_msgSend(v9, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    -[GKPlayerActivityRelationshipLeaderboard setScores:](v5, "setScores:", v9);
    v18 = (void *)objc_opt_new();
    -[GKPlayerActivityRelationshipBase identifier](v5, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBaseLeaderboardID:", v19);

    -[GKPlayerActivityRelationshipBase name](v5, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v20);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instance-id"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start-date"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v21 && v22 && v23)
    {
      objc_msgSend(v18, "setIdentifier:", v21);
      objc_msgSend(v18, "setType:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "_gkDateFromServerTimestamp:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setStartDate:", v25);

      objc_msgSend(v24, "doubleValue");
      objc_msgSend(v18, "setDuration:");
    }
    else
    {
      -[GKPlayerActivityRelationshipBase identifier](v5, "identifier", (_QWORD)v28);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIdentifier:", v26);

      objc_msgSend(v18, "setType:", 0);
    }
    -[GKPlayerActivityRelationshipLeaderboard setLeaderboardInternal:](v5, "setLeaderboardInternal:", v18, (_QWORD)v28);

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
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipLeaderboard;
  -[GKPlayerActivityRelationshipBase description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipBase name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipBase image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipLeaderboard scores](self, "scores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipLeaderboard leaderboardInternal](self, "leaderboardInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \nname: %@ \nimage: %@, scores: %@, leaderboard: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (int64_t)leaderboardType
{
  return self->_leaderboardType;
}

- (void)setLeaderboardType:(int64_t)a3
{
  self->_leaderboardType = a3;
}

- (GKLeaderboardInternal)leaderboardInternal
{
  return self->_leaderboardInternal;
}

- (void)setLeaderboardInternal:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardInternal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardInternal, 0);
  objc_storeStrong((id *)&self->_scores, 0);
}

@end
