@implementation PHAssetCollection

- (PHAssetCollection)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHAssetCollection *v9;
  uint64_t v10;
  NSString *importSessionID;
  uint64_t v12;
  NSString *cloudGUID;
  void *v14;
  int plAlbumKind;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *title;
  NSArray *localizedLocationNames;
  void *v26;
  uint64_t v27;
  PLQuery *userQuery;
  uint64_t v29;
  NSManagedObjectID *parentFolderObjectID;
  uint64_t v31;
  NSDate *startDate;
  uint64_t v33;
  NSDate *endDate;
  NSDate *datesLock_fetchedStartDate;
  NSDate *datesLock_fetchedEndDate;
  void *v37;
  objc_super v39;

  v8 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PHAssetCollection;
  v9 = -[PHCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v39, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (!v9)
    goto LABEL_64;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("importSessionID"));
  v10 = objc_claimAutoreleasedReturnValue();
  importSessionID = v9->_importSessionID;
  v9->_importSessionID = (NSString *)v10;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
  v12 = objc_claimAutoreleasedReturnValue();
  cloudGUID = v9->_cloudGUID;
  v9->_cloudGUID = (NSString *)v12;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kind"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_plAlbumKind = objc_msgSend(v14, "shortValue");

  plAlbumKind = v9->_plAlbumKind;
  if (plAlbumKind <= 1549)
  {
    if (plAlbumKind > 1499)
    {
      if (plAlbumKind > 1506)
      {
        if (plAlbumKind == 1507)
        {
          v9->_assetCollectionType = 2;
          v16 = 1000000204;
        }
        else
        {
          if (plAlbumKind != 1510)
            goto LABEL_58;
          v9->_assetCollectionType = 1;
          v16 = 1000000601;
        }
      }
      else if (plAlbumKind == 1500)
      {
        v9->_assetCollectionType = 1;
        v16 = 100;
      }
      else
      {
        if (plAlbumKind != 1505)
          goto LABEL_58;
        v9->_assetCollectionType = 1;
        v16 = 101;
      }
    }
    else if (plAlbumKind > 14)
    {
      if (plAlbumKind == 15)
      {
        v9->_assetCollectionType = 1;
        v16 = 4;
      }
      else
      {
        if (plAlbumKind != 1000)
          goto LABEL_58;
        v9->_assetCollectionType = 1;
        v16 = 1000000001;
      }
    }
    else if (plAlbumKind == 2)
    {
      v9->_assetCollectionType = 1;
      v16 = 2;
    }
    else
    {
      if (plAlbumKind != 12)
        goto LABEL_58;
LABEL_9:
      v9->_assetCollectionType = 1;
      v16 = 6;
    }
  }
  else
  {
    switch(plAlbumKind)
    {
      case 1603:
      case 1604:
        goto LABEL_9;
      case 1605:
        v9->_assetCollectionType = 2;
        v16 = 201;
        break;
      case 1606:
        v9->_assetCollectionType = 2;
        v16 = 202;
        break;
      case 1607:
      case 1608:
      case 1625:
      case 1629:
      case 1633:
      case 1635:
      case 1637:
      case 1638:
        goto LABEL_58;
      case 1609:
        v9->_assetCollectionType = 2;
        v16 = 203;
        break;
      case 1610:
        v9->_assetCollectionType = 2;
        v16 = 204;
        break;
      case 1611:
        v9->_assetCollectionType = 2;
        v16 = 205;
        break;
      case 1612:
        v9->_assetCollectionType = 2;
        v17 = 200;
        goto LABEL_56;
      case 1613:
        v9->_assetCollectionType = 2;
        v16 = 209;
        break;
      case 1614:
        v9->_assetCollectionType = 2;
        v16 = 207;
        break;
      case 1615:
        v9->_assetCollectionType = 2;
        v16 = 208;
        break;
      case 1616:
        v9->_assetCollectionType = 2;
        v16 = 206;
        break;
      case 1617:
        v9->_assetCollectionType = 2;
        v16 = 210;
        break;
      case 1618:
        v9->_assetCollectionType = 2;
        v16 = 211;
        break;
      case 1619:
        v9->_assetCollectionType = 2;
        v17 = 202;
        goto LABEL_56;
      case 1620:
        v9->_assetCollectionType = 2;
        v16 = 212;
        break;
      case 1621:
        v9->_assetCollectionType = 2;
        v16 = 213;
        break;
      case 1622:
        v9->_assetCollectionType = 2;
        v16 = 214;
        break;
      case 1623:
        v9->_assetCollectionType = 2;
        v16 = 215;
        break;
      case 1624:
        v9->_assetCollectionType = 2;
        v16 = 216;
        break;
      case 1626:
        v9->_assetCollectionType = 2;
        v16 = 1000000206;
        break;
      case 1627:
        v9->_assetCollectionType = 2;
        v17 = 206;
        goto LABEL_56;
      case 1628:
        v9->_assetCollectionType = 2;
        v17 = 204;
        goto LABEL_56;
      case 1630:
        v9->_assetCollectionType = 2;
        v16 = 217;
        break;
      case 1631:
        v9->_assetCollectionType = 2;
        v16 = 218;
        break;
      case 1632:
        v9->_assetCollectionType = 2;
        v17 = 210;
        goto LABEL_56;
      case 1634:
        v9->_assetCollectionType = 2;
        v16 = 1000000212;
        break;
      case 1636:
        v9->_assetCollectionType = 2;
        v16 = 1000000214;
        break;
      case 1639:
        v9->_assetCollectionType = 2;
        v16 = 219;
        break;
      case 1640:
        v9->_assetCollectionType = 2;
        v16 = 1000000218;
        break;
      case 1641:
        v9->_assetCollectionType = 2;
        v17 = 218;
LABEL_56:
        v16 = v17 | 0x3B9ACA01;
        break;
      default:
        if (plAlbumKind == 1550)
        {
          v9->_assetCollectionType = 1;
          v16 = 5;
        }
        else
        {
          if (plAlbumKind != 1551)
            goto LABEL_58;
          v9->_assetCollectionType = 1;
          v16 = 3;
        }
        break;
    }
  }
  v9->_assetCollectionSubtype = v16;
LABEL_58:
  if (v9->_assetCollectionType == 2)
  {
    v9->_approximateCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_approximatePhotosCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_approximateVideosCount = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cachedCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_approximateCount = objc_msgSend(v18, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cachedPhotosCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_approximatePhotosCount = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cachedVideosCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_approximateVideosCount = objc_msgSend(v20, "unsignedIntegerValue");

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pendingItemsCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_pendingItemsCount = objc_msgSend(v21, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pendingItemsType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_pendingItemsType = objc_msgSend(v22, "intValue");

  if (-[PHAssetCollection plAlbumKind](v9, "plAlbumKind") != 1500)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v23 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v23;

  }
  localizedLocationNames = v9->_localizedLocationNames;
  v9->_localizedLocationNames = (NSArray *)MEMORY[0x1E0C9AA60];

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("userQueryData"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A38], "constructQueryFromData:", v26);
  v27 = objc_claimAutoreleasedReturnValue();
  userQuery = v9->_userQuery;
  v9->_userQuery = (PLQuery *)v27;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parentFolder"));
  v29 = objc_claimAutoreleasedReturnValue();
  parentFolderObjectID = v9->_parentFolderObjectID;
  v9->_parentFolderObjectID = (NSManagedObjectID *)v29;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startDate"));
  v31 = objc_claimAutoreleasedReturnValue();
  startDate = v9->_startDate;
  v9->_startDate = (NSDate *)v31;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
  v33 = objc_claimAutoreleasedReturnValue();
  endDate = v9->_endDate;
  v9->_endDate = (NSDate *)v33;

  v9->_datesLock._os_unfair_lock_opaque = 0;
  v9->_datesLock_didFetchDates = 0;
  datesLock_fetchedStartDate = v9->_datesLock_fetchedStartDate;
  v9->_datesLock_fetchedStartDate = 0;

  datesLock_fetchedEndDate = v9->_datesLock_fetchedEndDate;
  v9->_datesLock_fetchedEndDate = 0;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("privacyState"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_privacyState = (int)objc_msgSend(v37, "intValue");

LABEL_64:
  return v9;
}

- (int)plAlbumKind
{
  return self->_plAlbumKind;
}

- (id)identifier
{
  NSString *transientIdentifier;
  objc_super v4;

  transientIdentifier = self->_transientIdentifier;
  if (transientIdentifier)
    return transientIdentifier;
  v4.receiver = self;
  v4.super_class = (Class)PHAssetCollection;
  -[PHObject identifier](&v4, sel_identifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (PHAssetCollectionType)assetCollectionType
{
  return self->_assetCollectionType;
}

- (BOOL)isUserSmartAlbum
{
  return self->_assetCollectionSubtype == 1000000204;
}

- (NSDate)startDate
{
  NSDate *v3;

  if (-[PHAssetCollection _shouldFetchDatesIfNeeded](self, "_shouldFetchDatesIfNeeded"))
  {
    -[PHAssetCollection _fetchedStartDate](self, "_fetchedStartDate");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_startDate;
  }
  return v3;
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

  if (propertiesToFetchWithHint__onceToken_3986 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_3986, &__block_literal_global_53);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3754;
  v9 = __Block_byref_object_dispose__3755;
  v10 = 0;
  pl_dispatch_sync();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71778], "entityName");
}

+ (PHFetchResult)fetchAssetCollectionsWithType:(PHAssetCollectionType)type subtype:(PHAssetCollectionSubtype)subtype options:(PHFetchOptions *)options
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PHAssetCollection_fetchAssetCollectionsWithType_subtype_options___block_invoke;
  v6[3] = &__block_descriptor_48_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6[4] = type;
  v6[5] = subtype;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v6);
  return (PHFetchResult *)(id)objc_claimAutoreleasedReturnValue();
}

id __67__PHAssetCollection_fetchAssetCollectionsWithType_subtype_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setChunkSizeForFetch:", 2000);
  +[PHQuery queryForAssetCollectionsWithType:subtype:options:](PHQuery, "queryForAssetCollectionsWithType:subtype:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)alwaysRecalculateCounts
{
  _BOOL4 v3;

  v3 = -[PHObject isTransient](self, "isTransient");
  if (v3)
    LOBYTE(v3) = self->_query != 0;
  return v3;
}

- (unint64_t)estimatedVideosCount
{
  return self->_approximateVideosCount;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_approximatePhotosCount;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

void __47__PHAssetCollection_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint;
  propertiesToFetchWithHint__propertiesToFetchByHint = v0;

  v2 = dispatch_queue_create("com.apple.photos.assetcollectionpropertyhints", 0);
  v3 = (void *)propertiesToFetchWithHint__propertyQueue;
  propertiesToFetchWithHint__propertyQueue = (uint64_t)v2;

}

- (NSUInteger)estimatedAssetCount
{
  return self->_approximateCount;
}

- (BOOL)keyAssetsAtEnd
{
  if (-[PHObject isTransient](self, "isTransient"))
    return self->_transientKeyAssetsAtEnd;
  else
    return objc_msgSend((id)objc_opt_class(), "_defaultKeyAssetsAtEndForType:subtype:", -[PHAssetCollection assetCollectionType](self, "assetCollectionType"), -[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype"));
}

- (PHAssetCollectionSubtype)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "identifierPropertiesToFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  if ((v3 & 2) != 0)
  {
    objc_msgSend(a1, "corePropertiesToFetch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  return v5;
}

+ (id)corePropertiesToFetch
{
  pl_dispatch_once();
  return (id)corePropertiesToFetch_pl_once_object_15;
}

- (NSDate)endDate
{
  NSDate *v3;

  if (-[PHAssetCollection _shouldFetchDatesIfNeeded](self, "_shouldFetchDatesIfNeeded"))
  {
    -[PHAssetCollection _fetchedEndDate](self, "_fetchedEndDate");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_endDate;
  }
  return v3;
}

void __42__PHAssetCollection_corePropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[18];

  v3[17] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cloudGUID");
  v3[1] = CFSTR("cachedCount");
  v3[2] = CFSTR("cachedPhotosCount");
  v3[3] = CFSTR("cachedVideosCount");
  v3[4] = CFSTR("customSortAscending");
  v3[5] = CFSTR("customSortKey");
  v3[6] = CFSTR("importSessionID");
  v3[7] = CFSTR("kind");
  v3[8] = CFSTR("pendingItemsCount");
  v3[9] = CFSTR("pendingItemsType");
  v3[10] = CFSTR("trashedState");
  v3[11] = CFSTR("title");
  v3[12] = CFSTR("userQueryData");
  v3[13] = CFSTR("parentFolder");
  v3[14] = CFSTR("startDate");
  v3[15] = CFSTR("endDate");
  v3[16] = CFSTR("privacyState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 17);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)corePropertiesToFetch_pl_once_object_15;
  corePropertiesToFetch_pl_once_object_15 = v1;

}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (id)localizedTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[PHAssetCollection title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D71778];
    v5 = -[PHAssetCollection plAlbumKind](self, "plAlbumKind");
    -[PHObject photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedTitleForAlbumKind:cplEnabled:", v5, objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)localizedSubtitle
{
  void *v3;
  objc_super v5;

  -[PHAssetCollection transientSubtitle](self, "transientSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PHAssetCollection;
    -[PHCollection localizedSubtitle](&v5, sel_localizedSubtitle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)titleCategory
{
  return 0;
}

- (BOOL)_shouldFetchDatesIfNeeded
{
  return 0;
}

- (id)_fetchAggregateDatesForSmartAlbum
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  PHAssetCollection *v31;
  uint64_t *v32;
  SEL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[2];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  PHAssetCollection *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (-[PHObject isTransient](self, "isTransient")
    && (-[PHAssetCollection query](self, "query"), v4 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v4,
                                                   v4))
  {
    -[PHAssetCollection query](self, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3754;
  v38 = __Block_byref_object_dispose__3755;
  v39 = (id)MEMORY[0x1E0C9AA70];
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(v6, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v12);

    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("@min.%K"), CFSTR("dateCreated"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v14, "setName:", CFSTR("startDate"));
    objc_msgSend(v14, "setExpression:", v13);
    objc_msgSend(v14, "setExpressionResultType:", 900);
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("@max.%K"), CFSTR("dateCreated"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v16, "setName:", CFSTR("endDate"));
    objc_msgSend(v16, "setExpression:", v15);
    objc_msgSend(v16, "setExpressionResultType:", 900);
    objc_msgSend(v11, "setResultType:", 2);
    v40[0] = v14;
    v40[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPropertiesToFetch:", v17);

    -[PHObject photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "managedObjectContextForCurrentQueueQoS");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __54__PHAssetCollection__fetchAggregateDatesForSmartAlbum__block_invoke;
    v28[3] = &unk_1E35D92F8;
    v20 = v19;
    v29 = v20;
    v21 = v11;
    v32 = &v34;
    v33 = a2;
    v30 = v21;
    v31 = self;
    objc_msgSend(v20, "performBlockAndWait:", v28);

  }
  else
  {
    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = -[PHObject isTransient](self, "isTransient");
      -[PHAssetCollection query](self, "query");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v42 = 0;
      v43 = 2112;
      if (v22)
        v25 = CFSTR("YES");
      v44 = self;
      v45 = 2112;
      v46 = v25;
      v47 = 2112;
      v48 = v23;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "queryFetchRequest is nil. fetchRequest: %@ self : %@ isTransient : %@ query: %@", buf, 0x2Au);

    }
    v21 = 0;
  }

  v26 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v26;
}

- (id)_fetchedStartDate
{
  os_unfair_lock_s *p_datesLock;
  NSDate *datesLock_fetchedStartDate;
  NSDate *v5;

  p_datesLock = &self->_datesLock;
  os_unfair_lock_lock(&self->_datesLock);
  datesLock_fetchedStartDate = self->_datesLock_fetchedStartDate;
  if (!datesLock_fetchedStartDate)
  {
    -[PHAssetCollection _datesLock_fetchDatesIfNeeded](self, "_datesLock_fetchDatesIfNeeded");
    datesLock_fetchedStartDate = self->_datesLock_fetchedStartDate;
  }
  v5 = datesLock_fetchedStartDate;
  os_unfair_lock_unlock(p_datesLock);
  return v5;
}

- (id)_fetchedEndDate
{
  os_unfair_lock_s *p_datesLock;
  NSDate *datesLock_fetchedEndDate;
  NSDate *v5;

  p_datesLock = &self->_datesLock;
  os_unfair_lock_lock(&self->_datesLock);
  datesLock_fetchedEndDate = self->_datesLock_fetchedEndDate;
  if (!datesLock_fetchedEndDate)
  {
    -[PHAssetCollection _datesLock_fetchDatesIfNeeded](self, "_datesLock_fetchDatesIfNeeded");
    datesLock_fetchedEndDate = self->_datesLock_fetchedEndDate;
  }
  v5 = datesLock_fetchedEndDate;
  os_unfair_lock_unlock(p_datesLock);
  return v5;
}

- (void)_datesLock_fetchDatesIfNeeded
{
  NSDate *v3;
  NSDate *datesLock_fetchedStartDate;
  NSDate *v5;
  NSDate *datesLock_fetchedEndDate;
  id v7;

  os_unfair_lock_assert_owner(&self->_datesLock);
  if (!self->_datesLock_didFetchDates)
  {
    if (-[PHAssetCollection _shouldFetchDatesIfNeeded](self, "_shouldFetchDatesIfNeeded"))
    {
      self->_datesLock_didFetchDates = 1;
      -[PHAssetCollection _fetchAggregateDatesForSmartAlbum](self, "_fetchAggregateDatesForSmartAlbum");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("startDate"));
      v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
      datesLock_fetchedStartDate = self->_datesLock_fetchedStartDate;
      self->_datesLock_fetchedStartDate = v3;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("endDate"));
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
      datesLock_fetchedEndDate = self->_datesLock_fetchedEndDate;
      self->_datesLock_fetchedEndDate = v5;

    }
  }
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  return &stru_1E35DFFF8;
}

- (BOOL)collectionHasFixedOrder
{
  return objc_msgSend(MEMORY[0x1E0D71878], "albumKindHasFixedOrder:", -[PHAssetCollection plAlbumKind](self, "plAlbumKind"));
}

- (unint64_t)collectionFixedOrderPriority
{
  return objc_msgSend(MEMORY[0x1E0D71878], "priorityForAlbumKind:", -[PHAssetCollection plAlbumKind](self, "plAlbumKind"));
}

- (BOOL)isLastImportedAlbum
{
  return -[PHAssetCollection plAlbumKind](self, "plAlbumKind") == 1603;
}

- (BOOL)isTrashBin
{
  return self->_assetCollectionSubtype == 1000000201;
}

- (BOOL)isPlacesAlbum
{
  return -[PHAssetCollection plAlbumKind](self, "plAlbumKind") == 1619;
}

- (BOOL)isPrivacySensitiveAlbum
{
  int64_t assetCollectionSubtype;

  assetCollectionSubtype = self->_assetCollectionSubtype;
  if (assetCollectionSubtype == 205 || assetCollectionSubtype == 1000000201)
    return 1;
  return assetCollectionSubtype == 1000000219 || self->_privacyState == 1;
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
    objc_msgSend(MEMORY[0x1E0D71778], "sortDescriptorsForAssetsInAlbumWithSortKey:ascending:", v3, -[PHCollection customSortAscending](self, "customSortAscending"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isAlbumContentSort
{
  return 1;
}

- (BOOL)isAlbumContentTitleSort
{
  return -[PHCollection customSortKey](self, "customSortKey") == 101
      || -[PHCollection customSortKey](self, "customSortKey") == 5;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  int64_t assetCollectionType;
  BOOL result;
  int64_t assetCollectionSubtype;

  assetCollectionType = self->_assetCollectionType;
  if ((unint64_t)(assetCollectionType - 8) < 2)
    return a3 == 1;
  if (assetCollectionType != 1)
  {
    if (assetCollectionType != 2)
      return 0;
    if (self->_assetCollectionSubtype == 1000000204)
      return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
    return a3 == 1;
  }
  result = 0;
  assetCollectionSubtype = self->_assetCollectionSubtype;
  if (assetCollectionSubtype <= 99)
  {
    if (assetCollectionSubtype == 2)
      return 1;
    if (assetCollectionSubtype == 6)
      return a3 == 1;
  }
  else
  {
    if (assetCollectionSubtype == 100)
      return a3 == 1;
    if (assetCollectionSubtype == 1000000212 || assetCollectionSubtype == 1000000601)
      return a3 == 1;
  }
  return result;
}

- (BOOL)canContainAssets
{
  return 1;
}

- (BOOL)canShowAvalancheStacks
{
  int64_t assetCollectionSubtype;

  assetCollectionSubtype = self->_assetCollectionSubtype;
  return (unint64_t)(assetCollectionSubtype - 200) <= 9
      && ((1 << (assetCollectionSubtype + 56)) & 0x2C1) != 0
      || assetCollectionSubtype == 1000000201
      || assetCollectionSubtype == 1000000205;
}

- (BOOL)canShowComments
{
  int64_t assetCollectionSubtype;
  BOOL result;

  assetCollectionSubtype = self->_assetCollectionSubtype;
  result = -[PHAssetCollection _canShowCloudComments](self, "_canShowCloudComments");
  if (assetCollectionSubtype == 101)
    return 1;
  return result;
}

- (BOOL)canContainCustomKeyAssets
{
  return objc_msgSend(MEMORY[0x1E0D71778], "supportsCustomKeyAssetWithAlbumKind:", -[PHAssetCollection plAlbumKind](self, "plAlbumKind"));
}

- (BOOL)hasLocationInfo
{
  void *v2;
  BOOL v3;

  -[PHAssetCollection localizedLocationNames](self, "localizedLocationNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)containsPrivateContent
{
  int v2;

  v2 = -[PHAssetCollection isPrivacySensitiveAlbum](self, "isPrivacySensitiveAlbum");
  if (v2)
    LOBYTE(v2) = PLIsContentPrivacyEnabled();
  return v2;
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6
{
  return -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:albumKind:](self, "initTransientWithAssets:orFetchResult:title:identifier:albumKind:", a3, a4, a5, a6, 2);
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6 albumKind:(int)a7
{
  return -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:albumKind:subtype:](self, "initTransientWithAssets:orFetchResult:title:identifier:albumKind:subtype:", a3, a4, a5, a6, *(_QWORD *)&a7, 200);
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6 albumKind:(int)a7 subtype:(int64_t)a8
{
  uint64_t v9;

  LODWORD(v9) = a7;
  return -[PHAssetCollection initTransientWithAssets:orFetchResult:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:](self, "initTransientWithAssets:orFetchResult:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:", a3, a4, a5, 0, 0, a6, v9, a8, 0);
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 subtitle:(id)a6 titleFontName:(id)a7 identifier:(id)a8 albumKind:(int)a9 subtype:(int64_t)a10 photoLibrary:(id)a11
{
  uint64_t v12;

  LODWORD(v12) = a9;
  return -[PHAssetCollection initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:](self, "initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:", a3, a4, 0, a5, a6, a7, a8, v12, a10, a11);
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 albumKind:(int)a10 subtype:(int64_t)a11 photoLibrary:(id)a12
{
  uint64_t v13;

  LODWORD(v13) = a10;
  return -[PHAssetCollection initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:startDate:endDate:photoLibrary:](self, "initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:startDate:endDate:photoLibrary:", a3, a4, a5, a6, a7, a8, a9, v13, a11, 0, 0, a12);
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 albumKind:(int)a10 subtype:(int64_t)a11 startDate:(id)a12 endDate:(id)a13 photoLibrary:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;
  id v26;
  id v27;
  id v29;
  id v30;
  id v32;
  id v33;

  v32 = a14;
  v30 = a13;
  v19 = a12;
  v27 = a9;
  v29 = a8;
  v26 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  HIDWORD(v25) = a10;
  LOBYTE(v25) = objc_msgSend((id)objc_opt_class(), "_defaultKeyAssetsAtEndForType:subtype:", 2, a11);
  v33 = -[PHAssetCollection _initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:](self, "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", v23, v22, v21, v20, v26, v29, v27, v25, 2, a11, v19, v30, v32);

  return v33;
}

- (id)_initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 keyAssetsAtEnd:(BOOL)a10 albumKind:(int)a11 type:(int64_t)a12 subtype:(int64_t)a13 startDate:(id)a14 endDate:(id)a15 photoLibrary:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  PHAssetCollection *v49;
  uint64_t v50;
  PHQuery *query;
  uint64_t v52;
  void *assetOids;
  uint64_t v54;
  NSArray *v55;
  uint64_t v56;
  NSArray *assets;
  uint64_t v58;
  NSString *transientIdentifier;
  uint64_t v60;
  NSString *transientSubtitle;
  uint64_t v62;
  NSString *titleFontName;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  char v71;
  unint64_t *p_approximatePhotosCount;
  int v73;
  void *v75;
  uint64_t v76;
  const __CFString *v77;
  id v78;
  id obj;
  id v80;
  void *v81;
  void *v82;
  void *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v89 = a6;
  v88 = a7;
  v24 = a8;
  v25 = v22;
  v86 = a9;
  v26 = a14;
  v85 = a15;
  v90 = a16;
  objc_msgSend(v25, "query");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (void *)v27;
  else
    v29 = v23;
  v30 = v29;

  v84 = v23;
  v87 = v24;
  if (v30)
  {
    objc_msgSend(v30, "fetchType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("PHAsset"));

    if (v32)
    {
      v33 = v25 != 0;
      goto LABEL_12;
    }
LABEL_56:
    v75 = (void *)MEMORY[0x1E0C99DA0];
    v76 = *MEMORY[0x1E0C99778];
    v77 = CFSTR("The fetch result must return PHAsset objects");
LABEL_57:
    objc_msgSend(v75, "exceptionWithName:reason:userInfo:", v76, v77, 0);
    v78 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v78);
  }
  if (v25)
  {
    objc_msgSend(v25, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_56;
    }
    objc_msgSend(v25, "fetchedObjects");
    v35 = objc_claimAutoreleasedReturnValue();

    v33 = 1;
    v21 = (id)v35;
  }
  else
  {
    v33 = 0;
  }
LABEL_12:
  v91 = v30;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, CFSTR("kind"));

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "UUIDString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, CFSTR("uuid"));

  v40 = v89;
  if (v89)
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v89, CFSTR("title"));
  objc_msgSend(v21, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v42 = v90;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v41, "photoLibrary"), (v43 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v25, "photoLibrary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      v46 = v44;
    }
    else
    {
      objc_msgSend(v91, "photoLibrary");
      v46 = (id)objc_claimAutoreleasedReturnValue();
    }
    v43 = v46;

  }
  if (v90 && v43 && v43 != v90)
  {
    v75 = (void *)MEMORY[0x1E0C99DA0];
    v76 = *MEMORY[0x1E0C99778];
    v77 = CFSTR("The photoLibrary parameter doesn't match the library associated with the assets or fetch result");
    goto LABEL_57;
  }
  v47 = v43;
  v81 = v47;
  if (!v43)
  {
    v48 = v90;
    if (!v90)
    {
      +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
      v48 = (id)objc_claimAutoreleasedReturnValue();
    }
    v47 = v48;
  }
  v82 = v41;
  v49 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](self, "initWithFetchDictionary:propertyHint:photoLibrary:", v36, 2, v47);
  if (v49)
  {
    v50 = objc_msgSend(v91, "copy");
    query = v49->_query;
    v49->_query = (PHQuery *)v50;

    if (!v91)
    {
      if (v33)
      {
        objc_msgSend(v25, "fetchedObjectIDs");
        v52 = objc_claimAutoreleasedReturnValue();
        assetOids = v49->_assetOids;
        v49->_assetOids = (NSArray *)v52;
LABEL_33:

        goto LABEL_34;
      }
      if (v21)
      {
        NSStringFromSelector(sel_objectID);
        assetOids = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "valueForKey:", assetOids);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v49->_assetOids;
        v49->_assetOids = (NSArray *)v54;

        goto LABEL_33;
      }
    }
LABEL_34:
    v56 = objc_msgSend(v21, "copy");
    assets = v49->_assets;
    v49->_assets = (NSArray *)v56;

    v58 = objc_msgSend(v86, "copy");
    transientIdentifier = v49->_transientIdentifier;
    v49->_transientIdentifier = (NSString *)v58;

    v60 = objc_msgSend(v88, "copy");
    transientSubtitle = v49->_transientSubtitle;
    v49->_transientSubtitle = (NSString *)v60;

    if (v87)
    {
      v62 = objc_msgSend(v87, "copy");
      titleFontName = v49->_titleFontName;
      v49->_titleFontName = (NSString *)v62;

    }
    v49->_transientKeyAssetsAtEnd = a10;
    v49->_assetCollectionType = a12;
    v49->_assetCollectionSubtype = a13;
    if (v26 && v85)
    {
      objc_storeStrong((id *)&v49->_startDate, a14);
      objc_storeStrong((id *)&v49->_endDate, a15);
    }
    v42 = v90;
    if (v49->_query)
    {
      v64 = 0x7FFFFFFFFFFFFFFFLL;
      if (v33)
        v64 = objc_msgSend(v25, "count");
      v49->_approximateCount = v64;
      v49->_approximatePhotosCount = 0x7FFFFFFFFFFFFFFFLL;
      v49->_approximateVideosCount = 0x7FFFFFFFFFFFFFFFLL;
      v40 = v89;
    }
    else
    {
      obj = v25;
      v49->_approximateCount = objc_msgSend(v21, "count");
      v49->_approximatePhotosCount = 0;
      v49->_approximateVideosCount = 0;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v80 = v21;
      v65 = v21;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v93;
        do
        {
          for (i = 0; i != v67; ++i)
          {
            if (*(_QWORD *)v93 != v68)
              objc_enumerationMutation(v65);
            v70 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
            v71 = objc_msgSend(v70, "isPhoto");
            p_approximatePhotosCount = &v49->_approximatePhotosCount;
            if ((v71 & 1) == 0)
            {
              v73 = objc_msgSend(v70, "isVideo");
              p_approximatePhotosCount = &v49->_approximateVideosCount;
              if (!v73)
                continue;
            }
            ++*p_approximatePhotosCount;
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
        }
        while (v67);
      }

      v25 = obj;
      v21 = v80;
      v40 = v89;
      v42 = v90;
    }
  }

  return v49;
}

- (NSString)titleFontName
{
  NSString *titleFontName;
  NSString *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  titleFontName = self->_titleFontName;
  if (!titleFontName)
  {
    objc_msgSend((id)objc_opt_class(), "titleFontNameForTitleCategory:", -[PHAssetCollection titleCategory](self, "titleCategory"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_titleFontName;
    self->_titleFontName = v4;

    titleFontName = self->_titleFontName;
    if (!titleFontName)
    {
      objc_msgSend((id)objc_opt_class(), "defaultTitleFontNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", -[PHAssetCollection titleFontNameHash](self, "titleFontNameHash") % objc_msgSend(v6, "count"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_titleFontName;
      self->_titleFontName = v7;

      titleFontName = self->_titleFontName;
    }
  }
  return titleFontName;
}

- (unint64_t)titleFontNameHash
{
  void *v3;
  PHAssetCollectionSubtype v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!-[PHAssetCollection _shouldFetchDatesIfNeeded](self, "_shouldFetchDatesIfNeeded"))
  {
    -[PHAssetCollection startDate](self, "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_8;
  }
  -[PHCollection creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_8;
  if (-[PHAssetCollection assetCollectionType](self, "assetCollectionType") != PHAssetCollectionTypeSmartAlbum)
  {
    +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v7);

    objc_msgSend(v5, "setFetchLimit:", 1);
    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "creationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v4 = -[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype");
  if (!v4)
  {
    v3 = 0;
LABEL_8:
    v4 = +[PHAssetCollection titleFontNameHashFromDate:](PHAssetCollection, "titleFontNameHashFromDate:", v3);

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAssetCollection;
  -[PHCollection description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" assetCollectionType=%ld/%ld"), -[PHAssetCollection assetCollectionType](self, "assetCollectionType"), -[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PHQuery)query
{
  return self->_query;
}

- (CLLocation)approximateLocation
{
  return self->_approximateLocation;
}

- (NSArray)localizedLocationNames
{
  return self->_localizedLocationNames;
}

- (BOOL)_canShowCloudComments
{
  return self->_canShowCloudComments;
}

- (void)_setCanShowCloudComments:(BOOL)a3
{
  self->_canShowCloudComments = a3;
}

- (PLQuery)userQuery
{
  return self->_userQuery;
}

- (void)setUserQuery:(id)a3
{
  objc_storeStrong((id *)&self->_userQuery, a3);
}

- (NSString)transientSubtitle
{
  return self->_transientSubtitle;
}

- (BOOL)transientKeyAssetsAtEnd
{
  return self->_transientKeyAssetsAtEnd;
}

- (NSArray)assetOids
{
  return self->_assetOids;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPendingPhotoStreamAlbum
{
  return self->_isPendingPhotoStreamAlbum;
}

- (BOOL)shouldDeleteWhenEmpty
{
  return self->_shouldDeleteWhenEmpty;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (unint64_t)approximateCount
{
  return self->_approximateCount;
}

- (unint64_t)approximatePhotosCount
{
  return self->_approximatePhotosCount;
}

- (unint64_t)approximateVideosCount
{
  return self->_approximateVideosCount;
}

- (BOOL)isLibrary
{
  return self->_isLibrary;
}

- (BOOL)isCameraRoll
{
  return self->_isCameraRoll;
}

- (BOOL)isPanoramasCollection
{
  return self->_isPanoramasCollection;
}

- (BOOL)isPhotoStreamCollection
{
  return self->_isPhotoStreamCollection;
}

- (BOOL)isCloudSharedAlbum
{
  return self->_isCloudSharedAlbum;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  return self->_isOwnedCloudSharedAlbum;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  return self->_isMultipleContributorCloudSharedAlbum;
}

- (int64_t)privacyState
{
  return self->_privacyState;
}

- (BOOL)isSmartCollection
{
  return self->_isSmartCollection;
}

- (NSURL)groupURL
{
  return self->_groupURL;
}

- (id)sortingComparator
{
  return self->_sortingComparator;
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (int)pendingItemsCount
{
  return self->_pendingItemsCount;
}

- (int)pendingItemsType
{
  return self->_pendingItemsType;
}

- (BOOL)hasUnseenContentBoolValue
{
  return self->_hasUnseenContentBoolValue;
}

- (BOOL)canContributeToCloudSharedAlbum
{
  return self->_canContributeToCloudSharedAlbum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong(&self->_sortingComparator, 0);
  objc_storeStrong((id *)&self->_groupURL, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetOids, 0);
  objc_storeStrong((id *)&self->_transientSubtitle, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
  objc_storeStrong((id *)&self->_datesLock_fetchedEndDate, 0);
  objc_storeStrong((id *)&self->_datesLock_fetchedStartDate, 0);
  objc_storeStrong((id *)&self->_parentFolderObjectID, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_localizedLocationNames, 0);
  objc_storeStrong((id *)&self->_approximateLocation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

void __54__PHAssetCollection__fetchAggregateDatesForSmartAlbum__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v4, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "%@ failed to fetch aggregate dates for %@ %@", buf, 0x20u);

    }
  }

}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHAssetCollection");
  return CFSTR("PHAssetCollection");
}

+ (id)identifierCode
{
  return CFSTR("040");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_16;
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
  block[2] = __57__PHAssetCollection_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_3971 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_3971, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_3972, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (BOOL)_defaultKeyAssetsAtEndForType:(int64_t)a3 subtype:(int64_t)a4
{
  BOOL v4;
  BOOL v5;

  v4 = a4 != 200;
  v5 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 100;
  if (a3 != 1)
    v5 = 0;
  if (a3 != 2)
    v4 = v5;
  return a3 == 9 || v4;
}

+ (id)fetchAllTripHighlightsContainingAssetsWithUUIDs:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForAllTripHighlightsContainingAssetUUIDs:options:](PHQuery, "queryForAllTripHighlightsContainingAssetUUIDs:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (PHFetchResult)fetchAssetCollectionsContainingAsset:(PHAsset *)asset withType:(PHAssetCollectionType)type options:(PHFetchOptions *)options
{
  void *v5;
  void *v6;

  if (asset)
  {
    +[PHQuery queryForAssetCollectionsContainingAsset:withType:options:](PHQuery, "queryForAssetCollectionsContainingAsset:withType:options:", asset, type, options);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (PHFetchResult *)v6;
}

+ (id)fetchAssetCollectionsContainingAssets:(id)a3 withType:(int64_t)a4 options:(id)a5
{
  void *v5;
  void *v6;

  if (a3)
  {
    +[PHQuery queryForAssetCollectionsContainingAssets:withType:options:](PHQuery, "queryForAssetCollectionsContainingAssets:withType:options:", a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)fetchAssetCollectionsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PHAssetCollection_fetchAssetCollectionsWithType_localIdentifiers_options___block_invoke;
  v11[3] = &unk_1E35D6868;
  v12 = v7;
  v13 = a3;
  v8 = v7;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (PHFetchResult)fetchAssetCollectionsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options
{
  NSArray *v5;
  NSArray *v6;
  void *v7;
  _QWORD v9[4];
  NSArray *v10;

  v5 = identifiers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PHAssetCollection_fetchAssetCollectionsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v7;
}

+ (PHFetchResult)fetchAssetCollectionsWithALAssetGroupURLs:(NSArray *)assetGroupURLs options:(PHFetchOptions *)options
{
  NSArray *v5;
  PHFetchOptions *v6;
  PHFetchResult *v7;
  _QWORD v9[4];
  NSArray *v10;

  v5 = assetGroupURLs;
  v6 = options;
  if (!-[NSArray count](v5, "count"))
    goto LABEL_3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PHAssetCollection_fetchAssetCollectionsWithALAssetGroupURLs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v9);
  v7 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  if (!v7)
LABEL_3:
    v7 = objc_alloc_init(PHFetchResult);

  return v7;
}

+ (id)fetchAssetCollectionsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PHAssetCollection_fetchAssetCollectionsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchUserLibraryAlbumWithOptions:(id)a3
{
  return (id)objc_msgSend(a1, "fetchAssetCollectionsWithType:subtype:options:", 2, 209, a3);
}

+ (id)fetchRecentContentSyndicationAssetCollectionsWithOptions:(id)a3 maxNumberOfStacks:(int64_t)a4 maxNumberOfAssetsPerStack:(int64_t)a5
{
  id v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t j;
  uint64_t v33;
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
  PHRecentContentSyndicationCollectionsResult *v44;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  id obj;
  uint64_t v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  const __CFString *v74;
  void *v75;
  _QWORD v76[2];
  _QWORD v77[5];

  v77[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v56 = a4;
  v8 = a5 * a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v7;
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset filterPredicateToExcludeNoSyndicationAssets](PHAsset, "filterPredicateToExcludeNoSyndicationAssets");
  v10 = objc_claimAutoreleasedReturnValue();
  +[PHAsset filterPredicateToIncludeOnlyReceivedSyndicatedAssets](PHAsset, "filterPredicateToIncludeOnlyReceivedSyndicatedAssets");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalPredicate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v50 = (void *)v10;
  if (v12)
  {
    v14 = (void *)v12;
    v77[0] = v12;
    v77[1] = v10;
    v77[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76[0] = v10;
    v76[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v11;

  v48 = (void *)v16;
  objc_msgSend(v9, "setInternalPredicate:", v16);
  if (v8 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInternalSortDescriptors:", v18);

  }
  v74 = CFSTR("PHAssetPropertySetCuration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFetchPropertySets:", v19);

  objc_msgSend(v9, "setFetchLimit:", v8);
  v52 = v9;
  +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", v9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "executeQuery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v56);
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v56);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  v55 = v22;
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v69 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v27, "curationProperties");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "syndicationIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        PLSearchableIdentifierFromMessagesSyndicationID();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v61, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
LABEL_13:
            if (objc_msgSend(v31, "count") < (unint64_t)a5)
              objc_msgSend(v31, "addObject:", v27);
          }
          else if (objc_msgSend(v61, "count") >= v56)
          {
            v31 = 0;
            v22 = v55;
          }
          else
          {
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a5);
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v31, v30);
            objc_msgSend(v21, "addObject:", v30);
            v22 = v55;
            if (v31)
              goto LABEL_13;
          }

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v24);
  }
  v51 = a5;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v21;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v60)
  {
    v58 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v65 != v58)
          objc_enumerationMutation(obj);
        v33 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PLSearchableUniqueIdentifierHashFromSearchableIdentifier());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringValue");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v61, "objectForKeyedSubscript:", v33);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "allObjects");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_106_3966);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "lastObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "curationProperties");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addedDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "curationProperties");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addedDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAssetCollection transientAssetCollectionWithAssets:subtype:identifier:startDate:endDate:title:](PHAssetCollection, "transientAssetCollectionWithAssets:subtype:identifier:startDate:endDate:title:", v36, 1000000501, v62, v40, v42, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v59, "addObject:", v43);
      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v60);
  }

  LOBYTE(v46) = 1;
  v44 = -[PHRecentContentSyndicationCollectionsResult initWithObjects:photoLibrary:fetchOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:fetchType:fetchPropertySets:identifier:registerIfNeeded:]([PHRecentContentSyndicationCollectionsResult alloc], "initWithObjects:photoLibrary:fetchOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v59, v53, v52, v56, v51, CFSTR("PHAssetCollection"), 0, 0, v46);

  return v44;
}

+ (id)fetchSuggestedContributionsForAssetsFetchResult:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "assetsMetadataFromAssets:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchSuggestedContributionsForAssetsMetadata:options:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)assetsMetadataFromAssets:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double latitude;
  double longitude;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CLLocationCoordinate2D v34;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0x1E0C99000uLL;
    v7 = *(_QWORD *)v29;
    v8 = CFSTR("PHSuggestedContributionsAssetsMetadataCreationDateKey");
    do
    {
      v9 = 0;
      v25 = v5;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        objc_msgSend(*(id *)(v6 + 3592), "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "coordinate");
          latitude = v34.latitude;
          longitude = v34.longitude;
          if (CLLocationCoordinate2DIsValid(v34))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", latitude);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("PHSuggestedContributionsAssetsMetadataLatitudeKey"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", longitude);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("PHSuggestedContributionsAssetsMetadataLongitudeKey"));

            v18 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "coarseLocationProperties");
            v19 = v8;
            v20 = v6;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "gpsHorizontalAccuracy");
            objc_msgSend(v18, "numberWithDouble:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("PHSuggestedContributionsAssetsMetadataHorizontalAccuracyKey"));

            v6 = v20;
            v8 = v19;
            v5 = v25;
          }
        }
        objc_msgSend(v10, "creationDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v8);
        objc_msgSend(v27, "addObject:", v11);

        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  return v27;
}

+ (id)fetchSuggestedContributionsForFileURLs:(id)a3 options:(id)a4
{
  id v6;
  PHValidator *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  BOOL v13;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  id v17;
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
  double v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v34;
  id obj;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PHValidator);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v6;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v39)
  {
    v34 = a1;
    v8 = 0;
    v38 = *(_QWORD *)v44;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v9);
        v42 = v8;
        v11 = -[PHValidator validateURL:withOptions:error:](v7, "validateURL:withOptions:error:", v10, 16, &v42);
        v12 = v42;

        if (v11)
        {
          v8 = v12;
LABEL_11:
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = objc_alloc(MEMORY[0x1E0D75140]);
          objc_msgSend(v37, "photoLibrary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "photoLibraryBundle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeZoneLookup");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v17, "initWithMediaURL:timeZoneLookup:", v10, v20);

          objc_msgSend(v21, "utcCreationDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v22, CFSTR("PHSuggestedContributionsAssetsMetadataCreationDateKey"));
          objc_msgSend(v21, "gpsLocation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "coordinate");
            objc_msgSend(v25, "numberWithDouble:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v26, CFSTR("PHSuggestedContributionsAssetsMetadataLatitudeKey"));

            v27 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v24, "coordinate");
            objc_msgSend(v27, "numberWithDouble:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v29, CFSTR("PHSuggestedContributionsAssetsMetadataLongitudeKey"));

          }
          if (-[NSObject count](v16, "count"))
          {
            objc_msgSend(v36, "addObject:", v16);
          }
          else
          {
            PLPhotoKitGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v10;
              _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEFAULT, "+[PHAssetCollection() fetchSuggestedContributionsForFileURLs:options:]: No metadata (date or location) found for asset at url: %@", buf, 0xCu);
            }

          }
          goto LABEL_21;
        }
        v41 = v12;
        v13 = -[PHValidator validateURL:withOptions:error:](v7, "validateURL:withOptions:error:", v10, 32, &v41);
        v14 = v41;

        if (v13)
        {
          v8 = v14;
          goto LABEL_11;
        }
        v40 = v14;
        v15 = -[PHValidator validateURL:withOptions:error:](v7, "validateURL:withOptions:error:", v10, 64, &v40);
        v8 = v40;

        if (v15)
          goto LABEL_11;
        PLPhotoKitGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v10;
          _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "+[PHAssetCollection() fetchSuggestedContributionsForFileURLs:options:]: No valid asset for url: %@", buf, 0xCu);
        }
LABEL_21:

        ++v9;
      }
      while (v39 != v9);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      v39 = v31;
      if (!v31)
      {

        a1 = v34;
        break;
      }
    }
  }

  objc_msgSend(a1, "fetchSuggestedContributionsForAssetsMetadata:options:", v36, v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)fetchSuggestedContributionsForAssetsMetadata:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must specify a PHPhotoLibrary in the fetch options"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v8 = v7;
  objc_msgSend(v7, "photoAnalysisClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v9, "requestSuggestedContributionsForAssetsMetadata:error:", v5, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v11)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Can't request suggestion contributions for assets metadata %@: %@", buf, 0x16u);
    }

  }
  else if (objc_msgSend(v10, "count"))
  {
    +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v10, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v13 = 0;
LABEL_9:

  return v13;
}

+ (PHFetchResult)fetchMomentsInMomentList:(PHCollectionList *)momentList options:(PHFetchOptions *)options
{
  PHCollectionList *v5;
  PHFetchOptions *v6;
  PHFetchOptions *v7;
  void *v8;
  PHFetchOptions *v9;
  void *v10;
  void *v11;

  v5 = momentList;
  v6 = options;
  v7 = v6;
  if (v5)
  {
    if (!-[PHFetchOptions chunkSizeForFetch](v6, "chunkSizeForFetch"))
    {
      -[PHObject photoLibrary](v5, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v8);
      v9 = (PHFetchOptions *)objc_claimAutoreleasedReturnValue();

      -[PHFetchOptions setChunkSizeForFetch:](v9, "setChunkSizeForFetch:", 2000);
      v7 = v9;
    }
    +[PHQuery queryForMomentsInMomentList:options:](PHQuery, "queryForMomentsInMomentList:options:", v5, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "executeQuery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return (PHFetchResult *)v11;
}

+ (PHFetchResult)fetchMomentsWithOptions:(PHFetchOptions *)options
{
  return (PHFetchResult *)+[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, &__block_literal_global_121);
}

+ (id)fetchMomentsBackingMemory:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PHQuery queryForMomentsBackingMemory:](PHQuery, "queryForMomentsBackingMemory:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchOptions:", v5);

  objc_msgSend(v6, "executeQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchMomentsBackingSuggestion:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PHQuery queryForMomentsBackingSuggestion:](PHQuery, "queryForMomentsBackingSuggestion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchOptions:", v5);

  objc_msgSend(v6, "executeQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchPhotosHighlightsContainingMoments:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PHQuery queryForPhotosHighlightsContainingMoments:](PHQuery, "queryForPhotosHighlightsContainingMoments:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchOptions:", v5);

  objc_msgSend(v6, "executeQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchMomentsInHighlight:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PHQuery queryForMomentsInPhotosHighlight:](PHQuery, "queryForMomentsInPhotosHighlight:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchOptions:", v5);

  objc_msgSend(v6, "executeQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (PHAssetCollection)transientAssetCollectionWithAssets:(NSArray *)assets title:(NSString *)title
{
  NSString *v5;
  NSArray *v6;
  id v7;

  v5 = title;
  v6 = assets;
  v7 = -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:]([PHAssetCollection alloc], "initTransientWithAssets:orFetchResult:title:identifier:", v6, 0, v5, 0);

  return (PHAssetCollection *)v7;
}

+ (id)transientAssetCollectionWithAssets:(id)a3 subtype:(int64_t)a4 identifier:(id)a5 startDate:(id)a6 endDate:(id)a7 title:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v20;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  LODWORD(v20) = 2;
  v18 = -[PHAssetCollection initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:startDate:endDate:photoLibrary:]([PHAssetCollection alloc], "initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:startDate:endDate:photoLibrary:", v17, 0, 0, v13, 0, 0, v16, v20, a4, v15, v14, 0);

  return v18;
}

+ (id)transientAssetCollectionWithOptions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  void *v18;
  PHAssetCollection *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = objc_msgSend(v3, "subtype");
  v6 = objc_msgSend(v3, "keyAssetsPosition");
  v21 = v5;
  v22 = v4;
  if (v6 == 2)
  {
    v20 = 1;
  }
  else if (v6)
  {
    v20 = 0;
  }
  else
  {
    v20 = objc_msgSend((id)objc_opt_class(), "_defaultKeyAssetsAtEndForType:subtype:", v4, v5);
  }
  v19 = [PHAssetCollection alloc];
  objc_msgSend(v3, "fetchResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleFontName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v17) = 2;
  LOBYTE(v17) = v20;
  v15 = -[PHAssetCollection _initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:](v19, "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", 0, v18, v7, v8, v9, v10, v11, v17, v22, v21, v12, v13, v14);

  return v15;
}

+ (PHAssetCollection)transientAssetCollectionWithAssetFetchResult:(PHFetchResult *)fetchResult title:(NSString *)title
{
  NSString *v5;
  PHFetchResult *v6;
  id v7;

  v5 = title;
  v6 = fetchResult;
  v7 = -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:]([PHAssetCollection alloc], "initTransientWithAssets:orFetchResult:title:identifier:", 0, v6, v5, 0);

  return (PHAssetCollection *)v7;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtitle:(id)a5 identifier:(id)a6 startDate:(id)a7 endDate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  PHAssetCollection *v20;
  void *v21;
  id v22;
  uint64_t v24;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_msgSend((id)objc_opt_class(), "_defaultKeyAssetsAtEndForType:subtype:", 1, 2);
  v20 = [PHAssetCollection alloc];
  objc_msgSend(v18, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v24) = 2;
  LOBYTE(v24) = v19;
  v22 = -[PHAssetCollection _initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:](v20, "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", 0, v18, 0, v17, v16, 0, v15, v24, 1, 2, v14, v13, v21);

  return v22;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtitle:(id)a5 titleFontName:(id)a6
{
  return +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:type:subtype:title:subtitle:titleFontName:](PHAssetCollection, "transientAssetCollectionWithAssetFetchResult:type:subtype:title:subtitle:titleFontName:", a3, 2, 200, a4, a5, a6);
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 type:(int64_t)a4 subtype:(int64_t)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a3;
  HIDWORD(v19) = 2;
  LOBYTE(v19) = objc_msgSend((id)objc_opt_class(), "_defaultKeyAssetsAtEndForType:subtype:", a4, a5);
  v17 = -[PHAssetCollection _initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:]([PHAssetCollection alloc], "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", 0, v16, 0, v15, v14, v13, 0, v19, a4, a5, 0, 0, 0);

  return v17;
}

+ (id)transientAssetCollectionWithFetchOptions:(id)a3 title:(id)a4 subtitle:(id)a5 titleFontName:(id)a6 identifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 2;
  v16 = -[PHAssetCollection initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:]([PHAssetCollection alloc], "initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:", 0, 0, v15, v14, v13, v12, v11, v18, 200, 0);

  return v16;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 subtype:(int64_t)a4
{
  return +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:title:subtype:](PHAssetCollection, "transientAssetCollectionWithAssetFetchResult:title:subtype:", a3, 0, a4);
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtype:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:albumKind:subtype:]([PHAssetCollection alloc], "initTransientWithAssets:orFetchResult:title:identifier:albumKind:subtype:", 0, v8, v7, 0, 2, a5);

  return v9;
}

+ (id)transientAssetCollectionWithAssets:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  LODWORD(v15) = 2;
  v13 = -[PHAssetCollection initTransientWithAssets:orFetchResult:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:]([PHAssetCollection alloc], "initTransientWithAssets:orFetchResult:title:subtitle:titleFontName:identifier:albumKind:subtype:photoLibrary:", v12, 0, v11, 0, 0, v10, v15, 200, v9);

  return v13;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PHAssetCollection initTransientWithAssets:orFetchResult:title:identifier:]([PHAssetCollection alloc], "initTransientWithAssets:orFetchResult:title:identifier:", 0, v9, v8, v7);

  return v10;
}

+ (id)graphOptionsForTransientAssetCollection:(id)a3 needsCompleteMomentsInfo:(BOOL)a4 options:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _QWORD v54[3];

  v6 = a4;
  v54[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v8;
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = CFSTR("PHAssetPropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchPropertySets:", v12);

  objc_msgSend(v11, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v11, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v11, "setChunkSizeForFetch:", 2000);
  +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v7, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "localIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("PHPhotosGraphOptionAssetIdentifiers"));
  if (v6)
  {
    v21 = objc_msgSend(v7, "assetCollectionType");
    v22 = 0x1E0CB3000;
    if (v21 != 1)
    {
      v23 = v21;
      if (v21 == 3)
      {
        v26 = 1;
        goto LABEL_38;
      }
      if (v21 != 2 || objc_msgSend(v7, "assetCollectionSubtype") == 200)
      {
        objc_getAssociatedObject(v7, "phIsCompleteMoments");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v26 = objc_msgSend(v24, "BOOLValue");
LABEL_37:

          goto LABEL_38;
        }
        if (v23 == 4)
        {
          objc_msgSend(v7, "photosGraphProperties");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = v27;
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("info"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("sourceType"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              v42 = v28;
              if ((objc_msgSend(v30, "isEqualToString:", CFSTR("Moment")) & 1) != 0
                || (objc_msgSend(v30, "isEqualToString:", CFSTR("Contiguous Moments")) & 1) != 0)
              {
                v26 = 1;
              }
              else
              {
                v26 = objc_msgSend(v30, "isEqualToString:", CFSTR("Disjoint Moments")) ^ 1;
              }
LABEL_36:

              objc_msgSend(*(id *)(v22 + 2024), "numberWithBool:", v26);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setAssociatedObject(v7, "phIsCompleteMoments", v39, (void *)1);

              goto LABEL_37;
            }

          }
        }
        objc_msgSend(v15, "photoLibrary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v31, v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v42 = (void *)v33;
        +[PHAssetCollection fetchAssetCollectionsContainingAssets:withType:options:](PHAssetCollection, "fetchAssetCollectionsContainingAssets:withType:options:", v15, 3, v33);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v34)
        {
          v35 = v34;
          v36 = 0;
          v37 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v45 != v37)
                objc_enumerationMutation(v30);
              v36 += objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "estimatedAssetCount");
            }
            v35 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v35);
        }
        else
        {
          v36 = 0;
        }
        v26 = v36 == objc_msgSend(v15, "count");
        v22 = 0x1E0CB3000uLL;
        v25 = 0;
        goto LABEL_36;
      }
    }
    v26 = 0;
LABEL_38:
    objc_msgSend(*(id *)(v22 + 2024), "numberWithBool:", v26);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, CFSTR("PHPhotosGraphOptionIsCompleteMoments"));

  }
  return v9;
}

+ (NSArray)defaultTitleFontNames
{
  if (defaultTitleFontNames_onceToken != -1)
    dispatch_once(&defaultTitleFontNames_onceToken, &__block_literal_global_145);
  return (NSArray *)(id)defaultTitleFontNames_defaultTitleFontNames;
}

+ (id)titleFontNameForTitleCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return off_1E35D6910[a3 - 1];
}

+ (int64_t)titleCategoryForTitleFontName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Baskerville-Bold")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FaktSlabStencilPro-Medium")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rockwell-Bold")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BebasNeue")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AmericanTypewriter-Semibold")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR(".SFUIDisplay-Semibold")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (unint64_t)titleFontNameHashFromDate:(id)a3
{
  long double v3;

  objc_msgSend(a3, "timeIntervalSince1970");
  return (unint64_t)fmod(v3, 30240.0);
}

+ (unint64_t)titleFontNameHashFromString:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _WORD v12[30];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0x1E)
    v5 = 30;
  else
    v5 = v4;
  objc_msgSend(v3, "getCharacters:range:", v12, 0, v5);
  v6 = 0;
  v7 = 0;
  if (v5 >= 5)
  {
    v8 = 0;
    v6 = 0;
    do
    {
      v6 = 67503105 * v6
         + 16974593 * (unsigned __int16)v12[v8]
         + 66049 * (unsigned __int16)v12[v8 + 1]
         + 257 * (unsigned __int16)v12[v8 + 2]
         + (unsigned __int16)v12[v8 + 3];
      v9 = v8 + 8;
      v8 += 4;
    }
    while (v9 < v5);
    v7 = ((v5 - 5) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  v10 = v7 | 1;
  if ((v7 | 1) < v5)
  {
    do
    {
      v6 = 257 * v6 + (unsigned __int16)v12[v7];
      v7 = v10++;
    }
    while (v5 != v10);
  }

  return v6;
}

+ (unint64_t)titleFontNameHashFromHash:(unint64_t)a3 andHash:(unint64_t)a4
{
  return (3 * a3) ^ a4;
}

+ (id)assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  SEL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3754;
  v40 = __Block_byref_object_dispose__3755;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3754;
  v34 = __Block_byref_object_dispose__3755;
  v35 = 0;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(MEMORY[0x1E0D716F8], "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v13);

    objc_msgSend(v12, "setResultType:", 2);
    v42[0] = CFSTR("uuid");
    v42[1] = CFSTR("duplicateType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPropertiesToFetch:", v14);

    objc_msgSend(v9, "managedObjectContextForCurrentQueueQoS");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke;
    v24[3] = &unk_1E35DEEA0;
    v16 = v15;
    v25 = v16;
    v17 = v12;
    v26 = v17;
    v27 = &v30;
    v28 = &v36;
    v29 = a2;
    objc_msgSend(v16, "performBlockAndWait:", v24);

  }
  v18 = (void *)v31[5];
  v19 = v18;
  v20 = v19;
  if (v18)
    v21 = a5 == 0;
  else
    v21 = 1;
  if (!v21)
    *a5 = objc_retainAutorelease(v19);

  v22 = (id)v37[5];
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v22;
}

+ (id)fetchUtilityCollectionsWithOptions:(id)a3
{
  id v3;
  void *v4;
  unsigned __int16 v5;
  unsigned int v6;
  PHUtilityCollection *v7;
  PHManualFetchResult *v8;
  void *v9;
  PHManualFetchResult *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = -[PHUtilityCollection initWithType:fetchOptions:]([PHUtilityCollection alloc], "initWithType:fetchOptions:", v5, v3);
    if (v7)
      objc_msgSend(v4, "addObject:", v7);

    ++v5;
  }
  while (v6 < 5);
  v8 = [PHManualFetchResult alloc];
  objc_msgSend(v3, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v4, v9, 0, 0, 0, 0);

  return v10;
}

+ (id)fetchUtilityCollectionsWithType:(unsigned __int16)a3 options:(id)a4
{
  uint64_t v4;
  id v5;
  PHUtilityCollection *v6;
  PHManualFetchResult *v7;
  void *v8;
  void *v9;
  PHManualFetchResult *v10;
  _QWORD v12[2];

  v4 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[PHUtilityCollection initWithType:fetchOptions:]([PHUtilityCollection alloc], "initWithType:fetchOptions:", v4, v5);
  v7 = [PHManualFetchResult alloc];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v7, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v8, v9, 0, 0, 0, 0);
  return v10;
}

+ (id)descriptionForType:(int64_t)a3
{
  if ((unint64_t)a3 < 0xC)
    return off_1E35D6940[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unexpectedType_%li"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)descriptionForSubtype:(int64_t)a3
{
  __CFString *v3;
  id result;

  if (a3 > 1000000000)
  {
    if (a3 > 1000000300)
    {
      if (a3 > 1000000400)
      {
        if (a3 > 1000000600)
        {
          if (a3 == 1000000601)
            return CFSTR("duplicates");
          if (a3 == 0x7FFFFFFFFFFFFFFFLL)
            return CFSTR("any");
        }
        else
        {
          if (a3 == 1000000401)
            return CFSTR("screenSaverActivityCollection");
          if (a3 == 1000000501)
            return CFSTR("contentSyndication");
        }
LABEL_65:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unexpectedSubtype_%li"), a3);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v3;
      }
      else
      {
        switch(a3)
        {
          case 1000000301:
            result = CFSTR("photosHighlightDay");
            break;
          case 1000000302:
            result = CFSTR("photosHighlightMonth");
            break;
          case 1000000303:
            result = CFSTR("photosHighlightYear");
            break;
          case 1000000304:
            result = CFSTR("photosHighlightDayGroup");
            break;
          default:
            goto LABEL_65;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 1000000201:
          result = CFSTR("smartAlbumTrashBin");
          break;
        case 1000000202:
        case 1000000208:
        case 1000000209:
        case 1000000210:
        case 1000000213:
        case 1000000216:
        case 1000000217:
          goto LABEL_65;
        case 1000000203:
          result = CFSTR("smartAlbumPlaces");
          break;
        case 1000000204:
          result = CFSTR("smartAlbumUserSmartAlbum");
          break;
        case 1000000205:
          result = CFSTR("smartAlbumAllPhotos");
          break;
        case 1000000206:
          result = CFSTR("smartAlbumRecentlyEdited");
          break;
        case 1000000207:
          result = CFSTR("smartAlbumScreenRecordings");
          break;
        case 1000000211:
          result = CFSTR("smartAlbumProRes");
          break;
        case 1000000212:
          return CFSTR("duplicates");
        case 1000000214:
          result = CFSTR("smartAlbumSharedLibrarySharingSuggestions");
          break;
        case 1000000215:
          result = CFSTR("smartAlbumActionCam");
          break;
        case 1000000218:
          result = CFSTR("recentlySaved");
          break;
        case 1000000219:
          result = CFSTR("smartAlbumRecovered");
          break;
        default:
          if (a3 != 1000000001)
            goto LABEL_65;
          result = CFSTR("albumCameraRoll");
          break;
      }
    }
  }
  else if (a3 <= 199)
  {
    v3 = CFSTR("albumRegular");
    switch(a3)
    {
      case 2:
        return v3;
      case 3:
        return CFSTR("albumSyncedEvent");
      case 4:
        return CFSTR("albumSyncedFaces");
      case 5:
        return CFSTR("albumSyncedAlbum");
      case 6:
        return CFSTR("albumImported");
      default:
        if (a3 == 100)
        {
          result = CFSTR("albumMyPhotoStream");
        }
        else
        {
          if (a3 != 101)
            goto LABEL_65;
          result = CFSTR("albumCloudShared");
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 200:
        v3 = CFSTR("smartAlbumGeneric");
        return v3;
      case 201:
        result = CFSTR("smartAlbumPanoramas");
        break;
      case 202:
        result = CFSTR("smartAlbumVideos");
        break;
      case 203:
        result = CFSTR("smartAlbumFavorites");
        break;
      case 204:
        result = CFSTR("smartAlbumTimelapses");
        break;
      case 205:
        result = CFSTR("smartAlbumAllHidden");
        break;
      case 206:
        result = CFSTR("smartAlbumRecentlyAdded");
        break;
      case 207:
        result = CFSTR("smartAlbumBursts");
        break;
      case 208:
        result = CFSTR("smartAlbumSlomoVideos");
        break;
      case 209:
        result = CFSTR("smartAlbumUserLibrary");
        break;
      case 210:
        result = CFSTR("smartAlbumSelfPortraits");
        break;
      case 211:
        result = CFSTR("smartAlbumScreenshots");
        break;
      case 212:
        result = CFSTR("smartAlbumDepthEffect");
        break;
      case 213:
        result = CFSTR("smartAlbumLivePhotos");
        break;
      case 214:
        result = CFSTR("smartAlbumAnimated");
        break;
      case 215:
        result = CFSTR("smartAlbumLongExposures");
        break;
      case 216:
        result = CFSTR("smartAlbumUnableToUpload");
        break;
      case 217:
        result = CFSTR("smartAlbumRAW");
        break;
      case 218:
        result = CFSTR("smartAlbumCinematic");
        break;
      case 219:
        result = CFSTR("smartAlbumSpatial");
        break;
      default:
        goto LABEL_65;
    }
  }
  return result;
}

+ (id)descriptionOfTitleCategory:(int64_t)a3
{
  if ((unint64_t)a3 < 7)
    return off_1E35D69A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("? (%i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id obj;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke_2;
    v12[3] = &unk_1E35D68F0;
    v12[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch duplicate album types. Error: %@", buf, 0x16u);

    }
  }

}

void __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duplicateType"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, v6);
    }
    objc_msgSend(v5, "addObject:", v4);

  }
}

void __42__PHAssetCollection_defaultTitleFontNames__block_invoke()
{
  void *v0;

  v0 = (void *)defaultTitleFontNames_defaultTitleFontNames;
  defaultTitleFontNames_defaultTitleFontNames = (uint64_t)&unk_1E3657120;

}

id __45__PHAssetCollection_fetchMomentsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "sortDescriptors");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = (void *)v3, v5 = objc_msgSend(v2, "chunkSizeForFetch"), v4, !v5))
  {
    if (v2)
    {
      v6 = objc_msgSend(v2, "copy");

      v2 = (id)v6;
    }
    else
    {
      v2 = (id)objc_opt_new();
    }
    objc_msgSend(v2, "sortDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setSortDescriptors:", v9);

    }
    if (!objc_msgSend(v2, "chunkSizeForFetch"))
      objc_msgSend(v2, "setChunkSizeForFetch:", 2000);
  }
  +[PHQuery queryForMomentsWithOptions:](PHQuery, "queryForMomentsWithOptions:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __122__PHAssetCollection_fetchRecentContentSyndicationAssetCollectionsWithOptions_maxNumberOfStacks_maxNumberOfAssetsPerStack___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "curationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syndicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PLAttachmentIndexFromMessagesSyndicationID();

  objc_msgSend(v4, "curationProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "syndicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = PLAttachmentIndexFromMessagesSyndicationID();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  return v13;
}

id __64__PHAssetCollection_fetchAssetCollectionsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetCollectionsWithObjectIDs:options:](PHQuery, "queryForAssetCollectionsWithObjectIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __71__PHAssetCollection_fetchAssetCollectionsWithALAssetGroupURLs_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
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
        objc_msgSend(MEMORY[0x1E0D71778], "uuidFromGroupURL:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __71__PHAssetCollection_fetchAssetCollectionsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetCollectionsWithLocalIdentifiers:options:](PHQuery, "queryForAssetCollectionsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __76__PHAssetCollection_fetchAssetCollectionsWithType_localIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetCollectionsWithType:localIdentifiers:options:](PHQuery, "queryForAssetCollectionsWithType:localIdentifiers:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __57__PHAssetCollection_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("localizedTitle");
  v4[1] = CFSTR("title");
  v4[2] = CFSTR("estimatedAssetCount");
  v4[3] = CFSTR("startDate");
  v4[4] = CFSTR("endDate");
  v4[5] = CFSTR("cloudGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_3972;
  transformValueExpression_forKeyPath___passThroughSet_3972 = v2;

}

void __33__PHAssetCollection_entityKeyMap__block_invoke()
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
  PHEntityKeyMap *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[2];
  const __CFString *v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  v12 = [PHEntityKeyMap alloc];
  v21 = CFSTR("uuid");
  v22[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v0;
  v22[1] = CFSTR("title");
  v20[0] = CFSTR("localizedTitle");
  v20[1] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v1;
  v22[2] = CFSTR("cachedCount");
  v19 = CFSTR("estimatedAssetCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v2;
  v22[3] = CFSTR("customSortAscending");
  v18 = CFSTR("customSortAscending");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v3;
  v22[4] = CFSTR("customSortKey");
  v17 = CFSTR("customSortKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v4;
  v22[5] = CFSTR("startDate");
  v16 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  v22[6] = CFSTR("endDate");
  v15 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v6;
  v22[7] = CFSTR("cloudGUID");
  v14 = CFSTR("cloudGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v7;
  v22[8] = CFSTR("privacyState");
  v13 = CFSTR("privacyState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v12, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_16;
  entityKeyMap_pl_once_object_16 = v10;

}

void __47__PHAssetCollection_propertiesToFetchWithHint___block_invoke_56(uint64_t a1)
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

  v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint;
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

    v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v11);

  }
}

- (id)pl_assetContainer
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAdoptionUtilities.m"), 70, CFSTR("This is only callable on the main thread"));

  }
  if (-[PHAssetCollection assetCollectionType](self, "assetCollectionType") == PHAssetCollectionTypeMoment)
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
    v23 = 0;
    objc_msgSend(v7, "existingObjectWithID:error:", v8, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;

    if (!v9 && v10)
    {
      PLPhotoKitGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "Failed to fetch moment: %@", buf, 0xCu);
      }

    }
    objc_autoreleasePoolPop(v4);
  }
  else if (-[PHObject isTransient](self, "isTransient"))
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setIncludeHiddenAssets:", 1);
    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", self, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "pl_photoLibraryObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = objc_alloc(MEMORY[0x1E0D71B10]);
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v19, "initWithTitle:assets:", &stru_1E35DFFF8, v20);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D71778];
    -[PHObject objectID](self, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject photoLibrary](self, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mainQueueConcurrencyPhotoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "albumWithObjectID:inLibrary:", v16, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)pl_albumsForAssetCollections:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAdoptionUtilities.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSThread.isMainThread"));

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainQueueConcurrencyPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)MEMORY[0x1E0D71778];
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "objectID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "albumWithObjectID:inLibrary:", v16, v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v9, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

+ (id)pl_PHAssetCollectionForAssetContainer:(id)a3 photoLibrary:(id)a4
{
  return +[PHAssetCollection pl_PHAssetCollectionForAssetContainer:photoLibrary:includeTrash:](PHAssetCollection, "pl_PHAssetCollectionForAssetContainer:photoLibrary:includeTrash:", a3, a4, 0);
}

+ (id)pl_PHAssetCollectionForAssetContainer:(id)a3 photoLibrary:(id)a4 includeTrash:(BOOL)a5
{
  void *v5;
  void *v6;

  +[PHFetchResult pl_fetchResultContainingAssetContainer:photoLibrary:includeTrash:](PHFetchResult, "pl_fetchResultContainingAssetContainer:photoLibrary:includeTrash:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)posterImageForAssetCollection:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  v4 = objc_msgSend(v3, "assetCollectionType");
  v5 = objc_msgSend(v3, "assetCollectionSubtype");
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 3)
  {
    v6 = 0;
    goto LABEL_20;
  }
  if (v4 == 1)
  {
    if ((unint64_t)(v5 - 100) < 2)
    {
      if (!objc_msgSend(v3, "estimatedAssetCount"))
      {
        PLPhotoLibraryServicesFrameworkBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("PLEmptyPhotoStream");
        goto LABEL_10;
      }
    }
    else
    {
      if (v5 == 4)
      {
        objc_msgSend(v3, "pl_assetContainer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "posterImage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        if (v6)
          goto LABEL_20;
        goto LABEL_13;
      }
      if (v5 == 205)
      {
        PLPhotoLibraryServicesFrameworkBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("PLEmptyAlbum");
LABEL_10:
        objc_msgSend(v7, "pathForResource:ofType:", v9, CFSTR("png"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        DCIM_newPLImageWithContentsOfFile();
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
  }
LABEL_13:
  if (objc_msgSend(v3, "estimatedAssetCount"))
    goto LABEL_14;
  PLPhotoLibraryServicesFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pathForResource:ofType:", CFSTR("PLEmptyAlbum"), CFSTR("png"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  DCIM_newPLImageWithContentsOfFile();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_14:
    objc_msgSend(v3, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:](PHFetchOptions, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAsset fetchKeyAssetsInAssetCollection:options:](PHAsset, "fetchKeyAssetsInAssetCollection:options:", v3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "posterThumbnailSize");
      v17 = v16;
      v19 = v18;

      +[PHImageManager defaultManager](PHImageManager, "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "synchronousImageForAsset:targetSize:contentMode:options:", v14, 0, 0, v17, v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
LABEL_20:

  return v6;
}

- (BOOL)supportsFastKeyAssetCuration
{
  PHAssetCollectionType v3;
  BOOL v4;
  void *v5;

  v3 = -[PHAssetCollection assetCollectionType](self, "assetCollectionType");
  v4 = 1;
  if (v3 != 4 && v3 != 6)
  {
    if (v3 == 5)
    {
      -[PHAssetCollection highlightLocalIdentifier](self, "highlightLocalIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v5 != 0;

    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (id)objectReference
{
  return +[PHAssetCollectionReference referenceForAssetCollection:](PHAssetCollectionReference, "referenceForAssetCollection:", self);
}

+ (id)fetchAssetCollectionsForReferences:(id)a3 photoLibrary:(id)a4
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
  +[PHAssetCollection fetchType](PHAssetCollection, "fetchType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PHAssetCollection_PHObjectReference__fetchAssetCollectionsForReferences_photoLibrary___block_invoke;
  v11[3] = &unk_1E35DC330;
  v12 = v5;
  v8 = v5;
  PHCollectionReferenceFetchCollectionsForReferences((uint64_t)v6, v8, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __88__PHAssetCollection_PHObjectReference__fetchAssetCollectionsForReferences_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeUserSmartAlbums:", 1);
  objc_msgSend(v4, "setIncludeTrashedAssets:", 1);
  +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
