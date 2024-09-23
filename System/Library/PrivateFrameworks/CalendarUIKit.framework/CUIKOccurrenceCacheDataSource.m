@implementation CUIKOccurrenceCacheDataSource

- (id)faultOccurrencesForDay:(id)a3 inOccurrencesArray:(id)a4 index:(int64_t)a5 limit:(int64_t *)a6 cacheSeed:(int)a7
{
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  CUIKOccurrenceCacheDataSource *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  int v27;

  v11 = a3;
  v12 = a4;
  if (v12)
    goto LABEL_5;
  -[EKEventStore occurrenceCacheGetOccurrencesForCalendars:onDay:](self->_eventStore, "occurrenceCacheGetOccurrencesForCalendars:onDay:", self->_calendars, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (a6)
    *a6 -= objc_msgSend(v13, "count");
  if (v12)
  {
LABEL_5:
    if (a5 < 0)
    {
      v15 = objc_msgSend(v12, "count");
      v14 = v15;
      a5 = 0;
      if (a6)
      {
        if (*a6 < v15)
          v14 = *a6 & ~(*a6 >> 63);
        *a6 -= v14;
      }
    }
    else
    {
      if (objc_msgSend(v12, "count") > (unint64_t)a5)
      {
        v14 = a5 + 1;
LABEL_14:
        objc_opt_class();
        v25 = v12;
        v26 = v11;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v12;
        else
          v16 = (id)objc_msgSend(v12, "mutableCopy", v12);
        v12 = v16;
        v17 = self;
        if (a5 < v14)
        {
          v27 = a7;
          do
          {
            if (v17->_cachedDaysSeed != a7)
              break;
            objc_msgSend(v12, "objectAtIndex:", a5);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CUIKOccurrenceInfoEventKey);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              objc_msgSend(v18, "objectForKey:", CUIKOccurrenceInfoObjectIDKey);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKey:", CUIKOccurrenceInfoDateKey);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKEventStore eventForObjectID:occurrenceDate:checkValid:](v17->_eventStore, "eventForObjectID:occurrenceDate:checkValid:", v20, v21, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", CUIKOccurrenceInfoNextReminderDateKey);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                  objc_msgSend(v19, "_setNextCachedReminderOccurrenceDate:", v22);
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v18, v25);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setObject:forKey:", v19, CUIKOccurrenceInfoEventKey);
                objc_msgSend(v12, "replaceObjectAtIndex:withObject:", a5, v23);

                v17 = self;
              }

              a7 = v27;
            }

            ++a5;
          }
          while (v14 != a5);
        }

        v11 = v26;
        goto LABEL_28;
      }
      v14 = objc_msgSend(v12, "count");
    }
    if (a5 >= v14)
      goto LABEL_28;
    goto LABEL_14;
  }
LABEL_28:

  return v12;
}

- (id)_cachedOccurrenceAtIndexPath:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;

  v5 = a3;
  if (objc_msgSend(v5, "length") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIKOccurrenceCacheDataSource.m"), 178, CFSTR("Invalid index path for use with CUIKOccurrenceCacheDataSource"));

  }
  v6 = objc_msgSend(v5, "indexAtPosition:", 0);
  v7 = objc_msgSend(v5, "indexAtPosition:", 1);
  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v6 >= v9)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CUIKOccurrenceCacheDataSource _cachedOccurrenceAtIndexPath:].cold.2((uint64_t)v5, self);
    v15 = 0;
  }
  else
  {
    -[CUIKOccurrenceCacheDataSource _mutableDayDictionaryAtIndex:](self, "_mutableDayDictionaryAtIndex:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v10, "objectForKey:", CUIKOccurrenceCacheOccurrencesKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v10, "objectForKey:", CUIKOccurrenceCacheDayKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKOccurrenceCacheDataSource faultOccurrencesForDay:inOccurrencesArray:index:limit:cacheSeed:](self, "faultOccurrencesForDay:inOccurrencesArray:index:limit:cacheSeed:", v12, v11, v7, 0, self->_cachedDaysSeed);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, CUIKOccurrenceCacheOccurrencesKey);
    if (v7 >= objc_msgSend(v13, "count"))
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CUIKOccurrenceCacheDataSource _cachedOccurrenceAtIndexPath:].cold.1((uint64_t)v5, v13);
      v15 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndex:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v14, "objectForKey:", CUIKOccurrenceInfoEventKey);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v15;
}

- (id)_mutableDayDictionaryAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
    }
    else
    {
      v6 = (id)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v6, a3);
    }

  }
  return v6;
}

- (id)_cachedDays
{
  os_unfair_lock_s *p_dataLock;
  NSMutableArray *cachedDays;
  NSMutableArray **p_cachedDays;
  void *v6;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_owner(&self->_dataLock);
  os_unfair_lock_assert_not_owner(&self->_fetchLock);
  p_cachedDays = &self->_cachedDays;
  cachedDays = self->_cachedDays;
  if (!cachedDays)
  {
    os_unfair_lock_unlock(p_dataLock);
    os_unfair_lock_lock(&self->_fetchLock);
    os_unfair_lock_lock(p_dataLock);
    if (!*p_cachedDays)
    {
      os_unfair_lock_unlock(p_dataLock);
      -[CUIKOccurrenceCacheDataSource _createCachedDays](self, "_createCachedDays");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(p_dataLock);
      if (!self->_cachedDays)
        objc_storeStrong((id *)&self->_cachedDays, v6);

    }
    os_unfair_lock_unlock(&self->_fetchLock);
    cachedDays = *p_cachedDays;
  }
  return cachedDays;
}

- (id)cachedOccurrenceAtIndexPath:(id)a3
{
  os_unfair_lock_s *p_dataLock;
  id v5;
  void *v6;

  p_dataLock = &self->_dataLock;
  v5 = a3;
  os_unfair_lock_lock(p_dataLock);
  -[CUIKOccurrenceCacheDataSource _cachedOccurrenceAtIndexPath:](self, "_cachedOccurrenceAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_dataLock);
  return v6;
}

- (int64_t)countOfOccurrencesAtDayIndex:(int64_t)a3
{
  os_unfair_lock_s *p_dataLock;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CUIKOccurrenceCacheOccurrenceCountKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (int)objc_msgSend(v8, "intValue");

  }
  os_unfair_lock_unlock(p_dataLock);

  return v9;
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_dataLock;
  void *v6;
  CFIndex v7;
  unint64_t v8;
  CFIndex v9;
  int64_t v10;
  CFRange v12;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, CUIKOccurrenceCacheDayKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12.length = objc_msgSend(v6, "count");
  v12.location = 0;
  v7 = CFArrayBSearchValues((CFArrayRef)v6, v12, v4, (CFComparatorFunction)__CompareCachedDays, 0);
  v8 = objc_msgSend(v6, "count");
  os_unfair_lock_unlock(p_dataLock);
  v9 = v8 - 1;
  if (v7 < v8)
    v9 = v7;
  if (v7 >= 0)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (id)dateAtDayIndex:(int64_t)a3
{
  os_unfair_lock_s *p_dataLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 < 0 || objc_msgSend(v6, "count") <= (unint64_t)a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CUIKOccurrenceCacheDayKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_dataLock);

  return v9;
}

- (BOOL)supportsFakeTodaySection
{
  return 1;
}

- (int64_t)cachedDayCount
{
  os_unfair_lock_s *p_dataLock;
  void *v4;
  int64_t v5;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  os_unfair_lock_unlock(p_dataLock);
  return v5;
}

- (BOOL)cachedOccurrencesAreLoaded
{
  CUIKOccurrenceCacheDataSource *v2;
  os_unfair_lock_s *p_dataLock;

  v2 = self;
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  LOBYTE(v2) = v2->_cachedDays != 0;
  os_unfair_lock_unlock(p_dataLock);
  return (char)v2;
}

- (CUIKOccurrenceCacheDataSource)initWithEventStore:(id)a3 calendars:(id)a4
{
  id v7;
  id v8;
  CUIKOccurrenceCacheDataSource *v9;
  CUIKOccurrenceCacheDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKOccurrenceCacheDataSource;
  v9 = -[CUIKOccurrenceCacheDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    objc_storeStrong((id *)&v10->_calendars, a4);
    *(_QWORD *)&v10->_dataLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDays, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)invalidateCachedOccurrences
{
  os_unfair_lock_s *p_dataLock;
  NSMutableArray *cachedDays;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  cachedDays = self->_cachedDays;
  self->_cachedDays = 0;

  ++self->_cachedDaysSeed;
  os_unfair_lock_unlock(p_dataLock);
}

- (id)_createCachedDays
{
  void *v2;
  void *v3;

  -[EKEventStore occurrenceCacheGetOccurrenceCountsForCalendars:](self->_eventStore, "occurrenceCacheGetOccurrenceCountsForCalendars:", self->_calendars);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4
{
  -[CUIKOccurrenceCacheDataSource _fetchDaysStartingFromSection:sectionsToLoadInBothDirections:background:includeGivenSection:](self, "_fetchDaysStartingFromSection:sectionsToLoadInBothDirections:background:includeGivenSection:", a3, a4, 0, 1);
}

- (void)_fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4 background:(BOOL)a5 includeGivenSection:(BOOL)a6
{
  _BOOL4 v7;
  os_unfair_lock_s *p_dataLock;
  int cachedDaysSeed;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD aBlock[8];
  int v19;
  BOOL v20;

  v7 = a5;
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  cachedDaysSeed = self->_cachedDaysSeed;
  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  os_unfair_lock_unlock(p_dataLock);
  if (v14 >= a3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __125__CUIKOccurrenceCacheDataSource__fetchDaysStartingFromSection_sectionsToLoadInBothDirections_background_includeGivenSection___block_invoke;
    aBlock[3] = &unk_1E6EB79B8;
    v19 = cachedDaysSeed;
    aBlock[4] = self;
    aBlock[5] = a3;
    aBlock[6] = a4;
    aBlock[7] = v14;
    v20 = a6;
    v15 = _Block_copy(aBlock);
    v16 = v15;
    if (v7)
    {
      dispatch_get_global_queue(0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v17, v16);

    }
    else
    {
      (*((void (**)(void *))v15 + 2))(v15);
    }

  }
}

void __125__CUIKOccurrenceCacheDataSource__fetchDaysStartingFromSection_sectionsToLoadInBothDirections_background_includeGivenSection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char **p_name;
  uint64_t v10;
  int v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char **v16;
  void *v17;
  void *v18;
  uint64_t v19;

  if (*(_DWORD *)(a1 + 64) == *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v19 = 100;
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 <= 0)
      v4 = 0;
    else
      v4 = (v2 - v3) & ~((v2 - v3) >> 63);
    if (v3 < 1)
    {
      v6 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      v5 = v2 + v3;
      if (v5 + 1 < *(_QWORD *)(a1 + 56))
        v6 = v5 + 1;
      else
        v6 = *(_QWORD *)(a1 + 56);
    }
    v7 = 0;
    v8 = v2 - *(char *)(a1 + 68);
    p_name = &OBJC_PROTOCOL___CUIKPasteboardManagerEventStoreProvider.name;
LABEL_11:
    v10 = v2;
    while (1)
    {
      v11 = v7;
      if (v10 < v4 && v8 >= v6)
        break;
      v12 = *(os_unfair_lock_s **)(a1 + 32);
      if (*(_DWORD *)(a1 + 64) != v12[10]._os_unfair_lock_opaque)
        return;
      if ((v7 & 1) == 0)
      {
        ++v8;
        v7 = 1;
        v2 = v10;
        v13 = v8;
        if (v8 >= *(_QWORD *)(a1 + 56))
          goto LABEL_11;
        goto LABEL_19;
      }
      v7 = 0;
      --v10;
      if (v2 >= 1)
      {
        v13 = v10;
LABEL_19:
        os_unfair_lock_lock(v12 + 6);
        objc_msgSend(*(id *)(a1 + 32), "_mutableDayDictionaryAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", p_name[133]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(v14, "objectForKey:", CUIKOccurrenceCacheDayKey);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
          objc_msgSend(*(id *)(a1 + 32), "faultOccurrencesForDay:inOccurrencesArray:index:limit:cacheSeed:", v18, 0, -1, &v19, *(unsigned int *)(a1 + 64));
          v16 = p_name;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, v16[133]);

          p_name = v16;
        }
        v7 = v11 ^ 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));

        v2 = v10;
        goto LABEL_11;
      }
    }
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  }
}

- (BOOL)supportsInvitations
{
  return 1;
}

- (void)setCachedDays:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *cachedDays;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  os_unfair_lock_lock(&self->_dataLock);
  cachedDays = self->_cachedDays;
  self->_cachedDays = v4;

  ++self->_cachedDaysSeed;
  os_unfair_lock_unlock(&self->_dataLock);
}

- (id)indexPathsForOccurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *p_dataLock;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  os_unfair_lock_s *lock;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  CUIKOccurrenceCacheDataSource *v40;
  void *v41;
  void *v42;
  CFIndex v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[2];
  _BYTE v50[128];
  uint64_t v51;
  CFRange v52;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore timeZone](self->_eventStore, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateForDayInTimeZone:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "endDateUnadjustedForLegacyClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore timeZone](self->_eventStore, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateForDayInTimeZone:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v40 = self;
  -[CUIKOccurrenceCacheDataSource _cachedDays](self, "_cachedDays");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    lock = p_dataLock;
    objc_msgSend(v12, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CUIKOccurrenceCacheDayKey);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v7;
    objc_msgSend(v7, "laterDate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CUIKOccurrenceCacheDayKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v10;
    objc_msgSend(v10, "earlierDate:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    CalCopyCalendar();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v19;
    if (objc_msgSend(v16, "compare:", v19) == 1)
    {
      v20 = v16;
    }
    else
    {
      v39 = v13;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v16, CUIKOccurrenceCacheDayKey);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v52.length = objc_msgSend(v13, "count");
        v52.location = 0;
        v43 = CFArrayBSearchValues((CFArrayRef)v13, v52, v21, (CFComparatorFunction)__CompareCachedDays, 0);
        -[CUIKOccurrenceCacheDataSource _mutableDayDictionaryAtIndex:](v40, "_mutableDayDictionaryAtIndex:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "objectForKey:", CUIKOccurrenceCacheOccurrencesKey);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKOccurrenceCacheDataSource faultOccurrencesForDay:inOccurrencesArray:index:limit:cacheSeed:](v40, "faultOccurrencesForDay:inOccurrencesArray:index:limit:cacheSeed:", v16, v23, -1, 0, v40->_cachedDaysSeed);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = v22;
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CUIKOccurrenceCacheOccurrencesKey);
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v26)
        {
          v27 = v26;
          v28 = 0;
          v29 = *(_QWORD *)v46;
          while (2)
          {
            v30 = 0;
            v31 = v28 + v27;
            do
            {
              if (*(_QWORD *)v46 != v29)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v30), "objectForKeyedSubscript:", CUIKOccurrenceInfoEventKey);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v4, "isEqual:", v32))
              {
                v49[0] = v43;
                v49[1] = v28 + v30;
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v49, 2);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v33);

                goto LABEL_16;
              }

              ++v30;
            }
            while (v27 != v30);
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
            v28 = v31;
            if (v27)
              continue;
            break;
          }
        }
LABEL_16:

        objc_msgSend(v41, "dateByAddingUnit:value:toDate:options:", 16, 1, v16, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v20;
        v13 = v39;
      }
      while (objc_msgSend(v20, "compare:", v42) != 1);
    }
    os_unfair_lock_unlock(lock);

    v10 = v36;
    v7 = v37;
  }
  else
  {
    os_unfair_lock_unlock(p_dataLock);
  }

  return v38;
}

- (void)fetchDaysInBackgroundStartingFromSection:(int64_t)a3
{
  -[CUIKOccurrenceCacheDataSource _fetchDaysStartingFromSection:sectionsToLoadInBothDirections:background:includeGivenSection:](self, "_fetchDaysStartingFromSection:sectionsToLoadInBothDirections:background:includeGivenSection:", a3, 0, 1, 0);
}

- (void)_cachedOccurrenceAtIndexPath:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1B8A6A000, v2, v3, "Asked for cached occurrence at indexPath [%@] but there are only %lu cached events on that day.", v4, v5, v6, v7, v8);
}

- (void)_cachedOccurrenceAtIndexPath:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "_cachedDays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1B8A6A000, v3, v4, "Asked for cached occurrence at indexPath [%@] but there are only %lu cached days.", v5, v6, v7, v8, v9);

}

@end
