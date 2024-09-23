@implementation GKLeaderboardChallengeComparisonInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_415 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_415, &__block_literal_global_416);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_414;
}

void __67__GKLeaderboardChallengeComparisonInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("completedChallengeCount");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("completedChallengeGameCount");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("completedChallenges");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("wonChallenges");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_414;
  secureCodedPropertyKeys_sSecureCodedKeys_414 = v0;

}

- (GKLeaderboardChallengeComparisonInternal)initWithServerRepresentation:(id)a3
{
  id v4;
  GKLeaderboardChallengeComparisonInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKLeaderboardChallengeComparisonInternal;
  v5 = -[GKLeaderboardChallengeComparisonInternal init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("challenges-count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeComparisonInternal setCompletedChallengeCount:](v5, "setCompletedChallengeCount:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("challenge-games-count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeComparisonInternal setCompletedChallengeGameCount:](v5, "setCompletedChallengeGameCount:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completed-challenges"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLeaderboardChallengeDetailsPageInternal initWithServerFragment:](GKLeaderboardChallengeDetailsPageInternal, "initWithServerFragment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeComparisonInternal setCompletedChallenges:](v5, "setCompletedChallenges:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wins"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLeaderboardChallengeWinComparisonPageInternal initWithServerFragment:](GKLeaderboardChallengeWinComparisonPageInternal, "initWithServerFragment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeComparisonInternal setWonChallenges:](v5, "setWonChallenges:", v11);

  }
  return v5;
}

- (NSNumber)completedChallengeCount
{
  return self->_completedChallengeCount;
}

- (void)setCompletedChallengeCount:(id)a3
{
  objc_storeStrong((id *)&self->_completedChallengeCount, a3);
}

- (NSNumber)completedChallengeGameCount
{
  return self->_completedChallengeGameCount;
}

- (void)setCompletedChallengeGameCount:(id)a3
{
  objc_storeStrong((id *)&self->_completedChallengeGameCount, a3);
}

- (GKLeaderboardChallengeDetailsPageInternal)completedChallenges
{
  return self->_completedChallenges;
}

- (void)setCompletedChallenges:(id)a3
{
  objc_storeStrong((id *)&self->_completedChallenges, a3);
}

- (GKLeaderboardChallengeWinComparisonPageInternal)wonChallenges
{
  return self->_wonChallenges;
}

- (void)setWonChallenges:(id)a3
{
  objc_storeStrong((id *)&self->_wonChallenges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wonChallenges, 0);
  objc_storeStrong((id *)&self->_completedChallenges, 0);
  objc_storeStrong((id *)&self->_completedChallengeGameCount, 0);
  objc_storeStrong((id *)&self->_completedChallengeCount, 0);
}

@end
