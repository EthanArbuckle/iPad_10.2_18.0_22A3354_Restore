@implementation MCNearbyServiceAdvertiser

- (MCNearbyServiceAdvertiser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCNearbyServiceAdvertiser;
  -[MCNearbyServiceAdvertiser doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (MCNearbyServiceAdvertiser)initWithPeer:(MCPeerID *)myPeerID discoveryInfo:(NSDictionary *)info serviceType:(NSString *)serviceType
{
  MCNearbyServiceAdvertiser *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSData *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MCNearbyServiceAdvertiser;
  v8 = -[MCNearbyServiceAdvertiser init](&v23, sel_init);
  if (v8)
  {
    v8->_peers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8->_invites = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (!myPeerID)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = (objc_class *)objc_opt_class();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("A nil %@ object passed to %@"), v12, NSStringFromClass(v13));
    }
    v8->_myPeerID = (MCPeerID *)-[MCPeerID copy](myPeerID, "copy");
    if (!+[MCNearbyServiceUtils isServiceTypeValid:](MCNearbyServiceUtils, "isServiceTypeValid:", serviceType))
    {
      v14 = (void *)MEMORY[0x24BDBCE88];
      v15 = *MEMORY[0x24BDBCAB8];
      v16 = (objc_class *)objc_opt_class();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Invalid serviceType passed to %@"), NSStringFromClass(v16));
    }
    v8->_serviceType = (NSString *)-[NSString copy](serviceType, "copy");
    v8->_formattedServiceType = (NSString *)objc_msgSend(+[MCNearbyServiceUtils formattedServiceType:](MCNearbyServiceUtils, "formattedServiceType:", serviceType), "copy");
    v8->_discoveryInfo = (NSDictionary *)-[NSDictionary copy](info, "copy");
    v17 = (NSData *)-[MCNearbyServiceAdvertiser txtRecordDataWithDiscoveryInfo:](v8, "txtRecordDataWithDiscoveryInfo:", info);
    v8->_TXTRecordData = v17;
    if (!v17)
    {
      v18 = (void *)MEMORY[0x24BDBCE88];
      v19 = *MEMORY[0x24BDBCAB8];
      v20 = (objc_class *)objc_opt_class();
      objc_msgSend(v18, "raise:format:", v19, CFSTR("Invalid discoveryInfo passed to %@"), NSStringFromClass(v20));
    }
    v8->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCNearbyServiceAdvertiser.syncQueue", 0);
    v21 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel_applicationWillEnterForegroundNotification_, *MEMORY[0x24BDF75D0], 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel_applicationWillTerminateNotification_, *MEMORY[0x24BDF75E0], 0);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[NSNetService setDelegate:](self->_networkServer, "setDelegate:", 0);
  -[NSNetService stop](self->_networkServer, "stop");

  objc_storeWeak((id *)&self->_delegate, 0);
  dispatch_release((dispatch_object_t)self->_syncQueue);
  v3.receiver = self;
  v3.super_class = (Class)MCNearbyServiceAdvertiser;
  -[MCNearbyServiceAdvertiser dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  MCPeerID *v6;
  NSDictionary *v7;
  NSString *v8;
  objc_class *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID");
  v7 = -[MCNearbyServiceAdvertiser discoveryInfo](self, "discoveryInfo");
  v8 = -[MCNearbyServiceAdvertiser serviceType](self, "serviceType");
  -[MCNearbyServiceAdvertiser delegate](self, "delegate");
  v9 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p MyPeerID = %@ DiscoveryInfo = %@ ServiceType = %@ Delegate = <%@: %p>>"), v5, self, v6, v7, v8, NSStringFromClass(v9), -[MCNearbyServiceAdvertiser delegate](self, "delegate"));
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (id)makeTXTRecordDataWithDiscoveryInfo:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", -[MCPeerID displayName](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "displayName"), CFSTR("_d"));
  if (a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_msgSend(a3, "allKeys");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v11 = objc_msgSend(a3, "objectForKey:", v10);
          if (objc_msgSend(v10, "hasPrefix:", CFSTR("_")))
            v10 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("_"), v10);
          objc_msgSend(v4, "setObject:forKey:", v11, v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
  }
  return (id)objc_msgSend(MEMORY[0x24BDB7460], "dataFromTXTRecordDictionary:", v4);
}

- (id)txtRecordDataWithDiscoveryInfo:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_msgSend(a3, "allKeys", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return 0;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
  return -[MCNearbyServiceAdvertiser makeTXTRecordDataWithDiscoveryInfo:](self, "makeTXTRecordDataWithDiscoveryInfo:", a3);
}

- (void)parseIDString:(id *)a3 displayName:(id *)a4 fromIdentifier:(id)a5
{
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a5);
  if (objc_msgSend(v8, "scanUpToString:intoString:", CFSTR("+"), a3))
  {
    if (objc_msgSend(v8, "scanString:intoString:", CFSTR("+"), 0))
    {
      if ((objc_msgSend(v8, "scanUpToString:intoString:", CFSTR("+"), a4) & 1) != 0)
        return;
      v9 = 3;
    }
    else
    {
      v9 = 2;
    }
  }
  else
  {
    v9 = 1;
  }
  v10 = mcadvertiser_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = a5;
    v13 = 1024;
    v14 = v9;
    _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Identifier [%@] failed to parse at %d.", (uint8_t *)&v11, 0x12u);
  }
}

- (void)syncStartAdvertisingPeer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSString *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  NSString *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!-[MCNearbyServiceAdvertiser isAdvertising](self, "isAdvertising"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (void *)-[NSMutableDictionary allValues](self->_peers, "allValues", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7++), "invalidate");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v5);
    }
    -[NSMutableDictionary removeAllObjects](self->_peers, "removeAllObjects");
    if (!-[MCNearbyServiceAdvertiser networkServer](self, "networkServer"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7460]), "initWithDomain:type:name:port:", CFSTR("local."), -[MCNearbyServiceAdvertiser formattedServiceType](self, "formattedServiceType"), -[MCPeerID idString](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "idString"), 0);
      objc_msgSend(v8, "setDelegate:", self);
      if (!-[MCNearbyServiceAdvertiser isAWDLDisabled](self, "isAWDLDisabled"))
        objc_msgSend(v8, "setIncludesPeerToPeer:", 1);
      -[MCNearbyServiceAdvertiser setNetworkServer:](self, "setNetworkServer:", v8);
      -[NSNetService setTXTRecordData:](-[MCNearbyServiceAdvertiser networkServer](self, "networkServer"), "setTXTRecordData:", -[MCNearbyServiceAdvertiser TXTRecordData](self, "TXTRecordData"));
      v9 = objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      objc_msgSend(v8, "scheduleInRunLoop:forMode:", v9, *MEMORY[0x24BDBCB80]);

    }
    -[NSNetService publishWithOptions:](-[MCNearbyServiceAdvertiser networkServer](self, "networkServer"), "publishWithOptions:", 2);
    -[MCNearbyServiceAdvertiser setIsAdvertising:](self, "setIsAdvertising:", 1);
    v10 = mcadvertiser_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[MCPeerID displayNameAndPID](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "displayNameAndPID");
      v12 = -[MCNearbyServiceAdvertiser formattedServiceType](self, "formattedServiceType");
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Start advertising peer [%@] type [%@].", buf, 0x16u);
    }
  }
}

- (void)startAdvertisingPeer
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MCNearbyServiceAdvertiser_startAdvertisingPeer__block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __49__MCNearbyServiceAdvertiser_startAdvertisingPeer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncStartAdvertisingPeer");
}

- (void)syncStopAdvertisingPeer
{
  NSObject *v3;
  int v4;
  id v5;
  __int16 v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[MCNearbyServiceAdvertiser isAdvertising](self, "isAdvertising"))
  {
    if (-[MCNearbyServiceAdvertiser networkServer](self, "networkServer"))
    {
      -[NSNetService setDelegate:](-[MCNearbyServiceAdvertiser networkServer](self, "networkServer"), "setDelegate:", 0);
      -[NSNetService stop](-[MCNearbyServiceAdvertiser networkServer](self, "networkServer"), "stop");
      -[MCNearbyServiceAdvertiser setNetworkServer:](self, "setNetworkServer:", 0);
    }
    -[MCNearbyServiceAdvertiser setIsAdvertising:](self, "setIsAdvertising:", 0);
    v3 = mcadvertiser_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412546;
      v5 = -[MCPeerID displayNameAndPID](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "displayNameAndPID");
      v6 = 2112;
      v7 = -[MCNearbyServiceAdvertiser formattedServiceType](self, "formattedServiceType");
      _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Stop advertising peer [%@] type [%@].", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)stopAdvertisingPeer
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__MCNearbyServiceAdvertiser_stopAdvertisingPeer__block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __48__MCNearbyServiceAdvertiser_stopAdvertisingPeer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncStopAdvertisingPeer");
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__MCNearbyServiceAdvertiser_applicationDidEnterBackgroundNotification___block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __71__MCNearbyServiceAdvertiser_applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isAdvertising");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setWasAdvertising:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "syncStopAdvertisingPeer");
  }
  return result;
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__MCNearbyServiceAdvertiser_applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __72__MCNearbyServiceAdvertiser_applicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wasAdvertising");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setWasAdvertising:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "syncStartAdvertisingPeer");
  }
  return result;
}

- (void)syncAttachConnection:(id)a3 toPeer:(id)a4
{
  objc_msgSend(a4, "attachConnection:", a3);
  objc_msgSend(a4, "setState:", 2);
  objc_msgSend(a4, "flushDataBuffer");
}

- (void)syncCloseConnectionForPeer:(id)a3
{
  objc_msgSend(a3, "closeConnection");
  objc_msgSend(a3, "setState:", 0);
}

- (void)syncSendDictionary:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  void (**v8)(id, _QWORD);
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v8 = (void (**)(id, _QWORD))(id)objc_msgSend(a5, "copy");
  v9 = objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v12);
  if (v9)
  {
    v10 = v9;
    v11 = mcadvertiser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = a3;
      v15 = 2112;
      v16 = a4;
      _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Sending dictionary %@ to peer %@.", buf, 0x16u);
    }
    -[MCNearbyServiceAdvertiser syncSendData:toPeer:withCompletionHandler:](self, "syncSendData:toPeer:withCompletionHandler:", v10, a4, v8);
  }
  else if (v8)
  {
    v8[2](v8, v12);
  }
}

- (void)syncHandleInvite:(id)a3 fromPeer:(id)a4
{
  uint64_t v7;
  MCPeerID *v8;
  uint64_t v9;
  MCPeerID *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[10];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceSenderPeerIDKey"));
  v8 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", v7);
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceRecipientPeerIDKey"));
  v10 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", v9);
  v11 = mcadvertiser_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = a4;
    v18 = 2112;
    v19 = objc_msgSend((id)objc_msgSend(a4, "peerID"), "displayName");
    _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Got invite from peer[%@] for peer[%@].", buf, 0x16u);
  }
  if (-[MCPeerID isEqual:](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "isEqual:", v10))
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "peerID"), "isEqual:", v8) & 1) != 0)
    {
      v12 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceInviteContextKey"));
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke;
      v15[3] = &unk_24C841090;
      v15[4] = a4;
      v15[5] = a3;
      v15[6] = v9;
      v15[7] = v7;
      v15[8] = self;
      v15[9] = v12;
      dispatch_async(MEMORY[0x24BDAC9B8], v15);
    }
    else
    {
      v14 = mcadvertiser_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MCNearbyServiceAdvertiser syncHandleInvite:fromPeer:].cold.1();
    }
  }
  else
  {
    v13 = mcadvertiser_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MCNearbyServiceAdvertiser syncHandleInvite:fromPeer:].cold.2();
  }
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[4];
  __int128 v4;
  __int128 v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2;
  v3[3] = &unk_24C841068;
  v1 = *(_OWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = v1;
  v6 = *(id *)(a1 + 64);
  return objc_msgSend((id)objc_msgSend(v6, "delegate"), "advertiser:didReceiveInvitationFromPeer:withContext:invitationHandler:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "peerID"), *(_QWORD *)(a1 + 72), v3);
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD block[6];
  __int128 v19;
  _QWORD v20[4];
  int8x16_t v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = mcadvertiser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "Invitation handler called.", buf, 2u);
  }
  v7 = mcadvertiser_log();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a3 && a2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Invitation accepted.", buf, 2u);
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "peerID");
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_38;
    v20[3] = &unk_24C841040;
    v10 = *(_OWORD *)(a1 + 48);
    v21 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    v22 = v10;
    v23 = *(_QWORD *)(a1 + 64);
    v24 = a3;
    return objc_msgSend(a3, "nearbyConnectionDataForPeer:withCompletionHandler:", v9, v20);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 67109378;
      v28 = a2;
      v29 = 2112;
      v30 = a3;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Invitation declined (accept=%d, session=%@).", buf, 0x12u);
    }
    v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "myPeerID"), "serializedRepresentation");
    v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerID"), "serializedRepresentation");
    v25[0] = CFSTR("MCNearbyServiceMessageIDKey");
    v26[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
    v26[1] = v12;
    v25[1] = CFSTR("MCNearbyServiceSenderPeerIDKey");
    v25[2] = CFSTR("MCNearbyServiceRecipientPeerIDKey");
    v26[2] = v13;
    v25[3] = CFSTR("MCNearbyServiceAcceptInviteKey");
    v26[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v25[4] = CFSTR("MCNearbyServiceInviteIDKey");
    v26[4] = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("MCNearbyServiceInviteIDKey"));
    v14 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(NSObject **)(v15 + 88);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_47;
    block[3] = &unk_24C8407C0;
    block[4] = v15;
    block[5] = v14;
    v19 = *(_OWORD *)(a1 + 32);
    dispatch_async(v16, block);
    v17 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("MCNearbyServiceInviteIDKey"));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 96), "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("from:%@=%@"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerID"), "displayName"), v17));
  }
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[6];
  int8x16_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[6];
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("MCNearbyServiceInviteIDKey"));
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("from:%@=%@"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "peerID"), "displayName"), v4);
    v22[0] = CFSTR("MCNearbyServiceMessageIDKey");
    v23 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
    v22[1] = CFSTR("MCNearbyServiceSenderPeerIDKey");
    v22[2] = CFSTR("MCNearbyServiceRecipientPeerIDKey");
    v24 = *(_OWORD *)(a1 + 48);
    v22[3] = CFSTR("MCNearbyServiceAcceptInviteKey");
    v25 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v26 = a2;
    v22[4] = CFSTR("MCNearbyServiceConnectionDataKey");
    v22[5] = CFSTR("MCNearbyServiceInviteIDKey");
    v27 = v4;
    v6 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, v22, 6);
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(NSObject **)(v7 + 88);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_43;
    block[3] = &unk_24C8407C0;
    block[4] = v7;
    block[5] = v6;
    v19 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    dispatch_async(v8, block);
    v20[0] = CFSTR("MCNearbyServiceRecipientPeerIDKey");
    v9 = objc_msgSend(*(id *)(a1 + 40), "peerID");
    v20[1] = CFSTR("MCNearbyServiceSessionKey");
    v21[0] = v9;
    v21[1] = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 96), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2), v5);
  }
  else
  {
    v10 = mcadvertiser_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_38_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_43(int8x16_t *a1)
{
  uint64_t v1;
  void *v2;
  int8x16_t v3;
  _QWORD v5[4];
  int8x16_t v6;

  v2 = (void *)a1[2].i64[0];
  v1 = a1[2].i64[1];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_44;
  v5[3] = &unk_24C841018;
  v3 = a1[3];
  v6 = vextq_s8(v3, v3, 8uLL);
  return objc_msgSend(v2, "syncSendDictionary:toPeer:withCompletionHandler:", v1, v3.i64[0], v5);
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_44(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = mcadvertiser_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_44_cold_1();
  }
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_47(int8x16_t *a1)
{
  uint64_t v1;
  void *v2;
  int8x16_t v3;
  _QWORD v5[4];
  int8x16_t v6;

  v2 = (void *)a1[2].i64[0];
  v1 = a1[2].i64[1];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_48;
  v5[3] = &unk_24C841018;
  v3 = a1[3];
  v6 = vextq_s8(v3, v3, 8uLL);
  return objc_msgSend(v2, "syncSendDictionary:toPeer:withCompletionHandler:", v1, v3.i64[0], v5);
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_48(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = mcadvertiser_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_44_cold_1();
  }
}

- (void)syncHandleInviteConnect:(id)a3 fromPeer:(id)a4
{
  MCPeerID *v7;
  MCPeerID *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceSenderPeerIDKey")));
  v8 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceRecipientPeerIDKey")));
  v9 = mcadvertiser_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = a3;
    v22 = 2112;
    v23 = a4;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Got invite connect [%@] from peer [%@].", buf, 0x16u);
  }
  if (-[MCPeerID isEqual:](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "isEqual:", v8))
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "peerID"), "isEqual:", v7) & 1) != 0)
    {
      v10 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceConnectionDataKey"));
      v11 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceInviteIDKey"));
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("from:%@=%@"), objc_msgSend((id)objc_msgSend(a4, "peerID"), "displayName"), v11);
      v13 = (void *)-[NSMutableDictionary objectForKey:](self->_invites, "objectForKey:", v12);
      v14 = objc_msgSend(v13, "objectForKey:", CFSTR("MCNearbyServiceRecipientPeerIDKey"));
      v15 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("MCNearbyServiceSessionKey"));
      if (-[MCPeerID isEqual:](v7, "isEqual:", v14))
      {
        if (v15)
        {
          objc_msgSend(v15, "connectPeer:withNearbyConnectionData:", objc_msgSend(a4, "peerID"), v10);
          -[NSMutableDictionary removeObjectForKey:](self->_invites, "removeObjectForKey:", v12);
          -[MCNearbyServiceAdvertiser syncCloseConnectionForPeer:](self, "syncCloseConnectionForPeer:", a4);
        }
        else
        {
          v19 = mcadvertiser_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:].cold.1();
        }
      }
      else
      {
        v18 = mcadvertiser_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:].cold.2(v7);
      }
    }
    else
    {
      v17 = mcadvertiser_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:].cold.3();
    }
  }
  else
  {
    v16 = mcadvertiser_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:].cold.4();
  }
}

- (void)syncSendData:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  char *v8;

  if (!objc_msgSend(a4, "state"))
  {
    v8 = (char *)mcadvertiser_log();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      -[MCNearbyServiceAdvertiser syncSendData:toPeer:withCompletionHandler:].cold.1(a4, v8);
  }
  objc_msgSend(a4, "sendData:withCompletionHandler:", a3, a5);
}

- (void)syncReceivedData:(id)a3 fromPeer:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v7 = mcadvertiser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = a4;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Received dict [%@] from peer [%@].", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("MCNearbyServiceMessageIDKey")), "unsignedIntegerValue");
    if (v8 == 3)
    {
      -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:](self, "syncHandleInviteConnect:fromPeer:", v6, a4);
    }
    else
    {
      v9 = v8;
      if (v8 == 1)
      {
        -[MCNearbyServiceAdvertiser syncHandleInvite:fromPeer:](self, "syncHandleInvite:fromPeer:", v6, a4);
      }
      else
      {
        v10 = mcadvertiser_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 67109120;
          LODWORD(v12) = v9;
          _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Unknown or invalid nearby message type for the advertiser: %d.", (uint8_t *)&v11, 8u);
        }
      }
    }
  }
}

- (void)syncHandleIncomingInputStream:(id)a3 outputStream:(id)a4
{
  MCNearbyDiscoveryPeerConnection *v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  MCNearbyDiscoveryPeerConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = -[MCNearbyDiscoveryPeerConnection initWithLocalServiceName:]([MCNearbyDiscoveryPeerConnection alloc], "initWithLocalServiceName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@+%@"), -[MCPeerID idString](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "idString"), -[MCPeerID displayName](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "displayName")));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke;
  v9[3] = &unk_24C8410E0;
  v9[4] = v7;
  v9[5] = self;
  -[MCNearbyDiscoveryPeerConnection setConnectedHandler:](v7, "setConnectedHandler:", v9);
  -[MCNearbyDiscoveryPeerConnection attachInputStream:outputStream:](v7, "attachInputStream:outputStream:", a3, a4);
  v8 = mcadvertiser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = v7;
    _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "PeerConnection (advertiser side) created (%p).", buf, 0xCu);
  }

}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  NSObject *v9;
  uint64_t v10;
  void (**v11)(id, _QWORD);
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[8];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = mcadvertiser_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v26 = v10;
    v27 = 2112;
    v28 = a2;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "PeerConnection [%p] connectedHandler (advertiser side), remote identifier [%@].", buf, 0x16u);
  }
  v11 = (void (**)(id, _QWORD))(id)objc_msgSend(a4, "copy");
  if (a2 && !a5)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v14 = *(NSObject **)(v12 + 88);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_53;
    v24[3] = &unk_24C840900;
    v24[4] = v12;
    v24[5] = a2;
    v24[6] = v13;
    v24[7] = v11;
    dispatch_async(v14, v24);
    return;
  }
  v15 = mcadvertiser_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_2(a5);
    if (!a2)
    {
LABEL_8:
      v16 = mcadvertiser_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  else if (!a2)
  {
    goto LABEL_8;
  }
  if (v11)
    v11[2](v11, 0);
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_53(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MCPeerID *v11;
  MCPeerID *v12;
  MCNearbyDiscoveryPeer *v13;
  MCNearbyDiscoveryPeer *v14;
  int v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  MCNearbyDiscoveryPeer *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(int8x16_t *, void *, uint64_t);
  void *v29;
  uint64_t v30;
  MCNearbyDiscoveryPeer *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  MCNearbyDiscoveryPeer *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  v33 = 0;
  objc_msgSend(*(id *)(a1 + 32), "parseIDString:displayName:fromIdentifier:", &v33, &v32, *(_QWORD *)(a1 + 40));
  if (v33)
    v2 = v32 == 0;
  else
    v2 = 1;
  if (!v2)
  {
    v11 = [MCPeerID alloc];
    v12 = -[MCPeerID initWithIDString:displayName:](v11, "initWithIDString:displayName:", v33, v32);
    v13 = (MCNearbyDiscoveryPeer *)(id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v12);
    if (v13)
    {
      v14 = v13;
      v15 = -[MCNearbyDiscoveryPeer state](v13, "state");
      v16 = mcadvertiser_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = -[MCNearbyDiscoveryPeer state](v14, "state");
        *(_DWORD *)buf = 138412802;
        v35 = v14;
        v36 = 1024;
        v37 = v17;
        v38 = 1024;
        v39 = v15 != 2;
        _os_log_impl(&dword_20DC1A000, v16, OS_LOG_TYPE_DEFAULT, "Peer [%@] (advertiser side) already in dictionary [state = %d], decision = %d.", buf, 0x18u);
      }
      if (v15 != 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "syncCloseConnectionForPeer:", v14);
LABEL_17:
        v21 = 1;
        goto LABEL_22;
      }
      v21 = 0;
    }
    else
    {
      v18 = mcadvertiser_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[MCPeerID displayNameAndPID](v12, "displayNameAndPID");
        *(_DWORD *)buf = 138412290;
        v35 = (MCNearbyDiscoveryPeer *)v19;
        _os_log_impl(&dword_20DC1A000, v18, OS_LOG_TYPE_DEFAULT, "Peer [%@] (advertiser side) not in dictionary, creating one, decision = YES.", buf, 0xCu);
      }
      v20 = -[MCNearbyDiscoveryPeer initWithPeerID:]([MCNearbyDiscoveryPeer alloc], "initWithPeerID:", v12);
      if (v20)
      {
        v14 = v20;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v20, v12);
        goto LABEL_17;
      }
      v22 = mcadvertiser_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_53_cold_1(v12);
      v21 = 0;
      v14 = 0;
    }
LABEL_22:
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_55;
    v29 = &unk_24C8410B8;
    v30 = *(_QWORD *)(a1 + 32);
    v31 = v14;
    if ((_DWORD)v21)
    {
      objc_msgSend(*(id *)(a1 + 48), "setReceiveDataHandler:", &v26);
      objc_msgSend(*(id *)(a1 + 32), "syncAttachConnection:toPeer:", *(_QWORD *)(a1 + 48), v14, v26, v27, v28, v29, v30, v31);
      v23 = mcadvertiser_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v14;
        v24 = "Peer [%@] connected (advertiser side) successfully.";
LABEL_27:
        _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
      }
    }
    else
    {
      v23 = mcadvertiser_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v14;
        v24 = "Peer [%@] (advertiser side) decision == NO.";
        goto LABEL_27;
      }
    }
    v25 = *(_QWORD *)(a1 + 56);
    if (v25)
      (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, v21);

    return;
  }
  v3 = mcadvertiser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_53_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_55(int8x16_t *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  int8x16_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];
  _QWORD block[4];
  int8x16_t v18;
  _QWORD v19[7];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a1[2].i64[0];
    v5 = a1[2].i64[1];
    v6 = *(NSObject **)(v4 + 88);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2;
    v19[3] = &unk_24C840680;
    v19[4] = v5;
    v19[5] = a3;
    v19[6] = v4;
    v7 = v19;
  }
  else
  {
    if (!a2)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_56;
      block[3] = &unk_24C840658;
      v9 = vextq_s8(a1[2], a1[2], 8uLL);
      v10 = *(NSObject **)(a1[2].i64[0] + 88);
      v18 = v9;
      dispatch_async(v10, block);
    }
    v11 = mcadvertiser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[2].i64[1];
      v13 = objc_msgSend(a2, "length");
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      v22 = 1024;
      v23 = v13;
      _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Peer [%@] passing received data (length=%u) to the app.", buf, 0x12u);
    }
    v14 = a1[2].i64[0];
    v15 = a1[2].i64[1];
    v6 = *(NSObject **)(v14 + 88);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_57;
    v16[3] = &unk_24C840680;
    v16[4] = v14;
    v16[5] = a2;
    v16[6] = v15;
    v7 = v16;
  }
  dispatch_async(v6, v7);
}

uint64_t __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = mcadvertiser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2_cold_1(a1);
  return objc_msgSend(*(id *)(a1 + 48), "syncCloseConnectionForPeer:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_56(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = mcadvertiser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_56_cold_1(a1, v2, v3);
  return objc_msgSend(*(id *)(a1 + 40), "syncCloseConnectionForPeer:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_57(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncReceivedData:fromPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  NSObject *v8;
  NSObject *syncQueue;
  _QWORD block[7];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = mcadvertiser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = a4;
    v13 = 2048;
    v14 = a5;
    _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "Accepted connection with inputStream [%p] outputStream [%p].", buf, 0x16u);
  }
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__MCNearbyServiceAdvertiser_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  block[3] = &unk_24C840680;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(syncQueue, block);
}

uint64_t __88__MCNearbyServiceAdvertiser_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncHandleIncomingInputStream:outputStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)netServiceDidStop:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = mcadvertiser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Server stopped.", v4, 2u);
  }
}

- (void)netServiceDidPublish:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = mcadvertiser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Server did publish.", v4, 2u);
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  NSObject *v5;
  uint64_t Int64;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  v5 = mcadvertiser_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MCNearbyServiceAdvertiser netService:didNotPublish:].cold.1();
  Int64 = CFDictionaryGetInt64();
  if (Int64)
    v7 = Int64;
  else
    v7 = -72000;
  v8 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB73D0], v7, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__MCNearbyServiceAdvertiser_netService_didNotPublish___block_invoke;
  v9[3] = &unk_24C840658;
  v9[4] = self;
  v9[5] = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);
}

uint64_t __54__MCNearbyServiceAdvertiser_netService_didNotPublish___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "advertiser:didNotStartAdvertisingPeer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (NSDictionary)discoveryInfo
{
  return self->_discoveryInfo;
}

- (void)setDiscoveryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)formattedServiceType
{
  return self->_formattedServiceType;
}

- (void)setFormattedServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNetService)networkServer
{
  return self->_networkServer;
}

- (void)setNetworkServer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSData)TXTRecordData
{
  return self->_TXTRecordData;
}

- (void)setTXTRecordData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (int64_t)outgoingInviteID
{
  return self->_outgoingInviteID;
}

- (void)setOutgoingInviteID:(int64_t)a3
{
  self->_outgoingInviteID = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableDictionary)invites
{
  return self->_invites;
}

- (void)setInvites:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (BOOL)wasAdvertising
{
  return self->_wasAdvertising;
}

- (void)setWasAdvertising:(BOOL)a3
{
  self->_wasAdvertising = a3;
}

- (BOOL)isAWDLDisabled
{
  return self->_AWDLDisabled;
}

- (void)setAWDLDisabled:(BOOL)a3
{
  self->_AWDLDisabled = a3;
}

- (void)syncHandleInvite:fromPeer:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_0();
  objc_msgSend((id)OUTLINED_FUNCTION_13_0(v0, v1), "displayNameAndPID");
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v2, v3, "Peer is [%@], invite is from [%@].", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

- (void)syncHandleInvite:fromPeer:.cold.2()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_0();
  objc_msgSend((id)objc_msgSend(v0, "myPeerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v1, v2, "I am [%@], invite is for [%@].", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_38_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DC1A000, a1, a3, "Advertiser got invite with nil connectionData.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_44_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16(&dword_20DC1A000, v0, v1, "Failed to send dictionary [%@] to peer [%@].", v2);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleInviteConnect:fromPeer:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_16(&dword_20DC1A000, v1, (uint64_t)v1, "No session for peer [%@]. invites=[%@].", v2);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleInviteConnect:(void *)a1 fromPeer:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "displayNameAndPID");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_20DC1A000, v1, v2, "Received a connect from [%@], but we never accepted an invitation from it - aborting!", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleInviteConnect:fromPeer:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_0();
  objc_msgSend((id)OUTLINED_FUNCTION_13_0(v0, v1), "displayNameAndPID");
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v2, v3, "Peer is [%@], invite response is from [%@].", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

- (void)syncHandleInviteConnect:fromPeer:.cold.4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_0();
  objc_msgSend((id)objc_msgSend(v0, "myPeerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v1, v2, "I am [%@], invite response is for [%@].", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

- (void)syncSendData:(void *)a1 toPeer:(const char *)a2 withCompletionHandler:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "displayNameAndPID");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_20DC1A000, v2, v3, "We are trying to send data to peer [%@] and we are not connected.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_10();
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DC1A000, a1, a3, "PeerConnection connectedHandler remoteServiceName is nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "localizedDescription");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_20DC1A000, v1, v2, "PeerConnection connectedHandler (advertiser side) - error [%@].", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_10();
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_53_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "displayNameAndPID");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_20DC1A000, v1, v2, "Failed to initalize peer [%@].", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_10();
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_53_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DC1A000, a1, a3, "Failed to parse remote identifier.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v1, v2, "Data from peer [%@] received with error %@.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_56_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_7(&dword_20DC1A000, a2, a3, "Nil data from peer [%@] received -- should not happen.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)netService:didNotPublish:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20DC1A000, v0, v1, "Server did not publish: errorDict [%@].", v2);
  OUTLINED_FUNCTION_6();
}

@end
