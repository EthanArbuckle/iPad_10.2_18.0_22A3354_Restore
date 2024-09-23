@implementation GKFriendPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__GKFriendPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_441 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_441, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_440;
}

void __49__GKFriendPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKFriendPlayerInternal;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6[0] = CFSTR("status");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("lastPlayedDate");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("lastPlayedGame");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("challengedTogether");
  v7[3] = objc_opt_class();
  v6[4] = CFSTR("lastChallengedDate");
  v7[4] = objc_opt_class();
  v6[5] = CFSTR("lastChallengedGame");
  v7[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_440;
  secureCodedPropertyKeys_sSecureCodedKeys_440 = (uint64_t)v2;

}

- (BOOL)isFriend
{
  return 1;
}

- (int)defaultFamiliarity
{
  return 2;
}

- (id)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (id)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayedDate, a3);
}

- (id)lastPlayedGame
{
  return self->_lastPlayedGame;
}

- (void)setLastPlayedGame:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayedGame, a3);
}

- (BOOL)challengedTogether
{
  return self->_challengedTogether;
}

- (void)setChallengedTogether:(BOOL)a3
{
  self->_challengedTogether = a3;
}

- (id)lastChallengedDate
{
  return self->_lastChallengedDate;
}

- (void)setLastChallengedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastChallengedDate, a3);
}

- (id)lastChallengedGame
{
  return self->_lastChallengedGame;
}

- (void)setLastChallengedGame:(id)a3
{
  objc_storeStrong((id *)&self->_lastChallengedGame, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChallengedDate, 0);
  objc_storeStrong((id *)&self->_lastChallengedGame, 0);
  objc_storeStrong((id *)&self->_lastPlayedGame, 0);
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
