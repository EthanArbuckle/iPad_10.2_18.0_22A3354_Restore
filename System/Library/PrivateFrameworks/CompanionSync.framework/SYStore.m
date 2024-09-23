@implementation SYStore

- (SYStore)init
{
  SYStore *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_super v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)SYStore;
    self = -[SYStore init](&v9, sel_init);
    v3 = self;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    v5 = *MEMORY[0x24BDBCAB0];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("-[%@ init] is not supported."), v7);

    v3 = 0;
  }

  return v3;
}

- (SYStore)initWithService:(id)a3
{
  return -[SYStore initWithService:isGStore:highPriority:](self, "initWithService:isGStore:highPriority:", a3, 0, 0);
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  SYStore *v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)MGCopyAnswer();
  v10 = -[SYStore initWithService:isGStore:highPriority:isMasterStore:](self, "initWithService:isGStore:highPriority:isMasterStore:", v8, v6, v5, objc_msgSend(v9, "intValue") != 6);

  return v10;
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6
{
  return -[SYStore initWithService:isGStore:priority:isMasterStore:](self, "initWithService:isGStore:priority:isMasterStore:", a3, a4, a5, a6);
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6
{
  return -[SYStore initWithService:isGStore:priority:isMasterStore:tracksChanges:](self, "initWithService:isGStore:priority:isMasterStore:tracksChanges:", a3, a4, a5, a6, 1);
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  return -[SYStore initWithService:isGStore:priority:isMasterStore:tracksChanges:](self, "initWithService:isGStore:priority:isMasterStore:tracksChanges:", a3, a4, a5, a6, a7);
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  SYLegacyStore *v13;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v12 = a3;
  v13 = -[SYLegacyStore initWithService:isGStore:priority:isMasterStore:tracksChanges:]([SYLegacyStore alloc], "initWithService:isGStore:priority:isMasterStore:tracksChanges:", v12, v10, a5, v8, v7);

  return &v13->super;
}

- (SYStore)initWithServiceName:(id)a3 priority:(int64_t)a4 isMasterStore:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  SYService *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  SYAtomicFIFO *v20;
  void *v21;
  SYStore *v22;
  objc_super v24;

  v5 = a5;
  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SYStore;
  v9 = -[SYStore init](&v24, sel_init);
  if (!v9)
    goto LABEL_9;
  v10 = -20;
  if (a4 == 1)
    v10 = 0;
  v11 = a4 == 2 ? 20 : v10;
  v12 = -[SYService initWithService:priority:asMasterStore:options:]([SYService alloc], "initWithService:priority:asMasterStore:options:", v8, v11, v5, 0);
  v13 = (void *)*((_QWORD *)v9 + 6);
  *((_QWORD *)v9 + 6) = v12;

  if (*((_QWORD *)v9 + 6))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_DEFAULT, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("companionsync_serial_qos", v15);
    v17 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v16;

    v18 = dispatch_queue_create("companionsync_serial", 0);
    v19 = (void *)*((_QWORD *)v9 + 9);
    *((_QWORD *)v9 + 9) = v18;

    dispatch_set_target_queue(*((dispatch_object_t *)v9 + 9), *((dispatch_queue_t *)v9 + 1));
    objc_msgSend(*((id *)v9 + 6), "setDelegate:queue:", v9, *((_QWORD *)v9 + 9));
    v20 = -[SYAtomicFIFO initWithCapacity:]([SYAtomicFIFO alloc], "initWithCapacity:", 10);
    v21 = (void *)*((_QWORD *)v9 + 10);
    *((_QWORD *)v9 + 10) = v20;

    *((_BYTE *)v9 + 20) = 1;
    v22 = (SYStore *)v9;
  }
  else
  {
LABEL_9:
    v22 = 0;
  }

  return v22;
}

- (id)dataFromChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "wrappedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYStore encodeSYObject:](self, "encodeSYObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "changeData");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "conformsToProtocol:", &unk_254AC6188))
      {
        v6 = 0;
        goto LABEL_9;
      }
      -[SYStore encodeSYObject:](self, "encodeSYObject:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v7;
  }
LABEL_9:

  return v6;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  void *v5;
  SYObjectWrapper *v6;

  -[SYStore decodeSYObject:](self, "decodeSYObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[SYObjectWrapper initWithSYObject:type:]([SYObjectWrapper alloc], "initWithSYObject:type:", v5, a4);
  else
    v6 = 0;

  return v6;
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return -[SYStore changeFromData:ofType:](self, "changeFromData:ofType:", a3, a5);
}

- (void)setDelegate:(id)a3
{
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  id v19;

  v19 = a3;
  objc_storeWeak((id *)&self->_delegate, v19);
  if (v19)
  {
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 16;
    else
      v7 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 32;
    else
      v8 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 64;
    else
      v9 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 128;
    else
      v10 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 256;
    else
      v11 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 512;
    else
      v12 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 1024;
    else
      v13 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 2048;
    else
      v14 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 4096;
    else
      v15 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 0x2000;
    else
      v16 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xDFFF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 0x4000;
    else
      v17 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xBFFF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 0x8000;
    else
      v18 = 0;
    *(_WORD *)&self->_flags = v18 & 0x8000 | *(_WORD *)&self->_flags & 0x7FFF;
  }

}

- (BOOL)resume:(id *)a3
{
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
    return -[SYService resume:](self->_syService, "resume:", a3);
  if (a3)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = CFSTR("SYStore must be given a delegate object before it can be resumed.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = (id)objc_msgSend(v7, "initWithSYError:userInfo:", 2001, v8);

  }
  return 0;
}

- (int64_t)priority
{
  void *syService;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[SYService currentSession](self->_syService, "currentSession");
  syService = (void *)objc_claimAutoreleasedReturnValue();
  v4 = syService;
  if (!syService)
    syService = self->_syService;
  v5 = objc_msgSend(syService, "priority");
  if (v5 == 20)
    v6 = 2;
  else
    v6 = v5 == 0;

  return v6;
}

- (void)setPriority:(int64_t)a3
{
  void *syService;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[SYService currentSession](self->_syService, "currentSession");
  syService = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -20;
  if (a3 == 1)
    v6 = 0;
  if (a3 == 2)
    v7 = 20;
  else
    v7 = v6;
  v8 = syService;
  if (!syService)
    syService = self->_syService;
  objc_msgSend(syService, "setPriority:", v7);

}

- (double)timeToLive
{
  double result;

  -[SYService defaultMessageTimeout](self->_syService, "defaultMessageTimeout");
  return result;
}

- (void)setTimeToLive:(double)a3
{
  -[SYService setDefaultMessageTimeout:](self->_syService, "setDefaultMessageTimeout:", a3);
}

- (NSDictionary)customIDSDeliveryOptions
{
  return -[SYService customIDSOptions](self->_syService, "customIDSOptions");
}

- (void)setCustomIDSDeliveryOptions:(id)a3
{
  -[SYService setCustomIDSOptions:](self->_syService, "setCustomIDSOptions:", a3);
}

- (BOOL)isPaired
{
  return -[SYService hasPairingStore](self->_syService, "hasPairingStore");
}

- (unsigned)deliveryQOS
{
  return dispatch_queue_get_qos_class((dispatch_queue_t)self->_qosTargetQueue, 0);
}

- (void)setDeliveryQOS:(unsigned int)a3
{
  NSObject *delegateQueue;
  _QWORD v6[5];
  unsigned int v7;

  if (-[SYStore deliveryQOS](self, "deliveryQOS") != a3)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __26__SYStore_setDeliveryQOS___block_invoke;
    v6[3] = &unk_24CC654E8;
    v6[4] = self;
    v7 = a3;
    dispatch_async(delegateQueue, v6);
  }
}

void __26__SYStore_setDeliveryQOS___block_invoke(uint64_t a1)
{
  const char *label;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  label = dispatch_queue_get_label(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, *(dispatch_qos_class_t *)(a1 + 40), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(label, v4);

  dispatch_set_target_queue(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72), v5);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

}

- (int64_t)state
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SYService name](self->_syService, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "inFullSync"))
  {
    if (objc_msgSend(v3, "currentSyncSendComplete"))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCompletedFullSync
{
  void *v2;
  void *v3;
  char v4;

  -[SYService name](self->_syService, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "completedSync");

  return v4;
}

- (void)_signalNextQueuedSession
{
  SYStoreSessionOwner *sessionOwner;
  void *v4;
  id v5;

  sessionOwner = self->_sessionOwner;
  self->_sessionOwner = 0;

  -[SYAtomicFIFO head](self->_sessionQueue, "head");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SYService setHasChangesAvailable](self->_syService, "setHasChangesAvailable");
    v4 = v5;
  }

}

- (void)_enqueueDeltaSessionWithChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  SYStoreDeltaSessionOwner *v16;
  dispatch_semaphore_t v17;
  NSObject *v18;
  id v19;
  double v20;
  dispatch_time_t v21;
  void *v22;
  void *v23;
  void *v24;
  void (**WeakRetained)(_QWORD, _QWORD);
  uint64_t v26;
  SYStore *v27;
  void *v28;
  void (**v29)(void);
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  id location;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = -[SYStoreDeltaSessionOwner initWithChanges:]([SYStoreDeltaSessionOwner alloc], "initWithChanges:", v12);
  -[SYStoreSessionOwner setContext:](v16, "setContext:", v13);
  -[SYStoreSessionOwner setIdsOptions:](v16, "setIdsOptions:", v14);
  -[SYStoreSessionOwner setErrorCallback:](v16, "setErrorCallback:", v15);
  -[SYStoreSessionOwner setStore:](v16, "setStore:", self);
  if (v8)
    v17 = dispatch_semaphore_create(0);
  else
    v17 = 0;
  objc_initWeak(&location, self);
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke;
  v33 = &unk_24CC65538;
  v18 = v17;
  v34 = v18;
  objc_copyWeak(&v36, &location);
  v19 = v13;
  v35 = v19;
  -[SYStoreSessionOwner setOnComplete:](v16, "setOnComplete:", &v30);
  -[SYAtomicFIFO enqueue:](self->_sessionQueue, "enqueue:", v16, v30, v31, v32, v33);
  -[SYService setHasChangesAvailable](self->_syService, "setHasChangesAvailable");
  if (v8)
  {
    -[SYStore timeToLive](self, "timeToLive");
    v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
    if (dispatch_semaphore_wait(v18, v21))
    {
      -[SYStoreSessionOwner session](v16, "session");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cancel");

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2007, 0);
      -[SYStoreSessionOwner errorCallback](v16, "errorCallback");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[SYStoreSessionOwner errorCallback](v16, "errorCallback");
        WeakRetained = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))WeakRetained)[2](WeakRetained, v23);
      }
      else
      {
        if ((*(_WORD *)&self->_flags & 0x400) == 0)
        {
LABEL_11:
          -[SYStoreSessionOwner onComplete](v16, "onComplete");
          v29 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v29[2]();

          goto LABEL_12;
        }
        WeakRetained = (void (**)(_QWORD, _QWORD))objc_loadWeakRetained((id *)&self->_delegate);
        -[SYStoreSessionOwner context](v16, "context");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = self;
        v28 = (void *)v26;
        objc_msgSend(WeakRetained, "syncStore:encounteredError:context:", v27, v23, v26);

      }
      goto LABEL_11;
    }
  }
LABEL_12:

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unsigned __int16 *WeakRetained;
  _QWORD *v4;
  unsigned int v5;
  int v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD *v16;
  id v17;
  char v18;
  char v19;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_semaphore_signal(v2);
  WeakRetained = (unsigned __int16 *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[8];
    if ((v5 & 0x6000) != 0)
    {
      v6 = (v5 >> 14) & 1;
      v7 = (v5 >> 13) & 1;
      v8 = objc_loadWeakRetained((id *)WeakRetained + 3);
      v9 = v4[9];
      v11 = MEMORY[0x24BDAC760];
      v12 = 3221225472;
      v13 = __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke_2;
      v14 = &unk_24CC65510;
      v18 = v7;
      v15 = v8;
      v16 = v4;
      v17 = *(id *)(a1 + 40);
      v19 = v6;
      v10 = v8;
      dispatch_async(v9, &v11);

    }
    objc_msgSend(v4, "_signalNextQueuedSession", v11, v12, v13, v14);
  }

}

uint64_t __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 56))
    result = objc_msgSend(*(id *)(result + 32), "syncStore:sentMessageWithContext:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  if (*(_BYTE *)(v1 + 57))
    return objc_msgSend(*(id *)(v1 + 32), "syncStore:peerFinishedProcessingMessageWithContext:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
  return result;
}

- (BOOL)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  os_activity_scope_state_s v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = _os_activity_create(&dword_211704000, "CompanionSync AddObject", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v12, &v16);
  +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v9, 0, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYStore _enqueueDeltaSessionWithChanges:contextInfo:idsOptions:blockUntilSent:reportError:](self, "_enqueueDeltaSessionWithChanges:contextInfo:idsOptions:blockUntilSent:reportError:", v14, v10, v11, 0, 0);

  os_activity_scope_leave(&v16);
  return 1;
}

- (void)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5
{
  -[SYStore addObject:context:idsOptions:error:](self, "addObject:context:idsOptions:error:", a3, a4, a5, 0);
}

- (BOOL)addObject:(id)a3 error:(id *)a4
{
  return -[SYStore addObject:context:idsOptions:error:](self, "addObject:context:idsOptions:error:", a3, 0, 0, a4);
}

- (void)addObject:(id)a3
{
  -[SYStore addObject:context:idsOptions:](self, "addObject:context:idsOptions:", a3, 0, 0);
}

- (void)addObject:(id)a3 completion:(id)a4
{
  -[SYStore addObject:context:idsOptions:](self, "addObject:context:idsOptions:", a3, 0, 0);
}

- (void)addObject:(id)a3 context:(id)a4
{
  -[SYStore addObject:context:idsOptions:](self, "addObject:context:idsOptions:", a3, a4, 0);
}

- (BOOL)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  os_activity_scope_state_s v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = _os_activity_create(&dword_211704000, "CompanionSync UpdateObject", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v12, &v16);
  +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v9, 1, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYStore _enqueueDeltaSessionWithChanges:contextInfo:idsOptions:blockUntilSent:reportError:](self, "_enqueueDeltaSessionWithChanges:contextInfo:idsOptions:blockUntilSent:reportError:", v14, v10, v11, 0, 0);

  os_activity_scope_leave(&v16);
  return 1;
}

- (void)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5
{
  -[SYStore updateObject:context:idsOptions:error:](self, "updateObject:context:idsOptions:error:", a3, a4, a5, 0);
}

- (void)updateObject:(id)a3
{
  -[SYStore updateObject:context:idsOptions:](self, "updateObject:context:idsOptions:", a3, 0, 0);
}

- (BOOL)updateObject:(id)a3 error:(id *)a4
{
  return -[SYStore updateObject:context:idsOptions:error:](self, "updateObject:context:idsOptions:error:", a3, 0, 0, a4);
}

- (void)updateObject:(id)a3 completion:(id)a4
{
  -[SYStore updateObject:context:idsOptions:](self, "updateObject:context:idsOptions:", a3, 0, 0);
}

- (void)updateObject:(id)a3 context:(id)a4
{
  -[SYStore updateObject:context:idsOptions:](self, "updateObject:context:idsOptions:", a3, a4, 0);
}

- (BOOL)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *delegateQueue;
  os_activity_scope_state_s state;
  _QWORD block[5];
  NSObject *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[SYStore allowsDeletes](self, "allowsDeletes");
  if (v13)
  {
    v14 = _os_activity_create(&dword_211704000, "CompanionSync DeleteObject", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);
    +[SYChange changeWithObject:updateType:store:](SYChange, "changeWithObject:updateType:store:", v10, 2, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYStore _enqueueDeltaSessionWithChanges:contextInfo:idsOptions:blockUntilSent:reportError:](self, "_enqueueDeltaSessionWithChanges:contextInfo:idsOptions:blockUntilSent:reportError:", v16, v11, v12, 0, 0);

    os_activity_scope_leave(&state);
  }
  else
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1006, 0);
    v14 = v17;
    if (a6)
    {
      v14 = objc_retainAutorelease(v17);
      *a6 = v14;
    }
    else if ((*(_WORD *)&self->_flags & 0x400) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49__SYStore_deleteObject_context_idsOptions_error___block_invoke;
      block[3] = &unk_24CC65560;
      block[4] = self;
      v14 = v17;
      v22 = v14;
      v23 = v11;
      dispatch_async(delegateQueue, block);

    }
  }

  return v13;
}

void __49__SYStore_deleteObject_context_idsOptions_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncStore:encounteredError:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5
{
  -[SYStore deleteObject:context:idsOptions:error:](self, "deleteObject:context:idsOptions:error:", a3, a4, a5, 0);
}

- (void)deleteObject:(id)a3
{
  -[SYStore deleteObject:context:idsOptions:](self, "deleteObject:context:idsOptions:", a3, 0, 0);
}

- (BOOL)deleteObject:(id)a3 error:(id *)a4
{
  return -[SYStore deleteObject:context:idsOptions:error:](self, "deleteObject:context:idsOptions:error:", a3, 0, 0, a4);
}

- (void)deleteObject:(id)a3 completion:(id)a4
{
  -[SYStore deleteObject:context:idsOptions:](self, "deleteObject:context:idsOptions:", a3, 0, 0);
}

- (void)deleteObject:(id)a3 context:(id)a4
{
  -[SYStore deleteObject:context:idsOptions:](self, "deleteObject:context:idsOptions:", a3, a4, 0);
}

- (void)transaction:(id)a3
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, 0, 0, 0, 0);
}

- (void)transaction:(id)a3 handlingError:(id)a4
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, 0, 0, 0, a4);
}

- (void)transaction:(id)a3 completion:(id)a4
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, 0, 0, 0, 0);
}

- (void)transaction:(id)a3 context:(id)a4
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, a4, 0, 0, 0);
}

- (void)transaction:(id)a3 context:(id)a4 idsOptions:(id)a5
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, a4, a5, 0, 0);
}

- (void)blockingTransaction:(id)a3
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, 0, 0, 1, 0);
}

- (void)blockingTransaction:(id)a3 handlingError:(id)a4
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, 0, 0, 1, a4);
}

- (void)transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6
{
  -[SYStore _transaction:context:idsOptions:blockUntilSent:reportError:](self, "_transaction:context:idsOptions:blockUntilSent:reportError:", a3, a4, a5, a6, 0);
}

- (void)_transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD activity_block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[SYService name](self->_syService, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "completedSync") & 1) != 0)
  {
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __70__SYStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke;
    activity_block[3] = &unk_24CC65588;
    activity_block[4] = self;
    v22 = v18;
    v20 = v12;
    v21 = v13;
    v24 = a6;
    v23 = v14;
    _os_activity_initiate(&dword_211704000, "CompanionSync Transaction", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else if (v14)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 1005, 0);
    (*((void (**)(id, void *))v14 + 2))(v14, v17);

  }
}

void __70__SYStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke(uint64_t a1)
{
  void *v2;
  SYTransaction *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x212BE0D64]();
  v3 = -[SYTransaction initWithStore:]([SYTransaction alloc], "initWithStore:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = *(void **)(a1 + 32);
  -[SYTransaction changeList](v3, "changeList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_enqueueDeltaSessionWithChanges:contextInfo:idsOptions:blockUntilSent:reportError:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

  objc_autoreleasePoolPop(v2);
}

- (void)setNeedsFullSync
{
  -[SYStore setNeedsFullSyncWithContext:idsOptions:](self, "setNeedsFullSyncWithContext:idsOptions:", 0, 0);
}

- (void)setNeedsFullSyncWithContext:(id)a3 idsOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SYStoreResetSessionOwner *pendingResetSessionOwner;
  SYStoreResetSessionOwner *v10;
  SYStoreResetSessionOwner *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  if (-[SYStoreSessionOwner isResetSync](self->_sessionOwner, "isResetSync"))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "SYStore skipping full sync, already in progress.", v14, 2u);
    }
  }
  else
  {
    pendingResetSessionOwner = self->_pendingResetSessionOwner;
    if (!pendingResetSessionOwner)
    {
      v10 = (SYStoreResetSessionOwner *)objc_opt_new();
      v11 = self->_pendingResetSessionOwner;
      self->_pendingResetSessionOwner = v10;

      pendingResetSessionOwner = self->_pendingResetSessionOwner;
    }
    -[SYStoreSessionOwner setContext:](pendingResetSessionOwner, "setContext:", v6);
    -[SYStoreSessionOwner setIdsOptions:](self->_pendingResetSessionOwner, "setIdsOptions:", v7);
    -[SYService name](self->_syService, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setCompletedSync:", 0);
    objc_msgSend(v13, "setFullSyncUserInfo:", v6);
    objc_msgSend(v13, "setFullSyncIDSOptions:", v7);
    -[SYService setNeedsResetSync](self->_syService, "setNeedsResetSync");

  }
}

- (id)decodeSYObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;

  v4 = a3;
  -[SYStore serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_exception_throw((id)objc_msgSend(v9, "initWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("SYStore does not have a serializer. You must set it."), 0));
  }
  -[SYStore serializer](self, "serializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SYObjectWithData:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)encodeSYObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SYStore serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SYStore serializer](self, "serializer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithSYObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v4, "conformsToProtocol:", &unk_254AC37C0))
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_startIncomingSession:(id)a3
{
  id v4;
  SYStoreIncomingSessionOwner *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  char v11;
  SYStoreSessionOwner *sessionOwner;
  SYStoreIncomingSessionOwner *v13;
  _QWORD v14[5];
  id v15;
  char v16;
  id location;

  v4 = a3;
  v5 = -[SYStoreIncomingSessionOwner initWithIncomingSession:]([SYStoreIncomingSessionOwner alloc], "initWithIncomingSession:", v4);
  objc_msgSend(v4, "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYStoreSessionOwner setContext:](v5, "setContext:", v6);

  objc_msgSend(v4, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYStoreSessionOwner setIdsOptions:](v5, "setIdsOptions:", v7);

  -[SYStoreSessionOwner setStore:](v5, "setStore:", self);
  objc_msgSend(v4, "setDelegate:", v5);
  objc_msgSend(v4, "setTargetQueue:", self->_delegateQueue);
  objc_msgSend(v4, "setSerializer:", self);
  -[SYStoreSessionOwner idsOptions](v5, "idsOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v8);

  -[SYStoreSessionOwner context](v5, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserContext:", v9);

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syncStoreWillUpdate:", self);

  }
  v11 = objc_msgSend(v4, "isResetSync");
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __33__SYStore__startIncomingSession___block_invoke;
  v14[3] = &unk_24CC655B0;
  objc_copyWeak(&v15, &location);
  v16 = v11;
  v14[4] = self;
  -[SYStoreSessionOwner setOnComplete:](v5, "setOnComplete:", v14);
  sessionOwner = self->_sessionOwner;
  self->_sessionOwner = &v5->super;
  v13 = v5;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __33__SYStore__startIncomingSession___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v4 = objc_loadWeakRetained(WeakRetained + 3);
    v5 = v7;
    v6 = v4;
    if (((_WORD)v7[2] & 4) != 0)
    {
      objc_msgSend(v4, "syncStoreDidUpdate:", v7);
      v5 = v7;
    }
    if (*(_BYTE *)(a1 + 48) && (*(_WORD *)(*(_QWORD *)(a1 + 32) + 16) & 8) != 0)
    {
      objc_msgSend(v6, "syncStoreDidCompleteFullSync:", v7);
      v5 = v7;
    }
    objc_msgSend(v5, "_signalNextQueuedSession");

    v3 = v7;
  }

}

- (BOOL)_startResetSyncSession:(id)a3 error:(id *)a4
{
  id v6;
  SYStoreResetSessionOwner *v7;
  __int16 flags;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[5];

  v6 = a3;
  v7 = self->_pendingResetSessionOwner;
  if (!v7)
    v7 = (SYStoreResetSessionOwner *)objc_opt_new();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "beginSyncingAllObjectsForStore:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_8:
      -[SYStoreResetSessionOwner setFetchNextBatch:](v7, "setFetchNextBatch:", v10);
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __40__SYStore__startResetSyncSession_error___block_invoke_2;
      v15[3] = &unk_24CC655F8;
      objc_copyWeak(&v16, &location);
      -[SYStoreSessionOwner setOnComplete:](v7, "setOnComplete:", v15);
      -[SYStoreSessionOwner setStore:](v7, "setStore:", self);
      objc_storeStrong((id *)&self->_sessionOwner, v7);
      objc_msgSend(v6, "setDelegate:", v7);
      objc_msgSend(v6, "setTargetQueue:", self->_delegateQueue);
      objc_msgSend(v6, "setSerializer:", self);
      -[SYStoreSessionOwner idsOptions](v7, "idsOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOptions:", v11);

      -[SYStoreSessionOwner context](v7, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUserContext:", v12);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

      v13 = 1;
      goto LABEL_11;
    }
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __40__SYStore__startResetSyncSession_error___block_invoke;
    v18[3] = &__block_descriptor_40_e28_q24__0__NSMutableArray_8__16lu32l8;
    v18[4] = self;
    v10 = (void *)MEMORY[0x212BE0F2C](v18);
    if (v10)
      goto LABEL_8;
  }
  v13 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
LABEL_11:

  return v13;
}

uint64_t __40__SYStore__startResetSyncSession_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncStoreAllObjects:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  return 1;
}

void __40__SYStore__startResetSyncSession_error___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (((_WORD)WeakRetained[2] & 8) != 0)
    {
      v2 = objc_loadWeakRetained(WeakRetained + 3);
      objc_msgSend(v2, "syncStoreDidCompleteFullSync:", v3);

    }
    objc_msgSend(v3, "_signalNextQueuedSession");
    WeakRetained = v3;
  }

}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7;
  int v8;
  SYAtomicFIFO *sessionQueue;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  if ((objc_msgSend(v7, "isSending") & 1) != 0)
  {
    v8 = objc_msgSend(v7, "isResetSync");
    sessionQueue = self->_sessionQueue;
    if (v8)
    {
      -[SYAtomicFIFO removeAllObjects](sessionQueue, "removeAllObjects");
      v10 = -[SYStore _startResetSyncSession:error:](self, "_startResetSyncSession:error:", v7, a5);
    }
    else
    {
      -[SYAtomicFIFO dequeue](sessionQueue, "dequeue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v11 != 0;
      if (v11)
      {
        objc_msgSend(v7, "setCanRestart:", 0);
        objc_msgSend(v7, "setCanRollback:", 0);
        objc_msgSend(v7, "setDelegate:", v11);
        objc_msgSend(v7, "setTargetQueue:", self->_delegateQueue);
        objc_msgSend(v7, "setSerializer:", self);
        objc_msgSend(v11, "idsOptions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setOptions:", v12);

        objc_msgSend(v11, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setUserContext:", v13);

        objc_msgSend(v11, "setSession:", v7);
        objc_msgSend(v11, "setStore:", self);
        objc_storeStrong((id *)&self->_sessionOwner, v11);
      }
      else if (a5)
      {
        *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2009, 0);
      }

    }
  }
  else
  {
    -[SYStore _startIncomingSession:](self, "_startIncomingSession:", v7);
    v10 = 1;
  }

  return v10;
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id WeakRetained;

  objc_msgSend(a3, "suspend");
  if (!a5 && (*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syncStoreDidUnpair:", self);

  }
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v20 = 0;
    v11 = objc_msgSend(v8, "resume:", &v20);
    v12 = v20;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
LABEL_3:
      if (!v9 && (*(_WORD *)&self->_flags & 0x800) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "syncStoreDidSetupAfterPairing:", self);

      }
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v12, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("SYErrorDomain")))
    {
      v16 = objc_msgSend(v13, "code");

      if (v16 == 2002)
        goto LABEL_3;
    }
    else
    {

    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v17 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      _SYObfuscate(v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v19;
      _os_log_error_impl(&dword_211704000, v18, OS_LOG_TYPE_ERROR, "Failed to resume SYService after switching from device %{public}@ to %{public}@: %{public}@", buf, 0x20u);

    }
    goto LABEL_14;
  }
LABEL_15:

}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  SYStoreDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    p_delegate = &self->_delegate;
    v8 = a5;
    v9 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "syncStore:encounteredError:context:", self, v9, v8);

  }
}

- (SYStoreDelegate)delegate
{
  return (SYStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SYSerialization)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (int64_t)maxBytesInFlight
{
  return self->_maxBytesInFlight;
}

- (void)setMaxBytesInFlight:(int64_t)a3
{
  self->_maxBytesInFlight = a3;
}

- (BOOL)allowsDeletes
{
  return self->_allowsDeletes;
}

- (void)setAllowsDeletes:(BOOL)a3
{
  self->_allowsDeletes = a3;
}

- (SYService)syService
{
  return self->_syService;
}

- (SYStoreSessionOwner)sessionOwner
{
  return self->_sessionOwner;
}

- (void)setSessionOwner:(id)a3
{
  objc_storeStrong((id *)&self->_sessionOwner, a3);
}

- (SYStoreResetSessionOwner)pendingResetSessionOwner
{
  return self->_pendingResetSessionOwner;
}

- (void)setPendingResetSessionOwner:(id)a3
{
  objc_storeStrong((id *)&self->_pendingResetSessionOwner, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (SYAtomicFIFO)sessionQueue
{
  return self->_sessionQueue;
}

- (SYPersistentStore)persistentStore
{
  return self->_persistentStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_pendingResetSessionOwner, 0);
  objc_storeStrong((id *)&self->_sessionOwner, 0);
  objc_storeStrong((id *)&self->_syService, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_qosTargetQueue, 0);
}

- (BOOL)inDeltaSync
{
  void *v2;
  void *v3;
  char v4;

  -[SYService name](self->_syService, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPerformingDeltaSync");

  return v4;
}

- (void)willBeginDeltaSync
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Beginning SYStore delta sync", v6, 2u);
  }
  -[SYService name](self->_syService, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPerformingDeltaSync:", 1);

}

- (void)didEndDeltaSync
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Ended SYStore delta sync", v6, 2u);
  }
  -[SYService name](self->_syService, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPerformingDeltaSync:", 0);

}

@end
