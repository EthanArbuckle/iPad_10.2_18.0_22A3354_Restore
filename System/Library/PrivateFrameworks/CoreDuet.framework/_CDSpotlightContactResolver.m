@implementation _CDSpotlightContactResolver

- (_CDSpotlightContactResolver)init
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_CDSpotlightContactResolver;
  v2 = -[_CDSpotlightContactResolver init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 2000);
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("cdSpotlightResolverTimerQueue", v7);
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v8;

    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, *((dispatch_queue_t *)v2 + 2));
    v11 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v10;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v12 = *((_QWORD *)v2 + 3);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __35___CDSpotlightContactResolver_init__block_invoke;
    handler[3] = &unk_1E26E2F20;
    v15 = v2;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));

  }
  return (_CDSpotlightContactResolver *)v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5 != -1)
    dispatch_once(&sharedInstance__pasOnceToken5, &__block_literal_global_6);
  return (id)sharedInstance__pasExprOnceResult_0;
}

+ (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    +[_CDSpotlightContactResolver sharedInstance](_CDSpotlightContactResolver, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_getCachedContactForHandle:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        +[_CDSpotlightContactResolver resolveContactIfPossibleFromContactIdentifierString:].cold.1(v6);

      objc_msgSend(v5, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:](_CDContactResolver, "resolveContactIfPossibleFromContactIdentifierString:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setContact:forHandle:", v7, v3);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_validateCache
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  NSObject *cacheInvalidationTimer;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  dispatch_suspend((dispatch_object_t)self->_cacheInvalidationTimer);
  if (!self->_transaction)
  {
    v3 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v3;

  }
  cacheInvalidationTimer = self->_cacheInvalidationTimer;
  v6 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(cacheInvalidationTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v7 = self->_cacheInvalidationTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __45___CDSpotlightContactResolver__validateCache__block_invoke;
  handler[3] = &unk_1E26E2F20;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_cacheInvalidationTimer);
}

- (void)_setContact:(id)a3 forHandle:(id)a4
{
  id v6;
  id v7;
  _PASLock *cachedContactsForHandle;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[_CDSpotlightContactResolver _validateCache](self, "_validateCache");
  cachedContactsForHandle = self->_cachedContactsForHandle;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53___CDSpotlightContactResolver__setContact_forHandle___block_invoke;
  v11[3] = &unk_1E26E32D0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](cachedContactsForHandle, "runWithLockAcquired:", v11);

}

- (id)_getCachedContactForHandle:(id)a3
{
  id v4;
  _PASLock *cachedContactsForHandle;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[_CDSpotlightContactResolver _validateCache](self, "_validateCache");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  cachedContactsForHandle = self->_cachedContactsForHandle;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58___CDSpotlightContactResolver__getCachedContactForHandle___block_invoke;
  v9[3] = &unk_1E26E32F8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](cachedContactsForHandle, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_purge
{
  NSObject *v3;
  _PASLock *cachedContactsForHandle;
  _QWORD v5[5];
  uint8_t buf[16];

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_INFO, "_CDSpotlightContactResolver: Purging cache.", buf, 2u);
  }

  cachedContactsForHandle = self->_cachedContactsForHandle;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___CDSpotlightContactResolver__purge__block_invoke;
  v5[3] = &unk_1E26E3320;
  v5[4] = self;
  -[_PASLock runWithLockAcquired:](cachedContactsForHandle, "runWithLockAcquired:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_cacheInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_cacheInvalidationTimerQueue, 0);
  objc_storeStrong((id *)&self->_cachedContactsForHandle, 0);
}

+ (void)resolveContactIfPossibleFromContactIdentifierString:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "_CDSpotlightContactResolver: Cache hit", v1, 2u);
}

@end
