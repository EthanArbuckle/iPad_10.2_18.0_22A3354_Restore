@implementation GKLeaderboardChallengeParticipantInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_45 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_45, &__block_literal_global_46);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_44;
}

void __68__GKLeaderboardChallengeParticipantInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("playerID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("formattedScoreValue");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("scoreValue");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("attemptCount");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("rank");
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_44;
  secureCodedPropertyKeys_sSecureCodedKeys_44 = v0;

}

- (GKLeaderboardChallengeParticipantInternal)initWithServerFragment:(id)a3
{
  id v4;
  GKLeaderboardChallengeParticipantInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKLeaderboardChallengeParticipantInternal;
  v5 = -[GKLeaderboardChallengeParticipantInternal init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("player-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeParticipantInternal setPlayerID:](v5, "setPlayerID:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatted-score-value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeParticipantInternal setFormattedScoreValue:](v5, "setFormattedScoreValue:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score-value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeParticipantInternal setScoreValue:](v5, "setScoreValue:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attempt-count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeParticipantInternal setAttemptCount:](v5, "setAttemptCount:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rank"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeParticipantInternal setRank:](v5, "setRank:", v10);

  }
  return v5;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (NSString)formattedScoreValue
{
  return self->_formattedScoreValue;
}

- (void)setFormattedScoreValue:(id)a3
{
  objc_storeStrong((id *)&self->_formattedScoreValue, a3);
}

- (NSNumber)scoreValue
{
  return self->_scoreValue;
}

- (void)setScoreValue:(id)a3
{
  objc_storeStrong((id *)&self->_scoreValue, a3);
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(id)a3
{
  objc_storeStrong((id *)&self->_attemptCount, a3);
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
  objc_storeStrong((id *)&self->_rank, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_scoreValue, 0);
  objc_storeStrong((id *)&self->_formattedScoreValue, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

@end
