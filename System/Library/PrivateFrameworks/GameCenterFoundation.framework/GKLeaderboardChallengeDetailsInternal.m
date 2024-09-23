@implementation GKLeaderboardChallengeDetailsInternal

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__GKLeaderboardChallengeDetailsInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_262 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_262, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_261;
}

void __64__GKLeaderboardChallengeDetailsInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___GKLeaderboardChallengeDetailsInternal;
  objc_msgSendSuper2(&v10, sel_secureCodedPropertyKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("participants");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("participantCount");
  v13[1] = objc_opt_class();
  v12[2] = CFSTR("rank");
  v13[2] = objc_opt_class();
  v12[3] = CFSTR("remainingAttempts");
  v13[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  v8 = objc_msgSend(v3, "copy");
  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_261;
  secureCodedPropertyKeys_sSecureCodedKeys_261 = v8;

}

- (void)updateWithServerFragment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKLeaderboardChallengeDetailsInternal;
  v4 = a3;
  -[GKBaseLeaderboardChallengeInternal updateWithServerResponse:](&v10, sel_updateWithServerResponse_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("participants-summary"), v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkMapWithBlock:", &__block_literal_global_272);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeDetailsInternal setParticipants:](self, "setParticipants:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("participants-count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeDetailsInternal setParticipantCount:](self, "setParticipantCount:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rank"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeDetailsInternal setRank:](self, "setRank:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remaining-attempts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardChallengeDetailsInternal setRemainingAttempts:](self, "setRemainingAttempts:", v9);
}

GKLeaderboardChallengeParticipantSummaryInternal *__66__GKLeaderboardChallengeDetailsInternal_updateWithServerFragment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengeParticipantSummaryInternal initWithServerFragment:](GKLeaderboardChallengeParticipantSummaryInternal, "initWithServerFragment:", a2);
}

+ (id)initWithServerFragment:(id)a3
{
  id v3;
  GKLeaderboardChallengeDetailsInternal *v4;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeDetailsInternal);
  -[GKLeaderboardChallengeDetailsInternal updateWithServerFragment:](v4, "updateWithServerFragment:", v3);

  return v4;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
  objc_storeStrong((id *)&self->_rank, a3);
}

- (NSNumber)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(id)a3
{
  objc_storeStrong((id *)&self->_remainingAttempts, a3);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSNumber)participantCount
{
  return self->_participantCount;
}

- (void)setParticipantCount:(id)a3
{
  objc_storeStrong((id *)&self->_participantCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantCount, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_remainingAttempts, 0);
  objc_storeStrong((id *)&self->_rank, 0);
}

@end
