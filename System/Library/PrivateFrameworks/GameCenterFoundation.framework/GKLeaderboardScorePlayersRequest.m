@implementation GKLeaderboardScorePlayersRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLeaderboardScorePlayersRequest)initWithCoder:(id)a3
{
  id v4;
  GKLeaderboardScorePlayersRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *playerInternals;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKLeaderboardScorePlayersRequest;
  v5 = -[GKLeaderboardScoreRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("playerInternals"));
    v9 = objc_claimAutoreleasedReturnValue();
    playerInternals = v5->_playerInternals;
    v5->_playerInternals = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLeaderboardScorePlayersRequest;
  v4 = a3;
  -[GKLeaderboardScoreRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NSArray _gkMapWithBlock:](self->_playerInternals, "_gkMapWithBlock:", &__block_literal_global_25, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("playerInternals"));

}

uint64_t __52__GKLeaderboardScorePlayersRequest_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "minimalInternal");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *playerInternals;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardScorePlayersRequest;
  if (-[GKLeaderboardScoreRequest isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    playerInternals = self->_playerInternals;
    v7 = playerInternals == (NSArray *)v5[8] || -[NSArray isEqual:](playerInternals, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)playerInternals
{
  return self->_playerInternals;
}

- (void)setPlayerInternals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerInternals, 0);
}

@end
