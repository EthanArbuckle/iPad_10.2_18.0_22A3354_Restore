@implementation DNDSScheduleLifetimeMonitor

- (void)setDelegate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSScheduleLifetimeMonitor;
  -[DNDSBaseLifetimeMonitor setDelegate:](&v8, sel_setDelegate_, v4);
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__DNDSScheduleLifetimeMonitor_setDelegate___block_invoke;
    v5[3] = &unk_1E86A5F98;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "lifetimeMonitor:registerTimerHandlerWithServiceIdentifier:handler:", self, CFSTR("com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer"), v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __43__DNDSScheduleLifetimeMonitor_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  if (objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer")))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "refreshMonitorForDate:", v3);

  }
}

- (id)activeDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5
{
  return -[DNDSScheduleLifetimeMonitor _activeDateIntervalForScheduleLifetime:assertion:date:ignoreMatchScheduleStartDate:](self, "_activeDateIntervalForScheduleLifetime:assertion:date:ignoreMatchScheduleStartDate:", a3, a4, a5, 1);
}

- (id)nextActiveDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5
{
  return -[DNDSScheduleLifetimeMonitor _activeDateIntervalForScheduleLifetime:assertion:date:ignoreMatchScheduleStartDate:](self, "_activeDateIntervalForScheduleLifetime:assertion:date:ignoreMatchScheduleStartDate:", a3, a4, a5, 0);
}

- (id)_activeDateIntervalForScheduleLifetime:(id)a3 assertion:(id)a4 date:(id)a5 ignoreMatchScheduleStartDate:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSCalendar *calendar;
  NSCalendar *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSCalendar *v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  DNDSScheduleLifetimeMonitor *v33;
  _BOOL8 v34;
  id v35;
  uint64_t v36;
  BOOL v37;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  NSCalendar *v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[3];

  v6 = a6;
  v53[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "details");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "modeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSBaseLifetimeMonitor dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scheduleSettingsByModeIdentifierForScheduleLifetimeMonitor:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D1D4C8]))
  {
    v17 = (id)*MEMORY[0x1E0D1D3C0];

    v14 = v17;
  }
  objc_msgSend(v11, "startDate");
  v44 = objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  if (calendar)
  {
    v19 = calendar;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v19 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  }
  v43 = v19;
  v41 = v14;
  objc_msgSend(v16, "objectForKeyedSubscript:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    +[DNDSScheduleSettings defaultScheduleSettings](DNDSScheduleSettings, "defaultScheduleSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  v40 = v16;
  v42 = v11;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v22;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v24 = 0;
  if (v47)
  {
    v46 = *(_QWORD *)v49;
    v26 = v43;
    v25 = (void *)v44;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(obj);
        -[DNDSScheduleLifetimeMonitor _activeDateIntervalForScheduleLifetime:assertionStartDate:date:scheduleSettings:calendar:ignoreMatchScheduleStartDate:](self, "_activeDateIntervalForScheduleLifetime:assertionStartDate:date:scheduleSettings:calendar:ignoreMatchScheduleStartDate:", v10, v25, v12, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v26, v6, v40);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (!v24)
          goto LABEL_18;
        if (v28)
        {
          objc_msgSend(v28, "endDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "endDate");
          v31 = v12;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = self;
          v34 = v6;
          v35 = v10;
          v36 = objc_msgSend(v30, "compare:", v32);

          v12 = v31;
          v26 = v43;

          v37 = v36 == -1;
          v10 = v35;
          v6 = v34;
          self = v33;
          v25 = (void *)v44;
          if (v37)
          {
LABEL_18:
            v38 = v29;

            v24 = v38;
          }
        }

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v47);
  }
  else
  {
    v26 = v43;
    v25 = (void *)v44;
  }

  return v24;
}

- (id)_activeDateIntervalForScheduleLifetime:(id)a3 assertionStartDate:(id)a4 date:(id)a5 scheduleSettings:(id)a6 calendar:(id)a7 ignoreMatchScheduleStartDate:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  id v23;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(a3, "behavior");
  if (v17 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3588], "dnds_dateIntervalUntilEndOfScheduleForScheduleSettings:startDate:calendar:", v15, v13, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v23, "initWithStartDate:endDate:", v13, v19);
      goto LABEL_9;
    }
  }
  else
  {
    if (v17)
    {
      v18 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3588], "dnds_dateIntervalForScheduleSettings:date:calendar:", v15, v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a8)
    {
      objc_msgSend(v15, "creationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "compare:", v13) != -1)
      {
LABEL_9:

        goto LABEL_11;
      }
      v20 = objc_msgSend(v18, "containsDate:", v13);

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0CB3588];
        objc_msgSend(v18, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dnds_dateIntervalForScheduleSettings:date:calendar:", v15, v19, v16);
        v22 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v22;
        goto LABEL_9;
      }
    }
  }
LABEL_11:

  return v18;
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
  void *v9;
  NSCalendar *calendar;
  NSCalendar *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  id *p_lifetimeTimerFireDate;
  int v59;
  void *v60;
  NSObject *v61;
  id v62;
  DNDSXPCTimer *v63;
  id v64;
  char v65;
  NSObject *v66;
  DNDSXPCTimer *v67;
  DNDSLifetimeMonitorResult *v68;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  NSCalendar *v84;
  id v85;
  DNDSScheduleLifetimeMonitor *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  void *v100;
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  id v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v85 = a4;
  v86 = self;
  -[DNDSBaseLifetimeMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = DNDSLogScheduleLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v104 = v85;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Refreshing monitor, date=%{public}@", buf, 0xCu);
  }
  -[DNDSBaseLifetimeMonitor dataSource](v86, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  calendar = v86->_calendar;
  if (calendar)
  {
    v11 = calendar;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v11 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  }
  v84 = v11;
  v70 = v9;
  objc_msgSend(v9, "scheduleSettingsByModeIdentifierForScheduleLifetimeMonitor:", v86);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v96 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_msgSend(v17, "details");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "modeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v80, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "BOOLValue");

        objc_msgSend(v17, "details");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lifetime");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0CB37E8];
        v25 = (v21 & 1) != 0 || objc_msgSend(v23, "behavior") == 1;
        objc_msgSend(v24, "numberWithInt:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setObject:forKey:", v26, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v12;
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
  if (v77)
  {
    v75 = *(_QWORD *)v92;
    v74 = *MEMORY[0x1E0D1D4C8];
    v72 = (void *)*MEMORY[0x1E0D1D3C0];
    do
    {
      for (j = 0; j != v77; ++j)
      {
        if (*(_QWORD *)v92 != v75)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
        objc_msgSend(v28, "details");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "modeIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v30, "isEqualToString:", v74))
        {
          v31 = v72;

          v30 = v31;
        }
        objc_msgSend(v76, "objectForKeyedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v34 = v32;
        }
        else
        {
          +[DNDSScheduleSettings defaultScheduleSettings](DNDSScheduleSettings, "defaultScheduleSettings");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
          v34 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v28, "details");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "lifetime");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v80, "objectForKeyedSubscript:", v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "BOOLValue");

        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v40 = v34;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
        if (!v41)
        {
          v55 = v40;
LABEL_48:

          goto LABEL_50;
        }
        v42 = v41;
        v78 = v30;
        v79 = j;
        v82 = 0;
        v43 = *(_QWORD *)v88;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v88 != v43)
              objc_enumerationMutation(v40);
            v45 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v44);
            objc_msgSend(v28, "startDate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSScheduleLifetimeMonitor _activeDateIntervalForScheduleLifetime:assertionStartDate:date:scheduleSettings:calendar:ignoreMatchScheduleStartDate:](v86, "_activeDateIntervalForScheduleLifetime:assertionStartDate:date:scheduleSettings:calendar:ignoreMatchScheduleStartDate:", v37, v46, v85, v45, v84, v39);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              v48 = objc_msgSend(v47, "dnds_lifetimePhaseForDate:", v85);
              if (v48 == 2)
              {
                if (objc_msgSend(v37, "behavior") == 1)
                {
                  objc_msgSend(v28, "UUID");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "addObject:", v53);

                }
              }
              else
              {
                if (v48 == 1)
                {
                  objc_msgSend(v47, "endDate");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "earlierDate:", v52);
                  v50 = objc_claimAutoreleasedReturnValue();

                  v82 = 1;
                }
                else
                {
                  if (v48)
                    goto LABEL_40;
                  objc_msgSend(v47, "startDate");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "earlierDate:", v49);
                  v50 = objc_claimAutoreleasedReturnValue();

                }
                v83 = (void *)v50;
              }
            }
            else
            {
              v51 = DNDSLogScheduleLifetimeMonitor;
              if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v104 = v37;
                _os_log_impl(&dword_1CB895000, v51, OS_LOG_TYPE_DEFAULT, "Skipping inactive lifetime, lifetime=%{public}@", buf, 0xCu);
              }
            }
LABEL_40:

            ++v44;
          }
          while (v42 != v44);
          v54 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
          v42 = v54;
        }
        while (v54);

        if ((v82 & 1) != 0)
        {
          objc_msgSend(v28, "UUID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v55);
          v30 = v78;
          j = v79;
          goto LABEL_48;
        }
        v30 = v78;
        j = v79;
LABEL_50:

      }
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    }
    while (v77);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v83, "isEqualToDate:", v56);

  p_lifetimeTimerFireDate = (id *)&v86->_lifetimeTimerFireDate;
  v59 = objc_msgSend(v83, "isEqualToDate:", v86->_lifetimeTimerFireDate);
  -[DNDSBaseLifetimeMonitor delegate](v86, "delegate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v57 & 1) != 0 || !v59)
  {
    v61 = DNDSLogScheduleLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v62 = *p_lifetimeTimerFireDate;
      *(_DWORD *)buf = 138543362;
      v104 = v62;
      _os_log_impl(&dword_1CB895000, v61, OS_LOG_TYPE_DEFAULT, "Invalidating existing timer; fireDate=%{public}@",
        buf,
        0xCu);
    }
    v63 = -[DNDSXPCTimer initWithFireDate:serviceIdentifier:userVisible:]([DNDSXPCTimer alloc], "initWithFireDate:serviceIdentifier:userVisible:", 0, CFSTR("com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer"), 1);
    objc_msgSend(v60, "lifetimeMonitor:setTimer:", v86, v63);

    v64 = *p_lifetimeTimerFireDate;
    *p_lifetimeTimerFireDate = 0;

  }
  if ((v57 & 1) == 0)
  {
    v65 = *p_lifetimeTimerFireDate ? v59 : 0;
    if ((v65 & 1) == 0)
    {
      v66 = DNDSLogScheduleLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogScheduleLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v104 = v83;
        _os_log_impl(&dword_1CB895000, v66, OS_LOG_TYPE_DEFAULT, "Scheduling timer; nextUpdateDate=%{public}@",
          buf,
          0xCu);
      }
      v67 = -[DNDSXPCTimer initWithFireDate:serviceIdentifier:userVisible:]([DNDSXPCTimer alloc], "initWithFireDate:serviceIdentifier:userVisible:", v83, CFSTR("com.apple.donotdisturb.server.ScheduleLifetimeMonitor.timer"), 1);
      objc_msgSend(v60, "lifetimeMonitor:setTimer:", v86, v67);

      objc_storeStrong(p_lifetimeTimerFireDate, v83);
    }
  }
  v68 = -[DNDSLifetimeMonitorResult initWithActiveUUIDs:expiredUUIDs:]([DNDSLifetimeMonitorResult alloc], "initWithActiveUUIDs:expiredUUIDs:", v71, v81);

  return v68;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_lifetimeTimerFireDate, 0);
}

@end
