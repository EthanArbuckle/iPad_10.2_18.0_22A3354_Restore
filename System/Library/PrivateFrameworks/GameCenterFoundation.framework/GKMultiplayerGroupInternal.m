@implementation GKMultiplayerGroupInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_3 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_3, &__block_literal_global_18);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_3;
}

void __53__GKMultiplayerGroupInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("participants");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v5[1] = CFSTR("numberOfAutomached");
  v6[1] = objc_opt_class();
  v5[2] = CFSTR("playedAt");
  v6[2] = objc_opt_class();
  v5[3] = CFSTR("groupID");
  v6[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_3;
  secureCodedPropertyKeys_sSecureCodedKeys_3 = v3;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKMultiplayerGroupInternal groupID](self, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKMultiplayerGroupInternal numberOfAutomached](self, "numberOfAutomached"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerGroupInternal participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(-[GKMultiplayerGroupInternal playedAt](self, "playedAt") / 1000));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("groupID: %@, number of automatched: %@ participants: %@ playedAt: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (int64_t)numberOfAutomached
{
  return self->_numberOfAutomached;
}

- (void)setNumberOfAutomached:(int64_t)a3
{
  self->_numberOfAutomached = a3;
}

- (int64_t)playedAt
{
  return self->_playedAt;
}

- (void)setPlayedAt:(int64_t)a3
{
  self->_playedAt = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
