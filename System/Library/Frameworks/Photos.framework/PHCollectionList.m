@implementation PHCollectionList

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHCollectionList)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHCollectionList *v9;
  PHCollectionList *v10;
  void *v11;
  uint64_t v12;
  NSString *cloudGUID;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *localizedTitle;
  NSArray *localizedLocationNames;
  uint64_t v20;
  NSManagedObjectID *parentFolderObjectID;
  objc_super v23;

  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PHCollectionList;
  v9 = -[PHCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v23, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    v9->_estimatedChildCollectionCount = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kind"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_plAlbumKind = objc_msgSend(v11, "shortValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    cloudGUID = v10->_cloudGUID;
    v10->_cloudGUID = (NSString *)v12;

    v14 = v10->_plAlbumKind - 3998;
    if (v14 > 8)
    {
      v16 = 100;
      v15 = 2;
    }
    else
    {
      v15 = qword_19944A5D8[v14];
      v16 = *(_QWORD *)&asc_19944A620[8 * v14];
    }
    v10->_collectionListType = v15;
    v10->_collectionListSubtype = v16;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v17 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v17;

    localizedLocationNames = v10->_localizedLocationNames;
    v10->_localizedLocationNames = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parentFolder"));
    v20 = objc_claimAutoreleasedReturnValue();
    parentFolderObjectID = v10->_parentFolderObjectID;
    v10->_parentFolderObjectID = (NSManagedObjectID *)v20;

  }
  return v10;
}

- (id)localizedTitle
{
  NSString *v3;
  void *v4;
  uint64_t plAlbumKind;
  void *v6;

  v3 = self->_localizedTitle;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D71778];
    plAlbumKind = self->_plAlbumKind;
    -[PHObject photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedTitleForAlbumKind:cplEnabled:", plAlbumKind, objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)canContainCollections
{
  return 1;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  int plAlbumKind;

  plAlbumKind = self->_plAlbumKind;
  if (plAlbumKind <= 3998)
  {
    if (plAlbumKind == 3998)
      return a3 == 5;
    return 0;
  }
  if (plAlbumKind == 4000)
    return 1;
  if (plAlbumKind != 3999)
    return 0;
  if ((unint64_t)a3 >= 6)
    return 0;
  else
    return (0x3Au >> a3) & 1;
}

- (BOOL)collectionHasFixedOrder
{
  return objc_msgSend(MEMORY[0x1E0D71878], "albumKindHasFixedOrder:", self->_plAlbumKind);
}

- (unint64_t)collectionFixedOrderPriority
{
  return objc_msgSend(MEMORY[0x1E0D71878], "priorityForAlbumKind:", self->_plAlbumKind);
}

- (BOOL)keyCollectionsAtEnd
{
  return -[PHCollectionList collectionListType](self, "collectionListType") == PHCollectionListTypeSmartFolder
      && -[PHCollectionList collectionListSubtype](self, "collectionListSubtype") == 1000000202;
}

- (BOOL)hasLocationInfo
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[PHCollectionList localizedLocationNames](self, "localizedLocationNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PHCollectionList;
    v4 = -[PHCollection hasLocationInfo](&v6, sel_hasLocationInfo);
  }

  return v4;
}

- (id)parentFolderID
{
  return self->_parentFolderObjectID;
}

- (id)effectiveCustomSortDescriptors
{
  uint64_t v3;
  void *v4;

  v3 = -[PHCollection customSortKey](self, "customSortKey");
  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0D71898], "sortDescriptorsForAlbumsInFolderWithSortKey:ascending:", v3, -[PHCollection customSortAscending](self, "customSortAscending"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)initTransientWithCollections:(id)a3 orQuery:(id)a4 title:(id)a5 identifier:(id)a6 photoLibrary:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PHCollectionList *v25;
  PHCollectionList *v26;
  uint64_t v27;
  PHQuery *query;
  uint64_t v29;
  NSArray *collections;
  uint64_t v31;
  NSString *transientIdentifier;
  id v34;
  _QWORD v35[12];

  v35[11] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v35[0] = CFSTR("PHAssetCollection");
    v35[1] = CFSTR("PHAlbum");
    v35[2] = CFSTR("PHCloudSharedAlbum");
    v35[3] = CFSTR("PHSmartAlbum");
    v35[4] = CFSTR("PHCollectionList");
    v35[5] = CFSTR("PHCollection");
    v35[6] = CFSTR("PHMoment");
    v35[7] = CFSTR("PHMomentList");
    v35[8] = CFSTR("PHImportSession");
    v35[9] = CFSTR("PHProject");
    v35[10] = CFSTR("PHPhotosHighlight");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "containsObject:", v18);

    if ((v19 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The fetch result returned an unexpected fetch type"), 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v34);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E36550C0, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("uuid"));

  if (!v16)
  {
    objc_msgSend(v13, "fetchOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v23, v24);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v25 = -[PHCollectionList initWithFetchDictionary:propertyHint:photoLibrary:](self, "initWithFetchDictionary:propertyHint:photoLibrary:", v20, 2, v16);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_localizedTitle, a5);
    v27 = objc_msgSend(v13, "copy");
    query = v26->_query;
    v26->_query = (PHQuery *)v27;

    v29 = objc_msgSend(v12, "copy");
    collections = v26->_collections;
    v26->_collections = (NSArray *)v29;

    v31 = objc_msgSend(v15, "copy");
    transientIdentifier = v26->_transientIdentifier;
    v26->_transientIdentifier = (NSString *)v31;

  }
  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHCollectionList;
  -[PHCollection description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" collectionListType=%ld/%ld"), -[PHCollectionList collectionListType](self, "collectionListType"), -[PHCollectionList collectionListSubtype](self, "collectionListSubtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)localizedLocationNames
{
  return self->_localizedLocationNames;
}

- (NSArray)collections
{
  return self->_collections;
}

- (PHCollectionListType)collectionListType
{
  return self->_collectionListType;
}

- (PHCollectionListSubtype)collectionListSubtype
{
  return self->_collectionListSubtype;
}

- (PHQuery)query
{
  return self->_query;
}

- (id)childCollectionsSortingComparator
{
  return self->_childCollectionsSortingComparator;
}

- (unint64_t)unreadAssetCollectionsCount
{
  return self->_unreadAssetCollectionsCount;
}

- (unint64_t)estimatedChildCollectionCount
{
  return self->_estimatedChildCollectionCount;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong(&self->_childCollectionsSortingComparator, 0);
  objc_storeStrong((id *)&self->_parentFolderObjectID, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_localizedLocationNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PHCollectionList_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_7242 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_7242, block);
  return (id)propertiesToFetchWithHint__array_7243;
}

+ (id)managedEntityName
{
  return CFSTR("Folder");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHCollectionList");
  return CFSTR("PHCollectionList");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

+ (id)identifierCode
{
  return CFSTR("020");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_7226;
}

+ (PHFetchResult)fetchCollectionListsContainingCollection:(PHCollection *)collection options:(PHFetchOptions *)options
{
  PHCollection *v5;
  PHFetchOptions *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = collection;
  v6 = options;
  if (v5
    && (-[PHObject objectID](v5, "objectID"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    +[PHQuery queryForCollectionListContainingCollection:options:](PHQuery, "queryForCollectionListContainingCollection:options:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executeQuery");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHObject photoLibrary](v5, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHManualFetchResult emptyFetchResultWithPhotoLibrary:](PHManualFetchResult, "emptyFetchResultWithPhotoLibrary:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return (PHFetchResult *)v10;
}

+ (PHFetchResult)fetchCollectionListsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options
{
  NSArray *v5;
  NSArray *v6;
  void *v7;
  _QWORD v9[4];
  NSArray *v10;

  v5 = identifiers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__PHCollectionList_fetchCollectionListsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v7;
}

+ (PHFetchResult)fetchCollectionListsWithType:(PHCollectionListType)collectionListType subtype:(PHCollectionListSubtype)subtype options:(PHFetchOptions *)options
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PHCollectionList_fetchCollectionListsWithType_subtype_options___block_invoke;
  v6[3] = &__block_descriptor_48_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6[4] = collectionListType;
  v6[5] = subtype;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v6);
  return (PHFetchResult *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRootAlbumCollectionListWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_7222);
}

+ (id)fetchRootProjectCollectionListWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_64);
}

+ (PHFetchResult)fetchMomentListsWithSubtype:(PHCollectionListSubtype)momentListSubtype containingMoment:(PHAssetCollection *)moment options:(PHFetchOptions *)options
{
  void *v5;
  PHFetchOptions *v7;
  void *v8;

  v5 = moment;
  if (moment)
  {
    v7 = options;
    +[PHQuery queryForMomentListsWithSubType:containingMoment:](PHQuery, "queryForMomentListsWithSubType:containingMoment:", momentListSubtype, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchOptions:", v7);

    objc_msgSend(v8, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PHFetchResult *)v5;
}

+ (PHFetchResult)fetchMomentListsWithSubtype:(PHCollectionListSubtype)momentListSubtype options:(PHFetchOptions *)options
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PHCollectionList_fetchMomentListsWithSubtype_options___block_invoke;
  v5[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v5[4] = momentListSubtype;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v5);
  return (PHFetchResult *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PHCollectionList;
  objc_msgSendSuper2(&v5, sel_fetchPredicateFromComparisonPredicate_options_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)transientCollectionListWithCollections:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PHCollectionList initTransientWithCollections:orQuery:title:identifier:photoLibrary:]([PHCollectionList alloc], "initTransientWithCollections:orQuery:title:identifier:photoLibrary:", v12, 0, v11, v10, v9);

  return v13;
}

+ (PHCollectionList)transientCollectionListWithCollections:(NSArray *)collections title:(NSString *)title
{
  NSString *v5;
  NSArray *v6;
  id v7;

  v5 = title;
  v6 = collections;
  v7 = -[PHCollectionList initTransientWithCollections:orQuery:title:identifier:photoLibrary:]([PHCollectionList alloc], "initTransientWithCollections:orQuery:title:identifier:photoLibrary:", v6, 0, v5, 0, 0);

  return (PHCollectionList *)v7;
}

+ (PHCollectionList)transientCollectionListWithCollectionsFetchResult:(PHFetchResult *)fetchResult title:(NSString *)title
{
  PHFetchResult *v5;
  NSString *v6;
  void *v7;
  void *v8;
  PHCollectionList *v9;
  void *v10;
  id v11;

  v5 = fetchResult;
  v6 = title;
  -[PHFetchResult query](v5, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    -[PHFetchResult fetchedObjects](v5, "fetchedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = [PHCollectionList alloc];
  -[PHFetchResult photoLibrary](v5, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHCollectionList initTransientWithCollections:orQuery:title:identifier:photoLibrary:](v9, "initTransientWithCollections:orQuery:title:identifier:photoLibrary:", v8, v7, v6, 0, v10);

  return (PHCollectionList *)v11;
}

+ (id)transientCollectionListWithCollections:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PHCollectionList initTransientWithCollections:orQuery:title:identifier:photoLibrary:]([PHCollectionList alloc], "initTransientWithCollections:orQuery:title:identifier:photoLibrary:", v9, 0, v8, v7, 0);

  return v10;
}

+ (id)transientCollectionListWithCollectionsFetchResult:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  PHCollectionList *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PHCollectionList alloc];
  objc_msgSend(v9, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PHCollectionList initTransientWithCollections:orQuery:title:identifier:photoLibrary:](v10, "initTransientWithCollections:orQuery:title:identifier:photoLibrary:", 0, v11, v8, v7, v12);
  return v13;
}

id __56__PHCollectionList_fetchMomentListsWithSubtype_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForMomentListsWithSubType:options:](PHQuery, "queryForMomentListsWithSubType:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __62__PHCollectionList_fetchRootProjectCollectionListWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForRootProjectCollectionListWithOptions:](PHQuery, "queryForRootProjectCollectionListWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __60__PHCollectionList_fetchRootAlbumCollectionListWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForRootAlbumCollectionListWithOptions:](PHQuery, "queryForRootAlbumCollectionListWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __65__PHCollectionList_fetchCollectionListsWithType_subtype_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForCollectionListsWithType:subtype:options:](PHQuery, "queryForCollectionListsWithType:subtype:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __69__PHCollectionList_fetchCollectionListsWithLocalIdentifiers_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHObject identifierCodeFromLocalIdentifier:](PHObject, "identifierCodeFromLocalIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = +[PHPhotoLibrary collectionListTypeForIdentifierCode:](PHPhotoLibrary, "collectionListTypeForIdentifierCode:", v5);
  }
  else
  {
    v6 = 2;
  }
  +[PHQuery queryForCollectionListsWithType:localIdentifiers:options:](PHQuery, "queryForCollectionListsWithType:localIdentifiers:options:", v6, *(_QWORD *)(a1 + 32), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __32__PHCollectionList_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v15 = CFSTR("uuid");
  v16[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v1;
  v16[1] = CFSTR("title");
  v14[0] = CFSTR("localizedTitle");
  v14[1] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v2;
  v16[2] = CFSTR("startDate");
  v13 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v3;
  v16[3] = CFSTR("endDate");
  v12 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v4;
  v16[4] = CFSTR("customSortAscending");
  v11 = CFSTR("customSortAscending");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v5;
  v16[5] = CFSTR("customSortKey");
  v10 = CFSTR("customSortKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v7);
  v9 = (void *)entityKeyMap_pl_once_object_15_7226;
  entityKeyMap_pl_once_object_15_7226 = v8;

}

void __46__PHCollectionList_propertiesToFetchWithHint___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("cloudGUID");
  v4[3] = CFSTR("cachedCount");
  v4[4] = CFSTR("kind");
  v4[5] = CFSTR("title");
  v4[6] = CFSTR("customSortAscending");
  v4[7] = CFSTR("customSortKey");
  v4[8] = CFSTR("parentFolder");
  v4[9] = CFSTR("trashedState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToFetchWithHint__array_7243;
  propertiesToFetchWithHint__array_7243 = v2;

}

- (id)pl_assetContainerList
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAdoptionUtilities.m"), 187, CFSTR("This is only callable on the main thread"));

  }
  if (-[PHCollectionList collectionListType](self, "collectionListType") == PHCollectionListTypeMomentList
    || -[PHCollectionList collectionListType](self, "collectionListType") == PHCollectionListTypeFolder)
  {
    v4 = (void *)MEMORY[0x19AEBEADC]();
    -[PHObject photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainQueueConcurrencyPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHObject objectID](self, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v7, "existingObjectWithID:error:", v8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (!v9 && v10)
    {
      PLPhotoKitGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "Failed to fetch moment: %@", buf, 0xCu);
      }

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)objectReference
{
  return +[PHCollectionListReference referenceForCollectionList:](PHCollectionListReference, "referenceForCollectionList:", self);
}

+ (id)fetchCollectionListsForReferences:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  +[PHCollectionList fetchType](PHCollectionList, "fetchType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__PHCollectionList_PHObjectReference__fetchCollectionListsForReferences_photoLibrary___block_invoke;
  v11[3] = &unk_1E35DC330;
  v12 = v5;
  v8 = v5;
  PHCollectionReferenceFetchCollectionsForReferences((uint64_t)v6, v8, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __86__PHCollectionList_PHObjectReference__fetchCollectionListsForReferences_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeTrashedAssets:", 1);
  +[PHCollectionList fetchCollectionListsWithLocalIdentifiers:options:](PHCollectionList, "fetchCollectionListsWithLocalIdentifiers:options:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
