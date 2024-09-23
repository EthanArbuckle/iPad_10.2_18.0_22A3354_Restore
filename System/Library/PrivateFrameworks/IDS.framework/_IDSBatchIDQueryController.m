@implementation _IDSBatchIDQueryController

- (_IDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5 parent:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _IDSBatchIDQueryController *v16;
  uint64_t v17;
  CUTWeakReference *v18;
  CUTWeakReference *delegate;
  CUTWeakReference *v20;
  CUTWeakReference *parent;
  NSString *v22;
  NSString *listenerID;
  NSArray *destinations;
  NSMutableArray *destinationsToQuery;
  NSTimer *nextQueryTimer;
  NSDate *timeOfDeath;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id rateLimiter;
  void *v36;
  uint8_t v38[16];
  objc_super v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!_IDSRunningInDaemon())
  {
    v39.receiver = self;
    v39.super_class = (Class)_IDSBatchIDQueryController;
    self = -[_IDSBatchIDQueryController init](&v39, sel_init);
    if (!self)
      goto LABEL_24;
    v17 = objc_msgSend(v11, "length");
    if (v17)
    {
      if (v12)
        goto LABEL_9;
    }
    else
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_1906E0000, v32, OS_LOG_TYPE_DEFAULT, "No service name, bailing...", v38, 2u);
      }

      if (v12)
      {
LABEL_9:
        if (v13)
        {
          if (!v17)
            goto LABEL_5;
          objc_storeStrong((id *)&self->_serviceName, a3);
          objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v12);
          v18 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
          delegate = self->_delegate;
          self->_delegate = v18;

          objc_storeStrong((id *)&self->_queue, a5);
          objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v14);
          v20 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
          parent = self->_parent;
          self->_parent = v20;

          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          listenerID = self->_listenerID;
          self->_listenerID = v22;

          destinations = self->_destinations;
          self->_destinations = 0;

          destinationsToQuery = self->_destinationsToQuery;
          self->_destinationsToQuery = 0;

          self->_destinationsToQuerylock._os_unfair_lock_opaque = 0;
          nextQueryTimer = self->_nextQueryTimer;
          self->_nextQueryTimer = 0;

          timeOfDeath = self->_timeOfDeath;
          self->_timeOfDeath = 0;

          v28 = objc_alloc(MEMORY[0x1E0D34E38]);
          objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", CFSTR("batch-query-limit"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            v31 = objc_msgSend(v30, "integerValue");
          else
            v31 = 60;

          v34 = (void *)objc_msgSend(v28, "initWithLimit:timeLimit:", v31, sub_1907E1838());
          rateLimiter = self->_rateLimiter;
          self->_rateLimiter = v34;

          self->_numberOfQueriesDone = 0;
          self->_isDead = 0;
          +[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addDelegate:forService:listenerID:queue:", self, self->_serviceName, self->_listenerID, MEMORY[0x1E0C80D38]);

LABEL_24:
          self = self;
          v16 = self;
          goto LABEL_25;
        }
LABEL_20:
        +[IDSLogging IDQuery](IDSLogging, "IDQuery");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "No queue, bailing...", v38, 2u);
        }
        goto LABEL_4;
      }
    }
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1906E0000, v33, OS_LOG_TYPE_DEFAULT, "No delegate, bailing...", v38, 2u);
    }

    if (v13)
      goto LABEL_5;
    goto LABEL_20;
  }
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1907E7DEC((uint64_t)self, v15);
LABEL_4:

LABEL_5:
  v16 = 0;
LABEL_25:

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[_IDSBatchIDQueryController _invalidateNextQueryTimer](self, "_invalidateNextQueryTimer");
  v3.receiver = self;
  v3.super_class = (Class)_IDSBatchIDQueryController;
  -[_IDSBatchIDQueryController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  _IDSBatchIDQueryController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Client request to invalidate: %@", (uint8_t *)&v5, 0xCu);
  }

  -[_IDSBatchIDQueryController _invalidateNextQueryTimer](self, "_invalidateNextQueryTimer");
  +[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDelegate:forService:listenerID:", self, self->_serviceName, self->_listenerID);

}

- (void)_scheduleNextQuery:(double)a3
{
  NSObject *v5;
  NSTimer *v6;
  NSTimer *nextQueryTimer;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling next batch in %f", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__nextQuery_, 0, 0, a3);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  nextQueryTimer = self->_nextQueryTimer;
  self->_nextQueryTimer = v6;

}

- (void)setDestinations:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSArray *v8;
  NSArray *destinations;
  NSDate *timeOfDeath;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSDate *v17;
  NSDate *v18;
  NSObject *v19;
  NSDate *v20;
  NSMutableArray *destinationsToQuery;
  void *v22;
  void *v23;
  NSString *serviceName;
  NSArray *v25;
  NSString *listenerID;
  _QWORD v27[5];
  id v28;
  BOOL v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "setDestinations %@", buf, 0xCu);
  }

  if (self->_isDead && sub_1907E1E00())
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "We're dead, bailing";
LABEL_11:
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (self->_destinations == v4 || -[NSArray isEqualToArray:](v4, "isEqualToArray:"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Destinations are the same, bailing";
      goto LABEL_11;
    }
LABEL_21:

    goto LABEL_22;
  }
  v8 = (NSArray *)-[NSArray mutableCopy](v4, "mutableCopy");
  destinations = self->_destinations;
  self->_destinations = v8;

  -[_IDSBatchIDQueryController _invalidateNextQueryTimer](self, "_invalidateNextQueryTimer");
  if (-[NSArray count](self->_destinations, "count"))
  {
    timeOfDeath = self->_timeOfDeath;
    v11 = timeOfDeath != 0;
    if (!timeOfDeath)
    {
      v12 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("batch-query-time-to-live"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "doubleValue");
        v16 = v15;
      }
      else
      {
        v16 = 120.0;
      }

      v17 = (NSDate *)objc_msgSend(v12, "initWithTimeIntervalSinceNow:", v16);
      v18 = self->_timeOfDeath;
      self->_timeOfDeath = v17;

      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_timeOfDeath;
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Setting time of death to %@", buf, 0xCu);
      }

    }
    os_unfair_lock_lock(&self->_destinationsToQuerylock);
    destinationsToQuery = self->_destinationsToQuery;
    self->_destinationsToQuery = 0;

    os_unfair_lock_unlock(&self->_destinationsToQuerylock);
    v22 = (void *)-[NSArray copy](v4, "copy");
    +[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    serviceName = self->_serviceName;
    listenerID = self->_listenerID;
    v25 = self->_destinations;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1907E1E84;
    v27[3] = &unk_1E2C652D8;
    v27[4] = self;
    v28 = v22;
    v29 = v11;
    v6 = v22;
    objc_msgSend(v23, "currentIDStatusForDestinations:service:listenerID:queue:completionBlock:", v25, serviceName, listenerID, MEMORY[0x1E0C80D38], v27);

    goto LABEL_21;
  }
LABEL_22:

}

- (void)_nextQuery:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  os_unfair_lock_s *p_destinationsToQuerylock;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  NSString *serviceName;
  NSString *listenerID;
  int v28;
  NSObject *v29;
  const __CFString *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  os_unfair_lock_s *v35;
  void *v36;
  int v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  _IDSBatchIDQueryController *v44;
  __int16 v45;
  _IDSBatchIDQueryController *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = 0x1E2C5D000uLL;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = self;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, " * Next query timer hit: %@", buf, 0xCu);
  }

  -[_IDSBatchIDQueryController _invalidateNextQueryTimer](self, "_invalidateNextQueryTimer");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_timeOfDeath);
  if (v7 > 0.0 && sub_1907E1E00())
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = self;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "We're dead, not querying: %@", buf, 0xCu);
    }

    self->_isDead = 1;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("batch-query-size"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (int)(float)(int)objc_msgSend(v10, "intValue");
  else
    v11 = 15;
  v37 = v11;

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_destinationsToQuerylock = &self->_destinationsToQuerylock;
  os_unfair_lock_lock(&self->_destinationsToQuerylock);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = self->_destinationsToQuery;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (!v15)
    goto LABEL_29;
  v16 = v15;
  v17 = 0;
  v18 = *(_QWORD *)v40;
  v35 = &self->_destinationsToQuerylock;
  v36 = v6;
  while (2)
  {
    v19 = 0;
    v20 = v37;
    if (v17 > v37)
      v20 = v17;
    v21 = (v20 - v17);
    v17 += v16;
    do
    {
      if (*(_QWORD *)v40 != v18)
        objc_enumerationMutation(v14);
      v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v19);
      if (!-[_IDSBatchIDQueryController underLimit](self, "underLimit", v35, v36))
      {
        v4 = 0x1E2C5D000uLL;
        +[IDSLogging IDQuery](IDSLogging, "IDQuery");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = self;
          v24 = "We've reached the max number of queries, not adding anymore: %@";
LABEL_27:
          _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
        }
LABEL_28:
        p_destinationsToQuerylock = v35;
        v6 = v36;

        goto LABEL_29;
      }
      if (v21 == v19)
      {
        v4 = 0x1E2C5D000uLL;
        +[IDSLogging IDQuery](IDSLogging, "IDQuery");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = self;
          v24 = "We've reached the max number of queries for this batch, not adding anymore: %@";
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      objc_msgSend(v12, "addObject:", v22);
      objc_msgSend(self->_rateLimiter, "noteItem:", CFSTR("TTLItem"));
      ++self->_numberOfQueriesDone;
      ++v19;
    }
    while (v16 != v19);
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    p_destinationsToQuerylock = v35;
    v6 = v36;
    v4 = 0x1E2C5D000;
    if (v16)
      continue;
    break;
  }
LABEL_29:

  os_unfair_lock_unlock(p_destinationsToQuerylock);
  if (objc_msgSend(v12, "count"))
  {
    +[IDSIDQueryController sharedInstance](IDSIDQueryController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    serviceName = self->_serviceName;
    listenerID = self->_listenerID;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_1907E26E8;
    v38[3] = &unk_1E2C65300;
    v38[4] = self;
    objc_msgSend(v25, "refreshIDStatusForDestinations:service:listenerID:queue:errorCompletionBlock:", v12, serviceName, listenerID, MEMORY[0x1E0C80D38], v38);

    os_unfair_lock_lock(p_destinationsToQuerylock);
    -[NSMutableArray removeObjectsInArray:](self->_destinationsToQuery, "removeObjectsInArray:", v12);
    os_unfair_lock_unlock(p_destinationsToQuerylock);
    if (-[_IDSBatchIDQueryController underLimit](self, "underLimit"))
    {
      -[_IDSBatchIDQueryController _scheduleNextQuery:](self, "_scheduleNextQuery:", sub_1907E2174());
    }
    else
    {
      v28 = sub_1907E1E00();
      objc_msgSend(*(id *)(v4 + 3512), "IDQuery");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = CFSTR("YES");
        if (v28)
          v30 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v44 = (_IDSBatchIDQueryController *)v30;
        v45 = 2112;
        v46 = self;
        _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "We've reached the max number of queries, possibly deferring queries: %@ %@", buf, 0x16u);
      }

      if ((v28 & 1) == 0)
      {
        objc_msgSend(self->_rateLimiter, "timeToUnderLimit:", CFSTR("TTLItem"));
        v32 = v31;
        v33 = sub_1907E1838();
        if (v32 >= v33)
          v33 = v32;
        -[_IDSBatchIDQueryController _scheduleNextQuery:](self, "_scheduleNextQuery:", v33);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSIDQueryControllerErrorDomain"), -4000, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSBatchIDQueryController _calloutToDelegateWithResult:error:](self, "_calloutToDelegateWithResult:error:", 0, v34);

    }
  }

LABEL_42:
}

- (void)_invalidateNextQueryTimer
{
  NSObject *v3;
  NSTimer *nextQueryTimer;
  int v5;
  _IDSBatchIDQueryController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating next query timer: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NSTimer invalidate](self->_nextQueryTimer, "invalidate");
  nextQueryTimer = self->_nextQueryTimer;
  self->_nextQueryTimer = 0;

}

- (void)_calloutToDelegateWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  OS_dispatch_queue *queue;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  _IDSBatchIDQueryController *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  OS_dispatch_queue *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CUTWeakReference object](self->_delegate, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (v10 = self->_queue) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1907E2A2C;
    v13[3] = &unk_1E2C60C50;
    v14 = v8;
    v15 = v6;
    v16 = self;
    v17 = v7;
    dispatch_async(v10, v13);

    v11 = v14;
  }
  else
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      queue = self->_queue;
      *(_DWORD *)buf = 134218240;
      v19 = v9;
      v20 = 2048;
      v21 = queue;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "No delegate %p or queue %p", buf, 0x16u);
    }
  }

}

- (BOOL)underLimit
{
  int numberOfQueriesDone;
  void *v4;
  void *v5;
  int v6;

  if (!sub_1907E1E00())
    return MEMORY[0x1E0DE7D20](self->_rateLimiter, sel_underLimitForItem_);
  numberOfQueriesDone = self->_numberOfQueriesDone;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("batch-query-max"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (int)(float)(int)objc_msgSend(v5, "intValue");
  else
    v6 = 60;

  return numberOfQueriesDone < v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_timeOfDeath, 0);
  objc_storeStrong((id *)&self->_nextQueryTimer, 0);
  objc_storeStrong((id *)&self->_destinationsToQuery, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
