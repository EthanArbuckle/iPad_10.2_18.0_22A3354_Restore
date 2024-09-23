@implementation GKLeaderboardChallengeInviteStatusInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_215 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_215, &__block_literal_global_216);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_214;
}

void __69__GKLeaderboardChallengeInviteStatusInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("invitees");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_214;
  secureCodedPropertyKeys_sSecureCodedKeys_214 = v3;

}

- (GKLeaderboardChallengeInviteStatusInternal)initWithServerRepresentation:(id)a3
{
  id v4;
  GKLeaderboardChallengeInviteStatusInternal *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardChallengeInviteStatusInternal;
  v5 = -[GKLeaderboardChallengeInviteStatusInternal init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkMapWithBlock:", &__block_literal_global_221);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardChallengeInviteStatusInternal setInvitees:](v5, "setInvitees:", v7);

  }
  return v5;
}

GKLeaderboardChallengeInviteeStatusInternal *__75__GKLeaderboardChallengeInviteStatusInternal_initWithServerRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GKLeaderboardChallengeInviteeStatusInternal *v3;

  v2 = a2;
  v3 = -[GKLeaderboardChallengeInviteeStatusInternal initWithServerFragment:]([GKLeaderboardChallengeInviteeStatusInternal alloc], "initWithServerFragment:", v2);

  return v3;
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
}

@end
