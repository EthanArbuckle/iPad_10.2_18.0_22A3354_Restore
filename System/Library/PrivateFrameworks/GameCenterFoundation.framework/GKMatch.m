@implementation GKMatch

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p expected count: %u seqnum: %d\n"), v5, self, -[GKMatch expectedPlayerCount](self, "expectedPlayerCount"), -[GKMatch packetSequenceNumber](self, "packetSequenceNumber"));

  obj = self->_playerEventQueues;
  objc_sync_enter(obj);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_playerEventQueues, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@:"), v10);
        -[NSMutableDictionary objectForKey:](self->_playerEventQueues, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = objc_msgSend(v11, "playerState");
          if (v13 >= 3)
            goto LABEL_11;
          v14 = off_1E75B3B90[v13];
        }
        else
        {
          v14 = CFSTR("?no queue?");
        }
        objc_msgSend(v3, "appendString:", v14);
LABEL_11:

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  objc_sync_exit(obj);
  -[GKMatch reinvitedPlayers](self, "reinvitedPlayers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch properties](self, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch playerProperties](self, "playerProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("reinvitedPlayers:%@, properties:%@, playerProperties:%@>"), v15, v16, v17);

  return v3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)pendingInviteesOfLocalPlayer
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self->_playerEventQueues;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_playerEventQueues, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "invitedByLocalPlayer") && objc_msgSend(v9, "playerState") != 1)
        {
          objc_msgSend(v9, "player");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  objc_sync_exit(v3);

  return v11;
}

- (void)refreshPendingConnectionCheckIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend(a2, "transportContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v3, v5, "Should not send invite update for this context: %@", v6);

  OUTLINED_FUNCTION_1_1();
}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "transportContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemonProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "transportContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formAnInviteUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2;
  v10[3] = &unk_1E75B29C8;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v6, "sendInvitationUpdate:handler:", v8, v10);

}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

BOOL __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_161(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pendingInviteesOfLocalPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_161_cold_1();
  }

  return v3 == 0;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = delegate;
  objc_storeWeak((id *)&self->_delegate, v4);
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Set match delegate to: %@", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
    -[GKMatch sendQueuedStatesAndPackets](self, "sendQueuedStatesAndPackets");

}

- (NSArray)players
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_playerEventQueues, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "playerState") == 1)
        {
          objc_msgSend(v9, "player");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return (NSArray *)v3;
}

- (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GKMatch propertiesByPlayerID](self, "propertiesByPlayerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NSDictionary)playerProperties
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  void *v23;
  void *v24;
  GKMatch *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  -[GKMatch propertiesByPlayerID](self, "propertiesByPlayerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v4;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v27;
    *(_QWORD *)&v7 = 138412290;
    v22 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        +[GKLocalPlayer local](GKLocalPlayer, "local", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "internal");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "playerID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v11, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          -[GKMatch playerFromID:](v25, "playerFromID:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKey:", v17, v16);

          }
          else
          {
            if (!os_log_GKGeneral)
              v18 = GKOSLoggers();
            v19 = os_log_GKMatch;
            if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              v31 = v11;
              _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "Ignoring properties for unknown playerID: %@", buf, 0xCu);
            }
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return (NSDictionary *)v20;
}

- (BOOL)sendData:(NSData *)data toPlayers:(NSArray *)players dataMode:(GKMatchSendDataMode)mode error:(NSError *)error
{
  NSData *v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v10 = data;
  v11 = players;
  v12 = v10;
  if (-[GKMatch version](self, "version"))
  {
    if (mode == GKMatchSendDataUnreliable)
      v13 = 64;
    else
      v13 = (mode == GKMatchSendDataReliable) << 7;
    -[GKMatch packet:data:](self, "packet:data:", v13, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[GKMatch transport](self, "transport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch transportContext](self, "transportContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "sendScopedData:toPlayers:dataMode:dataScope:transportContext:error:", v12, v11, mode, 0, v15, error);

  if (error && *error)
  {
    if (!os_log_GKGeneral)
      v17 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatch sendData:toPlayers:dataMode:error:].cold.1();
  }

  return v16;
}

- (BOOL)sendDataToAllPlayers:(NSData *)data withDataMode:(GKMatchSendDataMode)mode error:(NSError *)error
{
  NSData *v8;
  void *v9;
  char v10;
  NSData *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v8 = data;
  -[GKMatch transportContext](self, "transportContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldFilterGuestWhenSendingToAll");

  if ((v10 & 1) != 0)
  {
    -[GKMatch players](self, "players");
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    -[NSData _gkNonGuestPlayersFromPlayers](v11, "_gkNonGuestPlayersFromPlayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GKMatch sendData:toPlayers:dataMode:error:](self, "sendData:toPlayers:dataMode:error:", v8, v12, mode, error);

  }
  else
  {
    v11 = v8;
    if (-[GKMatch version](self, "version"))
    {
      if (mode == GKMatchSendDataUnreliable)
        v14 = 64;
      else
        v14 = (mode == GKMatchSendDataReliable) << 7;
      -[GKMatch packet:data:](self, "packet:data:", v14, v11);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (NSData *)v15;
    }
    -[GKMatch transport](self, "transport");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch transportContext](self, "transportContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v16, "sendScopedDataToAll:dataMode:dataScope:transportContext:error:", v11, mode, 0, v17, error);

    if (error && *error)
    {
      if (!os_log_GKGeneral)
        v18 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        -[GKMatch sendDataToAllPlayers:withDataMode:error:].cold.1();
    }
  }

  return v13;
}

- (GKVoiceChat)voiceChatWithName:(NSString *)name
{
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = name;
  +[GKPreferences shared](GKPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldAllowCustomCommunication"))
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "multiplayerAllowedPlayerType");

    if (!v7)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[GKMatch transport](self, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch players](self, "players");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch transportContext](self, "transportContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "voiceChatWithName:players:transportContext:", v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

LABEL_7:
  return (GKVoiceChat *)v10;
}

- (void)chooseBestHostingPlayerWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = completionHandler;
  -[GKMatch transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch transportContext](self, "transportContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E75B3648;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "chooseBestHostingPlayerWithTransportContext:completionHandler:", v6, v8);

}

void __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "playerFromID:includingLocal:", a2, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke_cold_1();
  }
}

- (void)rematchWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;

  v4 = completionHandler;
  -[GKMatch matchmaker](self, "matchmaker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findRematchForMatch:completionHandler:", self, v4);

}

- (void)disconnect
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "GKMatch: disconnect", v6, 2u);
  }
  -[GKMatch clearSessionWithReason:](self, "clearSessionWithReason:", 2);
  -[GKMatch matchmaker](self, "matchmaker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leaveGroupActivity");

}

- (void)promptRadarAndRequestRemoteLogsWithDescriptionAddition:(id)a3
{
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  +[GKPreferences shared](GKPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4)
  {
    if (-[GKMatch canPromptTapToRadar](self, "canPromptTapToRadar"))
    {
      if (!os_log_GKGeneral)
        v5 = GKOSLoggers();
      v6 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Starting prompting TTR then requesting remote logs with description: %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[GKMatch transportContext](self, "transportContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playersAndPushTokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v35 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v12, "playerID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "pushToken");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v14;
            if (v13)
              v16 = v14 == 0;
            else
              v16 = 1;
            if (!v16)
            {
              v38[0] = CFSTR("playerID");
              v38[1] = CFSTR("pushToken");
              v39[0] = v13;
              v39[1] = v14;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v17);

            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v9);
      }

      v18 = (void *)MEMORY[0x1E0CB36F8];
      v19 = (void *)objc_msgSend(v30, "copy");
      v33 = 0;
      objc_msgSend(v18, "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v33;

      if (v21)
      {
        if (!os_log_GKGeneral)
          v22 = GKOSLoggers();
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
          -[GKMatch promptRadarAndRequestRemoteLogsWithDescriptionAddition:].cold.1();
      }
      else
      {
        objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        -[GKMatch transportContext](self, "transportContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "daemonProxy");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __66__GKMatch_promptRadarAndRequestRemoteLogsWithDescriptionAddition___block_invoke;
        v31[3] = &unk_1E75B3670;
        objc_copyWeak(&v32, (id *)buf);
        objc_msgSend(v27, "fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:", v25, v29, v31);

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);

      }
    }
    else
    {
      if (!os_log_GKGeneral)
        v23 = GKOSLoggers();
      v24 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCDE3000, v24, OS_LOG_TYPE_INFO, "Already prompted tap to radar. Skip.", buf, 2u);
      }
    }
  }

}

void __66__GKMatch_promptRadarAndRequestRemoteLogsWithDescriptionAddition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCanPromptTapToRadar:", 0);

}

- (NSArray)playerIDs
{
  id v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatch playerIDs].cold.1();
    v18[0] = CFSTR("playerID is no longer available");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[GKMatch players](self, "players", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "internal");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "playerID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    return (NSArray *)v5;
  }
}

- (void)chooseBestHostPlayerWithCompletionHandler:(void *)completionHandler
{
  void (**v4)(void *, const __CFString *);
  id v5;
  _QWORD v6[4];
  void (**v7)(void *, const __CFString *);

  v4 = completionHandler;
  if (v4)
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      if (!os_log_GKGeneral)
        v5 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        -[GKMatch chooseBestHostPlayerWithCompletionHandler:].cold.1();
      v4[2](v4, CFSTR("playerID is no longer available"));
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __53__GKMatch_chooseBestHostPlayerWithCompletionHandler___block_invoke;
      v6[3] = &unk_1E75B3698;
      v7 = v4;
      -[GKMatch chooseBestHostingPlayerWithCompletionHandler:](self, "chooseBestHostingPlayerWithCompletionHandler:", v6);

    }
  }

}

void __53__GKMatch_chooseBestHostPlayerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

- (BOOL)sendData:(NSData *)data toPlayers:(NSArray *)playerIDs withDataMode:(GKMatchSendDataMode)mode error:(NSError *)error
{
  NSData *v10;
  NSArray *v11;
  id v12;
  NSError *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v10 = data;
  v11 = playerIDs;
  if (!GKApplicationLinkedOnOrAfter())
  {
    -[GKMatch players](self, "players");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__GKMatch_sendData_toPlayers_withDataMode_error___block_invoke;
    v19[3] = &unk_1E75B36C0;
    v20 = v16;
    v13 = v16;
    -[NSArray _gkFilterWithBlock:](v11, "_gkFilterWithBlock:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GKMatch sendData:toPlayers:dataMode:error:](self, "sendData:toPlayers:dataMode:error:", v10, v17, mode, error);

    goto LABEL_8;
  }
  if (!os_log_GKGeneral)
    v12 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
  {
    -[GKMatch sendData:toPlayers:withDataMode:error:].cold.1();
    if (error)
      goto LABEL_6;
LABEL_11:
    v14 = 0;
    goto LABEL_9;
  }
  if (!error)
    goto LABEL_11;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 34, 0);
  v13 = (NSError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = 0;
  *error = v13;
LABEL_8:

LABEL_9:
  return v14;
}

uint64_t __49__GKMatch_sendData_toPlayers_withDataMode_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
}

- (GKMatch)initWithMatchmaker:(id)a3
{
  id v4;
  GKMatch *v5;
  GKTransportContext *v6;
  void *v7;
  void *v8;
  void *v9;
  GKTransportContext *v10;
  GKMultiplayerActivityReporter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GKMultiplayerActivityReporter *v16;
  GKCompositeTransport *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKMatch;
  v5 = -[GKMatch init](&v19, sel_init);
  if (v5)
  {
    v6 = [GKTransportContext alloc];
    +[GKGame currentGame](GKGame, "currentGame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedTransports");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GKTransportContext initWithSupportedTransports:](v6, "initWithSupportedTransports:", v9);

    v11 = [GKMultiplayerActivityReporter alloc];
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKAPIReporter reporter](GKAPIReporter, "reporter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GKMultiplayerActivityReporter initWithLocalPlayerID:matchDataDelegate:apiReporter:](v11, "initWithLocalPlayerID:matchDataDelegate:apiReporter:", v14, v5, v15);

    v17 = -[GKCompositeTransport initWithClientDelegate:matchDataDelegate:reporter:transportContext:]([GKCompositeTransport alloc], "initWithClientDelegate:matchDataDelegate:reporter:transportContext:", v5, v5, v16, v10);
    -[GKMatch setupWithTransport:context:reporter:matchmaker:](v5, "setupWithTransport:context:reporter:matchmaker:", v17, v10, v16, v4);

  }
  return v5;
}

- (GKMatch)initWithTransport:(id)a3 context:(id)a4 reporter:(id)a5 matchmaker:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GKMatch *v14;
  GKMatch *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GKMatch;
  v14 = -[GKMatch init](&v17, sel_init);
  v15 = v14;
  if (v14)
    -[GKMatch setupWithTransport:context:reporter:matchmaker:](v14, "setupWithTransport:context:reporter:matchmaker:", v10, v11, v12, v13);

  return v15;
}

- (void)setupWithTransport:(id)a3 context:(id)a4 reporter:(id)a5 matchmaker:(id)a6
{
  GKTransportProtocol *v10;
  GKTransportContext *v11;
  GKMultiplayerActivityReporter *v12;
  void *v13;
  id v14;
  NSMutableSet *v15;
  NSMutableSet *connectedPlayerIDs;
  GKMultiplayerActivityReporter *multiplayerActivityReporter;
  GKMultiplayerActivityReporter *v18;
  NSMutableArray *v19;
  NSMutableArray *opponentIDs;
  _TtC20GameCenterFoundation22ExponentialBackoffTask *v21;
  void *v22;
  void *v23;
  _TtC20GameCenterFoundation22ExponentialBackoffTask *v24;
  _TtC20GameCenterFoundation22ExponentialBackoffTask *pendingConnectionChecker;
  NSMutableDictionary *v26;
  NSMutableDictionary *playerEventQueues;
  NSMutableDictionary *v28;
  NSMutableDictionary *playerPushTokens;
  GKThreadsafeDictionary *v30;
  GKThreadsafeDictionary *playersByIdentifier;
  GKThreadsafeDictionary *v32;
  GKThreadsafeDictionary *playersByJoinType;
  GKThreadsafeDictionary *v34;
  GKThreadsafeDictionary *propertiesByPlayerID;
  NSMutableArray *v36;
  NSMutableArray *reinvitedPlayers;
  NSObject *v38;
  OS_dispatch_queue *v39;
  OS_dispatch_queue *stateChangeQueue;
  GKTransportProtocol *transport;
  GKTransportProtocol *v42;
  GKTransportContext *transportContext;
  GKTransportContext *v44;
  NSNotificationName v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v10 = (GKTransportProtocol *)a3;
  v11 = (GKTransportContext *)a4;
  v12 = (GKMultiplayerActivityReporter *)a5;
  v13 = (void *)MEMORY[0x1E0C99E20];
  v14 = a6;
  objc_msgSend(v13, "set");
  v15 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  connectedPlayerIDs = self->_connectedPlayerIDs;
  self->_connectedPlayerIDs = v15;

  *(_WORD *)&self->_fastStartStateActive = 0;
  self->_canPromptTapToRadar = 1;
  multiplayerActivityReporter = self->_multiplayerActivityReporter;
  self->_multiplayerActivityReporter = v12;
  v18 = v12;

  objc_storeWeak((id *)&self->_matchmaker, v14);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  opponentIDs = self->_opponentIDs;
  self->_opponentIDs = v19;

  v21 = [_TtC20GameCenterFoundation22ExponentialBackoffTask alloc];
  -[GKMatch matchmaker](self, "matchmaker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "invitationQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ExponentialBackoffTask initWithName:queue:initialDelay:maxDelay:maxRetryCount:](v21, "initWithName:queue:initialDelay:maxDelay:maxRetryCount:", CFSTR("GKMatch.pendingConnectionChecker"), v23, 10, 1.0, 4.0);
  pendingConnectionChecker = self->_pendingConnectionChecker;
  self->_pendingConnectionChecker = v24;

  -[ExponentialBackoffTask setDelegate:](self->_pendingConnectionChecker, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  playerEventQueues = self->_playerEventQueues;
  self->_playerEventQueues = v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  playerPushTokens = self->_playerPushTokens;
  self->_playerPushTokens = v28;

  v30 = -[GKThreadsafeDictionary initWithName:]([GKThreadsafeDictionary alloc], "initWithName:", CFSTR("com.apple.gamecenter.match.playersbyidentifier"));
  playersByIdentifier = self->_playersByIdentifier;
  self->_playersByIdentifier = v30;

  v32 = -[GKThreadsafeDictionary initWithName:]([GKThreadsafeDictionary alloc], "initWithName:", CFSTR("com.apple.gamecenter.match.playersByJoinType"));
  playersByJoinType = self->_playersByJoinType;
  self->_playersByJoinType = v32;

  v34 = -[GKThreadsafeDictionary initWithName:]([GKThreadsafeDictionary alloc], "initWithName:", CFSTR("com.apple.gamecenter.match.propertiesByPlayerID"));
  propertiesByPlayerID = self->_propertiesByPlayerID;
  self->_propertiesByPlayerID = v34;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v36 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  reinvitedPlayers = self->_reinvitedPlayers;
  self->_reinvitedPlayers = v36;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamecenter.match.statechangequeue", v38);
  stateChangeQueue = self->_stateChangeQueue;
  self->_stateChangeQueue = v39;

  transport = self->_transport;
  self->_transport = v10;
  v42 = v10;

  transportContext = self->_transportContext;
  self->_transportContext = v11;
  v44 = v11;

  self->_version = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v45 = GKPlayerAuthenticationDidChangeNotificationName;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", self, sel_localPlayerDidChange_, v45, v46);

  +[GKApplicationNotificationNames willTerminate](GKApplicationNotificationNames, "willTerminate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", self, sel_applicationWillTerminateNotification_, v47, 0);

  +[GKApplicationNotificationNames didEnterBackground](GKApplicationNotificationNames, "didEnterBackground");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, v48, 0);

  +[GKApplicationNotificationNames willEnterForeground](GKApplicationNotificationNames, "willEnterForeground");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground_, v49, 0);

}

- (void)applicationWillTerminateNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "need to clear session after receiving applicationWillTerminateNotification", v8, 2u);
  }
  -[GKMatch cleanupForTerminationWithReason:](self, "cleanupForTerminationWithReason:", 0);
  -[GKMatch matchmaker](self, "matchmaker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leaveGroupActivity");

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3;

  +[GKMatchBackgroundAssertionManager shared](GKMatchBackgroundAssertionManager, "shared", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquire");

}

- (void)applicationWillEnterForeground:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  +[GKMatchBackgroundAssertionManager shared](GKMatchBackgroundAssertionManager, "shared", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[GKMatch setRecentlyBecameActive:](self, "setRecentlyBecameActive:", 1);
  v5 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GKMatch_applicationWillEnterForeground___block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

uint64_t __42__GKMatch_applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRecentlyBecameActive:", 0);
}

- (void)cleanupForTerminationWithReason:(int64_t)a3
{
  void *v5;
  void *v6;

  +[GKMatchBackgroundAssertionManager shared](GKMatchBackgroundAssertionManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[GKMatch clearSessionWithReason:](self, "clearSessionWithReason:", a3);
}

- (void)clearSessionWithReason:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 134218242;
    v22 = a3;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "match clearSession reason: %ld. call stack: %@", (uint8_t *)&v21, 0x16u);

  }
  if (-[GKMatch initiallyStarted](self, "initiallyStarted"))
  {
    -[GKMatch multiplayerActivityReporter](self, "multiplayerActivityReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch transportContext](self, "transportContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "onGameplayEndedWithReason:error:transportContext:", a3, 0, v11);

  }
  -[GKMatch transport](self, "transport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch transportContext](self, "transportContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "disconnectAllWithTransportContext:completionHandler:", v13, &__block_literal_global_23);

  if (a3 != 1)
    -[GKMatch cancelPendingConnectionCheckWithReason:](self, "cancelPendingConnectionCheckWithReason:", CFSTR("clearSession"));
  -[GKMatch transportContext](self, "transportContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "daemonProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeInviteSession");

  +[GKReporter reporter](GKReporter, "reporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reportCurrentRealtimeMatchPersistenceDuration");

  -[GKMatch transportContext](self, "transportContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "daemonProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "completeMatchRecording:matchType:", CFSTR("failure"), 0);

  -[GKMatch transportContext](self, "transportContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "daemonProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "completeGameRecording");

}

void __34__GKMatch_clearSessionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __34__GKMatch_clearSessionWithReason___block_invoke_cold_1();
  }

}

- (void)dealloc
{
  GKTransportProtocol *transport;
  objc_super v4;

  -[GKMatch cleanupForTerminationWithReason:](self, "cleanupForTerminationWithReason:", 1);
  transport = self->_transport;
  self->_transport = 0;

  v4.receiver = self;
  v4.super_class = (Class)GKMatch;
  -[GKMatch dealloc](&v4, sel_dealloc);
}

- (void)setInitiallyStarted:(BOOL)a3
{
  void *v6;
  void *v7;

  if (!self->_initiallyStarted && a3)
  {
    -[GKMatch multiplayerActivityReporter](self, "multiplayerActivityReporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch transportContext](self, "transportContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "onGameplayStartedWithTransportContext:", v7);

  }
  self->_initiallyStarted = a3;
}

- (void)setInviteDelegate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_inviteDelegateWeak, v4);
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Set match inviteDelegate to: %@", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
    -[GKMatch sendQueuedStatesAndPackets](self, "sendQueuedStatesAndPackets");

}

- (void)_delegate:(id)a3 didReceiveData:(id)a4 forRecipient:(id)a5 fromPlayer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableSet *connectedPlayerIDs;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  connectedPlayerIDs = self->_connectedPlayerIDs;
  objc_msgSend(v13, "internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(connectedPlayerIDs) = -[NSMutableSet containsObject:](connectedPlayerIDs, "containsObject:", v16);

  if ((connectedPlayerIDs & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "match:didReceiveData:forRecipient:fromRemotePlayer:", self, v11, v12, v13);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "match:didReceiveData:fromRemotePlayer:", self, v11, v13);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (GKApplicationLinkedOnOrAfter())
      {
        if (!os_log_GKGeneral)
          v19 = GKOSLoggers();
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
          -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:].cold.1();
      }
      else
      {
        objc_msgSend(v13, "internal");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "playerID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "match:didReceiveData:fromPlayer:", self, v11, v26);

      }
    }
    else
    {
      -[GKMatch delegate](self, "delegate");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        -[GKMatch delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v10, "isEqual:", v22);

        if (v23)
        {
          if (!os_log_GKGeneral)
            v24 = GKOSLoggers();
          if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
            -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:].cold.2();
        }
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = GKOSLoggers();
    v18 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:].cold.3(v18);
  }

}

- (void)addPlayers:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Adding players: %@", buf, 0xCu);
  }
  -[GKMatch playersByIdentifier](self, "playersByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __22__GKMatch_addPlayers___block_invoke;
  v9[3] = &unk_1E75B3730;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "writeToDictionary:", v9);

}

void __22__GKMatch_addPlayers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __22__GKMatch_addPlayers___block_invoke_2;
  v6[3] = &unk_1E75B3708;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __22__GKMatch_addPlayers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (unint64_t)currentPlayerCount
{
  void *v2;
  unint64_t v3;

  -[GKMatch players](self, "players");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)currentPlayerCountIncludingLocalPlayer
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[GKMatch players](self, "players");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4) ^ 1;

  -[GKMatch players](self, "players");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") + v5;

  return v7;
}

- (id)allIDs
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_playerEventQueues, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_playerEventQueues, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (NSArray)guestPlayers
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_playerEventQueues, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "playerState") == 1)
        {
          objc_msgSend(v9, "hostPlayer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (!v11)
          {
            objc_msgSend(v9, "player");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return (NSArray *)v3;
}

- (id)playerFromID:(id)a3 includingLocal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v6) & 1) != 0)
      +[GKLocalPlayer local](GKLocalPlayer, "local");
    else
      -[GKThreadsafeDictionary objectForKey:](self->_playersByIdentifier, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GKThreadsafeDictionary objectForKey:](self->_playersByIdentifier, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)playerFromID:(id)a3
{
  return -[GKMatch playerFromID:includingLocal:](self, "playerFromID:includingLocal:", a3, 0);
}

- (void)updateProperties:(id)a3 playerID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[GKMatch propertiesByPlayerID](self, "propertiesByPlayerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)withEventQueueForPlayer:(id)a3 perform:(id)a4
{
  -[GKMatch withEventQueueForPlayer:create:perform:](self, "withEventQueueForPlayer:create:perform:", a3, 0, a4);
}

- (void)withEventQueueForPlayer:(id)a3 createIfNeeded:(BOOL)a4 perform:(id)a5
{
  void *v5;

  if (a4)
    v5 = &__block_literal_global_230;
  else
    v5 = 0;
  -[GKMatch withEventQueueForPlayer:create:perform:](self, "withEventQueueForPlayer:create:perform:", a3, v5, a5);
}

- (void)withEventQueueForPlayer:(id)a3 create:(id)a4 perform:(id)a5
{
  id v8;
  void (**v9)(id, GKMatchEventQueue *);
  void (**v10)(id, GKMatchEventQueue *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  uint64_t v20;
  GKMatchEventQueue *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _BYTE v30[16];
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, GKMatchEventQueue *))a4;
  v10 = (void (**)(id, GKMatchEventQueue *))a5;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    GKStackTraceWithFrameLimit(10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("nil player for queue request at:%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatch.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (player != nil)\n[%s (%s:%d)]"), v13, "-[GKMatch withEventQueueForPlayer:create:perform:]", objc_msgSend(v15, "UTF8String"), 869);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }
  objc_msgSend(v8, "internal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = self->_playerEventQueues;
  objc_sync_enter(v19);
  -[NSMutableDictionary objectForKey:](self->_playerEventQueues, "objectForKey:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (GKMatchEventQueue *)v20;
  if (v9 && !v20)
  {
    v21 = objc_alloc_init(GKMatchEventQueue);
    -[GKMatchEventQueue setPlayer:](v21, "setPlayer:", v8);
    v9[2](v9, v21);
    -[NSMutableDictionary setObject:forKey:](self->_playerEventQueues, "setObject:forKey:", v21, v18);
    -[NSMutableSet addObject:](self->_connectedPlayerIDs, "addObject:", v18);
    if (!os_log_GKGeneral)
      v22 = GKOSLoggers();
    v23 = (id)os_log_GKMatch;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "internal");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "debugDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatch withEventQueueForPlayer:create:perform:].cold.2(v25, (uint64_t)v31, v23, v24);
    }

  }
  if (!v21)
  {
    if (!os_log_GKGeneral)
      v26 = GKOSLoggers();
    v27 = (id)os_log_GKMatch;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "internal");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "debugDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatch withEventQueueForPlayer:create:perform:].cold.1(v29, (uint64_t)v30, v27, v28);
    }

  }
  if (v10)
    v10[2](v10, v21);

  objc_sync_exit(v19);
}

- (void)preLoadInviter:(id)a3 sessionToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v6, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "preLoadInviter - inviting player: %@ sessionToken:%@", buf, 0x16u);

  }
  v17 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch addPlayers:](self, "addPlayers:", v13);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__GKMatch_preLoadInviter_sessionToken___block_invoke;
  v15[3] = &unk_1E75B3798;
  v16 = v7;
  v14 = v7;
  -[GKMatch withEventQueueForPlayer:create:perform:](self, "withEventQueueForPlayer:create:perform:", v6, v15, 0);

}

void __39__GKMatch_preLoadInviter_sessionToken___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, CFSTR("session-token"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionInfo:", v5);

}

- (void)updateRematchID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Cannot update rematch ID because localPlayer has no playerID!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __26__GKMatch_updateRematchID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "caseInsensitiveCompare:", v8);

  return v9;
}

- (void)updateJoinedPlayer:(id)a3 joinType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  GKMatch *v24;
  uint8_t buf[4];
  GKMatch **v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v24 = self;
  v6 = a3;
  -[GKMatch playersByJoinType](self, "playersByJoinType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(_DWORD)v4 && v8)
    goto LABEL_4;
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
LABEL_4:
    if (!os_log_GKGeneral)
      v13 = GKOSLoggers();
    v14 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v14;
      objc_msgSend(v15, "numberWithUnsignedInt:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatch playersByJoinType](v24, "playersByJoinType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v26 = &v24;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "GKMatch: %p should not update joined player: %@, for joinType: %@, self.playersByJoinType: %@", buf, 0x2Au);

LABEL_12:
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch playersByJoinType](self, "playersByJoinType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v6);

    -[GKMatch addPlayerToGroup:](self, "addPlayerToGroup:", v6);
    if (!os_log_GKGeneral)
      v21 = GKOSLoggers();
    v22 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v23 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v22;
      objc_msgSend(v23, "numberWithUnsignedInt:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = &v24;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "GKMatch: %p should update joined player: %@, for joinType: %@", buf, 0x20u);
      goto LABEL_12;
    }
  }

}

- (void)localPlayerDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Local player changed with notification: %@", (uint8_t *)&v16, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("GKPlayerDidAuthenticateOldPlayerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isAuthenticated") & 1) != 0)
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v8);

    if ((v13 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  if (!os_log_GKGeneral)
    v14 = GKOSLoggers();
  v15 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "Local player is no longer authenticated or local player changed. Will disconnect.", (uint8_t *)&v16, 2u);
  }
  -[GKMatch disconnect](self, "disconnect");
LABEL_14:

}

- (void)putMultiplayerGroup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[GKMatch groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch setGroupIdentifier:](self, "setGroupIdentifier:", v5);

  }
  if (!os_log_GKGeneral)
    v6 = GKOSLoggers();
  v7 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    -[GKMatch groupIdentifier](self, "groupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v9;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Creating group for game: %@", buf, 0xCu);

  }
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    -[GKMatch playersByJoinType](self, "playersByJoinType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v13;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "playersByJoinType - %@", buf, 0xCu);

  }
  -[GKMatch connectedPlayers](self, "connectedPlayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v20), "internal");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "playerID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[GKMatch playersByJoinType](self, "playersByJoinType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24 && objc_msgSend(v24, "integerValue") != 4 && objc_msgSend(v24, "integerValue"))
            objc_msgSend(v15, "addObject:", v22);

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
  {
    -[GKMatch transportContext](self, "transportContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "daemonProxy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch groupIdentifier](self, "groupIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSince1970");
    v29 = (uint64_t)(v28 * 1000.0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch matchmaker](self, "matchmaker");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "autoMatchedPlayers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "putMultiPlayerGroup:participants:playedAt:bundleID:numberOfAutomatched:handler:", v26, v15, v29, v31, objc_msgSend(v33, "count"), &__block_literal_global_251);

  }
}

- (void)addPlayerToGroup:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Attempting to update a group with playerID: %@", buf, 0xCu);
    }
    -[GKMatch playersByJoinType](self, "playersByJoinType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "integerValue") != 4 && objc_msgSend(v8, "integerValue"))
    {
      objc_initWeak((id *)buf, self);
      -[GKMatch transportContext](self, "transportContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "daemonProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __28__GKMatch_addPlayerToGroup___block_invoke;
      v11[3] = &unk_1E75B3828;
      objc_copyWeak(&v13, (id *)buf);
      v12 = v4;
      objc_msgSend(v10, "getMultiPlayerGroups:", v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __28__GKMatch_addPlayerToGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
      objc_msgSend(v10, "groupID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "groupIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v10;

    if (!v14)
      goto LABEL_16;
    if (!os_log_GKGeneral)
      v15 = GKOSLoggers();
    v16 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      objc_msgSend(v14, "groupID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v18;
      _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "Group already exists for game, updating: %@", buf, 0xCu);

    }
    objc_msgSend(v14, "participants");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    v32 = v20;
    objc_msgSend(v20, "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "transportContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "daemonProxy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "groupID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v14, "numberOfAutomached");
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __28__GKMatch_addPlayerToGroup___block_invoke_253;
    v34[3] = &unk_1E75B3800;
    v35 = v14;
    v36 = *(id *)(a1 + 32);
    v27 = v14;
    objc_msgSend(v21, "putMultiPlayerGroup:participants:playedAt:bundleID:numberOfAutomatched:handler:", v22, v23, 0, v25, v26, v34);

  }
  else
  {
LABEL_9:

LABEL_16:
    if (!os_log_GKGeneral)
      v28 = GKOSLoggers();
    v29 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v30 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v42 = v30;
      _os_log_impl(&dword_1BCDE3000, v29, OS_LOG_TYPE_INFO, "Group does not exist yet, waiting for it to be created when game starts, not adding %@ yet", buf, 0xCu);
    }
  }

}

void __28__GKMatch_addPlayerToGroup___block_invoke_253(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    v5 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __28__GKMatch_addPlayerToGroup___block_invoke_253_cold_1(a1, v5);
  }
  else
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "groupID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "Group %@ updated adding player: %@", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (id)getConnectionContextForPlayerID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  -[GKMatch playerFromID:](self, "playerFromID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__6;
    v15 = __Block_byref_object_dispose__6;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__GKMatch_getConnectionContextForPlayerID___block_invoke;
    v8[3] = &unk_1E75B3850;
    v10 = &v11;
    v9 = v4;
    -[GKMatch withEventQueueForPlayer:perform:](self, "withEventQueueForPlayer:perform:", v5, v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __43__GKMatch_getConnectionContextForPlayerID___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "player event queue does not exist for %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (id)updateConnectionInfo:(id)a3 forPlayerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  -[GKMatch playerFromID:](self, "playerFromID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    v19 = __Block_byref_object_dispose__6;
    v20 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__GKMatch_updateConnectionInfo_forPlayerID___block_invoke;
    v11[3] = &unk_1E75B3878;
    v12 = v6;
    v14 = &v15;
    v13 = v7;
    -[GKMatch withEventQueueForPlayer:perform:](self, "withEventQueueForPlayer:perform:", v8, v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __44__GKMatch_updateConnectionInfo_forPlayerID___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "connectionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", a1[4]);

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v9 = a1[5];
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "player event queue does not exist for %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)getLocalConnectionDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatch: getLocalConnectionDataWithCompletionHandler:", v8, 2u);
  }
  -[GKMatch transport](self, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localConnectionDataWithCompletionHandler:", v4);

}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  -[GKMatch inviteDelegate](self, "inviteDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[GKMatch inviteDelegate](self, "inviteDelegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[GKMatch inviteDelegate](self, "inviteDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutomatchPlayerCount:", a3);

  }
  else
  {
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      -[GKMatch setAutomatchPlayerCount:].cold.1();
  }
}

- (void)updateEventQueueForInviter:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Update with inviter: %@", buf, 0xCu);
  }
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch addPlayers:](self, "addPlayers:", v7);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__GKMatch_updateEventQueueForInviter___block_invoke;
  v8[3] = &unk_1E75B3798;
  v8[4] = self;
  -[GKMatch withEventQueueForPlayer:createIfNeeded:perform:](self, "withEventQueueForPlayer:createIfNeeded:perform:", v4, 1, v8);

}

uint64_t __38__GKMatch_updateEventQueueForInviter___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

- (void)cancelPendingConnectionCheckWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Canceling existing match pending connection checker for: %@.", (uint8_t *)&v8, 0xCu);
  }
  -[GKMatch pendingConnectionChecker](self, "pendingConnectionChecker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

}

- (void)connectToPlayers:(id)a3 version:(unsigned __int8)a4 invitedByLocalPlayer:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  unint64_t expectedPlayerCount;
  NSObject *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  unsigned int v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[6];
  char v58;
  BOOL v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v7 = a5;
  v53 = a4;
  v67 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v9;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "connect to players: %@", buf, 0xCu);
  }
  if (!os_log_GKGeneral)
    v13 = GKOSLoggers();
  v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    -[GKMatch transportContext](self, "transportContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "peerDictionaries");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v66 = v17;
    _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "make connection with peerDictionaries %@", buf, 0xCu);

  }
  +[GKReporter reporter](GKReporter, "reporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recordConnectingDevicesTimestamp");

  v19 = "sessionObserverTask" + 16;
  if (objc_msgSend(v9, "count"))
  {
    v51 = v10;
    v52 = v9;
    -[GKMatch addPlayers:](self, "addPlayers:", v9);
    if (-[GKMatch version](self, "version") > v53)
    {
      -[GKMatch sendVersionData:](self, "sendVersionData:", v53);
      -[GKMatch setVersion:](self, "setVersion:", v53);
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[GKMatch transport](self, "transport");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch transportContext](self, "transportContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "peerDictionaries");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "enrichPeerDictionariesForPlayersConnection:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v28, "objectForKey:", CFSTR("player-id"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKThreadsafeDictionary objectForKey:](self->_playersByIdentifier, "objectForKey:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke;
            v57[3] = &unk_1E75B38A0;
            v58 = v53;
            v59 = v7;
            v57[4] = v28;
            v57[5] = self;
            -[GKMatch withEventQueueForPlayer:createIfNeeded:perform:](self, "withEventQueueForPlayer:createIfNeeded:perform:", v30, 1, v57);
            if (v7)
            {
              if (!os_log_GKGeneral)
                v31 = GKOSLoggers();
              v32 = os_log_GKMatch;
              if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v66 = v52;
                _os_log_debug_impl(&dword_1BCDE3000, v32, OS_LOG_TYPE_DEBUG, "Perform a pending connection check for invitees: %@.", buf, 0xCu);
              }
              -[GKMatch refreshPendingConnectionCheckIfNeeded](self, "refreshPendingConnectionCheckIfNeeded");
            }
          }
          else
          {
            if (!os_log_GKGeneral)
              v33 = GKOSLoggers();
            v34 = os_log_GKMatch;
            if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v29;
              _os_log_impl(&dword_1BCDE3000, v34, OS_LOG_TYPE_INFO, "Missing player for playerID: %@ while connecting to players", buf, 0xCu);
            }
          }

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v25);
    }

    -[GKMatch inviteDelegate](self, "inviteDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v51;
    if (v35)
    {
      -[GKMatch inviteDelegate](self, "inviteDelegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v52;
      -[GKMatch sendConnectingStateCallbackToDelegate:forPlayers:](self, "sendConnectingStateCallbackToDelegate:forPlayers:", v36, v52);

      v37 = "sessionObserverTask" + 16;
      v19 = "sessionObserverTask" + 16;
    }
    else
    {
      v9 = v52;
      v37 = "ask";
      v19 = "ask";
      if (!os_log_GKGeneral)
        v39 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
        -[GKMatch connectToPlayers:version:invitedByLocalPlayer:completionHandler:].cold.2();
    }
    +[GKReporter reporter](GKReporter, "reporter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "reportEvent:type:count:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionType"), CFSTR("realtime.allConnectionAttempt"), objc_msgSend(v9, "count"));

    if (!os_log_GKGeneral)
      v41 = GKOSLoggers();
    v42 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v43 = (void *)MEMORY[0x1E0CB37E8];
      expectedPlayerCount = self->_expectedPlayerCount;
      v45 = v42;
      objc_msgSend(v43, "numberWithUnsignedInteger:", expectedPlayerCount);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = *((_QWORD *)v37 + 84);
      v66 = v46;
      _os_log_impl(&dword_1BCDE3000, v45, OS_LOG_TYPE_INFO, "Connecting to peers, expecting: %@", buf, 0xCu);

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v38 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatch connectToPlayers:version:invitedByLocalPlayer:completionHandler:].cold.1();
  }
  if (objc_msgSend(v9, "count")
    || (-[GKMatch transportContext](self, "transportContext"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = objc_msgSend(v47, "allowEarlyConnection"),
        v47,
        (v48 & 1) != 0))
  {
    -[GKMatch transport](self, "transport");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch transportContext](self, "transportContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = *((_QWORD *)v19 + 76);
    v54[2] = __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_263;
    v54[3] = &unk_1E75B17D8;
    v55 = v9;
    v56 = v10;
    objc_msgSend(v49, "connectToPlayersWithTransportContext:completionHandler:", v50, v54);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "connectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "connectionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setConnectionInfo:", v5);
  }

  objc_msgSend(v3, "connectionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("match-version"));

  objc_msgSend(v3, "setInvitedByLocalPlayer:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("num-players"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  v12 = *(_QWORD *)(a1 + 40);
  v11 = a1 + 40;
  *(_QWORD *)(v12 + 176) += (int)v10;
  if (!os_log_GKGeneral)
    v13 = GKOSLoggers();
  v14 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_cold_1(v14, v10, v11);

}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_263(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_263_cold_1();
  }
  else
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Connection requested handler for players: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v6, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "Connect to guest player - player: %@ hostPlayer:%@", buf, 0x16u);

  }
  -[GKMatch transport](self, "transport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "connectToGuestPlayer:withHostPlayer:", v6, v7);

  if (v14)
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch addPlayers:](self, "addPlayers:", v15);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke;
    v17[3] = &unk_1E75B38C8;
    v18 = v6;
    v19 = v7;
    -[GKMatch withEventQueueForPlayer:createIfNeeded:perform:](self, "withEventQueueForPlayer:createIfNeeded:perform:", v18, 1, v17);
    +[GKReporter reporter](GKReporter, "reporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reportEvent:type:count:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionType"), CFSTR("realtime.allConnectionAttempt"), 2);

  }
}

void __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "setPlayerState:", 1);
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke_cold_1(a1, v5);
  objc_msgSend(v3, "setHostPlayer:", *(_QWORD *)(a1 + 40));

}

- (id)nearbyConnectionData
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "GKMatch: nearbyConnectionData", v8, 2u);
  }
  -[GKMatch transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nearbyConnectionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  GKMatch *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v6, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v12;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "Connect to nearby player: %@", buf, 0xCu);

  }
  +[GKReporter reporter](GKReporter, "reporter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.allMatchTotal"));

  +[GKReporter reporter](GKReporter, "reporter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.nearbyMatchTotal"));

  v36 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch addPlayers:](self, "addPlayers:", v15);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke;
  v31[3] = &unk_1E75B38F0;
  v16 = v6;
  v32 = v16;
  v17 = v7;
  v33 = v17;
  v34 = self;
  -[GKMatch withEventQueueForPlayer:createIfNeeded:perform:](self, "withEventQueueForPlayer:createIfNeeded:perform:", v16, 1, v31);
  if (!os_log_GKGeneral)
    v18 = GKOSLoggers();
  v19 = (void *)os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    objc_msgSend(v16, "internal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "debugDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v22;
    _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "GKMatch: connectToNearbyPlayer: %@ - connecting to participant with session info: nil", buf, 0xCu);

  }
  -[GKMatch inviteDelegate](self, "inviteDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[GKMatch inviteDelegate](self, "inviteDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch sendConnectingStateCallbackToDelegate:forPlayers:](self, "sendConnectingStateCallbackToDelegate:forPlayers:", v24, v25);

  }
  else
  {
    if (!os_log_GKGeneral)
      v26 = GKOSLoggers();
    v27 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatch connectToNearbyPlayer:withConnectionData:].cold.1(v27);
  }
  -[GKMatch transportContext](self, "transportContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateForLegacyNearbyInvite");

  -[GKMatch transport](self, "transport");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "connectToNearbyPlayer:withConnectionData:", v16, v17);

  +[GKReporter reporter](GKReporter, "reporter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionType"), CFSTR("realtime.allConnectionAttempt"));

}

void __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "referenceKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setConnectionInfo:", v6);

  }
  objc_msgSend(v3, "connectionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("peer-id"));

  objc_msgSend(v3, "connectionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("peer-blob"));

  objc_msgSend(v3, "connectionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 48);
  v10 = (id *)(a1 + 48);
  objc_msgSend(v11, "nearbyConnectionData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("self-blob"));

  objc_msgSend(v3, "connectionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(*v10, "version"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("match-version"));

  objc_msgSend(v3, "connectionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("nearby"));

  ++*((_QWORD *)*v10 + 22);
  if (!os_log_GKGeneral)
    v17 = GKOSLoggers();
  v18 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke_cold_1((uint64_t)v10, v18);

}

- (id)packet:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  GKMatchPacket *v7;
  GKMatch *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v6 = a4;
  v7 = objc_alloc_init(GKMatchPacket);
  -[GKMatchPacket setPacketType:](v7, "setPacketType:", v4);
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[GKMatch packetSequenceNumber](v8, "packetSequenceNumber") + 1;
  -[GKMatch setPacketSequenceNumber:](v8, "setPacketSequenceNumber:", v9);
  objc_sync_exit(v8);

  -[GKMatchPacket setSequenceNumber:](v7, "setSequenceNumber:", v9);
  -[GKMatchPacket setData:](v7, "setData:", v6);
  -[GKMatchPacket message](v7, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)syncPlayers:(id)a3 forJoinType:(int)a4 toInvitees:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  GKMatch *v13;
  int v14;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke;
    v10[3] = &unk_1E75B3918;
    v11 = v9;
    v14 = a4;
    v12 = v8;
    v13 = self;
    +[GKPlayer loadPlayersForLegacyIdentifiers:withCompletionHandler:](GKLocalPlayer, "loadPlayersForLegacyIdentifiers:withCompletionHandler:", v11, v10);

  }
}

void __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_2();
  }
  else
  {
    v31[0] = CFSTR("GKMatchJoinType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = CFSTR("playerIDs");
    v32[0] = v9;
    v32[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v7)
    {
      if (!os_log_GKGeneral)
        v12 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "packet:data:", 8, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "transport");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "transportContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v14, "sendScopedData:toPlayers:dataMode:dataScope:transportContext:error:", v13, v5, 0, 0, v15, &v21);
      v16 = v21;

      if (v16)
      {
        if (!os_log_GKGeneral)
          v17 = GKOSLoggers();
        v18 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v24 = v5;
          v25 = 2112;
          v26 = v10;
          v27 = 2112;
          v28 = v13;
          v29 = 2112;
          v30 = 0;
          _os_log_error_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_ERROR, "Failed to sync data to players: %@, dict: %@, data: %@, error: %@", buf, 0x2Au);
        }
      }
      else
      {
        if (!os_log_GKGeneral)
          v19 = GKOSLoggers();
        v20 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v5;
          v25 = 2112;
          v26 = v10;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "Sent sync data to players: %@, dict: %@, data: %@", buf, 0x20u);
        }
      }

    }
  }

}

- (void)receivedPlayerSyncData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  int v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GKMatchJoinType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v9;
    objc_msgSend(v10, "numberWithUnsignedInt:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v4;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "receivedPlayerSyncData, dict: %@, joinType: %@", buf, 0x16u);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playerIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __34__GKMatch_receivedPlayerSyncData___block_invoke;
  v15[3] = &unk_1E75B3940;
  v16 = v7;
  v15[4] = self;
  +[GKPlayer loadPlayersForLegacyIdentifiers:withCompletionHandler:](GKLocalPlayer, "loadPlayersForLegacyIdentifiers:withCompletionHandler:", v14, v15);

}

void __34__GKMatch_receivedPlayerSyncData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_DWORD *)(a1 + 40);
  if ((v7 - 1) < 3 || v7 == 5)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "_gkPlayersIDsFromPlayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "matchmaker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "siblingInvitees");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionSet:", v11);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = v11;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(a1 + 32), "updateJoinedPlayer:joinType:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), 5, (_QWORD)v33);
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v16);
    }

    goto LABEL_14;
  }
  if (v7 == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "matchmaker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "autoMatchedPlayers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "_gkPlayersIDsFromPlayers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unionSet:", v23);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v5, "_gkPlayersIDsFromPlayers");
    v14 = objc_claimAutoreleasedReturnValue();
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(a1 + 32), "updateJoinedPlayer:joinType:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j), 4);
        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v25);
    }
    goto LABEL_14;
  }
  if (!os_log_GKGeneral)
    v28 = GKOSLoggers();
  v29 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v30 = (void *)MEMORY[0x1E0CB37E8];
    v31 = *(unsigned int *)(a1 + 40);
    v14 = v29;
    objc_msgSend(v30, "numberWithUnsignedInt:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v32;
    v43 = 2112;
    v44 = v5;
    _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "receivedPlayerSyncData, joinType: %@ not doing anything for players: %@", buf, 0x16u);

LABEL_14:
  }

}

- (id)makeInviteMessageDoneData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[GKMatch propertiesByPlayerID](self, "propertiesByPlayerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeInviteMessageDoneWithProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sendInviteData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v4 = a3;
  -[GKMatch transportContext](self, "transportContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validTransportSelected");

  if (v6)
  {
    -[GKMatch sendInviteData:withScope:](self, "sendInviteData:withScope:", v4, 0);
  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatch sendInviteData:].cold.1(v8);
  }

}

- (void)sendInviteData:(id)a3 withScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (-[GKMatch version](self, "version"))
  {
    -[GKMatch packet:data:](self, "packet:data:", 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[GKMatch transport](self, "transport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch transportContext](self, "transportContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "sendScopedDataToAll:dataMode:dataScope:transportContext:error:", v7, 0, a4, v9, &v13);
  v10 = v13;

  if (v10)
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Failed to send invite data, error: %@", buf, 0xCu);
    }
  }

}

- (BOOL)sendPacketDataToAll:(id)a3 packetType:(unsigned __int8)a4 dataMode:(int64_t)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;

  -[GKMatch packet:data:](self, "packet:data:", a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch transport](self, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch transportContext](self, "transportContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "sendScopedDataToAll:dataMode:dataScope:transportContext:error:", v9, a5, 0, v11, a6);

  return (char)a6;
}

- (void)sendVersionData:(unsigned __int8)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[15];
  unsigned __int8 v14;

  v14 = a3;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "GKMatch: sendVersionData", buf, 2u);
  }
  if (-[GKMatch version](self, "version"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch packet:data:](self, "packet:data:", 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKMatch transport](self, "transport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch transportContext](self, "transportContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v8, "sendScopedDataToAll:dataMode:dataScope:transportContext:error:", v7, 0, 0, v9, &v12);
    v10 = v12;

    if (v10)
    {
      if (!os_log_GKGeneral)
        v11 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        -[GKMatch sendVersionData:].cold.1();
    }

  }
}

- (void)sendVersionData:(unsigned __int8)a3 toPlayer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch packet:data:](self, "packet:data:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKMatch transport](self, "transport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch transportContext](self, "transportContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "sendScopedData:toPlayers:dataMode:dataScope:transportContext:error:", v7, v9, 0, 0, v10, &v14);
  v11 = v14;

  if (v11)
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      -[GKMatch sendVersionData:toPlayer:].cold.1(v13, v5);
  }

}

- (void)queueData:(id)a3 withEventQueueForPlayer:(id)a4 forRecipient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__GKMatch_queueData_withEventQueueForPlayer_forRecipient___block_invoke;
  v12[3] = &unk_1E75B38C8;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  -[GKMatch withEventQueueForPlayer:perform:](self, "withEventQueueForPlayer:perform:", a4, v12);

}

void __58__GKMatch_queueData_withEventQueueForPlayer_forRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  GKMatchEvent *v5;

  if (a2)
  {
    v3 = a2;
    v5 = objc_alloc_init(GKMatchEvent);
    -[GKMatchEvent setRecipientPlayer:](v5, "setRecipientPlayer:", *(_QWORD *)(a1 + 32));
    -[GKMatchEvent setData:](v5, "setData:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "events");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v5);
  }
}

- (void)deliverData:(id)a3 forRecipient:(id)a4 fromPlayer:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __47__GKMatch_deliverData_forRecipient_fromPlayer___block_invoke;
  v18 = &unk_1E75B3968;
  v22 = &v23;
  v11 = v10;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v13 = v8;
  v21 = v13;
  -[GKMatch withEventQueueForPlayer:createIfNeeded:perform:](self, "withEventQueueForPlayer:createIfNeeded:perform:", v11, 1, &v15);
  if (*((_BYTE *)v24 + 24))
  {
    -[GKMatch delegate](self, "delegate", v15, v16, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:](self, "_delegate:didReceiveData:forRecipient:fromPlayer:", v14, v13, v12, v11);

  }
  _Block_object_dispose(&v23, 8);

}

void __47__GKMatch_deliverData_forRecipient_fromPlayer___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  GKMatchEvent *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "okToSend"))
    {
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    }
    else
    {
      if (!os_log_GKGeneral)
        v5 = GKOSLoggers();
      v6 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)a1[4];
        v8 = v6;
        objc_msgSend(v7, "internal");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "conciseDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Queuing data for player: %@ (not ready)", (uint8_t *)&v13, 0xCu);

      }
      v11 = objc_alloc_init(GKMatchEvent);
      -[GKMatchEvent setRecipientPlayer:](v11, "setRecipientPlayer:", a1[5]);
      -[GKMatchEvent setData:](v11, "setData:", a1[6]);
      objc_msgSend(v4, "events");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

    }
  }

}

- (void)sendQueuedStatesAndPackets
{
  __int128 v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[GKMatch players](self, "players");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v22;
    *(_QWORD *)&v3 = 138412546;
    v16 = v3;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "internal", v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "playerID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = self->_playerEventQueues;
        objc_sync_enter(v8);
        -[NSMutableDictionary objectForKey:](self->_playerEventQueues, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = objc_msgSend(v9, "deferedPlayerState");
          v12 = objc_msgSend(v10, "playerState");
          objc_msgSend(v10, "setDeferedPlayerState:", 0);
          if (!os_log_GKGeneral)
            v13 = GKOSLoggers();
          v14 = (id)os_log_GKMatch;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v5, "internal");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "debugDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v26 = v15;
            v27 = 2112;
            v28 = &unk_1E75FB040;
            _os_log_debug_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_DEBUG, "_playerEventQueues for player %@ changed deferedPlayerState to %@", buf, 0x16u);

          }
        }
        else
        {
          v12 = 0;
          v11 = 0;
        }

        objc_sync_exit(v8);
        if (v11)
          -[GKMatch sendStateCallbackForPlayer:state:](self, "sendStateCallbackForPlayer:state:", v5, v11);
        if (v12 == 1)
          -[GKMatch sendQueuedPacketsForPlayer:](self, "sendQueuedPacketsForPlayer:", v5);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v20);
  }

}

- (void)sendQueuedPacketsForPlayer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__GKMatch_sendQueuedPacketsForPlayer___block_invoke;
  v6[3] = &unk_1E75B38C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[GKMatch withEventQueueForPlayer:perform:](self, "withEventQueueForPlayer:perform:", v5, v6);

}

void __38__GKMatch_sendQueuedPacketsForPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id obj;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v3;
    objc_msgSend(v3, "events");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v21 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (!os_log_GKGeneral)
            v8 = GKOSLoggers();
          v9 = os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "Calling delegate with saved peer data", buf, 2u);
          }
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v10, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "data");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "recipientPlayer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_delegate:didReceiveData:forRecipient:fromPlayer:", v11, v12, v13, *(_QWORD *)(a1 + 40));

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v4);
    }

    objc_msgSend(v17, "events");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

    objc_msgSend(v17, "setOkToSend:", 1);
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
    objc_sync_enter(v15);
    objc_msgSend(*(id *)(a1 + 40), "referenceKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "containsObject:", v16) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v16);

    objc_sync_exit(v15);
    v3 = v17;
  }

}

- (void)deferStateCallbackForPlayer:(id)a3 state:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    -[GKMatch stringForGKPlayerConnectionState:](self, "stringForGKPlayerConnectionState:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "defering GKPlayerConnectionState: %@ callback for player: %@", buf, 0x16u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke;
  v14[3] = &unk_1E75B3990;
  v15 = v6;
  v16 = a4;
  v13 = v6;
  -[GKMatch withEventQueueForPlayer:perform:](self, "withEventQueueForPlayer:perform:", v13, v14);

}

void __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  if (!v3)
    __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_1();
  v4 = v3;
  objc_msgSend(v3, "setDeferedPlayerState:", *(_QWORD *)(a1 + 40));
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_2(a1, v6, (_QWORD *)(a1 + 40));

}

- (void)updateStateForPlayer:(id)a3 state:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t expectedPlayerCount;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  int64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v6, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatch stringForGKPlayerConnectionState:](self, "stringForGKPlayerConnectionState:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "Updating GKPlayerConnectionState for player: %@ to %@", buf, 0x16u);

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __38__GKMatch_updateStateForPlayer_state___block_invoke;
  v20[3] = &unk_1E75B39B8;
  v20[4] = self;
  v22 = a4;
  v13 = v6;
  v21 = v13;
  -[GKMatch withEventQueueForPlayer:createIfNeeded:perform:](self, "withEventQueueForPlayer:createIfNeeded:perform:", v13, 1, v20);
  if (!os_log_GKGeneral)
    v14 = GKOSLoggers();
  v15 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    expectedPlayerCount = self->_expectedPlayerCount;
    v18 = v15;
    objc_msgSend(v16, "numberWithUnsignedInteger:", expectedPlayerCount);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_impl(&dword_1BCDE3000, v18, OS_LOG_TYPE_INFO, "expecting %@ more players", buf, 0xCu);

  }
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "counted") & 1) == 0)
    {
      v6 = (id *)(a1 + 4);
      v5 = a1[4];
      v7 = *(_QWORD *)(v5 + 176);
      if (v7)
      {
        *(_QWORD *)(v5 + 176) = v7 - 1;
        if (!os_log_GKGeneral)
          v8 = GKOSLoggers();
        v9 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
          __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_3((uint64_t)(a1 + 4), v9);
        if (!*((_QWORD *)*v6 + 22))
        {
          if (!os_log_GKGeneral)
            v10 = GKOSLoggers();
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
            __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_2();
          objc_msgSend(*v6, "updateRematchID");
        }
      }
      objc_msgSend(v4, "setCounted:", 1);
    }
    if (a1[6] == 2)
    {
      v12 = (void *)a1[5];
      v11 = (uint64_t)(a1 + 5);
      objc_msgSend(v12, "internal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "playerID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(v11 - 8) + 56), "removeObjectForKey:", v14);
      objc_msgSend(*(id *)(*(_QWORD *)(v11 - 8) + 32), "removeObject:", v14);
      if (!os_log_GKGeneral)
        v15 = GKOSLoggers();
      v16 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
        __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_1(v11, v16);

    }
  }

}

- (void)sendStateCallbackForPlayer:(id)a3 state:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  GKMatch *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_expectedPlayerCount)
  {
    +[GKReporter reporter](GKReporter, "reporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportConnectingDevicesDuration");

    +[GKReporter reporter](GKReporter, "reporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportProgramaticInviteDuration");

  }
  -[GKMatch delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_6:
    -[GKMatch delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[GKMatch delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatch sendStateCallbackToDelegate:forPlayer:state:](self, "sendStateCallbackToDelegate:forPlayer:state:", v12, v6, a4);

    }
    -[GKMatch inviteDelegate](self, "inviteDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[GKMatch inviteDelegate](self, "inviteDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKMatch sendStateCallbackToDelegate:forPlayer:state:](self, "sendStateCallbackToDelegate:forPlayer:state:", v14, v6, a4);

    }
    goto LABEL_10;
  }
  -[GKMatch inviteDelegate](self, "inviteDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_6;
  if (!os_log_GKGeneral)
    v15 = GKOSLoggers();
  v16 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
  {
    v17 = v16;
    objc_msgSend(v6, "internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "debugDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    v25 = 2048;
    v26 = self;
    _os_log_error_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_ERROR, "Cannot send state call back for player: %@, state: %@, due to missing delegates set for GKMatch: %p", (uint8_t *)&v21, 0x20u);

  }
LABEL_10:

}

- (void)sendStateCallbackToDelegate:(id)a3 forPlayer:(id)a4 state:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  GKMatch *v34;
  id v35;
  int64_t v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[GKMatch updateStateForPlayer:state:](self, "updateStateForPlayer:state:", v9, a5);
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    -[GKMatch stringForGKPlayerConnectionState:](self, "stringForGKPlayerConnectionState:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v38 = v8;
    v39 = 2112;
    v40 = v13;
    v41 = 2112;
    v42 = v15;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Informing state change to delegate %@: The GKPlayerConnectionState = %@, for player: %@", buf, 0x20u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke;
    v32[3] = &unk_1E75B39E0;
    v33 = v8;
    v34 = self;
    v35 = v9;
    v36 = a5;
    objc_msgSend(v35, "updateScopedIDs:", v32);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (GKApplicationLinkedOnOrAfter())
    {
      if (!os_log_GKGeneral)
        v16 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        -[GKMatch sendStateCallbackToDelegate:forPlayer:state:].cold.1();
    }
    else
    {
      objc_msgSend(v9, "internal");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "playerID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "match:player:didChangeState:", self, v25, a5);

    }
  }
  else
  {
    -[GKMatch delegate](self, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[GKMatch delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v8);

      if (v20)
      {
        if (!os_log_GKGeneral)
          v21 = GKOSLoggers();
        v22 = os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCDE3000, v22, OS_LOG_TYPE_INFO, "Delegate doesn't respond to state change callback", buf, 2u);
        }
        if (!os_log_GKGeneral)
          v23 = GKOSLoggers();
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
          -[GKMatch sendStateCallbackToDelegate:forPlayer:state:].cold.2();
      }
    }
  }
  if (a5 == 1)
  {
    if (-[GKMatch fastStartStateActive](self, "fastStartStateActive"))
    {
      -[GKMatch connectedPlayers](self, "connectedPlayers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");
      -[GKMatch matchmaker](self, "matchmaker");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currentMatchRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "minPlayers");

      if (v27 >= v30)
      {
        -[GKMatch makeInviteMessageDoneData](self, "makeInviteMessageDoneData");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKMatch sendInviteData:](self, "sendInviteData:", v31);

      }
    }
  }

}

void __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke_2;
  v7[3] = &unk_1E75B39E0;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v8 = v2;
  v9 = v3;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __55__GKMatch_sendStateCallbackToDelegate_forPlayer_state___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "match:player:didChangeConnectionState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)connectedPlayers
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_playerEventQueues;
  objc_sync_enter(v4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GKMatch players](self, "players", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "internal");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "playerID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](self->_playerEventQueues, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "playerState") == 1)
        {
          objc_msgSend(v12, "player");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (void)sendConnectingStateCallbackToDelegate:(id)a3 forPlayers:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (!os_log_GKGeneral)
            v12 = GKOSLoggers();
          v13 = (void *)os_log_GKMatch;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            v14 = v13;
            objc_msgSend(v11, "internal");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "debugDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v24 = v16;
            _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "Informing match inviteDelegate to set connecting state for player %@", buf, 0xCu);

          }
          objc_msgSend(v5, "setConnectingStateForPlayer:", v11);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v8);
    }

    v6 = v17;
  }

}

- (void)reinviteeAcceptedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peer-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_log_GKGeneral)
    v6 = GKOSLoggers();
  v7 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "Got reinvite acception notification: player(ID: %@) would like to reconnect to this  match...", buf, 0xCu);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invite-version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedCharValue");

  -[GKMatch transportContext](self, "transportContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAfterInviteeAcceptedUserInfo:", v4);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__GKMatch_reinviteeAcceptedNotification___block_invoke;
  v12[3] = &unk_1E75B3800;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[GKMatch connectToPlayers:version:invitedByLocalPlayer:completionHandler:](self, "connectToPlayers:version:invitedByLocalPlayer:completionHandler:", 0, v9, 1, v12);

}

void __41__GKMatch_reinviteeAcceptedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "handleRelayPushData:onlyIfPreemptive:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("GKInviteeAcceptedGameInvite"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("GKInviteeDeclinedGameInvite"), 0);

}

- (void)reinviteeDeclinedNotification:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(v19, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("I"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Got reinvite declined notification: player %@ has refused a reconnect to this match...", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("GKInviteeAcceptedGameInvite"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("GKInviteeDeclinedGameInvite"), 0);

  v9 = self->_reinvitedPlayers;
  objc_sync_enter(v9);
  v10 = self->_reinvitedPlayers;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v10;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "internal");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "playerID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v4);

        if (v18)
        {
          -[NSMutableArray removeObject:](v11, "removeObject:", v15);
          goto LABEL_15;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  objc_sync_exit(v9);
}

- (void)conditionallyReinvitePlayer:(id)a3 sessionToken:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *playerPushTokens;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  playerPushTokens = self->_playerPushTokens;
  objc_msgSend(v6, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](playerPushTokens, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[GKMatch delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "match:shouldReinviteDisconnectedPlayer:", self, v6);
      if (v7)
      {
LABEL_4:
        if (v13)
        {
          +[GCFLocalizedStrings GAME_RECONNECT_MESSAGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "GAME_RECONNECT_MESSAGE");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke;
          aBlock[3] = &unk_1E75B3A30;
          aBlock[4] = self;
          v27 = v14;
          v28 = v6;
          v29 = v7;
          v30 = v11;
          v15 = v14;
          v16 = _Block_copy(aBlock);
          -[GKMatch getLocalConnectionDataWithCompletionHandler:](self, "getLocalConnectionDataWithCompletionHandler:", v16);

        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if (!os_log_GKGeneral)
          v18 = GKOSLoggers();
        v19 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v20 = v19;
          objc_msgSend(v6, "internal");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "debugDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v22;
          _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "Player %@ disconnected: do not reinvite...", buf, 0xCu);

        }
        if (!os_log_GKGeneral)
          v23 = GKOSLoggers();
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
          -[GKMatch conditionallyReinvitePlayer:sessionToken:].cold.2();
        goto LABEL_20;
      }
      if (GKApplicationLinkedOnOrAfter())
      {
        if (!os_log_GKGeneral)
          v17 = GKOSLoggers();
        if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
          -[GKMatch conditionallyReinvitePlayer:sessionToken:].cold.1();
        goto LABEL_20;
      }
      objc_msgSend(v6, "internal");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "playerID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "match:shouldReinvitePlayer:", self, v25);

      if (v7)
        goto LABEL_4;
    }
LABEL_20:

  }
}

void __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "transportContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "daemonProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2;
    v16[3] = &unk_1E75B3A08;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 40);
    objc_copyWeak(&v19, &location);
    objc_msgSend(v9, "sendReconnectInvitation:toPlayer:connectionData:sessionToken:pushToken:handler:", v10, v11, v5, v13, v12, v16);

    if (!os_log_GKGeneral)
      v14 = GKOSLoggers();
    v15 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = 0;
      _os_log_impl(&dword_1BCDE3000, v15, OS_LOG_TYPE_INFO, "error getLocalConnectionData for re-invite = %@", buf, 0xCu);
    }
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

}

void __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *WeakRetained;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2_cold_1();
  }
  else
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "internal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "conciseDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "re-invite request sent == [%@, %@]...", (uint8_t *)&v17, 0x16u);

    }
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    v13 = WeakRetained[8];
    objc_sync_enter(v13);
    if ((objc_msgSend(WeakRetained[8], "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
      objc_msgSend(WeakRetained[8], "addObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v13);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", WeakRetained, sel_reinviteeAcceptedNotification_, CFSTR("GKInviteeAcceptedGameInvite"), v15);

    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", WeakRetained, sel_reinviteeDeclinedNotification_, CFSTR("GKInviteeDeclinedGameInvite"), v16);

  }
}

- (void)conditionallyRelaunchPlayer:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *playerPushTokens;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_reinvitedPlayers;
  objc_sync_enter(v5);
  v6 = self->_reinvitedPlayers;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isEqual:", v4, (_QWORD)v18))
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    playerPushTokens = self->_playerPushTokens;
    objc_msgSend(v4, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](playerPushTokens, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObject:](v7, "removeObject:", v11);
    objc_sync_exit(v5);

    if (!v15)
      goto LABEL_17;
    if (!os_log_GKGeneral)
      v16 = GKOSLoggers();
    v17 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatch conditionallyRelaunchPlayer:].cold.1(v17, v4);
    -[GKMatch makeInviteMessageDoneData](self, "makeInviteMessageDoneData");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[GKMatch sendInviteData:](self, "sendInviteData:", v5);
  }
  else
  {
LABEL_9:

    objc_sync_exit(v5);
  }

LABEL_17:
}

- (void)acceptRelayResponse:(id)a3 player:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[GKMatch transport](self, "transport");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "playerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "acceptRelayResponse:playerID:", v7, v9);

}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[GKMatch transport](self, "transport");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleRelayPushData:onlyIfPreemptive:", v6, v4);

}

- (void)preemptRelay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[GKMatch transport](self, "transport");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preemptRelay:", v6);

}

- (void)relayDidReceivePushData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t *v33;
  __int128 *p_buf;
  _QWORD v35[4];
  id v36;
  GKMatch *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t v45[4];
  void *v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "relayPush - push notification's userInfo: %@", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("I"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__6;
  v50 = __Block_byref_object_dispose__6;
  v51 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__6;
  v43 = __Block_byref_object_dispose__6;
  v44 = 0;
  v10 = self->_playerEventQueues;
  objc_sync_enter(v10);
  -[NSMutableDictionary objectForKey:](self->_playerEventQueues, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "connectionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("session-token"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v14;

    if (!os_log_GKGeneral)
      v16 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatch relayDidReceivePushData:completionHandler:].cold.1();
    objc_msgSend(v12, "player");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v40[5];
    v40[5] = v17;

  }
  else
  {
    if (!os_log_GKGeneral)
      v19 = GKOSLoggers();
    v20 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v45 = 138412290;
      v46 = v9;
      _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "player event queue does not exist for %@", v45, 0xCu);
    }
  }

  objc_sync_exit(v10);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatch.m", 1740, "-[GKMatch relayDidReceivePushData:completionHandler:]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x1E0C809B0];
  if (!v40[5])
  {
    if (!os_log_GKGeneral)
      v24 = GKOSLoggers();
    v25 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_1BCDE3000, v25, OS_LOG_TYPE_INFO, "no player, bootstrapping player (loading player from identifier)", v45, 2u);
    }
    v35[0] = v23;
    v35[1] = 3221225472;
    v35[2] = __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke;
    v35[3] = &unk_1E75B3A80;
    v37 = self;
    v38 = &v39;
    v36 = v9;
    objc_msgSend(v22, "perform:", v35);

  }
  dispatch_get_global_queue(0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  v30[1] = 3221225472;
  v30[2] = __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_313;
  v30[3] = &unk_1E75B3AA8;
  v33 = &v39;
  p_buf = &buf;
  v30[4] = self;
  v27 = v6;
  v31 = v27;
  v28 = v29;
  v32 = v28;
  objc_msgSend(v22, "notifyOnQueue:block:", v26, v30);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&buf, 8);

}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12[0] = a1[2].i64[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2;
  v8[3] = &unk_1E75B3A58;
  v11 = a1[3].i64[0];
  v7 = a1[2];
  v5 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  v10 = v3;
  v6 = v3;
  +[GKPlayer loadPlayersForIdentifiersPrivate:withCompletionHandler:](GKPlayer, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v4, v8);

}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(id *)(a1[4] + 56);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "setPlayer:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

    objc_sync_exit(v10);
  }
  else
  {
    if (!os_log_GKGeneral)
      v13 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_313(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("s"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dataFromBase64String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v3, "isEqualToData:", v5);

    if ((v3 & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "internal");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "playerID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      return;
    }
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v12 = *(void **)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      v14 = v9;
      objc_msgSend(v13, "objectForKey:", CFSTR("s"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataFromBase64String:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v19 = v12;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v16;
      _os_log_error_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_ERROR, "relayPush for match: %p - session token doesn't match with this session! - sessionToken from relay push: %@ - sessionToken in this match: %@", buf, 0x20u);

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      if (!os_log_GKGeneral)
        v10 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_313_cold_1();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)connectionDidChangeWithState:(int)a3 playerID:(id)a4
{
  id v6;
  NSObject *stateChangeQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  stateChangeQueue = self->_stateChangeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke;
  block[3] = &unk_1E75B3B70;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(stateChangeQueue, block);

}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  int v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  int v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2
    && (objc_msgSend(v2, "allValues"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "connectionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("session-token"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("Unknown");
  }
  if (!os_log_GKGeneral)
    v9 = GKOSLoggers();
  v10 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(unsigned int *)(a1 + 48);
    v13 = v10;
    objc_msgSend(v11, "stringForGKPeerConnectionState:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v34 = v11;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "GKTransportClientDelegate call back for match: %p - new state: %@ - playerID: %@ - sessionToken: %@.", buf, 0x2Au);

  }
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("com.apple.gamecenter.match.changestategroup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("player"));
  v18 = MEMORY[0x1E0C809B0];
  if (!v17)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_322;
    v28[3] = &unk_1E75B3B20;
    v19 = *(id *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 32);
    v29 = v19;
    v30 = v20;
    v32 = *(_DWORD *)(a1 + 48);
    v31 = v16;
    objc_msgSend(v31, "perform:", v28);

  }
  dispatch_get_global_queue(0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_327;
  v24[3] = &unk_1E75B3B70;
  v22 = *(_QWORD *)(a1 + 32);
  v25 = v16;
  v26 = v22;
  v27 = *(_DWORD *)(a1 + 48);
  v23 = v16;
  objc_msgSend(v23, "notifyOnQueue:block:", v21, v24);

}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_322(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  int8x16_t v18;
  int8x16_t v19;
  _QWORD v20[4];
  id v21;
  int8x16_t v22;
  id v23;
  int v24;
  _QWORD v25[4];
  id v26;
  int8x16_t v27;
  id v28;
  id v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "fetching player with playerID: %@", buf, 0xCu);
  }
  if (+[GKPlayer isGuestPlayerID:](GKPlayer, "isGuestPlayerID:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "componentsSeparatedByString:", CFSTR("_"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_322_cold_1();
    v32 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_323;
    v25[3] = &unk_1E75B3AD0;
    v26 = v9;
    v30 = *(_DWORD *)(a1 + 56);
    v18 = *(int8x16_t *)(a1 + 32);
    v12 = (id)v18.i64[0];
    v27 = vextq_s8(v18, v18, 8uLL);
    v28 = *(id *)(a1 + 48);
    v29 = v3;
    v13 = v3;
    v14 = v9;
    +[GKPlayer loadPlayersForIdentifiersPrivate:withCompletionHandler:](GKPlayer, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v11, v25);

  }
  else
  {
    if (!os_log_GKGeneral)
      v15 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_322_cold_2();
    v31 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_325;
    v20[3] = &unk_1E75B3AF8;
    v21 = *(id *)(a1 + 48);
    v24 = *(_DWORD *)(a1 + 56);
    v19 = *(int8x16_t *)(a1 + 32);
    v17 = (id)v19.i64[0];
    v22 = vextq_s8(v19, v19, 8uLL);
    v23 = v3;
    v7 = v3;
    +[GKPlayer loadPlayersForIdentifiersPrivate:withCompletionHandler:](GKPlayer, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v16, v20);

    v8 = v21;
  }

}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_323(uint64_t a1, void *a2)
{
  void *v3;
  GKAnonymousGuestPlayerInternal *v4;
  void *v5;
  GKAnonymousGuestPlayerInternal *v6;
  GKPlayer *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [GKAnonymousGuestPlayerInternal alloc];
  objc_msgSend(v3, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKAnonymousGuestPlayerInternal initWithHostPlayerInternal:guestIdentifier:](v4, "initWithHostPlayerInternal:guestIdentifier:", v5, *(_QWORD *)(a1 + 32));

  v7 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v6);
  v8 = *(void **)(a1 + 40);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPlayers:", v9);

  objc_msgSend(*(id *)(a1 + 40), "connectionDidChangeWithState:playerID:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v7, CFSTR("player"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_325(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (!+[GKMatchmaker canPlayMultiplayerGameWithPlayers:](GKMatchmaker, "canPlayMultiplayerGameWithPlayers:", v3))
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_325_cold_1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 10, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "addPlayers:", v3);
  +[GKReporter reporter](GKReporter, "reporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.allMatchTotal"));

  +[GKReporter reporter](GKReporter, "reporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("realtime.indirectMatchTotal"));

  objc_msgSend(*(id *)(a1 + 40), "connectionDidChangeWithState:playerID:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("player"));
LABEL_9:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_327(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  int v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  uint8_t v94[128];
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 == 10)
  {
    objc_msgSend(*(id *)(a1 + 40), "disconnect");
  }
  else if (v3)
  {
    v6 = 0;
    v7 = *(_DWORD *)(a1 + 48);
    v8 = 1;
    v68 = 1;
    if (v7 != 2 && v7 != 5)
    {
      v68 = 0;
      if (v7 == 3)
      {
        v6 = 1;
        v8 = 2;
      }
      else
      {
        v6 = 0;
        v8 = 0;
      }
    }
    v66 = v6;
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v86 = 0;
    v87 = &v86;
    v88 = 0x2020000000;
    v89 = 0;
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__6;
    v84 = __Block_byref_object_dispose__6;
    v85 = 0;
    v9 = *(void **)(a1 + 40);
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_2;
    v73[3] = &unk_1E75B3B48;
    v76 = &v86;
    v77 = &v80;
    v67 = v8;
    v79 = v8;
    v10 = v3;
    v11 = *(_QWORD *)(a1 + 40);
    v74 = v10;
    v75 = v11;
    v78 = &v90;
    objc_msgSend(v9, "withEventQueueForPlayer:createIfNeeded:perform:", v10, 1, v73);
    if (*((_BYTE *)v91 + 24))
    {
      if (!os_log_GKGeneral)
        v12 = GKOSLoggers();
      v13 = (id)os_log_GKMatch;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "internal");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "debugDescription");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "stringForGKPlayerConnectionState:", v67);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v96 = v61;
        v97 = 2112;
        v98 = v62;
        _os_log_debug_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_DEBUG, "EventQueue for player %@ changed playerState to %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "transportContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "daemonProxy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "alias");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "stringForGKPeerConnectionState:", *(unsigned int *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ -> %@"), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "emitMultiplayerMessage:", v19);

      if (v68)
      {
        v20 = *((unsigned __int8 *)v87 + 24);
        if (v20 > objc_msgSend(*(id *)(a1 + 40), "version"))
          objc_msgSend(*(id *)(a1 + 40), "sendVersionData:toPlayer:", objc_msgSend(*(id *)(a1 + 40), "version"), v10);
        v21 = *(void **)(a1 + 40);
        objc_msgSend(v10, "internal");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playerID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addPlayerToGroup:", v23);

        +[GKReporter reporter](GKReporter, "reporter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("connect"));

        objc_msgSend(*(id *)(a1 + 40), "matchmaker");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "internal");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "playerID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "reportPlayerConnectedWithPlayerID:forMatch:", v27, *(_QWORD *)(a1 + 40));

        objc_msgSend(*(id *)(a1 + 40), "matchmaker");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "allInvitedInvitees");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "internal");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "playerID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v29) = objc_msgSend(v30, "containsObject:", v32);

        if ((_DWORD)v29)
        {
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v33 = v30;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v70 != v35)
                  objc_enumerationMutation(v33);
                v37 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
                objc_msgSend(*(id *)(a1 + 40), "playersByJoinType");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectForKeyedSubscript:", v37);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                if (v39)
                  objc_msgSend(*(id *)(a1 + 40), "syncPlayers:forJoinType:toInvitees:", v33, 5, v33);
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
            }
            while (v34);
          }

        }
        v40 = *(_DWORD *)(a1 + 48);
        if (v40 == 2)
        {
          +[GKReporter reporter](GKReporter, "reporter");
          v41 = objc_claimAutoreleasedReturnValue();
          -[NSObject reportEvent:type:](v41, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionType"), CFSTR("realtime.p2pSuccess"));
        }
        else if (v40 == 5)
        {
          +[GKReporter reporter](GKReporter, "reporter");
          v41 = objc_claimAutoreleasedReturnValue();
          -[NSObject reportEvent:type:](v41, "reportEvent:type:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionType"), CFSTR("realtime.relaySuccess"));
        }
        else
        {
          if (!os_log_GKGeneral)
            v47 = GKOSLoggers();
          v41 = (id)os_log_GKMatch;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "internal");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "debugDescription");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "stringForGKPeerConnectionState:", *(unsigned int *)(a1 + 48));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v96 = v64;
            v97 = 2112;
            v98 = v65;
            _os_log_error_impl(&dword_1BCDE3000, v41, OS_LOG_TYPE_ERROR, "Connection state not match for player: %@, state=%@, playerState=GKPlayerStateConnected", buf, 0x16u);

          }
        }
      }
      else
      {
        +[GKReporter reporter](GKReporter, "reporter");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("disconnect"));

        objc_msgSend(*(id *)(a1 + 40), "matchmaker");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "playerDisconnected:", v10);

        v44 = *(void **)(a1 + 40);
        v45 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "internal");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "alias");
        v41 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("Player disconnection detected: %@. If unexpected, Tap here to report."), v41);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "promptRadarAndRequestRemoteLogsWithDescriptionAddition:", v46);

      }
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v48 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "inviteDelegate");
      v49 = objc_claimAutoreleasedReturnValue();
      if (v48 | v49)
      {
        if (v48)
        {
          v50 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(*(id *)(a1 + 40), "allIDs");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "arrayWithArray:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "internal");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "playerID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "removeObject:", v55);

          objc_msgSend(*(id *)(a1 + 40), "sendStateCallbackForPlayer:state:", v10, v67);
          if (v68)
          {
            objc_msgSend(*(id *)(a1 + 40), "conditionallyRelaunchPlayer:", v10);
            objc_msgSend(*(id *)(a1 + 40), "sendQueuedPacketsForPlayer:", v10);
          }
          else if (v66)
          {
            if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "count") <= 1
              && (objc_msgSend(*(id *)(a1 + 40), "recentlyBecameActive") & 1) == 0)
            {
              if (v81[5])
              {
                if (objc_msgSend(v52, "count") == 1)
                {
                  objc_msgSend(v52, "objectAtIndex:", 0);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "internal");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "playerID");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v56, "isEqualToString:", v58);

                  if (v59)
                    objc_msgSend(*(id *)(a1 + 40), "conditionallyReinvitePlayer:sessionToken:", v10, v81[5]);
                }
              }
            }
          }

        }
        if (v49)
        {
          objc_msgSend(*(id *)(a1 + 40), "updateStateForPlayer:state:", v10, v67);
          objc_msgSend(*(id *)(a1 + 40), "sendStateCallbackToDelegate:forPlayer:state:", v49, v10, v67);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "deferStateCallbackForPlayer:state:", v10, v67);
      }

    }
    _Block_object_dispose(&v80, 8);

    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(&v90, 8);
  }

}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "connectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("match-version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "connectionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("session-token"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (objc_msgSend(v3, "playerState") != *(_QWORD *)(a1 + 72))
  {
    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    v11 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "internal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "stringForGKPlayerConnectionState:", objc_msgSend(v3, "playerState"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "stringForGKPlayerConnectionState:", *(_QWORD *)(a1 + 72));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_debug_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_DEBUG, "EventQueue for player %@ changing playerState from: %@ to %@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(v3, "setPlayerState:", *(_QWORD *)(a1 + 72));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }

}

- (void)connectionDidFailWithError:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[GKReporter reporter](GKReporter, "reporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("connectionFail"));

  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    -[GKMatch connectionDidFailWithError:].cold.1();

}

- (void)transportDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  +[GKReporter reporter](GKReporter, "reporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("fail"));

  if (!os_log_GKGeneral)
    v6 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    -[GKMatch connectionDidFailWithError:].cold.1();
  -[GKMatch delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GKMatch delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[GKMatch delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "match:didFailWithError:", self, v4);

    }
    else
    {
      if (!os_log_GKGeneral)
        v11 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
        -[GKMatch transportDidFailWithError:].cold.1();
    }
  }
  -[GKMatch clearSessionWithReason:](self, "clearSessionWithReason:", 3);
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Error detected in transport. Error: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatch promptRadarAndRequestRemoteLogsWithDescriptionAddition:](self, "promptRadarAndRequestRemoteLogsWithDescriptionAddition:", v14);

}

- (void)transportDidReceivePacket:(id)a3 fromPlayerID:(id)a4 remoteRecipientID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GKThreadsafeDictionary objectForKey:](self->_playersByIdentifier, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v58 = v10;
    if (v10)
    {
      if (!os_log_GKGeneral)
        v12 = GKOSLoggers();
      v13 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v10;
        _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "Got data intended for remoteRecipientID = %@", buf, 0xCu);
      }
      -[GKThreadsafeDictionary objectForKey:](self->_playersByIdentifier, "objectForKey:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v14;
    if (!os_log_GKGeneral)
      v18 = GKOSLoggers();
    v19 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:].cold.5(v19, v17);
    -[GKMatch delegate](self, "delegate");
    v20 = objc_claimAutoreleasedReturnValue();
    -[GKMatch inviteDelegate](self, "inviteDelegate");
    v59 = objc_claimAutoreleasedReturnValue();
    v21 = -[GKMatch version](self, "version");
    v22 = objc_msgSend(v8, "valid");
    if (!v21)
    {
      if (v22)
      {
        if (!os_log_GKGeneral)
          v26 = GKOSLoggers();
        v27 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v28 = v27;
          v29 = objc_msgSend(v8, "version");
          *(_DWORD *)buf = 67109120;
          LODWORD(v66) = v29;
          _os_log_impl(&dword_1BCDE3000, v28, OS_LOG_TYPE_INFO, "packet version: %d, expecting version 0", buf, 8u);

        }
      }
      if (!(v20 | v59))
      {
        if (!os_log_GKGeneral)
          v34 = GKOSLoggers();
        v35 = (void *)os_log_GKMatch;
        if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v36 = v35;
          objc_msgSend(v11, "internal");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "conciseDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v66 = v38;
          _os_log_impl(&dword_1BCDE3000, v36, OS_LOG_TYPE_INFO, "Queuing data for player; %@ (no delegate)", buf, 0xCu);

        }
        objc_msgSend(v8, "data");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKMatch queueData:withEventQueueForPlayer:forRecipient:](self, "queueData:withEventQueueForPlayer:forRecipient:", v39, v11, v17);

        v24 = (void *)v20;
        goto LABEL_79;
      }
      v24 = (void *)v20;
      if (v20)
      {
        objc_msgSend(v8, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKMatch deliverData:forRecipient:fromPlayer:](self, "deliverData:forRecipient:fromPlayer:", v30, v17, v11);

      }
      v31 = (void *)v59;
      if (!v59)
        goto LABEL_82;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "data");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v59, "match:didReceiveData:fromRemotePlayer:", self, v32, v11);
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if (!os_log_GKGeneral)
            v52 = GKOSLoggers();
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
            -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:].cold.2();
          goto LABEL_82;
        }
        if (GKApplicationLinkedOnOrAfter())
        {
          if (!os_log_GKGeneral)
            v49 = GKOSLoggers();
          if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
            -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:].cold.1();
          goto LABEL_82;
        }
        objc_msgSend(v8, "data");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "internal");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "playerID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v59, "match:didReceiveData:fromPlayer:", self, v32, v54);

      }
      goto LABEL_81;
    }
    if (!v22)
    {
      v24 = (void *)v20;
      if (!os_log_GKGeneral)
        v33 = GKOSLoggers();
      v31 = (void *)v59;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
        -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:].cold.4();
      goto LABEL_82;
    }
    v23 = objc_msgSend(v8, "packetType");
    v24 = (void *)v20;
    if (v23 <= 7)
    {
      if (v23 != 1)
      {
        if (v23 != 2)
          goto LABEL_69;
        if (objc_msgSend(v17, "isLocalPlayer"))
        {
          v57 = v17;
          objc_msgSend(v8, "data");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[GKInviteMessageSupport extractPropertiesWithData:](GKInviteMessageSupport, "extractPropertiesWithData:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            v55 = v9;
            v56 = v8;
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            objc_msgSend(v41, "allKeys");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v61;
              do
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v61 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                  objc_msgSend(v41, "objectForKeyedSubscript:", v47);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GKMatch updateProperties:playerID:](self, "updateProperties:playerID:", v48, v47);

                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
              }
              while (v44);
            }

            v9 = v55;
            v8 = v56;
          }

          v17 = v57;
          v24 = (void *)v20;
        }
        objc_msgSend(v8, "data");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)v59;
        -[GKMatch _delegate:didReceiveData:forRecipient:fromPlayer:](self, "_delegate:didReceiveData:forRecipient:fromPlayer:", v59, v32, v17, v11);
        goto LABEL_81;
      }
      objc_msgSend(v8, "data");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[GKMatch setVersion:](self, "setVersion:", *(unsigned __int8 *)objc_msgSend(v25, "bytes"));
    }
    else
    {
      if (v23 != 8)
      {
        if (v23 != 64)
        {
          if (v23 == 128)
          {
            objc_msgSend(v8, "data");
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (v20)
              -[GKMatch deliverData:forRecipient:fromPlayer:](self, "deliverData:forRecipient:fromPlayer:", v25, v17, v11);
            else
              -[GKMatch queueData:withEventQueueForPlayer:forRecipient:](self, "queueData:withEventQueueForPlayer:forRecipient:", v25, v11, v17);
            goto LABEL_78;
          }
LABEL_69:
          if (!os_log_GKGeneral)
            v50 = GKOSLoggers();
          v51 = (void *)os_log_GKMatch;
          v31 = (void *)v59;
          if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
            -[GKMatch transportDidReceivePacket:fromPlayerID:remoteRecipientID:].cold.3(v51);
          goto LABEL_82;
        }
        v31 = (void *)v59;
        if (!v24)
        {
LABEL_82:

          v10 = v58;
          goto LABEL_83;
        }
        objc_msgSend(v8, "data");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKMatch deliverData:forRecipient:fromPlayer:](self, "deliverData:forRecipient:fromPlayer:", v32, v17, v11);
LABEL_81:

        goto LABEL_82;
      }
      objc_msgSend(v8, "data");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[GKMatch receivedPlayerSyncData:](self, "receivedPlayerSyncData:", v25);
    }
LABEL_78:

LABEL_79:
    v31 = (void *)v59;
    goto LABEL_82;
  }
  if (!os_log_GKGeneral)
    v15 = GKOSLoggers();
  v16 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v9;
    _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "Data from playerID: %@ without player mapping", buf, 0xCu);
  }
LABEL_83:

}

- (void)transportDidUpdateWithInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKMatch transportContext](self, "transportContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithInfoFromTransport:", v4);

}

- (void)retryLimitHit
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "We have reached the limit of retry for pending connection checker.", v5, 2u);
  }
  -[GKMatch promptRadarAndRequestRemoteLogsWithDescriptionAddition:](self, "promptRadarAndRequestRemoteLogsWithDescriptionAddition:", CFSTR("Invitation failed after retry. Please tap to file a radar."));
}

- (id)dataFromBase64String:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  return v5;
}

- (id)stringForGKPlayerConnectionState:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 3)
    return off_1E75B3BA8[a3];
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    objc_msgSend(v7, "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Invalid connection state: GKPlayerConnectionState %@", (uint8_t *)&v10, 0xCu);

  }
  return 0;
}

- (id)stringForGKPeerConnectionState:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (a3 < 6)
    return off_1E75B3BC0[a3];
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    objc_msgSend(v7, "numberWithInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Invalid connection state: GKPeerConnectionState %@", (uint8_t *)&v10, 0xCu);

  }
  return 0;
}

- (void)reportInviteSentWithApproach:(unint64_t)a3 isHosted:(BOOL)a4 recipients:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v8 = a5;
  -[GKMatch multiplayerActivityReporter](self, "multiplayerActivityReporter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMatch transportContext](self, "transportContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onInviteSentWithApproach:isHosted:recipients:transportContext:", a3, v5, v8, v9);

}

- (GKThreadsafeDictionary)playersByIdentifier
{
  return self->_playersByIdentifier;
}

- (void)setPlayersByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playersByIdentifier, a3);
}

- (NSMutableSet)connectedPlayerIDs
{
  return self->_connectedPlayerIDs;
}

- (void)setConnectedPlayerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_connectedPlayerIDs, a3);
}

- (OS_dispatch_queue)stateChangeQueue
{
  return self->_stateChangeQueue;
}

- (void)setStateChangeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateChangeQueue, a3);
}

- (NSMutableDictionary)playerEventQueues
{
  return self->_playerEventQueues;
}

- (void)setPlayerEventQueues:(id)a3
{
  objc_storeStrong((id *)&self->_playerEventQueues, a3);
}

- (NSMutableArray)reinvitedPlayers
{
  return self->_reinvitedPlayers;
}

- (void)setReinvitedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_reinvitedPlayers, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (GKMatchDelegatePrivate)inviteDelegate
{
  return (GKMatchDelegatePrivate *)objc_loadWeakRetained((id *)&self->_inviteDelegateWeak);
}

- (unsigned)packetSequenceNumber
{
  return self->_packetSequenceNumber;
}

- (void)setPacketSequenceNumber:(unsigned int)a3
{
  self->_packetSequenceNumber = a3;
}

- (NSMutableDictionary)playerPushTokens
{
  return self->_playerPushTokens;
}

- (void)setPlayerPushTokens:(id)a3
{
  objc_storeStrong((id *)&self->_playerPushTokens, a3);
}

- (NSMutableArray)opponentIDs
{
  return self->_opponentIDs;
}

- (void)setOpponentIDs:(id)a3
{
  objc_storeStrong((id *)&self->_opponentIDs, a3);
}

- (NSString)rematchID
{
  return self->_rematchID;
}

- (void)setRematchID:(id)a3
{
  objc_storeStrong((id *)&self->_rematchID, a3);
}

- (int64_t)rematchCount
{
  return self->_rematchCount;
}

- (void)setRematchCount:(int64_t)a3
{
  self->_rematchCount = a3;
}

- (NSDictionary)networkStatistics
{
  return self->_networkStatistics;
}

- (void)setNetworkStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_networkStatistics, a3);
}

- (NSMutableDictionary)hostScores
{
  return self->_hostScores;
}

- (void)setHostScores:(id)a3
{
  objc_storeStrong((id *)&self->_hostScores, a3);
}

- (BOOL)needHostScore
{
  return self->_needHostScore;
}

- (void)setNeedHostScore:(BOOL)a3
{
  self->_needHostScore = a3;
}

- (BOOL)hostScoreForQuery
{
  return self->_hostScoreForQuery;
}

- (void)setHostScoreForQuery:(BOOL)a3
{
  self->_hostScoreForQuery = a3;
}

- (id)chooseHostCompletion
{
  return self->_chooseHostCompletion;
}

- (void)setChooseHostCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)recentlyBecameActive
{
  return self->_recentlyBecameActive;
}

- (void)setRecentlyBecameActive:(BOOL)a3
{
  self->_recentlyBecameActive = a3;
}

- (BOOL)fastStartStateActive
{
  return self->_fastStartStateActive;
}

- (void)setFastStartStateActive:(BOOL)a3
{
  self->_fastStartStateActive = a3;
}

- (BOOL)initiallyStarted
{
  return self->_initiallyStarted;
}

- (BOOL)canPromptTapToRadar
{
  return self->_canPromptTapToRadar;
}

- (void)setCanPromptTapToRadar:(BOOL)a3
{
  self->_canPromptTapToRadar = a3;
}

- (GKTransportProtocol)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (GKTransportContext)transportContext
{
  return self->_transportContext;
}

- (void)setTransportContext:(id)a3
{
  objc_storeStrong((id *)&self->_transportContext, a3);
}

- (GKMultiplayerActivityReporter)multiplayerActivityReporter
{
  return self->_multiplayerActivityReporter;
}

- (void)setMultiplayerActivityReporter:(id)a3
{
  objc_storeStrong((id *)&self->_multiplayerActivityReporter, a3);
}

- (_TtC20GameCenterFoundation22ExponentialBackoffTask)pendingConnectionChecker
{
  return self->_pendingConnectionChecker;
}

- (void)setPendingConnectionChecker:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConnectionChecker, a3);
}

- (GKMatchmaker)matchmaker
{
  return (GKMatchmaker *)objc_loadWeakRetained((id *)&self->_matchmaker);
}

- (void)setMatchmaker:(id)a3
{
  objc_storeWeak((id *)&self->_matchmaker, a3);
}

- (NSUInteger)expectedPlayerCount
{
  return self->_expectedPlayerCount;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (GKThreadsafeDictionary)playersByJoinType
{
  return self->_playersByJoinType;
}

- (void)setPlayersByJoinType:(id)a3
{
  objc_storeStrong((id *)&self->_playersByJoinType, a3);
}

- (GKThreadsafeDictionary)propertiesByPlayerID
{
  return self->_propertiesByPlayerID;
}

- (void)setPropertiesByPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesByPlayerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesByPlayerID, 0);
  objc_storeStrong((id *)&self->_playersByJoinType, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_destroyWeak((id *)&self->_matchmaker);
  objc_storeStrong((id *)&self->_pendingConnectionChecker, 0);
  objc_storeStrong((id *)&self->_multiplayerActivityReporter, 0);
  objc_storeStrong((id *)&self->_transportContext, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong(&self->_chooseHostCompletion, 0);
  objc_storeStrong((id *)&self->_hostScores, 0);
  objc_storeStrong((id *)&self->_networkStatistics, 0);
  objc_storeStrong((id *)&self->_rematchID, 0);
  objc_storeStrong((id *)&self->_opponentIDs, 0);
  objc_storeStrong((id *)&self->_playerPushTokens, 0);
  objc_destroyWeak((id *)&self->_inviteDelegateWeak);
  objc_storeStrong((id *)&self->_reinvitedPlayers, 0);
  objc_storeStrong((id *)&self->_playerEventQueues, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateChangeQueue, 0);
  objc_storeStrong((id *)&self->_connectedPlayerIDs, 0);
  objc_storeStrong((id *)&self->_playersByIdentifier, 0);
}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to send invitation update after sending match request. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__GKMatch_refreshPendingConnectionCheckIfNeeded__block_invoke_161_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Pending connection check is done.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sendData:toPlayers:dataMode:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_24(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to send data, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendDataToAllPlayers:withDataMode:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_24(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to send data to all, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__GKMatch_chooseBestHostingPlayerWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "Failed to find host player", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)promptRadarAndRequestRemoteLogsWithDescriptionAddition:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to encode players and their tokens: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)playerIDs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)chooseBestHostPlayerWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sendData:toPlayers:withDataMode:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

void __34__GKMatch_clearSessionWithReason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to disconnect all, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_delegate:didReceiveData:forRecipient:fromPlayer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_delegate:didReceiveData:forRecipient:fromPlayer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "<Warning>: need to implement one of the following methods in GKMatchDelegate: match:didReceiveData:forRecipient:fromRemotePlayer:, match:didReceiveData:fromRemotePlayer:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_delegate:(void *)a1 didReceiveData:forRecipient:fromPlayer:.cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v1, v4, "received data from playerID: %@ who is NOT connected!", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)withEventQueueForPlayer:(NSObject *)a3 create:(void *)a4 perform:.cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, a3, (uint64_t)a3, "No GKMatchEventQueue for player: %@", (uint8_t *)a2);

}

- (void)withEventQueueForPlayer:(NSObject *)a3 create:(void *)a4 perform:.cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, a3, (uint64_t)a3, "_playerEventQueues created for player: %@", (uint8_t *)a2);

}

void __28__GKMatch_addPlayerToGroup___block_invoke_253_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v3, v5, "Error attempting to update group to the server: %@ %@", v6);

  OUTLINED_FUNCTION_1_2();
}

- (void)setAutomatchPlayerCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "Cannot set automatch player count as there is no inviteDelegate set yet, or the invite delegate doesn't respond to selector: setAutomatchPlayerCount:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)connectToPlayers:version:invitedByLocalPlayer:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Skip adding players for early connection setup.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)connectToPlayers:version:invitedByLocalPlayer:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v0, v1, "cannot set connecting state for players: %@, as there is no inviteDelegate set yet. The state might directly change to Ready when we set the inviteDelegate later and call sendQueuedStatesAndPackets.", v2);
  OUTLINED_FUNCTION_2();
}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a1;
  objc_msgSend(v5, "numberWithInt:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)a3 + 176));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v7;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v6, v9, "Calculating _expectedPlayerCount + %@ = %@", (uint8_t *)&v10);

}

void __75__GKMatch_connectToPlayers_version_invitedByLocalPlayer_completionHandler___block_invoke_263_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "connectToPlayersWithTransportContext failed, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__GKMatch_connectToGuestPlayer_withHostPlayer___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  v8 = &unk_1E75FB028;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v2, v6, "EventQueue for player %@ changed playerState to %@", v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)connectToNearbyPlayer:(void *)a1 withConnectionData:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v1, v4, "cannot set connecting state for player: %@, as there is no inviteDelegate set yet. The state might directly change to Ready when we set the inviteDelegate later and call sendQueuedStatesAndPackets.", v5);

  OUTLINED_FUNCTION_1_2();
}

void __52__GKMatch_connectToNearbyPlayer_withConnectionData___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = OUTLINED_FUNCTION_20(a1, a2);
  objc_msgSend(v3, "numberWithUnsignedInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v4, v6, "Calculating _expectedPlayerCount + 1 = %@", v7);

  OUTLINED_FUNCTION_1_2();
}

void __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  v3 = v0;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v1, (uint64_t)v1, "syncPlayers error dataWithPropertyList: %@, error: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __46__GKMatch_syncPlayers_forJoinType_toInvitees___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "syncPlayers failed to loadPlayersForLegacyIdentifiers for invitees: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendInviteData:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "transportContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v2;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v4, "Invalid action. Tried to send invite data when there is no valid transport selected yet, transportContext: %@ Call stack: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)sendVersionData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Failed to send version data, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendVersionData:(void *)a1 toPlayer:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend(a2, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v3, v6, "Failed to send version data to playerID: %@, error: %@", v7);

  OUTLINED_FUNCTION_1_2();
}

void __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_1()
{
  __assert_rtn("-[GKMatch deferStateCallbackForPlayer:state:]_block_invoke", "GKMatch.m", 1473, "queue != nil");
}

void __45__GKMatch_deferStateCallbackForPlayer_state___block_invoke_cold_2(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v7;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v5, v9, "GKMatch Queue for player %@ changed deferedPlayerState to %@", (uint8_t *)&v10);

  OUTLINED_FUNCTION_1_2();
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_18(), "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v2, v6, "_playerEventQueues removed queue for player: %@", v7);

  OUTLINED_FUNCTION_1_2();
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Calculating (updateStateForPlayer) _expectedPlayerCount is 0. Need update rematchID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__GKMatch_updateStateForPlayer_state___block_invoke_cold_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = OUTLINED_FUNCTION_20(a1, a2);
  objc_msgSend(v3, "numberWithUnsignedInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v4, v6, "Calculating (updateStateForPlayer) _expectedPlayerCount - 1 = %@", v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)sendStateCallbackToDelegate:forPlayer:state:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sendStateCallbackToDelegate:forPlayer:state:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "<Warning>: match:player:didChangeConnectionState: delegate method not implemented for GKMatchDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)conditionallyReinvitePlayer:sessionToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1(&dword_1BCDE3000, v0, v1, "WARNING: delegate registered for the '%{public}@'. Game Center doesn't invoke this obsolete delegate method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)conditionallyReinvitePlayer:sessionToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "<Warning>: match:shouldReinviteDisconnectedPlayer: delegate method not implemented for GKMatchDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__GKMatch_conditionallyReinvitePlayer_sessionToken___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "error sending re-invite = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)conditionallyRelaunchPlayer:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend(a2, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conciseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v3, v6, "Sending invite data to re-launch player %@", v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)relayDidReceivePushData:completionHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, (uint64_t)v1, "relaypush for match: %p - assigning sessionToken to %@", v2);
  OUTLINED_FUNCTION_2();
}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_22();
  v3 = v0;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v1, (uint64_t)v1, "relayPush will not act on push notification because couldn't load player (%@) due to error: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __53__GKMatch_relayDidReceivePushData_completionHandler___block_invoke_313_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;

  OUTLINED_FUNCTION_24(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_22();
  v4 = v0;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v1, v2, "relayPush for match: %p - No session token was not stored in player event queue: %@", v3);
  OUTLINED_FUNCTION_2();
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_322_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v0, v1, "loading player using guest hostPlayerID: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_322_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_24(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v0, v1, "loading player using playerID: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __49__GKMatch_connectionDidChangeWithState_playerID___block_invoke_325_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "Cannot create match with player because playing with non-friends is restricted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)connectionDidFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKTransportClientDelegate - did fail with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)transportDidFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "<Warning>: match:didFailWithError: delegate method not implemented for GKMatchDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)transportDidReceivePacket:fromPlayerID:remoteRecipientID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "<Warning>: match:didReceiveData:fromRemotePlayer: delegate method not implemented for GKMatch.inviteDelegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)transportDidReceivePacket:(void *)a1 fromPlayerID:remoteRecipientID:.cold.3(void *a1)
{
  NSObject *v1;
  id v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v3[0] = 67109120;
  v3[1] = objc_msgSend((id)OUTLINED_FUNCTION_18(), "packetType");
  _os_log_debug_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_DEBUG, "Ignoring data packet type: %d", (uint8_t *)v3, 8u);

  OUTLINED_FUNCTION_2();
}

- (void)transportDidReceivePacket:fromPlayerID:remoteRecipientID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Ignoring invalid data packet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)transportDidReceivePacket:(void *)a1 fromPlayerID:(void *)a2 remoteRecipientID:.cold.5(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend(a2, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v3, v6, "Data intended for playerID: %@ from playerID: %@", v7);

  OUTLINED_FUNCTION_1_2();
}

@end
