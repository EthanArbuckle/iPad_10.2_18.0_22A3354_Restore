@implementation EKCalendarFilter

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 showingCalendarsWithUIDs:(id)a5
{
  uint64_t v5;
  id v8;
  EKCalendarFilter *v9;
  EKCalendarFilter *v10;
  uint64_t v11;
  NSMutableSet *calendarUIDs;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, v5, 0);
  v10 = v9;
  if (v9)
  {
    -[EKCalendarFilter _generateUIDSetToShowCalendarUIDs:](v9, "_generateUIDSetToShowCalendarUIDs:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    calendarUIDs = v10->_calendarUIDs;
    v10->_calendarUIDs = (NSMutableSet *)v11;

  }
  return v10;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 showingCalendarsWithUIDs:(id)a4
{
  id v6;
  EKCalendarFilter *v7;
  EKCalendarFilter *v8;
  uint64_t v9;
  NSMutableSet *calendarUIDs;

  v6 = a4;
  v7 = -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, 2, 0);
  v8 = v7;
  if (v7)
  {
    -[EKCalendarFilter _generateUIDSetToShowCalendarUIDs:](v7, "_generateUIDSetToShowCalendarUIDs:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    calendarUIDs = v8->_calendarUIDs;
    v8->_calendarUIDs = (NSMutableSet *)v9;

  }
  return v8;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 calendarUIDs:(id)a5
{
  id v8;
  EKCalendarFilter *v9;
  EKCalendarFilter *v10;
  uint64_t v11;
  NSMutableSet *calendarUIDs;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKCalendarFilter;
  v9 = -[EKCalendarFilter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock.__sig = 850045863;
    *(_OWORD *)v9->_lock.__opaque = 0u;
    *(_OWORD *)&v9->_lock.__opaque[16] = 0u;
    *(_OWORD *)&v9->_lock.__opaque[32] = 0u;
    *(_QWORD *)&v9->_lock.__opaque[48] = 0;
    v9->_database = (CalDatabase *)CFRetain(a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    calendarUIDs = v10->_calendarUIDs;
    v10->_calendarUIDs = (NSMutableSet *)v11;

    v10->_entityType = a4;
  }

  return v10;
}

- (id)filterQueryForQueryString:(id)a3 creator:(void *)a4 userInfo:(void *)a5
{
  _opaque_pthread_mutex_t *p_lock;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  v9 = a3;
  pthread_mutex_lock(p_lock);
  -[EKCalendarFilter _addFilterToQuery:creator:userInfo:](self, "_addFilterToQuery:creator:userInfo:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v10;
}

- (id)_addFilterToQuery:(id)a3 creator:(void *)a4 userInfo:(void *)a5
{
  return (id)((uint64_t (*)(EKCalendarFilter *, CalDatabase *, id, void *))a4)(self, self->_database, a3, a5);
}

- (BOOL)includeDisabledStores
{
  return self->_includeDisabledStores;
}

- (BOOL)_isFilteringAllWhileLocked
{
  EKCalendarFilter *v2;
  __CFArray *v3;
  void *v4;

  v2 = self;
  v3 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 2);
  -[EKCalendarFilter _UIDSetWithCalendars:](v2, "_UIDSetWithCalendars:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v2->_calendarUIDs);
  LOBYTE(v2) = objc_msgSend(v4, "count") == 0;

  return (char)v2;
}

- (id)calendarIDClauseForQueryWithVariableName:(id)a3
{
  id v4;
  void *v5;
  __CFArray *v6;
  void *v7;
  void *v8;
  __CFArray *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (-[NSMutableSet count](self->_calendarUIDs, "count"))
  {
    if (-[EKCalendarFilter _isFilteringAllWhileLocked](self, "_isFilteringAllWhileLocked"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ in ()"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 2);
      -[EKCalendarFilter _UIDSetWithCalendars:](self, "_UIDSetWithCalendars:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && !objc_msgSend(v7, "isSubsetOfSet:", self->_calendarUIDs))
      {
        v9 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
        -[EKCalendarFilter _UIDAntiSetWithCalendars:](self, "_UIDAntiSetWithCalendars:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unionSet:", self->_calendarUIDs);
        objc_msgSend(v8, "minusSet:", self->_calendarUIDs);
        v11 = objc_msgSend(v10, "count");
        if (v11 >= objc_msgSend(v8, "count"))
        {
          if (objc_msgSend(v8, "count") == 1)
          {
            v14 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "anyObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ = %@"), v4, v13);
          }
          else
          {
            objc_msgSend(v8, "allObjects");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ IN (%@)"), v4, v13);
          }
        }
        else
        {
          objc_msgSend(v10, "allObjects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ NOT IN (%@)"), v4, v13);
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ IN ()"), v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_generateUIDSetToShowCalendarUIDs:(id)a3
{
  id v4;
  __CFArray *v5;
  void *v6;

  v4 = a3;
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    v5 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
    -[EKCalendarFilter _UIDSetWithCalendars:](self, "_UIDSetWithCalendars:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v4);
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_UIDSetWithCalendars:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
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
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (_CalCalendarCanContainEntityType(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), self->_entityType))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CPRecordGetID(), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_calendarUIDs, 0);
}

- (void)dealloc
{
  CalDatabase *database;
  objc_super v4;

  pthread_mutex_destroy(&self->_lock);
  database = self->_database;
  if (database)
    CFRelease(database);
  v4.receiver = self;
  v4.super_class = (Class)EKCalendarFilter;
  -[EKCalendarFilter dealloc](&v4, sel_dealloc);
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3
{
  return -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, 2, 0);
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4
{
  return -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, *(_QWORD *)&a4, 0);
}

- (id)initFilteringAllWithDatabase:(CalDatabase *)a3
{
  EKCalendarFilter *v3;
  EKCalendarFilter *v4;
  uint64_t v5;
  NSMutableSet *calendarUIDs;

  v3 = -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, 2, 0);
  v4 = v3;
  if (v3)
  {
    -[EKCalendarFilter _generateUIDSetToFilterAllCalendars](v3, "_generateUIDSetToFilterAllCalendars");
    v5 = objc_claimAutoreleasedReturnValue();
    calendarUIDs = v4->_calendarUIDs;
    v4->_calendarUIDs = (NSMutableSet *)v5;

  }
  return v4;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 showingCalendars:(id)a4
{
  id v6;
  EKCalendarFilter *v7;
  EKCalendarFilter *v8;
  uint64_t v9;
  NSMutableSet *calendarUIDs;

  v6 = a4;
  v7 = -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, 2, 0);
  v8 = v7;
  if (v7)
  {
    -[EKCalendarFilter _generateUIDSetToShowCalendars:](v7, "_generateUIDSetToShowCalendars:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    calendarUIDs = v8->_calendarUIDs;
    v8->_calendarUIDs = (NSMutableSet *)v9;

  }
  return v8;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 filteringCalendars:(id)a5
{
  uint64_t v5;
  id v8;
  EKCalendarFilter *v9;
  EKCalendarFilter *v10;
  uint64_t v11;
  NSMutableSet *calendarUIDs;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, v5, 0);
  v10 = v9;
  if (v9)
  {
    -[EKCalendarFilter _generateUIDSetToFilterCalendars:](v9, "_generateUIDSetToFilterCalendars:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    calendarUIDs = v10->_calendarUIDs;
    v10->_calendarUIDs = (NSMutableSet *)v11;

  }
  return v10;
}

- (EKCalendarFilter)initWithDatabase:(CalDatabase *)a3 entityType:(int)a4 filteringCalendarsWithUIDs:(id)a5
{
  uint64_t v5;
  id v8;
  EKCalendarFilter *v9;
  uint64_t v10;
  NSMutableSet *calendarUIDs;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:](self, "initWithDatabase:entityType:calendarUIDs:", a3, v5, 0);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v8);
    calendarUIDs = v9->_calendarUIDs;
    v9->_calendarUIDs = (NSMutableSet *)v10;

  }
  return v9;
}

- (BOOL)isShowingAll
{
  return -[NSMutableSet count](self->_calendarUIDs, "count") == 0;
}

- (BOOL)isFilteringAll
{
  int v3;
  BOOL v4;

  v3 = CalDatabaseLockForThread((os_unfair_lock_s *)self->_database);
  if (v3)
  {
    v4 = -[EKCalendarFilter _isFilteringAllWhileLocked](self, "_isFilteringAllWhileLocked");
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
    LOBYTE(v3) = v4;
  }
  return v3;
}

- (id)_UIDAntiSetWithCalendars:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  CFTypeRef Store;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        Store = _CalCalendarGetStore(v11);
        if (!Store
          || (v13 = (uint64_t)Store, !_CalStoreIsEnabled((uint64_t)Store))
          || self->_entityType == 2 && !_CalStoreAllowsEvents(v13)
          || _CalCalendarIsHidden(v11)
          || (_CalCalendarCanContainEntityType(v11, self->_entityType) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CPRecordGetID(), (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_generateUIDSetToShowCalendars:(id)a3
{
  id v4;
  void *v5;
  __CFArray *v6;
  void *v7;

  v4 = a3;
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    -[EKCalendarFilter _UIDSetWithCalendars:](self, "_UIDSetWithCalendars:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
    -[EKCalendarFilter _UIDSetWithCalendars:](self, "_UIDSetWithCalendars:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v5);
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_generateUIDSetToFilterCalendars:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    -[EKCalendarFilter _UIDSetWithCalendars:](self, "_UIDSetWithCalendars:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_generateUIDSetToFilterAllCalendars
{
  __CFArray *v3;
  void *v4;

  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    v3 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, 0);
    -[EKCalendarFilter _UIDSetWithCalendars:](self, "_UIDSetWithCalendars:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)filteredCalendars
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t RecordStore;
  uint64_t CalendarWithUID;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (CalDatabaseLockForThread((os_unfair_lock_s *)self->_database))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_calendarUIDs;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          RecordStore = _CalDatabaseGetRecordStore((uint64_t)self->_database);
          objc_msgSend(v9, "intValue", (_QWORD)v13);
          CalendarWithUID = _CalGetCalendarWithUID(RecordStore);
          if (CalendarWithUID)
            objc_msgSend(v3, "addObject:", CalendarWithUID);
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    CalDatabaseUnlockForThread((const os_unfair_lock *)self->_database);
  }
  return v3;
}

- (id)_visibleCalendarsWithOptions:(int)a3
{
  __CFArray *v4;
  void *v5;
  __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = _CalDatabaseCopyOfAllCalendarsInStoreWithOptions((uint64_t)self->_database, 0, a3 | 2u);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (_CalCalendarCanContainEntityTypeAndStoreAllowsIt(v11, 2))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CPRecordGetID(), (_QWORD)v14);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((-[NSMutableSet containsObject:](self->_calendarUIDs, "containsObject:", v12) & 1) == 0)
              objc_msgSend(v5, "addObject:", v11);

          }
        }
        v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)visibleCalendarsWithOptions:(int)a3
{
  uint64_t v3;
  void *v5;
  os_unfair_lock_s *p_var9;

  v3 = *(_QWORD *)&a3;
  os_unfair_lock_lock(&self->_database->var9);
  -[EKCalendarFilter _visibleCalendarsWithOptions:](self, "_visibleCalendarsWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_var9 = &self->_database->var9;
  if (CDBLockingAssertionsEnabled)
    os_unfair_lock_assert_owner(p_var9);
  os_unfair_lock_unlock(p_var9);
  return v5;
}

- (int)visibleCalendarCountWithOptions:(int)a3
{
  __CFArray *v4;
  __CFArray *v5;
  __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = CalDatabaseCopyOfAllCalendarsInStoreWithOptions(self->_database, 0, a3 | 2u);
  v5 = v4;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v6);
          if (CalCalendarCanContainEntityTypeAndStoreAllowsIt(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), 2))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalCalendarGetUID(), (_QWORD)v14);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v9 += -[NSMutableSet containsObject:](self->_calendarUIDs, "containsObject:", v12) ^ 1;

          }
        }
        v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isCalendarUIDVisible:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[EKCalendarFilter isShowingAll](self, "isShowingAll"))
    LOBYTE(v5) = 1;
  else
    v5 = -[NSMutableSet containsObject:](self->_calendarUIDs, "containsObject:", v4) ^ 1;

  return v5;
}

- (void)removeCalendarWithUID:(id)a3
{
  -[NSMutableSet removeObject:](self->_calendarUIDs, "removeObject:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[EKCalendarFilter initWithDatabase:entityType:calendarUIDs:]([EKCalendarFilter alloc], "initWithDatabase:entityType:calendarUIDs:", self->_database, self->_entityType, self->_calendarUIDs);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSString *searchTerm;
  uint64_t v8;
  NSMutableSet *calendarUIDs;
  uint64_t v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSMutableSet count](self->_calendarUIDs, "count");
    if (v6 == objc_msgSend(*((id *)v5 + 9), "count"))
    {
      searchTerm = self->_searchTerm;
      v8 = *((_QWORD *)v5 + 11);
      if (searchTerm)
      {
        if (v8 && -[NSString isEqualToString:](searchTerm, "isEqualToString:"))
        {
LABEL_6:
          calendarUIDs = self->_calendarUIDs;
          v10 = *((_QWORD *)v5 + 9);
          v11 = ((unint64_t)calendarUIDs | v10) == 0;
          if (calendarUIDs && v10)
            v11 = -[NSMutableSet isEqual:](calendarUIDs, "isEqual:");
          goto LABEL_12;
        }
      }
      else if (!v8)
      {
        goto LABEL_6;
      }
    }
    v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (void)_addCalendarWithUID:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5
{
  id v7;
  const void *v8;
  const void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(v10, "intValue");
  v8 = CalDatabaseCopyCalendarWithUID((os_unfair_lock_s *)a5);
  if (v8)
  {
    v9 = v8;
    if (!CalCalendarIsHidden((uint64_t)v8))
      objc_msgSend(v7, "addObject:", v10);
    CFRelease(v9);
  }

}

+ (void)_addCalendarUIDsFromPrefs:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(a1, "_addCalendarWithUID:toSet:database:", v14, v9, a5);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

+ (void)_addCalendarsForStoreWithUID:(id)a3 toSet:(id)a4 database:(CalDatabase *)a5
{
  const void *v7;
  const void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  const void *ValueAtIndex;
  void *v15;
  id v16;

  v16 = a4;
  objc_msgSend(a3, "intValue");
  v7 = CalDatabaseCopyStoreWithUID((os_unfair_lock_s *)a5);
  if (v7)
  {
    v8 = v7;
    v9 = CalStoreCopyCalendars((uint64_t)v7);
    if (v9)
    {
      v10 = v9;
      Count = CFArrayGetCount(v9);
      if (Count >= 1)
      {
        v12 = Count;
        for (i = 0; i != v12; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v10, i);
          if (!CalCalendarIsHidden((uint64_t)ValueAtIndex)
            && CalCalendarCanContainEntityTypeAndStoreAllowsIt((uint64_t)ValueAtIndex, 2))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalCalendarGetUID());
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v15);

          }
        }
      }
      CFRelease(v10);
    }
    CFRelease(v8);
  }

}

- (void)validate
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CalDatabase *database;
  const void *v11;
  const void *v12;
  CFTypeRef v13;
  const void *v14;
  BOOL IsEnabled;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_calendarUIDs, "count"))
  {
    v3 = (void *)-[NSMutableSet copy](self->_calendarUIDs, "copy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v5)
      goto LABEL_16;
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        database = self->_database;
        objc_msgSend(v9, "intValue", (_QWORD)v16);
        v11 = CalDatabaseCopyCalendarWithUID((os_unfair_lock_s *)database);
        if (!v11)
          goto LABEL_13;
        v12 = v11;
        if (CalCalendarIsHidden((uint64_t)v11) || (v13 = CalCalendarCopyStore((uint64_t)v12)) == 0)
        {
          CFRelease(v12);
LABEL_13:
          -[NSMutableSet removeObject:](self->_calendarUIDs, "removeObject:", v9);
          continue;
        }
        v14 = v13;
        IsEnabled = CalStoreIsEnabled((uint64_t)v13);
        CFRelease(v14);
        CFRelease(v12);
        if (!IsEnabled)
          goto LABEL_13;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v6)
      {
LABEL_16:

        return;
      }
    }
  }
}

- (id)filterQueryForKey:(id)a3 prefix:(id)a4 whereClause:(id)a5 creator:(void *)a6 userInfo:(void *)a7
{
  id v11;
  id v12;
  _opaque_pthread_mutex_t *p_lock;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v11 = a4;
  v12 = a5;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v14 = (void *)((uint64_t (*)(EKCalendarFilter *, CalDatabase *, void *))a6)(self, self->_database, a7);
  v15 = v14;
  if (!v12 || !v14)
  {
    if (!v14)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!objc_msgSend(v14, "length") || !objc_msgSend(v12, "length"))
  {
LABEL_7:
    if (objc_msgSend(v15, "length"))
    {
      v17 = v15;
LABEL_12:
      v16 = (void *)objc_msgSend(v17, "copy");
      goto LABEL_13;
    }
LABEL_9:
    if (!v12 || !objc_msgSend(v12, "length"))
    {
      v18 = 0;
LABEL_17:
      v19 = objc_msgSend(v11, "copy");
      goto LABEL_18;
    }
    v17 = v12;
    goto LABEL_12;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ AND %@"), v15, v12);
LABEL_13:
  v18 = v16;
  if (!v16 || !objc_msgSend(v16, "length"))
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ WHERE %@"), v11, v18);
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v20 = (void *)v19;
  pthread_mutex_unlock(p_lock);

  return v20;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setIncludeDisabledStores:(BOOL)a3
{
  self->_includeDisabledStores = a3;
}

@end
