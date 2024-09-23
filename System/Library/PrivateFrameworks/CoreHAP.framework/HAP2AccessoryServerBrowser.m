@implementation HAP2AccessoryServerBrowser

- (void)storage:(id)a3 didSaveKeyWithIdentifier:(id)a4
{
  -[HAP2AccessoryServerBrowser _notifyCoordinatorsOfAccessoryWithDeviceID:](self, "_notifyCoordinatorsOfAccessoryWithDeviceID:", a4);
}

void __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "coordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resurfaceDiscoveryInfoForDeviceID:", *(_QWORD *)(a1 + 32));

}

void __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "coordinatorInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke_2;
  v4[3] = &unk_1E894B278;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

- (NSArray)coordinatorInfo
{
  return self->_coordinatorInfo;
}

void __72__HAP2AccessoryServerBrowser_startConfirmingPairedAccessoryReachability__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setConfirming:", 1);
    objc_msgSend(v3, "pairedAccessoryServers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_8676);

    WeakRetained = v3;
  }

}

- (void)_notifyCoordinatorsOfAccessoryWithDeviceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)startConfirmingPairedAccessoryReachability
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HAP2AccessoryServerBrowser_startConfirmingPairedAccessoryReachability__block_invoke;
  v4[3] = &unk_1E894E050;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (HAP2SerializedOperationQueue)workQueue
{
  return self->_workQueue;
}

- (NSArray)pairedAccessoryServers
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8600;
  v11 = __Block_byref_object_dispose__8601;
  v12 = 0;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HAP2AccessoryServerBrowser_pairedAccessoryServers__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __52__HAP2AccessoryServerBrowser_pairedAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "livePairedAccessoryServers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __44__HAP2AccessoryServerBrowser_setConfirming___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setConfirming:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HAP2AccessoryServerBrowser_setConfirming___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performWritingBlock:", v6);

}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (NSMutableArray)livePairedAccessoryServers
{
  void *v3;

  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOwner");

  return self->_livePairedAccessoryServers;
}

- (HAP2AccessoryServerBrowser)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AccessoryServerBrowser)initWithCoordinators:(id)a3 storage:(id)a4
{
  id v6;
  id v7;
  HAP2AccessoryServerBrowser *v8;
  HAP2AccessoryServerBrowser *v9;
  uint64_t v10;
  HAP2PropertyLock *propertyLock;
  NSOperationQueue *v12;
  void *v13;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v15;
  void *v16;
  HAP2SerializedOperationQueue *v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *dispatchWorkQueue;
  uint64_t v22;
  NSMutableArray *liveUnpairedAccessoryServers;
  uint64_t v24;
  NSMutableArray *livePairedAccessoryServers;
  uint64_t v26;
  NSMapTable *weakOperationQueuesByDeviceID;
  uint64_t v28;
  NSMutableArray *browserOperationQueue;
  void *v30;
  void *v31;
  HAP2AccessoryServerBrowser *v32;
  id v33;
  HAP2SerializedOperationQueue *v34;
  uint64_t v35;
  NSArray *coordinatorInfo;
  _QWORD v38[4];
  HAP2AccessoryServerBrowser *v39;
  HAP2SerializedOperationQueue *v40;
  id v41;
  objc_super v42;

  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HAP2AccessoryServerBrowser;
  v8 = -[HAP2AccessoryServerBrowser init](&v42, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_storage, a4);
    -[HAP2Storage setDelegate:](v9->_storage, "setDelegate:", v9);
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AccessoryServerBrowser.propertyLock"));
    v10 = objc_claimAutoreleasedReturnValue();
    propertyLock = v9->_propertyLock;
    v9->_propertyLock = (HAP2PropertyLock *)v10;

    v12 = (NSOperationQueue *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", HAPDispatchQueueName(v9, CFSTR("operationQueue")));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v12, "setName:", v13);

    -[NSOperationQueue setQualityOfService:](v12, "setQualityOfService:", 17);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v12;
    v15 = v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", HAPDispatchQueueName(v9, CFSTR("workQueue")));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HAP2SerializedOperationQueue initWithName:operationQueue:]([HAP2SerializedOperationQueue alloc], "initWithName:operationQueue:", v16, v15);
    objc_storeStrong((id *)&v9->_workQueue, v17);
    v18 = (const char *)HAPDispatchQueueName(v9, CFSTR("dispatchWorkQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    dispatchWorkQueue = v9->_dispatchWorkQueue;
    v9->_dispatchWorkQueue = (OS_dispatch_queue *)v20;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    liveUnpairedAccessoryServers = v9->_liveUnpairedAccessoryServers;
    v9->_liveUnpairedAccessoryServers = (NSMutableArray *)v22;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    livePairedAccessoryServers = v9->_livePairedAccessoryServers;
    v9->_livePairedAccessoryServers = (NSMutableArray *)v24;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v26 = objc_claimAutoreleasedReturnValue();
    weakOperationQueuesByDeviceID = v9->_weakOperationQueuesByDeviceID;
    v9->_weakOperationQueuesByDeviceID = (NSMapTable *)v26;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    browserOperationQueue = v9->_browserOperationQueue;
    v9->_browserOperationQueue = (NSMutableArray *)v28;

    v9->_discovering = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v9, sel_handleCurrentNetworkChangedNotification_, *MEMORY[0x1E0D28538], 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __59__HAP2AccessoryServerBrowser_initWithCoordinators_storage___block_invoke;
    v38[3] = &unk_1E894B1A0;
    v32 = v9;
    v39 = v32;
    v40 = v17;
    v41 = v31;
    v33 = v31;
    v34 = v17;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v38);
    v35 = objc_msgSend(v33, "copy");
    coordinatorInfo = v32->_coordinatorInfo;
    v32->_coordinatorInfo = (NSArray *)v35;

  }
  return v9;
}

- (NSMutableArray)liveUnpairedAccessoryServers
{
  void *v3;

  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOwner");

  return self->_liveUnpairedAccessoryServers;
}

- (HAP2AccessoryServerBrowserDelegate)delegate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8600;
  v11 = __Block_byref_object_dispose__8601;
  v12 = 0;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__HAP2AccessoryServerBrowser_delegate__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerBrowserDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HAP2AccessoryServerBrowser_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (BOOL)isDiscovering
{
  HAP2AccessoryServerBrowser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__HAP2AccessoryServerBrowser_isDiscovering__block_invoke;
  v5[3] = &unk_1E894DEE8;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performReadingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setDiscovering:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HAP2AccessoryServerBrowser_setDiscovering___block_invoke;
  v7[3] = &unk_1E894D770;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "performWritingBlock:", v7);

}

- (BOOL)isConfirming
{
  HAP2AccessoryServerBrowser *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__HAP2AccessoryServerBrowser_isConfirming__block_invoke;
  v5[3] = &unk_1E894DEE8;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performReadingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSArray)unpairedAccessoryServers
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8600;
  v11 = __Block_byref_object_dispose__8601;
  v12 = 0;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HAP2AccessoryServerBrowser_unpairedAccessoryServers__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)startDiscovering
{
  HAP2AccessoryServerBrowserOperation *v3;

  v3 = -[HAP2AccessoryServerBrowserOperation initWithType:]([HAP2AccessoryServerBrowserOperation alloc], "initWithType:", 1);
  -[HAP2AccessoryServerBrowser _enqueueOperation:](self, "_enqueueOperation:", v3);

}

- (void)stopDiscovering
{
  HAP2AccessoryServerBrowserOperation *v3;

  v3 = -[HAP2AccessoryServerBrowserOperation initWithType:]([HAP2AccessoryServerBrowserOperation alloc], "initWithType:", 2);
  -[HAP2AccessoryServerBrowser _enqueueOperation:](self, "_enqueueOperation:", v3);

}

- (void)stopConfirmingPairedAccessoryReachability
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__HAP2AccessoryServerBrowser_stopConfirmingPairedAccessoryReachability__block_invoke;
  v4[3] = &unk_1E894E050;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)accessoryWithDeviceIDIsPaired:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke;
  v11[3] = &unk_1E894DC48;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "addBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)retrieveLocalPairingIdentityForDeviceID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HAP2AccessoryServerBrowser_retrieveLocalPairingIdentityForDeviceID_completion___block_invoke;
  v11[3] = &unk_1E894DC48;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "addBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)savePublicKey:(id)a3 forAccessoryWithID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke;
  v15[3] = &unk_1E894DC70;
  objc_copyWeak(&v19, &location);
  v12 = v10;
  v18 = v12;
  v13 = v9;
  v16 = v13;
  v14 = v8;
  v17 = v14;
  objc_msgSend(v11, "addBlock:", v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)removePublicKeyForAccessoryWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke;
  v11[3] = &unk_1E894DC48;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "addBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)operationQueueForDeviceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__8600;
  v16 = __Block_byref_object_dispose__8601;
  v17 = 0;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HAP2AccessoryServerBrowser_operationQueueForDeviceID___block_invoke;
  v9[3] = &unk_1E894BD68;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performWritingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)accessoryServerDidUpdateConnectionState:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "connectionState"))
  {
    objc_initWeak(&location, self);
    -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke;
    v6[3] = &unk_1E894DF38;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    objc_msgSend(v5, "addBlock:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)initializeKeyBagIfNecessary
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)currentIdentity
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)onDemandConnectionsAreEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (NSMutableArray)browserOperationQueue
{
  void *v3;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  return self->_browserOperationQueue;
}

- (HAP2AccessoryServerBrowserOperation)currentOperation
{
  void *v3;
  void *v4;
  void *v5;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerBrowser browserOperationQueue](self, "browserOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HAP2AccessoryServerBrowserOperation *)v5;
}

- (void)_enqueueOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServerBrowser__enqueueOperation___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_beginOperation
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  id v7;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerBrowser currentOperation](self, "currentOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    v5 = objc_msgSend(v4, "type");
    if (v5 == 2)
    {
      -[HAP2AccessoryServerBrowser _stopDiscovering](self, "_stopDiscovering");
    }
    else
    {
      v6 = v5 == 1;
      v4 = v7;
      if (!v6)
        goto LABEL_8;
      -[HAP2AccessoryServerBrowser _startDiscovering](self, "_startDiscovering");
    }
    v4 = v7;
  }
LABEL_8:

}

- (void)_finishOperation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerBrowser browserOperationQueue](self, "browserOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectAtIndex:", 0);

  -[HAP2AccessoryServerBrowser browserOperationQueue](self, "browserOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_initWeak(&location, self);
    -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__HAP2AccessoryServerBrowser__finishOperation__block_invoke;
    v8[3] = &unk_1E894E050;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "addBlock:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_startDiscovering
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  if (-[HAP2AccessoryServerBrowser isDiscovering](self, "isDiscovering"))
  {
    -[HAP2AccessoryServerBrowser _finishOperation](self, "_finishOperation");
  }
  else
  {
    -[HAP2AccessoryServerBrowser setPowerState:](self, "setPowerState:", 0);
    +[HAPPowerManager sharedInstance](HAPPowerManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerBrowser setPowerManager:](self, "setPowerManager:", v4);

    -[HAP2AccessoryServerBrowser powerManager](self, "powerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerBrowser dispatchWorkQueue](self, "dispatchWorkQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForSleepWake:queue:", self, v6);

    -[HAP2AccessoryServerBrowser setDiscovering:](self, "setDiscovering:", 1);
    -[HAP2AccessoryServerBrowser currentOperation](self, "currentOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerBrowser coordinatorInfo](self, "coordinatorInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__HAP2AccessoryServerBrowser__startDiscovering__block_invoke;
    v12[3] = &unk_1E894B278;
    v11 = v7;
    v13 = v11;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

    objc_msgSend(v11, "pendingCoordinators");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      -[HAP2AccessoryServerBrowser _finishStartDiscovering](self, "_finishStartDiscovering");

  }
}

- (void)_finishStartDiscovering
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerBrowser delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HAP2AccessoryServerBrowser currentOperation](self, "currentOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryServerBrowser:didStartDiscoveringWithError:", self, v5);

  }
  -[HAP2AccessoryServerBrowser _finishOperation](self, "_finishOperation");

}

- (void)_stopDiscovering
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[5];

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  if (-[HAP2AccessoryServerBrowser isDiscovering](self, "isDiscovering"))
  {
    -[HAP2AccessoryServerBrowser setDiscovering:](self, "setDiscovering:", 0);
    -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke;
    v17[3] = &unk_1E894DD08;
    v17[4] = self;
    objc_msgSend(v4, "performWritingBlock:", v17);

    -[HAP2AccessoryServerBrowser currentOperation](self, "currentOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerBrowser coordinatorInfo](self, "coordinatorInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    v13 = 3221225472;
    v14 = __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke_2;
    v15 = &unk_1E894B278;
    v8 = v6;
    v16 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v12);

    objc_msgSend(v8, "pendingCoordinators", v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      -[HAP2AccessoryServerBrowser _finishStopDiscovering](self, "_finishStopDiscovering");
    -[HAP2AccessoryServerBrowser powerManager](self, "powerManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deRegisterFromSleepWake:", self);

  }
  else
  {
    -[HAP2AccessoryServerBrowser _finishOperation](self, "_finishOperation");
  }
}

- (void)_finishStopDiscovering
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerBrowser delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HAP2AccessoryServerBrowser currentOperation](self, "currentOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryServerBrowser:didStopDiscoveringWithError:", self, v5);

  }
  -[HAP2AccessoryServerBrowser _finishOperation](self, "_finishOperation");

}

- (id)_lookupPairedAccessoryServerWithDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOwner");

  -[HAP2AccessoryServerBrowser livePairedAccessoryServers](self, "livePairedAccessoryServers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerBrowser__lookupPairedAccessoryServerWithDeviceID___block_invoke;
  v11[3] = &unk_1E894B2A0;
  v7 = v4;
  v12 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_removeAccessoryServerFromArray:(id)a3 withDeviceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertOwner");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__HAP2AccessoryServerBrowser__removeAccessoryServerFromArray_withDeviceID___block_invoke;
  v14[3] = &unk_1E894B2C8;
  v15 = v7;
  v9 = v7;
  v10 = objc_msgSend(v6, "indexOfObjectPassingTest:", v14);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = v10;
    objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", v12);
  }

  return v11;
}

- (void)_updateArraysForDiscoveredAccessoryServer:(id)a3 paired:(BOOL)a4 lost:(id *)a5 existing:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  objc_msgSend(v10, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8600;
  v31 = __Block_byref_object_dispose__8601;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8600;
  v25 = __Block_byref_object_dispose__8601;
  v26 = 0;
  -[HAP2AccessoryServerBrowser propertyLock](self, "propertyLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke;
  v15[3] = &unk_1E894B2F0;
  v20 = a4;
  v15[4] = self;
  v18 = &v27;
  v13 = v11;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  v19 = &v21;
  objc_msgSend(v12, "performWritingBlock:", v15);

  *a5 = objc_retainAutorelease((id)v28[5]);
  *a6 = objc_retainAutorelease((id)v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

- (void)coordinator:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke;
  v11[3] = &unk_1E894DFD8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "addBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)coordinator:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke;
  v11[3] = &unk_1E894DFD8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "addBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)coordinator:(id)a3 didCreateUnpairedAccessoryServer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFA376F0))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__HAP2AccessoryServerBrowser_coordinator_didCreateUnpairedAccessoryServer___block_invoke;
  v13[3] = &unk_1E894DFD8;
  objc_copyWeak(&v16, &location);
  v11 = v7;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "addBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)coordinator:(id)a3 didCreatePairedAccessoryServer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFA37D98))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke;
  v13[3] = &unk_1E894DFD8;
  objc_copyWeak(&v16, &location);
  v11 = v7;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "addBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)coordinator:(id)a3 didLoseAccessory:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerBrowser workQueue](self, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke;
  v14[3] = &unk_1E894DFD8;
  objc_copyWeak(&v17, &location);
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "addBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)storage:(id)a3 didRemoveKeyWithIdentifier:(id)a4
{
  -[HAP2AccessoryServerBrowser _notifyCoordinatorsOfAccessoryWithDeviceID:](self, "_notifyCoordinatorsOfAccessoryWithDeviceID:", a4);
}

- (void)handleCurrentNetworkChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "notification=%@", (uint8_t *)&v9, 0xCu);

  }
  -[HAP2AccessoryServerBrowser pairedAccessoryServers](self, "pairedAccessoryServers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_230);

}

- (HAP2Storage)storage
{
  return self->_storage;
}

- (void)setLiveUnpairedAccessoryServers:(id)a3
{
  objc_storeStrong((id *)&self->_liveUnpairedAccessoryServers, a3);
}

- (void)setLivePairedAccessoryServers:(id)a3
{
  objc_storeStrong((id *)&self->_livePairedAccessoryServers, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (OS_dispatch_queue)dispatchWorkQueue
{
  return self->_dispatchWorkQueue;
}

- (NSMapTable)weakOperationQueuesByDeviceID
{
  return self->_weakOperationQueuesByDeviceID;
}

- (HAPPowerManager)powerManager
{
  return self->_powerManager;
}

- (void)setPowerManager:(id)a3
{
  objc_storeStrong((id *)&self->_powerManager, a3);
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(unint64_t)a3
{
  self->_powerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_weakOperationQueuesByDeviceID, 0);
  objc_storeStrong((id *)&self->_dispatchWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_coordinatorInfo, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_livePairedAccessoryServers, 0);
  objc_storeStrong((id *)&self->_liveUnpairedAccessoryServers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_browserOperationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __70__HAP2AccessoryServerBrowser_handleCurrentNetworkChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleNetworkChanged");
}

void __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__8600;
  v26 = __Block_byref_object_dispose__8601;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8600;
  v20 = __Block_byref_object_dispose__8601;
  v21 = 0;
  objc_msgSend(WeakRetained, "propertyLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke_2;
  v11 = &unk_1E894B250;
  v14 = &v22;
  v12 = WeakRetained;
  v5 = v3;
  v13 = v5;
  v15 = &v16;
  objc_msgSend(v4, "performWritingBlock:", &v8);

  objc_msgSend(WeakRetained, "delegate", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v23[5] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "accessoryServerBrowser:didLoseUnpairedAccessoryServer:error:", WeakRetained, v23[5], *(_QWORD *)(a1 + 40));
    }
    else
    {
      v7 = (void *)v17[5];
      if (v7)
        objc_msgSend(v7, "handleLostDiscoveryAdvertisementWithWillSleep:", objc_msgSend(WeakRetained, "powerState") == 1);
    }
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

}

void __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "liveUnpairedAccessoryServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAccessoryServerFromArray:withDeviceID:", v3, *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "_lookupPairedAccessoryServerWithDeviceID:", *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "isDiscovering"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v12 = 0;
    v13 = 0;
    objc_msgSend(WeakRetained, "_updateArraysForDiscoveredAccessoryServer:paired:lost:existing:", v3, 1, &v13, &v12);
    v4 = v13;
    v5 = v12;
    v6 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v4, "becomePairedWithAccessoryServer:", v6);
      v6 = v4;
    }
    v7 = v6;
    objc_msgSend(WeakRetained, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v5)
    {
      objc_msgSend(v5, "mergeWithNewlyDiscoveredPairedAccessoryServer:", *(_QWORD *)(a1 + 40));
    }
    else if (v8)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke_2;
      v10[3] = &unk_1E894E0F8;
      v10[4] = WeakRetained;
      v11 = v7;
      objc_msgSend(v9, "accessoryServerBrowser:didDiscoverPairedAccessoryServer:withCompletion:", WeakRetained, v11, v10);

    }
  }

}

uint64_t __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isConfirming");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "startConfirming");
  return result;
}

void __75__HAP2AccessoryServerBrowser_coordinator_didCreateUnpairedAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "isDiscovering"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    v11 = 0;
    objc_msgSend(WeakRetained, "_updateArraysForDiscoveredAccessoryServer:paired:lost:existing:", v3, 0, &v11, &v10);
    v4 = v11;
    v5 = v10;
    v6 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v4, "becomeUnpairedWithAccessoryServer:", v6);
      v6 = v4;
    }
    v7 = v6;
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      objc_msgSend(v5, "mergeWithNewlyDiscoveredUnpairedAccessoryServer:", *(_QWORD *)(a1 + 40));
    }
    else if (v8)
    {
      objc_msgSend(v8, "accessoryServerBrowser:didDiscoverUnpairedAccessoryServer:withCompletion:", WeakRetained, v7, 0);
    }

  }
}

void __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, uint64_t, _BYTE *);
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(WeakRetained, "coordinatorInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke_2;
  v7 = &unk_1E894B318;
  v8 = a1[4];
  v9 = a1[5];
  v10 = WeakRetained;
  v11 = &v12;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v4);

  if (*((_BYTE *)v13 + 24))
    objc_msgSend(WeakRetained, "_finishStopDiscovering", v4, v5, v6, v7, v8);

  _Block_object_dispose(&v12, 8);
}

void __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v14, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  v8 = v14;
  if ((_DWORD)v6)
  {
    *a4 = 1;
    objc_msgSend(v14, "setError:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "currentOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "type") == 2)
    {
      objc_msgSend(v10, "pendingCoordinators");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 32));

      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v10, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(v10, "setError:", *(_QWORD *)(a1 + 40));
      }
      objc_msgSend(v10, "pendingCoordinators");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v13, "count") == 0;

    }
    v8 = v14;
  }

}

void __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, uint64_t, _BYTE *);
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(WeakRetained, "coordinatorInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke_2;
  v7 = &unk_1E894B318;
  v8 = a1[4];
  v9 = a1[5];
  v10 = WeakRetained;
  v11 = &v12;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v4);

  if (*((_BYTE *)v13 + 24))
    objc_msgSend(WeakRetained, "_finishStartDiscovering", v4, v5, v6, v7, v8);

  _Block_object_dispose(&v12, 8);
}

void __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v14, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  v8 = v14;
  if ((_DWORD)v6)
  {
    *a4 = 1;
    objc_msgSend(v14, "setError:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "currentOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "type") == 1)
    {
      objc_msgSend(v10, "pendingCoordinators");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 32));

      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v10, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(v10, "setError:", *(_QWORD *)(a1 + 40));
      }
      objc_msgSend(v10, "pendingCoordinators");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v13, "count") == 0;

    }
    v8 = v14;
  }

}

void __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "liveUnpairedAccessoryServers");
  else
    objc_msgSend(v3, "livePairedAccessoryServers");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(v4, "livePairedAccessoryServers");
  else
    objc_msgSend(v4, "liveUnpairedAccessoryServers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_removeAccessoryServerFromArray:withDeviceID:", v14, *(_QWORD *)(a1 + 40), v14);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke_2;
  v16[3] = &unk_1E894B2C8;
  v17 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v5, "indexOfObjectPassingTest:", v16);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v10)
      v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "addObject:", v10);
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

uint64_t __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToDeviceID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __75__HAP2AccessoryServerBrowser__removeAccessoryServerFromArray_withDeviceID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToDeviceID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __71__HAP2AccessoryServerBrowser__lookupPairedAccessoryServerWithDeviceID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToDeviceID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "liveUnpairedAccessoryServers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "livePairedAccessoryServers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

void __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setError:", 0);
  objc_msgSend(v6, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isDiscovering"))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingCoordinators");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

    objc_msgSend(v6, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopDiscovering");

  }
}

void __47__HAP2AccessoryServerBrowser__startDiscovering__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setError:", 0);
  objc_msgSend(v6, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDiscovering") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingCoordinators");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

    objc_msgSend(v6, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDiscovering");

  }
}

void __46__HAP2AccessoryServerBrowser__finishOperation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_beginOperation");

}

void __48__HAP2AccessoryServerBrowser__enqueueOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "browserOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "browserOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
    objc_msgSend(WeakRetained, "_beginOperation");

}

void __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *);
  void *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isDiscovering"))
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__8600;
    v26 = __Block_byref_object_dispose__8601;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__8600;
    v20 = __Block_byref_object_dispose__8601;
    v21 = 0;
    objc_msgSend(WeakRetained, "propertyLock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke_2;
    v11 = &unk_1E894B250;
    v14 = &v22;
    v12 = WeakRetained;
    v5 = v3;
    v13 = v5;
    v15 = &v16;
    objc_msgSend(v4, "performWritingBlock:", &v8);

    objc_msgSend(WeakRetained, "delegate", v8, v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23[5] && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "accessoryServerBrowser:didLoseUnpairedAccessoryServer:error:", WeakRetained, v23[5], v7);
      if (v17[5] && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "accessoryServerBrowser:didLosePairedAccessoryServer:error:", WeakRetained, v17[5], v7);

    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }

}

void __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "liveUnpairedAccessoryServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAccessoryServerFromArray:withDeviceID:", v3, a1[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)a1[4];
  objc_msgSend(v7, "livePairedAccessoryServers");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_removeAccessoryServerFromArray:withDeviceID:", v11, a1[5]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __56__HAP2AccessoryServerBrowser_operationQueueForDeviceID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAP2SerializedOperationQueue *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "weakOperationQueuesByDeviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "deviceIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("operationQueue.%@"), v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", HAPDispatchQueueName(*(void **)(a1 + 32), v15));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [HAP2SerializedOperationQueue alloc];
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HAP2SerializedOperationQueue initWithName:operationQueue:](v9, "initWithName:operationQueue:", v8, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(a1 + 32), "weakOperationQueuesByDeviceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

  }
}

void __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, void *);
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke_2;
    v8[3] = &unk_1E894B228;
    v9 = a1[4];
    v10 = a1[5];
    objc_msgSend(v4, "removeKeysForIdentifiers:completion:", v5, v8);

  }
  else
  {
    v6 = (void (**)(id, void *))a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
}

void __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 32);
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke_2;
    v9[3] = &unk_1E894B228;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v4, "saveKeysForIdentifiers:completion:", v6, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __81__HAP2AccessoryServerBrowser_retrieveLocalPairingIdentityForDeviceID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (HAPIsHH2Enabled_onceToken != -1)
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
    if (HAPIsHH2Enabled_hh2Enabled == 1)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(WeakRetained, "pairedAccessoryServers", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v17 != v6)
              objc_enumerationMutation(v3);
            v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v8, "deviceID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
            {
              objc_msgSend(v8, "delegate");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "currentIdentity");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11)
              {
                v13 = *(_QWORD *)(a1 + 40);
                objc_msgSend(v8, "delegate");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "currentIdentity");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v15, 0);

                goto LABEL_19;
              }
            }
            else
            {

            }
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v5);
      }

    }
    objc_msgSend(WeakRetained, "storage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchControllerKeyForDeviceId:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v3);
  }
LABEL_19:

}

void __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke_2;
    v8[3] = &unk_1E894CC70;
    v9 = a1[4];
    v10 = a1[5];
    objc_msgSend(v4, "hasKeysForIdentifiers:completion:", v5, v8);

  }
  else
  {
    v6 = (void (**)(id, _QWORD, void *))a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
}

uint64_t __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__HAP2AccessoryServerBrowser_stopConfirmingPairedAccessoryReachability__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setConfirming:", 0);
    objc_msgSend(v3, "pairedAccessoryServers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_83);

    WeakRetained = v3;
  }

}

uint64_t __71__HAP2AccessoryServerBrowser_stopConfirmingPairedAccessoryReachability__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopConfirming");
}

uint64_t __72__HAP2AccessoryServerBrowser_startConfirmingPairedAccessoryReachability__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startConfirming");
}

void __54__HAP2AccessoryServerBrowser_unpairedAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "liveUnpairedAccessoryServers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __42__HAP2AccessoryServerBrowser_isConfirming__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

uint64_t __45__HAP2AccessoryServerBrowser_setDiscovering___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __43__HAP2AccessoryServerBrowser_isDiscovering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

id __42__HAP2AccessoryServerBrowser_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __38__HAP2AccessoryServerBrowser_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __59__HAP2AccessoryServerBrowser_initWithCoordinators_storage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  HAP2AccessoryServerBrowserCoordinatorInfo *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA2E180))
    v3 = v8;
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v6, "setBrowser:operationQueue:", v4, v5);
  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  v7 = -[HAP2AccessoryServerBrowserCoordinatorInfo initWithCoordinator:]([HAP2AccessoryServerBrowserCoordinatorInfo alloc], "initWithCoordinator:", v6);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
