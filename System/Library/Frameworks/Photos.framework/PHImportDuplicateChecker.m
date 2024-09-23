@implementation PHImportDuplicateChecker

- (unint64_t)_populateCachesWithAssetsInfos:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  double v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12, (_QWORD)v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("asset.kindSubtype"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "integerValue") == 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("hasVideoComplement"));

        -[PHImportDuplicateChecker _populateCachesWithAssetInfo:](self, "_populateCachesWithAssetInfo:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  PLImportGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = objc_msgSend(v7, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134218240;
    v27 = v18;
    v28 = 2048;
    v29 = v19 - v6;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: time to POPULATE caches for %lu asset infos: %g", buf, 0x16u);
  }

  v20 = objc_msgSend(v7, "count");
  return v20;
}

- (PHImportDuplicateChecker)initWithLibrary:(id)a3
{
  id v5;
  PHImportDuplicateChecker *v6;
  PHImportDuplicateChecker *v7;
  uint64_t v8;
  NSMutableDictionary *sizeNameCache;
  uint64_t v10;
  NSMutableDictionary *avchdAssetIdentifierCache;
  uint64_t v12;
  NSMutableDictionary *assetIdentifierCache;
  uint64_t v14;
  NSMutableSet *updatedDupInfos;
  objc_super v17;

  v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)PHImportDuplicateChecker;
    v6 = -[PHImportDuplicateChecker init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_library, a3);
      v8 = objc_opt_new();
      sizeNameCache = v7->_sizeNameCache;
      v7->_sizeNameCache = (NSMutableDictionary *)v8;

      v10 = objc_opt_new();
      avchdAssetIdentifierCache = v7->_avchdAssetIdentifierCache;
      v7->_avchdAssetIdentifierCache = (NSMutableDictionary *)v10;

      v12 = objc_opt_new();
      assetIdentifierCache = v7->_assetIdentifierCache;
      v7->_assetIdentifierCache = (NSMutableDictionary *)v12;

      v14 = objc_opt_new();
      updatedDupInfos = v7->_updatedDupInfos;
      v7->_updatedDupInfos = (NSMutableSet *)v14;

    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)_updateAssetsFromDupInfos
{
  NSMutableSet **p_updatedDupInfos;
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  PHManualFetchResult *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PHPhotoLibrary *library;
  id v16;
  void *v17;
  id v19;
  _QWORD v20[4];
  PHManualFetchResult *v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  p_updatedDupInfos = &self->_updatedDupInfos;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableSet count](self->_updatedDupInfos, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = *p_updatedDupInfos;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "alternateImportImageDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:]([PHManualFetchResult alloc], "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v17, self->_library, CFSTR("PHAsset"), 0, 0, 0);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, -[PHFetchResult count](v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = MEMORY[0x1E0C809B0];
  while (objc_msgSend(v12, "count", v17))
  {
    library = self->_library;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke;
    v20[3] = &unk_1E35D92F8;
    v21 = v11;
    v22 = v12;
    v24 = v26;
    v23 = v3;
    v25 = 100;
    v19 = v13;
    -[PHPhotoLibrary performChangesAndWait:error:](library, "performChangesAndWait:error:", v20, &v19);
    v16 = v19;

    v13 = v16;
  }

  _Block_object_dispose(v26, 8);
}

- (void)_setDupInfo:(id)a3 forFingerprint:(id)a4 inCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (__CFString *)v11;
      PLImportGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v18 = 138412802;
        v19 = v8;
        v20 = 2112;
        v21 = v7;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: More than one master for fingerprint '%@': adding: %@, in cache: %@", (uint8_t *)&v18, 0x20u);
      }

    }
    else
    {
      v12 = (__CFString *)objc_opt_new();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v8);
    }
    -[__CFString addObject:](v12, "addObject:", v7);
    PLImportGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "fileName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "isInTrash");
      v17 = CFSTR("NO");
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      if (v16)
        v17 = CFSTR("YES");
      v21 = v8;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: name: %@, fingerprint: %@, isInTrash: %@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)_populateCachesWithAssetInfo:(id)a3
{
  id v4;
  PHImportDuplicateInfo *v5;
  PHImportDuplicateInfo *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  _BOOL4 v23;
  const __CFString *v24;
  NSDate *v25;
  NSDate *lastChange;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  PHImportDuplicateInfo *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PHImportDuplicateInfo initWithAssetInfo:]([PHImportDuplicateInfo alloc], "initWithAssetInfo:", v4);

  -[PHImportDuplicateInfo fileName](v5, "fileName");
  v6 = (PHImportDuplicateInfo *)objc_claimAutoreleasedReturnValue();
  -[PHImportDuplicateInfo fileSize](v5, "fileSize");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v4 || (v6 ? (v9 = v7 == 0) : (v9 = 1), v9))
  {
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PHImportDuplicateInfo objectID](v5, "objectID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportDuplicateInfo fileName](v5, "fileName");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[PHImportDuplicateInfo fileSize](v5, "fileSize");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v34 = v5;
      v35 = 2112;
      v36 = v27;
      v37 = 2112;
      v38 = v28;
      v39 = 2112;
      v40 = v29;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "DUPLICATE ERROR: Attempting to populate cache with assetIfo: <%p>(objectID: %@), fileName: %@, fileSize: %@", buf, 0x2Au);

    }
  }
  else
  {
    -[PHImportDuplicateInfo avchdFingerprint](v5, "avchdFingerprint");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject containsString:](v10, "containsString:", v6);
    -[PHImportDuplicateChecker _setDupInfo:forFingerprint:inCache:](self, "_setDupInfo:forFingerprint:inCache:", v5, v10, self->_avchdAssetIdentifierCache);
    -[PHImportDuplicateInfo fingerprint](v5, "fingerprint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportDuplicateChecker _setDupInfo:forFingerprint:inCache:](self, "_setDupInfo:forFingerprint:inCache:", v5, v11, self->_assetIdentifierCache);

    -[PHImportDuplicateInfo originatingAssetIdentifier](v5, "originatingAssetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportDuplicateChecker _setDupInfo:forFingerprint:inCache:](self, "_setDupInfo:forFingerprint:inCache:", v5, v12, self->_assetIdentifierCache);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_sizeNameCache, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizeNameCache, "setObject:forKeyedSubscript:", v13, v8);
    }
    -[PHImportDuplicateInfo lowercaseString](v6, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v14);
    }
    objc_msgSend(v15, "addObject:", v5);
    PLImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[PHImportDuplicateInfo imageDate](v5, "imageDate");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = &stru_1E35DFFF8;
      if (v17)
        v19 = (const __CFString *)v17;
      v31 = v19;
      -[PHImportDuplicateInfo alternateImportImageDate](v5, "alternateImportImageDate");
      v20 = objc_claimAutoreleasedReturnValue();
      v32 = v14;
      v21 = (void *)v20;
      v22 = &stru_1E35DFFF8;
      if (v20)
        v22 = (const __CFString *)v20;
      v30 = v22;
      v23 = -[PHImportDuplicateInfo isInTrash](v5, "isInTrash");
      *(_DWORD *)buf = 138413314;
      v24 = CFSTR("NO");
      v34 = v6;
      v35 = 2112;
      if (v23)
        v24 = CFSTR("YES");
      v36 = v8;
      v37 = 2112;
      v38 = v31;
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v24;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "DUPLICATE POPULATE: name: %@, size: %@, dates: %@%@, isInTrash: %@", buf, 0x34u);

      v14 = v32;
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastChange = self->_lastChange;
    self->_lastChange = v25;

  }
}

- (id)_filterDuplicatesForItem:(id)a3 duplicateSet:(id)a4 considerItemsInTrash:(BOOL)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a5)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isInTrash", (_QWORD)v16) & 1) == 0)
            objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (id)_findMatchingAssetsForItem:(id)a3 inSet:(id)a4 matchingDate:(id *)a5 confidence:(unsigned __int8 *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PHImportDuplicateChecker *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  PHImportDuplicateChecker *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  unsigned __int8 *v35;
  char v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  id obj;
  id v42;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v42 = (id)objc_opt_new();
  objc_msgSend(v9, "dateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    do
    {
      v16 = 0;
      do
      {
        v17 = v9;
        v18 = self;
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
        objc_msgSend(v19, "imageDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", v20);
        v22 = fabs(v21);

        if (v22 <= 86400.0)
        {
          PLImportGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Matched date against EXIF image date (CONFIDENT)", buf, 2u);
          }

          objc_msgSend(v42, "addObject:", v19);
          v35 = a6;
          if (!a6)
            goto LABEL_23;
          v36 = 2;
          goto LABEL_22;
        }
        objc_msgSend(v19, "alternateImportImageDate");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23
          || (v24 = (void *)v23,
              objc_msgSend(v19, "alternateImportImageDate"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v12, "timeIntervalSinceDate:", v25),
              v27 = fabs(v26),
              v25,
              v24,
              v27 > 86400.0))
        {
          objc_msgSend(v17, "metadata");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          self = v18;
          v9 = v17;
          if (!v28)
          {
            objc_msgSend(v17, "loadMetadataSync");
            objc_msgSend(v17, "metadata");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              -[PHImportDuplicateChecker _findMatchingAssetsForItem:inSet:matchingDate:confidence:](self, "_findMatchingAssetsForItem:inSet:matchingDate:confidence:", v17, obj, a5, a6);
              v30 = self;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v31, "count"))
              {
                objc_msgSend(v31, "allObjects");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "addObjectsFromArray:", v32);

                objc_msgSend(v17, "fileCreationDate");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setAlternateImportImageDate:", v33);

                -[NSMutableSet addObject:](v30->_updatedDupInfos, "addObject:", v19);
              }

              self = v30;
              v9 = v17;
            }
            else
            {
              PLImportGetLog();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "DUPLICATE CHECK: Failed to load metadata for date check.", buf, 2u);
              }

            }
          }
          goto LABEL_25;
        }
        PLImportGetLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Matched date against Alternate Import image date (POSSIBLE)", buf, 2u);
        }

        objc_msgSend(v42, "addObject:", v19);
        v35 = a6;
        if (a6)
        {
          v36 = 1;
LABEL_22:
          *v35 = v36;
        }
LABEL_23:
        self = v18;
        v9 = v17;
        if (a5)
        {
          objc_msgSend(v19, "imageDate");
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_25:
        ++v16;
      }
      while (v14 != v16);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      v14 = v39;
    }
    while (v39);
  }

  return v42;
}

- (BOOL)_findFingerprint:(id)a3 forItem:(id)a4 inCache:(id)a5 considerTrash:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      -[PHImportDuplicateChecker _filterDuplicatesForItem:duplicateSet:considerItemsInTrash:](self, "_filterDuplicatesForItem:duplicateSet:considerItemsInTrash:", v11, v12, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        v14 = 1;
        objc_msgSend(v11, "setIsDuplicate:", 1);
        objc_msgSend(v11, "setDuplicateStateConfidence:", 2);
        -[PHPhotoLibrary uuid](self->_library, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDuplicates:forLibrary:", v13, v15);

      }
      else
      {
        PLImportGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "nameKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412546;
          v22 = v19;
          v23 = 2112;
          v24 = v10;
          _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: name: %@, fingerprint: %@ ==> FOUND : Filtered out", (uint8_t *)&v21, 0x16u);

        }
        v14 = 0;
      }
    }
    else
    {
      PLImportGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v11, "nameKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v17;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: name: %@, fingerprint: %@ ==> NOT FOUND", (uint8_t *)&v21, 0x16u);

      }
      v14 = 0;
      v13 = v12;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_checkForDuplicate:(id)a3 considerItemsInTheTrash:(BOOL)a4
{
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _BOOL4 v39;
  uint64_t v41;
  void *v42;
  NSMutableDictionary *sizeNameCache;
  void *v44;
  uint64_t v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t m;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  void *v128;
  void *v129;
  NSObject *v130;
  _BOOL4 v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  NSObject *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  NSObject *v157;
  void *v158;
  void *v159;
  double v160;
  uint64_t v161;
  void *v162;
  void *v163;
  NSObject *v164;
  id v165;
  void *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  NSObject *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  NSObject *v174;
  uint64_t v175;
  id obj;
  id obja;
  uint64_t v178;
  id v179;
  id v180;
  id v181;
  unsigned int v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  id v210;
  unsigned __int8 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  id v216;
  id v217;
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  uint8_t v222[128];
  uint8_t buf[4];
  void *v224;
  __int16 v225;
  void *v226;
  __int16 v227;
  void *v228;
  __int16 v229;
  void *v230;
  __int16 v231;
  NSObject *v232;
  __int16 v233;
  double v234;
  _BYTE v235[128];
  _BYTE v236[128];
  uint64_t v237;

  v4 = a4;
  v237 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSObject lastDuplicateCheck](v6, "lastDuplicateCheck");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[NSObject lastDuplicateCheck](v6, "lastDuplicateCheck"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "compare:", self->_lastChange),
        v9,
        v8,
        v10 == -1))
  {
    -[NSObject setIsDuplicate:](v6, "setIsDuplicate:", 0);
    -[NSObject avchdAssetId](v6, "avchdAssetId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PHImportDuplicateChecker _findFingerprint:forItem:inCache:considerTrash:](self, "_findFingerprint:forItem:inCache:considerTrash:", v24, v6, self->_avchdAssetIdentifierCache, v4);

    if (v25)
    {
      PLImportGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject nameKey](v6, "nameKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject originatingAssetID](v6, "originatingAssetID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v224 = v27;
        v225 = 2112;
        v226 = v28;
        v29 = "DUPLICATE CHECK: name: %@, avchdAssetId (UUID): %@ ==> FOUND";
LABEL_20:
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, v29, buf, 0x16u);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    -[NSObject fingerprint](v6, "fingerprint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PHImportDuplicateChecker _findFingerprint:forItem:inCache:considerTrash:](self, "_findFingerprint:forItem:inCache:considerTrash:", v30, v6, self->_assetIdentifierCache, v4);

    if (v31)
    {
      PLImportGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject nameKey](v6, "nameKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject originatingAssetID](v6, "originatingAssetID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v224 = v27;
        v225 = 2112;
        v226 = v28;
        v29 = "DUPLICATE CHECK: name: %@, assetId (fingerprint): %@ ==> FOUND";
        goto LABEL_20;
      }
LABEL_21:

LABEL_22:
      v14 = 0;
      goto LABEL_23;
    }
    -[NSObject originatingAssetID](v6, "originatingAssetID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PHImportDuplicateChecker _findFingerprint:forItem:inCache:considerTrash:](self, "_findFingerprint:forItem:inCache:considerTrash:", v38, v6, self->_assetIdentifierCache, v4);

    if (v39)
    {
      PLImportGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject nameKey](v6, "nameKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject originatingAssetID](v6, "originatingAssetID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v224 = v27;
        v225 = 2112;
        v226 = v28;
        v29 = "DUPLICATE CHECK: name: %@, originatingAssetID (fingerprint): %@ ==> FOUND";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    -[NSObject sizeKey](v6, "sizeKey");
    v41 = objc_claimAutoreleasedReturnValue();
    -[NSObject nameKey](v6, "nameKey");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = (void *)v41;
    if (!v41 || !v42)
    {

LABEL_65:
      goto LABEL_22;
    }
    v167 = v42;
    sizeNameCache = self->_sizeNameCache;
    if (sizeNameCache)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](sizeNameCache, "objectForKeyedSubscript:", v41);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      if (v166)
      {
        -[NSObject url](v6, "url");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v217 = 0;
        v45 = *MEMORY[0x1E0C99C70];
        v216 = 0;
        v163 = v44;
        v46 = objc_msgSend(v44, "getResourceValue:forKey:error:", &v217, v45, &v216);
        v165 = v217;
        v170 = v6;
        v164 = v216;
        if (v164)
        {
          PLImportGetLog();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject sizeKey](v6, "sizeKey");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject nameKey](v6, "nameKey");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject fileName](v6, "fileName");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject dateKey](v6, "dateKey");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v224 = v48;
            v225 = 2112;
            v226 = v49;
            v227 = 2112;
            v228 = v50;
            v229 = 2112;
            v230 = v52;
            v231 = 2112;
            v232 = v164;
            _os_log_impl(&dword_1991EC000, v47, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: ERROR => File case sensitivity checking:\n%@", buf, 0x34u);

            v6 = v170;
          }

        }
        if (v46)
          v46 = objc_msgSend(v165, "BOOLValue");
        objc_msgSend(v167, "lowercaseString");
        v161 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "objectForKeyedSubscript:");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v46)
        {
          v182 = v4;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v53, "count"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v212 = 0u;
          v213 = 0u;
          v214 = 0u;
          v215 = 0u;
          v56 = v54;
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v212, v236, 16);
          if (v57)
          {
            v58 = v57;
            v59 = *(_QWORD *)v213;
            do
            {
              for (i = 0; i != v58; ++i)
              {
                if (*(_QWORD *)v213 != v59)
                  objc_enumerationMutation(v56);
                v61 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * i);
                -[NSObject fileName](v170, "fileName");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "fileName");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = objc_msgSend(v62, "isEqualToString:", v63);

                if (v64)
                  objc_msgSend(v55, "addObject:", v61);
              }
              v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v212, v236, 16);
            }
            while (v58);
          }

          v6 = v170;
          v54 = v55;
          v4 = v182;
        }
        v162 = v54;
        if (!v54)
        {
          v67 = (void *)objc_opt_new();
          v194 = 0u;
          v195 = 0u;
          v196 = 0u;
          v197 = 0u;
          obj = v166;
          v169 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v194, v220, 16);
          if (v169)
          {
            v168 = *(_QWORD *)v195;
            do
            {
              v84 = 0;
              do
              {
                if (*(_QWORD *)v195 != v168)
                  objc_enumerationMutation(obj);
                v171 = v84;
                v85 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * v84);
                v190 = 0u;
                v191 = 0u;
                v192 = 0u;
                v193 = 0u;
                v175 = v85;
                objc_msgSend(obj, "objectForKeyedSubscript:");
                v180 = (id)objc_claimAutoreleasedReturnValue();
                v86 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v190, v219, 16);
                if (v86)
                {
                  v87 = v86;
                  v88 = *(_QWORD *)v191;
                  v172 = *(_QWORD *)v191;
                  do
                  {
                    v89 = 0;
                    v178 = v87;
                    do
                    {
                      if (*(_QWORD *)v191 != v88)
                        objc_enumerationMutation(v180);
                      v90 = *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * v89);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v183 = v89;
                        v188 = 0u;
                        v189 = 0u;
                        v186 = 0u;
                        v187 = 0u;
                        objc_msgSend(obj, "objectForKeyedSubscript:", v175);
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v91, "objectForKeyedSubscript:", v90);
                        v92 = (void *)objc_claimAutoreleasedReturnValue();

                        v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v186, v218, 16);
                        if (v93)
                        {
                          v94 = v93;
                          v95 = *(_QWORD *)v187;
                          do
                          {
                            for (j = 0; j != v94; ++j)
                            {
                              if (*(_QWORD *)v187 != v95)
                                objc_enumerationMutation(v92);
                              v97 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * j);
                              if ((objc_msgSend(v97, "isInTrash") & 1) == 0)
                              {
                                v98 = (void *)MEMORY[0x1E0CB3940];
                                objc_msgSend(v97, "fileName");
                                v99 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v98, "stringWithFormat:", CFSTR("[size: %@, name: %@, date: %@]"), v185, v99, v90);
                                v100 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v67, "addObject:", v100);

                              }
                            }
                            v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v186, v218, 16);
                          }
                          while (v94);
                        }

                        v88 = v172;
                        v87 = v178;
                        v89 = v183;
                      }
                      ++v89;
                    }
                    while (v89 != v87);
                    v87 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v190, v219, 16);
                  }
                  while (v87);
                }

                v84 = v171 + 1;
              }
              while (v171 + 1 != v169);
              v169 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v194, v220, 16);
            }
            while (v169);
          }

          PLImportGetLog();
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject sizeKey](v170, "sizeKey");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject nameKey](v170, "nameKey");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject fileName](v170, "fileName");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject dateKey](v170, "dateKey");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v224 = v102;
            v225 = 2112;
            v226 = v103;
            v227 = 2112;
            v228 = v104;
            v229 = 2112;
            v230 = v106;
            _os_log_impl(&dword_1991EC000, v101, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: No matching name.", buf, 0x2Au);

          }
          if (!objc_msgSend(v67, "count"))
          {
            v14 = 0;
            v109 = (void *)v161;
LABEL_136:

            v6 = v170;
            goto LABEL_23;
          }
          PLImportGetLog();
          v107 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v67, "componentsJoinedByString:", CFSTR(", "));
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v224 = v108;
            _os_log_impl(&dword_1991EC000, v107, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: In cache: %@", buf, 0xCu);

          }
          v14 = 0;
          v109 = (void *)v161;
LABEL_135:

          goto LABEL_136;
        }
        -[NSObject dateKey](v6, "dateKey");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v65);
        v66 = v6;
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v211 = 0;
        v210 = 0;
        -[PHImportDuplicateChecker _findMatchingAssetsForItem:inSet:matchingDate:confidence:](self, "_findMatchingAssetsForItem:inSet:matchingDate:confidence:", v66, v54, &v210, &v211);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v210;
        if (objc_msgSend(v68, "count"))
        {
          -[PHImportDuplicateChecker _filterDuplicatesForItem:duplicateSet:considerItemsInTrash:](self, "_filterDuplicatesForItem:duplicateSet:considerItemsInTrash:", v66, v68, v4);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v69, "count"))
          {
            -[NSObject setIsDuplicate:](v66, "setIsDuplicate:", 1);
            -[NSObject setDuplicateStateConfidence:](v66, "setDuplicateStateConfidence:", v211);
            -[PHPhotoLibrary uuid](self->_library, "uuid");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setDuplicates:forLibrary:](v66, "setDuplicates:forLibrary:", v69, v70);

            if (-[NSObject isLivePhoto](v66, "isLivePhoto"))
            {
              v208 = 0u;
              v209 = 0u;
              v206 = 0u;
              v207 = 0u;
              v71 = v69;
              v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v206, v235, 16);
              if (v72)
              {
                v73 = v72;
                v74 = *(_QWORD *)v207;
                while (2)
                {
                  for (k = 0; k != v73; ++k)
                  {
                    if (*(_QWORD *)v207 != v74)
                      objc_enumerationMutation(v71);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v206 + 1) + 8 * k), "hasVideoComplement"))
                    {
                      -[NSObject videoComplement](v170, "videoComplement");
                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v153, "setIsDuplicate:", 1);

                      goto LABEL_129;
                    }
                  }
                  v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v206, v235, 16);
                  if (v73)
                    continue;
                  break;
                }
              }
LABEL_129:

            }
            PLImportGetLog();
            v138 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject sizeKey](v170, "sizeKey");
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject nameKey](v170, "nameKey");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject fileName](v170, "fileName");
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject dateKey](v170, "dateKey");
              v157 = v138;
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v158);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "timeIntervalSinceDate:", v174);
              *(_DWORD *)buf = 138413570;
              v224 = v154;
              v225 = 2112;
              v226 = v155;
              v227 = 2112;
              v228 = v156;
              v229 = 2112;
              v230 = v159;
              v231 = 2112;
              v232 = v174;
              v233 = 2048;
              v234 = fabs(v160 / 3600.0);
              _os_log_impl(&dword_1991EC000, v157, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> FOUND: dupDate: %@ (diff: %gh)", buf, 0x3Eu);

              v138 = v157;
              v107 = v174;

              v14 = v69;
LABEL_132:
              v109 = (void *)v161;
LABEL_134:

              goto LABEL_135;
            }
          }
          else
          {
            PLImportGetLog();
            v138 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject sizeKey](v170, "sizeKey");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject nameKey](v170, "nameKey");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject fileName](v170, "fileName");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject dateKey](v170, "dateKey");
              v142 = v138;
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v143);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v224 = v139;
              v225 = 2112;
              v226 = v140;
              v227 = 2112;
              v228 = v141;
              v229 = 2112;
              v230 = v144;
              _os_log_impl(&dword_1991EC000, v142, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: Filtered out", buf, 0x2Au);

              v138 = v142;
            }
          }
          v14 = v69;
          v109 = (void *)v161;
          v107 = v174;
          goto LABEL_134;
        }
        v173 = v68;
        v110 = objc_opt_new();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sizeNameCache, "objectForKeyedSubscript:", v185);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "objectForKeyedSubscript:", v167);
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        v204 = 0u;
        v205 = 0u;
        v202 = 0u;
        v203 = 0u;
        v113 = v112;
        v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v202, v222, 16);
        v179 = v113;
        if (v114)
        {
          v115 = v114;
          v116 = *(id *)v203;
          obja = *(id *)v203;
          do
          {
            v117 = 0;
            v181 = (id)v115;
            do
            {
              if (*(id *)v203 != v116)
                objc_enumerationMutation(v113);
              v118 = *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * v117);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v184 = v117;
                v200 = 0u;
                v201 = 0u;
                v198 = 0u;
                v199 = 0u;
                objc_msgSend(v113, "objectForKeyedSubscript:", v118);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v198, v221, 16);
                if (v120)
                {
                  v121 = v120;
                  v122 = *(_QWORD *)v199;
                  do
                  {
                    for (m = 0; m != v121; ++m)
                    {
                      if (*(_QWORD *)v199 != v122)
                        objc_enumerationMutation(v119);
                      v124 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * m);
                      if ((objc_msgSend(v124, "isInTrash") & 1) == 0)
                      {
                        v125 = (void *)MEMORY[0x1E0CB3940];
                        objc_msgSend(v124, "fileName");
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v67, "timeIntervalSinceDate:", v118);
                        objc_msgSend(v125, "stringWithFormat:", CFSTR("[size: %@, name: %@, date: %@ (diff: %gh)]"), v185, v126, v118, fabs(v127 / 3600.0));
                        v128 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject addObject:](v110, "addObject:", v128);

                      }
                    }
                    v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v198, v221, 16);
                  }
                  while (v121);
                }

                v116 = obja;
                v113 = v179;
                v115 = (uint64_t)v181;
                v117 = v184;
              }
              ++v117;
            }
            while (v117 != v115);
            v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v202, v222, 16);
          }
          while (v115);
        }

        -[NSObject creationDate](v170, "creationDate");
        v129 = (void *)objc_claimAutoreleasedReturnValue();

        PLImportGetLog();
        v130 = objc_claimAutoreleasedReturnValue();
        v131 = os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG);
        if (v129)
        {
          if (v131)
          {
            -[NSObject sizeKey](v170, "sizeKey");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject sizeKey](v170, "sizeKey");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject fileName](v170, "fileName");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject dateKey](v170, "dateKey");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v135);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject creationDate](v170, "creationDate");
            v137 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v224 = v132;
            v225 = 2112;
            v226 = v133;
            v227 = 2112;
            v228 = v134;
            v229 = 2112;
            v230 = v136;
            v231 = 2112;
            v232 = v137;
            _os_log_impl(&dword_1991EC000, v130, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: CHECKING EXIF date: %@ ==> NOT FOUND: No matching date.", buf, 0x34u);

            v113 = v179;
          }
        }
        else if (v131)
        {
          -[NSObject sizeKey](v170, "sizeKey");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject nameKey](v170, "nameKey");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject fileName](v170, "fileName");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject dateKey](v170, "dateKey");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v148);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v224 = v145;
          v225 = 2112;
          v226 = v146;
          v227 = 2112;
          v228 = v147;
          v229 = 2112;
          v230 = v149;
          v231 = 2112;
          v232 = v170;
          _os_log_impl(&dword_1991EC000, v130, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: No EXIF date, no matching date. %@", buf, 0x34u);

        }
        v138 = v110;
        v150 = -[NSObject count](v110, "count");
        v14 = v173;
        v107 = v174;
        if (v150)
        {
          PLImportGetLog();
          v151 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject componentsJoinedByString:](v138, "componentsJoinedByString:", CFSTR(", "));
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v224 = v152;
            _os_log_impl(&dword_1991EC000, v151, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: In cache: %@", buf, 0xCu);

          }
        }

        goto LABEL_132;
      }
      PLImportGetLog();
      v76 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        goto LABEL_64;
      -[NSObject sizeKey](v6, "sizeKey");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject nameKey](v6, "nameKey");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fileName](v6, "fileName");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject dateKey](v6, "dateKey");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v83);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v224 = v77;
      v225 = 2112;
      v226 = v78;
      v227 = 2112;
      v228 = v79;
      v229 = 2112;
      v230 = v81;
      _os_log_impl(&dword_1991EC000, v76, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@ ==> NOT FOUND: No matching size.", buf, 0x2Au);

    }
    else
    {
      PLImportGetLog();
      v76 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      {
LABEL_64:

        goto LABEL_65;
      }
      -[NSObject sizeKey](v6, "sizeKey");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject nameKey](v6, "nameKey");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fileName](v6, "fileName");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject dateKey](v6, "dateKey");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHPhotoLibrary uuid](self->_library, "uuid");
      v82 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v224 = v77;
      v225 = 2112;
      v226 = v78;
      v227 = 2112;
      v228 = v79;
      v229 = 2112;
      v230 = v81;
      v231 = 2112;
      v232 = v82;
      _os_log_impl(&dword_1991EC000, v76, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: Can't dedup against databse %@ because it's not in the cache. Possibly shut down?", buf, 0x34u);

    }
    goto LABEL_64;
  }
  if (!-[NSObject isDuplicate](v6, "isDuplicate"))
  {
    PLImportGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject sizeKey](v6, "sizeKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject nameKey](v6, "nameKey");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fileName](v6, "fileName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject dateKey](v6, "dateKey");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject nameKey](v6, "nameKey");
      v37 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v224 = v32;
      v225 = 2112;
      v226 = v33;
      v227 = 2112;
      v228 = v34;
      v229 = 2112;
      v230 = v36;
      v231 = 2112;
      v232 = v37;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: No change in DB since last check, %@ is not a dup", buf, 0x34u);

    }
    goto LABEL_21;
  }
  -[NSObject duplicates](v6, "duplicates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary uuid](self->_library, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDuplicateChecker _filterDuplicatesForItem:duplicateSet:considerItemsInTrash:](self, "_filterDuplicatesForItem:duplicateSet:considerItemsInTrash:", v6, v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PLImportGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[NSObject sizeKey](v6, "sizeKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject nameKey](v6, "nameKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject fileName](v6, "fileName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject dateKey](v6, "dateKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImportDuplicateChecker _dateWithDate:](PHImportDuplicateChecker, "_dateWithDate:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject nameKey](v6, "nameKey");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 138413570;
    v23 = &stru_1E35DFFF8;
    v224 = v16;
    v225 = 2112;
    if (!v22)
      v23 = CFSTR(": Filtered out");
    v226 = v17;
    v227 = 2112;
    v228 = v18;
    v229 = 2112;
    v230 = v20;
    v231 = 2112;
    v232 = v21;
    v233 = 2112;
    v234 = *(double *)&v23;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: Looking for size: %@, name: %@ (%@), date: %@: No change in DB since last check, %@ is a dup%@", buf, 0x3Eu);

  }
LABEL_23:

  return v14;
}

- (void)findDuplicatesOfItems:(id)a3 considerItemsInTrash:(BOOL)a4 forEach:(id)a5 atEnd:(id)a6
{
  _BOOL8 v8;
  id v9;
  void (**v10)(id, void *, void *, _QWORD);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void (**v34)(id, void *);
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  double v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v8 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *, void *, _QWORD))a5;
  v34 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "sizeKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v14);
  }

  v33 = v11;
  +[PHImportDuplicateChecker _fetchAssetInfoFromLibrary:forFileSizes:](PHImportDuplicateChecker, "_fetchAssetInfoFromLibrary:forFileSizes:", self->_library, v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDuplicateChecker _populateCachesWithAssetsInfos:](self, "_populateCachesWithAssetsInfos:");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v18;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v12;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v26 = objc_msgSend(v25, "isDuplicate");
        -[PHImportDuplicateChecker _checkForDuplicate:considerItemsInTheTrash:](self, "_checkForDuplicate:considerItemsInTheTrash:", v25, v8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          if (!v22)
            v22 = (void *)objc_opt_new();
          objc_msgSend(v25, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v27, v28);

        }
        if (v10)
          v10[2](v10, v25, v27, v26 ^ objc_msgSend(v25, "isDuplicate"));

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  PLImportGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = objc_msgSend(v32, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134218240;
    v46 = v30;
    v47 = 2048;
    v48 = v31 - v19;
    _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEBUG, "DUPLICATE CHECK: time to CHECK caches for %lu asset infos: %g", buf, 0x16u);
  }

  if (v34)
    v34[2](v34, v22);
  -[PHImportDuplicateChecker _updateAssetsFromDupInfos](self, "_updateAssetsFromDupInfos");

}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_updatedDupInfos, 0);
  objc_storeStrong((id *)&self->_lastChange, 0);
  objc_storeStrong((id *)&self->_assetIdentifierCache, 0);
  objc_storeStrong((id *)&self->_sizeNameCache, 0);
  objc_storeStrong((id *)&self->_avchdAssetIdentifierCache, 0);
}

void __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke_2;
  v6[3] = &unk_1E35D5C60;
  v9 = *(_QWORD *)(a1 + 56);
  v7 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v8 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsAtIndexes:options:usingBlock:", v7, 0, v6);

}

void __53__PHImportDuplicateChecker__updateAssetsFromDupInfos__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "removeIndex:", a3);
  v12 = v7;
  +[PHAssetChangeRequest changeRequestForAsset:](PHAssetChangeRequest, "changeRequestForAsset:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v12, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlternateImportImageDate:", v11);

  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56);
}

+ (id)duplicatesFromResults:(id)a3 forLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "photoLibraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_dateWithDate:(id)a3
{
  double v3;

  if (a3)
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  else
    v3 = NAN;
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v3);
}

+ (id)_fetchAssetInfoFromLibrary:(id)a3 forFileSizes:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  double v29;
  id v30;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  double v47;
  _QWORD v48[3];
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  if (_fetchAssetInfoFromLibrary_forFileSizes__onceToken != -1)
    dispatch_once(&_fetchAssetInfoFromLibrary_forFileSizes__onceToken, &__block_literal_global_44);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("originalFilesize"), v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("asset.visibilityState"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v9;
  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("asset.avalancheUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("asset.avalancheKind"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary"), 0, CFSTR("asset"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3528];
  v48[0] = v33;
  v48[1] = v16;
  v48[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71570], "entityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchRequestWithEntityName:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setPredicate:", v20);
  objc_msgSend(v23, "setPropertiesToFetch:", _fetchAssetInfoFromLibrary_forFileSizes__properties);
  objc_msgSend(v23, "setResultType:", 2);
  objc_msgSend(v32, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __68__PHImportDuplicateChecker__fetchAssetInfoFromLibrary_forFileSizes___block_invoke_119;
  v34[3] = &unk_1E35DEE50;
  v37 = &v38;
  v25 = v24;
  v35 = v25;
  v26 = v23;
  v36 = v26;
  objc_msgSend(v25, "performBlockAndWait:", v34);

  PLImportGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v28 = objc_msgSend(v5, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134218240;
    v45 = v28;
    v46 = 2048;
    v47 = v29 - v7;
    _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_DEBUG, "DUPLICATE QUERY: time to FETCH asset info from database for %lu file sizes: %g", buf, 0x16u);
  }

  v30 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v30;
}

void __68__PHImportDuplicateChecker__fetchAssetInfoFromLibrary_forFileSizes___block_invoke_119(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __68__PHImportDuplicateChecker__fetchAssetInfoFromLibrary_forFileSizes___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("asset");
  v4[2] = CFSTR("originalFilesize");
  v4[3] = CFSTR("originalFilename");
  v4[4] = CFSTR("alternateImportImageDate");
  v4[5] = CFSTR("timeZoneOffset");
  v4[6] = CFSTR("originalStableHash");
  v4[7] = CFSTR("originatingAssetIdentifier");
  v4[8] = CFSTR("asset.dateCreated");
  v4[9] = CFSTR("asset.trashedState");
  v4[10] = CFSTR("asset.kindSubtype");
  v4[11] = CFSTR("asset.uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 12);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_fetchAssetInfoFromLibrary_forFileSizes__properties;
  _fetchAssetInfoFromLibrary_forFileSizes__properties = v2;

}

@end
