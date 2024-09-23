@implementation GKLeaderboardChallengeSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_335 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_335, &__block_literal_global_336);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_334;
}

void __64__GKLeaderboardChallengeSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("completedCount");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("winCount");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("invitedPlayers");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("activeChallenges");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_334;
  secureCodedPropertyKeys_sSecureCodedKeys_334 = v0;

}

- (GKLeaderboardChallengeSummaryInternal)initWithServerRepresentation:(id)a3
{
  id v4;
  GKLeaderboardChallengeSummaryInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKLeaderboardChallengeSummaryInternal;
  v5 = -[GKLeaderboardChallengeSummaryInternal init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeSummaryInternal setCompletedCount:](v5, "setCompletedCount:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wins"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeSummaryInternal setWinCount:](v5, "setWinCount:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invites"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLeaderboardChallengeInvitePageInternal initWithServerFragment:](GKLeaderboardChallengeInvitePageInternal, "initWithServerFragment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeSummaryInternal setInvitedPlayers:](v5, "setInvitedPlayers:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("active-challenges"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLeaderboardChallengeActivePageInternal initWithServerFragment:](GKLeaderboardChallengeActivePageInternal, "initWithServerFragment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeSummaryInternal setActiveChallenges:](v5, "setActiveChallenges:", v11);

  }
  return v5;
}

- (NSNumber)completedCount
{
  return self->_completedCount;
}

- (void)setCompletedCount:(id)a3
{
  objc_storeStrong((id *)&self->_completedCount, a3);
}

- (NSNumber)winCount
{
  return self->_winCount;
}

- (void)setWinCount:(id)a3
{
  objc_storeStrong((id *)&self->_winCount, a3);
}

- (GKLeaderboardChallengeInvitePageInternal)invitedPlayers
{
  return self->_invitedPlayers;
}

- (void)setInvitedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_invitedPlayers, a3);
}

- (GKLeaderboardChallengeActivePageInternal)activeChallenges
{
  return self->_activeChallenges;
}

- (void)setActiveChallenges:(id)a3
{
  objc_storeStrong((id *)&self->_activeChallenges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeChallenges, 0);
  objc_storeStrong((id *)&self->_invitedPlayers, 0);
  objc_storeStrong((id *)&self->_winCount, 0);
  objc_storeStrong((id *)&self->_completedCount, 0);
}

@end
