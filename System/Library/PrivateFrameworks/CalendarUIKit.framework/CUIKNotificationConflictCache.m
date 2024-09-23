@implementation CUIKNotificationConflictCache

- (CUIKNotificationConflictCache)init
{
  CUIKNotificationConflictCache *v2;
  uint64_t v3;
  NSCache *cache;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *fetchQueue;
  uint64_t v8;
  EKEventStore *store;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CUIKNotificationConflictCache;
  v2 = -[CUIKNotificationConflictCache init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    -[NSCache setCountLimit:](v2->_cache, "setCountLimit:", 1000);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("ConflictScanningQueue", v5);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", 130, 0, 0, 0, 1);
    store = v2->_store;
    v2->_store = (EKEventStore *)v8;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_35);
  return (id)sharedInstance__sharedInstance;
}

void __47__CUIKNotificationConflictCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v0;

}

- (id)_eventForNotification:(id)a3
{
  EKEventStore *store;
  void *v4;
  void *v5;
  void *v6;

  store = self->_store;
  objc_msgSend(a3, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recurrenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventWithRecurrenceIdentifier:](store, "eventWithRecurrenceIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_updateNotification:(id)a3 withCacheObject:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v6 = a4;
  -[CUIKNotificationConflictCache _eventForNotification:](self, "_eventForNotification:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scanForConflicts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "conflictInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || v8)
  {
    objc_msgSend(v6, "conflictInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || !v8)
    {
      objc_msgSend(v6, "conflictInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "totalOccurrencesInSeries");
      if (v13 == objc_msgSend(v8, "totalOccurrencesInSeries"))
      {
        objc_msgSend(v6, "conflictInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "totalConflictsInSeries");
        if (v15 == objc_msgSend(v8, "totalConflictsInSeries"))
        {
          objc_msgSend(v6, "conflictInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "totalConflictingEvents");
          if (v17 == objc_msgSend(v8, "totalConflictingEvents"))
          {
            objc_msgSend(v6, "conflictInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "totalNeedsActionEvents");
            v10 = v19 != objc_msgSend(v8, "totalNeedsActionEvents");

          }
          else
          {
            v10 = 1;
          }

        }
        else
        {
          v10 = 1;
        }

      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }

  objc_msgSend(v6, "setConflictInfo:", v8);
  objc_msgSend(v6, "setState:", 2);

  return v10;
}

- (void)updateConflictsForNotification:(id)a3 synchronously:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  CUIKNotificationConflictCache *v11;
  void *v12;
  NSObject *fetchQueue;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  +[CUIKNotificationConflictCacheObject keyForNotification:](CUIKNotificationConflictCacheObject, "keyForNotification:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self;
  objc_sync_enter(v11);
  -[NSCache objectForKey:](v11->_cache, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_opt_new();
    -[NSCache setObject:forKey:](v11->_cache, "setObject:forKey:", v12, v10);
  }
  if (v6)
  {
    -[CUIKNotificationConflictCache _updateNotification:withCacheObject:](v11, "_updateNotification:withCacheObject:", v8, v12);
  }
  else if (objc_msgSend(v12, "state") != 1)
  {
    objc_msgSend(v12, "setState:", 1);
    fetchQueue = v11->_fetchQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__CUIKNotificationConflictCache_updateConflictsForNotification_synchronously_withCompletion___block_invoke;
    v14[3] = &unk_1E6EB79E8;
    v14[4] = v11;
    v15 = v8;
    v16 = v12;
    v17 = v9;
    dispatch_async(fetchQueue, v14);

  }
  objc_sync_exit(v11);

}

uint64_t __93__CUIKNotificationConflictCache_updateConflictsForNotification_synchronously_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateNotification:withCacheObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
  {
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)conflictsForNotification:(id)a3
{
  id v4;
  void *v5;
  CUIKNotificationConflictCache *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[CUIKNotificationConflictCacheObject keyForNotification:](CUIKNotificationConflictCacheObject, "keyForNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  -[NSCache objectForKey:](v6->_cache, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conflictInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
