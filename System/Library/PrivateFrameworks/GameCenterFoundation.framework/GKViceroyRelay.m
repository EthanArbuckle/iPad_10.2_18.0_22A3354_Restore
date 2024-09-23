@implementation GKViceroyRelay

- (GKViceroyRelay)initWithClientDelegate:(id)a3 connection:(id)a4 matchDataDelegate:(id)a5 daemonProxy:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GKViceroyRelay *v14;
  GKViceroyRelay *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GKViceroyRelay;
  v14 = -[GKViceroyRelay init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_weakClientDelegate, v10);
    objc_storeStrong((id *)&v15->_connection, a4);
    objc_storeWeak((id *)&v15->_matchDataDelegateWeak, v12);
    objc_storeStrong((id *)&v15->_daemonProxy, a6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v15, sel_didReceiveRelayPushNotification_, CFSTR("GKRelayPushNotification"), 0);

  }
  return v15;
}

- (void)disconnect
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Accept relay response for playerID: %@ - response: %@", (uint8_t *)&v11, 0x16u);
  }
  if (-[GKViceroyRelay shouldStartRelayForPlayerID:](self, "shouldStartRelayForPlayerID:", v7))
  {
    -[GKViceroyRelay initiateRelayInfoFromServerResponse:forPlayerID:](self, "initiateRelayInfoFromServerResponse:forPlayerID:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKViceroyRelay initiateRelayConnectionForPlayerID:connectionContext:](self, "initiateRelayConnectionForPlayerID:connectionContext:", v7, v10);

  }
}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!a4)
    goto LABEL_4;
  +[GKPreferences shared](GKPreferences, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "preemptiveRelay") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
LABEL_4:
    -[GKViceroyRelay didReceiveRelayPushData:](self, "didReceiveRelayPushData:", v9);
LABEL_6:
    v8 = v9;
  }

}

- (void)preemptRelay:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Preempt relay for playerID:%@", (uint8_t *)&v9, 0xCu);
  }
  if (-[GKViceroyRelay shouldStartRelayForPlayerID:](self, "shouldStartRelayForPlayerID:", v4))
  {
    -[GKViceroyRelay matchDataDelegate](self, "matchDataDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getConnectionContextForPlayerID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKViceroyRelay requestRelayInitiateForPlayerID:connectionContext:](self, "requestRelayInitiateForPlayerID:connectionContext:", v4, v8);
  }

}

- (void)didReceiveRelayPushNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay didReceiveRelayPushData:](self, "didReceiveRelayPushData:", v4);

}

- (void)didReceiveRelayPushData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GKViceroyRelay *v9;

  v4 = a3;
  -[GKViceroyRelay clientDelegate](self, "clientDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__GKViceroyRelay_didReceiveRelayPushData___block_invoke;
  v7[3] = &unk_1E75B1350;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "relayDidReceivePushData:completionHandler:", v6, v7);

}

void __42__GKViceroyRelay_didReceiveRelayPushData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int16 v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("c"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    v3 = v8;
    switch(v5)
    {
      case 2:
        goto LABEL_5;
      case 6:
        objc_msgSend(*(id *)(a1 + 40), "updateRelayInfoFromPush:forPlayerID:", *(_QWORD *)(a1 + 32), v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "hasInitRelayInfo"))
          objc_msgSend(*(id *)(a1 + 40), "updateRelayConnectionForPlayerID:connectionContext:", v8, v7);
        goto LABEL_9;
      case 5:
LABEL_5:
        v6 = objc_msgSend(*(id *)(a1 + 40), "shouldStartRelayForPlayerID:", v8);
        v3 = v8;
        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 40), "initiateRelayInfoFromPush:forPlayerID:", *(_QWORD *)(a1 + 32), v8);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "initiateRelayConnectionForPlayerID:connectionContext:", v8, v7);
LABEL_9:

          v3 = v8;
        }
        break;
    }
  }

}

- (void)sessionDidInitiateOrUpdateRelay:(id)a3 playerID:(id)a4
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  objc_msgSend(v27, "objectForKey:", CFSTR("GKSRelayInitiateInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D25BF8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("self-blob"));

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D25C00]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("self-nat-ip"));

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D25C08]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("self-nat-type"));

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D25BC0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("peer-blob"));

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D25BC8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("peer-nat-ip"));

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D25BD0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("peer-nat-type"));

    -[GKViceroyRelay relayDidInitiateConnection:forPlayerID:](self, "relayDidInitiateConnection:forPlayerID:", v8, v6);
  }
  else
  {
    objc_msgSend(v27, "objectForKey:", CFSTR("GKSRelayUpdateInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25C40]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("relay-type"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25BB8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("relay-connection-id"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25C38]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("relay-transaction-id-alloc"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25C30]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("relay-token-alloc-res"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25BD8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("peer-relay-ip"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25BF0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("peer-relay-port"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25C10]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v22, CFSTR("self-relay-ip"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25C28]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v23, CFSTR("self-relay-port"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25C18]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v24, CFSTR("self-relay-nat-ip"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25C20]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v25, CFSTR("self-relay-nat-port"));

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D25BB0]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v26, CFSTR("client-data"));

      -[GKViceroyRelay relayDidUpdateConnection:forPlayerID:](self, "relayDidUpdateConnection:forPlayerID:", v15, v6);
    }
  }

}

- (BOOL)shouldStartRelayForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[GKViceroyRelay matchDataDelegate](self, "matchDataDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getConnectionContextForPlayerID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "relayInitiated") & 1) != 0 || (objc_msgSend(v6, "connected") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = 1;
    objc_msgSend(v6, "setRelayInitiated:", 1);
  }

  return v7;
}

- (void)relayDidInitiateConnection:(id)a3 forPlayerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[GKViceroyRelay shouldStartRelayForPlayerID:](self, "shouldStartRelayForPlayerID:", v7))
  {
    -[GKViceroyRelay matchDataDelegate](self, "matchDataDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateConnectionInfo:forPlayerID:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKViceroyRelay requestRelayInitiateForPlayerID:connectionContext:](self, "requestRelayInitiateForPlayerID:connectionContext:", v7, v9);
  }
  else
  {
    v10 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v11 = GKOSLoggers();
      v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Not starting relay for playerID: %@", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)requestRelayInitiateForPlayerID:(id)a3 connectionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  NSObject *v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("missing-client-data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v12 = GKOSLoggers();
    v11 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v11;
    *(_DWORD *)buf = 138412802;
    v37 = v6;
    v38 = 1024;
    v39 = objc_msgSend(v7, "connected");
    v40 = 1024;
    v41 = v10;
    _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Request relayInit for playerID: %@ connected: %d missingClientData: %d", buf, 0x18u);

  }
  if (((objc_msgSend(v7, "connected") ^ 1 | v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("session-token"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("session-token"));

    objc_msgSend(v7, "info");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("self-nat-ip"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("self-nat-ip"));

    objc_msgSend(v7, "info");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("self-blob"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("self-blob"));

    objc_msgSend(v7, "info");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("peer-id"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v22, CFSTR("peer-id"));

    objc_msgSend(v7, "info");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("peer-push-token"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v24, CFSTR("peer-push-token"));

    objc_msgSend(v7, "info");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("peer-nat-type"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v26, CFSTR("peer-nat-type"));

    objc_msgSend(v7, "info");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", CFSTR("peer-nat-ip"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v28, CFSTR("peer-nat-ip"));

    objc_msgSend(v7, "info");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("peer-blob"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v30, CFSTR("peer-blob"));

    v31 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v32 = GKOSLoggers();
      v31 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v31, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Client process calling method initiateRelayRequest in multiplayerService", buf, 2u);
    }
    -[GKViceroyRelay daemonProxy](self, "daemonProxy");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke;
    v34[3] = &unk_1E75B1378;
    v34[4] = self;
    v35 = v6;
    objc_msgSend(v33, "initiateRelayRequest:completionHandler:", v14, v34);

  }
}

void __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint8_t v17[16];

  v5 = a2;
  v6 = a3;
  v7 = os_log_GKGeneral;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v16 = GKOSLoggers();
      v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] initiateRelayRequest successfully returned result", v17, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "initiateRelayResponse:playerID:", v5, *(_QWORD *)(a1 + 40));
  }

}

- (id)initiateRelayInfoFromPush:(id)a3 forPlayerID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Got initRelay info from push for playerID: %@ - userInfo: %@", (uint8_t *)&v27, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("relay-type"));

  objc_msgSend(v6, "objectForKey:", CFSTR("k"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("relay-connection-id"));

  objc_msgSend(v6, "objectForKey:", CFSTR("q"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("relay-transaction-id-alloc"));

  objc_msgSend(v6, "objectForKey:", CFSTR("h"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v17, CFSTR("self-relay-ip"));

  objc_msgSend(v6, "objectForKey:", CFSTR("o"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("self-relay-port"));

  objc_msgSend(v6, "objectForKey:", CFSTR("H"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v20, CFSTR("peer-relay-ip"));

  objc_msgSend(v6, "objectForKey:", CFSTR("O"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v21, CFSTR("peer-relay-port"));

  objc_msgSend(v6, "objectForKey:", CFSTR("r"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v23, CFSTR("relay-token-alloc-req"));

  -[GKViceroyRelay matchDataDelegate](self, "matchDataDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updateConnectionInfo:forPlayerID:", v10, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)initiateRelayResponse:(id)a3 playerID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Initiate relay response for playerID: %@ - response: %@", (uint8_t *)&v11, 0x16u);
  }
  -[GKViceroyRelay initiateRelayInfoFromServerResponse:forPlayerID:](self, "initiateRelayInfoFromServerResponse:forPlayerID:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay initiateRelayConnectionForPlayerID:connectionContext:](self, "initiateRelayConnectionForPlayerID:connectionContext:", v7, v10);

}

- (id)initiateRelayInfoFromServerResponse:(id)a3 forPlayerID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
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
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v7;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Got initiateRelay info for playerID: %@ - from response: %@", (uint8_t *)&v22, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("relay-type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("relay-type"));

  objc_msgSend(v6, "objectForKey:", CFSTR("relay-connection-id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("relay-connection-id"));

  objc_msgSend(v6, "objectForKey:", CFSTR("relay-transaction-id-alloc"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("relay-transaction-id-alloc"));

  objc_msgSend(v6, "objectForKey:", CFSTR("self-relay-ip"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("self-relay-ip"));

  objc_msgSend(v6, "objectForKey:", CFSTR("self-relay-port"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("self-relay-port"));

  objc_msgSend(v6, "objectForKey:", CFSTR("peer-relay-ip"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("peer-relay-ip"));

  objc_msgSend(v6, "objectForKey:", CFSTR("peer-relay-port"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v17, CFSTR("peer-relay-port"));

  objc_msgSend(v6, "objectForKey:", CFSTR("relay-token-alloc-req"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("relay-token-alloc-req"));

  -[GKViceroyRelay matchDataDelegate](self, "matchDataDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateConnectionInfo:forPlayerID:", v10, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)initiateRelayConnectionForPlayerID:(id)a3 connectionContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8;
    v33 = 138412546;
    v34 = v6;
    v35 = 1024;
    LODWORD(v36) = objc_msgSend(v7, "connected");
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Initiate relay connection for player: %@ connected: %d", (uint8_t *)&v33, 0x12u);

  }
  if (objc_msgSend(v7, "connected"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("relay-type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D25C40]);

    objc_msgSend(v7, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("relay-connection-id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D25BB8]);

    objc_msgSend(v7, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("relay-transaction-id-alloc"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D25C38]);

    objc_msgSend(v7, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("relay-token-alloc-req"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D25C30]);

    objc_msgSend(v7, "info");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("peer-relay-ip"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D25BD8]);

    objc_msgSend(v7, "info");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("peer-relay-port"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D25BF0]);

    objc_msgSend(v7, "info");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("self-relay-ip"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D25C10]);

    objc_msgSend(v7, "info");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("self-relay-port"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D25C28]);

    v28 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v29 = GKOSLoggers();
      v28 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412546;
      v34 = v6;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_1BCDE3000, v28, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] initiateRelayWithParticipant for playerID: %@ - with relayInfo: %@", (uint8_t *)&v33, 0x16u);
    }
    -[GKViceroyRelay connection](self, "connection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("peer-blob"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "initiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:", v6, v32, v11, 0);

    objc_msgSend(v7, "setHasInitRelayInfo:", 1);
    if (objc_msgSend(v7, "hasUpdateRelayInfo"))
      -[GKViceroyRelay updateRelayConnectionForPlayerID:connectionContext:](self, "updateRelayConnectionForPlayerID:connectionContext:", v6, v7);

  }
}

- (void)relayDidUpdateConnection:(id)a3 forPlayerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[GKViceroyRelay matchDataDelegate](self, "matchDataDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConnectionInfo:forPlayerID:", v7, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[GKViceroyRelay requestRelayUpdateForPlayerID:connectionContext:](self, "requestRelayUpdateForPlayerID:connectionContext:", v6, v9);
}

- (id)updateRelayInfoFromPush:(id)a3 forPlayerID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412546;
    v27 = v7;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Got updateRelay info for playerID: %@ - userInfo: %@", (uint8_t *)&v26, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("relay-type"));

  objc_msgSend(v6, "objectForKey:", CFSTR("k"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("relay-connection-id"));

  objc_msgSend(v6, "objectForKey:", CFSTR("q"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("relay-transaction-id-chan-bind"));

  objc_msgSend(v6, "objectForKey:", CFSTR("r"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v17, CFSTR("relay-token-chan-bind"));

  objc_msgSend(v6, "objectForKey:", CFSTR("U"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("peer-relay-nat-ip"));

  objc_msgSend(v6, "objectForKey:", CFSTR("V"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v20, CFSTR("peer-relay-nat-port"));

  objc_msgSend(v6, "objectForKey:", CFSTR("L"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroyRelay dataFromBase64String:](self, "dataFromBase64String:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v22, CFSTR("client-data"));

  -[GKViceroyRelay matchDataDelegate](self, "matchDataDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateConnectionInfo:forPlayerID:", v10, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setHasUpdateRelayInfo:", 1);
  return v24;
}

- (void)requestRelayUpdateForPlayerID:(id)a3 connectionContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8;
    *(_DWORD *)buf = 138412546;
    v46 = v6;
    v47 = 1024;
    v48 = objc_msgSend(v7, "connected");
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Request relayUpdate for playerID: %@ connected: %d", buf, 0x12u);

  }
  if (objc_msgSend(v7, "connected"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("session-token"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("session-token"));

    objc_msgSend(v7, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("peer-id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("peer-id"));

    objc_msgSend(v7, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("peer-push-token"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("peer-push-token"));

    objc_msgSend(v7, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("relay-type"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("relay-type"));

    objc_msgSend(v7, "info");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("relay-connection-id"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v21, CFSTR("relay-connection-id"));

    objc_msgSend(v7, "info");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("relay-transaction-id-alloc"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v23, CFSTR("relay-transaction-id-alloc"));

    objc_msgSend(v7, "info");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", CFSTR("self-relay-ip"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v25, CFSTR("self-relay-ip"));

    objc_msgSend(v7, "info");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("self-relay-port"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v27, CFSTR("self-relay-port"));

    objc_msgSend(v7, "info");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("peer-relay-ip"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v29, CFSTR("peer-relay-ip"));

    objc_msgSend(v7, "info");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("peer-relay-port"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v31, CFSTR("peer-relay-port"));

    objc_msgSend(v7, "info");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("self-relay-nat-ip"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v33, CFSTR("self-relay-nat-ip"));

    objc_msgSend(v7, "info");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("self-relay-nat-port"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v35, CFSTR("self-relay-nat-port"));

    objc_msgSend(v7, "info");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", CFSTR("relay-token-alloc-res"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v37, CFSTR("relay-token-alloc-res"));

    objc_msgSend(v7, "info");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", CFSTR("client-data"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v39, CFSTR("self-relay-blob"));

    v40 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v41 = GKOSLoggers();
      v40 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v6;
      _os_log_impl(&dword_1BCDE3000, v40, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Calling update relay request for playerID: %@", buf, 0xCu);
    }
    -[GKViceroyRelay daemonProxy](self, "daemonProxy");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke;
    v43[3] = &unk_1E75B13A0;
    v44 = v6;
    objc_msgSend(v42, "updateRelayRequest:completionHandler:", v11, v43);

  }
}

void __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_GKGeneral;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    v9 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      v16 = GKOSLoggers();
      v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] updateRelayRequest succeeded for playerID: %@", (uint8_t *)&v18, 0xCu);
    }
  }

}

- (void)updateRelayConnectionForPlayerID:(id)a3 connectionContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8;
    v35 = 138412546;
    v36 = v6;
    v37 = 1024;
    LODWORD(v38) = objc_msgSend(v7, "connected");
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Update relay connection for playerID: %@ connected: %d", (uint8_t *)&v35, 0x12u);

  }
  if (objc_msgSend(v7, "connected"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("relay-type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D25C40]);

    objc_msgSend(v7, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("relay-connection-id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D25BB8]);

    objc_msgSend(v7, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("relay-transaction-id-chan-bind"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D25C38]);

    objc_msgSend(v7, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("relay-token-chan-bind"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D25C30]);

    objc_msgSend(v7, "info");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("peer-relay-nat-ip"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D25BE0]);

    objc_msgSend(v7, "info");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("peer-relay-nat-port"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D25BE8]);

    objc_msgSend(v7, "info");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("client-data"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D25BB0]);

    objc_msgSend(v7, "info");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("peer-relay-ip"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D25BD8]);

    objc_msgSend(v7, "info");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("peer-relay-port"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D25BF0]);

    v30 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v31 = GKOSLoggers();
      v30 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 138412546;
      v36 = v6;
      v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_1BCDE3000, v30, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] updateRelayConnectionForPlayer for playerID: %@ - with relayInfo: %@", (uint8_t *)&v35, 0x16u);
    }
    -[GKViceroyRelay connection](self, "connection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("peer-blob"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "updateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:", v6, v34, v11, 0);

  }
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

- (GKTransportMatchDataDelegate)matchDataDelegate
{
  return (GKTransportMatchDataDelegate *)objc_loadWeakRetained((id *)&self->_matchDataDelegateWeak);
}

- (void)setMatchDataDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_matchDataDelegateWeak, a3);
}

- (GKMultiplayerDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_daemonProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_destroyWeak((id *)&self->_matchDataDelegateWeak);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_weakClientDelegate);
}

void __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "[GKViceroyRelay] initiateRelayRequest returned an error: %@", a5, a6, a7, a8, 2u);
}

void __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "[GKViceroyRelay] updateRelayRequest error: %@", a5, a6, a7, a8, 2u);
}

@end
