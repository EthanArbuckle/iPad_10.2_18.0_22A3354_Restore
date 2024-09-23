@implementation GKTurnBasedParticipantInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_239 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_239, &__block_literal_global_240_0);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_238;
}

void __57__GKTurnBasedParticipantInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("sessionID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("lastTurnDate");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("timeoutDate");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("invitedBy");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("inviteMessage");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("status");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("matchOutcome");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("slot");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("player");
  v3[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_238;
  secureCodedPropertyKeys_sSecureCodedKeys_238 = v0;

}

- (unint64_t)hash
{
  return -[GKTurnBasedParticipantInternal slot](self, "slot");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int slot;
  NSString *sessionID;
  NSString *v7;
  NSString *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (slot = self->_slot, slot == objc_msgSend(v4, "slot")))
  {
    sessionID = self->_sessionID;
    objc_msgSend(v4, "sessionID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (sessionID == v7)
    {
      v10 = 1;
    }
    else
    {
      v8 = self->_sessionID;
      objc_msgSend(v4, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)serverRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedParticipantInternal status](self, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("player-status"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKTurnBasedParticipantInternal matchOutcome](self, "matchOutcome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("player-status-code"));

  -[GKTurnBasedParticipantInternal player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[GKTurnBasedParticipantInternal player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[GKTurnBasedParticipantInternal player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "guestIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("guest-id"));

      objc_msgSend(v12, "hostPlayerInternal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "playerID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("player-id"));

    }
    else
    {
      objc_msgSend(v11, "playerID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("player-id"));
    }

  }
  return v3;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1E75FB2F8;
}

- (BOOL)isAutomatchParticipant
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[GKTurnBasedParticipantInternal player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocalPlayer");

  if ((v4 & 1) != 0)
    return 0;
  -[GKTurnBasedParticipantInternal player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "length") == 0;

  return v5;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSDate)lastTurnDate
{
  return self->_lastTurnDate;
}

- (void)setLastTurnDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastTurnDate, a3);
}

- (NSDate)timeoutDate
{
  return self->_timeoutDate;
}

- (void)setTimeoutDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutDate, a3);
}

- (GKPlayerInternal)invitedBy
{
  return self->_invitedBy;
}

- (void)setInvitedBy:(id)a3
{
  objc_storeStrong((id *)&self->_invitedBy, a3);
}

- (NSString)inviteMessage
{
  return self->_inviteMessage;
}

- (void)setInviteMessage:(id)a3
{
  objc_storeStrong((id *)&self->_inviteMessage, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (unsigned)matchOutcome
{
  return self->_matchOutcome;
}

- (void)setMatchOutcome:(unsigned int)a3
{
  self->_matchOutcome = a3;
}

- (unsigned)slot
{
  return self->_slot;
}

- (void)setSlot:(unsigned __int8)a3
{
  self->_slot = a3;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_lastTurnDate, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_inviteMessage, 0);
  objc_storeStrong((id *)&self->_invitedBy, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (NSString)playerID
{
  void *v2;
  void *v3;

  -[GKTurnBasedParticipantInternal player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
