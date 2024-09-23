@implementation CUIKEventHeuristics

+ (id)todaysEventsInCalendars:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "CalDateForBeginningOfToday");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "CalDateForEndOfToday");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForEventsWithStartDate:endDate:calendars:", v13, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_sortedAndFilteredEventsForPredicate:filterOptions:sortMethod:eventStore:", v15, a4, a5, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)tomorrowsEventsInCalendars:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "CalDateForBeginningOfTomorrow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "CalDateForEndOfTomorrow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForEventsWithStartDate:endDate:calendars:", v13, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_sortedAndFilteredEventsForPredicate:filterOptions:sortMethod:eventStore:", v15, a4, a5, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)upcomingEventsInCalendars:(id)a3 onlyReturnFirstEvents:(BOOL)a4 filterOptions:(unint64_t)a5 sortMethod:(unint64_t)a6 eventStore:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v10 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "CalDateForNow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "CalDateForEndOfToday");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v12;
  objc_msgSend(v13, "predicateForEventsWithStartDate:endDate:calendars:", v14, v15, v12);
  v16 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)v16;
  v31 = v13;
  objc_msgSend(a1, "_sortedAndFilteredEventsForPredicate:filterOptions:sortMethod:eventStore:", v16, a5, a6, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (v21)
          {
            objc_msgSend(v21, "lastObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "startDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "startDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "isEqualToDate:", v27);

            if (v28)
              objc_msgSend(v21, "addObject:", v24);

          }
          else
          {
            v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v21, "addObject:", v24);
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v20);
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = v17;
  }

  return v21;
}

+ (id)_sortedAndFilteredEventsForPredicate:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a6, "eventsMatchingPredicate:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sortedEvents:withMethod:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(a1, "_shouldFilterEvent:filterOptions:", v17, a4, (_QWORD)v20) & 1) == 0)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_sortedEvents:(id)a3 withMethod:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = v5;
  if (a4 == 1)
  {
    v7 = v5;
    if (v6)
    {
      objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

uint64_t __48__CUIKEventHeuristics__sortedEvents_withMethod___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "compare:", v4);
  return v5;
}

+ (BOOL)_shouldFilterEvent:(id)a3 filterOptions:(unint64_t)a4
{
  unsigned int v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v6, "type") == 4) & (v4 >> 1);

  v8 = objc_msgSend(v5, "isAllDay") & (v4 >> 2);
  v9 = v4 & (objc_msgSend(v5, "status") == 3);
  if (objc_msgSend(v5, "hasAttendees"))
  {
    objc_msgSend(v5, "organizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isCurrentUser") & 1) != 0)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      objc_msgSend(v5, "selfAttendee");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_msgSend(v12, "participantStatus") == 3) & (v4 >> 3);

    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  v13 = v11 | v8 | v9 | v7;
  if ((v4 & 0x10) != 0 && (((v11 | v8 | v9) | v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "CalDateForEndOfToday");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0C2B8], "rangeWithStartDate:endDate:", v14, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v15, "intersectsRange:", v5);
  }

  return v13;
}

@end
