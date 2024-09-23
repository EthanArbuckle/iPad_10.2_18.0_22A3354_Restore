@implementation CUIKCalendarAccountGrouper

+ (void)_populateGroups:(id)a3 forNonDelegateSources:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CUIKGroupInfo *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isDelegate") & 1) == 0)
        {
          objc_msgSend(v11, "constraints");
          v12 = (CUIKGroupInfo *)objc_claimAutoreleasedReturnValue();
          if (-[CUIKGroupInfo allowsEvents](v12, "allowsEvents")
            && objc_msgSend(v11, "syncs"))
          {
            v13 = objc_msgSend(v11, "sourceType");

            if (v13 == 4)
              continue;
            v12 = -[CUIKGroupInfo initWithSource:]([CUIKGroupInfo alloc], "initWithSource:", v11);
            objc_msgSend(v11, "sourceIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v12, v14);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

+ (id)_groupForCustomGroupType:(unint64_t)a3 inMap:(id)a4
{
  id v5;
  void *v6;
  CUIKGroupInfo *v7;
  void *v8;

  v5 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (CUIKGroupInfo *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = -[CUIKGroupInfo initWithCustomGroupType:]([CUIKGroupInfo alloc], "initWithCustomGroupType:", a3);
      -[CUIKGroupInfo setSelected:](v7, "setSelected:", 0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, v8);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_groupForSource:(id)a3 inMap:(id)a4
{
  id v5;
  id v6;
  CUIKGroupInfo *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sourceIdentifier");
  v7 = (CUIKGroupInfo *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "sourceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v7 = (CUIKGroupInfo *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = -[CUIKGroupInfo initWithSource:]([CUIKGroupInfo alloc], "initWithSource:", v5);
      -[CUIKGroupInfo setSelected:](v7, "setSelected:", 0);
      objc_msgSend(v5, "sourceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, v9);

    }
  }

  return v7;
}

+ (void)_insertStore:(id)a3 intoByGroupArray:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v5 = a4;
  v9 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, v6, 1024, &__block_literal_global_7);
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  objc_msgSend(v5, "insertObject:atIndex:", v9, v8);

}

uint64_t __60__CUIKCalendarAccountGrouper__insertStore_intoByGroupArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "sortOrder");
  if (v6 >= (int)objc_msgSend(v5, "sortOrder"))
  {
    v8 = objc_msgSend(v4, "sortOrder");
    if (v8 <= (int)objc_msgSend(v5, "sortOrder"))
    {
      objc_msgSend(v4, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "compare:", v10);

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)generateGroupsForCalendars:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 forMode:(int64_t)a6 usingBackgroundColor:(id)a7 includingAccountsWithoutCalendars:(BOOL)a8 filterByFocus:(BOOL)a9 usingUnselectedCalendars:(id)a10 foundRefreshableCalendar:(BOOL *)a11 anyGroupsHiddenByFocus:(BOOL *)a12 numberOfCalendarsHiddenByFocus:(int64_t *)a13
{
  _BOOL4 v13;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  int v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  CUIKCalendarInfo *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  void *v44;
  uint64_t v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  int v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  _BOOL4 v64;
  id obj;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v13 = a8;
  v79 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v56 = a4;
  v59 = a7;
  v60 = a10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v56, "sources");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_populateGroups:forNonDelegateSources:", v19, v21);

  }
  if (v60)
    v22 = a9;
  else
    v22 = 0;
  v64 = v22;
  v55 = (void *)v18;
  v62 = (void *)v20;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = 0;
    v61 = 0;
  }
  v57 = (void *)v19;
  v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v17;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (!v23)
  {
    v58 = 0;
    goto LABEL_70;
  }
  v24 = v23;
  v58 = 0;
  v25 = *(_QWORD *)v75;
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v75 != v25)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
      if (a5)
      {
        if (a5 == 1)
        {
          v28 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "allowReminders");
          if (a11)
          {
            if (v28)
              goto LABEL_21;
          }
        }
      }
      else
      {
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "allowEvents");
        if (a11 && (v29 & 1) != 0)
LABEL_21:
          *a11 = 1;
      }
      objc_msgSend(v27, "source");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "sourceType") == 6)
      {
        objc_msgSend(v30, "externalID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectForKeyedSubscript:", v31);
        v32 = (id)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v30, "externalID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v32, v33);

        }
        objc_msgSend(v27, "externalID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v34);
        v35 = (CUIKCalendarInfo *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          -[CUIKCalendarInfo addCalendar:](v35, "addCalendar:", v27);
          goto LABEL_66;
        }
      }
      else
      {
        v32 = 0;
      }
      v35 = -[CUIKCalendarInfo initWithCalendar:]([CUIKCalendarInfo alloc], "initWithCalendar:", v27);
      if (v32)
      {
        objc_msgSend(v27, "externalID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, v36);

      }
      if (a6 == 1)
      {
        objc_msgSend(v30, "constraints");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "prohibitsICSImport");

        if (v38)
          -[CUIKCalendarInfo setIsEnabled:](v35, "setIsEnabled:", 0);
      }
      if (objc_msgSend(v30, "sourceType") == 6
        && objc_msgSend(MEMORY[0x1E0CA9FC0], "isReminderAppLocked"))
      {
        -[CUIKCalendarInfo setIsEnabled:](v35, "setIsEnabled:", 0);
      }
      if (!v35 || (objc_msgSend(v27, "isHidden") & 1) != 0)
        goto LABEL_66;
      if (!a5)
      {
        objc_msgSend(v30, "constraints");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "allowsEvents");
        goto LABEL_42;
      }
      if (a5 == 1)
      {
        objc_msgSend(v30, "constraints");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "allowsTasks");
LABEL_42:
        v41 = v40;

        goto LABEL_44;
      }
      v41 = 0;
LABEL_44:
      if (-[CUIKCalendarInfo customGroupType](v35, "customGroupType"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CUIKCalendarInfo customGroupType](v35, "customGroupType"));
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
      if (v30)
        v43 = v41;
      else
        v43 = 0;
      if (v43 == 1)
      {
        objc_msgSend(v30, "sourceIdentifier");
        v42 = objc_claimAutoreleasedReturnValue();
LABEL_51:
        v44 = (void *)v42;
        if (v42)
        {
          objc_msgSend(v61, "addObject:", v42);

        }
      }
      if (v64)
      {
        if (objc_msgSend(v60, "containsObject:", v27))
        {
          -[CUIKCalendarInfo setFilteredByFocus:](v35, "setFilteredByFocus:", 1);
          if (a13)
          {
            ++v58;
            goto LABEL_66;
          }
        }
      }
      if (-[CUIKCalendarInfo customGroupType](v35, "customGroupType"))
      {
        objc_msgSend(a1, "_groupForCustomGroupType:inMap:", -[CUIKCalendarInfo customGroupType](v35, "customGroupType"), v62);
        v45 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v30)
          v46 = v41;
        else
          v46 = 0;
        if (v46 != 1)
          goto LABEL_66;
        objc_msgSend(a1, "_groupForSource:inMap:", v30, v57);
        v45 = objc_claimAutoreleasedReturnValue();
      }
      v47 = (void *)v45;
      if (v45)
      {
        -[CUIKCalendarInfo setSelected:](v35, "setSelected:", 0);
        objc_msgSend(v27, "displayColor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        CUIKAdjustedColorForBackgroundColor(v48, v59);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKCalendarInfo setColor:](v35, "setColor:", v49);

        objc_msgSend(v47, "insertCalendarInfo:", v35);
      }
LABEL_66:

    }
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  }
  while (v24);
LABEL_70:

  if (a13)
    *a13 = v58;
  if (a12)
  {
    v50 = objc_msgSend(v54, "count");
    if (v50 != objc_msgSend(v61, "count"))
      *a12 = 1;
  }
  v51 = objc_msgSend(v57, "count");
  v52 = MEMORY[0x1E0C809B0];
  if (v51)
  {
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke;
    v71[3] = &unk_1E6EB6950;
    v73 = a1;
    v72 = v55;
    objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v71);

  }
  if (objc_msgSend(v62, "count"))
  {
    v68[0] = v52;
    v68[1] = 3221225472;
    v68[2] = __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke_2;
    v68[3] = &unk_1E6EB6950;
    v70 = a1;
    v69 = v55;
    objc_msgSend(v62, "enumerateKeysAndObjectsUsingBlock:", v68);

  }
  return v55;
}

uint64_t __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "_insertStore:intoByGroupArray:", a3, *(_QWORD *)(a1 + 32));
}

uint64_t __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "_insertStore:intoByGroupArray:", a3, *(_QWORD *)(a1 + 32));
}

+ (id)eligibleCalendarsForMovingEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKAccountsController sharedInstance](CUIKAccountsController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sourceIsManaged:", v5);

  objc_msgSend(v3, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(v3, "isNew");
  v11 = objc_msgSend(v5, "isDelegate");
  v12 = 0;
  if (v9)
    v13 = v10;
  else
    v13 = 1;
  v14 = v5;
  if (!v11 && v13)
  {
    if ((v10 & 1) != 0)
    {
      v15 = v7;
      if (!v9)
      {
        v14 = 0;
        v12 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v15 = objc_msgSend(v3, "hasAttendees");
    }
    v16 = v15 | v10 ^ 1;
    if (!v9)
      v16 = 1;
    if (v15)
      v14 = v5;
    else
      v14 = 0;
    v12 = (v16 | v7) ^ 1u;
  }
LABEL_16:
  objc_msgSend(v3, "eventStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKCalendarAccountGrouper calendarsLimitedToSource:writability:onlyUnmanagedAccounts:forEvent:entityType:inEventStore:](CUIKCalendarAccountGrouper, "calendarsLimitedToSource:writability:onlyUnmanagedAccounts:forEvent:entityType:inEventStore:", v14, 2, v12, v3, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)calendarsLimitedToSource:(id)a3 writability:(int64_t)a4 onlyUnmanagedAccounts:(BOOL)a5 forEvent:(id)a6 entityType:(unint64_t)a7 inEventStore:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;

  v11 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a8;
  if (a6)
  {
    v21 = a6;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = a6;
    objc_msgSend(v16, "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(a1, "calendarsLimitedToSource:writability:onlyUnmanagedAccounts:forEvents:entityType:inEventStore:", v14, a4, v11, v18, a7, v15, v21, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)calendarsLimitedToSource:(id)a3 writability:(int64_t)a4 onlyUnmanagedAccounts:(BOOL)a5 forEvents:(id)a6 entityType:(unint64_t)a7 inEventStore:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  BOOL v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  BOOL v41;

  v13 = a3;
  v14 = a6;
  v15 = a8;
  v16 = v15;
  v17 = a4 - 1;
  v18 = a4 == 1;
  v19 = (unint64_t)(a4 - 1) < 2;
  if (v13)
  {
    if (v17 > 1)
    {
      objc_msgSend(v13, "calendarsForEntityType:", a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "readWriteCalendarsForEntityType:", a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v21 = (void *)MEMORY[0x1E0CB3880];
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke;
        v39[3] = &unk_1E6EB6978;
        v40 = v14;
        v41 = a4 == 1;
        objc_msgSend(v21, "predicateWithBlock:", v39);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "filteredSetUsingPredicate:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v23;
      }
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C99E60];
    if (v17 > 1)
    {
      objc_msgSend(v15, "calendarsForEntityType:", a7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v15, "readWriteCalendarsForEntityType:", a7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count"))
      {
        v27 = (void *)MEMORY[0x1E0CB3880];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_2;
        v36[3] = &unk_1E6EB6978;
        v37 = v14;
        v38 = v18;
        objc_msgSend(v27, "predicateWithBlock:", v36);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "filteredSetUsingPredicate:", v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v29;
      }
    }
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_3;
    v33[3] = &__block_descriptor_34_e37_B24__0__EKCalendar_8__NSDictionary_16l;
    v34 = v19;
    v35 = a5;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "filteredSetUsingPredicate:", v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

uint64_t __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  char v12;
  int v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = *(unsigned __int8 *)(a1 + 40);
        objc_msgSend(v9, "calendar", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v12 = objc_msgSend(v9, "canMoveOrCopyToCalendar:fromCalendar:error:", v3, v11, 0);

          if ((v12 & 1) == 0)
            goto LABEL_13;
        }
        else
        {
          v13 = objc_msgSend(v9, "canMoveToCalendar:fromCalendar:error:", v3, v11, 0);

          if (!v13)
          {
LABEL_13:
            v14 = 0;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_14:

  return v14;
}

uint64_t __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  char v12;
  int v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = *(unsigned __int8 *)(a1 + 40);
        objc_msgSend(v9, "calendar", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v12 = objc_msgSend(v9, "canMoveOrCopyToCalendar:fromCalendar:error:", v3, v11, 0);

          if ((v12 & 1) == 0)
            goto LABEL_13;
        }
        else
        {
          v13 = objc_msgSend(v9, "canMoveToCalendar:fromCalendar:error:", v3, v11, 0);

          if (!v13)
          {
LABEL_13:
            v14 = 0;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_14:

  return v14;
}

uint64_t __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  objc_msgSend(a2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDelegate") & 1) != 0 || *(_BYTE *)(a1 + 32) && objc_msgSend(v3, "sourceType") == 6)
  {
    v4 = 0;
  }
  else
  {
    +[CUIKAccountsController sharedInstance](CUIKAccountsController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sourceIsManaged:", v3);

    if (*(_BYTE *)(a1 + 33))
      v4 = v6 ^ 1u;
    else
      v4 = 1;
  }

  return v4;
}

@end
