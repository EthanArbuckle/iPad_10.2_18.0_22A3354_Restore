@implementation CADCalSearchOperation

+ (id)operationWithConnection:(id)a3 searchTerm:(id)a4 calendars:(id)a5 replyID:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;

  v6 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnection:searchTerm:calendars:replyID:", v11, v10, v9, v6);

  return v12;
}

- (CADCalSearchOperation)initWithConnection:(id)a3 searchTerm:(id)a4 calendars:(id)a5 replyID:(unsigned int)a6
{
  id v11;
  id v12;
  id v13;
  CADCalSearchOperation *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *boostToken;
  dispatch_semaphore_t v22;
  OS_dispatch_semaphore *finishedSemaphore;
  CADCalSearchOperation *v24;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v11, "eventAccessLevel"))
  {
    v26.receiver = self;
    v26.super_class = (Class)CADCalSearchOperation;
    v14 = -[CADCalSearchOperation init](&v26, sel_init);
    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@"), v17);

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "beginActivityWithOptions:reason:", 0x80000000000, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      boostToken = v14->_boostToken;
      v14->_boostToken = v20;

      objc_storeStrong((id *)&v14->_connection, a3);
      objc_storeStrong((id *)&v14->_calendars, a5);
      objc_storeStrong((id *)&v14->_searchTerm, a4);
      v14->_lock._os_unfair_lock_opaque = 0;
      v14->_replyID = a6;
      v22 = dispatch_semaphore_create(0);
      finishedSemaphore = v14->_finishedSemaphore;
      v14->_finishedSemaphore = (OS_dispatch_semaphore *)v22;

    }
    self = v14;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)configureSearch:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setSearchAttendees:", 1);
  objc_msgSend(v3, "setSearchLocations:", 1);
  objc_msgSend(v3, "setSearchParticipants:", 1);
  objc_msgSend(v3, "setShouldMatchLocationsOnlyForEventSearch:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endActivity:", self->_boostToken);

  v4.receiver = self;
  v4.super_class = (Class)CADCalSearchOperation;
  -[CADCalSearchOperation dealloc](&v4, sel_dealloc);
}

- (unsigned)replyID
{
  return self->_replyID;
}

- (void)main
{
  NSObject *v3;
  ClientConnection *connection;
  NSArray *calendars;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "Starting search operation", buf, 2u);
  }
  connection = self->_connection;
  calendars = self->_calendars;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__CADCalSearchOperation_main__block_invoke;
  v6[3] = &unk_1E6A38418;
  v6[4] = self;
  -[ClientConnection withDatabaseForObjects:perform:](connection, "withDatabaseForObjects:perform:", calendars, v6);
  if ((-[CADCalSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[CADCalSearchOperation _completeOperation](self, "_completeOperation");
}

void __29__CADCalSearchOperation_main__block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v8 = v17;
  if ((v7 & 1) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 264) = a2;
    v9 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v17, "valueForKey:", CFSTR("entityID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "restrictedCalendarRowIDsForAction:inDatabase:", 0, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minusSet:", v12);

    v13 = (const void *)CalFilterCreateWithDatabaseShowingCalendarsWithUIDs();
    CalFilterSetSearchTerm();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 312));
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BB48]), "initWithDatabase:filter:dataSink:", a4, v13, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "configureSearch:", v14);
      objc_msgSend(v14, "startSearching");
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 256);
      *(_QWORD *)(v15 + 256) = v14;

    }
    CFRelease(v13);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 312));
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 288), 0xFFFFFFFFFFFFFFFFLL);

    v8 = v17;
  }

}

- (void)cancel
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  CADCalSearchOperation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "Cancelling [%@]", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)CADCalSearchOperation;
  -[CADCalSearchOperation cancel](&v4, sel_cancel);
  -[CalSearch stopSearching](self->_currentSearch, "stopSearching");
  os_unfair_lock_unlock(&self->_lock);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_finishedSemaphore);
  -[CADCalSearchOperation _completeOperation](self, "_completeOperation");
}

- (void)calSearch:(id)a3 foundOccurrences:(__CFArray *)a4 cachedDays:(__CFArray *)a5 cachedDaysIndexes:(__CFArray *)a6
{
  CFIndex Count;
  NSMutableArray *v9;
  NSMutableArray *objectIDsForPrivacyAccounting;
  void *v11;
  CFIndex i;
  uint64_t ID;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (a4)
    Count = CFArrayGetCount(a4);
  else
    Count = 0;
  if (!self->_objectIDsForPrivacyAccounting)
  {
    v9 = (NSMutableArray *)objc_opt_new();
    objectIDsForPrivacyAccounting = self->_objectIDsForPrivacyAccounting;
    self->_objectIDsForPrivacyAccounting = v9;

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(a4, i);
      CalEventOccurrenceGetEvent();
      if (_CalEventGetJunkStatusWhileLocked() != 1)
      {
        ID = CPRecordGetID();
        CalEventOccurrenceGetDate();
        v15 = v14;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 2, ID, self->_currentDatabaseID);
        objc_msgSend(v11, "addObject:", v16);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v15);
        objc_msgSend(v11, "addObject:", v17);

        -[NSMutableArray addObject:](self->_objectIDsForPrivacyAccounting, "addObject:", v16);
      }
    }
  }
  -[ClientConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CADClientReceiveOccurrenceCacheSearchResults:forSearchToken:finished:", v11, self->_replyID, 0);

}

void __81__CADCalSearchOperation_calSearch_foundOccurrences_cachedDays_cachedDaysIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_ERROR, "Error sending occurrence cache search results: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)calSearchComplete:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_INFO, "Search complete.", v5, 2u);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_finishedSemaphore);
}

- (void)_completeOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  CADCalSearchOperation *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "Sending an empty array to client of [%@].", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ClientConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADClientReceiveOccurrenceCacheSearchResults:forSearchToken:finished:", v4, self->_replyID, 1);

  if (self->_objectIDsForPrivacyAccounting)
    -[ClientConnection logAccessToObjects:](self->_connection, "logAccessToObjects:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsForPrivacyAccounting, 0);
  objc_storeStrong((id *)&self->_boostToken, 0);
  objc_storeStrong((id *)&self->_finishedSemaphore, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
