@implementation DNDSCalendarEventLifetimeMonitor

- (DNDSCalendarEventLifetimeMonitor)init
{
  DNDSCalendarEventLifetimeMonitor *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DNDSCalendarEventLifetimeMonitor;
  v2 = -[DNDSBaseLifetimeMonitor init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__calendarEventStoreChangedWithNotification_, *MEMORY[0x1E0CA9F88], 0);

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSCalendarEventLifetimeMonitor;
  -[DNDSBaseLifetimeMonitor setDelegate:](&v8, sel_setDelegate_, v4);
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__DNDSCalendarEventLifetimeMonitor_setDelegate___block_invoke;
    v5[3] = &unk_1E86A5F98;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "lifetimeMonitor:registerTimerHandlerWithServiceIdentifier:handler:", self, CFSTR("com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer"), v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __48__DNDSCalendarEventLifetimeMonitor_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  if (objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer")))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "refreshMonitorForDate:", v3);

  }
}

- (id)activeDateIntervalForCalendarEventLifetime:(id)a3 assertionStartDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[DNDSCalendarEventLifetimeMonitor _eventForCalendarEventLifetime:assertionStartDate:](self, "_eventForCalendarEventLifetime:assertionStartDate:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "isOnlyDuringEvent");

  if ((self & 1) != 0)
  {
    objc_msgSend(v8, "startDate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;
  objc_msgSend(v8, "endDate");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v10 && v11)
  {
    if (objc_msgSend(v10, "compare:", v11) == -1)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v12);
    else
      v13 = 0;
  }

  return v13;
}

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSDate *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  DNDSCalendarEventLifetimeMonitor *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSDate *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSDate *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSDate *v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  NSDate **p_lifetimeTimerFireDate;
  _BOOL4 v49;
  void *v50;
  NSObject *v51;
  NSDate *v52;
  void *v53;
  DNDSXPCTimer *v54;
  NSDate *v55;
  NSObject *v57;
  DNDSXPCTimer *v58;
  DNDSLifetimeMonitorResult *v59;
  __int128 v61;
  void *v62;
  void *v63;
  DNDSCalendarEventLifetimeMonitor *v64;
  id obj;
  NSDate *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  NSDate *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v66 = (NSDate *)a4;
  v64 = self;
  -[DNDSBaseLifetimeMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = DNDSLogCalendarEventLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v72 = v66;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Refreshing monitor, date=%{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v68;
    *(_QWORD *)&v11 = 138543618;
    v61 = v11;
    v14 = self;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v16, "details", v61);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lifetime");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSCalendarEventLifetimeMonitor activeDateIntervalForCalendarEventLifetime:assertionStartDate:](v14, "activeDateIntervalForCalendarEventLifetime:assertionStartDate:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          objc_msgSend(v16, "source");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "deviceIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v31 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v31;
              objc_msgSend(v18, "eventUniqueID");
              v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "UUID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v61;
              v72 = v33;
              v73 = 2114;
              v74 = v34;
              _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Unable to find matching event for synced assertion; eventIdentifier=%{public}@; assertionIdentifier=%{public}@",
                buf,
                0x16u);

              v14 = v64;
            }
            objc_msgSend(v16, "UUID");
            v35 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "addObject:", v35);
          }
          else
          {
            objc_msgSend(v16, "UUID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "addObject:", v44);

            v45 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (!os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
              goto LABEL_28;
            v35 = v45;
            objc_msgSend(v18, "eventUniqueID");
            v41 = (NSDate *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v72 = v41;
            v42 = v35;
            v43 = "No date interval for event; eventIdentifier=%{public}@";
LABEL_26:
            _os_log_impl(&dword_1CB895000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);

            v14 = v64;
          }

          goto LABEL_28;
        }
        v21 = objc_msgSend(v20, "dnds_lifetimePhaseForDate:", v66);
        if (v21 != 2)
        {
          if (v21 == 1)
          {
            objc_msgSend(v16, "UUID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "addObject:", v36);

            objc_msgSend(v20, "endDate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDate earlierDate:](v9, "earlierDate:", v37);
            v23 = objc_claimAutoreleasedReturnValue();

            v38 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v38;
              objc_msgSend(v18, "eventUniqueID");
              v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v72 = v26;
              v27 = v25;
              v28 = "Active date interval for event; eventIdentifier=%{public}@";
LABEL_20:
              _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);

              v14 = v64;
            }
          }
          else
          {
            if (v21)
              goto LABEL_28;
            objc_msgSend(v20, "startDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDate earlierDate:](v9, "earlierDate:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v24 = (void *)DNDSLogCalendarEventLifetimeMonitor;
            if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v24;
              objc_msgSend(v18, "eventUniqueID");
              v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v72 = v26;
              v27 = v25;
              v28 = "Pending date interval for event; eventIdentifier=%{public}@";
              goto LABEL_20;
            }
          }
          v9 = (NSDate *)v23;
          goto LABEL_28;
        }
        objc_msgSend(v16, "UUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addObject:", v39);

        v40 = (void *)DNDSLogCalendarEventLifetimeMonitor;
        if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v40;
          objc_msgSend(v18, "eventUniqueID");
          v41 = (NSDate *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v72 = v41;
          v42 = v35;
          v43 = "Expired date interval for event; eventIdentifier=%{public}@";
          goto LABEL_26;
        }
LABEL_28:

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (!v12)
        goto LABEL_32;
    }
  }
  v14 = self;
LABEL_32:

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[NSDate isEqualToDate:](v9, "isEqualToDate:", v46);

  p_lifetimeTimerFireDate = &v14->_lifetimeTimerFireDate;
  v49 = -[NSDate isEqualToDate:](v9, "isEqualToDate:", v14->_lifetimeTimerFireDate);
  -[DNDSBaseLifetimeMonitor delegate](v14, "delegate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47 || !v49)
  {
    v51 = DNDSLogCalendarEventLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v52 = *p_lifetimeTimerFireDate;
      *(_DWORD *)buf = 138543362;
      v72 = v52;
      _os_log_impl(&dword_1CB895000, v51, OS_LOG_TYPE_DEFAULT, "Invalidating existing timer; fireDate=%{public}@",
        buf,
        0xCu);
    }
    -[DNDSCalendarEventLifetimeMonitor _eventStore](v14, "_eventStore");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "reset");

    v54 = -[DNDSXPCTimer initWithFireDate:serviceIdentifier:userVisible:]([DNDSXPCTimer alloc], "initWithFireDate:serviceIdentifier:userVisible:", 0, CFSTR("com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer"), 1);
    objc_msgSend(v50, "lifetimeMonitor:setTimer:", v14, v54);

    v55 = *p_lifetimeTimerFireDate;
    *p_lifetimeTimerFireDate = 0;

  }
  if (!v47 && (!*p_lifetimeTimerFireDate || !v49))
  {
    v57 = DNDSLogCalendarEventLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v72 = v9;
      _os_log_impl(&dword_1CB895000, v57, OS_LOG_TYPE_DEFAULT, "Scheduling timer; nextUpdateDate=%{public}@", buf, 0xCu);
    }
    v58 = -[DNDSXPCTimer initWithFireDate:serviceIdentifier:userVisible:]([DNDSXPCTimer alloc], "initWithFireDate:serviceIdentifier:userVisible:", v9, CFSTR("com.apple.donotdisturb.server.CalendarEventLifetimeMonitor.timer"), 1);
    objc_msgSend(v50, "lifetimeMonitor:setTimer:", v14, v58);

    objc_storeStrong((id *)&v14->_lifetimeTimerFireDate, v9);
  }
  v59 = -[DNDSLifetimeMonitorResult initWithActiveUUIDs:expiredUUIDs:]([DNDSLifetimeMonitorResult alloc], "initWithActiveUUIDs:expiredUUIDs:", v63, v62);

  return v59;
}

- (void)_calendarEventStoreChangedWithNotification:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DNDSBaseLifetimeMonitor refreshMonitorForDate:](self, "refreshMonitorForDate:", v4);

}

- (id)_eventStoreCreatingIfNeeded
{
  EKEventStore *eventStore;
  EKEventStore *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  EKEventStore *v7;
  EKEventStore *v8;
  _QWORD v10[4];
  dispatch_semaphore_t v11;

  eventStore = self->_eventStore;
  if (!eventStore)
  {
    v4 = (EKEventStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 128);
    v5 = dispatch_semaphore_create(0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke;
    v10[3] = &unk_1E86A5A10;
    v11 = v5;
    v6 = v5;
    -[EKEventStore requestFullAccessToEventsWithCompletion:](v4, "requestFullAccessToEventsWithCompletion:", v10);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = self->_eventStore;
    self->_eventStore = v4;
    v8 = v4;

    eventStore = self->_eventStore;
  }
  return eventStore;
}

void __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = DNDSLogCalendarEventLifetimeMonitor;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = 1;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Requested access to events, granted=%{BOOL}d error=%{public}@", (uint8_t *)v7, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCalendarEventLifetimeMonitor, OS_LOG_TYPE_ERROR))
  {
    __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke_cold_1((uint64_t)v5, v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_eventStore
{
  return self->_eventStore;
}

- (id)_eventForCalendarEventLifetime:(id)a3 assertionStartDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isOnlyDuringEvent") & 1) != 0)
  {
    objc_msgSend(v6, "occurrenceDate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;
  objc_msgSend(v8, "dateByAddingTimeInterval:", 900.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSCalendarEventLifetimeMonitor _eventStoreCreatingIfNeeded](self, "_eventStoreCreatingIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForEventsWithStartDate:endDate:calendars:", v9, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eventsMatchingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__DNDSCalendarEventLifetimeMonitor__eventForCalendarEventLifetime_assertionStartDate___block_invoke;
  v18[3] = &unk_1E86A5FC0;
  v19 = v6;
  v14 = v6;
  objc_msgSend(v13, "bs_filter:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __86__DNDSCalendarEventLifetimeMonitor__eventForCalendarEventLifetime_assertionStartDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeTimerFireDate, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

void __63__DNDSCalendarEventLifetimeMonitor__eventStoreCreatingIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109378;
  v2[1] = 0;
  v3 = 2114;
  v4 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Requested access to events, granted=%{BOOL}d error=%{public}@", (uint8_t *)v2, 0x12u);
}

@end
