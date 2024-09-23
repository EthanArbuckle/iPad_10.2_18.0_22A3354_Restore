@implementation CBPeripheralManager

- (id)centralWithInfo:(id)a3
{
  id v4;
  NSMapTable *centrals;
  void *v6;
  CBCentral *v7;
  NSMapTable *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  centrals = self->_centrals;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](centrals, "objectForKey:", v6);
  v7 = (CBCentral *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[CBPeer initWithInfo:manager:]([CBCentral alloc], "initWithInfo:manager:", v4, self);
    v8 = self->_centrals;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v7, v9);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgATTMTU"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    -[CBPeer setMtuLength:](v7, "setMtuLength:", objc_msgSend(v10, "unsignedIntegerValue"));

  return v7;
}

- (void)forEachCentral:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[NSMapTable objectEnumerator](self->_centrals, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v8[2](v8, v6);
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

}

- (void)dealloc
{
  NSHashTable *l2capChannels;
  objc_super v4;

  l2capChannels = self->_l2capChannels;
  if (l2capChannels)
    -[NSHashTable removeAllObjects](l2capChannels, "removeAllObjects");
  if (self->_observingKeyPaths)
  {
    -[CBPeripheralManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("delegate"), objc_opt_class());
    -[CBPeripheralManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("state"), objc_opt_class());
    -[CBPeripheralManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("localName"), objc_opt_class());
    self->_observingKeyPaths = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CBPeripheralManager;
  -[CBManager dealloc](&v4, sel_dealloc);
}

- (id)centralWithIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_centrals, "objectForKey:", a3);
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 priority:(int64_t)a5
{
  _BOOL8 v5;
  uint64_t v6;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v5 = a4;
  v6 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("kCBL2CAPChannelPriority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:](self, "publishL2CAPChannel:requiresEncryption:options:", v6, v5, v9);

}

- (void)publishL2CAPChannelWithEncryption:(BOOL)a3 priority:(int64_t)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v4 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("kCBL2CAPChannelPriority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:](self, "publishL2CAPChannel:requiresEncryption:options:", 0, v4, v7);

}

- (void)publishL2CAPChannelWithEncryption:(BOOL)encryptionRequired
{
  -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:](self, "publishL2CAPChannel:requiresEncryption:options:", 0, encryptionRequired, 0);
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4
{
  -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:](self, "publishL2CAPChannel:requiresEncryption:options:", a3, a4, 0);
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 options:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v5 = a4;
  v6 = a3;
  v16[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v9 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:].cold.1(v6, v5, v9);
  v15[0] = CFSTR("kCBMsgArgPSM");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = CFSTR("kCBMsgArgRequiresEncryption");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v15[2] = CFSTR("kCBMsgArgOptions");
  v13 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v13 = v8;
  v16[1] = v11;
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 19, v14);

}

- (void)unpublishL2CAPChannel:(CBL2CAPPSM)PSM
{
  uint64_t v3;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = PSM;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v6 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBPeripheralManager unpublishL2CAPChannel:].cold.1(v3, v6);
    if ((_DWORD)v3)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("psm > 0"));

    goto LABEL_5;
  }
  if (!(_DWORD)v3)
    goto LABEL_7;
LABEL_5:
  v10 = CFSTR("kCBMsgArgPSM");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 20, v8);

}

- (void)overrideLocalLeAddress:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheralManager overrideLocalLeAddress:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  v15 = CFSTR("kCBMsgArgAddressString");
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 60, v14);

}

- (void)addressRotationState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CBPeripheralManager_addressRotationState___block_invoke;
  v6[3] = &unk_1E53FF618;
  v7 = v4;
  v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 46, MEMORY[0x1E0C9AA70], v6);

}

void __44__CBPeripheralManager_addressRotationState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (a3)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, a3, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v8);

  }
}

- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4
{
  int v4;
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_l2capChannels;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      objc_msgSend(v12, "peer", (_QWORD)v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v6))
      {
        v14 = objc_msgSend(v12, "PSM");

        if (v14 == v4)
        {
          v15 = v12;

          goto LABEL_17;
        }
      }
      else
      {

      }
      if (v9 == ++v11)
      {
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (!v9)
          break;
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBPeripheralManager l2capChannelForPeer:withPsm:].cold.1();
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)removeAllL2CAPChannels
{
  -[NSHashTable removeAllObjects](self->_l2capChannels, "removeAllObjects");
}

- (void)refreshNonConnectableIdentity
{
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 161, MEMORY[0x1E0C9AA70]);
}

- (void)requestStableAddress:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CBPeripheralManager_requestStableAddress___block_invoke;
  v6[3] = &unk_1E53FF618;
  v7 = v4;
  v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 45, MEMORY[0x1E0C9AA70], v6);

}

void __44__CBPeripheralManager_requestStableAddress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (id)getNonConnectableIdentity
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 162, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIdentityIRK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIdentityAddress"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v4 && v3)
  {
    v8[0] = CFSTR("kCBMsgArgIdentityAddress");
    v8[1] = CFSTR("kCBMsgArgIdentityIRK");
    v9[0] = v4;
    v9[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (CBPeripheralManagerAuthorizationStatus)authorizationStatus
{
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    +[CBPeripheralManager authorizationStatus].cold.1();
  return 3;
}

- (CBPeripheralManager)init
{
  return -[CBPeripheralManager initWithDelegate:queue:](self, "initWithDelegate:queue:", 0, 0);
}

- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  CBPeripheralManager *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("kCBInitOptionShowPowerAlert");
  v13[0] = MEMORY[0x1E0C9AAB0];
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = queue;
  v8 = delegate;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CBPeripheralManager initWithDelegate:queue:options:](self, "initWithDelegate:queue:options:", v8, v7, v9);

  return v10;
}

- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options
{
  NSObject *v9;
  NSObject *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CBPeripheralManager *v24;
  int v25;
  uint64_t v26;
  NSMapTable *centrals;
  NSMutableArray *v28;
  NSMutableArray *services;
  NSMutableDictionary *v30;
  NSMutableDictionary *characteristicIDs;
  uint64_t v32;
  NSHashTable *l2capChannels;
  NSLock *v34;
  NSLock *updateLock;
  void *v36;
  void *v37;
  void *v38;
  $43C94FEDEB33BD172F576B255845D8E8 delegateFlags;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v53;
  SEL v54;
  objc_super v55;

  v9 = delegate;
  v10 = queue;
  v11 = options;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("XCTestConfigurationFilePath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

LABEL_3:
    goto LABEL_14;
  }
  v15 = _os_feature_enabled_impl();

  if (v15
    && +[CBManager tccAvailable](CBManager, "tccAvailable")
    && +[CBManager preflightCheckForTCC](CBManager, "preflightCheckForTCC") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForInfoDictionaryKey:", CFSTR("NSAccessorySetupKitSupports"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v12, "containsObject:", CFSTR("Bluetooth")))
      goto LABEL_3;
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheralManager initWithDelegate:queue:options:].cold.1(v9, v17, v18, v19, v20, v21, v22, v23);
    abort_with_payload();
  }
LABEL_14:
  v55.receiver = self;
  v55.super_class = (Class)CBPeripheralManager;
  v24 = -[CBManager initInternal](&v55, sel_initInternal);
  if (v24)
  {
    v54 = a2;
    -[CBPeripheralManager addObserver:forKeyPath:options:context:](v24, "addObserver:forKeyPath:options:context:", v24, CFSTR("state"), 0, objc_opt_class());
    -[CBPeripheralManager addObserver:forKeyPath:options:context:](v24, "addObserver:forKeyPath:options:context:", v24, CFSTR("delegate"), 0, objc_opt_class());
    -[CBPeripheralManager addObserver:forKeyPath:options:context:](v24, "addObserver:forKeyPath:options:context:", v24, CFSTR("localName"), 0, objc_opt_class());
    v25 = 1;
    v24->_observingKeyPaths = 1;
    -[CBPeripheralManager setDelegate:](v24, "setDelegate:", v9);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    centrals = v24->_centrals;
    v24->_centrals = (NSMapTable *)v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    services = v24->_services;
    v24->_services = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    characteristicIDs = v24->_characteristicIDs;
    v24->_characteristicIDs = v30;

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    l2capChannels = v24->_l2capChannels;
    v24->_l2capChannels = (NSHashTable *)v32;

    v34 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    updateLock = v24->_updateLock;
    v24->_updateLock = v34;

    *(_WORD *)&v24->_readyForUpdates = 1;
    v24->_attributeIDGenerator = 1;
    -[CBManager setTccComplete:](v24, "setTccComplete:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForInfoDictionaryKey:", CFSTR("UIBackgroundModes"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v37, "containsObject:", CFSTR("bluetooth-peripheral")) & 1) != 0)
        v25 = 0;
      else
        v25 = objc_msgSend(v37, "containsObject:", CFSTR("bluetooth")) ^ 1;
    }
    -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("kCBInitOptionRestoreIdentifier"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    delegateFlags = v24->_delegateFlags;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[CBManager getCBPrivacySupported](v24, "getCBPrivacySupported");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKey:", v42, CFSTR("kCBManagerPrivacySupported"));

    if (!v38)
    {
      if ((*(_BYTE *)&delegateFlags & 1) != 0)
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v44 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
          -[CBPeripheralManager initWithDelegate:queue:options:].cold.2((uint64_t)v24, v44, v45, v46, v47, v48, v49, v50);
      }
      goto LABEL_28;
    }
    if ((*(_BYTE *)&delegateFlags & 1) != 0)
    {
      if (!v25)
      {
LABEL_28:
        v51 = (void *)objc_msgSend(v40, "copy");
        -[CBManager startWithQueue:options:sessionType:](v24, "startWithQueue:options:sessionType:", v10, v51, 1);

        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", v54, v24, CFSTR("CBPeripheralManager.m"), 329, CFSTR("%@ has provided a restore identifier but the delegate doesn't implement the peripheralManager:willRestoreState: method"), v24);

      if (!v25)
        goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", v54, v24, CFSTR("CBPeripheralManager.m"), 331, CFSTR("State restoration of CBPeripheralManager is only allowed for applications that have specified the \"bluetooth-peripheral\" background mode"), v24);

    goto LABEL_28;
  }
LABEL_29:

  return v24;
}

- (void)incomingAddress:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCBMsgArgAddressBytes");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 44, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  $43C94FEDEB33BD172F576B255845D8E8 *p_delegateFlags;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  NSMutableArray *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  NSMutableArray *v59;
  objc_super v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)objc_opt_class() == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("state")))
    {
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn || -[CBManager state](self, "state") == 10)
      {
        -[NSLock lock](self->_updateLock, "lock");
        self->_readyForUpdates = 1;
        self->_waitingForReady = 0;
        -[NSLock unlock](self->_updateLock, "unlock");
      }
      else
      {
        v54 = self->_services;
        objc_sync_enter(v54);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v55 = self->_services;
        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v62 != v57)
                objc_enumerationMutation(v55);
              objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "handlePowerNotOn");
            }
            v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
          }
          while (v56);
        }

        objc_sync_exit(v54);
        -[CBPeripheralManager forEachCentral:](self, "forEachCentral:", &__block_literal_global_6);
        -[NSMapTable removeAllObjects](self->_centrals, "removeAllObjects");
        -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 0);
        if (-[CBManager state](self, "state") == CBManagerStateResetting)
        {
          v59 = self->_services;
          objc_sync_enter(v59);
          -[NSMutableArray removeAllObjects](self->_services, "removeAllObjects");
          -[NSMutableDictionary removeAllObjects](self->_characteristicIDs, "removeAllObjects");
          objc_sync_exit(v59);

        }
      }
      -[CBPeripheralManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "peripheralManagerDidUpdateState:", self);

    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("delegate")))
    {
      -[CBPeripheralManager delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      p_delegateFlags = &self->_delegateFlags;
      self->_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);

      -[CBPeripheralManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = 2;
      else
        v17 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFD | v17);

      -[CBPeripheralManager delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = 4;
      else
        v19 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFFB | v19);

      -[CBPeripheralManager delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = 8;
      else
        v21 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFF7 | v21);

      -[CBPeripheralManager delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = 16;
      else
        v23 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFEF | v23);

      -[CBPeripheralManager delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = 32;
      else
        v25 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFDF | v25);

      -[CBPeripheralManager delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = 64;
      else
        v27 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFBF | v27);

      -[CBPeripheralManager delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = 128;
      else
        v29 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFF7F | v29);

      -[CBPeripheralManager delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = 256;
      else
        v31 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFEFF | v31);

      -[CBPeripheralManager delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v33 = 512;
      else
        v33 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFDFF | v33);

      -[CBPeripheralManager delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = 1024;
      else
        v35 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFBFF | v35);

      -[CBPeripheralManager delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v37 = 2048;
      else
        v37 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFF7FF | v37);

      -[CBPeripheralManager delegate](self, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v39 = 4096;
      else
        v39 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFEFFF | v39);

      -[CBPeripheralManager delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = 0x2000;
      else
        v41 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFDFFF | v41);

      -[CBPeripheralManager delegate](self, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v43 = 0x4000;
      else
        v43 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFBFFF | v43);

      -[CBPeripheralManager delegate](self, "delegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v45 = 0x8000;
      else
        v45 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFF7FFF | v45);

      -[CBPeripheralManager delegate](self, "delegate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v47 = 0x10000;
      else
        v47 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFEFFFF | v47);

      -[CBPeripheralManager delegate](self, "delegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v49 = 0x20000;
      else
        v49 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFDFFFF | v49);

      -[CBPeripheralManager delegate](self, "delegate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v51 = 0x40000;
      else
        v51 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFBFFFF | v51);

      -[CBPeripheralManager delegate](self, "delegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v53 = 0x80000;
      else
        v53 = 0;
      *p_delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFF7FFFF | v53);

    }
  }
  else
  {
    v60.receiver = self;
    v60.super_class = (Class)CBPeripheralManager;
    -[CBPeripheralManager observeValueForKeyPath:ofObject:change:context:](&v60, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __70__CBPeripheralManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMtuLength:", 23);
}

- (void)setDesiredConnectionLatency:(CBPeripheralManagerConnectionLatency)latency forCentral:(CBCentral *)central
{
  CBCentral *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v7 = central;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 411, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("central != nil"));

  }
  v12[0] = CFSTR("kCBMsgArgDeviceUUID");
  -[CBPeer identifier](v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("kCBMsgArgConnectionLatency");
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", latency);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 163, v10);

}

- (void)startAdvertising:(NSDictionary *)advertisementData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  NSDictionary *v19;
  const __CFString *v20;
  NSDictionary *v22;
  char v23;
  _BYTE v24[15];
  char v25;
  _BYTE v26[15];
  char v27;
  _BYTE v28[15];
  char v29;
  _BYTE v30[15];
  char v31;
  _BYTE v32[15];
  char v33;
  _BYTE v34[15];
  char v35;
  _BYTE v36[15];
  char v37;
  _BYTE v38[15];
  char v39;
  _BYTE v40[15];
  char v41;
  _BYTE v42[15];
  char v43;
  _BYTE v44[15];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = advertisementData;
  -[NSDictionary allKeys](v22, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v46;
    v20 = CFSTR("kCBAdvDataHashedServiceUUIDs");
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v46 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataTxPowerLevel"), v20))
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_11:
            -[CBPeripheralManager startAdvertising:].cold.1(&v43, v44);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_11;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataManufacturerData")))
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_15:
            -[CBPeripheralManager startAdvertising:].cold.2(&v41, v42);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_15;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataTDSData")))
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
              continue;
LABEL_19:
            -[CBPeripheralManager startAdvertising:].cold.3(&v39, v40);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
            goto LABEL_19;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataIsContact")))
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
              continue;
LABEL_23:
            -[CBPeripheralManager startAdvertising:].cold.4(&v37, v38);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataServiceData")))
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_27:
            -[CBPeripheralManager startAdvertising:].cold.5(&v35, v36);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_27;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataIsConnectable")))
        {
          -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsPrivilegedDaemon"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "BOOLValue");

          if ((v10 & 1) != 0)
            continue;
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_32:
            -[CBPeripheralManager startAdvertising:].cold.6(&v33, v34);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_32;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataIsExtended")) & 1) != 0
               || objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataIsExtendedConnectable")))
        {
          -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsPrivilegedDaemon"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "BOOLValue");

          if ((v12 & 1) != 0)
            continue;
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_38:
            -[CBPeripheralManager startAdvertising:].cold.7(&v31, v32);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_38;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataIsTDS")))
        {
          -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsPrivilegedDaemon"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "BOOLValue");

          if ((v14 & 1) != 0)
            continue;
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_43:
            -[CBPeripheralManager startAdvertising:].cold.8(&v29, v30);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_43;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataTDSData")) & 1) != 0
               || objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvertisementTDSTypeKey")))
        {
          -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsPrivilegedDaemon"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          if ((v16 & 1) != 0)
            continue;
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_49:
            -[CBPeripheralManager startAdvertising:].cold.9(&v27, v28);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_49;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataRawBytesData")) & 1) != 0
               || (objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataRawBytesDataAdvInd")) & 1) != 0
               || objc_msgSend(v8, "isEqualToString:", CFSTR("kCBAdvDataRawBytesDataScanRsp")))
        {
          -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsPrivilegedDaemon"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");

          if ((v18 & 1) != 0)
            continue;
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_56:
            -[CBPeripheralManager startAdvertising:].cold.10(&v25, v26);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_56;
        }
        else
        {
          if (!objc_msgSend(v8, "isEqualToString:", v20))
            continue;
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
              continue;
LABEL_66:
            -[CBPeripheralManager startAdvertising:].cold.11(&v23, v24);
            continue;
          }
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            goto LABEL_66;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v5);
  }

  if (v22)
    v19 = v22;
  else
    v19 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 32, v19);

}

- (void)stopAdvertising
{
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 33, 0);
}

- (void)startPeriodicAdvertising:(id)a3
{
  id v3;

  if (a3)
    v3 = a3;
  else
    v3 = (id)MEMORY[0x1E0C9AA70];
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 34, v3);
}

- (void)stopPeriodicAdvertising:(id)a3
{
  id v3;

  if (a3)
    v3 = a3;
  else
    v3 = (id)MEMORY[0x1E0C9AA70];
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 35, v3);
}

- (void)addService:(CBMutableService *)service
{
  CBMutableService *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  NSMutableDictionary *characteristicIDs;
  void *v56;
  void *v57;
  void *v58;
  NSMutableArray *v59;
  void *v60;
  CBMutableService *v61;
  id obj;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t j;
  void *v69;
  void *v70;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = service;
  v61 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service != nil"));

    v3 = 0;
  }
  -[CBAttribute UUID](v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") == 2)
  {

  }
  else
  {
    -[CBAttribute UUID](v61, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8 == 16)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service.UUID.data.length == 2 || service.UUID.data.length == 16"));
  }

LABEL_8:
  v59 = self->_services;
  objc_sync_enter(v59);
  if (-[NSMutableArray indexOfObject:](self->_services, "indexOfObject:", v61) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 514, CFSTR("Services cannot be added more than once"));

  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  ++self->_attributeIDGenerator;
  objc_msgSend(v9, "numberWithUnsignedInteger:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBMutableService setID:](v61, "setID:", v10);

  v11 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[CBMutableService ID](v61, "ID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBAttribute UUID](v61, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CBService isPrimary](v61, "isPrimary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v12, CFSTR("kCBMsgArgAttributeID"), v13, CFSTR("kCBMsgArgUUID"), v14, CFSTR("kCBMsgArgType"), 0);

  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v60, "setObject:forKeyedSubscript:", v15, CFSTR("kCBMsgArgAttributeIDs"));
  v70 = v15;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[CBService includedServices](v61, "includedServices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v85 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        if (-[NSMutableArray indexOfObject:](self->_services, "indexOfObject:", v20) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 529, CFSTR("Included services must be published before the service(s) that reference them (%@)"), v20);

        }
        objc_msgSend(v20, "ID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v21);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v17);
  }

  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v60, "setObject:forKeyedSubscript:", v65, CFSTR("kCBMsgArgCharacteristics"));
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[CBService characteristics](v61, "characteristics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (v66)
  {
    v64 = *(_QWORD *)v81;
    obj = v23;
    do
    {
      for (j = 0; j != v66; ++j)
      {
        if (*(_QWORD *)v81 != v64)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
        objc_msgSend(v24, "value");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          if (objc_msgSend(v24, "properties") != 2 || (objc_msgSend(v24, "permissions") & 2) != 0)
          {

LABEL_30:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 539, CFSTR("Characteristics with cached values must be read-only"));

            goto LABEL_31;
          }
          v26 = (objc_msgSend(v24, "permissions") & 8) == 0;

          if (!v26)
            goto LABEL_30;
        }
LABEL_31:
        -[NSMutableDictionary allKeysForObject:](self->_characteristicIDs, "allKeysForObject:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count") == 0;

        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 543, CFSTR("Characteristics cannot be added more than once"));

        }
        v30 = (void *)MEMORY[0x1E0CB37E8];
        ++self->_attributeIDGenerator;
        objc_msgSend(v30, "numberWithUnsignedInteger:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setID:", v31);

        v32 = objc_alloc(MEMORY[0x1E0C99E08]);
        objc_msgSend(v24, "ID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "properties"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "permissions"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "value");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (!v37)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v67;
        }
        v69 = (void *)objc_msgSend(v32, "initWithObjectsAndKeys:", v33, CFSTR("kCBMsgArgAttributeID"), v34, CFSTR("kCBMsgArgUUID"), v35, CFSTR("kCBMsgArgCharacteristicProperties"), v36, CFSTR("kCBMsgArgAttributePermissions"), v38, CFSTR("kCBMsgArgData"), 0);
        if (!v37)

        v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v39, CFSTR("kCBMsgArgDescriptors"));
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        objc_msgSend(v24, "descriptors");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v41; ++k)
            {
              if (*(_QWORD *)v77 != v42)
                objc_enumerationMutation(v40);
              v44 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
              v45 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(v44, "UUID");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "value");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)objc_msgSend(v45, "initWithObjectsAndKeys:", v46, CFSTR("kCBMsgArgUUID"), v47, CFSTR("kCBMsgArgData"), 0);

              objc_msgSend(v39, "addObject:", v48);
            }
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
          }
          while (v41);
        }

        objc_msgSend(v65, "addObject:", v69);
      }
      v23 = obj;
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    }
    while (v66);
  }

  if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 36, v60))
  {
    -[NSMutableArray addObject:](self->_services, "addObject:", v61);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    -[CBService characteristics](v61, "characteristics");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v73;
      do
      {
        for (m = 0; m != v51; ++m)
        {
          if (*(_QWORD *)v73 != v52)
            objc_enumerationMutation(v50);
          v54 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * m);
          characteristicIDs = self->_characteristicIDs;
          objc_msgSend(v54, "ID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](characteristicIDs, "setObject:forKeyedSubscript:", v54, v56);

        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      }
      while (v51);
    }

  }
  objc_sync_exit(v59);

}

- (void)removeService:(CBMutableService *)service
{
  CBMutableService *v4;
  NSMutableArray *services;
  CBMutableService *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  NSMutableDictionary *characteristicIDs;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *obj;
  NSMutableArray *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  CBMutableService *v49;
  _BYTE v50[128];
  const __CFString *v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = service;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 579, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service != nil"));

  }
  v35 = self->_services;
  objc_sync_enter(v35);
  services = self->_services;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __37__CBPeripheralManager_removeService___block_invoke;
  v48[3] = &unk_1E5402698;
  v6 = v4;
  v49 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](services, "indexOfObjectPassingTest:", v48);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
  }
  else
  {
    v32 = v7;
    -[NSMutableArray objectAtIndexedSubscript:](self->_services, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = self->_services;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v9)
    {
      v31 = *(_QWORD *)v45;
      do
      {
        v30 = v9;
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v11, "includedServices");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v41;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v41 != v14)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "ID");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "ID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

                if (v18)
                {

                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 607, CFSTR("Cannot remove a service that is still included by one or more published services"));
                  goto LABEL_22;
                }
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
              if (v13)
                continue;
              break;
            }
          }

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      }
      while (v9);
    }
    v19 = obj;
LABEL_22:

    v51 = CFSTR("kCBMsgArgAttributeID");
    objc_msgSend(v8, "ID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 37, v21);

    if (v22)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v8, "characteristics");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v37;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v23);
            characteristicIDs = self->_characteristicIDs;
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "ID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](characteristicIDs, "removeObjectForKey:", v28);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
        }
        while (v24);
      }

      -[NSMutableArray removeObjectAtIndex:](self->_services, "removeObjectAtIndex:", v32);
    }
  }

  objc_sync_exit(v35);
}

uint64_t __37__CBPeripheralManager_removeService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  return v5;
}

- (void)removeAllServices
{
  NSMutableArray *obj;

  obj = self->_services;
  objc_sync_enter(obj);
  if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 38, 0))
  {
    -[NSMutableDictionary removeAllObjects](self->_characteristicIDs, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_services, "removeAllObjects");
  }
  objc_sync_exit(obj);

}

- (void)respondToRequest:(CBATTRequest *)request withResult:(CBATTError)result
{
  CBATTRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CBATTRequest *v13;

  v7 = request;
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 630, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    if ((objc_msgSend(0, "ignoreResponse") & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!-[CBATTRequest ignoreResponse](v7, "ignoreResponse"))
  {
LABEL_3:
    -[CBATTRequest transactionID](v13, "transactionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBATTRequest value](v13, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBATTRequest characteristic](v13, "characteristic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheralManager respondToTransaction:value:attributeID:result:](self, "respondToTransaction:value:attributeID:result:", v8, v9, v11, result);

  }
LABEL_4:

}

- (void)respondToTransaction:(id)a3 value:(id)a4 attributeID:(id)a5 result:(int64_t)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  v15 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v14, "initWithObjectsAndKeys:", v13, CFSTR("kCBMsgArgTransactionID"), v15, CFSTR("kCBMsgArgData"), v11, CFSTR("kCBMsgArgAttributeID"), v16, CFSTR("kCBMsgArgResult"), 0);

  if (!v12)
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 39, v17);

}

- (BOOL)updateValue:(NSData *)value forCharacteristic:(CBMutableCharacteristic *)characteristic onSubscribedCentrals:(NSArray *)centrals
{
  NSData *v9;
  CBMutableCharacteristic *v10;
  NSArray *v11;
  _BOOL4 readyForUpdates;
  id v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  NSArray *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = value;
  v10 = characteristic;
  v11 = centrals;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 652, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 653, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

LABEL_3:
  -[NSLock lock](self->_updateLock, "lock");
  readyForUpdates = self->_readyForUpdates;
  if (self->_readyForUpdates)
  {
    self->_readyForUpdates = 0;
    -[NSLock unlock](self->_updateLock, "unlock");
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v11;
    v14 = v11;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);
    }

    v20 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[CBMutableCharacteristic ID](v10, "ID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", v13, CFSTR("kCBMsgArgUUIDs"), v9, CFSTR("kCBMsgArgData"), v21, CFSTR("kCBMsgArgAttributeID"), 0);

    -[CBManager sendMsg:args:](self, "sendMsg:args:", 40, v22);
    v11 = v26;
  }
  else
  {
    self->_waitingForReady = 1;
    -[NSLock unlock](self->_updateLock, "unlock");
  }

  return readyForUpdates;
}

- (BOOL)supportsMultipleAdvertising
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;

  -[CBPeripheralManager multipleAdvertisingSupported](self, "multipleAdvertisingSupported");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 41, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      -[CBPeripheralManager supportsMultipleAdvertising].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheralManager setMultipleAdvertisingSupported:](self, "setMultipleAdvertisingSupported:", v14);

  }
  -[CBPeripheralManager multipleAdvertisingSupported](self, "multipleAdvertisingSupported");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  return v16;
}

+ (BOOL)supportsFeatures:(unint64_t)a3
{
  return (a3 & ~(unint64_t)gSupportedFeatures_0) == 0;
}

- (void)setOfflineAdvertisingParamsAndData:(id)a3
{
  +[CBController setOfflineAdvertisingParams:](CBController, "setOfflineAdvertisingParams:", a3);
}

- (void)retrieveBluetoothUsageStatistics:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CBPeripheralManager_retrieveBluetoothUsageStatistics_completion___block_invoke;
  v7[3] = &unk_1E53FF618;
  v8 = v5;
  v6 = v5;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 218, &unk_1E5424058, v7);

}

void __67__CBPeripheralManager_retrieveBluetoothUsageStatistics_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v12 = objc_alloc_init(v5);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBUsageStatsLePercent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("kCBUsageStatsLePercent"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBUsageStatsClPercent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("kCBUsageStatsClPercent"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBUsageStatsIsAudioStreaming"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("kCBUsageStatsIsAudioStreaming"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBUsageStatsTimeStampNsMonotonic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("kCBUsageStatsTimeStampNsMonotonic"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)handleRestoringState:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CBMutableService *v11;
  void *v12;
  unint64_t v13;
  unint64_t attributeIDGenerator;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t j;
  void *v26;
  id v27;
  CBMutableCharacteristic *v28;
  NSMutableDictionary *characteristicIDs;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  CBMutableCharacteristic *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  CBMutableDescriptor *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  CBPeripheralManager *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  CBMutableCharacteristic *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _QWORD v97[2];
  _QWORD v98[2];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheralManager.m"), 724, CFSTR("Registered delegate no longer supports restoring"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSubscribedHandles"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisementData"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kCBRestoredAdvertisement"));
    -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 1);
  }
  v55 = v6;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v56 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServices"), v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v65 = self;
  v61 = v7;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
  if (v59)
  {
    v58 = *(_QWORD *)v91;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v91 != v58)
          objc_enumerationMutation(obj);
        v60 = v9;
        v10 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v9);
        v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = -[CBMutableService initWithDictionary:]([CBMutableService alloc], "initWithDictionary:", v10);
        -[NSMutableArray addObject:](self->_services, "addObject:", v11);
        -[CBMutableService ID](v11, "ID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");
        attributeIDGenerator = self->_attributeIDGenerator;

        if (v13 > attributeIDGenerator)
        {
          -[CBMutableService ID](v11, "ID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          self->_attributeIDGenerator = objc_msgSend(v15, "unsignedIntegerValue");

        }
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIncludedServices"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v87 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
              v98[0] = v11;
              v97[0] = CFSTR("service");
              v97[1] = CFSTR("incID");
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v98[1] = v22;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "addObject:", v23);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
          }
          while (v18);
        }

        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristics"));
        v62 = (id)objc_claimAutoreleasedReturnValue();
        v24 = v67;
        v68 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
        if (v68)
        {
          v66 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v68; ++j)
            {
              if (*(_QWORD *)v83 != v66)
                objc_enumerationMutation(v62);
              v26 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
              v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v28 = -[CBMutableCharacteristic initWithService:dictionary:]([CBMutableCharacteristic alloc], "initWithService:dictionary:", v11, v26);
              characteristicIDs = self->_characteristicIDs;
              -[CBMutableCharacteristic ID](v28, "ID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](characteristicIDs, "setObject:forKeyedSubscript:", v28, v30);

              -[CBMutableCharacteristic ID](v28, "ID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "unsignedIntegerValue");
              v33 = self->_attributeIDGenerator;

              if (v32 > v33)
              {
                -[CBMutableCharacteristic ID](v28, "ID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                self->_attributeIDGenerator = objc_msgSend(v34, "unsignedIntegerValue");

              }
              v80[0] = MEMORY[0x1E0C809B0];
              v80[1] = 3221225472;
              v80[2] = __44__CBPeripheralManager_handleRestoringState___block_invoke;
              v80[3] = &unk_1E54026C0;
              v80[4] = self;
              v35 = v28;
              v81 = v35;
              objc_msgSend(v64, "enumerateObjectsUsingBlock:", v80);
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDescriptors"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v77;
                do
                {
                  for (k = 0; k != v38; ++k)
                  {
                    if (*(_QWORD *)v77 != v39)
                      objc_enumerationMutation(v36);
                    v41 = -[CBMutableDescriptor initWithCharacteristic:dictionary:]([CBMutableDescriptor alloc], "initWithCharacteristic:dictionary:", v35, *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k));
                    objc_msgSend(v27, "addObject:", v41);

                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
                }
                while (v38);
              }

              if (objc_msgSend(v27, "count"))
                -[CBCharacteristic setDescriptors:](v35, "setDescriptors:", v27);
              v24 = v67;
              objc_msgSend(v67, "addObject:", v35);

              self = v65;
            }
            v68 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
          }
          while (v68);
        }

        if (objc_msgSend(v24, "count"))
          -[CBService setCharacteristics:](v11, "setCharacteristics:", v24);
        objc_msgSend(v61, "addObject:", v11);

        v9 = v60 + 1;
      }
      while (v60 + 1 != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    }
    while (v59);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v42 = v63;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v73;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v73 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * m);
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("service"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("incID"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __44__CBPeripheralManager_handleRestoringState___block_invoke_2;
        v69[3] = &unk_1E54026C0;
        v70 = v49;
        v71 = v48;
        v50 = v48;
        v51 = v49;
        objc_msgSend(v61, "enumerateObjectsUsingBlock:", v69);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
    }
    while (v44);
  }

  if (objc_msgSend(v61, "count"))
  {
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v61, CFSTR("kCBRestoredServices"));
    v65->_attributeIDGenerator += 16;
  }
  -[CBPeripheralManager delegate](v65, "delegate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "peripheralManager:willRestoreState:", v65, v55);

}

void __44__CBPeripheralManager_handleRestoringState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "centralWithInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToNumber:", v5);

    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "handleCentralSubscribed:", v4);
  }

}

void __44__CBPeripheralManager_handleRestoringState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "includedServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "includedServices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "mutableCopy");

    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }

    objc_msgSend(v10, "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setIncludedServices:", v10);
    *a4 = 1;

  }
}

- (void)handleServiceAdded:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *services;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableDictionary *characteristicIDs;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_services;
  objc_sync_enter(v6);
  services = self->_services;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __42__CBPeripheralManager_handleServiceAdded___block_invoke;
  v23[3] = &unk_1E5402698;
  v17 = v5;
  v24 = v17;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](services, "indexOfObjectPassingTest:", v23);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_services, "objectAtIndexedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_services, "removeObjectAtIndex:", v8);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v16, "characteristics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v9);
            characteristicIDs = self->_characteristicIDs;
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "ID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](characteristicIDs, "removeObjectForKey:", v14);

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v10);
      }

    }
    if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
    {
      -[CBPeripheralManager delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "peripheralManager:didAddService:error:", self, v16, v18);

    }
  }

  objc_sync_exit(v6);
}

uint64_t __42__CBPeripheralManager_handleServiceAdded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)handleGetAttributeValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  CBATTRequest *v8;
  void *v9;
  void *v10;
  CBATTRequest *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTransactionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBMsgArgOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_services;
  objc_sync_enter(v7);
  v8 = [CBATTRequest alloc];
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CBATTRequest initWithCentral:characteristic:offset:transactionID:](v8, "initWithCentral:characteristic:offset:transactionID:", v9, v10, objc_msgSend(v6, "unsignedIntegerValue"), v4);

  -[CBATTRequest characteristic](v11, "characteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
    {
      -[CBPeripheralManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "peripheralManager:didReceiveReadRequest:", self, v11);

    }
    else
    {
      -[CBPeripheralManager respondToRequest:withResult:](self, "respondToRequest:withResult:", v11, 6);
    }
  }
  else
  {
    -[CBPeripheralManager respondToTransaction:value:attributeID:result:](self, "respondToTransaction:value:attributeID:result:", v4, 0, v5, 10);
  }

  objc_sync_exit(v7);
}

- (void)handleSetAttributeValues:(id)a3
{
  void *v4;
  CBATTRequest *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  CBATTRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  id v22;
  id obj;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTransactionID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kCBMsgArgATTWrites"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_services;
  objc_sync_enter(v21);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"), v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgOffset"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      -[CBATTRequest characteristic](v5, "characteristic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v14)
      {
        v15 = v13 == -[CBATTRequest endOffset](v5, "endOffset");

        if (v15)
          goto LABEL_10;
      }
      else
      {

      }
      v16 = -[CBATTRequest initWithCentral:characteristic:offset:transactionID:]([CBATTRequest alloc], "initWithCentral:characteristic:offset:transactionID:", v24, v11, v13, v25);

      objc_msgSend(v26, "addObject:", v16);
      v5 = v16;
LABEL_10:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBATTRequest appendValueData:](v5, "appendValueData:", v17);

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIgnoreResponse"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBATTRequest setIgnoreResponse:](v5, "setIgnoreResponse:", objc_msgSend(v18, "BOOLValue"));

      -[CBATTRequest characteristic](v5, "characteristic");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = v19 == 0;

      if ((_DWORD)v18)
      {
        if (!-[CBATTRequest ignoreResponse](v5, "ignoreResponse"))
          -[CBPeripheralManager respondToTransaction:value:attributeID:result:](self, "respondToTransaction:value:attributeID:result:", v25, 0, v10, 10);
        goto LABEL_18;
      }
      if ((*(_BYTE *)&self->_delegateFlags & 8) == 0)
      {
        -[CBPeripheralManager respondToRequest:withResult:](self, "respondToRequest:withResult:", v5, 6);
LABEL_18:

        v20 = obj;
        goto LABEL_19;
      }

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  -[CBPeripheralManager delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "peripheralManager:didReceiveWriteRequests:", self, v26);
LABEL_19:

  objc_sync_exit(v21);
}

- (void)handleNotificationAdded:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_services;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "handleCentralSubscribed:", v4) && (*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peripheralManager:central:didSubscribeToCharacteristic:", self, v4, v7);

  }
  objc_sync_exit(v6);

}

- (void)handleNotificationRemoved:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  char v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  id v25;
  CBPeripheralManager *v26;
  NSMutableArray *obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
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
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = self;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_services;
  objc_sync_enter(v23);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "handleCentralUnsubscribed:", v4) ^ 1;
  else
    LOBYTE(v7) = 1;
  v21 = v7;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = self->_services;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  v22 = v6;
  if (!v8)
  {

LABEL_31:
    objc_msgSend(v4, "setMtuLength:", 23);
    goto LABEL_32;
  }
  v28 = *(_QWORD *)v40;
  v29 = v8;
  v9 = 1;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v40 != v28)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v10, "characteristics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(v15, "subscribedCentrals");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v32;
              while (2)
              {
                for (k = 0; k != v17; ++k)
                {
                  if (*(_QWORD *)v32 != v18)
                    objc_enumerationMutation(v16);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "isEqual:", v4) & 1) != 0)
                  {
                    v9 = 0;
                    goto LABEL_24;
                  }
                }
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
                if (v17)
                  continue;
                break;
              }
            }
LABEL_24:

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v12);
      }

    }
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  }
  while (v29);

  if ((v9 & 1) != 0)
    goto LABEL_31;
LABEL_32:
  if ((v21 & 1) == 0 && (*(_BYTE *)&v26->_delegateFlags & 0x20) != 0)
  {
    -[CBPeripheralManager delegate](v26, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "peripheralManager:central:didUnsubscribeFromCharacteristic:", v26, v4, v22);

  }
  objc_sync_exit(v23);

}

- (void)handleAdvertisingStarted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 341);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

  if (v8)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
    {
      -[CBPeripheralManager handleAdvertisingStarted:].cold.1();
      if ((*(_BYTE *)&self->_delegateFlags & 0x40) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 348);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

    if (v11)
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
      {
        -[CBPeripheralManager handleAdvertisingStarted:].cold.2();
        if ((*(_BYTE *)&self->_delegateFlags & 0x40) == 0)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
  }
  if ((*(_BYTE *)&self->_delegateFlags & 0x40) != 0)
  {
LABEL_14:
    -[CBPeripheralManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "peripheralManagerDidStartAdvertising:error:", self, v5);

  }
LABEL_15:

}

- (void)handleAdvertisingStopped:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 0);
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x80) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peripheralManager:didStopAdvertisingWithError:", self, v5);

  }
}

- (void)handlePeriodicAdvertisingStarted:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_delegateFlags & 0x80) != 0)
  {
    v6 = v4;
    -[CBPeripheralManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peripheralManager:didStartPeriodicAdvertising:", self, v6);

    v4 = v6;
  }

}

- (void)handlePeriodicAdvertisingStopped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 1) != 0)
  {
    v6 = v4;
    -[CBPeripheralManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peripheralManager:didStopPeriodicAdvertising:", self, v6);

    v4 = v6;
  }

}

- (void)handleReadyForUpdates:(id)a3
{
  _BOOL4 waitingForReady;
  id v5;

  -[NSLock lock](self->_updateLock, "lock", a3);
  self->_readyForUpdates = 1;
  waitingForReady = self->_waitingForReady;
  self->_waitingForReady = 0;
  -[NSLock unlock](self->_updateLock, "unlock");
  if (waitingForReady && (*((_BYTE *)&self->_delegateFlags + 1) & 2) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peripheralManagerIsReadyToUpdateSubscribers:", self);

  }
}

- (void)handleSolicitedServicesFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 4) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "peripheralManager:central:didConnectWithServiceUUIDs:", self, v7, v5);

  }
}

- (void)handleConnectionParametersUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionLatency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSupervisionTimeout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (*((_BYTE *)&self->_delegateFlags + 1) & 8) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peripheralManager:didUpdateConnectionParameters:interval:latency:supervisionTimeout:", self, v9, v5, v6, v7);

  }
}

- (void)handleSupportedFeatures:(id)a3
{
  void *v3;
  id v4;

  gSupportedFeatures_0 = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSupportedFeatures"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgSupportsExtendedAdvertising"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    gSupportedFeatures_0 = 1;

}

- (void)handleL2CAPChannelOpened:(id)a3
{
  id v4;
  void *v5;
  CBL2CAPChannel *v6;
  NSMapTable *centrals;
  void *v8;
  CBCentral *v9;
  NSMapTable *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheralManager handleL2CAPChannelOpened:].cold.3();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        v6 = 0;
        if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) == 0)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
    -[CBPeripheralManager handleL2CAPChannelOpened:].cold.2();
    v6 = 0;
    if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) == 0)
      goto LABEL_16;
LABEL_15:
    -[CBPeripheralManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "peripheralManager:didOpenL2CAPChannel:error:", self, v6, v5);

    goto LABEL_16;
  }
  centrals = self->_centrals;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](centrals, "objectForKey:", v8);
  v9 = (CBCentral *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        v9 = -[CBPeer initWithInfo:manager:]([CBCentral alloc], "initWithInfo:manager:", v4, self);
        v10 = self->_centrals;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v9, v11);

        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
    }
    -[CBPeripheralManager handleL2CAPChannelOpened:].cold.1();
    goto LABEL_13;
  }
LABEL_14:
  v6 = -[CBL2CAPChannel initWithPeer:info:]([CBL2CAPChannel alloc], "initWithPeer:info:", v9, v4);
  -[NSHashTable addObject:](self->_l2capChannels, "addObject:", v6);

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) != 0)
    goto LABEL_15;
LABEL_16:

}

- (void)handleL2CAPChannelClosed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  NSMapTable *centrals;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "errorWithInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kCBMsgArgPSM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  centrals = self->_centrals;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](centrals, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v12 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheralManager handleL2CAPChannelClosed:].cold.1(v8, (uint64_t)v6, v12);
  -[CBPeripheralManager l2capChannelForPeer:withPsm:](self, "l2capChannelForPeer:withPsm:", v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable removeObject:](self->_l2capChannels, "removeObject:", v13);

}

- (void)handleL2CAPChannelPublished:(id)a3
{
  id v4;
  void *v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgPSM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intValue");

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheralManager handleL2CAPChannelPublished:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peripheralManager:didPublishL2CAPChannel:error:", self, v6, v8);

  }
}

- (void)handleL2CAPChannelUnpublished:(id)a3
{
  id v4;
  void *v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgPSM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intValue");

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheralManager handleL2CAPChannelUnpublished:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x20) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peripheralManager:didUnpublishL2CAPChannel:error:", self, v6, v8);

  }
}

- (void)handleCentralDidUpdateANCSAuthorization:(id)a3
{
  id v4;
  NSMapTable *centrals;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  centrals = self->_centrals;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](centrals, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheralManager handleCentralDidUpdateANCSAuthorization:].cold.1();
    -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgAncsAuthorization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 1) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "peripheralManager:central:didUpdateANCSAuthorization:", self, v7, v9);

  }
}

- (void)HandleControllerPeripheralBTClockUpdateMsg:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  $43C94FEDEB33BD172F576B255845D8E8 delegateFlags;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTClockSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTClockMicroSeconds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTClockEventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTLocalClock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTRemoteClock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  delegateFlags = self->_delegateFlags;
  if ((*(_DWORD *)&delegateFlags & 0x20000) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "peripheralManager:didUpdateControllerBTClock:seconds:microseconds:localClock:remoteClock:", self, v6, v4, v5, v7, v8);

    delegateFlags = self->_delegateFlags;
  }
  if ((*(_DWORD *)&delegateFlags & 0x40000) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "peripheralManager:didUpdateControllerBTClockDict:", self, v12);

  }
}

- (void)HandleOfflineAdvPayloadRequestedWithReason:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("kCBMsgArgReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 8) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "peripheralManager:offlineAdvPayloadRequestedWithReason:", self, v5);

  }
}

- (void)handleIncomingCISConnectionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBPeripheralManager handleIncomingCISConnectionRequest:].cold.1();
    if (!self->_incomingConnectionRequestCompletion)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (self->_incomingConnectionRequestCompletion)
  {
LABEL_5:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBLEAudioArgCigId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBLEAudioArgCisId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_incomingConnectionRequestCompletion + 2))();

  }
LABEL_6:

}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  if ((a3 - 14) < 0x19 && ((0x1CC0001u >> (a3 - 14)) & 1) != 0)
    return 1;
  return a3 == 10 || a3 == 43;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 <= 0x29u && ((1 << a3) & 0x20000000300) != 0)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CBPeripheralManager;
  return -[CBManager isMsgAllowedAlways:](&v6, sel_isMsgAllowedAlways_);
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSMapTable *centrals;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  switch((int)v4)
  {
    case 16:
    case 17:
    case 18:
      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handlePairingMessage:args:", v4, v7);

      goto LABEL_3;
    case 21:
      -[CBPeripheralManager handleL2CAPChannelPublished:](self, "handleL2CAPChannelPublished:", v6);

      break;
    case 22:
      -[CBPeripheralManager handleL2CAPChannelUnpublished:](self, "handleL2CAPChannelUnpublished:", v6);

      break;
    case 23:
      -[CBPeripheralManager handleL2CAPChannelOpened:](self, "handleL2CAPChannelOpened:", v6);

      break;
    case 24:
      -[CBPeripheralManager handleL2CAPChannelClosed:](self, "handleL2CAPChannelClosed:", v6);

      break;
    case 29:
      -[CBPeripheralManager handleSupportedFeatures:](self, "handleSupportedFeatures:", v6);

      break;
    case 47:
      -[CBPeripheralManager handleAdvertisingStarted:](self, "handleAdvertisingStarted:", v6);

      break;
    case 48:
      -[CBPeripheralManager handleAdvertisingStopped:](self, "handleAdvertisingStopped:", v6);

      break;
    case 49:
      -[CBPeripheralManager handlePeriodicAdvertisingStarted:](self, "handlePeriodicAdvertisingStarted:", v6);

      break;
    case 50:
      -[CBPeripheralManager handlePeriodicAdvertisingStopped:](self, "handlePeriodicAdvertisingStopped:", v6);

      break;
    case 51:
      -[CBPeripheralManager handleServiceAdded:](self, "handleServiceAdded:", v6);

      break;
    case 52:
      -[CBPeripheralManager handleGetAttributeValue:](self, "handleGetAttributeValue:", v6);

      break;
    case 53:
      -[CBPeripheralManager handleSetAttributeValues:](self, "handleSetAttributeValues:", v6);

      break;
    case 54:
      -[CBPeripheralManager handleNotificationAdded:](self, "handleNotificationAdded:", v6);

      break;
    case 55:
      -[CBPeripheralManager handleNotificationRemoved:](self, "handleNotificationRemoved:", v6);

      break;
    case 56:
      -[CBPeripheralManager handleReadyForUpdates:](self, "handleReadyForUpdates:", v6);

      break;
    case 57:
      -[CBPeripheralManager handleRestoringState:](self, "handleRestoringState:", v6);

      break;
    case 58:
      -[CBPeripheralManager handleSolicitedServicesFound:](self, "handleSolicitedServicesFound:", v6);

      break;
    case 59:
      -[CBPeripheralManager handleAdvertisingAddressChanged:](self, "handleAdvertisingAddressChanged:", v6);

      break;
    case 61:
      -[CBPeripheralManager handleCentralDidUpdateANCSAuthorization:](self, "handleCentralDidUpdateANCSAuthorization:", v6);

      break;
    case 62:
      -[CBPeripheralManager HandleOfflineAdvPayloadRequestedWithReason:](self, "HandleOfflineAdvPayloadRequestedWithReason:", v6);

      break;
    case 157:
      -[CBPeripheralManager handleIncomingCISConnectionRequest:](self, "handleIncomingCISConnectionRequest:", v6);

      break;
    case 164:
    case 165:
    case 166:
      centrals = self->_centrals;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](centrals, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "handleMsg:args:", v4, v7);
      break;
    case 167:
      -[CBPeripheralManager handleConnectionParametersUpdated:](self, "handleConnectionParametersUpdated:", v6);

      break;
    case 210:
      -[CBPeripheralManager HandleControllerPeripheralBTClockUpdateMsg:](self, "HandleControllerPeripheralBTClockUpdateMsg:", v6);

      break;
    default:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v12 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
        -[CBCentralManager handleMsg:args:].cold.1(v4, v12);

      }
      else
      {
LABEL_3:

      }
      break;
  }
}

- (id)addXPCDelayTiming:(id)a3 args:(id)a4
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = (__CFString *)a4;
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBOptionUseCase"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  v8 = (void *)v7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBOptionUseCase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "unsignedLongValue") != 22)
  {

    goto LABEL_9;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTimeXpcTimestampsTracking"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_9:
    v11 = v5;
    goto LABEL_10;
  }
  if (!v6)
    v6 = CFSTR("Unknown Timestamp");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTimeXpcTimestampsTracking"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", clock_gettime_nsec_np(_CLOCK_MONOTONIC) / 0xF4240);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("kCBMsgArgTimeXpcTimestampsTracking"));

LABEL_10:
  return v11;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (NSMapTable)centrals
{
  return self->_centrals;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (NSMutableDictionary)characteristicIDs
{
  return self->_characteristicIDs;
}

- (NSLock)updateLock
{
  return self->_updateLock;
}

- (BOOL)readyForUpdates
{
  return self->_readyForUpdates;
}

- (BOOL)waitingForReady
{
  return self->_waitingForReady;
}

- (NSNumber)multipleAdvertisingSupported
{
  return self->_multipleAdvertisingSupported;
}

- (void)setMultipleAdvertisingSupported:(id)a3
{
  objc_storeStrong((id *)&self->_multipleAdvertisingSupported, a3);
}

- (NSHashTable)l2capChannels
{
  return self->_l2capChannels;
}

- (id)incomingConnectionRequestCompletion
{
  return self->_incomingConnectionRequestCompletion;
}

- (void)setIncomingConnectionRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unint64_t)attributeIDGenerator
{
  return self->_attributeIDGenerator;
}

- (void)setAttributeIDGenerator:(unint64_t)a3
{
  self->_attributeIDGenerator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incomingConnectionRequestCompletion, 0);
  objc_storeStrong((id *)&self->_l2capChannels, 0);
  objc_storeStrong((id *)&self->_multipleAdvertisingSupported, 0);
  objc_storeStrong((id *)&self->_updateLock, 0);
  objc_storeStrong((id *)&self->_characteristicIDs, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_centrals, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)publishL2CAPChannel:(uint64_t)a1 requiresEncryption:(uint64_t)a2 options:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a2 & 1;
  OUTLINED_FUNCTION_4_0(&dword_1A82A2000, a2, a3, "Publish L2CAP channel with psm : %u and encryptionRequirement:%d", 67109376, v3);
  OUTLINED_FUNCTION_1();
}

- (void)unpublishL2CAPChannel:(unsigned __int16)a1 .cold.1(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A82A2000, a2, OS_LOG_TYPE_DEBUG, "Unpublish L2CAP channel with psm : %u ", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)overrideLocalLeAddress:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A82A2000, a2, a3, "Overriding local address with %@ ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)l2capChannelForPeer:withPsm:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1A82A2000, v0, v1, "No known channel matching peer %@ with psm %u");
  OUTLINED_FUNCTION_1();
}

+ (void)authorizationStatus
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_4(&dword_1A82A2000, v0, v1, "WARNING: Use of deprecated method. Please use CBManagerAuthorization instead.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDelegate:(uint64_t)a3 queue:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A82A2000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDelegate:(uint64_t)a3 queue:(uint64_t)a4 options:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A82A2000, a2, a3, "WARNING: %@ has no restore identifier but the delegate implements the peripheralManager:willRestoreState: method. Restoring will not be supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startAdvertising:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Tx Power Level' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Manufacturer Data' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_6_0(&dword_1A82A2000, v2, (uint64_t)v2, "The advertisement key 'TDS Data' is a new option", v3);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_6_0(&dword_1A82A2000, v2, (uint64_t)v2, "The advertisement key 'Contact Data' is a new option", v3);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.5(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Service Data' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.6(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Is Connectable' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.7(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Is Extended' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.8(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Is TDS' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.9(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'TDS' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.10(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Raw Bytes' is not allowed", v4);
}

- (void)startAdvertising:(_BYTE *)a1 .cold.11(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1A82A2000, v2, v3, "WARNING: The advertisement key 'Overflow Service UUIDs' is not allowed", v4);
}

- (void)supportsMultipleAdvertising
{
  OUTLINED_FUNCTION_2_0(&dword_1A82A2000, a2, a3, "Current device %@ multiple advertising", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleAdvertisingStarted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A82A2000, v0, v1, "BundleID is NOT in the allowed CBPeripheralSession list for advertising. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleAdvertisingStarted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A82A2000, v0, v1, "CBUseCase is not provided in startAdvertising while it is required. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleL2CAPChannelOpened:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_4(&dword_1A82A2000, v0, v1, "No central present! Creating a new object. This shouldn't happen.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)handleL2CAPChannelOpened:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_4(&dword_1A82A2000, v0, v1, "Failed to open L2CAP channel", v2);
  OUTLINED_FUNCTION_5();
}

- (void)handleL2CAPChannelOpened:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_1A82A2000, v0, v1, "l2CAP channel opened", v2);
  OUTLINED_FUNCTION_5();
}

- (void)handleL2CAPChannelClosed:(os_log_t)log .cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "l2CAP channel closed with psm : %u and result : %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)handleL2CAPChannelPublished:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1A82A2000, v0, v1, "l2CAP channel published : psm : %u, result : %d", v2, v3);
  OUTLINED_FUNCTION_1();
}

- (void)handleL2CAPChannelUnpublished:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1A82A2000, v0, v1, "l2CAP channel unpublished : psm : %u, result : %d", v2, v3);
  OUTLINED_FUNCTION_1();
}

- (void)handleCentralDidUpdateANCSAuthorization:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1A82A2000, v0, v1, "Unexpectedly could not find a central given args %{public}@ delegateImplemented %d");
  OUTLINED_FUNCTION_1();
}

- (void)handleIncomingCISConnectionRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_1A82A2000, v0, v1, "Incoming CIS Connection Request Received", v2);
  OUTLINED_FUNCTION_5();
}

@end
