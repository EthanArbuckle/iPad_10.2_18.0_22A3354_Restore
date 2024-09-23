@implementation GKLeaderboardChallengeInviteeStatusInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_209 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_209, &__block_literal_global_210);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_208;
}

void __70__GKLeaderboardChallengeInviteeStatusInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("status");
  v2[1] = CFSTR("playerID");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_208;
  secureCodedPropertyKeys_sSecureCodedKeys_208 = v0;

}

- (GKLeaderboardChallengeInviteeStatusInternal)initWithServerFragment:(id)a3
{
  id v4;
  GKLeaderboardChallengeInviteeStatusInternal *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardChallengeInviteeStatusInternal;
  v5 = -[GKLeaderboardChallengeInviteeStatusInternal init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInviteeStatusInternal setStatus:](v5, "setStatus:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("player-id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInviteeStatusInternal setPlayerID:](v5, "setPlayerID:", v7);

  }
  return v5;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
