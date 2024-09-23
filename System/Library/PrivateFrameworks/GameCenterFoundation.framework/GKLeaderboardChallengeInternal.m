@implementation GKLeaderboardChallengeInternal

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GKLeaderboardChallengeInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_129 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_129, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_128;
}

void __57__GKLeaderboardChallengeInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___GKLeaderboardChallengeInternal;
  objc_msgSendSuper2(&v13, sel_secureCodedPropertyKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("leaderboardID");
  v17[0] = objc_opt_class();
  v16[1] = CFSTR("attemptLimit");
  v17[1] = objc_opt_class();
  v16[2] = CFSTR("state");
  v17[2] = objc_opt_class();
  v16[3] = CFSTR("creatorPlayerID");
  v17[3] = objc_opt_class();
  v16[4] = CFSTR("scheduledDuration");
  v17[4] = objc_opt_class();
  v16[5] = CFSTR("participants");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v6;
  v16[6] = CFSTR("invitees");
  v7 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v10);

  v11 = objc_msgSend(v3, "copy");
  v12 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_128;
  secureCodedPropertyKeys_sSecureCodedKeys_128 = v11;

}

- (GKLeaderboardChallengeInternal)initWithServerRepresentation:(id)a3
{
  id v4;
  GKLeaderboardChallengeInternal *v5;
  GKLeaderboardChallengeInternal *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GKLeaderboardChallengeInternal;
  v5 = -[GKLeaderboardChallengeInternal init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKBaseLeaderboardChallengeInternal updateWithServerResponse:](v5, "updateWithServerResponse:", v4);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leaderboard-id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInternal setLeaderboardID:](v6, "setLeaderboardID:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attempt-limit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInternal setAttemptLimit:](v6, "setAttemptLimit:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInternal setState:](v6, "setState:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("creator-player-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInternal setCreatorPlayerID:](v6, "setCreatorPlayerID:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scheduled-duration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    -[GKLeaderboardChallengeInternal setScheduledDuration:](v6, "setScheduledDuration:", v12 / 1000.0);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("participants"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_gkMapWithBlock:", &__block_literal_global_162);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInternal setParticipants:](v6, "setParticipants:", v14);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invited-players"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_gkMapWithBlock:", &__block_literal_global_165);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInternal setInvitees:](v6, "setInvitees:", v16);

  }
  return v6;
}

GKLeaderboardChallengeParticipantInternal *__63__GKLeaderboardChallengeInternal_initWithServerRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboardChallengeParticipantInternal *v3;

  v2 = a2;
  v3 = -[GKLeaderboardChallengeParticipantInternal initWithServerFragment:]([GKLeaderboardChallengeParticipantInternal alloc], "initWithServerFragment:", v2);

  return v3;
}

GKLeaderboardChallengeInviteeInternal *__63__GKLeaderboardChallengeInternal_initWithServerRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboardChallengeInviteeInternal *v3;

  v2 = a2;
  v3 = -[GKLeaderboardChallengeInviteeInternal initWithServerFragment:]([GKLeaderboardChallengeInviteeInternal alloc], "initWithServerFragment:", v2);

  return v3;
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardID, a3);
}

- (NSNumber)attemptLimit
{
  return self->_attemptLimit;
}

- (void)setAttemptLimit:(id)a3
{
  objc_storeStrong((id *)&self->_attemptLimit, a3);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)creatorPlayerID
{
  return self->_creatorPlayerID;
}

- (void)setCreatorPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_creatorPlayerID, a3);
}

- (double)scheduledDuration
{
  return self->_scheduledDuration;
}

- (void)setScheduledDuration:(double)a3
{
  self->_scheduledDuration = a3;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSArray)invitees
{
  return self->_invitees;
}

- (void)setInvitees:(id)a3
{
  objc_storeStrong((id *)&self->_invitees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitees, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_creatorPlayerID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_attemptLimit, 0);
  objc_storeStrong((id *)&self->_leaderboardID, 0);
}

@end
