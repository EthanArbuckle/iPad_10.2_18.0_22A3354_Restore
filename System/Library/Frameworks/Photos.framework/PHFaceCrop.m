@implementation PHFaceCrop

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHFaceCrop)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHFaceCrop *v9;
  uint64_t v10;
  NSData *resourceData;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHFaceCrop;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v15, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resourceData"));
    v10 = objc_claimAutoreleasedReturnValue();
    resourceData = v9->_resourceData;
    v9->_resourceData = (NSData *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_state = objc_msgSend(v12, "shortValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_type = objc_msgSend(v13, "integerValue");

  }
  return v9;
}

- (NSData)resourceData
{
  return self->_resourceData;
}

- (signed)state
{
  return self->_state;
}

- (signed)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceData, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_39781 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_39781, &__block_literal_global_39782);
  return (id)propertiesToFetchWithHint__array_39783;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_39779;
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
  block[2] = __50__PHFaceCrop_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_39775 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_39775, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_39776, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)identifierCode
{
  return CFSTR("110");
}

+ (id)managedEntityName
{
  return CFSTR("FaceCrop");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHFaceCrop");
  return CFSTR("PHFaceCrop");
}

+ (id)fetchFaceCropsWithOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PHFaceCrop_fetchFaceCropsWithOptions___block_invoke;
  v7[3] = &unk_1E35DFCC0;
  v8 = v3;
  v4 = v3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchFaceCropsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PHFaceCrop_fetchFaceCropsWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchFaceCropsForPerson:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__PHFaceCrop_fetchFaceCropsForPerson_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchFaceCropsNeedingFaceDetectionWithOptions:(id)a3
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
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = (void *)objc_opt_new();
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("state == %d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3528];
    v15[0] = v9;
    v15[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v12);

  }
  else
  {
    objc_msgSend(v6, "setPredicate:", v7);
  }
  objc_msgSend(a1, "fetchFaceCropsWithOptions:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fetchTransientTrainingFaceCropsForPerson:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  PHManualFetchResult *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_trainingFaceCropByUUIDForPerson:options:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__PHFaceCrop_fetchTransientTrainingFaceCropsForPerson_options___block_invoke;
    v17[3] = &unk_1E35DECE0;
    v18 = v11;
    v12 = v8;
    v19 = v12;
    v20 = v10;
    v13 = v10;
    v14 = v11;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v17);
    v15 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:]([PHManualFetchResult alloc], "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v13, v12, CFSTR("PHFaceCrop"), 0, 0, 0);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_trainingFaceCropByUUIDForPerson:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSObject *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("vipModelType"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:", v9);

  objc_msgSend(v8, "setFetchLimit:", objc_msgSend(v6, "fetchLimit"));
  objc_msgSend(v6, "sortDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  objc_msgSend(v8, "setIncludeNonvisibleFaces:", objc_msgSend(v6, "includeNonvisibleFaces"));
  +[PHFace fetchFacesForPerson:options:](PHFace, "fetchFacesForPerson:options:", v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v7, "photoAnalysisClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v19, "requestOnDemandFaceCropsForFaceLocalIdentifiers:error:", v12, &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25;

    if (v21 || !v20)
    {
      PLPhotoKitGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v31 = v5;
        v32 = 2112;
        v33 = v12;
        v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Failed to request on demand face crops for person: %@, faces: %@, error: %@", buf, 0x20u);
      }

      v22 = 0;
    }
    else
    {
      v22 = v20;
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "No on demand face crops to request for person: %@", buf, 0xCu);
    }
    v22 = 0;
  }

  return v22;
}

+ (id)fetchFaceCropByFaceLocalIdentifierForFaces:(id)a3 fetchOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v23 = a1;
  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v14, "objectID", v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);
        if (!v6)
        {
          objc_msgSend(v14, "photoLibrary");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D71720];
  objc_msgSend(v6, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs:library:", v7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v6, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke;
    v25[3] = &unk_1E35DED30;
    v26 = v20;
    v27 = v8;
    v28 = v6;
    v29 = v24;
    v31 = v23;
    v30 = v17;
    objc_msgSend(v21, "performBlockAndWait:", v25);

  }
  return v17;
}

void __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  __int128 v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke_2;
  v5[3] = &unk_1E35DED08;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 64);
  v3 = (id)v4;
  v9 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  PHObjectPLAdapter *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHObjectPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "fetchPropertySetsAsSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithFetchDictionary:propertyHint:photoLibrary:", v7, +[PHObject propertyFetchHintsForPropertySets:](PHFaceCrop, "propertyFetchHintsForPropertySets:", v8), *(_QWORD *)(a1 + 40));
  if (v10 && v9)
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v9, v10);

}

void __63__PHFaceCrop_fetchTransientTrainingFaceCropsForPerson_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PHFaceCrop *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "stringByAppendingString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("uuid");
  v10[1] = CFSTR("resourceData");
  v11[0] = v7;
  v11[1] = v6;
  v10[2] = CFSTR("state");
  v10[3] = CFSTR("type");
  v11[2] = &unk_1E3656410;
  v11[3] = &unk_1E3656410;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHFaceCrop initWithFetchDictionary:propertyHint:photoLibrary:]([PHFaceCrop alloc], "initWithFetchDictionary:propertyHint:photoLibrary:", v8, 2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

}

id __46__PHFaceCrop_fetchFaceCropsForPerson_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForFaceCropsForPerson:options:](PHQuery, "queryForFaceCropsForPerson:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __57__PHFaceCrop_fetchFaceCropsWithLocalIdentifiers_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForFaceCropsWithLocalIdentifiers:options:](PHQuery, "queryForFaceCropsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PHFaceCrop_fetchFaceCropsWithOptions___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForFaceCropsWithOptions:](PHQuery, "queryForFaceCropsWithOptions:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __50__PHFaceCrop_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("uuid");
  v4[1] = CFSTR("resourceData");
  v4[2] = CFSTR("state");
  v4[3] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_39776;
  transformValueExpression_forKeyPath___passThroughSet_39776 = v2;

}

void __26__PHFaceCrop_entityKeyMap__block_invoke()
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
  const __CFString *v10;
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
  v12[1] = CFSTR("resourceData");
  v10 = CFSTR("resourceData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  v12[2] = CFSTR("state");
  v9 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  v12[3] = CFSTR("type");
  v8 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v5);
  v7 = (void *)entityKeyMap_pl_once_object_15_39779;
  entityKeyMap_pl_once_object_15_39779 = v6;

}

void __40__PHFaceCrop_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("uuid");
  v3[2] = CFSTR("resourceData");
  v3[3] = CFSTR("state");
  v3[4] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToFetchWithHint__array_39783;
  propertiesToFetchWithHint__array_39783 = v1;

}

@end
