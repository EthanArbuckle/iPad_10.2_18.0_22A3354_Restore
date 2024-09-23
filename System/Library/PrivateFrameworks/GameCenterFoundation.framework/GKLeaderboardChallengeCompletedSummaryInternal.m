@implementation GKLeaderboardChallengeCompletedSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_476 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_476, &__block_literal_global_477);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_475;
}

void __73__GKLeaderboardChallengeCompletedSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("totalCount");
  v11[0] = objc_opt_class();
  v10[1] = CFSTR("totalGames");
  v11[1] = objc_opt_class();
  v10[2] = CFSTR("totalFriends");
  v11[2] = objc_opt_class();
  v10[3] = CFSTR("gameCounts");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v2;
  v10[4] = CFSTR("playerCounts");
  v3 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_475;
  secureCodedPropertyKeys_sSecureCodedKeys_475 = v6;

}

- (GKLeaderboardChallengeCompletedSummaryInternal)initWithServerRepresentation:(id)a3
{
  id v4;
  GKLeaderboardChallengeCompletedSummaryInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKLeaderboardChallengeCompletedSummaryInternal;
  v5 = -[GKLeaderboardChallengeCompletedSummaryInternal init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("total-count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeCompletedSummaryInternal setTotalCount:](v5, "setTotalCount:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("total-games"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeCompletedSummaryInternal setTotalGames:](v5, "setTotalGames:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("total-friends"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeCompletedSummaryInternal setTotalFriends:](v5, "setTotalFriends:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("by-games"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_gkMapWithBlock:", &__block_literal_global_497);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeCompletedSummaryInternal setGameCounts:](v5, "setGameCounts:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("by-players"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_gkMapWithBlock:", &__block_literal_global_500);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeCompletedSummaryInternal setPlayerCounts:](v5, "setPlayerCounts:", v12);

  }
  return v5;
}

GKLeaderboardChallengeBundleAndCountInternal *__79__GKLeaderboardChallengeCompletedSummaryInternal_initWithServerRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengeBundleAndCountInternal initWithServerFragment:](GKLeaderboardChallengeBundleAndCountInternal, "initWithServerFragment:", a2);
}

GKLeaderboardChallengePlayerAndCountInternal *__79__GKLeaderboardChallengeCompletedSummaryInternal_initWithServerRepresentation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengePlayerAndCountInternal initWithServerFragment:](GKLeaderboardChallengePlayerAndCountInternal, "initWithServerFragment:", a2);
}

- (NSNumber)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(id)a3
{
  objc_storeStrong((id *)&self->_totalCount, a3);
}

- (NSNumber)totalGames
{
  return self->_totalGames;
}

- (void)setTotalGames:(id)a3
{
  objc_storeStrong((id *)&self->_totalGames, a3);
}

- (NSNumber)totalFriends
{
  return self->_totalFriends;
}

- (void)setTotalFriends:(id)a3
{
  objc_storeStrong((id *)&self->_totalFriends, a3);
}

- (NSArray)gameCounts
{
  return self->_gameCounts;
}

- (void)setGameCounts:(id)a3
{
  objc_storeStrong((id *)&self->_gameCounts, a3);
}

- (NSArray)playerCounts
{
  return self->_playerCounts;
}

- (void)setPlayerCounts:(id)a3
{
  objc_storeStrong((id *)&self->_playerCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerCounts, 0);
  objc_storeStrong((id *)&self->_gameCounts, 0);
  objc_storeStrong((id *)&self->_totalFriends, 0);
  objc_storeStrong((id *)&self->_totalGames, 0);
  objc_storeStrong((id *)&self->_totalCount, 0);
}

@end
