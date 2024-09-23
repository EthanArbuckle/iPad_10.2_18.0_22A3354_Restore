@implementation GKLeaderboardChallengeParticipantSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_256 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_256, &__block_literal_global_257);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_255;
}

void __75__GKLeaderboardChallengeParticipantSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("playerID");
  v2[1] = CFSTR("rank");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_255;
  secureCodedPropertyKeys_sSecureCodedKeys_255 = v0;

}

+ (id)initWithServerFragment:(id)a3
{
  id v3;
  GKLeaderboardChallengeParticipantSummaryInternal *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeParticipantSummaryInternal);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("player-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeParticipantSummaryInternal setPlayerID:](v4, "setPlayerID:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rank"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardChallengeParticipantSummaryInternal setRank:](v4, "setRank:", v6);
  return v4;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
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
  objc_storeStrong((id *)&self->_playerID, 0);
}

@end
