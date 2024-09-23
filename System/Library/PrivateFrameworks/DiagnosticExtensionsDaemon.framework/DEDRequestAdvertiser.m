@implementation DEDRequestAdvertiser

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_22);
  return (id)sharedInstance_sharedInstance_1;
}

void __38__DEDRequestAdvertiser_sharedInstance__block_invoke()
{
  DEDRequestAdvertiser *v0;
  void *v1;

  v0 = objc_alloc_init(DEDRequestAdvertiser);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (id)displayName
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[DEDRequestAdvertiser hostIdentifier](self, "hostIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[DEDRequestAdvertiser hostIdentifier](self, "hostIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[DEDRequestAdvertiser hostIdentifier](self, "hostIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDUtils deviceName](DEDUtils, "deviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ @ %@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[DEDUtils deviceName](DEDUtils, "deviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)start
{
  id v3;
  void *v4;
  MCPeerID *v5;
  MCPeerID *peerID;
  id v7;
  void *v8;
  MCNearbyServiceAdvertiser *v9;
  MCNearbyServiceAdvertiser *advertiser;
  id v11;
  void *v12;
  MCSession *v13;
  MCSession *session;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];

  if (+[DEDUtils isDebugRequestsEnabled](DEDUtils, "isDebugRequestsEnabled") && !self->_session)
  {
    v3 = objc_alloc(MEMORY[0x24BDDE728]);
    -[DEDRequestAdvertiser displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (MCPeerID *)objc_msgSend(v3, "initWithDisplayName:", v4);
    peerID = self->_peerID;
    self->_peerID = v5;

    v7 = objc_alloc(MEMORY[0x24BDDE720]);
    -[DEDRequestAdvertiser peerID](self, "peerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (MCNearbyServiceAdvertiser *)objc_msgSend(v7, "initWithPeer:discoveryInfo:serviceType:", v8, 0, CFSTR("apple-frdb"));
    advertiser = self->_advertiser;
    self->_advertiser = v9;

    -[MCNearbyServiceAdvertiser setDelegate:](self->_advertiser, "setDelegate:", self);
    v11 = objc_alloc(MEMORY[0x24BDDE730]);
    -[DEDRequestAdvertiser peerID](self, "peerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (MCSession *)objc_msgSend(v11, "initWithPeer:securityIdentity:encryptionPreference:", v12, 0, 0);
    session = self->_session;
    self->_session = v13;

    -[MCSession setDelegate:](self->_session, "setDelegate:", self);
    -[DEDRequestAdvertiser advertiser](self, "advertiser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startAdvertisingPeer");

    Log_3();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21469E000, v16, OS_LOG_TYPE_INFO, "Request advertiser started", v17, 2u);
    }

  }
}

- (void)stop
{
  MCPeerID *peerID;
  void *v4;
  void *v5;
  MCNearbyServiceAdvertiser *advertiser;
  MCSession *session;
  NSObject *v8;
  uint8_t v9[16];

  peerID = self->_peerID;
  self->_peerID = 0;

  -[DEDRequestAdvertiser advertiser](self, "advertiser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAdvertisingPeer");

  -[DEDRequestAdvertiser session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnect");

  advertiser = self->_advertiser;
  self->_advertiser = 0;

  session = self->_session;
  self->_session = 0;

  Log_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "Request advertiser stopped", v9, 2u);
  }

}

- (void)broadcastRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  if (+[DEDUtils isDebugRequestsEnabled](DEDUtils, "isDebugRequestsEnabled"))
  {
    -[DEDRequestAdvertiser encodeRequestRecordAsJSON:](self, "encodeRequestRecordAsJSON:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[DEDRequestAdvertiser session](self, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDRequestAdvertiser session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "connectedPeers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      objc_msgSend(v6, "sendData:toPeers:withMode:error:", v5, v8, 0, &v11);
      v9 = v11;

      if (v9)
      {
        Log_3();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[DEDRequestAdvertiser broadcastRecord:].cold.2(v4);

      }
    }
    else
    {
      Log_3();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[DEDRequestAdvertiser broadcastRecord:].cold.1(v4);
    }

  }
}

- (void)sendRecord:(id)a3 toPeer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (+[DEDUtils isDebugRequestsEnabled](DEDUtils, "isDebugRequestsEnabled"))
  {
    -[DEDRequestAdvertiser encodeRequestRecordAsJSON:](self, "encodeRequestRecordAsJSON:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[DEDRequestAdvertiser session](self, "session");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v9, "sendData:toPeers:withMode:error:", v8, v10, 0, &v13);
      v11 = v13;

      if (v11)
      {
        Log_3();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[DEDRequestAdvertiser sendRecord:toPeer:].cold.2(v6, v7);

      }
    }
    else
    {
      Log_3();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DEDRequestAdvertiser sendRecord:toPeer:].cold.1(v6);
    }

  }
}

- (id)encodeRequestRecordAsJSON:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v26;
  id v27;
  _QWORD v28[8];
  _QWORD v29[10];

  v29[8] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (encodeRequestRecordAsJSON__onceToken != -1)
    dispatch_once(&encodeRequestRecordAsJSON__onceToken, &__block_literal_global_10);
  v28[0] = CFSTR("URL");
  objc_msgSend(v3, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  v28[1] = CFSTR("date");
  v4 = (void *)encodeRequestRecordAsJSON__dateFormatter;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v6;
  v28[2] = CFSTR("method");
  objc_msgSend(v3, "method");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v7;
  v28[3] = CFSTR("isFailure");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isFailure"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v8;
  v28[4] = CFSTR("requestHeader");
  objc_msgSend(v3, "requestHeader");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_24D1E6AF0;
  v29[4] = v11;
  v28[5] = CFSTR("requestBody");
  objc_msgSend(v3, "requestBody");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_24D1E6AF0;
  v29[5] = v14;
  v28[6] = CFSTR("responseHeader");
  objc_msgSend(v3, "responseHeader");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_24D1E6AF0;
  v29[6] = v17;
  v28[7] = CFSTR("responseBody");
  objc_msgSend(v3, "responseBody");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_24D1E6AF0;
  v29[7] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v21, 0, &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  if (v23)
  {
    Log_3();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[DEDRequestAdvertiser encodeRequestRecordAsJSON:].cold.1(v3, v23);

  }
  return v22;
}

void __50__DEDRequestAdvertiser_encodeRequestRecordAsJSON___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)encodeRequestRecordAsJSON__dateFormatter;
  encodeRequestRecordAsJSON__dateFormatter = v0;

}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v7 = a4;
  if (a5 == 2)
  {
    v10 = v7;
    -[DEDRequestAdvertiser onPeerJoin](self, "onPeerJoin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v10;
    if (v8)
    {
      -[DEDRequestAdvertiser onPeerJoin](self, "onPeerJoin");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v9)[2](v9, v10);

      v7 = v10;
    }
  }

}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t, uint64_t);
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, uint64_t, uint64_t))a6;
  v10 = +[DEDUtils isDebugRequestsEnabled](DEDUtils, "isDebugRequestsEnabled");
  Log_3();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      objc_msgSend(v8, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Connecting to Request Debugger: [%@]", (uint8_t *)&v16, 0xCu);

    }
    -[DEDRequestAdvertiser session](self, "session");
    v14 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 1, v14);

    v9 = (void (**)(id, uint64_t, uint64_t))v14;
  }
  else
  {
    if (v12)
    {
      objc_msgSend(v8, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Debug requests are disabled, but we got an invitation from [%@]", (uint8_t *)&v16, 0xCu);

    }
    v9[2](v9, 0, 0);
  }

}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostIdentifier, a3);
}

- (id)onPeerJoin
{
  return self->_onPeerJoin;
}

- (void)setOnPeerJoin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MCSession)session
{
  return (MCSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MCPeerID)peerID
{
  return (MCPeerID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MCNearbyServiceAdvertiser)advertiser
{
  return (MCNearbyServiceAdvertiser *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdvertiser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_onPeerJoin, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)broadcastRecord:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "Error encoding request record to send for [%@].", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (void)broadcastRecord:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "Error sending request record for [%@].", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (void)sendRecord:(void *)a1 toPeer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "Error encoding request record to send for [%@]", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (void)sendRecord:(void *)a1 toPeer:(void *)a2 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v5, v6, "Error sending request record for [%@] to [%@]", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

- (void)encodeRequestRecordAsJSON:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v5, v6, "Error encoding request record for [%@]: [%@]", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

@end
