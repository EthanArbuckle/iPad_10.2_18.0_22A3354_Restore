@implementation _SYDeviceMonitor

- (id)currentTargetableDevice
{
  NSObject *syncQ;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  syncQ = self->_syncQ;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43___SYDeviceMonitor_currentTargetableDevice__block_invoke;
  v5[3] = &unk_24CC66750;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (id)sharedInstance___singleton;
}

- (_SYDeviceMonitor)init
{
  _SYDeviceMonitor *v2;
  uint64_t v3;
  NSMutableSet *devices;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *syncQ;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSUUID *currentTargetDeviceUUID;
  _SYDeviceMonitor *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_SYDeviceMonitor;
  v2 = -[_SYDeviceMonitor init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("_SYDeviceMonitor RWLock", v5);
    syncQ = v2->_syncQ;
    v2->_syncQ = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__deviceDidBecomeActive_, *MEMORY[0x24BE6B420], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__deviceDidBecomeActive_, *MEMORY[0x24BE6B440], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__deviceDidBecomeInactive_, *MEMORY[0x24BE6B428], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__deviceDidBecomeInactive_, *MEMORY[0x24BE6B450], 0);

    -[_SYDeviceMonitor _rebuildDeviceList](v2, "_rebuildDeviceList");
    -[_SYDeviceMonitor currentTargetableDevice](v2, "currentTargetableDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pairingID");
    v13 = objc_claimAutoreleasedReturnValue();
    currentTargetDeviceUUID = v2->_currentTargetDeviceUUID;
    v2->_currentTargetDeviceUUID = (NSUUID *)v13;

    v15 = v2;
  }

  return v2;
}

- (void)_rebuildDeviceList
{
  NSObject *syncQ;
  _QWORD block[5];

  syncQ = self->_syncQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38___SYDeviceMonitor__rebuildDeviceList__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_barrier_sync(syncQ, block);
}

- (void)_clearDeviceList
{
  NSObject *syncQ;
  _QWORD block[5];

  syncQ = self->_syncQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36___SYDeviceMonitor__clearDeviceList__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_barrier_sync(syncQ, block);
}

- (void)deviceBecameTargetable:(id)a3
{
  void *v4;
  char v5;
  NSUUID *v6;
  NSUUID *currentTargetDeviceUUID;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", self->_currentTargetDeviceUUID);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v9, "pairingID");
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    currentTargetDeviceUUID = self->_currentTargetDeviceUUID;
    self->_currentTargetDeviceUUID = v6;

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("SYDeviceTargetedNewDeviceNotification"), v9);

    }
  }

}

- (void)_deviceDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6B418]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_SYDeviceMonitor deviceForNRDevice:](self, "deviceForNRDevice:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[_SYDeviceMonitor addNRDevice:](self, "addNRDevice:", v8);
  -[_SYDeviceMonitor deviceForNRDevice:](self, "deviceForNRDevice:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isTargetable"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SYDeviceTargetabilityChangedNotification"), v6);

  }
}

- (void)_deviceDidBecomeInactive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6B418]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_SYDeviceMonitor deviceForNRDevice:](self, "deviceForNRDevice:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_SYDeviceMonitor removeNRDevice:](self, "removeNRDevice:", v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SYDeviceRemovedNotification"), v5);

  }
}

- (void)addNRDevice:(id)a3
{
  id v4;
  SYDevice *v5;
  NSObject *syncQ;
  SYDevice *v7;
  _QWORD block[5];
  SYDevice *v9;

  v4 = a3;
  v5 = -[SYDevice initWithNRDevice:]([SYDevice alloc], "initWithNRDevice:", v4);

  syncQ = self->_syncQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32___SYDeviceMonitor_addNRDevice___block_invoke;
  block[3] = &unk_24CC652B8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_sync(syncQ, block);

}

- (void)removeNRDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *syncQ;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35___SYDeviceMonitor_removeNRDevice___block_invoke;
  block[3] = &unk_24CC65560;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_barrier_sync(syncQ, block);

}

- (id)deviceForNRDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *syncQ;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_SYDeviceMonitor deviceForPairingID:](self, "deviceForPairingID:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__9;
    v16 = __Block_byref_object_dispose__9;
    v17 = 0;
    syncQ = self->_syncQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38___SYDeviceMonitor_deviceForNRDevice___block_invoke;
    block[3] = &unk_24CC66728;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(syncQ, block);
    v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (id)deviceForPairingID:(id)a3
{
  id v4;
  NSObject *syncQ;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39___SYDeviceMonitor_deviceForPairingID___block_invoke;
  block[3] = &unk_24CC66728;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(syncQ, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allDevices
{
  NSObject *syncQ;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  syncQ = self->_syncQ;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30___SYDeviceMonitor_allDevices__block_invoke;
  v5[3] = &unk_24CC65440;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQ, 0);
  objc_storeStrong((id *)&self->_currentTargetDeviceUUID, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
