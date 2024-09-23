@implementation GKPlayerActivityRelationshipLeaderboardScore

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_346 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_346, &__block_literal_global_347);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_345;
}

void __71__GKPlayerActivityRelationshipLeaderboardScore_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("player");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("score");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("rank");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("message");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("gained");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("symbol");
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_345;
  secureCodedPropertyKeys_sSecureCodedKeys_345 = v0;

}

- (GKPlayerActivityRelationshipLeaderboardScore)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityRelationshipLeaderboardScore *v5;
  void *v6;
  GKPlayerActivityRelationshipPlayer *v7;
  void *v8;
  GKPlayerActivityRelationshipPlayer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKPlayerActivityRelationshipLeaderboardScore;
  v5 = -[GKPlayerActivityRelationshipLeaderboardScore init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipLeaderboardScore setScore:](v5, "setScore:", v6);

    v7 = [GKPlayerActivityRelationshipPlayer alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("player"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GKPlayerActivityRelationshipPlayer initWithDictionary:](v7, "initWithDictionary:", v8);
    -[GKPlayerActivityRelationshipLeaderboardScore setPlayer:](v5, "setPlayer:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rank"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipLeaderboardScore setRank:](v5, "setRank:", objc_msgSend(v10, "integerValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipLeaderboardScore setMessage:](v5, "setMessage:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gained"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipLeaderboardScore setGained:](v5, "setGained:", objc_msgSend(v12, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbol"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipLeaderboardScore setSymbol:](v5, "setSymbol:", v13);

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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKPlayerActivityRelationshipLeaderboardScore score](self, "score");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipLeaderboardScore player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKPlayerActivityRelationshipLeaderboardScore rank](self, "rank"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKPlayerActivityRelationshipLeaderboardScore gained](self, "gained"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipLeaderboardScore message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipLeaderboardScore symbol](self, "symbol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("score: %@ \nplayer: %@ \nrank: %@ \ngained: %@ \n message: %@ \n symbol: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (GKPlayerActivityRelationshipPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSString)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (BOOL)gained
{
  return self->_gained;
}

- (void)setGained:(BOOL)a3
{
  self->_gained = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_symbol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
