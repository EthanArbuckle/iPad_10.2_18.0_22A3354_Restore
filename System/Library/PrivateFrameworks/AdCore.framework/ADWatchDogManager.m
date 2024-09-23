@implementation ADWatchDogManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ADWatchDogManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_2 != -1)
    dispatch_once(&sharedInstance__onceToken_2, block);
  return (id)sharedInstance__instance_2;
}

void __35__ADWatchDogManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_2;
  sharedInstance__instance_2 = (uint64_t)v0;

}

- (ADWatchDogManager)init
{
  ADWatchDogManager *v2;
  ADWatchDogManager *v3;
  NSNumber *currentToken;
  uint64_t v5;
  NSMutableDictionary *tokenCollection;
  dispatch_queue_t v7;
  OS_dispatch_queue *watchdogQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ADWatchDogManager;
  v2 = -[ADWatchDogManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    currentToken = v2->_currentToken;
    v2->_currentToken = (NSNumber *)&unk_1E82BE8F0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    tokenCollection = v3->_tokenCollection;
    v3->_tokenCollection = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.queue.adplatforms.watchdog", 0);
    watchdogQueue = v3->_watchdogQueue;
    v3->_watchdogQueue = (OS_dispatch_queue *)v7;

  }
  return v3;
}

- (id)createNewWatchdog:(id)a3 withTimer:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  ADWatchDog *v9;
  ADWatchDogManager *v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *watchdogQueue;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v6 = a3;
  -[ADWatchDogManager getNextToken](self, "getNextToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating a new watchdog with token %@ and waiting %lu seconds for: %@"), v7, a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("ToroLogging"), v8, 0);

  v9 = -[ADWatchDog initWithReason:andDelay:]([ADWatchDog alloc], "initWithReason:andDelay:", v6, a4);
  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableDictionary setObject:forKey:](v10->_tokenCollection, "setObject:forKey:", v9, v7);
  objc_sync_exit(v10);

  objc_initWeak(&location, v10);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 1000000000 * a4);
  watchdogQueue = v10->_watchdogQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ADWatchDogManager_createNewWatchdog_withTimer___block_invoke;
  block[3] = &unk_1E82B2270;
  objc_copyWeak(&v24, &location);
  v14 = v7;
  v21 = v14;
  v22 = v11;
  v23 = v6;
  v15 = v6;
  v16 = v11;
  dispatch_after(v12, watchdogQueue, block);
  v17 = v23;
  v18 = v14;

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

void __49__ADWatchDogManager_createNewWatchdog_withTimer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Watchdog timer has been reached for token %@"), *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v2, 0);

    v3 = WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3, "tokenCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Token %@ has been found. We will now crash..."), *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("iAdInternalLogging"), v6, 16);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      v9 = v8;

      objc_msgSend(v5, "reason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "simulateCrash:becauseOf:actuallyTook:", v10, objc_msgSend(v5, "delayTime"), v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' has passed successfully. Removing watchdog %@."), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("ToroLogging"), v10, 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: weakSelf wasn't valid when completion handler called."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v5, 16);
  }

}

- (BOOL)removeWatchdogWithToken:(id)a3
{
  id v4;
  ADWatchDogManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_tokenCollection, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
  {
    objc_msgSend(v6, "reason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Removing watchdog with token %@ that was started for %@"), v4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v10, 0);

    -[NSMutableDictionary removeObjectForKey:](v5->_tokenCollection, "removeObjectForKey:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Watchdog token was not in list. Double remove? Please file a radar..."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v11, 16);

  }
  objc_sync_exit(v5);

  return v7 != 0;
}

- (BOOL)updateReason:(id)a3 forToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_tokenCollection, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "updateReason:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Watchdog token was not in list. Cannot update its reason for existing. Please file a radar..."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v9, 16);

  }
  return v8 != 0;
}

- (void)simulateCrash:(id)a3 becauseOf:(unint64_t)a4 actuallyTook:(double)a5
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation '%@' unable to complete within %lu seconds (crashed after %f seconds)."), a3, a4, *(_QWORD *)&a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ADSimulateCrash(2880291038, v5, 1);

}

- (void)incrementToken
{
  int v3;
  NSNumber *v4;
  NSNumber *currentToken;

  v3 = -[NSNumber intValue](self->_currentToken, "intValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v3 + 1));
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  currentToken = self->_currentToken;
  self->_currentToken = v4;

}

- (id)getNextToken
{
  ADWatchDogManager *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentToken;
  -[ADWatchDogManager incrementToken](v2, "incrementToken");
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)currentToken
{
  return self->_currentToken;
}

- (void)setCurrentToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentToken, a3);
}

- (NSMutableDictionary)tokenCollection
{
  return self->_tokenCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCollection, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);
}

@end
