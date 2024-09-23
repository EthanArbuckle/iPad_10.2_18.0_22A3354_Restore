@implementation _SFSearchEngineController

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSDictionary)templateParameterValues
{
  return self->_templateParameterValues;
}

- (NSDictionary)carrierTemplateParameterValues
{
  return self->_carrierTemplateParameterValues;
}

- (id)defaultSearchEngineForPrivateBrowsing:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v11;
  uint64_t v12;

  v3 = a3;
  os_unfair_lock_lock(&defaultSearchEngineLock);
  v5 = 32;
  if (v3)
    v5 = 48;
  v6 = *(id *)((char *)&self->super.isa + v5);
  os_unfair_lock_unlock(&defaultSearchEngineLock);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v11 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    -[_SFSearchEngineController _getEngines:defaultSearchEngineIndex:forPrivateBrowsing:](self, "_getEngines:defaultSearchEngineIndex:forPrivateBrowsing:", &v11, &v12, v3);
    v8 = v11;
    v9 = v8;
    v7 = 0;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (void)_getEngines:(id *)a3 defaultSearchEngineIndex:(unint64_t *)a4 forPrivateBrowsing:(BOOL)a5
{
  NSObject *searchEnginesQueue;
  _QWORD v7[7];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  searchEnginesQueue = self->_searchEnginesQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85___SFSearchEngineController__getEngines_defaultSearchEngineIndex_forPrivateBrowsing___block_invoke;
  v7[3] = &unk_1E4AC4528;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a4;
  v8 = a5;
  dispatch_sync(searchEnginesQueue, v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

}

- (BOOL)isSearchProviderEnabled:(unint64_t)a3
{
  return +[WBSFeatureAvailability isSearchProviderEnabled:](_SFFeatureAvailability, "isSearchProviderEnabled:", a3);
}

- (BOOL)isChinaDevice
{
  return objc_msgSend((id)CPGetDeviceRegionCode(), "isEqualToString:", CFSTR("CH"));
}

- (WBSSearchProvider)defaultSearchProvider
{
  return (WBSSearchProvider *)-[_SFSearchEngineController defaultSearchEngineForPrivateBrowsing:](self, "defaultSearchEngineForPrivateBrowsing:", 0);
}

- (NSString)systemLanguage
{
  return self->_systemLanguage;
}

- (WBSSearchProvider)defaultSeachProviderForPrivateBrowsing
{
  return (WBSSearchProvider *)-[_SFSearchEngineController defaultSearchEngineForPrivateBrowsing:](self, "defaultSearchEngineForPrivateBrowsing:", 1);
}

+ (void)loadSystemLanguageProperties
{
  useBaiduAsPresetDefaultSearchEngine = objc_msgSend((id)objc_opt_class(), "_deviceRegionCodeIsChina");
}

- (void)_loadSystemPropertiesForSearchEngine:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *countryCode;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *templateParameterValues;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSDictionary *v27;
  NSDictionary *carrierTemplateParameterValues;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)objc_msgSend(v7, "copy");
  countryCode = self->_countryCode;
  self->_countryCode = v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = (__CFString *)v12;
  else
    v13 = CFSTR("en");
  WBSSearchProviderBaiduTrackingCodeTemplateParameterValues();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v41[0] = v13;
  v40[0] = CFSTR("languageCode");
  v40[1] = CFSTR("primaryLanguageCode");
  -[__CFString substringToIndex:](v13, "substringToIndex:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntriesFromDictionary:", v17);

  v18 = (NSDictionary *)objc_msgSend(v15, "copy");
  templateParameterValues = self->_templateParameterValues;
  self->_templateParameterValues = v18;

  LODWORD(v16) = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D8B570]);
  if ((_DWORD)v16
    && !-[_SFSearchEngineController isChinaDevice](self, "isChinaDevice")
    && !self->_carrierTemplateParameterValues)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E28]), "initWithSlot:", 1);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
    v37 = 0;
    v22 = (void *)objc_msgSend(v21, "copyMobileSubscriberCountryCode:error:", v20, &v37);
    v23 = v37;
    if (objc_msgSend(v22, "length"))
    {
      v34 = v22;
      v36 = v23;
      v24 = (void *)objc_msgSend(v21, "copyMobileSubscriberNetworkCode:error:", v20, &v36);
      v25 = v36;

      if (objc_msgSend(v24, "length"))
      {
        v33 = v24;
        v35 = v25;
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
        v26 = (void *)objc_msgSend(v21, "copyCarrierBundleValue:key:bundleType:error:", v20, CFSTR("CarrierName"));
        v23 = v35;

        if (v26)
        {
          v38[0] = CFSTR("carrierName");
          v38[1] = CFSTR("carrierCountryCode");
          v22 = v34;
          v39[0] = v26;
          v39[1] = v34;
          v38[2] = CFSTR("carrierNetworkCode");
          v39[2] = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
          v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          carrierTemplateParameterValues = self->_carrierTemplateParameterValues;
          self->_carrierTemplateParameterValues = v27;

        }
        else
        {
          v22 = v34;
          if (v23)
          {
            v31 = WBS_LOG_CHANNEL_PREFIXSearchEngine();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:].cold.3(v31, v23);
          }
        }

        v24 = v33;
      }
      else
      {
        if (v25)
        {
          v30 = WBS_LOG_CHANNEL_PREFIXSearchEngine();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:].cold.2(v30, v25);
          v23 = v25;
        }
        else
        {
          v23 = 0;
        }
        v22 = v34;
      }

    }
    else if (v23)
    {
      v29 = WBS_LOG_CHANNEL_PREFIXSearchEngine();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:].cold.1(v29, v23);
    }

  }
}

- (void)_setEngines:(id)a3 defaultSearchEngineIndex:(unint64_t)a4 forPrivateBrowsing:(BOOL)a5
{
  _BOOL4 v5;
  NSArray *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *searchEngines;
  id v13;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  NSArray *v18;

  v5 = a5;
  v8 = (NSArray *)a3;
  if (v5)
    v9 = 40;
  else
    v9 = 16;
  v18 = v8;
  if (*(Class *)((char *)&self->super.isa + v9) == (Class)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_searchEngines, "objectAtIndexedSubscript:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
  }
  if (self->_searchEngines != v8)
  {
    v11 = (NSArray *)-[NSArray copy](v18, "copy");
    searchEngines = self->_searchEngines;
    self->_searchEngines = v11;

  }
  if (*(Class *)((char *)&self->super.isa + v9) != (Class)a4)
    *(Class *)((char *)&self->super.isa + v9) = (Class)a4;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_searchEngines, "objectAtIndexedSubscript:", a4);
    v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&defaultSearchEngineLock);
    if (v5)
      v15 = 48;
    else
      v15 = 32;
    v16 = *(Class *)((char *)&self->super.isa + v15);
    *(Class *)((char *)&self->super.isa + v15) = v14;
    v17 = v14;

    v13 = *(id *)((char *)&self->super.isa + v15);
    os_unfair_lock_unlock(&defaultSearchEngineLock);
    if (v13 && (WBSIsEqual() & 1) == 0)
      -[_SFSearchEngineController _postDefaultSearchEngineDidChange](self, "_postDefaultSearchEngineDidChange");
  }

}

- (void)_postDefaultSearchEngineDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___SFSearchEngineController__postDefaultSearchEngineDidChange__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_addAllWebSearchEngineInfosToArray:(id)a3 andAddUserVisibleWebSearchEngineInfosToArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _SFSearchEngineInfo *v14;
  _SFSearchEngineInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  WBSSearchProviderDefinitions();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = [_SFSearchEngineInfo alloc];
        v15 = -[WBSSearchProvider initWithDictionary:usingContext:](v14, "initWithDictionary:usingContext:", v13, self, (_QWORD)v19);
        if (v15)
          objc_msgSend(v6, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[_SFSearchEngineController _specialSearchEngines](self, "_specialSearchEngines");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSSearchProvider userVisibleProvidersInAllProviders:usingContext:](_SFSearchEngineInfo, "userVisibleProvidersInAllProviders:usingContext:", v17, self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v18);

}

- (id)_specialSearchEngines
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _SFSearchEngineInfo *v9;
  void *v10;
  _SFSearchEngineInfo *v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D8B4F8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D8B500];
  v14[0] = v3;
  v14[1] = CFSTR("org.wikipedia");
  v5 = *MEMORY[0x1E0D8B510];
  v13[1] = v4;
  v13[2] = v5;
  v6 = *MEMORY[0x1E0D8B4F0];
  v14[2] = CFSTR("Wikipedia");
  v14[3] = CFSTR("Wikipedia");
  v7 = *MEMORY[0x1E0D8B508];
  v13[3] = v6;
  v13[4] = v7;
  v14[4] = CFSTR("https://{primaryLanguageCode}.wikipedia.org/?search={searchTerms}");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WBSSearchProvider initWithDictionary:usingContext:]([_SFSearchEngineInfo alloc], "initWithDictionary:usingContext:", v8, self);
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (_SFSearchEngineController)sharedInstance
{
  void *v2;

  v2 = (void *)searchEngineController;
  if (!searchEngineController)
  {
    objc_msgSend(a1, "_initializeSharedInstance");
    v2 = (void *)searchEngineController;
  }
  return (_SFSearchEngineController *)v2;
}

+ (void)_initializeSharedInstance
{
  id v2;
  void *v3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  if (!searchEngineController)
  {
    v2 = objc_alloc_init((Class)obj);
    v3 = (void *)searchEngineController;
    searchEngineController = (uint64_t)v2;

  }
  objc_sync_exit(obj);

}

- (_SFSearchEngineController)init
{
  _SFSearchEngineController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *searchEnginesQueue;
  _SFSearchEngineController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFSearchEngineController;
  v2 = -[_SFSearchEngineController init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mobilesafari._SFSearchEngineController", 0);
    searchEnginesQueue = v2->_searchEnginesQueue;
    v2->_searchEnginesQueue = (OS_dispatch_queue *)v3;

    v2->_defaultSearchEngineIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_privateSearchEngineIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[_SFSearchEngineController _populateSearchEngines](v2, "_populateSearchEngines");
    v5 = v2;
  }

  return v2;
}

- (void)_populateSearchEngines
{
  NSObject *searchEnginesQueue;
  _QWORD block[5];

  searchEnginesQueue = self->_searchEnginesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(searchEnginesQueue, block);
}

- (id)defaultSearchEngineIfPopulatedForPrivateBrowsing:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  os_unfair_lock_lock(&defaultSearchEngineLock);
  v5 = 32;
  if (v3)
    v5 = 48;
  v6 = *(id *)((char *)&self->super.isa + v5);
  os_unfair_lock_unlock(&defaultSearchEngineLock);
  return v6;
}

+ (id)sharedInstanceIfAvailable
{
  void *v2;
  id v3;
  NSObject *v5;
  _QWORD block[5];

  v2 = (void *)searchEngineController;
  if (searchEngineController)
  {
    v3 = (id)searchEngineController;
  }
  else
  {
    dispatch_get_global_queue(2, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54___SFSearchEngineController_sharedInstanceIfAvailable__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v5, block);

  }
  return v2;
}

- (void)reloadSearchEngines
{
  _SFSearchEngineInfo *defaultSearchEngine;
  _SFSearchEngineInfo *privateSearchEngine;

  os_unfair_lock_lock(&defaultSearchEngineLock);
  defaultSearchEngine = self->_defaultSearchEngine;
  self->_defaultSearchEngine = 0;

  privateSearchEngine = self->_privateSearchEngine;
  self->_privateSearchEngine = 0;

  os_unfair_lock_unlock(&defaultSearchEngineLock);
  +[_SFSearchEngineController loadSystemLanguageProperties](_SFSearchEngineController, "loadSystemLanguageProperties");
  -[_SFSearchEngineController _populateSearchEngines](self, "_populateSearchEngines");
}

- (NSString)description
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[_SFSearchEngineController engines](self, "engines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("SearchEngineController with %lu engines."), objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return (NSString *)v3;
}

- (void)setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *searchEnginesQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;

  v4 = a4;
  v6 = a3;
  os_unfair_lock_lock(&defaultSearchEngineLock);
  v7 = 32;
  if (v4)
    v7 = 48;
  v8 = *(Class *)((char *)&self->super.isa + v7);
  *(Class *)((char *)&self->super.isa + v7) = 0;

  os_unfair_lock_unlock(&defaultSearchEngineLock);
  searchEnginesQueue = self->_searchEnginesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___SFSearchEngineController_setDefaultSearchEngine_forPrivateBrowsing___block_invoke;
  block[3] = &unk_1E4AC44B0;
  block[4] = self;
  v12 = v6;
  v13 = v4;
  v10 = v6;
  dispatch_async(searchEnginesQueue, block);

}

- (void)_setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  id v6;
  NSArray *searchEngines;
  id v8;
  _QWORD v9[4];
  id v10;
  _SFSearchEngineController *v11;
  BOOL v12;

  v6 = a3;
  searchEngines = self->_searchEngines;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72___SFSearchEngineController__setDefaultSearchEngine_forPrivateBrowsing___block_invoke;
  v9[3] = &unk_1E4AC44D8;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[NSArray enumerateObjectsUsingBlock:](searchEngines, "enumerateObjectsUsingBlock:", v9);

}

- (id)defaultSearchEngine
{
  return -[_SFSearchEngineController defaultSearchEngineForPrivateBrowsing:](self, "defaultSearchEngineForPrivateBrowsing:", 0);
}

- (id)_existingEngineInfoFor:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
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
  v5 = self->_searchEngines;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v9, "shortName", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "caseInsensitiveCompare:", v4);

        if (!v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)engineInfoFor:(id)a3
{
  id v4;
  void *v5;
  NSObject *searchEnginesQueue;
  void *v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__5;
    v18 = __Block_byref_object_dispose__5;
    v19 = 0;
    searchEnginesQueue = self->_searchEnginesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43___SFSearchEngineController_engineInfoFor___block_invoke;
    block[3] = &unk_1E4AC4500;
    v13 = &v14;
    block[4] = self;
    v12 = v5;
    dispatch_sync(searchEnginesQueue, block);
    v7 = (void *)v15[5];
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      -[_SFSearchEngineController defaultSearchEngineForPrivateBrowsing:](self, "defaultSearchEngineForPrivateBrowsing:", 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    -[_SFSearchEngineController defaultSearchEngineForPrivateBrowsing:](self, "defaultSearchEngineForPrivateBrowsing:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)engineInfoForScriptName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[_SFSearchEngineController engines](self, "engines", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_msgSend(v9, "scriptName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "caseInsensitiveCompare:", v4);

          if (!v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)safeSearchRequestForSearchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_SFSearchEngineController engines](self, "engines", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "urlIsValidSearch:", v5))
        {
          objc_msgSend(v10, "safeSearchURLForSearchURL:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && (objc_msgSend(v5, "isEqual:", v11) & 1) == 0)
          {
            v7 = (void *)objc_msgSend(v4, "mutableCopy");
            objc_msgSend(v7, "setURL:", v11);
            objc_msgSend(v7, "setAttribution:", 1);
          }
          else
          {
            v7 = 0;
          }

          goto LABEL_15;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

  return v7;
}

- (id)userVisibleQueryFromSearchURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_SFSearchEngineController engines](self, "engines", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "userVisibleQueryFromSearchURL:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSArray)engines
{
  id v3;

  v3 = 0;
  -[_SFSearchEngineController _getEngines:defaultSearchEngineIndex:forPrivateBrowsing:](self, "_getEngines:defaultSearchEngineIndex:forPrivateBrowsing:", &v3, 0, 0);
  return (NSArray *)v3;
}

- (NSArray)enginesAvailableForUnifiedFieldSearching
{
  void *v2;
  void *v3;

  -[_SFSearchEngineController engines](self, "engines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)searchEngineNames
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_SFSearchEngineController engines](self, "engines", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "shortName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Wikipedia"));

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "shortName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

- (id)defaultSearchEngineNameForPrivateBrowsing:(BOOL)a3
{
  void *v3;
  void *v4;

  -[_SFSearchEngineController defaultSearchEngineForPrivateBrowsing:](self, "defaultSearchEngineForPrivateBrowsing:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierTemplateParameterValues, 0);
  objc_storeStrong((id *)&self->_templateParameterValues, 0);
  objc_storeStrong((id *)&self->_systemLanguage, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_privateSearchEngine, 0);
  objc_storeStrong((id *)&self->_defaultSearchEngine, 0);
  objc_storeStrong((id *)&self->_searchEnginesQueue, 0);
  objc_storeStrong((id *)&self->_searchEngines, 0);
}

- (void)_loadSystemPropertiesForSearchEngine:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Unable to retrieve carrier country code with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_loadSystemPropertiesForSearchEngine:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Unable to retrieve carrier network code with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_loadSystemPropertiesForSearchEngine:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Unable to retrieve carrier name with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

@end
