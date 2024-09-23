@implementation HDNanoSyncRestoreSession

- (HDNanoSyncRestoreSession)initWithSyncStore:(id)a3 sessionUUID:(id)a4
{
  id v8;
  id v9;
  HDNanoSyncRestoreSession *v10;
  HDNanoSyncRestoreSession *v11;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSCalendar *calendar;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNanoSyncRestoreSession.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionUUID != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HDNanoSyncRestoreSession;
  v10 = -[HDNanoSyncRestoreSession init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nanoSyncStore, a3);
    objc_storeStrong((id *)&v11->_sessionUUID, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = objc_claimAutoreleasedReturnValue();
    calendar = v11->_calendar;
    v11->_calendar = (NSCalendar *)v14;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[_HKExpiringCompletionTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDNanoSyncRestoreSession;
  -[HDNanoSyncRestoreSession dealloc](&v3, sel_dealloc);
}

- (void)finishWithError:(id)a3
{
  -[_HKExpiringCompletionTimer invalidateAndInvokeCompletionWithError:](self->_timer, "invalidateAndInvokeCompletionWithError:", a3);
}

- (void)addCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *completionHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    completionHandlers = self->_completionHandlers;
    v10 = v4;
    if (!completionHandlers)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_completionHandlers;
      self->_completionHandlers = v6;

      completionHandlers = self->_completionHandlers;
    }
    v8 = (void *)objc_msgSend(v10, "copy");
    v9 = _Block_copy(v8);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v9);

    v4 = v10;
  }

}

- (void)scheduleTimeoutWithInterval:(double)a3 handler:(id)a4
{
  id v7;
  id v8;
  _HKExpiringCompletionTimer *v9;
  _HKExpiringCompletionTimer *timer;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNanoSyncRestoreSession.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != NULL"));

  }
  if (self->_timer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNanoSyncRestoreSession.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_timer == nil"));

  }
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0CB6F98]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HDNanoSyncRestoreSession_scheduleTimeoutWithInterval_handler___block_invoke;
  v13[3] = &unk_1E6D0F6C8;
  objc_copyWeak(&v14, &location);
  v9 = (_HKExpiringCompletionTimer *)objc_msgSend(v8, "initWithCompletion:", v13);
  timer = self->_timer;
  self->_timer = v9;

  -[_HKExpiringCompletionTimer startWithTimeoutInterval:handler:](self->_timer, "startWithTimeoutInterval:handler:", v7, a3);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __64__HDNanoSyncRestoreSession_scheduleTimeoutWithInterval_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  v5 = v4;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (*((_BYTE *)WeakRetained + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__finishWithError_, WeakRetained, CFSTR("HDNanoSyncRestoreSession.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_finished == NO"));

      v6 = WeakRetained;
    }
    *((_BYTE *)v6 + 8) = 1;
    v7 = (void *)objc_msgSend(v6[7], "copy");
    objc_msgSend(WeakRetained[7], "removeAllObjects");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++) + 16))();
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (HDNanoSyncStore)nanoSyncStore
{
  return self->_nanoSyncStore;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_nanoSyncStore, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
