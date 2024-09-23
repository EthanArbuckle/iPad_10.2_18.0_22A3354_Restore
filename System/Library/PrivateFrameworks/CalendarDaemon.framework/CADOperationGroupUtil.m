@implementation CADOperationGroupUtil

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  BOOL v13;
  __int128 v14;
  char v15;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  CalDatabaseGetPreferences();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "get_defaultCalendarDatabaseID");
  if ((_DWORD)v6)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_3;
    v16[3] = &unk_1E6A38378;
    v19 = *(_QWORD *)(a1 + 56);
    v14 = *(_OWORD *)(a1 + 32);
    v7 = (id)v14;
    v17 = v14;
    v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v7, "withDatabaseID:perform:", v6, v16);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v15 = 0;
    objc_msgSend(*(id *)(a1 + 56), "defaultCalendarIDForNewEventsInStoreWithID:connection:inDatabase:defaultExists:", 0, *(_QWORD *)(a1 + 32), a3, &v15);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v11 + 24))
    {
      v12 = 1;
    }
    else
    {
      if ((_DWORD)v6)
        v13 = 1;
      else
        v13 = v15 == 0;
      v12 = !v13;
    }
    *(_BYTE *)(v11 + 24) = v12;
  }

}

+ (id)defaultCalendarIDForNewEventsInStoreWithID:(id)a3 connection:(id)a4 inDatabase:(CalDatabase *)a5 defaultExists:(BOOL *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  uint64_t DefaultCalendarForNewEvents;
  void *v15;
  char v16;
  NSObject *v17;
  _BOOL4 v18;
  const __CFArray *v19;
  const __CFArray *v20;
  CFIndex Count;
  CFIndex v22;
  const void *ValueAtIndex;
  int UID;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    DefaultCalendarForNewEvents = CalDatabaseCopyOrCreateDefaultCalendarForNewEvents();
    if (DefaultCalendarForNewEvents)
    {
      v13 = (const void *)DefaultCalendarForNewEvents;
      v11 = 0;
      goto LABEL_7;
    }
    v25 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      v26 = "NULL calendar returned by CalDatabaseCopyOrCreateDefaultCalendarForNewEvents";
      goto LABEL_28;
    }
LABEL_29:
    v15 = 0;
    v28 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v8, "entityID");
  v10 = CalDatabaseCopyStoreWithUID();
  if (!v10)
  {
    v25 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      v26 = "NULL source returned by CalDatabaseCopyStoreWithUID";
LABEL_28:
      _os_log_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v32, 2u);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  v11 = (const void *)v10;
  v12 = CalDatabaseCopyDefaultOrAnyReadWriteCalendarForNewEvents();
  if (!v12)
  {
    v27 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1B6A18000, v27, OS_LOG_TYPE_ERROR, "NULL calendar returned by CalDatabaseCopyDefaultOrAnyReadWriteCalendarForNewEvents", (uint8_t *)&v32, 2u);
    }
    v15 = 0;
    v13 = 0;
    v20 = 0;
    v28 = 0;
    goto LABEL_35;
  }
  v13 = (const void *)v12;
LABEL_7:
  CADEntityCopyObjectID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isCalendarRestricted:forAction:", v13, 1);
  v17 = CADLogHandle;
  v18 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO);
  if ((v16 & 1) != 0)
  {
    if (v18)
    {
      v32 = 138412290;
      v33 = v15;
      _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_INFO, "Calendar does not allow write from unmanaged -> managed. Finding first calendar that allows it. ObjectID: [%@]", (uint8_t *)&v32, 0xCu);
    }
    v19 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
    v20 = v19;
    if (!v19)
    {

LABEL_31:
      v29 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_INFO, "No calendar allows write from unmanaged -> managed. Will return nil", (uint8_t *)&v32, 2u);
      }
      v15 = 0;
      goto LABEL_34;
    }
    Count = CFArrayGetCount(v19);

    if (Count < 1)
      goto LABEL_31;
    v22 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v20, v22);
      if (CalCalendarCanContainEntityType())
      {
        UID = CalCalendarGetUID();
        if (UID != CalCalendarGetUID()
          && (objc_msgSend(v9, "isCalendarRestricted:forAction:", ValueAtIndex, 1) & 1) == 0)
        {
          break;
        }
      }
      if (Count == ++v22)
        goto LABEL_31;
    }
    CADEntityCopyObjectID();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v32 = 138412290;
      v33 = v15;
      _os_log_impl(&dword_1B6A18000, v31, OS_LOG_TYPE_INFO, "Found calendar that allows write from unmanaged -> managed. ObjectID: [%@]", (uint8_t *)&v32, 0xCu);
    }
    if (!v15)
      goto LABEL_31;
  }
  else
  {
    if (v18)
    {
      v32 = 138412290;
      v33 = v15;
      _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_INFO, "Calendar allows write from unmanaged -> managed. Returning ObjectID: [%@]", (uint8_t *)&v32, 0xCu);
    }
    v20 = 0;
  }
LABEL_34:
  v28 = 1;
  if (v11)
LABEL_35:
    CFRelease(v11);
  if (v13)
    CFRelease(v13);
  if (v20)
    CFRelease(v20);
LABEL_40:
  if (a6)
    *a6 = v28;

  return v15;
}

+ (id)defaultCalendarForNewEventsInDelegateSource:(id)a3 withConnection:(id)a4 limitedAccess:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  id v29;
  _QWORD v30[3];
  int v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  _QWORD *v35;
  id v36;
  _QWORD v37[5];
  void *v38;
  _QWORD v39[5];
  _QWORD v40[3];
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__8;
  v46 = __Block_byref_object_dispose__8;
  v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  if (v5)
  {
    v11 = *MEMORY[0x1E0D0BE78];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke;
    v39[3] = &unk_1E6A36C30;
    v39[4] = &v42;
    objc_msgSend(v9, "withDatabaseID:perform:", v11, v39);
  }
  else
  {
    if (v8)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_5;
      v18[3] = &unk_1E6A383F0;
      v21 = &v42;
      v22 = a1;
      v19 = v8;
      v20 = v10;
      objc_msgSend(v20, "withDatabaseForObject:perform:", v19, v18);

      v12 = v19;
    }
    else
    {
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__8;
      v37[4] = __Block_byref_object_dispose__8;
      v38 = 0;
      v13 = *MEMORY[0x1E0D0BE78];
      v14 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_2;
      v32[3] = &unk_1E6A383A0;
      v15 = v9;
      v33 = v15;
      v34 = &v42;
      v35 = v40;
      v36 = a1;
      objc_msgSend(v15, "withDatabaseID:perform:", v13, v32);
      if (!v43[5])
      {
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x2020000000;
        v31 = 0;
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_4;
        v23[3] = &unk_1E6A383C8;
        v25 = &v42;
        v29 = a1;
        v24 = v15;
        v26 = v30;
        v27 = v40;
        v28 = v37;
        objc_msgSend(v24, "withAllDatabasesPerform:", v23);

        _Block_object_dispose(v30, 8);
      }

      _Block_object_dispose(v37, 8);
      v12 = v38;
    }

  }
  v16 = (id)v43[5];
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  return v16;
}

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (const void *)CalDatabaseCopyLimitedAccessVirtualCalendar();
  CADEntityCopyObjectID();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  CFRelease(v2);
}

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 56), "defaultCalendarIDForNewEventsInStoreWithID:connection:inDatabase:defaultExists:", 0, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_4(uint64_t a1, int a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (*MEMORY[0x1E0D0BE78] != a2)
  {
    objc_msgSend(*(id *)(a1 + 72), "defaultCalendarIDForNewEventsInStoreWithID:connection:inDatabase:defaultExists:", 0, *(_QWORD *)(a1 + 32), a3, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "entityID");
        v10 = CalDatabaseCopyCalendarWithUID();
        if (v10)
        {
          v11 = (const void *)v10;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "set_defaultCalendarDatabaseID:", a2);
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "identity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("No default found (%@)"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          CalDatabaseSetDefaultCalendarForNewEventsWithReason();

          CFRelease(v11);
        }
      }
      *a4 = 1;
    }
  }
}

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 56), "defaultCalendarIDForNewEventsInStoreWithID:connection:inDatabase:defaultExists:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
