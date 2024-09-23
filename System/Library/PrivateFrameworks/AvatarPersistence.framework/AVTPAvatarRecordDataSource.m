@implementation AVTPAvatarRecordDataSource

+ (id)sortedRecordsEditableFirstReverseOrder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
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
        if (objc_msgSend(v10, "isEditable", (_QWORD)v13))
          objc_msgSend(v4, "insertObject:atIndex:", v10, 0);
        else
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (unint64_t)indexForInsertingRecord:(id)a3 inRecords:(id)a4
{
  id v5;
  unint64_t v6;

  v5 = a4;
  if ((objc_msgSend(a3, "isEditable") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "count");

  return v6;
}

+ (unint64_t)indexForInsertingDuplicateRecord:(id)a3 original:(id)a4 inRecords:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t i;
  void *v11;
  int v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v7 = a3;
  v8 = a5;
  if ((objc_msgSend(a4, "isEditable") & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v7);
    v9 = v7;
    for (i = 0; i < objc_msgSend(v8, "count"); ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEditable");

      if (!v12)
        break;
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v15 = (void *)MEMORY[0x24BDBCE88];
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v16);

      }
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "orderDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "orderDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "compare:", v19);

      if (v20 != -1)
        break;
    }

  }
  else
  {
    i = objc_msgSend(v8, "count");
  }

  return i;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AVTPAvatarRecordDataSource *v9;

  v6 = a4;
  v7 = a3;
  +[AVTCoreEnvironment defaultEnvironment](AVTCoreEnvironment, "defaultEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTPAvatarRecordDataSource initWithRecordStore:fetchRequest:environment:](self, "initWithRecordStore:fetchRequest:environment:", v7, v6, v8);

  return v9;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTPAvatarRecordDataSource *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_255106588) & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v8);
  v11 = -[AVTPAvatarRecordDataSource initWithRecordStore:fetchRequest:callbackQueue:environment:](self, "initWithRecordStore:fetchRequest:callbackQueue:environment:", v8, v9, MEMORY[0x24BDAC9B8], v10);

  return v11;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 callbackQueue:(id)a5 environment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  AVTPAvatarRecordDataSource *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[AVTPAvatarRecordDataSource initWithRecordStore:fetchRequest:callbackQueue:logger:notificationCenter:](self, "initWithRecordStore:fetchRequest:callbackQueue:logger:notificationCenter:", v13, v12, v11, v14, v15);
  return v16;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 callbackQueue:(id)a5 logger:(id)a6 notificationCenter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AVTPAvatarRecordDataSource *v17;
  AVTPAvatarRecordDataSource *v18;
  AVTObservableAvatarStore *v19;
  AVTObservableAvatarStore *backingStore;
  NSMutableArray *nts_recordStorage;
  uint64_t v22;
  NSPointerArray *nts_observers;
  id v25;
  objc_super v26;

  v13 = a3;
  v25 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AVTPAvatarRecordDataSource;
  v17 = -[AVTPAvatarRecordDataSource init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_callbackQueue, a5);
    objc_storeStrong((id *)&v18->_underlyingStore, a3);
    v19 = -[AVTObservableAvatarStore initWithStore:callbackQueue:]([AVTObservableAvatarStore alloc], "initWithStore:callbackQueue:", v13, v14);
    backingStore = v18->_backingStore;
    v18->_backingStore = v19;

    -[AVTObservableAvatarStore setDelegate:](v18->_backingStore, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_fetchRequest, a4);
    nts_recordStorage = v18->_nts_recordStorage;
    v18->_nts_recordStorage = 0;

    objc_storeStrong((id *)&v18->_logger, a6);
    objc_storeStrong((id *)&v18->_notificationCenter, a7);
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v22 = objc_claimAutoreleasedReturnValue();
    nts_observers = v18->_nts_observers;
    v18->_nts_observers = (NSPointerArray *)v22;

  }
  return v18;
}

- (void)flushRecordsForEnteringBackground
{
  -[AVTPAvatarRecordDataSource setNts_recordStorage:](self, "setNts_recordStorage:", 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[AVTPAvatarRecordDataSource nts_changeNotificationObserver](self, "nts_changeNotificationObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTPAvatarRecordDataSource notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPAvatarRecordDataSource nts_changeNotificationObserver](self, "nts_changeNotificationObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)AVTPAvatarRecordDataSource;
  -[AVTPAvatarRecordDataSource dealloc](&v6, sel_dealloc);
}

- (BOOL)areRecordsLoaded
{
  AVTPAvatarRecordDataSource *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  -[AVTPAvatarRecordDataSource callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[AVTPAvatarRecordDataSource nts_recordStorage](v2, "nts_recordStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)performSyncWorkWithRecords:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v4 = (void (**)(id, void *))a3;
  -[AVTPAvatarRecordDataSource callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[AVTPAvatarRecordDataSource nts_changeNotificationObserver](self, "nts_changeNotificationObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_initWeak(&location, self);
    -[AVTPAvatarRecordDataSource notificationCenter](self, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke;
    v19 = &unk_24DD318E0;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("AVTAvatarStoreDidChangeNotification"), 0, 0, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPAvatarRecordDataSource setNts_changeNotificationObserver:](self, "setNts_changeNotificationObserver:", v8, v16, v17, v18, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  if (!-[AVTPAvatarRecordDataSource areRecordsLoaded](self, "areRecordsLoaded"))
  {
    v9 = (void *)objc_opt_class();
    -[AVTPAvatarRecordDataSource backingStore](self, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPAvatarRecordDataSource fetchRequest](self, "fetchRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPAvatarRecordDataSource logger](self, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadRecordsWithStore:request:logger:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    -[AVTPAvatarRecordDataSource setNts_recordStorage:](self, "setNts_recordStorage:", v14);

  }
  -[AVTPAvatarRecordDataSource nts_recordStorage](self, "nts_recordStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v15);

}

void __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke_2;
  v7[3] = &unk_24DD318B8;
  v7[4] = WeakRetained;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "avatarStoreDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)performObserversWork:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, id))a3;
  -[AVTPAvatarRecordDataSource callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[AVTPAvatarRecordDataSource nts_observers](self, "nts_observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compact");

  -[AVTPAvatarRecordDataSource nts_observers](self, "nts_observers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__AVTPAvatarRecordDataSource_addObserver___block_invoke;
  v6[3] = &unk_24DD31908;
  v7 = v4;
  v5 = v4;
  -[AVTPAvatarRecordDataSource performObserversWork:](self, "performObserversWork:", v6);

}

uint64_t __42__AVTPAvatarRecordDataSource_addObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addPointer:", *(_QWORD *)(a1 + 32));
}

- (void)addPriorityObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__AVTPAvatarRecordDataSource_addPriorityObserver___block_invoke;
  v6[3] = &unk_24DD31908;
  v7 = v4;
  v5 = v4;
  -[AVTPAvatarRecordDataSource performObserversWork:](self, "performObserversWork:", v6);

}

uint64_t __50__AVTPAvatarRecordDataSource_addPriorityObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "insertPointer:atIndex:", *(_QWORD *)(a1 + 32), 0);
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__AVTPAvatarRecordDataSource_removeObserver___block_invoke;
  v6[3] = &unk_24DD31908;
  v7 = v4;
  v5 = v4;
  -[AVTPAvatarRecordDataSource performObserversWork:](self, "performObserversWork:", v6);

}

void __45__AVTPAvatarRecordDataSource_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", *(_QWORD *)(a1 + 32));

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removePointerAtIndex:", v4);

}

- (void)enumerateObserversRespondingToSelector:(SEL)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__AVTPAvatarRecordDataSource_enumerateObserversRespondingToSelector_withBlock___block_invoke;
  v8[3] = &unk_24DD31930;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[AVTPAvatarRecordDataSource performObserversWork:](self, "performObserversWork:", v8);

}

void __79__AVTPAvatarRecordDataSource_enumerateObserversRespondingToSelector_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a2, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (id)loadRecordsWithStore:(id)a3 request:(id)a4 logger:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v8 = a5;
  v15 = 0;
  objc_msgSend(a3, "avatarsForFetchRequest:error:", a4, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(a1, "sortedRecordsEditableFirstReverseOrder:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logReadingError:", v13);

    v12 = 0;
  }

  return v12;
}

- (void)avatarStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  -[AVTPAvatarRecordDataSource callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTPAvatarRecordDataSource underlyingStore](self, "underlyingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[AVTPAvatarRecordDataSource setNts_recordStorage:](self, "setNts_recordStorage:", 0);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__AVTPAvatarRecordDataSource_avatarStoreDidChange___block_invoke;
    v8[3] = &unk_24DD31958;
    v8[4] = self;
    -[AVTPAvatarRecordDataSource enumerateObserversRespondingToSelector:withBlock:](self, "enumerateObserversRespondingToSelector:withBlock:", sel_significantRecordChangeInDataSource_, v8);
  }
}

uint64_t __51__AVTPAvatarRecordDataSource_avatarStoreDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "significantRecordChangeInDataSource:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)numberOfRecords
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__AVTPAvatarRecordDataSource_numberOfRecords__block_invoke;
  v4[3] = &unk_24DD31980;
  v4[4] = &v5;
  -[AVTPAvatarRecordDataSource performSyncWorkWithRecords:](self, "performSyncWorkWithRecords:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __45__AVTPAvatarRecordDataSource_numberOfRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)recordAtIndex:(unint64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__AVTPAvatarRecordDataSource_recordAtIndex___block_invoke;
  v5[3] = &unk_24DD319A8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[AVTPAvatarRecordDataSource performSyncWorkWithRecords:](self, "performSyncWorkWithRecords:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__AVTPAvatarRecordDataSource_recordAtIndex___block_invoke(_QWORD *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "count");
  v4 = a1[6];
  if (v3 <= v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Index %lu out of datasource %p bounds, count: %lu"), v4, a1[4], objc_msgSend(v8, "count"));
    v4 = a1[6];
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)indexesOfRecordsPassingTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__AVTPAvatarRecordDataSource_indexesOfRecordsPassingTest___block_invoke;
  v8[3] = &unk_24DD319D0;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[AVTPAvatarRecordDataSource performSyncWorkWithRecords:](self, "performSyncWorkWithRecords:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __58__AVTPAvatarRecordDataSource_indexesOfRecordsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "indexesOfObjectsPassingTest:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)indexOfRecordPassingTest:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__AVTPAvatarRecordDataSource_indexOfRecordPassingTest___block_invoke;
  v8[3] = &unk_24DD319D0;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[AVTPAvatarRecordDataSource performSyncWorkWithRecords:](self, "performSyncWorkWithRecords:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __55__AVTPAvatarRecordDataSource_indexOfRecordPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "indexOfObjectPassingTest:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)indexSetForEditableRecords
{
  return -[AVTPAvatarRecordDataSource indexesOfRecordsPassingTest:](self, "indexesOfRecordsPassingTest:", &__block_literal_global_0);
}

uint64_t __56__AVTPAvatarRecordDataSource_indexSetForEditableRecords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEditable");
}

- (void)store:(id)a3 didSaveAvatar:(id)a4 postCompletionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AVTPAvatarRecordDataSource *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  if (-[AVTPAvatarRecordDataSource areRecordsLoaded](self, "areRecordsLoaded"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke;
    v9[3] = &unk_24DD31AB0;
    v10 = v7;
    v11 = self;
    v12 = v8;
    -[AVTPAvatarRecordDataSource performSyncWorkWithRecords:](self, "performSyncWorkWithRecords:", v9);

  }
}

void __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  uint64_t v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_2;
  v15[3] = &unk_24DD31A38;
  v16 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v3, "indexOfObjectPassingTest:", v15);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "indexForInsertingRecord:inRecords:", *(_QWORD *)(a1 + 32), v3);
    objc_msgSend(v3, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), v6);
  }
  else
  {
    objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v5, *(_QWORD *)(a1 + 32));
    v6 = v5;
  }
  v7 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  v8 = *(_QWORD *)(a1 + 48);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_3;
  v11[3] = &unk_24DD31A88;
  v14 = v7;
  v10 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  v13 = v6;
  (*(void (**)(uint64_t, _QWORD *))(v8 + 16))(v8, v11);

}

uint64_t __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_3(uint64_t a1)
{
  char v2;
  char **v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v2 = *(_BYTE *)(a1 + 56);
  v3 = &selRef_dataSource_didAddRecord_atIndex_;
  if (!v2)
    v3 = &selRef_dataSource_didEditRecord_atIndex_;
  v4 = *v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_4;
  v8[3] = &unk_24DD31A60;
  v12 = v2;
  v5 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "enumerateObserversRespondingToSelector:withBlock:", v4, v8);

}

uint64_t __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(a2, "dataSource:didAddRecord:atIndex:", v2, v3, v4);
  else
    return objc_msgSend(a2, "dataSource:didEditRecord:atIndex:", v2, v3, v4);
}

- (void)store:(id)a3 didDeleteAvatarWithIdentifier:(id)a4 postCompletionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AVTPAvatarRecordDataSource *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  if (-[AVTPAvatarRecordDataSource areRecordsLoaded](self, "areRecordsLoaded"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke;
    v9[3] = &unk_24DD31B28;
    v10 = v7;
    v11 = self;
    v12 = v8;
    -[AVTPAvatarRecordDataSource performSyncWorkWithRecords:](self, "performSyncWorkWithRecords:", v9);

  }
}

void __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD *);
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_2;
  v14[3] = &unk_24DD31A38;
  v15 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v3, "indexOfObjectPassingTest:", v14);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(v3, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectAtIndex:", v6);
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_3;
    v11[3] = &unk_24DD31B00;
    v8 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v13 = v6;
    v9 = *(void (**)(uint64_t, _QWORD *))(v8 + 16);
    v10 = v7;
    v9(v8, v11);

  }
}

uint64_t __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_4;
  v5[3] = &unk_24DD31AD8;
  v2 = (void *)a1[5];
  v6 = (id)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "enumerateObserversRespondingToSelector:withBlock:", sel_dataSource_didRemoveRecord_atIndex_, v5);

}

uint64_t __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "dataSource:didRemoveRecord:atIndex:", a1[4], a1[5], a1[6]);
}

- (void)store:(id)a3 didCreateDuplicateAvatar:(id)a4 forOriginal:(id)a5 postCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[AVTPAvatarRecordDataSource areRecordsLoaded](self, "areRecordsLoaded"))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke;
    v12[3] = &unk_24DD31B50;
    v12[4] = self;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    -[AVTPAvatarRecordDataSource performSyncWorkWithRecords:](self, "performSyncWorkWithRecords:", v12);

  }
}

void __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "indexForInsertingDuplicateRecord:original:inRecords:", a1[5], a1[6], v3);
  objc_msgSend(v3, "insertObject:atIndex:", a1[5], v4);

  v5 = a1[7];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_2;
  v7[3] = &unk_24DD31B00;
  v6 = (void *)a1[5];
  v7[4] = a1[4];
  v8 = v6;
  v9 = v4;
  (*(void (**)(uint64_t, _QWORD *))(v5 + 16))(v5, v7);

}

void __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_3;
  v5[3] = &unk_24DD31AD8;
  v2 = (void *)a1[5];
  v6 = (id)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "enumerateObserversRespondingToSelector:withBlock:", sel_dataSource_didAddRecord_atIndex_, v5);

}

uint64_t __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "dataSource:didAddRecord:atIndex:", a1[4], a1[5], a1[6]);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTPAvatarStore)underlyingStore
{
  return self->_underlyingStore;
}

- (AVTObservableAvatarStore)backingStore
{
  return self->_backingStore;
}

- (AVTAvatarFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSMutableArray)nts_recordStorage
{
  return self->_nts_recordStorage;
}

- (void)setNts_recordStorage:(id)a3
{
  objc_storeStrong((id *)&self->_nts_recordStorage, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSPointerArray)nts_observers
{
  return self->_nts_observers;
}

- (NSObject)nts_changeNotificationObserver
{
  return self->_nts_changeNotificationObserver;
}

- (void)setNts_changeNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_nts_changeNotificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nts_changeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_nts_observers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_nts_recordStorage, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_underlyingStore, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

+ (id)defaultUIDataSourceWithDomainIdentifier:(id)a3
{
  AVTPAvatarStore *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(AVTPAvatarStore);
  +[AVTAvatarFetchRequest requestForAllAvatars](AVTAvatarFetchRequest, "requestForAllAvatars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRecordStore:fetchRequest:", v4, v5);

  return v6;
}

@end
