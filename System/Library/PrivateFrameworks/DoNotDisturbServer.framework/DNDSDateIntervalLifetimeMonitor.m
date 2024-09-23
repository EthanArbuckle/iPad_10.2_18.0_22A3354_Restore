@implementation DNDSDateIntervalLifetimeMonitor

- (void)setDelegate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSDateIntervalLifetimeMonitor;
  -[DNDSBaseLifetimeMonitor setDelegate:](&v8, sel_setDelegate_, v4);
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__DNDSDateIntervalLifetimeMonitor_setDelegate___block_invoke;
    v5[3] = &unk_1E86A5F98;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "lifetimeMonitor:registerTimerHandlerWithServiceIdentifier:handler:", self, CFSTR("com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer"), v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __47__DNDSDateIntervalLifetimeMonitor_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  if (objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer")))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "refreshMonitorForDate:", v3);

  }
}

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  id *p_lifetimeTimerFireDate;
  int v28;
  void *v29;
  NSObject *v30;
  id v31;
  DNDSXPCTimer *v32;
  id v33;
  char v34;
  NSObject *v35;
  DNDSXPCTimer *v36;
  DNDSLifetimeMonitorResult *v37;
  DNDSDateIntervalLifetimeMonitor *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DNDSBaseLifetimeMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = DNDSLogDateIntervalLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogDateIntervalLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v7;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Refreshing monitor, date=%{public}@", buf, 0xCu);
  }
  v39 = self;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v16, "details");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lifetime");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "dateInterval");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "dnds_lifetimePhaseForDate:", v7);
        if (v20 == 2)
        {
          objc_msgSend(v16, "UUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v23);
        }
        else
        {
          if (v20 == 1)
          {
            objc_msgSend(v16, "UUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v22);

            objc_msgSend(v19, "endDate");
            v21 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v20)
              goto LABEL_16;
            objc_msgSend(v19, "startDate");
            v21 = objc_claimAutoreleasedReturnValue();
          }
          v23 = (void *)v21;
          objc_msgSend(v10, "earlierDate:", v21);
          v24 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v24;
        }

LABEL_16:
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v10, "isEqualToDate:", v25);

  p_lifetimeTimerFireDate = (id *)&v39->_lifetimeTimerFireDate;
  v28 = objc_msgSend(v10, "isEqualToDate:", v39->_lifetimeTimerFireDate);
  -[DNDSBaseLifetimeMonitor delegate](v39, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v26 & 1) != 0 || !v28)
  {
    v30 = DNDSLogDateIntervalLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogDateIntervalLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *p_lifetimeTimerFireDate;
      *(_DWORD *)buf = 138543362;
      v48 = v31;
      _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_DEFAULT, "Invalidating existing timer; fireDate=%{public}@",
        buf,
        0xCu);
    }
    v32 = -[DNDSXPCTimer initWithFireDate:serviceIdentifier:userVisible:]([DNDSXPCTimer alloc], "initWithFireDate:serviceIdentifier:userVisible:", 0, CFSTR("com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer"), 1);
    objc_msgSend(v29, "lifetimeMonitor:setTimer:", v39, v32);

    v33 = *p_lifetimeTimerFireDate;
    *p_lifetimeTimerFireDate = 0;

  }
  if ((v26 & 1) == 0)
  {
    v34 = *p_lifetimeTimerFireDate ? v28 : 0;
    if ((v34 & 1) == 0)
    {
      v35 = DNDSLogDateIntervalLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogDateIntervalLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v10;
        _os_log_impl(&dword_1CB895000, v35, OS_LOG_TYPE_DEFAULT, "Scheduling timer; nextUpdateDate=%{public}@",
          buf,
          0xCu);
      }
      v36 = -[DNDSXPCTimer initWithFireDate:serviceIdentifier:userVisible:]([DNDSXPCTimer alloc], "initWithFireDate:serviceIdentifier:userVisible:", v10, CFSTR("com.apple.donotdisturb.server.DateIntervalLifetimeMonitor.timer"), 1);
      objc_msgSend(v29, "lifetimeMonitor:setTimer:", v39, v36);

      objc_storeStrong(p_lifetimeTimerFireDate, v10);
    }
  }
  v37 = -[DNDSLifetimeMonitorResult initWithActiveUUIDs:expiredUUIDs:]([DNDSLifetimeMonitorResult alloc], "initWithActiveUUIDs:expiredUUIDs:", v41, v40);

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeTimerFireDate, 0);
}

@end
