@implementation WorldClockManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_18);
  return (id)sharedManager__sharedManager;
}

- (void)loadCities
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *cities;
  id *p_cities;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;
  int v18;
  WorldClockManager *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[WorldClockPreferences lastModified](self->_defaults, "lastModified");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorldClockManager setLastModified:](self, "setLastModified:", v3);

  -[WorldClockPreferences cities](self->_defaults, "cities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  else
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_cities = (id *)&self->_cities;
  cities = self->_cities;
  self->_cities = v6;

  v9 = -[WorldClockPreferences cityDataNeedsUpdate](self->_defaults, "cityDataNeedsUpdate");
  MTLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543618;
    v19 = self;
    v20 = 1024;
    v21 = v9;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ loading cities, needs city data update: %d", (uint8_t *)&v18, 0x12u);
  }

  if (objc_msgSend(*p_cities, "count"))
  {
    if ((int)objc_msgSend(*p_cities, "count") >= 1)
    {
      v11 = 0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_cities, "objectAtIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WorldClockManager worldClockCityFromPersistenceRepresentation:](self, "worldClockCityFromPersistenceRepresentation:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[WorldClockManager updateALDataWithCity:](self, "updateALDataWithCity:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
        }
        v15 = *p_cities;
        if (v13)
          objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v11, v13);
        else
          objc_msgSend(v15, "removeObjectAtIndex:", v11--);

        ++v11;
      }
      while (v11 < (int)objc_msgSend(*p_cities, "count"));
    }
  }
  else
  {
    -[WorldClockManager addDefaultCitiesIfNeeded](self, "addDefaultCitiesIfNeeded");
  }
  v16 = self->_dirty || v9;
  if (v16 == 1)
  {
    -[WorldClockManager pushCityPropertiesToPreferences](self, "pushCityPropertiesToPreferences");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("com.apple.mobiletimer.user-preferences-dirty"), 0);

    self->_dirty = 0;
    -[WorldClockPreferences cityDataUpdated](self->_defaults, "cityDataUpdated");
  }
}

- (id)worldClockCityFromPersistenceRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WorldClockManager worldClockCityFromPersistenceDictionary:](self, "worldClockCityFromPersistenceDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[WorldClockManager worldClockCityFromPersistenceArray:](self, "worldClockCityFromPersistenceArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)worldClockCityFromPersistenceDictionary:(id)a3
{
  void *v3;
  WorldClockCity *v4;
  void *v5;

  -[WorldClockManager fixUpCityProperties:](self, "fixUpCityProperties:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WorldClockCity isWorldClockCityProperties:](WorldClockCity, "isWorldClockCityProperties:", v3))
  {
    v4 = -[WorldClockCity initWithProperties:]([WorldClockCity alloc], "initWithProperties:", v3);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFA970]), "initWithProperties:", v3);
    v4 = -[WorldClockCity initWithALCity:]([WorldClockCity alloc], "initWithALCity:", v5);

  }
  return v4;
}

- (id)fixUpCityProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (+[WorldClockCity isCachedLanguageStaleForProperties:](WorldClockCity, "isCachedLanguageStaleForProperties:", v4))
  {
    self->_dirty = 1;
    objc_msgSend(v4, "objectForKey:", CFSTR("city"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("name"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("countryName"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("city"));

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->lastModified, a3);
}

- (NSArray)cities
{
  return &self->_cities->super;
}

void __34__WorldClockManager_sharedManager__block_invoke()
{
  WorldClockManager *v0;
  void *v1;
  WorldClockPreferences *v2;

  v2 = objc_alloc_init(WorldClockPreferences);
  v0 = -[WorldClockManager initWithPreferences:]([WorldClockManager alloc], "initWithPreferences:", v2);
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;

}

- (WorldClockManager)initWithPreferences:(id)a3
{
  id v5;
  WorldClockManager *v6;
  WorldClockManager *v7;
  WorldClockManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WorldClockManager;
  v6 = -[WorldClockManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaults, a3);
    v8 = v7;
  }

  return v7;
}

- (id)updateALDataWithCity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(a3, "alCityId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObjects:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorldClockManager citiesMatchingIdentifiers:](self, "citiesMatchingIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)updatedTimezoneForCityWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorldClockManager citiesMatchingIdentifiers:](self, "citiesMatchingIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)updatedDataForCityWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorldClockManager citiesMatchingIdentifiers:](self, "citiesMatchingIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTUtilities mtCityFromWorldClockCity:](MTUtilities, "mtCityFromWorldClockCity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)saveCities
{
  void *v3;
  void *v4;
  WorldClockPreferences *defaults;
  void *v6;

  -[WorldClockManager cities](self, "cities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WorldClockManager pushCityPropertiesToPreferences](self, "pushCityPropertiesToPreferences");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WorldClockManager setLastModified:](self, "setLastModified:", v4);

    defaults = self->_defaults;
    -[WorldClockManager lastModified](self, "lastModified");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WorldClockPreferences setLastModified:](defaults, "setLastModified:", v6);

    -[WorldClockPreferences synchronize](self->_defaults, "synchronize");
    -[WorldClockManager _notifyNano](self, "_notifyNano");
    +[ClockManager saveAndNotifyForUserPreferences:localNotifications:](ClockManager, "saveAndNotifyForUserPreferences:localNotifications:", 1, 1);
    self->_dirty = 0;
  }
}

- (id)allCities
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__WorldClockManager_allCities__block_invoke;
  v8[3] = &unk_1E39CCEA0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __30__WorldClockManager_allCities__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  WorldClockCity *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[WorldClockCity initWithALCity:]([WorldClockCity alloc], "initWithALCity:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

- (id)worldClockCityFromPersistenceArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  WorldClockCity *v7;

  v3 = (void *)MEMORY[0x1E0CFA978];
  v4 = a3;
  objc_msgSend(v3, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestCityForLegacyCity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[WorldClockCity initWithALCity:]([WorldClockCity alloc], "initWithALCity:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)addDefaultCitiesIfNeeded
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WorldClockCity *v14;
  WorldClockCity *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[WorldClockPreferences defaultCitiesAdded](self->_defaults, "defaultCitiesAdded"))
  {
    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (const __CFString *)MGGetStringAnswer();
    if (CFStringCompare(v4, CFSTR("iPad"), 0))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "defaultCitiesForLocaleCode:options:", v6, 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "defaultCitiesShownInWorldClock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v4);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = [WorldClockCity alloc];
          v15 = -[WorldClockCity initWithALCity:](v14, "initWithALCity:", v13, (_QWORD)v16);
          -[NSMutableArray addObject:](self->_cities, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[WorldClockPreferences setDefaultCitiesAdded:](self->_defaults, "setDefaultCitiesAdded:", 1);
    -[WorldClockManager saveCities](self, "saveCities");

  }
}

- (void)pushCityPropertiesToPreferences
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[WorldClockManager cities](self, "cities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WorldClockManager cities](self, "cities", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[WorldClockPreferences setCities:](self->_defaults, "setCities:", v5);
}

- (BOOL)checkIfCitiesModified
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  -[WorldClockPreferences lastModified](self->_defaults, "lastModified");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorldClockManager lastModified](self, "lastModified");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v9 = 0;
  }
  else
  {
    -[WorldClockManager lastModified](self, "lastModified");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = round(v6);
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v9 = v7 != round(v8);

  }
  return v9;
}

- (id)cityWithIdUrl:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_cities;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "idUrl", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqual:", v10);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)canAddCity
{
  void *v2;
  BOOL v3;

  -[WorldClockManager cities](self, "cities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") < 0x18;

  return v3;
}

- (unint64_t)addCity:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[WorldClockManager canAddCity](self, "canAddCity"))
  {
    v5 = -[NSMutableArray indexOfObject:](self->_cities, "indexOfObject:", v4);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray addObject:](self->_cities, "addObject:", v4);
      self->_dirty = 1;
      v5 = -[NSMutableArray count](self->_cities, "count") - 1;
    }
  }

  return v5;
}

- (void)removeCity:(id)a3
{
  -[NSMutableArray removeObject:](self->_cities, "removeObject:", a3);
  self->_dirty = 1;
}

- (void)removeCityAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_cities, "removeObjectAtIndex:", a3);
  self->_dirty = 1;
}

- (void)removeAllCities
{
  -[NSMutableArray removeAllObjects](self->_cities, "removeAllObjects");
  self->_dirty = 1;
}

- (void)moveCityFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7;

  -[NSMutableArray objectAtIndex:](self->_cities, "objectAtIndex:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_cities, "removeObjectAtIndex:", a3);
  -[NSMutableArray insertObject:atIndex:](self->_cities, "insertObject:atIndex:", v7, a4);
  self->_dirty = 1;

}

- (void)_notifyNano
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  CFAbsoluteTime v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD block[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PerformanceTestingEnabled"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", CFSTR("/tmp/WorldClock-performance_test.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cityAddTest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      v6 = (void *)objc_opt_new();
    v7 = CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E0C9ADF8];
    v20 = CFSTR("timestamp");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("citySent"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("cityAddTest"));
    objc_msgSend(v5, "writeToFile:atomically:", CFSTR("/tmp/WorldClock-performance_test.plist"), 1);

  }
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__WorldClockManager__notifyNano__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  if (_notifyNano_onceToken != -1)
    dispatch_once(&_notifyNano_onceToken, block);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v11 = (void *)getNPSManagerClass_softClass;
  v19 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __getNPSManagerClass_block_invoke;
    v15[3] = &unk_1E39CB690;
    v15[4] = &v16;
    __getNPSManagerClass_block_invoke((uint64_t)v15);
    v11 = (void *)v17[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v16, 8);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.mobiletimer"), _notifyNano_keys);

}

void __32__WorldClockManager__notifyNano__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "defaultsKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithArray:", v5);
  v4 = (void *)_notifyNano_keys;
  _notifyNano_keys = v3;

}

- (id)citiesMatchingIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WorldClockCity *v13;
  WorldClockCity *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "citiesWithIdentifiers:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = [WorldClockCity alloc];
        v14 = -[WorldClockCity initWithALCity:](v13, "initWithALCity:", v12, (_QWORD)v17);
        if (v14)
          objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (id)citiesMatchingName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WorldClockCity *v14;
  WorldClockCity *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "citiesMatchingName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [WorldClockCity alloc];
        v15 = -[WorldClockCity initWithALCity:](v14, "initWithALCity:", v13, (_QWORD)v18);
        if (v15)
          objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

uint64_t __40__WorldClockManager_citiesMatchingName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)closestCityToLocation:(id)a3 matchingTimeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[WorldClockManager closestCityToLocation:matchingTimeZone:requireTimeZoneEquivalence:](self, "closestCityToLocation:matchingTimeZone:requireTimeZoneEquivalence:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[WorldClockManager closestCityToLocation:matchingTimeZone:requireTimeZoneEquivalence:](self, "closestCityToLocation:matchingTimeZone:requireTimeZoneEquivalence:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)closestCityToLocation:(id)a3 matchingTimeZone:(id)a4 requireTimeZoneEquivalence:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  float v21;
  double v22;
  float v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[WorldClockManager allCities](self, "allCities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v33;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E0C99E80];
        objc_msgSend(v15, "timeZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeZoneWithName:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v18, "isEquivalentTo:", v8) & 1) != 0
          || !a5 && (v28 = objc_msgSend(v18, "secondsFromGMT"), v28 == objc_msgSend(v8, "secondsFromGMT")))
        {
          objc_msgSend(v15, "alCity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(v19, "latitude");
          v22 = v21;
          objc_msgSend(v19, "longitude");
          v24 = (void *)objc_msgSend(v20, "initWithLatitude:longitude:", v22, v23);
          objc_msgSend(v24, "distanceFromLocation:", v7);
          v26 = v25;
          if (!v11 || v25 < v13)
          {
            v27 = v15;

            v13 = v26;
            v11 = v27;
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDate)lastModified
{
  return self->lastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastModified, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_cities, 0);
}

@end
