@implementation DAStoreSyncStatusUpdater

+ (void)syncStartedForStoreWithExternalID:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateStatusForStoreWithExternalID:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v5, v6, 0, 0, 0);

}

+ (void)syncEndedForStoreWithExternalID:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_mappedAccountErrorFromError:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "_isCanceledError:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateStatusForStoreWithExternalID:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v7, 0, v9, v10, v8);

}

+ (void)resetSyncStatusIfNecessaryForStoresOfType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((DAStoreSyncStatusUpdaterAlreadyResetStatus & 1) == 0)
  {
    DAStoreSyncStatusUpdaterAlreadyResetStatus = 1;
    objc_msgSend(a1, "_eventStore");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = *MEMORY[0x1E0CAA1C8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v11, "isSyncing"))
          {
            if (((1 << objc_msgSend(v11, "sourceType")) & a3) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v9, 1, 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_updateStatusForSource:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v11, 0, v13, v12, 0);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
}

+ (id)_eventStorePurger
{
  if (_eventStorePurger_onceToken != -1)
    dispatch_once(&_eventStorePurger_onceToken, &__block_literal_global_7);
  return (id)_eventStorePurger_eventStorePurger;
}

uint64_t __45__DAStoreSyncStatusUpdater__eventStorePurger__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CAA170]);
  v1 = (void *)_eventStorePurger_eventStorePurger;
  _eventStorePurger_eventStorePurger = (uint64_t)v0;

  objc_msgSend((id)_eventStorePurger_eventStorePurger, "setTimeout:", 30.0);
  objc_msgSend((id)_eventStorePurger_eventStorePurger, "setPurgingAllowed:", 1);
  return objc_msgSend((id)_eventStorePurger_eventStorePurger, "setCreationBlock:", &__block_literal_global_5);
}

id __45__DAStoreSyncStatusUpdater__eventStorePurger__block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 128);
}

+ (id)_eventStore
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_eventStorePurger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acquireCachedEventStoreOrCreate:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_updateStatusForSource:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v7 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0D1C448];
  v18 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v16, v18))
  {
    objc_msgSend(v12, "sourceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v35 = v19;
    v36 = 2114;
    v37 = v13;
    v38 = 2114;
    v39 = v14;
    v40 = 2114;
    v41 = v20;
    v42 = 2112;
    v43 = v15;
    _os_log_impl(&dword_1B51E4000, v16, v18, "Saving sync status for source with identifier %{public}@: lastSyncStartDate = %{public}@, lastSyncEndDate = %{public}@, canceled=%{public}@ lastSyncError = %@", buf, 0x34u);

    v17 = MEMORY[0x1E0D1C448];
  }

  if (v7
    && (objc_msgSend(v12, "lastSyncEndDate"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, !v21))
  {
    DALoggingwithCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, v18))
    {
      objc_msgSend(v12, "sourceIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v25;
      _os_log_impl(&dword_1B51E4000, v24, v18, "Initial sync canceled. Clearing start date for source with identifier %{public}@", buf, 0xCu);

    }
    objc_msgSend(v12, "setLastSyncStartDate:", 0);
  }
  else
  {
    if (v13)
      objc_msgSend(v12, "setLastSyncStartDate:", v13);
    if (v14)
      objc_msgSend(v12, "setLastSyncEndDate:", v14);
    if (v15)
    {
      v33 = 0;
      v22 = objc_msgSend(a1, "_codeForLastSyncError:userInfo:", v15, &v33);
      v23 = v33;
      objc_msgSend(v12, "setLastSyncError:userInfo:", v22, v23);

    }
  }
  objc_msgSend(v12, "eventStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v27 = objc_msgSend(v26, "saveSource:commit:error:", v12, 1, &v32);
  v28 = v32;

  if ((v27 & 1) == 0)
  {
    DALoggingwithCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_BYTE *)(v17 + 3);
    if (os_log_type_enabled(v29, v30))
    {
      objc_msgSend(v12, "sourceIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_1B51E4000, v29, v30, "Failed to save source sync status with source identifier %@. Error = %@", buf, 0x16u);

    }
  }

}

+ (unint64_t)_codeForLastSyncError:(id)a3 userInfo:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0CAA1C8];

  if (v6 == v7)
  {
    v8 = objc_msgSend(v5, "code");
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      v11 = (id)objc_msgSend(v9, "count");
      if (v11)
        v11 = objc_retainAutorelease(v10);
    }
    else
    {
      v11 = 0;
    }
    *a4 = v11;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (void)_updateStatusForStoreWithExternalID:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v7 = a7;
  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    objc_msgSend(a1, "_eventStore");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject sourceWithExternalID:](v16, "sourceWithExternalID:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v18, v19))
    {
      v23 = 138412546;
      v24 = v15;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1B51E4000, v18, v19, "Updating sync status (%@) for source with externalID %{public}@", (uint8_t *)&v23, 0x16u);
    }

    if (v17)
    {
      objc_msgSend(a1, "_updateStatusForSource:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v17, v13, v14, v15, v7);
    }
    else
    {
      DALoggingwithCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
      if (os_log_type_enabled(v21, v22))
      {
        v23 = 138543618;
        v24 = v12;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_1B51E4000, v21, v22, "Tried to update status for store, but could not get a corresponding EKSource for externalID %{public}@. lastSyncError is %@", (uint8_t *)&v23, 0x16u);
      }

    }
  }
  else
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v16, v20))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B51E4000, v16, v20, "Tried to update status for store with nil externalID", (uint8_t *)&v23, 2u);
    }
  }

}

+ (void)syncStartedForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateStatusForCalendarWithExternalID:sourceExternalID:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v8, v7, v9, 0, 0, 0);

}

+ (void)syncEndedForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_mappedAccountErrorFromError:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "_isCanceledError:", v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateStatusForCalendarWithExternalID:sourceExternalID:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v10, v9, 0, v12, v13, v11);

}

+ (void)syncStartedForCalendar:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateStatusForCalendar:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v5, v6, 0, 0, 0);

}

+ (void)syncEndedForCalendar:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_mappedAccountErrorFromError:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "_isCanceledError:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateStatusForCalendar:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v7, 0, v9, v10, v8);

}

+ (void)_updateStatusForCalendarWithExternalID:(id)a3 sourceExternalID:(id)a4 lastSyncStartDate:(id)a5 lastSyncEndDate:(id)a6 lastSyncError:(id)a7 canceled:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  os_log_type_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v8 = a8;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v14)
  {
    v27 = v8;
    v28 = v16;
    objc_msgSend(a1, "_eventStore");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject sourceWithExternalID:](v19, "sourceWithExternalID:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "calendarWithExternalIdentifier:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v18;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_1B51E4000, v22, v23, "Updating sync status (%@) for calendar with externalID %@", buf, 0x16u);
    }

    if (v21)
    {
      v16 = v28;
      objc_msgSend(a1, "_updateStatusForCalendar:lastSyncStartDate:lastSyncEndDate:lastSyncError:canceled:", v21, v28, v17, v18, v27);
    }
    else
    {
      DALoggingwithCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412802;
        v30 = v14;
        v31 = 2112;
        v32 = v15;
        v33 = 2112;
        v34 = v18;
        _os_log_impl(&dword_1B51E4000, v25, v26, "Tried to update status for calendar, but could not get a corresponding EKCalendar for externalID %@ in source with external ID %@. lastSyncError is %@", buf, 0x20u);
      }

      v16 = v28;
    }

  }
  else
  {
    DALoggingwithCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    v24 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v19, v24))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B51E4000, v19, v24, "Tried to update status for calendar with nil externalID", buf, 2u);
    }
  }

}

+ (void)_updateStatusForCalendar:(id)a3 lastSyncStartDate:(id)a4 lastSyncEndDate:(id)a5 lastSyncError:(id)a6 canceled:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v7 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0D1C448];
  v18 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v16, v18))
  {
    objc_msgSend(v12, "externalID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v35 = v19;
    v36 = 2114;
    v37 = v13;
    v38 = 2114;
    v39 = v14;
    v40 = 2114;
    v41 = v20;
    v42 = 2112;
    v43 = v15;
    _os_log_impl(&dword_1B51E4000, v16, v18, "Saving sync status for calendar with external identifier %@: lastSyncStartDate = %{public}@, lastSyncEndDate = %{public}@, canceled=%{public}@ lastSyncError = %@", buf, 0x34u);

    v17 = MEMORY[0x1E0D1C448];
  }

  if (v7
    && (objc_msgSend(v12, "lastSyncEndDate"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, !v21))
  {
    DALoggingwithCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, v18))
    {
      objc_msgSend(v12, "externalID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v25;
      _os_log_impl(&dword_1B51E4000, v24, v18, "Initial sync canceled. Clearing start date for calendar with external identifier %@", buf, 0xCu);

    }
    objc_msgSend(v12, "setLastSyncStartDate:", 0);
  }
  else
  {
    if (v13)
      objc_msgSend(v12, "setLastSyncStartDate:", v13);
    if (v14)
      objc_msgSend(v12, "setLastSyncEndDate:", v14);
    if (v15)
    {
      v33 = 0;
      v22 = objc_msgSend(a1, "_codeForLastSyncError:userInfo:", v15, &v33);
      v23 = v33;
      objc_msgSend(v12, "setLastSyncError:userInfo:", v22, v23);

    }
  }
  objc_msgSend(v12, "eventStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v27 = objc_msgSend(v26, "saveCalendar:commit:error:", v12, 1, &v32);
  v28 = v32;

  if ((v27 & 1) == 0)
  {
    DALoggingwithCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_BYTE *)(v17 + 3);
    if (os_log_type_enabled(v29, v30))
    {
      objc_msgSend(v12, "externalID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_1B51E4000, v29, v30, "Failed to save calendar sync status with calendar external ID %@. Error = %@", buf, 0x16u);

    }
  }

}

+ (id)_mappedAccountErrorFromError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "cal_serializableError");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(a1, "_accountErrorCodeForNSError:", v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAA1C8], v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)_accountErrorCodeForNSError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D157F0]);

    if (v7)
    {
      v8 = objc_msgSend(a1, "_ekAccountErrorFromCoreDAVErrorCode:", objc_msgSend(v5, "code"));
LABEL_19:
      v9 = v8;
      goto LABEL_20;
    }
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D1C3B8]);

    if (v11)
    {
      v8 = objc_msgSend(a1, "_ekAccountErrorFromDAErrorCode:", objc_msgSend(v5, "code"));
      goto LABEL_19;
    }
    objc_msgSend(v5, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("DAAccountValidationDomain"));

    if (v13)
    {
      v8 = objc_msgSend(a1, "_ekAccountErrorFromDAValidationErrorCode:", objc_msgSend(v5, "code"));
      goto LABEL_19;
    }
    if ((objc_msgSend(v5, "cal_isCertificateError") & 1) == 0)
    {
      objc_msgSend(v5, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D15810]);

      if (v15)
      {
        v8 = objc_msgSend(a1, "_ekAccountErrorFromCoreDAVHTTPStatusCode:", objc_msgSend(v5, "code"));
      }
      else
      {
        objc_msgSend(v5, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

        if (v17)
        {
          v8 = objc_msgSend(a1, "_ekAccountErrorFromURLError:", v5);
        }
        else
        {
          objc_msgSend(v5, "domain");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1C9B0]))
          {

          }
          else
          {
            objc_msgSend(v5, "domain");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D1C9A8]);

            if (!v20)
            {
              v9 = 1;
              goto LABEL_20;
            }
          }
          v8 = objc_msgSend(a1, "_ekAccountErrorFromSubCalErrorCode:", objc_msgSend(v5, "code"));
        }
      }
      goto LABEL_19;
    }
    v9 = 6;
  }
  else
  {
    v9 = 0;
  }
LABEL_20:

  return v9;
}

+ (unint64_t)_ekAccountErrorFromCoreDAVErrorCode:(int)a3
{
  if (a3 > 5)
    return 1;
  else
    return qword_1B5223FD8[a3];
}

+ (unint64_t)_ekAccountErrorFromDAErrorCode:(int64_t)a3
{
  unint64_t result;
  char v4;
  char v5;

  result = 5;
  v4 = a3 + 2;
  if ((unint64_t)(a3 + 2) <= 0x37)
  {
    if (((1 << v4) & 0x80000800040888) != 0)
      return result;
    if (((1 << v4) & 0x4003) != 0)
      return 0;
    if (!a3)
      return 3;
  }
  v5 = a3 - 63;
  if ((unint64_t)(a3 - 63) > 0x34)
    return 1;
  if (((1 << v5) & 0x11800000020000) == 0)
  {
    if (((1 << v5) & 0x21) != 0)
      return 2;
    if (a3 == 92)
      return 8;
    return 1;
  }
  return result;
}

+ (unint64_t)_ekAccountErrorFromDAValidationErrorCode:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 1;
  else
    return qword_1B5224008[a3 - 101];
}

+ (unint64_t)_ekAccountErrorFromCoreDAVHTTPStatusCode:(int64_t)a3
{
  unint64_t v3;

  v3 = 5;
  if (a3 == 401)
    v3 = 2;
  if (a3 >= 400)
    return v3;
  else
    return 0;
}

+ (unint64_t)_ekAccountErrorFromSubCalErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return 0;
  else
    return qword_1B5224020[a3];
}

+ (unint64_t)_ekAccountErrorFromURLError:(id)a3
{
  if (objc_msgSend(a3, "code") == -999)
    return 0;
  else
    return 3;
}

+ (BOOL)_isCanceledError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D157F0]))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 1)
        goto LABEL_28;
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1C3B8]))
    {
      if (objc_msgSend(v4, "code") == -1)
      {
        LOBYTE(v6) = 1;
        goto LABEL_27;
      }
      v8 = objc_msgSend(v4, "code");

      if (v8 == -2)
        goto LABEL_18;
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("DAAccountValidationDomain")))
    {
      v10 = objc_msgSend(v4, "code");

      if (v10 == 103)
        goto LABEL_18;
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      v12 = objc_msgSend(v4, "code");

      if (v12 == -999)
      {
LABEL_18:
        LOBYTE(v6) = 1;
        goto LABEL_28;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1C9B0]) & 1) != 0)
    {
      LOBYTE(v6) = objc_msgSend(v4, "code") == 2;
    }
    else
    {
      objc_msgSend(v4, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D1C9A8]))
        LOBYTE(v6) = objc_msgSend(v4, "code") == 2;
      else
        LOBYTE(v6) = 0;

    }
LABEL_27:

    goto LABEL_28;
  }
  LOBYTE(v6) = 0;
LABEL_28:

  return v6;
}

@end
