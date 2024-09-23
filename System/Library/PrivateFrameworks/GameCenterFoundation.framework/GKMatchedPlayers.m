@implementation GKMatchedPlayers

- (GKMatchedPlayers)initWithMatch:(id)a3 players:(id)a4
{
  id v6;
  id v7;
  GKMatchedPlayers *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *properties;
  void *v12;
  uint64_t v13;
  NSDictionary *playerProperties;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GKMatchedPlayers;
  v8 = -[GKMatchedPlayers init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v6, "properties");
      v10 = objc_claimAutoreleasedReturnValue();
      properties = v8->_properties;
      v8->_properties = (NSDictionary *)v10;
    }
    else
    {
      properties = v8->_properties;
      v8->_properties = 0;
    }

    objc_storeStrong((id *)&v8->_players, a4);
    objc_msgSend(v6, "playerProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v6, "playerProperties");
      v13 = objc_claimAutoreleasedReturnValue();
      playerProperties = v8->_playerProperties;
      v8->_playerProperties = (NSDictionary *)v13;
    }
    else
    {
      playerProperties = v8->_playerProperties;
      v8->_playerProperties = 0;
    }

  }
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchedPlayers properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p properties:%@, players[properties]:\n"), v5, self, v6);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GKMatchedPlayers players](self, "players");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKMatchedPlayers playerProperties](self, "playerProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@[%@]"), v13, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSArray)players
{
  return self->_players;
}

- (NSDictionary)playerProperties
{
  return self->_playerProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerProperties, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
