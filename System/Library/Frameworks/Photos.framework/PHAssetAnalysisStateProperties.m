@implementation PHAssetAnalysisStateProperties

- (PHAssetAnalysisStateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetAnalysisStateProperties *v9;
  PHAssetAnalysisStateProperties *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *fetchDictionariesByWorkerType;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHAssetAnalysisStateProperties;
  v9 = -[PHAssetAnalysisStateProperties init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    v22 = v8;
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchDictionariesByWorkerType = v10->_fetchDictionariesByWorkerType;
    v10->_fetchDictionariesByWorkerType = v11;

    v23 = v7;
    objc_msgSend(v7, "objectForKey:", CFSTR("assetAnalysisStates"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v19 = v10->_fetchDictionariesByWorkerType;
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("workerType"), v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v15);
    }

    v8 = v22;
    v7 = v23;
  }

  return v10;
}

- (int)analysisStateForWorkerType:(signed __int16)a3 outLastIgnoreDate:(id *)a4 outIgnoreUntilDate:(id *)a5
{
  NSMutableDictionary *fetchDictionariesByWorkerType;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  fetchDictionariesByWorkerType = self->_fetchDictionariesByWorkerType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fetchDictionariesByWorkerType, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("analysisState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (a4)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lastIgnoredDate"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ignoreUntilDate"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSMutableDictionary)fetchDictionariesByWorkerType
{
  return self->_fetchDictionariesByWorkerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchDictionariesByWorkerType, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetAnalysisState");
}

+ (id)entityName
{
  return CFSTR("AssetAnalysisState");
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (BOOL)isToMany
{
  return 1;
}

+ (BOOL)createsPropertySetObjectWithCustomImplementation
{
  return 1;
}

+ (id)propertiesToFetch
{
  return 0;
}

@end
