@implementation GKRecentMatchInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_278 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_278, &__block_literal_global_279);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_277;
}

void __48__GKRecentMatchInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("player");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("game");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("date");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_277;
  secureCodedPropertyKeys_sSecureCodedKeys_277 = v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKRecentMatchInternal game](self, "game");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRecentMatchInternal player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRecentMatchInternal date](self, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "game");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 == v10 || objc_msgSend(v7, "isEqual:", v10))
      && (v6 == v9 || objc_msgSend(v6, "isEqual:", v9)))
    {
      if (v8 == v11)
        v12 = 1;
      else
        v12 = objc_msgSend(v8, "isEqual:", v11);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[GKRecentMatchInternal player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[GKRecentMatchInternal game](self, "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[GKRecentMatchInternal date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (GKGameRecordInternal)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
