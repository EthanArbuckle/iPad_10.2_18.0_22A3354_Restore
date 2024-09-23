@implementation GKViceroySession

- (GKViceroySession)initWithConnection:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  GKViceroySession *v8;
  GKSession *v9;
  GKSession *gkSession;
  id v11;
  void *v12;
  uint64_t v13;
  GKSessionInternal *session;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GKViceroySession;
  v8 = -[GKViceroySession init](&v16, sel_init);
  if (v8)
  {
    v9 = -[GKSession initWithViceroySession:]([GKSession alloc], "initWithViceroySession:", v8);
    gkSession = v8->_gkSession;
    v8->_gkSession = v9;

    v11 = objc_alloc(MEMORY[0x1E0D25C80]);
    -[GKViceroySession gkSession](v8, "gkSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithConnection:session:delegate:", v6, v12, v7);
    session = v8->_session;
    v8->_session = (GKSessionInternal *)v13;

    -[GKSessionInternal setPrivateDelegate:](v8->_session, "setPrivateDelegate:", v7);
    -[GKSessionInternal setDataReceiveHandler:withContext:](v8->_session, "setDataReceiveHandler:withContext:", v7, 0);
  }

  return v8;
}

- (GKViceroySession)initWithGKSession:(id)a3 sessionID:(id)a4 displayName:(id)a5 sessionMode:(int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  GKViceroySession *v14;
  GKViceroySession *v15;
  uint64_t v16;
  GKSessionInternal *session;
  objc_super v19;

  v6 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GKViceroySession;
  v14 = -[GKViceroySession init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_gkSession, a3);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D25C80]), "initWithSessionID:displayName:session:sessionMode:", v12, v13, v11, v6);
    session = v15->_session;
    v15->_session = (GKSessionInternal *)v16;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[GKViceroySession session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataReceiveHandler:withContext:", 0, 0);

  -[GKViceroySession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[GKViceroySession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivateDelegate:", 0);

  -[GKViceroySession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  v7.receiver = self;
  v7.super_class = (Class)GKViceroySession;
  -[GKSession dealloc](&v7, sel_dealloc);
}

- (BOOL)isAvailable
{
  void *v2;
  char v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAvailable");

  return v3;
}

- (void)setAvailable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GKViceroySession session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvailable:", v3);

}

- (BOOL)isBusy
{
  void *v2;
  char v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBusy");

  return v3;
}

- (void)setBusy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GKViceroySession session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBusy:", v3);

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroySession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)delegate
{
  void *v2;
  void *v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDisconnectTimeout:(double)a3
{
  id v4;

  -[GKViceroySession session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisconnectTimeout:", a3);

}

- (double)disconnectTimeout
{
  void *v2;
  double v3;
  double v4;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectTimeout");
  v4 = v3;

  return v4;
}

- (id)displayName
{
  void *v2;
  void *v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)peerID
{
  void *v2;
  void *v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPrivateDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroySession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivateDelegate:", v4);

}

- (id)privateDelegate
{
  void *v2;
  void *v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sessionID
{
  void *v2;
  void *v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)sessionMode
{
  void *v2;
  int v3;

  -[GKViceroySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sessionMode");

  return v3;
}

- (BOOL)acceptConnectionFromPeer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[GKViceroySession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "acceptConnectionFromPeer:error:", v6, a4);

  return (char)a4;
}

- (void)cancelConnectToPeer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroySession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelConnectToPeer:", v4);

}

- (void)connectToPeer:(id)a3 withTimeout:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[GKViceroySession session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectToPeer:withTimeout:", v6, a4);

}

- (void)denyConnectionFromPeer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroySession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "denyConnectionFromPeer:", v4);

}

- (void)disableWifi
{
  id v2;

  -[GKViceroySession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWifiEnabled:", 0);

}

- (void)disconnectFromAllPeers
{
  id v2;

  -[GKViceroySession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectFromAllPeers");

}

- (void)disconnectPeerFromAllPeers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroySession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectPeerFromAllPeers:", v4);

}

- (id)displayNameForPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKViceroySession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameForPeer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPeerBusy:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[GKViceroySession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPeerBusy:", v4);

  return v6;
}

- (BOOL)isWrappingGKSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKViceroySession gkSession](self, "gkSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (id)peersWithConnectionState:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[GKViceroySession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peersWithConnectionState:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  -[GKViceroySession session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "sendData:toPeers:withDataMode:error:", v11, v10, v7, a6);

  return (char)a6;
}

- (BOOL)sendDataToAllPeers:(id)a3 withDataMode:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[GKViceroySession session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "sendDataToAllPeers:withDataMode:error:", v8, v6, a5);

  return (char)a5;
}

- (void)setDataReceiveHandler:(id)a3 withContext:(void *)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[GKViceroySession session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataReceiveHandler:withContext:", v6, a4);

}

- (id)voiceChatWithName:(id)a3 players:(id)a4
{
  id v6;
  id v7;
  GKViceroyVoiceChat *v8;
  void *v9;
  void *v10;
  void *v11;
  GKViceroyVoiceChat *v12;
  GKVoiceChat *v13;

  v6 = a4;
  v7 = a3;
  v8 = [GKViceroyVoiceChat alloc];
  -[GKViceroySession session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKViceroySession gkSession](self, "gkSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GKViceroyVoiceChat initWithName:connection:gkSession:](v8, "initWithName:connection:gkSession:", v7, v10, v11);

  v13 = -[GKVoiceChat initWithViceroyVoiceChat:players:]([GKVoiceChat alloc], "initWithViceroyVoiceChat:players:", v12, v6);
  return v13;
}

- (GKSession)gkSession
{
  return self->_gkSession;
}

- (void)setGkSession:(id)a3
{
  objc_storeStrong((id *)&self->_gkSession, a3);
}

- (GKSessionInternal)session
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
  objc_storeStrong((id *)&self->_gkSession, 0);
}

@end
