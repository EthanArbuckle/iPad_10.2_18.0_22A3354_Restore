@implementation SYLegacyStore

+ (id)fullSyncActivityDictionary
{
  if (fullSyncActivityDictionary_onceToken != -1)
    dispatch_once(&fullSyncActivityDictionary_onceToken, &__block_literal_global_1);
  return (id)fullSyncActivityDictionary___dict;
}

void __43__SYLegacyStore_fullSyncActivityDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  v1 = (void *)fullSyncActivityDictionary___dict;
  fullSyncActivityDictionary___dict = v0;

}

- (SYLegacyStore)initWithService:(id)a3
{
  return -[SYLegacyStore initWithService:isGStore:highPriority:](self, "initWithService:isGStore:highPriority:", a3, 0, 0);
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  SYLegacyStore *v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)MGCopyAnswer();
  v10 = -[SYLegacyStore initWithService:isGStore:highPriority:isMasterStore:](self, "initWithService:isGStore:highPriority:isMasterStore:", v8, v6, v5, objc_msgSend(v9, "intValue") != 6);

  return v10;
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6
{
  return -[SYLegacyStore initWithService:isGStore:priority:isMasterStore:](self, "initWithService:isGStore:priority:isMasterStore:", a3, a4, a5, a6);
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6
{
  return -[SYLegacyStore initWithService:isGStore:priority:isMasterStore:tracksChanges:](self, "initWithService:isGStore:priority:isMasterStore:tracksChanges:", a3, a4, a5, a6, 1);
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  return -[SYLegacyStore initWithService:isGStore:priority:isMasterStore:tracksChanges:](self, "initWithService:isGStore:priority:isMasterStore:tracksChanges:", a3, a4, a5, a6, a7);
}

- (SYLegacyStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  SYLegacyStore *v14;
  SYLegacyStore *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  NSString *databaseFileName;
  NSObject *v20;
  uint64_t v21;
  NSMutableDictionary *sendSignals;
  void *v23;
  void *v24;
  id v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *queue;
  id v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *qosTargetQueue;
  NSObject *v34;
  _QWORD block[4];
  SYLegacyStore *v37;
  BOOL v38;
  objc_super v39;
  uint8_t buf[4];
  SYLegacyStore *v41;
  uint64_t v42;

  v7 = a7;
  v42 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SYLegacyStore;
  v14 = -[SYStore init](&v39, sel_init);
  v15 = v14;
  if (v14)
  {
    -[SYLegacyStore setTracksChanges:](v14, "setTracksChanges:", v7);
    objc_storeStrong((id *)&v15->_service, a3);
    v15->_priority = a5;
    if ((unint64_t)a5 > 2)
      v16 = 0;
    else
      v16 = off_24CC65B38[a5];
    -[SYLegacyStore service](v15, "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathExtension:", v16);
    v18 = objc_claimAutoreleasedReturnValue();
    databaseFileName = v15->_databaseFileName;
    v15->_databaseFileName = (NSString *)v18;

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v20 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v41 = v15;
      _os_log_impl(&dword_211704000, v20, OS_LOG_TYPE_INFO, "Initializing new second-generation SYStore %p", buf, 0xCu);
    }
    v15->_alwaysWins = a6;
    v21 = objc_opt_new();
    sendSignals = v15->_sendSignals;
    v15->_sendSignals = (NSMutableDictionary *)v21;

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("companionsync_serial.%p"), v15);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("companionsync_serial_qos.%p"), v15);
    v25 = objc_retainAutorelease(v23);
    v26 = dispatch_queue_create((const char *)objc_msgSend(v25, "UTF8String"), 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v26;

    v28 = objc_retainAutorelease(v24);
    v29 = (const char *)objc_msgSend(v28, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_DEFAULT, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create(v29, v31);
    qosTargetQueue = v15->super._qosTargetQueue;
    v15->super._qosTargetQueue = (OS_dispatch_queue *)v32;

    dispatch_set_target_queue((dispatch_object_t)v15->_queue, (dispatch_queue_t)v15->super._qosTargetQueue);
    v34 = v15->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__SYLegacyStore_initWithService_isGStore_priority_isMasterStore_tracksChanges___block_invoke;
    block[3] = &unk_24CC65860;
    v37 = v15;
    v38 = a4;
    dispatch_sync(v34, block);

  }
  return v15;
}

uint64_t __79__SYLegacyStore_initWithService_isGStore_priority_isMasterStore_tracksChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "setAllowsDeletes:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setupPairingNotifications");
  objc_msgSend(*(id *)(a1 + 32), "_getPairedDeviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPairedDeviceID:", v2);

  objc_msgSend(*(id *)(a1 + 32), "pairedDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setupDatabase");
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v4 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "No device available from NanoRegistry at present-- SYStore will be inoperative until pairing completes.", v8, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setTimeToLive:", 3600.0);
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairingStorePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_setupMessageCenter_LOCKED");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_listenForPrefsChangeNotifications");
}

- (void)dealloc
{
  void *v3;
  NSObject *overflowRetryTimer;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  objc_super v7;

  if (self->_service)
  {
    +[SYLegacyStore fullSyncActivityDictionary](SYLegacyStore, "fullSyncActivityDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", self->_service);

  }
  overflowRetryTimer = self->_overflowRetryTimer;
  if (overflowRetryTimer)
    dispatch_source_cancel(overflowRetryTimer);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)SYLegacyStore;
  -[SYLegacyStore dealloc](&v7, sel_dealloc);
}

- (id)_getPairedDeviceID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_getPairingStorePath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingStorePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_batchChunkUnackedIndices
{
  return (id)-[NSMutableIndexSet copy](self->_batchChunkUnackedIndices, "copy");
}

- (void)_prefsChanged
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.companionsync"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_messageCenter)
    -[SYLegacyStore _updateMessageCenterPrefs:](self, "_updateMessageCenterPrefs:", v4);

}

- (void)_updateMessageCenterPrefs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EnableTransmitWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "BOOLValue"))
  {
    -[NMSMessageCenter setEnableTransmissionWindow:](self->_messageCenter, "setEnableTransmissionWindow:", 1);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MaxMessagesInFlight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v7 = 20;
    -[NMSMessageCenter setMaxMessagesInFlight:](self->_messageCenter, "setMaxMessagesInFlight:", v7);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MinMessagesInFlight"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = objc_msgSend(v8, "unsignedIntegerValue");
    else
      v9 = 10;
    -[NMSMessageCenter setMinMessagesInFlight:](self->_messageCenter, "setMinMessagesInFlight:", v9);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MaxBytesInFlight"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v10 = objc_msgSend(v5, "unsignedIntegerValue");
    else
      v10 = 1000000;
    -[NMSMessageCenter setMaxBytesInFlight:](self->_messageCenter, "setMaxBytesInFlight:", v10);
  }

}

- (void)_listenForPrefsChangeNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_PrefsChangedNotificationCallback, CFSTR("com.apple.companionsync.prefsupdated"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setupPairingNotifications
{
  void *v3;
  id v4;

  if (!-[SYLegacyStore registeredNotificationHandlers](self, "registeredNotificationHandlers"))
  {
    -[SYLegacyStore setRegisteredNotificationHandlers:](self, "setRegisteredNotificationHandlers:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__devicePaired_, *MEMORY[0x24BE6B440], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__deviceUnpaired_, *MEMORY[0x24BE6B450], 0);

  }
}

- (BOOL)isPaired
{
  void *v2;
  BOOL v3;

  -[SYLegacyStore pairedDeviceID](self, "pairedDeviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setDeliveryQOS:(unsigned int)a3
{
  NSObject *queue;
  _QWORD v6[5];
  unsigned int v7;

  if (-[SYStore deliveryQOS](self, "deliveryQOS") != a3)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __32__SYLegacyStore_setDeliveryQOS___block_invoke;
    v6[3] = &unk_24CC654E8;
    v6[4] = self;
    v7 = a3;
    dispatch_async(queue, v6);
  }
}

void __32__SYLegacyStore_setDeliveryQOS___block_invoke(uint64_t a1)
{
  const char *label;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  label = dispatch_queue_get_label(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  dispatch_queue_attr_make_with_qos_class(0, *(dispatch_qos_class_t *)(a1 + 40), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(label, v3);

  dispatch_set_target_queue(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 208), v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

- (int64_t)state
{
  if (!-[SYPersistentStore inFullSync](self->_persistentStore, "inFullSync"))
    return 0;
  if (-[SYPersistentStore currentSyncSendComplete](self->_persistentStore, "currentSyncSendComplete"))
    return 2;
  return 1;
}

- (int64_t)maxBytesInFlight
{
  void *v2;
  int64_t v3;

  -[SYLegacyStore messageCenter](self, "messageCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxBytesInFlight");

  return v3;
}

- (void)setMaxBytesInFlight:(int64_t)a3
{
  id v4;

  -[SYLegacyStore messageCenter](self, "messageCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxBytesInFlight:", a3);

}

- (BOOL)hasCompletedFullSync
{
  return -[SYPersistentStore completedSync](self->_persistentStore, "completedSync");
}

- (BOOL)_isPairedWithDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._qosTargetQueue);
  -[SYLegacyStore pairedDeviceID](self, "pairedDeviceID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = v5 != 0;
  }

  return v8;
}

- (BOOL)_isUsingGenericCache
{
  void *v3;
  BOOL v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._qosTargetQueue);
  -[SYLegacyStore pairedDeviceID](self, "pairedDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[SYLegacyStore persistentStore](self, "persistentStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)_deviceUnpaired:(id)a3
{
  id v4;
  NSObject *qosTargetQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SYLegacyStore *v9;

  v4 = a3;
  -[NMSMessageCenter _obliterate](self->_messageCenter, "_obliterate");
  qosTargetQueue = self->super._qosTargetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SYLegacyStore__deviceUnpaired___block_invoke;
  v7[3] = &unk_24CC652B8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(qosTargetQueue, v7);

}

void __33__SYLegacyStore__deviceUnpaired___block_invoke(uint64_t a1)
{
  os_activity_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = _os_activity_create(&dword_211704000, "CompanionSync Unpairing", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE6B418]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 40), "_isUsingGenericCache") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "_isPairedWithDevice:", v4))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v5 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "NR Device Unpaired", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__SYLegacyStore__deviceUnpaired___block_invoke_67;
    block[3] = &unk_24CC65418;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v6, block);

  }
}

void __33__SYLegacyStore__deviceUnpaired___block_invoke_67(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _WORD *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPersistentStore:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPairedDeviceID:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 232);
  *(_QWORD *)(v2 + 232) = 0;

  v4 = *(_WORD **)(a1 + 32);
  if ((v4[8] & 0x1000) != 0)
  {
    objc_msgSend(v4, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncStoreDidUnpair:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_devicePaired:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__SYLegacyStore__devicePaired___block_invoke;
  v7[3] = &unk_24CC652B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __31__SYLegacyStore__devicePaired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _WORD *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pairedDeviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE6B418]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pairedDeviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring newly-paired device '%@' when already paired with device '%@'. Please file an enhancement request against Pepper CompanionSync for multiple-paired-device support if you see this message.", buf, 0x16u);

    }
  }
  else
  {
    v10 = _os_activity_create(&dword_211704000, "CompanionSync Pairing", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    block[1] = 3221225472;
    block[2] = __31__SYLegacyStore__devicePaired___block_invoke_68;
    block[3] = &unk_24CC65418;
    block[4] = *(_QWORD *)(a1 + 32);
    v13 = v10;
    block[0] = MEMORY[0x24BDAC760];
    os_activity_apply(v10, block);
    v11 = *(_WORD **)(a1 + 32);
    if ((v11[8] & 0x800) != 0)
    {
      objc_msgSend(v11, "delegate", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "syncStoreDidSetupAfterPairing:", *(_QWORD *)(a1 + 32));

    }
  }
}

uint64_t __31__SYLegacyStore__devicePaired___block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "NR Device Paired", v6, 2u);
  }
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPairedDeviceID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setupDatabase");
  return objc_msgSend(*(id *)(a1 + 32), "_setupMessageCenter_LOCKED");
}

- (void)_vectorClockUpdated
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[SYVectorClock jsonRepresentation](self->_vectorClock, "jsonRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SYPersistentStore setVectorClockJSON:](self->_persistentStore, "setVectorClockJSON:", v3);

}

- (id)_pathForMessageCenterCache
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingStorePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("CompanionSync"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Got pairing store path: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v4;
}

- (BOOL)_checkMessageHeader:(id)a3 messageID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  SYPersistentStore *persistentStore;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "sequenceNumber");
  v9 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v6, "timestamp");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v45 = objc_claimAutoreleasedReturnValue();
  -[SYPersistentStore lastMessageReceived](self->_persistentStore, "lastMessageReceived");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLegacyStore persistentStore](self, "persistentStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "peerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "sequenceNumberIsDuplicate:forPeer:", v8, v13);

  if (v14)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = v7;
    v16 = (void *)v45;
    v17 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v47 = v8;
      v48 = 2114;
      v49 = (uint64_t)v7;
      _os_log_impl(&dword_211704000, v17, OS_LOG_TYPE_DEFAULT, "Possible duplicate message received with seqno %qu and ID %{public}@. Comparing timestamps.", buf, 0x16u);
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v18 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v6, "timestamp");
      v21 = v20;
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 134218754;
      v47 = v21;
      v48 = 2114;
      v49 = v45;
      v50 = 2048;
      v51 = v22;
      v52 = 2114;
      v53 = v10;
      _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "This message timestamp = %.04g (%{public}@) vs. last message timestamp = %.04g (%{public}@)", buf, 0x2Au);

    }
    objc_msgSend(v10, "earlierDate:", v45);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 != v10)
    {
      +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "oslog");
      v25 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        -[SYLegacyStore _checkMessageHeader:messageID:].cold.2((uint64_t)v7, v8, v25);

LABEL_35:
      v42 = 0;
      goto LABEL_36;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v26 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v26, OS_LOG_TYPE_DEFAULT, "Sequence numbers were reset; clearing our received seqno set.",
        buf,
        2u);
    }
    persistentStore = self->_persistentStore;
    objc_msgSend(v6, "sender");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "peerID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPersistentStore resetSequenceNumbersForPeer:](persistentStore, "resetSequenceNumbersForPeer:", v29);

  }
  -[SYLegacyStore persistentStore](self, "persistentStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "peerID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v30, "lastSequenceNumberForPeerID:", v32);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v15 = v7;
  v34 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v47 = v8;
    v48 = 2048;
    v49 = v33;
    _os_log_impl(&dword_211704000, v34, OS_LOG_TYPE_INFO, "Received seqno=%llu, last seen=%llu", buf, 0x16u);
  }
  if (v8 != v33 + 1)
  {
    +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "oslog");
    v36 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138543874;
      v47 = (uint64_t)v7;
      v48 = 2048;
      v49 = v8;
      v50 = 2048;
      v51 = v33;
      _os_log_error_impl(&dword_211704000, v36, (os_log_type_t)0x90u, "Out of order delivery or dropped message detected on receipt of message with ID %{public}@. Message sequence number = %llu, last received sequence number = %llu", buf, 0x20u);
    }

    if (+[SYLogs shouldDisplaySyncErrorMessage](SYLogs, "shouldDisplaySyncErrorMessage"))
    {
      -[SYLegacyStore service](self, "service");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _ClientNameForServiceName(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Message out of order in "), "stringByAppendingString:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYLegacyStore postUserNotification:message:](self, "postUserNotification:message:", v39, CFSTR("File against Pepper CompanionSync|1.0, attach all logs"));

    }
  }
  if (objc_msgSend(v6, "version") >= 2)
  {
    v16 = (void *)v45;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v43 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYLegacyStore _checkMessageHeader:messageID:].cold.1(v43);
    -[SYLegacyStore _postVersionRejectedForMessageID:](self, "_postVersionRejectedForMessageID:", v7);
    goto LABEL_35;
  }
  v40 = (void *)objc_opt_new();
  -[SYLegacyStore persistentStore](self, "persistentStore");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLastMessageReceived:", v40);

  v42 = 1;
  v16 = (void *)v45;
LABEL_36:

  return v42;
}

- (void)_postVersionRejectedForMessageID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SYLegacyStore__postVersionRejectedForMessageID___block_invoke;
  v7[3] = &unk_24CC652B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __50__SYLegacyStore__postVersionRejectedForMessageID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newMessageHeader");
  objc_msgSend(v3, "setHeader:", v2);

  objc_msgSend(v3, "setInReplyTo:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setSupportedVersions:count:", &_postVersionRejectedForMessageID__supportedVersions, 2);
  objc_msgSend(*(id *)(a1 + 32), "sendMessage:ofType:respondingTo:userInfo:idsOptions:", v3, 0x7FFFLL, 0, 0, 0);

}

- (void)_recordLastSeqNo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SYLegacyStore persistentStore](self, "persistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "sequenceNumber");
  objc_msgSend(v4, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "peerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v5, "setLastSequenceNumber:fromPeer:error:", v6, v8, &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v11 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      -[SYLegacyStore _recordLastSeqNo:].cold.1(v11);
  }

}

- (void)_handleIDSOverflowWithError:(id)a3
{
  id v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *overflowRetryTimer;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v5 = a3;
  if (!self->_overflowRetryTimer)
  {
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    overflowRetryTimer = self->_overflowRetryTimer;
    self->_overflowRetryTimer = v6;

    objc_storeStrong((id *)&self->_overflowRetryError, a3);
    objc_initWeak(&location, self);
    v8 = self->_overflowRetryTimer;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __45__SYLegacyStore__handleIDSOverflowWithError___block_invoke;
    v15 = &unk_24CC655F8;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v8, &v12);
    v9 = self->_overflowRetryTimer;
    v10 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    dispatch_resume((dispatch_object_t)self->_overflowRetryTimer);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0, v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPersistentStore setOverflowResyncTime:](self->_persistentStore, "setOverflowResyncTime:", v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __45__SYLegacyStore__handleIDSOverflowWithError___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[23], "setOverflowResyncTime:", 0);
    objc_msgSend(v2, "setNeedsFullSync");
    WeakRetained = v2;
  }

}

- (void)setupMessageCenter
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SYLegacyStore_setupMessageCenter__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __35__SYLegacyStore_setupMessageCenter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupMessageCenter_LOCKED");
}

- (void)_setupMessageCenter_LOCKED
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Creating NanoMessageCenter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordIncomingMessage:forService:", v19, v5);

    objc_msgSend(v19, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v7, v8);

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v6, "syncID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRequestSyncID:", v11);

      objc_msgSend(v19, "pbRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleFullSyncRequest:response:", v12, v10);

      objc_msgSend(v19, "response");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPbResponse:", v10);

      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "response");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "service");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordOutgoingMessage:forService:", v15, v16);

      objc_msgSend(v19, "response");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "send");

      objc_msgSend(v6, "header");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v18);

    }
    else
    {
      objc_msgSend(v19, "setExpectsResponse:", 0);
    }

  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordIncomingMessage:forService:", v18, v5);

    objc_msgSend(v18, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v7, v8);

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v6, "syncID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSyncID:", v11);

      objc_msgSend(WeakRetained, "handleSyncAllObjects:response:", v6, v10);
      objc_msgSend(v18, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPbResponse:", v10);

      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordOutgoingMessage:forService:", v14, v15);

      objc_msgSend(v18, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "send");

      objc_msgSend(v6, "header");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v17);

    }
    else
    {
      objc_msgSend(v18, "setExpectsResponse:", 0);
    }

  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordIncomingMessage:forService:", v11, v5);

    objc_msgSend(v11, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v7, v8);

    if (v9)
    {
      objc_msgSend(WeakRetained, "handleBatchSyncStart:", v6);
      objc_msgSend(v6, "header");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v10);

    }
  }

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordIncomingMessage:forService:", v18, v5);

    objc_msgSend(v18, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v7, v8);

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v6, "syncID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSyncID:", v11);

      objc_msgSend(WeakRetained, "handleBatchSyncEnd:response:", v6, v10);
      objc_msgSend(v18, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPbResponse:", v10);

      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordOutgoingMessage:forService:", v14, v15);

      objc_msgSend(v18, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "send");

      objc_msgSend(v6, "header");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v17);

    }
    else
    {
      objc_msgSend(v18, "setExpectsResponse:", 0);
    }

  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordIncomingMessage:forService:", v18, v5);

    objc_msgSend(v18, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v7, v8);

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v6, "syncID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSyncID:", v11);

      objc_msgSend(WeakRetained, "handleBatchSyncChunk:response:", v6, v10);
      objc_msgSend(v18, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPbResponse:", v10);

      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordOutgoingMessage:forService:", v14, v15);

      objc_msgSend(v18, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "send");

      objc_msgSend(v6, "header");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v17);

    }
    else
    {
      objc_msgSend(v18, "setExpectsResponse:", 0);
    }

  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordIncomingMessage:forService:", v11, v5);

    objc_msgSend(v11, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v7, v8);

    if (v9)
    {
      objc_msgSend(WeakRetained, "handleChangeMessage:", v6);
      objc_msgSend(v6, "header");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v10);

    }
  }

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordIncomingMessage:forService:", v3, v6);

    objc_msgSend(v3, "pbRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v7, "supportedVersionsCount"))
    {
      v9 = 0;
      do
        objc_msgSend(v8, "addIndex:", objc_msgSend(v7, "supportedVersionsAtIndex:", v9++));
      while (v9 < objc_msgSend(v7, "supportedVersionsCount"));
    }
    +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_7_cold_1();

    objc_msgSend(WeakRetained, "persistentStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "header");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sender");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "peerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "lastSequenceNumberForPeerID:", v15);

    objc_msgSend(v7, "header");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "sequenceNumber");

    if (v18 == v16 + 1)
    {
      objc_msgSend(v7, "header");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v19);

    }
  }

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  id *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordIncomingMessage:forService:", v3, v6);

    objc_msgSend(v3, "pbResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "header");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v8, v9);

    if (v10)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v11 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
        __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_92_cold_1(v11, v7);
      if ((objc_msgSend(v7, "accepted") & 1) == 0 && objc_msgSend(v7, "hasInProgressSyncID"))
      {
        objc_msgSend(*((id *)WeakRetained + 23), "lastSyncEndID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "inProgressSyncID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v15 = qword_253D84AB8;
          if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "In-progress sync has finished, now requesting another.", buf, 2u);
          }
          v16 = dispatch_time(0, 200000000);
          v17 = *((_QWORD *)WeakRetained + 26);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_97;
          block[3] = &unk_24CC65418;
          v18 = &v30;
          v30 = WeakRetained;
          dispatch_after(v16, v17, block);
        }
        else
        {
          objc_msgSend(v7, "inProgressSyncID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)WeakRetained + 23), "setWaitingForSyncEndID:", v19);

          if (_sync_log_facilities_pred != -1)
            _os_once();
          v20 = (void *)qword_253D84AB8;
          if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
          {
            v21 = v20;
            objc_msgSend(v7, "inProgressSyncID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v32 = v22;
            _os_log_impl(&dword_211704000, v21, OS_LOG_TYPE_DEFAULT, "Waiting for in-progress sync %{public}@ to end before re-sending sync request.", buf, 0xCu);

          }
          v23 = dispatch_time(0, 3600000000000);
          v24 = *((_QWORD *)WeakRetained + 26);
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_98;
          v26[3] = &unk_24CC652B8;
          v18 = &v27;
          v27 = WeakRetained;
          v28 = v7;
          dispatch_after(v23, v24, v26);

        }
      }
      objc_msgSend(v7, "header");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v25);

    }
  }

}

uint64_t __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_97(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performFullSyncToCurrentDBVersion");
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_98(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_98_cold_1(a1, v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "waitingForSyncEndID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "inProgressSyncID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setWaitingForSyncEndID:", 0);
    objc_msgSend(*(id *)(a1 + 32), "performFullSyncToCurrentDBVersion");
  }
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_100(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordIncomingMessage:forService:", v11, v5);

    objc_msgSend(v11, "pbResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v7, v8);

    if (v9)
    {
      objc_msgSend(WeakRetained, "processBatchChunkAck:", objc_msgSend(v6, "chunkIndex"));
      objc_msgSend(v6, "header");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v10);

    }
  }

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2_101(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordIncomingMessage:forService:", v3, v6);

    objc_msgSend(v3, "pbResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "header");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(WeakRetained, "_checkMessageHeader:messageID:", v8, v9);

    if (v10)
    {
      objc_msgSend(v7, "syncID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[23], "currentFullSyncID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        v14 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v7, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorFromSYErrorInfo:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v7, "hasError") & 1) == 0 && objc_msgSend(WeakRetained[13], "count"))
        {
          if (+[SYLogs shouldDisplaySyncErrorMessage](SYLogs, "shouldDisplaySyncErrorMessage"))
          {
            v17 = *(void **)(a1 + 32);
            objc_msgSend(WeakRetained, "service");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            _ClientNameForServiceName(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("Unacked batch while syncing "), "stringByAppendingString:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "postUserNotification:message:", v20, CFSTR("File against Pepper CompanionSync|1.0"));

          }
          +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "oslog");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
            __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2_101_cold_1();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 1003, 0);
          v23 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(WeakRetained[13], "removeAllIndexes");
          v16 = (void *)v23;
        }
        objc_msgSend(WeakRetained[23], "clearAllChanges");
        objc_msgSend(WeakRetained[23], "setCompletedSync:", 1);
        v24 = WeakRetained[23];
        objc_msgSend(v7, "syncID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "exitFullSyncWithID:error:", v25, v16);

        if (((_WORD)WeakRetained[2] & 8) != 0)
        {
          objc_msgSend(WeakRetained, "delegate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "syncStoreDidCompleteFullSync:", WeakRetained);

        }
        if (v16)
          objc_msgSend(WeakRetained, "_retrySync");

      }
      objc_msgSend(v7, "header");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v27);

    }
  }

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_34;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE4F9D0]))
  {

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "code") == 32)
  {

  }
  else
  {
    v6 = objc_msgSend(v3, "code");

    if (v6 != 33)
      goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "_handleIDSOverflowWithError:", v3);
LABEL_8:
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("NMSErrorDomain")))
  {

    goto LABEL_16;
  }
  v8 = objc_msgSend(v3, "code");

  if (v8 != 1)
  {
LABEL_16:
    objc_msgSend(v3, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("NMSErrorDomain")))
    {

      goto LABEL_23;
    }
    v13 = objc_msgSend(v3, "code");

    if (v13 != 2)
      goto LABEL_23;
    objc_msgSend(v3, "idsIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_23;
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateOutgoingMessageWithIdentifier:didReceiveResponse:error:", v10, 0, v3);
    goto LABEL_20;
  }
  objc_msgSend(v3, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
  {
    __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_107_cold_2();
    if (!v9)
      goto LABEL_21;
    goto LABEL_14;
  }
  if (v9)
  {
LABEL_14:
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateOutgoingMessageWithIdentifier:forService:sentSuccessfully:sendError:", v9, v11, 0, v3);

LABEL_20:
  }
LABEL_21:

LABEL_23:
  if ((*((_WORD *)WeakRetained + 8) & 0x400) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentUserInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "syncStore:encounteredError:context:", WeakRetained, v3, v16);

  }
  if (objc_msgSend(WeakRetained, "inFullSync"))
  {
    v17 = (void *)*((_QWORD *)WeakRetained + 23);
    objc_msgSend(v17, "currentFullSyncID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "exitFullSyncWithID:error:", v18, v3);

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v19 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_107_cold_1(v19);
  }
  if (*(unsigned __int16 *)(a1 + 40) - 3 > 2)
  {
    objc_msgSend(WeakRetained, "_retrySync");
  }
  else
  {
    objc_msgSend(WeakRetained, "nextBatchStep");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(WeakRetained, "nextBatchStep");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v21)[2](v21, v3, 0);

    }
  }
LABEL_34:

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  _WORD *WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_16;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE4F9D0]))
  {

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "code") == 32)
  {

  }
  else
  {
    v6 = objc_msgSend(v3, "code");

    if (v6 != 33)
      goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "_handleIDSOverflowWithError:", v3);
LABEL_8:
  objc_msgSend(v3, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
  {
    __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_107_cold_2();
    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v7)
  {
LABEL_12:
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateOutgoingMessageWithIdentifier:forService:sentSuccessfully:sendError:", v7, v9, 0, v3);

  }
LABEL_13:
  if ((WeakRetained[8] & 0x400) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentUserInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncStore:encounteredError:context:", WeakRetained, v3, v11);

  }
LABEL_16:

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_110(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[23], "setOverflowResyncTime:", 0);
    objc_msgSend(v2, "setNeedsFullSync");
    WeakRetained = v2;
  }

}

- (void)setupDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "SYStore has a NIL PERSISTENT STORE !!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)setDelegate:(id)a3
{
  NMSMessageCenter *messageCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SYLegacyStore;
  -[SYStore setDelegate:](&v6, sel_setDelegate_);
  messageCenter = self->_messageCenter;
  if (a3)
  {
    if (messageCenter)
    {
      -[NMSMessageCenter resume](messageCenter, "resume");
      -[SYLegacyStore performFullSyncIfNecessaryAskingDelegate:](self, "performFullSyncIfNecessaryAskingDelegate:", 1);
    }
  }
  else
  {
    self->_messageCenter = 0;

  }
}

- (double)timeToLive
{
  void *v2;
  double v3;
  double v4;

  -[SYLegacyStore persistentStore](self, "persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeToLive");
  v4 = v3;

  return v4;
}

- (void)setTimeToLive:(double)a3
{
  id v4;

  -[SYLegacyStore persistentStore](self, "persistentStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeToLive:", a3);

}

- (BOOL)inFullSync
{
  return -[SYPersistentStore inFullSync](self->_persistentStore, "inFullSync");
}

- (void)postUserNotification:(id)a3 message:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  char ***v7;
  pid_t v8;
  char *__argv[2];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  if (+[SYLogs shouldDumpIDSOnSyncError](SYLogs, "shouldDumpIDSOnSyncError")
    && MGGetBoolAnswer()
    && (_shouldDumpIDSOnSyncErrorOnce & 1) == 0)
  {
    _shouldDumpIDSOnSyncErrorOnce = 1;
    CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, v5, v6, 0);
    *(_OWORD *)__argv = xmmword_24CC65948;
    v10 = 0;
    v8 = 0;
    v7 = _NSGetEnviron();
    posix_spawn(&v8, "/usr/local/bin/idstool", 0, 0, __argv, *v7);
  }

}

- (void)_copyPeerClockFromMessageHeaderIfNecessary:(id)a3
{
  id v4;
  SYVectorClock *vectorClock;
  void *v6;
  SYVectorClock *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  vectorClock = self->_vectorClock;
  v11 = v4;
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(vectorClock) = -[SYVectorClock hasClockForPeer:](vectorClock, "hasClockForPeer:", v6);

  if ((vectorClock & 1) == 0)
  {
    v7 = self->_vectorClock;
    objc_msgSend(v11, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clockForPeer:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock addClocks:](v7, "addClocks:", v10);

    -[SYLegacyStore _vectorClockUpdated](self, "_vectorClockUpdated");
  }

}

- (BOOL)peerState:(id)a3 fromPeer:(id)a4 matchesExpectationForChangeCount:(unint64_t)a5 offsetAmount:(unint64_t *)a6
{
  id v10;
  id v11;
  SYVectorClock **p_vectorClock;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t *v25;
  unint64_t v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  p_vectorClock = &self->_vectorClock;
  if (-[SYVectorClock hasClockForPeer:](self->_vectorClock, "hasClockForPeer:", v11))
  {
    -[SYPersistentStore peerID](self->_persistentStore, "peerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYLegacyStore peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:].cold.3();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v26 = a5;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYLegacyStore peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:].cold.2();
    v14 = -[SYVectorClock clockValueForPeerID:](*p_vectorClock, "clockValueForPeerID:", v13, a6);
    v15 = objc_msgSend(v10, "clockValueForPeerID:", v13);
    v16 = -[SYVectorClock clockValueForPeer:](*p_vectorClock, "clockValueForPeer:", v11);
    v17 = objc_msgSend(v10, "clockValueForPeer:", v11);
    if (v15 > v14)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYLegacyStore peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:].cold.1();
      goto LABEL_15;
    }
    v19 = v17;
    if (v15 != v14)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v20 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v28 = v14;
        v29 = 2048;
        v30 = v15;
        _os_log_impl(&dword_211704000, v20, OS_LOG_TYPE_DEFAULT, "Accepting change list from peer that has not received my latest updates: %llu vs. %llu", buf, 0x16u);
      }
    }
    v21 = -[SYVectorClock hasClockForPeer:](*p_vectorClock, "hasClockForPeer:", v11);
    v18 = 1;
    if (!v21 || v19 == v16 + v26 || v19 == v16 + 1)
      goto LABEL_32;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v22 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v28 = v16;
      v29 = 2048;
      v30 = v19;
      v31 = 1024;
      v32 = v26;
      _os_log_error_impl(&dword_211704000, v22, OS_LOG_TYPE_ERROR, "Peer state doesn't match my expectation-- likely a message is missing. I have %llu, they sent %llu, there are %u changes incoming", buf, 0x1Cu);
      if (v25)
        goto LABEL_29;
    }
    else if (v25)
    {
LABEL_29:
      v18 = 0;
      v23 = v16 - (v19 + v26);
      if (v23 < 0)
        v23 = v19 + v26 - v16;
      *v25 = v23;
      goto LABEL_32;
    }
LABEL_15:
    v18 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v18 = 1;
LABEL_33:

  return v18;
}

- (void)handleFullSyncRequest:(id)a3 response:(id)a4
{
  id v6;
  SYPersistentStore *persistentStore;
  id v8;
  void *v9;
  id v10;
  SYErrorInfo *v11;
  void *v12;
  SYErrorInfo *v13;
  void *v14;
  SYPersistentStore *v15;
  void *v16;
  id v17;
  NSObject *queue;
  _QWORD block[5];

  v6 = a3;
  persistentStore = self->_persistentStore;
  v8 = a4;
  -[SYPersistentStore currentFullSyncID](persistentStore, "currentFullSyncID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
    objc_msgSend(v8, "setHeader:", v10);

    objc_msgSend(v8, "setAccepted:", 0);
    v11 = [SYErrorInfo alloc];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 1002, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SYErrorInfo initWithError:](v11, "initWithError:", v12);
    objc_msgSend(v8, "setError:", v13);

    -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInProgressSyncID:", v14);

  }
  else
  {
    v15 = self->_persistentStore;
    objc_msgSend(v6, "syncID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPersistentStore enterFullSyncWithID:ignoring:](v15, "enterFullSyncWithID:ignoring:", v16, 0);

    v17 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
    objc_msgSend(v8, "setHeader:", v17);

    objc_msgSend(v8, "setAccepted:", 1);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__SYLegacyStore_handleFullSyncRequest_response___block_invoke;
    block[3] = &unk_24CC65418;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

uint64_t __48__SYLegacyStore_handleFullSyncRequest_response___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remoteStoreRequestFullSync");
}

- (BOOL)_shouldIgnoreSyncID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("InitialSync")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", v4) & 1) != 0
    || -[SYPersistentStore canStartNewSyncSession](self->_persistentStore, "canStartNewSyncSession"))
  {
    v7 = 0;
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v4;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Skipping one sync message (syncID %{public}@) while waiting for another (syncID %{public}@)", (uint8_t *)&v10, 0x16u);
    }
    v7 = 1;
  }

  return v7;
}

- (BOOL)_shouldSkipNonSyncMessages
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  SYPersistentStore *persistentStore;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[SYPersistentStore canStartNewSyncSession](self->_persistentStore, "canStartNewSyncSession");

    if (v5)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v6 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        persistentStore = self->_persistentStore;
        v8 = v6;
        -[SYPersistentStore currentFullSyncID](persistentStore, "currentFullSyncID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Skipping while waiting for sync; fullSyncIdentifier == '%{public}@'",
          (uint8_t *)&v11,
          0xCu);

      }
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_syncEndedWithSyncID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  SYPersistentStore *persistentStore;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SYPersistentStore exitFullSyncWithID:error:](self->_persistentStore, "exitFullSyncWithID:error:", v4, 0);
  -[SYPersistentStore clearAllChanges](self->_persistentStore, "clearAllChanges");
  -[SYPersistentStore waitingForSyncEndID](self->_persistentStore, "waitingForSyncEndID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      persistentStore = self->_persistentStore;
      v9 = v7;
      -[SYPersistentStore waitingForSyncEndID](persistentStore, "waitingForSyncEndID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v4;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Sync %{public}@ has finished, and I'm waiting for sync %{public}@ to finish, and they match. Triggering full-sync now.", buf, 0x16u);

    }
    -[SYPersistentStore setWaitingForSyncEndID:](self->_persistentStore, "setWaitingForSyncEndID:", 0);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__SYLegacyStore__syncEndedWithSyncID___block_invoke;
    block[3] = &unk_24CC65418;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    -[SYPersistentStore setFullSyncUserInfo:](self->_persistentStore, "setFullSyncUserInfo:", 0);
    -[SYPersistentStore setFullSyncIDSOptions:](self->_persistentStore, "setFullSyncIDSOptions:", 0);
    if (!-[SYLegacyStore alwaysWins](self, "alwaysWins"))
      -[SYPersistentStore setCompletedSync:](self->_persistentStore, "setCompletedSync:", 1);
  }

}

uint64_t __38__SYLegacyStore__syncEndedWithSyncID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performFullSyncToCurrentDBVersion");
}

- (void)handleSyncAllObjects:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  SYErrorInfo *v12;
  void *v13;
  SYErrorInfo *v14;
  void *v15;
  void *v16;
  SYPersistentStore *persistentStore;
  void *v18;
  int v19;
  SYPersistentStore *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SYVectorClock *vectorClock;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "syncID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SYLegacyStore _shouldIgnoreSyncID:](self, "_shouldIgnoreSyncID:", v8);

  if (v9)
  {
    v10 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
    objc_msgSend(v7, "setHeader:", v10);

    objc_msgSend(v6, "syncID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSyncID:", v11);

    v12 = [SYErrorInfo alloc];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 1001, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SYErrorInfo initWithError:](v12, "initWithError:", v13);
    objc_msgSend(v7, "setError:", v14);

    objc_msgSend(v6, "syncID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLegacyStore _syncEndedWithSyncID:](self, "_syncEndedWithSyncID:", v15);

    goto LABEL_13;
  }
  -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  persistentStore = self->_persistentStore;
  if (!v16)
  {
    objc_msgSend(v6, "syncID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPersistentStore enterFullSyncWithID:ignoring:](persistentStore, "enterFullSyncWithID:ignoring:", v21, 0);
    goto LABEL_7;
  }
  -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("InitialSync"));

  if (v19)
  {
    v20 = self->_persistentStore;
    objc_msgSend(v6, "syncID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPersistentStore reassignCurrentSyncID:](v20, "reassignCurrentSyncID:", v21);
LABEL_7:

  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "allObjectsCount"));
  objc_msgSend(v6, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke;
  v38[3] = &unk_24CC65968;
  v38[4] = self;
  v24 = v22;
  v39 = v24;
  v25 = v6;
  v40 = v25;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v38);

  objc_msgSend(v25, "header");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sender");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "header");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "state");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "clockForPeer:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[SYLegacyStore remoteStoreAllObjects:fromPeer:clock:](self, "remoteStoreAllObjects:fromPeer:clock:", v24, v27, v30);
  -[SYPersistentStore peerID](self->_persistentStore, "peerID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYVectorClock setClockValue:forPeer:](self->_vectorClock, "setClockValue:forPeer:", objc_msgSend(v30, "version"), v27);
  -[SYLegacyStore _vectorClockUpdated](self, "_vectorClockUpdated");
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v32 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    vectorClock = self->_vectorClock;
    v34 = v32;
    -[SYVectorClock jsonRepresentation](vectorClock, "jsonRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v35;
    v43 = 2114;
    v44 = v31;
    _os_log_impl(&dword_211704000, v34, OS_LOG_TYPE_INFO, "Copied peer clock into our vector. Value is now: %{public}@ (my PeerID is %{public}@)", buf, 0x16u);

  }
  v36 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
  objc_msgSend(v7, "setHeader:", v36);

  objc_msgSend(v25, "syncID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLegacyStore _syncEndedWithSyncID:](self, "_syncEndedWithSyncID:", v37);

LABEL_13:
}

void __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "decodeSYObject:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_FAULT))
      __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_2(v5, v7);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG))
      __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_1(a3, a1, v8);
  }

}

- (void)handleBatchSyncStart:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  SYPersistentStore *persistentStore;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "syncID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SYLegacyStore _shouldIgnoreSyncID:](self, "_shouldIgnoreSyncID:", v4);

  if (!v5)
  {
    -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      persistentStore = self->_persistentStore;
      objc_msgSend(v9, "syncID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYPersistentStore enterFullSyncWithID:ignoring:](persistentStore, "enterFullSyncWithID:ignoring:", v8, 0);

    }
    -[SYLegacyStore processBatchSyncStart](self, "processBatchSyncStart");
  }

}

- (void)handleBatchSyncChunk:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  SYErrorInfo *v12;
  void *v13;
  SYErrorInfo *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  SYErrorInfo *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "syncID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SYLegacyStore _shouldIgnoreSyncID:](self, "_shouldIgnoreSyncID:", v8);

  if (v9)
  {
    v10 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
    objc_msgSend(v6, "setHeader:", v10);

    objc_msgSend(v7, "syncID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setSyncID:", v11);
    v12 = [SYErrorInfo alloc];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 1001, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SYErrorInfo initWithError:](v12, "initWithError:", v13);
    objc_msgSend(v6, "setError:", v14);

  }
  else
  {
    v15 = objc_msgSend(v7, "chunkIndex");
    objc_msgSend(v7, "objects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    -[SYLegacyStore processBatchChunkAtIndex:encodedObjects:error:](self, "processBatchChunkAtIndex:encodedObjects:error:", v15, v16, &v21);
    v17 = v21;

    v18 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
    objc_msgSend(v6, "setHeader:", v18);

    v19 = objc_msgSend(v7, "chunkIndex");
    objc_msgSend(v6, "setChunkIndex:", v19);
    if (v17)
    {
      v20 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", v17);
      objc_msgSend(v6, "setError:", v20);

    }
  }

}

- (void)handleBatchSyncEnd:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  SYErrorInfo *v12;
  void *v13;
  SYErrorInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SYVectorClock *vectorClock;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "syncID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SYLegacyStore _shouldIgnoreSyncID:](self, "_shouldIgnoreSyncID:", v8);

  if (v9)
  {
    v10 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
    objc_msgSend(v7, "setHeader:", v10);

    objc_msgSend(v6, "syncID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSyncID:", v11);

    v12 = [SYErrorInfo alloc];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 1001, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SYErrorInfo initWithError:](v12, "initWithError:", v13);
    objc_msgSend(v7, "setError:", v14);

    objc_msgSend(v6, "syncID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLegacyStore _syncEndedWithSyncID:](self, "_syncEndedWithSyncID:", v15);

  }
  else
  {
    objc_msgSend(v6, "header");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sender");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "clockValueForPeer:", v19);

    -[SYLegacyStore processBatchSyncEnd:](self, "processBatchSyncEnd:", v20);
    objc_msgSend(v6, "header");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sender");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "header");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "state");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clockForPeer:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[SYPersistentStore peerID](self->_persistentStore, "peerID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock setClockValue:forPeer:](self->_vectorClock, "setClockValue:forPeer:", objc_msgSend(v25, "version"), v22);
    -[SYLegacyStore _vectorClockUpdated](self, "_vectorClockUpdated");
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v27 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      vectorClock = self->_vectorClock;
      v29 = v27;
      -[SYVectorClock jsonRepresentation](vectorClock, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v30;
      v35 = 2114;
      v36 = v26;
      _os_log_impl(&dword_211704000, v29, OS_LOG_TYPE_INFO, "Copied peer clock into our vector. Value is now: %{public}@ (my PeerID is %{public}@)", (uint8_t *)&v33, 0x16u);

    }
    v31 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
    objc_msgSend(v7, "setHeader:", v31);

    objc_msgSend(v6, "syncID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLegacyStore _syncEndedWithSyncID:](self, "_syncEndedWithSyncID:", v32);

  }
}

- (void)handleChangeMessage:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  double Current;
  __int16 flags;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  SYVectorClock *vectorClock;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  os_activity_t v38;
  id v39;
  char v40;
  _BYTE v41[15];
  char v42;
  _BYTE v43[15];
  char v44;
  _BYTE v45[15];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  _QWORD v52[3];

  *(_QWORD *)((char *)&v52[1] + 4) = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  if (!-[SYLegacyStore _shouldSkipNonSyncMessages](self, "_shouldSkipNonSyncMessages"))
  {
    v38 = _os_activity_create(&dword_211704000, "CompanionSync Change Application", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DETACHED);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v4 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v52[0]) = objc_msgSend(v39, "changesCount");
      _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "Applying %d incoming changes", buf, 8u);
    }

    objc_msgSend(v39, "header");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sequenceNumber");

    -[SYLegacyStore persistentStore](self, "persistentStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "header");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "lastSequenceNumberForPeerID:", v10);

    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYLegacyStore handleChangeMessage:].cold.7();
    if (v11)
      v12 = v6 + ~v11;
    else
      v12 = 0;
    -[SYStore delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (-[SYLegacyStore tracksChanges](self, "tracksChanges"))
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v14 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_msgSend(v39, "changesCount");
          *(_DWORD *)buf = 134217984;
          v52[0] = v15;
          _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "-handleChangeMessage:<%zu objects> -- changes are not consecutive, triggering full sync", buf, 0xCu);
        }

        -[SYLegacyStore performFullSync](self, "performFullSync");
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v16 = qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "handleChangeMessage - done, change-list bubble detected", buf, 2u);
        }
        +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateLastIncomingMessageWithError:", CFSTR("Change-list bubble detected"));
LABEL_35:

        goto LABEL_74;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v13, "syncStore:detectedChangeListBubbleOfSize:", self, v12);
    }
    if (!v13)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYLegacyStore handleChangeMessage:].cold.1();
      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateLastIncomingMessageWithError:", CFSTR("No delegate"));
      goto LABEL_35;
    }
    Current = CFAbsoluteTimeGetCurrent();
    flags = (__int16)self->super._flags;
    if ((flags & 2) != 0)
    {
      objc_msgSend(v13, "syncStoreWillUpdate:objectCount:", self, objc_msgSend(v39, "changesCount"));
    }
    else if ((flags & 1) != 0)
    {
      objc_msgSend(v13, "syncStoreWillUpdate:", self);
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v39, "changes", 16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v47;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v23);
          objc_msgSend(v24, "objectForStore:", self);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            if (objc_msgSend(v24, "type"))
            {
              if (objc_msgSend(v24, "type") == 1)
              {
                if (_sync_log_facilities_pred != -1)
                  _os_once();
                if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
                  -[SYLegacyStore handleChangeMessage:].cold.5(&v42, v43);
                objc_msgSend(v13, "syncStore:objectUpdated:", self, v25);
              }
              else if (objc_msgSend(v24, "type") == 2)
              {
                if (_sync_log_facilities_pred != -1)
                  _os_once();
                if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
                  -[SYLegacyStore handleChangeMessage:].cold.6(&v40, v41);
                objc_msgSend(v13, "syncStore:objectDeleted:", self, v25);
              }
            }
            else
            {
              if (_sync_log_facilities_pred != -1)
                _os_once();
              if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
                -[SYLegacyStore handleChangeMessage:].cold.4(&v44, v45);
              objc_msgSend(v13, "syncStore:objectAdded:", self, v25);
            }
          }
          else
          {
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v26 = (id)qword_253D84AB8;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              _SYObfuscate(v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[SYLegacyStore handleChangeMessage:].cold.3(v27, buf, v52, v26);
            }

          }
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v21);
    }

    vectorClock = self->_vectorClock;
    objc_msgSend(v39, "header");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "state");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "header");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sender");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "clockValueForPeer:", v32);
    objc_msgSend(v39, "header");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sender");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock setClockValue:forPeer:](vectorClock, "setClockValue:forPeer:", v33, v35);

    -[SYLegacyStore _vectorClockUpdated](self, "_vectorClockUpdated");
    if ((*(_WORD *)((_BYTE *)&self->super.super.isa + v37) & 4) != 0)
      objc_msgSend(v13, "syncStoreDidUpdate:", self);
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "updateLastIncomingMessageWithProcessingTime:", CFAbsoluteTimeGetCurrent() - Current);

    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYLegacyStore handleChangeMessage:].cold.2();
  }
LABEL_74:

}

- (void)messageCenter:(id)a3 didReceiveUnknownRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    -[SYLegacyStore messageCenter:didReceiveUnknownRequest:].cold.1(v8);
  objc_msgSend(v7, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLegacyStore _postVersionRejectedForMessageID:](self, "_postVersionRejectedForMessageID:", v9);

  objc_msgSend(v7, "setExpectsResponse:", 0);
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *sendSignals;
  void *v19;
  NSObject *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  OS_os_transaction *transaction;

  v5 = a4;
  objc_msgSend(v5, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assignIdentifier:toOutgoingMessage:", v8, v5);

    if (-[SYLegacyStore alwaysWins](self, "alwaysWins"))
    {
      if (objc_msgSend(v5, "messageID") - 3 <= 2)
      {
        -[SYLegacyStore nextBatchStep](self, "nextBatchStep");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[SYLegacyStore nextBatchStep](self, "nextBatchStep");
          v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, 0);

        }
      }
      if ((*(_WORD *)&self->super._flags & 0x80000000) != 0)
      {
        -[SYStore delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "messageID");
        if (v12 == 5)
        {
          objc_msgSend(v5, "persistentUserInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UserInfo"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "syncStoreEnqueuedAllFullSyncMessages:context:", self, v14);

        }
        else
        {
          if (v12 != 2)
          {
LABEL_12:

            goto LABEL_13;
          }
          objc_msgSend(v5, "persistentUserInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "syncStoreEnqueuedAllFullSyncMessages:context:", self, v13);
        }

        goto LABEL_12;
      }
    }
  }
LABEL_13:
  objc_msgSend(v5, "pbRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "header");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "sequenceNumber");

  sendSignals = self->_sendSignals;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sendSignals, "objectForKeyedSubscript:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    dispatch_semaphore_signal(v20);
    v21 = self->_sendSignals;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v21, "removeObjectForKey:", v22);

  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v23 = (void *)qword_253D84AD0;
  if (os_log_type_enabled((os_log_t)qword_253D84AD0, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore messageCenter:didResolveIDSIdentifierForRequest:].cold.1(v23);
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forResponse:(id)a5
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a5;
    v7 = a4;
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assignIdentifier:toOutgoingMessage:", v7, v6);

  }
}

- (void)messageCenter:(id)a3 didSuccessfullySendRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:].cold.1();
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLegacyStore service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateOutgoingMessageWithIdentifier:forService:sentSuccessfully:sendError:", v9, v12, 1, 0);

  if ((*(_WORD *)&self->super._flags & 0x2000) != 0)
  {
    -[SYStore delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncStore:sentMessageWithContext:", self, v10);

  }
}

- (void)messageCenter:(id)a3 didSuccessfullyDeliverRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:].cold.1();
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "confirmDeliveryOfOutgoingMessage:", v9);

  if ((*(_WORD *)&self->super._flags & 0x4000) != 0)
  {
    -[SYStore delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncStore:peerFinishedProcessingMessageWithContext:", self, v10);

  }
}

- (id)wrapMessage:(id)a3 ofType:(unsigned __int16)a4 respondingTo:(id)a5 userInfo:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  double v13;
  id v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v6 = a4;
  if (!a5)
  {
    v14 = a6;
    v15 = a3;
    +[NMSOutgoingRequest requestWithMessageID:](NMSOutgoingRequest, "requestWithMessageID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPbRequest:", v15);

    objc_msgSend(v12, "setPersistentUserInfo:", v14);
    v16 = -[SYLegacyStore priority](self, "priority");
    if (v16 == 2)
      v17 = 2;
    else
      v17 = v16 != 1;
    objc_msgSend(v12, "setPriority:", v17);
    objc_msgSend(v12, "setShouldEncrypt:", 1);
    if (v6 <= 5)
    {
      v18 = 0x40AC200000000000;
      if (((1 << v6) & 0x36) != 0)
      {
        objc_msgSend(v12, "setResponseTimeout:", 7200.0);
LABEL_14:
        v19 = v12;
        v13 = *(double *)&v18;
        goto LABEL_15;
      }
      if ((_DWORD)v6 == 3)
        goto LABEL_14;
    }
    -[SYLegacyStore timeToLive](self, "timeToLive");
    v18 = v20;
    goto LABEL_14;
  }
  v10 = a6;
  v11 = a3;
  objc_msgSend(a5, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPbResponse:", v11);

  objc_msgSend(v12, "setPersistentUserInfo:", v10);
  if ((v6 - 1) >= 5)
    -[SYLegacyStore timeToLive](self, "timeToLive");
  else
    v13 = 3600.0;
  v19 = v12;
LABEL_15:
  objc_msgSend(v19, "setSendTimeout:", v13);
  return v12;
}

- (void)sendMessage:(id)a3 ofType:(unsigned __int16)a4 respondingTo:(id)a5 userInfo:(id)a6 idsOptions:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  OS_os_transaction *v24;
  OS_os_transaction *transaction;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v10 = a4;
  v12 = a3;
  v13 = a7;
  -[SYLegacyStore wrapMessage:ofType:respondingTo:userInfo:](self, "wrapMessage:ofType:respondingTo:userInfo:", v12, v10, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SYStore customIDSDeliveryOptions](self, "customIDSDeliveryOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[SYStore customIDSDeliveryOptions](self, "customIDSDeliveryOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v13)
      {
        v19 = (void *)objc_msgSend(v17, "mutableCopy");

        objc_msgSend(v19, "addEntriesFromDictionary:", v13);
        v13 = v19;
      }
      else
      {
        v13 = v17;
      }
    }
    if ((*(_WORD *)&self->super._flags & 0x4000) == 0)
    {
      v21 = *MEMORY[0x24BE4FB48];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE4FB48]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v23, "removeObjectForKey:", v21);

        v13 = v23;
      }
    }
    objc_msgSend(v14, "setExtraIDSOptions:", v13);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AD0, OS_LOG_TYPE_DEBUG))
      -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:].cold.2();
    v24 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v24;

    if (a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        _os_assumes_log();
      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYLegacyStore service](self, "service");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordOutgoingMessage:forService:", v14, v27);

      objc_msgSend(v14, "send");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        _os_assumes_log();
      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYLegacyStore service](self, "service");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "recordOutgoingMessage:forService:", v14, v29);

      -[NMSMessageCenter sendRequest:](self->_messageCenter, "sendRequest:", v14);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v20 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR))
      -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:].cold.1(v20);
  }

}

- (id)newMessageHeader
{
  void *v3;
  SYPeer *v4;
  void *v5;
  void *v6;
  SYPeer *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  v4 = [SYPeer alloc];
  -[SYLegacyStore persistentStore](self, "persistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SYPeer initWithPeerID:generation:](v4, "initWithPeerID:generation:", v6, 0);
  objc_msgSend(v3, "setSender:", v7);

  -[SYLegacyStore vectorClock](self, "vectorClock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v3, "setState:", v9);

  objc_msgSend(v3, "setVersion:", 1);
  -[SYLegacyStore persistentStore](self, "persistentStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSequenceNumber:", objc_msgSend(v10, "nextSequenceNumber"));

  return v3;
}

- (void)_transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD activity_block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (-[SYPersistentStore completedSync](self->_persistentStore, "completedSync"))
  {
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __76__SYLegacyStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke;
    activity_block[3] = &unk_24CC65990;
    activity_block[4] = self;
    v18 = v12;
    v19 = v13;
    v20 = v16;
    v22 = a6;
    v21 = v14;
    _os_activity_initiate(&dword_211704000, "CompanionSync Transaction", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1005, 0);
    (*((void (**)(id, void *))v14 + 2))(v14, v15);

  }
}

void __76__SYLegacyStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke(uint64_t a1)
{
  void *v2;
  SYTransaction *v3;

  v2 = (void *)MEMORY[0x212BE0D64]();
  v3 = -[SYTransaction initWithStore:]([SYTransaction alloc], "initWithStore:", *(_QWORD *)(a1 + 32));
  -[SYTransaction setContextInfo:](v3, "setContextInfo:", *(_QWORD *)(a1 + 40));
  -[SYTransaction setIdsOptions:](v3, "setIdsOptions:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  -[SYTransaction commitBlocking:reportError:](v3, "commitBlocking:reportError:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

  objc_autoreleasePoolPop(v2);
}

- (BOOL)_allowDeltaSyncWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  -[SYLegacyStore pairedDeviceID](self, "pairedDeviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 0;
  else
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1008, 0);
  if (-[SYPersistentStore completedSync](self->_persistentStore, "completedSync"))
  {
    if (!self->_deferredFullSync)
      goto LABEL_9;
    v9 = 1007;
  }
  else
  {
    v9 = 1005;
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", v9, 0);

  v8 = (void *)v10;
LABEL_9:
  if (v8)
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease(v8);
    }
    else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
      -[SYLegacyStore queue](self, "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __50__SYLegacyStore__allowDeltaSyncWithContext_error___block_invoke;
      block[3] = &unk_24CC65560;
      block[4] = self;
      v14 = v8;
      v15 = v6;
      dispatch_async(v11, block);

    }
  }

  return v8 == 0;
}

void __50__SYLegacyStore__allowDeltaSyncWithContext_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncStore:encounteredError:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  os_activity_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[SYLegacyStore _allowDeltaSyncWithContext:error:](self, "_allowDeltaSyncWithContext:error:", v11, a6);
  if (v13)
  {
    v14 = _os_activity_create(&dword_211704000, "CompanionSync AddObject", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_INFO, "addObject", v19, 2u);
    }
    +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v10, 0, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLegacyStore handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:](self, "handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:", v17, v11, v12, 0, 0);

  }
  return v13;
}

- (BOOL)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  os_activity_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[SYLegacyStore _allowDeltaSyncWithContext:error:](self, "_allowDeltaSyncWithContext:error:", v11, a6);
  if (v13)
  {
    v14 = _os_activity_create(&dword_211704000, "CompanionSync UpdateObject", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_INFO, "updateObject", v19, 2u);
    }
    +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v10, 1, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLegacyStore handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:](self, "handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:", v17, v11, v12, 0, 0);

  }
  return v13;
}

- (BOOL)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  os_activity_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v21[8];
  _QWORD block[5];
  os_activity_t v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[SYLegacyStore _allowDeltaSyncWithContext:error:](self, "_allowDeltaSyncWithContext:error:", v11, a6))
  {
    v13 = -[SYStore allowsDeletes](self, "allowsDeletes");
    if (v13)
    {
      v14 = _os_activity_create(&dword_211704000, "CompanionSync DeleteObject", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v15 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_INFO, "deleteObject", v21, 2u);
      }
      +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v10, 2, self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYLegacyStore handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:](self, "handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:", v17, v11, v12, 0, 0);

    }
    else
    {
      -[SYLegacyStore postUserNotification:message:](self, "postUserNotification:message:", CFSTR("Delete Denied"), CFSTR("A client attempted to send a delete message while deletes were denied."));
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1006, 0);
      v14 = v18;
      if (a6)
      {
        v14 = objc_retainAutorelease(v18);
        *a6 = v14;
      }
      else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
      {
        -[SYLegacyStore queue](self, "queue");
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __55__SYLegacyStore_deleteObject_context_idsOptions_error___block_invoke;
        block[3] = &unk_24CC65560;
        block[4] = self;
        v14 = v14;
        v23 = v14;
        v24 = v11;
        dispatch_async(v19, block);

      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __55__SYLegacyStore_deleteObject_context_idsOptions_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncStore:encounteredError:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)handleObjectChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
  -[SYLegacyStore _handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:notifyingTransaction:](self, "_handleObjectChanges:contextInfo:idsOptions:blockUntilSent:reportError:notifyingTransaction:", a3, a4, a5, a6, a7, 0);
}

- (void)_handleObjectChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7 notifyingTransaction:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, NSError *);
  id v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  NSError *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  _QWORD v31[5];
  NSError *v32;
  id v33;
  _QWORD block[5];
  id v35;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (void (**)(id, NSError *))a7;
  v18 = a8;
  if (self->_overflowRetryTimer)
  {
    if (v17)
    {
      v17[2](v17, self->_overflowRetryError);
    }
    else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
      -[SYLegacyStore queue](self, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke;
      block[3] = &unk_24CC652B8;
      block[4] = self;
      v35 = v15;
      dispatch_async(v20, block);

    }
  }
  else if (-[SYPersistentStore completedSync](self->_persistentStore, "completedSync"))
  {
    if (v10)
      v19 = dispatch_semaphore_create(0);
    else
      v19 = 0;
    -[SYLegacyStore queue](self, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_3;
    v25[3] = &unk_24CC659E0;
    v25[4] = self;
    v26 = v18;
    v27 = v14;
    v28 = v15;
    v29 = v16;
    v23 = v19;
    v30 = v23;
    dispatch_async(v22, v25);

    if (v23)
      dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v21 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1005, 0);
    if (v17)
    {
      v17[2](v17, v21);
    }
    else if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
      -[SYLegacyStore queue](self, "queue");
      v24 = objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_2;
      v31[3] = &unk_24CC65560;
      v31[4] = self;
      v32 = v21;
      v33 = v15;
      dispatch_async(v24, v31);

    }
  }

}

void __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncStore:encounteredError:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), *(_QWORD *)(a1 + 40));

}

void __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncStore:encounteredError:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_3(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v8;
  _QWORD activity_block[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[16];

  objc_msgSend(a1[4], "persistentStore");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_8;
  v3 = (void *)v2;
  objc_msgSend(a1[4], "messageCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(a1[4], "alwaysWins")
      && objc_msgSend(*((id *)a1[4] + 23), "lastSyncFailed"))
    {
      objc_msgSend(a1[4], "setNeedsFullSync");
    }
    if (objc_msgSend(a1[6], "count"))
    {
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_150;
      activity_block[3] = &unk_24CC659B8;
      activity_block[4] = a1[4];
      v10 = a1[6];
      v11 = a1[7];
      v12 = a1[8];
      v13 = a1[9];
      _os_activity_initiate(&dword_211704000, "CompanionSync HandleChangeList", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
    else
    {
      v8 = a1[9];
      if (v8)
        dispatch_semaphore_signal(v8);
    }
    return objc_msgSend(a1[5], "_transactionDidComplete:", 1);
  }
  else
  {
LABEL_8:
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "No persistent store or message center set up yet; probably we're not paired. Therefore: I'm dumping this change on the ground.",
        buf,
        2u);
    }
    return objc_msgSend(a1[5], "_transactionDidComplete:", 0);
  }
}

uint64_t __109__SYLegacyStore__handleObjectChanges_contextInfo_idsOptions_blockUntilSent_reportError_notifyingTransaction___block_invoke_150(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "logChanges:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "sendChanges:context:options:sentSignal:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)sendChanges:(id)a3 context:(id)a4 options:(id)a5 sentSignal:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD activity_block[4];
  id v20;
  SYLegacyStore *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SYLegacyStore queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SYLegacyStore_sendChanges_context_options_sentSignal___block_invoke;
  activity_block[3] = &unk_24CC659B8;
  v20 = v10;
  v21 = self;
  v22 = v13;
  v23 = v11;
  v24 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  _os_activity_initiate(&dword_211704000, "CompanionSync SendChanges", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __56__SYLegacyStore_sendChanges_context_options_sentSignal___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SYChangeMessage *v12;

  v12 = objc_alloc_init(SYChangeMessage);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "vectorClock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "persistentStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "increaseClockForPeerID:by:", v5, objc_msgSend(v2, "count"));

  objc_msgSend(*(id *)(a1 + 40), "_vectorClockUpdated");
  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "newMessageHeader");
  -[SYChangeMessage setHeader:](v12, "setHeader:", v6);

  -[SYChangeMessage setChanges:](v12, "setChanges:", v2);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[SYChangeMessage header](v12, "header");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "sequenceNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v11);

  }
  objc_msgSend(*(id *)(a1 + 40), "sendMessage:ofType:respondingTo:userInfo:idsOptions:", v12, 6, 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)logChanges:(id)a3
{
  id v4;
  os_activity_t v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (-[SYLegacyStore tracksChanges](self, "tracksChanges"))
  {
    v5 = _os_activity_create(&dword_211704000, "CompanionSync LogChanges", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    -[SYLegacyStore persistentStore](self, "persistentStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v7 = objc_msgSend(v6, "logChanges:error:", v4, &v13);
    v8 = v13;

    if ((v7 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYLegacyStore logChanges:].cold.1();
      objc_msgSend(v8, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("DB changelog failure. "), "stringByAppendingString:", v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("DB changelog failure. ");
      }
      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateLastIncomingMessageWithError:", v11);

    }
  }

}

- (void)setNeedsFullSyncWithContext:(id)a3 idsOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SYRetryTimer *syncRetryTimer;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (self->_overflowRetryTimer)
  {
    -[SYLegacyStore queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke;
    block[3] = &unk_24CC65418;
    block[4] = self;
    dispatch_async(v8, block);

  }
  else
  {
    -[SYRetryTimer cancel](self->_syncRetryTimer, "cancel");
    syncRetryTimer = self->_syncRetryTimer;
    self->_syncRetryTimer = 0;

    if (-[SYLegacyStore inDeltaSync](self, "inDeltaSync"))
    {
      self->_deferredFullSync = 1;
    }
    else
    {
      -[SYLegacyStore queue](self, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2;
      v11[3] = &unk_24CC65560;
      v11[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(v10, v11);

    }
  }

}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke(uint64_t a1)
{
  _WORD *v2;
  id v3;

  v2 = *(_WORD **)(a1 + 32);
  if ((v2[8] & 0x200) != 0)
  {
    objc_msgSend(v2, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "syncStore:encounteredErrorInFullSync:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));

  }
}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[16];

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_12;
  v4 = (void *)v3;
  objc_msgSend(*v2, "messageCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_2((uint64_t)v2, v7);
    if (objc_msgSend(*v2, "inFullSync"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
        __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_1();
    }
    else
    {
      if (objc_msgSend(*v2, "alwaysWins"))
        objc_msgSend(*v2, "setFullSyncWasRequestedBySlave:", 0);
      objc_msgSend(*(id *)(a1 + 32), "persistentStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCompletedSync:", 0);

      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "persistentStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFullSyncUserInfo:", v11);

      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "persistentStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFullSyncIDSOptions:", v13);

      objc_msgSend(*(id *)(a1 + 32), "performFullSyncIfNecessary");
    }
  }
  else
  {
LABEL_12:
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "No persistent store or message center set up yet; probably we're not paired. Therefore: I'm dumping this change on the ground.",
        v15,
        2u);
    }
    if ((*((_WORD *)*v2 + 8) & 0x200) != 0)
    {
      objc_msgSend(*v2, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "syncStore:encounteredErrorInFullSync:", *v2, *((_QWORD *)*v2 + 18));

    }
  }
}

- (void)remoteStoreAllObjects:(id)a3 fromPeer:(id)a4 clock:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_activity_t v11;
  void *v12;
  void *v13;
  void *v14;
  double Current;
  __int16 flags;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int16 v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_211704000, "CompanionSync remoteStoreAllObjects", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
  {
    v26 = v12;
    objc_msgSend(v9, "peerID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v27;
    v36 = 2048;
    v37 = objc_msgSend(v8, "count");
    v38 = 2048;
    v39 = objc_msgSend(v10, "version");
    _os_log_debug_impl(&dword_211704000, v26, OS_LOG_TYPE_DEBUG, "remoteStoreAllObjects from %{public}@, %lu objects, version %qu", buf, 0x20u);

  }
  if (-[SYLegacyStore alwaysWins](self, "alwaysWins"))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYLegacyStore remoteStoreAllObjects:fromPeer:clock:].cold.2();
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateLastIncomingMessageWithError:", CFSTR("Sync sent to master"));

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Full sync sent to master device"), CFSTR("Only the slave device should receive a full sync (from the master)"));
  }
  -[SYStore delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    Current = CFAbsoluteTimeGetCurrent();
    flags = (__int16)self->super._flags;
    v28 = v11;
    v17 = v10;
    if ((flags & 2) != 0)
    {
      objc_msgSend(v14, "syncStoreWillUpdate:objectCount:", self, objc_msgSend(v8, "count"));
    }
    else if ((flags & 1) != 0)
    {
      objc_msgSend(v14, "syncStoreWillUpdate:", self);
    }
    v18 = v9;
    if ((*(_WORD *)&self->super._flags & 0x10) != 0)
      objc_msgSend(v14, "syncStoreAllObjectsDeleted:", self);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v14, "syncStore:objectAdded:", self, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v21);
    }

    v24 = (__int16)self->super._flags;
    if ((v24 & 4) != 0)
    {
      objc_msgSend(v14, "syncStoreDidUpdate:", self);
      v24 = (__int16)self->super._flags;
    }
    v9 = v18;
    v10 = v17;
    if ((v24 & 8) != 0)
      objc_msgSend(v14, "syncStoreDidCompleteFullSync:", self);
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updateLastIncomingMessageWithProcessingTime:", CFAbsoluteTimeGetCurrent() - Current);

    v11 = v28;
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYLegacyStore remoteStoreAllObjects:fromPeer:clock:].cold.1();
  }

}

- (void)remoteStoreRequestFullSync
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Full sync requested from a slave device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)performFullSyncIfNecessaryAskingDelegate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  id v12;

  v3 = a3;
  if (!-[SYLegacyStore inFullSync](self, "inFullSync"))
    goto LABEL_9;
  if (v3 && -[SYLegacyStore alwaysWins](self, "alwaysWins"))
  {
    if (-[SYPersistentStore currentSyncSendComplete](self->_persistentStore, "currentSyncSendComplete"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
        -[SYLegacyStore performFullSyncIfNecessaryAskingDelegate:].cold.1();
      return;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 1004, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke;
    block[3] = &unk_24CC652B8;
    block[4] = self;
    v12 = v6;
    v8 = v6;
    dispatch_async(queue, block);

LABEL_9:
    v5 = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_166;
    v9[3] = &unk_24CC65860;
    v9[4] = self;
    v10 = v3;
    dispatch_async(v5, v9);
    return;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore performFullSyncIfNecessaryAskingDelegate:].cold.2();
}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_postBatchEndMessageWithState:error:then:", 0, *(_QWORD *)(a1 + 40), 0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  objc_msgSend(v2, "currentFullSyncID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exitFullSyncWithID:error:", v3, *(_QWORD *)(a1 + 40));

}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_166(uint64_t a1)
{
  void *v2;
  char v3;
  _WORD *v4;
  void *v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "completedSync");

  if ((v3 & 1) != 0)
    return;
  if (!*(_BYTE *)(a1 + 40) || (v4 = *(_WORD **)(a1 + 32), (v4[8] & 0x40) == 0))
  {
    if (*(_BYTE *)(a1 + 40))
      return;
    goto LABEL_11;
  }
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "syncStoreShouldPerformInitialFullSync:", *(_QWORD *)(a1 + 32));

  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_166_cold_2();
  if ((v6 & 1) != 0)
  {
LABEL_11:
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_166_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "performFullSyncToCurrentDBVersion");
  }
}

- (void)performFullSyncIfNecessary
{
  -[SYLegacyStore performFullSyncIfNecessaryAskingDelegate:](self, "performFullSyncIfNecessaryAskingDelegate:", 0);
}

- (void)performFullSyncToCurrentDBVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "performFullSync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)performFullSync
{
  void *v3;
  void *v4;
  NSObject *queue;
  _QWORD block[5];

  if (!-[SYLegacyStore fullSyncWasRequestedBySlave](self, "fullSyncWasRequestedBySlave"))
  {
    if (-[SYLegacyStore inFullSync](self, "inFullSync"))
      return;
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[SYPersistentStore enterFullSyncWithID:ignoring:](self->_persistentStore, "enterFullSyncWithID:ignoring:", v4, 0);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SYLegacyStore_performFullSync__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__SYLegacyStore_performFullSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performFullSyncToCurrentDBVersion");
}

- (BOOL)objectChanged:(id)a3 sinceVersion:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (-[SYLegacyStore tracksChanges](self, "tracksChanges"))
  {
    -[SYLegacyStore persistentStore](self, "persistentStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "objectChanged:sinceVersion:", v6, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (SYPersistentStore)persistentStore
{
  return self->_persistentStore;
}

- (void)setPersistentStore:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStore, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSString)databaseFileName
{
  return self->_databaseFileName;
}

- (void)setDatabaseFileName:(id)a3
{
  objc_storeStrong((id *)&self->_databaseFileName, a3);
}

- (BOOL)encryptPayloads
{
  return self->_encryptPayloads;
}

- (void)setEncryptPayloads:(BOOL)a3
{
  self->_encryptPayloads = a3;
}

- (BOOL)alwaysWins
{
  return self->_alwaysWins;
}

- (void)setAlwaysWins:(BOOL)a3
{
  self->_alwaysWins = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (__CFString)loggingFacility
{
  return self->_loggingFacility;
}

- (void)setLoggingFacility:(__CFString *)a3
{
  self->_loggingFacility = a3;
}

- (NSUUID)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceID, a3);
}

- (BOOL)registeredNotificationHandlers
{
  return self->_registeredNotificationHandlers;
}

- (void)setRegisteredNotificationHandlers:(BOOL)a3
{
  self->_registeredNotificationHandlers = a3;
}

- (NMSMessageCenter)messageCenter
{
  return self->_messageCenter;
}

- (void)setMessageCenter:(id)a3
{
  objc_storeStrong((id *)&self->_messageCenter, a3);
}

- (SYVectorClock)vectorClock
{
  return self->_vectorClock;
}

- (void)setVectorClock:(id)a3
{
  objc_storeStrong((id *)&self->_vectorClock, a3);
}

- (BOOL)fullSyncWasRequestedBySlave
{
  return self->_fullSyncWasRequestedBySlave;
}

- (void)setFullSyncWasRequestedBySlave:(BOOL)a3
{
  self->_fullSyncWasRequestedBySlave = a3;
}

- (id)nextBatchStep
{
  return self->_nextBatchStep;
}

- (void)setNextBatchStep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nextBatchStep, 0);
  objc_storeStrong((id *)&self->_vectorClock, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
  objc_storeStrong((id *)&self->_pairedDeviceID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_databaseFileName, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_overflowRetryError, 0);
  objc_storeStrong((id *)&self->_overflowRetryTimer, 0);
  objc_storeStrong((id *)&self->_syncRetryTimer, 0);
  objc_storeStrong((id *)&self->_sendSignals, 0);
  objc_storeStrong((id *)&self->_batchChunkUnackedIndices, 0);
}

- (id)newFullSyncContext
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
}

- (void)_retrySync
{
  SYRetryTimer *syncRetryTimer;
  SYRetryTimer *v4;
  SYRetryTimer *v5;
  void *v6;
  SYRetryTimer *v7;
  SYRetryTimer *v8;
  _QWORD v9[4];
  id v10;
  id location;

  syncRetryTimer = self->_syncRetryTimer;
  if (syncRetryTimer)
  {
    if (!-[SYRetryTimer incrementBackoff](syncRetryTimer, "incrementBackoff"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYLegacyStore(FullSyncSupport) _retrySync].cold.1();
      v4 = self->_syncRetryTimer;
      self->_syncRetryTimer = 0;

    }
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = [SYRetryTimer alloc];
    -[SYLegacyStore queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__SYLegacyStore_FullSyncSupport___retrySync__block_invoke;
    v9[3] = &unk_24CC655F8;
    objc_copyWeak(&v10, &location);
    v7 = -[SYRetryTimer initWithInterval:backoffFactor:maxRetries:queue:callout:](v5, "initWithInterval:backoffFactor:maxRetries:queue:callout:", 3, v6, v9, 15.0, 2.0);
    v8 = self->_syncRetryTimer;
    self->_syncRetryTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __44__SYLegacyStore_FullSyncSupport___retrySync__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performFullSyncToCurrentDBVersion");

}

- (void)_postBatchStartMessageWithState:(id)a3 then:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_opt_new();
  v8 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
  objc_msgSend(v11, "setHeader:", v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSyncID:", v9);

  -[SYLegacyStore setNextBatchStep:](self, "setNextBatchStep:", v6);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IDSOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:](self, "sendMessage:ofType:respondingTo:userInfo:idsOptions:", v11, 3, 0, v7, v10);

}

- (void)_postBatchEndMessageWithState:(id)a3 error:(id)a4 then:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  SYErrorInfo *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
  objc_msgSend(v11, "setHeader:", v12);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SyncID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSyncID:", v13);

  if (!v9)
    goto LABEL_5;
  v14 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", v9);
  objc_msgSend(v11, "setError:", v14);

  objc_msgSend(v11, "syncID");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v11, "header");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sender");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v11, "header");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "state");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
LABEL_5:
        -[SYLegacyStore setNextBatchStep:](self, "setNextBatchStep:", v10);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDSOptions"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:](self, "sendMessage:ofType:respondingTo:userInfo:idsOptions:", v11, 5, 0, v8, v22);
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore(BatchedSyncSupport) _postBatchEndMessageWithState:error:then:].cold.1();
  if ((*(_WORD *)&self->super._flags & 0x200) != 0)
  {
    v23 = objc_alloc(MEMORY[0x24BDD1540]);
    v26 = *MEMORY[0x24BDD1398];
    v27[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v23, "initWithSYError:userInfo:", 2017, v24);

    -[SYStore delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "syncStore:encounteredErrorInFullSync:", self, v22);

    goto LABEL_13;
  }
LABEL_14:

}

- (void)_restartBatchSyncWithState:(id)a3 then:(id)a4
{
  NSMutableIndexSet *batchChunkUnackedIndices;
  id v7;
  id v8;

  batchChunkUnackedIndices = self->_batchChunkUnackedIndices;
  v7 = a4;
  v8 = a3;
  -[NSMutableIndexSet removeAllIndexes](batchChunkUnackedIndices, "removeAllIndexes");
  -[SYLegacyStore _postBatchStartMessageWithState:then:](self, "_postBatchStartMessageWithState:then:", v8, v7);

}

- (void)_sendBatchChunk:(id)a3 withState:(id)a4 then:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        -[SYStore encodeSYObject:](self, "encodeSYObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore(BatchedSyncSupport) _sendBatchChunk:withState:then:].cold.1();
  v20 = (void *)objc_opt_new();
  v21 = -[SYLegacyStore newMessageHeader](self, "newMessageHeader");
  objc_msgSend(v20, "setHeader:", v21);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SyncID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSyncID:", v22);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BatchIndex"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setChunkIndex:", objc_msgSend(v23, "unsignedIntValue"));

  objc_msgSend(v20, "setObjects:", v11);
  -[SYLegacyStore setNextBatchStep:](self, "setNextBatchStep:", v10);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IDSOptions"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLegacyStore sendMessage:ofType:respondingTo:userInfo:idsOptions:](self, "sendMessage:ofType:respondingTo:userInfo:idsOptions:", v20, 4, 0, v9, v24);

}

- (BOOL)performBatchedSyncToCurrentDBVersion
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  NSMutableIndexSet *batchChunkUnackedIndices;
  NSMutableIndexSet *v22;
  NSMutableIndexSet *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  os_activity_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 *p_buf;
  _QWORD *v50;
  _QWORD *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id location;
  _QWORD v62[3];
  char v63;
  _QWORD v64[4];
  __int128 buf;
  uint64_t v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(v40, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "performBatchedSync: assigned UUID %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v38 = _os_activity_create(&dword_211704000, "CompanionSync BatchedFullSync", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  -[SYStore delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginSyncingAllObjectsForStore:", self);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYLegacyStore persistentStore](self, "persistentStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompletedSync:", 0);

    -[SYPersistentStore currentFullSyncID](self->_persistentStore, "currentFullSyncID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = v9 == 0;

    if ((_DWORD)v8)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "UUIDString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[SYPersistentStore enterFullSyncWithID:ignoring:](self->_persistentStore, "enterFullSyncWithID:ignoring:", v39, 0);
    }
    else
    {
      v39 = v7;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v11 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v40, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "Entering batch sync loop for UUID %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v14 = -[SYLegacyStore newFullSyncContext](self, "newFullSyncContext");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v39, CFSTR("SyncID"));
    -[SYPersistentStore fullSyncUserInfo](self->_persistentStore, "fullSyncUserInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (!v16)
    {
      -[SYPersistentStore fullSyncUserInfo](self->_persistentStore, "fullSyncUserInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("UserInfo"));

    }
    -[SYPersistentStore fullSyncIDSOptions](self->_persistentStore, "fullSyncIDSOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (!v19)
    {
      -[SYPersistentStore fullSyncIDSOptions](self->_persistentStore, "fullSyncIDSOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("IDSOptions"));

    }
    batchChunkUnackedIndices = self->_batchChunkUnackedIndices;
    if (batchChunkUnackedIndices)
    {
      -[NSMutableIndexSet removeAllIndexes](batchChunkUnackedIndices, "removeAllIndexes");
    }
    else
    {
      v22 = (NSMutableIndexSet *)objc_opt_new();
      v23 = self->_batchChunkUnackedIndices;
      self->_batchChunkUnackedIndices = v22;

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v66 = 0x2020000000;
    v67 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    v64[3] = 0;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 25);
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    v63 = 0;
    objc_initWeak(&location, self);
    v25 = MEMORY[0x24BDAC760];
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke;
    v59[3] = &unk_24CC65A08;
    objc_copyWeak(&v60, &location);
    v26 = (void *)MEMORY[0x212BE0F2C](v59);
    v55[0] = v25;
    v55[1] = 3221225472;
    v55[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2;
    v55[3] = &unk_24CC65A58;
    objc_copyWeak(&v58, &location);
    v27 = v14;
    v56 = v27;
    v28 = v26;
    v57 = v28;
    v53[0] = v25;
    v53[1] = 3221225472;
    v53[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_501;
    v53[3] = &unk_24CC65A80;
    v29 = (id)MEMORY[0x212BE0F2C](v55);
    v54 = v29;
    v30 = (void *)MEMORY[0x212BE0F2C](v53);
    v42[0] = v25;
    v42[1] = 3221225472;
    v42[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502;
    v42[3] = &unk_24CC65AD0;
    objc_copyWeak(&v52, &location);
    v42[4] = self;
    v31 = v27;
    v43 = v31;
    p_buf = &buf;
    v32 = v29;
    v45 = v32;
    v33 = v24;
    v44 = v33;
    v50 = v64;
    v46 = v41;
    v51 = v62;
    v34 = v30;
    v47 = v34;
    v35 = v28;
    v48 = v35;
    v36 = (void *)MEMORY[0x212BE0F2C](v42);
    -[SYLegacyStore _postBatchStartMessageWithState:then:](self, "_postBatchStartMessageWithState:then:", v31, v36);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v58);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYLegacyStore(BatchedSyncSupport) performBatchedSyncToCurrentDBVersion].cold.1();
  }

  return v41 != 0;
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2 && WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "persistentStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistentStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentFullSyncID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendCompletedForSyncWithID:", v6);

    WeakRetained = v7;
  }

}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (a3)
    {
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_3;
      v12 = &unk_24CC65A30;
      v13 = WeakRetained;
      v14 = *(id *)(a1 + 32);
      objc_msgSend(v13, "_postBatchEndMessageWithState:error:then:", v8, v5, &v9);

      if (!v5)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(WeakRetained, "_postBatchEndMessageWithState:error:then:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40));
      if (!v5)
        goto LABEL_11;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_cold_1();
    objc_msgSend(v7, "_retrySync", v9, v10, v11, v12);
  }
LABEL_11:

}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newMessageHeader");
  objc_msgSend(v8, "setHeader:", v2);

  v3 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAllObjects:", v3);

  objc_msgSend(v8, "setVersion:", 0);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SyncID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSyncID:", v4);

  v6 = *(id **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6[23], "fullSyncIDSOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessage:ofType:respondingTo:userInfo:idsOptions:", v8, 2, 0, v5, v7);

}

uint64_t __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_501(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502(uint64_t a1, void *a2, int a3)
{
  id v5;
  _WORD *WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t v26[16];
  _QWORD activity_block[4];
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "currentFullSyncID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    {
      __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502_cold_3();
      if (!v5)
      {
LABEL_13:
        objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
        v32 = 0;
        v33 = &v32;
        v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__3;
        v36 = __Block_byref_object_dispose__3;
        v37 = 0;
        activity_block[0] = MEMORY[0x24BDAC760];
        activity_block[1] = 3221225472;
        activity_block[2] = __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_503;
        activity_block[3] = &unk_24CC65AA8;
        v30 = *(_QWORD *)(a1 + 96);
        v29 = *(id *)(a1 + 64);
        v28 = *(id *)(a1 + 48);
        v31 = &v32;
        _os_activity_initiate(&dword_211704000, "Fetching sync batch", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        if (v10 == 3)
        {

          if (_sync_log_facilities_pred != -1)
            _os_once();
          v14 = qword_253D84AB8;
          if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "CompanionSync: batched full-sync restart requested", v26, 2u);
          }
          v15 = *(_QWORD *)(a1 + 40);
          objc_msgSend(WeakRetained, "nextBatchStep");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_restartBatchSyncWithState:then:", v15, v12);
          v5 = 0;
          goto LABEL_52;
        }
        if (v10 == 4 && v33[5])
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
            __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502_cold_1();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          goto LABEL_53;
        }
        objc_msgSend(WeakRetained, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        if (v13 == 2 || v13 == 4)
        {
          if ((WeakRetained[8] & 0x100) != 0)
            objc_msgSend(v11, "syncStoreShouldDeleteRemoteObjectsOnFailedFullSync:", *(_QWORD *)(a1 + 32));
          if (!v33[5])
          {
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) == 2)
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
            else
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 1004, 0);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v33[5];
            v33[5] = v21;

          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
        else
        {

          if (objc_msgSend(*(id *)(a1 + 48), "count"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, CFSTR("BatchIndex"));

            v18 = *(_QWORD *)(a1 + 40);
            v17 = *(_QWORD *)(a1 + 48);
            v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
            if (v19 == 1)
            {
              v20 = *(void **)(a1 + 72);
            }
            else
            {
              objc_msgSend(WeakRetained, "nextBatchStep");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(WeakRetained, "_sendBatchChunk:withState:then:", v17, v18, v20);
            if (v19 != 1)

            v23 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
            objc_msgSend(v23, "addIndex:");
            v5 = 0;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "_postBatchEndMessageWithState:error:then:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 80));
            v5 = 0;
          }
        }
        v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        if (v24 == 4)
        {
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
            || (*(_WORD *)(*(_QWORD *)(a1 + 32) + 16) & 0x200) == 0)
          {
LABEL_52:

LABEL_53:
            _Block_object_dispose(&v32, 8);

            goto LABEL_54;
          }
          objc_msgSend(v12, "syncStore:encounteredErrorInFullSync:", WeakRetained, v33[5]);
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        }
        if (v24 == 1)
        {
          objc_msgSend(WeakRetained, "persistentStore");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setCompletedSync:", 1);

        }
        goto LABEL_52;
      }
    }
    else
    {
LABEL_6:
      if (!v5)
        goto LABEL_13;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502_cold_2();
    if (a3 == 1)
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(WeakRetained, "nextBatchStep");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_restartBatchSyncWithState:then:", v8, v9);

      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      goto LABEL_13;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
LABEL_54:

}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_503(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v2 = a1[5];
  v6 = 0;
  v3 = (*(uint64_t (**)(void))(v2 + 16))();
  v4 = v6;
  v5 = v6;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v4);

}

- (void)processBatchSyncStart
{
  double Current;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SYLegacyStore *v12;
  id v13;

  if (-[SYLegacyStore alwaysWins](self, "alwaysWins"))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYLegacyStore(BatchedSyncSupport) processBatchSyncStart].cold.1();
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Full batched sync sent to master device"), CFSTR("Only the slave device should receive a full sync (from the master)"));
  }
  Current = CFAbsoluteTimeGetCurrent();
  -[SYStore delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _os_activity_create(&dword_211704000, "CompanionSync ProcessBatchSyncStart", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke;
  v11 = &unk_24CC652B8;
  v12 = self;
  v13 = v4;
  v6 = v4;
  os_activity_apply(v5, &v8);
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateLastIncomingMessageWithProcessingTime:", CFAbsoluteTimeGetCurrent() - Current);

}

void __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke(uint64_t a1)
{
  __int16 v2;
  __int16 v3;

  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke_cold_1();
  v2 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v2 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "syncStoreWillUpdate:objectCount:");
  }
  else if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "syncStoreWillUpdate:");
  }
  v3 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v3 & 0x10) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "syncStoreAllObjectsDeleted:");
    v3 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 16);
  }
  if ((v3 & 4) != 0)
    objc_msgSend(*(id *)(a1 + 40), "syncStoreDidUpdate:");
}

- (void)processBatchSyncEnd:(unint64_t)a3
{
  os_activity_t v4;
  void *v5;

  v4 = _os_activity_create(&dword_211704000, "CompanionSync ProcessBatchSyncEnd", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore(BatchedSyncSupport) processBatchSyncEnd:].cold.1();
  if ((*(_WORD *)&self->super._flags & 8) != 0)
  {
    -[SYStore delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncStoreDidCompleteFullSync:", self);

  }
}

- (BOOL)processBatchChunkAtIndex:(unsigned int)a3 encodedObjects:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  double Current;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  SYLegacyStore *v18;

  v6 = a4;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore(BatchedSyncSupport) processBatchChunkAtIndex:encodedObjects:error:].cold.1(v7);
  Current = CFAbsoluteTimeGetCurrent();
  v9 = _os_activity_create(&dword_211704000, "CompanionSync Delivering Batch Chunk", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke;
  v16 = &unk_24CC652B8;
  v17 = v6;
  v18 = self;
  v10 = v6;
  os_activity_apply(v9, &v13);
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateLastIncomingMessageWithProcessingTime:", CFAbsoluteTimeGetCurrent() - Current);

  return 1;
}

uint64_t __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2;
  v3[3] = &unk_24CC65AF8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "decodeSYObject:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*v2, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncStore:objectAdded:", *v2, v3);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v5 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2_cold_1((uint64_t)v2, v5);
  }

}

- (void)processBatchChunkAck:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    -[SYLegacyStore(BatchedSyncSupport) processBatchChunkAck:].cold.2(a3, v5);
  if ((-[NSMutableIndexSet containsIndex:](self->_batchChunkUnackedIndices, "containsIndex:", a3) & 1) != 0)
  {
    -[NSMutableIndexSet removeIndex:](self->_batchChunkUnackedIndices, "removeIndex:", a3);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
      -[SYLegacyStore(BatchedSyncSupport) processBatchChunkAck:].cold.1(a3, v6, v7);
  }
}

- (void)willBeginDeltaSync
{
  NSObject *v3;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Beginning SYLegacyStore delta sync", v4, 2u);
  }
  -[SYPersistentStore setPerformingDeltaSync:](self->_persistentStore, "setPerformingDeltaSync:", 1);
}

- (void)didEndDeltaSync
{
  NSObject *v3;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Ended SYLegacyStore delta sync", v4, 2u);
  }
  -[SYPersistentStore setPerformingDeltaSync:](self->_persistentStore, "setPerformingDeltaSync:", 0);
  if (self->_deferredFullSync)
  {
    self->_deferredFullSync = 0;
    -[SYLegacyStore performFullSync](self, "performFullSync");
  }
}

- (BOOL)inDeltaSync
{
  return -[SYPersistentStore isPerformingDeltaSync](self->_persistentStore, "isPerformingDeltaSync");
}

- (BOOL)tracksChanges
{
  return self->_tracksChanges;
}

- (void)setTracksChanges:(BOOL)a3
{
  if (self->_tracksChanges != a3)
  {
    self->_tracksChanges = a3;
    -[SYPersistentStore changeTrackingToggled:](self->_persistentStore, "changeTrackingToggled:");
  }
}

- (void)_checkMessageHeader:(void *)a1 messageID:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend((id)OUTLINED_FUNCTION_13(), "version");
  OUTLINED_FUNCTION_23(&dword_211704000, v1, v3, "Received message from unknown protocol version '%u'", (uint8_t *)v4);

  OUTLINED_FUNCTION_2();
}

- (void)_checkMessageHeader:(os_log_t)log messageID:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_211704000, log, (os_log_type_t)0x90u, "Message repeated (bubble): seqno = %qu, messageID: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_recordLastSeqNo:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211704000, v4, v5, "Failed to store latest incoming sequence number: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_7_cold_1()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_26();
  v1 = v0;
  objc_msgSend(v0, "inReplyTo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "header");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "version");
  OUTLINED_FUNCTION_16(&dword_211704000, v4, v5, "Peer responded to message %{public}@ with a version rejection. Peer is using version %u, and supports versions %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_19();
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_92_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (objc_msgSend(a2, "accepted"))
    v4 = "YES";
  else
    v4 = "NO";
  objc_msgSend(a2, "inProgressSyncID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("nil");
  objc_msgSend(a2, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v11 = 136315650;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("nil");
  v12 = v4;
  v13 = 2114;
  v14 = v7;
  v15 = 2112;
  v16 = v10;
  _os_log_debug_impl(&dword_211704000, v3, OS_LOG_TYPE_DEBUG, "SyncRequest response: accepted=%s, inProgressSyncID=%{public}@, error=%@", (uint8_t *)&v11, 0x20u);

}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_98_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "waitingForSyncEndID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211704000, v5, v6, "Wait for in-progress sync %{public}@ timed out, re-sending sync request now.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_0();
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_2_101_cold_1()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_26();
  objc_msgSend(v1, "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "count");
  OUTLINED_FUNCTION_16(&dword_211704000, v3, v4, "Dropped messages detected upon receipt of message with ID %{public}@: missing %u ACKs of full-sync batches, specifically: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_19();
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_107_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211704000, v4, v5, "Failed to send full-sync initiation message; dropping it on the floor and leaving sync mode. Next change will trigge"
    "r a full sync. Error = %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);

  OUTLINED_FUNCTION_4_0();
}

void __43__SYLegacyStore__setupMessageCenter_LOCKED__block_invoke_107_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_211704000, v0, (uint64_t)v0, "dataIdentifier: %{public}@ didSendWithSuccess: NO error: %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_24(&dword_211704000, v0, (uint64_t)v0, "Peer has a future version of my data ?? It has: %llu, I have: %llu", v1);
  OUTLINED_FUNCTION_2();
}

- (void)peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "My vector clock: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)peerState:fromPeer:matchesExpectationForChangeCount:offsetAmount:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "Incoming vector clock: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_1(int a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a2 + 48);
  v5 = a3;
  _SYObfuscate(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = a1;
  v8 = 2114;
  v9 = v6;
  _os_log_debug_impl(&dword_211704000, v5, OS_LOG_TYPE_DEBUG, "Failed to decode data object at index %u of message: %{public}@", (uint8_t *)v7, 0x12u);

  OUTLINED_FUNCTION_12();
}

void __47__SYLegacyStore_handleSyncAllObjects_response___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_15(&dword_211704000, v4, v5, "Decoded nil object from change data for service %{public}@., Enable debug logging (on debug builds only) to see full info.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

- (void)handleChangeMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "No delegate for -handleChangeMessage:, so I have to ignore the change!! This will likely cause problems...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)handleChangeMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "handleChangeMessage - done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)handleChangeMessage:(_QWORD *)a3 .cold.3(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_1(&dword_211704000, a4, (uint64_t)a3, "No object decoded from payload for change '%{public}@'", a2);

}

- (void)handleChangeMessage:(_BYTE *)a1 .cold.4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_211704000, v2, (uint64_t)v2, "remoteStoreDidChange, objectAdded", v3);
}

- (void)handleChangeMessage:(_BYTE *)a1 .cold.5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_211704000, v2, (uint64_t)v2, "remoteStoreDidChange, objectUpdated", v3);
}

- (void)handleChangeMessage:(_BYTE *)a1 .cold.6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_211704000, v2, (uint64_t)v2, "remoteStoreDidChange, objectDeleted", v3);
}

- (void)handleChangeMessage:.cold.7()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(&dword_211704000, v0, (uint64_t)v0, "New message seqno: %qu, last message seqno: %qu", v1);
  OUTLINED_FUNCTION_2();
}

- (void)messageCenter:(void *)a1 didReceiveUnknownRequest:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211704000, v4, v5, "Received an unknown message: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

- (void)messageCenter:(void *)a1 didResolveIDSIdentifierForRequest:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_211704000, v1, OS_LOG_TYPE_DEBUG, "Ending XPC transaction around (asynchronous) message send (%s)", v3, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "dataIdentifier: %{public}@ didSendWithSuccess: YES error: nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "Remote delivery confirmation for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendMessage:(void *)a1 ofType:respondingTo:userInfo:idsOptions:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211704000, v4, v5, "Failed to wrap message: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

- (void)sendMessage:ofType:respondingTo:userInfo:idsOptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Entering XPC transaction around (asynchronous) message-send", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)logChanges:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  id v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_4_1(v2);
  v4 = 134218242;
  v5 = OUTLINED_FUNCTION_18();
  v6 = 2112;
  v7 = v0;
  OUTLINED_FUNCTION_24(&dword_211704000, v1, v3, "Failed to log %zu changes: %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_12();
}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Skipping full sync, already in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __56__SYLegacyStore_setNeedsFullSyncWithContext_idsOptions___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;

  OUTLINED_FUNCTION_17(a1, a2);
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_13(), "alwaysWins");
  v6 = "NO";
  if (v4)
    v6 = "YES";
  v7 = 134218242;
  v8 = v2;
  v9 = 2080;
  v10 = v6;
  OUTLINED_FUNCTION_11(&dword_211704000, v3, v5, "-setNeedsFullSync called by client - SYStore %p, alwaysWins %s", (uint8_t *)&v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)remoteStoreAllObjects:fromPeer:clock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "No delegate set, so changes will be ignored.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)remoteStoreAllObjects:fromPeer:clock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Full sync sent to the master device!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)performFullSyncIfNecessaryAskingDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Already in full-sync, send was complete, ignoring this request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)performFullSyncIfNecessaryAskingDelegate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Already in full-sync, ignoring this request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_166_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "No full-sync sent, so triggering full sync now", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __58__SYLegacyStore_performFullSyncIfNecessaryAskingDelegate___block_invoke_166_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "delegate shouldPerformInitialFullSync returned %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Error detected during batched full-sync: scheduling retry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Batch sync client reported error: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Error during batched sync: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __73__SYLegacyStore_BatchedSyncSupport__performBatchedSyncToCurrentDBVersion__block_invoke_2_502_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "I'm doing a batched sync, but I have no current sync ID?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __58__SYLegacyStore_BatchedSyncSupport__processBatchSyncStart__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Starting batched full-sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __83__SYLegacyStore_BatchedSyncSupport__processBatchChunkAtIndex_encodedObjects_error___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211704000, v4, v5, "Decoded nil object from change data for service %{public}@., Enable debug logging (on debug builds only) to see full info.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_0();
}

@end
