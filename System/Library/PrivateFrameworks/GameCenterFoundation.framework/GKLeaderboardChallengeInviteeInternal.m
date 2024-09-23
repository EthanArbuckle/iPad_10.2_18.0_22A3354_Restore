@implementation GKLeaderboardChallengeInviteeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_2 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_2, &__block_literal_global_16);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_2;
}

void __64__GKLeaderboardChallengeInviteeInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("playerID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("fromPlayerID");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("invitedDate");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("status");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_2;
  secureCodedPropertyKeys_sSecureCodedKeys_2 = v0;

}

- (GKLeaderboardChallengeInviteeInternal)initWithServerFragment:(id)a3
{
  id v4;
  GKLeaderboardChallengeInviteeInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKLeaderboardChallengeInviteeInternal;
  v5 = -[GKLeaderboardChallengeInviteeInternal init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("player-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInviteeInternal setPlayerID:](v5, "setPlayerID:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("from-player-id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInviteeInternal setFromPlayerID:](v5, "setFromPlayerID:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invited-timestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v10, "dateWithTimeIntervalSince1970:", v11 / 1000.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardChallengeInviteeInternal setInvitedDate:](v5, "setInvitedDate:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInviteeInternal setStatus:](v5, "setStatus:", v13);

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

- (NSString)fromPlayerID
{
  return self->_fromPlayerID;
}

- (void)setFromPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_fromPlayerID, a3);
}

- (NSDate)invitedDate
{
  return self->_invitedDate;
}

- (void)setInvitedDate:(id)a3
{
  objc_storeStrong((id *)&self->_invitedDate, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_invitedDate, 0);
  objc_storeStrong((id *)&self->_fromPlayerID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

@end
