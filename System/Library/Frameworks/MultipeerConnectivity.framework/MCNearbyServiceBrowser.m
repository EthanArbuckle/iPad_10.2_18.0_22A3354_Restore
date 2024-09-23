@implementation MCNearbyServiceBrowser

- (MCNearbyServiceBrowser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCNearbyServiceBrowser;
  -[MCNearbyServiceBrowser doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (MCNearbyServiceBrowser)initWithPeer:(MCPeerID *)myPeerID serviceType:(NSString *)serviceType
{
  MCNearbyServiceBrowser *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MCNearbyServiceBrowser;
  v6 = -[MCNearbyServiceBrowser init](&v17, sel_init);
  if (v6)
  {
    v6->_peers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6->_invites = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6->_netServices = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (!myPeerID)
    {
      v7 = (void *)MEMORY[0x24BDBCE88];
      v8 = *MEMORY[0x24BDBCAB8];
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = (objc_class *)objc_opt_class();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("A nil %@ object passed to %@"), v10, NSStringFromClass(v11));
    }
    v6->_myPeerID = (MCPeerID *)-[MCPeerID copy](myPeerID, "copy");
    if (!+[MCNearbyServiceUtils isServiceTypeValid:](MCNearbyServiceUtils, "isServiceTypeValid:", serviceType))
    {
      v12 = (void *)MEMORY[0x24BDBCE88];
      v13 = *MEMORY[0x24BDBCAB8];
      v14 = (objc_class *)objc_opt_class();
      objc_msgSend(v12, "raise:format:", v13, CFSTR("Invalid serviceType passed to %@"), NSStringFromClass(v14));
    }
    v6->_serviceType = (NSString *)-[NSString copy](serviceType, "copy");
    v6->_formattedServiceType = (NSString *)objc_msgSend(+[MCNearbyServiceUtils formattedServiceType:](MCNearbyServiceUtils, "formattedServiceType:", serviceType), "copy");
    v6->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCNearbyServiceBrowser.syncQueue", 0);
    v15 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel_applicationWillEnterForegroundNotification_, *MEMORY[0x24BDF75D0], 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel_applicationWillTerminateNotification_, *MEMORY[0x24BDF75E0], 0);
  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSNetServiceBrowser *networkBrowser;
  uint64_t v13;
  __int128 v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)-[NSMutableDictionary allValues](-[MCNearbyServiceBrowser netServices](self, "netServices"), "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412290;
    v14 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = mcbrowser_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_msgSend(v9, "name");
          *(_DWORD *)buf = v14;
          v21 = v11;
          _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Removing netservice [%@] from net services dictionary.", buf, 0xCu);
        }
        objc_msgSend(v9, "stopMonitoring", v14);
        objc_msgSend(v9, "setDelegate:", 0);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

  -[NSNetServiceBrowser setDelegate:](self->_networkBrowser, "setDelegate:", 0);
  -[NSNetServiceBrowser stop](self->_networkBrowser, "stop");
  networkBrowser = self->_networkBrowser;
  v13 = objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  -[NSNetServiceBrowser removeFromRunLoop:forMode:](networkBrowser, "removeFromRunLoop:forMode:", v13, *MEMORY[0x24BDBCB80]);

  objc_storeWeak((id *)&self->_delegate, 0);
  dispatch_release((dispatch_object_t)self->_syncQueue);
  v15.receiver = self;
  v15.super_class = (Class)MCNearbyServiceBrowser;
  -[MCNearbyServiceBrowser dealloc](&v15, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  MCPeerID *v6;
  NSString *v7;
  objc_class *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[MCNearbyServiceBrowser myPeerID](self, "myPeerID");
  v7 = -[MCNearbyServiceBrowser serviceType](self, "serviceType");
  -[MCNearbyServiceBrowser delegate](self, "delegate");
  v8 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p MyPeerID = %@ ServiceType = %@ Delegate = <%@: %p>>"), v5, self, v6, v7, NSStringFromClass(v8), -[MCNearbyServiceBrowser delegate](self, "delegate"));
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (int64_t)syncNextOutgoingInviteID
{
  int64_t outgoingInviteID;

  outgoingInviteID = self->_outgoingInviteID;
  self->_outgoingInviteID = outgoingInviteID + 1;
  return outgoingInviteID;
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
  v10 = mcbrowser_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = a5;
    v13 = 1024;
    v14 = v9;
    _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Identifier [%@] failed to parse @%d.", (uint8_t *)&v11, 0x12u);
  }
}

- (void)syncStartBrowsingForPeers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSNetServiceBrowser *v24;
  uint64_t v25;
  NSObject *v26;
  NSString *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (!-[MCNearbyServiceBrowser isBrowsing](self, "isBrowsing"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v3 = (void *)-[NSMutableDictionary allValues](-[MCNearbyServiceBrowser invites](self, "invites"), "allValues");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v38 != v6)
            objc_enumerationMutation(v3);
          -[MCNearbyServiceBrowser syncHandleDeclinedInviteWithInfo:](self, "syncHandleDeclinedInviteWithInfo:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v5);
    }
    -[NSMutableDictionary removeAllObjects](self->_invites, "removeAllObjects");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = (void *)-[NSMutableDictionary allValues](self->_peers, "allValues");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend((id)objc_msgSend(v13, "netService"), "stopMonitoring");
          objc_msgSend((id)objc_msgSend(v13, "netService"), "setDelegate:", 0);
          objc_msgSend(v13, "setNetService:", 0);
          objc_msgSend(v13, "invalidate");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      }
      while (v10);
    }
    -[NSMutableDictionary removeAllObjects](self->_peers, "removeAllObjects");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = (void *)-[NSMutableDictionary allValues](-[MCNearbyServiceBrowser netServices](self, "netServices"), "allValues");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v30;
      *(_QWORD *)&v16 = 138412290;
      v28 = v16;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
          v21 = mcbrowser_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend(v20, "name");
            *(_DWORD *)buf = v28;
            v42 = v22;
            _os_log_impl(&dword_20DC1A000, v21, OS_LOG_TYPE_DEFAULT, "Removing netservice [%@] from net services dictionary.", buf, 0xCu);
          }
          objc_msgSend(v20, "stopMonitoring", v28);
          objc_msgSend(v20, "setDelegate:", 0);
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v17);
    }
    -[NSMutableDictionary removeAllObjects](-[MCNearbyServiceBrowser netServices](self, "netServices"), "removeAllObjects");
    if (!-[MCNearbyServiceBrowser networkBrowser](self, "networkBrowser"))
    {
      v23 = objc_alloc_init(MEMORY[0x24BDB7468]);
      if (!-[MCNearbyServiceBrowser isAWDLDisabled](self, "isAWDLDisabled"))
        objc_msgSend(v23, "setIncludesPeerToPeer:", 1);
      -[MCNearbyServiceBrowser setNetworkBrowser:](self, "setNetworkBrowser:", v23);

    }
    -[NSNetServiceBrowser setDelegate:](-[MCNearbyServiceBrowser networkBrowser](self, "networkBrowser"), "setDelegate:", self);
    v24 = -[MCNearbyServiceBrowser networkBrowser](self, "networkBrowser");
    v25 = objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    -[NSNetServiceBrowser scheduleInRunLoop:forMode:](v24, "scheduleInRunLoop:forMode:", v25, *MEMORY[0x24BDBCB80]);
    -[NSNetServiceBrowser searchForServicesOfType:inDomain:](-[MCNearbyServiceBrowser networkBrowser](self, "networkBrowser"), "searchForServicesOfType:inDomain:", -[MCNearbyServiceBrowser formattedServiceType](self, "formattedServiceType"), CFSTR("local."));
    -[MCNearbyServiceBrowser setIsBrowsing:](self, "setIsBrowsing:", 1);
    v26 = mcbrowser_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = -[MCNearbyServiceBrowser formattedServiceType](self, "formattedServiceType");
      *(_DWORD *)buf = 138412290;
      v42 = (uint64_t)v27;
      _os_log_impl(&dword_20DC1A000, v26, OS_LOG_TYPE_DEFAULT, "Start discovering services of type [%@].", buf, 0xCu);
    }
  }
}

- (void)startBrowsingForPeers
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__MCNearbyServiceBrowser_startBrowsingForPeers__block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __47__MCNearbyServiceBrowser_startBrowsingForPeers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncStartBrowsingForPeers");
}

- (void)syncStopBrowsingForPeers
{
  NSNetServiceBrowser *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[MCNearbyServiceBrowser isBrowsing](self, "isBrowsing"))
  {
    -[NSNetServiceBrowser setDelegate:](-[MCNearbyServiceBrowser networkBrowser](self, "networkBrowser"), "setDelegate:", 0);
    -[NSNetServiceBrowser stop](-[MCNearbyServiceBrowser networkBrowser](self, "networkBrowser"), "stop");
    v3 = -[MCNearbyServiceBrowser networkBrowser](self, "networkBrowser");
    v4 = objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    -[NSNetServiceBrowser removeFromRunLoop:forMode:](v3, "removeFromRunLoop:forMode:", v4, *MEMORY[0x24BDBCB80]);
    -[MCNearbyServiceBrowser setIsBrowsing:](self, "setIsBrowsing:", 0);
    v5 = mcbrowser_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = -[MCNearbyServiceBrowser formattedServiceType](self, "formattedServiceType");
      _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "Stop discovering services of type [%@].", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)stopBrowsingForPeers
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__MCNearbyServiceBrowser_stopBrowsingForPeers__block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __46__MCNearbyServiceBrowser_stopBrowsingForPeers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncStopBrowsingForPeers");
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__MCNearbyServiceBrowser_applicationDidEnterBackgroundNotification___block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __68__MCNearbyServiceBrowser_applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isBrowsing");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setWasBrowsing:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "syncStopBrowsingForPeers");
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
  block[2] = __69__MCNearbyServiceBrowser_applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __69__MCNearbyServiceBrowser_applicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "wasBrowsing");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setWasBrowsing:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "syncStartBrowsingForPeers");
  }
  return result;
}

- (void)syncInitiateConnectionToPeer:(id)a3
{
  uint64_t v5;
  MCNearbyDiscoveryPeerConnection *v6;
  _QWORD v7[8];

  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@+%@"), -[MCPeerID idString](-[MCNearbyServiceBrowser myPeerID](self, "myPeerID"), "idString"), -[MCPeerID displayName](-[MCNearbyServiceBrowser myPeerID](self, "myPeerID"), "displayName"));
  v6 = -[MCNearbyDiscoveryPeerConnection initWithLocalServiceName:]([MCNearbyDiscoveryPeerConnection alloc], "initWithLocalServiceName:", v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke;
  v7[3] = &unk_24C841130;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = v5;
  v7[7] = v6;
  -[MCNearbyDiscoveryPeerConnection setConnectedHandler:](v6, "setConnectedHandler:", v7);
  -[MCNearbyDiscoveryPeerConnection connectToNetService:](v6, "connectToNetService:", objc_msgSend(a3, "netService"));
  objc_msgSend(a3, "setTrialConnection:", v6);

}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke(id *a1, void *a2, int a3, void *a4, void *a5)
{
  NSObject *v10;
  void (**v11)(id, _QWORD);
  NSObject *v12;
  id v13;
  NSObject *v14;
  MCPeerID *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  _QWORD v39[9];
  _QWORD v40[7];
  _QWORD v41[4];
  int8x16_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD block[5];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = mcbrowser_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = a2;
    _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "PeerConnection connectedHandler (browser side), remote identifier [%@].", buf, 0xCu);
  }
  v11 = (void (**)(id, _QWORD))(id)objc_msgSend(a4, "copy");
  if (a5)
  {
    v12 = mcbrowser_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_3((uint64_t)a1, a5);
    v13 = a1[4];
    v14 = *((_QWORD *)a1[5] + 10);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_32;
    block[3] = &unk_24C8407E8;
    block[4] = v13;
    dispatch_async(v14, block);
LABEL_7:
    if (v11)
      v11[2](v11, 0);
    return;
  }
  v43 = 0;
  v44 = 0;
  objc_msgSend(a1[5], "parseIDString:displayName:fromIdentifier:", &v44, &v43, a2);
  if (v44 && v43)
  {
    v15 = [MCPeerID alloc];
    if (!-[MCPeerID isEqual:](-[MCPeerID initWithIDString:displayName:](v15, "initWithIDString:displayName:", v44, v43), "isEqual:", objc_msgSend(a1[4], "peerID")))
    {
      v34 = mcbrowser_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_1();
      goto LABEL_7;
    }
    v16 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_33;
    v41[3] = &unk_24C8410B8;
    v42 = vextq_s8(*((int8x16_t *)a1 + 2), *((int8x16_t *)a1 + 2), 8uLL);
    v17 = mcbrowser_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = a1[4];
      if (a3)
        v19 = "yes";
      else
        v19 = "no";
      v20 = a1[7];
      v21 = objc_msgSend(v18, "stringForState:", objc_msgSend(a1[4], "state"));
      *(_DWORD *)buf = 138413058;
      v47 = v18;
      v48 = 2080;
      v49 = v19;
      v50 = 2048;
      v51 = v20;
      v52 = 2112;
      v53 = v21;
      _os_log_impl(&dword_20DC1A000, v17, OS_LOG_TYPE_DEFAULT, "ConnectionHandler [%@] (browser side) shouldForceConnect [%s]; peer.connection [%p] state [%@].",
        buf,
        0x2Au);
    }
    if (a3)
    {
      objc_msgSend(a1[7], "setReceiveDataHandler:", v41);
      v23 = a1[4];
      v22 = a1[5];
      v24 = *((_QWORD *)v22 + 10);
      v40[0] = v16;
      v40[1] = 3221225472;
      v40[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_39;
      v40[3] = &unk_24C840680;
      v25 = a1[7];
      v40[4] = v22;
      v40[5] = v25;
      v40[6] = v23;
      dispatch_async(v24, v40);
      if (v11)
        v11[2](v11, 1);
    }
    else
    {
      v39[0] = v16;
      v39[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2_40;
      v39[3] = &unk_24C841108;
      v36 = a1[4];
      v35 = a1[5];
      v37 = *((_QWORD *)v35 + 10);
      v39[1] = 3221225472;
      v38 = a1[7];
      v39[4] = v36;
      v39[5] = v38;
      v39[6] = v35;
      v39[7] = v41;
      v39[8] = v11;
      dispatch_async(v37, v39);
    }
  }
  else
  {
    v26 = mcbrowser_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_53_cold_2(v26, v27, v28, v29, v30, v31, v32, v33);
  }
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_32(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trialConnection"), "invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "setTrialConnection:", 0);
}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_33(int8x16_t *a1, void *a2, uint64_t a3)
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
    v6 = *(NSObject **)(v4 + 80);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2;
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
      block[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_34;
      block[3] = &unk_24C840658;
      v9 = vextq_s8(a1[2], a1[2], 8uLL);
      v10 = *(NSObject **)(a1[2].i64[0] + 80);
      v18 = v9;
      dispatch_async(v10, block);
    }
    v11 = mcbrowser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[2].i64[1];
      v13 = objc_msgSend(a2, "length");
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      v22 = 1024;
      v23 = v13;
      _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Peer [%@] passing data (length=%u) to the app.", buf, 0x12u);
    }
    v14 = a1[2].i64[0];
    v15 = a1[2].i64[1];
    v6 = *(NSObject **)(v14 + 80);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_35;
    v16[3] = &unk_24C840680;
    v16[4] = v14;
    v16[5] = a2;
    v16[6] = v15;
    v7 = v16;
  }
  dispatch_async(v6, v7);
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = mcbrowser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Peer [%@] data received with error %@.", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 48), "syncCloseConnectionForPeer:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = mcbrowser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Peer [%@] connection closed.", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "syncCloseConnectionForPeer:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncReceivedData:fromPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncAttachConnection:toPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2_40(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2 == 2)
  {
    v3 = mcbrowser_log();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v6;
    v5 = "Peer [%@] (browser side) decision == NO.";
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setReceiveDataHandler:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "syncAttachConnection:toPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v3 = mcbrowser_log();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v4;
    v5 = "Peer [%@] (browser side) connected successfully.";
  }
  _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, 0xCu);
LABEL_7:
  v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v8;
    v12 = 1024;
    v13 = v2 != 2;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Peer [%@] (browser side) about to return decision == %d.", (uint8_t *)&v10, 0x12u);
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 != 2);
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
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "closeConnection");
  v4 = mcbrowser_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = objc_msgSend((id)objc_msgSend(a3, "peerID"), "displayNameAndPID");
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Setting peer [%@] state to Not Connected.", (uint8_t *)&v5, 0xCu);
  }
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
    v11 = mcbrowser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = a3;
      v15 = 2112;
      v16 = a4;
      _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Sending dictionary %@ to peer %@.", buf, 0x16u);
    }
    -[MCNearbyServiceBrowser syncSendData:toPeer:withCompletionHandler:](self, "syncSendData:toPeer:withCompletionHandler:", v10, a4, v8);
  }
  else if (v8)
  {
    v8[2](v8, v12);
  }
}

- (void)syncInvitePeer:(id)a3 toSession:(id)a4 withContext:(id)a5 timeout:(double)a6
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  dispatch_time_t v21;
  NSObject *syncQueue;
  _QWORD v23[7];
  _QWORD v24[6];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[5];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x24BDAC8D0];
  v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MCNearbyServiceBrowser syncNextOutgoingInviteID](self, "syncNextOutgoingInviteID"));
  v12 = objc_msgSend((id)objc_msgSend(a3, "peerID"), "serializedRepresentation");
  v13 = -[MCPeerID serializedRepresentation](-[MCNearbyServiceBrowser myPeerID](self, "myPeerID"), "serializedRepresentation");
  if (a5)
  {
    v29[0] = CFSTR("MCNearbyServiceMessageIDKey");
    v30[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
    v30[1] = v13;
    v29[1] = CFSTR("MCNearbyServiceSenderPeerIDKey");
    v29[2] = CFSTR("MCNearbyServiceRecipientPeerIDKey");
    v30[2] = v12;
    v30[3] = v11;
    v29[3] = CFSTR("MCNearbyServiceInviteIDKey");
    v29[4] = CFSTR("MCNearbyServiceInviteContextKey");
    v30[4] = a5;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v30;
    v16 = v29;
    v17 = 5;
  }
  else
  {
    v27[0] = CFSTR("MCNearbyServiceMessageIDKey");
    v28[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
    v28[1] = v13;
    v27[1] = CFSTR("MCNearbyServiceSenderPeerIDKey");
    v27[2] = CFSTR("MCNearbyServiceRecipientPeerIDKey");
    v27[3] = CFSTR("MCNearbyServiceInviteIDKey");
    v28[2] = v12;
    v28[3] = v11;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = v28;
    v16 = v27;
    v17 = 4;
  }
  v18 = objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
  v25[0] = CFSTR("MCNearbyServiceRecipientPeerIDKey");
  v25[1] = CFSTR("MCNearbyServiceSessionKey");
  v26[0] = objc_msgSend(a3, "peerID");
  v26[1] = a4;
  -[NSMutableDictionary setObject:forKey:](self->_invites, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2), v11);
  v19 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke;
  v24[3] = &unk_24C841018;
  v24[4] = v18;
  v24[5] = a3;
  -[MCNearbyServiceBrowser syncSendDictionary:toPeer:withCompletionHandler:](self, "syncSendDictionary:toPeer:withCompletionHandler:", v18, a3, v24);
  v20 = a6 * 1000000000.0;
  if (a6 <= 0.0)
    v20 = 3.0e10;
  v21 = dispatch_time(0, (uint64_t)v20);
  syncQueue = self->_syncQueue;
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke_46;
  v23[3] = &unk_24C840680;
  v23[4] = self;
  v23[5] = v18;
  v23[6] = a3;
  dispatch_after(v21, syncQueue, v23);
}

void __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = mcbrowser_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_44_cold_1();
  }
}

uint64_t __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncHandleInviteTimeout:forPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)syncHandleInviteResponse:(id)a3 fromPeer:(id)a4
{
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  MCPeerID *v11;
  NSMutableDictionary **p_invites;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  _QWORD v24[12];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceAcceptInviteKey")), "BOOLValue");
  v8 = mcbrowser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = a3;
    v27 = 2112;
    v28 = a4;
    _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "Got invite response [%@] from peer [%@].", buf, 0x16u);
  }
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceRecipientPeerIDKey"));
  if (-[MCPeerID isEqual:](-[MCNearbyServiceBrowser myPeerID](self, "myPeerID"), "isEqual:", -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", v9)))
  {
    v10 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceSenderPeerIDKey"));
    v11 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", v10);
    if ((objc_msgSend((id)objc_msgSend(a4, "peerID"), "isEqual:", v11) & 1) != 0)
    {
      v23 = v7;
      p_invites = &self->_invites;
      v22 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceInviteIDKey"));
      v13 = (void *)-[NSMutableDictionary objectForKey:](self->_invites, "objectForKey:");
      v14 = objc_msgSend(v13, "objectForKey:", CFSTR("MCNearbyServiceRecipientPeerIDKey"));
      v15 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("MCNearbyServiceSessionKey"));
      if (-[MCPeerID isEqual:](v11, "isEqual:", v14))
      {
        if (v15)
        {
          v16 = objc_msgSend(a4, "peerID");
          if (v23)
          {
            v24[0] = MEMORY[0x24BDAC760];
            v24[1] = 3221225472;
            v24[2] = __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke;
            v24[3] = &unk_24C841180;
            v24[4] = v9;
            v24[5] = v10;
            v17 = v22;
            v24[6] = v22;
            v24[7] = self;
            v24[8] = a4;
            v24[9] = a3;
            v24[10] = v11;
            v24[11] = v15;
            objc_msgSend(v15, "nearbyConnectionDataForPeer:withCompletionHandler:", v16, v24);
          }
          else
          {
            objc_msgSend(v15, "peerDidDeclineInvitation:", v16);
            -[MCNearbyServiceBrowser syncCloseConnectionForPeer:](self, "syncCloseConnectionForPeer:", a4);
            v17 = v22;
          }
          -[NSMutableDictionary removeObjectForKey:](*p_invites, "removeObjectForKey:", v17);
        }
        else
        {
          v21 = mcbrowser_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:].cold.1((uint64_t)a4, (uint64_t *)p_invites, v21);
        }
      }
      else
      {
        v20 = mcbrowser_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:].cold.2(v11, v20);
      }
    }
    else
    {
      v19 = mcbrowser_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:].cold.3(a4);
    }
  }
  else
  {
    v18 = mcbrowser_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:].cold.4(self);
  }
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[6];
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v19[0] = CFSTR("MCNearbyServiceMessageIDKey");
    v20 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
    v19[1] = CFSTR("MCNearbyServiceSenderPeerIDKey");
    v19[2] = CFSTR("MCNearbyServiceRecipientPeerIDKey");
    v21 = *(_OWORD *)(a1 + 32);
    v19[3] = CFSTR("MCNearbyServiceInviteIDKey");
    v19[4] = CFSTR("MCNearbyServiceConnectionDataKey");
    v22 = *(_QWORD *)(a1 + 48);
    v23 = a2;
    v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, v19, 5);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(NSObject **)(v5 + 80);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_47;
    block[3] = &unk_24C841090;
    block[4] = v5;
    block[5] = v4;
    v7 = *(_OWORD *)(a1 + 80);
    v17 = *(_OWORD *)(a1 + 64);
    v18 = v7;
    dispatch_async(v6, block);
  }
  else
  {
    v8 = mcbrowser_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

uint64_t __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_47(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(id *, uint64_t);
  void *v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2;
  v8 = &unk_24C841158;
  v9 = *(_OWORD *)(a1 + 56);
  return objc_msgSend(v2, "syncSendDictionary:toPeer:withCompletionHandler:", v1, MEMORY[0x24BDAC760], 3221225472, __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2, &unk_24C841158, v9, *(_QWORD *)(a1 + 72), v3);
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2(id *a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    v3 = mcbrowser_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2_cold_1((uint64_t)a1);
  }
  else
  {
    objc_msgSend(a1[6], "connectPeer:withNearbyConnectionData:", objc_msgSend(a1[7], "peerID"), objc_msgSend(a1[4], "objectForKey:", CFSTR("MCNearbyServiceConnectionDataKey")));
  }
}

- (void)syncHandleDeclinedInviteWithInfo:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceSessionKey"));
    v6 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceRecipientPeerIDKey"));
    v7 = mcbrowser_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Handle declined invitation from peer with peerID [%@].", buf, 0xCu);
    }
    objc_msgSend(v5, "peerDidDeclineInvitation:", v6);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)-[NSMutableDictionary allValues](-[MCNearbyServiceBrowser peers](self, "peers", 0), "allValues");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
LABEL_6:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_msgSend((id)objc_msgSend(v13, "peerID"), "isEqual:", v6) & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v10)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v13 = 0;
    }
    if (v6)
      -[MCNearbyServiceBrowser syncCloseConnectionForPeer:](self, "syncCloseConnectionForPeer:", v13);
  }
}

- (void)syncHandleInviteTimeout:(id)a3 forPeer:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("MCNearbyServiceInviteIDKey"));
  v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = a4;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Invite timeout for peer [%@] fired.", (uint8_t *)&v9, 0xCu);
  }
  v8 = -[NSMutableDictionary objectForKey:](self->_invites, "objectForKey:", v6);
  if (v8)
  {
    -[MCNearbyServiceBrowser syncHandleDeclinedInviteWithInfo:](self, "syncHandleDeclinedInviteWithInfo:", v8);
    -[NSMutableDictionary removeObjectForKey:](self->_invites, "removeObjectForKey:", v6);
  }
}

- (void)syncSendData:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  if (!objc_msgSend(a4, "state"))
    -[MCNearbyServiceBrowser syncInitiateConnectionToPeer:](self, "syncInitiateConnectionToPeer:", a4);
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
  v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = a4;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Received dictionary [%@] from peer [%@].", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("MCNearbyServiceMessageIDKey")), "unsignedIntegerValue");
    if (v8 == 2)
    {
      -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:](self, "syncHandleInviteResponse:fromPeer:", v6, a4);
    }
    else
    {
      v9 = v8;
      v10 = mcbrowser_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 67109120;
        LODWORD(v12) = v9;
        _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Unknown or invalid nearby message type for the browser: %d.", (uint8_t *)&v11, 8u);
      }
    }
  }
}

- (void)invitePeer:(MCPeerID *)peerID toSession:(MCSession *)session withContext:(NSData *)context timeout:(NSTimeInterval)timeout
{
  void *v10;
  void *v11;
  NSObject *syncQueue;
  NSObject *v13;
  const char *v14;
  _QWORD block[9];
  uint8_t buf[16];

  if (!peerID)
  {
    v13 = mcbrowser_log();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v14 = "Bad argument peerID=nil";
    goto LABEL_8;
  }
  if (session)
  {
    v10 = (void *)-[MCPeerID copy](peerID, "copy");
    v11 = (void *)-[NSData copy](context, "copy");
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke;
    block[3] = &unk_24C8411A8;
    block[4] = self;
    block[5] = v10;
    block[6] = session;
    block[7] = v11;
    *(NSTimeInterval *)&block[8] = timeout;
    dispatch_async(syncQueue, block);

    return;
  }
  v13 = mcbrowser_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v14 = "Bad argument session=nil";
LABEL_8:
    _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
  }
}

void __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "syncInvitePeer:toSession:withContext:timeout:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    v3 = mcbrowser_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "displayNameAndPID");
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Peer [%@] not in peers dictionary anymore.", buf, 0xCu);
    }
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke_48;
    v5[3] = &unk_24C840658;
    v6 = *(_OWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

uint64_t __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke_48(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "browser:lostPeer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a4)
  {
    v14 = mcbrowser_log();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v19) = 0;
    v15 = "An invalid NSNetService object found - skipping.";
    v16 = v14;
LABEL_14:
    _os_log_impl(&dword_20DC1A000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 2u);
    return;
  }
  v5 = a5;
  v8 = (id)objc_msgSend((id)objc_msgSend(a4, "name", a3), "copy");
  v9 = mcbrowser_log();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v10)
      return;
    LOWORD(v19) = 0;
    v15 = "NetService with an invalid name found - skipping.";
    v16 = v9;
    goto LABEL_14;
  }
  if (v10)
  {
    v19 = 138412546;
    v20 = v8;
    v21 = 1024;
    v22 = v5;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "NetService found [%@] moreComing [%d].", (uint8_t *)&v19, 0x12u);
  }
  v11 = -[NSMutableDictionary objectForKey:](-[MCNearbyServiceBrowser netServices](self, "netServices"), "objectForKey:", v8);
  if (!v11)
  {
    v17 = mcbrowser_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_20DC1A000, v17, OS_LOG_TYPE_DEFAULT, "NetService adding [%@] to net services dictionary.", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_17;
  }
  v12 = (void *)v11;
  if ((objc_msgSend(a4, "isEqual:", v11) & 1) == 0)
  {
    v13 = mcbrowser_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "NetService replacing [%@] in net services dictionary.", (uint8_t *)&v19, 0xCu);
    }
    objc_msgSend(v12, "stopMonitoring");
LABEL_17:
    -[NSMutableDictionary setObject:forKey:](-[MCNearbyServiceBrowser netServices](self, "netServices"), "setObject:forKey:", a4, v8);
  }
  objc_msgSend(a4, "setDelegate:", self);
  v18 = objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  objc_msgSend(a4, "scheduleInRunLoop:forMode:", v18, *MEMORY[0x24BDBCB80]);
  objc_msgSend(a4, "startMonitoring");
}

- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x24BDAC8D0];
  v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = a4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Did find domain [%@] moreComing [%d].", (uint8_t *)&v8, 0x12u);
  }
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t Int64;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];

  v6 = mcbrowser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MCNearbyServiceBrowser netServiceBrowser:didNotSearch:].cold.1((uint64_t)a4, v6, v7);
  Int64 = CFDictionaryGetInt64();
  if (Int64)
    v9 = Int64;
  else
    v9 = -72000;
  v10 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB73D0], v9, 0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__MCNearbyServiceBrowser_netServiceBrowser_didNotSearch___block_invoke;
  v11[3] = &unk_24C840658;
  v11[4] = self;
  v11[5] = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);
}

uint64_t __57__MCNearbyServiceBrowser_netServiceBrowser_didNotSearch___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "browser:didNotStartBrowsingForPeers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x24BDAC8D0];
  v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = a4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Did remove domain [%@] moreComing [%d].", (uint8_t *)&v8, 0x12u);
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  NSObject *v8;
  NSObject *syncQueue;
  _QWORD v10[6];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v5 = a5;
  v15 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a4, "name", a3);
  v8 = mcbrowser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "Peer lost: idString [%@] moreComing [%d].", buf, 0x12u);
  }
  syncQueue = self->_syncQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke;
  v10[3] = &unk_24C840658;
  v10[4] = self;
  v10[5] = v7;
  dispatch_async(syncQueue, v10);
}

void __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (!v3)
    goto LABEL_14;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v16 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "netService"), "name"), "isEqualToString:", *(_QWORD *)(a1 + 40)))v5 = v8;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  }
  while (v4);
  if (v5)
  {
    v9 = (void *)objc_msgSend(v5, "peerID");
    v10 = mcbrowser_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v9, "displayNameAndPID");
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Removing a peer [%@] from peers dictionary.", buf, 0xCu);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "removeObjectForKey:", v9);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_52;
    v14[3] = &unk_24C840658;
    v14[4] = *(_QWORD *)(a1 + 32);
    v14[5] = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);
  }
  else
  {
LABEL_14:
    v12 = mcbrowser_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_cold_1(a1, v12, v13);
  }
}

uint64_t __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_52(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "browser:lostPeer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)netServiceBrowserDidStopSearch:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = mcbrowser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_20DC555F9, v4, 2u);
  }
}

- (void)netServiceBrowserWillSearch:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = mcbrowser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_20DC555F9, v4, 2u);
  }
}

- (id)rebuildUserDiscoveryInfoFromTXTRecordDictionary:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend((id)objc_msgSend(a3, "allValues"), "count");
  if (v4 < 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v4 - 1);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = (void *)objc_msgSend(v3, "allKeys");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v16 = v5;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("_d")) & 1) == 0)
          {
            v12 = v3;
            v13 = objc_msgSend(v3, "objectForKey:", v11);
            v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
            if (objc_msgSend(v11, "hasPrefix:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("_"), CFSTR("_"))))v11 = (void *)objc_msgSend(v11, "substringFromIndex:", 1);
            objc_msgSend(v16, "setObject:forKey:", v14, v11);
            v3 = v12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
      v5 = v16;
    }
  }
  return v5;
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  MCPeerID *v22;
  NSObject *v23;
  NSObject *v25;
  NSObject *syncQueue;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[8];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "name");
  v8 = (void *)objc_msgSend(MEMORY[0x24BDB7460], "dictionaryFromTXTRecordData:", a4);
  v9 = objc_msgSend(v8, "objectForKey:", CFSTR("_d"));
  if (!v9
    || ((v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4),
         v11 = -[MCNearbyServiceBrowser rebuildUserDiscoveryInfoFromTXTRecordDictionary:](self, "rebuildUserDiscoveryInfoFromTXTRecordDictionary:", v8), v10)? (v12 = v7 == 0): (v12 = 1), v12))
  {
    v13 = mcbrowser_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MCNearbyServiceBrowser netService:didUpdateTXTRecordData:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v21 = v11;
    v22 = -[MCPeerID initWithIDString:displayName:]([MCPeerID alloc], "initWithIDString:displayName:", v7, v10);
    v23 = mcbrowser_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v7;
      v34 = 2112;
      v35 = -[MCPeerID displayNameAndPID](v22, "displayNameAndPID");
      v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Peer found: idString [%@], displayNameAndPID [%@], discoveryInfo [%@].", buf, 0x20u);
    }
    if (-[MCPeerID isEqual:](v22, "isEqual:", -[MCNearbyServiceBrowser myPeerID](self, "myPeerID")))
    {
      v25 = mcbrowser_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DC1A000, v25, OS_LOG_TYPE_DEFAULT, "Ignoring self for now.", buf, 2u);
      }
    }
    else
    {
      syncQueue = self->_syncQueue;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke;
      v31[3] = &unk_24C8407C0;
      v31[4] = self;
      v31[5] = v22;
      v31[6] = a3;
      v31[7] = v21;
      dispatch_async(syncQueue, v31);
      v27 = (void *)-[NSMutableDictionary objectForKey:](-[MCNearbyServiceBrowser netServices](self, "netServices"), "objectForKey:", objc_msgSend(a3, "name"));
      if (v27)
      {
        v28 = v27;
        objc_msgSend(v27, "stopMonitoring");
        objc_msgSend(v28, "setDelegate:", 0);
        -[NSMutableDictionary removeObjectForKey:](-[MCNearbyServiceBrowser netServices](self, "netServices"), "removeObjectForKey:", objc_msgSend(a3, "name"));
      }
      else
      {
        v29 = mcbrowser_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_msgSend(a3, "name");
          *(_DWORD *)buf = 138412290;
          v33 = v30;
          _os_log_impl(&dword_20DC1A000, v29, OS_LOG_TYPE_DEFAULT, "NetService not found [%@] in net services dictionary.", buf, 0xCu);
        }
        objc_msgSend(a3, "stopMonitoring");
      }
    }
  }
}

void __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  MCNearbyDiscoveryPeer *v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;
  uint8_t buf[16];

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (!v2)
  {
LABEL_6:
    v5 = -[MCNearbyDiscoveryPeer initWithPeerID:]([MCNearbyDiscoveryPeer alloc], "initWithPeerID:", *(_QWORD *)(a1 + 40));
    -[MCNearbyDiscoveryPeer setNetService:](v5, "setNetService:", *(_QWORD *)(a1 + 48));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

    goto LABEL_7;
  }
  v3 = v2;
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqual:", objc_msgSend(v2, "netService")) & 1) == 0)
  {
    v4 = mcbrowser_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Peer already in the dictionary, but has a different NSNetService object. will replace it with the newly found peer.", buf, 2u);
    }
    objc_msgSend(v3, "invalidate");
    goto LABEL_6;
  }
LABEL_7:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke_57;
  block[3] = &unk_24C840680;
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke_57(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "browser:foundPeer:withDiscoveryInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)formattedServiceType
{
  return self->_formattedServiceType;
}

- (void)setFormattedServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableDictionary)netServices
{
  return self->_netServices;
}

- (void)setNetServices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSNetServiceBrowser)networkBrowser
{
  return self->_networkBrowser;
}

- (void)setNetworkBrowser:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
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
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableDictionary)invites
{
  return self->_invites;
}

- (void)setInvites:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (BOOL)wasBrowsing
{
  return self->_wasBrowsing;
}

- (void)setWasBrowsing:(BOOL)a3
{
  self->_wasBrowsing = a3;
}

- (BOOL)isAWDLDisabled
{
  return self->_AWDLDisabled;
}

- (void)setAWDLDisabled:(BOOL)a3
{
  self->_AWDLDisabled = a3;
}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16(&dword_20DC1A000, v0, (uint64_t)v0, "Unexpected (possibly stale) identifier [%@] advertised (expected peer [%@]).Closing connection.", v1);
  OUTLINED_FUNCTION_6();
}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "localizedDescription");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v2, v3, "Peer [%@] error in connectedHandler [%@].", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleInviteResponse:(NSObject *)a3 fromPeer:.cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_16(&dword_20DC1A000, a3, (uint64_t)a3, "No session for peer [%@]. invites=[%@].", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleInviteResponse:(void *)a1 fromPeer:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138412290;
  v5 = objc_msgSend(a1, "displayNameAndPID");
  OUTLINED_FUNCTION_7(&dword_20DC1A000, a2, v3, "Received an invitation response from [%@], but we never sent it an invitation. Aborting!", (uint8_t *)&v4);
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleInviteResponse:(void *)a1 fromPeer:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)objc_msgSend(a1, "peerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v1, v2, "Peer is [%@], invite response is from [%@].", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5_1();
}

- (void)syncHandleInviteResponse:(void *)a1 fromPeer:.cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)objc_msgSend(a1, "myPeerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v1, v2, "I am [%@], invite response is for [%@].", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5_1();
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DC1A000, a1, a3, "Browser got invite response with nil connectionData.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 40), "displayNameAndPID");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_20DC1A000, v1, v2, "Failed to send dictionary [%@] to peer [%@].", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)netServiceBrowser:(uint64_t)a3 didNotSearch:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_7(&dword_20DC1A000, a2, a3, "NSNetServiceBrowser did not search with error dict [%@].", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_7(&dword_20DC1A000, a2, a3, "Cannot find peer with idString [%@] in the peers dictionary.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)netService:(uint64_t)a3 didUpdateTXTRecordData:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DC1A000, a1, a3, "Either displayName, peerIDString or both are nil; ignoring peer.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_2();
}

@end
