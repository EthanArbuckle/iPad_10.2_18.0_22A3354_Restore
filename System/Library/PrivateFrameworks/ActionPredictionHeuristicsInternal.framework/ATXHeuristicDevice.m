@implementation ATXHeuristicDevice

- (void)setNow:(id)a3
{
  NSDate *v4;
  NSDate *now;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  now = self->_now;
  self->_now = v4;

}

- (ATXHeuristicDevice)initWithLocationManager:(id)a3
{
  id v5;
  ATXHeuristicDevice *v6;
  ATXHeuristicDevice *v7;
  uint64_t v8;
  NSMutableDictionary *cachedCalendarDicts;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicDevice;
  v6 = -[ATXHeuristicDevice init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationManager, a3);
    v8 = objc_opt_new();
    cachedCalendarDicts = v7->_cachedCalendarDicts;
    v7->_cachedCalendarDicts = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)dealloc
{
  ATXHeuristicDevice *v2;
  uint64_t v3;
  void *v4;
  CNFavorites *favoriteContactsLazy;
  objc_super v6;

  v2 = self;
  v3 = objc_sync_enter(v2);
  v4 = (void *)MEMORY[0x1CAA46CBC](v3);
  favoriteContactsLazy = v2->_favoriteContactsLazy;
  v2->_favoriteContactsLazy = 0;

  objc_autoreleasePoolPop(v4);
  objc_sync_exit(v2);

  v6.receiver = v2;
  v6.super_class = (Class)ATXHeuristicDevice;
  -[ATXHeuristicDevice dealloc](&v6, sel_dealloc);
}

- (EKEventStore)eventStore
{
  ATXHeuristicDevice *v2;
  EKEventStore *eventStore;
  uint64_t v4;
  EKEventStore *v5;
  EKEventStore *v6;

  v2 = self;
  objc_sync_enter(v2);
  eventStore = v2->_eventStore;
  if (!eventStore)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 128);
    v5 = v2->_eventStore;
    v2->_eventStore = (EKEventStore *)v4;

    eventStore = v2->_eventStore;
  }
  v6 = eventStore;
  objc_sync_exit(v2);

  return v6;
}

- (id)_calendarVisibilityManager
{
  id v3;
  void *v4;
  void *v5;

  if (_calendarVisibilityManager_onceToken != -1)
    dispatch_once(&_calendarVisibilityManager_onceToken, &__block_literal_global_0);
  v3 = objc_alloc(MEMORY[0x1E0CAA018]);
  -[ATXHeuristicDevice eventStore](self, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:", v4, 0, 0, 0);

  return v5;
}

void __48__ATXHeuristicDevice__calendarVisibilityManager__block_invoke()
{
  const char *v0;
  NSObject *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CAA018], "visibilityChangedNotificationName");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = (const char *)objc_msgSend(v2, "UTF8String");
  dispatch_get_global_queue(25, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch(v0, (int *)&_calendarVisibilityManager_calendarVisibilityToken, v1, &__block_literal_global_15);

}

void __48__ATXHeuristicDevice__calendarVisibilityManager__block_invoke_2()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0CA9F88], 0);

  __atxlog_handle_default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1C99DF000, v1, OS_LOG_TYPE_DEFAULT, "Reposting EKEventStoreChangedNotification because calendar visibility has changed", v2, 2u);
  }

}

- (id)visibleCalendarsRegardlessOfFocus
{
  void *v2;
  void *v3;

  -[ATXHeuristicDevice _calendarVisibilityManager](self, "_calendarVisibilityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCalendars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)visibleCalendarsInCurrentFocus
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CAA018], "unselectedCalendarIdentifiersForFocusMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicDevice visibleCalendarsRegardlessOfFocus](self, "visibleCalendarsRegardlessOfFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ATXHeuristicDevice_visibleCalendarsInCurrentFocus__block_invoke;
  v8[3] = &unk_1E82C4558;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __52__ATXHeuristicDevice_visibleCalendarsInCurrentFocus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "calendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7) ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (MTAlarmManager)sharedAlarmManager
{
  if (sharedAlarmManager_onceToken != -1)
    dispatch_once(&sharedAlarmManager_onceToken, &__block_literal_global_18);
  return (MTAlarmManager *)(id)sharedAlarmManager_alarmManager;
}

void __40__ATXHeuristicDevice_sharedAlarmManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D4FA58]);
  v1 = (void *)sharedAlarmManager_alarmManager;
  sharedAlarmManager_alarmManager = (uint64_t)v0;

}

- (id)meContact
{
  void *v3;
  void *v4;
  CNContact *v5;
  id v6;
  CNContact *meContactLazy;
  NSObject *v8;
  id v10;

  if (!self->_meContactChecked)
  {
    self->_meContactChecked = 1;
    -[ATXHeuristicDevice contactStore](self, "contactStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHeuristicDevice _contactKeysToFetch](self, "_contactKeysToFetch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v3, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v4, &v10);
    v5 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    meContactLazy = self->_meContactLazy;
    self->_meContactLazy = v5;

    if (v6)
    {
      __atxlog_handle_heuristic();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicDevice meContact].cold.1((uint64_t)v6, v8);

    }
  }
  return self->_meContactLazy;
}

- (void)updateMeContact
{
  id v2;

  self->_meContactChecked = 0;
  v2 = -[ATXHeuristicDevice meContact](self, "meContact");
}

- (id)contactStore
{
  ATXHeuristicDevice *v2;
  CNContactStore *contactStoreLazy;
  uint64_t v4;
  CNContactStore *v5;
  CNContactStore *v6;

  v2 = self;
  objc_sync_enter(v2);
  contactStoreLazy = v2->_contactStoreLazy;
  if (!contactStoreLazy)
  {
    v4 = objc_opt_new();
    v5 = v2->_contactStoreLazy;
    v2->_contactStoreLazy = (CNContactStore *)v4;

    contactStoreLazy = v2->_contactStoreLazy;
  }
  v6 = contactStoreLazy;
  objc_sync_exit(v2);

  return v6;
}

- (void)accessFavoriteContacts:(id)a3
{
  ATXHeuristicDevice *v4;
  void (**v5)(id, CNFavorites *);
  CNFavorites *favoriteContactsLazy;
  id v7;
  void *v8;
  uint64_t v9;
  CNFavorites *v10;
  void (**v11)(id, CNFavorites *);

  v11 = (void (**)(id, CNFavorites *))a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v11;
  favoriteContactsLazy = v4->_favoriteContactsLazy;
  if (!favoriteContactsLazy)
  {
    v7 = objc_alloc(MEMORY[0x1E0C972F8]);
    -[ATXHeuristicDevice contactStore](v4, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithContactStore:", v8);
    v10 = v4->_favoriteContactsLazy;
    v4->_favoriteContactsLazy = (CNFavorites *)v9;

    favoriteContactsLazy = v4->_favoriteContactsLazy;
    v5 = v11;
  }
  v5[2](v5, favoriteContactsLazy);
  objc_sync_exit(v4);

}

- (NSDate)now
{
  NSDate *now;
  NSDate *v4;
  NSDate *v5;

  now = self->_now;
  if (!now)
  {
    v4 = (NSDate *)objc_opt_new();
    v5 = self->_now;
    self->_now = v4;

    now = self->_now;
  }
  return now;
}

- (id)_contactKeysToFetch
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C967C0];
  v8[1] = v3;
  v8[2] = v4;
  v5 = *MEMORY[0x1E0C966A8];
  v8[3] = *MEMORY[0x1E0C96740];
  v8[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactsForPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  -[ATXHeuristicDevice contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicDevice _contactKeysToFetch](self, "_contactKeysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "unifiedContactsMatchingPredicate:keysToFetch:error:", v4, v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    v9 = v7;
  }
  else
  {
    __atxlog_handle_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicDevice contactsForPredicate:].cold.1();

    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)resolveContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t v17[8];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97218];
  v5 = a3;
  objc_msgSend(v4, "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C96898];
  v18[0] = v6;
  v18[1] = v7;
  v8 = *MEMORY[0x1E0C966A8];
  v18[2] = *MEMORY[0x1E0C967C0];
  v18[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D70968]);
  -[ATXHeuristicDevice contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithContactStore:keysToFetch:", v11, v9);

  objc_msgSend(v12, "contactWithIdentifier:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "contactType"))
  {
    __atxlog_handle_heuristic();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1C99DF000, v14, OS_LOG_TYPE_DEFAULT, "ATXOngoingCall: Contact found is not a CNContactTypePerson", v17, 2u);
    }

    v15 = 0;
  }
  else
  {
    v15 = v13;
  }

  return v15;
}

- (id)organizerContactWithEvent:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "organizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicDevice contactForParticipant:](self, "contactForParticipant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contactForParticipant:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97218];
  v5 = a3;
  objc_msgSend(v4, "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXHeuristicDevice contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  if (v11)
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicDevice contactsForPredicate:].cold.1();
LABEL_10:

    v12 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v10, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "contacts: %@ found with predicate:%@", buf, 0x16u);
  }

  if (-[NSObject contactType](v12, "contactType"))
  {
    __atxlog_handle_context_heuristic();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v14, OS_LOG_TYPE_DEFAULT, "Contact found is not a CNContactTypePerson", buf, 2u);
    }

    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (id)_contactForPredicate:(id)a3
{
  void *v3;
  void *v4;

  -[ATXHeuristicDevice contactsForPredicate:](self, "contactsForPredicate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictContactForCNContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("CNContact"));
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("identifier"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicDevice meContact](self, "meContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isEqualToString:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("isMeContact"));

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 1000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("displayName"));

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("fullName"));

  objc_msgSend(v4, "givenName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("givenName"));

  objc_msgSend(v4, "familyName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("familyName"));

  objc_msgSend(v4, "emailAddresses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "emailAddresses", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v21);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("emailAddresses"));
  }

  return v5;
}

- (id)_dictContactForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97200];
  v12 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContactsWithIdentifiers:", v7, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXHeuristicDevice _contactForPredicate:](self, "_contactForPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ATXHeuristicDevice dictContactForCNContact:](self, "dictContactForCNContact:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_dictContactForParticipant:(id)a3 contactCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  unint64_t v20;
  __CFString *v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    __atxlog_handle_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXHeuristicDevice _dictContactForParticipant:contactCache:].cold.1(v10, (uint64_t)v8, v11);
  }
  else
  {
    objc_msgSend(v6, "contactPredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHeuristicDevice _contactForPredicate:](self, "_contactForPredicate:", v12);
    v11 = objc_claimAutoreleasedReturnValue();

    -[ATXHeuristicDevice dictContactForCNContact:](self, "dictContactForCNContact:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v6, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("displayName"));

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {

      v27 = 0;
      goto LABEL_21;
    }
    v17 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v7, "setObject:forKey:", v17, v8);

  }
  v18 = objc_msgSend(v6, "participantRole");
  if (v18 > 4)
    v19 = 0;
  else
    v19 = off_1E82C45C0[v18];
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("role"));
  v20 = objc_msgSend(v6, "participantType");
  if (v20 > 4)
    v21 = 0;
  else
    v21 = off_1E82C45E8[v20];
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("type"));
  v22 = objc_msgSend(v6, "participantStatus");
  if (v22 > 7)
    v23 = 0;
  else
    v23 = off_1E82C4610[v22];
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("status"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isCurrentUser"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("isCurrentUser"));

  -[ATXHeuristicDevice wrap:](self, "wrap:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("EKParticipant"));

  if (objc_msgSend(v10, "count"))
    v26 = v10;
  else
    v26 = 0;
  v27 = v26;
LABEL_21:

  return v27;
}

- (id)_dictForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("URL"));

  objc_msgSend(v4, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("fileName"));

  objc_msgSend(v4, "fileSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("fileSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBinary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("isBinary"));

  objc_msgSend(v4, "fileFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("fileFormat"));

  -[ATXHeuristicDevice wrap:](self, "wrap:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("EKAttachment"));
  return v5;
}

- (id)dictForEvent:(id)a3
{
  return -[ATXHeuristicDevice dictForEvent:contactCache:](self, "dictForEvent:contactCache:", a3, 0);
}

- (id)dictForEvent:(id)a3 contactCache:(id)a4
{
  id v6;
  id v7;
  ATXHeuristicDevice *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend(v6, "uniqueId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_cachedCalendarDicts, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      __atxlog_handle_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ATXHeuristicDevice dictForEvent:contactCache:].cold.3();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = 0;
      else
        v13 = v11;
    }
    else
    {
      __atxlog_handle_heuristic();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ATXHeuristicDevice dictForEvent:contactCache:].cold.2();

      -[ATXHeuristicDevice _dictForEvent:contactCache:](v8, "_dictForEvent:contactCache:", v6, v7);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_cachedCalendarDicts, "setObject:forKeyedSubscript:", v13, v10);
        v16 = v13;
      }
      else
      {
        v17 = (void *)objc_opt_new();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_cachedCalendarDicts, "setObject:forKeyedSubscript:", v17, v10);

      }
    }

  }
  else
  {
    __atxlog_handle_heuristic();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXHeuristicDevice dictForEvent:contactCache:].cold.1(v14);

    -[ATXHeuristicDevice _dictForEvent:contactCache:](v8, "_dictForEvent:contactCache:", v6, v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v8);
  return v13;
}

- (id)_dictForEvent:(id)a3 contactCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
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
  uint64_t v68;
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
  NSObject *v98;
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
  id v109;
  id v110;
  void *v111;
  NSObject *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[5];
  id v122;
  id v123;
  _BYTE v124[128];
  uint8_t v125[128];
  uint8_t buf[4];
  uint64_t v127;
  __int16 v128;
  void *v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA46CBC]();
  if (objc_msgSend(v6, "junkStatus") == 1 || objc_msgSend(v6, "junkStatus") == 3)
  {
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "junkStatus");
      objc_msgSend(v6, "eventIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v127 = v10;
      v128 = 2112;
      v129 = v11;
      _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_DEFAULT, "Ignore event: junkStatus [%lu], id %@", buf, 0x16u);

    }
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "status") == 3)
  {
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "eventIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v127 = (uint64_t)v14;
      _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_DEFAULT, "Ignore event: Cancelled, id %@", buf, 0xCu);

    }
    goto LABEL_5;
  }
  v108 = v8;
  v112 = objc_opt_new();
  objc_msgSend(v6, "organizer");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v121[0] = MEMORY[0x1E0C809B0];
  v121[1] = 3221225472;
  v121[2] = __49__ATXHeuristicDevice__dictForEvent_contactCache___block_invoke;
  v121[3] = &unk_1E82C45A0;
  v121[4] = self;
  v109 = v7;
  v122 = v7;
  v110 = v16;
  v123 = v110;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1CAA46E3C](v121);
  v107 = (void *)v15;
  v17[2](v17, v15);
  objc_msgSend(v6, "attendees");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v6;
  objc_msgSend(v6, "attendees");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 >= 5)
    v21 = 5;
  else
    v21 = v20;
  objc_msgSend(v18, "subarrayWithRange:", 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v118 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
        v29 = (void *)MEMORY[0x1CAA46CBC]();
        v17[2](v17, v28);
        objc_autoreleasePoolPop(v29);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
    }
    while (v25);
  }

  v6 = v111;
  objc_msgSend(v111, "selfAttendee");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30
    && (objc_msgSend(v111, "selfAttendee"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v32 = objc_msgSend(v31, "participantStatus"),
        v31,
        v32 != 2))
  {
    __atxlog_handle_heuristic();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v111, "selfAttendee");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "participantStatus");
      objc_msgSend(v111, "eventIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v127 = v68;
      v128 = 2112;
      v129 = v69;
      _os_log_impl(&dword_1C99DF000, v33, OS_LOG_TYPE_DEFAULT, "Ignore event: Not accepted [%lu], id %@", buf, 0x16u);

    }
    v12 = 0;
  }
  else
  {
    v33 = objc_opt_new();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    objc_msgSend(v111, "attachments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v114;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v114 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j);
          v40 = (void *)MEMORY[0x1CAA46CBC]();
          -[ATXHeuristicDevice _dictForAttachment:](self, "_dictForAttachment:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v33, "addObject:", v41);

          objc_autoreleasePoolPop(v40);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
      }
      while (v36);
    }

    v6 = v111;
    objc_msgSend(v111, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v42, CFSTR("eventTitle"));

    objc_msgSend(v111, "creationDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = (void *)MEMORY[0x1E0CB37E8];
      v45 = v112;
      objc_msgSend(v43, "timeIntervalSinceReferenceDate");
      objc_msgSend(v44, "numberWithDouble:");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v46, CFSTR("creationDateTimestamp"));

    }
    objc_msgSend(v111, "lastModifiedDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v48 = (void *)MEMORY[0x1E0CB37E8];
      v49 = v112;
      objc_msgSend(v47, "timeIntervalSinceReferenceDate");
      objc_msgSend(v48, "numberWithDouble:");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v50, CFSTR("modifiedDateTimestamp"));

    }
    objc_msgSend(v111, "startDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      v52 = (void *)MEMORY[0x1E0CB37E8];
      v53 = v112;
      objc_msgSend(v51, "timeIntervalSinceReferenceDate");
      objc_msgSend(v52, "numberWithDouble:");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v54, CFSTR("startDateTimestamp"));

    }
    objc_msgSend(v111, "endDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      v56 = (void *)MEMORY[0x1E0CB37E8];
      v57 = v112;
      objc_msgSend(v55, "timeIntervalSinceReferenceDate");
      objc_msgSend(v56, "numberWithDouble:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v57, "setObject:forKeyedSubscript:", v58, CFSTR("endDateTimestamp"));

    }
    objc_msgSend(v111, "startTimeZone");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "name");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v60, CFSTR("startTimeZoneName"));

    objc_msgSend(v111, "endTimeZone");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "name");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v62, CFSTR("endTimeZoneName"));

    v63 = (void *)MEMORY[0x1CAA46CBC]();
    objc_msgSend(v111, "virtualConference");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "joinMethods");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "firstObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "URL");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "absoluteString");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v66, CFSTR("conferenceURL"));
    }
    else
    {
      objc_msgSend(v111, "conferenceURLForDisplay");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "absoluteString");
      v104 = v63;
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v70, CFSTR("conferenceURL"));

      v63 = v104;
    }

    objc_autoreleasePoolPop(v63);
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v110, CFSTR("contacts"));
    objc_msgSend(v111, "externalURL");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "absoluteString");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v72, CFSTR("externalURL"));

    v73 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v111, "travelTime");
    objc_msgSend(v73, "numberWithDouble:");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v74, CFSTR("travelTime"));

    objc_msgSend(v111, "notes");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v75, CFSTR("notes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v111, "isAllDay"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v76, CFSTR("isAllDay"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v111, "hasRecurrenceRules"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v77, CFSTR("hasRecurrenceRules"));

    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v33, CFSTR("attachments"));
    -[ATXHeuristicDevice wrap:](self, "wrap:", v111);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v78, CFSTR("EKEvent"));

    objc_msgSend(v111, "eventIdentifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v79, CFSTR("eventIdentifier"));

    objc_msgSend(v111, "uniqueID");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v80, CFSTR("uniqueID"));

    objc_msgSend(v111, "preferredLocationWithoutPrediction");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      v82 = (void *)objc_opt_new();
      objc_msgSend(v81, "title");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (v83)
      {
        objc_msgSend(v81, "title");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setObject:forKeyedSubscript:", v84, CFSTR("title"));

      }
      objc_msgSend(v81, "address");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (v85)
      {
        objc_msgSend(v81, "address");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setObject:forKeyedSubscript:", v86, CFSTR("address"));

      }
      if (objc_msgSend(v82, "count"))
        -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v82, CFSTR("structuredLocation"));

    }
    objc_msgSend(v111, "suggestionInfo");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      objc_msgSend(v111, "suggestionInfo");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "uniqueKey");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v89, CFSTR("suggestionsInfoUniqueKey"));

      objc_msgSend(v111, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (v90)
        -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v90, CFSTR("sgEventMetadata"));

    }
    v91 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v111, "calendar");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "numberWithBool:", objc_msgSend(v92, "isNaturalLanguageSuggestedEventCalendar"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v93, CFSTR("nlEventCalendar"));

    objc_msgSend(v111, "calendar");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "calendarIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v95, CFSTR("calendarID"));

    objc_msgSend(v111, "localCustomObjectForKey:", CFSTR("EKEventNaturalLanguageSuggestedEventExpirationDate"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      v97 = (void *)MEMORY[0x1E0CB37E8];
      v98 = v112;
      objc_msgSend(v96, "timeIntervalSinceReferenceDate");
      objc_msgSend(v97, "numberWithDouble:");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v99, CFSTR("nlEventExpirationTime"));

    }
    objc_msgSend(v111, "birthdayContactIdentifier");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      objc_msgSend(v111, "birthdayContactIdentifier");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHeuristicDevice _dictContactForIdentifier:](self, "_dictContactForIdentifier:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v112, "setObject:forKeyedSubscript:", v102, CFSTR("birthdayContact"));

    }
    v12 = v112;

  }
  v8 = v108;

  v9 = v112;
  v7 = v109;
LABEL_6:

  objc_autoreleasePoolPop(v8);
  return v12;
}

void __49__ATXHeuristicDevice__dictForEvent_contactCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "isCurrentUser");
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_dictContactForParticipant:contactCache:", v7, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

      v4 = v7;
    }
  }

}

- (id)_wrap:(id)a3
{
  id v4;
  void *v5;
  ATXHeuristicDevice *v6;
  NSMutableDictionary *wrappedObjects;
  uint64_t v8;
  NSMutableDictionary *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  wrappedObjects = v6->_wrappedObjects;
  if (!wrappedObjects)
  {
    v8 = objc_opt_new();
    v9 = v6->_wrappedObjects;
    v6->_wrappedObjects = (NSMutableDictionary *)v8;

    wrappedObjects = v6->_wrappedObjects;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](wrappedObjects, "setObject:forKeyedSubscript:", v4, v5);
  objc_sync_exit(v6);

  return v5;
}

- (id)_unwrap:(id)a3
{
  id v4;
  ATXHeuristicDevice *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_wrappedObjects, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)wrap:(id)a3
{
  id v4;
  ATXHeuristicObjectHandle *v5;

  v4 = a3;
  v5 = -[ATXHeuristicObjectHandle initWithDevice:wrapping:]([ATXHeuristicObjectHandle alloc], "initWithDevice:wrapping:", self, v4);

  return v5;
}

- (ATXLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_cachedCalendarDicts, 0);
  objc_storeStrong((id *)&self->_wrappedObjects, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_favoriteContactsLazy, 0);
  objc_storeStrong((id *)&self->_meContactLazy, 0);
  objc_storeStrong((id *)&self->_contactStoreLazy, 0);
}

- (void)meContact
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Error when fetching me contact: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)contactsForPredicate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1C99DF000, v0, v1, "Error when fetching contact for predicate %@: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_dictContactForParticipant:(NSObject *)a3 contactCache:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1C99DF000, a3, v6, "Re-using cached contact dictionary: %@ for id: %@", (uint8_t *)&v7);

}

- (void)dictForEvent:(os_log_t)log contactCache:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C99DF000, log, OS_LOG_TYPE_FAULT, "Found ekEvent with nil uniqueId, not using cache", v1, 2u);
}

- (void)dictForEvent:contactCache:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1C99DF000, v0, v1, "%s: Cache miss for ekEvent.uniqueId: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

- (void)dictForEvent:contactCache:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1C99DF000, v0, v1, "%s: Cache hit for ekEvent.uniqueId: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

@end
