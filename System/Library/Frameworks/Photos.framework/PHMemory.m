@implementation PHMemory

+ (void)generateMemoriesWithOptions:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoAnalysisClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__PHMemory_generateMemoriesWithOptions_completion___block_invoke;
    v14[3] = &unk_1E35DC480;
    v15 = v8;
    objc_msgSend(v11, "generateMemoriesWithOptions:reply:", v12, v14);

  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMemory.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(a1, "corePropertiesToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v8);

    if ((v3 & 4) == 0)
      return v5;
    goto LABEL_4;
  }
  objc_msgSend(a1, "identifierPropertiesToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v7);

  if ((v3 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 4) != 0)
LABEL_4:
    objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  return v5;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (propertiesToFetchWithHint__onceToken_11470 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_11470, &__block_literal_global_11471);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11312;
  v9 = __Block_byref_object_dispose__11313;
  v10 = 0;
  pl_dispatch_sync();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

+ (id)corePropertiesToFetch
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PHMemory_corePropertiesToFetch__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (corePropertiesToFetch_onceToken != -1)
    dispatch_once(&corePropertiesToFetch_onceToken, block);
  return (id)corePropertiesToFetch_array;
}

+ (id)managedEntityName
{
  return CFSTR("Memory");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHMemory");
  return CFSTR("PHMemory");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsPendingState
{
  return 1;
}

+ (BOOL)managedObjectSupportsCreationType
{
  return 1;
}

+ (BOOL)managedObjectSupportsRejectedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 1;
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    *(_QWORD *)&a3 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("sharingComposition"), a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identifierCode
{
  return CFSTR("100");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_11462;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PHMemory_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_11453 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_11453, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_11454, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PHMemory;
  objc_msgSendSuper2(&v9, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(a1, "fetchPredicateFromUserCreatedComparisonPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)fetchPredicateFromUserCreatedComparisonPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "leftExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "expressionType") == 3)
  {
    objc_msgSend(v4, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("userCreated")) && !objc_msgSend(v5, "expressionType"))
  {
    objc_msgSend(v5, "constantValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("userActionOptions"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("userActionOptions"), 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3528];
      v17[0] = v10;
      v17[1] = v11;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("userActionOptions"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("userActionOptions"), 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3528];
      v16[0] = v10;
      v16[1] = v11;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v16;
    }
    objc_msgSend(v13, "arrayWithObjects:count:", v14, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "orPredicateWithSubpredicates:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)fetchBlockedMemoriesWithOptions:(id)a3
{
  PHFetchOptions *v3;
  PHFetchOptions *v4;
  void *v5;
  void *v6;

  if (a3)
    v3 = (PHFetchOptions *)objc_msgSend(a3, "copy");
  else
    v3 = objc_alloc_init(PHFetchOptions);
  v4 = v3;
  -[PHFetchOptions setIncludeRejectedMemories:](v3, "setIncludeRejectedMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("blacklistedFeature != nil"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions setInternalPredicate:](v4, "setInternalPredicate:", v5);
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMemory, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchMemoriesWithOptions:(id)a3
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMemory, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, a3);
}

+ (id)fetchMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PHMemory_fetchMemoriesWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchMemoriesWithUserFeedbackWithOptions:(id)a3
{
  PHFetchOptions *v3;
  PHFetchOptions *v4;
  void *v5;
  void *v6;

  if (a3)
    v3 = (PHFetchOptions *)objc_msgSend(a3, "copy");
  else
    v3 = objc_alloc_init(PHFetchOptions);
  v4 = v3;
  -[PHFetchOptions setIncludeRejectedMemories:](v3, "setIncludeRejectedMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("userFeedbacks.@count > 0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions setInternalPredicate:](v4, "setInternalPredicate:", v5);

  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMemory, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchMemoriesWithNilLastEnrichmentDateWithOptions:(id)a3
{
  PHFetchOptions *v3;
  PHFetchOptions *v4;
  void *v5;
  void *v6;

  if (a3)
    v3 = (PHFetchOptions *)objc_msgSend(a3, "copy");
  else
    v3 = objc_alloc_init(PHFetchOptions);
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("lastEnrichmentDate == nil"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions setInternalPredicate:](v4, "setInternalPredicate:", v5);

  -[PHFetchOptions setIsExclusivePredicate:](v4, "setIsExclusivePredicate:", 1);
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMemory, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchMemoryWithGraphMemoryIdentifier:(id)a3 options:(id)a4
{
  id v6;
  PHFetchOptions *v7;
  id v8;
  PHFetchOptions *v9;
  void *v10;
  void *v11;

  if (a4)
  {
    v6 = a3;
    v7 = (PHFetchOptions *)objc_msgSend(a4, "copy");
  }
  else
  {
    v8 = a3;
    v7 = objc_alloc_init(PHFetchOptions);
  }
  v9 = v7;
  -[PHFetchOptions setIncludeLocalMemories:](v7, "setIncludeLocalMemories:", 1);
  -[PHFetchOptions setIncludeRejectedMemories:](v9, "setIncludeRejectedMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("graphMemoryIdentifier == %@"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHFetchOptions setInternalPredicate:](v9, "setInternalPredicate:", v10);
  -[PHFetchOptions setIsExclusivePredicate:](v9, "setIsExclusivePredicate:", 1);
  -[PHFetchOptions setFetchLimit:](v9, "setFetchLimit:", 1);
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMemory, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fetchMemoriesWithGraphMemoryIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  PHFetchOptions *v7;
  id v8;
  PHFetchOptions *v9;
  void *v10;
  void *v11;

  if (a4)
  {
    v6 = a3;
    v7 = (PHFetchOptions *)objc_msgSend(a4, "copy");
  }
  else
  {
    v8 = a3;
    v7 = objc_alloc_init(PHFetchOptions);
  }
  v9 = v7;
  -[PHFetchOptions setIncludeRejectedMemories:](v7, "setIncludeRejectedMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("graphMemoryIdentifier IN %@"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHFetchOptions setInternalPredicate:](v9, "setInternalPredicate:", v10);
  -[PHFetchOptions setIsExclusivePredicate:](v9, "setIsExclusivePredicate:", 1);
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMemory, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)movieDataWithTitleFontName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("titleFontName"));

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)titleFontNameFromMovieData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v9 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v9);
    v5 = v9;
    if (v4)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleFontName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, "Error while decoding movieData: %@", buf, 0xCu);
      }

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)assetListPredicateFromQueryHintObjects:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _UNKNOWN **v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v10 = &off_1E35D2000;
    v24 = v6;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          if (objc_msgSend(v13, "assetCollectionType") == 1
            && (objc_msgSend(v13, "assetCollectionSubtype") == 2 || objc_msgSend(v13, "assetCollectionSubtype") == 5))
          {
            objc_msgSend(v13, "cloudGUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 || (objc_msgSend(v13, "uuid"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend(v4, "addObject:", v14);
              goto LABEL_18;
            }
          }
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "uuid");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          if (objc_msgSend(v13, "collectionListSubtype") == 2)
          {
            objc_msgSend(v13, "startDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "endDate");
            v15 = v5;
            v16 = v4;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = v14;
            v31[1] = v17;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
            v18 = v10;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v19);

            v10 = v18;
            v4 = v16;
            v5 = v15;
            v6 = v24;
LABEL_18:

          }
LABEL_19:

          goto LABEL_20;
        }
        objc_opt_class();
        objc_opt_isKindOfClass();
LABEL_20:
        ++v11;
      }
      while (v8 != v11);
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v8 = v20;
    }
    while (v20);
  }

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v23, "setObject:forKey:", v4, CFSTR("albums"));
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v23, "setObject:forKey:", v5, CFSTR("persons"));
  if (objc_msgSend(v25, "count"))
    objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("dateRanges"));
  if (!objc_msgSend(v23, "count")
    || (v26 = 0,
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v23, 200, 0, &v26),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)stringForCategory:(unint64_t)a3
{
  id result;

  if ((uint64_t)a3 > 100)
  {
    if ((uint64_t)a3 > 300)
    {
      switch(a3)
      {
        case 0x12DuLL:
          return CFSTR("Featured");
        case 0x12EuLL:
          return CFSTR("Place");
        case 0x191uLL:
          return CFSTR("Blocked");
        default:
          return CFSTR("Unsupported Category");
      }
    }
    else
    {
      switch(a3)
      {
        case 0xC9uLL:
          result = CFSTR("Year Summary");
          break;
        case 0xCAuLL:
          result = CFSTR("Day in History");
          break;
        case 0xCBuLL:
          result = CFSTR("Last Weekend");
          break;
        case 0xCCuLL:
          result = CFSTR("Last Week");
          break;
        case 0xCDuLL:
          result = CFSTR("This Week");
          break;
        case 0xCEuLL:
          result = CFSTR("Same Day");
          break;
        case 0xCFuLL:
          result = CFSTR("Same Weekend");
          break;
        case 0xD0uLL:
          result = CFSTR("Week in History");
          break;
        case 0xD1uLL:
          result = CFSTR("Recent Past Event");
          break;
        case 0xD2uLL:
          result = CFSTR("Upcoming Related Event");
          break;
        case 0xD3uLL:
          result = CFSTR("Best of Past");
          break;
        case 0xD4uLL:
          result = CFSTR("Celebrated Holiday in History");
          break;
        case 0xD5uLL:
          result = CFSTR("Holiday in History");
          break;
        case 0xD6uLL:
          result = CFSTR("Throwback Thursday");
          break;
        case 0xD7uLL:
          result = CFSTR("Celebration Over Time");
          break;
        case 0xD8uLL:
          result = CFSTR("This Season");
          break;
        case 0xD9uLL:
          result = CFSTR("Season in History");
          break;
        case 0xDAuLL:
          result = CFSTR("Key People for Upcoming Holiday Event");
          break;
        case 0xDBuLL:
          result = CFSTR("Early moments with People");
          break;
        case 0xDCuLL:
          result = CFSTR("People over Time");
          break;
        case 0xDDuLL:
          result = CFSTR("Home Aggregation");
          break;
        default:
          if (a3 == 101)
          {
            result = CFSTR("Contextual");
          }
          else
          {
            if (a3 != 102)
              return CFSTR("Unsupported Category");
            result = CFSTR("Nearby Today");
          }
          break;
      }
    }
  }
  else
  {
    result = CFSTR("Unknown");
    switch(a3)
    {
      case 0uLL:
        return result;
      case 1uLL:
        result = CFSTR("Single Moment");
        break;
      case 2uLL:
        result = CFSTR("Person Over Time");
        break;
      case 3uLL:
        result = CFSTR("Person");
        break;
      case 4uLL:
        result = CFSTR("Early Moments With Person");
        break;
      case 5uLL:
        result = CFSTR("Social Group Over Time");
        break;
      case 6uLL:
        result = CFSTR("Social Group");
        break;
      case 7uLL:
        result = CFSTR("Last Month At Home");
        break;
      case 8uLL:
        result = CFSTR("Year In Review");
        break;
      case 9uLL:
        result = CFSTR("Foodie");
        break;
      case 0xAuLL:
        result = CFSTR("Pet");
        break;
      case 0xBuLL:
        result = CFSTR("Baby");
        break;
      case 0xCuLL:
        result = CFSTR("City Location");
        break;
      case 0xDuLL:
        result = CFSTR("Region Location");
        break;
      case 0xEuLL:
        result = CFSTR("Area Location");
        break;
      case 0xFuLL:
        result = CFSTR("Business Location");
        break;
      case 0x10uLL:
        result = CFSTR("Meaningful Event");
        break;
      case 0x11uLL:
        result = CFSTR("Meaningful Event Aggregation");
        break;
      case 0x12uLL:
        result = CFSTR("Recurrent Trip");
        break;
      case 0x13uLL:
        result = CFSTR("Trip");
        break;
      case 0x14uLL:
        result = CFSTR("Past Superset");
        break;
      case 0x15uLL:
        result = CFSTR("Season");
        break;
      case 0x16uLL:
        return CFSTR("Unsupported Category");
      case 0x17uLL:
        result = CFSTR("Day In History Aggregation");
        break;
      case 0x18uLL:
        result = CFSTR("Recent Highlights");
        break;
      case 0x19uLL:
        result = CFSTR("Child Activity");
        break;
      case 0x1AuLL:
        result = CFSTR("Exciting Moments");
        break;
      case 0x1BuLL:
        result = CFSTR("Trends");
        break;
      case 0x1CuLL:
        result = CFSTR("Pet Outdoor");
        break;
      case 0x1DuLL:
        result = CFSTR("Child And Person");
        break;
      case 0x1EuLL:
        result = CFSTR("Child Outdoor");
        break;
      case 0x1FuLL:
        result = CFSTR("Ongoing Trip");
        break;
      case 0x20uLL:
        result = CFSTR("Story");
        break;
      default:
        if (a3 != 100)
          return CFSTR("Unsupported Category");
        result = CFSTR("Content Creation Tool");
        break;
    }
  }
  return result;
}

+ (id)stringForSubcategory:(unint64_t)a3
{
  id result;

  if ((uint64_t)a3 <= 300)
  {
    if ((uint64_t)a3 > 102)
    {
      switch(a3)
      {
        case 0xC9uLL:
          result = CFSTR("Featured Neighbor");
          break;
        case 0xCAuLL:
          result = CFSTR("Featured People");
          break;
        case 0xCBuLL:
          result = CFSTR("Featured Social Group");
          break;
        case 0xCCuLL:
          result = CFSTR("Featured Person");
          break;
        case 0xCDuLL:
          result = CFSTR("Featured Trip");
          break;
        case 0xCEuLL:
          result = CFSTR("Featured Weekend");
          break;
        case 0xCFuLL:
          result = CFSTR("Featured Some Time");
          break;
        case 0xD0uLL:
          result = CFSTR("Featured Place");
          break;
        case 0xD1uLL:
          result = CFSTR("Featured Special Event");
          break;
        case 0xD2uLL:
          result = CFSTR("Featured Birthday");
          break;
        case 0xD3uLL:
          result = CFSTR("Featured Past Superset");
          break;
        case 0xD4uLL:
          result = CFSTR("Featured Pet");
          break;
        case 0xD5uLL:
          result = CFSTR("Featured Meaningful Event");
          break;
        case 0xD6uLL:
          result = CFSTR("Featured Meaningful Event Aggregate");
          break;
        case 0xD7uLL:
          result = CFSTR("Featured Recurrent Trip");
          break;
        case 0xD8uLL:
          result = CFSTR("Featured People Visiting");
          break;
        case 0xD9uLL:
          result = CFSTR("Featured Baby");
          break;
        case 0xDAuLL:
          result = CFSTR("Featured Foodie");
          break;
        default:
          if (a3 != 103)
            return CFSTR("Unsupported Subcategory");
          result = CFSTR("Event Calendar");
          break;
      }
      return result;
    }
    switch(a3)
    {
      case 0uLL:
        return CFSTR("None");
      case 0x65uLL:
        return CFSTR("Event People");
      case 0x66uLL:
        return CFSTR("Event Holiday");
    }
    return CFSTR("Unsupported Subcategory");
  }
  if ((uint64_t)a3 <= 400)
  {
    switch(a3)
    {
      case 0x12DuLL:
        return CFSTR("Contextual Location");
      case 0x12EuLL:
        return CFSTR("Contextual People");
      case 0x12FuLL:
        return CFSTR("Contextual Location and People");
    }
    return CFSTR("Unsupported Subcategory");
  }
  switch(a3)
  {
    case 0x191uLL:
      result = CFSTR("Place Region");
      break;
    case 0x192uLL:
      result = CFSTR("Place Location");
      break;
    case 0x193uLL:
      result = CFSTR("Place Business");
      break;
    case 0x194uLL:
      result = CFSTR("Place Area");
      break;
    default:
      switch(a3)
      {
        case 0x3E8uLL:
          result = CFSTR("Story Montage");
          break;
        case 0x3E9uLL:
          result = CFSTR("Story Chronological");
          break;
        case 0x3EAuLL:
          result = CFSTR("Story VisualClusterBased");
          break;
        case 0x3EBuLL:
          result = CFSTR("Story VisualClusterBasedChronologica");
          break;
        default:
          if (a3 != 1100)
            return CFSTR("Unsupported Subcategory");
          result = CFSTR("Story LastResort");
          break;
      }
      break;
  }
  return result;
}

+ (id)stringForNotificationState:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unsupported Notification State");
  else
    return off_1E35D8578[a3];
}

+ (id)stringForFeaturedState:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3)
    return CFSTR("Unsupported Featured State");
  else
    return off_1E35D8590[a3 + 1];
}

+ (BOOL)isTriggeredMemoryCategory:(unint64_t)a3
{
  BOOL result;
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = 1;
  if ((uint64_t)a3 <= 200)
  {
    if (a3 <= 0x20)
    {
      if (((1 << a3) & 0x7FBFFFFE) != 0)
        return result;
      if (((1 << a3) & 0x180000000) != 0)
        return 0;
    }
    if (a3 - 101 < 2)
      return result;
    if (a3 == 100)
      return 0;
    goto LABEL_11;
  }
  if (a3 - 201 < 0x15)
    return result;
  if (a3 - 301 >= 2 && a3 != 401)
  {
LABEL_11:
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "Invalid memory category %lu", (uint8_t *)&v6, 0xCu);
    }

  }
  return 0;
}

+ (id)stringForTriggerType:(unint64_t)a3
{
  if (a3 > 0x1B)
    return CFSTR("??");
  else
    return off_1E35D85B0[a3];
}

+ (id)fetchBestRecentMemoryWithOptions:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  float v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  float v32;
  BOOL v33;
  id v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  id v56;
  void *v57;
  void *v58;
  id obj;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  void *v69;
  void *v70;
  _BYTE v71[128];
  void *v72;
  _QWORD v73[6];

  v73[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startOfDayForDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v7;
  v58 = v5;
  if (!v4)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(creationDate >= %@) && (creationDate <= %@)"), v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (category IN %@)"), &unk_1E3657228);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (subcategory IN %@)"), &unk_1E3657240);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(photosGraphVersion & %d) >= %d"), 0xFFFFLL, 512);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v73[0] = v9;
    v73[1] = v10;
    v73[2] = v11;
    v73[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setInternalPredicate:", v15);
    objc_msgSend(v8, "setIncludePendingMemories:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v16;
    v4 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v17);

    v7 = v57;
    v5 = v58;
  }
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMemory, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  obj = v19;
  if (v20)
  {
    v21 = v20;
    v56 = v4;
    v22 = 0;
    v23 = 0;
    v24 = *(_QWORD *)v62;
    v25 = 0x8000000000000000;
    v26 = -3.4028e38;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v62 != v24)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v28, "creationDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && !objc_msgSend(v60, "isDate:inSameDayAsDate:", v22, v29))
        {

          goto LABEL_21;
        }
        v30 = objc_msgSend(a1, "_contextualScoreForMemory:", v28);
        objc_msgSend(v28, "score");
        v32 = v31;
        if (v25 < v30 || (v25 == v30 ? (v33 = v26 < v32) : (v33 = 0), v33))
        {
          v34 = v28;

          v35 = v29;
          v22 = v35;
          v26 = v32;
          v25 = v30;
          v23 = v34;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      if (v21)
        continue;
      break;
    }
LABEL_21:
    v36 = obj;

    if (v23)
    {
      PLPhotoKitGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      v7 = v57;
      v5 = v58;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
        v68 = 2112;
        v69 = v23;
        _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEFAULT, "%s: Returning memory %@", buf, 0x16u);
      }
      v4 = v56;
LABEL_42:

      goto LABEL_43;
    }
    v4 = v56;
    v7 = v57;
    v5 = v58;
  }
  else
  {

    v22 = 0;
  }
  objc_msgSend(v4, "photoLibrary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v38, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSortDescriptors:", v41);

  v42 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "predicateWithFormat:", CFSTR("relevantUntilDate > %@ && type == %d"), v43, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPredicate:", v44);

  +[PHSuggestion fetchSuggestionsWithOptions:](PHSuggestion, "fetchSuggestionsWithOptions:", v39);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "count"))
  {
    objc_msgSend(v45, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
      v68 = 2112;
      v69 = v23;
      _os_log_impl(&dword_1991EC000, v46, OS_LOG_TYPE_DEFAULT, "%s: Returning on-this-day suggestion %@", buf, 0x16u);
    }

    if (v23)
      goto LABEL_37;
  }
  else
  {

  }
  objc_msgSend(v4, "photoLibrary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v47, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSortDescriptors:", v50);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@ && creationDate <= %@ && (subtype == %d || subtype == %d)"), v7, v5, 304, 305);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPredicate:", v51);

  +[PHSuggestion fetchSuggestionsWithOptions:](PHSuggestion, "fetchSuggestionsWithOptions:", v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v52, "count"))
  {

LABEL_39:
    PLPhotoKitGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v36 = obj;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
      _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEFAULT, "%s: No memory or suggestion found", buf, 0xCu);
    }
    v23 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v52, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoKitGetLog();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "+[PHMemory fetchBestRecentMemoryWithOptions:]";
    v68 = 2112;
    v69 = v23;
    _os_log_impl(&dword_1991EC000, v53, OS_LOG_TYPE_DEFAULT, "%s: Returning person centric suggestion %@", buf, 0x16u);
  }

  if (!v23)
    goto LABEL_39;
LABEL_37:
  v36 = obj;
LABEL_43:
  v54 = v23;

  return v54;
}

+ (unint64_t)_contextualScoreForMemory:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "subcategory") == 210)
  {
    v4 = 9;
  }
  else
  {
    v6 = objc_msgSend(v3, "category");
    v4 = 8;
    switch(v6)
    {
      case 202:
        v4 = 6;
        break;
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 211:
      case 215:
        goto LABEL_8;
      case 209:
        v4 = 3;
        break;
      case 210:
        v4 = 2;
        break;
      case 212:
        break;
      case 213:
        v4 = 7;
        break;
      case 214:
        v4 = 1;
        break;
      case 216:
        v4 = 5;
        break;
      default:
        if (v6 == 101)
          v4 = 4;
        else
LABEL_8:
          v4 = 0;
        break;
    }
  }

  return v4;
}

+ (id)fetchMostRelevantMemoryWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHMemory fetchMostRelevantMemoryAtDate:options:](PHMemory, "fetchMostRelevantMemoryAtDate:options:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)blockedPersonLocalIdentifiersInPhotoLibrary:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "memoriesWithBlockedPersonFeatureInPhotoLibrary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "blacklistedFeature", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "personLocalIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)memoriesWithBlockedPersonFeatureInPhotoLibrary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChunkSizeForFetch:", 200);
  objc_msgSend(v4, "setCacheSizeForFetch:", 200);
  objc_msgSend(a1, "fetchBlockedMemoriesWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PHMemory_memoriesWithBlockedPersonFeatureInPhotoLibrary___block_invoke;
  v10[3] = &unk_1E35D84D8;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = propertySetClassForPropertySet__onceToken_11301;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&propertySetClassForPropertySet__onceToken_11301, &__block_literal_global_694);
  objc_msgSend((id)propertySetClassForPropertySet__propertySetClassByPropertySetName_11302, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken_11299 != -1)
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken_11299, &__block_literal_global_695);
  return (id)propertySetAccessorsByPropertySet_accessorByPropertySetName_11300;
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(CFSTR("PHMemoryPropertySetIdentifier"), "length"))
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("PHMemoryPropertySetIdentifier"));
  else
    v4 = 0;
  if (objc_msgSend(CFSTR("PHMemoryPropertySetCore"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHMemoryPropertySetCore")))
  {
    v4 |= 2uLL;
  }
  if (objc_msgSend(CFSTR("PHMemoryPropertySetUserFeedback"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHMemoryPropertySetUserFeedback")))
  {
    v4 |= 4uLL;
  }
  if (!objc_msgSend(v3, "containsObject:", CFSTR("PHMemoryPropertySetIdentifier")))
    v4 |= 2uLL;

  return v4;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("PHMemoryPropertySetIdentifier"), "length");
  if ((v3 & 1) != 0 && v5)
    objc_msgSend(v4, "addObject:", CFSTR("PHMemoryPropertySetIdentifier"));
  v6 = objc_msgSend(CFSTR("PHMemoryPropertySetCore"), "length");
  if ((v3 & 2) != 0 && v6)
    objc_msgSend(v4, "addObject:", CFSTR("PHMemoryPropertySetCore"));
  v7 = objc_msgSend(CFSTR("PHMemoryPropertySetUserFeedback"), "length");
  if ((v3 & 4) != 0 && v7)
    objc_msgSend(v4, "addObject:", CFSTR("PHMemoryPropertySetUserFeedback"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __45__PHMemory_propertySetAccessorsByPropertySet__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHMemoryPropertySetIdentifier");
  v2[1] = CFSTR("PHMemoryPropertySetCore");
  v3[0] = CFSTR("self");
  v3[1] = CFSTR("self");
  v2[2] = CFSTR("PHMemoryPropertySetUserFeedback");
  v3[2] = CFSTR("userFeedbackProperties");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_11300;
  propertySetAccessorsByPropertySet_accessorByPropertySetName_11300 = v0;

}

void __43__PHMemory_propertySetClassForPropertySet___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHMemoryPropertySetIdentifier");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("PHMemoryPropertySetCore");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("PHMemoryPropertySetUserFeedback");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName_11302;
  propertySetClassForPropertySet__propertySetClassByPropertySetName_11302 = v0;

}

- (id)movieStateDataForAsset:(id)a3
{
  NSDictionary *movieAssetState;
  void *v4;
  void *v5;

  movieAssetState = self->_movieAssetState;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](movieAssetState, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHMemory)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  PHMemory *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDate *creationDate;
  uint64_t v16;
  NSDictionary *movieAssetState;
  uint64_t v18;
  NSData *movieData;
  uint64_t v20;
  NSData *photosGraphData;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *localizedSubtitle;
  uint64_t v31;
  NSString *graphMemoryIdentifier;
  void *v33;
  void *v34;
  uint64_t v35;
  NSString *storyTitleCategory;
  void *v37;
  double v38;
  uint64_t v39;
  NSDate *lastViewedDate;
  uint64_t v41;
  NSDate *lastMoviePlayedDate;
  uint64_t v43;
  NSDate *lastEnrichmentDate;
  uint64_t v45;
  NSData *assetListPredicate;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSDate *startDate;
  uint64_t v60;
  NSDate *endDate;
  objc_super v63;

  v8 = a3;
  v9 = a5;
  v63.receiver = self;
  v63.super_class = (Class)PHMemory;
  v10 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v63, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, v9);
  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("photosGraphVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_photosGraphVersion = objc_msgSend(v11, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("category"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_category = PHMemoryValidatedMemoryCategory((int)objc_msgSend(v12, "intValue"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subcategory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_subcategory = PHMemoryValidatedMemorySubcategory((int)objc_msgSend(v13, "intValue"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("movieAssetState"));
    v16 = objc_claimAutoreleasedReturnValue();
    movieAssetState = v10->_movieAssetState;
    v10->_movieAssetState = (NSDictionary *)v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("movieData"));
    v18 = objc_claimAutoreleasedReturnValue();
    movieData = v10->_movieData;
    v10->_movieData = (NSData *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("photosGraphData"));
    v20 = objc_claimAutoreleasedReturnValue();
    photosGraphData = v10->_photosGraphData;
    v10->_photosGraphData = (NSData *)v20;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rejected"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_rejected = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("favorite"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_favorite = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pendingState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_pendingState = objc_msgSend(v24, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_creationType = objc_msgSend(v25, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("syndicatedContentState"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_syndicatedContentState = objc_msgSend(v26, "intValue");

    v27 = (void *)MEMORY[0x1E0D718D0];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("userActionOptions"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_userCreated = objc_msgSend(v27, "isUserCreatedMemoryWithUserActionOptions:", (unsigned __int16)objc_msgSend(v28, "intValue"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v29 = objc_claimAutoreleasedReturnValue();
    localizedSubtitle = v10->_localizedSubtitle;
    v10->_localizedSubtitle = (NSString *)v29;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("graphMemoryIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    graphMemoryIdentifier = v10->_graphMemoryIdentifier;
    v10->_graphMemoryIdentifier = (NSString *)v31;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("storyColorGradeKind"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_storyColorGradeKind = (int)objc_msgSend(v33, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("storySerializedTitleCategory"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "intValue");
    PFStoryValidatedTitleCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    storyTitleCategory = v10->_storyTitleCategory;
    v10->_storyTitleCategory = (NSString *)v35;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("score"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v10->_score = v38;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastViewedDate"));
    v39 = objc_claimAutoreleasedReturnValue();
    lastViewedDate = v10->_lastViewedDate;
    v10->_lastViewedDate = (NSDate *)v39;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastMoviePlayedDate"));
    v41 = objc_claimAutoreleasedReturnValue();
    lastMoviePlayedDate = v10->_lastMoviePlayedDate;
    v10->_lastMoviePlayedDate = (NSDate *)v41;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastEnrichmentDate"));
    v43 = objc_claimAutoreleasedReturnValue();
    lastEnrichmentDate = v10->_lastEnrichmentDate;
    v10->_lastEnrichmentDate = (NSDate *)v43;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("assetListPredicate"));
    v45 = objc_claimAutoreleasedReturnValue();
    assetListPredicate = v10->_assetListPredicate;
    v10->_assetListPredicate = (NSData *)v45;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("notificationState"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_notificationState = (int)objc_msgSend(v47, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("featuredState"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_featuredState = (int)objc_msgSend(v48, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("blacklistedFeature"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      +[PHMemoryFeature memoryFeatureWithData:photoLibrary:](PHMemoryFeature, "memoryFeatureWithData:photoLibrary:", v49, v9);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = 0;
    }
    objc_storeStrong((id *)&v10->_blacklistedFeature, v50);
    if (v49)

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playCount"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_syncedPlayCount = objc_msgSend(v51, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shareCount"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_syncedShareCount = objc_msgSend(v52, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("viewCount"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_syncedViewCount = objc_msgSend(v53, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pendingPlayCount"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_pendingPlayCount = objc_msgSend(v54, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pendingShareCount"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_pendingShareCount = objc_msgSend(v55, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pendingViewCount"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_pendingViewCount = objc_msgSend(v56, "longLongValue");

    v10->super._assetCollectionType = 4;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_sharingComposition = objc_msgSend(v57, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startDate"));
    v58 = objc_claimAutoreleasedReturnValue();
    startDate = v10->super._startDate;
    v10->super._startDate = (NSDate *)v58;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
    v60 = objc_claimAutoreleasedReturnValue();
    endDate = v10->super._endDate;
    v10->super._endDate = (NSDate *)v60;

  }
  return v10;
}

- (void)_loadValuesFromPhotosGraphProperties
{
  void *v3;
  NSString *v4;
  NSString *storyTitleCategory;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!self->_didLoadPhotosGraphProperties)
  {
    -[PHMemory photosGraphProperties](self, "photosGraphProperties");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("titleCategory"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_titleCategory = objc_msgSend(v3, "integerValue");

    if (!self->_storyTitleCategory)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("storyTitleCategory"));
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      storyTitleCategory = self->_storyTitleCategory;
      self->_storyTitleCategory = v4;

    }
    v6 = v9;
    if (!self->_storyColorGradeKind)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("storyColorGradeKind"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_storyColorGradeKind = objc_msgSend(v7, "integerValue");

      v6 = v9;
      if (!self->_storyColorGradeKind)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("storyColorGradeCategory"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        self->_storyColorGradeKind = PFStoryColorGradeKindDefaultForColorGradeCategory();

        v6 = v9;
      }
    }
    self->_didLoadPhotosGraphProperties = 1;

  }
}

- (int64_t)titleCategory
{
  -[PHMemory _loadValuesFromPhotosGraphProperties](self, "_loadValuesFromPhotosGraphProperties");
  return self->_titleCategory;
}

- (id)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)subtitle
{
  return self->_localizedSubtitle;
}

- (id)creationDate
{
  return self->_creationDate;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;

  if (a3 == 1)
    return 1;
  if (a3 != 7)
    return 0;
  v11 = v4;
  v12 = v3;
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  v9 = -[PHMemory pendingState](self, "pendingState") != 2 || -[PHMemory featuredState](self, "featuredState") != 2;
  v10 = -[PHMemory pendingState](self, "pendingState", v11, v12, v5, v6) != 2
     || -[PHMemory category](self, "category") != 19 && -[PHMemory category](self, "category") != 31;
  return v9 && v10;
}

- (BOOL)canContainAssets
{
  return 1;
}

- (BOOL)canShowAvalancheStacks
{
  return 1;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (NSSet)featuredPersonLocalIdentifiers
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_23;
  -[PHMemory photosGraphVersion](self, "photosGraphVersion");
  v5 = PLMemoriesAlgorithmsVersionFromPhotosGraphVersion();
  if (v5 < 0x101)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featureVector"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("people"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && objc_msgSend(v18, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v21 = (void *)v20;

        v3 = v21;
        goto LABEL_23;
      }
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v5 == 257)
    v6 = CFSTR("featureVector");
  else
    v6 = CFSTR("featureVector_v2");
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "firstObject", (_QWORD)v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("People"));

        if (v14)
        {
          objc_msgSend(v12, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

LABEL_23:
  return (NSSet *)v3;
}

- (BOOL)isContiguous
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("info"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceTypeEnum"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v5, "unsignedIntegerValue");
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("info"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourceType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Moment")) & 1) != 0)
        {
          v6 = 1;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Contiguous Moments")))
        {
          v6 = 2;
        }
        else
        {
          v6 = 0;
        }
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return (unint64_t)(v6 - 1) < 2;
}

- (NSArray)blockableFeatures
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("blacklistableFeatures"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          -[PHObject photoLibrary](self, "photoLibrary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHMemoryFeature memoryFeatureWithData:photoLibrary:](PHMemoryFeature, "memoryFeatureWithData:photoLibrary:", v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v3 = v15;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (BOOL)hasBlockableFeature
{
  void *v2;
  BOOL v3;

  -[PHMemory blockableFeatures](self, "blockableFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)playCount
{
  return self->_pendingPlayCount + self->_syncedPlayCount;
}

- (int64_t)shareCount
{
  return self->_pendingShareCount + self->_syncedShareCount;
}

- (int64_t)viewCount
{
  return self->_pendingViewCount + self->_syncedViewCount;
}

- (id)defaultSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
}

- (NSDate)startDate
{
  return self->super._startDate;
}

- (NSDate)endDate
{
  return self->super._endDate;
}

- (BOOL)isGenerative
{
  return self->_creationType == 1;
}

- (id)titleFontName
{
  NSString *titleFontName;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  objc_super v10;

  titleFontName = self->_titleFontName;
  if (!titleFontName)
  {
    -[PHMemory movieData](self, "movieData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "titleFontNameFromMovieData:", v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_titleFontName;
    self->_titleFontName = v5;

    if (!self->_titleFontName)
    {
      v10.receiver = self;
      v10.super_class = (Class)PHMemory;
      -[PHAssetCollection titleFontName](&v10, sel_titleFontName);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_titleFontName;
      self->_titleFontName = v7;

    }
    titleFontName = self->_titleFontName;
  }
  return titleFontName;
}

- (unint64_t)titleFontNameHash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[PHMemory creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[PHAsset fetchKeyCuratedAssetInAssetCollection:referenceAsset:](PHAsset, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", self, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "creationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = +[PHAssetCollection titleFontNameHashFromDate:](PHAssetCollection, "titleFontNameHashFromDate:", v3);
  -[PHAssetCollection title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PHAssetCollection titleFontNameHashFromHash:andHash:](PHAssetCollection, "titleFontNameHashFromHash:andHash:", v6, +[PHAssetCollection titleFontNameHashFromString:](PHAssetCollection, "titleFontNameHashFromString:", v7));

  return v8;
}

- (id)predicateForAllAssetsWithLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _BYTE v73[128];
  _QWORD v74[4];

  v74[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHMemory _extendedCuratedAssetIDsWithLibrary:](self, "_extendedCuratedAssetIDsWithLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PHMemory _curatedAssetIDsWithLibrary:](self, "_curatedAssetIDsWithLibrary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN (%@) OR self IN (%@)"), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_41;
  }
  -[PHMemory assetListPredicate](self, "assetListPredicate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v70 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v70);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v70;
    if (!v10)
    {
      v7 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("albums"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("persons"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("dateRanges"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY albums.uuid IN (%@) OR ANY albums.cloudGUID in (%@)"), v12, v12);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v62 = v11;
    v63 = v10;
    v60 = v14;
    v61 = v13;
    if (!v13)
    {
LABEL_16:
      if (v14)
      {
        v55 = v9;
        v56 = v7;
        v57 = v5;
        v58 = v4;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v29 = v14;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v67 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              if (objc_msgSend(v34, "count") == 2)
              {
                objc_msgSend(v34, "objectAtIndex:", 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectAtIndex:", 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@ AND dateCreated <= %@"), v35, v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v37);

              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
          }
          while (v31);
        }

        if (objc_msgSend(v28, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v28);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          v5 = v57;
          v9 = v55;
          v13 = v61;
          if (v56)
          {
            v40 = (void *)MEMORY[0x1E0CB3528];
            v72[0] = v38;
            v72[1] = v56;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "andPredicateWithSubpredicates:", v41);
            v7 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v7 = v38;
          }
          v4 = v58;

        }
        else
        {
          v5 = v57;
          v4 = v58;
          v7 = v56;
          v9 = v55;
          v13 = v61;
        }

        v11 = v62;
        v10 = v63;
        v14 = v60;
      }

LABEL_34:
      if (v7)
        goto LABEL_41;
      goto LABEL_35;
    }
    v15 = v9;
    +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v4, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "count");
    v19 = objc_msgSend(v17, "count");
    v20 = v13;
    v21 = (void *)MEMORY[0x1E0CB3880];
    if (v18 == v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K IN (%@)"), CFSTR("detectedFaces"), CFSTR("personForFace.personUUID"), v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
LABEL_12:
        v23 = (void *)MEMORY[0x1E0CB3528];
        v74[0] = v22;
        v74[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
        v24 = v7;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "andPredicateWithSubpredicates:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v26;
LABEL_15:
        v9 = v15;

        v11 = v62;
        v10 = v63;
        v14 = v60;
        v13 = v61;
        goto LABEL_16;
      }
    }
    else
    {
      -[PHObject objectID](self, "objectID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "predicateWithFormat:", CFSTR("memoriesBeingCuratedAssets CONTAINS %@"), v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_12;
    }
    v7 = v22;
    goto LABEL_15;
  }
LABEL_35:
  -[PHMemory predicateForAssetsContainedInMomentsFromRepresentativeAssets](self, "predicateForAssetsContainedInMomentsFromRepresentativeAssets");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PHMemory subcategory](self, "subcategory") == 204 || -[PHMemory subcategory](self, "subcategory") == 203)
  {
    -[PHMemory featuredPersonLocalIdentifiers](self, "featuredPersonLocalIdentifiers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v4, self);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v44, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(v42, "count");
    if (v46 == objc_msgSend(v45, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v42, "count"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __45__PHMemory_predicateForAllAssetsWithLibrary___block_invoke;
      v64[3] = &unk_1E35D84B0;
      v65 = v47;
      v48 = v47;
      objc_msgSend(v42, "enumerateObjectsUsingBlock:", v64);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K IN (%@)"), CFSTR("detectedFaces"), CFSTR("personForFace.personUUID"), v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x1E0CB3528];
      v71[0] = v49;
      v71[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "andPredicateWithSubpredicates:", v51);
      v52 = objc_claimAutoreleasedReturnValue();

      v7 = v65;
    }
    else
    {
      v53 = (void *)MEMORY[0x1E0CB3880];
      -[PHObject objectID](self, "objectID");
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "predicateWithFormat:", CFSTR("memoriesBeingCuratedAssets CONTAINS %@"), v48);
      v52 = objc_claimAutoreleasedReturnValue();
    }

    v7 = (id)v52;
  }
LABEL_41:

  return v7;
}

- (id)predicateForAssetsContainedInMomentsFromRepresentativeAssets
{
  void *v2;
  void *v3;

  -[PHMemory _representativeAndCuratedAssetIDs](self, "_representativeAndCuratedAssetIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN (%@)"), CFSTR("moment.assets"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateForAllMomentsFromRepresentativeAssets
{
  void *v2;
  void *v3;

  -[PHMemory _representativeAndCuratedAssetIDs](self, "_representativeAndCuratedAssetIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN (%@)"), CFSTR("assets"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_representativeAndCuratedAssetIDs
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PHMemory *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  if (-[PHMemory isTransient](self, "isTransient"))
  {
    -[PHMemory transientRepresentativeAndCuratedAssetIDs](self, "transientRepresentativeAndCuratedAssetIDs");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__11312;
    v22 = __Block_byref_object_dispose__11313;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Memory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3880];
    -[PHObject uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("uuid == %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v7);

    objc_msgSend(v4, "setResultType:", 0);
    objc_msgSend(v4, "setIncludesPropertyValues:", 0);
    objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", &unk_1E3657210);
    -[PHObject photoLibrary](self, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContextForCurrentQueueQoS");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__PHMemory__representativeAndCuratedAssetIDs__block_invoke;
    v13[3] = &unk_1E35DEB38;
    v10 = v9;
    v14 = v10;
    v11 = v4;
    v15 = v11;
    v16 = self;
    v17 = &v18;
    objc_msgSend(v10, "performBlockAndWait:", v13);
    v12 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    return v12;
  }
}

- (id)_curatedAssetIDsWithLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PHMemory *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11312;
  v25 = __Block_byref_object_dispose__11313;
  v26 = 0;
  v5 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3880];
  -[PHObject objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("memoriesBeingCuratedAssets CONTAINS %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  objc_msgSend(v7, "setResultType:", 1);
  objc_msgSend(v7, "setIncludesPropertyValues:", 0);
  objc_msgSend(v4, "managedObjectContextForCurrentQueueQoS");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__PHMemory__curatedAssetIDsWithLibrary___block_invoke;
  v16[3] = &unk_1E35DEB38;
  v20 = &v21;
  v12 = v11;
  v17 = v12;
  v13 = v7;
  v18 = v13;
  v19 = self;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (id)_extendedCuratedAssetIDsWithLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PHMemory *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11312;
  v25 = __Block_byref_object_dispose__11313;
  v26 = 0;
  v5 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3880];
  -[PHObject objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("memoriesBeingExtendedCuratedAssets CONTAINS %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  objc_msgSend(v7, "setResultType:", 1);
  objc_msgSend(v7, "setIncludesPropertyValues:", 0);
  objc_msgSend(v4, "managedObjectContextForCurrentQueueQoS");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__PHMemory__extendedCuratedAssetIDsWithLibrary___block_invoke;
  v16[3] = &unk_1E35DEB38;
  v20 = &v21;
  v12 = v11;
  v17 = v12;
  v13 = v7;
  v18 = v13;
  v19 = self;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (BOOL)isPending
{
  return -[PHMemory pendingState](self, "pendingState") == 1;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unsigned int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHMemory;
  -[PHAssetCollection description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PHMemory pendingState](self, "pendingState");
  v4 = -[PHMemory creationType](self, "creationType");
  v5 = -[PHMemory isFavorite](self, "isFavorite");
  v6 = -[PHMemory isUserCreated](self, "isUserCreated");
  v7 = -[PHMemory isRejected](self, "isRejected");
  v8 = -[PHMemory category](self, "category");
  v9 = -[PHMemory subcategory](self, "subcategory");
  -[PHMemory creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" pendingState:%d, creationType:%d, fav:%d, user:%d, reject:%d [%d/%d - %@], featuredState: %d, syndicatedContentState: %d"), v13, v4, v5, v6, v7, v8, v9, v10, -[PHMemory featuredState](self, "featuredState"), -[PHMemory syndicatedContentState](self, "syndicatedContentState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)triggerTypes
{
  void *v2;
  void *v3;

  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("triggerTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)storyColorGradeKind
{
  int64_t result;

  result = self->_storyColorGradeKind;
  if (!result)
  {
    -[PHMemory _loadValuesFromPhotosGraphProperties](self, "_loadValuesFromPhotosGraphProperties");
    return self->_storyColorGradeKind;
  }
  return result;
}

- (int64_t)storyColorGradeKindRaw
{
  return self->_storyColorGradeKind;
}

- (NSString)storyTitleCategory
{
  NSString *storyTitleCategory;

  storyTitleCategory = self->_storyTitleCategory;
  if (!storyTitleCategory)
  {
    -[PHMemory _loadValuesFromPhotosGraphProperties](self, "_loadValuesFromPhotosGraphProperties");
    storyTitleCategory = self->_storyTitleCategory;
  }
  return storyTitleCategory;
}

- (NSString)storyTitleCategoryRaw
{
  return self->_storyTitleCategory;
}

- (unint64_t)suggestedMood
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestedMood"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PHMemoryMoodForString(v4);

  return v5;
}

- (id)moodKeywords
{
  void *v2;
  void *v3;
  void *v4;

  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("moodKeywords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)meaningLabels
{
  void *v2;
  void *v3;
  void *v4;

  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("meaningLabels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)musicGenreDistribution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *v6;

  -[PHMemory photosGraphProperties](self, "photosGraphProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("musicGenreDistribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = v4;

  return v6;
}

- (id)presentationHints
{
  return -[PHMemoryPresentationHints initWithMemory:]([PHMemoryPresentationHints alloc], "initWithMemory:", self);
}

- (BOOL)isMustSee
{
  double v2;

  -[PHMemory score](self, "score");
  return v2 > 0.75;
}

- (BOOL)isStellar
{
  double v2;

  -[PHMemory score](self, "score");
  return v2 > 0.5;
}

- (BOOL)isGreat
{
  double v2;

  -[PHMemory score](self, "score");
  return v2 > 0.25;
}

- (BOOL)isBadgeable
{
  void *v3;

  -[PHMemory lastViewedDate](self, "lastViewedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    || -[PHMemory pendingState](self, "pendingState") != 1
    || -[PHMemory featuredState](self, "featuredState") != 1)
  {
    return 0;
  }
  if (-[PHMemory isStellar](self, "isStellar"))
    return 1;
  return -[PHMemory isMustSee](self, "isMustSee");
}

- (NSDictionary)photosGraphProperties
{
  NSDictionary *photosGraphProperties;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSData *photosGraphData;
  NSDictionary *v13;
  id v14;
  NSDictionary *v15;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  photosGraphProperties = self->_photosGraphProperties;
  if (photosGraphProperties)
    return photosGraphProperties;
  if (!self->_photosGraphData)
  {
    photosGraphProperties = 0;
    return photosGraphProperties;
  }
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = (void *)MEMORY[0x1E0CB3710];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  photosGraphData = self->_photosGraphData;
  v19 = 0;
  objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v11, photosGraphData, &v19);
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  v15 = self->_photosGraphProperties;
  self->_photosGraphProperties = v13;

  if (!self->_photosGraphProperties)
  {
    self->_photosGraphProperties = (NSDictionary *)MEMORY[0x1E0C9AA70];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving photosGraphData from Memory: %@", buf, 0xCu);
    }
  }

  return self->_photosGraphProperties;
}

- (BOOL)isCurrentlyRelevant
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHMemory isRelevantAtDate:](self, "isRelevantAtDate:", v3);

  return (char)self;
}

- (double)currentRelevanceScore
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemory relevanceScoreAtDate:](self, "relevanceScoreAtDate:", v3);
  v5 = v4;

  return v5;
}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v32;
  _QWORD v33[4];
  __CFString *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PHMemory *v39;
  uint64_t *v40;
  Class v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v6 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__11312;
  v46 = __Block_byref_object_dispose__11313;
  ph_objc_getAssociatedObject(self, a3);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v43[5];
  if (!v7)
  {
    -[objc_class keyPathToPrimaryObject](a3, "keyPathToPrimaryObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = objc_msgSend([a3 alloc], "initWithFetchDictionary:memory:prefetched:", v6, self, 1);
      v10 = (__CFString *)v43[5];
      v43[5] = v9;
    }
    else
    {
      -[objc_class entityName](a3, "entityName");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("Memory");
      if (v11)
        v13 = (__CFString *)v11;
      v14 = v13;

      v15 = (void *)MEMORY[0x1E0CB3880];
      -[PHObject objectID](self, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K == %@"), v8, v16);
      else
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("self == %@"), v16);
      v17 = objc_claimAutoreleasedReturnValue();

      -[objc_class propertiesToFetch](a3, "propertiesToFetch");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class propertiesToSortBy](a3, "propertiesToSortBy");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)v17;
        v20 = v14;
      }
      else
      {
        v19 = (void *)v17;
        v20 = v14;
        v32 = 0;
      }
      -[PHObject photoLibrary](self, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class propertySetName](a3, "propertySetName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectFetchingManagedObjectContextForObject:propertySet:", self, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __62__PHMemory__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
      v33[3] = &unk_1E35DB1E0;
      v10 = v20;
      v34 = v10;
      v24 = v19;
      v35 = v24;
      v25 = v18;
      v36 = v25;
      v26 = v32;
      v37 = v26;
      v27 = v23;
      v38 = v27;
      v39 = self;
      v40 = &v42;
      v41 = a3;
      objc_msgSend(v27, "performBlockAndWait:", v33);

    }
    ph_objc_setAssociatedObjectIfNotSet(self, a3, (void *)v43[5]);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v43[5];
    v43[5] = v28;

    v7 = (void *)v43[5];
  }
  v30 = v7;
  _Block_object_dispose(&v42, 8);

  return v30;
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return -[PHMemory _createPropertyObjectOfClass:preFetchedProperties:](self, "_createPropertyObjectOfClass:preFetchedProperties:", a3, 0);
}

- (id)userFeedbackProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 4);
  return -[PHMemory _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (unint64_t)category
{
  return self->_category;
}

- (unint64_t)subcategory
{
  return self->_subcategory;
}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (int64_t)featuredState
{
  return self->_featuredState;
}

- (BOOL)isRejected
{
  return self->_rejected;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (unsigned)pendingState
{
  return self->_pendingState;
}

- (unsigned)creationType
{
  return self->_creationType;
}

- (unsigned)syndicatedContentState
{
  return self->_syndicatedContentState;
}

- (BOOL)isUserCreated
{
  return self->_userCreated;
}

- (NSString)graphMemoryIdentifier
{
  return self->_graphMemoryIdentifier;
}

- (NSData)movieData
{
  return self->_movieData;
}

- (int64_t)photosGraphVersion
{
  return self->_photosGraphVersion;
}

- (double)score
{
  return self->_score;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (NSDate)lastMoviePlayedDate
{
  return self->_lastMoviePlayedDate;
}

- (NSDate)lastEnrichmentDate
{
  return self->_lastEnrichmentDate;
}

- (NSData)assetListPredicate
{
  return self->_assetListPredicate;
}

- (PHMemoryFeature)blacklistedFeature
{
  return self->_blacklistedFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosGraphProperties, 0);
  objc_storeStrong((id *)&self->_blacklistedFeature, 0);
  objc_storeStrong((id *)&self->_assetListPredicate, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_storyTitleCategory, 0);
  objc_storeStrong((id *)&self->_graphMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_lastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_lastMoviePlayedDate, 0);
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_movieAssetState, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_transientMemoryProperties, 0);
  objc_storeStrong((id *)&self->_photosGraphData, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __62__PHMemory__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPropertiesToFetch:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setResultType:", 2);
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
    objc_msgSend(v2, "setSortDescriptors:", *(_QWORD *)(a1 + 56));
  v3 = *(void **)(a1 + 64);
  v13 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (!v4)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 88), "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);

    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
LABEL_9:
    v6 = (void *)MEMORY[0x1E0C9AA70];
  v10 = objc_msgSend(objc_alloc(*(Class *)(a1 + 88)), "initWithFetchDictionary:memory:prefetched:", v6, *(_QWORD *)(a1 + 72), 0);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __48__PHMemory__extendedCuratedAssetIDsWithLibrary___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v12 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Can't fetch extended curated asset IDs for %@: %@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = MEMORY[0x1E0C9AA60];

  }
}

void __40__PHMemory__curatedAssetIDsWithLibrary___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v12 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Can't fetch curated asset IDs for %@: %@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = MEMORY[0x1E0C9AA60];

  }
}

void __45__PHMemory__representativeAndCuratedAssetIDs__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v14 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
  {
    objc_msgSend(v4, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    -[NSObject objectIDsForRelationshipNamed:](v6, "objectIDsForRelationshipNamed:", CFSTR("representativeAssets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    v9 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    -[NSObject objectIDsForRelationshipNamed:](v6, "objectIDsForRelationshipNamed:", CFSTR("curatedAssets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    v11 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    -[NSObject objectIDsForRelationshipNamed:](v6, "objectIDsForRelationshipNamed:", CFSTR("extendedCuratedAssets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[6];
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch memory and the related asset ids for %@: %@", buf, 0x16u);
    }
  }

}

void __45__PHMemory_predicateForAllAssetsWithLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __59__PHMemory_memoriesWithBlockedPersonFeatureInPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "blacklistedFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

id __54__PHMemory_fetchMemoriesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForMemoriesWithLocalIdentifiers:options:](PHQuery, "queryForMemoriesWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__PHMemory_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[27];

  v4[26] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("localizedTitle");
  v4[1] = CFSTR("title");
  v4[2] = CFSTR("localizedSubtitle");
  v4[3] = CFSTR("subtitle");
  v4[4] = CFSTR("graphMemoryIdentifier");
  v4[5] = CFSTR("storyColorGradeKind");
  v4[6] = CFSTR("storyTitleCategory");
  v4[7] = CFSTR("creationDate");
  v4[8] = CFSTR("photosGraphVersion");
  v4[9] = CFSTR("rejected");
  v4[10] = CFSTR("favorite");
  v4[11] = CFSTR("pendingState");
  v4[12] = CFSTR("creationType");
  v4[13] = CFSTR("syndicatedContentState");
  v4[14] = CFSTR("subcategory");
  v4[15] = CFSTR("uuid");
  v4[16] = CFSTR("score");
  v4[17] = CFSTR("notificationState");
  v4[18] = CFSTR("featuredState");
  v4[19] = CFSTR("blacklistedFeature");
  v4[20] = CFSTR("category");
  v4[21] = CFSTR("lastViewedDate");
  v4[22] = CFSTR("viewCount");
  v4[23] = CFSTR("sharingComposition");
  v4[24] = CFSTR("startDate");
  v4[25] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 26);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_11454;
  transformValueExpression_forKeyPath___passThroughSet_11454 = v2;

}

void __24__PHMemory_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  PHEntityKeyMap *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  const __CFString *v54;
  const __CFString *v55;
  _QWORD v56[26];
  _QWORD v57[28];

  v57[26] = *MEMORY[0x1E0C80C00];
  v23 = [PHEntityKeyMap alloc];
  v55 = CFSTR("objectID");
  v56[0] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v29;
  v56[1] = CFSTR("uuid");
  v54 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v28;
  v56[2] = CFSTR("title");
  v53[0] = CFSTR("localizedTitle");
  v53[1] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v27;
  v56[3] = CFSTR("subtitle");
  v52[0] = CFSTR("localizedSubtitle");
  v52[1] = CFSTR("subtitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v26;
  v56[4] = CFSTR("graphMemoryIdentifier");
  v51 = CFSTR("graphMemoryIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v25;
  v56[5] = CFSTR("storyColorGradeKind");
  v50 = CFSTR("storyColorGradeKind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[5] = v24;
  v56[6] = CFSTR("storySerializedTitleCategory");
  v49 = CFSTR("storyTitleCategory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57[6] = v22;
  v56[7] = CFSTR("creationDate");
  v48 = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v57[7] = v21;
  v56[8] = CFSTR("photosGraphVersion");
  v47 = CFSTR("photosGraphVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57[8] = v20;
  v56[9] = CFSTR("rejected");
  v46 = CFSTR("rejected");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57[9] = v19;
  v56[10] = CFSTR("favorite");
  v45 = CFSTR("favorite");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57[10] = v18;
  v56[11] = CFSTR("pendingState");
  v44 = CFSTR("pendingState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57[11] = v17;
  v56[12] = CFSTR("creationType");
  v43 = CFSTR("creationType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57[12] = v16;
  v56[13] = CFSTR("syndicatedContentState");
  v42 = CFSTR("syndicatedContentState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57[13] = v15;
  v56[14] = CFSTR("userActionOptions");
  v41 = CFSTR("userCreated");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v57[14] = v14;
  v56[15] = CFSTR("subcategory");
  v40 = CFSTR("subcategory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v57[15] = v13;
  v56[16] = CFSTR("score");
  v39 = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57[16] = v12;
  v56[17] = CFSTR("notificationState");
  v38 = CFSTR("notificationState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v57[17] = v0;
  v56[18] = CFSTR("featuredState");
  v37 = CFSTR("featuredState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v57[18] = v1;
  v56[19] = CFSTR("blacklistedFeature");
  v36 = CFSTR("blacklistedFeature");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v57[19] = v2;
  v56[20] = CFSTR("category");
  v35 = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v57[20] = v3;
  v56[21] = CFSTR("lastViewedDate");
  v34 = CFSTR("lastViewedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v57[21] = v4;
  v56[22] = CFSTR("viewCount");
  v33 = CFSTR("viewCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57[22] = v5;
  v56[23] = CFSTR("sharingComposition");
  v32 = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v57[23] = v6;
  v56[24] = CFSTR("startDate");
  v31 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57[24] = v7;
  v56[25] = CFSTR("endDate");
  v30 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57[25] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v23, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_11462;
  entityKeyMap_pl_once_object_15_11462 = v10;

}

void __33__PHMemory_corePropertiesToFetch__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[37];

  v4[36] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("category");
  v4[2] = CFSTR("subcategory");
  v4[3] = CFSTR("creationDate");
  v4[4] = CFSTR("movieAssetState");
  v4[5] = CFSTR("movieData");
  v4[6] = CFSTR("photosGraphData");
  v4[7] = CFSTR("photosGraphVersion");
  v4[8] = CFSTR("rejected");
  v4[9] = CFSTR("favorite");
  v4[10] = CFSTR("pendingState");
  v4[11] = CFSTR("creationType");
  v4[12] = CFSTR("syndicatedContentState");
  v4[13] = CFSTR("userActionOptions");
  v4[14] = CFSTR("subtitle");
  v4[15] = CFSTR("title");
  v4[16] = CFSTR("graphMemoryIdentifier");
  v4[17] = CFSTR("storyColorGradeKind");
  v4[18] = CFSTR("storySerializedTitleCategory");
  v4[19] = CFSTR("score");
  v4[20] = CFSTR("lastViewedDate");
  v4[21] = CFSTR("lastMoviePlayedDate");
  v4[22] = CFSTR("lastEnrichmentDate");
  v4[23] = CFSTR("assetListPredicate");
  v4[24] = CFSTR("notificationState");
  v4[25] = CFSTR("featuredState");
  v4[26] = CFSTR("blacklistedFeature");
  v4[27] = CFSTR("playCount");
  v4[28] = CFSTR("shareCount");
  v4[29] = CFSTR("viewCount");
  v4[30] = CFSTR("pendingPlayCount");
  v4[31] = CFSTR("pendingShareCount");
  v4[32] = CFSTR("pendingViewCount");
  v4[33] = CFSTR("sharingComposition");
  v4[34] = CFSTR("startDate");
  v4[35] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 36);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)corePropertiesToFetch_array;
  corePropertiesToFetch_array = v2;

}

void __38__PHMemory_propertiesToFetchWithHint___block_invoke_240(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_11473;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_composePropertiesToFetchWithHint:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_11473;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v11);

  }
}

void __38__PHMemory_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_11473;
  propertiesToFetchWithHint__propertiesToFetchByHint_11473 = v0;

  v2 = dispatch_queue_create("com.apple.photos.personpropertyhints", 0);
  v3 = (void *)propertiesToFetchWithHint__propertyQueue_11472;
  propertiesToFetchWithHint__propertyQueue_11472 = (uint64_t)v2;

}

uint64_t __51__PHMemory_generateMemoriesWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isRelevantAtDate:(id)a3
{
  return +[PHMemoryRelevanceHelper isMemory:relevantAtDate:](PHMemoryRelevanceHelper, "isMemory:relevantAtDate:", self, a3);
}

- (double)relevanceScoreAtDate:(id)a3
{
  double result;

  +[PHMemoryRelevanceHelper relevanceScoreForMemory:atDate:](PHMemoryRelevanceHelper, "relevanceScoreForMemory:atDate:", self, a3);
  return result;
}

+ (id)fetchMostRelevantMemoryAtDate:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v6, "setFetchLimit:", 12);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v9);

  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHMemory mostRelevantMemoryInMemories:atDate:](PHMemory, "mostRelevantMemoryInMemories:atDate:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)mostRelevantMemoryInMemories:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[PHMemoryRelevanceHelper relevanceScoreForMemory:atDate:](PHMemoryRelevanceHelper, "relevanceScoreForMemory:atDate:", v13, v6);
        if (v14 > v11)
        {
          v15 = v14;
          v16 = v13;

          v9 = v16;
          v11 = v15;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isPresentedFromURLNavigation
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)_identifierForMemoryPresentedFromURNavigation;
  if (!_identifierForMemoryPresentedFromURNavigation)
    return 0;
  -[PHObject localIdentifier](self, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (NSString)URLNavigationSourceIdentifier
{
  return (NSString *)(id)_sourceForMemoryPresentedFromURLNavigation;
}

+ (void)setCurrentMemoryForURLNavigation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("photos"));

  if (!v6)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("memory")))
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_20;
  }
  v27 = v7;
  v28 = v4;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v9)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_19;
  }
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v30 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("identifier"));

      if (v17)
      {
        objc_msgSend(v15, "value");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v12;
        v12 = (void *)v18;
      }
      else
      {
        objc_msgSend(v15, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("source"));

        if (!v21)
          continue;
        objc_msgSend(v15, "value");
        v22 = objc_claimAutoreleasedReturnValue();
        v19 = v11;
        v11 = (void *)v22;
      }

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v10);
LABEL_19:

  v4 = v28;
  v7 = v27;
LABEL_20:

LABEL_21:
  v23 = (void *)_identifierForMemoryPresentedFromURNavigation;
  _identifierForMemoryPresentedFromURNavigation = (uint64_t)v12;
  v24 = v12;

  v25 = (void *)_sourceForMemoryPresentedFromURLNavigation;
  _sourceForMemoryPresentedFromURLNavigation = (uint64_t)v11;
  v26 = v11;

}

+ (void)clearCurrentMemoryForURLNavigation
{
  void *v2;
  void *v3;

  v2 = (void *)_identifierForMemoryPresentedFromURNavigation;
  _identifierForMemoryPresentedFromURNavigation = 0;

  v3 = (void *)_sourceForMemoryPresentedFromURLNavigation;
  _sourceForMemoryPresentedFromURLNavigation = 0;

}

- (double)_evaluatedDurationWithNumberOfStillPhotos:(unint64_t)a3 numberOfLivePhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 options:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;

  v9 = a6;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionStillPhotoDurationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionStillPhotoDurationKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

  }
  else
  {
    v13 = 2.0;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionLivePhotoDurationKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionLivePhotoDurationKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

  }
  else
  {
    v17 = 3.0;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionVideoDurationKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionVideoDurationKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

  }
  else
  {
    v21 = 6.0;
  }

  return v17 * (double)a4 + (double)a3 * v13 + (double)a5 * v21;
}

- (unint64_t)availableCurationLengthsWithOptions:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;

  v4 = a3;
  -[PHMemory photosGraphVersion](self, "photosGraphVersion");
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
  {
    v6 = (void *)MEMORY[0x1E0CB3880];
    -[PHObject objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("memoriesBeingExtendedCuratedAssets CONTAINS %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionImageCountKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHMemory _numberOfAssetsWithType:optionsValue:predicate:](self, "_numberOfAssetsWithType:optionsValue:predicate:", 0, v9, v8);

    v11 = -[PHMemory _numberOfAssetsWithType:optionsValue:predicate:](self, "_numberOfAssetsWithType:optionsValue:predicate:", 2, 0, v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionVideoCountKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PHMemory _numberOfAssetsWithType:optionsValue:predicate:](self, "_numberOfAssetsWithType:optionsValue:predicate:", 3, v12, v8);

    -[PHMemory _evaluatedDurationWithNumberOfStillPhotos:numberOfLivePhotos:numberOfVideos:options:](self, "_evaluatedDurationWithNumberOfStillPhotos:numberOfLivePhotos:numberOfVideos:options:", v10 - v11, v11, v13, v4);
    v15 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

    }
    else
    {
      v19 = 45.0;
    }

    if (v15 >= v19)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionMinimumDurationForLongCurationKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionMinimumDurationForLongCurationKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

      }
      else
      {
        v23 = 70.0;
      }

      if (v15 >= v23)
        v5 = 7;
      else
        v5 = 3;
    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)currentCurationLengthWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  unint64_t v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  -[PHObject objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("memoriesBeingCuratedAssets CONTAINS %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionImageCountKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHMemory _numberOfAssetsWithType:optionsValue:predicate:](self, "_numberOfAssetsWithType:optionsValue:predicate:", 0, v8, v7);

  v10 = -[PHMemory _numberOfAssetsWithType:optionsValue:predicate:](self, "_numberOfAssetsWithType:optionsValue:predicate:", 2, 0, v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionVideoCountKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PHMemory _numberOfAssetsWithType:optionsValue:predicate:](self, "_numberOfAssetsWithType:optionsValue:predicate:", 3, v11, v7);

  -[PHMemory _evaluatedDurationWithNumberOfStillPhotos:numberOfLivePhotos:numberOfVideos:options:](self, "_evaluatedDurationWithNumberOfStillPhotos:numberOfLivePhotos:numberOfVideos:options:", v9 - v10, v10, v12, v4);
  v14 = v13;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHMemoryCurationAvailabilityOptionMinimumDurationForMediumCurationKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

  }
  else
  {
    v18 = 45.0;
  }

  if (v14 < v18)
    v19 = 1;
  else
    v19 = 2;

  return v19;
}

- (id)curationOfLength:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  -[PHObject photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoAnalysisClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject localIdentifier](self, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCurationOfLength:forMemoryForLocalIdentifier:withOptions:error:", a3, v11, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchAssetsWithCurationOfLength:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PHMemory curationOfLength:options:error:](self, "curationOfLength:options:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAsset fetchAssetsWithUUIDs:options:](PHAsset, "fetchAssetsWithUUIDs:options:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_numberOfAssetsWithType:(unint64_t)a3 optionsValue:(id)a4 predicate:(id)a5
{
  if (a4)
    return objc_msgSend(a4, "integerValue", a3);
  else
    return -[PHMemory _fetchNumberOfAssetsWithType:predicate:](self, "_fetchNumberOfAssetsWithType:predicate:", a3, a5);
}

- (id)_predicateForImages
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
}

- (id)_predicateForLivePhotos
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d && %K.%K >= %f"), CFSTR("kindSubtype"), 2, CFSTR("mediaAnalysisAttributes"), CFSTR("autoplaySuggestionScore"), 0x3FD999999999999ALL);
}

- (id)_predicateForVideos
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 1);
}

- (unint64_t)_fetchNumberOfAssetsWithType:(unint64_t)a3 predicate:(id)a4
{
  id v6;
  uint64_t v7;
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
  unint64_t v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  switch(a3)
  {
    case 0uLL:
      -[PHMemory _predicateForImages](self, "_predicateForImages");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      v9 = (void *)MEMORY[0x1E0CB3528];
      -[PHMemory _predicateForImages](self, "_predicateForImages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v10;
      v11 = (void *)MEMORY[0x1E0CB3528];
      -[PHMemory _predicateForLivePhotos](self, "_predicateForLivePhotos");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "notPredicateWithSubpredicate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "andPredicateWithSubpredicates:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 2uLL:
      -[PHMemory _predicateForLivePhotos](self, "_predicateForLivePhotos");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[PHMemory _predicateForVideos](self, "_predicateForVideos");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v6;
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInternalPredicate:", v19);

  objc_msgSend(v16, "setShouldPrefetchCount:", 1);
  objc_msgSend(v16, "setWantsIncrementalChangeDetails:", 0);
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  return v21;
}

- (id)extractGenerativeMemoryMusicCuration
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  if (-[PHMemory isGenerative](self, "isGenerative"))
  {
    -[PHMemory photosGraphProperties](self, "photosGraphProperties");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      PLPhotoKitGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "No photosGraphData for the memory", v14, 2u);
      }
      v9 = 0;
      goto LABEL_19;
    }
    -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("generativeMemoryData"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("musicCuration"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        v9 = v8;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      PLPhotoKitGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "No MusicCuration in the photosGraphData.GenerativeData", v12, 2u);
      }

      v8 = 0;
    }
    else
    {
      PLPhotoKitGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "No GenerativeData in the photosGraphData", v13, 2u);
      }
    }
    v9 = 0;
    goto LABEL_18;
  }
  PLPhotoKitGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_INFO, "Can't extract GenerativeMemoryMusicCuration for non-generative memory", buf, 2u);
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (id)fetchPreviewAssetForLength:(unint64_t)a3 targetSize:(CGSize)a4
{
  void *v4;
  void *v5;

  -[PHMemory rankedPreviewAssetsForLength:targetSize:](self, "rankedPreviewAssetsForLength:targetSize:", a3, a4.width, a4.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rankedPreviewAssetsForLength:(unint64_t)a3 targetSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  id v9;
  NSObject *v10;
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
  NSObject *v25;
  uint64_t v26;
  id v28;
  _QWORD v29[2];
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  height = a4.height;
  width = a4.width;
  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  -[PHMemory curationOfLength:options:error:](self, "curationOfLength:options:error:", a3, MEMORY[0x1E0C9AA70], &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  if (v9)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v31 = a3;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "[PHMemory+Curation] failed to fetch assets with length(%lu): %@", buf, 0x16u);
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAsset fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:](PHAsset, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", self, 0, v13);
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject firstObject](v10, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIncludeGuestAssets:", 1);
    v17 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v14, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateWithFormat:", CFSTR("localIdentifier != %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("playbackStyle != %d && playbackStyle != %d"), 4, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3528];
    v29[0] = v19;
    v29[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v23);

    +[PHAsset fetchAssetsWithUUIDs:options:](PHAsset, "fetchAssetsWithUUIDs:options:", v8, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 134217984;
      v31 = v26;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_INFO, "[PHMemory+Curation] Curated assets count:%lu", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "filteredAndSortedPreviewAssetsByScoreFromAssets:targetSize:", v24, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)previewCandidatesFromAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  double v23;
  double v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  double v28;
  double v29;
  unint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v8;
    v51[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v11;
    v50[1] = v6;
    v42 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "valueForKey:", CFSTR("PHAssetPreviewCurationScorePercentileThresholdKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &unk_1E36577E0;
    if (v14)
      v16 = (void *)v14;
    v17 = v16;

    v43 = v5;
    objc_msgSend(v5, "valueForKey:", CFSTR("PHAssetPreviewAestheticsScorePercentileThresholdKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = &unk_1E36577F0;
    if (v18)
      v20 = (void *)v18;
    v21 = v20;

    v22 = objc_msgSend(v7, "count");
    objc_msgSend(v17, "doubleValue");
    v24 = v23 * (double)v22;
    if (v24 < 1.0)
      v24 = 1.0;
    v25 = (unint64_t)v24;
    v41 = v10;
    objc_msgSend(v10, "subarrayWithRange:", 0, (unint64_t)v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v45 = (uint64_t)v17;
      v46 = 2048;
      v47 = v25;
      v48 = 2048;
      v49 = v22;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_INFO, "[PHMemory+Curation] curationScorePercentile:%@, targetLength:(%lu/%lu)", buf, 0x20u);
    }

    objc_msgSend(v21, "doubleValue");
    v29 = v28 * (double)v22;
    if (v29 < 1.0)
      v29 = 1.0;
    v30 = (unint64_t)v29;
    objc_msgSend(v13, "subarrayWithRange:", 0, (unint64_t)v29, v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoKitGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v45 = (uint64_t)v21;
      v46 = 2048;
      v47 = v30;
      v48 = 2048;
      v49 = v22;
      _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_INFO, "[PHMemory+Curation] aestheticScorePercentile:%@, targetLength:(%lu/%lu)", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v26);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "intersectsSet:", v34))
    {
      objc_msgSend(v33, "intersectSet:", v34);
      PLPhotoKitGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = objc_msgSend(v33, "count");
        *(_DWORD *)buf = 134217984;
        v45 = v36;
        v37 = "[PHMemory+Curation] Found curation/aesthetics overlap candidates:%lu";
LABEL_20:
        _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_INFO, v37, buf, 0xCu);
      }
    }
    else
    {
      PLPhotoKitGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v38 = objc_msgSend(v33, "count");
        *(_DWORD *)buf = 134217984;
        v45 = v38;
        v37 = "[PHMemory+Curation] No top curation/aesthetics overlap. Use topCurationAssets:%lu";
        goto LABEL_20;
      }
    }

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v33;
}

+ (id)filteredAndSortedPreviewAssetsByScoreFromAssets:(id)a3 targetSize:(CGSize)a4
{
  double width;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  _PHCropInfo *v22;
  _PHCropInfo *v23;
  double v24;
  float v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  uint64_t j;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  void *v50;
  void *v51;
  id v52;
  double height;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE buf[12];
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  double v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  _BYTE v75[128];
  _QWORD v76[2];
  _BYTE v77[128];
  uint64_t v78;

  height = a4.height;
  width = a4.width;
  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v52 = v6;
    objc_msgSend(a1, "previewCandidatesFromAssets:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v59;
      v13 = *MEMORY[0x1E0C9D628];
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v17 = 0.0;
      v18 = 0.0;
      v19 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v59 != v12)
            objc_enumerationMutation(v9);
          v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          *(_QWORD *)buf = 0;
          objc_msgSend(v21, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", buf, width, height, v13, v14, v15, v16);
          v22 = [_PHCropInfo alloc];
          v23 = -[_PHCropInfo initWithAsset:cropScore:](v22, "initWithAsset:cropScore:", v21, *(double *)buf);
          objc_msgSend(v8, "addObject:", v23);
          objc_msgSend(v21, "curationScore");
          v19 = v19 + v24;
          objc_msgSend(v21, "overallAestheticScore");
          v18 = v18 + v25;
          v17 = v17 + *(double *)buf;

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
      }
      while (v11);
    }
    else
    {
      v17 = 0.0;
      v18 = 0.0;
      v19 = 0.0;
    }

    v50 = v9;
    v27 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cropScore"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v28;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.uuid"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v8;
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
    if (v33)
    {
      v34 = v33;
      v35 = (double)v27;
      v36 = v19 / (double)v27;
      v37 = v18 / (double)v27;
      v38 = *(_QWORD *)v55;
      v39 = v17 / v35;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v55 != v38)
            objc_enumerationMutation(v32);
          v41 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          objc_msgSend(v41, "asset");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v42);
          PLPhotoKitGetLog();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v41, "cropScore");
            v45 = v44;
            objc_msgSend(v42, "curationScore");
            v47 = v46;
            objc_msgSend(v42, "overallAestheticScore");
            *(_DWORD *)buf = 138413826;
            *(_QWORD *)&buf[4] = v42;
            v63 = 2048;
            v64 = v45;
            v65 = 2048;
            v66 = v39;
            v67 = 2048;
            v68 = v47;
            v69 = 2048;
            v70 = v36;
            v71 = 2048;
            v72 = v48;
            v73 = 2048;
            v74 = v37;
            _os_log_impl(&dword_1991EC000, v43, OS_LOG_TYPE_INFO, "[PNAssetCurationUtilities] Select preview asset:%@, cropScore:(%.4f, avg:%.4f), curationScore:(%.4f, avg:%.4f), aestheticScore:(%.4f, avg:%.4f)", buf, 0x48u);
          }

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
      }
      while (v34);
    }

    v6 = v52;
  }
  else
  {
    v26 = (id)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

- (void)setupTransientMemory
{
  NSDictionary *transientMemoryProperties;
  NSString *v4;
  NSString *title;
  NSString *v6;
  NSString *localizedSubtitle;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSData *v19;
  NSData *photosGraphData;
  void *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  transientMemoryProperties = self->_transientMemoryProperties;
  self->_transientMemoryProperties = (NSDictionary *)MEMORY[0x1E0C9AA70];

  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("title"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v4;

  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedSubtitle = self->_localizedSubtitle;
  self->_localizedSubtitle = v6;

  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = -[PHMemory category](self, "category");

  if (v9 != v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Transient Memory has different category before and after setup", buf, 2u);
  }
  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("subcategory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  v13 = -[PHMemory subcategory](self, "subcategory");

  if (v12 != v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v23 = 0;
    _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Transient Memory has different subcategory before and after setup", v23, 2u);
  }
  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("score"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  -[PHMemory score](self, "score");
  v18 = v17;

  if (v16 != v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v22 = 0;
    _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Transient Memory has different score before and after setup", v22, 2u);
  }
  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("photosgraphData"));
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  photosGraphData = self->_photosGraphData;
  self->_photosGraphData = v19;

  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("photosGraphVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_photosGraphVersion = objc_msgSend(v21, "integerValue");

}

- (id)queryForExtendedCuratedAssetsWithOptions:(id)a3
{
  NSDictionary *transientMemoryProperties;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  transientMemoryProperties = self->_transientMemoryProperties;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("extendeduratedAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[PHMemory setupTransientMemory](self, "setupTransientMemory");
  objc_msgSend((id)objc_opt_class(), "_fetchOptionsForTransientMemoryAssetsWithOptions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("extendeduratedAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForAssetsWithLocalIdentifiers:options:](PHQuery, "queryForAssetsWithLocalIdentifiers:options:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)queryForCuratedAssetsWithOptions:(id)a3
{
  NSDictionary *transientMemoryProperties;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  transientMemoryProperties = self->_transientMemoryProperties;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("curatedAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[PHMemory setupTransientMemory](self, "setupTransientMemory");
  objc_msgSend((id)objc_opt_class(), "_fetchOptionsForTransientMemoryAssetsWithOptions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("curatedAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForAssetsWithLocalIdentifiers:options:](PHQuery, "queryForAssetsWithLocalIdentifiers:options:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)queryForKeyAssetWithOptions:(id)a3
{
  NSDictionary *transientMemoryProperties;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  transientMemoryProperties = self->_transientMemoryProperties;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("keyAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[PHMemory setupTransientMemory](self, "setupTransientMemory");
  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("keyAsset"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend((id)objc_opt_class(), "_fetchOptionsForTransientMemoryAssetsWithOptions:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForAssetsWithLocalIdentifiers:options:](PHQuery, "queryForAssetsWithLocalIdentifiers:options:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)query
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHMemory setupTransientMemory](self, "setupTransientMemory");
  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("extendeduratedAssets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count")
    || (-[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("assets")), v6 = objc_claimAutoreleasedReturnValue(), v5, (v5 = (void *)v6) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "_fetchOptionsForTransientMemoryAssetsWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForAssetsWithLocalIdentifiers:options:](PHQuery, "queryForAssetsWithLocalIdentifiers:options:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)transientRepresentativeAndCuratedAssetIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHMemory setupTransientMemory](self, "setupTransientMemory");
  -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("representativeAssets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("PHAssetPropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchedObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isTransient
{
  return self->_transientMemoryProperties != 0;
}

- (id)rejectionCause
{
  return -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("rejectionCause"));
}

- (id)transientMemoryStartDate
{
  return -[NSDictionary objectForKeyedSubscript:](self->_transientMemoryProperties, "objectForKeyedSubscript:", CFSTR("startDate"));
}

+ (id)transientMemoryWithInfo:(id)a3 photoLibrary:(id)a4
{
  NSDictionary *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PHMemory *v17;
  NSDictionary *transientMemoryProperties;

  v5 = (NSDictionary *)a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("uuid"));

  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("category"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("category"));
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("subcategory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("subcategory"));
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("title"));
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("subtitle"));
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("creationDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("creationDate"));
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("score"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("score"));
  v17 = -[PHMemory initWithFetchDictionary:propertyHint:photoLibrary:]([PHMemory alloc], "initWithFetchDictionary:propertyHint:photoLibrary:", v8, 2, v7);

  transientMemoryProperties = v17->_transientMemoryProperties;
  v17->_transientMemoryProperties = v5;

  return v17;
}

+ (id)_fetchOptionsForTransientMemoryAssetsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v5 = (void *)objc_opt_new();
  }
  objc_msgSend(v5, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setSortDescriptors:", v9);
  }
  return v5;
}

@end
