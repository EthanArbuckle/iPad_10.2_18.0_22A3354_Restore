@implementation GKScoreInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
  self->_valueSet = 1;
}

- (GKScoreInternal)initWithCoder:(id)a3
{
  id v4;
  GKScoreInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GKScoreInternal;
  v5 = -[GKScoreInternal init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("player"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKScoreInternal setPlayer:](v5, "setPlayer:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leaderboardIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKScoreInternal setLeaderboardIdentifier:](v5, "setLeaderboardIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupLeaderboardIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKScoreInternal setGroupLeaderboardIdentifier:](v5, "setGroupLeaderboardIdentifier:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[GKInternalRepresentation internalRepresentation](GKPlayerInternal, "internalRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPlayerID:", v9);
      -[GKScoreInternal setPlayer:](v5, "setPlayer:", v10);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[GKScoreInternal setCategory:](v5, "setCategory:", v11);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupCategory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[GKScoreInternal setGroupCategory:](v5, "setGroupCategory:", v12);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formattedValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKScoreInternal setFormattedValue:](v5, "setFormattedValue:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKScoreInternal setDate:](v5, "setDate:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rank"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = objc_msgSend(v15, "unsignedIntegerValue");
    else
      v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rank"));
    -[GKScoreInternal setRank:](v5, "setRank:", v17);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = objc_msgSend(v18, "longLongValue");
    else
      v20 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("value"));
    -[GKScoreInternal setValue:](v5, "setValue:", v20);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("valueSet")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueSet"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKScoreInternal setValueSet:](v5, "setValueSet:", objc_msgSend(v21, "BOOLValue"));

    }
    else
    {
      -[GKScoreInternal setValueSet:](v5, "setValueSet:", 1);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v24 = objc_msgSend(v22, "longLongValue");
    else
      v24 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("context"));
    -[GKScoreInternal setContext:](v5, "setContext:", v24);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setPlayer:", self->_player);
    objc_msgSend(v5, "setLeaderboardIdentifier:", self->_leaderboardIdentifier);
    objc_msgSend(v5, "setGroupLeaderboardIdentifier:", self->_groupLeaderboardIdentifier);
    objc_msgSend(v5, "setFormattedValue:", self->_formattedValue);
    objc_msgSend(v5, "setDate:", self->_date);
    objc_msgSend(v5, "setValue:", self->_value);
    objc_msgSend(v5, "setContext:", self->_context);
    objc_msgSend(v5, "setRank:", self->_rank);
    objc_msgSend(v5, "setValueSet:", self->_valueSet);
  }
  return v5;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_21 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_21, &__block_literal_global_62);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_21;
}

void __42__GKScoreInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("player");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("leaderboardIdentifier");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("groupLeaderboardIdentifier");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("formattedValue");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("date");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("value");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("context");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("rank");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("valueSet");
  v3[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_21;
  secureCodedPropertyKeys_sSecureCodedKeys_21 = v0;

}

- (id)serverRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GKScoreInternal *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[GKScoreInternal value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreInternal leaderboardIdentifier](self, "leaderboardIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[GKScoreInternal context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreInternal date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = self;
  else
    v8 = (GKScoreInternal *)MEMORY[0x1E0C99D68];
  -[GKScoreInternal date](v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_gkServerTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("score-value"), v5, CFSTR("category"), v6, CFSTR("context"), v10, CFSTR("timestamp"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  unsigned int v7;
  int64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[GKScoreInternal rank](self, "rank");
    if (v7 != objc_msgSend(v6, "rank")
      || (v8 = -[GKScoreInternal value](self, "value"), v8 != objc_msgSend(v6, "value"))
      || (v9 = -[GKScoreInternal context](self, "context"), v9 != objc_msgSend(v6, "context")))
    {
      v13 = 0;
LABEL_10:

      goto LABEL_11;
    }
    -[GKScoreInternal date](self, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[GKScoreInternal date](self, "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v12))
      {
        v13 = 0;
LABEL_20:

LABEL_21:
        goto LABEL_10;
      }
      v22 = v12;
    }
    -[GKScoreInternal playerID](self, "playerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v16))
    {
      -[GKScoreInternal leaderboardIdentifier](self, "leaderboardIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leaderboardIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqual:", v18) & 1) != 0)
      {
        v13 = 1;
      }
      else
      {
        -[GKScoreInternal groupLeaderboardIdentifier](self, "groupLeaderboardIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "groupLeaderboardIdentifier");
        v21 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v20, "isEqual:", v19);

        v3 = v21;
      }

    }
    else
    {

      v13 = 0;
    }
    v12 = v22;
    if (v10 == v11)
      goto LABEL_21;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKScoreInternal playerID](self, "playerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSString)leaderboardIdentifier
{
  return self->_leaderboardIdentifier;
}

- (void)setLeaderboardIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardIdentifier, a3);
}

- (NSString)groupLeaderboardIdentifier
{
  return self->_groupLeaderboardIdentifier;
}

- (void)setGroupLeaderboardIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupLeaderboardIdentifier, a3);
}

- (NSString)formattedValue
{
  return self->_formattedValue;
}

- (void)setFormattedValue:(id)a3
{
  objc_storeStrong((id *)&self->_formattedValue, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (int64_t)value
{
  return self->_value;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  self->_rank = a3;
}

- (BOOL)valueSet
{
  return self->_valueSet;
}

- (void)setValueSet:(BOOL)a3
{
  self->_valueSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->_groupLeaderboardIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboardIdentifier, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (NSString)playerID
{
  void *v2;
  void *v3;

  -[GKScoreInternal player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
