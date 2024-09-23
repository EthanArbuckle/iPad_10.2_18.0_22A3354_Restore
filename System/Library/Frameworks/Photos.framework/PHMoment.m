@implementation PHMoment

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHMoment)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHMoment *v9;
  void *v10;
  uint64_t v11;
  NSDate *representativeDate;
  void *v13;
  double v14;
  void *v15;
  double v16;
  CLLocationCoordinate2D v17;
  uint64_t v18;
  NSDate *modificationDate;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *subtitle;
  uint64_t v26;
  NSArray *localizedLocationNames;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  NSDate *startDate;
  uint64_t v33;
  NSDate *endDate;
  objc_super v36;

  v8 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PHMoment;
  v9 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v36, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeZoneOffset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_timeZoneOffset = objc_msgSend(v10, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("representativeDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    representativeDate = v9->_representativeDate;
    v9->_representativeDate = (NSDate *)v11;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("approximateLatitude"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v9->_approximateLatitude = v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("approximateLongitude"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v9->_approximateLongitude = v16;

    v17 = CLLocationCoordinate2DMake(v9->_approximateLatitude, v9->_approximateLongitude);
    -[PHMoment _cacheLocationWithCoordinate:](v9, "_cacheLocationWithCoordinate:", v17.latitude, v17.longitude);
    v9->super._assetCollectionType = 3;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modificationDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("aggregationScore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v9->_aggregationScore = v21;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("processedLocation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_processedLocation = objc_msgSend(v22, "unsignedShortValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("originatorState"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_originatorState = objc_msgSend(v23, "shortValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v24 = objc_claimAutoreleasedReturnValue();
    subtitle = v9->_subtitle;
    v9->_subtitle = (NSString *)v24;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("localizedLocationNames"));
    v26 = objc_claimAutoreleasedReturnValue();
    localizedLocationNames = v9->super._localizedLocationNames;
    v9->super._localizedLocationNames = (NSArray *)v26;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gpsHorizontalAccuracy"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v9->_gpsHorizontalAccuracy = v29;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_sharingComposition = objc_msgSend(v30, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startDate"));
    v31 = objc_claimAutoreleasedReturnValue();
    startDate = v9->super._startDate;
    v9->super._startDate = (NSDate *)v31;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
    v33 = objc_claimAutoreleasedReturnValue();
    endDate = v9->super._endDate;
    v9->super._endDate = (NSDate *)v33;

  }
  return v9;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)canShowAvalancheStacks
{
  return 1;
}

- (id)localizedLocationNames
{
  return self->super._localizedLocationNames;
}

- (id)localizedSubtitle
{
  return self->_subtitle;
}

- (BOOL)hasLocationInfo
{
  return 0;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (NSDate)localStartDate
{
  return -[NSDate dateByAddingTimeInterval:](self->super._startDate, "dateByAddingTimeInterval:", (double)self->_timeZoneOffset);
}

- (NSDate)localEndDate
{
  return -[NSDate dateByAddingTimeInterval:](self->super._endDate, "dateByAddingTimeInterval:", (double)self->_timeZoneOffset);
}

- (NSDate)universalStartDate
{
  return self->super._startDate;
}

- (NSDate)universalEndDate
{
  return self->super._endDate;
}

- (void)_cacheLocationWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  CLLocation *v6;
  CLLocation *approximateLocation;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:"))
  {
    v6 = (CLLocation *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
    approximateLocation = self->super._approximateLocation;
    self->super._approximateLocation = v6;
  }
  else
  {
    approximateLocation = self->super._approximateLocation;
    self->super._approximateLocation = 0;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHMoment;
  -[PHAssetCollection description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@ - %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (int)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (NSDate)representativeDate
{
  return self->_representativeDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (float)aggregationScore
{
  return self->_aggregationScore;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unsigned)processedLocation
{
  return self->_processedLocation;
}

- (signed)originatorState
{
  return self->_originatorState;
}

- (double)approximateLatitude
{
  return self->_approximateLatitude;
}

- (double)approximateLongitude
{
  return self->_approximateLongitude;
}

- (double)gpsHorizontalAccuracy
{
  return self->_gpsHorizontalAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_representativeDate, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PHMoment_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_11703 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_11703, block);
  return (id)propertiesToFetchWithHint__array_11704;
}

+ (id)managedEntityName
{
  return CFSTR("Moment");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHMoment");
  return CFSTR("PHMoment");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
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
  return CFSTR("060");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_11686;
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
  block[2] = __48__PHMoment_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_11674 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_11674, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_11675, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)fetchMomentUUIDByAssetUUIDForAssets:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "uuid", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        if (!v8)
        {
          objc_msgSend(v15, "photoLibrary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  objc_msgSend(a1, "_fetchMomentUUIDByAssetUUIDForAssetUUIDs:photoLibrary:", v9, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)fetchMomentUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchMomentUUIDByAssetUUIDForAssetUUIDs:photoLibrary:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_fetchMomentUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__11647;
    v20 = __Block_byref_object_dispose__11648;
    v21 = 0;
    objc_msgSend(v6, "photoLibraryForCurrentQueueQoS");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke;
    v12[3] = &unk_1E35DEE50;
    v13 = v5;
    v14 = v7;
    v15 = buf;
    objc_msgSend(v8, "performBlockAndWait:", v12);
    v9 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_FAULT, "Can't fetch moment uuids because input PHPhotoLibrary instance is nil", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

+ (id)fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D716C8], "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("assetForFace.moment.uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", CFSTR("momentUUID"));
  objc_msgSend(v7, "setExpression:", v8);
  objc_msgSend(v7, "setExpressionResultType:", 700);
  v9 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("personForFace.personUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", CFSTR("personUUID"));
  objc_msgSend(v9, "setExpression:", v10);
  objc_msgSend(v9, "setExpressionResultType:", 700);
  v33[0] = v7;
  v33[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v11);

  v32[0] = v7;
  v32[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v12);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personForFace.personUUID"), v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v13);
  objc_msgSend(v6, "setResultType:", 2);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11647;
  v30 = __Block_byref_object_dispose__11648;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke;
  v20[3] = &unk_1E35DF9A0;
  v15 = v5;
  v21 = v15;
  v16 = v6;
  v22 = v16;
  v23 = CFSTR("personUUID");
  v24 = CFSTR("momentUUID");
  v25 = &v26;
  objc_msgSend(v14, "performBlockAndWait:", v20);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

+ (id)fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__11647;
    v21 = __Block_byref_object_dispose__11648;
    v22 = 0;
    objc_msgSend(v7, "photoLibraryForCurrentQueueQoS");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__PHMoment_fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs_options___block_invoke;
    v13[3] = &unk_1E35DEE50;
    v14 = v5;
    v15 = v8;
    v16 = buf;
    objc_msgSend(v9, "performBlockAndWait:", v13);
    v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_FAULT, "Can't fetch moment uuids by highlight uuid: no PHPhotoLibrary specified", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

void __81__PHMoment_fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D718E8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryForCurrentQueueQoS");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "batchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:library:error:", v3, v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v5;
    v9 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching moment uuids by highlight uuid: %@", buf, 0xCu);
    }
  }

}

void __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;

  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke_2;
    v10[3] = &unk_1E35D8698;
    v11 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v12 = v7;
    v13 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

    v9 = v11;
  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching moment uuids by person uuids: %@", buf, 0xCu);
    }
  }

}

void __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      if (objc_msgSend(v5, "length"))
        objc_msgSend(v8, "addObject:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v8, v9);
    }

  }
}

void __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = (void *)MEMORY[0x1E0D718E8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryForCurrentQueueQoS");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke_2;
  v5[3] = &unk_1E35DB0C0;
  v5[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "batchFetchMomentUUIDsByAssetUUIDsWithAssetUUIDs:library:completion:", v3, v4, v5);

}

void __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Error batch fetching moments by assets: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void __48__PHMoment_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[15];

  v4[14] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("estimatedAssetCount");
  v4[1] = CFSTR("startDate");
  v4[2] = CFSTR("endDate");
  v4[3] = CFSTR("localStartDate");
  v4[4] = CFSTR("localEndDate");
  v4[5] = CFSTR("timeZoneOffset");
  v4[6] = CFSTR("modificationDate");
  v4[7] = CFSTR("aggregationScore");
  v4[8] = CFSTR("processedLocation");
  v4[9] = CFSTR("originatorState");
  v4[10] = CFSTR("title");
  v4[11] = CFSTR("subtitle");
  v4[12] = CFSTR("localizedLocationNames");
  v4[13] = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_11675;
  transformValueExpression_forKeyPath___passThroughSet_11675 = v2;

}

void __24__PHMoment_entityKeyMap__block_invoke()
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
  PHEntityKeyMap *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  _QWORD v32[3];
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[16];
  _QWORD v37[18];

  v37[16] = *MEMORY[0x1E0C80C00];
  v15 = [PHEntityKeyMap alloc];
  v35 = CFSTR("uuid");
  v36[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v19;
  v36[1] = CFSTR("startDate");
  v34 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v18;
  v36[2] = CFSTR("endDate");
  v33 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v17;
  v36[3] = CFSTR("timeZoneOffset");
  v32[0] = CFSTR("timeZoneOffset");
  v32[1] = CFSTR("localStartDate");
  v32[2] = CFSTR("localEndDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v16;
  v36[4] = CFSTR("modificationDate");
  v31 = CFSTR("modificationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v14;
  v36[5] = CFSTR("cachedCount");
  v30 = CFSTR("estimatedAssetCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v13;
  v36[6] = CFSTR("aggregationScore");
  v29 = CFSTR("aggregationScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v12;
  v36[7] = CFSTR("processedLocation");
  v28 = CFSTR("processedLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v0;
  v36[8] = CFSTR("originatorState");
  v27 = CFSTR("originatorState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v1;
  v36[9] = CFSTR("title");
  v26[0] = CFSTR("title");
  v26[1] = CFSTR("localizedTitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v2;
  v36[10] = CFSTR("subtitle");
  v25[0] = CFSTR("subtitle");
  v25[1] = CFSTR("localizedSubtitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37[10] = v3;
  v36[11] = CFSTR("approximateLatitude");
  v24 = CFSTR("approximateLatitude");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[11] = v4;
  v36[12] = CFSTR("approximateLongitude");
  v23 = CFSTR("approximateLongitude");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[12] = v5;
  v36[13] = CFSTR("localizedLocationNames");
  v22 = CFSTR("localizedLocationNames");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[13] = v6;
  v36[14] = CFSTR("gpsHorizontalAccuracy");
  v21 = CFSTR("gpsHorizontalAccuracy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[14] = v7;
  v36[15] = CFSTR("sharingComposition");
  v20 = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[15] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v15, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_11686;
  entityKeyMap_pl_once_object_15_11686 = v10;

}

void __38__PHMoment_propertiesToFetchWithHint___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[21];

  v4[20] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("approximateLatitude");
  v4[3] = CFSTR("approximateLongitude");
  v4[4] = CFSTR("cachedCount");
  v4[5] = CFSTR("cachedPhotosCount");
  v4[6] = CFSTR("cachedVideosCount");
  v4[7] = CFSTR("startDate");
  v4[8] = CFSTR("endDate");
  v4[9] = CFSTR("timeZoneOffset");
  v4[10] = CFSTR("representativeDate");
  v4[11] = CFSTR("modificationDate");
  v4[12] = CFSTR("aggregationScore");
  v4[13] = CFSTR("title");
  v4[14] = CFSTR("subtitle");
  v4[15] = CFSTR("processedLocation");
  v4[16] = CFSTR("originatorState");
  v4[17] = CFSTR("localizedLocationNames");
  v4[18] = CFSTR("gpsHorizontalAccuracy");
  v4[19] = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 20);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToFetchWithHint__array_11704;
  propertiesToFetchWithHint__array_11704 = v2;

}

@end
