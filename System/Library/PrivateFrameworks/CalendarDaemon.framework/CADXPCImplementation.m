@implementation CADXPCImplementation

uint64_t __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("objectID"));
}

void __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  CFTypeRef cf;
  CFTypeRef v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[3];
  __int128 v34;
  const __CFString *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a3, "valueForKey:", CFSTR("entityID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "restrictedCalendarRowIDsForAction:inDatabase:", 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v9);

  v10 = CalDatabaseCopyEventOccurrenceCache();
  v11 = CalFilterCreateWithDatabaseShowingCalendarsWithUIDs();
  v12 = a1;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  cf = (CFTypeRef)v11;
  v26 = (CFTypeRef)v10;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)CalEventOccurrenceCacheCopyOccurrencesOnDay();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("occurrenceDate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("nextReminderDate"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_alloc(MEMORY[0x1E0D0BAF8]);
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("eventUID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithEntityType:entityID:databaseID:", 2, objc_msgSend(v21, "intValue"), a2);

          v34 = xmmword_1E6A38690;
          v35 = CFSTR("nextReminderDate");
          v33[0] = v18;
          v33[1] = v22;
          v33[2] = v19;
          if (v19)
            v23 = 3;
          else
            v23 = 2;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v34, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v12 + 48), "addObject:", v24);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v14);
  }

  CFRelease(cf);
  CFRelease(v26);

}

uint64_t __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("occurrenceDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("occurrenceDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __104__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  const void *v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v6 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("entityID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "restrictedCalendarRowIDsForAction:inDatabase:", 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minusSet:", v8);

  v9 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  v10 = (const void *)CalFilterCreateWithDatabaseShowingCalendarsWithUIDs();
  v11 = (void *)CalEventOccurrenceCacheCopyAllDaysAndOccurrenceCounts();
  CFRelease(v10);
  CFRelease(v9);
  if (objc_msgSend(v11, "count"))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_QWORD *)(v12 + 40))
    {
      CalEventOccurrenceCacheMergeCounts();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      v16 = v11;
      v15 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v16;
    }

  }
}

uint64_t __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

- (BOOL)accessGrantedToPerformSelector:(SEL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (accessGrantedToPerformSelector__onceToken != -1)
    dispatch_once(&accessGrantedToPerformSelector__onceToken, &__block_literal_global_5);
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)accessGrantedToPerformSelector__accessTypeBySelector, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
  {
    v8 = -[CADXPCImplementation hasAccess:](self, "hasAccess:", v7);
  }
  else
  {
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_FAULT))
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_FAULT, "Unknown selector %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasAccess:(unint64_t)a3
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  LOBYTE(a3) = -[CADXPCImplementation _hasAccess:](self, "_hasAccess:", a3);
  os_unfair_lock_unlock(p_accessLock);
  return a3;
}

- (BOOL)_hasAccess:(unint64_t)a3
{
  BOOL v3;
  unsigned int v6;
  uint64_t v7;
  unint64_t checkedAccess;

  v3 = 1;
  if ((self->_allowedAccess & a3) == 0)
  {
    v6 = 0;
    while (1)
    {
      v7 = (1 << v6);
      if ((v7 & a3) != 0)
      {
        checkedAccess = self->_checkedAccess;
        if ((checkedAccess & v7) == 0)
        {
          self->_checkedAccess = checkedAccess | v7;
          if (-[CADXPCImplementation _checkAccess:](self, "_checkAccess:", (1 << v6)))
            break;
        }
      }
      v3 = v6++ < 0xC;
      if (v6 == 13)
        return 0;
    }
    self->_allowedAccess |= v7;
  }
  return v3;
}

- (BOOL)_checkAccess:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  unint64_t v7;
  BOOL v8;
  char v9;

  -[ClientConnection permissionValidator](self->_conn, "permissionValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "testingAccessLevelGranted") & 1) != 0)
  {
    v6 = 1;
    goto LABEL_28;
  }
  if ((uint64_t)a3 > 127)
  {
    if ((uint64_t)a3 > 1023)
    {
      switch(a3)
      {
        case 0x400uLL:
          v9 = objc_msgSend(v5, "testingAccessLevelGranted");
          goto LABEL_27;
        case 0x800uLL:
          v8 = objc_msgSend(v5, "eventAccessLevel") == 1;
LABEL_30:
          v6 = v8;
          goto LABEL_28;
        case 0x1000uLL:
          v9 = objc_msgSend(v5, "isRemoteUIExtension");
          goto LABEL_27;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x80uLL:
          v9 = objc_msgSend(v5, "internalAccessLevelGranted");
          goto LABEL_27;
        case 0x100uLL:
          v9 = objc_msgSend(v5, "storageManagementAccessGranted");
          goto LABEL_27;
        case 0x200uLL:
          v9 = objc_msgSend(v5, "canRequestDiagnostics");
LABEL_27:
          v6 = v9;
          goto LABEL_28;
      }
    }
LABEL_33:
    v6 = 0;
    goto LABEL_28;
  }
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        v9 = objc_msgSend(v5, "hasSyncClientEntitlement");
        goto LABEL_27;
      case 0x20uLL:
        v9 = objc_msgSend(v5, "hasCalendarToolEntitlement");
        goto LABEL_27;
      case 0x40uLL:
        v9 = objc_msgSend(v5, "hasNotificationCountEntitlement");
        goto LABEL_27;
    }
    goto LABEL_33;
  }
  v7 = a3 - 1;
  v6 = 1;
  switch(v7)
  {
    case 0uLL:
      break;
    case 1uLL:
      v8 = -[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel") == 2;
      goto LABEL_30;
    case 3uLL:
      v9 = objc_msgSend(v5, "isFirstPartyCalendarApp");
      goto LABEL_27;
    case 7uLL:
      v9 = objc_msgSend(v5, "isCalendarDaemon");
      goto LABEL_27;
    default:
      goto LABEL_33;
  }
LABEL_28:

  return v6;
}

- (void)CADObjectGetConstraints:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  ClientConnection *conn;
  id v11;
  int v12;
  ClientConnection *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void *v22;
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  v28 = 0;
  v29 = (id *)&v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  v33 = 0;
  if ((!v7 || objc_msgSend(v7, "isVirtual"))
    && -[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel") == 1)
  {
    +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:](CADOperationGroupUtil, "defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:", 0, self->_conn, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    conn = self->_conn;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke;
    v25[3] = &unk_1E6A381B8;
    v11 = v9;
    v26 = v11;
    v27 = &v28;
    -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v11, v25);
    if (v29[5])
    {

LABEL_13:
      *(_DWORD *)buf = 0;
      -[CADXPCImplementation constraintsData:error:](self, "constraintsData:error:", v29[5], buf, v19, v20, v21, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, *(unsigned int *)buf, v16);

      goto LABEL_14;
    }
    v17 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_ERROR, "Couldn't fetch the default source for getting constraints, with limited access", buf, 2u);
    }
    v8[2](v8, 1010, 0);

  }
  else
  {
    v12 = objc_msgSend(v7, "entityType");
    if (v12 != 2)
    {
      if (v12 == 6)
      {
        objc_storeStrong(v29 + 5, a3);
      }
      else
      {
        v15 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v7;
          _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_ERROR, "Undefined constraints for objectID: %@. We only support source and event to get source constraints right now", buf, 0xCu);
        }
      }
      goto LABEL_13;
    }
    v13 = self->_conn;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke_6;
    v22 = &unk_1E6A381B8;
    v14 = v7;
    v23 = v14;
    v24 = &v28;
    -[ClientConnection withDatabaseForObject:perform:](v13, "withDatabaseForObject:perform:", v14, &v19);
    if (v29[5])
    {

      goto LABEL_13;
    }
    v18 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_ERROR, "Couldn't retrieve actual source for event (%@) to get its constraints", buf, 0xCu);
    }
    v8[2](v8, 1010, 0);

  }
LABEL_14:
  _Block_object_dispose(&v28, 8);

}

- (id)constraintsData:(id)a3 error:(int *)a4
{
  id v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x4010000000;
  v15 = "";
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CADXPCImplementation_CADSourceOperationGroup__constraintsData_error___block_invoke;
  v11[3] = &unk_1E6A38190;
  v11[4] = &v12;
  v7 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", v6, 0, v11);
  if (v7)
  {
    v8 = 0;
    if (a4)
      *a4 = v7;
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D50]);
    v8 = (void *)objc_msgSend(v9, "initWithBytes:length:", v13 + 4, 28);
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)_tryPerformBlockWithSourceID:(id)a3 forAction:(unint64_t)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  ClientConnection *conn;
  id v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;
  CADXPCImplementation *v17;
  id v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__CADXPCImplementation_CADSourceOperationGroup___tryPerformBlockWithSourceID_forAction_withBlock___block_invoke;
  v15[3] = &unk_1E6A380F0;
  v11 = v8;
  v16 = v11;
  v17 = self;
  v19 = &v21;
  v20 = a4;
  v12 = v9;
  v18 = v12;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v11, v15))
  {
    v13 = *((_DWORD *)v22 + 6);
  }
  else
  {
    v13 = 1010;
    *((_DWORD *)v22 + 6) = 1010;
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)CADDatabaseFetchCalendarItemsWithPredicate:(id)a3 entityType:(int)a4 fetchIdentifier:(int)a5 synchronous:(BOOL)a6 reply:(id)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _CADFetchCalendarItemsWithPredicateOperation *v19;
  ClientConnection *conn;
  _CADFetchCalendarItemsWithPredicateOperation *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  void (**v26)(id, uint64_t, _QWORD);
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(id, uint64_t, _QWORD))a7;
  if (!v12)
    goto LABEL_9;
  if ((_DWORD)v10 == 101)
    goto LABEL_6;
  if ((_DWORD)v10 != 3)
  {
    if ((_DWORD)v10 == 2)
    {
      if (-[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel"))
        goto LABEL_6;
      goto LABEL_14;
    }
LABEL_9:
    v17 = 1001;
LABEL_15:
    v13[2](v13, v17, 0);
    goto LABEL_16;
  }
  if (!-[ClientConnection reminderAccessGranted](self->_conn, "reminderAccessGranted"))
  {
LABEL_14:
    v17 = 1013;
    goto LABEL_15;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_ERROR, "Unsupported predicate: [%@]", buf, 0xCu);
    }
    v17 = 1007;
    goto LABEL_15;
  }
  if (v8)
  {
    +[_CADFetchCalendarItemsWithPredicateOperation performSynchronouslyWithPredicate:entityType:connection:fetchIdentifier:cancellationToken:](_CADFetchCalendarItemsWithPredicateOperation, "performSynchronouslyWithPredicate:entityType:connection:fetchIdentifier:cancellationToken:", v12, v10, self->_conn, v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v13)[2](v13, 0, v14);
    -[CADXPCImplementation conn](self, "conn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CalMap:", &__block_literal_global_9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logAccessToObjects:", v16);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v19 = [_CADFetchCalendarItemsWithPredicateOperation alloc];
    conn = self->_conn;
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke_2;
    v25 = &unk_1E6A37278;
    v26 = v13;
    objc_copyWeak(&v27, (id *)buf);
    v21 = -[_CADFetchCalendarItemsWithPredicateOperation initWithPredicate:entityType:connection:fetchIdentifier:completionHandler:](v19, "initWithPredicate:entityType:connection:fetchIdentifier:completionHandler:", v12, v10, conn, v9, &v22);
    -[ClientConnection addOperation:](self->_conn, "addOperation:", v21, v22, v23, v24, v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak((id *)buf);
  }
LABEL_16:

}

- (ClientConnection)conn
{
  return self->_conn;
}

- (void)CADDatabaseGetDefaultCalendarForNewEventsInDelegateSource:(id)a3 withReply:(id)a4
{
  ClientConnection *conn;
  void (**v7)(id, uint64_t, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  conn = self->_conn;
  v7 = (void (**)(id, uint64_t, void *))a4;
  -[ClientConnection permissionValidator](conn, "permissionValidator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:](CADOperationGroupUtil, "defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:", v12, conn, objc_msgSend(v8, "eventAccessLevel") == 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 0;
  else
    v10 = 1010;
  v7[2](v7, v10, v9);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "addObject:", v12);
  if (v9)
    objc_msgSend(v11, "addObject:", v9);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v11);

}

void __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke_2(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CFIndex i;
  const void *ValueAtIndex;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    if (Count >= 1)
    {
      for (i = 0; Count != i; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        CADEntityCopyObjectID();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (CalendarCanContainAnAllowedEntityType((uint64_t)ValueAtIndex, *(void **)(*(_QWORD *)(a1 + 32) + 8)))
        {
          if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isCalendarRestricted:forAction:", ValueAtIndex, 0))
          {
            CalEntityCopyPropertyValues(*(void **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t)ValueAtIndex, *(void **)(a1 + 40), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v13);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v18);

            goto LABEL_14;
          }
          v14 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v13;
            v15 = v14;
            v16 = "Read access managed -> unmanaged not allowed for calendar. ObjectID: [%@]";
LABEL_12:
            _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
          }
        }
        else
        {
          v17 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v13;
            v15 = v17;
            v16 = "Calendar cannot contain an allowed entity type. ObjectID: [%@]";
            goto LABEL_12;
          }
        }
LABEL_14:

      }
    }
    CFRelease(v3);
  }
}

void __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDatePropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = objc_msgSend(v9, "entityID");
          v11 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v13 = 138544130;
          v14 = v8;
          v15 = 1024;
          v16 = (int)v9;
          v17 = 1024;
          v18 = v11;
          v19 = 1024;
          v20 = v12;
          _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Error getting date value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseSetInitializationOptions:(id)a3 reply:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void (**v8)(id, uint64_t, uint64_t);

  v8 = (void (**)(id, uint64_t, uint64_t))a4;
  if (-[ClientConnection trySetDatabaseInitializationOptions:](self->_conn, "trySetDatabaseInitializationOptions:", a3))
  {
    if (-[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel"))
    {
      v6 = -[ClientConnection databaseRestoreGeneration](self->_conn, "databaseRestoreGeneration");
      v7 = 0;
    }
    else
    {
      v7 = 0;
      v6 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    v6 = 0xFFFFFFFFLL;
    v7 = 1013;
  }
  v8[2](v8, v7, v6);

}

- (CADXPCImplementation)initWithClientConnection:(id)a3
{
  id v5;
  CADXPCImplementation *v6;
  CADXPCImplementation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADXPCImplementation;
  v6 = -[CADXPCImplementation init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conn, a3);
    v7->_accessLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)CADDatabaseInsertSuggestedEventCalendarWithReply:(id)a3
{
  void (**v4)(id, uint64_t);
  ClientConnection *conn;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = (void (**)(id, uint64_t))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (!-[CADXPCImplementation _CADDatabaseCanModifySuggestedEventCalendar](self, "_CADDatabaseCanModifySuggestedEventCalendar"))
  {
    v8 = v12;
    v9 = 1013;
LABEL_6:
    *((_DWORD *)v8 + 6) = v9;
    goto LABEL_7;
  }
  conn = self->_conn;
  v6 = *MEMORY[0x1E0D0BE78];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseInsertSuggestedEventCalendarWithReply___block_invoke;
  v10[3] = &unk_1E6A36C30;
  v10[4] = &v11;
  v7 = -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v6, v10);
  v8 = v12;
  if (!v7)
  {
    v9 = 1007;
    goto LABEL_6;
  }
  v9 = *((unsigned int *)v12 + 6);
LABEL_7:
  v4[2](v4, v9);
  _Block_object_dispose(&v11, 8);

}

- (BOOL)_CADDatabaseCanModifySuggestedEventCalendar
{
  void *v2;
  char v3;

  -[ClientConnection permissionValidator](self->_conn, "permissionValidator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canModifySuggestedEventCalendar");

  return v3;
}

- (void)CADDatabaseGetEventNotificationItemsAfterDate:(id)a3 excludingUncheckedCalendars:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  ClientConnection *conn;
  void (**v11)(id, _QWORD, id, id, id, id);
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a5;
  v7 = a4;
  conn = self->_conn;
  v20 = 0;
  v21 = 0;
  v18 = 0;
  v19 = 0;
  v11 = (void (**)(id, _QWORD, id, id, id, id))a6;
  LOBYTE(v17) = 0;
  v12 = +[CADNotificationUtilities CADDatabaseGetEventNotificationItemsWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:earliestExpirationDate:notificationTypes:objectIDs:occurrenceDates:attendeeObjectIDs:](CADNotificationUtilities, "CADDatabaseGetEventNotificationItemsWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:earliestExpirationDate:notificationTypes:objectIDs:occurrenceDates:attendeeObjectIDs:", conn, a3, 0, 0, v7, v6, v17, &v21, &v20, &v19, &v18, 0);
  v13 = v21;
  v14 = v20;
  v15 = v19;
  v16 = v18;
  v11[2](v11, v12, v14, v15, v16, v13);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v15);
}

- (void)CADObject:(id)a3 getRelatedObjectsWithRelationName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  ClientConnection *conn;
  void *v12;
  ClientConnection *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  CADXPCImplementation *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectsWithRelationName_reply___block_invoke;
    v19[3] = &unk_1E6A369D0;
    v23 = &v29;
    v20 = v8;
    v21 = self;
    v22 = v9;
    v24 = &v25;
    -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v20, v19);

  }
  else
  {
    *((_DWORD *)v30 + 6) = 1013;
  }
  v12 = (void *)v26[3];
  v13 = self->_conn;
  objc_msgSend(v12, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObject:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ClientConnection logAccessToObjects:](v13, "logAccessToObjects:", v15);

  v10[2](v10, *((unsigned int *)v30 + 6), v12);
  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v12, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v18, "addObject:", v8);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v18);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

}

- (void)CADOccurrenceCacheGetOccurrencesForCalendars:(id)a3 onDay:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, id);
  id v10;
  void *v11;
  ClientConnection *conn;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a4;
  v9 = (void (**)(id, uint64_t, id))a5;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  conn = self->_conn;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke;
  v18[3] = &unk_1E6A369A8;
  v18[4] = self;
  v19 = v8;
  v20 = v11;
  v13 = v11;
  v17 = v8;
  if (-[ClientConnection withDatabaseForObjects:perform:](conn, "withDatabaseForObjects:perform:", v10, v18))
    v14 = 0;
  else
    v14 = 1010;
  objc_msgSend(v13, "sortWithOptions:usingComparator:", 16, &__block_literal_global_30);
  v9[2](v9, v14, v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "CalMap:", &__block_literal_global_23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v15);
}

- (void)CADObject:(id)a3 getStringPropertyWithName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v12;
  const void *v13;
  _QWORD v14[4];
  id v15;
  CADXPCImplementation *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getStringPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E6A369D0;
    v18 = &v24;
    v15 = v8;
    v16 = self;
    v17 = v9;
    v19 = &v20;
    if (!-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v15, v14))
      *((_DWORD *)v25 + 6) = 1010;

    v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  v13 = (const void *)v21[3];
  if (v13)
    CFRelease(v13);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)CADObject:(id)a3 getNumberPropertyWithName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v12;
  const void *v13;
  _QWORD v14[4];
  id v15;
  CADXPCImplementation *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getNumberPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E6A369D0;
    v18 = &v24;
    v15 = v8;
    v16 = self;
    v17 = v9;
    v19 = &v20;
    if (!-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v15, v14))
      *((_DWORD *)v25 + 6) = 1010;

    v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  v13 = (const void *)v21[3];
  if (v13)
    CFRelease(v13);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)CADObject:(id)a3 getPropertiesWithNames:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  CADXPCImplementation *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertiesWithNames_reply___block_invoke;
  v15[3] = &unk_1E6A36980;
  v12 = v8;
  v16 = v12;
  v17 = self;
  v19 = &v27;
  v20 = &v21;
  v13 = v9;
  v18 = v13;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v12, v15))
  {
    v14 = *((unsigned int *)v28 + 6);
  }
  else
  {
    v14 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
  }
  v10[2](v10, v14, v22[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v12);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

- (void)CADObject:(id)a3 getDatePropertyWithName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v12;
  const void *v13;
  _QWORD v14[4];
  id v15;
  CADXPCImplementation *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDatePropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E6A369D0;
    v18 = &v24;
    v15 = v8;
    v16 = self;
    v17 = v9;
    v19 = &v20;
    if (!-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v15, v14))
      *((_DWORD *)v25 + 6) = 1010;

    v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  v13 = (const void *)v21[3];
  if (v13)
    CFRelease(v13);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __88__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertiesWithNames_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      CalEntityCopyPropertyValues(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v9 && v9 != 1010)
      {
        v10 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 48);
          v12 = *(void **)(a1 + 32);
          v13 = v10;
          LODWORD(v12) = objc_msgSend(v12, "entityID");
          v14 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v15 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v16 = 138544130;
          v17 = v11;
          v18 = 1024;
          v19 = (int)v12;
          v20 = 1024;
          v21 = v14;
          v22 = 1024;
          v23 = v15;
          _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "Error getting property names %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v16, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __99__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectsWithRelationName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = objc_msgSend(v9, "entityID");
          v11 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v13 = 138544130;
          v14 = v8;
          v15 = 1024;
          v16 = (int)v9;
          v17 = 1024;
          v18 = v11;
          v19 = 1024;
          v20 = v12;
          _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Error getting related objects for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getNumberPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = objc_msgSend(v9, "entityID");
          v11 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v13 = 138544130;
          v14 = v8;
          v15 = 1024;
          v16 = (int)v9;
          v17 = 1024;
          v18 = v11;
          v19 = 1024;
          v20 = v12;
          _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Error getting number value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getStringPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = objc_msgSend(v9, "entityID");
          v11 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v13 = 138544130;
          v14 = v8;
          v15 = 1024;
          v16 = (int)v9;
          v17 = 1024;
          v18 = v11;
          v19 = 1024;
          v20 = v12;
          _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Error getting string value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseInsertSuggestedEventCalendarWithReply___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;

  v2 = (const void *)CalDatabaseCopySuggestionsCalendar();
  v3 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  v4 = (const void *)v3;
  if (v2 && v3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1020;
  }
  else if (!v2)
  {
    CalDatabaseInsertSuggestionsCalendar();
    if (v4)
      goto LABEL_6;
    goto LABEL_8;
  }
  CFRelease(v2);
  if (v4)
  {
LABEL_6:
    CFRelease(v4);
    return;
  }
LABEL_8:
  CalDatabaseInsertNaturalLanguageSuggestionsCalendar();
}

void __98__CADXPCImplementation_CADSourceOperationGroup___tryPerformBlockWithSourceID_forAction_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = CalDatabaseCopyStoreWithUID();
  if (!v2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = 1010;
    goto LABEL_5;
  }
  v3 = (const void *)v2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isStoreRestricted:forAction:", v2, *(_QWORD *)(a1 + 64)))
  {
    CFRelease(v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = 1013;
LABEL_5:
    *(_DWORD *)(v4 + 24) = v5;
    return;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "logAccessToObject:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  CFRelease(v3);
}

void __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t UID;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFArray *)CalDatabaseCopyOfAllStores();
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventAccessLevel") == 2
          && CalStoreAllowsEvents()
          && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isStoreRestricted:forAction:", ValueAtIndex, 0) & 1) == 0)
        {
          UID = CalStoreGetUID();
          CalEntityCopyPropertyValues(*(void **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t)ValueAtIndex, *(void **)(a1 + 40), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            v12 = CADLogHandle;
            v13 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
            v11 = (void *)MEMORY[0x1E0C9AA60];
            if (v13)
            {
              v14 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
              *(_DWORD *)buf = 67109376;
              v18 = UID;
              v19 = 1024;
              v20 = v14;
              _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_ERROR, "Failed to get properties for store with rowID %d, error = %d", buf, 0xEu);
            }
          }
          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 6, UID, a2);
          objc_msgSend(v15, "addObject:", v16);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v11);
        }
      }
    }
    CFRelease(v5);
  }
}

uint64_t __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectExists_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  result = CADEntityExistsInDatabaseAndIsAccessible(a3, *(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)CADDatabaseGetAccess:(id)a3
{
  ClientConnection *conn;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  conn = self->_conn;
  v6 = a3;
  -[ClientConnection permissionValidator](conn, "permissionValidator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "eventAuthorization");
  -[ClientConnection permissionValidator](self->_conn, "permissionValidator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, uint64_t, uint64_t))a3 + 2))(v6, 0, v7, objc_msgSend(v8, "remindersAuthorization"));

}

- (void)CADObjectExists:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  ClientConnection *conn;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  CADXPCImplementation *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1010;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  conn = self->_conn;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectExists_reply___block_invoke;
  v13 = &unk_1E6A36930;
  v16 = &v22;
  v17 = &v18;
  v14 = self;
  v9 = v6;
  v15 = v9;
  -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v9, &v10);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *((unsigned int *)v23 + 6), *((unsigned __int8 *)v19 + 24));
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v9, v10, v11, v12, v13, v14);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

- (void)CADOccurrenceCacheGetOccurrenceCountsForCalendars:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  CADXPCImplementation *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply___block_invoke;
  v11[3] = &unk_1E6A38670;
  v9 = v6;
  v12 = v9;
  v13 = self;
  v14 = &v15;
  if (-[ClientConnection withDatabaseForObjects:perform:](conn, "withDatabaseForObjects:perform:", v9, v11))
    v10 = 0;
  else
    v10 = 1010;
  v7[2](v7, v10, v16[5]);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v9);

  _Block_object_dispose(&v15, 8);
}

- (void)CADDatabaseGetCalendarsWithFaultedProperties:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t, uint64_t);
  int v8;
  ClientConnection *conn;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[9];
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t, uint64_t))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  v8 = -[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel");
  conn = self->_conn;
  if (v8 == 1)
  {
    v10 = *MEMORY[0x1E0D0BE78];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke;
    v13[3] = &unk_1E6A38078;
    v13[6] = &v20;
    v13[7] = &v14;
    v11 = v13;
    v13[4] = self;
    v13[5] = v6;
    v13[8] = &v26;
    -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v10, v13);
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke_2;
    v12[3] = &unk_1E6A380A0;
    v12[6] = &v20;
    v12[7] = &v14;
    v11 = v12;
    v12[4] = self;
    v12[5] = v6;
    v12[8] = &v26;
    -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v12);
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
    -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v21[5]);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

- (void)CADDatabaseGetSourcesWithFaultedProperties:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t, uint64_t);
  int v8;
  ClientConnection *conn;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[9];
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t, uint64_t))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = -[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel");
  conn = self->_conn;
  if (v8 == 1)
  {
    v10 = *MEMORY[0x1E0D0BE78];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke;
    v13[3] = &unk_1E6A38118;
    v11 = v13;
    v13[4] = self;
    v13[5] = v6;
    v13[6] = &v26;
    v13[7] = &v20;
    v13[8] = &v14;
    -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v10, v13);
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke_2;
    v12[3] = &unk_1E6A38140;
    v11 = v12;
    v12[4] = self;
    v12[5] = v6;
    v12[6] = &v26;
    v12[7] = &v20;
    v12[8] = &v14;
    -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v12);
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
    -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v21[5]);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

uint64_t __71__CADXPCImplementation_CADSourceOperationGroup__constraintsData_error___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int started;
  uint64_t v7;
  int SupportsInvitationModifications;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int IsAccurateInStore;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int ProhibitsICSImport;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int SupportsJunkReporting;
  uint64_t v42;
  int SupportsPhoneNumbers;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int IsFacebook;
  uint64_t v48;
  int MustIncludeMoreThanFirstOccurrence;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int ProposedStatusRequiredForResponseInStore;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int MustOccurOnSeparateDaysInStore;
  uint64_t v60;
  int FutureStartDateLimitedToOccurrenceCacheBoundsInStore;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int MustAcknowledgeMasterEvent;
  uint64_t v68;
  __int16 v69;
  int AvailabilitySupportedByStore;
  int v71;
  uint64_t v72;
  int UseDeletedByOrganizerStatusInStore;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  int v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  __int16 v114;
  __int16 v115;
  int v116;
  unint64_t v117;
  __int16 v118;
  __int16 v119;
  int v120;
  uint64_t v121;
  __int16 v122;
  __int16 v123;
  void *v124;
  uint64_t v125;
  __int16 v126;
  __int16 v127;
  __int16 v128;
  __int16 v129;
  __int16 v130;
  __int16 v131;
  __int16 v132;
  __int16 v133;
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CalStoreGetMaxAlarmsSupported();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 36) = CalStoreGetMaxRecurrencesSupported();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = CalStoreGetStrictestEventPrivateValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFFELL | (CalStoreGetType() == 0);
  v2 = CalStoreSupportsAlarmTriggerIntervals();
  v3 = 2;
  if (!v2)
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFFDLL | v3;
  v4 = CalStoreSupportsAlarmTriggerDates();
  v5 = 4;
  if (!v4)
    v5 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFFBLL | v5;
  started = CalStoreSupportsAlarmsTriggeringAfterStartDate();
  v7 = 8;
  if (!started)
    v7 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFF7 | v7;
  SupportsInvitationModifications = CalStoreGetSupportsInvitationModifications();
  v9 = 2048;
  if (!SupportsInvitationModifications)
    v9 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFF7FFLL | v9;
  v10 = CalStoreSupportsEventForwarding();
  v11 = 4096;
  if (!v10)
    v11 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFEFFFLL | v11;
  v12 = CalStoreAllowsProposeNewTime();
  v13 = 0x40000000000000;
  if (!v12)
    v13 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFBFFFFFFFFFFFFFLL | v13;
  v14 = CalEventResponseCommentsSupportedInStore();
  v15 = 0x2000;
  if (!v14)
    v15 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFDFFFLL | v15;
  if (CalAttendeeIsStatusKnownForOrganizedEventsInStore())
    v16 = 32;
  else
    v16 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFDFLL | v16;
  if (CalAttendeeIsStatusKnownForInvitedEventsInStore())
    v17 = 64;
  else
    v17 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFBFLL | v17;
  IsAccurateInStore = CalEventGetStatusIsAccurateInStore();
  v19 = 128;
  if (!IsAccurateInStore)
    v19 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFF7FLL | v19;
  if (CalStoreGetSupportsIncomingInvitations())
    v20 = 256;
  else
    v20 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFEFFLL | v20;
  v21 = 512;
  if (CalStoreGetSupportsOutgoingInvitations())
    v22 = 512;
  else
    v22 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFDFFLL | v22;
  v23 = CalStoreSupportsSharedCalendars();
  v24 = 0x8000000000;
  if (!v23)
    v24 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFF7FFFFFFFFFLL | v24;
  v25 = CalStoreSupportsPrivateEvents();
  v26 = 0x40000000000;
  if (!v25)
    v26 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFBFFFFFFFFFFLL | v26;
  v27 = CalStoreProhibitsPrivateEventsWithAttendees();
  v28 = 0x80000000000;
  if (!v27)
    v28 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFF7FFFFFFFFFFLL | v28;
  v29 = CalStoreSupportsAvailabilityRequests();
  v30 = 0x100000000000;
  if (!v29)
    v30 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFEFFFFFFFFFFFLL | v30;
  v31 = CalStoreSupportsIgnoringEventsInAvailabilityRequests();
  v32 = 0x200000000000;
  if (!v31)
    v32 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFDFFFFFFFFFFFLL | v32;
  v33 = CalStoreSupportsInboxAvailability();
  v34 = 0x1000000000000;
  if (!v33)
    v34 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFEFFFFFFFFFFFFLL | v34;
  v35 = CalStoreRequiresSamePrivacyLevelAcrossRecurrenceSeries();
  v36 = 0x800000000000;
  if (!v35)
    v36 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFF7FFFFFFFFFFFLL | v36;
  ProhibitsICSImport = CalStoreGetProhibitsICSImport();
  v38 = 0x80000000000000;
  if (!ProhibitsICSImport)
    v38 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFF7FFFFFFFFFFFFFLL | v38;
  v39 = CalStoreSupportsAutoGeocodingStructuredLocations();
  v40 = 0x100000000000000;
  if (!v39)
    v40 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFEFFFFFFFFFFFFFFLL | v40;
  SupportsJunkReporting = CalStoreGetSupportsJunkReporting();
  v42 = 0x200000000000000;
  if (!SupportsJunkReporting)
    v42 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFDFFFFFFFFFFFFFFLL | v42;
  SupportsPhoneNumbers = CalStoreGetSupportsPhoneNumbers();
  v44 = 0x400000000000000;
  if (!SupportsPhoneNumbers)
    v44 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFBFFFFFFFFFFFFFFLL | v44;
  v45 = CalStoreSupportsLocationDirectorySearches();
  v46 = 0x400000000000;
  if (!v45)
    v46 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFBFFFFFFFFFFFLL | v46;
  IsFacebook = CalStoreIsFacebook();
  v48 = 0x10000000000;
  if (!IsFacebook)
    v48 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFEFFFFFFFFFFLL | v48;
  MustIncludeMoreThanFirstOccurrence = CalStoreRecurrenceSeriesMustIncludeMoreThanFirstOccurrence();
  v50 = 0x20000000000;
  if (!MustIncludeMoreThanFirstOccurrence)
    v50 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFDFFFFFFFFFFLL | v50;
  if (CalEventRequiresOutgoingInvitationsInDefaultCalendarInStore())
    v51 = 1024;
  else
    v51 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFBFFLL | v51;
  if (CalEventGetDeliverySourceOrExternalIDRequiredForResponseInStore())
    v52 = 0x4000;
  else
    v52 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFBFFFLL | v52;
  ProposedStatusRequiredForResponseInStore = CalEventGetProposedStatusRequiredForResponseInStore();
  v54 = 0x8000;
  if (!ProposedStatusRequiredForResponseInStore)
    v54 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFF7FFFLL | v54;
  v55 = CalEventGetRejectedStatusChangeRequiresNoExternalStatusInStore();
  v56 = 0x10000;
  if (!v55)
    v56 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFEFFFFLL | v56;
  v57 = CalEventDurationConstrainedToRecurrenceIntervalInStore();
  v58 = 0x20000;
  if (!v57)
    v58 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFDFFFFLL | v58;
  MustOccurOnSeparateDaysInStore = CalEventGetOccurrencesMustOccurOnSeparateDaysInStore();
  v60 = 0x80000;
  if (!MustOccurOnSeparateDaysInStore)
    v60 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFF7FFFFLL | v60;
  FutureStartDateLimitedToOccurrenceCacheBoundsInStore = CalEventGetFutureStartDateLimitedToOccurrenceCacheBoundsInStore();
  v62 = 0x100000;
  if (!FutureStartDateLimitedToOccurrenceCacheBoundsInStore)
    v62 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFEFFFFFLL | v62;
  v63 = CalStoreSupportsRecurrencesOnDetachedEvents();
  v64 = 0x200000;
  if (!v63)
    v64 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFDFFFFFLL | v64;
  v65 = CalStoreAreRecurrencesPinnedToMonthDays();
  v66 = 0x400000;
  if (!v65)
    v66 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFBFFFFFLL | v66;
  MustAcknowledgeMasterEvent = CalStoreMustAcknowledgeMasterEvent();
  v68 = 0x1000000;
  if (!MustAcknowledgeMasterEvent)
    v68 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFEFFFFFFLL | v68;
  if (CalStoreGetSupportsClearingPrivateComments())
    v69 = 0x8000;
  else
    v69 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = v69 & 0x8000 | *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                       + 56) & 0x7FFF;
  AvailabilitySupportedByStore = CalCalendarItemGetAvailabilitySupportedByStore();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)((AvailabilitySupportedByStore - 1) < 2) << 25);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)(AvailabilitySupportedByStore == 2) << 26);
  v71 = CalAttendeeRequireSearchInSingleAccountInStore();
  v72 = 0x800000;
  if (!v71)
    v72 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFF7FFFFFLL | v72;
  UseDeletedByOrganizerStatusInStore = CalAttendeeGetUseDeletedByOrganizerStatusInStore();
  v74 = 0x800000000000000;
  if (!UseDeletedByOrganizerStatusInStore)
    v74 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xF7FFFFFFFFFFFFFFLL | v74;
  v75 = CalStoreRequiresMSFormattedUIDKey();
  v76 = 0x8000000;
  if (!v75)
    v76 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFF7FFFFFFLL | v76;
  v77 = CalEventCancelDeletedEventsInStore();
  v78 = 0x10000000;
  if (!v77)
    v78 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFEFFFFFFFLL | v78;
  v79 = CalEventDeclineDeletedInvitationsInStore();
  v80 = 0x20000000;
  if (!v79)
    v80 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFDFFFFFFFLL | v80;
  v81 = CalStoreSupportsStructuredLocations();
  v82 = 0x40000000;
  if (!v81)
    v82 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFBFFFFFFFLL | v82;
  v83 = CalStoreSupportsReminderActions();
  v84 = 0x80000000;
  if (!v83)
    v84 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFF7FFFFFFFLL | v84;
  v85 = CalStoreSupportsReminderLocations();
  v86 = 0x100000000;
  if (!v85)
    v86 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFEFFFFFFFFLL | v86;
  v87 = CalStoreSupportsAlarmProximity();
  v88 = 0x200000000;
  if (!v87)
    v88 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFDFFFFFFFFLL | v88;
  v89 = CalStoreAllowsCalendarAddDeleteModify();
  v90 = 0x400000000;
  if (!v89)
    v90 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFBFFFFFFFFLL | v90;
  v91 = CalStoreAllowsTasks();
  v92 = 0x800000000;
  if (!v91)
    v92 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFF7FFFFFFFFLL | v92;
  v93 = CalStoreAllowsEvents();
  v94 = 0x1000000000;
  if (!v93)
    v94 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFEFFFFFFFFFLL | v94;
  v95 = CalEventURLFieldSupportedInStore();
  v96 = 0x2000000000;
  if (!v95)
    v96 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFDFFFFFFFFFLL | v96;
  v97 = CalTaskAllDayDueDatesSupportedInStore();
  v98 = 0x4000000000;
  if (!v97)
    v98 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFBFFFFFFFFFLL | v98;
  if (CalStoreSnoozeAlarmRequiresDetach())
    v99 = 16;
  else
    v99 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFEFLL | v99;
  v100 = CalStoreProhibitsMultipleDaysInMonthlyRecurrence();
  v101 = 0x4000000000000;
  if (!v100)
    v101 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFBFFFFFFFFFFFFLL | v101;
  v102 = CalStoreProhibitsMultipleMonthsInYearlyRecurrence();
  v103 = 0x2000000000000;
  if (!v102)
    v103 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFDFFFFFFFFFFFFLL | v103;
  v104 = CalStoreProhibitsYearlyRecurrenceInterval();
  v105 = 0x8000000000000;
  if (!v104)
    v105 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFF7FFFFFFFFFFFFLL | v105;
  v106 = CalStoreProhibitsDetachmentOnCommentChange();
  v107 = 0x20000000000000;
  if (!v106)
    v107 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFDFFFFFFFFFFFFFLL | v107;
  v108 = CalStoreRequiresOccurrencesConformToRecurrenceRule();
  v109 = 0x10000000000000;
  if (!v108)
    v109 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFEFFFFFFFFFFFFFLL | v109;
  v110 = CalStoreProhibitsSlicingEventsWithAttendees();
  v111 = 0x1000000000000000;
  if (!v110)
    v111 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xEFFFFFFFFFFFFFFFLL | v111;
  v112 = CalStoreSupportsAttachments();
  v113 = 0x4000000000000000;
  if (!v112)
    v113 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xBFFFFFFFFFFFFFFFLL | v113;
  if (CalStoreRequiresOpeningAttachmentAsLink())
    v114 = 16;
  else
    v114 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFFEF | v114;
  if (CalStoreShouldUseDeleteAndAddInsteadOfMoveBetweenCalendars())
    v115 = 32;
  else
    v115 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFFDF | v115;
  v116 = CalStoreSupportsDelegation();
  v117 = 0x8000000000000000;
  if (!v116)
    v117 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v117 & 0x8000000000000000 | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) & 0x7FFFFFFFFFFFFFFFLL;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFFFE | (CalStoreSupportsDelegateEnumeration() != 0);
  if (CalStoreSupportsInvitationModificationsWithoutNotification())
    v118 = 64;
  else
    v118 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFFBF | v118;
  if (CalStoreSupportsFloatingTimeZone())
    v119 = 2;
  else
    v119 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFFFD | v119;
  v120 = CalStoreSupportsSubscriptionCalendars();
  v121 = 0x2000000000000000;
  if (!v120)
    v121 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 48) & 0xDFFFFFFFFFFFFFFFLL | v121;
  if (CalStoreSupportsManagedSubscriptionCalendars())
    v122 = 128;
  else
    v122 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFF7F | v122;
  if (CalStoreSupportsSubscriptionMirroring())
    v123 = 256;
  else
    v123 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFEFF | v123;
  CalDatabaseGetPreferences();
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v124, "get_overrideParticipantRoleConstraint") & 1) == 0)
  {
    if (CalStoreSupportsParticipantRoles())
      v21 = 512;
    else
      v21 = 0;
  }
  v125 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v126 = *(_WORD *)(v125 + 56) & 0xFDFF | v21;
  *(_QWORD *)(v125 + 48) = *(_QWORD *)(v125 + 48);
  *(_WORD *)(v125 + 56) = v126;

  if (CalStoreProhibitsUsingEventOrganizerEmailWhenComposingMail())
    v127 = 4;
  else
    v127 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFFFB | v127;
  if (CalStoreSupportsRecurrenceSplit())
    v128 = 8;
  else
    v128 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFFF7 | v128;
  if (CalStoreSupportsPush())
    v129 = 1024;
  else
    v129 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xFBFF | v129;
  if (CalStoreSupportsTravelTime())
    v130 = 2048;
  else
    v130 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xF7FF | v130;
  if (CalStoreRequiresSeparateFilesForAllAttachments())
    v131 = 4096;
  else
    v131 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xEFFF | v131;
  if (CalEventGetOccurrenceOrderEnforcedAfterDetachmentInStore())
    v132 = 0x2000;
  else
    v132 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xDFFF | v132;
  if (CalStoreAllowsPrivateEventAccessByDelegate())
    v133 = 0x4000;
  else
    v133 = 0;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) & 0xBFFF | v133;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = CalStoreGetType() == 1;
  result = CalStoreGetType();
  if (!(_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) |= 0x40000000uLL;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) |= 0x80000000uLL;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) |= 0x100000000uLL;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) |= 0x200000000uLL;
  }
  return result;
}

- (id)_accountStoreForBackupRestore
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0D0BB18], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ClientConnection databaseInitializationOptions](self->_conn, "databaseInitializationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unitTesting");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D0BB28], "storeFilteringAllChangesInBackingAccountStore:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (void)CADBackupToICBU:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  ClientConnection *conn;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  CADXPCImplementation *v17;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "nil icbu URL given for backup", (uint8_t *)&buf, 2u);
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "startAccessingSecurityScopedResource") & 1) == 0)
  {
    v14 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for backup icbu destination: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_11:
    v7[2](v7, 1001);
    goto LABEL_12;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x2020000000;
  v21 = 1015;
  conn = self->_conn;
  v11 = *MEMORY[0x1E0D0BE78];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupToICBU_reply___block_invoke;
  v15[3] = &unk_1E6A367A0;
  v12 = v9;
  v16 = v12;
  v17 = self;
  p_buf = &buf;
  if (!-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v11, v15))
    *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = 1007;

  objc_msgSend(v12, "stopAccessingSecurityScopedResource");
  v7[2](v7, *(unsigned int *)(*((_QWORD *)&buf + 1) + 24));
  _Block_object_dispose(&buf, 8);
LABEL_12:

}

void __78__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupToICBU_reply___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 40), "_accountStoreForBackupRestore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CalDatabaseBackupToICBU();

  if (v3)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

- (void)CADBackupDatabaseToFileNamed:(id)a3 inDirectory:(id)a4 includeAttachments:(BOOL)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  ClientConnection *conn;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  __int128 *p_buf;
  BOOL v25;
  __int128 buf;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v11, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((objc_msgSend(v13, "startAccessingSecurityScopedResource") & 1) != 0)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v27 = 0x2020000000;
        v28 = 1015;
        objc_msgSend(v14, "URLByAppendingPathComponent:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        conn = self->_conn;
        v17 = *MEMORY[0x1E0D0BE78];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __122__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupDatabaseToFileNamed_inDirectory_includeAttachments_reply___block_invoke;
        v22[3] = &unk_1E6A367C8;
        v25 = a5;
        v18 = v15;
        v23 = v18;
        p_buf = &buf;
        if (!-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v17, v22))
          *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = 1007;

        objc_msgSend(v14, "stopAccessingSecurityScopedResource");
        v12[2](v12, *(unsigned int *)(*((_QWORD *)&buf + 1) + 24));
        _Block_object_dispose(&buf, 8);
        goto LABEL_16;
      }
      v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for backup destination directory: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      v20 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_ERROR, "nil destination directory URL given for backup", (uint8_t *)&buf, 2u);
      }
    }
    v12[2](v12, 1001);
LABEL_16:

    goto LABEL_17;
  }
  v19 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_ERROR, "No file name given for backup", (uint8_t *)&buf, 2u);
  }
  v12[2](v12, 1001);
LABEL_17:

}

uint64_t __122__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupDatabaseToFileNamed_inDirectory_includeAttachments_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
  {
    result = CalDatabaseBackupDatabaseFileAndAttachments();
    if ((result & 1) == 0)
      return result;
  }
  else
  {
    result = CalDatabaseBackupDatabaseFile();
    if (!(_DWORD)result)
      return result;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (BOOL)_performRestoreOperation:(id)a3
{
  uint64_t (**v4)(id, int *);
  void *v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v11;

  v4 = (uint64_t (**)(id, int *))a3;
  v11 = -1;
  -[ClientConnection databaseInitializationOptions](self->_conn, "databaseInitializationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unitTesting");

  if (v6)
  {
    LOBYTE(v7) = v4[2](v4, &v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "requestDaemonStopMonitoringAgents");
    v7 = v4[2](v4, &v11);
    objc_msgSend(v8, "requestDaemonStartMonitoringAgentsWithToken:", v9);

  }
  return v7;
}

- (void)CADRestoreFromDatabaseBackupFileNamed:(id)a3 inDirectory:(id)a4 includeAttachments:(BOOL)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  ClientConnection *conn;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  __int128 *p_buf;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  __int128 buf;
  uint64_t v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v11, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((objc_msgSend(v13, "startAccessingSecurityScopedResource") & 1) != 0)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v32 = 0x2020000000;
        v33 = 1015;
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v30 = -1;
        objc_msgSend(v14, "URLByAppendingPathComponent:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        conn = self->_conn;
        v17 = *MEMORY[0x1E0D0BE78];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke;
        v22[3] = &unk_1E6A36818;
        v22[4] = self;
        v26 = a5;
        v18 = v15;
        v23 = v18;
        v24 = &v27;
        p_buf = &buf;
        if (!-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v17, v22))
          *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = 1007;

        objc_msgSend(v14, "stopAccessingSecurityScopedResource");
        (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, *(unsigned int *)(*((_QWORD *)&buf + 1) + 24), *((unsigned int *)v28 + 6));
        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&buf, 8);
        goto LABEL_16;
      }
      v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for backup directory to be restored: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      v20 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_ERROR, "nil backup directory URL given for restore", (uint8_t *)&buf, 2u);
      }
    }
    (*((void (**)(id, uint64_t, uint64_t))v12 + 2))(v12, 1001, 0xFFFFFFFFLL);
LABEL_16:

    goto LABEL_17;
  }
  v19 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_ERROR, "No backup database file name given for restore", (uint8_t *)&buf, 2u);
  }
  (*((void (**)(id, uint64_t, uint64_t))v12 + 2))(v12, 1001, 0xFFFFFFFFLL);
LABEL_17:

}

void __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke_2;
  v7[3] = &unk_1E6A367F0;
  v11 = *(_BYTE *)(a1 + 64);
  v10 = a3;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  if (objc_msgSend(v4, "_performRestoreOperation:", v7))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

}

uint64_t __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke_2(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
    result = CalDatabaseRestoreFromBackupDatabaseFileAndAttachments();
  else
    result = CalDatabaseRestoreFromBackupDatabaseFile();
  *a2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)CADRestoreFromICBU:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  void *v8;
  void *v9;
  ClientConnection *conn;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  CADXPCImplementation *v19;
  id v20;
  uint64_t *v21;
  __int128 *p_buf;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  __int128 buf;
  uint64_t v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "nil icbu URL given for restore", (uint8_t *)&buf, 2u);
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "startAccessingSecurityScopedResource") & 1) == 0)
  {
    v14 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for icbu to be restored: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_11:
    v7[2](v7, 1001, 0xFFFFFFFFLL);
    goto LABEL_12;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x2020000000;
  v29 = 1015;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = -1;
  conn = self->_conn;
  v11 = *MEMORY[0x1E0D0BE78];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke;
  v18 = &unk_1E6A36868;
  v19 = self;
  v12 = v9;
  v20 = v12;
  v21 = &v23;
  p_buf = &buf;
  if (!-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v11, &v15))
    *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = 1007;

  objc_msgSend(v12, "stopAccessingSecurityScopedResource", v15, v16, v17, v18, v19);
  v7[2](v7, *(unsigned int *)(*((_QWORD *)&buf + 1) + 24), *((unsigned int *)v24 + 6));
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);
LABEL_12:

}

void __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "_accountStoreForBackupRestore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke_2;
  v10[3] = &unk_1E6A36840;
  v14 = a3;
  v6 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v7;
  v12 = v7;
  v13 = v8;
  if (objc_msgSend(v6, "_performRestoreOperation:", v10))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

}

uint64_t __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke_2(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = CalDatabaseRestoreFromICBU();
  *a2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

- (void)CADDatabaseGetAlarmWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  ClientConnection *conn;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  if (v6)
  {
    conn = self->_conn;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __88__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmWithUUID_reply___block_invoke;
    v14 = &unk_1E6A368B8;
    v15 = v6;
    v16 = &v17;
    -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", &v11);
    if (v18[5])
      v10 = 0;
    else
      v10 = 1010;
    v8[2](v8, v10);
    -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v18[5], v11, v12, v13, v14);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1001, 0);
  }
  _Block_object_dispose(&v17, 8);

}

void __88__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmWithUUID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = CalDatabaseCopyAlarmWithUUID();
  if (v6)
  {
    v7 = (const void *)v6;
    CADEntityCopyObjectID();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    CFRelease(v7);
    *a4 = 1;
  }
}

- (void)CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD, id);
  void *v6;
  void *v7;
  ClientConnection *conn;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  conn = self->_conn;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke;
  v11[3] = &unk_1E6A36908;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v11);
  v5[2](v5, 0, v9);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v10);
}

void __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke_2;
  v8[3] = &unk_1E6A368E0;
  v6 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "_getAlarmOccurrencesFromAlarmCacheForDatabase:databaseID:accessLogger:", a3, a2, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v7);

}

uint64_t __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_getAlarmOccurrencesFromAlarmCacheForDatabase:(CalDatabase *)a3 databaseID:(int)a4 accessLogger:(id)a5
{
  CFIndex Count;
  CFIndex v6;
  uint64_t v7;
  const void *v8;
  int Type;
  double v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  double v14;
  uint64_t started;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  EKAlarmOccurrence *v32;
  void *v33;
  void *v34;
  const void *v35;
  void *v36;
  CFTimeZoneRef cf;
  CFTypeRef v39;
  id v41;
  void (**v42)(id, void *);
  void *v44;
  CFIndex v45;
  const __CFArray *theArray;
  void *v47;

  v42 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  theArray = (const __CFArray *)CalDatabaseCopyAlarmOccurrencesFromAlarmCache();
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    cf = CFTimeZoneCreateWithName(0, CFSTR("UTC"), 1u);
    v39 = (CFTypeRef)CalCopyTimeZone();
    v45 = Count;
    if (Count >= 1)
    {
      v6 = 0;
      while (1)
      {
        CFArrayGetValueAtIndex(theArray, v6);
        CalAlarmOccurrenceGetAlarm();
        v7 = CalAlarmCopyOwningEntity();
        if (v7)
          break;
LABEL_30:
        if (v45 == ++v6)
          goto LABEL_31;
      }
      v8 = (const void *)v7;
      Type = CalEntityGetType();
      if (Type == 1)
      {
        if (-[ClientConnection reminderAccessGranted](self->_conn, "reminderAccessGranted"))
        {
          v11 = CalCalendarCopyURI();
LABEL_19:
          v17 = 0;
          started = 0;
LABEL_27:
          v22 = (void *)MEMORY[0x1E0C99D68];
          CalAlarmOccurrenceGetFireDate();
          objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:", floor(v23));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)CalAlarmCopyUUID();
          v26 = (void *)MEMORY[0x1E0C99D68];
          CalAlarmGetAcknowledgedDate();
          objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:", floor(v27));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 4, CalAlarmGetUID(), a4);
          CADEntityCopyObjectID();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)started;
          v31 = (void *)v11;
          if (v29)
          {
            v44 = v17;
            v32 = -[EKAlarmOccurrence initWithAlarmID:ownerID:ownerDate:ownerTimeZone:ownerURI:fireDate:externalID:acknowledgedDate:]([EKAlarmOccurrence alloc], "initWithAlarmID:ownerID:ownerDate:ownerTimeZone:ownerURI:fireDate:externalID:acknowledgedDate:", v28, v29, v17, v30, v11, v24, v25, v47);
            -[EKAlarmOccurrence dictionaryRepresentation](v32, "dictionaryRepresentation");
            v33 = v25;
            v34 = v24;
            v35 = v8;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v36);
            v42[2](v42, v29);

            v8 = v35;
            v24 = v34;
            v25 = v33;

            v17 = v44;
          }
          CFRelease(v8);

          goto LABEL_30;
        }
      }
      else if (Type == 3)
      {
        if (-[ClientConnection reminderAccessGranted](self->_conn, "reminderAccessGranted"))
        {
          v12 = CalTaskCopyDueDate();
          if (v12)
          {
            v13 = (const void *)v12;
            v14 = MEMORY[0x1BCC9B578]();
            started = CalTaskCopyDueDateTimeZone();
            if (!started)
            {
              CalAbsoluteTimeGetAbsoluteTimeInTimeZone();
              v14 = v16;
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", floor(v14));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            CFRelease(v13);
          }
          else
          {
            v17 = 0;
            started = 0;
          }
          v21 = CalTaskCopyURI();
          goto LABEL_26;
        }
      }
      else if (Type == 2 && -[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel"))
      {
        if (CalAlarmOccurrenceGetEventOccurrence())
        {
          CalEventOccurrenceGetDate();
        }
        else
        {
          CalEventGetStartDate();
          v19 = v18;
          if (!CalCalendarItemIsFloating())
          {
LABEL_23:
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", floor(v19));
            v20 = objc_claimAutoreleasedReturnValue();
            started = CalEventCopyStartTimeZone();
            v17 = (void *)v20;
            v21 = CalEventCopyURI();
LABEL_26:
            v11 = v21;
            goto LABEL_27;
          }
          CalAbsoluteTimeGetAbsoluteTimeInTimeZone();
        }
        v19 = v10;
        goto LABEL_23;
      }
      v11 = 0;
      goto LABEL_19;
    }
LABEL_31:
    if (cf)
      CFRelease(cf);
    if (v39)
      CFRelease(v39);
    CFRelease(theArray);
  }

  return v41;
}

- (void)CADObjectsExist:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  ClientConnection *conn;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectsExist_reply___block_invoke;
  v9[3] = &unk_1E6A36958;
  v9[4] = self;
  v9[5] = &v10;
  -[ClientConnection withDatabaseForObjects:options:perform:](conn, "withDatabaseForObjects:options:perform:", v6, 1, v9);
  v7[2](v7, 0, v11[5]);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v6);
  _Block_object_dispose(&v10, 8);

}

void __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectsExist_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((CADEntityExistsInDatabaseAndIsAccessible(a4, *(void **)(*(_QWORD *)(a1 + 32) + 8), v12, 0) & 1) == 0)
          {
            v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            if (!v13)
            {
              v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
              v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v16 = *(void **)(v15 + 40);
              *(_QWORD *)(v15 + 40) = v14;

              v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            }
            objc_msgSend(v13, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
  }
  else
  {
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v17)
    {
      objc_msgSend(v17, "addObjectsFromArray:", v7);
    }
    else
    {
      v18 = objc_msgSend(v7, "mutableCopy");
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }

}

- (void)CADObjects:(id)a3 getPropertiesWithNames:(id)a4 reply:(id)a5
{
  void *v8;
  void (**v9)(id, _QWORD, id);
  id v10;
  id v11;
  void *v12;
  CADFetchedObjectSerializer *v13;
  ClientConnection *conn;
  id v15;
  CADFetchedObjectSerializer *v16;
  _QWORD v17[5];
  CADFetchedObjectSerializer *v18;
  id v19;

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CADFetchedObjectSerializer initWithConnection:defaultPropertiesToLoad:]([CADFetchedObjectSerializer alloc], "initWithConnection:defaultPropertiesToLoad:", self->_conn, v10);

  conn = self->_conn;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__CADXPCImplementation_CADObjectOperationGroup__CADObjects_getPropertiesWithNames_reply___block_invoke;
  v17[3] = &unk_1E6A369A8;
  v17[4] = self;
  v18 = v13;
  v19 = v12;
  v15 = v12;
  v16 = v13;
  -[ClientConnection withDatabaseForObjects:options:perform:](conn, "withDatabaseForObjects:options:perform:", v11, 1, v17);
  v9[2](v9, 0, v15);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v11);
}

void __89__CADXPCImplementation_CADObjectOperationGroup__CADObjects_getPropertiesWithNames_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        if (!a4)
          goto LABEL_10;
        v11 = CADCopyEntityInDatabase(a4, *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10));
        if (!v11)
          goto LABEL_10;
        v12 = v11;
        if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 32) + 8), v11, 0))
        {
          CFRelease(v12);
LABEL_10:
          v13 = *(void **)(a1 + 48);
LABEL_11:
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        objc_msgSend(*(id *)(a1 + 40), "addEntity:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v12);
        v13 = *(void **)(a1 + 48);
        if (!v14)
          goto LABEL_11;
LABEL_12:
        objc_msgSend(v13, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v15;
    }
    while (v15);
  }

}

- (void)CADObject:(id)a3 getPropertyWithName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v12;
  const void *v13;
  _QWORD v14[4];
  id v15;
  CADXPCImplementation *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E6A369D0;
    v18 = &v24;
    v15 = v8;
    v16 = self;
    v17 = v9;
    v19 = &v20;
    if (!-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v15, v14))
      *((_DWORD *)v25 + 6) = 1010;

    v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  v13 = (const void *)v21[3];
  if (v13)
    CFRelease(v13);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __85__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = objc_msgSend(v9, "entityID");
          v11 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v13 = 138544130;
          v14 = v8;
          v15 = 1024;
          v16 = (int)v9;
          v17 = 1024;
          v18 = v11;
          v19 = 1024;
          v20 = v12;
          _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Error getting object value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADObject:(id)a3 getDataPropertyWithName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v12;
  const void *v13;
  _QWORD v14[4];
  id v15;
  CADXPCImplementation *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDataPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E6A369D0;
    v18 = &v24;
    v15 = v8;
    v16 = self;
    v17 = v9;
    v19 = &v20;
    if (!-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v15, v14))
      *((_DWORD *)v25 + 6) = 1010;

    v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  v13 = (const void *)v21[3];
  if (v13)
    CFRelease(v13);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDataPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = objc_msgSend(v9, "entityID");
          v11 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v13 = 138544130;
          v14 = v8;
          v15 = 1024;
          v16 = (int)v9;
          v17 = 1024;
          v18 = v11;
          v19 = 1024;
          v20 = v12;
          _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Error getting string value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (BOOL)_requiresSpecialEntitlementToReadSecurityScopedURLWrapperForProperty:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0B200]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0B1F8]) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0B208]) ^ 1;
  }

  return v4;
}

- (void)CADObject:(id)a3 getSecurityScopedURLWrapperPropertyWithName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v12;
  const void *v13;
  _QWORD v14[4];
  id v15;
  CADXPCImplementation *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __109__CADXPCImplementation_CADObjectOperationGroup__CADObject_getSecurityScopedURLWrapperPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E6A369F8;
    v15 = v8;
    v16 = self;
    v18 = &v24;
    v17 = v9;
    v19 = &v20;
    if (!-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v15, v14))
      *((_DWORD *)v25 + 6) = 1010;

    v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  v13 = (const void *)v21[3];
  if (v13)
    CFRelease(v13);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __109__CADXPCImplementation_CADObjectOperationGroup__CADObject_getSecurityScopedURLWrapperPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "permissionValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0)
      || (objc_msgSend(v5, "canAccessDatabaseBookmarks") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 40), "_requiresSpecialEntitlementToReadSecurityScopedURLWrapperForProperty:", *(_QWORD *)(a1 + 48)))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v4, *(void **)(a1 + 48), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v6)
      {
        if (v6 != 1010)
        {
          v7 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            v8 = *(_QWORD *)(a1 + 48);
            v9 = *(void **)(a1 + 32);
            v10 = v7;
            LODWORD(v9) = objc_msgSend(v9, "entityID");
            v11 = objc_msgSend(*(id *)(a1 + 32), "entityType");
            v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v13 = 138544130;
            v14 = v8;
            v15 = 1024;
            v16 = (int)v9;
            v17 = 1024;
            v18 = v11;
            v19 = 1024;
            v20 = v12;
            _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Error getting SecurityScopedURLWrapper value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);

          }
        }
      }
    }
    CFRelease(v4);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }

}

- (void)CADObject:(id)a3 getRelatedObjectWithRelationName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  CADXPCImplementation *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectWithRelationName_reply___block_invoke;
    v15[3] = &unk_1E6A369D0;
    v19 = &v27;
    v16 = v8;
    v17 = self;
    v18 = v9;
    v20 = &v21;
    if (!-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v16, v15))
      *((_DWORD *)v28 + 6) = 1010;

    v12 = *((unsigned int *)v28 + 6);
  }
  else
  {
    v12 = 1013;
    *((_DWORD *)v28 + 6) = 1013;
  }
  v10[2](v10, v12, v22[5]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v8)
    objc_msgSend(v13, "addObject:", v8);
  if (v22[5])
    objc_msgSend(v14, "addObject:");
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v14);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __98__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectWithRelationName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      cf = 0;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), &cf);
      if (cf)
      {
        CADEntityCopyObjectID();
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

        CFRelease(cf);
      }
      v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v9 && v9 != 1010)
      {
        v10 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 48);
          v12 = *(void **)(a1 + 32);
          v13 = v10;
          LODWORD(v12) = objc_msgSend(v12, "entityID");
          v14 = objc_msgSend(*(id *)(a1 + 32), "entityType");
          v15 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          *(_DWORD *)buf = 138544130;
          v18 = v11;
          v19 = 1024;
          v20 = (int)v12;
          v21 = 1024;
          v22 = v14;
          v23 = 1024;
          v24 = v15;
          _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "Error getting related value for property %{public}@ of object ID {%i, %i}: %i", buf, 0x1Eu);

        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADObjectIsManaged:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  CADXPCImplementation *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  conn = self->_conn;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __74__CADXPCImplementation_CADObjectOperationGroup__CADObjectIsManaged_reply___block_invoke;
  v14 = &unk_1E6A36A20;
  v9 = v6;
  v15 = v9;
  v16 = self;
  v17 = &v23;
  v18 = &v19;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v9, &v11))
  {
    v10 = *((unsigned int *)v24 + 6);
  }
  else
  {
    v10 = 1010;
    *((_DWORD *)v24 + 6) = 1010;
  }
  v7[2](v7, v10, *((unsigned __int8 *)v20 + 24));
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v9, v11, v12, v13, v14);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

}

void __74__CADXPCImplementation_CADObjectOperationGroup__CADObjectIsManaged_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;

  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v4, 0))
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1013;
    else
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CADEntityIsInManagedStore(*(void **)(*(_QWORD *)(a1 + 40) + 8), v5);
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetErrorCount:(id)a3
{
  id v4;
  ClientConnection *conn;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  conn = self->_conn;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetErrorCount___block_invoke;
  v6[3] = &unk_1E6A36A48;
  v6[4] = &v11;
  v6[5] = &v7;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v6);
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *((unsigned int *)v12 + 6), *((unsigned int *)v8 + 6));
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

}

void __73__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetErrorCount___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;

  v2 = (const __CFArray *)CalDatabaseCopyAllErrors();
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += CFArrayGetCount(v2);
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1015;
  }
}

- (void)CADDatabaseGetEventsWithErrorsPerSource:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  ClientConnection *conn;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = (void (**)(id, _QWORD, id))a3;
  v5 = (void *)objc_opt_new();
  conn = self->_conn;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetEventsWithErrorsPerSource___block_invoke;
  v8[3] = &unk_1E6A36A70;
  v9 = v5;
  v7 = v5;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v8);
  v4[2](v4, 0, v7);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v7);
}

void __88__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetEventsWithErrorsPerSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CalDatabaseGetIDOfOneEventWithAnErrorPerSource();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v2, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)CADDatabaseGetSharedCalendarInvitationsWithReply:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD, id);
  void *v6;
  ClientConnection *conn;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __111__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetSharedCalendarInvitationsWithReply___block_invoke;
  v9[3] = &unk_1E6A36A98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8);
}

void __111__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetSharedCalendarInvitationsWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  void *v10;

  v4 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        if (CalendarCanContainAnAllowedEntityType((uint64_t)ValueAtIndex, *(void **)(*(_QWORD *)(a1 + 32) + 8)))
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 1, CalCalendarGetUID(), a2);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

        }
      }
    }
    CFRelease(v5);
  }
}

- (void)CADCalendarSetClearedFromNotificationCenter:(id)a3 error:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  ClientConnection *conn;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  CADXPCImplementation *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __112__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADCalendarSetClearedFromNotificationCenter_error___block_invoke;
  v11[3] = &unk_1E6A36AC0;
  v9 = v6;
  v13 = self;
  v14 = &v15;
  v12 = v9;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v9, v11))
  {
    v10 = *((unsigned int *)v16 + 6);
  }
  else
  {
    v10 = 1010;
    *((_DWORD *)v16 + 6) = 1010;
  }
  v7[2](v7, v10);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v9);

  _Block_object_dispose(&v15, 8);
}

void __112__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADCalendarSetClearedFromNotificationCenter_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  int v6;

  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (!v4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1010;
    return;
  }
  v5 = v4;
  if ((!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "eventAccessLevel")
     || (CalCalendarCanContainEntityType() & 1) == 0)
    && (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "reminderAccessGranted")
     || !CalCalendarCanContainEntityType()))
  {
    v6 = 1013;
    goto LABEL_10;
  }
  CalCalendarSetInvitationStatus();
  if ((CalDatabaseSave() & 1) == 0)
  {
    v6 = 1007;
LABEL_10:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  }
  CFRelease(v5);
}

- (void)CADDatabaseGetResourceChanges:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD, id);
  void *v6;
  ClientConnection *conn;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetResourceChanges___block_invoke;
  v9[3] = &unk_1E6A36A98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8);
}

void __92__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetResourceChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex v11;
  CFIndex v12;
  CFIndex i;
  uint64_t v14;
  const void *v15;
  int Type;
  uint64_t v17;
  const void *v18;
  _BOOL4 CanContainAnAllowedEntityType;
  void *v20;
  CFIndex v21;
  const __CFArray *v22;

  v4 = (const __CFArray *)CalDatabaseCopyOfAllNotifications();
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      v21 = Count;
      v22 = v5;
      do
      {
        CFArrayGetValueAtIndex(v5, v8);
        if ((CalNotificationGetEntityType() & 0xFFFFFFFD) == 0x11)
        {
          v9 = (const __CFArray *)CalResourceChangeNotificationCopyChanges();
          if (v9)
          {
            v10 = v9;
            v11 = CFArrayGetCount(v9);
            if (v11 >= 1)
            {
              v12 = v11;
              for (i = 0; v12 != i; ++i)
              {
                CFArrayGetValueAtIndex(v10, i);
                v14 = CalResourceChangeCopyCalendarItem();
                if (v14)
                {
                  v15 = (const void *)v14;
                  Type = CalEntityGetType();
                  if (Type == 3)
                  {
                    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reminderAccessGranted"))
                      goto LABEL_17;
                  }
                  else if (Type == 2
                         && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventAccessLevel"))
                  {
LABEL_17:
                    CFRelease(v15);
                    continue;
                  }
                  CFRelease(v15);
                }
                else
                {
                  v17 = CalResourceChangeCopyCalendar();
                  if (v17)
                  {
                    v18 = (const void *)v17;
                    CanContainAnAllowedEntityType = CalendarCanContainAnAllowedEntityType(v17, *(void **)(*(_QWORD *)(a1 + 32) + 8));
                    CFRelease(v18);
                    if (!CanContainAnAllowedEntityType)
                      continue;
                  }
                }
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 18, CalResourceChangeGetUID(), a2);
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

              }
            }
            CFRelease(v10);
            v7 = v21;
            v5 = v22;
          }
        }
        ++v8;
      }
      while (v8 != v7);
    }
    CFRelease(v5);
  }
}

- (void)CADDatabaseGetInviteReplyNotifications:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD, id);
  void *v6;
  ClientConnection *conn;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInviteReplyNotifications___block_invoke;
  v9[3] = &unk_1E6A36A98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8);
}

void __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInviteReplyNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const __CFURL *v9;
  const void *v10;
  uint64_t v11;
  const void *v12;
  const __CFString *v13;
  __CFString *MutableCopy;
  __CFString *v15;
  uint64_t v16;
  void *v17;

  v4 = (const __CFArray *)CalDatabaseCopyOfAllNotifications();
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; v7 != i; ++i)
      {
        CFArrayGetValueAtIndex(v5, i);
        if (CalNotificationGetEntityType() != 16)
          continue;
        v9 = (const __CFURL *)CalInviteReplyNotificationCopyHostURL();
        if (!v9)
          continue;
        v10 = v9;
        CFURLGetString(v9);
        v11 = CalDatabaseCopyCalendarWithExternalIDInStore();
        if (v11)
        {
          v12 = (const void *)v11;
          CFRelease(v10);
          v10 = v12;
        }
        else
        {
          v13 = CFURLGetString((CFURLRef)v10);
          MutableCopy = CFStringCreateMutableCopy(0, 0, v13);
          if (!MutableCopy)
            goto LABEL_14;
          v15 = MutableCopy;
          CFStringAppend(MutableCopy, CFSTR("/"));
          v16 = CalDatabaseCopyCalendarWithExternalIDInStore();
          CFRelease(v15);
          CFRelease(v10);
          v10 = (const void *)v16;
          if (!v16)
            goto LABEL_15;
        }
        if (CalEntityGetType() != 1
          || CalendarCanContainAnAllowedEntityType((uint64_t)v10, *(void **)(*(_QWORD *)(a1 + 32) + 8)))
        {
LABEL_14:
          CFRelease(v10);
LABEL_15:
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 102, CalNotificationGetUID(), a2);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);

          continue;
        }
        CFRelease(v10);
      }
    }
    CFRelease(v5);
  }
}

- (void)CADDatabaseGetNotificationCountForSourceWithExternalIdentifier:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 expanded:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  ClientConnection *conn;
  void (**v13)(id, _QWORD, uint64_t, id);
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v8 = a5;
  v9 = a4;
  conn = self->_conn;
  v18 = 0;
  v19 = 0;
  v13 = (void (**)(id, _QWORD, uint64_t, id))a7;
  LOBYTE(v17) = a6;
  v14 = +[CADNotificationUtilities CADDatabaseGetEventNotificationItemsWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:earliestExpirationDate:notificationTypes:objectIDs:occurrenceDates:attendeeObjectIDs:](CADNotificationUtilities, "CADDatabaseGetEventNotificationItemsWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:earliestExpirationDate:notificationTypes:objectIDs:occurrenceDates:attendeeObjectIDs:", conn, 0, a3, v9, 0, v8, v17, 0, &v19, &v18, 0, 0);
  v15 = v19;
  v16 = v18;
  v13[2](v13, v14, objc_msgSend(v15, "count"), v16);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v16);
}

- (void)CADDatabaseGetInboxRepliedSectionItems:(id)a3
{
  void (**v4)(id, _QWORD, id, id);
  id v5;
  id v6;
  id v7;
  ClientConnection *conn;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void (**v19)(id, _QWORD, id, id);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, id, id))a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  conn = self->_conn;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke;
  v24[3] = &unk_1E6A36A70;
  v9 = v5;
  v25 = v9;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v24);
  if (objc_msgSend(v9, "count"))
  {
    v18 = v9;
    v19 = v4;
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kObjectIDKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kOccurrenceDateKey"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);
          objc_msgSend(v7, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v12);
    }
    v4 = v19;
    v19[2](v19, 0, v6, v7);
    -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v6);

    v9 = v18;
  }
  else
  {
    v4[2](v4, 0, v6, v7);
  }

}

void __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke(uint64_t a1, unsigned int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CalDatabaseCopyOfAllRepliedEventsInStore();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectsAtIndexes:");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 2, CalEntityGetID(), a2);
          v9 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
          CalEventOccurrenceGetDate();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v9);
          v23[0] = CFSTR("kParticipationStatusModifiedDateKey");
          v11 = (void *)MEMORY[0x1E0CB37E8];
          CalEventGetParticipationStatusModifiedDate();
          objc_msgSend(v11, "numberWithDouble:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v12;
          v23[1] = CFSTR("kStartDateKey");
          v13 = (void *)MEMORY[0x1E0CB37E8];
          CalEventGetStartDate();
          objc_msgSend(v13, "numberWithDouble:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = v14;
          v24[2] = v8;
          v23[2] = CFSTR("kObjectIDKey");
          v23[3] = CFSTR("kOccurrenceDateKey");
          v24[3] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v5);
    }

  }
}

uint64_t __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  const void *v6;
  int v7;
  uint64_t v9;
  const void *v10;

  v2 = a2;
  if (CalCalendarItemGetStatus() == 3)
  {
    v3 = 0;
    goto LABEL_11;
  }
  v4 = (const void *)CalCalendarItemCopyCalendar();
  v5 = CalCalendarCopyStore();
  if (!v5)
  {
    v3 = 0;
    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v6 = (const void *)v5;
  if (!CalStoreGetSupportsIncomingInvitations()
    || (CalStoreIsFacebook() & 1) != 0
    || CalStoreGetType() == 1 && CalEventGetParticipationStatus() == 2)
  {
    v7 = 0;
  }
  else
  {
    v9 = CalCalendarItemCopyOrganizer();
    if (v9)
    {
      v10 = (const void *)v9;
      v7 = CalOrganizerIsSelf() ^ 1;
      CFRelease(v10);
    }
    else
    {
      v7 = 1;
    }
  }
  v3 = v7 & ~objc_msgSend((id)objc_opt_class(), "storeIsReadOnlyDelegate:", v6);
  CFRelease(v6);
  if (v4)
LABEL_10:
    CFRelease(v4);
LABEL_11:

  return v3;
}

uint64_t __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kParticipationStatusModifiedDateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kParticipationStatusModifiedDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kStartDateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kStartDateKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  v18 = vabdd_f64(v8, *MEMORY[0x1E0D0C490]);
  v19 = vabdd_f64(v11, *MEMORY[0x1E0D0C490]);
  if (v18 < 2.22044605e-16 || v19 < 2.22044605e-16)
  {
    if (v18 < 2.22044605e-16 && v19 < 2.22044605e-16)
    {
      if (v14 >= v17)
        return v14 > v17;
      else
        return -1;
    }
    else if (v18 < 2.22044605e-16)
    {
      return 1;
    }
    else
    {
      return -1;
    }
  }
  else if (v8 >= v11)
  {
    if (v8 <= v11)
      return 0;
    else
      return -1;
  }
  else
  {
    return 1;
  }
}

- (void)CADResourceChange:(id)a3 setAlertedWithError:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  ClientConnection *conn;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  CADXPCImplementation *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADResourceChange_setAlertedWithError___block_invoke;
  v11[3] = &unk_1E6A36AC0;
  v9 = v6;
  v13 = self;
  v14 = &v15;
  v12 = v9;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v9, v11))
  {
    v10 = *((unsigned int *)v16 + 6);
  }
  else
  {
    v10 = 1010;
    *((_DWORD *)v16 + 6) = 1010;
  }
  v7[2](v7, v10);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v9);

  _Block_object_dispose(&v15, 8);
}

void __100__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADResourceChange_setAlertedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  const void *v6;

  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (!v4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1010;
    return;
  }
  v5 = v4;
  v6 = (const void *)CalResourceChangeCopyCalendarItem();
  if (v6
    && (CalEntityGetType() == 2
     && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "eventAccessLevel")
     || CalEntityGetType() == 3
     && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "reminderAccessGranted") & 1) == 0))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1013;
  }
  else
  {
    CalResourceChangeSetAlerted();
    if ((CalDatabaseSave() & 1) == 0)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1007;
    if (!v6)
      goto LABEL_14;
  }
  CFRelease(v6);
LABEL_14:
  CFRelease(v5);
}

- (void)CADEventSetInvitationStatus:(int)a3 forEvents:(id)a4 error:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  ClientConnection *conn;
  _QWORD v11[5];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADEventSetInvitationStatus_forEvents_error___block_invoke;
  v11[3] = &unk_1E6A36B48;
  v11[4] = &v13;
  v12 = a3;
  -[ClientConnection withDatabaseForObjects:perform:](conn, "withDatabaseForObjects:perform:", v8, v11);
  v9[2](v9, *((unsigned int *)v14 + 6));
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8);
  _Block_object_dispose(&v13, 8);

}

void __106__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADEventSetInvitationStatus_forEvents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, os_unfair_lock_s *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(a4 + 20);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        if (!_CADGetEntity((uint64_t)a4, *(void **)(*((_QWORD *)&v12 + 1) + 8 * i)))
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1010;
          goto LABEL_11;
        }
        _CalEventSetInvitationStatus();
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (*MEMORY[0x1E0D0A160])
      os_unfair_lock_assert_owner(a4 + 20);
    os_unfair_lock_unlock(a4 + 20);
    CalDatabaseRevert();
  }
  else if ((CalDatabaseSaveWithOptions() & 1) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1007;
  }

}

void __55__CADXPCImplementation_accessGrantedToPerformSelector___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  _QWORD v134[132];
  _QWORD v135[134];

  v135[132] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_CADDatabaseSetInitializationOptions_reply_);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v133;
  v135[0] = &unk_1E6A50438;
  NSStringFromSelector(sel_CADDatabaseGetAccess_);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v132;
  v135[1] = &unk_1E6A50438;
  NSStringFromSelector(sel_CADDatabaseRequestAccessForEntityType_desiredFullAccess_isBlockingUIThread_reason_reply_);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v131;
  v135[2] = &unk_1E6A50438;
  NSStringFromSelector(sel_CADDatabaseResetWithReply_);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v130;
  v135[3] = &unk_1E6A50438;
  NSStringFromSelector(sel_CADDatabaseGetAlarmWithUUID_reply_);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v134[4] = v129;
  v135[4] = &unk_1E6A50450;
  NSStringFromSelector(sel_CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply_);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v134[5] = v128;
  v135[5] = &unk_1E6A50450;
  NSStringFromSelector(sel_CADDatabaseGetCalendarItemWithUUID_reply_);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v134[6] = v127;
  v135[6] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply_);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v134[7] = v126;
  v135[7] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply_);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v134[8] = v125;
  v135[8] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply_);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v134[9] = v124;
  v135[9] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetAlarmWithExternalID_reply_);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v134[10] = v123;
  v135[10] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply_);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v134[11] = v122;
  v135[11] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADDatabaseCancelFetchRequestWithIdentifier_);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v134[12] = v121;
  v135[12] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseExportICSForCalendarItemWithID_occurrenceDate_options_reply_);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v134[13] = v120;
  v135[13] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetCalendarsWithFaultedProperties_reply_);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v134[14] = v119;
  v135[14] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADCalendar_hasEvents_);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v134[15] = v118;
  v135[15] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADCalendar_hasEventsWithRoomAsAttendee_);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v134[16] = v117;
  v135[16] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetUUID_);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v134[17] = v116;
  v135[17] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseRegisterForDetailedChangeTrackingInSource_reply_);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v134[18] = v115;
  v135[18] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseUnregisterForDetailedChangeTracking_);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v134[19] = v114;
  v135[19] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseFetchChangedObjectIDs_);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v134[20] = v113;
  v135[20] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply_);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v134[21] = v112;
  v135[21] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken_reply_);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v134[22] = v111;
  v135[22] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseConsumeAllChangesUpToToken_except_reply_);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v134[23] = v110;
  v135[23] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseMarkIndividualChangesConsumed_reply_);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v134[24] = v109;
  v135[24] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetSequenceToken_);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v134[25] = v108;
  v135[25] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetChangesSinceSequenceToken_reply_);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v134[26] = v107;
  v135[26] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetChangedEntityIDsSinceTimestamp_reply_);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v134[27] = v106;
  v135[27] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply_);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v134[28] = v105;
  v135[28] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseExportICSDataForCalendarItems_options_reply_);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v134[29] = v104;
  v135[29] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseExportICSDataForCalendar_options_reply_);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v134[30] = v103;
  v135[30] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseSetShowsDeclinedEvents_reply_);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v134[31] = v102;
  v135[31] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseSetShowsCompletedReminders_reply_);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v134[32] = v101;
  v135[32] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseRebuildOccurrenceCacheWithReply_);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v134[33] = v100;
  v135[33] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v134[34] = v99;
  v135[34] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADDatabaseCanModifyCalendarDatabase_);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v134[35] = v98;
  v135[35] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseLastConfirmedSplashScreenVersion_);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v134[36] = v97;
  v135[36] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseMigrateSubscribedCalendar_toSource_reply_);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v134[37] = v96;
  v135[37] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetDefaultAlarmOffsetForAllDay_reply_);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v134[38] = v95;
  v135[38] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADAnalyticsSendEvent_appendingClientBundleIDToPayload_);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v134[39] = v94;
  v135[39] = &unk_1E6A50498;
  NSStringFromSelector(sel_CADDatabaseStatsBySource_);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v134[40] = v93;
  v135[40] = &unk_1E6A504B0;
  NSStringFromSelector(sel_CADPersonaIdentifierForDatabaseID_reply_);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v134[41] = v92;
  v135[41] = &unk_1E6A504C8;
  NSStringFromSelector(sel_CADCatchUpIntegrationSyncingIfBehind_);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v134[42] = v91;
  v135[42] = &unk_1E6A504E0;
  NSStringFromSelector(sel_CADDatabaseGetDefaultLocalCalendarWithReply_);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v134[43] = v90;
  v135[43] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetOrCreateSubscribedCalendarsSource_);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v134[44] = v89;
  v135[44] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetOrCreateBirthdayCalendar_);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v134[45] = v88;
  v135[45] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetDefaultCalendarForNewEventsInDelegateSource_withReply_);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v134[46] = v87;
  v135[46] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADDatabaseSetDefaultCalendarForNewEvents_delegateSource_reply_);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v134[47] = v86;
  v135[47] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID_reply_);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v134[48] = v85;
  v135[48] = &unk_1E6A50498;
  NSStringFromSelector(sel_CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID_reply_);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v134[49] = v84;
  v135[49] = &unk_1E6A504F8;
  NSStringFromSelector(sel_CADDatabaseGetEventWithEventIdentifier_reply_);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v134[50] = v83;
  v135[50] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADDatabaseGetEventWithUniqueID_reply_);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v134[51] = v82;
  v135[51] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetAllEventsWithUniqueID_reply_);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v134[52] = v81;
  v135[52] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetBirthdayCalendarEnabledWithReply_);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v134[53] = v80;
  v135[53] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseSetBirthdayCalendarEnabled_withReply_);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v134[54] = v79;
  v135[54] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetBirthdayCalendarVersionWithReply_);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v134[55] = v78;
  v135[55] = &unk_1E6A50450;
  NSStringFromSelector(sel_CADDatabaseSetBirthdayCalendarVersion_withReply_);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v134[56] = v77;
  v135[56] = &unk_1E6A50450;
  NSStringFromSelector(sel_CADDatabaseGetSuggestedEventCalendarWithReply_);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v134[57] = v76;
  v135[57] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply_);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v134[58] = v75;
  v135[58] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseCanModifySuggestedEventCalendar_);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v134[59] = v74;
  v135[59] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetSourceIdentifierForEventWithObjectID_reply_);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v134[60] = v73;
  v135[60] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADDatabaseInsertSuggestedEventCalendarWithReply_);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v134[61] = v72;
  v135[61] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseRemoveSuggestedEventCalendarWithReply_);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v134[62] = v71;
  v135[62] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply_);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v134[63] = v70;
  v135[63] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply_);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v134[64] = v69;
  v135[64] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID_nearestDate_prefersForwardSearch_reply_);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v134[65] = v68;
  v135[65] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrenceCountWithStartDate_endDate_reply_);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v134[66] = v67;
  v135[66] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply_);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v134[67] = v66;
  v135[67] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheSearchWithTerm_inCalendars_responseToken_reply_);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v134[68] = v65;
  v135[68] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheSearchLocationsWithTerm_inCalendars_responseToken_reply_);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v134[69] = v64;
  v135[69] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrenceCacheCancelSearchWithReplyID_);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v134[70] = v63;
  v135[70] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADOccurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone_reply_);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v134[71] = v62;
  v135[71] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseShouldPermitOrganizerEmailFromJunkChecks_reply_);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v134[72] = v61;
  v135[72] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks_reply_);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v134[73] = v60;
  v135[73] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetAttachmentWithUUID_reply_);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v134[74] = v59;
  v135[74] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetTTLLocationAuthorizationStatus_);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v134[75] = v58;
  v135[75] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseLoadEventsInCalendar_reply_);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v134[76] = v57;
  v135[76] = &unk_1E6A50450;
  NSStringFromSelector(sel_CADMigrateDatabaseIfNeeded_);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v134[77] = v56;
  v135[77] = &unk_1E6A50438;
  NSStringFromSelector(sel_CADDatabaseGetSharedCalendarInvitationsWithReply_);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v134[78] = v55;
  v135[78] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADCalendarSetClearedFromNotificationCenter_error_);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v134[79] = v54;
  v135[79] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADDatabaseGetResourceChanges_);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v134[80] = v53;
  v135[80] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADDatabaseGetInviteReplyNotifications_);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v134[81] = v52;
  v135[81] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADDatabaseGetEventNotificationItemsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_reply_);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v134[82] = v51;
  v135[82] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADDatabaseGetNotificationCountForSourceWithExternalIdentifier_excludingDelegateSources_filteredByShowsNotificationsFlag_expanded_reply_);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v134[83] = v50;
  v135[83] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADDatabaseGetInboxRepliedSectionItems_);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v134[84] = v49;
  v135[84] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADResourceChange_setAlertedWithError_);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v134[85] = v48;
  v135[85] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADEventSetInvitationStatus_forEvents_error_);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v134[86] = v47;
  v135[86] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADObjectExists_reply_);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v134[87] = v46;
  v135[87] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObjectsExist_reply_);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v134[88] = v45;
  v135[88] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getPropertiesWithNames_reply_);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v134[89] = v44;
  v135[89] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObjects_getPropertiesWithNames_reply_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v134[90] = v43;
  v135[90] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getPropertyWithName_reply_);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v134[91] = v42;
  v135[91] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getStringPropertyWithName_reply_);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v134[92] = v41;
  v135[92] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getNumberPropertyWithName_reply_);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v134[93] = v40;
  v135[93] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getDatePropertyWithName_reply_);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v134[94] = v39;
  v135[94] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getDataPropertyWithName_reply_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v134[95] = v38;
  v135[95] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getSecurityScopedURLWrapperPropertyWithName_reply_);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v134[96] = v37;
  v135[96] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADObject_getRelatedObjectWithRelationName_reply_);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v134[97] = v36;
  v135[97] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObject_getRelatedObjectsWithRelationName_reply_);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v134[98] = v35;
  v135[98] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADObjectIsManaged_reply_);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v134[99] = v34;
  v135[99] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetSourcesWithFaultedProperties_reply_);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v134[100] = v33;
  v135[100] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADDatabaseGetLocalSourceWithEnableIfNeeded_reply_);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v134[101] = v32;
  v135[101] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetLocalBirthdaySource_);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v134[102] = v31;
  v135[102] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADObjectGetConstraints_reply_);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v134[103] = v30;
  v135[103] = &unk_1E6A50480;
  NSStringFromSelector(sel_CADSourceGetNotificationCollection_reply_);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v134[104] = v29;
  v135[104] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADSourceRefresh_isUserRequested_reply_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v134[105] = v28;
  v135[105] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADCountCalendarItemsOfType_inSource_reply_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v134[106] = v27;
  v135[106] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply_);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v134[107] = v26;
  v135[107] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADSourceGetGrantedDelegatesList_reply_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v134[108] = v25;
  v135[108] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADSourceUpdateGrantedDelegate_action_sourceID_reply_);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v134[109] = v24;
  v135[109] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v134[110] = v23;
  v135[110] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADSourceRemoveExchangeDelegateWithID_reply_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v134[111] = v22;
  v135[111] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADInternalForceStatCollection_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v134[112] = v21;
  v135[112] = &unk_1E6A50528;
  NSStringFromSelector(sel_CADInternalSetNextConferenceLinkRenewalToNow_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v134[113] = v20;
  v135[113] = &unk_1E6A50528;
  NSStringFromSelector(sel_CADInternalRemoveConferenceLinkRenewalDate_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v134[114] = v19;
  v135[114] = &unk_1E6A50528;
  NSStringFromSelector(sel_CADDatabaseGetNotificationCountExcludingUncheckedCalendars_expanded_reply_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v134[115] = v18;
  v135[115] = &unk_1E6A50540;
  NSStringFromSelector(sel_CADTestingSimulateDaemonCrash);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v134[116] = v17;
  v135[116] = &unk_1E6A50558;
  NSStringFromSelector(sel_CADTestingCloseDatabase_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v134[117] = v16;
  v135[117] = &unk_1E6A50558;
  NSStringFromSelector(sel_CADDatabaseGetDeletableCalendars_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v134[118] = v15;
  v135[118] = &unk_1E6A50570;
  NSStringFromSelector(sel_CADDatabaseGetDeletableSources_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v134[119] = v14;
  v135[119] = &unk_1E6A50570;
  NSStringFromSelector(sel_CADPurgeChangeTrackingReply_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v134[120] = v13;
  v135[120] = &unk_1E6A50588;
  NSStringFromSelector(sel_CADPostSyntheticRouteHypothesis_forEventWithExternalURL_reply_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v134[121] = v12;
  v135[121] = &unk_1E6A50588;
  NSStringFromSelector(sel_CADDatabaseGetStorageUsage_);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v134[122] = v0;
  v135[122] = &unk_1E6A505A0;
  NSStringFromSelector(sel_CADBackupDatabaseToFileNamed_inDirectory_includeAttachments_reply_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v134[123] = v1;
  v135[123] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADBackupToICBU_reply_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v134[124] = v2;
  v135[124] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v134[125] = v3;
  v135[125] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADRestoreFromICBU_reply_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v134[126] = v4;
  v135[126] = &unk_1E6A50510;
  NSStringFromSelector(sel_CADDiagnosticsCollectWithToken_options_trafficLogsCollectionMode_reply_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v134[127] = v5;
  v135[127] = &unk_1E6A505B8;
  NSStringFromSelector(sel_CADDiagnosticsCancelCollectionWithToken_reply_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v134[128] = v6;
  v135[128] = &unk_1E6A505B8;
  NSStringFromSelector(sel_CADDatabaseGetErrorCount_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v134[129] = v7;
  v135[129] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetEventsWithErrorsPerSource_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v134[130] = v8;
  v135[130] = &unk_1E6A50468;
  NSStringFromSelector(sel_CADDatabaseGetColorWithProviderIdentifier_externalID_reply_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v134[131] = v9;
  v135[131] = &unk_1E6A505D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, v134, 132);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)accessGrantedToPerformSelector__accessTypeBySelector;
  accessGrantedToPerformSelector__accessTypeBySelector = v10;

}

- (void)clearCachedAuthorizationStatus
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  self->_allowedAccess = 0;
  self->_checkedAccess = 0;
  os_unfair_lock_unlock(p_accessLock);
}

- (void)CADDatabaseGetUUID:(id)a3
{
  void (**v4)(id, uint64_t);
  ClientConnection *conn;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = (void (**)(id, uint64_t))a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  conn = self->_conn;
  v6 = *MEMORY[0x1E0D0BE78];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetUUID___block_invoke;
  v8[3] = &unk_1E6A36C30;
  v8[4] = &v9;
  -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v6, v8);
  if (v10[5])
    v7 = 0;
  else
    v7 = 1007;
  v4[2](v4, v7);
  _Block_object_dispose(&v9, 8);

}

void __70__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = CalDatabaseCopyUniqueIdentifier();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)CADDatabaseRegisterForDetailedChangeTrackingInSource:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  ClientConnection *conn;
  id *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[ClientConnection changeTrackingID](self->_conn, "changeTrackingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    conn = self->_conn;
    if (v6)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke;
      v15[3] = &unk_1E6A36AC0;
      v16 = v6;
      v18 = &v20;
      v17 = v9;
      -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v16, v15);
      v11 = &v16;

    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke_2;
      v13[3] = &unk_1E6A36A70;
      v14 = v8;
      -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v13);
      v11 = &v14;
    }

  }
  else
  {
    v12 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_ERROR, "Attempt to register for change tracking without a bundle ID nor a clientSuffix.", buf, 2u);
    }
    *((_DWORD *)v21 + 6) = 1018;
  }
  v7[2](v7);

  _Block_object_dispose(&v20, 8);
}

void __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = CalDatabaseCopyStoreWithUID();
  if (v2)
  {
    v3 = (const void *)v2;
    CalDatabaseRegisterClientForPersistentChangeTrackingInStore();
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1010;
  }
}

uint64_t __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke_2()
{
  return CalDatabaseRegisterClientForPersistentChangeTracking();
}

- (void)CADDatabaseUnregisterForDetailedChangeTracking:(id)a3
{
  ClientConnection *conn;
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  ClientConnection *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  conn = self->_conn;
  v5 = (void (**)(id, uint64_t))a3;
  -[ClientConnection changeTrackingID](conn, "changeTrackingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = self->_conn;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseUnregisterForDetailedChangeTracking___block_invoke;
    v11[3] = &unk_1E6A36A70;
    v12 = v6;
    -[ClientConnection withAllDatabasesPerform:](v8, "withAllDatabasesPerform:", v11);

    v9 = 0;
  }
  else
  {
    v10 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Attempt to unregister for change tracking without a bundle ID nor a clientSuffix.", buf, 2u);
    }
    v9 = 1018;
  }
  v5[2](v5, v9);

}

uint64_t __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseUnregisterForDetailedChangeTracking___block_invoke()
{
  return CalRemoveClientForPersistentChangeTracking();
}

- (void)CADDatabaseFetchChangedObjectIDs:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t, void *, id);
  void *v5;
  id v6;
  id v7;
  ClientConnection *conn;
  id v9;
  id v10;
  CADSequenceToken *v11;
  CADSequenceToken *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, uint64_t, uint64_t);
  void *v17;
  CADXPCImplementation *v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = (void (**)(id, _QWORD, uint64_t, void *, id))a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[ClientConnection changeTrackingID](self->_conn, "changeTrackingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    conn = self->_conn;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __84__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchChangedObjectIDs___block_invoke;
    v17 = &unk_1E6A36C58;
    v18 = self;
    v19 = v5;
    v9 = v6;
    v20 = v9;
    v22 = &v24;
    v10 = v7;
    v21 = v10;
    v23 = &v28;
    -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", &v14);
    if (*((_BYTE *)v25 + 24) || !*((_BYTE *)v29 + 24))
    {
      v11 = [CADSequenceToken alloc];
      v12 = -[CADSequenceToken initWithAllDBSequenceMap:](v11, "initWithAllDBSequenceMap:", v9, v14, v15, v16, v17, v18, v19, v20);
      v13 = 0;
    }
    else
    {

      v10 = 0;
      v12 = 0;
      v13 = 1;
    }
    v4[2](v4, 0, v13, v12, v10);

  }
  else
  {
    v4[2](v4, 1018, 0, 0, 0);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

void __84__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchChangedObjectIDs___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned __int8 v20;
  unsigned int v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "restrictedStoreRowIDsForAction:inDatabase:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v21 = -1;
  v20 = 0;
  v19 = 0;
  v18 = 0;
  CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  if ((int)CalDatabaseGetStoreForPersistentChangeTrackingClientIdentifier() >= 1)
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
  v11 = v20;
  if (!v20 && v7)
  {
    if (objc_msgSend(v7, "length"))
    {
      v23[0] = v7;
      v22[0] = CFSTR("changes");
      v22[1] = CFSTR("inserts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v19));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v12;
      v22[2] = CFSTR("updates");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v13;
      v22[3] = CFSTR("deletes");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)a1[7];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

      goto LABEL_13;
    }
    v11 = v20;
  }
  if (v11)
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
LABEL_13:

}

- (void)CADDatabaseFetchObjectChangesForEntityTypes:(id)a3 insideObject:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t, CADSequenceToken *, uint64_t);
  void *v11;
  id v12;
  __CFSet *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  ClientConnection *conn;
  uint64_t v21;
  void *v22;
  CADSequenceToken *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD *v36;
  __CFSet *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[5];
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t, CADSequenceToken *, uint64_t))a5;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  -[ClientConnection changeTrackingID](self->_conn, "changeTrackingID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__1;
    v52 = __Block_byref_object_dispose__1;
    v53 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__1;
    v46[4] = __Block_byref_object_dispose__1;
    v47 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v24 = v8;
    v13 = -[CADXPCImplementation _copyToIntCFSetRef:](self, "_copyToIntCFSetRef:", v8);
    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke;
    v28[3] = &unk_1E6A36C80;
    v28[4] = self;
    v37 = v13;
    v25 = v11;
    v29 = v11;
    v15 = v9;
    v16 = v9;
    v30 = v16;
    v32 = &v54;
    v17 = v12;
    v31 = v17;
    v33 = &v38;
    v34 = &v42;
    v35 = &v48;
    v36 = v46;
    v18 = (void *)MEMORY[0x1BCC9D8DC](v28);
    v19 = v18;
    conn = self->_conn;
    if (v16)
    {
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke_2;
      v26[3] = &unk_1E6A36CA8;
      v27 = v18;
      -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v16, v26);

    }
    else
    {
      -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v18);
    }
    CFRelease(v13);
    v9 = v15;
    if (*((_BYTE *)v39 + 24) || !*((_BYTE *)v43 + 24))
    {
      v11 = v25;
      if (!*((_DWORD *)v55 + 6))
      {
        v23 = -[CADSequenceToken initWithAllDBSequenceMap:]([CADSequenceToken alloc], "initWithAllDBSequenceMap:", v17);
        v21 = 0;
        goto LABEL_13;
      }
      v21 = 0;
    }
    else
    {
      v21 = 1;
      v11 = v25;
    }
    v22 = (void *)v49[5];
    v49[5] = 0;

    v23 = 0;
LABEL_13:
    v10[2](v10, *((unsigned int *)v55 + 6), v21, v23, v49[5]);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(v46, 8);

    _Block_object_dispose(&v48, 8);
    v8 = v24;
    goto LABEL_14;
  }
  v10[2](v10, 1018, 0, 0, 0);
LABEL_14:

  _Block_object_dispose(&v54, 8);
}

void __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;

  v22 = -1;
  v21 = 0;
  objc_msgSend(*(id *)(a1[4] + 8), "restrictedStoreRowIDsForAction:inDatabase:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = v21;
  if (CalDatabaseGetChangedEKObjectsForClient())
  {
    *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = 1007;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)a1[7];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    if ((int)CalDatabaseGetStoreForPersistentChangeTrackingClientIdentifier() >= 1)
      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
    if (objc_msgSend(v9, "count"))
    {
      v13 = *(_QWORD *)(a1[11] + 8);
      v16 = *(void **)(v13 + 40);
      v15 = (id *)(v13 + 40);
      v14 = v16;
      if (v16)
      {
        v17 = *(void **)(*(_QWORD *)(a1[12] + 8) + 40);
        if (!v17)
        {
          v18 = objc_msgSend(v14, "mutableCopy");
          v19 = *(_QWORD *)(a1[12] + 8);
          v20 = *(void **)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v18;

          objc_storeStrong((id *)(*(_QWORD *)(a1[11] + 8) + 40), *(id *)(*(_QWORD *)(a1[12] + 8) + 40));
          v17 = *(void **)(*(_QWORD *)(a1[12] + 8) + 40);
        }
        objc_msgSend(v17, "addObjectsFromArray:", v9);
      }
      else
      {
        objc_storeStrong(v15, v9);
      }
    }
  }

}

uint64_t __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke_2(uint64_t a1)
{
  char v2;

  v2 = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  ClientConnection *conn;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void (**v18)(id, uint64_t);
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[ClientConnection changeTrackingID](self->_conn, "changeTrackingID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v18 = v7;
    v19 = v6;
    objc_msgSend(v6, "allDBSequenceMap");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          conn = self->_conn;
          v15 = objc_msgSend(v13, "intValue");
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken_reply___block_invoke;
          v21[3] = &unk_1E6A36CD0;
          v16 = v8;
          v22 = v16;
          v23 = v13;
          v24 = v20;
          -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v15, v21);

        }
        v10 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v17 = 0;
    v7 = v18;
    v6 = v19;
  }
  else
  {
    v17 = 1018;
  }
  v7[2](v7, v17);

}

uint64_t __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken_reply___block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "intValue");

  return CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
}

- (void)CADDatabaseConsumeAllChangesUpToToken:(id)a3 except:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  CADXPCImplementation *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  ClientConnection *conn;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void (**v21)(id, uint64_t);
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = self;
  -[ClientConnection changeTrackingID](self->_conn, "changeTrackingID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v21 = v9;
    v22 = v8;
    objc_msgSend(v8, "allDBSequenceMap");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          conn = v10->_conn;
          v18 = objc_msgSend(v16, "intValue");
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseConsumeAllChangesUpToToken_except_reply___block_invoke;
          v25[3] = &unk_1E6A36D20;
          v19 = v11;
          v26 = v19;
          v27 = v16;
          v28 = v24;
          v29 = v23;
          -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v18, v25);

        }
        v13 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }

    v20 = 0;
    v9 = v21;
    v8 = v22;
  }
  else
  {
    v20 = 1018;
  }
  v9[2](v9, v20);

}

void __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseConsumeAllChangesUpToToken_except_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intValue");

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0BAF0], "makeObjectChangeEntityTypeMapToSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 56);
  v5 = v4;
  CalDatabaseEnumerateUnconsumedObjectChangesForClient();

}

void __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseConsumeAllChangesUpToToken_except_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFArray *a5, const __CFArray *a6)
{
  void *v9;
  void *v10;
  uint64_t Count;
  uint64_t v12;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  void *v16;
  char v17;
  id v18;

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  Count = CFArrayGetCount(a5);
  if (Count >= 1)
  {
    v12 = Count;
    Mutable = CFArrayCreateMutable(0, Count, 0);
    for (i = 0; i != v12; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a5, i);
      if (*(_DWORD *)(a1 + 56) >= (int)CFArrayGetValueAtIndex(a6, i))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ValueAtIndex);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v18, "containsObject:", v16);

        if ((v17 & 1) == 0)
          CFArrayAppendValue(Mutable, (const void *)(int)ValueAtIndex);
      }
    }
    if (CFArrayGetCount(Mutable) > 0)
      CalDatabaseClearIndividualChangeRowIDsForClient();
    if (Mutable)
      CFRelease(Mutable);
  }

}

- (void)CADDatabaseMarkIndividualChangesConsumed:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  ClientConnection *conn;
  uint64_t v15;
  id v16;
  void (**v17)(id, uint64_t);
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  CADXPCImplementation *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[ClientConnection changeTrackingID](self->_conn, "changeTrackingID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v17 = v7;
    v18 = v6;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          conn = self->_conn;
          v15 = objc_msgSend(v13, "intValue");
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkIndividualChangesConsumed_reply___block_invoke;
          v20[3] = &unk_1E6A36D20;
          v16 = v8;
          v21 = v16;
          v22 = v13;
          v23 = self;
          v24 = v19;
          -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v15, v20);

        }
        v10 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v7 = v17;
    v17[2](v17, 0);
    v6 = v18;
  }
  else
  {
    v7[2](v7, 1018);
  }

}

void __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkIndividualChangesConsumed_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0BAF0], "makeObjectChangeEntityTypeMapToArray:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "intValue");
        objc_msgSend(v2, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (const void *)objc_msgSend(*(id *)(a1 + 48), "_copyToIntCFArrayRef:", v9);
        CalDatabaseClearIndividualChangeRowIDsForClient();
        CFRelease(v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (__CFArray)_copyToIntCFArrayRef:(id)a3
{
  id v3;
  __CFArray *Mutable;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  Mutable = CFArrayCreateMutable(0, objc_msgSend(v3, "count"), 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        CFArrayAppendValue(Mutable, (const void *)(int)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "intValue", (_QWORD)v11));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return Mutable;
}

- (__CFSet)_copyToIntCFSetRef:(id)a3
{
  id v3;
  __CFSet *Mutable;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  Mutable = CFSetCreateMutable(0, objc_msgSend(v3, "count"), 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        CFSetAddValue(Mutable, (const void *)(int)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "intValue", (_QWORD)v11));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return Mutable;
}

- (void)CADDatabaseGetSequenceToken:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  ClientConnection *conn;
  CADSequenceToken *v7;
  CADSequenceToken *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  conn = self->_conn;
  v15 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetSequenceToken___block_invoke;
  v9[3] = &unk_1E6A36D48;
  v9[4] = &v10;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  v7 = [CADSequenceToken alloc];
  v8 = -[CADSequenceToken initWithAllDBSequenceMap:](v7, "initWithAllDBSequenceMap:", v11[5]);
  v4[2](v4, 0, v8);

  _Block_object_dispose(&v10, 8);
}

void __79__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetSequenceToken___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t SequenceNumber;
  void *v5;
  void *v6;
  id v7;

  SequenceNumber = CalDatabaseGetSequenceNumber();
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", SequenceNumber);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v6);

}

- (void)CADDatabaseGetChangesSinceSequenceToken:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id, void *);
  void *v8;
  void *v9;
  ClientConnection *conn;
  id v11;
  id v12;
  id v13;
  CADSequenceToken *v14;
  CADSequenceToken *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id, void *))a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  conn = self->_conn;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __97__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangesSinceSequenceToken_reply___block_invoke;
  v19 = &unk_1E6A36D70;
  v11 = v6;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v23 = &v24;
  v13 = v8;
  v22 = v13;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", &v16);
  if (*((_DWORD *)v25 + 6))
  {

    v13 = 0;
    v14 = 0;
  }
  else
  {
    v15 = [CADSequenceToken alloc];
    v14 = -[CADSequenceToken initWithAllDBSequenceMap:](v15, "initWithAllDBSequenceMap:", v12, v16, v17, v18, v19, v20, v21);
  }
  v7[2](v7, *((unsigned int *)v25 + 6), v13, v14);

  _Block_object_dispose(&v24, 8);
}

void __97__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangesSinceSequenceToken_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  NSObject *v8;
  uint64_t SequenceNumber;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(*(id *)(a1 + 32), "sequenceForDatabaseID:", a2);
  if (v7 < 0)
  {
    v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v15 = 67109120;
      v16 = a2;
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_INFO, "The sequence number for databaseID %d is less than 0. This should only happen when a new aux database is added", (uint8_t *)&v15, 8u);
    }
  }
  SequenceNumber = CalDatabaseGetSequenceNumber();
  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", SequenceNumber);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, v12);

  if (v7 <= (int)SequenceNumber)
  {
    v14 = (void *)CalDatabaseCopyChangesSinceSequenceNumber();
    objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v14);

  }
  else
  {
    v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = 67109632;
      v16 = v7;
      v17 = 1024;
      v18 = SequenceNumber;
      v19 = 1024;
      v20 = a2;
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "Error: The lastSequenceNumber %d is greater than the currentSequenceNumber %d for databaseID %d", (uint8_t *)&v15, 0x14u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1001;
    *a4 = 1;
  }
}

- (void)CADDatabaseGetChangedEntityIDsSinceTimestamp:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  ClientConnection *conn;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CADInMemoryChangeTimestamp *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v6 = a3;
  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  -[ClientConnection databaseInitializationOptions](self->_conn, "databaseInitializationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowIntegrations");

  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "allDatabases");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v13);
  else
    v14 = 0;
  conn = self->_conn;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangedEntityIDsSinceTimestamp_reply___block_invoke;
  v22[3] = &unk_1E6A36D98;
  v28 = &v35;
  v16 = v6;
  v23 = v16;
  v30 = v9;
  v17 = v10;
  v24 = v17;
  v18 = v11;
  v25 = v18;
  v29 = &v31;
  v19 = v12;
  v26 = v19;
  v20 = v14;
  v27 = v20;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v22);
  if (objc_msgSend(v20, "count"))
  {
    *((_BYTE *)v36 + 24) = 1;
LABEL_7:

    v17 = 0;
    v18 = 0;
    *((_BYTE *)v32 + 24) = 0;
    goto LABEL_8;
  }
  if (*((_BYTE *)v36 + 24))
    goto LABEL_7;
LABEL_8:
  v21 = -[CADInMemoryChangeTimestamp initWithTimestamps:]([CADInMemoryChangeTimestamp alloc], "initWithTimestamps:", v19);
  (*((void (**)(id, _QWORD, id, id, CADInMemoryChangeTimestamp *, _QWORD))v7 + 2))(v7, 0, v17, v18, v21, *((unsigned __int8 *)v32 + 24));

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

void __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangedEntityIDsSinceTimestamp_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  NSObject *v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  id v19;
  uint64_t v20;
  uint8_t buf[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0BB30], "changeTrackingForDatabase:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a2;
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_ERROR, "No change tracking for database with id %i. (Will not return any changes.)", buf, 8u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v9 = (os_unfair_lock_s *)(a3 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 80));
    v10 = *(_QWORD *)(a3 + 160);
    if (*MEMORY[0x1E0D0A160])
      os_unfair_lock_assert_owner(v9);
    os_unfair_lock_unlock(v9);
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BB50]), "initWithTimestampForMyself:others:", CalMonotonicTime(), v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "timestampForDatabase:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BB50]), "initWithDawnOfTime");
    v20 = 1;
    *(_QWORD *)buf = 0;
    v13 = *(unsigned __int8 *)(a1 + 88);
    v19 = 0;
    objc_msgSend(v7, "changedEntityIDsForDatabase:sinceTimestamp:allowIntegrationChanges:latestTimestamp:changeType:deleteOffset:", a3, v12, v13, &v19, &v20, buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v6);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)buf);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v15, v6);

      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      if (*(_BYTE *)(v16 + 24))
        v17 = v20 == 1;
      else
        v17 = 0;
      v18 = v17;
      *(_BYTE *)(v16 + 24) = v18;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v11, v6);
  objc_msgSend(*(id *)(a1 + 64), "removeObject:", v6);

}

- (void)CADDatabaseCanModifyCalendarDatabase:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, _QWORD, BOOL))a3 + 2))(v5, 0, -[CADXPCImplementation _CADDatabaseCanModifyCalendarDatabase](self, "_CADDatabaseCanModifyCalendarDatabase"));

}

- (BOOL)_CADDatabaseCanModifyCalendarDatabase
{
  void *v2;
  char v3;

  -[ClientConnection permissionValidator](self->_conn, "permissionValidator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canModifyCalendarDatabase");

  return v3;
}

- (void)CADDatabaseLastConfirmedSplashScreenVersion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  ClientConnection *conn;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v5 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    conn = self->_conn;
    v7 = v5;
    -[ClientConnection identity](conn, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[CADXPCImplementation(CADDatabaseOperationGroup) CADDatabaseLastConfirmedSplashScreenVersion:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_DEBUG, "[%s] called by client: [%@].", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D0BB10], "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, objc_msgSend(v9, "get_LastConfirmedSplashScreenVersionViewed"));

}

- (void)CADDatabaseImportEvents:(id)a3 fromICSData:(id)a4 intoCalendarsWithIDs:(id)a5 optionsMask:(unint64_t)a6 batchSize:(int)a7 reply:(id)a8
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  ClientConnection *conn;
  id v49;
  id v50;
  id v51;
  id v52;
  int v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void (**v59)(id, uint64_t, _QWORD);
  id v63;
  id obj;
  unsigned int v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  CADXPCImplementation *v84;
  id v85;
  id v86;
  id v87;
  uint64_t *v88;
  _BYTE *v89;
  unint64_t v90;
  int v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  int v103;
  _BYTE v104[128];
  uint8_t v105[128];
  _BYTE buf[24];
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v59 = (void (**)(id, uint64_t, _QWORD))a8;
  v70 = v12;
  v14 = objc_msgSend(v12, "count");
  v58 = v13;
  v67 = v11;
  if (v14 != objc_msgSend(v13, "count"))
  {
    v18 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = objc_msgSend(v12, "count");
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v13, "count");
      _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_ERROR, "Mismatched number of data objects (%lu) and calendar row IDs (%lu).", buf, 0x16u);

    }
    goto LABEL_9;
  }
  if (v11)
  {
    v15 = objc_msgSend(v11, "count");
    if (v15 != objc_msgSend(v13, "count"))
    {
      v20 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = objc_msgSend(v11, "count");
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = objc_msgSend(v13, "count");
        _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Mismatched number of ID maps (%lu) and calendar row IDs (%lu).", buf, 0x16u);

      }
LABEL_9:
      v59[2](v59, 1001, 0);
      goto LABEL_48;
    }
  }
  v100 = 0;
  v101 = &v100;
  v102 = 0x2020000000;
  v103 = 0;
  v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v16 = 0;
  v17 = MEMORY[0x1E0C9AA60];
  while (v16 < objc_msgSend(v12, "count"))
  {
    objc_msgSend(v63, "addObject:", v17);
    ++v16;
  }
  v71 = (id)objc_opt_new();
  if (v11)
    v75 = (void *)objc_opt_new();
  else
    v75 = 0;
  v74 = (void *)objc_opt_new();
  v73 = (void *)objc_opt_new();
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v58;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
  if (v22)
  {
    v23 = 0;
    v66 = *(_QWORD *)v97;
    v65 = *MEMORY[0x1E0D0BE78];
    do
    {
      v68 = v22;
      for (i = 0; i != v68; ++i)
      {
        if (*(_QWORD *)v97 != v66)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v25 == v26;

        v28 = v65;
        if (!v27)
          v28 = objc_msgSend(v25, "databaseID", v65);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectForKeyedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectForKeyedSubscript:", v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v34 = v32;
        }
        else
        {
          v30 = (void *)objc_opt_new();
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v30, v29);
          if (v75)
          {
            v35 = objc_opt_new();

            objc_msgSend(v75, "setObject:forKeyedSubscript:", v35, v29);
            v31 = (void *)v35;
          }
          v34 = (void *)objc_opt_new();

          objc_msgSend(v74, "setObject:forKeyedSubscript:", v34, v29);
          v36 = objc_opt_new();

          objc_msgSend(v73, "setObject:forKeyedSubscript:", v36, v29);
          v33 = (void *)v36;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23 + i);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v37);

        objc_msgSend(v67, "objectAtIndexedSubscript:", v23 + i);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v38);

        objc_msgSend(v70, "objectAtIndexedSubscript:", v23 + i);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v39);

        objc_msgSend(v33, "addObject:", v25);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
      v23 += i;
    }
    while (v22);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v107 = __Block_byref_object_copy__1;
  v108 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v109 = (id)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v72 = v71;
  v40 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v40)
  {
    v69 = *(_QWORD *)v93;
LABEL_32:
    v41 = 0;
    while (1)
    {
      if (*(_QWORD *)v93 != v69)
        objc_enumerationMutation(v72);
      v42 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v41);
      v43 = objc_msgSend(v42, "intValue");
      objc_msgSend(v72, "objectForKeyedSubscript:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "objectForKeyedSubscript:", v42);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectForKeyedSubscript:", v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectForKeyedSubscript:", v42);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      conn = self->_conn;
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __136__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply___block_invoke;
      v80[3] = &unk_1E6A36DC0;
      v81 = v70;
      v49 = v46;
      v82 = v49;
      v50 = v47;
      v83 = v50;
      v84 = self;
      v51 = v45;
      v91 = a7;
      v85 = v51;
      v88 = &v100;
      v89 = buf;
      v90 = a6;
      v52 = v44;
      v86 = v52;
      v63 = v63;
      v87 = v63;
      -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v43, v80);
      v53 = *((_DWORD *)v101 + 6);
      if (v53)
      {

        v63 = 0;
      }

      if (v53)
        break;
      if (v40 == ++v41)
      {
        v40 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
        if (v40)
          goto LABEL_32;
        break;
      }
    }
  }

  ((void (**)(id, uint64_t, id))v59)[2](v59, *((unsigned int *)v101 + 6), v63);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v54 = v63;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v104, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v77 != v56)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j));
      }
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v104, 16);
    }
    while (v55);
  }

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v100, 8);
LABEL_48:

}

void __136__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  CFIndex Count;
  CFIndex v31;
  CFIndex k;
  void *v33;
  char v34;
  uint64_t v35;
  void *v37;
  char *obj;
  id obja;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v3 = a1;
  v56 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = *(id *)(v3 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  v40 = v3;
  if (v6)
  {
    v7 = v6;
    v34 = 0;
    obj = 0;
    v35 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v35)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(*(id *)(v3 + 48), "objectAtIndexedSubscript:", &obj[i]);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v10;
        if (v10 == v11)
        {

          v12 = 0;
        }
        v13 = *(void **)(v3 + 56);
        objc_msgSend(*(id *)(v3 + 64), "objectAtIndexedSubscript:", &obj[i]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(v40 + 104);
        v16 = *(unsigned int *)(v40 + 112);
        v45 = v12;
        objc_msgSend(v13, "_importEvents:data:intoCalendarWithID:inDatabase:optionsMask:batchSize:outCalendarObjectID:outError:", v14, v9, v12, a3, v15, v16, &v45, *(_QWORD *)(*(_QWORD *)(v40 + 88) + 8) + 24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v45;

        v3 = v40;
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v40 + 88) + 8) + 24))
        {
          v20 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            v21 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v40 + 88) + 8) + 24);
            *(_DWORD *)buf = 138543618;
            v52 = v10;
            v53 = 1024;
            v54 = v21;
            _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_ERROR, "Importing ICS data into calendar id %{public}@ failed with error %i", buf, 0x12u);
          }
          CalDatabaseRevert();

          goto LABEL_35;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 96) + 8) + 40), "addObject:", v18);
        if (v17)
        {
          v34 = 1;
        }
        else
        {
          v19 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v10;
            _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_INFO, "Importing ICS data into calendar id %{public}@ failed; returning no objects for this document",
              buf,
              0xCu);
          }
          v17 = (void *)MEMORY[0x1E0C9AA60];
        }
        objc_msgSend(v4, "addObject:", v17);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      obj += i;
      if (v7)
        continue;
      break;
    }

    if ((v34 & 1) != 0)
      CalDatabaseSave();
  }
  else
  {

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v4;
  v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v22)
  {
    v23 = v22;
    v37 = v4;
    obja = v5;
    v24 = 0;
    v25 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(obja);
        v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
        objc_msgSend(*(id *)(v40 + 72), "objectAtIndexedSubscript:", v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v40 + 80), "setObject:atIndexedSubscript:", v28, (int)objc_msgSend(v29, "intValue"));
        Count = CFArrayGetCount((CFArrayRef)v27);
        if (Count >= 1)
        {
          v31 = Count;
          for (k = 0; k != v31; ++k)
          {
            CFArrayGetValueAtIndex((CFArrayRef)v27, k);
            CADEntityCopyObjectID();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
              objc_msgSend(v28, "addObject:", v33);

          }
        }
        ++v24;

      }
      v5 = obja;
      v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v23);
    v4 = v37;
  }
LABEL_35:

}

- (id)_importEvents:(id)a3 data:(id)a4 intoCalendarWithID:(id)a5 inDatabase:(CalDatabase *)a6 optionsMask:(unint64_t)a7 batchSize:(int)a8 outCalendarObjectID:(id *)a9 outError:(int *)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t DefaultCalendarForNewEvents;
  const void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  void *updated;
  id (*v28)(void *, void *);
  int Type;
  id (*v30)(void *, void *);
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  const char *v45;
  void *v46;
  void *v47;
  int v48;
  CADXPCImplementation *v49;
  uint64_t v50;
  const void *v51;
  uint64_t v52;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *log;
  _BOOL8 v61;
  id (*v62)(void *, void *);
  void *v63;
  void *v64;
  void *v65;
  int v66;
  id v67;
  void *context;
  int v69;
  void *v70;
  const void *v71;
  unint64_t v72;
  id v73;
  uint64_t v74;
  uint8_t buf[4];
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  if (a8)
    CalDatabaseReset();
  if (v18)
  {
    objc_msgSend(v18, "entityID");
    DefaultCalendarForNewEvents = CalDatabaseCopyCalendarWithUID();
  }
  else
  {
    DefaultCalendarForNewEvents = CalDatabaseCopyOrCreateDefaultCalendarForNewEvents();
  }
  v20 = (const void *)DefaultCalendarForNewEvents;
  if (-[CADXPCImplementation _CADDatabaseCanModifyCalendarDatabase](self, "_CADDatabaseCanModifyCalendarDatabase"))
  {
    if (!v20)
    {
      v23 = 0;
      v22 = 1001;
      v24 = v16;
      goto LABEL_86;
    }
    CADEntityCopyObjectID();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = a7;
    if (v21)
    {
      if (-[ClientConnection isCalendarRestricted:forAction:](self->_conn, "isCalendarRestricted:forAction:", v20, 1))
      {
        v22 = 1013;
        if (!a9)
          goto LABEL_17;
      }
      else
      {
        if (v17)
          v22 = 0;
        else
          v22 = 1001;
        if (!a9)
        {
LABEL_17:

          if (v22)
          {
            v23 = 0;
            v24 = v16;
            goto LABEL_85;
          }
          v25 = (const void *)CalCalendarCopyStore();
          v24 = v16;
          v71 = v25;
          if (v25)
          {
            if (CalStoreGetProhibitsICSImport())
            {
              v26 = CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v76 = v18;
                _os_log_impl(&dword_1B6A18000, v26, OS_LOG_TYPE_INFO, "Skipping import into calendar id %{public}@ because its source doesn't allow ICS import.", buf, 0xCu);
              }
              CalStoreGetType();
              updated = 0;
LABEL_81:
              CFRelease(v25);
LABEL_82:
              v22 = 0;
              if (updated)
                v23 = updated;
              else
                v23 = (void *)MEMORY[0x1E0C9AA60];
              goto LABEL_85;
            }
            Type = CalStoreGetType();
            if (v16)
              v30 = _copyExternalIDCallback;
            else
              v30 = 0;
            v62 = v30;
            if (!Type)
            {
              -[ClientConnection localAccountInfo](self->_conn, "localAccountInfo");
              v31 = objc_claimAutoreleasedReturnValue();
LABEL_38:
              v70 = (void *)v31;
              context = (void *)MEMORY[0x1BCC9D714]();
              v73 = 0;
              v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithData:options:error:", v17, v72, &v73);
              v67 = v73;
              if (!v32)
              {
                v40 = CADLogHandle;
                if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = v67;
                  v76 = v67;
                  _os_log_impl(&dword_1B6A18000, v40, OS_LOG_TYPE_ERROR, "Could not parse ICSDocument: %@", buf, 0xCu);
                  updated = 0;
                  v42 = 0;
                  v43 = v70;
                  v25 = v71;
                }
                else
                {
                  updated = 0;
                  v42 = 0;
                  v43 = v70;
                  v25 = v71;
                  v41 = v67;
                }
LABEL_80:

                objc_autoreleasePoolPop(context);
                if (!v25)
                  goto LABEL_82;
                goto LABEL_81;
              }
              v65 = v32;
              objc_msgSend(v32, "calendar");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v33;
              if ((*MEMORY[0x1E0D0BE98] & v72) != 0)
              {
                v34 = 0;
                v35 = 0;
                v36 = 1;
                v25 = v71;
              }
              else
              {
                v34 = objc_msgSend(v33, "method");
                v25 = v71;
                v35 = 0;
                v36 = 1;
                switch((int)v34)
                {
                  case 0:
                  case 1:
                    break;
                  case 2:
                  case 5:
                    v35 = 1;
                    break;
                  case 3:
                    v36 = 0;
                    v35 = 1;
                    v34 = 3;
                    break;
                  default:
                    v35 = 0;
                    v36 = 0;
                    break;
                }
              }
              v69 = v36;
              if ((*MEMORY[0x1E0D0BEA8] & v72) != 0)
                v37 = v35;
              else
                v37 = 0;
              v66 = v37;
              v61 = (*MEMORY[0x1E0D0BE88] & v72) != 0;
              objc_msgSend(MEMORY[0x1E0DDB7D8], "ICSStringFromMethod:", v34);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v35 & 1) != 0 || (v69 & 1) != 0)
              {
                if (((v69 | v66) & 1) != 0)
                {
                  log = CADLogHandle;
                  v44 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT);
                  if ((v69 & 1) != 0)
                  {
                    if (v66)
                    {
                      if (!v44)
                      {
LABEL_63:
                        objc_msgSend(v64, "components");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        LOBYTE(v59) = 1;
                        updated = (void *)CalItemsUpdateFromiCalendarDocumentWithOptionsIncludingPhantomMaster();
                        objc_msgSend(v64, "components", v16, v62, v16, v59, v70);
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v47 == v46)
                          v48 = 0;
                        else
                          v48 = v66;

                        if (v48 == 1)
                          objc_msgSend(v64, "setComponents:options:", v46, 2);

                        v25 = v71;
LABEL_72:
                        v43 = v70;
                        if (v66)
                        {
                          v49 = self;
                          v42 = v65;
                          v50 = -[CADXPCImplementation _handleiTIPMesssageAndCopyEventFromDocument:data:database:store:accountInfo:options:](v49, "_handleiTIPMesssageAndCopyEventFromDocument:data:database:store:accountInfo:options:", v65, v17, a6, v25, v70, v61);
                          if (v50)
                          {
                            v51 = (const void *)v50;
                            if ((v69 & 1) == 0)
                            {
                              v74 = v50;
                              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
                              v52 = objc_claimAutoreleasedReturnValue();

                              updated = (void *)v52;
                              v42 = v65;
                            }
                            v41 = v67;
                            CFRelease(v51);
                            goto LABEL_79;
                          }
                          v54 = (void *)CADLogHandle;
                          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                          {
                            v55 = v54;
                            objc_msgSend(v65, "calendar");
                            v56 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v56, "componentKeys");
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v57, "firstObject");
                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412290;
                            v76 = v58;
                            _os_log_impl(&dword_1B6A18000, v55, OS_LOG_TYPE_ERROR, "Didn't find event while handling iTIP message. (%@)", buf, 0xCu);

                            v24 = v16;
                            v42 = v65;

                            v43 = v70;
                          }
                        }
                        else
                        {
                          v42 = v65;
                        }
                        v41 = v67;
LABEL_79:

                        goto LABEL_80;
                      }
                      *(_DWORD *)buf = 138543362;
                      v76 = v63;
                      v45 = "Importing & handling iTIP message of type %{public}@";
                    }
                    else if (v35)
                    {
                      if (!v44)
                        goto LABEL_63;
                      *(_DWORD *)buf = 138543362;
                      v76 = v63;
                      v45 = "Import-only requested for iTIP message of type %{public}@";
                    }
                    else
                    {
                      if (!v44)
                        goto LABEL_63;
                      *(_DWORD *)buf = 138543362;
                      v76 = v63;
                      v45 = "Importing ICS with type %{public}@";
                    }
                    _os_log_impl(&dword_1B6A18000, log, OS_LOG_TYPE_DEFAULT, v45, buf, 0xCu);
                    goto LABEL_63;
                  }
                  if (v44)
                  {
                    *(_DWORD *)buf = 138543362;
                    v76 = v63;
                    _os_log_impl(&dword_1B6A18000, log, OS_LOG_TYPE_DEFAULT, "Handling iTIP message of type %{public}@", buf, 0xCu);
                  }
LABEL_71:
                  updated = 0;
                  goto LABEL_72;
                }
                v38 = CADLogHandle;
                if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                {
LABEL_62:
                  if (v69)
                    goto LABEL_63;
                  goto LABEL_71;
                }
                *(_DWORD *)buf = 138543362;
                v76 = v63;
                v39 = "Got an iTIP message of type %{public}@, but asked not to handle it. Not importing.";
              }
              else
              {
                v38 = CADLogHandle;
                if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                  goto LABEL_62;
                *(_DWORD *)buf = 138543362;
                v76 = v63;
                v39 = "Unsupported message type %{public}@. Not importing.";
              }
              _os_log_impl(&dword_1B6A18000, v38, OS_LOG_TYPE_ERROR, v39, buf, 0xCu);
              goto LABEL_62;
            }
          }
          else
          {
            if (v16)
              v28 = _copyExternalIDCallback;
            else
              v28 = 0;
            v62 = v28;
          }
          v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BB08]), "initWithStore:", v25);
          goto LABEL_38;
        }
      }
    }
    else
    {
      v22 = 1001;
      if (!a9)
        goto LABEL_17;
    }
    *a9 = objc_retainAutorelease(v21);
    goto LABEL_17;
  }
  v23 = 0;
  v22 = 1016;
  v24 = v16;
  if (v20)
LABEL_85:
    CFRelease(v20);
LABEL_86:
  if (a10)
    *a10 = v22;

  return v23;
}

- (void)_handleiTIPMesssageAndCopyEventFromDocument:(id)a3 data:(id)a4 database:(CalDatabase *)a5 store:(void *)a6 accountInfo:(id)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BB68]), "initWithData:document:filename:scheduleChanges:", v14, v13, 0, 0);
  objc_msgSend(v16, "setIMIPImported:", 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __135__CADXPCImplementation_CADDatabaseOperationGroup___handleiTIPMesssageAndCopyEventFromDocument_data_database_store_accountInfo_options___block_invoke;
  v21[3] = &unk_1E6A36DE8;
  v21[4] = &v22;
  v18 = (void *)MEMORY[0x1BCC9D8DC](v21);
  objc_msgSend(MEMORY[0x1E0D0BB60], "processMessages:withDatabase:calStore:accountInfo:handledEventCallback:cancellationToken:options:", v17, a5, a6, v15, v18, 0, a8);
  CalDatabaseSave();
  v19 = (void *)v23[3];

  _Block_object_dispose(&v22, 8);
  return v19;
}

_QWORD *__135__CADXPCImplementation_CADDatabaseOperationGroup___handleiTIPMesssageAndCopyEventFromDocument_data_database_store_accountInfo_options___block_invoke(_QWORD *result, int a2, int a3, int a4, CFTypeRef cf)
{
  _QWORD *v5;

  if (cf)
  {
    v5 = result;
    if (!*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24))
    {
      result = CFRetain(cf);
      *(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24) = result;
    }
  }
  return result;
}

- (void)CADDatabaseExportICSDataForCalendarItems:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *, uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  conn = self->_conn;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __106__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendarItems_options_reply___block_invoke;
  v17 = &unk_1E6A36E10;
  v19 = &v22;
  v20 = &v28;
  v11 = v8;
  v18 = v11;
  v21 = a4;
  if (!-[ClientConnection withDatabaseForObjects:perform:](conn, "withDatabaseForObjects:perform:", v11, &v14))
  {
    *((_DWORD *)v29 + 6) = 1010;
    goto LABEL_5;
  }
  if (*((_DWORD *)v29 + 6))
  {
LABEL_5:
    v13 = (void *)v23[5];
    v23[5] = 0;

    v12 = *((unsigned int *)v29 + 6);
    goto LABEL_6;
  }
  v12 = 0;
LABEL_6:
  v9[2](v9, v12, v23[5]);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v11, v14, v15, v16, v17);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

}

void __106__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendarItems_options_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  CFIndex v12;
  CFMutableArrayRef Mutable;
  __CFArray *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[8];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_ERROR, "-CADDatabaseExportICSDataForCalendarItems:options:reply: does not support combining items in multiple databases into a single ICS document", buf, 2u);
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = 1001;
    goto LABEL_6;
  }
  v12 = objc_msgSend(*(id *)(a1 + 32), "count");
  Mutable = CFArrayCreateMutable(0, v12, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = 1007;
LABEL_6:
    *(_DWORD *)(v10 + 24) = v11;
    goto LABEL_7;
  }
  v14 = Mutable;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = CADCopyEntityInDatabase(a4, *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19));
        if (v20)
        {
          v21 = v20;
          CFArrayAppendValue(v14, v20);
          CFRelease(v21);
        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v17);
  }

  v22 = CalCreateiCalendarDataFromCalEntitiesWithOptions();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  CFRelease(v14);
LABEL_7:

}

- (void)CADDatabaseExportICSDataForCalendar:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  ClientConnection *conn;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  CADXPCImplementation *v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v10 = (void *)objc_opt_new();
  conn = self->_conn;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __101__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendar_options_reply___block_invoke;
  v18 = &unk_1E6A36E38;
  v12 = v8;
  v19 = v12;
  v13 = v10;
  v20 = v13;
  v21 = self;
  v22 = &v31;
  v23 = &v25;
  v24 = a4;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v12, &v15))
  {
    v14 = *((unsigned int *)v32 + 6);
  }
  else
  {
    v14 = 1010;
    *((_DWORD *)v32 + 6) = 1010;
  }
  v9[2](v9, v14, v26[5]);
  -[ClientConnection logAccessToEntities:](self->_conn, "logAccessToEntities:", v13, v15, v16, v17, v18);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

void __101__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendar_options_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  if (v4)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "isCalendarRestricted:forAction:", v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
      CFRelease(v4);
    }
    else
    {
      v8 = *(id *)(a1 + 40);
      v5 = CalCreateiCalendarDataFromCalendarWithOptions();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1007;
      CFRelease(v4);

    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

uint64_t __101__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendar_options_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

- (void)CADDatabaseSetShowsDeclinedEvents:(BOOL)a3 reply:(id)a4
{
  int v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (CalShowDeclinedEvents() != v4)
  {
    CalSetShowDeclinedEvents();
    -[ClientConnection withAllDatabasesPerform:](self->_conn, "withAllDatabasesPerform:", &__block_literal_global_7);
  }
  v6[2](v6, 0);

}

uint64_t __91__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseSetShowsDeclinedEvents_reply___block_invoke()
{
  return CalDatabaseRebuildOccurrenceCache();
}

- (void)CADDatabaseSetShowsCompletedReminders:(BOOL)a3 reply:(id)a4
{
  int v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (CalShowCompletedReminders() != v4)
  {
    CalSetShowCompletedReminders();
    -[ClientConnection withAllDatabasesPerform:](self->_conn, "withAllDatabasesPerform:", &__block_literal_global_31);
  }
  v6[2](v6, 0);

}

uint64_t __95__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseSetShowsCompletedReminders_reply___block_invoke()
{
  return CalDatabaseRebuildOccurrenceCache();
}

- (void)CADDatabaseRebuildOccurrenceCacheWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  ClientConnection *conn;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = (id)CADLogHandle;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[ClientConnection identity](self->_conn, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEBUG, "Received request to rebuild the occurrence cache from: [%@]", buf, 0xCu);

  }
  conn = self->_conn;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRebuildOccurrenceCacheWithReply___block_invoke;
  v8[3] = &unk_1E6A36D48;
  v8[4] = &v9;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v8);
  v4[2](v4, *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);

}

void __94__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRebuildOccurrenceCacheWithReply___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = CalDatabaseRebuildOccurrenceCache();
  v3 = CADLogHandle;
  v4 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEBUG, "The occurrence cache was rebuilt successfully.", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEBUG, "The occurrence cache was not rebuilt successfully.", v5, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1017;
  }
}

- (void)CADDatabaseCommitDeletes:(id)a3 updatesAndInserts:(id)a4 options:(int64_t)a5 andFetchChangesSinceTimestamp:(id)a6 withReply:(id)a7
{
  char v9;
  id v12;
  BOOL v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t *v36;
  ClientConnection *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t (*v45)(uint64_t, uint64_t);
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  char v56;
  void *v57;
  int v58;
  void (*v59)(uint64_t);
  NSObject *v60;
  id v61;
  int v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  ClientConnection *v83;
  ClientConnection *conn;
  _BOOL4 v85;
  ClientConnection *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t m;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  NSObject *v100;
  void *v101;
  ClientConnection *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  void (**v108)(void);
  void *v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  unsigned int v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  CADXPCImplementation *v130;
  id obj;
  void *v132;
  id v133;
  id v134;
  _QWORD v135[8];
  _QWORD v136[4];
  id v137;
  id v138;
  id v139;
  uint64_t *v140;
  _QWORD v141[4];
  id v142;
  void *v143;
  id v144;
  CADXPCImplementation *v145;
  id v146;
  id v147;
  id v148;
  id v149;
  uint64_t *v150;
  _QWORD v151[5];
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  void *v157;
  id v158;
  uint64_t *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  int v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  int v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t);
  void (*v191)(uint64_t);
  uint64_t *v192;
  _BYTE *v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  uint64_t v198;
  uint64_t *v199;
  uint64_t v200;
  int v201;
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  uint8_t v206[128];
  _BYTE v207[24];
  uint64_t (*v208)(uint64_t, uint64_t);
  void (*v209)(uint64_t);
  id v210;
  _BYTE buf[24];
  uint64_t (*v212)(uint64_t, uint64_t);
  void (*v213)(uint64_t);
  id v214;
  uint64_t v215;

  v9 = a5;
  v215 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v128 = a4;
  v107 = a6;
  v108 = (void (**)(void))a7;
  v183 = 0;
  v184 = &v183;
  v185 = 0x2020000000;
  v186 = 0;
  v130 = self;
  v13 = -[CADXPCImplementation _CADDatabaseCanModifyCalendarDatabase](self, "_CADDatabaseCanModifyCalendarDatabase");
  v14 = v184;
  if (v13)
  {
    if (*((_DWORD *)v184 + 6) || -[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel"))
    {
      if ((v9 & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
    v14 = v184;
    v15 = 1013;
  }
  else
  {
    v15 = 1016;
  }
  *((_DWORD *)v14 + 6) = v15;
  if ((v9 & 1) != 0)
  {
LABEL_8:
    -[CADXPCImplementation removeDuplicateEvents:](self, "removeDuplicateEvents:", v128);
    v16 = objc_claimAutoreleasedReturnValue();

    v128 = (id)v16;
  }
LABEL_9:
  v109 = (void *)objc_opt_new();
  v110 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v134 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v111 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v182 = -1;
  v133 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  obj = v12;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v206, 16);
  if (v17)
  {
    v127 = 0;
    v132 = 0;
    v18 = *(_QWORD *)v179;
    v19 = *MEMORY[0x1E0D0BE78];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v179 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "databaseID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "objectForKeyedSubscript:", v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v134, "setObject:forKeyedSubscript:", v24, v23);
        }
        objc_msgSend(v24, "addObject:", v21);
        objc_msgSend(v133, "addObject:", v23);
        if ((_DWORD)v22 != v19 && objc_msgSend(v21, "entityType") == 6)
        {
          if (!v132)
          {
            v132 = (void *)objc_opt_new();
            v25 = objc_opt_new();

            v127 = (void *)v25;
          }
          objc_msgSend(v132, "addObject:", v23);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v206, 16);
    }
    while (v17);
  }
  else
  {
    v127 = 0;
    v132 = 0;
  }

  v26 = -[ClientConnection eventAccessLevel](v130->_conn, "eventAccessLevel");
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v27 = v128;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v174, v205, 16);
  if (!v28)
  {

    v129 = 0;
    v36 = v184;
    goto LABEL_87;
  }
  v129 = 0;
  v29 = *(_QWORD *)v175;
  do
  {
    for (j = 0; j != v28; ++j)
    {
      if (*(_QWORD *)v175 != v29)
        objc_enumerationMutation(v27);
      v31 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * j);
      v32 = objc_msgSend(v31, "entityType");
      if (v32 == 1)
        goto LABEL_33;
      if (v32 != 2)
      {
        if (v32 != 6)
          continue;
LABEL_33:
        if (v26 == 1)
        {
          v33 = (id)CADLogHandle;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v34;
            _os_log_impl(&dword_1B6A18000, v33, OS_LOG_TYPE_ERROR, "With limited access, we should not allow changing calendar or store entity with ID %{public}@ (updates: %@)", buf, 0x16u);

          }
          *((_DWORD *)v184 + 6) = 1013;
        }
        continue;
      }
      if (objc_msgSend(v31, "isTemporary"))
      {
        v35 = v129;
        if (!v129)
          v35 = (void *)objc_opt_new();
        v129 = v35;
        objc_msgSend(v35, "addObject:", v31);
      }
    }
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v174, v205, 16);
  }
  while (v28);

  v36 = v184;
  if (v129)
  {
    if (!*((_DWORD *)v184 + 6))
    {
      v37 = v130->_conn;
      v38 = v129;
      v198 = 0;
      v199 = &v198;
      v200 = 0x2020000000;
      v201 = 0;
      +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:](CADOperationGroupUtil, "defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:", 0, v37, 0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[ClientConnection effectiveApplicationIdentifier](v37, "effectiveApplicationIdentifier");
      v115 = (id)objc_claimAutoreleasedReturnValue();
      v102 = v37;
      -[ClientConnection effectiveTeamIdentifier](v37, "effectiveTeamIdentifier");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v27;
      v118 = (id)objc_msgSend(v39, "mutableCopy");
      v196 = 0u;
      v197 = 0u;
      v194 = 0u;
      v195 = 0u;
      v40 = v38;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v194, buf, 16);
      v129 = v40;
      if (v41)
      {
        v42 = *(_QWORD *)v195;
        v121 = *MEMORY[0x1E0D0B838];
        v106 = *MEMORY[0x1E0D0B280];
        v105 = *MEMORY[0x1E0D0B668];
        v104 = *MEMORY[0x1E0D0B670];
        while (2)
        {
          v43 = v41;
          for (k = 0; k != v43; ++k)
          {
            if (*(_QWORD *)v195 != v42)
              objc_enumerationMutation(v40);
            v45 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v194 + 1) + 8 * k);
            objc_msgSend(v118, "objectForKeyedSubscript:");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v124 = (void *)objc_msgSend(v46, "mutableCopy");

            if (v26 == 1)
            {
              objc_msgSend(v39, "objectForKeyedSubscript:", v45);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "valueForKey:", v121);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
              {
                objc_msgSend(v39, "objectForKeyedSubscript:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                do
                {
                  if (!objc_msgSend(v48, "isTemporary"))
                  {
                    if (*((_DWORD *)v199 + 6))
                    {
                      v51 = v49;
                      goto LABEL_147;
                    }
                    if (!v49
                      || (objc_msgSend(v49, "valueForKey:", v106),
                          v53 = (void *)objc_claimAutoreleasedReturnValue(),
                          v54 = v53 == 0,
                          v53,
                          v54))
                    {
                      *(_QWORD *)v207 = 0;
                      *(_QWORD *)&v207[8] = v207;
                      *(_QWORD *)&v207[16] = 0x3032000000;
                      v208 = __Block_byref_object_copy__1;
                      v209 = __Block_byref_object_dispose__1;
                      v210 = 0;
                      v187 = MEMORY[0x1E0C809B0];
                      v188 = 3221225472;
                      v189 = (uint64_t)___handleNewCreatedEvents_block_invoke;
                      v190 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6A37038;
                      v59 = v48;
                      v191 = v59;
                      v192 = &v198;
                      v193 = v207;
                      -[ClientConnection withDatabaseForObject:perform:](v102, "withDatabaseForObject:perform:", v59, &v187);
                      if (*((_DWORD *)v199 + 6))
                      {

                        _Block_object_dispose(v207, 8);
                        v48 = v59;
                        goto LABEL_85;
                      }
                      objc_msgSend(v124, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&v207[8] + 40), v106);

                      _Block_object_dispose(v207, 8);
                    }
                    else
                    {
                      objc_msgSend(v49, "valueForKey:", v106);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      v56 = objc_msgSend(v55, "isVirtual");
                      v57 = v103;
                      if ((v56 & 1) == 0)
                      {
                        v58 = objc_msgSend(v55, "isTemporary", v103);
                        v57 = v55;
                        if (v58)
                          v57 = v103;
                      }
                      objc_msgSend(v124, "setObject:forKeyedSubscript:", v57, v106);

                    }
                    v51 = v49;
                    goto LABEL_72;
                  }
                  if (!v49)
                  {
                    v60 = CADLogHandle;
                    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v207 = 138412802;
                      *(_QWORD *)&v207[4] = v48;
                      *(_WORD *)&v207[12] = 2112;
                      *(_QWORD *)&v207[14] = v39;
                      *(_WORD *)&v207[22] = 2112;
                      v208 = v45;
                      _os_log_impl(&dword_1B6A18000, v60, OS_LOG_TYPE_ERROR, "Error when trying to fetch changes for a temporary item %@ that should exist in updates dictionary %@ but it doesn't, when handlng new created event %@ for limited access client.", v207, 0x20u);
                    }
                    *((_DWORD *)v199 + 6) = 1007;
                    goto LABEL_85;
                  }
                  objc_msgSend(v49, "valueForKey:", v121);
                  v50 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v39, "objectForKeyedSubscript:", v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  v48 = (void *)v50;
                  v49 = v51;
                }
                while (v50);
                if (!*((_DWORD *)v199 + 6))
                  goto LABEL_57;
                v48 = 0;
LABEL_147:

LABEL_85:
                v40 = v129;
                goto LABEL_86;
              }
              objc_msgSend(v39, "objectForKeyedSubscript:", v45);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "valueForKey:", v106);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51 && ((objc_msgSend(v51, "isVirtual") & 1) != 0 || objc_msgSend(v51, "isTemporary")))
LABEL_57:
                objc_msgSend(v124, "setObject:forKeyedSubscript:", v103, v106);
LABEL_72:

            }
            if (v115)
              objc_msgSend(v124, "setObject:forKeyedSubscript:", v115, v105);
            if (v112)
              objc_msgSend(v124, "setObject:forKeyedSubscript:", v112, v104);
            objc_msgSend(v118, "setObject:forKeyedSubscript:", v124, v45);

            v40 = v129;
          }
          v41 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v194, buf, 16);
          if (v41)
            continue;
          break;
        }
      }
LABEL_86:

      v61 = objc_retainAutorelease(v118);
      v62 = *((_DWORD *)v199 + 6);

      _Block_object_dispose(&v198, 8);
      v27 = v61;

      v36 = v184;
      *((_DWORD *)v184 + 6) = v62;
    }
  }
  else
  {
    v129 = 0;
  }
LABEL_87:
  if (*((_DWORD *)v36 + 6))
    goto LABEL_103;
  v63 = (void *)objc_msgSend(v27, "mutableCopy");
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v64 = v27;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v170, v204, 16);
  if (!v65)
    goto LABEL_102;
  v66 = *(_QWORD *)v171;
  v113 = (void *)*MEMORY[0x1E0D0B170];
  v122 = (void *)*MEMORY[0x1E0D0B870];
  v119 = (id)*MEMORY[0x1E0D0B850];
  v116 = (id)*MEMORY[0x1E0D0B890];
  v125 = (void *)*MEMORY[0x1E0D0B2C8];
  v67 = *MEMORY[0x1E0D0B838];
  while (2)
  {
    v68 = 0;
    while (2)
    {
      if (*(_QWORD *)v171 != v66)
        objc_enumerationMutation(v64);
      v69 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * v68);
      if (v26 == 1)
      {
        v70 = objc_msgSend(*(id *)(*((_QWORD *)&v170 + 1) + 8 * v68), "entityType");
        if ((v70 - 7) < 2)
        {
          _recursivelyFindAndReplacePropertyFromRebasedObject(v130->_conn, v69, v64, v122, v63);
          _recursivelyFindAndReplacePropertyFromRebasedObject(v130->_conn, v69, v64, v119, v63);
          v71 = v116;
LABEL_99:
          _recursivelyFindAndReplacePropertyFromRebasedObject(v130->_conn, v69, v64, v71, v63);
        }
        else
        {
          v71 = v125;
          if (v70 == 2)
            goto LABEL_99;
          if (v70 == 4)
          {
            v71 = v113;
            goto LABEL_99;
          }
        }
      }
      objc_msgSend(v63, "objectForKeyedSubscript:", v69);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = (void *)objc_msgSend(v72, "mutableCopy");

      objc_msgSend(v73, "removeObjectForKey:", v67);
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v73, v69);

      if (v65 != ++v68)
        continue;
      break;
    }
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v170, v204, 16);
    if (v65)
      continue;
    break;
  }
LABEL_102:

  v27 = v63;
  if (*((_DWORD *)v184 + 6))
  {
LABEL_103:
    v74 = 0;
    v126 = 0;
    v75 = 0;
  }
  else
  {
    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    v27 = v27;
    v74 = 0;
    v89 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v166, v203, 16);
    if (v89)
    {
      v126 = 0;
      v75 = 0;
      v90 = *(_QWORD *)v167;
      while (2)
      {
        for (m = 0; m != v89; ++m)
        {
          if (*(_QWORD *)v167 != v90)
            objc_enumerationMutation(v27);
          v92 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * m);
          if (objc_msgSend(v92, "isTemporary"))
          {
            v165 = v75;
            v164 = v126;
            v93 = -[CADXPCImplementation findDatabaseForObject:withUpdates:personas:accounts:nextTempDBID:](v130, "findDatabaseForObject:withUpdates:personas:accounts:nextTempDBID:", v92, v27, &v165, &v164, &v182);
            v94 = v165;

            v95 = v164;
            if ((_DWORD)v93 == 0x80000000)
            {
              v100 = (id)CADLogHandle;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v27, "objectForKeyedSubscript:", v92);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v92;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v101;
                _os_log_impl(&dword_1B6A18000, v100, OS_LOG_TYPE_ERROR, "Couldn't find database for object with temporary ID %{public}@ (updates: %@)", buf, 0x16u);

              }
              *((_DWORD *)v184 + 6) = 1001;
              v126 = v95;
              v75 = v94;
              goto LABEL_144;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v93);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "objectForKeyedSubscript:", v96);
            v97 = (id)objc_claimAutoreleasedReturnValue();
            if (!v97)
            {
              v97 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v110, "setObject:forKeyedSubscript:", v97, v96);
            }
            objc_msgSend(v97, "addObject:", v92);

            ++v74;
            v126 = v95;
            v75 = v94;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v92, "databaseID"));
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "addObject:", v92);
          }
          objc_msgSend(v111, "objectForKeyedSubscript:", v96);
          v98 = (id)objc_claimAutoreleasedReturnValue();
          if (!v98)
          {
            v98 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v111, "setObject:forKeyedSubscript:", v98, v96);
          }
          objc_msgSend(v27, "objectForKeyedSubscript:", v92);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKeyedSubscript:", v99, v92);

          objc_msgSend(v133, "addObject:", v96);
        }
        v89 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v166, v203, 16);
        if (v89)
          continue;
        break;
      }
    }
    else
    {
      v126 = 0;
      v75 = 0;
    }
LABEL_144:

  }
  v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v74);
  if (!*((_DWORD *)v184 + 6))
  {
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v117 = v133;
    v76 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v160, v202, 16);
    if (v76)
    {
      v120 = *(id *)v161;
      v114 = *MEMORY[0x1E0D0BE78];
LABEL_107:
      v77 = 0;
      while (1)
      {
        if (*(id *)v161 != v120)
          objc_enumerationMutation(v117);
        v78 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v77);
        objc_msgSend(v110, "objectForKeyedSubscript:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "objectForKeyedSubscript:", v78);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "objectForKeyedSubscript:", v78);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v78, "intValue");
        if ((v82 & 0x80000000) != 0)
        {
          conn = v130->_conn;
          v141[0] = MEMORY[0x1E0C809B0];
          v141[1] = 3221225472;
          v141[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2;
          v141[3] = &unk_1E6A36EF0;
          v142 = v75;
          v143 = v78;
          v144 = v126;
          v145 = v130;
          v150 = &v183;
          v146 = v79;
          v147 = v80;
          v148 = v81;
          v149 = v123;
          -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v114, v141);

        }
        else
        {
          *((_DWORD *)v184 + 6) = 1010;
          v83 = v130->_conn;
          v151[0] = MEMORY[0x1E0C809B0];
          v151[1] = 3221225472;
          v151[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke;
          v151[3] = &unk_1E6A36EA0;
          v159 = &v183;
          v151[4] = v130;
          v152 = v79;
          v153 = v80;
          v154 = v81;
          v155 = v123;
          v156 = v132;
          v157 = v78;
          v158 = v127;
          -[ClientConnection withDatabaseID:perform:](v83, "withDatabaseID:perform:", v82, v151);

        }
        v85 = *((_DWORD *)v184 + 6) == 0;

        if (!v85)
          break;
        if (v76 == ++v77)
        {
          v76 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v160, v202, 16);
          if (v76)
            goto LABEL_107;
          break;
        }
      }
    }

    if (!*((_DWORD *)v184 + 6) && (objc_msgSend(v75, "count") || objc_msgSend(v127, "count")))
    {
      v86 = v130->_conn;
      v87 = *MEMORY[0x1E0D0BE78];
      v136[0] = MEMORY[0x1E0C809B0];
      v136[1] = 3221225472;
      v136[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2_34;
      v136[3] = &unk_1E6A36F18;
      v137 = v75;
      v140 = &v183;
      v138 = v126;
      v139 = v127;
      -[ClientConnection withDatabaseID:perform:](v86, "withDatabaseID:perform:", v87, v136);

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v212 = __Block_byref_object_copy__1;
  v213 = __Block_byref_object_dispose__1;
  v214 = 0;
  *(_QWORD *)v207 = 0;
  *(_QWORD *)&v207[8] = v207;
  *(_QWORD *)&v207[16] = 0x2020000000;
  LOBYTE(v208) = 0;
  *(_QWORD *)&v194 = 0;
  *((_QWORD *)&v194 + 1) = &v194;
  *(_QWORD *)&v195 = 0x3032000000;
  *((_QWORD *)&v195 + 1) = __Block_byref_object_copy__1;
  *(_QWORD *)&v196 = __Block_byref_object_dispose__1;
  *((_QWORD *)&v196 + 1) = 0;
  v187 = 0;
  v188 = (uint64_t)&v187;
  v189 = 0x3032000000;
  v190 = __Block_byref_object_copy__1;
  v191 = __Block_byref_object_dispose__1;
  v192 = 0;
  if (!*((_DWORD *)v184 + 6))
  {
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_35;
    v135[3] = &unk_1E6A36F40;
    v135[4] = &v194;
    v135[5] = &v187;
    v135[6] = buf;
    v135[7] = v207;
    -[CADXPCImplementation CADDatabaseGetChangedEntityIDsSinceTimestamp:reply:](v130, "CADDatabaseGetChangedEntityIDsSinceTimestamp:reply:", v107, v135);
  }
  v108[2]();
  objc_msgSend(v123, "allValues");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "addObjectsFromArray:", v88);

  -[ClientConnection logAccessToObjects:](v130->_conn, "logAccessToObjects:", v109);
  _Block_object_dispose(&v187, 8);

  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(v207, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v183, 8);
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "insert:deletes:updates:insertedObjectIDMap:inDatabase:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a3);
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", *(_QWORD *)(a1 + 80)))
  {
    v4 = (void *)CalDatabaseCopyOfAllStores();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)CalStoreCopyExternalID();
          if (v11)
            objc_msgSend(v5, "addObject:", v11, v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 80));
  }
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const void *AuxDatabaseAccount;
  NSObject *v20;
  NSObject *v21;
  uint64_t AuxilliaryDatabaseID;
  uint64_t v23;
  void *v24;
  void *v25;
  const void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "databaseInitializationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D0BB38]);
  objc_msgSend(v4, "databaseDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDirectoryURL:", v6);

  objc_msgSend(v7, "setOptions:", objc_msgSend(v4, "databaseInitOptions"));
  objc_msgSend(v4, "calendarDataContainerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "calendarDataContainerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDataContainerProvider:", v9);

  }
  v10 = CalDatabaseCreateWithConfigurationForPersonaID();
  if (v10)
  {
    v11 = (const void *)v10;
    v12 = CalDatabaseCopyAuxDatabaseForPersonaID();
    if (v12)
    {
      v13 = (const void *)v12;
      v28 = v3;
      v29 = v2;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v14 = v3;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v15)
      {
        v16 = v15;
        v26 = v11;
        v27 = v7;
        v17 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v37 != v17)
              objc_enumerationMutation(v14);
            AuxDatabaseAccount = (const void *)CalDatabaseCreateAuxDatabaseAccount();
            CalAuxDatabaseAccountSetAccountID();
            CalAuxDatabaseAddAccount();
            CFRelease(AuxDatabaseAccount);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v16);

        CFRelease(v13);
        CalDatabaseSave();
        v11 = v26;
        v7 = v27;
      }
      else
      {

        CFRelease(v13);
      }
      AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "addCreatedAuxDatabase:", v11);
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(void **)(a1 + 64);
      v25 = *(void **)(v23 + 8);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_33;
      v30[3] = &unk_1E6A36EC8;
      v35 = *(_QWORD *)(a1 + 96);
      v30[4] = v23;
      v31 = v24;
      v32 = *(id *)(a1 + 72);
      v33 = *(id *)(a1 + 80);
      v34 = *(id *)(a1 + 88);
      objc_msgSend(v25, "withDatabaseID:perform:", AuxilliaryDatabaseID, v30);

      v3 = v28;
      v2 = v29;
    }
    else
    {
      v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v2;
        _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Couldn't find aux database for persona [%{public}@] immediately after it should have been created", buf, 0xCu);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1007;
    }
    CFRelease(v11);
  }
  else
  {
    v20 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v2;
      _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_ERROR, "Couldn't create database for persona [%{public}@]", buf, 0xCu);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1007;
  }

}

uint64_t __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "insert:deletes:updates:insertedObjectIDMap:inDatabase:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = result;
  return result;
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2_34(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const void *AuxDatabaseAccount;
  NSObject *v18;
  __int128 v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  const void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  NSObject *v34;
  int v35;
  __int128 v36;
  __int128 v37;
  id obj;
  id obja;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v1 = a1;
  v70 = *MEMORY[0x1E0C80C00];
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  v40 = v1;
  if (v3)
  {
    v5 = v3;
    v47 = 0;
    v6 = *(id *)v61;
    *(_QWORD *)&v4 = 138543362;
    v36 = v4;
    v41 = v2;
    obj = *(id *)v61;
    do
    {
      v7 = 0;
      v43 = v5;
      do
      {
        if (*(id *)v61 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "intValue", v36) & 0x80000000) == 0)
        {
          objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CalDatabaseCopyAuxDatabaseForPersonaID();
          if (v10)
          {
            v11 = (const void *)v10;
            objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", v8);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v1 + 40), "objectForKeyedSubscript:");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v57;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v57 != v15)
                    objc_enumerationMutation(v12);
                  AuxDatabaseAccount = (const void *)CalDatabaseCreateAuxDatabaseAccount();
                  CalAuxDatabaseAccountSetAccountID();
                  CalAuxDatabaseAddAccount();
                  CFRelease(AuxDatabaseAccount);
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
              }
              while (v14);
              v47 = 1;
              v1 = v40;
              v2 = v41;
              v6 = obj;
              v5 = v43;
            }
            CFRelease(v11);

          }
          else
          {
            v18 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v36;
              v68 = v9;
              _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_ERROR, "Couldn't find aux database for persona [%{public}@] shortly after confirming that it existed", buf, 0xCu);
            }
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1007;
          }

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v5);
  }
  else
  {
    v47 = 0;
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obja = *(id *)(v1 + 48);
  v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v53;
    *(_QWORD *)&v19 = 67109120;
    v37 = v19;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v53 != v42)
          objc_enumerationMutation(obja);
        v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v21, "intValue", v37);
        v22 = CalDatabaseCopyAuxDatabaseWithUID();
        if (v22)
        {
          v23 = (const void *)v22;
          v46 = j;
          v24 = (void *)CalAuxDatabaseCopyAccounts();
          objc_msgSend(*(id *)(v1 + 48), "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v26 = v24;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
          if (v27)
          {
            v28 = v27;
            v29 = 0;
            v30 = *(_QWORD *)v49;
            do
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v49 != v30)
                  objc_enumerationMutation(v26);
                v32 = (void *)CalAuxDatabaseAccountCopyAccountID();
                if ((objc_msgSend(v25, "containsObject:", v32) & 1) == 0)
                {
                  ++v29;
                  CalAuxDatabaseRemoveAccount();
                  v47 = 1;
                }

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
            }
            while (v28);
          }
          else
          {
            v29 = 0;
          }

          if (objc_msgSend(v26, "count") == v29)
          {
            CalRemoveAuxDatabase();
            v47 = 1;
          }
          CFRelease(v23);

          v1 = v40;
          j = v46;
        }
        else
        {
          v33 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            v34 = v33;
            v35 = objc_msgSend(v21, "intValue");
            *(_DWORD *)buf = v37;
            LODWORD(v68) = v35;
            _os_log_impl(&dword_1B6A18000, v34, OS_LOG_TYPE_ERROR, "Couldn't find aux database for id [%i] shortly after modifying it", buf, 8u);

          }
        }
      }
      v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v44);
  }

  if ((v47 & 1) != 0)
    CalDatabaseSave();
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_35(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5, char a6)
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1[4] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;
  v21 = v10;

  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v11;
  v17 = v11;

  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v12;
  v20 = v12;

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a6;
}

- (int)findDatabaseForObject:(id)a3 withUpdates:(id)a4 personas:(id *)a5 accounts:(id *)a6 nextTempDBID:(int *)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  ClientConnection *conn;
  uint64_t v23;
  int v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint8_t *v31;
  uint64_t *v32;
  int *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unsigned int v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if ((objc_msgSend(v12, "isTemporary") & 1) != 0)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "entityType") == 6)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D0BA80]);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D0BA98]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "intValue") - 1 > 1)
      {
        v17 = 0;
      }
      else
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B828]);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      if (v17 | v15)
      {
        v26 = v16;
        v40 = 0;
        v41 = &v40;
        v42 = 0x2020000000;
        v43 = 0x80000000;
        *(_QWORD *)buf = 0;
        v45 = buf;
        v46 = 0x3032000000;
        v47 = __Block_byref_object_copy__1;
        v48 = __Block_byref_object_dispose__1;
        v49 = *a5;
        v34 = 0;
        v35 = &v34;
        v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__1;
        v38 = __Block_byref_object_dispose__1;
        v39 = *a6;
        conn = self->_conn;
        v23 = *MEMORY[0x1E0D0BE78];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __116__CADXPCImplementation_CADDatabaseOperationGroup__findDatabaseForObject_withUpdates_personas_accounts_nextTempDBID___block_invoke;
        v27[3] = &unk_1E6A36F68;
        v28 = (id)v17;
        v30 = &v40;
        v29 = (id)v15;
        v31 = buf;
        v32 = &v34;
        v33 = a7;
        -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v23, v27);
        v16 = v26;
        *a6 = objc_retainAutorelease((id)v35[5]);
        *a5 = objc_retainAutorelease(*((id *)v45 + 5));
        v18 = *((_DWORD *)v41 + 6);

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v40, 8);
      }
      else
      {
        v18 = *MEMORY[0x1E0D0BE78];
      }

    }
    else
    {
      -[CADXPCImplementation owningObjectForObject:withProperties:](self, "owningObjectForObject:withProperties:", v12, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (uint64_t)v19;
      if (v19)
      {
        if (!objc_msgSend(v19, "isVirtual"))
        {
          if ((objc_msgSend((id)v15, "isTemporary") & 1) != 0)
            v24 = -[CADXPCImplementation findDatabaseForObject:withUpdates:personas:accounts:nextTempDBID:](self, "findDatabaseForObject:withUpdates:personas:accounts:nextTempDBID:", v15, v13, a5, a6, a7);
          else
            v24 = objc_msgSend((id)v15, "databaseID");
          v18 = v24;
          goto LABEL_20;
        }
        v20 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = objc_msgSend(v12, "entityType");
          _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Unexpected fake entity type %d in -findDatabaseForObject:withUpdates:", buf, 8u);

        }
      }
      v18 = 0x80000000;
    }
LABEL_20:

    goto LABEL_21;
  }
  v18 = objc_msgSend(v12, "databaseID");
LABEL_21:

  return v18;
}

void __116__CADXPCImplementation_CADDatabaseOperationGroup__findDatabaseForObject_withUpdates_personas_accounts_nextTempDBID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  const void *v7;
  const void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  _DWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  CalDatabaseGetCalendarDataContainerProvider();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v2, "containerInfoForAccountIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "usesDataSeparatedContainer"))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *MEMORY[0x1E0D0BE78];

      v5 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v4, "personaID");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = *(id *)(a1 + 40);
  }
  v6 = CalDatabaseCopyAuxDatabaseForPersonaID();
  if (v6)
  {
    v7 = (const void *)v6;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CalAuxDatabaseGetUID();
    if (*(_QWORD *)(a1 + 32))
    {
      v8 = (const void *)CalDatabaseCopyAuxDatabaseAccountForAccountID();
      if (v8)
      {
        CFRelease(v8);
        CFRelease(v7);
        goto LABEL_31;
      }
    }
    CFRelease(v7);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v14, (_QWORD)v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "isEqualToString:", v15))
          {
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v14, "intValue");

            goto LABEL_21;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_21:

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_DWORD *)(v16 + 24) == 0x80000000)
    {
      v17 = *(_DWORD **)(a1 + 72);
      *(_DWORD *)(v16 + 24) = (*v17)--;
    }
  }
  v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v18)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (_QWORD)v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, v22);

  if (*(_QWORD *)(a1 + 32))
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (!v23)
    {
      v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    objc_msgSend(v23, "objectForKeyedSubscript:", v5);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", v27, v5);
    }
    objc_msgSend(v27, "addObject:", *(_QWORD *)(a1 + 32));

  }
LABEL_31:

}

- (int)insert:(id)a3 deletes:(id)a4 updates:(id)a5 insertedObjectIDMap:(id)a6 inDatabase:(CalDatabase *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  uint64_t AuxilliaryDatabaseID;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[CADXPCImplementation preflightAccessForDeletes:updates:inDatabase:](self, "preflightAccessForDeletes:updates:inDatabase:", v13, v14, a7);
  v33 = v16;
  if (!v16)
  {
    os_unfair_lock_lock(&a7->var9);
    -[CADXPCImplementation _insert:delete:update:database:error:](self, "_insert:delete:update:database:error:", v12, v13, v14, a7, &v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (*MEMORY[0x1E0D0A160])
        os_unfair_lock_assert_owner(&a7->var9);
      os_unfair_lock_unlock(&a7->var9);
    }
    else
    {
      if ((CalDatabaseSaveWithOptions() & 1) == 0)
      {
        v33 = 1007;
LABEL_19:
        CalDatabaseReset();
LABEL_20:

        v16 = v33;
        goto LABEL_21;
      }
      if (v17)
      {
        v27 = v14;
        v28 = v12;
        AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v19 = v17;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v30 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v19, "objectForKeyedSubscript:", v24);

              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", objc_msgSend(v24, "entityType"), CalEntityGetID(), AuxilliaryDatabaseID);
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v21);
        }

        v12 = v28;
        v14 = v27;
      }
    }
    if (!v33)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_21:

  return v16;
}

- (int)preflightAccessForDeletes:(id)a3 updates:(id)a4 inDatabase:(CalDatabase *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  int v32;
  int v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v10);
        v15 = -[CADXPCImplementation preflightObjectID:inDatabase:](self, "preflightObjectID:inDatabase:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), a5);
        if (v15)
        {
          v33 = v15;
          v16 = v10;
          goto LABEL_33;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v12)
        continue;
      break;
    }
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v45;
    v20 = *MEMORY[0x1E0D0B9E0];
    v38 = v16;
    v39 = v9;
    v35 = *(_QWORD *)v45;
    while (2)
    {
      v21 = 0;
      v36 = v18;
      do
      {
        if (*(_QWORD *)v45 != v19)
          objc_enumerationMutation(v16);
        v37 = v21;
        v22 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v21);
        v23 = -[CADXPCImplementation preflightObjectID:inDatabase:](self, "preflightObjectID:inDatabase:", v22, a5);
        if (v23)
        {
          v33 = v23;
          goto LABEL_33;
        }
        objc_msgSend(v16, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v41;
          while (2)
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v41 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
              objc_msgSend(v25, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "isEqualToString:", v20)
                && !-[CADXPCImplementation _verifyClientAllowedToWriteValue:forKey:](self, "_verifyClientAllowedToWriteValue:forKey:", v31, v30))
              {
                v33 = 1013;
LABEL_32:

                v16 = v38;
                v9 = v39;
                goto LABEL_33;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = -[CADXPCImplementation preflightObjectID:inDatabase:](self, "preflightObjectID:inDatabase:", v31, a5);
                if (v32)
                {
                  v33 = v32;
                  goto LABEL_32;
                }
              }

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            if (v27)
              continue;
            break;
          }
        }

        v21 = v37 + 1;
        v16 = v38;
        v9 = v39;
        v19 = v35;
      }
      while (v37 + 1 != v36);
      v18 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v18)
        continue;
      break;
    }
  }
  v33 = 0;
LABEL_33:

  return v33;
}

- (BOOL)_verifyClientAllowedToWriteValue:(id)a3 forKey:(id)a4
{
  return -[CADXPCImplementation hasAccess:](self, "hasAccess:", 1052, a4);
}

- (int)preflightObjectID:(id)a3 inDatabase:(CalDatabase *)a4
{
  id v6;
  int v7;
  const void *v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isTemporary") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = CADCopyEntityInDatabase((uint64_t)a4, v6);
    if (v8)
    {
      v9 = v8;
      if (CADEntityIsInRestrictedStore(self->_conn, v8, 1))
      {
        v10 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v13 = 138543362;
          v14 = v6;
          _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "Failed preflight check: access denied to entity %{public}@", (uint8_t *)&v13, 0xCu);
        }
        v7 = 1013;
      }
      else
      {
        v7 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v13 = 138543362;
        v14 = v6;
        _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_ERROR, "Failed preflight check: can not find entity %{public}@", (uint8_t *)&v13, 0xCu);
      }
      v7 = 1010;
    }
  }

  return v7;
}

- (id)_insert:(id)a3 delete:(id)a4 update:(id)a5 database:(CalDatabase *)a6 error:(int *)a7
{
  id v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  id v17;

  v12 = a4;
  v13 = a5;
  *a7 = 0;
  -[CADXPCImplementation _insertObjectsWithTemporaryObjectIDs:updates:database:error:](self, "_insertObjectsWithTemporaryObjectIDs:updates:database:error:", a3, v13, a6, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a7
    || (v15 = -[CADXPCImplementation _deleteObjects:database:](self, "_deleteObjects:database:", v12, a6),
        (*a7 = v15) != 0)
    || (v16 = -[CADXPCImplementation _updatePropertiesAndRelations:database:insertedObjectMap:](self, "_updatePropertiesAndRelations:database:insertedObjectMap:", v13, a6, v14), (*a7 = v16) != 0))
  {
    v17 = 0;
  }
  else
  {
    v17 = v14;
  }

  return v17;
}

- (id)_insertObjectsWithTemporaryObjectIDs:(id)a3 updates:(id)a4 database:(CalDatabase *)a5 error:(int *)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t CalendarForEntityType;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  const void *ImageWithIdentifierInStoreID;
  uint64_t Image;
  const void *v27;
  uint64_t v28;
  int *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v30 = a6;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v31 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v12)
    {
      v13 = v12;
      v36 = 0;
      v14 = *(_QWORD *)v38;
      v32 = *MEMORY[0x1E0D0B738];
      v33 = *MEMORY[0x1E0D0B728];
      v34 = v11;
LABEL_4:
      v15 = 0;
      while (2)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
        v17 = objc_msgSend(v16, "entityType", v30);
        switch(v17)
        {
          case 1:
            CalendarForEntityType = _CalDatabaseCreateCalendarForEntityType();
            goto LABEL_38;
          case 2:
            CalendarForEntityType = _CalCalendarItemCreate();
            goto LABEL_38;
          case 3:
          case 13:
          case 22:
          case 25:
          case 26:
          case 27:
            goto LABEL_11;
          case 4:
            CalendarForEntityType = _CalDatabaseCreateAlarm();
            goto LABEL_38;
          case 5:
            CalendarForEntityType = _CalDatabaseCreateRecurrence();
            goto LABEL_38;
          case 6:
            CalendarForEntityType = _CalDatabaseCreateStore();
            goto LABEL_38;
          case 7:
            CalendarForEntityType = _CalDatabaseCreateAttendee();
            goto LABEL_38;
          case 8:
            CalendarForEntityType = _CalDatabaseCreateOrganizer();
            goto LABEL_38;
          case 9:
            CalendarForEntityType = _CalDatabaseCreateEventAction();
            goto LABEL_38;
          case 10:
            CalendarForEntityType = _CalDatabaseCreateExceptionDate();
            goto LABEL_38;
          case 11:
            CalendarForEntityType = _CalDatabaseCreateAttachment();
            goto LABEL_38;
          case 12:
            CalendarForEntityType = _CalDatabaseCreateCategory();
            goto LABEL_38;
          case 14:
            CalendarForEntityType = _CalDatabaseCreateLocation();
            goto LABEL_38;
          case 15:
            CalendarForEntityType = _CalDatabaseCreateSharee();
            goto LABEL_38;
          case 16:
            CalendarForEntityType = _CalDatabaseCreateInviteReplyNotification();
            goto LABEL_38;
          case 17:
            CalendarForEntityType = _CalDatabaseCreateResourceChangeNotification();
            goto LABEL_38;
          case 18:
            CalendarForEntityType = _CalCreateResourceChangeOfType();
            goto LABEL_38;
          case 19:
            CalendarForEntityType = _CalDatabaseCreateSuggestionNotification();
            goto LABEL_38;
          case 20:
            CalendarForEntityType = _CalDatabaseCreateSuggestedEventInfo();
            goto LABEL_38;
          case 21:
            CalendarForEntityType = _CalDatabaseCreateContact();
            goto LABEL_38;
          case 23:
            CalendarForEntityType = _CalDatabaseCreateConference();
            goto LABEL_38;
          case 24:
            CalendarForEntityType = _CalDatabaseCreateError();
            goto LABEL_38;
          case 28:
            objc_msgSend(v35, "objectForKeyedSubscript:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v33);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v32);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v24, "isTemporary") & 1) != 0
              || (objc_msgSend(v24, "entityID"),
                  (ImageWithIdentifierInStoreID = (const void *)_CalDatabaseGetImageWithIdentifierInStoreID()) == 0))
            {
              Image = _CalDatabaseCreateImage();
            }
            else
            {
              Image = (uint64_t)CFRetain(ImageWithIdentifierInStoreID);
            }
            v27 = (const void *)Image;

            v11 = v34;
            if (!v27)
              goto LABEL_40;
            goto LABEL_39;
          case 29:
            CalendarForEntityType = _CalDatabaseCreateColor();
            goto LABEL_38;
          default:
            if (v17 == 102)
            {
              CalendarForEntityType = _CalDatabaseCreateNotification();
LABEL_38:
              v27 = (const void *)CalendarForEntityType;
              if (CalendarForEntityType)
              {
LABEL_39:
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, v16);
                CFRelease(v27);
              }
            }
            else
            {
LABEL_11:
              v19 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
              {
                v20 = v19;
                v21 = objc_msgSend(v16, "entityType");
                *(_DWORD *)buf = 67109120;
                v42 = v21;
                _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_ERROR, "Attempt to insert an invalid entity type (%d)", buf, 8u);

              }
              v36 = 1001;
            }
LABEL_40:
            if (v13 != ++v15)
              continue;
            v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
            v13 = v28;
            if (!v28)
              goto LABEL_49;
            goto LABEL_4;
        }
      }
    }
    v36 = 0;
LABEL_49:

    if (v30)
      *v30 = v36;
    v8 = v31;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)_deleteObjects:(id)a3 database:(CalDatabase *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (_CADGetEntity((uint64_t)a4, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9)))
          _CADDeleteEntity();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return 0;
}

- (int)_updatePropertiesAndRelations:(id)a3 database:(CalDatabase *)a4 insertedObjectMap:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a5;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    v33 = v8;
    v29 = (void *)*MEMORY[0x1E0D0B320];
    v30 = *(_QWORD *)v40;
LABEL_3:
    v12 = 0;
    v31 = v10;
LABEL_4:
    if (*(_QWORD *)v40 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
    v14 = _CADGetExistingOrInsertedEntity((uint64_t)a4, v13, v34);
    if (v14)
    {
      v15 = v14;
      v32 = v12;
      objc_msgSend(v8, "objectForKeyedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (!v18)
        goto LABEL_20;
      v19 = v18;
      v20 = *(_QWORD *)v36;
LABEL_9:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v21);
        objc_msgSend(v17, "objectForKeyedSubscript:", v22, v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 == v24)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _CADGetExistingOrInsertedEntity((uint64_t)a4, v23, v34);
          v25 = objc_claimAutoreleasedReturnValue();
LABEL_16:

          v23 = (void *)v25;
        }
        v26 = _CalEntitySetProperty((uint64_t)a4, v15, v22, v23);

        if (v26)
        {

          v8 = v33;
          goto LABEL_27;
        }
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v19)
            goto LABEL_9;
LABEL_20:

          objc_msgSend(v17, "objectForKeyedSubscript:", v29);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            _CalEntitySetProperty((uint64_t)a4, v15, v29, v27);

          v12 = v32 + 1;
          v8 = v33;
          v11 = v30;
          if (v32 + 1 == v31)
          {
            v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
            v26 = 0;
            if (!v10)
              goto LABEL_27;
            goto LABEL_3;
          }
          goto LABEL_4;
        }
      }
      v25 = 0;
      goto LABEL_16;
    }
    v26 = 1010;
  }
  else
  {
    v26 = 0;
  }
LABEL_27:

  return v26;
}

- (id)removeDuplicateEvents:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  os_log_t *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  id v17;
  os_log_t *v18;
  void *v19;
  int v20;
  void *v21;
  __int128 v23;
  CADXPCImplementation *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (!v5)
    goto LABEL_17;
  v7 = v5;
  v8 = 0;
  v9 = *(_QWORD *)v26;
  v10 = (os_log_t *)&CADLogHandle;
  *(_QWORD *)&v6 = 138543618;
  v23 = v6;
  v24 = self;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v4);
      v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if (objc_msgSend(v12, "entityType", v23) == 2
        && (objc_msgSend(v12, "entityID") & 0x80000000) != 0
        && -[CADXPCImplementation isDuplicateEvent:updates:](self, "isDuplicateEvent:updates:", v12, v4))
      {
        -[CADXPCImplementation conn](self, "conn");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
        {
          v16 = v15;
          objc_msgSend(v14, "clientName");
          v17 = v8;
          v18 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v14, "pid");
          *(_DWORD *)buf = v23;
          v30 = v19;
          v31 = 1024;
          v32 = v20;
          _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "A new event being saved by a legacy write-only client (%{public}@ [%i]) is very similar to an existing event. Refusing to commit it.", buf, 0x12u);

          v10 = v18;
          v8 = v17;
          self = v24;

        }
        if (!v8)
          v8 = (id)objc_msgSend(v4, "mutableCopy");
        -[CADXPCImplementation updatedOrInsertedObjectIDs:relatedToEvent:](self, "updatedOrInsertedObjectIDs:relatedToEvent:", v8, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectsForKeys:", v21);

      }
    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  }
  while (v7);
  if (!v8)
LABEL_17:
    v8 = v4;

  return v8;
}

- (BOOL)isDuplicateEvent:(id)a3 updates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ClientConnection *conn;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  CADXPCImplementation *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B3D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B680]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  conn = self->_conn;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__CADXPCImplementation_CADDatabaseOperationGroup__isDuplicateEvent_updates___block_invoke;
  v17[3] = &unk_1E6A36F90;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = self;
  v14 = v6;
  v21 = v14;
  v15 = v7;
  v22 = v15;
  v23 = &v24;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v17);
  LOBYTE(v6) = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)v6;
}

void __76__CADXPCImplementation_CADDatabaseOperationGroup__isDuplicateEvent_updates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)CalDatabaseCopyOriginalVisibleEventsWithDates();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(a1 + 48), "shouldBlockSaveOfEvent:updates:becauseOfExistingEvent:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)shouldBlockSaveOfEvent:(id)a3 updates:(id)a4 becauseOfExistingEvent:(void *)a5
{
  void *v5;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  unint64_t j;
  void *v32;
  void *v33;
  BOOL v34;
  const void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _QWORD v64[8];

  v64[6] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = *MEMORY[0x1E0D0B328];
  v64[0] = *MEMORY[0x1E0D0B410];
  v64[1] = v11;
  v12 = *MEMORY[0x1E0D0B258];
  v64[2] = *MEMORY[0x1E0D0B308];
  v64[3] = v12;
  v13 = *MEMORY[0x1E0D0B2C0];
  v64[4] = *MEMORY[0x1E0D0B3D8];
  v64[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CADXPCImplementation object:matchesProperties:forKeys:](self, "object:matchesProperties:forKeys:", a5, v15, v14))
  {
    v48 = v15;
    v49 = v14;
    v16 = CalEventCopyCreatorIdentityString();
    v17 = CalEventCopyCreatorTeamIdentityString();
    v50 = (void *)v17;
    if (!(v16 | v17))
      goto LABEL_19;
    v18 = v17;
    if (v16
      || (-[ClientConnection effectiveApplicationIdentifier](self->_conn, "effectiveApplicationIdentifier"),
          (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ClientConnection effectiveApplicationIdentifier](self->_conn, "effectiveApplicationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 1;
      v20 = 1;
      if (!objc_msgSend((id)v16, "isEqual:", v5))
        goto LABEL_14;
      if (v18)
        goto LABEL_12;
    }
    else
    {
      v19 = 0;
      v51 = 0;
      if (v18)
        goto LABEL_12;
    }
    -[ClientConnection effectiveTeamIdentifier](self->_conn, "effectiveTeamIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v20 = 0;
      if ((v19 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
LABEL_12:
    -[ClientConnection effectiveTeamIdentifier](self->_conn, "effectiveTeamIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v50, "isEqual:", v22) ^ 1;

    if (v50)
    {
      if (!v19)
        goto LABEL_15;
    }
    else
    {

      if ((v19 & 1) == 0)
      {
LABEL_15:
        if (v16)
        {
          if ((v20 & 1) != 0)
          {
LABEL_17:
            v21 = 0;
LABEL_49:

            v15 = v48;
            v14 = v49;
            goto LABEL_50;
          }
        }
        else
        {

          if ((v20 & 1) != 0)
            goto LABEL_17;
        }
LABEL_19:
        v45 = a5;
        v46 = v16;
        v23 = (void *)CalCalendarItemCopyRecurrences();
        v24 = (void *)objc_msgSend(v23, "mutableCopy");

        v47 = v9;
        -[CADXPCImplementation updatedOrInsertedObjectIDs:relatedToEvent:](self, "updatedOrInsertedObjectIDs:relatedToEvent:", v53, v9);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        v52 = v25;
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v59;
          while (2)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v59 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              if (objc_msgSend(v30, "entityType", v45) == 5)
              {
                for (j = 0; j < objc_msgSend(v24, "count"); ++j)
                {
                  objc_msgSend(v24, "objectAtIndexedSubscript:", j);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:", v30);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = -[CADXPCImplementation recurrenceRule:matchesProperties:](self, "recurrenceRule:matchesProperties:", v32, v33);

                  if (v34)
                    break;
                }
                if (j >= objc_msgSend(v24, "count"))
                {
                  v25 = v52;

                  goto LABEL_47;
                }
                objc_msgSend(v24, "removeObjectAtIndex:", j);
                v25 = v52;
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
            if (v27)
              continue;
            break;
          }
        }

        if (objc_msgSend(v24, "count"))
        {
LABEL_47:
          v21 = 0;
          v16 = v46;
          v9 = v47;
        }
        else
        {
          v35 = (const void *)CalCalendarItemCopyLocation();
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v36 = v25;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v55;
            while (2)
            {
              for (k = 0; k != v38; ++k)
              {
                if (*(_QWORD *)v55 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
                if (objc_msgSend(v41, "entityType", v45) == 14)
                {
                  if (!v35
                    || (objc_msgSend(v53, "objectForKeyedSubscript:", v41),
                        v42 = (void *)objc_claimAutoreleasedReturnValue(),
                        v43 = -[CADXPCImplementation location:matchesProperties:](self, "location:matchesProperties:", v35, v42), v42, CFRelease(v35), !v43))
                  {

                    goto LABEL_54;
                  }
                  v35 = 0;
                }
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
              if (v38)
                continue;
              break;
            }
          }

          if (v35)
          {
            CFRelease(v35);
LABEL_54:
            v21 = 0;
          }
          else
          {
            v21 = 1;
          }
          v16 = v46;
          v9 = v47;
          v25 = v52;
        }

        goto LABEL_49;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  v21 = 0;
LABEL_50:

  return v21;
}

- (BOOL)recurrenceRule:(void *)a3 matchesProperties:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D0B8E8];
  v13[0] = *MEMORY[0x1E0D0B8E0];
  v13[1] = v6;
  v7 = *MEMORY[0x1E0D0B8C8];
  v13[2] = *MEMORY[0x1E0D0B8D0];
  v13[3] = v7;
  v8 = *MEMORY[0x1E0D0B8D8];
  v13[4] = *MEMORY[0x1E0D0B8F8];
  v13[5] = v8;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[CADXPCImplementation object:matchesProperties:forKeys:](self, "object:matchesProperties:forKeys:", a3, v10, v11);

  return (char)a3;
}

- (BOOL)location:(void *)a3 matchesProperties:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D0B748];
  v11[0] = *MEMORY[0x1E0D0B7A0];
  v11[1] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  objc_msgSend(v7, "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[CADXPCImplementation object:matchesProperties:forKeys:](self, "object:matchesProperties:forKeys:", a3, v8, v9);

  return (char)a3;
}

- (BOOL)object:(void *)a3 matchesProperties:(id)a4 forKeys:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = a5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v22 = 0;
        v15 = CalEntityCopyPropertyAllowingLimitedAccess(self->_conn, (uint64_t)a3, v14, &v22, 1);
        v16 = v22;
        if (v15)
        {

LABEL_14:
          v20 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        convertDefaultValueToNil(v16);
        v18 = objc_claimAutoreleasedReturnValue();

        convertDefaultValueToNil(v17);
        v19 = objc_claimAutoreleasedReturnValue();

        if (v18 | v19 && (objc_msgSend((id)v18, "isEqual:", v19) & 1) == 0)
        {

          goto LABEL_14;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_15:

  return v20;
}

- (id)updatedOrInsertedObjectIDs:(id)a3 relatedToEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[CADXPCImplementation owningEventForObject:withUpdates:](self, "owningEventForObject:withUpdates:", v14, v9, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqual:", v7))
          objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)owningEventForObject:(id)a3 withUpdates:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "entityType") != 2)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADXPCImplementation owningObjectForObject:withProperties:](self, "owningObjectForObject:withProperties:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CADXPCImplementation owningEventForObject:withUpdates:](self, "owningEventForObject:withUpdates:", v10, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)owningObjectForObject:(id)a3 withProperties:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "entityType");
  v8 = 0;
  v9 = (_QWORD *)MEMORY[0x1E0D0B578];
  switch(v7)
  {
    case -1:
    case 3:
    case 12:
    case 13:
    case 19:
    case 21:
    case 25:
    case 26:
    case 27:
      goto LABEL_2;
    case 0:
    case 6:
    case 22:
      goto LABEL_22;
    case 1:
      goto LABEL_21;
    case 2:
      v9 = (_QWORD *)MEMORY[0x1E0D0B280];
      goto LABEL_21;
    case 4:
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B158]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_22;
      v9 = (_QWORD *)MEMORY[0x1E0D0B160];
      goto LABEL_21;
    case 5:
      v9 = (_QWORD *)MEMORY[0x1E0D0B8F0];
      goto LABEL_21;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 15:
    case 20:
    case 23:
      v9 = (_QWORD *)MEMORY[0x1E0D0B830];
      goto LABEL_21;
    case 14:
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B758]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_22;
      v9 = (_QWORD *)MEMORY[0x1E0D0B750];
      goto LABEL_21;
    case 16:
    case 17:
      goto LABEL_8;
    case 18:
      v9 = (_QWORD *)MEMORY[0x1E0D0B958];
      goto LABEL_21;
    case 24:
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B5F0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_22;
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B5D8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_22;
      v9 = (_QWORD *)MEMORY[0x1E0D0B5D0];
      goto LABEL_21;
    case 28:
      v9 = (_QWORD *)MEMORY[0x1E0D0B738];
      goto LABEL_21;
    case 29:
      v9 = (_QWORD *)MEMORY[0x1E0D0B5C8];
      goto LABEL_21;
    default:
      if ((v7 - 100) < 2)
      {
LABEL_2:
        v10 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v11 = v10;
          v13[0] = 67109120;
          v13[1] = objc_msgSend(v5, "entityType");
          _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_ERROR, "Unexpected/unsupported entity type %d in -findDatabaseForObject:withUpdates:", (uint8_t *)v13, 8u);

        }
        v8 = 0;
      }
      else if (v7 == 102)
      {
LABEL_8:
        v9 = (_QWORD *)MEMORY[0x1E0D0B7B0];
LABEL_21:
        objc_msgSend(v6, "objectForKeyedSubscript:", *v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_22:

      return v8;
  }
}

- (void)CADDatabaseMigrateSubscribedCalendar:(id)a3 toSource:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CADXPCImplementation *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke;
  v15[3] = &unk_1E6A36980;
  v12 = v8;
  v16 = v12;
  v19 = &v27;
  v13 = v9;
  v20 = &v21;
  v17 = v13;
  v18 = self;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v12, v15))
  {
    v14 = *((unsigned int *)v28 + 6);
  }
  else
  {
    v14 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
  }
  v10[2](v10, v14, v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  uint64_t v29;
  const void *v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v6 = CalDatabaseCopyCalendarWithUID();
  if (v6)
  {
    v7 = (const void *)v6;
    v8 = (void *)CalCalendarCopyTitle();
    if ((CalCalendarIsSubscribed() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "databaseID") == (_DWORD)a2)
      {
        objc_msgSend(*(id *)(a1 + 40), "entityID");
        v9 = CalDatabaseCopyStoreWithUID();
        if (!v9)
        {
          CFRelease(v7);
          v23 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
          {
            v24 = *(void **)(a1 + 40);
            v25 = v23;
            *(_DWORD *)buf = 67109120;
            v32 = objc_msgSend(v24, "entityID");
            _os_log_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Unable to find store with row ID %i", buf, 8u);

          }
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
          goto LABEL_22;
        }
        v10 = (const void *)v9;
        v11 = CalCalendarMigrateSubscribedCalendarToStore();
        if ((int)v11 < 1)
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1007;
        }
        else
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 1, v11, a2);
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

        }
        CFRelease(v10);
      }
      else
      {
        v21 = *(void **)(a1 + 40);
        v22 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke_38;
        v26[3] = &unk_1E6A36FB8;
        v27 = v21;
        v29 = a3;
        v30 = v7;
        v28 = *(_OWORD *)(a1 + 56);
        if ((objc_msgSend(v22, "withDatabaseForObject:perform:", v27, v26) & 1) == 0)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;

      }
    }
    else
    {
      v18 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
      {
        v19 = *(void **)(a1 + 32);
        v20 = v18;
        *(_DWORD *)buf = 67109378;
        v32 = objc_msgSend(v19, "entityID");
        v33 = 2112;
        v34 = v8;
        _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Calendar to move (%i, \"%@\") is not a subscribed calendar", buf, 0x12u);

      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1001;
    }
    CFRelease(v7);
LABEL_22:

    return;
  }
  v15 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
  {
    v16 = *(void **)(a1 + 32);
    v17 = v15;
    *(_DWORD *)buf = 67109120;
    v32 = objc_msgSend(v16, "entityID");
    _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Unable to find calendar with row ID %i", buf, 8u);

  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
}

void __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke_38(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  const void *v5;
  const void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *Copy;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v4 = CalDatabaseCopyStoreWithUID();
  if (v4)
  {
    v5 = (const void *)v4;
    v19 = a2;
    CalDatabaseMultiLock();
    v6 = (const void *)_CalDatabaseCopyCalendar();
    _CalStoreAddCalendar();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (id)_CalDatabaseCopyCalendarItemsWithCalendar();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          if ((_CalEventIsDetached() & 1) == 0)
          {
            Copy = (const void *)_CalCalendarItemCreateCopy();
            CFRelease(Copy);
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    _CalRemoveCalendar();
    CalDatabaseSaveWithOptions();
    CalDatabaseSaveWithOptions();
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 1, CalCalendarGetUID(), v19);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    CFRelease(v5);
    CFRelease(v6);

  }
  else
  {
    v16 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(a1 + 32);
      v18 = v16;
      *(_DWORD *)buf = 67109120;
      v26 = objc_msgSend(v17, "entityID");
      _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Unable to find store with row ID %i", buf, 8u);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetDefaultAlarmOffsetForAllDay:(BOOL)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t);
  ClientConnection *conn;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  conn = self->_conn;
  v17 = 0;
  v8 = *MEMORY[0x1E0D0BE78];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetDefaultAlarmOffsetForAllDay_reply___block_invoke;
  v10[3] = &unk_1E6A36FE0;
  v11 = a3;
  v10[4] = &v12;
  -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v8, v10);
  v9 = v13[5];
  if (!v9)
  {
    v13[5] = (uint64_t)&unk_1E6A505E8;

    v9 = v13[5];
  }
  v6[2](v6, 0, v9);
  _Block_object_dispose(&v12, 8);

}

void __99__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetDefaultAlarmOffsetForAllDay_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  CalDatabaseGetPreferences();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
    v2 = CalAlarmCopyDefaultAllDayAlarmOffsetWithPreferences();
  else
    v2 = CalAlarmCopyDefaultTimedAlarmOffsetWithPreferences();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)CADAnalyticsSendEvent:(id)a3 appendingClientBundleIDToPayload:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ClientConnection databaseInitializationOptions](self->_conn, "databaseInitializationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteClientIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "untrustedBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("clientBundleID"));
  CalAnalyticsSendEvent();

}

- (void)CADDatabaseStatsBySource:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  ClientConnection *conn;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  conn = self->_conn;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseStatsBySource___block_invoke;
  v6[3] = &unk_1E6A36D48;
  v6[4] = &v7;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v6);
  v4[2](v4, 0, v8[5]);
  _Block_object_dispose(&v7, 8);

}

void __76__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseStatsBySource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = (void *)CalDatabaseCopySourceStats();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  v9 = v2;
  if (v4)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    v8 = v2;
    v7 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v8;
  }

}

- (void)CADPersonaIdentifierForDatabaseID:(int)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t);
  ClientConnection *conn;
  uint64_t v8;
  _QWORD v9[6];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1010;
  conn = self->_conn;
  v8 = *MEMORY[0x1E0D0BE78];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__CADXPCImplementation_CADDatabaseOperationGroup__CADPersonaIdentifierForDatabaseID_reply___block_invoke;
  v9[3] = &unk_1E6A37008;
  v10 = a3;
  v9[4] = &v15;
  v9[5] = &v11;
  -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v8, v9);
  v6[2](v6, *((unsigned int *)v12 + 6), v16[5]);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

}

void __91__CADXPCImplementation_CADDatabaseOperationGroup__CADPersonaIdentifierForDatabaseID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CalDatabaseCopyAuxDatabaseWithUID();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = CalAuxDatabaseCopyPersonaID();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    CFRelease(v3);
  }
}

- (void)CADCatchUpIntegrationSyncingIfBehind:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v5 = (void (**)(id, _QWORD))a3;
  objc_msgSend(v3, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CADCatchUpIntegrationSyncRequested"), 0);

  v5[2](v5, 0);
}

- (void)CADDatabaseGetStorageUsage:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  ClientConnection *conn;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__CADDatabaseGetStorageUsage___block_invoke;
  v9[3] = &unk_1E6A370D0;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  v18[0] = CFSTR("events");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("attachments");
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, 0, v8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

uint64_t __95__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__CADDatabaseGetStorageUsage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = objc_msgSend(*(id *)(a1 + 32), "sizeCalendarDirectoryForDatabase:");
  result = objc_msgSend(*(id *)(a1 + 32), "sizeAttachmentsForDatabase:", a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += result;
  return result;
}

- (unint64_t)sizeCalendarDirectoryForDatabase:(CalDatabase *)a3
{
  void *v4;
  unint64_t v5;

  v4 = (void *)CalDatabaseCopyDirectoryPathForDatabase();
  v5 = -[CADXPCImplementation sizeDirectoryAtPath:excludingDirectory:](self, "sizeDirectoryAtPath:excludingDirectory:", v4, *MEMORY[0x1E0D0C458]);

  return v5;
}

- (unint64_t)sizeAttachmentsForDatabase:(CalDatabase *)a3
{
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  void *v8;
  __int128 v9;
  CFIndex v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFArray *v14;
  CFIndex v15;
  CalDatabase *v16;
  void *v17;
  int UID;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v26;
  NSObject *log;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFArray *)CalDatabaseCopyOfAllStores();
  v6 = v5;
  if (v5)
  {
    Count = CFArrayGetCount(v5);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", Count);
    if (Count >= 1)
    {
      v10 = 0;
      *(_QWORD *)&v9 = 67109378;
      v26 = v9;
      do
      {
        CFArrayGetValueAtIndex(v6, v10);
        CalAttachmentFileCopyAttachmentContainerForStore();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v8, "addObject:", v12);
        }
        else
        {
          v13 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            log = v13;
            v14 = v6;
            v15 = Count;
            v16 = a3;
            v17 = v8;
            UID = CalStoreGetUID();
            v19 = (void *)CalStoreCopyName();
            *(_DWORD *)buf = v26;
            v34 = UID;
            v8 = v17;
            a3 = v16;
            Count = v15;
            v6 = v14;
            v35 = 2112;
            v36 = v19;
            _os_log_impl(&dword_1B6A18000, log, OS_LOG_TYPE_ERROR, "No attachment container for store %i (%@)", buf, 0x12u);

          }
        }

        ++v10;
      }
      while (Count != v10);
    }
    CFRelease(v6);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v21)
    {
      v22 = v21;
      v6 = 0;
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          v6 = (const __CFArray *)((char *)v6
                                 + -[CADXPCImplementation sizeDirectoryAtPath:excludingDirectory:](self, "sizeDirectoryAtPath:excludingDirectory:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 0, v26));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v22);
    }
    else
    {
      v6 = 0;
    }

  }
  return (unint64_t)v6;
}

- (unint64_t)sizeDirectoryAtPath:(id)a3 excludingDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  int v28;
  NSObject *v29;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  char v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;
  _QWORD v51[6];

  v51[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v6, &v44))
    v9 = v44 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v11 = (uint64_t *)MEMORY[0x1E0C999D0];
    v12 = (uint64_t *)MEMORY[0x1E0C99A90];
    if (v7)
    {
      v13 = *MEMORY[0x1E0C999D0];
      v51[0] = *MEMORY[0x1E0C99A90];
      v51[1] = v13;
      v35 = *MEMORY[0x1E0C99AC0];
      v51[2] = *MEMORY[0x1E0C99AC0];
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v51;
      v16 = 3;
    }
    else
    {
      v35 = *MEMORY[0x1E0C99AC0];
      v50 = *MEMORY[0x1E0C99AC0];
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = &v50;
      v16 = 1;
    }
    objc_msgSend(v14, "arrayWithObjects:count:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v33 = v6;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __107__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__sizeDirectoryAtPath_excludingDirectory___block_invoke;
    v43[3] = &unk_1E6A370F8;
    v43[4] = self;
    v31 = (void *)v17;
    v32 = v8;
    objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v18, v17, 0, v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (!v21)
    {
      v10 = 0;
      goto LABEL_28;
    }
    v22 = v21;
    v10 = 0;
    v23 = *(_QWORD *)v40;
    v24 = *v11;
    v34 = *v12;
    while (1)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (v7)
        {
          v38 = 0;
          objc_msgSend(v26, "getResourceValue:forKey:error:", &v38, v24, 0);
          v27 = v38;
          if (objc_msgSend(v27, "BOOLValue"))
          {
            v37 = 0;
            objc_msgSend(v26, "getResourceValue:forKey:error:", &v37, v34, 0);
            if ((objc_msgSend(v37, "isEqualToString:", v7) & 1) != 0)
            {
              objc_msgSend(v20, "skipDescendants");
              goto LABEL_24;
            }
          }

        }
        v36 = 0;
        v28 = objc_msgSend(v26, "getResourceValue:forKey:error:", &v36, v35, 0);
        v27 = v36;
        if (v28)
        {
          v29 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v46 = v26;
            v47 = 2112;
            v48 = v27;
            _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_DEBUG, "File at URL: [%@] has size: [%@]", buf, 0x16u);
          }
          v10 += objc_msgSend(v27, "unsignedLongLongValue");
        }
LABEL_24:

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (!v22)
      {
LABEL_28:

        v8 = v32;
        v6 = v33;
        goto LABEL_29;
      }
    }
  }
  v10 = 0;
LABEL_29:

  return v10;
}

uint64_t __107__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__sizeDirectoryAtPath_excludingDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_ERROR, "%@ couldn't enumerate %@: %@", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

- (void)CADDatabaseGetCalendarItemWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *, uint64_t, uint64_t, _BYTE *);
  void *v16;
  id v17;
  CADXPCImplementation *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  conn = self->_conn;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __96__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemWithUUID_reply___block_invoke;
  v16 = &unk_1E6A37120;
  v9 = v6;
  v17 = v9;
  v18 = self;
  v19 = &v27;
  v20 = &v21;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", &v13);
  v10 = v22;
  v11 = v22[5];
  if (v11)
  {
    v12 = *((unsigned int *)v28 + 6);
  }
  else
  {
    v12 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
    v11 = v10[5];
  }
  v7[2](v7, v12, v11);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v22[5], v13, v14, v15, v16);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __96__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemWithUUID_reply___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = CalDatabaseCopyCalendarItemWithUUID();
  if (v6)
  {
    v7 = (const void *)v6;
    *a4 = 1;
    if (objc_msgSend(*(id *)(a1[5] + 8), "isCalendarItemRestricted:forAction:", v6, 0))
    {
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1013;
    }
    else
    {
      CADEntityCopyObjectID();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[7] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    CFRelease(v7);
  }
}

- (void)CADDatabaseGetCalendarItemsWithUUIDs:(id)a3 inCalendars:(id)a4 propertiesToLoad:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, void *);
  id v13;
  CADFetchedObjectSerializer *v14;
  void *v15;
  uint64_t v16;
  id v17;
  CADFetchedObjectSerializer *v18;
  id v19;
  void *v20;
  void *v21;
  ClientConnection *conn;
  id *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  CADXPCImplementation *v32;
  CADFetchedObjectSerializer *v33;
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, void *))a6;
  v13 = a5;
  v14 = -[CADFetchedObjectSerializer initWithConnection:defaultPropertiesToLoad:]([CADFetchedObjectSerializer alloc], "initWithConnection:defaultPropertiesToLoad:", self->_conn, v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke;
  v30[3] = &unk_1E6A37148;
  v17 = v10;
  v31 = v17;
  v32 = self;
  v18 = v14;
  v33 = v18;
  v19 = v15;
  v34 = v19;
  v20 = (void *)MEMORY[0x1BCC9D8DC](v30);
  v21 = v20;
  conn = self->_conn;
  if (v11)
  {
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_3;
    v26[3] = &unk_1E6A37198;
    v23 = &v27;
    v27 = v20;
    -[ClientConnection withDatabaseForObjects:perform:](conn, "withDatabaseForObjects:perform:", v11, v26);
  }
  else
  {
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_2;
    v28[3] = &unk_1E6A37170;
    v23 = &v29;
    v29 = v20;
    -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v28);
  }

  -[CADFetchedObjectSerializer fetchedObjectWrappers](v18, "fetchedObjectWrappers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    v25 = 0;
  }
  else
  {

    v24 = 0;
    v25 = 1010;
  }
  v12[2](v12, v25, v24);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v19);

}

void __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;
  id v8;
  void *v9;
  void *v10;

  v2 = (const __CFArray *)CalDatabaseCopyCalendarItemsWithUUIDs();
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isCalendarItemRestricted:forAction:", ValueAtIndex, 0) & 1) == 0)
        {
          v8 = (id)objc_msgSend(*(id *)(a1 + 48), "addEntity:", ValueAtIndex);
          v9 = *(void **)(a1 + 56);
          CADEntityCopyObjectID();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);

        }
      }
    }
    CFRelease(v3);
  }
}

uint64_t __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "valueForKey:", CFSTR("entityID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)CADDatabaseGetCalendarItemsWithUniqueIdentifier:(id)a3 inCalendar:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  ClientConnection *conn;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  CADXPCImplementation *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v11 = (void *)objc_opt_new();
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "addObject:", v9);
  conn = self->_conn;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __120__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply___block_invoke;
  v18[3] = &unk_1E6A371C0;
  v14 = v9;
  v19 = v14;
  v20 = self;
  v15 = v8;
  v21 = v15;
  v23 = &v24;
  v16 = v12;
  v22 = v16;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v14, v18))
    v17 = 0;
  else
    v17 = 1010;
  v10[2](v10, v17, v25[5]);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v16);

  _Block_object_dispose(&v24, 8);
}

void __120__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply___block_invoke(uint64_t a1)
{
  const void *v2;
  NSObject *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CFIndex i;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  const __CFArray *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = (const void *)CalDatabaseCopyCalendarWithUID();
  if (v2 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isCalendarRestricted:forAction:", v2, 0))
  {
    v3 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v4 = *(const __CFArray **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "Attempt to read restricted calendar: [%@]", buf, 0xCu);
    }
LABEL_17:
    CFRelease(v2);
    return;
  }
  v5 = (const __CFArray *)CalDatabaseCopyAllEntitiesWithPropertyInCalendarOrStore();
  if (v5)
  {
    v6 = v5;
    Count = CFArrayGetCount(v5);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        if (CFArrayGetValueAtIndex(v6, i))
        {
          CADEntityCopyObjectID();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v12);
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
          }

        }
        else
        {
          v13 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v15 = v6;
            _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "NULL item found in array of matching entities: [%@]", buf, 0xCu);
          }
        }
      }
    }
    CFRelease(v6);
  }
  if (v2)
    goto LABEL_17;
}

- (void)CADDatabaseGetCalendarItemsWithRecurrenceSet:(id)a3 inCalendar:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  ClientConnection *conn;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  CADXPCImplementation *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v11 = (void *)objc_opt_new();
  if (v8 && v9)
  {
    conn = self->_conn;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __117__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply___block_invoke;
    v15[3] = &unk_1E6A371E8;
    v16 = v9;
    v17 = self;
    v13 = v11;
    v18 = v13;
    v19 = v8;
    v20 = &v21;
    if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v16, v15))
      v14 = 0;
    else
      v14 = 1010;
    v10[2](v10, v14, v22[5]);
    -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v13);

  }
  else
  {
    v10[2](v10, 1001, v22[5]);
  }

  _Block_object_dispose(&v21, 8);
}

void __117__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply___block_invoke(uint64_t a1)
{
  const void *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CFIndex i;
  uint64_t v10;
  const void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint8_t buf[4];
  const __CFArray *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = (const void *)CalDatabaseCopyCalendarWithUID();
  if (v2 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isCalendarRestricted:forAction:", v2, 0))
  {
    CFRelease(v2);
    return;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
  v3 = (const __CFArray *)CalDatabaseCopyEventsWithRecurrenceSet();
  if (v3)
  {
    v4 = v3;
    Count = CFArrayGetCount(v3);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (Count >= 1)
    {
      for (i = 0; Count != i; ++i)
      {
        if (CFArrayGetValueAtIndex(v4, i))
        {
          v10 = CalCalendarItemCopyCalendar();
          if (v10)
          {
            v11 = (const void *)v10;
            CADEntityCopyObjectID();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "entityID");
            if (v13 == objc_msgSend(*(id *)(a1 + 32), "entityID"))
            {
              CADEntityCopyObjectID();
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v14);
                objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
              }

            }
            CFRelease(v11);

            continue;
          }
          v18 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v4;
            v16 = v18;
            v17 = "NULL calendar found in array of matching entities: [%@]";
            goto LABEL_18;
          }
        }
        else
        {
          v15 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v4;
            v16 = v15;
            v17 = "NULL item found in array of matching entities: [%@]";
LABEL_18:
            _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
          }
        }
      }
    }
    CFRelease(v4);
  }
  if (v2)
    CFRelease(v2);
}

- (void)CADDatabaseGetAlarmWithExternalID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  ClientConnection *conn;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  id v16;
  CADXPCImplementation *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    conn = self->_conn;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __95__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetAlarmWithExternalID_reply___block_invoke;
    v15 = &unk_1E6A37210;
    v16 = v6;
    v17 = self;
    v18 = &v24;
    v19 = &v20;
    -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", &v12);
    v10 = (void *)v25[5];
    if (v10)
    {
      if (*((_BYTE *)v21 + 24))
      {
        v25[5] = 0;

        v10 = (void *)v25[5];
        v11 = 1013;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 1010;
    }
    ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, v11, v10);
    -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v25[5], v12, v13, v14, v15);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1001, 0);
  }

}

void __95__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetAlarmWithExternalID_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CalDatabaseCopyAlarmWithUUID();
  if (v2)
  {
    v3 = (const void *)v2;
    CADEntityCopyObjectID();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (objc_msgSend(*(id *)(a1[5] + 8), "isAlarmRestricted:forAction:", v3, 0))
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    CFRelease(v3);
  }
}

void __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "conn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CalMap:", &__block_literal_global_11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logAccessToObjects:", v6);

  }
}

uint64_t __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

- (void)CADDatabaseCancelFetchRequestWithIdentifier:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ClientConnection operations](self->_conn, "operations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = objc_msgSend(v9, "fetchIdentifier");
          if ((v10 & 0x80000000) == 0 && v10 == a3)
          {
            objc_msgSend(v9, "cancel");
            goto LABEL_13;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)CADDatabaseExportICSForCalendarItemWithID:(id)a3 occurrenceDate:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  CADXPCImplementation *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  conn = self->_conn;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __126__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseExportICSForCalendarItemWithID_occurrenceDate_options_reply___block_invoke;
  v17[3] = &unk_1E6A372A0;
  v14 = v10;
  v18 = v14;
  v19 = self;
  v21 = &v30;
  v22 = &v24;
  v15 = v11;
  v20 = v15;
  v23 = a5;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v14, v17))
  {
    v16 = *((unsigned int *)v31 + 6);
  }
  else
  {
    v16 = 1010;
    *((_DWORD *)v31 + 6) = 1010;
  }
  v12[2](v12, v16, v25[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v14);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

void __126__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseExportICSForCalendarItemWithID_occurrenceDate_options_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  const void *v5;
  CFArrayRef v6;
  CFArrayRef v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *values;

  v4 = (void *)CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  values = v4;
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isCalendarItemRestricted:forAction:", v4, 0))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1013;
      CFRelease(v5);
    }
    else
    {
      v6 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      if (v6)
      {
        v7 = v6;
        v8 = CalCreateiCalendarDataFromCalEntitiesWithOptions();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        CFRelease(v7);
      }
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1007;
      CFRelease(values);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetDeletableCalendars:(id)a3
{
  objc_class *v4;
  void (**v5)(id, _QWORD, id);
  id v6;
  ClientConnection *conn;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  v6 = objc_alloc_init(v4);
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableCalendars___block_invoke_2;
  v9[3] = &unk_1E6A37310;
  v10 = v6;
  v11 = &__block_literal_global_10;
  v8 = v6;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8);
}

uint64_t __80__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableCalendars___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  const void *v4;
  const void *v5;
  int v6;
  _BOOL8 v7;
  uint64_t v8;
  const void *v9;

  v4 = (const void *)CalDatabaseCopyDefaultLocalCalendar();
  if (v4)
  {
    v5 = v4;
    v6 = CFEqual(v4, a3);
    CFRelease(v5);
    if (v6)
      return 0;
  }
  v8 = CalCalendarCopyStore();
  if (!v8)
    return 1;
  v9 = (const void *)v8;
  v7 = CalStoreGetType() != 5;
  CFRelease(v9);
  return v7;
}

void __80__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableCalendars___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t UID;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)CalDatabaseCopyOfAllCalendarsInStore();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)))
        {
          UID = CalCalendarGetUID();
          v10 = *(void **)(a1 + 32);
          v11 = objc_alloc(MEMORY[0x1E0D0BAF8]);
          v12 = (void *)objc_msgSend(v11, "initWithEntityType:entityID:databaseID:", 1, UID, a2, (_QWORD)v13);
          objc_msgSend(v10, "addObject:", v12);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)CADDatabaseGetDeletableSources:(id)a3
{
  objc_class *v4;
  void (**v5)(id, _QWORD, id);
  id v6;
  ClientConnection *conn;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  v6 = objc_alloc_init(v4);
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableSources___block_invoke_2;
  v9[3] = &unk_1E6A37310;
  v10 = v6;
  v11 = &__block_literal_global_3;
  v8 = v6;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8);
}

BOOL __78__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableSources___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  const void *v4;
  const void *v5;
  int v6;

  v4 = (const void *)CalDatabaseCopyLocalStore();
  if (v4 && (v5 = v4, v6 = CFEqual(v4, a3), CFRelease(v5), v6))
    return 0;
  else
    return CalStoreGetType() != 5;
}

void __78__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableSources___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t UID;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)CalDatabaseCopyOfAllStores();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)))
        {
          UID = CalStoreGetUID();
          v10 = *(void **)(a1 + 32);
          v11 = objc_alloc(MEMORY[0x1E0D0BAF8]);
          v12 = (void *)objc_msgSend(v11, "initWithEntityType:entityID:databaseID:", 6, UID, a2, (_QWORD)v13);
          objc_msgSend(v10, "addObject:", v12);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)CADMigrateDatabaseIfNeeded:(id)a3
{
  void (**v3)(id, uint64_t);
  char IsCurrentProcessCalaccessd;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  uint8_t v12[16];
  __int16 v13;
  uint8_t buf[16];
  uint8_t v15[2];

  v3 = (void (**)(id, uint64_t))a3;
  IsCurrentProcessCalaccessd = CalDatabaseIsCurrentProcessCalaccessd();
  v5 = CADLogHandle;
  v6 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT);
  if ((IsCurrentProcessCalaccessd & 1) == 0)
  {
    if (!v6)
    {
LABEL_10:
      v9 = 0;
      goto LABEL_14;
    }
    *(_WORD *)v15 = 0;
    v10 = "****** Ignoring request to migrate because this is not calaccessd";
    v11 = v15;
LABEL_9:
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_10;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, "****** Requested to migrate", buf, 2u);
  }
  v7 = CalDatabasePerformMigrationIfNeeded();
  v5 = CADLogHandle;
  if (v7)
  {
    v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT);
    v9 = 0;
    if (v8)
    {
      v13 = 0;
      v10 = "****** Finished migration";
      v11 = (uint8_t *)&v13;
      goto LABEL_9;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_ERROR, "****** Migration request failed because it was called before protected data is accessible", v12, 2u);
    }
    v9 = 1022;
  }
LABEL_14:
  v3[2](v3, v9);

}

- (void)CADDatabaseGetNotificationCountExcludingUncheckedCalendars:(BOOL)a3 expanded:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  ClientConnection *conn;
  void (**v8)(id, _QWORD, uint64_t);
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;

  v6 = a3;
  conn = self->_conn;
  v12 = 0;
  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  LOBYTE(v11) = a4;
  v9 = +[CADNotificationUtilities CADDatabaseGetEventNotificationItemsWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:earliestExpirationDate:notificationTypes:objectIDs:occurrenceDates:attendeeObjectIDs:](CADNotificationUtilities, "CADDatabaseGetEventNotificationItemsWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:earliestExpirationDate:notificationTypes:objectIDs:occurrenceDates:attendeeObjectIDs:", conn, 0, 0, 0, v6, 1, v11, 0, &v12, 0, 0, 0);
  v10 = v12;
  v8[2](v8, v9, objc_msgSend(v10, "count"));

}

- (void)CADDiagnosticsCollectWithToken:(unsigned int)a3 options:(int64_t)a4 trafficLogsCollectionMode:(unint64_t)a5 reply:(id)a6
{
  uint64_t v8;
  void (**v10)(id, _QWORD);
  CADDiagnosticsCollectionOperation *v11;

  v8 = *(_QWORD *)&a3;
  v10 = (void (**)(id, _QWORD))a6;
  v11 = -[CADDiagnosticsCollectionOperation initWithConnection:token:options:trafficLogsCollectionMode:]([CADDiagnosticsCollectionOperation alloc], "initWithConnection:token:options:trafficLogsCollectionMode:", self->_conn, v8, a4, a5);
  -[ClientConnection addOperation:](self->_conn, "addOperation:", v11);
  v10[2](v10, 0);

}

- (void)CADDiagnosticsCancelCollectionWithToken:(unsigned int)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ClientConnection operations](self->_conn, "operations", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "token") == a3)
        {
          objc_msgSend(v12, "cancel");
          v13 = 0;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 1001;
LABEL_12:

  v6[2](v6, v13);
}

- (id)_hangAssertionForBlockingTCCCall
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  ClientConnection *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  ClientConnection *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  ClientConnection *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  ClientConnection *conn;
  NSObject *v27;
  void *v28;
  int v29;
  id v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D87DF8];
  -[ClientConnection identity](self->_conn, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetWithPid:", objc_msgSend(v4, "pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("DisableWatchdog"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0D87C98]);
      v36[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithExplanation:target:attributes:", CFSTR("Prevent watchdog termination while blocking on TCC authorization"), v5, v8);

      if (v9)
      {
        v31 = 0;
        v10 = objc_msgSend(v9, "acquireWithError:", &v31);
        v11 = v31;
        if ((v10 & 1) != 0)
        {
          v12 = v9;
        }
        else
        {
          v25 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            conn = self->_conn;
            v27 = v25;
            -[ClientConnection identity](conn, "identity");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "pid");
            *(_DWORD *)buf = 67109378;
            v33 = v29;
            v34 = 2112;
            v35 = v11;
            _os_log_impl(&dword_1B6A18000, v27, OS_LOG_TYPE_ERROR, "Failed to acquire watchog disable assertion for pid %d with error: %@", buf, 0x12u);

          }
          v12 = 0;
        }

      }
      else
      {
        v21 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v22 = self->_conn;
          v23 = v21;
          -[ClientConnection identity](v22, "identity");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109120;
          v33 = objc_msgSend(v24, "pid");
          _os_log_impl(&dword_1B6A18000, v23, OS_LOG_TYPE_ERROR, "Failed to create RBSAssertion for connected client with PID %d", buf, 8u);

        }
        v12 = 0;
      }

    }
    else
    {
      v17 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v18 = self->_conn;
        v19 = v17;
        -[ClientConnection identity](v18, "identity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109120;
        v33 = objc_msgSend(v20, "pid");
        _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_ERROR, "Failed to create RBSAttribute for connected client with PID %d", buf, 8u);

      }
      v12 = 0;
    }

  }
  else
  {
    v13 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v14 = self->_conn;
      v15 = v13;
      -[ClientConnection identity](v14, "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v33 = objc_msgSend(v16, "pid");
      _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_ERROR, "Failed to create RBSTarget for connected client with PID %d", buf, 8u);

    }
    v12 = 0;
  }

  return v12;
}

- (id)_TCCPromptReasonStringForReason:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 8)
    return off_1E6A38030[a3];
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_ERROR, "Unexpected CalRequestAccessReason (int value: %ld): we don't support this kind of CalRequestAccessReason.", (uint8_t *)&v6, 0xCu);
  }
  return CFSTR("Unknown");
}

- (void)CADDatabaseRequestAccessForEntityType:(unint64_t)a3 desiredFullAccess:(BOOL)a4 isBlockingUIThread:(BOOL)a5 reason:(int64_t)a6 reply:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = v12;
  if (a3)
  {
    if (a3 != 1)
    {
LABEL_8:
      (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1001, 0);
      goto LABEL_16;
    }
    v14 = (uint64_t *)MEMORY[0x1E0DB1198];
  }
  else
  {
    v14 = (uint64_t *)MEMORY[0x1E0DB10E8];
  }
  v15 = *v14;
  if (!*v14)
    goto LABEL_8;
  if (v8)
  {
    -[CADXPCImplementation _hangAssertionForBlockingTCCCall](self, "_hangAssertionForBlockingTCCCall");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_opt_new();
  -[CADXPCImplementation _TCCPromptReasonStringForReason:](self, "_TCCPromptReasonStringForReason:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DB10C8]);

  -[ClientConnection identity](self->_conn, "identity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("kEventKitTCCUIFullAccessNotificationClientBundleIDKey"));
  if (v9)
    v21 = 2;
  else
    v21 = 4;
  -[ClientConnection tccPermissionChecker](self->_conn, "tccPermissionChecker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __137__CADXPCImplementation_CADAccessOperationGroup__CADDatabaseRequestAccessForEntityType_desiredFullAccess_isBlockingUIThread_reason_reply___block_invoke;
  v24[3] = &unk_1E6A38010;
  v27 = v15;
  v24[4] = self;
  v25 = v16;
  v26 = v13;
  v23 = v16;
  objc_msgSend(v22, "requestAuthorization:forService:clientDictionary:completion:", v21, v15, v17, v24);

LABEL_16:
}

void *__137__CADXPCImplementation_CADAccessOperationGroup__CADDatabaseRequestAccessForEntityType_desiredFullAccess_isBlockingUIThread_reason_reply___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *result;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a3)
  {
    v6 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[7];
      v8 = *(void **)(a1[4] + 8);
      v9 = v6;
      objc_msgSend(v8, "identity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v7;
      v16 = 2114;
      v17 = v10;
      v18 = 1024;
      v19 = a3;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_ERROR, "Failed to request authorization for service %{public}@ for client %{public}@. Error = %d", (uint8_t *)&v14, 0x1Cu);

    }
  }
  objc_msgSend(*(id *)(a1[4] + 8), "clearCachedAuthorizationStatus");
  v11 = a1[6];
  v12 = CalAuthorizationStatusFromTCCAuthRight(a1[7], a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a3, v12);
  result = (void *)a1[5];
  if (result)
    return (void *)objc_msgSend(result, "invalidate");
  return result;
}

- (void)CADDatabaseResetWithReply:(id)a3
{
  ClientConnection *conn;
  void (**v4)(id, _QWORD);

  conn = self->_conn;
  v4 = (void (**)(id, _QWORD))a3;
  -[ClientConnection clearCachedAuthorizationStatus](conn, "clearCachedAuthorizationStatus");
  v4[2](v4, 0);

}

void __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  void *v9;
  id v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = objc_opt_new();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = (const void *)CalDatabaseCopyLimitedAccessVirtualCalendar();
  CADEntityCopyObjectID();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  CalEntityCopyPropertyValues(*(void **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t)v8, *(void **)(a1 + 40), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v9);
  CFRelease(v8);

}

- (void)CADCalendar:(id)a3 hasEvents:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (-[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel") == 2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEvents___block_invoke;
    v9[3] = &unk_1E6A380C8;
    v9[4] = &v10;
    v8 = -[CADXPCImplementation _tryPerformBlockWithCalendarID:forAction:withBlock:](self, "_tryPerformBlockWithCalendarID:forAction:withBlock:", v6, 0, v9);
  }
  else
  {
    v8 = 0;
  }
  v7[2](v7, v8, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);

}

uint64_t __73__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CalCalendarHasEvents();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)CADCalendar:(id)a3 hasEventsWithRoomAsAttendee:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEventsWithRoomAsAttendee___block_invoke;
  v9[3] = &unk_1E6A380C8;
  v9[4] = &v10;
  v8 = -[CADXPCImplementation _tryPerformBlockWithCalendarID:forAction:withBlock:](self, "_tryPerformBlockWithCalendarID:forAction:withBlock:", v6, 0, v9);
  v7[2](v7, v8, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);

}

uint64_t __91__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEventsWithRoomAsAttendee___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CalCalendarHasEventsWithRoomAsAttendee();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)_tryPerformBlockWithCalendarID:(id)a3 forAction:(unint64_t)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  ClientConnection *conn;
  id v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;
  CADXPCImplementation *v17;
  id v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__CADXPCImplementation_CADCalendarOperationGroup___tryPerformBlockWithCalendarID_forAction_withBlock___block_invoke;
  v15[3] = &unk_1E6A380F0;
  v11 = v8;
  v16 = v11;
  v17 = self;
  v19 = &v21;
  v20 = a4;
  v12 = v9;
  v18 = v12;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v11, v15))
  {
    v13 = *((_DWORD *)v22 + 6);
  }
  else
  {
    v13 = 1010;
    *((_DWORD *)v22 + 6) = 1010;
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __102__CADXPCImplementation_CADCalendarOperationGroup___tryPerformBlockWithCalendarID_forAction_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = CalDatabaseCopyCalendarWithUID();
  if (!v2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = 1010;
    goto LABEL_5;
  }
  v3 = (const void *)v2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isCalendarRestricted:forAction:", v2, *(_QWORD *)(a1 + 64)))
  {
    CFRelease(v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = 1013;
LABEL_5:
    *(_DWORD *)(v4 + 24) = v5;
    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  CFRelease(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "logAccessToObject:", *(_QWORD *)(a1 + 32));
}

void __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;
  id v4;

  v2 = (const void *)CalDatabaseCopyLimitedAccessVirtualStore();
  CADEntityCopyObjectID();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CalEntityCopyPropertyValues(*(void **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t)v2, *(void **)(a1 + 40), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v3);
  CFRelease(v2);

}

- (void)CADDatabaseGetLocalSourceWithEnableIfNeeded:(BOOL)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  conn = self->_conn;
  v17 = 0;
  v8 = *MEMORY[0x1E0D0BE78];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalSourceWithEnableIfNeeded_reply___block_invoke;
  v10[3] = &unk_1E6A38168;
  v11 = a3;
  v10[4] = self;
  v10[5] = &v12;
  v10[6] = &v18;
  if (-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v8, v10))
  {
    v9 = *((unsigned int *)v19 + 6);
  }
  else
  {
    v9 = 1007;
    *((_DWORD *)v19 + 6) = 1007;
  }
  v6[2](v6, v9, v13[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v13[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __99__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalSourceWithEnableIfNeeded_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  uint8_t buf[16];

  v4 = CalDatabaseCopyStoreWithUID();
  if (v4)
  {
    v5 = (void *)v4;
    if (!CalStoreGetType())
      goto LABEL_11;
    CalStoreRepairDefaultLocalStore();
    CFRelease(v5);
    v5 = (void *)CalDatabaseCopyStoreWithUID();
    if (v5)
      goto LABEL_11;
  }
  v6 = (void *)CalDatabaseCopyOfAllStores();
  if (!v6)
    return;
  v18 = v6;
  v7 = objc_msgSend(v6, "count");
  if (!v7)
  {
LABEL_9:

    return;
  }
  v8 = v7;
  v9 = 0;
  while (1)
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!CalStoreGetType())
      break;
    if (v8 == ++v9)
      goto LABEL_9;
  }
  CFRetain(v5);

  if (v5)
  {
LABEL_11:
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "eventAccessLevel");
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reminderAccessGranted");
    v12 = v11;
    if (v10 == 2 && (v11 & 1) != 0
      || v10 == 2 && (CalStoreAllowsEvents() & 1) != 0
      || v12 && CalStoreAllowsTasks())
    {
      if (*(_BYTE *)(a1 + 56))
      {
        if ((CalStoreIsEnabled() & 1) == 0)
        {
          CalStoreSetEnabled();
          if ((CalDatabaseSave() & 1) == 0)
          {
            v13 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "Failed to save database after creating subscribed calendar store", buf, 2u);
            }
          }
        }
      }
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 6, CalStoreGetUID(), a2);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v17 = 0;
    }
    else
    {
      v17 = 1013;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v17;
    CFRelease(v5);
  }
}

- (void)CADDatabaseGetLocalBirthdaySource:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  ClientConnection *conn;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  -[ClientConnection permissionValidator](self->_conn, "permissionValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "canModifyBirthdayCalendar") & 1) != 0)
  {
    conn = self->_conn;
    v7 = *MEMORY[0x1E0D0BE78];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalBirthdaySource___block_invoke;
    v9[3] = &unk_1E6A37038;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = &v16;
    if (!-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v7, v9))
      *((_DWORD *)v17 + 6) = 1007;
    v8 = *((unsigned int *)v17 + 6);
  }
  else
  {
    v8 = 1013;
    *((_DWORD *)v17 + 6) = 1013;
  }
  v4[2](v4, v8, v11[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v11[5]);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

}

void __83__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalBirthdaySource___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)CalDatabaseCopyOfAllStores();
  if (v10)
  {
    v4 = objc_msgSend(v10, "count");
    if (v4)
    {
      v5 = v4;
      for (i = 0; v5 != i; ++i)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);

        if (CalStoreGetType() == 5)
        {
          if (objc_msgSend(*(id *)(a1[4] + 8), "eventAccessLevel") == 2
            && (CalStoreAllowsEvents() & 1) != 0)
          {
            v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 6, CalStoreGetUID(), a2);
            v8 = *(_QWORD *)(a1[5] + 8);
            v9 = *(void **)(v8 + 40);
            *(_QWORD *)(v8 + 40) = v7;

            *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
            break;
          }
          *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1013;
        }
      }
    }
  }

}

void __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = CalDatabaseCopyCalendarWithUID();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (const void *)CalCalendarCopyStore();
    CFRelease(v3);
    if (v4)
    {
      CADEntityCopyObjectID();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      CFRelease(v4);
    }
  }
}

void __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const void *v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = MEMORY[0x1BCC9BEF0](a3, objc_msgSend(*(id *)(a1 + 32), "entityID"));
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = (const void *)CalCalendarItemCopyCalendar();
    CFRelease(v5);
    if (v6)
    {
      v7 = (const void *)CalCalendarCopyStore();
      CFRelease(v6);
      if (v7)
      {
        CADEntityCopyObjectID();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        CFRelease(v7);
      }
    }
  }
}

- (void)CADSourceGetNotificationCollection:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetNotificationCollection_reply___block_invoke;
  v9[3] = &unk_1E6A38190;
  v9[4] = &v10;
  v8 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", v6, 0, v9);
  v7[2](v7, v8, v11[5]);
  _Block_object_dispose(&v10, 8);

}

void __90__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetNotificationCollection_reply___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  id v7;
  uint64_t UID;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (const __CFArray *)CalStoreCopyCalendars();
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        CFArrayGetValueAtIndex(v3, i);
        if (CalCalendarIsNotificationsCollection())
        {
          v7 = objc_alloc(MEMORY[0x1E0D0BAF8]);
          UID = CalCalendarGetUID();
          v9 = objc_msgSend(v7, "initWithEntityType:entityID:databaseID:", 1, UID, CalDatabaseGetAuxilliaryDatabaseID());
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

        }
      }
    }
    CFRelease(v3);
  }
}

- (void)CADSourceRefresh:(id)a3 isUserRequested:(BOOL)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD v13[7];
  BOOL v14;
  _QWORD v15[5];
  ClientConnection *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__6;
  v15[4] = __Block_byref_object_dispose__6;
  v16 = self->_conn;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceRefresh_isUserRequested_reply___block_invoke;
  v13[3] = &unk_1E6A381E0;
  v14 = a4;
  v13[4] = v15;
  v13[5] = &v21;
  v13[6] = &v17;
  v10 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", v8, 0, v13);
  v11 = *((_DWORD *)v18 + 6);
  if (v11)
    v12 = v11;
  else
    v12 = v10;
  v9[2](v9, v12, *((unsigned __int8 *)v22 + 24));
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

}

void __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceRefresh_isUserRequested_reply___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  uint64_t v5;
  CFIndex v6;
  void *v7;
  int v8;
  id v9;

  v9 = (id)CalStoreCopyExternalID();
  if (v9)
  {
    v2 = (const __CFArray *)CalStoreCopyCalendars();
    v3 = v2;
    if (v2)
    {
      Count = CFArrayGetCount(v2);
      if (Count < 1)
      {
        v5 = 0;
      }
      else
      {
        v5 = 0;
        v6 = 0;
        do
        {
          CFArrayGetValueAtIndex(v3, v6);
          if (CalCalendarCanContainEntityType()
            && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventAccessLevel"))
          {
            v5 |= 4uLL;
          }
          if (CalCalendarCanContainEntityType()
            && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "reminderAccessGranted"))
          {
            v5 |= 0x10uLL;
          }
          ++v6;
        }
        while (Count != v6);
      }
      objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:", v9, v5, *(unsigned __int8 *)(a1 + 56));

      if (v8)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      CFRelease(v3);
    }
  }

}

- (void)CADCountCalendarItemsOfType:(int)a3 inSource:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  uint64_t v10;
  _QWORD v11[5];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__CADXPCImplementation_CADSourceOperationGroup__CADCountCalendarItemsOfType_inSource_reply___block_invoke;
  v11[3] = &unk_1E6A38208;
  v11[4] = &v13;
  v12 = v6;
  v10 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:entityType:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:entityType:withBlock:", v8, 0, v6, v11);
  v9[2](v9, v10, v14[3]);
  _Block_object_dispose(&v13, 8);

}

uint64_t __92__CADXPCImplementation_CADSourceOperationGroup__CADCountCalendarItemsOfType_inSource_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CalDatabaseGetCountOfCalendarItemsInStore();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (int)result;
  return result;
}

- (void)CADRemoveCalendarItemsOlderThanDate:(id)a3 ofType:(int)a4 inSource:(id)a5 reply:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  int v17;
  _QWORD v18[4];

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__CADXPCImplementation_CADSourceOperationGroup__CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply___block_invoke;
  v14[3] = &unk_1E6A38230;
  v16 = v18;
  v17 = v8;
  v13 = v10;
  v15 = v13;
  v12[2](v12, -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:entityType:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:entityType:withBlock:", v11, 1, v8, v14));

  _Block_object_dispose(v18, 8);
}

uint64_t __107__CADXPCImplementation_CADSourceOperationGroup__CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CalStoreRemoveItemsOfTypeOlderThanDateInStore();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)CADSourceGetGrantedDelegatesList:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke;
  v9[3] = &unk_1E6A38280;
  v7 = v6;
  v10 = v7;
  v8 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", a3, 0, v9);
  if ((_DWORD)v8)
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, v8, 0);

}

void __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)CalStoreCopyExternalID();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke_2;
    v5[3] = &unk_1E6A38258;
    v6 = *(id *)(a1 + 32);
    v4 = (id)objc_msgSend(v3, "requestGrantedDelegatesListForAccountID:resultsBlock:", v2, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_ERROR, "Error getting granted delegates list: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v21 = a1;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v15 = (void *)objc_opt_new();
          objc_msgSend(v14, "uri");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setUri:", v16);

          objc_msgSend(v14, "displayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDisplayName:", v17);

          objc_msgSend(v14, "preferredUserAddress");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPreferredUserAddress:", v18);

          v19 = objc_msgSend(v14, "permission");
          if (v19 >= 3)
            v20 = -1;
          else
            v20 = v19;
          objc_msgSend(v15, "setPermission:", v20, v21);
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    (*(void (**)(void))(*(_QWORD *)(v21 + 32) + 16))();
    v5 = v22;
  }

}

- (void)CADSourceUpdateGrantedDelegate:(id)a3 action:(int64_t)a4 sourceID:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v10 = a3;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke;
  v15[3] = &unk_1E6A382A8;
  v12 = v11;
  v16 = v10;
  v17 = v12;
  v18 = a4;
  v13 = v10;
  v14 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", a5, 1, v15);
  if ((_DWORD)v14)
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v14);

}

void __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = (void *)CalStoreCopyExternalID();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDisplayName:", v4);

    objc_msgSend(*(id *)(a1 + 32), "uri");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUri:", v5);

    objc_msgSend(*(id *)(a1 + 32), "preferredUserAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPreferredUserAddress:", v6);

    if (*(_QWORD *)(a1 + 48) == 1)
    {
      v7 = 0;
    }
    else
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "permission");
      if (v8 >= 3)
        v7 = -1;
      else
        v7 = v8;
    }
    objc_msgSend(v3, "setPermission:", v7);
    v9 = *(_QWORD *)(a1 + 48);
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke_2;
    v13[3] = &unk_1E6A37B50;
    v14 = *(id *)(a1 + 40);
    v12 = (id)objc_msgSend(v11, "updateGrantedDelegateForAccountID:grantedDelegate:action:resultsBlock:", v2, v3, v10, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_ERROR, "Error updating granted delegate: %@", (uint8_t *)&v6, 0xCu);
    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v5();

}

- (void)CADSourceAddExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toSourceWithID:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke;
  v17[3] = &unk_1E6A382F8;
  v13 = v12;
  v19 = v11;
  v20 = v13;
  v18 = v10;
  v14 = v11;
  v15 = v10;
  v16 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", a5, 1, v17);
  if ((_DWORD)v16)
    (*((void (**)(id, uint64_t, _QWORD, uint64_t))v13 + 2))(v13, v16, 0, -1);

}

void __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  int v14;

  v6 = (void *)CalStoreCopyExternalID();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke_2;
    v10[3] = &unk_1E6A382D0;
    v11 = v6;
    v13 = a3;
    v14 = a2;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "addExchangeDelegateWithName:emailAddress:toAccountWithID:completion:", v8, v9, v11, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!v7 && a3 == -1)
  {
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v20 = 138543618;
      v21 = v10;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_ERROR, "Error adding Exchange delegate to account %{public}@: %@", (uint8_t *)&v20, 0x16u);
    }
    v11 = 0;
    v12 = *(_QWORD *)(a1 + 40);
    v13 = -1;
    v14 = 1015;
    goto LABEL_21;
  }
  if (v7)
  {
    v15 = CalDatabaseCopyStoreWithUUID();
    if (!v15)
    {
      v17 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v20 = 138543618;
        v21 = v18;
        v22 = 2114;
        v23 = v7;
        _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_ERROR, "Error adding Exchange delegate to account %{public}@. The delegate source ID we got (%{public}@) does not exist!", (uint8_t *)&v20, 0x16u);
      }
      v11 = 0;
      v14 = 1015;
      goto LABEL_14;
    }
    v16 = (const void *)v15;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 6, CalEntityGetID(), *(unsigned int *)(a1 + 56));
    CFRelease(v16);
  }
  else
  {
    v11 = 0;
  }
  v14 = 0;
LABEL_14:
  v12 = *(_QWORD *)(a1 + 40);
  v19 = -1;
  if (!a3)
    v19 = 0;
  if (a3 == 1)
    v19 = 1;
  if (a3 == 2)
    v13 = 2;
  else
    v13 = v19;
LABEL_21:
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v12 + 16))(v12, v14, v11, v13);

}

- (void)CADSourceRemoveExchangeDelegateWithID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke;
  v9[3] = &unk_1E6A38280;
  v7 = v6;
  v10 = v7;
  v8 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", a3, 1, v9);
  if ((_DWORD)v8)
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v8);

}

void __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)CalStoreCopyUUID();
  if (v2)
  {
    v3 = (void *)CalStoreCopyDelegatedAccountOwnerStoreID();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke_2;
      v5[3] = &unk_1E6A38320;
      v6 = v2;
      v7 = *(id *)(a1 + 32);
      objc_msgSend(v4, "removeExchangeDelegateWithSourceID:fromParentAccountWithID:completion:", v6, v3, v5);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_ERROR, "Failed to remove Exchange delegate with accountID %{public}@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (int)_tryPerformBlockWithSourceID:(id)a3 forAction:(unint64_t)a4 entityType:(int)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  int v12;
  _BOOL4 v13;
  int v14;
  BOOL v16;
  int v17;
  char v18;
  int v19;

  v10 = a3;
  v11 = a6;
  v12 = -[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel");
  v13 = -[ClientConnection reminderAccessGranted](self->_conn, "reminderAccessGranted");
  v14 = a5 != 3 || v13;
  v16 = a5 == 2 && v12 == 0;
  v17 = 1013;
  if (v14 == 1 && !v16)
  {
    v18 = !v13;
    if (!v12)
      v18 = 1;
    if (a5 || (v18 & 1) == 0)
    {
      v19 = -[CADXPCImplementation _tryPerformBlockWithSourceID:forAction:withBlock:](self, "_tryPerformBlockWithSourceID:forAction:withBlock:", v10, a4, v11);
      v17 = v19 & (v19 >> 31);
    }
  }

  return v17;
}

- (void)CADDatabaseGetColorWithProviderIdentifier:(id)a3 externalID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  ClientConnection *conn;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v23 = 0;
  conn = self->_conn;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__CADXPCImplementation_CADColorOperationGroup__CADDatabaseGetColorWithProviderIdentifier_externalID_reply___block_invoke;
  v14[3] = &unk_1E6A38350;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  v17 = &v18;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v14);
  v10[2](v10, 0, v19[5]);

  _Block_object_dispose(&v18, 8);
}

void __107__CADXPCImplementation_CADColorOperationGroup__CADDatabaseGetColorWithProviderIdentifier_externalID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v7 = CalDatabaseCopyColorWithProviderAndExternalID();
  if (v7)
  {
    v8 = (const void *)v7;
    *a4 = 1;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 29, CalColorGetUID(), a2);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    CFRelease(v8);
  }
}

- (void)CADInternalForceStatCollection:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  CADStatsCollect();
  v3[2](v3, 0);

}

- (void)CADInternalSetNextConferenceLinkRenewalToNow:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  v3 = (void *)MEMORY[0x1E0C99D68];
  v5 = (void (**)(id, _QWORD))a3;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADConferenceUtils setNextConferenceLinkRenewalDate:](CADConferenceUtils, "setNextConferenceLinkRenewalDate:", v4);

  v5[2](v5, 0);
}

- (void)CADInternalRemoveConferenceLinkRenewalDate:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  +[CADConferenceUtils removeNextConferenceLinkRenewalDate](CADConferenceUtils, "removeNextConferenceLinkRenewalDate");
  v3[2](v3, 0);

}

- (void)CADTestingSimulateDaemonCrash
{
  -[ClientConnection invalidateConnection](self->_conn, "invalidateConnection");
}

- (void)CADTestingCloseDatabase:(id)a3
{
  ClientConnection *conn;
  void (**v4)(id, _QWORD);

  conn = self->_conn;
  v4 = (void (**)(id, _QWORD))a3;
  -[ClientConnection closeDatabases](conn, "closeDatabases");
  v4[2](v4, 0);

}

- (void)CADPurgeChangeTrackingReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  CFAbsoluteTime Current;
  ClientConnection *conn;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEBUG, "Purging change log.", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  conn = self->_conn;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__CADXPCImplementation_CADCalendarToolOperationGroup__CADPurgeChangeTrackingReply___block_invoke;
  v8[3] = &__block_descriptor_40_e346_v28__0i8__CalDatabase____CFRuntimeBase_QAQ_i__CPRecordStore___CalEventOccurrenceCache___CalScheduledTaskCache__v_v____CFDictionary_____CFDictionary__os_unfair_lock_s_I_II____CFArray_____CFString_____CFArray_ii____CFString_____CFURL_____CFString_____CFString_Qiii____opaque_pthread_mutex_t_q_56c__B____CFArray_B____CFSet____i____IIiQBBBBBBB_12_B20l;
  *(CFAbsoluteTime *)&v8[4] = Current;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v8);
  v4[2](v4, 0);

}

uint64_t __83__CADXPCImplementation_CADCalendarToolOperationGroup__CADPurgeChangeTrackingReply___block_invoke()
{
  return CalDatabasePurgeIdlePersistentChangeTrackingClients();
}

- (void)CADPostSyntheticRouteHypothesis:(id)a3 forEventWithExternalURL:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  +[CADSyntheticRouteHypothesizerCache sharedInstance](CADSyntheticRouteHypothesizerCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syntheticRouteHypothesizerForEventExternalURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "updateHandler");
    v13 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    v14 = CADLogHandle;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v8;
        _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_DEFAULT, "Posting synthetic route hypothesis for event with external url = %{public}@", (uint8_t *)&v17, 0xCu);
      }
      objc_msgSend(v12, "setCurrentCADRouteHypothesis:", v7);
      v13[2](v13);
      v15 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v17 = 138543618;
        v18 = v8;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_ERROR, "Could not post synthetic route hypothesis for event with external url because could not get update handler for synthetic route hypothesizer, event external url = %{public}@, synthetic route hypothesizer = %@", (uint8_t *)&v17, 0x16u);
      }
      v15 = 1015;
    }
    v9[2](v9, v15);

  }
  else
  {
    v16 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_ERROR, "Could not post synthetic route hypothesis for event with external url because could not get cached synthetic route hypothesizer, event external url = %{public}@", (uint8_t *)&v17, 0xCu);
    }
    v9[2](v9, 1015);
  }

}

- (void)CADDatabaseGetDefaultLocalCalendarWithReply:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  ClientConnection *conn;
  uint64_t v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  conn = self->_conn;
  v6 = *MEMORY[0x1E0D0BE78];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetDefaultLocalCalendarWithReply___block_invoke;
  v7[3] = &unk_1E6A36C30;
  v7[4] = &v8;
  -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v6, v7);
  v4[2](v4, 0, v9[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v9[5]);
  _Block_object_dispose(&v8, 8);

}

void __92__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetDefaultLocalCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CalDatabaseCopyDefaultLocalCalendar();
  if (v2)
  {
    v3 = (const void *)v2;
    CADEntityCopyObjectID();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    CFRelease(v3);
  }
}

- (void)CADDatabaseSetDefaultCalendarForNewEvents:(id)a3 delegateSource:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  int v11;
  NSObject *v12;
  int v13;
  int v14;
  ClientConnection *conn;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  CADXPCImplementation *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (v9)
  {
    v11 = objc_msgSend(v8, "databaseID");
    if (v11 != objc_msgSend(v9, "databaseID"))
    {
      v12 = (id)CADLogHandle;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(v8, "databaseID");
        v14 = objc_msgSend(v9, "databaseID");
        *(_DWORD *)buf = 67109376;
        v34 = v13;
        v35 = 1024;
        v36 = v14;
        _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_ERROR, "Attempted to set a calendar in database %i as the default calendar for a source in database %i", buf, 0xEu);
      }

      *((_DWORD *)v30 + 6) = 1001;
    }
  }
  conn = self->_conn;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __111__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetDefaultCalendarForNewEvents_delegateSource_reply___block_invoke;
  v24 = &unk_1E6A36F18;
  v16 = v8;
  v25 = v16;
  v28 = &v29;
  v17 = v9;
  v26 = v17;
  v27 = self;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v16, &v21))
  {
    v18 = *((unsigned int *)v30 + 6);
  }
  else
  {
    v18 = 1010;
    *((_DWORD *)v30 + 6) = 1010;
  }
  v10[2](v10, v18);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v9)
    objc_msgSend(v19, "addObject:", v17);
  if (v16)
    objc_msgSend(v20, "addObject:", v16);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v20);

  _Block_object_dispose(&v29, 8);
}

void __111__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetDefaultCalendarForNewEvents_delegateSource_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = CalDatabaseCopyCalendarWithUID();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v4, "entityID");
      v5 = CalDatabaseCopyStoreWithUID();
      if (!v5)
      {
        v6 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v7 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v17 = v7;
          _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_ERROR, "NULL store returned from CalDatabaseCopyStoreWithUID. ObjectID: [%@]", buf, 0xCu);
        }
        v8 = v3;
        goto LABEL_17;
      }
    }
    else
    {
      v5 = 0;
    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "isCalendarRestricted:forAction:", v3, 1) & 1) != 0)
    {
      v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_ERROR, "Calendar restricts unmanaged -> managed write action. ObjectID: [%@]", buf, 0xCu);
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "identity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("EventKit (%@)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CalDatabaseSetDefaultCalendarForNewEventsInStore();

    }
    CFRelease(v3);
    if (v5)
    {
      v8 = (const void *)v5;
LABEL_17:
      CFRelease(v8);
    }
  }
  else
  {
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_ERROR, "NULL calendar returned from CalDatabaseCopyCalendarWithUID. ObjectID: [%@]", buf, 0xCu);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetOrCreateSubscribedCalendarsSource:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  ClientConnection *conn;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  conn = self->_conn;
  v13 = -1;
  v6 = *MEMORY[0x1E0D0BE78];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateSubscribedCalendarsSource___block_invoke;
  v9[3] = &unk_1E6A38600;
  v9[4] = &v14;
  v9[5] = &v10;
  if (!-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v6, v9))
    *((_DWORD *)v15 + 6) = 1007;
  if (*((_DWORD *)v11 + 6) == -1)
  {
    v8 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0D0BAF8]);
    v8 = (void *)objc_msgSend(v7, "initWithEntityType:entityID:databaseID:", 6, *((unsigned int *)v11 + 6), v6);
  }
  v4[2](v4, *((unsigned int *)v15 + 6), v8);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

void __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateSubscribedCalendarsSource___block_invoke(uint64_t a1)
{
  uint64_t IfNeeded;
  const void *v3;
  NSObject *v4;
  uint8_t v5[16];

  IfNeeded = CalDatabaseCopySubscribedCalendarStoreCreateIfNeeded();
  if (IfNeeded)
  {
    v3 = (const void *)IfNeeded;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CalEntityGetID();
    CFRelease(v3);
  }
  else
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_ERROR, "Failed to get subscribed calendars source.", v5, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1015;
  }
}

- (void)CADDatabaseGetOrCreateBirthdayCalendar:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  ClientConnection *conn;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  conn = self->_conn;
  v13 = -1;
  v6 = *MEMORY[0x1E0D0BE78];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateBirthdayCalendar___block_invoke;
  v9[3] = &unk_1E6A38600;
  v9[4] = &v10;
  v9[5] = &v14;
  if (!-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v6, v9))
    *((_DWORD *)v15 + 6) = 1007;
  if (*((_DWORD *)v11 + 6) == -1)
  {
    v8 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0D0BAF8]);
    v8 = (void *)objc_msgSend(v7, "initWithEntityType:entityID:databaseID:", 1, *((unsigned int *)v11 + 6), v6);
  }
  v4[2](v4, *((unsigned int *)v15 + 6), v8);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v8);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

void __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateBirthdayCalendar___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = CalDatabaseCopyBirthdayCalendar();
  if (v2)
  {
    v3 = (const void *)v2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CalCalendarGetUID();
    CFRelease(v3);
  }
  else
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEFAULT, "No birthday calendar; creating one", buf, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CalCalendarInsertBirthdayCalendar();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == -1)
    {
      v5 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_ERROR, "Unable to create birthday calendar", v6, 2u);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1015;
    }
  }
}

- (void)CADDatabaseGetBirthdayCalendarEnabledWithReply:(id)a3
{
  id v4;

  v4 = a3;
  (*((void (**)(id, _QWORD, BOOL))a3 + 2))(v4, 0, +[CADBirthdayListener birthdayCalendarEnabled](CADBirthdayListener, "birthdayCalendarEnabled"));

}

- (void)CADDatabaseSetBirthdayCalendarEnabled:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  void (**v5)(id, _QWORD);

  v4 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  +[CADBirthdayListener setBirthdayCalendarEnabled:](CADBirthdayListener, "setBirthdayCalendarEnabled:", v4);
  v5[2](v5, 0);

}

- (void)CADDatabaseGetBirthdayCalendarVersionWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -1;
  conn = self->_conn;
  v6 = *MEMORY[0x1E0D0BE78];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetBirthdayCalendarVersionWithReply___block_invoke;
  v8[3] = &unk_1E6A36C30;
  v8[4] = &v9;
  if (-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v6, v8))
    v7 = 0;
  else
    v7 = 1007;
  v4[2](v4, v7, *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);

}

uint64_t __95__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetBirthdayCalendarVersionWithReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CalCalendarGetBirthdayCalendarVersion();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)CADDatabaseSetBirthdayCalendarVersion:(int)a3 withReply:(id)a4
{
  ClientConnection *conn;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);
  _QWORD v8[4];
  int v9;

  conn = self->_conn;
  v5 = *MEMORY[0x1E0D0BE78];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetBirthdayCalendarVersion_withReply___block_invoke;
  v8[3] = &__block_descriptor_36_e342_v20__0i8__CalDatabase____CFRuntimeBase_QAQ_i__CPRecordStore___CalEventOccurrenceCache___CalScheduledTaskCache__v_v____CFDictionary_____CFDictionary__os_unfair_lock_s_I_II____CFArray_____CFString_____CFArray_ii____CFString_____CFURL_____CFString_____CFString_Qiii____opaque_pthread_mutex_t_q_56c__B____CFArray_B____CFSet____i____IIiQBBBBBBB_12l;
  v9 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (-[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v5, v8))
    v6 = 0;
  else
    v6 = 1007;
  v7[2](v7, v6);

}

uint64_t __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetBirthdayCalendarVersion_withReply___block_invoke()
{
  return CalCalendarSetBirthdayCalendarVersion();
}

- (void)CADDatabaseGetSuggestedEventCalendarWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  ClientConnection *conn;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  -[ClientConnection permissionValidator](self->_conn, "permissionValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "canModifySuggestedEventCalendar")
    || !+[CADFeatureSet isSuggestionsEnabled](CADFeatureSet, "isSuggestionsEnabled"))
  {
    v9 = v19;
    v10 = 1013;
LABEL_6:
    *((_DWORD *)v9 + 6) = v10;
    goto LABEL_7;
  }
  conn = self->_conn;
  v7 = *MEMORY[0x1E0D0BE78];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSuggestedEventCalendarWithReply___block_invoke;
  v11[3] = &unk_1E6A38600;
  v11[4] = &v18;
  v11[5] = &v12;
  v8 = -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v7, v11);
  v9 = v19;
  if (!v8)
  {
    v10 = 1007;
    goto LABEL_6;
  }
  v10 = *((unsigned int *)v19 + 6);
LABEL_7:
  v4[2](v4, v10, v13[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v13[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

void __94__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSuggestedEventCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CalDatabaseCopySuggestionsCalendar();
  if (v2)
  {
    v3 = (const void *)v2;
    CADEntityCopyObjectID();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1010;
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  ClientConnection *conn;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  -[ClientConnection permissionValidator](self->_conn, "permissionValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "canModifySuggestedEventCalendar")
    || !+[CADFeatureSet isSuggestionsEnabled](CADFeatureSet, "isSuggestionsEnabled"))
  {
    v9 = v19;
    v10 = 1013;
LABEL_6:
    *((_DWORD *)v9 + 6) = v10;
    goto LABEL_7;
  }
  conn = self->_conn;
  v7 = *MEMORY[0x1E0D0BE78];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __109__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply___block_invoke;
  v11[3] = &unk_1E6A38600;
  v11[4] = &v18;
  v11[5] = &v12;
  v8 = -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v7, v11);
  v9 = v19;
  if (!v8)
  {
    v10 = 1007;
    goto LABEL_6;
  }
  v10 = *((unsigned int *)v19 + 6);
LABEL_7:
  v4[2](v4, v10, v13[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v13[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

void __109__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  if (v2)
  {
    v3 = (const void *)v2;
    CADEntityCopyObjectID();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1010;
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseRemoveSuggestedEventCalendarWithReply:(id)a3
{
  void (**v4)(id, uint64_t);
  ClientConnection *conn;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = (void (**)(id, uint64_t))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (!-[CADXPCImplementation _CADDatabaseCanModifySuggestedEventCalendar](self, "_CADDatabaseCanModifySuggestedEventCalendar"))
  {
    v8 = v12;
    v9 = 1013;
LABEL_6:
    *((_DWORD *)v8 + 6) = v9;
    goto LABEL_7;
  }
  conn = self->_conn;
  v6 = *MEMORY[0x1E0D0BE78];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseRemoveSuggestedEventCalendarWithReply___block_invoke;
  v10[3] = &unk_1E6A36C30;
  v10[4] = &v11;
  v7 = -[ClientConnection withDatabaseID:perform:](conn, "withDatabaseID:perform:", v6, v10);
  v8 = v12;
  if (!v7)
  {
    v9 = 1007;
    goto LABEL_6;
  }
  v9 = *((unsigned int *)v12 + 6);
LABEL_7:
  v4[2](v4, v9);
  _Block_object_dispose(&v11, 8);

}

void __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseRemoveSuggestedEventCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;

  v2 = CalDatabaseCopySuggestionsCalendar();
  v3 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  if (v2 | v3)
  {
    v4 = (const void *)v3;
    if (v2)
    {
      CalDatabaseRemoveSuggestionsCalendar();
      CFRelease((CFTypeRef)v2);
    }
    if (v4)
    {
      CalDatabaseRemoveNaturalLanguageSuggestionsCalendar();
      CFRelease(v4);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1012;
  }
}

- (void)CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  ClientConnection *conn;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  conn = self->_conn;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __110__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID_reply___block_invoke;
  v10[3] = &unk_1E6A37038;
  v9 = v6;
  v11 = v9;
  v12 = &v18;
  v13 = &v14;
  -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v9, v10);
  v7[2](v7, *((unsigned int *)v15 + 6), v19[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

}

void __110__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = MEMORY[0x1BCC9BEF0](a3, objc_msgSend(*(id *)(a1 + 32), "entityID"));
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = CalEventCopyCreatorTeamIdentityString();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1008;
  }
}

- (void)CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ClientConnection *conn;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[ClientConnection databaseInitializationOptions](self->_conn, "databaseInitializationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteClientIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "teamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (-[ClientConnection identity](self->_conn, "identity"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "teamIdentifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__12;
    v23 = __Block_byref_object_dispose__12;
    v24 = 0;
    conn = self->_conn;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __108__CADXPCImplementation_CADEventOperationGroup__CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID_reply___block_invoke;
    v16 = &unk_1E6A381B8;
    v17 = v6;
    v18 = &v19;
    -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v17, &v13);
    v7[2](v7, objc_msgSend(v10, "isEqual:", v20[5], v13, v14, v15, v16));

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v7[2](v7, 0);
  }

}

void __108__CADXPCImplementation_CADEventOperationGroup__CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = MEMORY[0x1BCC9BEF0](a3, objc_msgSend(*(id *)(a1 + 32), "entityID"));
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = CalEventCopyCreatorTeamIdentityString();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    CFRelease(v5);
  }
}

- (void)CADDatabaseGetEventWithEventIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  ClientConnection *conn;
  unsigned int v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  CADXPCImplementation *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (-[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel") == 2)
  {
    conn = self->_conn;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithEventIdentifier_reply___block_invoke;
    v11[3] = &unk_1E6A37120;
    v12 = v6;
    v13 = self;
    v14 = &v16;
    v15 = &v20;
    -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v11);

  }
  if (v21[5])
    v9 = 0;
  else
    v9 = 1010;
  if (*((_BYTE *)v17 + 24))
    v10 = 1013;
  else
    v10 = v9;
  v7[2](v7, v10);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v21[5]);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

}

void __93__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithEventIdentifier_reply___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = CalDatabaseCopyEventWithPublicID();
  if (v6)
  {
    v7 = (const void *)v6;
    if (objc_msgSend(*(id *)(a1[5] + 8), "isCalendarItemRestricted:forAction:", v6, 0))
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      CADEntityCopyObjectID();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[7] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
      *a4 = 1;
    CFRelease(v7);
  }
}

- (void)CADDatabaseGetEventWithUniqueID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *, uint64_t, uint64_t, _BYTE *);
  void *v16;
  id v17;
  CADXPCImplementation *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  v26 = 0;
  conn = self->_conn;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithUniqueID_reply___block_invoke;
  v16 = &unk_1E6A37120;
  v9 = v6;
  v17 = v9;
  v18 = self;
  v19 = &v27;
  v20 = &v21;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", &v13);
  v10 = v22;
  v11 = v22[5];
  if (v11)
  {
    v12 = *((unsigned int *)v28 + 6);
  }
  else
  {
    v12 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
    v11 = v10[5];
  }
  v7[2](v7, v12, v11);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v22[5], v13, v14, v15, v16);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithUniqueID_reply___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = CalDatabaseCopyEventWithUniqueIdentifierInStore();
  if (v6)
  {
    v7 = (const void *)v6;
    if (objc_msgSend(*(id *)(a1[5] + 8), "isCalendarItemRestricted:forAction:", v6, 0))
    {
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1013;
    }
    else
    {
      CADEntityCopyObjectID();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[7] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
        *a4 = 1;
    }
    CFRelease(v7);
  }
}

- (void)CADDatabaseGetAllEventsWithUniqueID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  ClientConnection *conn;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  CADXPCImplementation *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v8 = (void *)objc_opt_new();
  conn = self->_conn;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __90__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAllEventsWithUniqueID_reply___block_invoke;
  v15 = &unk_1E6A38648;
  v10 = v6;
  v19 = &v20;
  v16 = v10;
  v17 = self;
  v11 = v8;
  v18 = v11;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", &v12);
  v7[2](v7, *((unsigned int *)v21 + 6), v11);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
}

void __90__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAllEventsWithUniqueID_reply___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;
  void *v8;

  v2 = (const __CFArray *)CalDatabaseCopyAllEventsWithUniqueIdentifierInStore();
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        if (ValueAtIndex
          && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isCalendarItemRestricted:forAction:", ValueAtIndex, 0) & 1) == 0)
        {
          CADEntityCopyObjectID();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

        }
      }
    }
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1007;
  }
}

- (void)CADDatabaseCanModifySuggestedEventCalendar:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, _QWORD, BOOL))a3 + 2))(v5, 0, -[CADXPCImplementation _CADDatabaseCanModifySuggestedEventCalendar](self, "_CADDatabaseCanModifySuggestedEventCalendar"));

}

- (void)CADDatabaseGetSourceIdentifierForEventWithObjectID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  ClientConnection *conn;
  id v10;
  uint64_t v11;
  ClientConnection *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  if (objc_msgSend(v6, "isTemporary"))
  {
    +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:](CADOperationGroupUtil, "defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:", 0, self->_conn, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    conn = self->_conn;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke;
    v16[3] = &unk_1E6A381B8;
    v10 = v8;
    v17 = v10;
    v18 = &v19;
    LOBYTE(conn) = -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v10, v16);

    if ((conn & 1) == 0)
    {
LABEL_3:
      v11 = 1010;
      goto LABEL_8;
    }
  }
  else
  {
    v12 = self->_conn;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke_2;
    v13[3] = &unk_1E6A381B8;
    v14 = v6;
    v15 = &v19;
    LODWORD(v12) = -[ClientConnection withDatabaseForObject:perform:](v12, "withDatabaseForObject:perform:", v14, v13);

    if (!(_DWORD)v12)
      goto LABEL_3;
  }
  if (v20[5])
    v11 = 0;
  else
    v11 = 1010;
LABEL_8:
  v7[2](v7, v11, v20[5]);
  _Block_object_dispose(&v19, 8);

}

void __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    v6 = CalCalendarCopyStore();
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = CalStoreCopyUUID();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      CFRelease(v7);
    }
    CFRelease(v5);
  }
}

void __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    v6 = CalCalendarItemCopyCalendar();
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = CalCalendarCopyStore();
      if (v8)
      {
        v9 = (const void *)v8;
        v10 = CalStoreCopyUUID();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        CFRelease(v9);
      }
      CFRelease(v7);
    }
    CFRelease(v5);
  }
}

- (void)CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID:(id)a3 nearestDate:(id)a4 prefersForwardSearch:(BOOL)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  ClientConnection *conn;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CADXPCImplementation *v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __142__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID_nearestDate_prefersForwardSearch_reply___block_invoke;
  v17[3] = &unk_1E6A386D0;
  v22 = a5;
  v18 = v11;
  v19 = v10;
  v20 = self;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  -[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v15, v17);

}

void __142__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID_nearestDate_prefersForwardSearch_reply___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  int v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v2 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  v3 = (const void *)CalFilterCreateWithDatabaseShowingAll();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v4 = *(unsigned __int8 *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "entityID");
  if (v4)
    v5 = CalDatabaseCopyEventOccurrenceNearestToDatePreferringForwardSearch();
  else
    v5 = CalDatabaseCopyEventOccurrenceNearestToDate();
  v6 = (const void *)v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    CalEventOccurrenceGetDate();
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v6);
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (v3)
    CFRelease(v3);
  if (v2)
    CFRelease(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "logAccessToObject:", *(_QWORD *)(a1 + 40));

}

- (void)CADOccurrenceCacheGetOccurrenceCountWithStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  ClientConnection *conn;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  conn = self->_conn;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __112__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountWithStartDate_endDate_reply___block_invoke;
  v14[3] = &unk_1E6A38350;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  v17 = &v18;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v14);
  (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, *((unsigned int *)v19 + 6));

  _Block_object_dispose(&v18, 8);
}

void __112__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountWithStartDate_endDate_reply___block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += CalEventOccurrenceCacheCount();
  if (v2)
    CFRelease(v2);
}

- (void)CADOccurrenceCacheDoEvents:(id)a3 haveOccurrencesAfterDate:(id)a4 reply:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  ClientConnection *conn;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void (**v28)(id, uint64_t, id);
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v26 = a4;
  v28 = (void (**)(id, uint64_t, id))a5;
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  if (v8)
  {
    v10 = MEMORY[0x1E0C9AAA0];
    v11 = v8;
    do
    {
      objc_msgSend(v9, "addObject:", v10, v26);
      --v11;
    }
    while (v11);
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 + i, v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v16 += i;
    }
    while (v15);
  }

  conn = self->_conn;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __106__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply___block_invoke;
  v29[3] = &unk_1E6A369A8;
  v30 = v26;
  v31 = v12;
  v22 = v9;
  v32 = v22;
  v23 = v12;
  v24 = v26;
  if (-[ClientConnection withDatabaseForObjects:perform:](conn, "withDatabaseForObjects:perform:", v13, v29))
  {
    v25 = 0;
  }
  else
  {

    v22 = 0;
    v25 = 1010;
  }
  v28[2](v28, v25, v22);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v13);

}

void __106__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *HaveOccurrencesAfterDate;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CFTypeRef cf;
  CFTypeRef v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CalDatabaseCopyEventOccurrenceCache();
  v6 = CalFilterCreateWithDatabaseShowingAll();
  objc_msgSend(a1[4], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "valueForKey:", CFSTR("entityID"));
  cf = (CFTypeRef)v6;
  v19 = (CFTypeRef)v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HaveOccurrencesAfterDate = (void *)CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(a1[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        objc_msgSend(HaveOccurrencesAfterDate, "objectAtIndexedSubscript:", v11 + v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "setObject:atIndexedSubscript:", v16, v15);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v11 += v13;
    }
    while (v10);
  }

  CFRelease(cf);
  CFRelease(v19);

}

- (void)CADOccurrenceCacheSearchWithTerm:(id)a3 inCalendars:(id)a4 responseToken:(int)a5 reply:(id)a6
{
  uint64_t v6;
  void *v10;
  uint64_t v11;
  void (**v12)(id, uint64_t);

  v6 = *(_QWORD *)&a5;
  v12 = (void (**)(id, uint64_t))a6;
  +[CADCalSearchOperation operationWithConnection:searchTerm:calendars:replyID:](CADCalSearchOperation, "operationWithConnection:searchTerm:calendars:replyID:", self->_conn, a3, a4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ClientConnection addOperation:](self->_conn, "addOperation:", v10);
    v11 = 0;
  }
  else
  {
    v11 = 1001;
  }
  v12[2](v12, v11);

}

- (void)CADOccurrenceCacheSearchLocationsWithTerm:(id)a3 inCalendars:(id)a4 responseToken:(int)a5 reply:(id)a6
{
  uint64_t v6;
  void *v10;
  uint64_t v11;
  void (**v12)(id, uint64_t);

  v6 = *(_QWORD *)&a5;
  v12 = (void (**)(id, uint64_t))a6;
  +[CADCalSearchOperation operationWithConnection:searchTerm:calendars:replyID:](CADCalLocationSearchOperation, "operationWithConnection:searchTerm:calendars:replyID:", self->_conn, a3, a4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ClientConnection addOperation:](self->_conn, "addOperation:", v10);
    v11 = 0;
  }
  else
  {
    v11 = 1001;
  }
  v12[2](v12, v11);

}

- (void)CADOccurrenceCacheCancelSearchWithReplyID:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ClientConnection operations](self->_conn, "operations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "replyID") == a3)
        {
          objc_msgSend(v9, "cancel");
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)CADOccurrencesExistInRangeForEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6 timezone:(id)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = (void (**)(id, uint64_t, _QWORD))a8;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  conn = self->_conn;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __136__CADXPCImplementation_CADEventOperationGroup__CADOccurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone_reply___block_invoke;
  v25[3] = &unk_1E6A386F8;
  v19 = v16;
  v26 = v19;
  v20 = v14;
  v27 = v20;
  v21 = v15;
  v28 = v21;
  v22 = v13;
  v29 = v22;
  v30 = &v37;
  v31 = &v33;
  v32 = a6;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v22, v25))
  {
    v23 = *((unsigned int *)v38 + 6);
  }
  else
  {
    v23 = 1010;
    *((_DWORD *)v38 + 6) = 1010;
  }
  v17[2](v17, v23, *((unsigned __int8 *)v34 + 24));
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v22);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

void __136__CADXPCImplementation_CADEventOperationGroup__CADOccurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v5;
  const void *v6;

  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceReferenceDate");
  CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
  v5 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 56));
  if (v5)
  {
    v6 = v5;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = CalEventOccurrencesExistForEventInDateRange() != 0;
    CFRelease(v6);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseShouldPermitOrganizerEmailFromJunkChecks:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  ClientConnection *conn;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerEmailFromJunkChecks_reply___block_invoke;
  v9[3] = &unk_1E6A38720;
  v9[4] = &v10;
  v9[5] = v6;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);

}

uint64_t __106__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerEmailFromJunkChecks_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = CalHasCurrentUserInvitedAttendeeWithEmail();
  if ((result & 1) != 0
    || (result = CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithEmail(), (result & 1) != 0)
    || (result = CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithEmail(), (_DWORD)result))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  ClientConnection *conn;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  conn = self->_conn;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __112__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks_reply___block_invoke;
  v9[3] = &unk_1E6A38720;
  v9[4] = &v10;
  v9[5] = v6;
  -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v9);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);

}

uint64_t __112__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = CalHasCurrentUserInvitedAttendeeWithPhoneNumber();
  if ((result & 1) != 0
    || (result = CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithPhoneNumber(), (result & 1) != 0)
    || (result = CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithPhoneNumber(), (_DWORD)result))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)CADDatabaseGetAttachmentWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  ClientConnection *conn;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  CADXPCImplementation *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = 0;
  if (v6)
  {
    if (-[ClientConnection eventAccessLevel](self->_conn, "eventAccessLevel"))
    {
      conn = self->_conn;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAttachmentWithUUID_reply___block_invoke;
      v10[3] = &unk_1E6A37120;
      v11 = v6;
      v12 = self;
      v13 = &v21;
      v14 = &v15;
      -[ClientConnection withAllDatabasesPerform:](conn, "withAllDatabasesPerform:", v10);
      if (!v16[5])
        *((_DWORD *)v22 + 6) = 1010;

      v9 = *((unsigned int *)v22 + 6);
    }
    else
    {
      v9 = 1013;
      *((_DWORD *)v22 + 6) = 1013;
    }
  }
  else
  {
    v9 = 1001;
    v24 = 1001;
  }
  v7[2](v7, v9, v16[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAttachmentWithUUID_reply___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = (const void *)CalDatabaseCopyAttachmentWithUUID();
  if (v6)
  {
    v7 = v6;
    *a4 = 1;
    if (CADEntityIsInRestrictedStore(*(void **)(a1[5] + 8), v6, 0))
    {
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1013;
    }
    else
    {
      CADEntityCopyObjectID();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[7] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    CFRelease(v7);
  }
}

- (void)CADDatabaseLoadEventsInCalendar:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, uint64_t);
  ClientConnection *conn;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12;
  v26 = __Block_byref_object_dispose__12;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12;
  v20 = __Block_byref_object_dispose__12;
  v21 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseLoadEventsInCalendar_reply___block_invoke;
  v11[3] = &unk_1E6A38748;
  v9 = v6;
  v12 = v9;
  v13 = &v28;
  v14 = &v16;
  v15 = &v22;
  if (-[ClientConnection withDatabaseForObject:perform:](conn, "withDatabaseForObject:perform:", v9, v11))
  {
    v10 = *((unsigned int *)v29 + 6);
  }
  else
  {
    v10 = 1010;
    *((_DWORD *)v29 + 6) = 1010;
  }
  v7[2](v7, v10, v23[5], v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseLoadEventsInCalendar_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "entityID");
  v2 = CalDatabaseCopyCalendarWithUID();
  if (v2)
  {
    v3 = (const void *)v2;
    CalEventCopyRowIDsAndUniqueIdentifiersInCalendar();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1015;
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetTTLLocationAuthorizationStatus:(id)a3
{
  void *v3;
  uint64_t v4;
  void (**v5)(id, _QWORD, uint64_t);

  v3 = (void *)MEMORY[0x1E0D0C330];
  v5 = (void (**)(id, _QWORD, uint64_t))a3;
  v4 = objc_msgSend(v3, "ttlLocationStatus");
  +[CADXPCImplementation monitorLocationAuthorizationStatusChanges:](CADXPCImplementation, "monitorLocationAuthorizationStatusChanges:", v4);
  v5[2](v5, 0, v4);

}

+ (void)monitorLocationAuthorizationStatusChanges:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CADXPCImplementation_CADEventOperationGroup__monitorLocationAuthorizationStatusChanges___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (monitorLocationAuthorizationStatusChanges__onceToken != -1)
    dispatch_once(&monitorLocationAuthorizationStatusChanges__onceToken, block);
}

void __90__CADXPCImplementation_CADEventOperationGroup__monitorLocationAuthorizationStatusChanges___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  monitorLocationAuthorizationStatusChanges__lastStatus = *(_QWORD *)(a1 + 32);
  v1 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6A18000, v1, OS_LOG_TYPE_INFO, "Listening for changes in location authorization status", v5, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D0C138], 0, 0, &__block_literal_global_36);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)monitorLocationAuthorizationStatusChanges__receipt;
  monitorLocationAuthorizationStatusChanges__receipt = v3;

}

void __90__CADXPCImplementation_CADEventOperationGroup__monitorLocationAuthorizationStatusChanges___block_invoke_34()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(MEMORY[0x1E0D0C330], "ttlLocationStatus");
  if (v0 != monitorLocationAuthorizationStatusChanges__lastStatus)
  {
    v1 = v0;
    v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v4 = 134218240;
      v5 = monitorLocationAuthorizationStatusChanges__lastStatus;
      v6 = 2048;
      v7 = v1;
      _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_INFO, "Location authorization status changed from %lu to %lu", (uint8_t *)&v4, 0x16u);
    }
    monitorLocationAuthorizationStatusChanges__lastStatus = v1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CADTTLLocationAuthorizationStatusChangedNotification"), 0, 0, 1u);
  }
}

@end
