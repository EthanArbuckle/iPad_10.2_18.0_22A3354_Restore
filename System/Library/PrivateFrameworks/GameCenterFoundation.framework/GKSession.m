@implementation GKSession

- (id)initWithSessionID:(NSString *)sessionID displayName:(NSString *)name sessionMode:(GKSessionMode)mode
{
  uint64_t v5;
  NSString *v8;
  NSString *v9;
  GKSession *v10;
  GKViceroySession *v11;
  GKViceroySession *session;
  objc_super v14;

  v5 = *(_QWORD *)&mode;
  v8 = sessionID;
  v9 = name;
  v14.receiver = self;
  v14.super_class = (Class)GKSession;
  v10 = -[GKSession init](&v14, sel_init);
  if (v10)
  {
    v11 = -[GKViceroySession initWithGKSession:sessionID:displayName:sessionMode:]([GKViceroySession alloc], "initWithGKSession:sessionID:displayName:sessionMode:", v10, v8, v9, v5);
    session = v10->_session;
    v10->_session = v11;

  }
  return v10;
}

- (GKSession)initWithViceroySession:(id)a3
{
  id v5;
  GKSession *v6;
  GKSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKSession;
  v6 = -[GKSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[GKSession setSession:](self, "setSession:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GKSession;
  -[GKSession dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id v5;

  v4 = delegate;
  -[GKSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)delegate
{
  void *v2;
  void *v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)sessionID
{
  void *v2;
  void *v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDisconnectTimeout:(NSTimeInterval)disconnectTimeout
{
  id v4;

  -[GKSession session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisconnectTimeout:", disconnectTimeout);

}

- (NSTimeInterval)disconnectTimeout
{
  void *v2;
  double v3;
  double v4;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectTimeout");
  v4 = v3;

  return v4;
}

- (NSString)displayNameForPeer:(NSString *)peerID
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = peerID;
  -[GKSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameForPeer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)sendData:(NSData *)data toPeers:(NSArray *)peers withDataMode:(GKSendDataMode)mode error:(NSError *)error
{
  uint64_t v7;
  NSArray *v10;
  NSData *v11;
  void *v12;

  v7 = *(_QWORD *)&mode;
  v10 = peers;
  v11 = data;
  -[GKSession session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = objc_msgSend(v12, "sendData:toPeers:withDataMode:error:", v11, v10, v7, error);

  return (char)error;
}

- (BOOL)sendDataToAllPeers:(NSData *)data withDataMode:(GKSendDataMode)mode error:(NSError *)error
{
  uint64_t v6;
  NSData *v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  uint8_t v14[16];

  v6 = *(_QWORD *)&mode;
  v8 = data;
  if (!os_log_GKGeneral)
    v9 = GKOSLoggers();
  v10 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "GKSession: sendDataToAllPeers: withDataMode:", v14, 2u);
  }
  -[GKSession session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sendDataToAllPeers:withDataMode:error:", v8, v6, error);

  return v12;
}

- (void)setDataReceiveHandler:(id)handler withContext:(void *)context
{
  id v6;
  id v7;

  v6 = handler;
  -[GKSession session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataReceiveHandler:withContext:", v6, context);

}

- (void)connectToPeer:(NSString *)peerID withTimeout:(NSTimeInterval)timeout
{
  NSString *v6;
  id v7;

  v6 = peerID;
  -[GKSession session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectToPeer:withTimeout:", v6, timeout);

}

- (void)cancelConnectToPeer:(NSString *)peerID
{
  NSString *v4;
  id v5;

  v4 = peerID;
  -[GKSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelConnectToPeer:", v4);

}

- (BOOL)acceptConnectionFromPeer:(NSString *)peerID error:(NSError *)error
{
  NSString *v6;
  void *v7;

  v6 = peerID;
  -[GKSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = objc_msgSend(v7, "acceptConnectionFromPeer:error:", v6, error);

  return (char)error;
}

- (void)denyConnectionFromPeer:(NSString *)peerID
{
  NSString *v4;
  id v5;

  v4 = peerID;
  -[GKSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "denyConnectionFromPeer:", v4);

}

- (void)disconnectPeerFromAllPeers:(NSString *)peerID
{
  NSString *v4;
  id v5;

  v4 = peerID;
  -[GKSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectPeerFromAllPeers:", v4);

}

- (void)disconnectFromAllPeers
{
  id v2;

  -[GKSession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectFromAllPeers");

}

- (NSArray)peersWithConnectionState:(GKPeerConnectionState)state
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&state;
  -[GKSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peersWithConnectionState:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (GKSessionMode)sessionMode
{
  void *v2;
  GKSessionMode v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sessionMode");

  return v3;
}

- (BOOL)isAvailable
{
  void *v2;
  char v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAvailable");

  return v3;
}

- (void)setAvailable:(BOOL)available
{
  _BOOL8 v3;
  id v4;

  v3 = available;
  -[GKSession session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvailable:", v3);

}

- (NSString)peerID
{
  void *v2;
  void *v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isBusy
{
  void *v2;
  char v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBusy");

  return v3;
}

- (void)setBusy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GKSession session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBusy:", v3);

}

- (BOOL)isPeerBusy:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[GKSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPeerBusy:", v4);

  return v6;
}

- (void)disableWifi
{
  id v2;

  -[GKSession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableWifi");

}

- (void)setPrivateDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivateDelegate:", v4);

}

- (id)privateDelegate
{
  void *v2;
  void *v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)privateImpl
{
  void *v2;
  void *v3;

  -[GKSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viceroyInternalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
}

@end
