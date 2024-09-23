@implementation GKLeaderboardChallengeInviteInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_225 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_225, &__block_literal_global_226);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_224;
}

void __63__GKLeaderboardChallengeInviteInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("challengeID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("bundleID");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("fromPlayerID");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("invitedDate");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_224;
  secureCodedPropertyKeys_sSecureCodedKeys_224 = v0;

}

+ (id)initWithServerFragment:(id)a3
{
  id v3;
  GKLeaderboardChallengeInviteInternal *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeInviteInternal);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("challenge-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeInviteInternal setChallengeID:](v4, "setChallengeID:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeInviteInternal setBundleID:](v4, "setBundleID:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("from-player-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeInviteInternal setFromPlayerID:](v4, "setFromPlayerID:", v7);

  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("invited-timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_gkDateFromServerTimestamp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeInviteInternal setInvitedDate:](v4, "setInvitedDate:", v10);

  return v4;
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
  objc_storeStrong((id *)&self->_challengeID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedDate, 0);
  objc_storeStrong((id *)&self->_fromPlayerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_challengeID, 0);
}

@end
