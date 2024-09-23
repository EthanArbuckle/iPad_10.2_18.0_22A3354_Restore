@implementation CUIKLocationSearchModel

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
}

void __37__CUIKLocationSearchModel_initialize__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_mapItemCache;
  _mapItemCache = (uint64_t)v0;

}

- (CUIKLocationSearchModel)initWithEventStore:(id)a3
{
  id v5;
  CUIKLocationSearchModel *v6;
  CUIKLocationSearchModel *v7;
  id v8;
  uint64_t v9;
  CNContactStore *contactStore;
  uint64_t v11;
  NSCharacterSet *whitespaceAndNewlineCharacterSet;
  dispatch_queue_t v13;
  OS_dispatch_queue *conferenceRoomProcessingQueue;
  NSOperationQueue *v15;
  NSOperationQueue *conferenceRoomOperationQueue;
  NSMutableArray *v17;
  NSMutableArray *mutableConferenceRoomSearchResults;
  NSMutableDictionary *v19;
  NSMutableDictionary *conferenceRoomAddressesToConferenceRooms;
  uint64_t v21;
  NSMutableArray *recentsSearchResults;
  objc_class *v23;
  uint64_t (*v24)(_QWORD);
  uint64_t (*v25)(uint64_t, const __CFString *, _QWORD);
  uint64_t v26;
  const void *v27;
  const __CFBoolean *v28;
  const __CFBoolean *v29;
  id v30;
  uint64_t v31;
  CLLocationManager *locationManager;
  id v33;
  uint64_t v34;
  CLLocationManager *v35;
  uint64_t v36;
  NSCountedSet *pendingOperationsCounts;
  objc_super v39;

  v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CUIKLocationSearchModel;
  v6 = -[CUIKLocationSearchModel init](&v39, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventStore, a3);
    v8 = objc_alloc_init((Class)EKWeakLinkClass());
    objc_msgSend(v8, "setIncludeIncludeManagedAppleIDs:", 1);
    v9 = objc_msgSend(objc_alloc((Class)EKWeakLinkClass()), "initWithConfiguration:", v8);
    contactStore = v7->_contactStore;
    v7->_contactStore = (CNContactStore *)v9;

    v7->_supportedSearchTypes = 2047;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = objc_claimAutoreleasedReturnValue();
    whitespaceAndNewlineCharacterSet = v7->_whitespaceAndNewlineCharacterSet;
    v7->_whitespaceAndNewlineCharacterSet = (NSCharacterSet *)v11;

    v13 = dispatch_queue_create("com.apple.mobilecal.ConferenceRoomProcessing", 0);
    conferenceRoomProcessingQueue = v7->_conferenceRoomProcessingQueue;
    v7->_conferenceRoomProcessingQueue = (OS_dispatch_queue *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    conferenceRoomOperationQueue = v7->_conferenceRoomOperationQueue;
    v7->_conferenceRoomOperationQueue = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableConferenceRoomSearchResults = v7->_mutableConferenceRoomSearchResults;
    v7->_mutableConferenceRoomSearchResults = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    conferenceRoomAddressesToConferenceRooms = v7->_conferenceRoomAddressesToConferenceRooms;
    v7->_conferenceRoomAddressesToConferenceRooms = v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    recentsSearchResults = v7->_recentsSearchResults;
    v7->_recentsSearchResults = (NSMutableArray *)v21;

    v23 = (objc_class *)EKWeakLinkClass();
    v24 = (uint64_t (*)(_QWORD))EKWeakLinkSymbol();
    v25 = (uint64_t (*)(uint64_t, const __CFString *, _QWORD))EKWeakLinkSymbol();
    v26 = v24(*MEMORY[0x1E0C9AE00]);
    if (v26)
    {
      v27 = (const void *)v26;
      v28 = (const __CFBoolean *)v25(v26, CFSTR("com.apple.locationd.effective_bundle"), 0);
      if (v28)
      {
        v29 = v28;
        if (CFBooleanGetValue(v28))
        {
          v30 = [v23 alloc];
          v31 = objc_msgSend(v30, "initWithEffectiveBundleIdentifier:delegate:onQueue:", *MEMORY[0x1E0D0C508], v7, MEMORY[0x1E0C80D38]);
          locationManager = v7->_locationManager;
          v7->_locationManager = (CLLocationManager *)v31;

        }
        CFRelease(v27);
      }
      else
      {
        v29 = (const __CFBoolean *)v27;
      }
      CFRelease(v29);
    }
    if (!v7->_locationManager)
    {
      v33 = [v23 alloc];
      v34 = objc_msgSend(v33, "_initWithDelegate:onQueue:", v7, MEMORY[0x1E0C80D38]);
      v35 = v7->_locationManager;
      v7->_locationManager = (CLLocationManager *)v34;

    }
    v36 = objc_opt_new();
    pendingOperationsCounts = v7->_pendingOperationsCounts;
    v7->_pendingOperationsCounts = (NSCountedSet *)v36;

    v7->_pendingOperationsCountsLock._os_unfair_lock_opaque = 0;
    -[CLLocationManager requestWhenInUseAuthorization](v7->_locationManager, "requestWhenInUseAuthorization");

  }
  return v7;
}

- (void)dealloc
{
  CLLocationManager *locationManager;
  CLGeocoder *geocoder;
  MKLocalSearch *localSearch;
  objc_super v6;

  -[CUIKLocationSearchModel cancelSearch](self, "cancelSearch");
  -[CUIKLocationSearchModel stopUpdatingLocation](self, "stopUpdatingLocation");
  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  -[MKLocalSearchCompleter setDelegate:](self->_completer, "setDelegate:", 0);
  geocoder = self->_geocoder;
  if (geocoder)
    -[CLGeocoder cancelGeocode](geocoder, "cancelGeocode");
  localSearch = self->_localSearch;
  if (localSearch)
    -[MKLocalSearch cancel](localSearch, "cancel");
  -[NSOperationQueue cancelAllOperations](self->_conferenceRoomOperationQueue, "cancelAllOperations");
  v6.receiver = self;
  v6.super_class = (Class)CUIKLocationSearchModel;
  -[CUIKLocationSearchModel dealloc](&v6, sel_dealloc);
}

- (BOOL)resultsPending
{
  CUIKLocationSearchModel *v2;
  os_unfair_lock_s *p_pendingOperationsCountsLock;

  v2 = self;
  p_pendingOperationsCountsLock = &self->_pendingOperationsCountsLock;
  os_unfair_lock_lock(&self->_pendingOperationsCountsLock);
  LOBYTE(v2) = -[NSCountedSet count](v2->_pendingOperationsCounts, "count") != 0;
  os_unfair_lock_unlock(p_pendingOperationsCountsLock);
  return (char)v2;
}

- (void)_incrementPendingOperationsCountForDomain:(id)a3
{
  os_unfair_lock_s *p_pendingOperationsCountsLock;
  id v5;

  p_pendingOperationsCountsLock = &self->_pendingOperationsCountsLock;
  v5 = a3;
  os_unfair_lock_lock(p_pendingOperationsCountsLock);
  -[NSCountedSet addObject:](self->_pendingOperationsCounts, "addObject:", v5);

  os_unfair_lock_unlock(p_pendingOperationsCountsLock);
}

- (void)_decrementPendingOperationsCountForDomain:(id)a3
{
  os_unfair_lock_s *p_pendingOperationsCountsLock;
  id v5;

  p_pendingOperationsCountsLock = &self->_pendingOperationsCountsLock;
  v5 = a3;
  os_unfair_lock_lock(p_pendingOperationsCountsLock);
  -[NSCountedSet removeObject:](self->_pendingOperationsCounts, "removeObject:", v5);

  os_unfair_lock_unlock(p_pendingOperationsCountsLock);
}

- (void)getCurrentLocation
{
  NSObject *v3;
  CLInUseAssertion *v4;
  CLInUseAssertion *locationAssertion;
  uint8_t v6[16];

  if ((self->_supportedSearchTypes & 4) != 0)
  {
    -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainCurrentLocation"));
    -[CUIKLocationSearchModel performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_stopUpdatingLocation, 0, 30.0);
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B8A6A000, v3, OS_LOG_TYPE_INFO, "Started updating current location", v6, 2u);
    }

    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    v4 = (CLInUseAssertion *)objc_msgSend((id)EKWeakLinkClass(), "newAssertionForBundleIdentifier:withReason:", *MEMORY[0x1E0D0C508], CFSTR("event editor getting current location"));
    locationAssertion = self->_locationAssertion;
    self->_locationAssertion = v4;

  }
}

- (void)stopUpdatingLocation
{
  CLInUseAssertion *locationAssertion;
  NSObject *v4;
  uint8_t v5[16];

  -[CUIKLocationSearchModel _decrementPendingOperationsCountForDomain:](self, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainCurrentLocation"));
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_stopUpdatingLocation, 0);
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  locationAssertion = self->_locationAssertion;
  self->_locationAssertion = 0;

  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B8A6A000, v4, OS_LOG_TYPE_INFO, "Stopped updating current location", v5, 2u);
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_ERROR, "Updating current location failed with error: %@", (uint8_t *)&v7, 0xCu);
  }

  -[CUIKLocationSearchModel stopUpdatingLocation](self, "stopUpdatingLocation");
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  char v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  char v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = objc_msgSend(a3, "_limitsPrecision");
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8A6A000, v8, OS_LOG_TYPE_INFO, "Found current location, shifting...", buf, 2u);
  }

  objc_msgSend(v6, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init((Class)EKWeakLinkClass());
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CUIKLocationSearchModel_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_1E6EB5DB0;
  v12 = v7;
  v11[4] = self;
  objc_msgSend(v10, "shiftLocation:withCompletionHandler:", v9, v11);
  -[CUIKLocationSearchModel stopUpdatingLocation](self, "stopUpdatingLocation");

}

void __62__CUIKLocationSearchModel_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8A6A000, v5, OS_LOG_TYPE_INFO, "Current location shifting finished. Result is imprecise, so this only affects search result relevancy", buf, 2u);
    }

    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CAA158];
    CUIKUserFriendlyStringForCLLocation(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationWithTitle:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setGeoLocation:", v4);
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B8A6A000, v14, OS_LOG_TYPE_INFO, "Current location shifting finished", v15, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainCurrentLocation"));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), 1);
  }

}

- (void)resetContactsSearchResults
{
  CNCancelable *contactsSearchToken;
  CNCancelable *v4;
  NSMutableArray *contactsSearchResults;

  contactsSearchToken = self->_contactsSearchToken;
  if (contactsSearchToken)
  {
    -[CNCancelable cancel](contactsSearchToken, "cancel");
    v4 = self->_contactsSearchToken;
    self->_contactsSearchToken = 0;

  }
  contactsSearchResults = self->_contactsSearchResults;
  if (contactsSearchResults)
  {
    self->_contactsSearchResults = 0;

  }
}

- (void)resetEventsSearchResults
{
  NSObject *v3;
  EKOccurrenceCacheLocationSearch *eventsSearch;
  EKOccurrenceCacheLocationSearch *v5;
  NSMutableArray *eventsSearchResults;
  NSArray *textualSearchResults;
  uint8_t v8[16];

  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8A6A000, v3, OS_LOG_TYPE_INFO, "Resetting event search results", v8, 2u);
  }

  eventsSearch = self->_eventsSearch;
  if (eventsSearch)
  {
    -[EKOccurrenceCacheLocationSearch cancel](eventsSearch, "cancel");
    v5 = self->_eventsSearch;
    self->_eventsSearch = 0;

  }
  eventsSearchResults = self->_eventsSearchResults;
  if (eventsSearchResults)
  {
    self->_eventsSearchResults = 0;

  }
  textualSearchResults = self->_textualSearchResults;
  if (textualSearchResults)
  {
    self->_textualSearchResults = 0;

  }
}

- (void)resetConferenceRoomSearchResults
{
  -[NSOperationQueue cancelAllOperations](self->_conferenceRoomOperationQueue, "cancelAllOperations");
  -[NSMutableArray removeAllObjects](self->_mutableConferenceRoomSearchResults, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_conferenceRoomAddressesToConferenceRooms, "removeAllObjects");
}

- (void)resetRecentsSearchResults
{
  CRSearchQuery *currentRecentsSearch;

  currentRecentsSearch = self->_currentRecentsSearch;
  self->_currentRecentsSearch = 0;

  -[NSMutableArray removeAllObjects](self->_recentsSearchResults, "removeAllObjects");
}

- (void)resetSearchResults:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  MKLocalSearch *localSearch;
  CUIKStructuredLocationWithImage *locationFromMapsURL;
  NSArray *mapCompletionSearchResults;
  NSMutableArray *frequentsSearchResults;
  NSMutableArray *virtualConferenceRoomSearchResults;
  NSArray *virtualConferenceCustomSearchResults;
  void *v12;
  uint8_t v13[16];

  v3 = a3;
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1B8A6A000, v5, OS_LOG_TYPE_INFO, "Resetting location search results", v13, 2u);
  }

  if (v3)
  {
    -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
    -[MKLocalSearchCompleter cancel](self->_completer, "cancel");
    -[MKLocalSearch cancel](self->_localSearch, "cancel");
    localSearch = self->_localSearch;
    self->_localSearch = 0;

  }
  -[CUIKLocationSearchModel resetContactsSearchResults](self, "resetContactsSearchResults");
  -[CUIKLocationSearchModel resetEventsSearchResults](self, "resetEventsSearchResults");
  -[CUIKLocationSearchModel resetConferenceRoomSearchResults](self, "resetConferenceRoomSearchResults");
  -[CUIKLocationSearchModel resetRecentsSearchResults](self, "resetRecentsSearchResults");
  locationFromMapsURL = self->_locationFromMapsURL;
  self->_locationFromMapsURL = 0;

  mapCompletionSearchResults = self->_mapCompletionSearchResults;
  self->_mapCompletionSearchResults = 0;

  frequentsSearchResults = self->_frequentsSearchResults;
  self->_frequentsSearchResults = 0;

  virtualConferenceRoomSearchResults = self->_virtualConferenceRoomSearchResults;
  self->_virtualConferenceRoomSearchResults = 0;

  virtualConferenceCustomSearchResults = self->_virtualConferenceCustomSearchResults;
  self->_virtualConferenceCustomSearchResults = 0;

  if (v3)
  {
    -[CUIKLocationSearchModel delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationSearchModel:updatedSearchTypes:", self, 2047);

  }
}

- (void)cancelSearch
{
  NSObject *v2;
  uint8_t v3[16];

  -[CUIKLocationSearchModel resetSearchResults:](self, "resetSearchResults:", 1);
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_INFO, "Location search cancelled", v3, 2u);
  }

}

- (void)beginSearchForTerm:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unint64_t supportedSearchTypes;
  MKLocalSearchCompleter *v8;
  MKLocalSearchCompleter *completer;
  EKStructuredLocation *currentLocation;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainSearch"));
  ICSRedactString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Location search begins!!", (uint8_t *)&v21, 0xCu);
  }

  -[CUIKLocationSearchModel resetSearchResults:](self, "resetSearchResults:", 0);
  -[CUIKLocationSearchModel getCurrentLocation](self, "getCurrentLocation");
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 4) != 0)
  {
    if (!self->_completer)
    {
      v8 = (MKLocalSearchCompleter *)objc_alloc_init((Class)EKWeakLinkClass());
      completer = self->_completer;
      self->_completer = v8;

      -[MKLocalSearchCompleter setDelegate:](self->_completer, "setDelegate:", self);
      -[MKLocalSearchCompleter setEntriesType:](self->_completer, "setEntriesType:", 0);
      currentLocation = self->_currentLocation;
      if (currentLocation)
      {
        -[EKStructuredLocation geoLocation](currentLocation, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKLocalSearchCompleter setDeviceLocation:](self->_completer, "setDeviceLocation:", v11);

      }
      else if (self->_currentImpreciseLocation)
      {
        -[MKLocalSearchCompleter setDeviceLocation:](self->_completer, "setDeviceLocation:");
      }
    }
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B8A6A000, v12, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit", (uint8_t *)&v21, 0xCu);
    }

    -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainMapCompletions"));
    -[MKLocalSearchCompleter setFragment:](self->_completer, "setFragment:", v4);
    supportedSearchTypes = self->_supportedSearchTypes;
    if ((supportedSearchTypes & 2) == 0)
    {
LABEL_5:
      if ((supportedSearchTypes & 8) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((supportedSearchTypes & 2) == 0)
  {
    goto LABEL_5;
  }
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B8A6A000, v13, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit from URL", (uint8_t *)&v21, 0xCu);
  }

  -[CUIKLocationSearchModel _updateMapURL:](self, "_updateMapURL:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 8) == 0)
  {
LABEL_6:
    if ((supportedSearchTypes & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_21:
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B8A6A000, v14, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Contacts", (uint8_t *)&v21, 0xCu);
  }

  -[CUIKLocationSearchModel updateContacts:](self, "updateContacts:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x10) == 0)
  {
LABEL_7:
    if ((supportedSearchTypes & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_24:
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B8A6A000, v15, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Recents", (uint8_t *)&v21, 0xCu);
  }

  -[CUIKLocationSearchModel updateRecents:](self, "updateRecents:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x20) == 0)
  {
LABEL_8:
    if ((supportedSearchTypes & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_30;
  }
LABEL_27:
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B8A6A000, v16, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Frequents", (uint8_t *)&v21, 0xCu);
  }

  -[CUIKLocationSearchModel searchFrequentLocations:](self, "searchFrequentLocations:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x100) != 0)
  {
LABEL_30:
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B8A6A000, v17, OS_LOG_TYPE_INFO, "[%{public}@] >>>> ConferenceRooms", (uint8_t *)&v21, 0xCu);
    }

    -[CUIKLocationSearchModel searchConferenceRooms:](self, "searchConferenceRooms:", v4);
    supportedSearchTypes = self->_supportedSearchTypes;
  }
LABEL_33:
  if ((supportedSearchTypes & 0xC0) != 0)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B8A6A000, v18, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Events", (uint8_t *)&v21, 0xCu);
    }

    -[CUIKLocationSearchModel updateEventLocations:](self, "updateEventLocations:", v4);
    supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x200) != 0)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B8A6A000, v19, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Rooms", (uint8_t *)&v21, 0xCu);
    }

    -[CUIKLocationSearchModel updateVirtualConferenceRoomOptions:](self, "updateVirtualConferenceRoomOptions:", v4);
    supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x400) != 0)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B8A6A000, v20, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Custom", (uint8_t *)&v21, 0xCu);
    }

    -[CUIKLocationSearchModel _updateVirtualConferenceCustomOptions:](self, "_updateVirtualConferenceCustomOptions:", v4);
  }
  -[CUIKLocationSearchModel _decrementPendingOperationsCountForDomain:](self, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainSearch"));

}

- (unint64_t)dedupeResults
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSMutableArray *frequentsSearchResults;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  NSMutableArray *eventsSearchResults;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NSMutableArray *v23;
  uint64_t v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = self->_recentsSearchResults;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "recent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CUIKRecents locationForRecent:](CUIKRecents, "locationForRecent:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        frequentsSearchResults = self->_frequentsSearchResults;
        if (frequentsSearchResults && -[NSMutableArray count](frequentsSearchResults, "count"))
        {
          v12 = self->_frequentsSearchResults;
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __40__CUIKLocationSearchModel_dedupeResults__block_invoke;
          v40[3] = &unk_1E6EB5DD8;
          v41 = v10;
          -[NSMutableArray indexesOfObjectsPassingTest:](v12, "indexesOfObjectsPassingTest:", v40);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 && objc_msgSend(v13, "count"))
          {
            -[NSMutableArray removeObjectsAtIndexes:](self->_frequentsSearchResults, "removeObjectsAtIndexes:", v14);
            v6 |= 0x20uLL;
          }

        }
        else
        {
          v14 = 0;
        }
        eventsSearchResults = self->_eventsSearchResults;
        if (eventsSearchResults && -[NSMutableArray count](eventsSearchResults, "count"))
        {
          v16 = self->_eventsSearchResults;
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __40__CUIKLocationSearchModel_dedupeResults__block_invoke_2;
          v38[3] = &unk_1E6EB5E00;
          v39 = v10;
          -[NSMutableArray indexesOfObjectsPassingTest:](v16, "indexesOfObjectsPassingTest:", v38);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 && objc_msgSend(v17, "count"))
          {
            -[NSMutableArray removeObjectsAtIndexes:](self->_eventsSearchResults, "removeObjectsAtIndexes:", v17);
            v6 |= 0x40uLL;
          }

        }
        else
        {
          v17 = v14;
        }

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v18 = self->_frequentsSearchResults;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = self->_eventsSearchResults;
        if (v23)
        {
          v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          if (-[NSMutableArray count](v23, "count"))
          {
            v25 = self->_eventsSearchResults;
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __40__CUIKLocationSearchModel_dedupeResults__block_invoke_3;
            v33[3] = &unk_1E6EB5E00;
            v33[4] = v24;
            -[NSMutableArray indexesOfObjectsPassingTest:](v25, "indexesOfObjectsPassingTest:", v33);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26 && objc_msgSend(v26, "count"))
            {
              -[NSMutableArray removeObjectsAtIndexes:](self->_eventsSearchResults, "removeObjectsAtIndexes:", v27);
              v6 |= 0x40uLL;
            }

          }
        }
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
    }
    while (v20);
  }

  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_recentsSearchResults, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_eventsSearchResults, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_frequentsSearchResults, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v29;
    v48 = 2114;
    v49 = v30;
    v50 = 2114;
    v51 = v31;
    _os_log_impl(&dword_1B8A6A000, v28, OS_LOG_TYPE_INFO, "After de-duping search results, Recents: %{public}@, Events: %{public}@, Frequents: %{public}@", buf, 0x20u);

  }
  return v6;
}

uint64_t __40__CUIKLocationSearchModel_dedupeResults__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToLocation:", a2);
}

uint64_t __40__CUIKLocationSearchModel_dedupeResults__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToLocation:", v3);

  return v4;
}

uint64_t __40__CUIKLocationSearchModel_dedupeResults__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToLocation:", v3);

  return v4;
}

- (void)completerDidUpdateResults:(id)a3 finished:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *mapCompletionSearchResults;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CUIKLocationSearchModel _decrementPendingOperationsCountForDomain:](self, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainMapCompletions"));
  objc_msgSend(v5, "queryFragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "resultsAreCurrent");
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "results");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1B8A6A000, v9, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit %{public}@ results", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(v5, "results");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mapCompletionSearchResults = self->_mapCompletionSearchResults;
    self->_mapCompletionSearchResults = v14;

    -[CUIKLocationSearchModel delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject locationSearchModel:updatedSearchTypes:](v9, "locationSearchModel:updatedSearchTypes:", self, 4);
  }
  else if (v10)
  {
    v16 = 138543362;
    v17 = v7;
    _os_log_impl(&dword_1B8A6A000, v9, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit but results are not current", (uint8_t *)&v16, 0xCu);
  }

}

- (void)completerDidFail:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CUIKLocationSearchModel _decrementPendingOperationsCountForDomain:](self, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainMapCompletions"));
  objc_msgSend(v7, "queryFragment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ICSRedactString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] MapKit failed with error: %@", (uint8_t *)&v11, 0x16u);
  }

}

- (void)updateContacts:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *contactsSearchResults;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CNContactStore *contactStore;
  id v15;
  id v16;
  CNCancelable *v17;
  CNCancelable *contactsSearchToken;
  void *v19;
  _QWORD v20[4];
  id v21;
  CUIKLocationSearchModel *v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t *v31;
  _QWORD v32[5];
  _QWORD v33[3];
  char v34;
  _QWORD v35[3];
  char v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[5];
  id v44;

  v4 = a3;
  -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainContacts"));
  ICSRedactString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKLocationSearchModel resetContactsSearchResults](self, "resetContactsSearchResults");
  v5 = (NSMutableArray *)objc_opt_new();
  contactsSearchResults = self->_contactsSearchResults;
  self->_contactsSearchResults = v5;

  -[CUIKLocationSearchModel delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationSearchModel:updatedSearchTypes:", self, 8);

  CUIKDescriptorForRequiredKeysForLabeledDisplayString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", *MEMORY[0x1E0C967F0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)EKWeakLinkClass()), "initWithKeysToFetch:", v9);
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", v4, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__3;
  v43[4] = __Block_byref_object_dispose__3;
  v44 = (id)objc_opt_new();
  v37 = 0;
  v38 = (id *)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke;
  v32[3] = &unk_1E6EB5E28;
  v32[4] = v35;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v32, 0.33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  contactStore = self->_contactStore;
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_2;
  v26[3] = &unk_1E6EB5E78;
  v29 = v33;
  v30 = v35;
  v28 = v43;
  v26[4] = self;
  v27 = v19;
  v31 = &v37;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_100;
  v20[3] = &unk_1E6EB5EC8;
  v15 = v27;
  v21 = v15;
  v22 = self;
  v24 = v43;
  v25 = &v37;
  v16 = v13;
  v23 = v16;
  -[CNContactStore executeFetchRequest:progressiveResults:completion:](contactStore, "executeFetchRequest:progressiveResults:completion:", v10, v26, v20);
  v17 = (CNCancelable *)objc_claimAutoreleasedReturnValue();
  contactsSearchToken = self->_contactsSearchToken;
  self->_contactsSearchToken = v17;

  objc_storeStrong(v38 + 5, v17);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(v43, 8);
}

uint64_t __42__CUIKLocationSearchModel_updateContacts___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __42__CUIKLocationSearchModel_updateContacts___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a2;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v36;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(obj);
        v26 = v3;
        v4 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v3);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v4, "postalAddresses");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v32 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              v11 = (void *)MEMORY[0x1E0C973B0];
              objc_msgSend(v10, "value");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "stringFromPostalAddress:style:", v12, 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "label");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              +[CUIKContactDescriptionGenerator CUIKLabeledDisplayStringForContact:label:](CUIKContactDescriptionGenerator, "CUIKLabeledDisplayStringForContact:label:", v4, v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setContactLabel:", v16);

              objc_msgSend(v14, "setAddress:", v13);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v14);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v7);
        }

        v3 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v25);
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") >= 0xA)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v17 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    objc_msgSend(*(id *)(a1 + 32), "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainContacts"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_3;
    block[3] = &unk_1E6EB5E50;
    v21 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v28 = v21;
    v29 = v17;
    v30 = *(_QWORD *)(a1 + 72);
    v22 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __42__CUIKLocationSearchModel_updateContacts___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainContacts"));
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ progressive results", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateContactsSearchWithResults:forToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

void __42__CUIKLocationSearchModel_updateContacts___block_invoke_100(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_2_101;
  block[3] = &unk_1E6EB5EA0;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  v10 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __42__CUIKLocationSearchModel_updateContacts___block_invoke_2_101(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ results", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainContacts"));
  objc_msgSend(*(id *)(a1 + 40), "_updateContactsSearchWithResults:forToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v6 = *(_QWORD *)(a1 + 40);
  if (v5 == *(void **)(v6 + 80))
  {
    *(_QWORD *)(v6 + 80) = 0;

  }
}

- (void)_updateContactsSearchWithResults:(id)a3 forToken:(id)a4
{
  id v5;

  if (self->_contactsSearchToken == a4)
  {
    -[NSMutableArray addObjectsFromArray:](self->_contactsSearchResults, "addObjectsFromArray:", a3);
    -[CUIKLocationSearchModel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationSearchModel:updatedSearchTypes:", self, 8);

  }
}

- (void)updateRecents:(id)a3
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
  NSObject *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *recentsQueue;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  OS_dispatch_queue *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  CUIKLocationSearchModel *v30;
  id v31;
  id v32[2];
  id buf;
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((self->_supportedSearchTypes & 0x10) != 0)
  {
    -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainRecents"));
    if (v4)
    {
      EKWeakLinkStringConstant();
      v27 = objc_claimAutoreleasedReturnValue();
      EKWeakLinkStringConstant();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      EKWeakLinkStringConstant();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      EKWeakLinkStringConstant();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)EKWeakLinkClass();
      v35 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateForKey:inCollection:", v26, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v7;
      objc_msgSend(v5, "predicateForKey:matchingText:comparison:", v25, v4, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v8;
      objc_msgSend(v5, "predicateForKey:matchingText:comparison:", v24, v4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateSatisfyingAnySubpredicate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateSatisfyingAllSubpredicates:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v27;
    }
    else
    {
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B8A6A000, v14, OS_LOG_TYPE_INFO, "Recents query is nil, returning all recents", (uint8_t *)&buf, 2u);
      }
      v13 = 0;
    }

    if (!self->_recentsQueue)
    {
      v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.recents", 0);
      recentsQueue = self->_recentsQueue;
      self->_recentsQueue = v15;

    }
    objc_initWeak(&buf, self);
    v17 = (void *)EKWeakLinkClass();
    v18 = (objc_class *)EKWeakLinkClass();
    v19 = objc_alloc_init(v18);
    objc_msgSend(v19, "setSearchPredicate:", v13);
    objc_msgSend(v19, "setDomains:", &unk_1E6ED70E8);
    -[objc_class frecencyComparator](v18, "frecencyComparator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setComparator:", v20);

    objc_storeStrong((id *)&self->_currentRecentsSearch, v19);
    objc_msgSend(v17, "defaultInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_recentsQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke;
    v28[3] = &unk_1E6EB5F90;
    objc_copyWeak(v32, &buf);
    v23 = v19;
    v29 = v23;
    v30 = self;
    v32[1] = v17;
    v31 = v4;
    objc_msgSend(v21, "performRecentsSearch:queue:completion:", v23, v22, v28);

    objc_destroyWeak(v32);
    objc_destroyWeak(&buf);

  }
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "isEqual:", WeakRetained[16]))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_2;
    v6[3] = &unk_1E6EB5F68;
    v6[4] = *(_QWORD *)(a1 + 40);
    v5 = v3;
    v11 = *(_QWORD *)(a1 + 64);
    v7 = v5;
    v8 = WeakRetained;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  CUIKConferenceRoom *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *group;
  void *v25;
  id obj;
  void *v27;
  _QWORD block[4];
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceForSearchModel:", *(_QWORD *)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = *(id *)(a1 + 40);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (!+[CUIKRecents recentIsDirectoryLocation:](CUIKRecents, "recentIsDirectoryLocation:", v8))
          goto LABEL_19;
        v9 = objc_alloc_init(CUIKConferenceRoom);
        v10 = objc_alloc_init(MEMORY[0x1E0CAA048]);
        -[CUIKConferenceRoom setLocation:](v9, "setLocation:", v10);

        objc_msgSend(v8, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKConferenceRoom location](v9, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDisplayName:", v11);

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "shouldIncludeConferenceRoom:", v9);

        if (+[CUIKRecents recentDirectoryLocation:matchesSource:](CUIKRecents, "recentDirectoryLocation:matchesSource:", v8, v25))
        {
          if (v14)
          {
LABEL_19:
            if (+[CUIKRecents recentMissingStyleAttributes:](CUIKRecents, "recentMissingStyleAttributes:", v8))
            {
              +[CUIKRecents mapKitHandleForRecent:](CUIKRecents, "mapKitHandleForRecent:", v8);
              v15 = (id)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                dispatch_group_enter(group);
                v16 = (void *)MEMORY[0x1E0CC1828];
                v35[0] = MEMORY[0x1E0C809B0];
                v35[1] = 3221225472;
                v35[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_3;
                v35[3] = &unk_1E6EB5EF0;
                v36 = v27;
                v37 = v8;
                v40 = *(_QWORD *)(a1 + 72);
                v15 = v15;
                v38 = v15;
                v39 = group;
                objc_msgSend(v16, "_mapItemFromHandle:completionHandler:", v15, v35);

              }
            }
            else
            {
              +[CUIKRecents mapKitStyleAttributesForRecent:](CUIKRecents, "mapKitStyleAttributesForRecent:", v8);
              v15 = (id)objc_claimAutoreleasedReturnValue();
              os_unfair_lock_lock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "contactID"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v15, v17);

              os_unfair_lock_unlock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
            }

            objc_msgSend(v3, "addObject:", v8);
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v5);
  }

  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(void **)(a1 + 56);
  v20 = *(NSObject **)(v18 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_121;
  block[3] = &unk_1E6EB5F40;
  v29 = group;
  v30 = v3;
  v31 = v27;
  v32 = v18;
  v33 = v19;
  v34 = *(id *)(a1 + 64);
  v21 = v27;
  v22 = v3;
  v23 = group;
  dispatch_async(v20, block);

}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
    objc_msgSend(v5, "_styleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "contactID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    os_unfair_lock_unlock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "_styleAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKRecents recentEventWithRecentContact:styleAttributes:](CUIKRecents, "recentEventWithRecentContact:styleAttributes:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "defaultInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordContactEvents:recentsDomain:sendingAddress:completion:", v14, CFSTR("com.apple.eventkit.ios"), 0, 0);

  }
  else
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 48);
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1B8A6A000, v12, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when updating recents: %@, %@", (uint8_t *)&v16, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_121(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CUIKRecentContactWithImage *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id obj;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v2, v3))
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8A6A000, v4, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v11 = objc_alloc_init(CUIKRecentContactWithImage);
        -[CUIKRecentContactWithImage setRecent:](v11, "setRecent:", v10);
        os_unfair_lock_lock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
        v12 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "contactID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
        objc_msgSend(*(id *)(a1 + 56), "_imageForAttributes:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKRecentContactWithImage setImage:](v11, "setImage:", v15);

        objc_msgSend(v5, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_123;
  block[3] = &unk_1E6EB5F18;
  v16 = *(id *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 56);
  v21 = v16;
  v22 = v17;
  v23 = v5;
  v24 = *(id *)(a1 + 72);
  v18 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_123(uint64_t a1)
{
  char v2;
  id *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  v3 = *(id **)(a1 + 40);
  if ((v2 & 1) == 0)
  {
    objc_msgSend(v3, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainRecents"));
    return;
  }
  objc_msgSend(v3[22], "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
  {
    ICSRedactString();
    v4 = objc_claimAutoreleasedReturnValue();
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v4;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1B8A6A000, v5, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Recents %{public}@ results", (uint8_t *)&v9, 0x16u);

    }
    goto LABEL_8;
  }
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "count"));
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1B8A6A000, v4, OS_LOG_TYPE_INFO, "Returning all Recents %{public}@ results", (uint8_t *)&v9, 0xCu);
LABEL_8:

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "dedupeResults") | 0x10;
  objc_msgSend(*(id *)(a1 + 40), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainRecents"));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), v7);

}

- (id)_imageForMapHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!v3
    || (objc_msgSend((id)_mapItemCache, "objectForKey:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        CUIKImageForMapItem(v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    CUIKMapPinImage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_imageForAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (!v3 || (CUIKImageForAttributes(v3), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    CUIKMapPinImage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)searchFrequentLocations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainFrequents"));
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CAA180];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke;
  v7[3] = &unk_1E6EB5FB8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "estimateGeolocationFromHistoricDevicePositionAtLocation:withCompletionBlock:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke_2;
    v9[3] = &unk_1E6EB5F18;
    v9[4] = WeakRetained;
    v10 = v5;
    v11 = v6;
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  if (v2)
  {
    objc_msgSend(v2, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 184);
    *(_QWORD *)(v4 + 184) = v3;

  }
  if (*(_QWORD *)(a1 + 40) && !*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGeoLocation:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setAddress:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addObject:", v6);

  }
  ICSRedactString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "frequentsSearchResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1B8A6A000, v8, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Frequents %{public}@ results", (uint8_t *)&v14, 0x16u);

  }
  v12 = objc_msgSend(*(id *)(a1 + 32), "dedupeResults") | 0x20;
  objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainFrequents"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), v12);

}

- (id)splitEventLocations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v20;
  id v21;
  void *v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "structuredLocationWithoutPrediction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocationWithoutPrediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("; "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v20 = v3;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attendees");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = v24;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
LABEL_8:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v11);

            if ((v18 & 1) != 0)
              break;
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v14)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          if (v22)
            objc_msgSend(v22, "duplicate");
          else
            objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTitle:", v11);
          objc_msgSend(v21, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  return v21;
}

- (void)updateEventLocations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EKEventStore *eventStore;
  uint64_t v11;
  EKOccurrenceCacheLocationSearch *v12;
  EKOccurrenceCacheLocationSearch *eventsSearch;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *eventsQueue;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  CUIKLocationSearchModel *v22;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E6EBAE30) & 1) == 0 && self->_eventStore)
  {
    -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainEvents"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    -[EKEventStore readWriteCalendarsForEntityType:](self->_eventStore, "readWriteCalendarsForEntityType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CAA0C8];
    eventStore = self->_eventStore;
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke;
    v20[3] = &unk_1E6EB60D0;
    v21 = v5;
    v22 = self;
    objc_msgSend(v9, "searchWithCalendars:searchTerm:store:callback:", v8, v21, eventStore, v20);
    v12 = (EKOccurrenceCacheLocationSearch *)objc_claimAutoreleasedReturnValue();
    eventsSearch = self->_eventsSearch;
    self->_eventsSearch = v12;

    if (!self->_eventsQueue)
    {
      v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.eventslocation", 0);
      eventsQueue = self->_eventsQueue;
      self->_eventsQueue = v14;

    }
    objc_initWeak(&location, self->_eventsSearch);
    v16 = self->_eventsQueue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_146;
    block[3] = &unk_1E6EB6120;
    objc_copyWeak(&v18, &location);
    block[4] = self;
    dispatch_async(v16, block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ICSRedactString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v4;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1B8A6A000, v5, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ match results", buf, 0x16u);

  }
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v8 + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_135;
  block[3] = &unk_1E6EB60A8;
  block[4] = v8;
  v13 = v4;
  v10 = v7;
  v14 = v10;
  v15 = *(id *)(a1 + 32);
  v16 = v10;
  v11 = v4;
  dispatch_async(v9, block);

}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_135(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  CUIKStructuredLocationWithImage *v23;
  void *v24;
  dispatch_time_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  id obj;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t i;
  NSObject *group;
  _QWORD v45[5];
  id v46;
  id v47;
  uint64_t *v48;
  _QWORD v49[5];
  id v50;
  uint64_t *v51;
  _BYTE *v52;
  uint64_t *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[6];
  _QWORD v59[4];
  id v60;
  void *v61;
  NSObject *v62;
  _QWORD v63[6];
  uint8_t v64[8];
  uint8_t *v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD block[5];
  id v77;
  uint64_t *v78;
  _BYTE *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint8_t v93[128];
  _BYTE buf[24];
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "searchTerm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v37 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    v95 = v37;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Processing %{public}@ match results, events search text = %{public}@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v95 = __Block_byref_object_copy__3;
  v96 = __Block_byref_object_dispose__3;
  v97 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__3;
  v89 = __Block_byref_object_dispose__3;
  v90 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_136;
  block[3] = &unk_1E6EB5FE0;
  block[4] = *(_QWORD *)(a1 + 32);
  v77 = *(id *)(a1 + 56);
  v78 = &v81;
  v79 = buf;
  v80 = &v85;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  if (*((_BYTE *)v82 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainEvents"));
  }
  else
  {
    group = dispatch_group_create();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = *(id *)(a1 + 64);
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
    if (v40)
    {
      v39 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v73 != v39)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", CUIKOccurrenceInfoEventKey);
          v6 = objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
            objc_msgSend(v5, "objectForKey:", CUIKOccurrenceInfoObjectIDKey);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKey:", CUIKOccurrenceInfoDateKey);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "eventForObjectID:occurrenceDate:checkValid:", v7, v8, 0);
            v9 = objc_claimAutoreleasedReturnValue();

            v6 = v9;
          }
          v41 = (void *)v6;
          objc_msgSend(*(id *)(a1 + 32), "splitEventLocations:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v69;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v69 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                objc_msgSend(v15, "geoLocation");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  *(_QWORD *)v64 = 0;
                  v65 = v64;
                  v66 = 0x2020000000;
                  v67 = 1;
                  v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  v63[0] = MEMORY[0x1E0C809B0];
                  v63[1] = 3221225472;
                  v63[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_137;
                  v63[3] = &unk_1E6EB6008;
                  v63[4] = v15;
                  v63[5] = v64;
                  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v63);
                  if (v15 && v65[24])
                  {
                    objc_msgSend(v15, "mapKitHandle");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v18)
                    {
                      objc_msgSend((id)_mapItemCache, "objectForKey:", v18);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      v20 = v19 == 0;

                      if (v20)
                      {
                        dispatch_group_enter(group);
                        v21 = (void *)MEMORY[0x1E0CC1828];
                        v59[0] = MEMORY[0x1E0C809B0];
                        v59[1] = 3221225472;
                        v59[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2;
                        v59[3] = &unk_1E6EB6030;
                        v22 = v18;
                        v60 = v22;
                        v61 = v15;
                        v62 = group;
                        objc_msgSend(v21, "_mapItemFromHandle:completionHandler:", v22, v59);

                      }
                    }
                    v23 = objc_alloc_init(CUIKStructuredLocationWithImage);
                    -[CUIKStructuredLocationWithImage setLocation:](v23, "setLocation:", v15);
                    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObject:", v23);

                  }
                }
                else
                {
                  *(_QWORD *)v64 = 0;
                  v65 = v64;
                  v66 = 0x2020000000;
                  v67 = 1;
                  v24 = (void *)v86[5];
                  v58[0] = MEMORY[0x1E0C809B0];
                  v58[1] = 3221225472;
                  v58[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_140;
                  v58[3] = &unk_1E6EB6058;
                  v58[4] = v15;
                  v58[5] = v64;
                  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v58);
                  if (v15 && v65[24])
                    objc_msgSend((id)v86[5], "addObject:", v15);
                }
                _Block_object_dispose(v64, 8);
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
            }
            while (v12);
          }

        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      }
      while (v40);
    }

    v25 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(group, v25))
    {
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v64 = 0;
        _os_log_impl(&dword_1B8A6A000, v26, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", v64, 2u);
      }

    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v27 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v91, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v55 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          objc_msgSend(v31, "location");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "mapKitHandle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_imageForMapHandle:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setImage:", v34);

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v91, 16);
      }
      while (v28);
    }

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_142;
    v49[3] = &unk_1E6EB5FE0;
    v49[4] = *(_QWORD *)(a1 + 32);
    v50 = *(id *)(a1 + 56);
    v51 = &v81;
    v52 = buf;
    v53 = &v85;
    v35 = MEMORY[0x1E0C80D38];
    dispatch_sync(MEMORY[0x1E0C80D38], v49);

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_143;
    v45[3] = &unk_1E6EB6080;
    v36 = *(_QWORD *)(a1 + 32);
    v48 = &v81;
    v45[4] = v36;
    v46 = *(id *)(a1 + 56);
    v47 = *(id *)(a1 + 48);
    dispatch_async(v35, v45);

  }
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);

  _Block_object_dispose(buf, 8);
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_136(_QWORD *a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 120), "searchTerm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", a1[5]);

  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1[4] + 192);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = a1[4];
      v7 = *(void **)(v6 + 192);
      *(_QWORD *)(v6 + 192) = v5;

      v4 = *(_QWORD *)(a1[4] + 192);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(a1[4] + 256);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[4];
      v14 = *(void **)(v13 + 256);
      *(_QWORD *)(v13 + 256) = v12;

      v11 = *(_QWORD *)(a1[4] + 256);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1[8] + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    ICSRedactString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 120), "searchTerm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ICSRedactString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = 138543618;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_1B8A6A000, v21, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before processing matches because query changed, events search text = %{public}@", (uint8_t *)&v22, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_137(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToLocation:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend((id)_mapItemCache, "setObject:forKey:", a2, *(_QWORD *)(a1 + 32));
  }
  else
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "mapKitHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when fetching event locations: %@, %@", (uint8_t *)&v8, 0x16u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_140(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToLocation:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_142(_QWORD *a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 120), "searchTerm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", a1[5]);

  if ((v3 & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "mutableCopy");
    v5 = a1[4];
    v6 = *(void **)(v5 + 192);
    *(_QWORD *)(v5 + 192) = v4;

    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "mutableCopy");
    v8 = a1[4];
    v9 = *(void **)(v8 + 256);
    *(_QWORD *)(v8 + 256) = v7;

  }
  else
  {
    ICSRedactString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 120), "searchTerm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICSRedactString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_1B8A6A000, v13, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before setting results because query changed, events search text = %{public}@", (uint8_t *)&v14, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_143(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "searchTerm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v5 & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      ICSRedactString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v6;
        v18 = 2114;
        v19 = v8;
        _os_log_impl(&dword_1B8A6A000, v7, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ results", (uint8_t *)&v16, 0x16u);

      }
      v2 = objc_msgSend(*(id *)(a1 + 32), "dedupeResults") | 0xC0;

      goto LABEL_3;
    }
LABEL_2:
    v2 = 192;
LABEL_3:
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainEvents"));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), v2);
    goto LABEL_6;
  }
  ICSRedactString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "searchTerm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1B8A6A000, v11, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before updating results because query changed, events search text = %{public}@", (uint8_t *)&v16, 0x16u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 192);
  *(_QWORD *)(v12 + 192) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 256);
  *(_QWORD *)(v14 + 256) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainEvents"));
LABEL_6:

}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_146(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "run");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2_147;
    block[3] = &unk_1E6EB60F8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2_147(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainEvents"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 272));
  objc_msgSend(WeakRetained, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), 64);

}

- (NSArray)conferenceRoomSearchResults
{
  return (NSArray *)self->_mutableConferenceRoomSearchResults;
}

- (void)searchConferenceRooms:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke;
  v6[3] = &unk_1E6EB6170;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceForSearchModel:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsLocationDirectorySearches");

  v6 = *(_QWORD **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    v7 = v6[18];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_148;
    block[3] = &unk_1E6EB61C0;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v12 = v8;
    v13 = v9;
    v14 = v3;
    dispatch_async(v7, block);

    v10 = v12;
  }
  else
  {
    objc_msgSend(v6, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_DEBUG, "The source for the search model's event does not support location directory searches.  Will not search for conference rooms.", buf, 2u);
    }
  }

}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_148(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int8x16_t v12;
  _QWORD block[4];
  int8x16_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id location[2];

  objc_msgSend(*(id *)(a1 + 32), "componentsSeparatedByCharactersInSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v2);
  v4 = objc_alloc_init(MEMORY[0x1E0CAA058]);
  objc_msgSend(v4, "setTerms:", v3);
  objc_msgSend(v4, "setFindLocations:", 1);
  +[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationSearchResultLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setResultLimit:", objc_msgSend(v6, "unsignedIntegerValue"));
  objc_initWeak(location, *(id *)(a1 + 40));
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2;
  aBlock[3] = &unk_1E6EB6148;
  objc_copyWeak(&v21, location);
  v20 = 0;
  v8 = _Block_copy(aBlock);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA050]), "initWithSource:query:resultsBlock:", *(_QWORD *)(a1 + 48), v4, v8);
  objc_initWeak(&from, v9);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_3;
  v15[3] = &unk_1E6EB6198;
  objc_copyWeak(&v17, &from);
  v15[4] = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v16 = v10;
  objc_msgSend(v9, "setCompletionBlock:", v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "cancelAllOperations");
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2_155;
  block[3] = &unk_1E6EB6170;
  v12 = *(int8x16_t *)(a1 + 32);
  v11 = (id)v12.i64[0];
  v14 = vextq_s8(v12, v12, 8uLL);
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "addOperation:", v9);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v21);
  objc_destroyWeak(location);

}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_processDirectorySearchResultSet:forOperation:", v4, *(_QWORD *)(a1 + 32));

}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[4];
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v4 = MEMORY[0x1E0C809B0];
  if (WeakRetained)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_153;
    block[3] = &unk_1E6EB6170;
    v9 = WeakRetained;
    v10 = *(id *)(a1 + 40);
    dispatch_async(v5, block);

    v6 = v9;
  }
  else
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_DEBUG, "The directory search operation went away.  Returning early.", buf, 2u);
    }
  }

  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_154;
  v7[3] = &unk_1E6EB60F8;
  v7[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_153(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = (uint64_t)v2;
        v4 = "Directory search operation completed with error: [%@]";
        v5 = v3;
        v6 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_1B8A6A000, v5, v6, v4, (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesExceededLimit"))
      {
LABEL_10:

        return;
      }
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v7 = objc_msgSend(*(id *)(a1 + 40), "resultLimit");
        v8 = 134217984;
        v9 = v7;
        v4 = "Directory search operation completed.  The number of matches exceeded the original result limit of [%tu]";
        v5 = v3;
        v6 = OS_LOG_TYPE_DEBUG;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_154(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), 256);

}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2_155(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeAllObjects");
  ICSRedactString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v2;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B8A6A000, v3, OS_LOG_TYPE_INFO, "[%{public}@] <<<< ConferenceRooms %{public}@ results", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), 256);

}

- (void)_processDirectorySearchResultSet:(id)a3 forOperation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  CUIKLocationSearchModel *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke;
  block[3] = &unk_1E6EB61C0;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  char v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
  }
  else
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceForSearchModel:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsAvailabilityRequests");

    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2;
    block[3] = &unk_1E6EB6210;
    v9 = *(id *)(a1 + 48);
    v14 = v7;
    v10 = *(_QWORD *)(a1 + 40);
    v12 = v9;
    v13 = v10;
    dispatch_async(v8, block);

  }
}

void __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3;
  v5[3] = &unk_1E6EB61E8;
  v7 = *(_BYTE *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  objc_msgSend(*(id *)(a1 + 40), "_addDiscoveredConferenceRooms:", v4);
}

void __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CUIKConferenceRoom *v5;

  v3 = a2;
  v5 = objc_alloc_init(CUIKConferenceRoom);
  -[CUIKConferenceRoom setLocation:](v5, "setLocation:", v3);

  -[CUIKConferenceRoom setAvailability:](v5, "setAvailability:", 0);
  -[CUIKConferenceRoom setSupportsAvailability:](v5, "setSupportsAvailability:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "shouldIncludeConferenceRoom:", v5);

  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)_addDiscoveredConferenceRooms:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CUIKLocationSearchModel *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke;
  v6[3] = &unk_1E6EB6170;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  void *v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v3;
    _os_log_impl(&dword_1B8A6A000, v2, OS_LOG_TYPE_INFO, "<<<< ConferenceRooms %{public}@ results", buf, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_157;
  aBlock[3] = &__block_descriptor_40_e51_q24__0__CUIKConferenceRoom_8__CUIKConferenceRoom_16l;
  aBlock[4] = 193;
  v5 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "sortWithOptions:usingComparator:", 16, v5);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventIDForSearchModel:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceForSearchModel:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateIntervalForSearchModel:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldIssueAvailabilityRequestForSearchModel:", *(_QWORD *)(a1 + 40));

  if (!v13)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v24 = "Not issuing availability request per delegate.";
      v25 = v23;
      v26 = 2;
LABEL_10:
      _os_log_impl(&dword_1B8A6A000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    }
LABEL_11:

    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 40), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
    goto LABEL_12;
  }
  objc_msgSend(v9, "constraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsAvailabilityRequests");

  if ((v15 & 1) == 0)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      v24 = "Not issuing availability request because the source does not support it: [%@]";
      v25 = v23;
      v26 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = *(void **)(a1 + 32);
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_160;
  v34[3] = &unk_1E6EB6258;
  v18 = v16;
  v19 = *(_QWORD *)(a1 + 40);
  v35 = v18;
  v36 = v19;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v34);
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(NSObject **)(v20 + 144);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2;
  block[3] = &unk_1E6EB5F40;
  block[4] = v20;
  v22 = v18;
  v29 = v22;
  v30 = v7;
  v31 = v9;
  v32 = v11;
  v33 = *(id *)(a1 + 32);
  dispatch_async(v21, block);

LABEL_12:
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), 256);

}

uint64_t __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(a2, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "compare:options:", v9, *(_QWORD *)(a1 + 32));
  return v10;
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_160(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setObject:forKey:", v5, v4);
    objc_msgSend(v5, "setAvailabilityRequestInProgress:", 1);
  }

}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id from;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3;
  aBlock[3] = &unk_1E6EB6280;
  objc_copyWeak(&v12, &location);
  v11 = 0;
  v3 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_availabilityRequestForConferenceRooms:eventID:source:dateInterval:resultsBlock:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v4);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5;
  v5[3] = &unk_1E6EB62D0;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  v6 = *(id *)(a1 + 72);
  objc_msgSend(v4, "setCompletionBlock:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addOperation:", v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[18];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4;
    block[3] = &unk_1E6EB61C0;
    block[4] = WeakRetained;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

uint64_t __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAvailabilityResults:forOperation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5(id *a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  _QWORD block[4];
  NSObject *v9;
  id v10;
  _QWORD *v11;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = v3;
  if (!WeakRetained)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v7 = "self went away.  Returning early.";
LABEL_8:
    _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
    goto LABEL_9;
  }
  if (!v3)
  {
    objc_msgSend(WeakRetained, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v7 = "The availability operation went away.  Returning early.";
    goto LABEL_8;
  }
  v5 = WeakRetained[18];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_163;
  block[3] = &unk_1E6EB61C0;
  v9 = v3;
  v10 = a1[4];
  v11 = WeakRetained;
  dispatch_async(v5, block);

  v6 = v9;
LABEL_9:

}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_163(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v2;
        _os_log_impl(&dword_1B8A6A000, v3, OS_LOG_TYPE_ERROR, "Availability operation completed with error: [%@]", buf, 0xCu);
      }

    }
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_164;
  v6[3] = &unk_1E6EB6170;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_164(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_165;
  v4[3] = &unk_1E6EB62A8;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
  if (*((_BYTE *)v6 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainConferenceRooms"));
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), 256);

  }
  _Block_object_dispose(&v5, 8);
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_165(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "availabilityRequestInProgress"))
  {
    objc_msgSend(v3, "setAvailabilityRequestInProgress:", 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (id)_availabilityRequestForConferenceRooms:(id)a3 eventID:(id)a4 source:(id)a5 dateInterval:(id)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v13 = (objc_class *)MEMORY[0x1E0CAA130];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = [v13 alloc];
  objc_msgSend(v16, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v20, "initWithSource:startDate:endDate:ignoredEventID:addresses:resultsBlock:", v17, v21, v22, v18, v19, v15);
  objc_msgSend(v23, "setCompletionBlock:", v14);

  return v23;
}

- (void)updateConferenceRoomAvailability:(id)a3 duringEvent:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *conferenceRoomProcessingQueue;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD block[5];
  id v30;
  _QWORD aBlock[4];
  id v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke;
  aBlock[3] = &unk_1E6EB62F8;
  v9 = v7;
  v32 = v9;
  v10 = a5;
  v27 = _Block_copy(aBlock);
  v25 = v9;
  objc_msgSend(v9, "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "preferredAddress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isDetached");
  if (v11)
  {
    objc_msgSend(v8, "originalItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uniqueID");
  }
  else
  {
    objc_msgSend(v8, "uniqueID");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v8, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v17);
  -[CUIKLocationSearchModel _availabilityRequestForConferenceRooms:eventID:source:dateInterval:resultsBlock:completionBlock:](self, "_availabilityRequestForConferenceRooms:eventID:source:dateInterval:resultsBlock:completionBlock:", v26, v12, v14, v18, v27, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {

    v12 = v22;
  }

  objc_msgSend(v25, "setAvailabilityRequestInProgress:", 1);
  conferenceRoomProcessingQueue = self->_conferenceRoomProcessingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2;
  block[3] = &unk_1E6EB6170;
  block[4] = self;
  v30 = v19;
  v21 = v19;
  dispatch_async(conferenceRoomProcessingQueue, block);

}

void __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setAvailability:", objc_msgSend(MEMORY[0x1E0CA9FE8], "summarizedAvailabilityTypeForSpans:", v7));
  objc_msgSend(*(id *)(a1 + 32), "setAvailabilityRequestInProgress:", 0);

}

uint64_t __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addOperation:", *(_QWORD *)(a1 + 40));
}

- (void)_handleAvailabilityResults:(id)a3 forOperation:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  CUIKLocationSearchModel *v9;

  v6 = a3;
  if ((objc_msgSend(a4, "isCancelled") & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke;
    v7[3] = &unk_1E6EB6170;
    v8 = v6;
    v9 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2;
  v4[3] = &unk_1E6EB6320;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), 256);

}

void __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CA9FE8];
  v6 = a2;
  v7 = objc_msgSend(v5, "summarizedAvailabilityTypeForSpans:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAvailability:", v7);
  objc_msgSend(v8, "setAvailabilityRequestInProgress:", 0);

}

- (void)_addLocationToRecents:(id)a3 addressString:(id)a4 mapItem:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "contactLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v7, "title");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  if (v8 && v13)
  {
    v14 = (void *)EKWeakLinkClass();
    +[CUIKRecents recentForLocation:withAddressString:andTitle:mapItem:](CUIKRecents, "recentForLocation:withAddressString:andTitle:mapItem:", v7, v8, v13, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordContactEvents:recentsDomain:sendingAddress:completion:", v17, CFSTR("com.apple.eventkit.ios"), 0, 0);

LABEL_9:
    goto LABEL_10;
  }
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_1B8A6A000, v15, OS_LOG_TYPE_ERROR, "can't add to recents, missing info: %@ %@", (uint8_t *)&v18, 0x16u);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)addConferenceRoomToRecents:(id)a3 fromSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)EKWeakLinkClass();
  objc_msgSend(v6, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CUIKRecents recentForDirectoryLocation:onSource:](CUIKRecents, "recentForDirectoryLocation:onSource:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "defaultInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordContactEvents:recentsDomain:sendingAddress:completion:", v11, CFSTR("com.apple.eventkit.ios"), 0, 0);

}

- (BOOL)removeRecentLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSMutableArray *recentsSearchResults;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)EKWeakLinkClass(), "defaultInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "removeRecentContacts:error:", v6, 0);

  if (v7)
  {
    recentsSearchResults = self->_recentsSearchResults;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__CUIKLocationSearchModel_removeRecentLocation___block_invoke;
    v11[3] = &unk_1E6EB6348;
    v12 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_recentsSearchResults, "removeObjectAtIndex:", -[NSMutableArray indexOfObjectPassingTest:](recentsSearchResults, "indexOfObjectPassingTest:", v11));
    -[CUIKLocationSearchModel delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationSearchModel:updatedSearchTypes:", self, 16);

  }
  return v7;
}

uint64_t __48__CUIKLocationSearchModel_removeRecentLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)selectMapSearchCompletion:(id)a3
{
  id v4;
  MKLocalSearch *localSearch;
  MKLocalSearch *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  MKLocalSearch *v10;
  MKLocalSearch *v11;
  MKLocalSearch *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  CUIKLocationSearchModel *v19;

  v4 = a3;
  localSearch = self->_localSearch;
  if (localSearch)
  {
    -[MKLocalSearch cancel](localSearch, "cancel");
    v6 = self->_localSearch;
    self->_localSearch = 0;

  }
  v7 = (void *)EKWeakLinkClass();
  v8 = (objc_class *)EKWeakLinkClass();
  objc_msgSend(v7, "searchRequestWithCompletion:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (MKLocalSearch *)objc_msgSend([v8 alloc], "initWithRequest:", v9);
  v11 = self->_localSearch;
  self->_localSearch = v10;

  v12 = self->_localSearch;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __53__CUIKLocationSearchModel_selectMapSearchCompletion___block_invoke;
  v17 = &unk_1E6EB6370;
  v18 = v4;
  v19 = self;
  v13 = v4;
  -[MKLocalSearch startWithCompletionHandler:](v12, "startWithCompletionHandler:", &v14);
  objc_msgSend(v13, "sendFeedback", v14, v15, v16, v17);

}

void __53__CUIKLocationSearchModel_selectMapSearchCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
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

  v26 = a2;
  v5 = a3;
  objc_msgSend(v26, "mapItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (objc_class *)EKWeakLinkClass();
    objc_msgSend(v26, "mapItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "placemark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    v13 = v12;
    v15 = v14;

    v16 = (void *)objc_msgSend([v8 alloc], "initWithLatitude:longitude:", v13, v15);
    v7 = objc_alloc_init(MEMORY[0x1E0CAA158]);
    objc_msgSend(v10, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v17);

    objc_msgSend(v7, "setGeoLocation:", v16);
    objc_msgSend(*(id *)(a1 + 32), "displayLines");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAddress:", v19);

    objc_msgSend(v10, "placemark");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "region");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "radius");
    objc_msgSend(v7, "setRadius:");

    objc_msgSend(v10, "_handle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMapKitHandle:", v22);

    v23 = *(void **)(a1 + 40);
    objc_msgSend(v7, "address");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_addLocationToRecents:addressString:mapItem:", v7, v24, v10);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "locationSearchModel:selectedLocation:withError:", *(_QWORD *)(a1 + 40), v7, v5);

}

- (void)selectLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CUIKLocationSearchModel *v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  objc_msgSend(v4, "mapKitHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CC1828];
    objc_msgSend(v4, "mapKitHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__CUIKLocationSearchModel_selectLocation___block_invoke;
    v18[3] = &unk_1E6EB6398;
    v18[4] = self;
    v19 = v4;
    v8 = v4;
    objc_msgSend(v6, "_mapItemFromHandle:completionHandler:", v7, v18);

    -[CUIKLocationSearchModel delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationSearchModel:selectedLocation:withError:", self, v8, 0);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D0C328];
    objc_msgSend(v4, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fullDisplayStringWithTitle:address:", v11, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D0C300];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__CUIKLocationSearchModel_selectLocation___block_invoke_180;
    v15[3] = &unk_1E6EB6398;
    v16 = v4;
    v17 = self;
    v14 = v4;
    objc_msgSend(v13, "geocodeLocationString:withCompletionBlock:", v8, v15);

  }
}

void __42__CUIKLocationSearchModel_selectLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_addLocationToRecents:addressString:mapItem:", v7, v9, v5);

  }
  else
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_ERROR, "Failed to convert mapKitHandle to mapItem in selectLocation: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

void __42__CUIKLocationSearchModel_selectLocation___block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1B8A6A000, v7, OS_LOG_TYPE_ERROR, "Location search failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateFromMapItem:", v5);
    v9 = *(void **)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v9, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_addLocationToRecents:addressString:mapItem:", v9, v10, v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationSearchModel:selectedLocation:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v6);

}

- (void)selectCurrentLocation
{
  CLGeocoder *geocoder;
  CLGeocoder *v4;
  CLGeocoder *v5;
  CLGeocoder *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  geocoder = self->_geocoder;
  if (!geocoder)
  {
    v4 = (CLGeocoder *)objc_alloc_init((Class)EKWeakLinkClass());
    v5 = self->_geocoder;
    self->_geocoder = v4;

    geocoder = self->_geocoder;
  }
  if (-[CLGeocoder isGeocoding](geocoder, "isGeocoding"))
    -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
  objc_initWeak(&location, self);
  v6 = self->_geocoder;
  -[EKStructuredLocation geoLocation](self->_currentLocation, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CUIKLocationSearchModel_selectCurrentLocation__block_invoke;
  v8[3] = &unk_1E6EB63C0;
  objc_copyWeak(&v9, &location);
  -[CLGeocoder reverseGeocodeLocation:completionHandler:](v6, "reverseGeocodeLocation:completionHandler:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__CUIKLocationSearchModel_selectCurrentLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1B8A6A000, v8, OS_LOG_TYPE_ERROR, "Current Location search failed with error: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (!objc_msgSend(v5, "count"))
      {
LABEL_12:
        objc_msgSend(WeakRetained, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "locationSearchModel:selectedLocation:withError:", WeakRetained, WeakRetained[4], 0);

        goto LABEL_13;
      }
      objc_msgSend(v5, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject postalAddress](v8, "postalAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject name](v8, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[4], "setTitle:", v10);

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[4], "setAddress:", v11);

        objc_msgSend(WeakRetained[4], "setRadius:", 100.0);
        objc_msgSend(WeakRetained[4], "title");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12
          || (v13 = (void *)v12,
              objc_msgSend(WeakRetained[4], "title"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "isEqualToString:", &stru_1E6EBAE30),
              v14,
              v13,
              v15))
        {
          objc_msgSend(WeakRetained[4], "address");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained[4], "setTitle:", v16);

        }
      }

    }
    goto LABEL_12;
  }
LABEL_13:

}

+ (id)_dataDetector
{
  if (_dataDetector_onceToken != -1)
    dispatch_once(&_dataDetector_onceToken, &__block_literal_global_183);
  return (id)_dataDetector_dataDetector;
}

void __40__CUIKLocationSearchModel__dataDetector__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v5[8];
  id v6;

  v6 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 2080, &v6);
  v1 = v6;
  v2 = (void *)_dataDetector_dataDetector;
  _dataDetector_dataDetector = v0;

  if (_dataDetector_dataDetector)
    v3 = 1;
  else
    v3 = v1 == 0;
  if (!v3)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B8A6A000, v4, OS_LOG_TYPE_ERROR, "Error initializing the custom virtual conference data detector.", v5, 2u);
    }

  }
}

+ (id)_linksInSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_dataDetector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)URLsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "_linksInSource:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        if (objc_msgSend(v11, "resultType") == 32)
        {
          objc_msgSend(v11, "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v11, "resultType") != 2048)
          {
            v12 = 0;
            if ((objc_msgSend(0, "cal_hasSchemeMailto") & 1) == 0)
              continue;
            goto LABEL_14;
          }
          objc_msgSend(v11, "phoneNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "phoneURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if ((objc_msgSend(v12, "cal_hasSchemeMailto") & 1) == 0)
        {
          if (!v12)
            continue;
          objc_msgSend(v5, "addObject:", v12);
        }
LABEL_14:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_updateVirtualConferenceCustomOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *customConferenceQueue;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;
  NSArray *virtualConferenceCustomSearchResults;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((self->_supportedSearchTypes & 0x400) != 0)
  {
    if (objc_msgSend(v4, "length"))
    {
      -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainVirtualConferencesCustom"));
      customConferenceQueue = self->_customConferenceQueue;
      if (!customConferenceQueue)
      {
        v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.customConference", 0);
        v8 = self->_customConferenceQueue;
        self->_customConferenceQueue = v7;

        customConferenceQueue = self->_customConferenceQueue;
      }
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke;
      v14[3] = &unk_1E6EB6170;
      v14[4] = self;
      v15 = v5;
      dispatch_async(customConferenceQueue, v14);

    }
    else
    {
      virtualConferenceCustomSearchResults = self->_virtualConferenceCustomSearchResults;
      self->_virtualConferenceCustomSearchResults = 0;

      ICSRedactString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_virtualConferenceCustomSearchResults, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v10;
        v18 = 2114;
        v19 = v12;
        _os_log_impl(&dword_1B8A6A000, v11, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", buf, 0x16u);

      }
      -[CUIKLocationSearchModel delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "locationSearchModel:updatedSearchTypes:", self, 1024);

    }
  }

}

void __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  objc_msgSend((id)objc_opt_class(), "URLsFromSource:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CalMap:", &__block_literal_global_187);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3;
  block[3] = &unk_1E6EB61C0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0CAA198];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithTitle:url:", 0, v3);

  v5 = objc_alloc(MEMORY[0x1E0CAA190]);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:joinMethods:conferenceDetails:", 0, v6, 0);

  return v7;
}

void __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
  ICSRedactString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v2;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B8A6A000, v3, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainVirtualConferencesCustom"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), 1024);

}

- (void)selectVirtualConferenceRoomType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CUIKLocationSearchModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceForSearchModel:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[CUIKVirtualConferenceRoomTypeRecents selectRoomType:forSource:](CUIKVirtualConferenceRoomTypeRecents, "selectRoomType:forSource:", v4, v6);
}

- (void)updateVirtualConferenceRoomOptions:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if ((self->_supportedSearchTypes & 0x200) != 0)
  {
    -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainVirtualConferences"));
    if (updateVirtualConferenceRoomOptions__onceToken != -1)
      dispatch_once(&updateVirtualConferenceRoomOptions__onceToken, &__block_literal_global_191);
    if (self->_allPossibleVirtualConferenceRooms)
    {
      -[CUIKLocationSearchModel _updateVirtualConferenceOptions:](self, "_updateVirtualConferenceOptions:", v4);
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CAA1A0];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __62__CUIKLocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2;
      v6[3] = &unk_1E6EB60D0;
      v6[4] = self;
      v7 = v4;
      objc_msgSend(v5, "virtualConferenceRoomTypesWithCompletion:queue:", v6, MEMORY[0x1E0C80D38]);

    }
  }

}

uint64_t __62__CUIKLocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke()
{
  return +[CUIKVirtualConferenceRoomTypeRecents cleanup](CUIKVirtualConferenceRoomTypeRecents, "cleanup");
}

uint64_t __62__CUIKLocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "arrayWithCapacity:", 10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateAllPossibleVirtualConferenceResultsWithRoomTypes:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "_updateVirtualConferenceOptions:", *(_QWORD *)(a1 + 40));
}

- (void)_updateAllPossibleVirtualConferenceResultsWithRoomTypes:(id)a3
{
  NSMutableArray *allPossibleVirtualConferenceRooms;
  id v5;
  void *v6;
  void *v7;
  id v8;

  allPossibleVirtualConferenceRooms = self->_allPossibleVirtualConferenceRooms;
  v5 = a3;
  -[NSMutableArray removeAllObjects](allPossibleVirtualConferenceRooms, "removeAllObjects");
  -[CUIKLocationSearchModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceForSearchModel:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  +[CUIKVirtualConferenceRoomTypeRecents roomTypesOrderedByMRU:forSource:](CUIKVirtualConferenceRoomTypeRecents, "roomTypesOrderedByMRU:forSource:", v5, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[NSMutableArray addObjectsFromArray:](self->_allPossibleVirtualConferenceRooms, "addObjectsFromArray:", v7);

}

- (void)_updateVirtualConferenceOptions:(id)a3
{
  id v4;
  NSMutableArray *virtualConferenceRoomSearchResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  virtualConferenceRoomSearchResults = self->_virtualConferenceRoomSearchResults;
  if (!virtualConferenceRoomSearchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_virtualConferenceRoomSearchResults;
    self->_virtualConferenceRoomSearchResults = v6;

    virtualConferenceRoomSearchResults = self->_virtualConferenceRoomSearchResults;
  }
  -[NSMutableArray removeAllObjects](virtualConferenceRoomSearchResults, "removeAllObjects");
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_allPossibleVirtualConferenceRooms;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "title", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "rangeOfString:options:", v4, 1);

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            -[NSMutableArray addObject:](self->_virtualConferenceRoomSearchResults, "addObject:", v13);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[NSMutableArray addObjectsFromArray:](self->_virtualConferenceRoomSearchResults, "addObjectsFromArray:", self->_allPossibleVirtualConferenceRooms);
  }
  ICSRedactString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_virtualConferenceRoomSearchResults, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    v26 = 2114;
    v27 = v18;
    _os_log_impl(&dword_1B8A6A000, v17, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Rooms %{public}@ results", buf, 0x16u);

  }
  -[CUIKLocationSearchModel _decrementPendingOperationsCountForDomain:](self, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainVirtualConferences"));
  -[CUIKLocationSearchModel delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "locationSearchModel:updatedSearchTypes:", self, 512);

}

- (void)_updateMapURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CUIKStructuredLocationWithImage *v9;
  NSObject *v10;
  void *v11;
  CUIKStructuredLocationWithImage *v12;
  CUIKStructuredLocationWithImage *locationFromMapsURL;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  CLGeocoder *geocoder;
  CLGeocoder *v27;
  CLGeocoder *v28;
  CLGeocoder *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ICSRedactString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CC1828], "_mapItemBackedByURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isCurrentLocation") & 1) == 0)
  {
    v12 = objc_alloc_init(CUIKStructuredLocationWithImage);
    locationFromMapsURL = self->_locationFromMapsURL;
    self->_locationFromMapsURL = v12;

    objc_msgSend(MEMORY[0x1E0CAA158], "locationWithMapItem:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_geoAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "formattedAddressLines");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setAddress:", v31);
    -[CUIKStructuredLocationWithImage setLocation:](self->_locationFromMapsURL, "setLocation:", v14);
    CUIKImageForMapItem(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKStructuredLocationWithImage setImage:](self->_locationFromMapsURL, "setImage:", v17);

    if ((objc_msgSend(v8, "isPlaceHolder") & 1) == 0)
    {
      -[CUIKStructuredLocationWithImage location](self->_locationFromMapsURL, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", 0);

    }
    -[CUIKStructuredLocationWithImage location](self->_locationFromMapsURL, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "address");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[CUIKStructuredLocationWithImage location](self->_locationFromMapsURL, "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationFromMapsURL != 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v5;
          v37 = 2114;
          v38 = v24;
          _os_log_impl(&dword_1B8A6A000, v23, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);

        }
        -[CUIKLocationSearchModel delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "locationSearchModel:updatedSearchTypes:", self, 2);

LABEL_22:
        goto LABEL_8;
      }
    }
    else
    {

    }
    geocoder = self->_geocoder;
    if (!geocoder)
    {
      v27 = (CLGeocoder *)objc_alloc_init((Class)EKWeakLinkClass());
      v28 = self->_geocoder;
      self->_geocoder = v27;

      geocoder = self->_geocoder;
    }
    if (-[CLGeocoder isGeocoding](geocoder, "isGeocoding"))
      -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
    -[CUIKLocationSearchModel _incrementPendingOperationsCountForDomain:](self, "_incrementPendingOperationsCountForDomain:", CFSTR("OperationDomainLocationFromMapsURL"));
    objc_initWeak((id *)buf, self);
    v29 = self->_geocoder;
    objc_msgSend(v14, "geoLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __41__CUIKLocationSearchModel__updateMapURL___block_invoke;
    v32[3] = &unk_1E6EB6468;
    objc_copyWeak(&v34, (id *)buf);
    v33 = v5;
    -[CLGeocoder reverseGeocodeLocation:completionHandler:](v29, "reverseGeocodeLocation:completionHandler:", v30, v32);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
    goto LABEL_22;
  }

LABEL_5:
  v9 = self->_locationFromMapsURL;
  self->_locationFromMapsURL = 0;

  +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationFromMapsURL != 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2114;
    v38 = v11;
    _os_log_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);

  }
  -[CUIKLocationSearchModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationSearchModel:updatedSearchTypes:", self, 2);
LABEL_8:

}

void __41__CUIKLocationSearchModel__updateMapURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  _UNKNOWN **v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_17;
  v8 = &off_1E6EAF000;
  if (v6)
  {
    +[CUIKLogSubsystem locationSearch](CUIKLogSubsystem, "locationSearch");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_log_impl(&dword_1B8A6A000, v9, OS_LOG_TYPE_ERROR, "Map URL address geocoding failed failed with error: %@", buf, 0xCu);
    }

    v10 = WeakRetained[6];
    WeakRetained[6] = 0;

    goto LABEL_14;
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postalAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[6], "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v13);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v12, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[6], "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAddress:", v15);

      objc_msgSend(v11, "region");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "radius");
      v19 = v18;
      objc_msgSend(WeakRetained[6], "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setRadius:", v19);

      objc_msgSend(WeakRetained[6], "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "title");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        objc_msgSend(WeakRetained[6], "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "title");
        v25 = v12;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v26, "isEqualToString:", &stru_1E6EBAE30);

        v12 = v25;
        v8 = &off_1E6EAF000;

        if (!v34)
          goto LABEL_13;
      }
      else
      {

      }
      objc_msgSend(WeakRetained[6], "location");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "address");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[6], "location");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTitle:", v28);

    }
LABEL_13:

  }
LABEL_14:
  objc_msgSend(WeakRetained, "_decrementPendingOperationsCountForDomain:", CFSTR("OperationDomainLocationFromMapsURL"));
  objc_msgSend(v8[411], "locationSearch");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", WeakRetained[6] != 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v31;
    v37 = 2114;
    v38 = v32;
    _os_log_impl(&dword_1B8A6A000, v30, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);

  }
  objc_msgSend(WeakRetained, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "locationSearchModel:updatedSearchTypes:", WeakRetained, 2);

LABEL_17:
}

- (unint64_t)supportedSearchTypes
{
  return self->_supportedSearchTypes;
}

- (void)setSupportedSearchTypes:(unint64_t)a3
{
  self->_supportedSearchTypes = a3;
}

- (EKStructuredLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (CUIKStructuredLocationWithImage)locationFromMapsURL
{
  return self->_locationFromMapsURL;
}

- (NSArray)mapCompletionSearchResults
{
  return self->_mapCompletionSearchResults;
}

- (NSArray)contactsSearchResults
{
  return &self->_contactsSearchResults->super;
}

- (NSArray)recentsSearchResults
{
  return &self->_recentsSearchResults->super;
}

- (NSArray)frequentsSearchResults
{
  return &self->_frequentsSearchResults->super;
}

- (NSArray)eventsSearchResults
{
  return &self->_eventsSearchResults->super;
}

- (NSArray)textualSearchResults
{
  return self->_textualSearchResults;
}

- (NSArray)virtualConferenceRoomSearchResults
{
  return &self->_virtualConferenceRoomSearchResults->super;
}

- (NSArray)virtualConferenceCustomSearchResults
{
  return self->_virtualConferenceCustomSearchResults;
}

- (CUIKLocationSearchModelDelegate)delegate
{
  return (CUIKLocationSearchModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_virtualConferenceCustomSearchResults, 0);
  objc_storeStrong((id *)&self->_textualSearchResults, 0);
  objc_storeStrong((id *)&self->_mapCompletionSearchResults, 0);
  objc_storeStrong((id *)&self->_pendingOperationsCounts, 0);
  objc_storeStrong((id *)&self->_virtualConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_allPossibleVirtualConferenceRooms, 0);
  objc_storeStrong((id *)&self->_contactsSearchResults, 0);
  objc_storeStrong((id *)&self->_eventsSearchResults, 0);
  objc_storeStrong((id *)&self->_frequentsSearchResults, 0);
  objc_storeStrong((id *)&self->_recentsSearchResults, 0);
  objc_storeStrong((id *)&self->_conferenceRoomAddressesToConferenceRooms, 0);
  objc_storeStrong((id *)&self->_mutableConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_conferenceRoomOperationQueue, 0);
  objc_storeStrong((id *)&self->_conferenceRoomProcessingQueue, 0);
  objc_storeStrong((id *)&self->_whitespaceAndNewlineCharacterSet, 0);
  objc_storeStrong((id *)&self->_currentRecentsSearch, 0);
  objc_storeStrong((id *)&self->_eventsSearch, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_customConferenceQueue, 0);
  objc_storeStrong((id *)&self->_eventsQueue, 0);
  objc_storeStrong((id *)&self->_recentsQueue, 0);
  objc_storeStrong((id *)&self->_contactsSearchToken, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_locationFromMapsURL, 0);
  objc_storeStrong((id *)&self->_currentImpreciseLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_completer, 0);
  objc_storeStrong((id *)&self->_locationAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
