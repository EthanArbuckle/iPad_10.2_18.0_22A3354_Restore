@implementation CalStoreSetupAndTeardownUtils

+ (void)_cleanKeepAwayFromServerCalsInStore:(void *)a3
{
  NSObject *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  void *ValueAtIndex;
  const __CFString *v11;
  void *v12;
  uint64_t UID;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5CCB000, v4, OS_LOG_TYPE_INFO, "Cleaning out keep away from server calendars", buf, 2u);
  }
  v5 = CalStoreCopyCalendars((uint64_t)a3);
  if (v5)
  {
    v6 = v5;
    Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      v8 = Count;
      for (i = 0; i != v8; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v6, i);
        v11 = (const __CFString *)CalCalendarCopyType((uint64_t)ValueAtIndex);
        if (CalCalendarIsSubscribed((uint64_t)ValueAtIndex)
          || CalCalendarIsInbox((uint64_t)ValueAtIndex)
          || CalCalendarIsNotificationsCollection((uint64_t)ValueAtIndex)
          || CalCalendarGetSharingStatus((uint64_t)ValueAtIndex) == 3
          || v11
          && (CFStringCompare(v11, CFSTR("caldav"), 0) == kCFCompareEqualTo
           || CFStringCompare(v11, CFSTR("urlsubscribe"), 0) == kCFCompareEqualTo)
          || CalCalendarGetSharingStatus((uint64_t)ValueAtIndex) == 2
          || CalCalendarIsReadOnly((uint64_t)ValueAtIndex))
        {
          v12 = (void *)CalCalendarCopyTitle((uint64_t)ValueAtIndex);
          UID = CalCalendarGetUID();
          v14 = (void *)CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            v15 = (void *)MEMORY[0x1E0CB37E8];
            v16 = v14;
            objc_msgSend(v15, "numberWithInt:", UID);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v19 = v12;
            v20 = 2112;
            v21 = v17;
            _os_log_impl(&dword_1A5CCB000, v16, OS_LOG_TYPE_INFO, "Dropping calendar \"%@\" (%@) from merge since we don't want it going up to the server", buf, 0x16u);

          }
          CalRemoveCalendar(ValueAtIndex);

        }
        if (v11)
          CFRelease(v11);
      }
    }
    CFRelease(v6);
  }
}

+ (BOOL)_mergeEntityType:(int)a3 fromStore:(void *)a4 toStore:(void *)a5 inDatabase:(CalDatabase *)a6
{
  uint64_t v8;
  uint64_t CountOfCalendarItemsInStore;
  uint64_t v12;
  _BOOL4 v13;
  _BOOL8 v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  _QWORD v26[6];
  _QWORD v27[7];

  v8 = (uint64_t)a4;
  v27[6] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    CountOfCalendarItemsInStore = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, (uint64_t)a4);
    if (a5)
      v12 = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, (uint64_t)a5);
    else
      v12 = 0;
    if (a3 == 2)
      objc_msgSend(a1, "_cleanKeepAwayFromServerCalsInStore:", v8);
    v13 = CalDatabaseMigrateCalendarsWithEntityType((os_unfair_lock_s *)a6, a3, v8, (uint64_t)a5);
    v14 = !v13;
    v8 = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, v8);
    if (a5)
      goto LABEL_10;
LABEL_5:
    v15 = 0;
    goto LABEL_11;
  }
  v13 = 0;
  CountOfCalendarItemsInStore = 0;
  v14 = 0;
  v12 = 0;
  if (!a5)
    goto LABEL_5;
LABEL_10:
  v15 = CalDatabaseGetCountOfCalendarItemsInStore(a6, a3, (uint64_t)a5);
LABEL_11:
  v16 = (_DWORD)CountOfCalendarItemsInStore != (_DWORD)v15 - (_DWORD)v12;
  v26[0] = CFSTR("PreMergeSourceCalendarItemCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CountOfCalendarItemsInStore);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v26[1] = CFSTR("PreMergeDestiniationCalendarItemCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  v26[2] = CFSTR("PostMergeSourceCalendarItemCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("PostMergeDestinationCalendarItemCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v20;
  v26[4] = CFSTR("ErrorCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  v26[5] = CFSTR("CountMismatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  CalAnalyticsSendEvent();
  if (v13)
    v24 = CalDatabaseSave((uint64_t)a6);
  else
    v24 = 0;

  return v24;
}

+ (BOOL)setUpCalStoreForParentAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  const void *Store;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "calSyncingAccountUsingChildAccounts:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const void *)objc_msgSend(a1, "_copyStoreWithExternalIdentifier:inDatabase:", v11, a5);

    if (v12)
    {
      v13 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1A5CCB000, v13, OS_LOG_TYPE_INFO, "Found existing Cal store. Updating...", (uint8_t *)&v38, 2u);
      }
      CalStoreSetAllowsEvents((uint64_t)v12, 1);
      goto LABEL_20;
    }
    Store = CalDatabaseCreateStore((os_unfair_lock_s *)a5);
    v15 = CDBLogHandle;
    if (Store)
    {
      v12 = Store;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        v16 = v15;
        objc_msgSend(v10, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543362;
        v39 = v17;
        _os_log_impl(&dword_1A5CCB000, v16, OS_LOG_TYPE_INFO, "Creating new Cal store with External ID: %{public}@", (uint8_t *)&v38, 0xCu);

      }
      objc_msgSend(v10, "accountType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0C8F058]);

      if (v20)
      {
        v21 = (uint64_t)v12;
        goto LABEL_18;
      }
      objc_msgSend(v10, "accountType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0C8F080]))
      {

      }
      else
      {
        objc_msgSend(v10, "accountType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0C8F0B8]);

        if (!v27)
        {
          objc_msgSend(v10, "accountType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0C8F140]);

          if (!v34)
          {
            v35 = (void *)CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              v36 = v35;
              objc_msgSend(v8, "accountType");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = 138543362;
              v39 = v37;
              _os_log_impl(&dword_1A5CCB000, v36, OS_LOG_TYPE_ERROR, "Don't know what CalStoreType to set for ACAccountType %{public}@", (uint8_t *)&v38, 0xCu);

            }
            goto LABEL_19;
          }
          v21 = (uint64_t)v12;
LABEL_18:
          CalStoreSetType(v21);
LABEL_19:
          objc_msgSend(v10, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          CalStoreSetExternalID((uint64_t)v12);

          objc_msgSend(v10, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          CalStoreSetUUID((uint64_t)v12, (uint64_t)v29);

          CalStoreSetAllowsEvents((uint64_t)v12, 1);
          objc_msgSend(v8, "accountDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          CalStoreSetName((uint64_t)v12);

LABEL_20:
          CFRelease(v12);
          v22 = CalDatabaseSave((uint64_t)a5);
          goto LABEL_21;
        }
      }
      v21 = (uint64_t)v12;
      goto LABEL_18;
    }
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1A5CCB000, v15, OS_LOG_TYPE_ERROR, "No new Cal store: CalDatabaseCreateStore failed.", (uint8_t *)&v38, 2u);
    }
  }
  v22 = 0;
LABEL_21:

  return v22;
}

+ (id)_calDAVInfoStringForTitle:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-CalDAVInfo"), a3);
}

+ (BOOL)_clearAllEventsFromStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  char v4;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  void *ValueAtIndex;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v4 = 0;
  v19 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v7 = CalStoreCopyCalendars((uint64_t)a3);
    if (v7)
    {
      v8 = v7;
      Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        v10 = Count;
        for (i = 0; i != v10; ++i)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, i);
          v13 = (void *)CalCalendarCopyTitle((uint64_t)ValueAtIndex);
          objc_msgSend(a1, "_calDAVInfoStringForTitle:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          CalDatabaseSetProperty((os_unfair_lock_s *)a4);
          v15 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v13;
            _os_log_impl(&dword_1A5CCB000, v15, OS_LOG_TYPE_INFO, "Removing calendar with name: %@", buf, 0xCu);
          }
          CalRemoveCalendar(ValueAtIndex);

        }
      }
      v4 = CalDatabaseSave((uint64_t)a4);
      CFRelease(v8);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)clearAllEventsFromStoreForParentAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5
{
  id v8;
  uint64_t v9;
  const void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(a1, "copyStoreForAccount:withChildren:inDatabase:", v8, a4, a5);
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = objc_msgSend(a1, "_clearAllEventsFromStore:inDatabase:", v9, a5);
    CFRelease(v10);
  }
  else
  {
    v12 = (void *)CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_1A5CCB000, v13, OS_LOG_TYPE_ERROR, "Could not clear events from store for account with identifier %{public}@ because no store was found.", (uint8_t *)&v16, 0xCu);

    }
    v11 = 0;
  }

  return v11;
}

+ (BOOL)drainLocalStoreInDatabase:(CalDatabase *)a3
{
  const void *v5;
  const void *v6;
  char v7;

  if (!a3)
    return 0;
  v5 = CalDatabaseCopyLocalStore((uint64_t)a3);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = objc_msgSend(a1, "_clearAllEventsFromStore:inDatabase:", v5, a3);
  CFRelease(v6);
  return v7;
}

+ (void)copyStoreForAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "calSyncingAccountUsingChildAccounts:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(a1, "_copyStoreWithExternalIdentifier:inDatabase:", v9, a5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)_copyStoreWithExternalIdentifier:(id)a3 inDatabase:(CalDatabase *)a4
{
  if (a4)
    return (void *)CalDatabaseCopyStoreWithExternalID((os_unfair_lock_s *)a4, (const __CFString *)a3);
  else
    return 0;
}

+ (BOOL)isLocalStoreEnabledInDatabase:(CalDatabase *)a3
{
  const void *v3;
  const void *v4;
  BOOL v5;

  if (!a3)
    return 0;
  v3 = CalDatabaseCopyLocalStore((uint64_t)a3);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CalStoreAllowsEvents((uint64_t)v3);
  CFRelease(v4);
  return v5;
}

+ (BOOL)isLocalStoreEmptyInDatabase:(CalDatabase *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!CalStoreGetType(v9)
          && CalStoreAllowsEvents(v9)
          && CalDatabaseGetCountOfEventsInStore(a3, v9))
        {
          v10 = 0;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_15:

  return v10;
}

+ (BOOL)isStoreEmptyForAccount:(id)a3 inDatabase:(CalDatabase *)a4
{
  id v6;
  void *v7;
  const void *v8;

  v6 = a3;
  objc_msgSend(v6, "childAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const void *)objc_msgSend(a1, "copyStoreForAccount:withChildren:inDatabase:", v6, v7, a4);

  if (v8)
  {
    if (a4)
      LOBYTE(a4) = CalDatabaseGetCountOfEventsInStore(a4, (uint64_t)v8) == 0;
    CFRelease(v8);
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

+ (void)setLocalStoreEnabled:(BOOL)a3 inDatabase:(CalDatabase *)a4
{
  _BOOL4 v5;
  const void *v8;
  const void *v9;
  __CFArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CFMutableArrayRef v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return;
  v5 = a3;
  if (CalDatabaseIsAuxiliaryDatabase((uint64_t)a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CalStoreSetupAndTeardownUtils.m"), 296, CFSTR("Cannot enable/disable local store in an auxiliary database"));

  }
  v8 = CalDatabaseCopyLocalStore((uint64_t)a4);
  if (v8)
  {
    v9 = v8;
    v22 = CalStoreCopyCalendars((uint64_t)v8);
    if (CalStoreAllowsEvents((uint64_t)v9) == v5)
    {
      if (!v5)
      {
        v15 = 0;
LABEL_22:
        CFRelease(v9);

        goto LABEL_23;
      }
      if (-[__CFArray count](v22, "count"))
      {
        CFRelease(v9);

        return;
      }
    }
    CalStoreSetAllowsEvents((uint64_t)v9, v5);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v22;
    v11 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          CalStoreRemoveCalendar((uint64_t)v9, *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }

    if (v5)
    {
      CalCalendarInsertInitialLocalCalendar((os_unfair_lock_s *)a4);
      CFRelease(v9);

LABEL_34:
      CalDatabaseSave((uint64_t)a4);
      return;
    }
    v15 = 1;
    goto LABEL_22;
  }
  if (v5)
    return;
  v15 = 0;
LABEL_23:
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = (id)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a4);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        if (!CalStoreGetType(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20))
          && CalStoreGetUID() != 1)
        {
          CalRemoveStore();
          v15 = 1;
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  if ((v15 & 1) != 0)
    goto LABEL_34;
}

+ (void)_enableLocalStoreIfNecessaryIgnoringAccount:(id)a3 inDatabase:(CalDatabase *)a4 accountStore:(id)a5
{
  void *v5;
  id v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  CalDatabase *v24;
  id obj;
  char v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28 = a5;
  v9 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5CCB000, v9, OS_LOG_TYPE_INFO, "Calendars DCO was asked to enable the local store if necessary.", buf, 2u);
  }
  objc_msgSend(v28, "allAccountTypes");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (!v29)
    goto LABEL_34;
  v24 = a4;
  v27 = *(_QWORD *)v38;
  v32 = *MEMORY[0x1E0C8F378];
  v26 = 1;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v38 != v27)
        objc_enumerationMutation(obj);
      objc_msgSend(v28, "accountsWithAccountType:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v13)
      {
        v14 = v13;
        v30 = i;
        v15 = *(_QWORD *)v34;
        while (2)
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            if (v8
              && (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "identifier"),
                  v5 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v8, "identifier"),
                  v9 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v5, "isEqualToString:", v9)))
            {

            }
            else
            {
              objc_msgSend(v17, "parentAccountIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18 || !objc_msgSend(v17, "isEnabledForDataclass:", v32))
                v19 = 0;
              else
                v19 = objc_msgSend(a1, "isReadOnlyAccount:", v17) ^ 1;

              if (v8)
              {

                if ((v19 & 1) != 0)
                  goto LABEL_27;
              }
              else if (v19)
              {
LABEL_27:
                v20 = (void *)CDBLogHandle;
                if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
                {
                  v21 = v20;
                  objc_msgSend(v17, "identifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v42 = v22;
                  _os_log_impl(&dword_1A5CCB000, v21, OS_LOG_TYPE_INFO, "Account with identifier %{public}@ is syncing calendars. Will not enable local store!", buf, 0xCu);

                }
                v26 = 0;
                goto LABEL_30;
              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v14)
            continue;
          break;
        }
LABEL_30:
        i = v30;
      }

    }
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  }
  while (v29);
  a4 = v24;
  if ((v26 & 1) != 0)
  {
LABEL_34:
    v23 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v23, OS_LOG_TYPE_INFO, "Enabling local store for events because we didn't find any syncing accounts", buf, 2u);
    }
    objc_msgSend(a1, "setLocalStoreEnabled:inDatabase:", 1, a4);
  }

}

+ (void)cleanupAuxDatabaseIfNeededForAccountID:(id)a3 auxDatabase:(CalDatabase *)a4 mainDatabase:(CalDatabase *)a5
{
  CFTypeRef v7;
  const void *v8;
  CFTypeRef v9;
  const __CFArray *v10;
  const __CFArray *v11;

  v7 = CalDatabaseCopyAuxDatabaseAccountForAccountID((os_unfair_lock_s *)a5);
  if (v7)
  {
    v8 = v7;
    v9 = CalAuxDatabaseAccountCopyAuxDatabase((uint64_t)v7);
    CalRemoveAuxDatabaseAccount(v8);
    CalDatabaseSave((uint64_t)a5);
    CFRelease(v8);
    if (v9)
    {
      v10 = CalAuxDatabaseCopyAccounts((uint64_t)v9);
      if (v10)
      {
        v11 = v10;
        if (!CFArrayGetCount(v10))
          CalDatabaseVacuum((uint64_t)a4);
        CFRelease(v11);
      }
      CFRelease(v9);
    }
  }
}

+ (void)removeStoreForAccount:(id)a3 withChildren:(id)a4 inDatabase:(CalDatabase *)a5 mainDatabase:(CalDatabase *)a6 accountStore:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  const void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];

  v12 = a3;
  v13 = a7;
  v14 = objc_msgSend(a1, "copyStoreForAccount:withChildren:inDatabase:", v12, a4, a5);
  v15 = (const void *)v14;
  if (a5 && v14)
  {
    v16 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1A5CCB000, v16, OS_LOG_TYPE_INFO, "Removing store because events were disabled or the account was deleted.", v18, 2u);
    }
    CalRemoveStore();
    CalDatabaseSave((uint64_t)a5);
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cleanupAuxDatabaseIfNeededForAccountID:auxDatabase:mainDatabase:", v17, a5, a6);

    goto LABEL_7;
  }
  if (v14)
LABEL_7:
    CFRelease(v15);
  objc_msgSend(a1, "_enableLocalStoreIfNecessaryIgnoringAccount:inDatabase:accountStore:", v12, a6, v13);

}

+ (void)removeStoreForDeletedAccountWithIdentifier:(id)a3 inDatabase:(CalDatabase *)a4 mainDatabase:(CalDatabase *)a5 accountStore:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  const void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v10 = a3;
  v11 = a6;
  v12 = objc_msgSend(a1, "_copyStoreForAccountWithIdentifier:inDatabase:", v10, a4);
  v13 = (const void *)v12;
  if (a4 && v12)
  {
    v14 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A5CCB000, v14, OS_LOG_TYPE_INFO, "Removing store because the account was deleted.", v15, 2u);
    }
    CalRemoveStore();
    CalDatabaseSave((uint64_t)a4);
    objc_msgSend(a1, "cleanupAuxDatabaseIfNeededForAccountID:auxDatabase:mainDatabase:", v10, a4, a5);
    goto LABEL_7;
  }
  if (v12)
LABEL_7:
    CFRelease(v13);
  objc_msgSend(a1, "_enableLocalStoreIfNecessaryIgnoringAccount:inDatabase:accountStore:", 0, a5, v11);

}

+ (BOOL)mergeEventsFromLocalStoreIntoStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  NSObject *v7;
  BOOL result;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5CCB000, v7, OS_LOG_TYPE_INFO, "Attempting to move local store events into a sync store.", buf, 2u);
  }
  result = 0;
  if (a3 && a4)
  {
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (id)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a4);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v9);
          v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (!CalStoreGetType(v16) && CalStoreAllowsEvents(v16))
          {
            if (!objc_msgSend(a1, "_mergeEntityType:fromStore:toStore:inDatabase:", 2, v16, a3, a4, (_QWORD)v17))v12 = 1;
            v13 = 1;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }

    return v13 & ((v12 & 1) == 0);
  }
  return result;
}

+ (BOOL)mergeEventsIntoLocalStoreFromStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  NSObject *v7;
  char v8;
  const void *v9;
  const void *v10;
  uint8_t v12[16];

  v7 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A5CCB000, v7, OS_LOG_TYPE_INFO, "Attempting to move sync store events into local store.", v12, 2u);
  }
  v8 = 0;
  if (a3 && a4)
  {
    v9 = CalDatabaseCopyLocalStore((uint64_t)a4);
    if (v9)
    {
      v10 = v9;
      v8 = objc_msgSend(a1, "_mergeEntityType:fromStore:toStore:inDatabase:", 2, a3, v9, a4);
      CFRelease(v10);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

+ (BOOL)isReadOnlyAccount:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F140]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F0B0]);

  return v5;
}

@end
