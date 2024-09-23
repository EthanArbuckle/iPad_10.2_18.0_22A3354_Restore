@implementation CBClassicManager

- (CBClassicManager)initWithQueue:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  CBClassicManager *v8;
  uint64_t v9;
  NSMapTable *peers;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CBClassicManager;
  v8 = -[CBManager initInternal](&v13, sel_initInternal);
  if (v8)
  {
    -[CBClassicManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("state"), 0, objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("powerState"), 0, objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("localName"), 0, objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("inquiryState"), 0, objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("discoverable"), 0, objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("connectable"), 0, objc_opt_class());
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    peers = v8->_peers;
    v8->_peers = (NSMapTable *)v9;

    v8->_testMode = 0;
    v8->_connectable = 0;
    v8->_discoverable = 0;
    v8->_powerState = 1;
    objc_msgSend(v7, "valueForKey:", CFSTR("kCBManagerIsIOBluetoothShim"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager setTccApproved:](v8, "setTccApproved:", objc_msgSend(v11, "BOOLValue"));

    -[CBManager startWithQueue:options:sessionType:](v8, "startWithQueue:options:sessionType:", v6, v7, 3);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CBClassicManager orphanClassicPeers](self, "orphanClassicPeers");
  -[CBClassicManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("state"), objc_opt_class());
  -[CBClassicManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("powerState"), objc_opt_class());
  -[CBClassicManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("localName"), objc_opt_class());
  -[CBClassicManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("inquiryState"), objc_opt_class());
  -[CBClassicManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("discoverable"), objc_opt_class());
  -[CBClassicManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("connectable"), objc_opt_class());
  v3.receiver = self;
  v3.super_class = (Class)CBClassicManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  objc_super v14;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  if ((void *)objc_opt_class() == a6)
  {
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("state"));

    if (v13)
    {
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn && -[CBManager state](self, "state") != 10)
      {
        -[CBClassicManager forEachClassicPeer:](self, "forEachClassicPeer:", &__block_literal_global_3);
        if (-[CBManager state](self, "state") == CBManagerStateResetting)
          -[CBClassicManager orphanClassicPeers](self, "orphanClassicPeers");
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CBClassicManager;
    -[CBClassicManager observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v10, v11, a6);

  }
}

uint64_t __67__CBClassicManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDisconnection");
}

- (id)peerWithIdentifier:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;

  v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    v5 = self->_peers;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](self->_peers, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

    return v6;
  }
  else
  {

    return 0;
  }
}

- (id)classicPeerWithInfo:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *peers;
  void *v7;
  CBClassicPeer *v8;
  void *v9;
  NSMapTable *v10;
  void *v11;

  v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    v5 = self->_peers;
    objc_sync_enter(v5);
    peers = self->_peers;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](peers, "objectForKey:", v7);
    v8 = (CBClassicPeer *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v8 = -[CBClassicPeer initWithInfo:manager:]([CBClassicPeer alloc], "initWithInfo:manager:", v4, self);
      -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 41, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBClassicPeer handleMsg:args:](v8, "handleMsg:args:", 41, v9);
      v10 = self->_peers;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v8, v11);

    }
    objc_sync_exit(v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)peerWithInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {

    return 0;
  }
}

- (void)forEachClassicPeer:(id)a3
{
  NSMapTable *v4;
  void *v5;
  void *i;
  uint64_t v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    v4 = self->_peers;
    objc_sync_enter(v4);
    -[NSMapTable objectEnumerator](self->_peers, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; i = (void *)v7)
    {
      objc_msgSend(v5, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      if (!v7)
        break;
      v8[2](v8, v7);
    }

    objc_sync_exit(v4);
  }

}

- (void)orphanClassicPeers
{
  NSMapTable *obj;

  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    -[CBClassicManager forEachClassicPeer:](self, "forEachClassicPeer:", &__block_literal_global_42);
    obj = self->_peers;
    objc_sync_enter(obj);
    -[NSMapTable removeAllObjects](self->_peers, "removeAllObjects");
    objc_sync_exit(obj);

  }
}

void __38__CBClassicManager_orphanClassicPeers__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    __38__CBClassicManager_orphanClassicPeers__block_invoke_cold_1();
  objc_msgSend(v2, "handleDisconnection");
  objc_msgSend(v2, "setOrphan");

}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return a3 == 27 || a3 == 52;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 <= 0x3Cu && ((1 << a3) & 0x1000000000000300) != 0)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CBClassicManager;
  return -[CBManager isMsgAllowedAlways:](&v6, sel_isMsgAllowedAlways_);
}

- (void)setBTConnectable:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_connectable != a3)
  {
    v6 = CFSTR("kCBMsgArgConnectableState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendMsg:args:](self, "sendMsg:args:", 28, v5);

  }
}

- (void)setBTDiscoverable:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_discoverable != a3)
  {
    v6 = CFSTR("kCBMsgArgDiscoverableState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendMsg:args:](self, "sendMsg:args:", 29, v5);

  }
}

- (BOOL)setBTPowerState:(BOOL)a3
{
  int64_t powerState;
  BOOL v5;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  powerState = self->_powerState;
  if (!a3)
  {
    if (powerState != 2)
      return 0;
LABEL_6:
    v9 = CFSTR("kCBMsgArgBTPowerState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 27, v8);

    return v5;
  }
  if (powerState != 2)
    goto LABEL_6;
  return 0;
}

- (BOOL)secureBluetooth:(BOOL)a3 withAuthData:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v4 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authData != nil"));

  }
  v13[0] = CFSTR("kCBMsgArgSecureBluetoothMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("kCBMsgArgSecureBluetoothData");
  v14[0] = v8;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 60, v9);

  return v10;
}

- (void)handleLocalDeviceStateUpdatedMsg:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  int v10;
  BOOL v11;
  int v12;
  int64_t v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgInquiryState"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectableState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDiscoverableState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBTPowerState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inquiryState"));
    self->_inquiryState = objc_msgSend(v14, "BOOLValue");
    -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inquiryState"));
  }
  if (v5)
  {
    v8 = objc_msgSend(v5, "BOOLValue");
    if (self->_connectable != v8)
    {
      v9 = v8;
      -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("connectable"));
      self->_connectable = v9;
      -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("connectable"));
    }
  }
  if (v6)
  {
    v10 = objc_msgSend(v6, "BOOLValue");
    if (self->_discoverable != v10)
    {
      v11 = v10;
      -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("discoverable"));
      self->_discoverable = v11;
      -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("discoverable"));
    }
  }
  if (v7)
  {
    v12 = objc_msgSend(v7, "intValue");
    -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("powerState"));
    v13 = v12 == 2;
    if (v12 == 1)
      v13 = 2;
    self->_powerState = v13;
    -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("powerState"));
  }

}

- (void)startInquiryWithOptions:(id)a3 classicPeerDiscovered:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:].cold.1(v8, self, (uint64_t)v6);
  -[CBClassicManager setClassicPeerDiscovered:](self, "setClassicPeerDiscovered:", v7);
  if (-[CBManager state](self, "state") == CBManagerStatePoweredOn)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kCBMsgArgInquiryState"));
    if (!objc_msgSend(v6, "count"))
    {
LABEL_21:
      if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 30, v9))
        self->_isInquiryRunning = 1;

      goto LABEL_24;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBInquiryLength"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("kCBMsgArgInquiryLength"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBInquiryInfinite"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("kCBMsgArgInquiryInfinite"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBInquiryServices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("kCBMsgArgServiceUUIDs"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBInquiryRSSIThreshold"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("kCBMsgArgRssi"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBInquiryReportDuplicates"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (CBLogInitOnce == -1)
    {
      v15 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("kCBMsgArgInquiryReportDuplicates"));
        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v15 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
    }
    v16 = 136315394;
    v17 = "-[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:]";
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1A82A2000, v15, OS_LOG_TYPE_DEFAULT, "%s reportDuplicates set to %@", (uint8_t *)&v16, 0x16u);
    goto LABEL_19;
  }
LABEL_24:

}

- (void)stopInquiry
{
  -[CBClassicManager setClassicPeerDiscovered:](self, "setClassicPeerDiscovered:", 0);
  if (self->_isInquiryRunning)
  {
    -[CBManager sendMsg:args:](self, "sendMsg:args:", 52, 0);
    self->_isInquiryRunning = 0;
  }
}

- (id)retrievePairedPeersWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  CBClassicManager *v18;

  v4 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
  {
    v14 = 0;
    goto LABEL_16;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager retrievePairedPeersWithOptions:].cold.1();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBOptionConnectedKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBOptionServicesKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBOptionIdentifiersKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("kCBMsgArgConnectionState"));
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("kCBMsgArgServiceUUIDs"));
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("kCBMsgArgUUIDs"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
LABEL_18:
    -[CBClassicManager retrievePairedPeersWithOptions:].cold.1();
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    goto LABEL_18;
LABEL_14:
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 37, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__CBClassicManager_retrievePairedPeersWithOptions___block_invoke;
  v16[3] = &unk_1E5402058;
  v13 = v10;
  v17 = v13;
  v18 = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);
  v14 = v13;

LABEL_16:
  return v14;
}

void __51__CBClassicManager_retrievePairedPeersWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "peerWithInfo:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)getLocalSDPDatabase
{
  void *v3;
  void *v4;

  if (!-[CBManager tccApproved](self, "tccApproved"))
    return 0;
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 59, MEMORY[0x1E0C9AA70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSDPRecordData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addService:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
    goto LABEL_15;
  if (v5)
  {
    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUID != nil"));

    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  v6 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager addService:].cold.2(v5, v6);
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") != 2)
  {
    objc_msgSend(v5, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length") == 4)
    {

    }
    else
    {
      objc_msgSend(v5, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10 == 16)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUID.data.length == 2 || serviceUUID.data.length == 4 || serviceUUID.data.length == 16"));
    }
  }

LABEL_12:
  v14 = CFSTR("kCBMsgArgServiceUUID");
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 31, v11);

  if (!v12)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
    }
    -[CBClassicManager addService:].cold.1();
  }
LABEL_15:

}

- (void)removeService:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
    goto LABEL_9;
  if (v5)
  {
    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUID != nil"));

    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager removeService:].cold.2();
  v9 = CFSTR("kCBMsgArgServiceUUID");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 32, v6);

  if (!v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    -[CBClassicManager removeService:].cold.1();
  }
LABEL_9:

}

- (void)removeServiceHandle:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v3 = *(_QWORD *)&a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  if (!-[CBManager tccApproved](self, "tccApproved"))
    return;
  if ((_DWORD)v3)
  {
    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceHandle != 0"));

    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  v6 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager removeServiceHandle:].cold.2(v3, v6);
  v18 = CFSTR("kCBMsgArgServiceHandle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 32, v8);

  if (!v9)
  {
    if (CBLogInitOnce == -1)
    {
      v10 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        return;
LABEL_13:
      -[CBClassicManager removeServiceHandle:].cold.1(v3, v10, v11, v12, v13, v14, v15, v16);
      return;
    }
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v10 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
  }
}

- (void)removeAllServices
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[CBClassicManager removeAllServices]";
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)addServiceToInquiryList:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
    goto LABEL_15;
  if (v5)
  {
    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUID != nil"));

    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager addServiceToInquiryList:].cold.2();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") != 2)
  {
    objc_msgSend(v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") == 4)
    {

    }
    else
    {
      objc_msgSend(v5, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9 == 16)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUID.data.length == 2 || serviceUUID.data.length == 4 || serviceUUID.data.length == 16"));
    }
  }

LABEL_12:
  v13 = CFSTR("kCBMsgArgServiceUUID");
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 34, v10);

  if (!v11)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
    }
    -[CBClassicManager addServiceToInquiryList:].cold.1();
  }
LABEL_15:

}

- (void)removeServiceFromInquiryList:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
    goto LABEL_9;
  if (v5)
  {
    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUID != nil"));

    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager removeServiceFromInquiryList:].cold.2();
  v9 = CFSTR("kCBMsgArgServiceUUID");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 35, v6);

  if (!v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    -[CBClassicManager removeServiceFromInquiryList:].cold.1();
  }
LABEL_9:

}

- (void)removeAllServicesFromInquiryList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "Failed to remove all services from inquiry list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addService:(id)a3 sdpRecord:(id)a4 sdpRecordAddedHandler:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (!-[CBManager tccApproved](self, "tccApproved"))
    goto LABEL_9;
  if (v9 | v10)
  {
    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 410, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUID != nil || sdpRecord != nil"));

    if (CBLogInitOnce == -1)
      goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager addService:sdpRecord:sdpRecordAddedHandler:].cold.2();
  -[CBClassicManager setSdpRecordAddedHandler:](self, "setSdpRecordAddedHandler:", v11);
  v15[0] = CFSTR("kCBMsgArgUUID");
  v15[1] = CFSTR("kCBMsgArgOptions");
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 31, v12);

  if (!v13)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    -[CBClassicManager addService:sdpRecord:sdpRecordAddedHandler:].cold.1();
  }
LABEL_9:

}

- (unsigned)addServiceWithData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceData != nil"));

    }
    v12 = CFSTR("kCBMsgArgSDPRecordData");
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 31, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceHandle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)connectPeer:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 433, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer != nil"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBOptionServicesKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v10 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v21 = "-[CBClassicManager connectPeer:options:]";
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1A82A2000, v11, OS_LOG_TYPE_DEFAULT, "%s %@ uuids: %@", buf, 0x20u);

    }
    v18[0] = CFSTR("kCBMsgArgDeviceUUID");
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("kCBMsgArgOptions");
    v19[0] = v13;
    v19[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 39, v14);

    if (v15)
    {
      v16 = objc_msgSend(v7, "state");
      if (v16 == 3 || !v16)
        objc_msgSend(v7, "setState:", 1);
    }

  }
}

- (void)cancelPeerConnection:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
    -[CBClassicManager cancelPeerConnection:force:](self, "cancelPeerConnection:force:", v4, 0);

}

- (void)cancelPeerConnection:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer != nil"));

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      v9 = MEMORY[0x1E0C9AAB0];
    else
      v9 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("kCBCancelConnectOptionForce"));
    -[CBClassicManager cancelPeerConnection:options:](self, "cancelPeerConnection:options:", v11, v8);

  }
}

- (void)cancelPeerConnection:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBClassicManager.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer != nil"));

    }
    v15[0] = CFSTR("kCBMsgArgDeviceUUID");
    objc_msgSend(v7, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v15[1] = CFSTR("kCBMsgArgOptions");
    v11 = (id)MEMORY[0x1E0C9AA70];
    if (v8)
      v11 = v8;
    v16[0] = v9;
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 40, v12);

    if (v13 && (unint64_t)(objc_msgSend(v7, "state") - 1) <= 1)
      objc_msgSend(v7, "setState:", 3);
  }

}

- (void)setTestMode:(BOOL)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_testMode != a3)
  {
    v8 = CFSTR("kCBMsgArgState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 43, v6);

    if (v7)
      self->_testMode = a3;
  }
}

- (id)retrievePeerWithAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
  {
LABEL_9:
    v10 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "length"))
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBClassicManager retrievePeerWithAddress:].cold.1();
    goto LABEL_9;
  }
  v12 = CFSTR("kCBMsgArgAddressString");
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 38, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAddressString:", v4);
  }
  else
  {
    v10 = 0;
  }

LABEL_12:
  return v10;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;
  char **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;

  v4 = a3;
  v6 = a4;
  v7 = 0;
  v8 = &selRef_handlePeerDiscovered_;
  switch((int)v4)
  {
    case 16:
      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handlePairingMessage:args:", 16, v6);

      return;
    case 17:
    case 18:
      -[CBClassicManager pairingStatusHandler](self, "pairingStatusHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBClassicManager pairingStatusHandler](self, "pairingStatusHandler");
        v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, uint64_t))v13)[2](v13, v11, objc_msgSend(v12, "code"));

      }
      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handlePairingMessage:args:", v4, v6);

      return;
    case 23:
    case 24:
    case 45:
    case 56:
    case 57:
      -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleMsg:args:", v4, v6);

      goto LABEL_3;
    case 44:
      goto LABEL_21;
    case 46:
      v7 = 0;
      v23 = sel_handleServiceAddedToSDP_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn)
        goto LABEL_28;
      goto LABEL_22;
    case 47:
      v7 = 0;
      v23 = sel_handleSDPRecordAdded_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn)
        goto LABEL_28;
      goto LABEL_22;
    case 48:
      v7 = 0;
      v23 = sel_handleServiceAddedToInquiryList_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn)
        goto LABEL_28;
      goto LABEL_22;
    case 49:
      v7 = 0;
      v23 = sel_handlePeerConnectionCompleted_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn)
        goto LABEL_28;
      goto LABEL_22;
    case 50:
      v7 = 0;
      v8 = &selRef_handlePeerDisconnectionCompleted_;
LABEL_21:
      v23 = *v8;
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn)
        goto LABEL_22;
      goto LABEL_28;
    case 51:
      v7 = 1;
      v23 = sel_handlePeerConnectionStateUpdated_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn)
        goto LABEL_28;
LABEL_22:
      if (((-[CBManager state](self, "state") != 10) & ~v7) != 0)
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        {
          -[CBClassicManager handleMsg:args:].cold.2();

        }
        else
        {
LABEL_3:

        }
      }
      else
      {
LABEL_28:
        objc_msgSend(self, v23, v6);

      }
      break;
    default:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v16 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_3;
      -[CBClassicManager handleMsg:args:].cold.1(v4, v16, v17, v18, v19, v20, v21, v22);

      break;
  }
}

- (void)handlePeerDiscovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isInquiryRunning)
  {
    -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v6 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        objc_msgSend(v5, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 136315650;
        v11 = "-[CBClassicManager handlePeerDiscovered:]";
        v12 = 2112;
        v13 = v8;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_1A82A2000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ - %@", (uint8_t *)&v10, 0x20u);

      }
      -[CBClassicManager classicPeerDiscovered](self, "classicPeerDiscovered");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, CBClassicManager *, void *, id))v9)[2](v9, self, v5, v4);

    }
    else
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        -[CBClassicManager handlePeerDiscovered:].cold.2();
    }

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBClassicManager handlePeerDiscovered:].cold.1();
  }

}

- (void)handlePeerConnectionStateUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBClassicManager handlePeerConnectionStateUpdated:].cold.1();
  -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlePeerUpdated:", v4);
  -[CBClassicManager connectionStatusHandler](self, "connectionStatusHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || objc_msgSend(v5, "state") == 1)
    goto LABEL_9;
  v7 = objc_msgSend(v5, "state");

  if (v7 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager connectionStatusHandler](self, "connectionStatusHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v5, objc_msgSend(v6, "code"));

LABEL_9:
  }

}

- (void)handleServiceAddedToSDP:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleServiceAddedToSDP:].cold.1();
    -[CBClassicManager serviceAddedHandler](self, "serviceAddedHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[CBClassicManager serviceAddedHandler](self, "serviceAddedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager serviceAddedHandler](self, "serviceAddedHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v7, objc_msgSend(v6, "code"));

  }
LABEL_6:

}

- (void)handleServiceAddedToInquiryList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleServiceAddedToInquiryList:].cold.1();
    -[CBClassicManager inquiryServiceAddedHandler](self, "inquiryServiceAddedHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[CBClassicManager inquiryServiceAddedHandler](self, "inquiryServiceAddedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager inquiryServiceAddedHandler](self, "inquiryServiceAddedHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v7, objc_msgSend(v6, "code"));

  }
LABEL_6:

}

- (void)handleSDPRecordAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleSDPRecordAdded:].cold.1();
    -[CBClassicManager sdpRecordAddedHandler](self, "sdpRecordAddedHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[CBClassicManager sdpRecordAddedHandler](self, "sdpRecordAddedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager sdpRecordAddedHandler](self, "sdpRecordAddedHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v7, objc_msgSend(v6, "code"));

  }
LABEL_6:

}

- (void)handlePeerConnectionCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicManager peerWithIdentifier:](self, "peerWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = "-[CBClassicManager handlePeerConnectionCompleted:]";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1A82A2000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v15, 0x20u);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgInternalState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v6, "setInternalState:", (int)objc_msgSend(v8, "intValue"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "handleFailedConnection");
      -[CBClassicManager connectCallback](self, "connectCallback");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_11:

        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v6, "handleSuccessfulConnection:", v4);
      -[CBClassicManager connectCallback](self, "connectCallback");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_11;
    }
    -[CBClassicManager connectCallback](self, "connectCallback");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v6, objc_msgSend(v10, "code"));

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v13 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBClassicManager handlePeerConnectionCompleted:].cold.1(v13, v4);
LABEL_16:

}

- (void)handlePeerDisconnectionCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicManager peerWithIdentifier:](self, "peerWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[CBClassicManager handlePeerDisconnectionCompleted:]";
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1A82A2000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v14, 0x20u);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgInternalState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v6, "setInternalState:", (int)objc_msgSend(v8, "intValue"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleDisconnection");
    -[CBClassicManager disconnectCallback](self, "disconnectCallback");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CBClassicManager disconnectCallback](self, "disconnectCallback");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v6, objc_msgSend(v10, "code"));

    }
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v13 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBClassicManager handlePeerDisconnectionCompleted:].cold.1(v13, v4);
  }

}

- (void)alertUserNotificationIsReady:(id)a3
{
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 61, a3);
}

- (BOOL)inquiryState
{
  return self->_inquiryState;
}

- (BOOL)discoverable
{
  return self->_discoverable;
}

- (BOOL)connectable
{
  return self->_connectable;
}

- (id)connectCallback
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setConnectCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (id)disconnectCallback
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setDisconnectCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (id)serviceAddedHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setServiceAddedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (id)inquiryServiceAddedHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setInquiryServiceAddedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSMapTable)peers
{
  return self->_peers;
}

- (BOOL)isInquiryRunning
{
  return self->_isInquiryRunning;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (id)classicPeerDiscovered
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setClassicPeerDiscovered:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (id)sdpRecordAddedHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setSdpRecordAddedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (id)pairingStatusHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setPairingStatusHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (id)connectionStatusHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setConnectionStatusHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionStatusHandler, 0);
  objc_storeStrong(&self->_pairingStatusHandler, 0);
  objc_storeStrong(&self->_sdpRecordAddedHandler, 0);
  objc_storeStrong(&self->_classicPeerDiscovered, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong(&self->_inquiryServiceAddedHandler, 0);
  objc_storeStrong(&self->_serviceAddedHandler, 0);
  objc_storeStrong(&self->_disconnectCallback, 0);
  objc_storeStrong(&self->_connectCallback, 0);
}

void __38__CBClassicManager_orphanClassicPeers__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startInquiryWithOptions:(uint64_t)a3 classicPeerDiscovered:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v7 = 136315650;
  v8 = "-[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:]";
  v9 = 2048;
  v10 = objc_msgSend(a2, "state");
  v11 = 2112;
  v12 = a3;
  OUTLINED_FUNCTION_7(&dword_1A82A2000, v5, v6, "%s block with state %ld and options: %@ ", (uint8_t *)&v7);

  OUTLINED_FUNCTION_10();
}

- (void)retrievePairedPeersWithOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "Failed to add SDP services", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addService:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "-[CBClassicManager addService:]";
  v8 = 2112;
  v9 = a1;
  v10 = 2048;
  v11 = objc_msgSend(v4, "length");
  OUTLINED_FUNCTION_7(&dword_1A82A2000, v3, v5, "%s %@, len: %lu", (uint8_t *)&v6);

  OUTLINED_FUNCTION_10();
}

- (void)removeService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "Error removing service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeServiceHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A82A2000, a2, a3, "Error removing service handle: %X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)removeServiceHandle:(int)a1 .cold.2(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[CBClassicManager removeServiceHandle:]";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_1A82A2000, a2, OS_LOG_TYPE_DEBUG, "%s %X", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)addServiceToInquiryList:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "Failed to add services to inquiry list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addServiceToInquiryList:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeServiceFromInquiryList:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "Failed to remove service from inquiry list %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeServiceFromInquiryList:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addService:sdpRecord:sdpRecordAddedHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "Failed to add service %@ (with SDP record)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addService:sdpRecord:sdpRecordAddedHandler:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_2();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_7(&dword_1A82A2000, v2, (uint64_t)v2, "%s %@ sdp: %@", (uint8_t *)v3);
}

- (void)retrievePeerWithAddress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "WARNING: Invalid address specified, cannot create a CBClassicPeer from an empty string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleMsg:(uint64_t)a3 args:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A82A2000, a2, a3, "Unhandled XPC message: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)handleMsg:args:.cold.2()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1A82A2000, v1, OS_LOG_TYPE_ERROR, "%@ is not powered on, ignoring message: %u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePeerDiscovered:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "Inquiry not running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handlePeerDiscovered:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "Discovered null peer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handlePeerConnectionStateUpdated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleServiceAddedToSDP:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleServiceAddedToInquiryList:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleSDPRecordAdded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A82A2000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePeerConnectionCompleted:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1A82A2000, v3, OS_LOG_TYPE_ERROR, "%s %@ not found", (uint8_t *)v5, 0x16u);

  OUTLINED_FUNCTION_11();
}

- (void)handlePeerDisconnectionCompleted:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A82A2000, v3, OS_LOG_TYPE_ERROR, "handlePeerDisconnectionCompleted: %@ not found", v5, 0xCu);

  OUTLINED_FUNCTION_11();
}

@end
