@implementation GKGameSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_4 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_4, &__block_literal_global_28);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_4;
}

void __48__GKGameSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_4;
  secureCodedPropertyKeys_sSecureCodedKeys_4 = (uint64_t)v0;

  objc_msgSend((id)secureCodedPropertyKeys_sSecureCodedKeys_4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("bundleID"));
  objc_msgSend((id)secureCodedPropertyKeys_sSecureCodedKeys_4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("playedAt"));
  objc_msgSend((id)secureCodedPropertyKeys_sSecureCodedKeys_4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("adamID"));
  objc_msgSend((id)secureCodedPropertyKeys_sSecureCodedKeys_4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("isArcade"));
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)secureCodedPropertyKeys_sSecureCodedKeys_4, "setObject:forKeyedSubscript:", v4, CFSTR("compatiblePlatforms"));

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKGameSummaryInternal adamID](self, "adamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSummaryInternal bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSummaryInternal playedAt](self, "playedAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKGameSummaryInternal isArcade](self, "isArcade"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSummaryInternal compatiblePlatforms](self, "compatiblePlatforms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("adamID: %@ bundleID: %@ playedAt: %@ isArcade: %@ compatiblePlatforms: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (NSDate)playedAt
{
  return self->_playedAt;
}

- (void)setPlayedAt:(id)a3
{
  objc_storeStrong((id *)&self->_playedAt, a3);
}

- (NSSet)compatiblePlatforms
{
  return self->_compatiblePlatforms;
}

- (void)setCompatiblePlatforms:(id)a3
{
  objc_storeStrong((id *)&self->_compatiblePlatforms, a3);
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatiblePlatforms, 0);
  objc_storeStrong((id *)&self->_playedAt, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
