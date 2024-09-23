@implementation GKFriendCodeDetailInternal

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[GKFriendCodeDetailInternal creatorPlayerID](self, "creatorPlayerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreatorPlayerID:", v5);

  objc_msgSend(v4, "setFriendCodeState:", -[GKFriendCodeDetailInternal friendCodeState](self, "friendCodeState"));
  objc_msgSend(v4, "setFriendCodeUsageCount:", -[GKFriendCodeDetailInternal friendCodeUsageCount](self, "friendCodeUsageCount"));
  -[GKFriendCodeDetailInternal alreadyUsedPlayerIDs](self, "alreadyUsedPlayerIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlreadyUsedPlayerIDs:", v6);

  return v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_14 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_14, &__block_literal_global_53);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_14;
}

void __53__GKFriendCodeDetailInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("creatorPlayerID");
  v6[0] = objc_opt_class();
  v5[1] = CFSTR("friendCode");
  v6[1] = objc_opt_class();
  v5[2] = CFSTR("friendCodeState");
  v6[2] = objc_opt_class();
  v5[3] = CFSTR("friendCodeUsageCount");
  v6[3] = objc_opt_class();
  v5[4] = CFSTR("alreadyUsedPlayerIDs");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_14;
  secureCodedPropertyKeys_sSecureCodedKeys_14 = v3;

}

- (NSString)creatorPlayerID
{
  return self->_creatorPlayerID;
}

- (void)setCreatorPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_creatorPlayerID, a3);
}

- (GKPlayerInternal)creatorPlayer
{
  return self->_creatorPlayer;
}

- (void)setCreatorPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_creatorPlayer, a3);
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
  objc_storeStrong((id *)&self->_friendCode, a3);
}

- (int64_t)friendCodeState
{
  return self->_friendCodeState;
}

- (void)setFriendCodeState:(int64_t)a3
{
  self->_friendCodeState = a3;
}

- (NSArray)alreadyUsedPlayerIDs
{
  return self->_alreadyUsedPlayerIDs;
}

- (void)setAlreadyUsedPlayerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_alreadyUsedPlayerIDs, a3);
}

- (int64_t)friendCodeUsageCount
{
  return self->_friendCodeUsageCount;
}

- (void)setFriendCodeUsageCount:(int64_t)a3
{
  self->_friendCodeUsageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alreadyUsedPlayerIDs, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);
  objc_storeStrong((id *)&self->_creatorPlayer, 0);
  objc_storeStrong((id *)&self->_creatorPlayerID, 0);
}

@end
