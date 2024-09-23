@implementation CUIKOccurrenceCacheSearchDataSource

- (CUIKOccurrenceCacheSearchDataSource)initWithEventStore:(id)a3 calendars:(id)a4
{
  CUIKOccurrenceCacheSearchDataSource *v4;
  CUIKOccurrenceCacheSearchDataSource *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *processingCachedDays;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIKOccurrenceCacheSearchDataSource;
  v4 = -[CUIKOccurrenceCacheDataSource initWithEventStore:calendars:](&v9, sel_initWithEventStore_calendars_, a3, a4);
  v5 = v4;
  if (v4)
  {
    pthread_mutex_init(&v4->_resultsLock, 0);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    processingCachedDays = v5->_processingCachedDays;
    v5->_processingCachedDays = v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_resultsLock);
  v3.receiver = self;
  v3.super_class = (Class)CUIKOccurrenceCacheSearchDataSource;
  -[CUIKOccurrenceCacheSearchDataSource dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  _opaque_pthread_mutex_t *p_resultsLock;
  int v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  p_resultsLock = &self->_resultsLock;
  pthread_mutex_lock(&self->_resultsLock);
  v4 = self->_searchSeed + 1;
  self->_searchSeed = v4;
  pthread_mutex_unlock(p_resultsLock);
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v4;
    _os_log_impl(&dword_1B8A6A000, v5, OS_LOG_TYPE_DEFAULT, "Search %i: -[OccurrenceCacheSearchDataSource invalidate]", buf, 8u);
  }

  -[CUIKOccurrenceCacheSearchDataSource stopSearching](self, "stopSearching");
  v6.receiver = self;
  v6.super_class = (Class)CUIKOccurrenceCacheSearchDataSource;
  -[CUIKOccurrenceCacheDataSource invalidateCachedOccurrences](&v6, sel_invalidateCachedOccurrences);
}

- (void)stopSearching
{
  EKSpotlightSearch *narrowSearch;
  EKSpotlightSearch *distantFutureSearch;
  EKSpotlightSearch *distantPastSearch;
  NSString *searchTerm;

  -[EKSpotlightSearch cancel](self->_narrowSearch, "cancel");
  -[EKSpotlightSearch cancel](self->_distantFutureSearch, "cancel");
  -[EKSpotlightSearch cancel](self->_distantPastSearch, "cancel");
  narrowSearch = self->_narrowSearch;
  self->_narrowSearch = 0;

  distantFutureSearch = self->_distantFutureSearch;
  self->_distantFutureSearch = 0;

  distantPastSearch = self->_distantPastSearch;
  self->_distantPastSearch = 0;

  searchTerm = self->_searchTerm;
  self->_searchTerm = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedDays, 0);
  objc_storeStrong((id *)&self->_processingCachedDays, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_distantPastSearch, 0);
  objc_storeStrong((id *)&self->_distantFutureSearch, 0);
  objc_storeStrong((id *)&self->_narrowSearch, 0);
}

- (BOOL)supportsInvitations
{
  return 0;
}

- (BOOL)supportsFakeTodaySection
{
  return 0;
}

- (void)invalidateCachedOccurrences
{
  NSString *v3;
  NSString *v4;

  v4 = self->_searchTerm;
  -[CUIKOccurrenceCacheSearchDataSource stopSearching](self, "stopSearching");
  v3 = v4;
  if (v4)
  {
    -[CUIKOccurrenceCacheSearchDataSource searchWithTerm:](self, "searchWithTerm:", v4);
    v3 = v4;
  }

}

- (void)_updateCachedDays
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CUIKOccurrenceCacheSearchDataSource__updateCachedDays__block_invoke;
  block[3] = &unk_1E6EB60F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__CUIKOccurrenceCacheSearchDataSource__updateCachedDays__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 88));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 161) || (v6 = objc_msgSend(v2, "count"), v4 = *(_QWORD *)(a1 + 32), !v6))
  {
    v5 = 0;
  }
  else
  {
    v5 = 1;
    *(_BYTE *)(v4 + 161) = 1;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(unsigned __int8 *)(v4 + 160);
  *(_BYTE *)(v4 + 160) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 88));
  if (v7 || !objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedDays:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v12 = CFSTR("scrollToToday");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("CalendarDataSourceSearchResultsAvailable"), v9, v11);

  }
}

- (void)searchWithTerm:(id)a3
{
  NSArray *v6;
  NSArray *sortedDays;
  NSObject *v8;
  NSString **p_searchTerm;
  int64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  EKSpotlightSearch *v17;
  EKSpotlightSearch *distantPastSearch;
  EKSpotlightSearch *v19;
  EKSpotlightSearch *distantFutureSearch;
  void *v21;
  EKEventStore *eventStore;
  EKSpotlightSearch *v23;
  EKSpotlightSearch *narrowSearch;
  EKSpotlightSearch *v25;
  EKSpotlightSearch *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  _QWORD v36[4];
  EKSpotlightSearch *v37;
  uint8_t *v38;
  int v39;
  _QWORD v40[12];
  id v41;
  int v42;
  _QWORD v43[10];
  id v44;
  int v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[3];
  char v59;
  _QWORD v60[3];
  char v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD aBlock[6];
  id v67;
  int v68;
  id location;
  _QWORD v70[3];
  char v71;
  uint8_t buf[8];
  __int128 v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIKOccurrenceCacheSearchDataSource.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("term != nil"));

  }
  -[EKSpotlightSearch cancel](self->_narrowSearch, "cancel");
  -[EKSpotlightSearch cancel](self->_distantFutureSearch, "cancel");
  -[EKSpotlightSearch cancel](self->_distantPastSearch, "cancel");
  pthread_mutex_lock(&self->_resultsLock);
  v34 = self->_searchSeed + 1;
  self->_searchSeed = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedDays = self->_sortedDays;
  self->_sortedDays = v6;

  self->_sortedDaysUpdated = 1;
  self->_scrolledToToday = 0;
  pthread_mutex_unlock(&self->_resultsLock);
  ICSRedactString();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v34;
    LOWORD(v73) = 2114;
    *(_QWORD *)((char *)&v73 + 2) = v32;
    _os_log_impl(&dword_1B8A6A000, v8, OS_LOG_TYPE_DEFAULT, "Search %i: -[OccurrenceCacheSearchDataSource searchWithTerm:\"%{public}@\"]", buf, 0x12u);
  }

  p_searchTerm = &self->_searchTerm;
  objc_storeStrong((id *)&self->_searchTerm, a3);
  if (objc_msgSend(v35, "length"))
  {
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v71 = 1;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke;
    aBlock[3] = &unk_1E6EB7568;
    objc_copyWeak(&v67, &location);
    v68 = v34;
    aBlock[4] = self;
    aBlock[5] = v70;
    v33 = _Block_copy(aBlock);
    v10 = -[NSString UTF8String](*p_searchTerm, "UTF8String");
    if (v10)
      v10 = strlen((const char *)v10);
    v11 = v10 < 3;
    CUIKTodayComponents();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKCalendar();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", objc_msgSend(v12, "era"), objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day") - 7, 0, 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", objc_msgSend(v12, "era"), objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day") + 14, 0, 0, 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAA150], "queryStringForSearchTerm:matchingTypes:fromStartDate:toEndDate:", *p_searchTerm, v11, v14, v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAA150], "queryStringForSearchTerm:matchingTypes:fromStartDate:toEndDate:", *p_searchTerm, v11, v15, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0CAA150], "queryStringForSearchTerm:matchingTypes:fromStartDate:toEndDate:", *p_searchTerm, v11, 0, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v73 = buf;
    *((_QWORD *)&v73 + 1) = 0x3032000000;
    v74 = __Block_byref_object_copy__11;
    v75 = __Block_byref_object_dispose__11;
    v76 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__11;
    v64[4] = __Block_byref_object_dispose__11;
    v65 = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__11;
    v62[4] = __Block_byref_object_dispose__11;
    v63 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    v61 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v59 = 0;
    v52 = 0;
    v53 = (id *)&v52;
    v54 = 0x3042000000;
    v55 = __Block_byref_object_copy__33;
    v56 = __Block_byref_object_dispose__34;
    v57 = 0;
    v46 = 0;
    v47 = (id *)&v46;
    v48 = 0x3042000000;
    v49 = __Block_byref_object_copy__33;
    v50 = __Block_byref_object_dispose__34;
    v51 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_35;
    v43[3] = &unk_1E6EB7590;
    objc_copyWeak(&v44, &location);
    v43[4] = &v46;
    v43[5] = v60;
    v45 = v34;
    v43[6] = v64;
    v43[7] = buf;
    v43[8] = v58;
    v43[9] = v62;
    v16 = _Block_copy(v43);
    objc_msgSend(MEMORY[0x1E0CAA150], "searchWithCSQuery:inStore:inCalendars:resultHandler:completionHandler:", v31, self->super._eventStore, 0, v33, v16);
    v17 = (EKSpotlightSearch *)objc_claimAutoreleasedReturnValue();
    distantPastSearch = self->_distantPastSearch;
    self->_distantPastSearch = v17;

    objc_msgSend(MEMORY[0x1E0CAA150], "searchWithCSQuery:inStore:inCalendars:resultHandler:completionHandler:", v30, self->super._eventStore, 0, v33, v16);
    v19 = (EKSpotlightSearch *)objc_claimAutoreleasedReturnValue();
    distantFutureSearch = self->_distantFutureSearch;
    self->_distantFutureSearch = v19;

    objc_storeWeak(v53 + 5, self->_distantPastSearch);
    objc_storeWeak(v47 + 5, self->_distantFutureSearch);
    v21 = (void *)MEMORY[0x1E0CAA150];
    eventStore = self->super._eventStore;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_38;
    v40[3] = &unk_1E6EB75E0;
    objc_copyWeak(&v41, &location);
    v42 = v34;
    v40[6] = v60;
    v40[7] = v58;
    v40[4] = self;
    v40[5] = buf;
    v40[8] = &v46;
    v40[9] = v64;
    v40[10] = &v52;
    v40[11] = v62;
    objc_msgSend(v21, "searchWithCSQuery:inStore:inCalendars:resultHandler:completionHandler:", v29, eventStore, 0, v33, v40);
    v23 = (EKSpotlightSearch *)objc_claimAutoreleasedReturnValue();
    narrowSearch = self->_narrowSearch;
    self->_narrowSearch = v23;

    v25 = self->_narrowSearch;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_41;
    v36[3] = &unk_1E6EB75B8;
    v39 = v34;
    v38 = buf;
    v26 = v25;
    v37 = v26;
    -[CUIKOccurrenceCacheSearchDataSource _runBlock:](self, "_runBlock:", v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v44);
    _Block_object_dispose(&v46, 8);
    objc_destroyWeak(&v51);
    _Block_object_dispose(&v52, 8);
    objc_destroyWeak(&v57);
    _Block_object_dispose(v58, 8);
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
    _Block_object_dispose(v70, 8);
  }
  else
  {
    -[CUIKOccurrenceCacheSearchDataSource _updateCachedDays](self, "_updateCachedDays");
  }

}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  char *WeakRetained;
  NSObject *v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  pthread_mutex_t *v41;
  uint64_t v42;
  id v43;
  id v44;
  char *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  int v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  int v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 67109376;
      v67 = v7;
      v68 = 2048;
      v69 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_DEFAULT, "Search %i: Spotlight handler called with matches: %lu", buf, 0x12u);
    }

    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 88));
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 164) == *(_DWORD *)(a1 + 56))
    {
      v41 = (pthread_mutex_t *)(WeakRetained + 88);
      v42 = a1;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        objc_msgSend(*((id *)WeakRetained + 10), "removeAllObjects", v41);
      v51 = *((id *)WeakRetained + 10);
      CUIKCalendar();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v43 = v4;
      v9 = v4;
      v48 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v48)
      {
        v47 = *(_QWORD *)v61;
        v44 = v9;
        v45 = WeakRetained;
        v49 = v8;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v9);
            v52 = v10;
            v11 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v10);
            v12 = objc_msgSend(*((id *)WeakRetained + 1), "showDeclinedEvents", v41);
            objc_msgSend(v11, "selfAttendee");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "participantStatus");

            if (v14 != 3 || v12 != 0)
            {
              v16 = (void *)*((_QWORD *)WeakRetained + 2);
              objc_msgSend(v11, "calendar");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v16) = objc_msgSend(v16, "containsObject:", v17);

              if ((_DWORD)v16)
              {
                objc_msgSend(v11, "endDateUnadjustedForLegacyClients");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                CUIKTimeZoneForChoice((void *)1);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "dateForDayInTimeZone:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v46 = v18;
                v53 = objc_msgSend(v18, "isEqualToDate:", v20);
                objc_msgSend(v11, "startDate");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "isBeforeOrSameDayAsDate:inCalendar:", v20, v8))
                {
                  v22 = v51;
                  v50 = v20;
                  while ((objc_msgSend(v21, "isSameDayAsDate:inCalendar:", v20, v8) & v53 & 1) == 0)
                  {
                    CUIKTimeZoneForChoice((void *)1);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "dateForDayInTimeZone:", v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v22, "objectForKeyedSubscript:", v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v25)
                    {
                      v58 = 0u;
                      v59 = 0u;
                      v56 = 0u;
                      v57 = 0u;
                      v26 = v25;
                      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
                      if (v27)
                      {
                        v28 = v27;
                        v29 = *(_QWORD *)v57;
                        while (2)
                        {
                          for (i = 0; i != v28; ++i)
                          {
                            if (*(_QWORD *)v57 != v29)
                              objc_enumerationMutation(v26);
                            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "objectForKeyedSubscript:", CUIKOccurrenceInfoEventKey);
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            v32 = objc_msgSend(v31, "isEqual:", v11);

                            if ((v32 & 1) != 0)
                            {

                              v8 = v49;
                              objc_msgSend(v49, "dateByAddingUnit:value:toDate:options:", 16, 1, v21, 0);
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              v20 = v50;
                              v22 = v51;
                              goto LABEL_33;
                            }
                          }
                          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
                          if (v28)
                            continue;
                          break;
                        }
                      }

                      v20 = v50;
                      v22 = v51;
                      v8 = v49;
                    }
                    else
                    {
                      v26 = (id)objc_opt_new();
                      objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, v24);
                    }
                    v34 = (void *)objc_opt_new();
                    objc_msgSend(v34, "setObject:forKeyedSubscript:", v11, CUIKOccurrenceInfoEventKey);
                    objc_msgSend(v11, "startDate");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CUIKOccurrenceInfoDateKey);

                    objc_msgSend(v26, "addObject:", v34);
                    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v21, 0);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();

                    v21 = v34;
LABEL_33:

                    v21 = v33;
                    if ((objc_msgSend(v33, "isBeforeOrSameDayAsDate:inCalendar:", v20, v8) & 1) == 0)
                      goto LABEL_36;
                  }
                }
                v33 = v21;
LABEL_36:

                v9 = v44;
                WeakRetained = v45;
              }
            }
            v10 = v52 + 1;
          }
          while (v52 + 1 != v48);
          v48 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        }
        while (v48);
      }

      v36 = *(_QWORD *)(*(_QWORD *)(v42 + 40) + 8);
      if (*(_BYTE *)(v36 + 24))
        *(_BYTE *)(v36 + 24) = 0;
      v37 = (void *)objc_opt_new();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_27;
      v54[3] = &unk_1E6EB7520;
      v55 = v37;
      v38 = v37;
      objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v54);
      objc_msgSend(v38, "sortedArrayUsingComparator:", &__block_literal_global_30);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)*((_QWORD *)WeakRetained + 19);
      *((_QWORD *)WeakRetained + 19) = v39;

      *(_BYTE *)(*(_QWORD *)(v42 + 32) + 160) = 1;
      pthread_mutex_unlock(v41);

      v4 = v43;
    }
    else
    {
      pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 88));
    }
  }

}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_24);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = CUIKOccurrenceCacheDayKey;
  v8 = CUIKOccurrenceCacheOccurrencesKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v5, v7, v11, v8, v9, CUIKOccurrenceCacheOccurrenceCountKey, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = CUIKOccurrenceInfoDateKey;
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CUIKOccurrenceInfoDateKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = CUIKOccurrenceCacheDayKey;
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CUIKOccurrenceCacheDayKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateCachedDays");
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

    if (v6 == v3)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_DWORD *)(a1 + 88);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        v17 = v16;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v19 = 67109632;
        v20 = v15;
        v21 = 2048;
        v22 = v17;
        v23 = 2048;
        v24 = v18;
        v14 = "Search %i: Distant future search end: %f, %f";
        goto LABEL_7;
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_DWORD *)(a1 + 88);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        v11 = v10;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v19 = 67109632;
        v20 = v8;
        v21 = 2048;
        v22 = v11;
        v23 = 2048;
        v24 = v13;
        v14 = "Search %i: Distant past search end: %f, %f";
LABEL_7:
        _os_log_impl(&dword_1B8A6A000, v7, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0x1Cu);

      }
    }

  }
}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_38(uint64_t a1)
{
  char *WeakRetained;
  char *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  int v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  int v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 96));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 88));
    v4 = *(_DWORD *)(a1 + 104);
    v5 = *((_DWORD *)v3 + 41);
    pthread_mutex_unlock((pthread_mutex_t *)(v3 + 88));
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_DWORD *)(a1 + 104);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      *(_DWORD *)buf = 67109376;
      v28 = v7;
      v29 = 2048;
      v30 = v9;
      _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_DEFAULT, "Search %i: Narrow search end: %f", buf, 0x12u);

    }
    if (v4 == v5)
    {
      objc_msgSend(v3, "_updateCachedDays");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v11 = *(void **)(a1 + 32);
      v12 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_39;
      v23[3] = &unk_1E6EB75B8;
      v26 = *(_DWORD *)(a1 + 104);
      v13 = *(_QWORD *)(a1 + 72);
      v24 = v10;
      v25 = v13;
      v14 = v10;
      objc_msgSend(v11, "_runBlock:", v23);
      v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v16 = *(void **)(a1 + 32);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_40;
      v19[3] = &unk_1E6EB75B8;
      v22 = *(_DWORD *)(a1 + 104);
      v17 = *(_QWORD *)(a1 + 88);
      v20 = v15;
      v21 = v17;
      v18 = v15;
      objc_msgSend(v16, "_runBlock:", v19);

    }
  }

}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_DEFAULT, "Search %i: Distant future search start", (uint8_t *)v8, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1 + 32), "start");
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_DEFAULT, "Search %i: Distant past search start", (uint8_t *)v8, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1 + 32), "start");
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_DEFAULT, "Search %i: Narrow search start", (uint8_t *)v8, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)_runBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_runBlock:(id)a3 withRandomDelayUpperbound:(unsigned int)a4
{
  signed int v5;
  dispatch_time_t v6;
  dispatch_block_t block;

  block = a3;
  v5 = arc4random_uniform(a4);
  v6 = dispatch_time(0, 1000000000 * v5);
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

- (id)_createCachedDays
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

@end
