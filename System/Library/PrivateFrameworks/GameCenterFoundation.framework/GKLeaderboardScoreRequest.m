@implementation GKLeaderboardScoreRequest

+ (id)requestForRankRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  GKLeaderboardScoreRangeRequest *v5;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc_init(GKLeaderboardScoreRangeRequest);
  -[GKLeaderboardScoreRangeRequest setRange:](v5, "setRange:", location, length);
  return v5;
}

+ (id)requestForPlayerInternals:(id)a3
{
  id v3;
  GKLeaderboardScorePlayersRequest *v4;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardScorePlayersRequest);
  -[GKLeaderboardScorePlayersRequest setPlayerInternals:](v4, "setPlayerInternals:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLeaderboardScoreRequest)initWithCoder:(id)a3
{
  id v4;
  GKLeaderboardScoreRequest *v5;
  uint64_t v6;
  GKPlayerInternal *playerInternal;
  uint64_t v8;
  NSString *gameBundleID;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *groupIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKLeaderboardScoreRequest;
  v5 = -[GKLeaderboardScoreRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerInternal"));
    v6 = objc_claimAutoreleasedReturnValue();
    playerInternal = v5->_playerInternal;
    v5->_playerInternal = (GKPlayerInternal *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gameBundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    gameBundleID = v5->_gameBundleID;
    v5->_gameBundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v12;

    v5->_timeScope = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("timeScope"));
    v5->_friendsOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("friendsOnly"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GKPlayerInternal *playerInternal;
  void *v5;
  id v6;

  playerInternal = self->_playerInternal;
  v6 = a3;
  -[GKPlayerInternal minimalInternal](playerInternal, "minimalInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("playerInternal"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_gameBundleID, CFSTR("gameBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v6, "encodeInt32:forKey:", LODWORD(self->_timeScope), CFSTR("timeScope"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_friendsOnly, CFSTR("friendsOnly"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_groupIdentifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString **v5;
  NSString *identifier;
  NSString *groupIdentifier;
  GKPlayerInternal *playerInternal;
  NSString *gameBundleID;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSString **)v4;
    identifier = self->_identifier;
    v10 = (identifier == v5[3] || -[NSString isEqualToString:](identifier, "isEqualToString:"))
       && ((groupIdentifier = self->_groupIdentifier, groupIdentifier == v5[4])
        || -[NSString isEqualToString:](groupIdentifier, "isEqualToString:"))
       && ((playerInternal = self->_playerInternal, playerInternal == (GKPlayerInternal *)v5[1])
        || -[GKPlayerInternal isEqual:](playerInternal, "isEqual:"))
       && ((gameBundleID = self->_gameBundleID, gameBundleID == v5[2])
        || -[NSString isEqualToString:](gameBundleID, "isEqualToString:"))
       && (NSString *)self->_timeScope == v5[6]
       && self->_friendsOnly == *((unsigned __int8 *)v5 + 40);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GKPlayerInternal)playerInternal
{
  return self->_playerInternal;
}

- (void)setPlayerInternal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)friendsOnly
{
  return self->_friendsOnly;
}

- (void)setFriendsOnly:(BOOL)a3
{
  self->_friendsOnly = a3;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (BOOL)isPrefetch
{
  return self->_prefetch;
}

- (void)setPrefetch:(BOOL)a3
{
  self->_prefetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_gameBundleID, 0);
  objc_storeStrong((id *)&self->_playerInternal, 0);
}

@end
