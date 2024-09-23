@implementation GKUpdateInviteInfo

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_194 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_194, &__block_literal_global_195);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_193;
}

void __45__GKUpdateInviteInfo_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("gameParticipants");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("lobbyParticipants");
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("playerTokenMap");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  v9[3] = CFSTR("sessionID");
  v10[3] = objc_opt_class();
  v9[4] = CFSTR("sessionToken");
  v10[4] = objc_opt_class();
  v9[5] = CFSTR("matchID");
  v10[5] = objc_opt_class();
  v9[6] = CFSTR("transportVersionToUse");
  v10[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_193;
  secureCodedPropertyKeys_sSecureCodedKeys_193 = v7;

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
  -[GKUpdateInviteInfo sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo matchID](self, "matchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo lobbyParticipants](self, "lobbyParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo gameParticipants](self, "gameParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("GKUpdateInviteInfo[sessionID: %@, matchID: %@]\nLobbyParticipants: %@\nGameParticipants:%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)mergeWithUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSSet *lobbyParticipants;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *v14;
  NSSet *gameParticipants;
  void *v16;
  void *v17;
  NSSet *v18;
  NSSet *v19;
  id v20;
  NSObject *v21;

  v4 = a3;
  -[GKUpdateInviteInfo sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKUpdateInviteInfo mergeWithUpdate:].cold.1((uint64_t)self, (uint64_t)v4, v9);
    lobbyParticipants = self->_lobbyParticipants;
    v11 = lobbyParticipants;
    if (!lobbyParticipants)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "lobbyParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setByAddingObjectsFromSet:", v12);
    v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v14 = self->_lobbyParticipants;
    self->_lobbyParticipants = v13;

    if (!lobbyParticipants)
    gameParticipants = self->_gameParticipants;
    v16 = gameParticipants;
    if (!gameParticipants)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "gameParticipants");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setByAddingObjectsFromSet:", v17);
    v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v19 = self->_gameParticipants;
    self->_gameParticipants = v18;

    if (!gameParticipants)
  }
  else
  {
    if (!os_log_GKGeneral)
      v20 = GKOSLoggers();
    v21 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKUpdateInviteInfo mergeWithUpdate:].cold.2(v21);
  }

}

- (NSSet)gameParticipants
{
  return self->_gameParticipants;
}

- (void)setGameParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_gameParticipants, a3);
}

- (NSSet)lobbyParticipants
{
  return self->_lobbyParticipants;
}

- (void)setLobbyParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_lobbyParticipants, a3);
}

- (NSDictionary)playerTokenMap
{
  return self->_playerTokenMap;
}

- (void)setPlayerTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_playerTokenMap, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
  objc_storeStrong((id *)&self->_matchID, a3);
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
  objc_storeStrong((id *)&self->_transportVersionToUse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_playerTokenMap, 0);
  objc_storeStrong((id *)&self->_lobbyParticipants, 0);
  objc_storeStrong((id *)&self->_gameParticipants, 0);
}

- (void)mergeWithUpdate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "Merging invite updates for %@ with %@", (uint8_t *)&v3, 0x16u);
}

- (void)mergeWithUpdate:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "Should not update invite update info for different session ID.", v1, 2u);
}

@end
