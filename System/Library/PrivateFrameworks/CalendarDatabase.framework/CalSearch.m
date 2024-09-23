@implementation CalSearch

- (CalSearch)initWithDatabase:(CalDatabase *)a3 filter:(CalFilter *)a4 dataSink:(id)a5
{
  id v8;
  CalSearch *v9;
  CalFilter *v10;
  const __CFString *SearchTerm;
  const __CFAllocator *v12;
  const CFArrayCallBacks *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalSearch;
  v9 = -[CalSearch init](&v15, sel_init);
  if (v9)
  {
    v9->_database = (CalDatabase *)CFRetain(a3);
    v10 = (CalFilter *)CFRetain(a4);
    v9->_filter = v10;
    SearchTerm = (const __CFString *)CalFilterGetSearchTerm(v10);
    v9->_searchString = (__CFString *)SearchTerm;
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (SearchTerm)
      v9->_searchString = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], SearchTerm);
    v9->_partialResults = CFArrayCreateMutable(v12, 0, 0);
    v13 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    v9->_partialCachedOccurrences = CFArrayCreateMutable(v12, 0, MEMORY[0x1E0C9B378]);
    v9->_partialCachedDays = CFArrayCreateMutable(v12, 0, v13);
    v9->_partialCachedDaysIndexes = CFArrayCreateMutable(v12, 0, 0);
    v9->_matchedEventsSet = CFSetCreateMutable(v12, 0, 0);
    v9->_matchedParticipantsSet = CFSetCreateMutable(v12, 0, 0);
    v9->_matchedLocationsSet = CFSetCreateMutable(v12, 0, 0);
    objc_storeWeak((id *)&v9->_dataSink, v8);
    v9->_implementsCancellationCallback = objc_opt_respondsToSelector() & 1;
    v9->_seed = ++sSeed;
    pthread_mutex_init(&v9->_dataSourceDeallocLock, 0);
  }

  return v9;
}

- (void)dealloc
{
  _opaque_pthread_mutex_t *p_dataSourceDeallocLock;
  __CFArray *partialResults;
  __CFArray *partialCachedOccurrences;
  __CFArray *partialCachedDays;
  __CFArray *partialCachedDaysIndexes;
  __CFSet *matchedEventsSet;
  __CFSet *matchedParticipantsSet;
  __CFSet *matchedLocationsSet;
  CalFilter *filter;
  __CFString *searchString;
  CalDatabase *database;
  objc_super v14;

  self->_stopLoadingResults = 1;
  p_dataSourceDeallocLock = &self->_dataSourceDeallocLock;
  pthread_mutex_lock(&self->_dataSourceDeallocLock);
  pthread_mutex_unlock(p_dataSourceDeallocLock);
  pthread_mutex_destroy(p_dataSourceDeallocLock);
  partialResults = self->_partialResults;
  if (partialResults)
    CFRelease(partialResults);
  partialCachedOccurrences = self->_partialCachedOccurrences;
  if (partialCachedOccurrences)
    CFRelease(partialCachedOccurrences);
  partialCachedDays = self->_partialCachedDays;
  if (partialCachedDays)
    CFRelease(partialCachedDays);
  partialCachedDaysIndexes = self->_partialCachedDaysIndexes;
  if (partialCachedDaysIndexes)
    CFRelease(partialCachedDaysIndexes);
  matchedEventsSet = self->_matchedEventsSet;
  if (matchedEventsSet)
    CFRelease(matchedEventsSet);
  matchedParticipantsSet = self->_matchedParticipantsSet;
  if (matchedParticipantsSet)
    CFRelease(matchedParticipantsSet);
  matchedLocationsSet = self->_matchedLocationsSet;
  if (matchedLocationsSet)
    CFRelease(matchedLocationsSet);
  filter = self->_filter;
  if (filter)
    CFRelease(filter);
  searchString = self->_searchString;
  if (searchString)
    CFRelease(searchString);
  database = self->_database;
  if (database)
    CFRelease(database);
  objc_storeWeak((id *)&self->_dataSink, 0);
  v14.receiver = self;
  v14.super_class = (Class)CalSearch;
  -[CalSearch dealloc](&v14, sel_dealloc);
}

- (void)startSearching
{
  _opaque_pthread_t *v3;
  int sched_priority;
  _opaque_pthread_t *v5;
  _opaque_pthread_t *v6;
  int v7;
  sched_param v8;

  v8 = 0;
  v7 = 0;
  v3 = pthread_self();
  if (!pthread_getschedparam(v3, &v7, &v8))
  {
    sched_priority = v8.sched_priority;
    v8.sched_priority = sched_get_priority_min(v7);
    v5 = pthread_self();
    if (!pthread_setschedparam(v5, v7, &v8))
    {
      v8.sched_priority = sched_priority;
      v6 = pthread_self();
      pthread_setschedparam(v6, v7, &v8);
    }
  }
  -[CalSearch _startLoadingResults](self, "_startLoadingResults");
}

- (void)stopSearching
{
  objc_storeWeak((id *)&self->_dataSink, 0);
  self->_stopLoadingResults = 1;
}

- (BOOL)moreResultsAvailable
{
  return self->_moreResultsAvailable;
}

- (int)seed
{
  return self->_seed;
}

- (void)_startLoadingResults
{
  _opaque_pthread_mutex_t *p_dataSourceDeallocLock;
  CalParticipantIdsSearchContext *v4;
  CalLocationIdsSearchContext *v5;
  CalEventIdsSearchContext *v6;
  CalEventOccurrenceSearchContext *v7;
  id WeakRetained;

  p_dataSourceDeallocLock = &self->_dataSourceDeallocLock;
  pthread_mutex_lock(&self->_dataSourceDeallocLock);
  self->_stopLoadingResults = 0;
  self->_moreResultsAvailable = 1;
  if (-[CalSearch searchParticipants](self, "searchParticipants"))
  {
    v4 = -[CalSearch _createParticipantIdsSearchContext](self, "_createParticipantIdsSearchContext");
    -[CalSearch _getParticipantsSearchResults:](self, "_getParticipantsSearchResults:", v4);
    -[CalSearch _deleteParticipantIdsSearchContext:](self, "_deleteParticipantIdsSearchContext:", v4);
  }
  if (-[CalSearch searchLocations](self, "searchLocations"))
  {
    v5 = -[CalSearch _createLocationIdsSearchContext](self, "_createLocationIdsSearchContext");
    if (!self->_stopLoadingResults)
    {
      self->_moreResultsAvailable = 1;
      -[CalSearch _getLocationSearchResults:](self, "_getLocationSearchResults:", v5);
    }
    -[CalSearch _deleteLocationIdsSearchContext:](self, "_deleteLocationIdsSearchContext:", v5);
  }
  v6 = -[CalSearch _createEventIdsSearchContext](self, "_createEventIdsSearchContext");
  if (-[CalSearch searchAttendees](self, "searchAttendees"))
  {
    if (self->_stopLoadingResults)
      goto LABEL_12;
    self->_moreResultsAvailable = 1;
    -[CalSearch _getAttendeesSearchResults:](self, "_getAttendeesSearchResults:", v6);
  }
  if (!self->_stopLoadingResults)
  {
    self->_moreResultsAvailable = 1;
    -[CalSearch _getEventsSearchResults:](self, "_getEventsSearchResults:", v6);
  }
LABEL_12:
  -[CalSearch _deleteEventIdsSearchContext:](self, "_deleteEventIdsSearchContext:", v6);
  if (!self->_stopLoadingResults && CFSetGetCount(self->_matchedEventsSet))
  {
    self->_moreResultsAvailable = 1;
    v7 = -[CalSearch _createSearchContext](self, "_createSearchContext");
    -[CalSearch _getApplicationSearchResults:](self, "_getApplicationSearchResults:", v7);
    -[CalSearch _deleteSearchContext:](self, "_deleteSearchContext:", v7);
  }
  pthread_mutex_unlock(p_dataSourceDeallocLock);
  if (!self->_stopLoadingResults)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSink);
    objc_msgSend(WeakRetained, "calSearchComplete:", self);

  }
}

- (void)_addMatchedEventIds:(__CFArray *)a3
{
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  signed int ValueAtIndex;

  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v6 = Count;
    for (i = 0; i != v6; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFSetAddValue(self->_matchedEventsSet, (const void *)ValueAtIndex);
    }
  }
}

- (void)_addMatchedParticipantIds:(__CFArray *)a3
{
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  signed int ValueAtIndex;

  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v6 = Count;
    for (i = 0; i != v6; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFSetAddValue(self->_matchedParticipantsSet, (const void *)ValueAtIndex);
    }
  }
}

- (void)_getParticipantsSearchResults:(CalParticipantIdsSearchContext *)a3
{
  sqlite3_stmt **ParticipantsSearchStatement;

  if (self->_stopLoadingResults)
  {
    ParticipantsSearchStatement = 0;
  }
  else
  {
    ParticipantsSearchStatement = (sqlite3_stmt **)CalDatabaseCreateParticipantsSearchStatement((uint64_t)a3, self->_searchString);
    if (!ParticipantsSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyParticipantIdsThatMatchSearch(ParticipantsSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0))
      -[CalSearch _addMatchedParticipantIds:](self, "_addMatchedParticipantIds:", a3->var0);
  }
  if (ParticipantsSearchStatement)
    CalDatabaseDeleteParticipantsSearchStatement((uint64_t **)ParticipantsSearchStatement, (uint64_t)a3);
}

- (CalParticipantIdsSearchContext)_createParticipantIdsSearchContext
{
  CalParticipantIdsSearchContext *result;

  result = (CalParticipantIdsSearchContext *)malloc_type_malloc(0x28uLL, 0x10300408B9D0061uLL);
  result->var0 = self->_partialResults;
  result->var2 = &self->_moreResultsAvailable;
  result->var3 = &self->_stopLoadingResults;
  result->var4 = self->_database;
  result->var1 = 10;
  return result;
}

- (void)_deleteParticipantIdsSearchContext:(CalParticipantIdsSearchContext *)a3
{
  CFArrayRemoveAllValues(a3->var0);
  free(a3);
}

- (CalLocationIdsSearchContext)_createLocationIdsSearchContext
{
  CalLocationIdsSearchContext *result;

  result = (CalLocationIdsSearchContext *)malloc_type_malloc(0x28uLL, 0x10300408B9D0061uLL);
  result->var0 = self->_partialResults;
  result->var2 = &self->_moreResultsAvailable;
  result->var3 = &self->_stopLoadingResults;
  result->var4 = self->_database;
  result->var1 = 10;
  return result;
}

- (void)_deleteLocationIdsSearchContext:(CalLocationIdsSearchContext *)a3
{
  CFArrayRemoveAllValues(a3->var0);
  free(a3);
}

- (void)_addMatchedLocationIds:(__CFArray *)a3
{
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  signed int ValueAtIndex;

  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v6 = Count;
    for (i = 0; i != v6; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFSetAddValue(self->_matchedLocationsSet, (const void *)ValueAtIndex);
    }
  }
}

- (void)_getLocationSearchResults:(CalLocationIdsSearchContext *)a3
{
  sqlite3_stmt **LocationSearchStatement;

  if (self->_stopLoadingResults)
  {
    LocationSearchStatement = 0;
  }
  else
  {
    LocationSearchStatement = (sqlite3_stmt **)CalDatabaseCreateLocationSearchStatement((uint64_t)a3, self->_searchString);
    if (!LocationSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyLocationIdsThatMatchSearch(LocationSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0))
      -[CalSearch _addMatchedLocationIds:](self, "_addMatchedLocationIds:", a3->var0);
  }
  if (LocationSearchStatement)
    CalDatabaseDeleteLocationSearchStatement((uint64_t **)LocationSearchStatement, (uint64_t)a3);
}

- (void)_getAttendeesSearchResults:(CalEventIdsSearchContext *)a3
{
  sqlite3_stmt **AttendeesSearchStatement;

  if (self->_stopLoadingResults)
  {
    AttendeesSearchStatement = 0;
  }
  else
  {
    AttendeesSearchStatement = (sqlite3_stmt **)CalDatabaseCreateAttendeesSearchStatement((uint64_t *)a3);
    if (!AttendeesSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyEventIdsForSearch(AttendeesSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0))
      -[CalSearch _addMatchedEventIds:](self, "_addMatchedEventIds:", a3->var0);
  }
  if (AttendeesSearchStatement)
    CalDatabaseDeleteAttendeesSearchStatement((uint64_t **)AttendeesSearchStatement, (uint64_t)a3);
}

- (void)_getEventsSearchResults:(CalEventIdsSearchContext *)a3
{
  sqlite3_stmt **EventsSearchStatement;

  if (self->_stopLoadingResults)
  {
    EventsSearchStatement = 0;
  }
  else
  {
    EventsSearchStatement = (sqlite3_stmt **)CalDatabaseCreateEventsSearchStatement((uint64_t *)a3, self->_filter, self->_shouldMatchLocationsOnlyForEventSearch);
    if (!EventsSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyEventIdsForSearch(EventsSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0))
      -[CalSearch _addMatchedEventIds:](self, "_addMatchedEventIds:", a3->var0);
  }
  if (EventsSearchStatement)
    CalDatabaseDeleteEventsSearchStatement((uint64_t **)EventsSearchStatement, (uint64_t)a3);
}

- (CalEventIdsSearchContext)_createEventIdsSearchContext
{
  CalEventIdsSearchContext *result;

  result = (CalEventIdsSearchContext *)malloc_type_malloc(0x30uLL, 0x700401BCA1C85uLL);
  result->var0 = self->_partialResults;
  result->var1 = self->_matchedParticipantsSet;
  result->var2 = self->_matchedLocationsSet;
  result->var3 = &self->_moreResultsAvailable;
  result->var4 = &self->_stopLoadingResults;
  result->var5 = self->_database;
  return result;
}

- (void)_deleteEventIdsSearchContext:(CalEventIdsSearchContext *)a3
{
  CFArrayRemoveAllValues(a3->var0);
  free(a3);
}

- (void)_getApplicationSearchResults:(CalEventOccurrenceSearchContext *)a3
{
  CalSearchDataSink **p_dataSink;
  CalEventOccurrenceCache *v6;
  uint64_t *OccurrencesThatMatchEventIdsStatement;
  id WeakRetained;
  __CFArray *partialCachedOccurrences;
  __CFArray *partialCachedDays;
  __CFArray *partialCachedDaysIndexes;
  id v12;

  if (self->_moreResultsAvailable)
  {
    p_dataSink = &self->_dataSink;
    do
    {
      if (self->_stopLoadingResults)
        break;
      v6 = (CalEventOccurrenceCache *)CalDatabaseCopyEventOccurrenceCache((os_unfair_lock_s *)self->_database);
      a3->var11 = v6;
      OccurrencesThatMatchEventIdsStatement = (uint64_t *)CalDatabaseCreateOccurrencesThatMatchEventIdsStatement(self->_filter, (uint64_t)a3);
      CalDatabaseRegisterProgressHandlerForOccurrencesSearch((uint64_t)a3, OccurrencesThatMatchEventIdsStatement);
      _CalDatabaseCopyEventOccurrencesThatMatchEventIds((uint64_t)a3, (sqlite3_stmt **)OccurrencesThatMatchEventIdsStatement);
      if (CFArrayGetCount(self->_partialCachedOccurrences))
      {
        WeakRetained = objc_loadWeakRetained((id *)p_dataSink);
        objc_msgSend(WeakRetained, "calSearch:foundOccurrences:cachedDays:cachedDaysIndexes:", self, self->_partialCachedOccurrences, self->_partialCachedDays, self->_partialCachedDaysIndexes);

        partialCachedOccurrences = self->_partialCachedOccurrences;
        if (partialCachedOccurrences)
          CFArrayRemoveAllValues(partialCachedOccurrences);
        partialCachedDays = self->_partialCachedDays;
        if (partialCachedDays)
          CFArrayRemoveAllValues(partialCachedDays);
        partialCachedDaysIndexes = self->_partialCachedDaysIndexes;
        if (partialCachedDaysIndexes)
          CFArrayRemoveAllValues(partialCachedDaysIndexes);
      }
      if (!self->_dateToStartShowingResultsSentToDataSink && (a3->var18 || !self->_moreResultsAvailable))
      {
        self->_dateToStartShowingResultsSentToDataSink = 1;
        v12 = objc_loadWeakRetained((id *)p_dataSink);
        objc_msgSend(v12, "calSearch:showResultsStartingOnDate:", self, a3->var19);

      }
      CalDatabaseUnregisterProgressHandlerForOccurrencesSearch(OccurrencesThatMatchEventIdsStatement);
      CalDatabaseDeleteOccurrencesThatMatchEventIdsStatement((uint64_t)a3, (uint64_t **)OccurrencesThatMatchEventIdsStatement);
      CFRelease(v6);
    }
    while (self->_moreResultsAvailable);
  }
}

- (CalEventOccurrenceSearchContext)_createSearchContext
{
  CalEventOccurrenceSearchContext *v3;
  CFAbsoluteTime Current;
  const void *v5;
  double v6;
  double v7;
  uint64_t (*v8)(void *);

  v3 = (CalEventOccurrenceSearchContext *)malloc_type_malloc(0x98uLL, 0x10F0040B991B105uLL);
  v3->var0 = self->_matchedEventsSet;
  v3->var1 = self->_partialCachedOccurrences;
  v3->var2 = self->_partialCachedDays;
  v3->var3 = self->_partialCachedDaysIndexes;
  v3->var4 = &self->_moreResultsAvailable;
  v3->var5 = &self->_stopLoadingResults;
  v3->var10 = 0;
  v3->var11 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = (const void *)CalCopySystemTimeZone();
  CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
  CalGregorianDateGetGregorianDateForDay();
  CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone();
  CalAbsoluteTimeAddGregorianUnits();
  v3->var7 = v6;
  CalAbsoluteTimeAddGregorianUnits();
  v3->var9 = v7;
  if (v5)
    CFRelease(v5);
  v3->var6 = v3->var7;
  v3->var13 = self;
  v3->var14 = 200;
  if (self->_implementsCancellationCallback)
    v8 = _applicationOccurrencesCancellationCallback;
  else
    v8 = 0;
  v3->var12 = v8;
  v3->var15 = 1;
  v3->var17 = Current;
  v3->var18 = 0;
  v3->var19 = *(double *)MEMORY[0x1E0D0C490];
  return v3;
}

- (void)_deleteSearchContext:(CalEventOccurrenceSearchContext *)a3
{
  free(a3);
}

- (BOOL)searchParticipants
{
  return self->_searchParticipants;
}

- (void)setSearchParticipants:(BOOL)a3
{
  self->_searchParticipants = a3;
}

- (BOOL)searchLocations
{
  return self->_searchLocations;
}

- (void)setSearchLocations:(BOOL)a3
{
  self->_searchLocations = a3;
}

- (BOOL)searchAttendees
{
  return self->_searchAttendees;
}

- (void)setSearchAttendees:(BOOL)a3
{
  self->_searchAttendees = a3;
}

- (BOOL)shouldMatchLocationsOnlyForEventSearch
{
  return self->_shouldMatchLocationsOnlyForEventSearch;
}

- (void)setShouldMatchLocationsOnlyForEventSearch:(BOOL)a3
{
  self->_shouldMatchLocationsOnlyForEventSearch = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSink);
}

@end
