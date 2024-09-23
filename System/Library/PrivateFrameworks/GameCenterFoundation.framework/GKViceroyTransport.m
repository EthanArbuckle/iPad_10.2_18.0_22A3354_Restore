@implementation GKViceroyTransport

- (GKViceroyTransport)initWithClientDelegate:(id)a3 matchDataDelegate:(id)a4 daemonProxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKViceroyTransport *v11;
  GKViceroyTransport *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  GKConnection *connection;
  uint64_t v19;
  NSMutableDictionary *guestConnections;
  uint64_t v21;
  NSMutableDictionary *guestSessions;
  GKViceroyLeaderElector *v23;
  GKViceroyLeaderElector *leaderElector;
  GKViceroyRelay *v25;
  void *v26;
  uint64_t v27;
  GKViceroyRelay *relay;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)GKViceroyTransport;
  v11 = -[GKViceroyTransport init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_weakClientDelegate, v8);
    v13 = objc_alloc(MEMORY[0x1E0D25C60]);
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "initWithParticipantID:", v16);
    connection = v12->_connection;
    v12->_connection = (GKConnection *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    guestConnections = v12->_guestConnections;
    v12->_guestConnections = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    guestSessions = v12->_guestSessions;
    v12->_guestSessions = (NSMutableDictionary *)v21;

    v23 = -[GKViceroyLeaderElector initWithMatchDataDelegate:]([GKViceroyLeaderElector alloc], "initWithMatchDataDelegate:", v9);
    leaderElector = v12->_leaderElector;
    v12->_leaderElector = v23;

    v25 = [GKViceroyRelay alloc];
    -[GKViceroyTransport connection](v12, "connection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[GKViceroyRelay initWithClientDelegate:connection:matchDataDelegate:daemonProxy:](v25, "initWithClientDelegate:connection:matchDataDelegate:daemonProxy:", v8, v26, v9, v10);
    relay = v12->_relay;
    v12->_relay = (GKViceroyRelay *)v27;

  }
  return v12;
}

- (void)initSessionIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v3, v5, "[GKViceroyTransport] A new session (%p) has been created", v6);

}

- (void)dealloc
{
  objc_super v3;

  -[GKViceroyTransport setLeaderElector:](self, "setLeaderElector:", 0);
  -[GKViceroyTransport setSession:](self, "setSession:", 0);
  -[GKViceroyTransport setClientDelegate:](self, "setClientDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GKViceroyTransport;
  -[GKViceroyTransport dealloc](&v3, sel_dealloc);
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "referenceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKViceroyTransport connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connectParticipantsWithConnectionData:withSessionInfo:", v8, 0);

  -[GKViceroyTransport initSessionIfNeeded](self, "initSessionIfNeeded");
}

- (void)connectToPlayersWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  GKViceroyTransport *v23;
  void *v24;
  void (**v25)(id, _QWORD);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v23 = self;
  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "peerDictionaries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", CFSTR("peer-id"), v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("peer-blob"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v14, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v9);
  }

  if (!os_log_GKGeneral)
    v15 = GKOSLoggers();
  v16 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "[GKViceroyTransport] Connecting to participants with connectionData %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "sessionToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, *MEMORY[0x1E0D25C50]);

  }
  objc_msgSend(v5, "cdxTicket");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v5, "cdxTicket");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v21, *MEMORY[0x1E0D25C48]);

  }
  objc_msgSend(v24, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "connectParticipantsWithConnectionData:withSessionInfo:", v6, v17);

  objc_msgSend(v24, "initSessionIfNeeded");
  v25[2](v25, 0);

}

- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  GKViceroySession *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKViceroyTransport guestConnections](self, "guestConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25C60]), "initWithParticipantID:", v8);
    -[GKViceroyTransport connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getLocalConnectionDataForLocalGaming");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "getLocalConnectionDataForLocalGaming");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKViceroyTransport connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v8;
    v27[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "connectParticipantsWithConnectionData:withSessionInfo:", v16, 0);

    objc_msgSend(v6, "internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "playerID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    v25 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "connectParticipantsWithConnectionData:withSessionInfo:", v19, 0);

    -[GKViceroyTransport guestConnections](self, "guestConnections");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, v8);

    -[GKViceroyTransport initSessionIfNeeded](self, "initSessionIfNeeded");
    v21 = -[GKViceroySession initWithConnection:delegate:]([GKViceroySession alloc], "initWithConnection:delegate:", v11, self);
    -[GKViceroyTransport guestSessions](self, "guestSessions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v8);

  }
  return v10 == 0;
}

- (void)disconnectAllWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "[GKViceroyTransport] disconnectAll", buf, 2u);
  }
  -[GKViceroyTransport relay](self, "relay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disconnect");

  -[GKViceroyTransport session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "disconnectFromAllPeers");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[GKViceroyTransport guestSessions](self, "guestSessions", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v18, "disconnectFromAllPeers");
        objc_msgSend(v18, "setDataReceiveHandler:withContext:", 0, 0);
        objc_msgSend(v18, "disconnectFromAllPeers");
        objc_msgSend(v18, "setDelegate:", 0);
        objc_msgSend(v18, "setPrivateDelegate:", 0);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v15);
  }

  -[GKViceroyTransport guestSessions](self, "guestSessions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  -[GKViceroyTransport guestConnections](self, "guestConnections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllObjects");

  v7[2](v7, 0);
}

- (id)enrichPeerDictionariesForPlayersConnection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  __int128 v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKViceroyTransport selfBlob](self, "selfBlob");
  v5 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v17 + 1) = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D25C60], "externalAddressForSelfConnectionData:", v5);
    *(_QWORD *)&v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)&v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
        objc_msgSend(v11, "objectForKey:", CFSTR("peer-id"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKViceroyTransport playerIDFromPeerID:](self, "playerIDFromPeerID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = 1;
        else
          v14 = v17 != 0;
        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setValue:forKey:", *((_QWORD *)&v17 + 1), CFSTR("self-blob"));
          objc_msgSend(v15, "setValue:forKey:", (_QWORD)v17, CFSTR("self-nat-ip"));
          objc_msgSend(v15, "setValue:forKey:", v13, CFSTR("player-id"));
          objc_msgSend(v6, "addObject:", v15);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v6;
}

- (void)localConnectionDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[GKViceroyTransport connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E75B1760;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getLocalConnectionDataWithCompletionHandler:", v7);

}

void __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setSelfBlob:", v5);
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSData)nearbyConnectionData
{
  void *v2;
  void *v3;

  -[GKViceroyTransport connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLocalConnectionDataForLocalGaming");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)peerIdFromPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v16;

  v4 = a3;
  -[GKViceroyTransport connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v8 = objc_msgSend(v5, "convertParticipantID:toPeerID:", v7, &v16);
  v9 = v16;

  v10 = os_log_GKGeneral;
  if (v8)
  {
    if (!os_log_GKGeneral)
    {
      v11 = GKOSLoggers();
      v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[GKViceroyTransport peerIdFromPlayer:].cold.1((uint64_t)v9, v10, v4);
    v12 = v9;
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v13 = GKOSLoggers();
      v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[GKViceroyTransport peerIdFromPlayer:].cold.2(v10, v4);
    objc_msgSend(v4, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playerID");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)playerIDFromPeerID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  id v14;
  id v16;

  v4 = a3;
  -[GKViceroyTransport connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = objc_msgSend(v5, "convertPeerID:toParticipantID:", v4, &v16);
  v7 = v16;

  v8 = os_log_GKGeneral;
  if (v6)
  {
    if (!os_log_GKGeneral)
    {
      v9 = GKOSLoggers();
      v8 = os_log_GKGeneral;
    }
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    v11 = v7;
    if (v10)
    {
      -[GKViceroyTransport playerIDFromPeerID:].cold.1();
      v11 = v7;
    }
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v12 = GKOSLoggers();
      v8 = os_log_GKGeneral;
    }
    v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    v11 = v4;
    if (v13)
    {
      -[GKViceroyTransport playerIDFromPeerID:].cold.2();
      v11 = v4;
    }
  }
  v14 = v11;

  return v14;
}

- (id)playerIDFromSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GKViceroyTransport guestSessions](self, "guestSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[GKViceroyTransport guestSessions](self, "guestSessions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "isWrappingGKSession:", v4) & 1) != 0)
        {
          v14 = v11;

          goto LABEL_11;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  id v24;
  uint8_t v26[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        -[GKViceroyTransport peerIdFromPlayer:](self, "peerIdFromPlayer:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v14, "count"))
  {
    -[GKViceroyTransport session](self, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "sendData:toPeers:withDataMode:error:", v12, v14, a5, a8);

  }
  else
  {
    v23 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v24 = GKOSLoggers();
      v23 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1BCDE3000, v23, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] sendData toPlayers: not sending to any peers", v26, 2u);
    }
    v22 = 1;
  }

  return v22;
}

- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7
{
  id v10;
  void *v11;

  v10 = a3;
  -[GKViceroyTransport session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v11, "sendDataToAllPeers:withDataMode:error:", v10, a4, a7);

  return (char)a7;
}

- (void)receiveData:(id)a3 fromPeer:(id)a4 inSession:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  GKMatchPacket *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[GKMatchPacket initWithMessage:]([GKMatchPacket alloc], "initWithMessage:", v10);

  -[GKViceroyTransport playerIDFromPeerID:](self, "playerIDFromPeerID:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[GKMatchPacket valid](v11, "valid") && -[GKMatchPacket packetType](v11, "packetType") == 4)
  {
    -[GKViceroyTransport leaderElector](self, "leaderElector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMatchPacket data](v11, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "receivedChooseHostData:fromPlayerID:", v14, v12);
  }
  else
  {
    -[GKViceroyTransport session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isWrappingGKSession:", v16) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      -[GKViceroyTransport playerIDFromSession:](self, "playerIDFromSession:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[GKViceroyTransport clientDelegate](self, "clientDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transportDidReceivePacket:fromPlayerID:remoteRecipientID:", v11, v12, v13);
  }

}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKViceroyTransport relay](self, "relay");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acceptRelayResponse:playerID:", v7, v6);

}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[GKViceroyTransport relay](self, "relay");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleRelayPushData:onlyIfPreemptive:", v6, v4);

}

- (void)preemptRelay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroyTransport relay](self, "relay");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preemptRelay:", v4);

}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = GKOSLoggers();
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v10;
    -[GKViceroyTransport playerIDFromSession:](self, "playerIDFromSession:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v8;
    v18 = 1024;
    v19 = v5;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] peer state changed - session (%@) - new state: %d - peerID: %@. Session belongs to playerID: %@", (uint8_t *)&v16, 0x26u);

  }
  -[GKViceroyTransport clientDelegate](self, "clientDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyTransport playerIDFromPeerID:](self, "playerIDFromPeerID:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connectionDidChangeWithState:playerID:", v5, v15);

}

- (void)session:(id)a3 connectionWithPeerFailed:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = (void *)os_log_GKError;
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
  {
    v14 = v12;
    objc_msgSend(v8, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKViceroyTransport playerIDFromPeerID:](self, "playerIDFromPeerID:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v15;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v10;
    _os_log_error_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_ERROR, "[GKViceroyTransport] session (%@) connection with peerID: %@ playerID: %@ failed %@", (uint8_t *)&v17, 0x2Au);

  }
  -[GKViceroyTransport clientDelegate](self, "clientDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connectionDidFailWithError:", v10);

  -[GKViceroyTransport session:peer:didChangeState:](self, "session:peer:didChangeState:", v8, v9, 3);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = (void *)os_log_GKError;
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
  {
    v11 = v9;
    objc_msgSend(v6, "sessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKViceroyTransport playerIDFromSession:](self, "playerIDFromSession:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v7;
    _os_log_error_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_ERROR, "[GKViceroyTransport] session (%@) did fail for playerID: %@ with error %@", (uint8_t *)&v14, 0x20u);

  }
  -[GKViceroyTransport clientDelegate](self, "clientDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transportDidFailWithError:", v7);

}

- (void)session:(id)a3 initiateRelay:(id)a4 forPeer:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[GKViceroyTransport playerIDFromPeerID:](self, "playerIDFromPeerID:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v10 = GKOSLoggers();
    v9 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] session initiateRelay for playerID: %@ - sessionInfo: %@", (uint8_t *)&v12, 0x16u);
  }
  -[GKViceroyTransport relay](self, "relay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionDidInitiateOrUpdateRelay:playerID:", v7, v8);

}

- (void)session:(id)a3 updateRelay:(id)a4 forPeer:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = GKOSLoggers();
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] session: %@ updateRelay: %@ forPeer: %@", (uint8_t *)&v12, 0x20u);
  }

}

- (void)session:(id)a3 networkStatisticsChanged:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[GKViceroyTransport leaderElector](self, "leaderElector");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyTransport peerIdFromPlayer:](self, "peerIdFromPlayer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "networkStatisticsDidChange:localPlayerPeerID:", v5, v7);

}

- (void)chooseBestHostingPlayerWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[GKViceroyTransport leaderElector](self, "leaderElector");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chooseBestHostingPlayerWithCompletionHandler:", v5);

}

- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  -[GKViceroyTransport session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "voiceChatWithName:players:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (GKTransportClientDelegate)clientDelegate
{
  return (GKTransportClientDelegate *)objc_loadWeakRetained((id *)&self->_weakClientDelegate);
}

- (void)setClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_weakClientDelegate, a3);
}

- (GKConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSMutableDictionary)guestConnections
{
  return self->_guestConnections;
}

- (void)setGuestConnections:(id)a3
{
  objc_storeStrong((id *)&self->_guestConnections, a3);
}

- (NSMutableDictionary)guestSessions
{
  return self->_guestSessions;
}

- (void)setGuestSessions:(id)a3
{
  objc_storeStrong((id *)&self->_guestSessions, a3);
}

- (GKViceroyLeaderElector)leaderElector
{
  return self->_leaderElector;
}

- (void)setLeaderElector:(id)a3
{
  objc_storeStrong((id *)&self->_leaderElector, a3);
}

- (GKViceroyRelay)relay
{
  return self->_relay;
}

- (void)setRelay:(id)a3
{
  objc_storeStrong((id *)&self->_relay, a3);
}

- (NSData)selfBlob
{
  return self->_selfBlob;
}

- (void)setSelfBlob:(id)a3
{
  objc_storeStrong((id *)&self->_selfBlob, a3);
}

- (GKViceroySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_selfBlob, 0);
  objc_storeStrong((id *)&self->_relay, 0);
  objc_storeStrong((id *)&self->_leaderElector, 0);
  objc_storeStrong((id *)&self->_guestSessions, 0);
  objc_storeStrong((id *)&self->_guestConnections, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_weakClientDelegate);
}

void __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1BCDE3000, v0, OS_LOG_TYPE_ERROR, "[GKViceroyTransport] Getting local connection data encountered cdxError: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)peerIdFromPlayer:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = a1;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v5, v8, "[GKViceroyTransport] Return peerID: %@, converted from player: %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_1_2();
}

- (void)peerIdFromPlayer:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v3, v6, "[GKViceroyTransport] PeerID for player: %@ not found and therefore, return playerID instead.", v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)playerIDFromPeerID:.cold.1()
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
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, (uint64_t)v1, "[GKViceroyTransport] Return playerID: %@, converted from peerID: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)playerIDFromPeerID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v0, v1, "[GKViceroyTransport] Converted peerID: %@ not found and therefore, return it as playerID", v2);
  OUTLINED_FUNCTION_2();
}

@end
