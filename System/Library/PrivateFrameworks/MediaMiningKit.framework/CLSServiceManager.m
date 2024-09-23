@implementation CLSServiceManager

- (CLSServiceManager)initWithLocationCache:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  CLSSocialServiceContacts *v6;
  CLSSocialServiceContacts *contactsService;
  CLSSocialServiceCalendar *v8;
  CLSSocialServiceCalendar *calendarService;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CLSRoutineService *v14;
  CLSRoutineService *routineService;
  CLSSocialServiceCoreDuet *v16;
  CLSSocialServiceCoreDuet *coreDuetService;
  CLSSocialServiceCoreNameParser *v18;
  CLSSocialServiceCoreNameParser *coreNameParserService;
  CLSLRUMemoryCache *v20;
  CLSLRUMemoryCache *personsCache;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLSServiceManager;
  v5 = -[CLSServiceManager init](&v23, sel_init);
  if (v5)
  {
    if (+[CLSSocialServiceContacts canAccessContactsStore](CLSSocialServiceContacts, "canAccessContactsStore"))
    {
      v6 = -[CLSSocialServiceContacts initWithLocationCache:]([CLSSocialServiceContacts alloc], "initWithLocationCache:", v4);
      contactsService = v5->_contactsService;
      v5->_contactsService = v6;

      -[CLSSocialServiceContacts setDelegate:](v5->_contactsService, "setDelegate:", v5);
    }
    v8 = objc_alloc_init(CLSSocialServiceCalendar);
    calendarService = v5->_calendarService;
    v5->_calendarService = v8;

    v10 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingTimeInterval:", -31536000.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithStartDate:duration:", v12, 31536000.0);

    v14 = -[CLSRoutineService initWithFetchDateInterval:locationCache:]([CLSRoutineService alloc], "initWithFetchDateInterval:locationCache:", v13, v4);
    routineService = v5->_routineService;
    v5->_routineService = v14;

    v16 = objc_alloc_init(CLSSocialServiceCoreDuet);
    coreDuetService = v5->_coreDuetService;
    v5->_coreDuetService = v16;

    v18 = objc_alloc_init(CLSSocialServiceCoreNameParser);
    coreNameParserService = v5->_coreNameParserService;
    v5->_coreNameParserService = v18;

    v20 = objc_alloc_init(CLSLRUMemoryCache);
    personsCache = v5->_personsCache;
    v5->_personsCache = v20;

  }
  return v5;
}

- (void)invalidateMePerson
{
  CLSPersonIdentity *mePerson;
  CLSServiceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CLSSocialServiceContacts invalidateMePerson](obj->_contactsService, "invalidateMePerson");
  mePerson = obj->_mePerson;
  obj->_mePerson = 0;

  objc_sync_exit(obj);
}

- (void)invalidatePermanentMemoryCaches
{
  CLSServiceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CLSSocialServiceCalendar invalidateMemoryCaches](obj->_calendarService, "invalidateMemoryCaches");
  -[CLSSocialServiceContacts invalidateMemoryCaches](obj->_contactsService, "invalidateMemoryCaches");
  -[CLSSocialServiceCoreNameParser invalidateMemoryCaches](obj->_coreNameParserService, "invalidateMemoryCaches");
  -[CLSRoutineService invalidateLocationsOfInterest](obj->_routineService, "invalidateLocationsOfInterest");
  -[CLSLRUMemoryCache removeAllObjects](obj->_personsCache, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)invalidateMomentaryMemoryCaches
{
  CLSServiceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CLSRoutineService invalidateLocationsOfInterest](obj->_routineService, "invalidateLocationsOfInterest");
  objc_sync_exit(obj);

}

- (void)invalidatePersonsCacheForPersonsWithNames:(id)a3
{
  id v4;
  CLSLRUMemoryCache *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CLSServiceManager *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_personsCache;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        -[CLSLRUMemoryCache removeObjectForKey:](self->_personsCache, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
  v10 = self;
  objc_sync_enter(v10);
  -[CLSSocialServiceContacts invalidateCacheForPersonWithLocalIdentifiers:](v10->_contactsService, "invalidateCacheForPersonWithLocalIdentifiers:", v6);
  objc_sync_exit(v10);

}

- (void)invalidatePersonsCacheForPersonsWithContactIdentifiers:(id)a3
{
  id v4;
  CLSLRUMemoryCache *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CLSServiceManager *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_personsCache;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        -[CLSLRUMemoryCache removeObjectForKey:](self->_personsCache, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
  v10 = self;
  objc_sync_enter(v10);
  -[CLSSocialServiceContacts invalidateCacheForPersonWithContactIdentifiers:](v10->_contactsService, "invalidateCacheForPersonWithContactIdentifiers:", v6);
  objc_sync_exit(v10);

}

- (void)invalidateCacheForPersonInContactStoreWithContactIdentifiers:(id)a3
{
  CLSServiceManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CLSSocialServiceContacts invalidateCacheForPersonInContactStoreWithContactIdentifiers:](v4->_contactsService, "invalidateCacheForPersonInContactStoreWithContactIdentifiers:", v5);
  objc_sync_exit(v4);

}

- (id)mePersonFetchContactIfNeeeded:(BOOL)a3
{
  _BOOL4 v3;
  CLSServiceManager *v4;
  CLSPersonIdentity *mePerson;
  uint64_t v6;
  CLSPersonIdentity *v7;
  CLSPersonIdentity *v8;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  mePerson = v4->_mePerson;
  if (!mePerson)
  {
    if (v3)
      -[CLSSocialServiceContacts refreshMeContactIfNeeded](v4->_contactsService, "refreshMeContactIfNeeded");
    -[CLSSocialServiceContacts mePerson](v4->_contactsService, "mePerson");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v4->_mePerson;
    v4->_mePerson = (CLSPersonIdentity *)v6;

    mePerson = v4->_mePerson;
  }
  v8 = mePerson;
  objc_sync_exit(v4);

  return v8;
}

- (id)mePersonForGraphIngest
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[CLSServiceManager mePersonFetchContactIfNeeeded:](self, "mePersonFetchContactIfNeeeded:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[CLSPersonIdentity mePerson](CLSPersonIdentity, "mePerson");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (CLSPersonIdentity)mePerson
{
  return (CLSPersonIdentity *)-[CLSServiceManager mePersonFetchContactIfNeeeded:](self, "mePersonFetchContactIfNeeeded:", 0);
}

- (id)inferredDeviceOwnerForPhotoLibrary:(id)a3 ignoreContactLinking:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CLSServiceManager *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isSystemPhotoLibrary"))
  {
    v7 = self;
    objc_sync_enter(v7);
    -[CLSSocialServiceContacts inferredDeviceOwnerForPhotoLibrary:ignoreContactLinking:](v7->_contactsService, "inferredDeviceOwnerForPhotoLibrary:ignoreContactLinking:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)eventsForDates:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceCalendar eventsForDates:](v5->_calendarService, "eventsForDates:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  objc_sync_exit(v5);
  return v9;
}

- (id)personForName:(id)a3 inPhotoLibrary:(id)a4
{
  void *v4;
  void *v5;

  -[CLSServiceManager personResultForName:inPhotoLibrary:](self, "personResultForName:inPhotoLibrary:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)personResultForName:(id)a3 inPhotoLibrary:(id)a4
{
  void *v4;
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  __int16 v13;

  -[CLSServiceManager personResultsForName:inPhotoLibrary:](self, "personResultsForName:inPhotoLibrary:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
  {
    v6 = objc_msgSend(v4, "count");
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    if (v6 < 2)
    {
      if (v7)
      {
        v12 = 0;
        v8 = MEMORY[0x1E0C81028];
        v9 = "No CLSPersonIdentity found";
        v10 = (uint8_t *)&v12;
        goto LABEL_8;
      }
    }
    else if (v7)
    {
      v13 = 0;
      v8 = MEMORY[0x1E0C81028];
      v9 = "No unique CLSPersonIdentity found";
      v10 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    }
    v5 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (id)personResultsForName:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  CLSLRUMemoryCache *v8;
  void *v9;
  void *v10;
  id v11;
  CLSServiceManager *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = self->_personsCache;
  objc_sync_enter(v8);
  -[CLSLRUMemoryCache objectForKey:](self->_personsCache, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = self;
    objc_sync_enter(v12);
    -[CLSSocialServiceContacts personResultsForName:inPhotoLibrary:](v12->_contactsService, "personResultsForName:inPhotoLibrary:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v12);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[CLSLRUMemoryCache setObject:forKey:](self->_personsCache, "setObject:forKey:", v11, v6);

  }
  objc_sync_exit(v8);

  return v11;
}

- (id)coreDuetPersonSuggestionsOnDate:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceCoreDuet coreDuetPersonSuggestionsOnDate:contactsService:](v5->_coreDuetService, "coreDuetPersonSuggestionsOnDate:contactsService:", v4, v5->_contactsService);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)enumerateAllPersonsUsingBlock:(id)a3
{
  -[CLSSocialServiceContacts enumerateAllPersonsUsingBlock:](self->_contactsService, "enumerateAllPersonsUsingBlock:", a3);
}

- (void)enumeratePersonsAndRelationshipUsingBlock:(id)a3
{
  -[CLSSocialServiceContacts enumeratePersonsAndRelationshipUsingBlock:](self->_contactsService, "enumeratePersonsAndRelationshipUsingBlock:", a3);
}

- (id)personLocalIdentifierMatchingContactPictureForContactIdentifier:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceContacts personLocalIdentifierMatchingContactPictureForContactIdentifier:](v5->_contactsService, "personLocalIdentifierMatchingContactPictureForContactIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)personForPersonHandle:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceContacts personForPersonHandle:](v5->_contactsService, "personForPersonHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)enumeratePersonsForFullname:(id)a3 usingBlock:(id)a4
{
  -[CLSSocialServiceContacts enumeratePersonsForFullName:usingBlock:](self->_contactsService, "enumeratePersonsForFullName:usingBlock:", a3, a4);
}

- (void)enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:(id)a3 usingBlock:(id)a4
{
  -[CLSSocialServiceContacts enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:usingBlock:](self->_contactsService, "enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:usingBlock:", a3, a4);
}

- (id)contactsForIdentifiers:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceContacts contactsForIdentifiers:](v5->_contactsService, "contactsForIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)matchingDictionaryForContactIdentifier:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceContacts matchingDictionaryForContactIdentifier:](v5->_contactsService, "matchingDictionaryForContactIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  CLSServiceManager *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[CLSRoutineService isRemoteLocation:inDateInterval:](v8->_routineService, "isRemoteLocation:inDateInterval:", v6, v7);
  objc_sync_exit(v8);

  return v9;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSRoutineService locationOfInterestAtLocation:](v5->_routineService, "locationOfInterestAtLocation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  CLSServiceManager *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[CLSRoutineService locationOfInterestCloseToLocation:inDateInterval:](v8->_routineService, "locationOfInterestCloseToLocation:inDateInterval:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

- (id)fetchLocationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  CLSServiceManager *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[CLSRoutineService locationOfInterestVisitsAtLocation:inDateInterval:](v8->_routineService, "locationOfInterestVisitsAtLocation:inDateInterval:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

- (id)predominantLocationMobilityForDateInterval:(id)a3 confidence:(double *)a4
{
  id v6;
  CLSServiceManager *v7;
  unint64_t v8;
  __CFString *v9;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = -[CLSRoutineService predominantTransportationModeForDateInterval:confidence:](v7->_routineService, "predominantTransportationModeForDateInterval:confidence:", v6, a4);
  if (v8 > 2)
    v9 = 0;
  else
    v9 = *off_1E84F72F0[v8];
  objc_sync_exit(v7);

  return v9;
}

- (id)fetchImportantLocationsOfInterest
{
  void *v3;
  CLSServiceManager *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  -[CLSRoutineService locationsOfInterestOfType:](v4->_routineService, "locationsOfInterestOfType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "unionSet:", v5);
  -[CLSRoutineService locationsOfInterestOfType:](v4->_routineService, "locationsOfInterestOfType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "unionSet:", v6);

  objc_sync_exit(v4);
  return v3;
}

- (void)postProcessLocationsOfInterest
{
  CLSServiceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CLSRoutineService postProcessLocationsOfInterest](obj->_routineService, "postProcessLocationsOfInterest");
  objc_sync_exit(obj);

}

- (id)lastLocationOfInterestVisit
{
  CLSServiceManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[CLSRoutineService lastLocationOfInterestVisit](v2->_routineService, "lastLocationOfInterestVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)enumerateEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 usingBlock:(id)a5
{
  -[CLSSocialServiceCalendar enumerateEventsFromUniversalDate:toUniversalDate:usingBlock:](self->_calendarService, "enumerateEventsFromUniversalDate:toUniversalDate:usingBlock:", a3, a4, a5);
}

- (void)prefetchEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 forAssetCollectionsSortedByStartDate:(id)a5 usingBlock:(id)a6
{
  -[CLSSocialServiceCalendar prefetchEventsFromUniversalDate:toUniversalDate:forAssetCollectionsSortedByStartDate:usingBlock:](self->_calendarService, "prefetchEventsFromUniversalDate:toUniversalDate:forAssetCollectionsSortedByStartDate:usingBlock:", a3, a4, a5, a6);
}

- (id)eventsForClueCollection:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceCalendar eventsForClueCollection:](v5->_calendarService, "eventsForClueCollection:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  objc_sync_exit(v5);
  return v9;
}

- (id)workCalendarEventsMatchingContactIdentifiers:(id)a3 fromUniversalDate:(id)a4 toUniversalDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLSServiceManager *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  -[CLSSocialServiceCalendar workCalendarEventsMatchingContactIdentifiers:fromUniversalDate:toUniversalDate:contactsService:](v11->_calendarService, "workCalendarEventsMatchingContactIdentifiers:fromUniversalDate:toUniversalDate:contactsService:", v8, v9, v10, v11->_contactsService);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v11);

  return v12;
}

- (id)personsFromEventParticipants:(id)a3 excludeCurrentUser:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CLSServiceManager *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[CLSSocialServiceCalendar personsFromEventParticipants:excludeCurrentUser:serviceManager:](v7->_calendarService, "personsFromEventParticipants:excludeCurrentUser:serviceManager:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  return v8;
}

- (void)enumeratePersonsForIdentifiers:(id)a3 usingBlock:(id)a4
{
  -[CLSSocialServiceContacts enumeratePersonsForIdentifiers:usingBlock:](self->_contactsService, "enumeratePersonsForIdentifiers:usingBlock:", a3, a4);
}

- (id)personForIdentifier:(id)a3
{
  id v4;
  CLSServiceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSSocialServiceContacts personForIdentifier:](v5->_contactsService, "personForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)personsInContactStoreForContactIdentifiers:(id)a3 needsRefetching:(BOOL)a4 progressBlock:(id)a5
{
  return -[CLSSocialServiceContacts personsInContactStoreForContactIdentifiers:needsRefetching:progressBlock:](self->_contactsService, "personsInContactStoreForContactIdentifiers:needsRefetching:progressBlock:", a3, a4, a5);
}

- (BOOL)hasAddressesForMePerson
{
  CLSServiceManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CLSRoutineService hasLocationsOfInterestInformation](v2->_routineService, "hasLocationsOfInterestInformation");
  objc_sync_exit(v2);

  return v3;
}

- (id)mePersonAddressesOfType:(unint64_t)a3
{
  CLSServiceManager *v4;
  void *v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  if (a3 >= 2)
  {
    v5 = 0;
  }
  else
  {
    -[CLSRoutineService placemarksOfInterestOfType:](v4->_routineService, "placemarksOfInterestOfType:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v4);

  if (v5)
  {
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (unint64_t)sexHintForPerson:(id)a3 usingLocales:(id)a4
{
  id v6;
  id v7;
  CLSServiceManager *v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[CLSSocialServiceCoreNameParser sexHintForPerson:usingLocales:](v8->_coreNameParserService, "sexHintForPerson:usingLocales:", v6, v7);
  objc_sync_exit(v8);

  return v9;
}

- (unint64_t)relationshipHintForPerson:(id)a3 usingLocales:(id)a4
{
  id v6;
  id v7;
  CLSServiceManager *v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[CLSSocialServiceCoreNameParser relationshipHintForPerson:usingLocales:](v8->_coreNameParserService, "relationshipHintForPerson:usingLocales:", v6, v7);
  objc_sync_exit(v8);

  return v9;
}

- (CLSRoutineService)routineService
{
  return (CLSRoutineService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMePerson:(id)a3
{
  objc_storeStrong((id *)&self->_mePerson, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mePerson, 0);
  objc_storeStrong((id *)&self->_personsCache, 0);
  objc_storeStrong((id *)&self->_coreNameParserService, 0);
  objc_storeStrong((id *)&self->_coreDuetService, 0);
  objc_storeStrong((id *)&self->_routineService, 0);
  objc_storeStrong((id *)&self->_calendarService, 0);
  objc_storeStrong((id *)&self->_contactsService, 0);
}

+ (id)locationCacheForSwiftOnlyWithParentURL:(id)a3
{
  id v3;
  CLSLocationCache *v4;
  void *v5;
  CLSLocationCache *v6;

  v3 = a3;
  v4 = [CLSLocationCache alloc];
  +[CLSDBCache urlWithParentURL:](CLSLocationCache, "urlWithParentURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CLSDBCache initWithURL:](v4, "initWithURL:", v5);
  return v6;
}

+ (BOOL)canAccessContactsStore
{
  return +[CLSSocialServiceContacts canAccessContactsStore](CLSSocialServiceContacts, "canAccessContactsStore");
}

- (BOOL)routineIsAvailable
{
  void *v2;
  void *v3;

  -[CLSServiceManager routineService](self, "routineService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");

  return 0;
}

- (unint64_t)numberOfLocationsOfInterest
{
  void *v2;
  void *v3;
  __int128 v5;

  v5 = 0u;
  -[CLSServiceManager routineService](self, "routineService", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");
  else
    v5 = 0u;

  return *((_QWORD *)&v5 + 1);
}

- (unint64_t)numberOfVisits
{
  void *v2;
  void *v3;

  -[CLSServiceManager routineService](self, "routineService", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");

  return 0;
}

- (unint64_t)numberOfTimeMatches
{
  void *v2;
  void *v3;

  -[CLSServiceManager routineService](self, "routineService", 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");

  return 0;
}

- (unint64_t)numberOfCloseByLocationMatches
{
  void *v2;
  void *v3;
  __int128 v5;

  v5 = 0u;
  -[CLSServiceManager routineService](self, "routineService", 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");
  else
    v5 = 0u;

  return *((_QWORD *)&v5 + 1);
}

- (unint64_t)numberOfRemoteLocationMatches
{
  void *v2;
  void *v3;

  -[CLSServiceManager routineService](self, "routineService", 0, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");

  return 0;
}

- (unint64_t)numberOfMatchRequests
{
  void *v2;
  void *v3;
  __int128 v5;

  v5 = 0u;
  -[CLSServiceManager routineService](self, "routineService", 0, 0, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");
  else
    v5 = 0u;

  return *((_QWORD *)&v5 + 1);
}

- (double)pinningVisitsRatio
{
  void *v2;
  void *v3;

  -[CLSServiceManager routineService](self, "routineService", 0, 0, 0, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "statistics");

  return 0.0;
}

@end
