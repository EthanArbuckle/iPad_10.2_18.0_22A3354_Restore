@implementation CaliTIPHandler

+ (void)processMessages:(id)a3 withDatabase:(CalDatabase *)a4 calStore:(void *)a5 accountInfo:(id)a6 handledEventCallback:(id)a7 cancellationToken:(id)a8 options:(unint64_t)a9
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = a8;
  objc_msgSend(a3, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v21);
      if ((objc_msgSend(v14, "isCancelled") & 1) != 0)
        break;
      objc_msgSend(v22, "event");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        objc_msgSend(a1, "processMessage:withDatabase:calStore:accountInfo:handledEventCallback:options:", v22, a4, a5, v12, v13, a9);
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v19)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (BOOL)diffsAreImportant:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", II_LOCATION_KEY) & 1) != 0
    || (objc_msgSend(v3, "containsObject:", II_ALL_DAY_KEY) & 1) != 0
    || (objc_msgSend(v3, "containsObject:", II_FROM_KEY) & 1) != 0
    || (objc_msgSend(v3, "containsObject:", II_VIDEOCONFERENCE_KEY) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "containsObject:", II_RECURRENCE_KEY);
  }

  return v4;
}

+ (id)debugStringForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "recurrence_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "uid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recurrence_id");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "uid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)getOccurrenceChange:(id)a3 forEvent:(id)a4 inCalendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "recurrence_id");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v34 = a1;
    objc_msgSend(v9, "recurrence_id");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemDateForDate:options:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v8, "recurrenceIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v10, "systemDateForDate:options:", v19, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqual:", v20))
          {
            v21 = (void *)CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
            {
              v22 = v21;
              objc_msgSend(v34, "debugStringForEvent:", v9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v40 = v23;
              _os_log_impl(&dword_1A5CCB000, v22, OS_LOG_TYPE_DEBUG, "event has occurrence change: %@", buf, 0xCu);

            }
            objc_msgSend(v8, "changeForOccurrence:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_23;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v16)
          continue;
        break;
      }
    }

    a1 = v34;
    goto LABEL_16;
  }
  objc_msgSend(v8, "recurrenceIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v8, "masterChange");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
LABEL_16:
      v27 = (void *)CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
      {
        v28 = v27;
        objc_msgSend(a1, "debugStringForEvent:", v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v29;
        _os_log_impl(&dword_1A5CCB000, v28, OS_LOG_TYPE_DEBUG, "event does NOT have occurrence change: %@", buf, 0xCu);

      }
      v24 = 0;
      goto LABEL_23;
    }
  }
  else
  {

  }
  v30 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v31 = v30;
    objc_msgSend(a1, "debugStringForEvent:", v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v32;
    _os_log_impl(&dword_1A5CCB000, v31, OS_LOG_TYPE_DEBUG, "event has occurrence change: %@", buf, 0xCu);

  }
  objc_msgSend(v8, "masterChange");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v24;
}

+ (BOOL)doScheduleChanges:(id)a3 applyToEvent:(id)a4 inCalendar:(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isCreate") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v8, "recurrence_id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "recurrence_id");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemDateForDate:options:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v7, "recurrenceIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
      {
        v16 = v15;
        v23 = v8;
        v17 = *(_QWORD *)v25;
        v10 = 1;
LABEL_6:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v9, "systemDateForDate:options:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18), 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v13, "isEqual:", v19);

          if ((v20 & 1) != 0)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v16)
              goto LABEL_6;
            v10 = 0;
            break;
          }
        }
        v8 = v23;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      objc_msgSend(v7, "recurrenceIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v7, "masterChange");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v21 != 0;

      }
      else
      {
        v10 = 1;
      }
    }

  }
  return v10;
}

+ (BOOL)isAddressMe:(id)a3 withAccountInfo:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "addressIsAccountOwner:", v6);

  return v7;
}

+ (id)myAddressWithAccountInfo:(id)a3 forEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a4, "attendee", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(a1, "isAddressMe:withAccountInfo:", v13, v6);

        if ((v14 & 1) != 0)
        {
          v15 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

+ (BOOL)myStatusNeedsActionForEvent:(id)a3 withAccountInfo:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "attendee", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "partstat") < 2 || objc_msgSend(v12, "rsvp"))
        {
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(a1, "isAddressMe:withAccountInfo:", v13, v6);

          if ((v14 & 1) != 0)
          {
            v15 = 1;
            goto LABEL_13;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (void)copyEventInStore:(void *)a3 appropriateForHandlingMessageForEventUID:(id)a4 inDatabase:(CalDatabase *)a5
{
  id v5;
  CFTypeRef v6;
  uint64_t v7;
  const void *i;
  const void *v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)CalDatabaseCopyAllEventsWithUniqueIdentifierInStore((os_unfair_lock_s *)a5, (const __CFString *)a4, (uint64_t)a3);
  v6 = (CFTypeRef)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(const void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((CalEventIsOnCalendarThatAllowsScheduling((uint64_t)v9) & 1) != 0)
        {
          v6 = CFRetain(v9);
          goto LABEL_14;
        }
        v10 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          _os_log_impl(&dword_1A5CCB000, v10, OS_LOG_TYPE_INFO, "Rejecting candidate event for iTIP message because it is on a calendar that does not allow scheduling %@", buf, 0xCu);
        }
      }
      v6 = (CFTypeRef)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return (void *)v6;
}

+ (void)processMessage:(id)a3 withDatabase:(CalDatabase *)a4 calStore:(void *)a5 accountInfo:(id)a6 handledEventCallback:(id)a7 options:(unint64_t)a8
{
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t DateTimeFromICSDate;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  void *Copy;
  char v34;
  char v35;
  char v36;
  id v37;
  unint64_t v38;
  int SequenceNumber;
  int v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t ModifiedDate;
  const void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  const void *v50;
  NSObject *v51;
  void *started;
  const __CFString *v53;
  unsigned int Duration;
  _BOOL4 v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  __int128 v64;
  void (**v65)(void);
  id v66;
  char v67;
  id obj;
  char v69;
  void *v70;
  uint64_t v72;
  void *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v67 = a8;
  v84 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v66 = a6;
  v65 = (void (**)(void))a7;
  v70 = v11;
  objc_msgSend(v11, "calendar");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allOccurrences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v14 = v13;
    objc_msgSend(v11, "filename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v81 = v15;
    v82 = 2048;
    v83 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1A5CCB000, v14, OS_LOG_TYPE_DEBUG, "process: ++++ %@ (contains %lu occurrences)", buf, 0x16u);

  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v12;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v16)
  {
    v69 = 0;
    v72 = *(_QWORD *)v76;
    v18 = *MEMORY[0x1E0D0C490];
    *(_QWORD *)&v17 = 138412546;
    v64 = v17;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v76 != v72)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v19);
        objc_msgSend(v20, "uid", v64);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        v23 = v73;
        objc_msgSend(v22, "recurrence_id");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        *(double *)&v25 = v18;
        if (v24)
        {
          objc_msgSend(v22, "recurrence_id");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          DateTimeFromICSDate = CalCreateDateTimeFromICSDate(v26, v23);

          CalDateTimeRelease();
          v25 = DateTimeFromICSDate;
        }

        v28 = *(double *)&v25 == 0.0 || *(double *)&v25 == v18;
        if (!v28)
        {
          objc_msgSend(v22, "uid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          CalGetRecurrenceUIDFromRealUID(v29, *(double *)&v25);
          v30 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v30;
        }
        v31 = objc_msgSend(v23, "method");
        v32 = v31;
        Copy = 0;
        v34 = 1;
        if (v31 <= 5 && ((1 << v31) & 0x2C) != 0)
        {
          Copy = (void *)objc_msgSend(a1, "copyEventInStore:appropriateForHandlingMessageForEventUID:inDatabase:", a5, v21, a4);
          if (Copy)
            goto LABEL_18;
          if (v32 == 3 && ((v28 | objc_msgSend(v70, "iMIPImported") ^ 1) & 1) == 0)
          {
            objc_msgSend(v22, "uid");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (const void *)objc_msgSend(a1, "copyEventInStore:appropriateForHandlingMessageForEventUID:inDatabase:", a5, v49, a4);

            v51 = CDBLogHandle;
            if (v50)
            {
              if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v81 = v21;
                _os_log_impl(&dword_1A5CCB000, v51, OS_LOG_TYPE_INFO, "Making a new detachment with UID %@ for iTIP REPLY.", buf, 0xCu);
              }
              Copy = (void *)CalCalendarItemCreateCopy(v50, 0);
              CalEventRemoveAllRecurrences();
              CalEventAddDetachedEvent((uint64_t)v50, Copy);
              CalEventSetOriginalStartDate((uint64_t)Copy, *(CFAbsoluteTime *)&v25);
              started = (void *)CalEventCopyStartTimeZone((uint64_t)Copy);
              v53 = (const __CFString *)CalCFTimeZoneCopyCalTimeZone();
              CalEventSetStartDate((uint64_t)Copy, v25, v53);
              Duration = CalEventGetDuration((uint64_t)v50);
              CalEventSetEndDate((uint64_t)Copy, *(double *)&v25 + (double)Duration);
              if (v53)
                CFRelease(v53);

              if (Copy)
              {
LABEL_18:
                if ((v69 & 1) != 0
                  && CalEventIsDetached((uint64_t)Copy)
                  && (CalEventIsSignificantlyDetachedIgnoringParticipation((uint64_t)Copy) & 1) == 0
                  && ((v35 = objc_msgSend(v70, "iMIPImported"), v32 == 3) ? (v36 = v35) : (v36 = 0), (v36 & 1) == 0))
                {
                  v57 = CDBLogHandle;
                  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v81 = v21;
                    _os_log_impl(&dword_1A5CCB000, v57, OS_LOG_TYPE_INFO, "Ignoring inbox item %@ because it's detached but not significantly", buf, 0xCu);
                  }
                }
                else
                {
                  if ((v67 & 1) == 0)
                    goto LABEL_28;
                  v37 = v22;
                  v38 = objc_msgSend(v37, "sequence");
                  SequenceNumber = CalEventGetSequenceNumber(Copy);
                  if (v38 > SequenceNumber)
                  {

                    goto LABEL_28;
                  }
                  if (v32 == 3 || v38 < SequenceNumber)
                  {
                    v55 = v38 < SequenceNumber;

                    if (v55)
                      goto LABEL_56;
                  }
                  else
                  {
                    ModifiedDate = CalCalendarItemCopyLastModifiedDate((uint64_t)Copy);
                    v44 = (const void *)ModifiedDate;
                    v45 = v18;
                    if (ModifiedDate)
                    {
                      v45 = MEMORY[0x1A85B424C](ModifiedDate);
                      CFRelease(v44);
                    }
                    objc_msgSend(v37, "last_modified");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = CalDateFromICSDateAsUTC(v46);

                    if (v47 == v18)
                    {
                      objc_msgSend(v37, "dtstamp");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v47 = CalDateFromICSDateAsUTC(v48);

                    }
                    if (v45 > v47)
                    {
LABEL_56:
                      v56 = CDBLogHandle;
                      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v81 = v21;
                        _os_log_impl(&dword_1A5CCB000, v56, OS_LOG_TYPE_INFO, "Ignoring message %@ because it's older than what's already in the database.", buf, 0xCu);
                      }
                      v40 = objc_msgSend(v70, "iMIPImported");
                      goto LABEL_29;
                    }
                  }
LABEL_28:
                  v40 = objc_msgSend(a1, "handleEvent:calEvent:eventID:database:message:accountInfo:", v22, Copy, v21, a4, v70, v66);
LABEL_29:
                  if (v40)
                  {
                    v41 = CDBLogHandle;
                    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v81 = v21;
                      _os_log_impl(&dword_1A5CCB000, v41, OS_LOG_TYPE_DEBUG, "Event with identifier %@ handled message.", buf, 0xCu);
                    }
                    if (v65)
                      v65[2]();
                    v69 = 1;
LABEL_65:
                    CFRelease(Copy);
                    goto LABEL_66;
                  }
                }
                v34 = 0;
                goto LABEL_62;
              }
            }
            else
            {
              v59 = (id)CDBLogHandle;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v22, "uid");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v64;
                v81 = v21;
                v82 = 2112;
                v83 = (uint64_t)v60;
                _os_log_impl(&dword_1A5CCB000, v59, OS_LOG_TYPE_INFO, "Could not find a valid event in the calendar database with uid %@. Also couldn't find the original event with uid %@.", buf, 0x16u);

              }
              Copy = 0;
            }
            v34 = 1;
          }
          else
          {
            v42 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v81 = v21;
              _os_log_impl(&dword_1A5CCB000, v42, OS_LOG_TYPE_INFO, "Could not find a valid event in the calendar database with uid %@", buf, 0xCu);
            }
            Copy = 0;
          }
        }
LABEL_62:
        v58 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v21;
          _os_log_impl(&dword_1A5CCB000, v58, OS_LOG_TYPE_DEBUG, "Event with identifier %@ didn't handle the message; looking at the next event.",
            buf,
            0xCu);
        }
        if ((v34 & 1) == 0)
          goto LABEL_65;
LABEL_66:

        ++v19;
      }
      while (v16 != v19);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      v16 = v61;
    }
    while (v61);
  }

  v62 = (id)CDBLogHandle;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v70, "filename");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v81 = v63;
    _os_log_impl(&dword_1A5CCB000, v62, OS_LOG_TYPE_DEBUG, "process: ~~~~ leaving message: %@", buf, 0xCu);

  }
}

+ (BOOL)handleEvent:(id)a3 calEvent:(void *)a4 eventID:(id)a5 database:(CalDatabase *)a6 message:(id)a7 accountInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  CFTypeRef v32;
  const void *v33;
  int v34;
  int Status;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  BOOL v58;
  char v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v16, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "method");
  switch(v19)
  {
    case 5:
      v22 = objc_msgSend(a1, "myStatusNeedsActionForEvent:withAccountInfo:", v14, v17);
      LODWORD(a1) = objc_msgSend(v16, "iMIPImported");
      if ((_DWORD)a1)
        CalEventSetStatus(a4, 3);
      v23 = (void *)CDBLogHandle;
      v24 = os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          v25 = v23;
          *(_DWORD *)buf = 67109120;
          LODWORD(v81) = CalCalendarItemGetRowID();
          _os_log_impl(&dword_1A5CCB000, v25, OS_LOG_TYPE_INFO, "Found a cancellation for an event (%d) that was proposed or invitee not yet accepted. Hiding alert for this change.", buf, 8u);

        }
        v26 = a4;
        v27 = 0;
      }
      else
      {
        if (v24)
        {
          v37 = v23;
          *(_DWORD *)buf = 67109120;
          LODWORD(v81) = CalCalendarItemGetRowID();
          _os_log_impl(&dword_1A5CCB000, v37, OS_LOG_TYPE_INFO, "Marking cancelled event %d as needing a notification", buf, 8u);

        }
        LOBYTE(a1) = 1;
        v26 = a4;
        v27 = 1;
      }
      CalEventSetNeedsNotification((uint64_t)v26, v27);
      break;
    case 3:
      v69 = v15;
      objc_msgSend(v14, "attendee");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "absoluteString");
      v31 = objc_claimAutoreleasedReturnValue();

      v68 = (void *)v31;
      v32 = CalDatabaseCopyAttendeeForEventWithAddress((os_unfair_lock_s *)a6, (uint64_t)a4, v31);
      if (v32)
      {
        v33 = v32;
        v34 = objc_msgSend(v29, "partstat");
        v66 = v17;
        if (objc_msgSend(v16, "iMIPImported"))
        {
          Status = CalAttendeeGetStatus((uint64_t)v33);
          if (Status == CalAttendeeStatusFromICSParticipationStatus(v34))
          {
            v36 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", II_ATTENDEES_KEY);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            CalAttendeeUpdateFromICSUserAddress(v29, v33, v18, 0);
          }
          LOBYTE(a1) = 1;
        }
        else
        {
          objc_msgSend(a1, "_calculateDiffsForCalEvent:icsEvent:inMessage:", a4, v14, v16);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(a1) = 0;
        }
        v65 = v18;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v51 = v36;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        if (v52)
        {
          v53 = v52;
          v60 = (char)a1;
          v61 = a4;
          v63 = v16;
          v54 = 0;
          v55 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v71 != v55)
                objc_enumerationMutation(v51);
              v57 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
              if (objc_msgSend(v57, "isEqualToString:", II_ATTENDEES_KEY))
                v58 = v34 == 3;
              else
                v58 = 0;
              if (v58)
              {
                CalParticipantSetStatusChanged((uint64_t)v33, 1);
                v54 |= 0x20u;
              }
              else if (objc_msgSend(v57, "isEqualToString:", II_COMMENTS_KEY))
              {
                if (CalParticipantGetCommentChanged((uint64_t)v33))
                  v54 |= 0x10u;
              }
              else
              {
                objc_msgSend(v57, "isEqualToString:", II_PROPOSEDTIME_KEY);
              }
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
          }
          while (v53);

          v16 = v63;
          LOBYTE(a1) = v60;
          if (v54)
          {
            CalEventAddInvitationChangedProperties((uint64_t)v61, v54);
            LOBYTE(a1) = 1;
            CalEventSetNeedsNotification((uint64_t)v61, 1);
          }
        }
        else
        {

        }
        CFRelease(v33);

        v18 = v65;
        v17 = v66;
      }
      else
      {
        LOBYTE(a1) = 0;
      }

      v15 = v69;
      break;
    case 2:
      if (!CalEventHasOccurrenceInTheFuture((uint64_t)a4))
      {
        v20 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v15;
          v21 = "Ignoring inbox update for %@ because it is in the past";
          goto LABEL_25;
        }
LABEL_26:
        LOBYTE(a1) = 0;
        break;
      }
      if (CalCalendarItemGetStatus((uint64_t)a4) == 3
        && objc_msgSend(a1, "myStatusNeedsActionForEvent:withAccountInfo:", v14, v17))
      {
        v20 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v15;
          v21 = "Ignoring cancellation for event we never responded to (%@)";
LABEL_25:
          _os_log_impl(&dword_1A5CCB000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
      if (objc_msgSend(v16, "iMIPImported"))
      {
        v38 = objc_opt_new();
      }
      else
      {
        objc_msgSend(a1, "_calculateDiffsForCalEvent:icsEvent:inMessage:", a4, v14, v16);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v39 = (void *)v38;
      if ((objc_msgSend(a1, "diffsAreImportant:", v38) & 1) != 0
        || objc_msgSend(a1, "myStatusNeedsActionForEvent:withAccountInfo:", v14, v17)
        && !CalEventHasBeenAlerted((uint64_t)a4))
      {
        if (!CalEventIsDetached((uint64_t)a4)
          || (CalEventIsSignificantlyDetachedIgnoringParticipation((uint64_t)a4) & 1) != 0)
        {
          v67 = v17;
          v40 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v81 = v15;
            _os_log_impl(&dword_1A5CCB000, v40, OS_LOG_TYPE_INFO, "Setting needs notification for event %@ because an iTIP request was found in the inbox", buf, 0xCu);
          }
          v62 = v16;
          v64 = v14;
          CalEventSetNeedsNotification((uint64_t)a4, 1);
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v41 = v39;
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
          if (v42)
          {
            v43 = v42;
            v44 = 0;
            v45 = *(_QWORD *)v75;
            do
            {
              v46 = 0;
              do
              {
                if (*(_QWORD *)v75 != v45)
                  objc_enumerationMutation(v41);
                v47 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v46);
                if ((objc_msgSend(v47, "isEqualToString:", II_FROM_KEY) & 1) != 0
                  || objc_msgSend(v47, "isEqualToString:", II_TO_KEY))
                {
                  v44 |= 2u;
                }
                else if (objc_msgSend(v47, "isEqualToString:", II_ALL_DAY_KEY))
                {
                  v44 |= 1u;
                }
                else if (objc_msgSend(v47, "isEqualToString:", II_EVENT_TITLE_KEY))
                {
                  v44 |= 4u;
                }
                else if (objc_msgSend(v47, "isEqualToString:", II_LOCATION_KEY))
                {
                  v44 |= 8u;
                }
                else if (objc_msgSend(v47, "isEqualToString:", II_VIDEOCONFERENCE_KEY))
                {
                  v44 |= 0x100u;
                }
                else if (objc_msgSend(v47, "isEqualToString:", II_RECURRENCE_KEY))
                {
                  v44 |= 0x200u;
                }
                ++v46;
              }
              while (v43 != v46);
              v48 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
              v43 = v48;
            }
            while (v48);
          }

          CalEventSetInvitationChangedProperties((uint64_t)a4);
          LOBYTE(a1) = 1;
          v16 = v62;
          v14 = v64;
          v17 = v67;
          goto LABEL_93;
        }
        v49 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v15;
          v50 = "Ignoring inbox item %@ because it's for an event that is not significantly detached";
          goto LABEL_91;
        }
      }
      else
      {
        v49 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v15;
          v50 = "Ignoring inbox item %@ because it doesn't look important";
LABEL_91:
          _os_log_impl(&dword_1A5CCB000, v49, OS_LOG_TYPE_INFO, v50, buf, 0xCu);
        }
      }
      LOBYTE(a1) = 0;
LABEL_93:

      break;
    default:
      goto LABEL_26;
  }

  return (char)a1;
}

+ (id)_calculateDiffsForCalEvent:(void *)a3 icsEvent:(id)a4 inMessage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "scheduleChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getOccurrenceChange:forEvent:inCalendar:", v10, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "attendeesChanged") & 1) != 0 || objc_msgSend(v13, "participationChanged"))
  {
    objc_msgSend(v11, "addObject:", II_ATTENDEES_KEY);
    objc_msgSend(v10, "attendeeAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = II_ATTENDEE_PREFIX;
      objc_msgSend(v10, "attendeeAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v18);

    }
  }
  if (objc_msgSend(v13, "attachmentsChanged"))
    objc_msgSend(v11, "addObject:", II_ATTACHMENT_KEY);
  if (objc_msgSend(v13, "locationChanged"))
    objc_msgSend(v11, "addObject:", II_LOCATION_KEY);
  if (objc_msgSend(v13, "summaryChanged"))
    objc_msgSend(v11, "addObject:", II_EVENT_TITLE_KEY);
  if (objc_msgSend(v13, "descriptionChanged"))
  {
    objc_msgSend(v11, "addObject:", II_NOTE_KEY);
    if ((CalEventGetInvitationChangedProperties((uint64_t)a3) & 0x100) != 0)
      objc_msgSend(v11, "addObject:", II_VIDEOCONFERENCE_KEY);
  }
  if (objc_msgSend(v13, "urlChanged"))
    objc_msgSend(v11, "addObject:", II_URL_KEY);
  if (objc_msgSend(v13, "privateCommentChanged"))
    objc_msgSend(v11, "addObject:", II_COMMENTS_KEY);
  if (objc_msgSend(v13, "proposedStartDateChanged"))
    objc_msgSend(v11, "addObject:", II_PROPOSEDTIME_KEY);
  if (objc_msgSend(v13, "startTimeChanged"))
    objc_msgSend(v11, "addObject:", II_FROM_KEY);
  if (objc_msgSend(v13, "endTimeChanged"))
    objc_msgSend(v11, "addObject:", II_TO_KEY);
  if (objc_msgSend(v13, "dateTimeChanged"))
    objc_msgSend(v11, "addObject:", II_ALL_DAY_KEY);
  if (objc_msgSend(v13, "timeZoneChanged"))
    objc_msgSend(v11, "addObject:", II_TIME_ZONE_KEY);
  if (objc_msgSend(v13, "recurrenceChanged"))
  {
    v31 = v10;
    v32 = v9;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = v8;
    objc_msgSend(v8, "relatedTo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      v23 = *MEMORY[0x1E0DDBB28];
LABEL_31:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v24);
        objc_msgSend(v25, "parameterValueForName:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          if (objc_msgSend(v26, "longValue") == 1)
          {
            objc_msgSend(v25, "value");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
              break;
          }
        }

        if (v21 == ++v24)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v21)
            goto LABEL_31;
          goto LABEL_39;
        }
      }
      objc_msgSend(v25, "value");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_42;
    }
    else
    {
LABEL_39:

    }
    objc_msgSend(v11, "addObject:", II_RECURRENCE_KEY);
    v29 = 0;
LABEL_42:

    v9 = v32;
    v8 = v33;
    v10 = v31;
  }

  return v11;
}

@end
