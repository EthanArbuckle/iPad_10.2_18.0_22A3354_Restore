@implementation EKCalendarVisibilityManager

uint64_t __75__EKCalendarVisibilityManager__calendarsThatAreVisible_filteredByIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "limitedToSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "externalID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "limitedToSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "externalID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToString:", v12);

    }
    else
    {
      v13 = objc_msgSend(v8, "isDelegate") ^ 1;
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (EKSource)limitedToSource
{
  return self->_limitedToSource;
}

+ (NSArray)unselectedCalendarIdentifiersForFocusMode
{
  void *v2;
  void *v3;

  +[EKPreferences shared](EKPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unselectedCalendarIdentifiersForFocusMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_calendarsThatAreVisible:(BOOL)a3 filteredByIdentity:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  BOOL v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v5 = a3;
  v55 = *MEMORY[0x1E0C80C00];
  -[EKCalendarVisibilityManager eventStore](self, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarsForEntityType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __75__EKCalendarVisibilityManager__calendarsThatAreVisible_filteredByIdentity___block_invoke;
  v38[3] = &unk_1E4788090;
  v39 = a4;
  v38[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKCalendarVisibilityManager _deselectedCalendarIdentifiers](self, "_deselectedCalendarIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v28);
  v29 = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (!v13)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v15 = 0;
    goto LABEL_26;
  }
  v14 = v13;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v35;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v35 != v16)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
      objc_msgSend(v18, "calendarIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if (objc_msgSend(v11, "containsObject:", v19))
        {
          if (v5)
            goto LABEL_18;
        }
        else if (!v5)
        {
          goto LABEL_18;
        }
        objc_msgSend(v33, "addObject:", v18);
        if (objc_msgSend(v18, "isHolidayCalendar"))
        {
          ++v15;
        }
        else if (objc_msgSend(v18, "type") == 5 || objc_msgSend(v18, "isSuggestedEventCalendar"))
        {
          ++v32;
        }
        else if (objc_msgSend(v18, "type") == 4)
        {
          ++v30;
        }
        else
        {
          ++v31;
        }
      }
      else
      {
        v20 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = (uint64_t)v18;
          _os_log_error_impl(&dword_1A2318000, v20, OS_LOG_TYPE_ERROR, "No calendar identifier found.  Will not be able to find all visible calendars.  Calendar: [%@]", buf, 0xCu);
        }
      }
LABEL_18:

      ++v17;
    }
    while (v14 != v17);
    v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    v14 = v21;
  }
  while (v21);
LABEL_26:

  v22 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    v24 = objc_msgSend(v33, "count");
    if (v5)
      v25 = CFSTR("visibleCalendars");
    else
      v25 = CFSTR("invisibleCalendars");
    v26 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 134219522;
    v41 = v24;
    v42 = 2112;
    v43 = v25;
    v44 = 2048;
    v45 = v26;
    v46 = 2048;
    v47 = v15;
    v48 = 2048;
    v49 = v32;
    v50 = 2048;
    v51 = v30;
    v52 = 2048;
    v53 = v31;
    _os_log_impl(&dword_1A2318000, v23, OS_LOG_TYPE_DEFAULT, "Returning [%lu] %@ of [%lu] calendars: [%ld] holiday [%ld] suggestion [%ld] birthday [%ld] other", buf, 0x48u);

  }
  return v33;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (id)_deselectedCalendarIdentifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "deselectedCalendarIdentifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      *(_DWORD *)buf = 134218242;
      v38 = objc_msgSend(v4, "count");
      v39 = 2112;
      v40 = v4;
      _os_log_impl(&dword_1A2318000, v6, OS_LOG_TYPE_DEFAULT, "Returning [%lu] stored deselectedCalendarIdentifiers: %@", buf, 0x16u);

    }
    v7 = v4;
    v8 = v7;
  }
  else
  {
    +[EKPreferences shared](EKPreferences, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedCalendarIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      *(_DWORD *)buf = 134217984;
      v38 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1A2318000, v12, OS_LOG_TYPE_INFO, "Store contains [%lu] selectedCalendarIdentifiers", buf, 0xCu);

    }
    if (v10)
    {
      v31 = v10;
      -[EKCalendarVisibilityManager eventStore](self, "eventStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "calendarsForEntityType:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v21, "calendarIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_msgSend(v15, "addObject:", v22);
            }
            else
            {
              v23 = EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v38 = (uint64_t)v21;
                _os_log_error_impl(&dword_1A2318000, v23, OS_LOG_TYPE_ERROR, "No calendar identifier found.  Will not be able get all deselected calendar identifiers.  Calendar: [%@]", buf, 0xCu);
              }
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v18);
      }

      v10 = v31;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minusSet:", v24);
      objc_msgSend(v15, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        v28 = objc_msgSend(v25, "count");
        *(_DWORD *)buf = 134218242;
        v38 = v28;
        v39 = 2112;
        v40 = v25;
        _os_log_impl(&dword_1A2318000, v27, OS_LOG_TYPE_DEFAULT, "Returning [%lu] computed deselectedCalendarIdentifiers: %@", buf, 0x16u);

      }
      v7 = v25;

      v8 = v7;
    }
    else
    {
      v29 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2318000, v29, OS_LOG_TYPE_DEFAULT, "Returning [0] deselectedCalendarIdentifiers: deselected and selected are nil", buf, 2u);
      }
      v7 = 0;
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v8;
}

+ (NSArray)deselectedCalendarIdentifiers
{
  void *v2;
  void *v3;

  +[EKPreferences shared](EKPreferences, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectedCalendarIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5 queue:(id)a6
{
  return -[EKCalendarVisibilityManager initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:](self, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:", a3, a4, a5, a6, 1);
}

- (NSArray)invisibleCalendars
{
  return (NSArray *)-[EKCalendarVisibilityManager _calendarsThatAreVisible:filteredByIdentity:](self, "_calendarsThatAreVisible:filteredByIdentity:", 0, 1);
}

- (NSArray)invisibleCalendarsForAllIdentities
{
  return (NSArray *)-[EKCalendarVisibilityManager _calendarsThatAreVisible:filteredByIdentity:](self, "_calendarsThatAreVisible:filteredByIdentity:", 0, 0);
}

+ (NSString)focusModeConfigurationChangedName
{
  return (NSString *)CFSTR("com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode");
}

- (void)dealloc
{
  objc_super v3;

  -[EKCalendarVisibilityManager deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarVisibilityManager;
  -[EKCalendarVisibilityManager dealloc](&v3, sel_dealloc);
}

- (void)deactivate
{
  id v3;

  -[EKCalendarVisibilityManager setActive:](self, "setActive:", 0);
  -[EKCalendarVisibilityManager notificationListener](self, "notificationListener");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivate");

}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (CalDarwinNotificationListener)notificationListener
{
  return self->_notificationListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_storeStrong(&self->_visibilityChangedCallback, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_limitedToSource, 0);
}

void __44__EKCalendarVisibilityManager__defaultQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("EKCalendarVisibilityManagerDefaultQ", v2);
  v1 = (void *)_defaultQueue_queue;
  _defaultQueue_queue = (uint64_t)v0;

}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5 queue:(id)a6 activate:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  EKCalendarVisibilityManager *v17;
  EKCalendarVisibilityManager *v18;
  uint64_t v19;
  id visibilityChangedCallback;
  id v21;
  void *v22;
  uint64_t v23;
  CalDarwinNotificationListener *notificationListener;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v32.receiver = self;
  v32.super_class = (Class)EKCalendarVisibilityManager;
  v17 = -[EKCalendarVisibilityManager init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStore, a3);
    v19 = MEMORY[0x1A85849D4](v15);
    visibilityChangedCallback = v18->_visibilityChangedCallback;
    v18->_visibilityChangedCallback = (id)v19;

    objc_storeStrong((id *)&v18->_limitedToSource, a4);
    if (v16)
    {
      if (!v15)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_defaultQueue");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_9;
    }
    objc_initWeak(&location, v18);
    v21 = objc_alloc(MEMORY[0x1E0D0C2A8]);
    objc_msgSend((id)objc_opt_class(), "visibilityChangedNotificationName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke;
    v29 = &unk_1E4785050;
    objc_copyWeak(&v30, &location);
    v23 = objc_msgSend(v21, "initWithNotificationName:callback:queue:", v22, &v26, v16);
    notificationListener = v18->_notificationListener;
    v18->_notificationListener = (CalDarwinNotificationListener *)v23;

    if (v7)
      -[EKCalendarVisibilityManager activate](v18, "activate", v26, v27, v28, v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
LABEL_9:

  return v18;
}

+ (id)_defaultQueue
{
  if (_defaultQueue_onceToken != -1)
    dispatch_once(&_defaultQueue_onceToken, &__block_literal_global_75);
  return (id)_defaultQueue_queue;
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 visibilityChangedCallback:(id)a4 queue:(id)a5
{
  return -[EKCalendarVisibilityManager initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:](self, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:", a3, 0, a4, a5, 1);
}

void __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void (**v4)(void);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "active"))
  {
    v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke_cold_1((uint64_t)v2, v3);
    objc_msgSend(v2, "visibilityChangedCallback");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)activate
{
  id v3;

  -[EKCalendarVisibilityManager setActive:](self, "setActive:", 1);
  -[EKCalendarVisibilityManager notificationListener](self, "notificationListener");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activate");

}

- (NSArray)visibleCalendars
{
  return (NSArray *)-[EKCalendarVisibilityManager _calendarsThatAreVisible:filteredByIdentity:](self, "_calendarsThatAreVisible:filteredByIdentity:", 1, 1);
}

- (NSArray)visibleCalendarsForAllIdentities
{
  return (NSArray *)-[EKCalendarVisibilityManager _calendarsThatAreVisible:filteredByIdentity:](self, "_calendarsThatAreVisible:filteredByIdentity:", 1, 0);
}

+ (void)setUnselectedCalendarIdentifiersForFocusMode:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[EKPreferences shared](EKPreferences, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnselectedCalendarIdentifiersForFocusMode:", v3);

}

+ (id)unselectedCalendarsForFocusModeInEventStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "unselectedCalendarIdentifiersForFocusMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "calendarsWithIdentifiers:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v12 = 134218242;
      v13 = objc_msgSend(v7, "count");
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "Returning [%lu] unselectedCalendarsForFocusMode: %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_DEFAULT, "Returning [0] unselectedCalendarsForFocusMode: nil", (uint8_t *)&v12, 2u);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)reminderCalendarInEventStore:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "calendarsForEntityType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 6)
        {
          v11 = v10;

          v7 = v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (NSString)visibilityChangedNotificationName
{
  return (NSString *)CFSTR("com.apple.eventkit.preference.notification.deselectedCalendarIdentifiers");
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 visibilityChangedCallback:(id)a4
{
  return -[EKCalendarVisibilityManager initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:](self, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:", a3, 0, a4, 0, 1);
}

- (EKCalendarVisibilityManager)initWithEventStore:(id)a3 limitedToSource:(id)a4 visibilityChangedCallback:(id)a5
{
  return -[EKCalendarVisibilityManager initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:](self, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:activate:", a3, a4, a5, 0, 1);
}

- (id)visibilityChangedCallback
{
  return self->_visibilityChangedCallback;
}

- (BOOL)active
{
  return self->_active;
}

void __107__EKCalendarVisibilityManager_initWithEventStore_limitedToSource_visibilityChangedCallback_queue_activate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A2318000, a2, OS_LOG_TYPE_DEBUG, "Underlying calendar visibility preferences changed.  Notifying client of [%@]", (uint8_t *)&v2, 0xCu);
}

@end
