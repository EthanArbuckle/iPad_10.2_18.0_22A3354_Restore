@implementation CLSSocialServiceCalendar

- (CLSSocialServiceCalendar)init
{
  CLSSocialServiceCalendar *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  uint64_t v5;
  NSMutableSet *prefetchedDateIntervals;
  CLSCalendarEventsCache *v7;
  CLSCalendarEventsCache *calendarEventsCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSSocialServiceCalendar;
  v2 = -[CLSSocialServiceCalendar init](&v10, sel_init);
  if (v2)
  {
    if (+[CLSSocialServiceContacts canAccessContactsStore](CLSSocialServiceContacts, "canAccessContactsStore"))
    {
      v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
      contactStore = v2->_contactStore;
      v2->_contactStore = v3;

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    prefetchedDateIntervals = v2->_prefetchedDateIntervals;
    v2->_prefetchedDateIntervals = (NSMutableSet *)v5;

    v7 = objc_alloc_init(CLSCalendarEventsCache);
    calendarEventsCache = v2->_calendarEventsCache;
    v2->_calendarEventsCache = v7;

  }
  return v2;
}

- (id)meContact
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CNContact *v9;
  CNContact *meContact;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  contactStore = self->_contactStore;
  if (contactStore)
  {
    v4 = contactStore;
    objc_sync_enter(v4);
    if (!self->_meContact)
    {
      v5 = self->_contactStore;
      objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x1E0C966A8];
      v12[0] = v6;
      v12[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStore _ios_meContactWithKeysToFetch:error:](v5, "_ios_meContactWithKeysToFetch:error:", v8, 0);
      v9 = (CNContact *)objc_claimAutoreleasedReturnValue();

      meContact = self->_meContact;
      self->_meContact = v9;

    }
    objc_sync_exit(v4);

  }
  return self->_meContact;
}

- (id)_fullNameWithContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "areKeysAvailable:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)eventFromProxyEvent:(id)a3
{
  id v4;
  void *v5;
  CLSEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  CLSEvent *v48;
  void *v49;
  void *v50;
  CLSEvent *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  CLSEvent *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CLSSocialServiceCalendar meContact](self, "meContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(CLSEvent);
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSEvent setTitle:](v6, "setTitle:", v7);

  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSEvent setStartDate:](v6, "setStartDate:", v8);

  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v6;
  -[CLSEvent setEndDate:](v6, "setEndDate:", v9);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v5 != 0) & ~objc_msgSend(v4, "hasAttendees");
  if (v10 == 1)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v5, CFSTR("person"), 0);
    objc_msgSend(v5, "emailAddresses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("email"));

    }
    if (v13)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("name"));
    objc_msgSend(v54, "addObject:", v11);

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v53 = v4;
  objc_msgSend(v4, "attendees");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v62 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (objc_msgSend(v20, "participantStatus") == 2)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "emailAddress");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v20, "emailAddress");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("email"));

          }
          objc_msgSend(v20, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v20, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("name"));

          }
          if (objc_msgSend(v20, "isCurrentUser") && v5)
          {
            if ((v10 & 1) != 0)
            {
              LOBYTE(v10) = 1;
LABEL_24:

              continue;
            }
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v5, CFSTR("person"));
            LOBYTE(v10) = 1;
          }
          objc_msgSend(v21, "allKeys");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (v27)
            objc_msgSend(v54, "addObject:", v21);
          goto LABEL_24;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v17);
  }

  v28 = v53;
  objc_msgSend(v53, "calendar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hasSharees");

  if (!v30)
    goto LABEL_47;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v53, "calendar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "shareesAndOwner");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (!v33)
    goto LABEL_46;
  v34 = v33;
  v35 = *(_QWORD *)v58;
  do
  {
    for (j = 0; j != v34; ++j)
    {
      if (*(_QWORD *)v58 != v35)
        objc_enumerationMutation(v32);
      v37 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "emailAddress");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v37, "emailAddress");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("email"));

      }
      objc_msgSend(v37, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend(v37, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v42, CFSTR("name"));

      }
      if ((objc_msgSend(v37, "isCurrentUserForScheduling") & 1) != 0
        || objc_msgSend(v37, "isCurrentUserForSharing"))
      {
        if (v10 & 1 | (v5 == 0))
          goto LABEL_44;
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v5, CFSTR("person"));
        LOBYTE(v10) = 1;
      }
      else
      {
        objc_msgSend(v37, "name");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v43, CFSTR("person"));

      }
      objc_msgSend(v38, "allKeys");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");

      if (v45)
        objc_msgSend(v54, "addObject:", v38);
LABEL_44:

    }
    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  }
  while (v34);
LABEL_46:

  v28 = v53;
LABEL_47:
  -[CLSEvent setAttendees:](v52, "setAttendees:", v54);
  objc_msgSend(v28, "geoLocation");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    -[CLSEvent setLocation:](v52, "setLocation:", v46);
  objc_msgSend(v28, "attendees");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __48__CLSSocialServiceCalendar_eventFromProxyEvent___block_invoke;
  v55[3] = &unk_1E84F7120;
  v48 = v52;
  v56 = v48;
  objc_msgSend(v47, "enumerateObjectsUsingBlock:", v55);

  -[CLSEvent setOrganizedByMe:](v48, "setOrganizedByMe:", objc_msgSend(v28, "organizedByMe"));
  objc_msgSend(v28, "selfAttendee");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend(v28, "selfAttendee");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSEvent setAccepted:](v48, "setAccepted:", objc_msgSend(v50, "participantStatus") == 2);

  }
  else
  {
    -[CLSEvent setAccepted:](v48, "setAccepted:", objc_msgSend(v28, "hasAttendees") ^ 1);
  }

  return v48;
}

- (id)eventsForDates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  CLSSocialServiceCalendar *v15;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__CLSSocialServiceCalendar_eventsForDates___block_invoke;
    v13[3] = &unk_1E84F7148;
    v10 = v6;
    v14 = v10;
    v15 = self;
    -[CLSSocialServiceCalendar _enumerateEventsFromDate:toDate:fetchIfNeeded:usingBlock:](self, "_enumerateEventsFromDate:toDate:fetchIfNeeded:usingBlock:", v8, v9, 1, v13);

    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)invalidateMemoryCaches
{
  NSMutableSet *v3;
  NSMutableSet *prefetchedDateIntervals;
  CLSCalendarEventsCache *v5;
  CLSCalendarEventsCache *calendarEventsCache;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  prefetchedDateIntervals = self->_prefetchedDateIntervals;
  self->_prefetchedDateIntervals = v3;

  v5 = objc_alloc_init(CLSCalendarEventsCache);
  calendarEventsCache = self->_calendarEventsCache;
  self->_calendarEventsCache = v5;

}

- (BOOL)_sortedAssetCollections:(id)a3 containsEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__CLSSocialServiceCalendar__sortedAssetCollections_containsEvent___block_invoke;
  v13[3] = &unk_1E84F71E8;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  v11 = objc_msgSend(v6, "indexOfObjectWithOptions:passingTest:", 1, v13);

  return v11 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_hasAlreadyPrefetchedEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_prefetchedDateIntervals;
  objc_sync_enter(v8);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_prefetchedDateIntervals;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsDate:", v6, (_QWORD)v15)
          && (objc_msgSend(v13, "containsDate:", v7) & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_12;
        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

  objc_sync_exit(v8);
  return v10;
}

- (void)prefetchEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 forAssetCollectionsSortedByStartDate:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSMutableSet *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *context;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  BOOL v27;
  _QWORD v28[4];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  context = (void *)MEMORY[0x1D1796094]();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v11);
  v15 = self->_prefetchedDateIntervals;
  objc_sync_enter(v15);
  -[NSMutableSet addObject:](self->_prefetchedDateIntervals, "addObject:", v14);
  objc_sync_exit(v15);

  v16 = objc_alloc_init(MEMORY[0x1E0CAA078]);
  objc_msgSend((id)objc_opt_class(), "relevantCalendars:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateForNonrecurringEventsWithStartDate:endDate:calendars:", v10, v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v32 = MEMORY[0x1D1796094]();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __124__CLSSocialServiceCalendar_prefetchEventsFromUniversalDate_toUniversalDate_forAssetCollectionsSortedByStartDate_usingBlock___block_invoke;
  v22[3] = &unk_1E84F7210;
  v27 = v12 != 0;
  v22[4] = self;
  v19 = v12;
  v23 = v19;
  v20 = v13;
  v24 = v20;
  v25 = v28;
  v26 = &v29;
  objc_msgSend(v16, "enumerateEventsMatchingPredicate:usingBlock:", v18, v22);
  objc_autoreleasePoolPop((void *)v30[3]);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);

  objc_autoreleasePoolPop(context);
}

- (void)enumerateEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 usingBlock:(id)a5
{
  -[CLSSocialServiceCalendar _enumerateEventsFromDate:toDate:fetchIfNeeded:usingBlock:](self, "_enumerateEventsFromDate:toDate:fetchIfNeeded:usingBlock:", a3, a4, 1, a5);
}

- (void)_enumerateEventsFromDate:(id)a3 toDate:(id)a4 fetchIfNeeded:(BOOL)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  CLSCalendarEventsCache *calendarEventsCache;
  id *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v11)
  {
    if (-[CLSSocialServiceCalendar _hasAlreadyPrefetchedEventsFromUniversalDate:toUniversalDate:](self, "_hasAlreadyPrefetchedEventsFromUniversalDate:toUniversalDate:", v9, v10))
    {
      calendarEventsCache = self->_calendarEventsCache;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke;
      v16[3] = &unk_1E84F7238;
      v13 = &v17;
      v17 = v11;
      -[CLSCalendarEventsCache enumerateEventsFromStartDate:toEndDate:usingBlock:](calendarEventsCache, "enumerateEventsFromStartDate:toEndDate:usingBlock:", v9, v10, v16);
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke_2;
      v14[3] = &unk_1E84F7260;
      v13 = &v15;
      v15 = v11;
      -[CLSSocialServiceCalendar prefetchEventsFromUniversalDate:toUniversalDate:forAssetCollectionsSortedByStartDate:usingBlock:](self, "prefetchEventsFromUniversalDate:toUniversalDate:forAssetCollectionsSortedByStartDate:usingBlock:", v9, v10, 0, v14);
    }

  }
}

- (id)eventsForClueCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "universalStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalEndDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__CLSSocialServiceCalendar_eventsForClueCollection___block_invoke;
    v13[3] = &unk_1E84F7288;
    v13[4] = self;
    v14 = v4;
    v10 = v9;
    v15 = v10;
    -[CLSSocialServiceCalendar _enumerateEventsFromDate:toDate:fetchIfNeeded:usingBlock:](self, "_enumerateEventsFromDate:toDate:fetchIfNeeded:usingBlock:", v5, v7, 1, v13);
    v11 = v15;
    v8 = v10;

  }
  return v8;
}

- (id)workCalendarEventsMatchingContactIdentifiers:(id)a3 fromUniversalDate:(id)a4 toUniversalDate:(id)a5 contactsService:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  id v26;

  v10 = a4;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x1E0CAA078];
  v13 = a6;
  v14 = a3;
  v15 = objc_alloc_init(v12);
  objc_msgSend(v13, "contactsForIdentifiers:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "relevantCalendars:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateForEventsWithStartDate:endDate:calendars:matchingContacts:", v10, v11, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __123__CLSSocialServiceCalendar_workCalendarEventsMatchingContactIdentifiers_fromUniversalDate_toUniversalDate_contactsService___block_invoke;
    v25[3] = &unk_1E84F72B0;
    v25[4] = self;
    v21 = v18;
    v26 = v21;
    objc_msgSend(v15, "enumerateEventsMatchingPredicate:usingBlock:", v20, v25);
    v22 = v26;
    v23 = v21;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)personsFromEventParticipants:(id)a3 excludeCurrentUser:(BOOL)a4 serviceManager:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        if (!v6 || (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "isCurrentUser") & 1) == 0)
        {
          v21 = 0;
          v22 = &v21;
          v23 = 0x3032000000;
          v24 = __Block_byref_object_copy__126;
          v25 = __Block_byref_object_dispose__127;
          objc_msgSend(v13, "emailAddress", v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "personForPersonHandle:", v14);
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (!v22[5])
          {
            objc_msgSend(v13, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (!v16)
            {
              objc_msgSend(v13, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v20[0] = MEMORY[0x1E0C809B0];
              v20[1] = 3221225472;
              v20[2] = __91__CLSSocialServiceCalendar_personsFromEventParticipants_excludeCurrentUser_serviceManager___block_invoke;
              v20[3] = &unk_1E84F8CB8;
              v20[4] = &v21;
              objc_msgSend(v8, "enumeratePersonsForFullname:usingBlock:", v17, v20);

            }
          }
          if (v22[5])
            objc_msgSend(v19, "addObject:");
          _Block_object_dispose(&v21, 8);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedDateIntervals, 0);
  objc_storeStrong((id *)&self->_calendarEventsCache, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __91__CLSSocialServiceCalendar_personsFromEventParticipants_excludeCurrentUser_serviceManager___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __123__CLSSocialServiceCalendar_workCalendarEventsMatchingContactIdentifiers_fromUniversalDate_toUniversalDate_contactsService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  CLSEKEvent *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1D1796094]();
  v4 = -[CLSEKEvent initWithEKEvent:]([CLSEKEvent alloc], "initWithEKEvent:", v5);
  if (objc_msgSend((id)objc_opt_class(), "_isEventInMeetingRoom:", v4))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  objc_autoreleasePoolPop(v3);
}

void __52__CLSSocialServiceCalendar_eventsForClueCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4
    && objc_msgSend((id)objc_opt_class(), "shouldKeepEvent:withClueCollection:", v4, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventFromProxyEvent:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

  }
}

void __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D1796094]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v6);

}

void __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1D1796094]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

void __124__CLSSocialServiceCalendar_prefetchEventsFromUniversalDate_toUniversalDate_forAssetCollectionsSortedByStartDate_usingBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  CLSEKEvent *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (!*(_BYTE *)(a1 + 72)
    || objc_msgSend(*(id *)(a1 + 32), "_sortedAssetCollections:containsEvent:", *(_QWORD *)(a1 + 40), v9))
  {
    v5 = -[CLSEKEvent initWithEKEvent:]([CLSEKEvent alloc], "initWithEKEvent:", v9);
    if (v5 && objc_msgSend((id)objc_opt_class(), "shouldKeepEvent:withClueCollection:", v5, 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "insertEvent:", v5);
      goto LABEL_8;
    }

  }
  v5 = 0;
LABEL_8:
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, CLSEKEvent *, _BYTE *))(v6 + 16))(v6, v5, a3);
  if (!*a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(_QWORD *)(v7 + 24) + 1;
    *(_QWORD *)(v7 + 24) = v8;
    if (__ROR8__(0x8F5C28F5C28F5C29 * v8, 2) <= 0x28F5C28F5C28F5CuLL)
    {
      objc_autoreleasePoolPop(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = MEMORY[0x1D1796094]();
    }
  }

}

BOOL __66__CLSSocialServiceCalendar__sortedAssetCollections_containsEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;

  v6 = a2;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v9;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v17 = v16;
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v19 = v18;

  v20 = v15 >= v17 && v13 <= v19;
  if (v20)
    *a4 = 1;
  return v20;
}

void __43__CLSSocialServiceCalendar_eventsForDates___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "eventFromProxyEvent:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

uint64_t __48__CLSSocialServiceCalendar_eventFromProxyEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "participantType");
  if (result == 2)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "setMeetingRoom:", 1);
    *a4 = 1;
  }
  return result;
}

+ (BOOL)_isCalendarRelevant:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isFacebookBirthdayCalendar") & 1) == 0
    && (objc_msgSend(v3, "isSubscribed") & 1) == 0
    && (objc_msgSend(v3, "isSubscribedHolidayCalendar") & 1) == 0
    && objc_msgSend(v3, "type") != 4;

  return v4;
}

+ (id)relevantCalendars:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "calendarsForEntityType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(a1, "_isCalendarRelevant:", v11, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)_isEventInMeetingRoom:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(v3, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CLSSocialServiceCalendar__isEventInMeetingRoom___block_invoke;
  v6[3] = &unk_1E84F7170;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

+ (BOOL)shouldKeepEvent:(id)a3 withClueCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  BOOL v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "selfAttendee");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "selfAttendee");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "participantStatus") == 2)
      v10 = 0;
    else
      v10 = objc_msgSend(v6, "organizedByMe") ^ 1;

  }
  else
  {
    v10 = 0;
  }

  v11 = objc_msgSend(a1, "_isEventInMeetingRoom:", v6) | v10;
  v12 = v11 ^ 1;
  if (v7 && (v11 & 1) == 0)
  {
    objc_msgSend(v6, "attendees");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_opt_class();
    objc_msgSend(v6, "geoLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "eventAtLocation:withAttendeeNames:matchesClueCollection:", v16, v14, v7);

  }
  v17 = objc_msgSend(v6, "isSuggestedAndAccepted");
  v18 = objc_msgSend(v6, "isBirthday");
  objc_msgSend(v6, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v21 = v20;
  objc_msgSend(v6, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  v24 = v23;

  if ((objc_msgSend(v6, "hasRecurrenceRules") & 1) != 0 || objc_msgSend(v6, "isAllDay", v21 - v24))
    v25 = 0;
  else
    v25 = (v21 - v24 <= 21600.0) & ~v18 & (v17 | v12);

  return v25;
}

+ (BOOL)eventAtLocation:(id)a3 withAttendeeNames:(id)a4 matchesClueCollection:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23;
  BOOL v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke;
  v31[3] = &unk_1E84F71C0;
  v10 = v8;
  v32 = v10;
  v33 = &v34;
  objc_msgSend(v9, "enumeratePeopleClues:", v31);
  if (!v7)
  {
    v23 = 0;
LABEL_14:
    if (*((_BYTE *)v35 + 24))
      v24 = 1;
    else
      v24 = v23;
    goto LABEL_17;
  }
  objc_msgSend(v9, "locations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v11, "count");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "coordinate");
        v18 = v17;
        v20 = v19;
        objc_msgSend(v16, "coordinate");
        if (+[CLSNewLocationInformant location:isCloseToLocation:](CLSNewLocationInformant, "location:isCloseToLocation:", v18, v20, v21, v22))
        {

          v23 = 1;
          goto LABEL_14;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      if (v13)
        continue;
      break;
    }
  }

  v23 = 0;
  v24 = 0;
  if (!v26)
    goto LABEL_14;
LABEL_17:

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  objc_msgSend(a2, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = v6;
    objc_msgSend(v6, "fullName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v7)
    {
      v8 = objc_msgSend(v12, "isMe");

      v6 = v12;
      if ((v8 & 1) == 0)
      {
        v9 = *(void **)(a1 + 32);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke_2;
        v13[3] = &unk_1E84F7198;
        v10 = v12;
        v11 = *(_QWORD *)(a1 + 40);
        v14 = v10;
        v15 = v11;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

        v6 = v12;
      }
    }
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "fullName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "rangeOfString:options:", v6, 129);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

uint64_t __50__CLSSocialServiceCalendar__isEventInMeetingRoom___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "participantType");
  if (result == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
