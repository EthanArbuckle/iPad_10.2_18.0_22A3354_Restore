@implementation MCNearbyDiscoveryPeer

- (MCNearbyDiscoveryPeer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCNearbyDiscoveryPeer;
  -[MCNearbyDiscoveryPeer doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (MCNearbyDiscoveryPeer)initWithPeerID:(id)a3
{
  MCNearbyDiscoveryPeer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCNearbyDiscoveryPeer;
  v4 = -[MCNearbyDiscoveryPeer init](&v6, sel_init);
  if (v4)
  {
    v4->_peerID = (MCPeerID *)objc_msgSend(a3, "copy");
    v4->_sendDataBuffer = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MCNearbyDiscoveryPeer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = mcdp_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating peer [%@].", buf, 0xCu);
  }
  -[MCNearbyDiscoveryPeer flushDataBuffer](self, "flushDataBuffer");

  -[MCNearbyDiscoveryPeerConnection invalidate](self->_connection, "invalidate");
  self->_connection = 0;
  -[MCNearbyDiscoveryPeerConnection invalidate](self->_trialConnection, "invalidate");

  self->_trialConnection = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCNearbyDiscoveryPeer;
  -[MCNearbyDiscoveryPeer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[MCPeerID displayNameAndPID](-[MCNearbyDiscoveryPeer peerID](self, "peerID"), "displayNameAndPID");
}

- (void)attachConnection:(id)a3
{
  -[MCNearbyDiscoveryPeer setConnection:](self, "setConnection:");
  if (-[MCNearbyDiscoveryPeer trialConnection](self, "trialConnection") != a3)
    -[MCNearbyDiscoveryPeerConnection invalidate](-[MCNearbyDiscoveryPeer trialConnection](self, "trialConnection"), "invalidate");
  -[MCNearbyDiscoveryPeer setTrialConnection:](self, "setTrialConnection:", 0);
}

- (void)closeConnection
{
  -[MCNearbyDiscoveryPeerConnection invalidate](-[MCNearbyDiscoveryPeer connection](self, "connection"), "invalidate");
  -[MCNearbyDiscoveryPeer setConnection:](self, "setConnection:", 0);
}

- (void)invalidate
{
  -[MCNearbyDiscoveryPeerConnection invalidate](self->_connection, "invalidate");
  -[MCNearbyDiscoveryPeerConnection invalidate](self->_trialConnection, "invalidate");
}

- (id)stringForState:(int)a3
{
  NSObject *v6;
  int v7;
  MCNearbyDiscoveryPeer *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 3)
    return *(&off_24C8411F0 + a3);
  v6 = mcdp_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 1024;
    v10 = a3;
    _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "Peer [%@] unrecognized state [%d].", (uint8_t *)&v7, 0x12u);
  }
  return CFSTR("unknown");
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  if (self->_state == 2)
    -[MCNearbyDiscoveryPeerConnection sendData:withCompletionHandler:](self->_connection, "sendData:withCompletionHandler:", a3, a4);
  else
    -[NSMutableArray addObject:](self->_sendDataBuffer, "addObject:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, CFSTR("NSNearbyDiscoveryPeerSendDataKey"), a4, CFSTR("NSNearbyDiscoveryPeerSendCompletionHandlerKey"), 0));
}

- (void)flushDataBuffer
{
  NSObject *v3;
  int v4;
  NSMutableArray *sendDataBuffer;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  int v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint8_t v28[128];
  uint8_t buf[4];
  MCNearbyDiscoveryPeer *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_state == 2)
  {
    v3 = mcdp_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[NSMutableArray count](self->_sendDataBuffer, "count");
      *(_DWORD *)buf = 138412546;
      v30 = self;
      v31 = 1024;
      v32 = v4;
      _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Peer [%@] relaying buffered data (%d sendData calls) to the peer connection object).", buf, 0x12u);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    sendDataBuffer = self->_sendDataBuffer;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sendDataBuffer, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(sendDataBuffer);
          -[MCNearbyDiscoveryPeerConnection sendData:withCompletionHandler:](self->_connection, "sendData:withCompletionHandler:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "objectForKey:", CFSTR("NSNearbyDiscoveryPeerSendDataKey")), objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "objectForKey:", CFSTR("NSNearbyDiscoveryPeerSendCompletionHandlerKey")));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sendDataBuffer, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }
  }
  else if (-[NSMutableArray count](self->_sendDataBuffer, "count"))
  {
    v10 = mcdp_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[NSMutableArray count](self->_sendDataBuffer, "count");
      *(_DWORD *)buf = 138412546;
      v30 = self;
      v31 = 1024;
      v32 = v11;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Peer [%@] failed to send [%d] messages.", buf, 0x12u);
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = self->_sendDataBuffer;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      v16 = *MEMORY[0x24BDD0FC8];
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "objectForKey:", CFSTR("NSNearbyDiscoveryPeerSendCompletionHandlerKey"));
          if (v18)
            (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NSNearbyDiscoveryPeer"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Peer doesn't have a connection object"), v16)));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }
  }
  -[NSMutableArray removeAllObjects](self->_sendDataBuffer, "removeAllObjects");
}

- (NSNetService)netService
{
  return self->_netService;
}

- (void)setNetService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MCNearbyDiscoveryPeerConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (MCNearbyDiscoveryPeerConnection)trialConnection
{
  return self->_trialConnection;
}

- (void)setTrialConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)sendDataBuffer
{
  return self->_sendDataBuffer;
}

- (void)setSendDataBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
