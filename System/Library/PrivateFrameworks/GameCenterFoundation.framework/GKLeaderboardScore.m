@implementation GKLeaderboardScore

+ (id)convertToGKScore:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  GKScore *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  GKScore *v12;
  void *v13;
  void *v14;
  GKScore *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "player");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = [GKScore alloc];
          objc_msgSend(v10, "leaderboardID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "player");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[GKScore initWithLeaderboardIdentifier:player:](v12, "initWithLeaderboardIdentifier:player:", v13, v14);

        }
        else
        {
          v15 = objc_alloc_init(GKScore);

          objc_msgSend(v10, "leaderboardID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKScore setLeaderboardIdentifier:](v15, "setLeaderboardIdentifier:", v13);
        }
        v7 = v15;

        -[GKScore setValue:](v15, "setValue:", objc_msgSend(v10, "value"));
        -[GKScore setContext:](v15, "setContext:", objc_msgSend(v10, "context"));
        objc_msgSend(v4, "addObject:", v15);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);

  }
  return v4;
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(GKPlayer *)player
{
  objc_storeStrong((id *)&self->_player, player);
}

- (NSInteger)value
{
  return self->_value;
}

- (void)setValue:(NSInteger)value
{
  self->_value = value;
}

- (NSUInteger)context
{
  return self->_context;
}

- (void)setContext:(NSUInteger)context
{
  self->_context = context;
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

- (void)setLeaderboardID:(NSString *)leaderboardID
{
  objc_storeStrong((id *)&self->_leaderboardID, leaderboardID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardID, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
