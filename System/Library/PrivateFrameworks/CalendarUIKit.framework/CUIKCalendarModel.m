@implementation CUIKCalendarModel

- (id)cachedOccurrenceAtIndexPath:(id)a3 usingFilter:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "length") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIKCalendarModel.m"), 1173, CFSTR("Invalid index path passed to -[CUIKCalendarModel cachedOccurrenceAtIndexPath:usingFilter:]: %@"), v7);

  }
  v8 = objc_msgSend(v7, "indexAtPosition:", 0);
  v9 = objc_msgSend(v7, "indexAtPosition:", 1);
  v10 = -[CUIKCalendarModel _cachedFakeTodayIndexLocked](self, "_cachedFakeTodayIndexLocked");
  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((v10 & 0x8000000000000000) == 0 && v8 > v10)
    {
      v16[0] = v8 - 1;
      v16[1] = v9;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v16, 2);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v12;
    }
    objc_msgSend(v11, "cachedOccurrenceAtIndexPath:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_dataSourceUsingFilter:(BOOL)a3
{
  id v3;
  _QWORD v5[5];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CUIKCalendarModel__dataSourceUsingFilter___block_invoke;
  v5[3] = &unk_1E6EB6788;
  v5[4] = &v7;
  v6 = a3;
  -[CUIKCalendarModel _executeBlockWithOccurrenceCacheDataSources:](self, "_executeBlockWithOccurrenceCacheDataSources:", v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)_executeBlockWithOccurrenceCacheDataSources:(id)a3
{
  os_unfair_lock_s *p_dataSourceLock;
  void (**v5)(id, id, CUIKOccurrenceCacheDataSourceProtocol *);
  CUIKOccurrenceCacheDataSourceProtocol *occurrenceCacheDataSource;
  CUIKOccurrenceCacheDataSourceProtocol *v7;
  CUIKOccurrenceCacheDataSourceProtocol *v8;

  p_dataSourceLock = &self->_dataSourceLock;
  v5 = (void (**)(id, id, CUIKOccurrenceCacheDataSourceProtocol *))a3;
  os_unfair_lock_lock(p_dataSourceLock);
  occurrenceCacheDataSource = self->_occurrenceCacheDataSource;
  v7 = self->_occurrenceCacheFilteredDataSource;
  v8 = occurrenceCacheDataSource;
  os_unfair_lock_unlock(p_dataSourceLock);
  v5[2](v5, v8, v7);

}

void __44__CUIKCalendarModel__dataSourceUsingFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(_BYTE *)(a1 + 40))
    a2 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)_cachedFakeTodayIndexLocked
{
  os_unfair_lock_s *p_cachedFakeTodayIndexLock;
  int64_t cachedFakeTodayIndex;

  p_cachedFakeTodayIndexLock = &self->_cachedFakeTodayIndexLock;
  os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
  cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
  os_unfair_lock_unlock(p_cachedFakeTodayIndexLock);
  return cachedFakeTodayIndex;
}

uint64_t __49__CUIKCalendarModel__invalidateCachedOccurrences__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateCachedOccurrences");
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3 sectionExistsForDay:(BOOL *)a4
{
  return -[CUIKCalendarModel _sectionForCachedOccurrencesOnDate:sectionExistsForDay:usingFilter:](self, "_sectionForCachedOccurrencesOnDate:sectionExistsForDay:usingFilter:", a3, a4, 0);
}

- (id)cachedSpecialDayDataForSection:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CUIKCalendarSpecialDayData *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl()
    && (v5 = -[CUIKCalendarModel numberOfCachedOccurrencesInSection:usingFilter:](self, "numberOfCachedOccurrencesInSection:usingFilter:", a3, 0), v5 >= 1))
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v17[0] = a3;
      v17[1] = v7;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v17, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKCalendarModel cachedOccurrenceAtIndexPath:usingFilter:](self, "cachedOccurrenceAtIndexPath:usingFilter:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "specialDayType");
      if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
        break;

      if (v6 == ++v7)
        goto LABEL_6;
    }
    v13 = v10;
    v11 = objc_alloc_init(CUIKCalendarSpecialDayData);
    -[CUIKCalendarSpecialDayData setDayType:](v11, "setDayType:", v13);
    objc_msgSend(v9, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKCalendarSpecialDayData setCgColor:](v11, "setCgColor:", objc_msgSend(v14, "CGColor"));

    objc_msgSend(v9, "calendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "locale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKCalendarSpecialDayData setLocale:](v11, "setLocale:", v16);

  }
  else
  {
LABEL_6:
    v11 = 0;
  }
  return v11;
}

- (int64_t)numberOfCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4
{
  void *v6;
  int64_t v7;
  int64_t v8;
  _BOOL8 v10;

  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CUIKCalendarModel _cachedFakeTodayIndexLocked](self, "_cachedFakeTodayIndexLocked");
  v8 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v7 != a3)
  {
    v10 = v7 >= 0 && v7 < a3;
    v8 = objc_msgSend(v6, "countOfOccurrencesAtDayIndex:", a3 - v10);
  }

  return v8;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)checkLocationAuthorizationAndAllowEventLocationPrediction
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D0C138];
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_locationPrecisionDeterminedNotification_, *MEMORY[0x1E0D0C138], 0);

  v5 = *MEMORY[0x1E0D0C468];
  if (objc_msgSend(MEMORY[0x1E0D0C330], "locationPrecisionForBundleIdentifier:", *MEMORY[0x1E0D0C468]))
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_INFO, "Location precision already known; allowing event location prediction",
        buf,
        2u);
    }

    -[CUIKCalendarModel setAllowEventLocationPrediction:](self, "setAllowEventLocationPrediction:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObserver:name:object:](v7, "removeObserver:name:object:", self, v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0C330], "authorizationStatusForBundleIdentifier:completion:", v5, &__block_literal_global_6);
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B8A6A000, v7, OS_LOG_TYPE_INFO, "Waiting for precision to allow event location prediction", v8, 2u);
    }
  }

}

- (void)locationPrecisionDeterminedNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x1E0D0C330], "locationPrecisionForBundleIdentifier:", *MEMORY[0x1E0D0C468]))
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8A6A000, v4, OS_LOG_TYPE_INFO, "Location precision determined; allowing event location prediction",
        buf,
        2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__CUIKCalendarModel_locationPrecisionDeterminedNotification___block_invoke;
    block[3] = &unk_1E6EB60F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D0C138], 0);

  }
}

- (void)_sceneEnteredForeground:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel sceneIdentifier](self, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    self->_modelLocked = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CalendarModelDidUnlockNotification"), self);

  }
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)postSelectedCalendarsChanged
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[CUIKCalendarModel selectedCalendars](self, "selectedCalendars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel selectedOccurrence](self, "selectedOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  if ((v6 & 1) == 0)
    -[CUIKCalendarModel setSelectedOccurrence:](self, "setSelectedOccurrence:", 0);
  -[CUIKCalendarModel _recreateOccurrenceCacheDataSources](self, "_recreateOccurrenceCacheDataSources");
  -[CUIKCalendarModel _processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:](self, "_processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:", 0, 1, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("CalendarModelFilterChangedNotification"), self);

}

- (EKEvent)selectedOccurrence
{
  void *v3;

  if (-[NSMutableArray count](self->_selectedOccurrences, "count") == 1)
  {
    -[NSMutableArray firstObject](self->_selectedOccurrences, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (EKEvent *)v3;
}

- (void)setSelectedOccurrence:(id)a3 forceChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v4 = a4;
  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKCalendarModel setSelectedOccurrences:forceChange:](self, "setSelectedOccurrences:forceChange:", v8, v4);

  }
  else
  {
    -[CUIKCalendarModel setSelectedOccurrences:forceChange:](self, "setSelectedOccurrences:forceChange:", MEMORY[0x1E0C9AA60], v4);
  }

}

- (void)setSelectedOccurrence:(id)a3
{
  -[CUIKCalendarModel setSelectedOccurrence:forceChange:](self, "setSelectedOccurrence:forceChange:", a3, 0);
}

- (void)_recreateOccurrenceCacheDataSources
{
  -[CUIKCalendarModel _invalidateOccurrenceCacheDataSources](self, "_invalidateOccurrenceCacheDataSources");
  -[CUIKCalendarModel _createOccurrenceCacheDataSources](self, "_createOccurrenceCacheDataSources");
}

- (void)_processReloadForCacheOnly:(BOOL)a3 includingCalendars:(BOOL)a4 checkCalendarsValid:(BOOL)a5 checkSources:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  NSArray *visibleCalendars;
  void *v11;
  void *v12;
  NSSet *selectedCalendars;
  uint64_t v14;
  id v15;
  NSArray *v16;
  EKSource *v17;
  void *v18;
  EKSource *sourceForSelectedIdentity;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel _invalidateCachedOccurrences](self, "_invalidateCachedOccurrences");
  objc_msgSend(v21, "postNotificationName:object:", CFSTR("CalendarModelCachedOccurrencesChangedNotification"), self);
  if (v8)
  {
    self->_readWriteCalendarCount = 0x7FFFFFFFFFFFFFFFLL;
    self->_invitationBearingStoresExist = 0x7FFFFFFFFFFFFFFFLL;
    if (v7)
    {
      -[NSLock lock](self->_filterLock, "lock");
      visibleCalendars = self->_visibleCalendars;
      if (visibleCalendars)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_visibleCalendars);
        visibleCalendars = self->_visibleCalendars;
      }
      else
      {
        v11 = 0;
      }
      self->_visibleCalendars = 0;

      -[CUIKCalendarModel _loadVisibleCalendarsIfNeeded](self, "_loadVisibleCalendarsIfNeeded");
      v12 = (void *)objc_opt_new();
      selectedCalendars = self->_selectedCalendars;
      v14 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke;
      v25[3] = &unk_1E6EB6810;
      v15 = v12;
      v26 = v15;
      -[NSSet enumerateObjectsUsingBlock:](selectedCalendars, "enumerateObjectsUsingBlock:", v25);
      if (v11)
      {
        v16 = self->_visibleCalendars;
        v22[0] = v14;
        v22[1] = 3221225472;
        v22[2] = __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke_2;
        v22[3] = &unk_1E6EB6838;
        v23 = v11;
        v24 = v15;
        -[NSArray enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", v22);

      }
      v17 = self->_sourceForSelectedIdentity;
      -[EKSource eventStore](v17, "eventStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        sourceForSelectedIdentity = self->_sourceForSelectedIdentity;
        self->_sourceForSelectedIdentity = 0;

      }
      -[NSLock unlock](self->_filterLock, "unlock");
      if ((objc_msgSend(v15, "isEqualToSet:", self->_selectedCalendars) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("processing reloads in calendar model, old selected count %lu"), -[NSSet count](self->_selectedCalendars, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKCalendarModel setSelectedCalendarsAndRequestPreferenceSave:reason:](self, "setSelectedCalendarsAndRequestPreferenceSave:reason:", v15, v20);

      }
    }
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("CalendarModelCalendarsChangedNotification"), self);
  }
  if (v6)
    -[CUIKCalendarModel _checkSources](self, "_checkSources");

}

- (void)_notificationsLoaded:(id)a3
{
  void *v4;
  id v5;

  if (-[_EKNotificationMonitor notificationCount](self->_notificationMonitor, "notificationCount", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CalendarModelNotificationCountsChangedNotification"), self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("CalendarModelNotificationsChangedNotification"), self);

  }
}

- (void)setSelectedDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  EKCalendarDate *v14;
  EKCalendarDate *selectedDate;
  CUIKPasteboardManager *pasteboardManager;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v5 = a3;
  if (!self->_modelLocked)
  {
    if (self->_suspendSelectedDateChanges)
    {
      objc_storeStrong((id *)&self->_suspendedSelectedDate, a3);
    }
    else
    {
      os_unfair_lock_lock(&self->_selectedDateLock);
      if ((objc_msgSend(v5, "isEqual:", self->_selectedDate) & 1) != 0)
      {
        os_unfair_lock_unlock(&self->_selectedDateLock);
      }
      else
      {
        v6 = (void *)objc_msgSend(v5, "copy");
        objc_msgSend(v6, "timeZone");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar timeZone](self->_calendar, "timeZone");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToTimeZone:", v8);

        if ((v9 & 1) == 0)
        {
          v10 = (void *)MEMORY[0x1E0D0C420];
          objc_msgSend(v6, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCalendar timeZone](self->_calendar, "timeZone");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "calendarDateWithDate:timeZone:", v11, v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v13;
        }
        v14 = (EKCalendarDate *)objc_msgSend(v6, "copy");
        selectedDate = self->_selectedDate;
        self->_selectedDate = v14;

        pasteboardManager = self->_pasteboardManager;
        -[EKCalendarDate date](self->_selectedDate, "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKPasteboardManager setDateForPaste:](pasteboardManager, "setDateForPaste:", v17);

        +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[CUIKCalendarModel setSelectedDate:].cold.1((uint64_t)&self->_selectedDate, v18, v19, v20, v21, v22, v23, v24);

        os_unfair_lock_unlock(&self->_selectedDateLock);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "postNotificationName:object:", CFSTR("CalendarModelSelectedDateChangedNotification"), self);

      }
    }
  }

}

- (void)_invalidateOccurrenceCacheDataSources
{
  -[CUIKCalendarModel _executeBlockWithOccurrenceCacheDataSources:](self, "_executeBlockWithOccurrenceCacheDataSources:", &__block_literal_global_236);
}

- (void)_invalidateCachedOccurrences
{
  -[CUIKCalendarModel _executeBlockWithOccurrenceCacheDataSources:](self, "_executeBlockWithOccurrenceCacheDataSources:", &__block_literal_global_235);
  os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
  self->_cachedFakeTodayIndex = -2;
  os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
}

- (void)setPreferredReloadStartDate:(id)a3 endDate:(id)a4
{
  -[CUIKEventLoader setPreferredReloadStartDate:endDate:](self->_eventLoader, "setPreferredReloadStartDate:endDate:", a3, a4);
}

- (CUIKCalendarModel)initWithDataPath:(id)a3 pasteboardManager:(id)a4
{
  id v6;
  id v7;
  CUIKCalendarModel *v8;
  uint64_t v9;
  uint64_t v10;
  EKEventStore *eventStore;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CUIKCalendarModel;
  v8 = -[CUIKCalendarModel init](&v15, sel_init);
  if (v8)
  {
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
      v9 = 8256;
    else
      v9 = 64;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", v9, v6, 0, 1, 1);
    eventStore = v8->_eventStore;
    v8->_eventStore = (EKEventStore *)v10;

    objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore setTimeZone:](v8->_eventStore, "setTimeZone:", v12);

    if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E80], "setDefaultTimeZone:", v13);

    }
    -[CUIKCalendarModel _performCommonInitializationWithPasteboardManager:](v8, "_performCommonInitializationWithPasteboardManager:", v7);
  }

  return v8;
}

void __45__CUIKCalendarModel_startNotificationMonitor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA1A8]), "initWithOptions:eventStore:", 72, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "start");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__notificationsExpired_, *MEMORY[0x1E0CAA1B0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__notificationsLoaded_, *MEMORY[0x1E0CAA1B8], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

}

- (void)_performCommonInitializationWithPasteboardManager:(id)a3
{
  CUIKPasteboardManager *v4;
  id v5;
  NSCalendar *v6;
  NSCalendar *calendar;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EKCalendarDate *v13;
  EKCalendarDate *selectedDate;
  CUIKEventLoader *v15;
  CUIKEventLoader *eventLoader;
  NSLock *v17;
  NSLock *filterLock;
  NSArray *v19;
  NSArray *delegateSources;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  CUIKPasteboardManager *pasteboardManager;
  CUIKPasteboardManager *v28;
  NSDate *v29;
  NSDate *lastKnownToday;
  _QWORD v31[5];
  _QWORD handler[5];

  v4 = (CUIKPasteboardManager *)a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (NSCalendar *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  calendar = self->_calendar;
  self->_calendar = v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setLocale:](self->_calendar, "setLocale:", v8);

  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v9);

  self->_selectedDateLock._os_unfair_lock_opaque = 0;
  v10 = (void *)MEMORY[0x1E0D0C420];
  CUIKNowDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarDateWithDate:timeZone:", v11, v12);
  v13 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
  selectedDate = self->_selectedDate;
  self->_selectedDate = v13;

  v15 = -[CUIKEventLoader initWithEventStore:]([CUIKEventLoader alloc], "initWithEventStore:", self->_eventStore);
  eventLoader = self->_eventLoader;
  self->_eventLoader = v15;

  -[CUIKEventLoader setDelegate:](self->_eventLoader, "setDelegate:", self);
  self->_invitationBearingStoresExist = 0x7FFFFFFFFFFFFFFFLL;
  self->_cachedFakeTodayIndexLock._os_unfair_lock_opaque = 0;
  os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
  self->_cachedFakeTodayIndex = -2;
  os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
  v17 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  filterLock = self->_filterLock;
  self->_filterLock = v17;

  self->_readWriteCalendarCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_initialAccountSyncCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_autoStartNotificationMonitor = 1;
  +[CUIKCalendarModel sortedEnabledDelegateSourcesFromStore:](CUIKCalendarModel, "sortedEnabledDelegateSourcesFromStore:", self->_eventStore);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  delegateSources = self->_delegateSources;
  self->_delegateSources = v19;

  self->_dataSourceLock._os_unfair_lock_opaque = 0;
  -[CUIKCalendarModel _createOccurrenceCacheDataSources](self, "_createOccurrenceCacheDataSources");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__eventStoreChanged_, *MEMORY[0x1E0CA9F88], self->_eventStore);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__notificationBlacklisted, CFSTR("CalendarModelBlacklistedNotification"), 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__tzSupportTodayRolledOver, CFSTR("CalTodayChangedNotification"), 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__timeZoneChanged_, *MEMORY[0x1E0D0C4C8], 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__searchResultsAvailable_, CFSTR("CalendarDataSourceSearchResultsAvailable"), 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__ignoredErrorsChanged, CFSTR("CalendarModelIgnoredErrorsChangedNotification"), 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__focusModeConfigurationChanged_, *MEMORY[0x1E0CA9FA0], 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__sceneEnteredBackground_, *MEMORY[0x1E0DC5318], 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__sceneEnteredForeground_, *MEMORY[0x1E0DC5338], 0);
  objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__significantTimeChange, *MEMORY[0x1E0D0C4B8]);
  objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__occurrenceCacheChangedNotificationHandler, *MEMORY[0x1E0D0BEC8]);
  objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__systemWake, CFSTR("SBWake"));
  v22 = (const char *)*MEMORY[0x1E0CF9658];
  v23 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke;
  handler[3] = &unk_1E6EB66A0;
  handler[4] = self;
  v24 = MEMORY[0x1E0C80D38];
  notify_register_dispatch(v22, &self->_apHiddenNotificationToken, MEMORY[0x1E0C80D38], handler);
  v25 = (const char *)*MEMORY[0x1E0CF9660];
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke_2;
  v31[3] = &unk_1E6EB66A0;
  v31[4] = self;
  notify_register_dispatch(v25, &self->_apLockedNotificationToken, v24, v31);

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CUIKPasteboardManager initWithEventStoreProvider:pasteboard:calendarProvider:]([CUIKPasteboardManager alloc], "initWithEventStoreProvider:pasteboard:calendarProvider:", self, v26, self);

  }
  pasteboardManager = self->_pasteboardManager;
  self->_pasteboardManager = v4;
  v28 = v4;

  -[CUIKCalendarModel _setupUndoManager](self, "_setupUndoManager");
  CUIKTodayDate();
  v29 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastKnownToday = self->_lastKnownToday;
  self->_lastKnownToday = v29;

}

- (int64_t)numberOfDaysWithCachedOccurrencesUsingFilter:(BOOL)a3
{
  void *v4;
  int64_t v5;
  int64_t cachedFakeTodayIndex;
  void *v7;
  int64_t v8;
  void *v9;

  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cachedDayCount");
  if (objc_msgSend(v4, "supportsFakeTodaySection"))
  {
    os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
    cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
    if (cachedFakeTodayIndex == -2)
    {
      if (!v5)
      {
        self->_cachedFakeTodayIndex = -1;
LABEL_13:
        os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
        goto LABEL_14;
      }
      CUIKTodayDate();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "sectionForCachedOccurrencesOnDate:", v7);
      -[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:holdingCachedFakeTodayIndexLock:](self, "dateForCachedOccurrencesInSection:usingFilter:holdingCachedFakeTodayIndexLock:", v8, 0, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToDate:", v7) & 1) != 0)
      {
        v8 = -1;
      }
      else if (v8 == v5 - 1 && objc_msgSend(v7, "compare:", v9) != -1)
      {
        v8 = v5;
      }
      self->_cachedFakeTodayIndex = v8;

      cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
    }
    if (cachedFakeTodayIndex != -1)
      ++v5;
    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

- (int64_t)_sectionForCachedOccurrencesOnDate:(id)a3 sectionExistsForDay:(BOOL *)a4 usingFilter:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  int64_t v20;
  void *v21;

  v5 = a5;
  v8 = a3;
  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKTodayDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CUIKCalendarModel _cachedFakeTodayIndexLocked](self, "_cachedFakeTodayIndexLocked");
  if (v11 < 0)
  {
    objc_msgSend(v10, "compare:", v8);
    goto LABEL_13;
  }
  v12 = objc_msgSend(v9, "cachedDayCount");
  v13 = objc_msgSend(v10, "compare:", v8);
  if (v5
    || ((v14 = v13, v15 = objc_msgSend(v10, "isEqualToDate:", v8), v12 <= v11) ? (v16 = v14 == -1) : (v16 = 0),
        v16 ? (v17 = 0) : (v17 = 1),
        !v15 && v17))
  {
LABEL_13:
    v18 = objc_msgSend(v9, "sectionForCachedOccurrencesOnDate:", v8);
    if (v11 < 0 || v18 < v11)
      v20 = v18;
    else
      v20 = v18 + 1;
    if (a4)
    {
      if (v20 == v11)
      {
        *a4 = 0;
        goto LABEL_24;
      }
      -[CUIKCalendarModel dateForCachedOccurrencesInSection:](self, "dateForCachedOccurrencesInSection:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v21, "isEqualToDate:", v8);

    }
    v11 = v20;
  }
LABEL_24:

  return v11;
}

- (id)dateForCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4 holdingCachedFakeTodayIndexLock:(BOOL)a5
{
  void *v8;
  os_unfair_lock_s *p_cachedFakeTodayIndexLock;
  int64_t cachedFakeTodayIndex;
  uint64_t v11;
  _BOOL8 v13;
  void *v14;

  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_cachedFakeTodayIndexLock = &self->_cachedFakeTodayIndexLock;
  if (a5)
  {
    os_unfair_lock_assert_owner(p_cachedFakeTodayIndexLock);
    cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
  }
  else
  {
    os_unfair_lock_assert_not_owner(p_cachedFakeTodayIndexLock);
    cachedFakeTodayIndex = -[CUIKCalendarModel _cachedFakeTodayIndexLocked](self, "_cachedFakeTodayIndexLocked");
  }
  if (cachedFakeTodayIndex == a3)
  {
    CUIKTodayDate();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = cachedFakeTodayIndex >= 0 && cachedFakeTodayIndex < a3;
    objc_msgSend(v8, "dateAtDayIndex:", a3 - v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;

  return v14;
}

- (id)dateForCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4
{
  return -[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:holdingCachedFakeTodayIndexLock:](self, "dateForCachedOccurrencesInSection:usingFilter:holdingCachedFakeTodayIndexLock:", a3, a4, 0);
}

- (id)dateForCachedOccurrencesInSection:(int64_t)a3
{
  return -[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:](self, "dateForCachedOccurrencesInSection:usingFilter:", a3, 0);
}

- (void)_setupUndoManager
{
  CUIKEditingManager *v3;
  CUIKUndoManager *v4;
  CUIKUndoManager *undoManager;
  CUIKUndoManager *v6;
  CUIKEditingManager *v7;
  CUIKUndoableEditor *v8;
  _QWORD v9[4];
  CUIKEditingManager *v10;

  v3 = -[CUIKEditingManager initWithEventStore:]([CUIKEditingManager alloc], "initWithEventStore:", self->_eventStore);
  v4 = objc_alloc_init(CUIKUndoManager);
  undoManager = self->_undoManager;
  self->_undoManager = v4;

  -[CUIKUndoManager setDisableUndoForOrganizerScheduling:](self->_undoManager, "setDisableUndoForOrganizerScheduling:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CUIKCalendarModel__setupUndoManager__block_invoke;
  v9[3] = &unk_1E6EB66C8;
  v10 = v3;
  v6 = self->_undoManager;
  v7 = v3;
  -[CUIKUndoManager setEditingManagerProvider:](v6, "setEditingManagerProvider:", v9);
  v8 = -[CUIKUndoableEditor initWithEditingManager:]([CUIKUndoableEditor alloc], "initWithEditingManager:", v7);
  -[CUIKUndoableEditor setUndoDelegate:](v8, "setUndoDelegate:", self->_undoManager);
  -[CUIKUndoManager setUndoableEditor:](self->_undoManager, "setUndoableEditor:", v8);

}

+ (id)sortedEnabledDelegateSourcesFromStore:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "delegateSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_243);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_245);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_eventNotificationCountForCurrentIdentityIgnoringFilter:(BOOL)a3
{
  void *v3;
  unint64_t v4;

  -[CUIKCalendarModel _eventNotificationsForCurrentIdentityIgnoringFilter:](self, "_eventNotificationsForCurrentIdentityIgnoringFilter:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)eventNotificationReferencesForIdentity:(id)a3 ignoringFilter:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v6 = a3;
  -[CUIKCalendarModel allEventNotificationReferences](self, "allEventNotificationReferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__CUIKCalendarModel_eventNotificationReferencesForIdentity_ignoringFilter___block_invoke;
  v13[3] = &unk_1E6EB68E0;
  v15 = a4;
  v13[4] = self;
  v14 = v6;
  v9 = v6;
  objc_msgSend(v8, "predicateWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)allEventNotificationReferences
{
  void *v2;
  void *v3;

  -[CUIKCalendarModel _notificationMonitor](self, "_notificationMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_notificationMonitor
{
  return self->_notificationMonitor;
}

- (id)_eventNotificationsForCurrentIdentityIgnoringFilter:(BOOL)a3
{
  return -[CUIKCalendarModel eventNotificationReferencesForIdentity:ignoringFilter:](self, "eventNotificationReferencesForIdentity:ignoringFilter:", self->_sourceForSelectedIdentity, a3);
}

void __47__CUIKCalendarModel_cachedOccurrencesAreLoaded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(a2, "cachedOccurrencesAreLoaded") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v6, "cachedOccurrencesAreLoaded");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;

}

- (unint64_t)eventNotificationsForCurrentIdentityCount
{
  return -[CUIKCalendarModel _eventNotificationCountForCurrentIdentityIgnoringFilter:](self, "_eventNotificationCountForCurrentIdentityIgnoringFilter:", 0);
}

- (id)persistedSceneState
{
  CUIKCalendarModelSceneState *v3;
  CUIKCalendarModelSceneState *persistedSceneState;
  CUIKCalendarModelSceneState *v5;
  CUIKCalendarModelSceneState *v6;

  if (CUIKShouldSaveStateInPreferences())
  {
    v3 = 0;
  }
  else
  {
    persistedSceneState = self->_persistedSceneState;
    if (!persistedSceneState)
    {
      v5 = objc_alloc_init(CUIKCalendarModelSceneState);
      v6 = self->_persistedSceneState;
      self->_persistedSceneState = v5;

      persistedSceneState = self->_persistedSceneState;
    }
    v3 = persistedSceneState;
  }
  return v3;
}

- (BOOL)showDayAsList
{
  void *v3;
  char v4;
  BOOL v5;

  if (CUIKShouldSaveStateInPreferences())
  {
    +[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showListView");
  }
  else
  {
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showDayAsList");
  }
  v5 = v4;

  return v5;
}

- (BOOL)showMonthAsDivided
{
  void *v3;
  char v4;
  BOOL v5;

  if (CUIKShouldSaveStateInPreferences())
  {
    +[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showMonthDividedListView");
  }
  else
  {
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showMonthAsDivided");
  }
  v5 = v4;

  return v5;
}

- (EKCalendarDate)selectedDate
{
  os_unfair_lock_s *p_selectedDateLock;
  void *v4;

  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  v4 = (void *)-[EKCalendarDate copy](self->_selectedDate, "copy");
  os_unfair_lock_unlock(p_selectedDateLock);
  return (EKCalendarDate *)v4;
}

- (BOOL)cachedOccurrencesAreLoaded
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CUIKCalendarModel_cachedOccurrencesAreLoaded__block_invoke;
  v4[3] = &unk_1E6EB6760;
  v4[4] = &v5;
  -[CUIKCalendarModel _executeBlockWithOccurrenceCacheDataSources:](self, "_executeBlockWithOccurrenceCacheDataSources:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)containsDelegateSources
{
  return -[NSArray count](self->_delegateSources, "count") != 0;
}

- (void)setAllowEventLocationPrediction:(BOOL)a3
{
  -[CUIKEventLoader setAllowEventLocationPrediction:](self->_eventLoader, "setAllowEventLocationPrediction:", a3);
}

- (void)_setFocusFilterMode:(unint64_t)a3 force:(BOOL)a4
{
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSLock lock](self->_filterLock, "lock");
  if (a4 || self->_focusFilterMode != a3)
  {
    self->_focusFilterMode = a3;
    v7 = -[CUIKCalendarModel _setSelectedCalendars:](self, "_setSelectedCalendars:", self->_selectedCalendars);
    -[NSLock unlock](self->_filterLock, "unlock");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("CalendarModelFocusModeConfigurationChangedNotification"), self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("CalendarModelNotificationCountsChangedNotification"), self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("CalendarModelNotificationsChangedNotification"), self);

    if (v7)
      -[CUIKCalendarModel postSelectedCalendarsChanged](self, "postSelectedCalendarsChanged");
  }
  else
  {
    -[NSLock unlock](self->_filterLock, "unlock");
  }
}

- (int64_t)displayableAccountErrorsForSource:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  if (!self->_displayableAccountErrorCounts)
    -[CUIKCalendarModel countSourcesWithErrors](self, "countSourcesWithErrors");
  objc_msgSend(v4, "sourceIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (__CFString *)v5;
  else
    v6 = &stru_1E6EBAE30;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_displayableAccountErrorCounts, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (BOOL)countSourcesWithErrors
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  _UNKNOWN **v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  NSMutableDictionary *displayableAccountErrorCounts;
  CUIKCalendarModel *v26;
  uint64_t v27;
  NSMutableDictionary *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = (NSMutableDictionary *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = self;
  -[EKEventStore eventSources](self->_eventStore, "eventSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    v7 = &off_1E6EAF000;
    v8 = 0x1E0D0C000uLL;
    v27 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(v8 + 568), "severityForError:", objc_msgSend(v7[389], "errorForSource:", v10)) == 2)
        {
          if (objc_msgSend(v10, "sourceType") == 4)
          {
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            objc_msgSend(v10, "allCalendars");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v12)
            {
              v13 = v8;
              v14 = v3;
              v15 = v7;
              v16 = *(_QWORD *)v30;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v30 != v16)
                    objc_enumerationMutation(v11);
                  if (!objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "isSubscribedHolidayCalendar"))
                  {
                    LODWORD(v12) = 1;
                    goto LABEL_19;
                  }
                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
                if (v12)
                  continue;
                break;
              }
LABEL_19:
              v7 = v15;
              v3 = v14;
              v8 = v13;
              v6 = v27;
            }

          }
          else
          {
            LODWORD(v12) = 1;
          }
          objc_msgSend(v10, "externalID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {

          }
          else if (objc_msgSend(v10, "sourceType") == 5)
          {
            LODWORD(v12) = 0;
          }
          if (objc_msgSend(v10, "isEnabled") && (_DWORD)v12)
          {
            v19 = &stru_1E6EBAE30;
            if (objc_msgSend(v10, "isDelegate"))
            {
              objc_msgSend(v10, "sourceIdentifier");
              v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            -[NSMutableDictionary objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "integerValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21 + 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v22, v19);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v5);
  }

  v23 = -[NSMutableDictionary isEqualToDictionary:](v26->_displayableAccountErrorCounts, "isEqualToDictionary:", v28);
  displayableAccountErrorCounts = v26->_displayableAccountErrorCounts;
  v26->_displayableAccountErrorCounts = v28;

  return v23 ^ 1;
}

+ (unint64_t)errorForSource:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "lastSyncError");
  os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
  if (_objectsWithIgnoredErrors)
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)_objectsWithIgnoredErrors, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
    if (v7)
    {
      objc_msgSend(v4, "lastSyncEndDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && objc_msgSend(v7, "isEqualToDate:", v8) && objc_msgSend(v4, "lastSyncError") == 2)
        v5 = 0;

    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
  }
  if (!v5)
    v5 = objc_msgSend(a1, "errorForSubscribedCalendarChildrenOfSource:", v4);

  return v5;
}

+ (unint64_t)errorForSubscribedCalendarChildrenOfSource:(id)a3
{
  id v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "sourceType");
  if (v4 != 4 && v4 != 2)
  {
    v16 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v3, "calendarsForEntityType:", 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_8:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      if (!_objectsWithIgnoredErrors)
        break;
      objc_msgSend(v11, "objectID", (_QWORD)v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend((id)_objectsWithIgnoredErrors, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      if (!v13)
        goto LABEL_21;
      objc_msgSend(v11, "lastSyncEndDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14 || (objc_msgSend(v13, "isEqualToDate:", v14) & 1) == 0)
      {

        goto LABEL_21;
      }

LABEL_23:
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_8;
        goto LABEL_25;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
    v13 = 0;
LABEL_21:
    if (objc_msgSend(v11, "lastSyncError", (_QWORD)v18) == 7)
    {
      objc_msgSend(v11, "lastSyncStartDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {

        v16 = 7;
        goto LABEL_27;
      }
    }
    goto LABEL_23;
  }
LABEL_25:
  v16 = 0;
LABEL_27:

LABEL_28:
  return v16;
}

- (void)setFocusFilterMode:(unint64_t)a3 force:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (_os_feature_enabled_impl())
  {
    if (!-[CUIKCalendarModel disableFocusFiltering](self, "disableFocusFiltering"))
      -[CUIKCalendarModel _setFocusFilterMode:force:](self, "_setFocusFilterMode:force:", a3, v4);
  }
}

- (void)setUnselectedCalendars:(id)a3
{
  NSLock *filterLock;
  id v5;
  id v6;

  filterLock = self->_filterLock;
  v5 = a3;
  -[NSLock lock](filterLock, "lock");
  -[CUIKCalendarModel _loadVisibleCalendarsIfNeeded](self, "_loadVisibleCalendarsIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_visibleCalendars);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v5);

  LODWORD(filterLock) = -[CUIKCalendarModel _setSelectedCalendars:](self, "_setSelectedCalendars:", v6);
  -[NSLock unlock](self->_filterLock, "unlock");
  if ((_DWORD)filterLock)
    -[CUIKCalendarModel postSelectedCalendarsChanged](self, "postSelectedCalendarsChanged");

}

- (BOOL)_setSelectedCalendars:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *selectedCalendars;
  id v7;
  void *v8;
  CUIKEventLoader *eventLoader;
  void *v10;

  v4 = a3;
  if (!-[NSSet isEqualToSet:](self->_selectedCalendars, "isEqualToSet:", v4))
  {
    v5 = (NSSet *)objc_msgSend(v4, "copy");
    selectedCalendars = self->_selectedCalendars;
    self->_selectedCalendars = v5;

  }
  v7 = v4;
  v8 = v7;
  if (self->_focusFilterMode == 1)
  {
    -[CUIKCalendarModel _calendarsEnabledInFocus:](self, "_calendarsEnabledInFocus:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  eventLoader = self->_eventLoader;
  -[CUIKCalendarModel _calendarsForCurrentIdentityFromCalendars:lock:](self, "_calendarsForCurrentIdentityFromCalendars:lock:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(eventLoader) = -[CUIKEventLoader setSelectedCalendars:](eventLoader, "setSelectedCalendars:", v10);

  -[CUIKCalendarModel _loadVisibleCalendarsIfNeeded](self, "_loadVisibleCalendarsIfNeeded");
  return (char)eventLoader;
}

- (void)_loadVisibleCalendarsIfNeeded
{
  NSArray *v3;
  NSArray *visibleCalendars;
  id v5;

  if (!self->_visibleCalendars)
  {
    -[EKEventStore calendarsForEntityType:](self->_eventStore, "calendarsForEntityType:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (NSArray *)objc_msgSend(v5, "copy");
    visibleCalendars = self->_visibleCalendars;
    self->_visibleCalendars = v3;

  }
}

- (void)setMaxCachedDays:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CUIKCalendarModel setMaxCachedDays:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);

  -[CUIKEventLoader setCacheLimit:](self->_eventLoader, "setCacheLimit:", v3);
}

uint64_t __75__CUIKCalendarModel_eventNotificationReferencesForIdentity_ignoringFilter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48) || objc_msgSend(*(id *)(a1 + 32), "_shouldShowNotification:", v3))
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "externalID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "externalID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = objc_msgSend(v5, "isDelegate") ^ 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldShowNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[CUIKCalendarModel focusFilterMode](self, "focusFilterMode") == 1)
  {
    -[CUIKCalendarModel unselectedCalendarsForFocusMode](self, "unselectedCalendarsForFocusMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "cuik_shouldShowNotificationWithUnselectedCalendarsForFocus:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)defaultCalendarForNewEvents
{
  void *v3;
  void *v4;
  void *v5;
  EKEventStore *eventStore;
  void *v7;

  -[CUIKCalendarModel selectedCalendars](self, "selectedCalendars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel calendarsForCurrentIdentityFromCalendars:](self, "calendarsForCurrentIdentityFromCalendars:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") != 1)
    goto LABEL_6;
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "allowsContentModifications") & 1) == 0)
  {

LABEL_6:
    eventStore = self->_eventStore;
    -[CUIKCalendarModel sourceForSelectedIdentity](self, "sourceForSelectedIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore defaultCalendarForNewEventsInDelegateSource:](eventStore, "defaultCalendarForNewEventsInDelegateSource:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (!v5)
    goto LABEL_6;
LABEL_7:

  return v5;
}

- (EKSource)sourceForSelectedIdentity
{
  return self->_sourceForSelectedIdentity;
}

- (void)_createOccurrenceCacheDataSources
{
  void *v3;
  CUIKOccurrenceCacheDataSource *v4;
  CUIKOccurrenceCacheDataSourceProtocol *occurrenceCacheDataSource;
  CUIKOccurrenceCacheSearchDataSource *v6;
  CUIKOccurrenceCacheDataSourceProtocol *occurrenceCacheFilteredDataSource;
  CUIKOccurrenceCacheDataSourceProtocol *v8;
  void *v9;
  id v10;

  -[CUIKCalendarModel selectedCalendars](self, "selectedCalendars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel calendarsForCurrentIdentityFromCalendars:](self, "calendarsForCurrentIdentityFromCalendars:", v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_dataSourceLock);
  v4 = -[CUIKOccurrenceCacheDataSource initWithEventStore:calendars:]([CUIKOccurrenceCacheDataSource alloc], "initWithEventStore:calendars:", self->_eventStore, v10);
  occurrenceCacheDataSource = self->_occurrenceCacheDataSource;
  self->_occurrenceCacheDataSource = (CUIKOccurrenceCacheDataSourceProtocol *)v4;

  v6 = -[CUIKOccurrenceCacheSearchDataSource initWithEventStore:calendars:]([CUIKOccurrenceCacheSearchDataSource alloc], "initWithEventStore:calendars:", self->_eventStore, v10);
  occurrenceCacheFilteredDataSource = self->_occurrenceCacheFilteredDataSource;
  self->_occurrenceCacheFilteredDataSource = (CUIKOccurrenceCacheDataSourceProtocol *)v6;

  v8 = self->_occurrenceCacheFilteredDataSource;
  os_unfair_lock_unlock(&self->_dataSourceLock);
  if (-[CUIKCalendarModel searchingOccurrences](self, "searchingOccurrences"))
  {
    -[CUIKCalendarModel searchString](self, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKOccurrenceCacheDataSourceProtocol searchWithTerm:](v8, "searchWithTerm:", v9);

  }
}

- (id)calendarsForCurrentIdentityFromCalendars:(id)a3
{
  return -[CUIKCalendarModel _calendarsForCurrentIdentityFromCalendars:lock:](self, "_calendarsForCurrentIdentityFromCalendars:lock:", a3, 1);
}

- (BOOL)searchingOccurrences
{
  void *v2;
  BOOL v3;

  -[CUIKCalendarModel searchString](self, "searchString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)searchString
{
  void *v3;

  -[NSLock lock](self->_filterLock, "lock");
  v3 = (void *)-[NSString copy](self->_searchString, "copy");
  -[NSLock unlock](self->_filterLock, "unlock");
  return (NSString *)v3;
}

- (id)_calendarsForCurrentIdentityFromCalendars:(id)a3 lock:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  EKSource *sourceForSelectedIdentity;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (v4)
    -[NSLock lock](self->_filterLock, "lock");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
        sourceForSelectedIdentity = self->_sourceForSelectedIdentity;
        objc_msgSend(v13, "source", (_QWORD)v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (sourceForSelectedIdentity)
        {
          v17 = -[EKSource isEqual:](sourceForSelectedIdentity, "isEqual:", v15);

          if ((v17 & 1) == 0)
            goto LABEL_11;
LABEL_10:
          objc_msgSend(v7, "addObject:", v13);
          goto LABEL_11;
        }
        v18 = objc_msgSend(v15, "isDelegate");

        if ((v18 & 1) == 0)
          goto LABEL_10;
LABEL_11:
        ++v12;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v10 = v19;
    }
    while (v19);
  }

  if (v4)
    -[NSLock unlock](self->_filterLock, "unlock");
  -[CUIKCalendarModel _calendarsExcludingLockedReminder:](self, "_calendarsExcludingLockedReminder:", v7, (_QWORD)v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSSet)selectedCalendars
{
  NSSet *v3;
  void *v4;
  void *v5;

  -[NSLock lock](self->_filterLock, "lock");
  v3 = self->_selectedCalendars;
  -[CUIKCalendarModel _calendarsEnabledInFocus:](self, "_calendarsEnabledInFocus:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel _calendarsExcludingLockedReminder:](self, "_calendarsExcludingLockedReminder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_filterLock, "unlock");

  return (NSSet *)v5;
}

- (unint64_t)focusFilterMode
{
  unint64_t focusFilterMode;

  if (!_os_feature_enabled_impl()
    || -[CUIKCalendarModel disableFocusFiltering](self, "disableFocusFiltering"))
  {
    return 0;
  }
  -[NSLock lock](self->_filterLock, "lock");
  focusFilterMode = self->_focusFilterMode;
  -[NSLock unlock](self->_filterLock, "unlock");
  return focusFilterMode;
}

- (BOOL)disableFocusFiltering
{
  return self->_disableFocusFiltering;
}

- (id)_calendarsEnabledInFocus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count") && self->_focusFilterMode == 1)
  {
    -[CUIKCalendarModel _unselectedCalendarsForFocusMode](self, "_unselectedCalendarsForFocusMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v6, "minusSet:", v5);
      v7 = (id)objc_msgSend(v6, "copy");

    }
    else
    {
      v7 = v4;
    }

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (void)calendarEventLoader:(id)a3 occurrencesDidUpdateBetweenStart:(double)a4 end:(double)a5 generation:(int)a6 wasEmptyLoad:(BOOL)a7
{
  _BOOL8 v7;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  _BOOL4 v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v7 = a7;
  v43 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CUIKCalendarModel selectedOccurrences](self, "selectedOccurrences", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v13 = 0x1E0CB3000;
  if (!v12)
    goto LABEL_25;
  v14 = v12;
  v15 = 0;
  v16 = *(_QWORD *)v39;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v39 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
      objc_msgSend(v18, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
      v21 = v20;

      objc_msgSend(v18, "endDateUnadjustedForLegacyClients");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceReferenceDate");
      v24 = v23;

      if (objc_msgSend(v18, "isBirthday"))
      {
        objc_msgSend(v18, "isNew");
      }
      else
      {
        if (v21 < a4 || v21 > a5)
          v26 = v24 <= a5 && v24 >= a4;
        else
          v26 = 1;
        if ((objc_msgSend(v18, "isNew") & 1) == 0 && v26)
        {
          v27 = (void *)objc_msgSend(v18, "copy");
          v28 = objc_msgSend(v27, "refreshIfRefreshableAndNotify:", 0);

          if ((v28 & 1) == 0)
          {
            -[CUIKCalendarModel _deselectOccurrence:notify:](self, "_deselectOccurrence:notify:", v18, 0);
            v15 = 1;
          }
        }
      }
      ++v17;
    }
    while (v14 != v17);
    v29 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    v14 = v29;
  }
  while (v29);

  v13 = 0x1E0CB3000uLL;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("CalendarModelSelectedOccurrencesChangedNotification"), self);
LABEL_25:

  }
  v30 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, CFSTR("CalendarModelDisplayedOccurrencesChangedRangeStartKey"), v32, CFSTR("CalendarModelDisplayedOccurrencesChangedRangeEndKey"), v33, CFSTR("CalendarModelDisplayedOccurrencesChangedFilteredAllKey"), v34, CFSTR("CalendarModelDisplayedOccurrencesChangedGenerationKey"), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKCalendarModel _finishedFirstLoad](self, "_finishedFirstLoad");
  objc_msgSend(*(id *)(v13 + 2000), "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "postNotificationName:object:userInfo:", CFSTR("CalendarModelDisplayedOccurrencesChangedNotification"), self, v35);

  if (!v7 && self->_autoStartNotificationMonitor)
    -[CUIKCalendarModel startNotificationMonitor](self, "startNotificationMonitor");

}

- (NSArray)selectedOccurrences
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_selectedOccurrences);
}

- (void)_finishedFirstLoad
{
  id v3;

  if ((_finishedFirstLoad___finishedFirstLoad & 1) == 0)
  {
    _finishedFirstLoad___finishedFirstLoad = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification"), self);

  }
}

- (EKCalendarDate)selectedDay
{
  os_unfair_lock_s *p_selectedDateLock;
  void *v4;

  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  -[EKCalendarDate calendarDateForDay](self->_selectedDate, "calendarDateForDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_selectedDateLock);
  return (EKCalendarDate *)v4;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void)setFocusFilterMode:(unint64_t)a3
{
  -[CUIKCalendarModel setFocusFilterMode:force:](self, "setFocusFilterMode:force:", a3, 0);
}

- (void)setAutoStartNotificationMonitor:(BOOL)a3
{
  self->_autoStartNotificationMonitor = a3;
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3
{
  return -[CUIKCalendarModel sectionForCachedOccurrencesOnDate:sectionExistsForDay:](self, "sectionForCachedOccurrencesOnDate:sectionExistsForDay:", a3, 0);
}

- (int64_t)numberOfDaysWithCachedOccurrences
{
  return -[CUIKCalendarModel numberOfDaysWithCachedOccurrencesUsingFilter:](self, "numberOfDaysWithCachedOccurrencesUsingFilter:", 0);
}

uint64_t __61__CUIKCalendarModel_locationPrecisionDeterminedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowEventLocationPrediction:", 1);
}

- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6
{
  return -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:](self->_eventLoader, "occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:", a3, a4, a5, a6, 0);
}

- (CUIKCalendarModel)initWithPasteboardManager:(id)a3
{
  return -[CUIKCalendarModel initWithDataPath:pasteboardManager:](self, "initWithDataPath:pasteboardManager:", 0, a3);
}

- (int64_t)accountsInInitialSyncCount
{
  int64_t result;

  result = self->_initialAccountSyncCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    result = -[CUIKCalendarModel countAccountsInInitialSync](self, "countAccountsInInitialSync");
    self->_initialAccountSyncCount = result;
  }
  return result;
}

- (int64_t)countAccountsInInitialSync
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
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
  -[EKEventStore sources](self->_eventStore, "sources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isSyncing"))
        {
          objc_msgSend(v8, "lastSyncEndDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
            ++v5;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __58__CUIKCalendarModel__invalidateOccurrenceCacheDataSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "invalidate");
  objc_msgSend(v4, "invalidate");

}

- (void)fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4
{
  id v6;

  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchDaysStartingFromSection:sectionsToLoadInBothDirections:", a3, a4);

}

- (void)startNotificationMonitor
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_notificationMonitorSetUp)
  {
    self->_notificationMonitorSetUp = 1;
    dispatch_get_global_queue(-2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__CUIKCalendarModel_startNotificationMonitor__block_invoke;
    block[3] = &unk_1E6EB60F8;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (CUIKCalendarModel)initWithEventStore:(id)a3 pasteboardManager:(id)a4
{
  id v7;
  id v8;
  CUIKCalendarModel *v9;
  CUIKCalendarModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKCalendarModel;
  v9 = -[CUIKCalendarModel init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    -[CUIKCalendarModel _performCommonInitializationWithPasteboardManager:](v10, "_performCommonInitializationWithPasteboardManager:", v8);
  }

  return v10;
}

void __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("CalendarModelDisplayedOccurrencesChangedNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "selectedCalendarsIgnoringFocus");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelectedCalendars:", v2);

}

id __38__CUIKCalendarModel__setupUndoManager__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dealloc
{
  objc_super v3;

  -[_EKNotificationMonitor stop](self->_notificationMonitor, "stop");
  -[CUIKCalendarModel _invalidateOccurrenceCacheDataSources](self, "_invalidateOccurrenceCacheDataSources");
  notify_cancel(self->_apHiddenNotificationToken);
  self->_apHiddenNotificationToken = -1;
  notify_cancel(self->_apLockedNotificationToken);
  self->_apLockedNotificationToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)CUIKCalendarModel;
  -[CUIKCalendarModel dealloc](&v3, sel_dealloc);
}

- (NSSet)selectedCalendarsIgnoringFocus
{
  NSSet *v3;

  -[NSLock lock](self->_filterLock, "lock");
  v3 = self->_selectedCalendars;
  -[NSLock unlock](self->_filterLock, "unlock");
  return v3;
}

- (id)allCalendarsForCurrentIdentity
{
  void *v3;
  void *v4;
  void *v5;

  -[CUIKCalendarModel sourceForSelectedIdentity](self, "sourceForSelectedIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CUIKCalendarModel sourceForSelectedIdentity](self, "sourceForSelectedIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendarsForEntityType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSLock lock](self->_filterLock, "lock");
    -[CUIKCalendarModel _loadVisibleCalendarsIfNeeded](self, "_loadVisibleCalendarsIfNeeded");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_visibleCalendars);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKCalendarModel _calendarsForCurrentIdentityFromCalendars:lock:](self, "_calendarsForCurrentIdentityFromCalendars:lock:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock unlock](self->_filterLock, "unlock");
  }

  return v5;
}

- (id)_calendarsExcludingLockedReminder:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CA9FC0], "isReminderAppLocked"))
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v3);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "type", (_QWORD)v12) == 6)
            objc_msgSend(v4, "removeObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (id)_reminderCalendar
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
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
  v2 = self->_visibleCalendars;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (_QWORD)v11) == 6)
        {
          v9 = v8;

          v5 = v9;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)unselectedCalendarsIgnoringFocus
{
  void *v3;

  -[NSLock lock](self->_filterLock, "lock");
  -[CUIKCalendarModel _loadVisibleCalendarsIfNeeded](self, "_loadVisibleCalendarsIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_visibleCalendars);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", self->_selectedCalendars);
  -[NSLock unlock](self->_filterLock, "unlock");
  return (NSSet *)v3;
}

- (void)setDisableFocusFiltering:(BOOL)a3
{
  if (self->_disableFocusFiltering != a3)
  {
    self->_disableFocusFiltering = a3;
    if (a3)
      -[CUIKCalendarModel _setFocusFilterMode:force:](self, "_setFocusFilterMode:force:", 0, 0);
  }
}

- (void)setSelectedCalendars:(id)a3
{
  NSLock *filterLock;
  id v5;

  filterLock = self->_filterLock;
  v5 = a3;
  -[NSLock lock](filterLock, "lock");
  LODWORD(filterLock) = -[CUIKCalendarModel _setSelectedCalendars:](self, "_setSelectedCalendars:", v5);

  -[NSLock unlock](self->_filterLock, "unlock");
  if ((_DWORD)filterLock)
    -[CUIKCalendarModel postSelectedCalendarsChanged](self, "postSelectedCalendarsChanged");
}

- (void)_focusModeConfigurationChanged:(id)a3
{
  NSSet *unselectedCalendarsForFocusMode;
  void *v5;
  _BOOL8 v6;

  -[NSLock lock](self->_filterLock, "lock", a3);
  self->_hasLoadedUnselectedCalendarsForFocusMode = 0;
  unselectedCalendarsForFocusMode = self->_unselectedCalendarsForFocusMode;
  self->_unselectedCalendarsForFocusMode = 0;

  -[CUIKCalendarModel _unselectedCalendarsForFocusMode](self, "_unselectedCalendarsForFocusMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  -[NSLock unlock](self->_filterLock, "unlock");
  -[CUIKCalendarModel setFocusFilterMode:force:](self, "setFocusFilterMode:force:", v6, 1);
}

- (void)setSelectedCalendarsAndRequestPreferenceSave:(id)a3 reason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CUIKCalendarModel setSelectedCalendars:](self, "setSelectedCalendars:", a3);
  v9 = CFSTR("CalendarModelVisibleCalendarPreferenceRequiresSavingNotificationReasonKey");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("CalendarModelVisibleCalendarPreferenceRequiresSavingNotification"), self, v7);
}

- (BOOL)_eventBelongsToCurrentIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  -[CUIKCalendarModel sourceForSelectedIdentity](self, "sourceForSelectedIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "sourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {
    v11 = objc_msgSend(v7, "isDelegate") ^ 1;
  }

  return v11;
}

- (void)updateSourceForSelectedIdentity:(id)a3 selectedCalendars:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isDelegate") & 1) == 0)
  {

    v6 = 0;
  }
  -[CUIKCalendarModel setSourceForSelectedIdentity:](self, "setSourceForSelectedIdentity:", v6);
  -[CUIKCalendarModel selectedCalendarsIgnoringFocus](self, "selectedCalendarsIgnoringFocus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CB3880];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__CUIKCalendarModel_updateSourceForSelectedIdentity_selectedCalendars___block_invoke;
    v13[3] = &unk_1E6EB66F0;
    v14 = v6;
    objc_msgSend(v9, "predicateWithBlock:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredSetUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setByAddingObjectsFromSet:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  -[CUIKCalendarModel setSelectedCalendars:](self, "setSelectedCalendars:", v8);

}

uint64_t __71__CUIKCalendarModel_updateSourceForSelectedIdentity_selectedCalendars___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

  }
  else
  {
    v7 = objc_msgSend(v4, "isDelegate");
  }

  return v7;
}

- (void)setSearchString:(id)a3
{
  id v5;
  int64_t v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  -[NSLock lock](self->_filterLock, "lock");
  if ((CalEqualStrings() & 1) != 0)
  {
    -[NSLock unlock](self->_filterLock, "unlock");
  }
  else
  {
    objc_storeStrong((id *)&self->_searchString, a3);
    -[NSLock unlock](self->_filterLock, "unlock");
    os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
    v6 = -2;
    if (self->_searchString)
      v6 = -1;
    self->_cachedFakeTodayIndex = v6;
    os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__CUIKCalendarModel_setSearchString___block_invoke;
    v7[3] = &unk_1E6EB6718;
    v8 = v5;
    -[CUIKCalendarModel _executeBlockWithOccurrenceCacheDataSources:](self, "_executeBlockWithOccurrenceCacheDataSources:", v7);

  }
}

void __37__CUIKCalendarModel_setSearchString___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v5, "searchWithTerm:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v5, "invalidate");

}

- (BOOL)selectedOccurrenceIsSearchMatch
{
  void *v2;
  BOOL v3;

  -[CUIKCalendarModel searchString](self, "searchString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setSourceForSelectedIdentity:(id)a3
{
  EKSource *sourceForSelectedIdentity;
  void *v6;
  BOOL v7;
  void *v8;
  EKSource *v9;

  v9 = (EKSource *)a3;
  -[NSLock lock](self->_filterLock, "lock");
  sourceForSelectedIdentity = self->_sourceForSelectedIdentity;
  if (sourceForSelectedIdentity != v9)
    objc_storeStrong((id *)&self->_sourceForSelectedIdentity, a3);
  -[NSLock unlock](self->_filterLock, "unlock");
  -[CUIKCalendarModel selectedOccurrence](self, "selectedOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CUIKCalendarModel _eventBelongsToCurrentIdentity:](self, "_eventBelongsToCurrentIdentity:", v6);

  if (!v7)
    -[CUIKCalendarModel setSelectedOccurrence:](self, "setSelectedOccurrence:", 0);
  if (sourceForSelectedIdentity != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("CalendarModelIdentityChangedNotification"), self);

  }
}

- (NSArray)sortedEnabledDelegates
{
  return self->_delegateSources;
}

- (BOOL)allowEventLocationPrediction
{
  return -[CUIKEventLoader allowEventLocationPrediction](self->_eventLoader, "allowEventLocationPrediction");
}

- (id)_unselectedCalendarsForFocusMode
{
  void *v3;
  void *v4;
  NSSet *v5;
  NSSet *unselectedCalendarsForFocusMode;
  NSSet *v7;

  if (_os_feature_enabled_impl())
  {
    if (!self->_hasLoadedUnselectedCalendarsForFocusMode)
    {
      v3 = (void *)MEMORY[0x1E0CAA018];
      -[CUIKCalendarModel eventStore](self, "eventStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unselectedCalendarsForFocusModeInEventStore:", v4);
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      unselectedCalendarsForFocusMode = self->_unselectedCalendarsForFocusMode;
      self->_unselectedCalendarsForFocusMode = v5;

      self->_hasLoadedUnselectedCalendarsForFocusMode = 1;
    }
    v7 = self->_unselectedCalendarsForFocusMode;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSSet)unselectedCalendarsForFocusMode
{
  void *v3;

  -[NSLock lock](self->_filterLock, "lock");
  -[CUIKCalendarModel _unselectedCalendarsForFocusMode](self, "_unselectedCalendarsForFocusMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_filterLock, "unlock");
  return (NSSet *)v3;
}

- (int64_t)readWriteCalendarCount
{
  return (int)-[EKEventStore readWriteCalendarCountForEntityType:](self->_eventStore, "readWriteCalendarCountForEntityType:", 0);
}

- (void)ensureCalendarVisibleWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEventStore calendarWithID:](self->_eventStore, "calendarWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CUIKCalendarModel selectedCalendars](self, "selectedCalendars");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ensuring a certain calendar %@ is visible"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSSet setByAddingObject:](self->_selectedCalendars, "setByAddingObject:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKCalendarModel setSelectedCalendarsAndRequestPreferenceSave:reason:](self, "setSelectedCalendarsAndRequestPreferenceSave:reason:", v9, v8);

    }
    objc_msgSend(v5, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](self, "updateSourceForSelectedIdentity:selectedCalendars:", v10, 0);

    if (-[CUIKCalendarModel focusFilterMode](self, "focusFilterMode") == 1)
    {
      -[CUIKCalendarModel unselectedCalendarsForFocusMode](self, "unselectedCalendarsForFocusMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v5);

      if (v12)
      {
        +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "calendarIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v17 = v14;
          v18 = 2114;
          v19 = v15;
          _os_log_impl(&dword_1B8A6A000, v13, OS_LOG_TYPE_INFO, "Disabling focus filter to ensure that calendar %@ (%{public}@) is visible", buf, 0x16u);

        }
        -[CUIKCalendarModel setFocusFilterMode:](self, "setFocusFilterMode:", 2);
      }
    }
  }

}

- (BOOL)isCalendarVisibleWithID:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[EKEventStore calendarWithID:](self->_eventStore, "calendarWithID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel selectedCalendars](self, "selectedCalendars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)reminderCalendar
{
  void *v3;
  void *v4;

  -[CUIKCalendarModel sourceForSelectedIdentity](self, "sourceForSelectedIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[EKEventStore reminderIntegrationCalendar](self->_eventStore, "reminderIntegrationCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)refreshAccountListIfNeeded:(BOOL)a3
{
  return (id)-[EKEventStore refreshFolderListsIfNecessary:](self->_eventStore, "refreshFolderListsIfNecessary:", a3);
}

- (id)refreshCalendarDataIfNeeded:(BOOL)a3
{
  return (id)-[EKEventStore refreshSourcesIfNecessary:](self->_eventStore, "refreshSourcesIfNecessary:", a3);
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CalendarModelCollapsedSectionIdentifiersPreferenceRequiresSavingNotification"), self, 0);
}

- (void)setSelectedDateChangesDelayedUntilAfterTransition:(BOOL)a3
{
  EKCalendarDate *suspendedSelectedDate;

  if (self->_suspendSelectedDateChanges != a3)
  {
    self->_suspendSelectedDateChanges = a3;
    if (!a3)
    {
      if (self->_suspendedSelectedDate)
        -[CUIKCalendarModel setSelectedDate:](self, "setSelectedDate:");
    }
    suspendedSelectedDate = self->_suspendedSelectedDate;
    self->_suspendedSelectedDate = 0;

  }
}

- (void)updateSelectedDateTimeZone
{
  os_unfair_lock_s *p_selectedDateLock;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  EKCalendarDate *v10;
  EKCalendarDate *selectedDate;

  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate timeZone](self->_selectedDate, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToTimeZone:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0D0C420];
    -[EKCalendarDate date](self->_selectedDate, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarDateWithDate:timeZone:", v8, v9);
    v10 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
    selectedDate = self->_selectedDate;
    self->_selectedDate = v10;

  }
  os_unfair_lock_unlock(p_selectedDateLock);
}

- (void)addOccurrenceAwaitingRefresh:(id)a3
{
  -[CUIKEventLoader addOccurrenceAwaitingRefresh:](self->_eventLoader, "addOccurrenceAwaitingRefresh:", a3);
}

- (void)addOccurrenceAwaitingDeletion:(id)a3
{
  -[CUIKEventLoader addOccurrenceAwaitingDeletion:](self->_eventLoader, "addOccurrenceAwaitingDeletion:", a3);
}

- (id)selectedDateOccurrences:(BOOL)a3 loadIsComplete:(BOOL *)a4
{
  _BOOL8 v5;
  os_unfair_lock_s *p_selectedDateLock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  -[EKCalendarDate dayComponents](self->_selectedDate, "dayComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_selectedDateLock);
  objc_msgSend(v8, "CalDateComponentsForDateOnly");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "CalDateComponentsForEndOfDay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:](self->_eventLoader, "occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:", v11, v12, 1, v5, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "occurrences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)occurrencesForStartDay:(id)a3 endDay:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  objc_msgSend(a3, "CalDateComponentsForDateOnly");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CalDateComponentsForEndOfDay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventStore timeZone](self->_eventStore, "timeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  EKDateComponentsGetDate();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventStore timeZone](self->_eventStore, "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  EKDateComponentsGetDate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](self, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", v14, v16, v7, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)occurrencesForDay:(id)a3 waitForLoad:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  objc_msgSend(a3, "CalDateComponentsForDateOnly");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CalDateComponentsForEndOfDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](self, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", v8, v9, 1, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)_tomorrow
{
  NSCalendar *calendar;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  calendar = self->_calendar;
  CUIKTodayDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](calendar, "components:fromDate:", 30, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setDay:", 1);
  -[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  return v10;
}

- (id)closestOccurrenceToTomorrowForEventObjectID:(id)a3
{
  EKEventStore *eventStore;
  id v5;
  void *v6;

  eventStore = self->_eventStore;
  v5 = a3;
  -[CUIKCalendarModel _tomorrow](self, "_tomorrow");
  -[EKEventStore closestCachedOccurrenceToDate:forEventObjectID:prefersForwardSearch:](eventStore, "closestCachedOccurrenceToDate:forEventObjectID:prefersForwardSearch:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDesiredPaddingDays:(unsigned int)a3
{
  -[CUIKEventLoader setPadding:](self->_eventLoader, "setPadding:", *(_QWORD *)&a3);
}

- (void)setComponentForExpandingPadding:(unint64_t)a3
{
  -[CUIKEventLoader setComponentForExpandingPadding:](self->_eventLoader, "setComponentForExpandingPadding:", a3);
}

- (BOOL)currentlyLocked
{
  return self->_modelLocked;
}

- (void)_occurrenceCacheChangedNotificationHandler
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    -[CUIKCalendarModel _occurrenceCacheChanged](self, "_occurrenceCacheChanged");
  else
    -[CUIKCalendarModel performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__occurrenceCacheChanged, 0, 0);
}

- (int64_t)numberOfCachedOccurrencesInSection:(int64_t)a3
{
  return -[CUIKCalendarModel numberOfCachedOccurrencesInSection:usingFilter:](self, "numberOfCachedOccurrencesInSection:usingFilter:", a3, 0);
}

- (id)cachedOccurrenceAtIndexPath:(id)a3
{
  return -[CUIKCalendarModel cachedOccurrenceAtIndexPath:usingFilter:](self, "cachedOccurrenceAtIndexPath:usingFilter:", a3, 0);
}

- (id)indexPathsForOccurrence:(id)a3 usingFilter:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "indexPathsForOccurrence:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CUIKCalendarModel _cachedFakeTodayIndexLocked](self, "_cachedFakeTodayIndexLocked");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v15, "length") != 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIKCalendarModel.m"), 1237, CFSTR("Invalid index path passed to -[CUIKCalendarModel cachedOccurrenceAtIndexPath:usingFilter:]: %@"), v15);

        }
        v16 = objc_msgSend(v15, "indexAtPosition:", 0);
        v17 = objc_msgSend(v15, "indexAtPosition:", 1);
        if (v8 < 0 || v16 < v8)
          v19 = v16;
        else
          v19 = v16 + 1;
        v29[0] = v19;
        v29[1] = v17;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v29, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v20);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  return v9;
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3 usingFilter:(BOOL)a4
{
  return -[CUIKCalendarModel _sectionForCachedOccurrencesOnDate:sectionExistsForDay:usingFilter:](self, "_sectionForCachedOccurrencesOnDate:sectionExistsForDay:usingFilter:", a3, 0, a4);
}

- (void)fetchCachedDaysInBackgroundStartingFromSection:(int64_t)a3 usingFilter:(BOOL)a4
{
  id v5;

  -[CUIKCalendarModel _dataSourceUsingFilter:](self, "_dataSourceUsingFilter:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchDaysInBackgroundStartingFromSection:", a3);

}

- (id)cachedOccurrencesForSection:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = -[CUIKCalendarModel numberOfCachedOccurrencesInSection:usingFilter:](self, "numberOfCachedOccurrencesInSection:usingFilter:", a3, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v12[0] = a3;
      v12[1] = i;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v12, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKCalendarModel cachedOccurrenceAtIndexPath:usingFilter:](self, "cachedOccurrenceAtIndexPath:usingFilter:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v6, "addObject:", v9);

    }
  }
  if (objc_msgSend(v6, "count"))
    v10 = v6;
  else
    v10 = 0;

  return v10;
}

- (void)_searchResultsAvailable:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("CalendarModelSearchResultsAvailable"), self, v6);
}

void __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "eventStore");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deselectedCalendarIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "calendarIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      if ((v9 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    }
  }

}

- (void)_checkSources
{
  int64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CUIKCalendarModel countSourcesWithErrors](self, "countSourcesWithErrors"))
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("CalendarModelAccountErrorCountChangedNotification"), self);
  v3 = -[CUIKCalendarModel countAccountsInInitialSync](self, "countAccountsInInitialSync");
  if (self->_initialAccountSyncCount != v3)
  {
    self->_initialAccountSyncCount = v3;
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("CalendarModelAccountsInInitialSyncCountChangedNotification"), self);
  }
  objc_msgSend((id)objc_opt_class(), "sortedEnabledDelegateSourcesFromStore:", self->_eventStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToArray:", self->_delegateSources) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_delegateSources, v4);
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("CalendarModelDelegatesChangedNotification"), self);
  }

}

uint64_t __59__CUIKCalendarModel_sortedEnabledDelegateSourcesFromStore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

uint64_t __59__CUIKCalendarModel_sortedEnabledDelegateSourcesFromStore___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  CUIKDisplayedTitleForSource(a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKDisplayedTitleForSource(v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (void)simulateFirstLoadFinished
{
  if (!-[CUIKEventLoader firstLoadBegan](self->_eventLoader, "firstLoadBegan"))
    -[CUIKCalendarModel _finishedFirstLoad](self, "_finishedFirstLoad");
}

- (void)_notificationBlacklisted
{
  id v2;

  -[CUIKCalendarModel _notificationMonitor](self, "_notificationMonitor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attemptReloadSynchronously:", 1);

}

- (void)_eventStoreChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9F80]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 == 2)
  {
    -[CUIKCalendarModel _checkSources](self, "_checkSources");
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA9F90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = 0;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v8);
            v15 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "entityType", (_QWORD)v19);
            if (v15 == 1)
            {
              v12 = 1;
            }
            else if (v15 == 6)
            {
              v11 = 1;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }
      else
      {
        v11 = 0;
        v12 = 0;
      }

      v16 = v11 & 1;
      v17 = v12 & 1;
    }
    else
    {
      v16 = 1;
      v17 = 1;
    }
    -[CUIKCalendarModel _processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:](self, "_processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:", 0, v17, v17, v16, (_QWORD)v19);
    -[CUIKCalendarModel _notificationMonitor](self, "_notificationMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attemptReload");

  }
}

- (void)_ignoredErrorsChanged
{
  id v3;

  if (-[CUIKCalendarModel countSourcesWithErrors](self, "countSourcesWithErrors"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CalendarModelAccountErrorCountChangedNotification"), self);

  }
}

- (void)_occurrenceCacheChanged
{
  -[CUIKCalendarModel _processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:](self, "_processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:", 1, 0, 0, 0);
}

- (void)updateAfterAppResume
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CUIKInvalidateTodayAndDetermineIfChanged());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("CalendarModelSignificantTimeChangeNotificationDayChangedKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("CalendarModelSignificantTimeChangeNotification"), self, v5);

  -[CUIKEventLoader loadIfNeeded](self->_eventLoader, "loadIfNeeded");
}

- (void)prepareForAppSuspend
{
  -[CUIKEventLoader cancelAllLoads](self->_eventLoader, "cancelAllLoads");
}

- (void)_tzSupportTodayRolledOver
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("CalendarModelSignificantTimeChangeNotificationDayChangedKey");
  v6[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("CalendarModelSignificantTimeChangeNotification"), self, v4);

  -[CUIKCalendarModel _reloadEventsIfTodayChanged](self, "_reloadEventsIfTodayChanged");
}

- (void)_significantTimeChange
{
  CFTimeZoneRef v3;
  void *v4;

  v3 = CFTimeZoneCopySystem();
  CalSetSystemTimeZone();
  CFRelease(v3);
  CUIKInvalidateToday();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CalendarModelSignificantTimeChangeNotification"), self);

  -[CUIKCalendarModel _reloadEventsIfTodayChanged](self, "_reloadEventsIfTodayChanged");
}

- (void)_reloadEventsIfTodayChanged
{
  uint64_t v3;
  NSDate *lastKnownToday;
  BOOL v5;
  void *v6;
  id obj;

  CUIKTodayDate();
  v3 = objc_claimAutoreleasedReturnValue();
  lastKnownToday = self->_lastKnownToday;
  obj = (id)v3;
  if (!lastKnownToday || (v5 = -[NSDate isEqualToDate:](lastKnownToday, "isEqualToDate:"), v6 = obj, !v5))
  {
    objc_storeStrong((id *)&self->_lastKnownToday, obj);
    -[CUIKEventLoader dateChanged](self->_eventLoader, "dateChanged");
    -[CUIKCalendarModel _occurrenceCacheChanged](self, "_occurrenceCacheChanged");
    v6 = obj;
  }

}

- (void)_sceneEnteredBackground:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel sceneIdentifier](self, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    self->_modelLocked = 1;

}

- (void)_localeChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKCalendarModel calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

- (void)_timeZoneChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore setTimeZone:](self->_eventStore, "setTimeZone:", v4);

  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v5);

  if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "setDefaultTimeZone:", v6);

  }
  -[CUIKEventLoader timeZoneChanged](self->_eventLoader, "timeZoneChanged");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("CalendarModelTimeZoneChangedNotification"), self);

  -[CUIKCalendarModel _processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:](self, "_processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:", 0, 0, 0, 0);
}

- (void)_systemWake
{
  -[_EKNotificationMonitor adjust](self->_notificationMonitor, "adjust");
}

- (void)setSelectedOccurrences:(id)a3
{
  -[CUIKCalendarModel setSelectedOccurrences:forceChange:](self, "setSelectedOccurrences:forceChange:", a3, 0);
}

- (void)setSelectedOccurrences:(id)a3 forceChange:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  NSMutableArray *v11;
  NSMutableArray *selectedOccurrences;
  void *v13;
  void *v14;
  void *v15;
  CUIKPasteboardManager *pasteboardManager;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  v7 = v6;
  if (!self->_modelLocked)
  {
    v19 = v6;
    v8 = objc_msgSend(v6, "count");
    v7 = v19;
    if (v8 || (v9 = -[NSMutableArray count](self->_selectedOccurrences, "count"), v7 = v19, v9))
    {
      if (a4 || (v10 = objc_msgSend(v7, "isEqualToArray:", self->_selectedOccurrences), v7 = v19, (v10 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
        v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        selectedOccurrences = self->_selectedOccurrences;
        self->_selectedOccurrences = v11;

        if (-[NSMutableArray count](self->_selectedOccurrences, "count") == 1)
        {
          -[NSMutableArray firstObject](self->_selectedOccurrences, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "calendar");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[NSMutableArray firstObject](self->_selectedOccurrences, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isNew") & 1) == 0)
            {
              pasteboardManager = self->_pasteboardManager;
              objc_msgSend(v15, "calendar");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[CUIKPasteboardManager setCalendarForPaste:](pasteboardManager, "setCalendarForPaste:", v17);

            }
          }
        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "postNotificationName:object:", CFSTR("CalendarModelSelectedOccurrencesChangedNotification"), self);

        v7 = v19;
      }
    }
  }

}

- (void)selectOccurrences:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 |= -[CUIKCalendarModel _selectOccurrence:notify:](self, "_selectOccurrence:notify:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("CalendarModelSelectedOccurrencesChangedNotification"), self);

    }
  }

}

- (void)selectOccurrence:(id)a3
{
  -[CUIKCalendarModel _selectOccurrence:notify:](self, "_selectOccurrence:notify:", a3, 1);
}

- (BOOL)_selectOccurrence:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  char v8;
  NSMutableArray *selectedOccurrences;
  void *v10;
  void *v11;
  CUIKPasteboardManager *pasteboardManager;
  void *v13;
  NSMutableArray *v15;
  NSMutableArray *v16;

  v4 = a4;
  v6 = a3;
  if (self->_modelLocked)
  {
    v7 = 0;
    goto LABEL_9;
  }
  v8 = -[NSMutableArray containsObject:](self->_selectedOccurrences, "containsObject:", v6);
  if ((v8 & 1) == 0)
  {
    selectedOccurrences = self->_selectedOccurrences;
    if (selectedOccurrences)
    {
      -[NSMutableArray addObject:](selectedOccurrences, "addObject:", v6);
      if (!v4)
        goto LABEL_7;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_selectedOccurrences;
    self->_selectedOccurrences = v15;

    if (v4)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("CalendarModelSelectedOccurrencesChangedNotification"), self);

    }
  }
LABEL_7:
  v7 = v8 ^ 1;
  objc_msgSend(v6, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    pasteboardManager = self->_pasteboardManager;
    objc_msgSend(v6, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKPasteboardManager setCalendarForPaste:](pasteboardManager, "setCalendarForPaste:", v13);

  }
LABEL_9:

  return v7;
}

- (void)deselectOccurrences:(id)a3
{
  -[CUIKCalendarModel _deselectOccurrences:notify:](self, "_deselectOccurrences:notify:", a3, 1);
}

- (void)deselectOccurrence:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKCalendarModel deselectOccurrences:](self, "deselectOccurrences:", v6, v7, v8);
}

- (void)_deselectOccurrence:(id)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKCalendarModel _deselectOccurrences:notify:](self, "_deselectOccurrences:notify:", v8, v4, v9, v10);
}

- (void)_deselectOccurrences:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self->_modelLocked)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (-[NSMutableArray containsObject:](self->_selectedOccurrences, "containsObject:", v13))
          {
            -[NSMutableArray removeObject:](self->_selectedOccurrences, "removeObject:", v13);
            v10 = 1;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
      if ((v4 & v10) == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "postNotificationName:object:", CFSTR("CalendarModelSelectedOccurrencesChangedNotification"), self);

      }
    }
  }

}

- (void)setShowDayAsList:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a3;
  if (CUIKShouldSaveStateInPreferences())
  {
    +[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowListView:", v3);
  }
  else
  {
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "showDayAsList");

    if (v6 == v3)
      return;
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowDayAsList:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("CalendarModelDayListDisplaySettingChangedNotification"), self);
  }

}

- (int64_t)numDaysToShow
{
  void *v3;
  int64_t v4;

  if (CUIKShouldSaveStateInPreferences())
    +[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences");
  else
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numDaysToShow");

  return v4;
}

- (void)setNumDaysToShow:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (CUIKShouldSaveStateInPreferences())
  {
    +[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumDaysToShow:", a3);
  }
  else
  {
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numDaysToShow");

    if (v6 == a3)
      return;
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumDaysToShow:", a3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("CalendarModelTwoDayDisplaySettingChangedNotification"), self);
  }

}

- (void)setShowMonthAsDivided:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a3;
  if (CUIKShouldSaveStateInPreferences())
  {
    +[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowMonthDividedListView:", v3);
  }
  else
  {
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "showMonthAsDivided");

    if (v6 == v3)
      return;
    -[CUIKCalendarModel persistedSceneState](self, "persistedSceneState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowMonthAsDivided:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("CalendarModelMonthDividedDisplaySettingChangedNotification"), self);
  }

}

- (BOOL)removeEvent:(id)a3 withSpan:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CUIKUndoManager undoableEditor](self->_undoManager, "undoableEditor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "deleteEvent:span:error:", v8, a4, a5);

    if (v10)
    {
      LOBYTE(v10) = 1;
      if (!*a5)
        goto LABEL_9;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CUIKCalendarModel removeEvent:withSpan:error:].cold.1((uint64_t *)a5, v11);

LABEL_9:
  return v10;
}

- (BOOL)invitationBearingStoresExistForEvents
{
  int64_t invitationBearingStoresExist;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  invitationBearingStoresExist = self->_invitationBearingStoresExist;
  if (invitationBearingStoresExist == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_invitationBearingStoresExist = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[EKEventStore eventSources](self->_eventStore, "eventSources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (!v5)
      goto LABEL_24;
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEnabled"))
        {
          objc_msgSend(v9, "constraints");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "allowsEvents"))
          {
            objc_msgSend(v9, "constraints");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "supportsIncomingInvitations");

            if (!v12)
              continue;
            v21 = 0u;
            v22 = 0u;
            v19 = 0u;
            v20 = 0u;
            objc_msgSend(v9, "calendarsForEntityType:", 0, 0);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v20;
              while (2)
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v20 != v15)
                    objc_enumerationMutation(v10);
                  v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                  if ((objc_msgSend(v17, "allowedEntityTypes") & 1) != 0 && (objc_msgSend(v17, "isHidden") & 1) == 0)
                  {
                    self->_invitationBearingStoresExist = 1;
                    goto LABEL_21;
                  }
                }
                v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                if (v14)
                  continue;
                break;
              }
            }
          }
LABEL_21:

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (!v6)
      {
LABEL_24:

        invitationBearingStoresExist = self->_invitationBearingStoresExist;
        return invitationBearingStoresExist != 0;
      }
    }
  }
  return invitationBearingStoresExist != 0;
}

- (void)_notificationsExpired:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CalendarModelNotificationsChangedNotification"), self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CalendarModelNotificationCountsChangedNotification"), self);

}

- (unint64_t)allEventNotificationsCount
{
  void *v2;
  unint64_t v3;

  -[CUIKCalendarModel _notificationMonitor](self, "_notificationMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationCount");

  return v3;
}

- (id)eventNotificationReferencesForCurrentIdentity
{
  return -[CUIKCalendarModel _eventNotificationsForCurrentIdentityIgnoringFilter:](self, "_eventNotificationsForCurrentIdentityIgnoringFilter:", 0);
}

- (unint64_t)eventNotificationsForCurrentIdentityIgnoringFilterCount
{
  return -[CUIKCalendarModel _eventNotificationCountForCurrentIdentityIgnoringFilter:](self, "_eventNotificationCountForCurrentIdentityIgnoringFilter:", 1);
}

- (id)eventNotificationReferencesForCurrentIdentityIgnoringFilter
{
  return -[CUIKCalendarModel _eventNotificationsForCurrentIdentityIgnoringFilter:](self, "_eventNotificationsForCurrentIdentityIgnoringFilter:", 1);
}

- (id)eventNotificationReferencesForIdentity:(id)a3
{
  return -[CUIKCalendarModel eventNotificationReferencesForIdentity:ignoringFilter:](self, "eventNotificationReferencesForIdentity:ignoringFilter:", a3, 0);
}

+ (void)temporarilyIgnoreInvalidCredentialsErrorForSource:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "lastSyncError") == 2)
  {
    objc_msgSend(v3, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastSyncEndDate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      v7 = (void *)_objectsWithIgnoredErrors;
      if (!_objectsWithIgnoredErrors)
      {
        v8 = objc_opt_new();
        v9 = (void *)_objectsWithIgnoredErrors;
        _objectsWithIgnoredErrors = v8;

        v7 = (void *)_objectsWithIgnoredErrors;
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);
      os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("CalendarModelIgnoredErrorsChangedNotification"), 0);
    }
    else
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412802;
        v12 = v3;
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = v6;
        _os_log_error_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_ERROR, "Can't ignore invalid error for source (%@) because it either has no object ID (%@) or no sync end date (%@)", (uint8_t *)&v11, 0x20u);
      }
    }

  }
}

+ (void)temporarilyIgnoreInsecureConnectionErrorsForCalendars:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138412802;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "lastSyncError", v17) == 7)
        {
          objc_msgSend(v10, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastSyncEndDate");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (v14)
          {
            +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v23 = v10;
              v24 = 2112;
              v25 = v11;
              v26 = 2112;
              v27 = v13;
              _os_log_error_impl(&dword_1B8A6A000, v15, OS_LOG_TYPE_ERROR, "Can't ignore error for calendar (%@) because it either has no object ID (%@) or no sync end date (%@)", buf, 0x20u);
            }

          }
          else
          {
            if (!v7)
              v7 = (void *)objc_opt_new();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v11);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v6);
    if (v7)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      if (_objectsWithIgnoredErrors)
        objc_msgSend((id)_objectsWithIgnoredErrors, "addEntriesFromDictionary:", v7);
      else
        objc_storeStrong((id *)&_objectsWithIgnoredErrors, v7);
      os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("CalendarModelIgnoredErrorsChangedNotification"), 0);

    }
  }

}

- (void)addRespondedNotificationObjectID:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CAA1A8], "addBlacklistedNotificationObjectID:", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CalendarModelBlacklistedNotification"), self);

}

- (void)setCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (CUIKPasteboardManager)pasteboardManager
{
  return self->_pasteboardManager;
}

- (CUIKUndoManager)undoManager
{
  return self->_undoManager;
}

- (unint64_t)firstVisibleSecond
{
  return self->_firstVisibleSecond;
}

- (void)setFirstVisibleSecond:(unint64_t)a3
{
  self->_firstVisibleSecond = a3;
}

- (NSSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (void)setSortedEnabledDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_sortedEnabledDelegates, a3);
}

- (BOOL)autoStartNotificationMonitor
{
  return self->_autoStartNotificationMonitor;
}

- (CUIKIPendingReminderTracker)pendingReminderTracker
{
  return self->_pendingReminderTracker;
}

- (void)setPendingReminderTracker:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReminderTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReminderTracker, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sortedEnabledDelegates, 0);
  objc_storeStrong((id *)&self->_sourceForSelectedIdentity, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_pasteboardManager, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_selectedCalendars, 0);
  objc_storeStrong((id *)&self->_cachedHiddenAppsHash, 0);
  objc_storeStrong((id *)&self->_lastKnownToday, 0);
  objc_storeStrong((id *)&self->_selectedOccurrences, 0);
  objc_storeStrong((id *)&self->_persistedSceneState, 0);
  objc_storeStrong((id *)&self->_suspendedSelectedDate, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_displayableAccountErrorCounts, 0);
  objc_storeStrong((id *)&self->_occurrenceCacheFilteredDataSource, 0);
  objc_storeStrong((id *)&self->_occurrenceCacheDataSource, 0);
  objc_storeStrong((id *)&self->_notificationMonitor, 0);
  objc_storeStrong((id *)&self->_delegateSources, 0);
  objc_storeStrong((id *)&self->_unselectedCalendarsForFocusMode, 0);
  objc_storeStrong((id *)&self->_visibleCalendars, 0);
  objc_storeStrong((id *)&self->_filterLock, 0);
  objc_storeStrong((id *)&self->_eventLoader, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)setSelectedDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, a2, a3, "Set selected date to: [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setMaxCachedDays:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, a2, a3, "Setting max cached days to: [%lu]", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)removeEvent:(uint64_t *)a1 withSpan:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Remove failed: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
