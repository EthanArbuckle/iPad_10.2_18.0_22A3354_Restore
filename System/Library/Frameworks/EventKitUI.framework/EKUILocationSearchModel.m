@implementation EKUILocationSearchModel

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_24);
}

void __37__EKUILocationSearchModel_initialize__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_mapItemCache;
  _mapItemCache = (uint64_t)v0;

}

- (EKUILocationSearchModel)initWithEventStore:(id)a3
{
  id v5;
  EKUILocationSearchModel *v6;
  EKUILocationSearchModel *v7;
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
  CLLocationManager *v33;
  id v34;
  uint64_t v35;
  CLLocationManager *v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)EKUILocationSearchModel;
  v6 = -[EKUILocationSearchModel init](&v38, sel_init);
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
    v33 = v7->_locationManager;
    if (!v33)
    {
      v34 = [v23 alloc];
      v35 = objc_msgSend(v34, "_initWithDelegate:onQueue:", v7, MEMORY[0x1E0C80D38]);
      v36 = v7->_locationManager;
      v7->_locationManager = (CLLocationManager *)v35;

      v33 = v7->_locationManager;
    }
    -[CLLocationManager requestWhenInUseAuthorization](v33, "requestWhenInUseAuthorization");

  }
  return v7;
}

- (void)dealloc
{
  CLLocationManager *locationManager;
  CLGeocoder *geocoder;
  MKLocalSearch *localSearch;
  objc_super v6;

  -[EKUILocationSearchModel cancelSearch](self, "cancelSearch");
  -[EKUILocationSearchModel stopUpdatingLocation](self, "stopUpdatingLocation");
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
  v6.super_class = (Class)EKUILocationSearchModel;
  -[EKUILocationSearchModel dealloc](&v6, sel_dealloc);
}

- (void)getCurrentLocation
{
  NSObject *v3;
  CLInUseAssertion *v4;
  CLInUseAssertion *locationAssertion;
  uint8_t v6[16];

  if ((self->_supportedSearchTypes & 4) != 0)
  {
    -[EKUILocationSearchModel performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_stopUpdatingLocation, 0, 30.0);
    v3 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_INFO, "Started updating current location", v6, 2u);
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

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_stopUpdatingLocation, 0);
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  locationAssertion = self->_locationAssertion;
  self->_locationAssertion = 0;

  v4 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_INFO, "Stopped updating current location", v5, 2u);
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
  v6 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Updating current location failed with error: %@", (uint8_t *)&v7, 0xCu);
  }
  -[EKUILocationSearchModel stopUpdatingLocation](self, "stopUpdatingLocation");

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
  v8 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_INFO, "Found current location, shifting...", buf, 2u);
  }
  objc_msgSend(v6, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init((Class)EKWeakLinkClass());
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__EKUILocationSearchModel_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_1E601A1F8;
  v12 = v7;
  v11[4] = self;
  objc_msgSend(v10, "shiftLocation:withCompletionHandler:", v9, v11);
  -[EKUILocationSearchModel stopUpdatingLocation](self, "stopUpdatingLocation");

}

void __62__EKUILocationSearchModel_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
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
    v5 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_INFO, "Current location shifting finished. Result is imprecise, so this only affects search result relevancy", buf, 2u);
    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CAA158];
    EKUIUserFriendlyStringForCLLocation(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationWithTitle:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setGeoLocation:", v4);
    v14 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_INFO, "Current location shifting finished", v15, 2u);
    }
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

  v3 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_INFO, "Resetting event search results", v8, 2u);
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
  EKStructuredLocationWithImage *locationFromMapsURL;
  NSArray *mapCompletionSearchResults;
  NSMutableArray *frequentsSearchResults;
  NSMutableArray *virtualConferenceRoomSearchResults;
  NSArray *virtualConferenceCustomSearchResults;
  void *v12;
  uint8_t v13[16];

  v3 = a3;
  v5 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_INFO, "Resetting location search results", v13, 2u);
  }
  if (v3)
  {
    -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
    -[MKLocalSearchCompleter cancel](self->_completer, "cancel");
    -[MKLocalSearch cancel](self->_localSearch, "cancel");
    localSearch = self->_localSearch;
    self->_localSearch = 0;

  }
  -[EKUILocationSearchModel resetContactsSearchResults](self, "resetContactsSearchResults");
  -[EKUILocationSearchModel resetEventsSearchResults](self, "resetEventsSearchResults");
  -[EKUILocationSearchModel resetConferenceRoomSearchResults](self, "resetConferenceRoomSearchResults");
  -[EKUILocationSearchModel resetRecentsSearchResults](self, "resetRecentsSearchResults");
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
    -[EKUILocationSearchModel delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationSearchModel:updatedSearchTypes:", self, 2047);

  }
}

- (void)cancelSearch
{
  NSObject *v2;
  uint8_t v3[16];

  -[EKUILocationSearchModel resetSearchResults:](self, "resetSearchResults:", 1);
  v2 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_INFO, "Location search cancelled", v3, 2u);
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
  ICSRedactString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Location search begins!!", (uint8_t *)&v21, 0xCu);
  }
  -[EKUILocationSearchModel resetSearchResults:](self, "resetSearchResults:", 0);
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
    v12 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit", (uint8_t *)&v21, 0xCu);
    }
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
  v13 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit from URL", (uint8_t *)&v21, 0xCu);
  }
  -[EKUILocationSearchModel _updateMapURL:](self, "_updateMapURL:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 8) == 0)
  {
LABEL_6:
    if ((supportedSearchTypes & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_21:
  v14 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Contacts", (uint8_t *)&v21, 0xCu);
  }
  -[EKUILocationSearchModel updateContacts:](self, "updateContacts:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x10) == 0)
  {
LABEL_7:
    if ((supportedSearchTypes & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_24:
  v15 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Recents", (uint8_t *)&v21, 0xCu);
  }
  -[EKUILocationSearchModel updateRecents:](self, "updateRecents:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x20) == 0)
  {
LABEL_8:
    if ((supportedSearchTypes & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_30;
  }
LABEL_27:
  v16 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Frequents", (uint8_t *)&v21, 0xCu);
  }
  -[EKUILocationSearchModel searchFrequentLocations:](self, "searchFrequentLocations:", v4);
  supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x100) != 0)
  {
LABEL_30:
    v17 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_INFO, "[%{public}@] >>>> ConferenceRooms", (uint8_t *)&v21, 0xCu);
    }
    -[EKUILocationSearchModel searchConferenceRooms:](self, "searchConferenceRooms:", v4);
    supportedSearchTypes = self->_supportedSearchTypes;
  }
LABEL_33:
  if ((supportedSearchTypes & 0xC0) != 0)
  {
    v18 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Events", (uint8_t *)&v21, 0xCu);
    }
    -[EKUILocationSearchModel updateEventLocations:](self, "updateEventLocations:", v4);
    supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x200) != 0)
  {
    v19 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1AF84D000, v19, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Rooms", (uint8_t *)&v21, 0xCu);
    }
    -[EKUILocationSearchModel updateVirtualConferenceRoomOptions:](self, "updateVirtualConferenceRoomOptions:", v4);
    supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x400) != 0)
  {
    v20 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Custom", (uint8_t *)&v21, 0xCu);
    }
    -[EKUILocationSearchModel _updateVirtualConferenceCustomOptions:](self, "_updateVirtualConferenceCustomOptions:", v4);
  }

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
  void *v11;
  NSMutableArray *frequentsSearchResults;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  NSMutableArray *eventsSearchResults;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  NSMutableArray *v24;
  uint64_t v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *recentsSearchResults;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v3 = self->_recentsSearchResults;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v47 != v7)
          objc_enumerationMutation(v3);
        v9 = (void *)MEMORY[0x1E0D0CDF0];
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "recent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "locationForRecent:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        frequentsSearchResults = self->_frequentsSearchResults;
        if (frequentsSearchResults && -[NSMutableArray count](frequentsSearchResults, "count"))
        {
          v13 = self->_frequentsSearchResults;
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __40__EKUILocationSearchModel_dedupeResults__block_invoke;
          v44[3] = &unk_1E601A220;
          v45 = v11;
          -[NSMutableArray indexesOfObjectsPassingTest:](v13, "indexesOfObjectsPassingTest:", v44);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && objc_msgSend(v14, "count"))
          {
            -[NSMutableArray removeObjectsAtIndexes:](self->_frequentsSearchResults, "removeObjectsAtIndexes:", v15);
            v6 |= 0x20uLL;
          }

        }
        else
        {
          v15 = 0;
        }
        eventsSearchResults = self->_eventsSearchResults;
        if (eventsSearchResults && -[NSMutableArray count](eventsSearchResults, "count"))
        {
          v17 = self->_eventsSearchResults;
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __40__EKUILocationSearchModel_dedupeResults__block_invoke_2;
          v42[3] = &unk_1E601A248;
          v43 = v11;
          -[NSMutableArray indexesOfObjectsPassingTest:](v17, "indexesOfObjectsPassingTest:", v42);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 && objc_msgSend(v18, "count"))
          {
            -[NSMutableArray removeObjectsAtIndexes:](self->_eventsSearchResults, "removeObjectsAtIndexes:", v18);
            v6 |= 0x40uLL;
          }

        }
        else
        {
          v18 = v15;
        }

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = self->_frequentsSearchResults;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v19);
        v24 = self->_eventsSearchResults;
        if (v24)
        {
          v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
          if (-[NSMutableArray count](v24, "count"))
          {
            v26 = self->_eventsSearchResults;
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __40__EKUILocationSearchModel_dedupeResults__block_invoke_3;
            v37[3] = &unk_1E601A248;
            v37[4] = v25;
            -[NSMutableArray indexesOfObjectsPassingTest:](v26, "indexesOfObjectsPassingTest:", v37);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27 && objc_msgSend(v27, "count"))
            {
              -[NSMutableArray removeObjectsAtIndexes:](self->_eventsSearchResults, "removeObjectsAtIndexes:", v28);
              v6 |= 0x40uLL;
            }

          }
        }
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
    }
    while (v21);
  }

  v29 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v30 = (void *)MEMORY[0x1E0CB37E8];
    recentsSearchResults = self->_recentsSearchResults;
    v32 = v29;
    objc_msgSend(v30, "numberWithUnsignedInteger:", -[NSMutableArray count](recentsSearchResults, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_eventsSearchResults, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_frequentsSearchResults, "count"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v33;
    v52 = 2114;
    v53 = v34;
    v54 = 2114;
    v55 = v35;
    _os_log_impl(&dword_1AF84D000, v32, OS_LOG_TYPE_INFO, "After de-duping search results, Recents: %{public}@, Events: %{public}@, Frequents: %{public}@", buf, 0x20u);

  }
  return v6;
}

uint64_t __40__EKUILocationSearchModel_dedupeResults__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToLocation:", a2);
}

uint64_t __40__EKUILocationSearchModel_dedupeResults__block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __40__EKUILocationSearchModel_dedupeResults__block_invoke_3(uint64_t a1, void *a2)
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
  NSObject *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *mapCompletionSearchResults;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "queryFragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "resultsAreCurrent");
  v9 = kEKUILogLocationSearchHandle;
  v10 = os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = v9;
      objc_msgSend(v5, "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit %{public}@ results", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v5, "results");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mapCompletionSearchResults = self->_mapCompletionSearchResults;
    self->_mapCompletionSearchResults = v15;

    -[EKUILocationSearchModel delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationSearchModel:updatedSearchTypes:", self, 4);

  }
  else if (v10)
  {
    v18 = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit but results are not current", (uint8_t *)&v18, 0xCu);
  }

}

- (void)completerDidFail:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "queryFragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] MapKit failed with error: %@", (uint8_t *)&v9, 0x16u);
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
  EKUILocationSearchModel *v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  EKUILocationSearchModel *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t *v32;
  _QWORD v33[5];
  _QWORD v34[3];
  char v35;
  _QWORD v36[3];
  char v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[5];
  id v45;

  v4 = a3;
  ICSRedactString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILocationSearchModel resetContactsSearchResults](self, "resetContactsSearchResults");
  v5 = (NSMutableArray *)objc_opt_new();
  contactsSearchResults = self->_contactsSearchResults;
  self->_contactsSearchResults = v5;

  -[EKUILocationSearchModel delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationSearchModel:updatedSearchTypes:", self, 8);

  EKUIDescriptorForRequiredKeysForLabeledDisplayString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", *MEMORY[0x1E0C967F0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)EKWeakLinkClass()), "initWithKeysToFetch:", v9);
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", v4, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__8;
  v44[4] = __Block_byref_object_dispose__8;
  v45 = (id)objc_opt_new();
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__8;
  v42 = __Block_byref_object_dispose__8;
  v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke;
  v33[3] = &unk_1E601A270;
  v33[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v33, 0.33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  contactStore = self->_contactStore;
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_2;
  v26[3] = &unk_1E601A2C0;
  v29 = v44;
  v30 = v34;
  v31 = v36;
  v27 = v19;
  v28 = self;
  v32 = &v38;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_70;
  v20[3] = &unk_1E601A310;
  v15 = v27;
  v21 = v15;
  v22 = self;
  v24 = v44;
  v25 = &v38;
  v16 = v13;
  v23 = v16;
  -[CNContactStore executeFetchRequest:progressiveResults:completion:](contactStore, "executeFetchRequest:progressiveResults:completion:", v10, v26, v20);
  v17 = (CNCancelable *)objc_claimAutoreleasedReturnValue();
  contactsSearchToken = self->_contactsSearchToken;
  self->_contactsSearchToken = v17;

  objc_storeStrong(v39 + 5, v17);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(v44, 8);
}

uint64_t __42__EKUILocationSearchModel_updateContacts___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __42__EKUILocationSearchModel_updateContacts___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[4];
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a2;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v37;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(obj);
        v26 = v3;
        v4 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v3);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v4, "postalAddresses");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v33 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v11 = (void *)MEMORY[0x1E0C973B0];
              objc_msgSend(v10, "value");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "stringFromPostalAddress:style:", v12, 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "label");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              EKUILabeledDisplayStringForContact((uint64_t)v4, (uint64_t)v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setContactLabel:", v16);

              objc_msgSend(v14, "setAddress:", v13);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v14);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v7);
        }

        v3 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
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

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_3;
    block[3] = &unk_1E601A298;
    v28 = *(id *)(a1 + 32);
    v29 = v17;
    v21 = *(_QWORD *)(a1 + 72);
    v30 = *(_QWORD *)(a1 + 40);
    v31 = v21;
    v22 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __42__EKUILocationSearchModel_updateContacts___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = v2;
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ progressive results", (uint8_t *)&v9, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 48), "_updateContactsSearchWithResults:forToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

void __42__EKUILocationSearchModel_updateContacts___block_invoke_70(uint64_t a1)
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
  block[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_2_71;
  block[3] = &unk_1E601A2E8;
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

void __42__EKUILocationSearchModel_updateContacts___block_invoke_2_71(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = v2;
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v3;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ results", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_updateContactsSearchWithResults:forToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v9 = *(_QWORD *)(a1 + 40);
  if (v8 == *(void **)(v9 + 80))
  {
    *(_QWORD *)(v9 + 80) = 0;

  }
}

- (void)_updateContactsSearchWithResults:(id)a3 forToken:(id)a4
{
  id v5;

  if (self->_contactsSearchToken == a4)
  {
    -[NSMutableArray addObjectsFromArray:](self->_contactsSearchResults, "addObjectsFromArray:", a3);
    -[EKUILocationSearchModel delegate](self, "delegate");
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
  void *v14;
  NSObject *v15;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *recentsQueue;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
  OS_dispatch_queue *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  EKUILocationSearchModel *v31;
  id v32;
  id v33[2];
  id buf;
  _QWORD v35[2];
  void *v36;
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((self->_supportedSearchTypes & 0x10) != 0)
  {
    if (v4)
    {
      EKWeakLinkStringConstant();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      EKWeakLinkStringConstant();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      EKWeakLinkStringConstant();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      EKWeakLinkStringConstant();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)EKWeakLinkClass();
      v36 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateForKey:inCollection:", v27, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v8;
      objc_msgSend(v6, "predicateForKey:matchingText:comparison:", v26, v5, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v9;
      objc_msgSend(v6, "predicateForKey:matchingText:comparison:", v25, v5, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateSatisfyingAnySubpredicate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateSatisfyingAllSubpredicates:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_INFO, "Recents query is nil, returning all recents", (uint8_t *)&buf, 2u);
      }
      v14 = 0;
    }
    if (!self->_recentsQueue)
    {
      v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.recents", 0);
      recentsQueue = self->_recentsQueue;
      self->_recentsQueue = v16;

    }
    objc_initWeak(&buf, self);
    v18 = (void *)EKWeakLinkClass();
    v19 = (objc_class *)EKWeakLinkClass();
    v20 = objc_alloc_init(v19);
    objc_msgSend(v20, "setSearchPredicate:", v14);
    objc_msgSend(v20, "setDomains:", &unk_1E606F908);
    -[objc_class frecencyComparator](v19, "frecencyComparator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setComparator:", v21);

    objc_storeStrong((id *)&self->_currentRecentsSearch, v20);
    objc_msgSend(v18, "defaultInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = self->_recentsQueue;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke;
    v29[3] = &unk_1E601A3D8;
    objc_copyWeak(v33, &buf);
    v24 = v20;
    v30 = v24;
    v31 = self;
    v33[1] = v18;
    v32 = v5;
    objc_msgSend(v22, "performRecentsSearch:queue:completion:", v24, v23, v29);

    objc_destroyWeak(v33);
    objc_destroyWeak(&buf);

  }
}

void __41__EKUILocationSearchModel_updateRecents___block_invoke(uint64_t a1, void *a2)
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
    v6[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_2;
    v6[3] = &unk_1E601A3B0;
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

void __41__EKUILocationSearchModel_updateRecents___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  EKUIConferenceRoom *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *group;
  void *v28;
  id obj;
  void *v30;
  _QWORD block[4];
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarItemForSearchModel:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v3;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (!objc_msgSend(MEMORY[0x1E0D0CDF0], "recentIsDirectoryLocation:", v10))
          goto LABEL_19;
        v11 = objc_alloc_init(EKUIConferenceRoom);
        v12 = objc_alloc_init(MEMORY[0x1E0CAA048]);
        -[EKUIConferenceRoom setLocation:](v11, "setLocation:", v12);

        objc_msgSend(v10, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIConferenceRoom location](v11, "location");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDisplayName:", v13);

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "shouldIncludeConferenceRoom:", v11);

        if (objc_msgSend(MEMORY[0x1E0D0CDF0], "recentDirectoryLocation:matchesSource:", v10, v28))
        {
          if (v16)
          {
LABEL_19:
            if (objc_msgSend(MEMORY[0x1E0D0CDF0], "recentMissingStyleAttributes:", v10))
            {
              objc_msgSend(MEMORY[0x1E0D0CDF0], "mapKitHandleForRecent:", v10);
              v17 = (id)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                dispatch_group_enter(group);
                v18 = (void *)MEMORY[0x1E0CC1828];
                v38[0] = MEMORY[0x1E0C809B0];
                v38[1] = 3221225472;
                v38[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_3;
                v38[3] = &unk_1E601A338;
                v39 = v30;
                v40 = v10;
                v43 = *(_QWORD *)(a1 + 72);
                v17 = v17;
                v41 = v17;
                v42 = group;
                objc_msgSend(v18, "_mapItemFromHandle:completionHandler:", v17, v38);

              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D0CDF0], "mapKitStyleAttributesForRecent:", v10);
              v17 = (id)objc_claimAutoreleasedReturnValue();
              os_unfair_lock_lock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "contactID"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v17, v19);

              os_unfair_lock_unlock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
            }

            objc_msgSend(v5, "addObject:", v10);
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v7);
  }

  v20 = *(_QWORD *)(a1 + 48);
  v21 = *(void **)(a1 + 56);
  v22 = *(NSObject **)(v20 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_92;
  block[3] = &unk_1E601A388;
  v32 = group;
  v33 = v5;
  v34 = v30;
  v35 = v20;
  v36 = v21;
  v37 = *(id *)(a1 + 64);
  v23 = v30;
  v24 = v5;
  v25 = group;
  dispatch_async(v22, block);

}

void __41__EKUILocationSearchModel_updateRecents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
    objc_msgSend(v5, "_styleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "contactID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    os_unfair_lock_unlock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
    v10 = (void *)MEMORY[0x1E0D0CDF0];
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "_styleAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recentEventWithRecentContact:styleAttributes:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "defaultInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordContactEvents:recentsDomain:sendingAddress:completion:", v15, CFSTR("com.apple.eventkit.ios"), 0, 0);

  }
  else
  {
    v16 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 48);
      v18 = 138412546;
      v19 = v17;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when updating recents: %@, %@", (uint8_t *)&v18, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __41__EKUILocationSearchModel_updateRecents___block_invoke_92(uint64_t a1)
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
  EKRecentContactWithImage *v11;
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
    v4 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", buf, 2u);
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
        v11 = objc_alloc_init(EKRecentContactWithImage);
        -[EKRecentContactWithImage setRecent:](v11, "setRecent:", v10);
        os_unfair_lock_lock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
        v12 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "contactID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
        objc_msgSend(*(id *)(a1 + 56), "_imageForAttributes:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKRecentContactWithImage setImage:](v11, "setImage:", v15);

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
  block[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_94;
  block[3] = &unk_1E601A360;
  v16 = *(id *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 56);
  v21 = v16;
  v22 = v17;
  v23 = v5;
  v24 = *(id *)(a1 + 72);
  v18 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __41__EKUILocationSearchModel_updateRecents___block_invoke_94(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 56))
    {
      ICSRedactString();
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)kEKUILogLocationSearchHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
LABEL_8:

        goto LABEL_9;
      }
      v4 = (void *)MEMORY[0x1E0CB37E8];
      v5 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
      v6 = v3;
      objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v2;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Recents %{public}@ results", (uint8_t *)&v13, 0x16u);

    }
    else
    {
      v8 = (void *)kEKUILogLocationSearchHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        v11 = objc_msgSend(*(id *)(a1 + 40), "dedupeResults") | 0x10;
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), v11);

        return;
      }
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
      v2 = v8;
      objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v6 = objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_INFO, "Returning all Recents %{public}@ results", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_8;
  }
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
        ImageForMapItem(v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    MapPinImage();
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
  if (!v3 || (ImageForAttributes(v3), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    MapPinImage();
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
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CAA180];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke;
  v7[3] = &unk_1E601A400;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "estimateGeolocationFromHistoricDevicePositionAtLocation:withCompletionBlock:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke_2;
    v9[3] = &unk_1E601A360;
    v9[4] = WeakRetained;
    v10 = v5;
    v11 = v6;
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
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
  v8 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = *(void **)(a1 + 32);
    v11 = v8;
    objc_msgSend(v10, "frequentsSearchResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Frequents %{public}@ results", (uint8_t *)&v16, 0x16u);

  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "dedupeResults") | 0x20;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), v14);

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
  EKEventStore *eventStore;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EKEventStore *v11;
  uint64_t v12;
  EKOccurrenceCacheLocationSearch *v13;
  EKOccurrenceCacheLocationSearch *eventsSearch;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *eventsQueue;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[4];
  id v22;
  EKUILocationSearchModel *v23;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", &stru_1E601DFA8) & 1) == 0)
    {
      eventStore = self->_eventStore;
      if (eventStore)
      {
        v7 = (void *)MEMORY[0x1E0C99E60];
        -[EKEventStore readWriteCalendarsForEntityType:](eventStore, "readWriteCalendarsForEntityType:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWithArray:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)MEMORY[0x1E0CAA0C8];
        v11 = self->_eventStore;
        v12 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke;
        v21[3] = &unk_1E601A4F0;
        v22 = v5;
        v23 = self;
        objc_msgSend(v10, "searchWithCalendars:searchTerm:store:callback:", v9, v22, v11, v21);
        v13 = (EKOccurrenceCacheLocationSearch *)objc_claimAutoreleasedReturnValue();
        eventsSearch = self->_eventsSearch;
        self->_eventsSearch = v13;

        if (!self->_eventsQueue)
        {
          v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.eventslocation", 0);
          eventsQueue = self->_eventsQueue;
          self->_eventsQueue = v15;

        }
        objc_initWeak(&location, self->_eventsSearch);
        v17 = self->_eventsQueue;
        v18[0] = v12;
        v18[1] = 3221225472;
        v18[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_117;
        v18[3] = &unk_1E6018A70;
        objc_copyWeak(&v19, &location);
        dispatch_async(v17, v18);
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);

      }
    }
  }

}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ICSRedactString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v4;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ match results", buf, 0x16u);

  }
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(NSObject **)(v10 + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_106;
  block[3] = &unk_1E601A4C8;
  block[4] = v10;
  v15 = v4;
  v12 = v9;
  v16 = v12;
  v17 = *(id *)(a1 + 32);
  v18 = v12;
  v13 = v4;
  dispatch_async(v11, block);

}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_106(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  id v25;
  EKStructuredLocationWithImage *v26;
  void *v27;
  dispatch_time_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t i;
  NSObject *group;
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  _BYTE *v54;
  uint64_t *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[6];
  _QWORD v61[4];
  id v62;
  void *v63;
  NSObject *v64;
  _QWORD v65[6];
  uint8_t v66[8];
  uint8_t *v67;
  uint64_t v68;
  char v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD block[5];
  id v79;
  uint64_t *v80;
  _BYTE *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint8_t v95[128];
  _BYTE buf[24];
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "searchTerm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ICSRedactString();
  v40 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v6 = v2;
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v97 = v40;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Processing %{public}@ match results, events search text = %{public}@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v97 = __Block_byref_object_copy__8;
  v98 = __Block_byref_object_dispose__8;
  v99 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__8;
  v91 = __Block_byref_object_dispose__8;
  v92 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_107;
  block[3] = &unk_1E601A428;
  block[4] = *(_QWORD *)(a1 + 32);
  v79 = *(id *)(a1 + 56);
  v80 = &v83;
  v81 = buf;
  v82 = &v87;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  if (!*((_BYTE *)v84 + 24))
  {
    group = dispatch_group_create();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = *(id *)(a1 + 64);
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v75 != v42)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D0CB20], v40);
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D0CB28]);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D0CB18]);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "eventForObjectID:occurrenceDate:checkValid:", v10, v11, 0);
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = v12;
          }
          v44 = (void *)v9;
          objc_msgSend(*(id *)(a1 + 32), "splitEventLocations:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v71;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v71 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                objc_msgSend(v18, "geoLocation");
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  *(_QWORD *)v66 = 0;
                  v67 = v66;
                  v68 = 0x2020000000;
                  v69 = 1;
                  v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  v65[0] = MEMORY[0x1E0C809B0];
                  v65[1] = 3221225472;
                  v65[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_108;
                  v65[3] = &unk_1E601A450;
                  v65[4] = v18;
                  v65[5] = v66;
                  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v65);
                  if (v18 && v67[24])
                  {
                    objc_msgSend(v18, "mapKitHandle");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v21)
                    {
                      objc_msgSend((id)_mapItemCache, "objectForKey:", v21);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = v22 == 0;

                      if (v23)
                      {
                        dispatch_group_enter(group);
                        v24 = (void *)MEMORY[0x1E0CC1828];
                        v61[0] = MEMORY[0x1E0C809B0];
                        v61[1] = 3221225472;
                        v61[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_2;
                        v61[3] = &unk_1E601A478;
                        v25 = v21;
                        v62 = v25;
                        v63 = v18;
                        v64 = group;
                        objc_msgSend(v24, "_mapItemFromHandle:completionHandler:", v25, v61);

                      }
                    }
                    v26 = objc_alloc_init(EKStructuredLocationWithImage);
                    -[EKStructuredLocationWithImage setLocation:](v26, "setLocation:", v18);
                    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObject:", v26);

                  }
                }
                else
                {
                  *(_QWORD *)v66 = 0;
                  v67 = v66;
                  v68 = 0x2020000000;
                  v69 = 1;
                  v27 = (void *)v88[5];
                  v60[0] = MEMORY[0x1E0C809B0];
                  v60[1] = 3221225472;
                  v60[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_111;
                  v60[3] = &unk_1E601A4A0;
                  v60[4] = v18;
                  v60[5] = v66;
                  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v60);
                  if (v18 && v67[24])
                    objc_msgSend((id)v88[5], "addObject:", v18);
                }
                _Block_object_dispose(v66, 8);
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
            }
            while (v15);
          }

        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
      }
      while (v43);
    }

    v28 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(group, v28))
    {
      v29 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v66 = 0;
        _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", v66, 2u);
      }
    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v30 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v93, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v57 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
          objc_msgSend(v34, "location", v40);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "mapKitHandle");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_imageForMapHandle:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setImage:", v37);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v93, 16);
      }
      while (v31);
    }

    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_113;
    v51[3] = &unk_1E601A428;
    v51[4] = *(_QWORD *)(a1 + 32);
    v52 = *(id *)(a1 + 56);
    v53 = &v83;
    v54 = buf;
    v55 = &v87;
    v38 = (void *)MEMORY[0x1E0C80D38];
    dispatch_sync(MEMORY[0x1E0C80D38], v51);

    if (!*((_BYTE *)v84 + 24))
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_114;
      v48[3] = &unk_1E6018660;
      v48[4] = *(_QWORD *)(a1 + 32);
      v49 = *(id *)(a1 + 56);
      v50 = *(id *)(a1 + 48);
      v39 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v48);

    }
  }

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);

  _Block_object_dispose(buf, 8);
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_107(_QWORD *a1)
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

    v11 = *(_QWORD *)(a1[4] + 240);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[4];
      v14 = *(void **)(v13 + 240);
      *(_QWORD *)(v13 + 240) = v12;

      v11 = *(_QWORD *)(a1[4] + 240);
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

    v21 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v22 = 138543618;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before processing matches because query changed, events search text = %{public}@", (uint8_t *)&v22, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

  }
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_108(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend((id)_mapItemCache, "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = (void *)kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "mapKitHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when fetching event locations: %@, %@", (uint8_t *)&v11, 0x16u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __48__EKUILocationSearchModel_updateEventLocations___block_invoke_111(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
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

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_113(_QWORD *a1)
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
    v9 = *(void **)(v8 + 240);
    *(_QWORD *)(v8 + 240) = v7;

  }
  else
  {
    ICSRedactString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 120), "searchTerm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICSRedactString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before setting results because query changed, events search text = %{public}@", (uint8_t *)&v14, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

  }
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_114(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "searchTerm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v4 = 192;
    }
    else
    {
      ICSRedactString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)MEMORY[0x1E0CB37E8];
        v16 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
        v17 = v14;
        objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v13;
        v21 = 2114;
        v22 = v18;
        _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ results", (uint8_t *)&v19, 0x16u);

      }
      v4 = objc_msgSend(*(id *)(a1 + 32), "dedupeResults") | 0xC0;

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), v4);
  }
  else
  {
    ICSRedactString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "searchTerm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICSRedactString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      v19 = 138543618;
      v20 = v5;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before updating results because query changed, events search text = %{public}@", (uint8_t *)&v19, 0x16u);
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 192);
    *(_QWORD *)(v9 + 192) = 0;

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 240);
    *(_QWORD *)(v11 + 240) = 0;

  }
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_117(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "run");
    WeakRetained = v2;
  }

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
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke;
  v6[3] = &unk_1E6018EC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarItemForSearchModel:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsLocationDirectorySearches");

  if ((v7 & 1) != 0)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_118;
    block[3] = &unk_1E6018660;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v14 = v10;
    v15 = v11;
    v16 = v5;
    dispatch_async(v9, block);

  }
  else
  {
    v12 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_DEBUG, "The source for the search model's event does not support location directory searches.  Will not search for conference rooms.", buf, 2u);
    }
  }

}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_118(uint64_t a1)
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
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationSearchResultLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setResultLimit:", objc_msgSend(v6, "unsignedIntegerValue"));
  objc_initWeak(location, *(id *)(a1 + 40));
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_2;
  aBlock[3] = &unk_1E601A518;
  objc_copyWeak(&v21, location);
  v20 = 0;
  v8 = _Block_copy(aBlock);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA050]), "initWithSource:query:resultsBlock:", *(_QWORD *)(a1 + 48), v4, v8);
  objc_initWeak(&from, v9);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_3;
  v15[3] = &unk_1E601A540;
  objc_copyWeak(&v17, &from);
  v15[4] = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v16 = v10;
  objc_msgSend(v9, "setCompletionBlock:", v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "cancelAllOperations");
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_124;
  block[3] = &unk_1E6018EC0;
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

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_processDirectorySearchResultSet:forOperation:", v4, *(_QWORD *)(a1 + 32));

}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_123;
    v6[3] = &unk_1E6018EC0;
    v7 = WeakRetained;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v4, v6);

  }
  else
  {
    v5 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "The directory search operation went away.  Returning early.", buf, 2u);
    }
  }

}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_123(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        v7 = 138412290;
        v8 = (uint64_t)v2;
        _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "Directory search operation completed with error: [%@]", (uint8_t *)&v7, 0xCu);
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesExceededLimit"))
    {
      v4 = (void *)kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(void **)(a1 + 40);
        v6 = v4;
        v7 = 134217984;
        v8 = objc_msgSend(v5, "resultLimit");
        _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Directory search operation completed.  The number of matches exceeded the original result limit of [%tu]", (uint8_t *)&v7, 0xCu);

      }
    }

  }
}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_124(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeAllObjects");
  ICSRedactString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    v6 = v3;
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v2;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< ConferenceRooms %{public}@ results", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), 256);

}

- (void)_processDirectorySearchResultSet:(id)a3 forOperation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  EKUILocationSearchModel *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke;
  block[3] = &unk_1E6018660;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;

  if ((objc_msgSend(a1[4], "isCancelled") & 1) == 0)
  {
    objc_msgSend(a1[5], "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "calendarItemForSearchModel:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsAvailabilityRequests");

    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2;
    block[3] = &unk_1E6019510;
    v9 = a1[6];
    v14 = v7;
    v10 = a1[5];
    v12 = v9;
    v13 = v10;
    dispatch_async(v8, block);

  }
}

void __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2(uint64_t a1)
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
  v5[2] = __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3;
  v5[3] = &unk_1E601A568;
  v7 = *(_BYTE *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  objc_msgSend(*(id *)(a1 + 40), "_addDiscoveredConferenceRooms:", v4);
}

void __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  EKUIConferenceRoom *v5;

  v3 = a2;
  v5 = objc_alloc_init(EKUIConferenceRoom);
  -[EKUIConferenceRoom setLocation:](v5, "setLocation:", v3);

  -[EKUIConferenceRoom setAvailability:](v5, "setAvailability:", 0);
  -[EKUIConferenceRoom setSupportsAvailability:](v5, "setSupportsAvailability:", *(unsigned __int8 *)(a1 + 48));
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
  EKUILocationSearchModel *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke;
  v6[3] = &unk_1E6018EC0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_INFO, "<<<< ConferenceRooms %{public}@ results", buf, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_126;
  aBlock[3] = &__block_descriptor_40_e51_q24__0__EKUIConferenceRoom_8__EKUIConferenceRoom_16l;
  aBlock[4] = 193;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "sortWithOptions:usingComparator:", 16, v8);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendarItemForSearchModel:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "constraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsAvailabilityRequests");

  if ((v14 & 1) == 0)
  {
    v23 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v12;
      _os_log_impl(&dword_1AF84D000, v23, OS_LOG_TYPE_DEBUG, "The source for this calendar item does not support availability requests.  Will not issue an availability request.  Source: [%@]", buf, 0xCu);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = (void *)kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v38 = v26;
      v27 = v26;
      _os_log_impl(&dword_1AF84D000, v25, OS_LOG_TYPE_DEBUG, "This calendar item is not a [%@].  Will not issue an availability request.", buf, 0xCu);

    }
LABEL_10:
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), 256);

    goto LABEL_11;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = *(void **)(a1 + 32);
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_130;
  v33[3] = &unk_1E601A5B0;
  v17 = v15;
  v18 = *(_QWORD *)(a1 + 40);
  v34 = v17;
  v35 = v18;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v33);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), 256);

  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(NSObject **)(v20 + 144);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2;
  block[3] = &unk_1E601A360;
  block[4] = v20;
  v22 = v17;
  v30 = v22;
  v31 = v10;
  v32 = *(id *)(a1 + 32);
  dispatch_async(v21, block);

LABEL_11:
}

uint64_t __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_126(uint64_t a1, void *a2, void *a3)
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

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_130(uint64_t a1, void *a2)
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

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2(uint64_t a1)
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
  aBlock[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3;
  aBlock[3] = &unk_1E601A5D8;
  objc_copyWeak(&v12, &location);
  v11 = 0;
  v3 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "availabilityRequestForConferenceRooms:duringEvent:resultsBlock:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v4);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5;
  v5[3] = &unk_1E601A628;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "setCompletionBlock:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addOperation:", v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3(uint64_t a1, void *a2)
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
    block[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4;
    block[3] = &unk_1E6018660;
    block[4] = WeakRetained;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

uint64_t __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAvailabilityResults:forOperation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5(id *a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD *v11;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = v3;
  if (!WeakRetained)
  {
    v6 = kEKUILogLocationSearchHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v7 = "self went away.  Returning early.";
LABEL_8:
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
    goto LABEL_9;
  }
  if (!v3)
  {
    v6 = kEKUILogLocationSearchHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v7 = "The availability operation went away.  Returning early.";
    goto LABEL_8;
  }
  v5 = WeakRetained[18];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_133;
  block[3] = &unk_1E6018660;
  v9 = v3;
  v10 = a1[4];
  v11 = WeakRetained;
  dispatch_async(v5, block);

LABEL_9:
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_133(uint64_t a1)
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
      v3 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v2;
        _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "Availability operation completed with error: [%@]", buf, 0xCu);
      }
    }

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_134;
  v6[3] = &unk_1E6018EC0;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_134(uint64_t a1)
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
  v4[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_135;
  v4[3] = &unk_1E601A600;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
  if (*((_BYTE *)v6 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), 256);

  }
  _Block_object_dispose(&v5, 8);
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_135(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "availabilityRequestInProgress"))
  {
    objc_msgSend(v3, "setAvailabilityRequestInProgress:", 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (id)availabilityRequestForConferenceRooms:(id)a3 duringEvent:(id)a4 resultsBlock:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDateUnadjustedForLegacyClients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA130]), "initWithSource:startDate:endDate:ignoredEvent:addresses:resultsBlock:", v16, v13, v14, v11, v12, v10);
  objc_msgSend(v17, "setCompletionBlock:", v9);

  return v17;
}

- (void)updateConferenceRoomAvailability:(id)a3 duringEvent:(id)a4 completionBlock:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *conferenceRoomProcessingQueue;
  id v19;
  _QWORD block[5];
  id v21;
  _QWORD aBlock[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke;
  aBlock[3] = &unk_1E601A650;
  v23 = v8;
  v10 = v8;
  v11 = a5;
  v12 = a4;
  v13 = _Block_copy(aBlock);
  objc_msgSend(v10, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILocationSearchModel availabilityRequestForConferenceRooms:duringEvent:resultsBlock:completionBlock:](self, "availabilityRequestForConferenceRooms:duringEvent:resultsBlock:completionBlock:", v16, v12, v13, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAvailabilityRequestInProgress:", 1);
  conferenceRoomProcessingQueue = self->_conferenceRoomProcessingQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2;
  block[3] = &unk_1E6018EC0;
  block[4] = self;
  v21 = v17;
  v19 = v17;
  dispatch_async(conferenceRoomProcessingQueue, block);

}

void __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
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

uint64_t __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addOperation:", *(_QWORD *)(a1 + 40));
}

- (void)_handleAvailabilityResults:(id)a3 forOperation:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  EKUILocationSearchModel *v9;

  v6 = a3;
  if ((objc_msgSend(a4, "isCancelled") & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke;
    v7[3] = &unk_1E6018EC0;
    v8 = v6;
    v9 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2;
  v4[3] = &unk_1E601A678;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 40), 256);

}

void __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(MEMORY[0x1E0D0CDF0], "recentForLocation:withAddressString:andTitle:mapItem:", v7, v8, v13, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordContactEvents:recentsDomain:sendingAddress:completion:", v17, CFSTR("com.apple.eventkit.ios"), 0, 0);

  }
  else
  {
    v18 = (void *)kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      objc_msgSend(v7, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_1AF84D000, v19, OS_LOG_TYPE_ERROR, "can't add to recents, missing info: %@ %@", (uint8_t *)&v21, 0x16u);

    }
  }

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
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)EKWeakLinkClass();
  v8 = (void *)MEMORY[0x1E0D0CDF0];
  objc_msgSend(v6, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "recentForDirectoryLocation:onSource:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "defaultInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordContactEvents:recentsDomain:sendingAddress:completion:", v12, CFSTR("com.apple.eventkit.ios"), 0, 0);

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
    v11[2] = __48__EKUILocationSearchModel_removeRecentLocation___block_invoke;
    v11[3] = &unk_1E601A6A0;
    v12 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_recentsSearchResults, "removeObjectAtIndex:", -[NSMutableArray indexOfObjectPassingTest:](recentsSearchResults, "indexOfObjectPassingTest:", v11));
    -[EKUILocationSearchModel delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationSearchModel:updatedSearchTypes:", self, 16);

  }
  return v7;
}

uint64_t __48__EKUILocationSearchModel_removeRecentLocation___block_invoke(uint64_t a1, void *a2)
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
  EKUILocationSearchModel *v19;

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
  v16 = __53__EKUILocationSearchModel_selectMapSearchCompletion___block_invoke;
  v17 = &unk_1E601A6C8;
  v18 = v4;
  v19 = self;
  v13 = v4;
  -[MKLocalSearch startWithCompletionHandler:](v12, "startWithCompletionHandler:", &v14);
  objc_msgSend(v13, "sendFeedback", v14, v15, v16, v17);

}

void __53__EKUILocationSearchModel_selectMapSearchCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  EKUILocationSearchModel *v17;
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
    v18[2] = __42__EKUILocationSearchModel_selectLocation___block_invoke;
    v18[3] = &unk_1E601A6F0;
    v18[4] = self;
    v19 = v4;
    v8 = v4;
    objc_msgSend(v6, "_mapItemFromHandle:completionHandler:", v7, v18);

    -[EKUILocationSearchModel delegate](self, "delegate");
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
    v15[2] = __42__EKUILocationSearchModel_selectLocation___block_invoke_149;
    v15[3] = &unk_1E601A6F0;
    v16 = v4;
    v17 = self;
    v14 = v4;
    objc_msgSend(v13, "geocodeLocationString:withCompletionBlock:", v8, v15);

  }
}

void __42__EKUILocationSearchModel_selectLocation___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v10 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "Failed to convert mapKitHandle to mapItem in selectLocation: %@", (uint8_t *)&v11, 0xCu);
    }
  }

}

void __42__EKUILocationSearchModel_selectLocation___block_invoke_149(uint64_t a1, void *a2, void *a3)
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
    v7 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "Location search failed with error: %@", (uint8_t *)&v12, 0xCu);
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
  v8[2] = __48__EKUILocationSearchModel_selectCurrentLocation__block_invoke;
  v8[3] = &unk_1E601A718;
  objc_copyWeak(&v9, &location);
  -[CLGeocoder reverseGeocodeLocation:completionHandler:](v6, "reverseGeocodeLocation:completionHandler:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__EKUILocationSearchModel_selectCurrentLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v6;
        _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "Current Location search failed with error: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    else if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postalAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[4], "setTitle:", v11);

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[4], "setAddress:", v12);

        objc_msgSend(WeakRetained[4], "setRadius:", 100.0);
        objc_msgSend(WeakRetained[4], "title");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13
          || (v14 = (void *)v13,
              objc_msgSend(WeakRetained[4], "title"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "isEqualToString:", &stru_1E601DFA8),
              v15,
              v14,
              v16))
        {
          objc_msgSend(WeakRetained[4], "address");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained[4], "setTitle:", v17);

        }
      }

    }
    objc_msgSend(WeakRetained, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "locationSearchModel:selectedLocation:withError:", WeakRetained, WeakRetained[4], 0);

  }
}

+ (id)_dataDetector
{
  if (_dataDetector_onceToken != -1)
    dispatch_once(&_dataDetector_onceToken, &__block_literal_global_152);
  return (id)_dataDetector_dataDetector;
}

void __40__EKUILocationSearchModel__dataDetector__block_invoke()
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
    v4 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "Error initializing the custom virtual conference data detector.", v5, 2u);
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
  void *v11;
  void *v12;
  NSArray *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((self->_supportedSearchTypes & 0x400) != 0)
  {
    if (objc_msgSend(v4, "length"))
    {
      customConferenceQueue = self->_customConferenceQueue;
      if (!customConferenceQueue)
      {
        v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.customConference", 0);
        v8 = self->_customConferenceQueue;
        self->_customConferenceQueue = v7;

        customConferenceQueue = self->_customConferenceQueue;
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke;
      v17[3] = &unk_1E6018EC0;
      v17[4] = self;
      v18 = v5;
      dispatch_async(customConferenceQueue, v17);

    }
    else
    {
      virtualConferenceCustomSearchResults = self->_virtualConferenceCustomSearchResults;
      self->_virtualConferenceCustomSearchResults = 0;

      ICSRedactString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = self->_virtualConferenceCustomSearchResults;
        v14 = v11;
        objc_msgSend(v12, "numberWithUnsignedInteger:", -[NSArray count](v13, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v10;
        v21 = 2114;
        v22 = v15;
        _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", buf, 0x16u);

      }
      -[EKUILocationSearchModel delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "locationSearchModel:updatedSearchTypes:", self, 1024);

    }
  }

}

void __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "CalMap:", &__block_literal_global_156);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3;
  block[3] = &unk_1E6018660;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_2(uint64_t a1, void *a2)
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

void __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
  ICSRedactString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
    v6 = v3;
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v2;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationSearchModel:updatedSearchTypes:", *(_QWORD *)(a1 + 32), 1024);

}

- (void)selectVirtualConferenceRoomType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[EKUILocationSearchModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarItemForSearchModel:", self);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D0CE48];
  objc_msgSend(v9, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectRoomType:forSource:", v4, v8);

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
    if (updateVirtualConferenceRoomOptions__onceToken != -1)
      dispatch_once(&updateVirtualConferenceRoomOptions__onceToken, &__block_literal_global_160);
    if (self->_allPossibleVirtualConferenceRooms)
    {
      -[EKUILocationSearchModel _updateVirtualConferenceOptions:](self, "_updateVirtualConferenceOptions:", v4);
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CAA1A0];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __62__EKUILocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2;
      v6[3] = &unk_1E601A4F0;
      v6[4] = self;
      v7 = v4;
      objc_msgSend(v5, "virtualConferenceRoomTypesWithCompletion:queue:", v6, MEMORY[0x1E0C80D38]);

    }
  }

}

uint64_t __62__EKUILocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D0CE48], "cleanup");
}

uint64_t __62__EKUILocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2(uint64_t a1, void *a2)
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
  void *v8;
  void *v9;
  void *v10;
  id v11;

  allPossibleVirtualConferenceRooms = self->_allPossibleVirtualConferenceRooms;
  v5 = a3;
  -[NSMutableArray removeAllObjects](allPossibleVirtualConferenceRooms, "removeAllObjects");
  -[EKUILocationSearchModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarItemForSearchModel:", self);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D0CE48];
  objc_msgSend(v11, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "roomTypesOrderedByMRU:forSource:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[NSMutableArray addObjectsFromArray:](self->_allPossibleVirtualConferenceRooms, "addObjectsFromArray:", v10);

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
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = self->_allPossibleVirtualConferenceRooms;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "title", (_QWORD)v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "rangeOfString:options:", v4, 1);

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            -[NSMutableArray addObject:](self->_virtualConferenceRoomSearchResults, "addObject:", v13);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
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
  v17 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = self->_virtualConferenceRoomSearchResults;
    v20 = v17;
    objc_msgSend(v18, "numberWithUnsignedInteger:", -[NSMutableArray count](v19, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v16;
    v29 = 2114;
    v30 = v21;
    _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Rooms %{public}@ results", buf, 0x16u);

  }
  -[EKUILocationSearchModel delegate](self, "delegate", (_QWORD)v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "locationSearchModel:updatedSearchTypes:", self, 512);

}

- (void)_updateMapURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EKStructuredLocationWithImage *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  void *v14;
  EKStructuredLocationWithImage *v15;
  EKStructuredLocationWithImage *locationFromMapsURL;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  CLGeocoder *geocoder;
  CLGeocoder *v33;
  CLGeocoder *v34;
  CLGeocoder *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
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
    v15 = objc_alloc_init(EKStructuredLocationWithImage);
    locationFromMapsURL = self->_locationFromMapsURL;
    self->_locationFromMapsURL = v15;

    objc_msgSend(MEMORY[0x1E0CAA158], "locationWithMapItem:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_geoAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "formattedAddressLines");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setAddress:", v37);
    -[EKStructuredLocationWithImage setLocation:](self->_locationFromMapsURL, "setLocation:", v17);
    ImageForMapItem(v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKStructuredLocationWithImage setImage:](self->_locationFromMapsURL, "setImage:", v20);

    if ((objc_msgSend(v8, "isPlaceHolder") & 1) == 0)
    {
      -[EKStructuredLocationWithImage location](self->_locationFromMapsURL, "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitle:", 0);

    }
    -[EKStructuredLocationWithImage location](self->_locationFromMapsURL, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "address");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[EKStructuredLocationWithImage location](self->_locationFromMapsURL, "location");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = (void *)kEKUILogLocationSearchHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
        {
          v27 = (void *)MEMORY[0x1E0CB37E8];
          v28 = self->_locationFromMapsURL != 0;
          v29 = v26;
          objc_msgSend(v27, "numberWithInt:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v5;
          v43 = 2114;
          v44 = v30;
          _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);

        }
        -[EKUILocationSearchModel delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "locationSearchModel:updatedSearchTypes:", self, 2);

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
      v33 = (CLGeocoder *)objc_alloc_init((Class)EKWeakLinkClass());
      v34 = self->_geocoder;
      self->_geocoder = v33;

      geocoder = self->_geocoder;
    }
    if (-[CLGeocoder isGeocoding](geocoder, "isGeocoding"))
      -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
    objc_initWeak((id *)buf, self);
    v35 = self->_geocoder;
    objc_msgSend(v17, "geoLocation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __41__EKUILocationSearchModel__updateMapURL___block_invoke;
    v38[3] = &unk_1E601A7A0;
    objc_copyWeak(&v40, (id *)buf);
    v39 = v5;
    -[CLGeocoder reverseGeocodeLocation:completionHandler:](v35, "reverseGeocodeLocation:completionHandler:", v36, v38);

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
    goto LABEL_22;
  }

LABEL_5:
  v9 = self->_locationFromMapsURL;
  self->_locationFromMapsURL = 0;

  v10 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = self->_locationFromMapsURL != 0;
    v13 = v10;
    objc_msgSend(v11, "numberWithInt:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v5;
    v43 = 2114;
    v44 = v14;
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);

  }
  -[EKUILocationSearchModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationSearchModel:updatedSearchTypes:", self, 2);
LABEL_8:

}

void __41__EKUILocationSearchModel__updateMapURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_17;
  if (v6)
  {
    v8 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "Map URL address geocoding failed failed with error: %@", buf, 0xCu);
    }
    v9 = WeakRetained[6];
    WeakRetained[6] = 0;

    goto LABEL_14;
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postalAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[6], "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[6], "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAddress:", v14);

      objc_msgSend(v10, "region");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "radius");
      v18 = v17;
      objc_msgSend(WeakRetained[6], "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRadius:", v18);

      objc_msgSend(WeakRetained[6], "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "title");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        objc_msgSend(WeakRetained[6], "location");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "title");
        v24 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v25, "isEqualToString:", &stru_1E601DFA8);

        v11 = v24;
        if (!v36)
          goto LABEL_13;
      }
      else
      {

      }
      objc_msgSend(WeakRetained[6], "location");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "address");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[6], "location");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTitle:", v27);

    }
LABEL_13:

  }
LABEL_14:
  v29 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    v30 = *(void **)(a1 + 32);
    v31 = (void *)MEMORY[0x1E0CB37E8];
    v32 = WeakRetained[6] != 0;
    v33 = v29;
    objc_msgSend(v31, "numberWithInt:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    v39 = 2114;
    v40 = v34;
    _os_log_impl(&dword_1AF84D000, v33, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);

  }
  objc_msgSend(WeakRetained, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "locationSearchModel:updatedSearchTypes:", WeakRetained, 2);

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

- (EKStructuredLocationWithImage)locationFromMapsURL
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

- (EKUILocationSearchModelDelegate)delegate
{
  return (EKUILocationSearchModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
