@implementation PHCollection

- (PHCollection)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHCollection;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v14, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customSortAscending"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_customSortAscending = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customSortKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_customSortKey = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trashedState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_trashed = objc_msgSend(v12, "intValue") != 0;

  }
  return v9;
}

- (NSSortDescriptor)defaultSortDescriptor
{
  return 0;
}

- (NSArray)effectiveCustomSortDescriptors
{
  return 0;
}

- (unsigned)customSortKey
{
  return self->_customSortKey;
}

- (id)objectReference
{
  return +[PHObjectReference referenceForObject:](PHCollectionReference, "referenceForObject:", self);
}

- (BOOL)canContainAssets
{
  return 0;
}

- (BOOL)canContainCollections
{
  return 0;
}

- (BOOL)canPerformEditOperation:(PHCollectionEditOperation)anOperation
{
  return 0;
}

- (NSString)localizedTitle
{
  return 0;
}

- (BOOL)hasLocalizedTitle
{
  void *v2;
  BOOL v3;

  -[PHCollection localizedTitle](self, "localizedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)hasLocationInfo
{
  return 0;
}

- (BOOL)isDeleted
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHCollection;
  return -[PHObject isDeleted](&v4, sel_isDeleted) || self->_trashed;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (BOOL)willFetchDatesIfNeeded
{
  return 0;
}

- (unint64_t)collectionFixedOrderPriority
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSManagedObjectID)parentFolderID
{
  return 0;
}

- (unint64_t)ancestryIndexOfCollectionList:(id)a3 context:(id)a4
{
  PHCollection *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (PHCollection *)a3;
  v7 = a4;
  if (v6 == self)
  {
    v11 = 0;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[PHCollection parentFolderID](self, "parentFolderID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "folderForID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = 1;
      while (1)
      {
        objc_msgSend(v10, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "containsObject:", v12);

        if (v13)
          break;
        objc_msgSend(v10, "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        if (-[PHObject isEqual:](v6, "isEqual:", v10))
          goto LABEL_14;
        objc_msgSend(v10, "parentFolderID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "folderForID:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        ++v11;
        v10 = (void *)v16;
        if (!v16)
          goto LABEL_13;
      }
      PLPhotoKitGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v18;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Cycle detected in PHCollectionList hierarchy for %@", (uint8_t *)&v20, 0xCu);

      }
LABEL_13:
      v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  return v11;
}

- (BOOL)isAlbumContentSort
{
  return 0;
}

- (BOOL)isAlbumContentTitleSort
{
  return 0;
}

- (BOOL)isUserSmartAlbum
{
  return 0;
}

- (PHCollectionPresentationHints)presentationHints
{
  return 0;
}

- (BOOL)startsAtEnd
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCollection;
  -[PHObject description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCollection localizedTitle](self, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCollection localizedSubtitle](self, "localizedSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", title:\"%@\", subtitle:\"%@\"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_estimatedPhotosCount;
}

- (unint64_t)estimatedVideosCount
{
  return self->_estimatedVideosCount;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (BOOL)customSortAscending
{
  return self->_customSortAscending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71778], "entityName");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHCollection");
  return CFSTR("PHCollection");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_37084;
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
  block[2] = __52__PHCollection_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_37072 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_37072, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_37073, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (PHFetchResult)fetchCollectionsInCollectionList:(PHCollectionList *)collectionList options:(PHFetchOptions *)options
{
  PHCollectionList *v5;
  PHFetchOptions *v6;
  void *v7;
  void *v8;
  void *v9;
  PHManualFetchResult *v10;
  void *v11;
  void *v12;
  PHManualFetchResult *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = collectionList;
  v6 = options;
  if (v5)
  {
    if (!-[PHObject isTransient](v5, "isTransient"))
      goto LABEL_8;
    -[PHCollectionList transientIdentifier](v5, "transientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHCollectionList query](v5, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "executeQuery");
      v10 = (PHManualFetchResult *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PHCollectionList collections](v5, "collections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = [PHManualFetchResult alloc];
      -[PHFetchOptions fetchPropertySetsAsSet](v6, "fetchPropertySetsAsSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v13, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, v12, CFSTR("PHCollectionList"), v14, v7, 1);

    }
    if (!v10)
    {
LABEL_8:
      if (!v6)
      {
        +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v5);
        v6 = (PHFetchOptions *)objc_claimAutoreleasedReturnValue();
      }
      -[PHFetchOptions photoLibrary](v6, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        -[PHObject photoLibrary](v5, "photoLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHFetchOptions setPhotoLibrary:](v6, "setPhotoLibrary:", v16);

      }
      +[PHQuery queryForCollectionsInCollectionList:options:](PHQuery, "queryForCollectionsInCollectionList:options:", v5, v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "executeQuery");
      v10 = (PHManualFetchResult *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return (PHFetchResult *)v10;
}

+ (PHFetchResult)fetchTopLevelUserCollectionsWithOptions:(PHFetchOptions *)options
{
  PHFetchOptions *v3;
  PHFetchOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = options;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)-[PHFetchOptions copy](v3, "copy");

  }
  else
  {
    v5 = (void *)objc_opt_new();
  }
  objc_msgSend(v5, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v5, "internalSortDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("parentFolder"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInternalSortDescriptors:", v9);

    }
  }
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v5, &__block_literal_global_37070);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v10;
}

+ (NSPredicate)predicateForUserCollections
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d OR %K = %d OR %K = %d"), CFSTR("kind"), 2, CFSTR("kind"), 1507, CFSTR("kind"), 4000);
}

+ (id)fetchMomentsForAssetsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "chunkSizeForFetch"))
  {
    if (v6)
    {
      v7 = objc_msgSend(v6, "copy");

      v6 = (id)v7;
    }
    else
    {
      v6 = (id)objc_opt_new();
    }
    objc_msgSend(v6, "setChunkSizeForFetch:", 2000);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PHCollection_fetchMomentsForAssetsWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E35DFCC0;
  v12 = v5;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchMomentsForAssetsWithOIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "chunkSizeForFetch"))
  {
    if (v6)
    {
      v7 = objc_msgSend(v6, "copy");

      v6 = (id)v7;
    }
    else
    {
      v6 = (id)objc_opt_new();
    }
    objc_msgSend(v6, "setChunkSizeForFetch:", 2000);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__PHCollection_fetchMomentsForAssetsWithOIDs_options___block_invoke;
  v11[3] = &unk_1E35DFCC0;
  v12 = v5;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchMomentsForFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "chunkSizeForFetch"))
  {
    if (v6)
    {
      v7 = objc_msgSend(v6, "copy");

      v6 = (id)v7;
    }
    else
    {
      v6 = (id)objc_opt_new();
    }
    objc_msgSend(v6, "setChunkSizeForFetch:", 2000);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PHCollection_fetchMomentsForFacesWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E35DFCC0;
  v12 = v5;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchMomentsForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "chunkSizeForFetch"))
  {
    if (v6)
    {
      v7 = objc_msgSend(v6, "copy");

      v6 = (id)v7;
    }
    else
    {
      v6 = (id)objc_opt_new();
    }
    objc_msgSend(v6, "setChunkSizeForFetch:", 2000);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PHCollection_fetchMomentsForPersonsWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E35DFCC0;
  v12 = v5;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchFilteredAssetCollections:(id)a3 containingAssetsMatchingPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PHManualFetchResult *v10;
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
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  PHManualFetchResult *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  id v66;
  void *v67;
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v39 = v6;
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", v7, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "containerRelationship");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_msgSend(v8, "isToMany") & 1) == 0)
    {
      objc_msgSend(v5, "fetchedObjectIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("noindex:(%@) IN (%%@)"), v9);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v36, v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C97B48];
      objc_msgSend(MEMORY[0x1E0D71880], "entityName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setResultType:", 2);
      v14 = (void *)MEMORY[0x1E0CB3528];
      v68[0] = v6;
      v68[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPredicate:", v16);

      objc_msgSend(v13, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
      v67 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPropertiesToGroupBy:", v17);

      v38 = objc_alloc_init(MEMORY[0x1E0C97B30]);
      objc_msgSend(v38, "setName:", v9);
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setExpression:", v18);

      objc_msgSend(v38, "setExpressionResultType:", 2000);
      v66 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPropertiesToFetch:", v19);

      v57 = 0;
      v58 = &v57;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__37056;
      v61 = __Block_byref_object_dispose__37057;
      v62 = 0;
      v51 = 0;
      v52 = &v51;
      v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__37056;
      v55 = __Block_byref_object_dispose__37057;
      v56 = 0;
      objc_msgSend(v40, "photoLibraryForCurrentQueueQoS");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __80__PHCollection_fetchFilteredAssetCollections_containingAssetsMatchingPredicate___block_invoke;
      v46[3] = &unk_1E35DE5F8;
      v49 = &v57;
      v47 = v20;
      v33 = v13;
      v34 = v47;
      v48 = v33;
      v50 = &v51;
      objc_msgSend(v47, "performBlockAndWait:", v46);
      if (v58[5])
      {
        v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v22 = objc_msgSend(v21, "initWithCapacity:", objc_msgSend((id)v58[5], "count"));
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v23 = (id)v58[5];
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v43 != v25)
                objc_enumerationMutation(v23);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "valueAtIndex:", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v22, "addObject:", v27);

            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
          }
          while (v24);
        }

        v28 = [PHManualFetchResult alloc];
        objc_msgSend(v5, "fetchType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fetchPropertySets");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v28, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v22, v40, v29, v30, 0, 0);

      }
      else
      {
        PLPhotoKitGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v31 = v52[5];
          *(_DWORD *)buf = 138412290;
          v65 = v31;
          _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Error fetching filtered asset collections:%@", buf, 0xCu);
        }
        v10 = 0;
      }

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v57, 8);

    }
    else
    {
      v10 = 0;
    }

    v6 = v39;
  }
  else
  {
    v10 = (PHManualFetchResult *)v5;
  }

  return v10;
}

void __80__PHCollection_fetchFilteredAssetCollections_containingAssetsMatchingPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __67__PHCollection_fetchMomentsForPersonsWithLocalIdentifiers_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[PHQuery queryForMomentsForPersonsWithLocalIdentifiers:options:](PHQuery, "queryForMomentsForPersonsWithLocalIdentifiers:options:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchOptions:", v3);

  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__PHCollection_fetchMomentsForFacesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForMomentsForFacesWithLocalIdentifiers:options:](PHQuery, "queryForMomentsForFacesWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__PHCollection_fetchMomentsForAssetsWithOIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForMomentsContainingAssetsWithOIDs:options:](PHQuery, "queryForMomentsContainingAssetsWithOIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __66__PHCollection_fetchMomentsForAssetsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForMomentsContainingAssetsWithLocalIdentifiers:options:](PHQuery, "queryForMomentsContainingAssetsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __56__PHCollection_fetchTopLevelUserCollectionsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForTopLevelUserCollectionsWithOptions:](PHQuery, "queryForTopLevelUserCollectionsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__PHCollection_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("title");
  v4[1] = CFSTR("localizedTitle");
  v4[2] = CFSTR("startDate");
  v4[3] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_37073;
  transformValueExpression_forKeyPath___passThroughSet_37073 = v2;

}

void __28__PHCollection_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[2];
  const __CFString *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v11 = CFSTR("uuid");
  v12[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v12[1] = CFSTR("title");
  v10[0] = CFSTR("localizedTitle");
  v10[1] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  v12[2] = CFSTR("startDate");
  v9 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  v12[3] = CFSTR("endDate");
  v8 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v5);
  v7 = (void *)entityKeyMap_pl_once_object_15_37084;
  entityKeyMap_pl_once_object_15_37084 = v6;

}

@end
