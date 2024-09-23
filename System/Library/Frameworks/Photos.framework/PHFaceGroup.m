@implementation PHFaceGroup

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHFaceGroup)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHFaceGroup *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHFaceGroup;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v13, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("unnamedFaceCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_unnamedFaceCount = objc_msgSend(v10, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personBuilderState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_personBuilderState = objc_msgSend(v11, "integerValue");

  }
  return v9;
}

- (int64_t)getPersonModelId
{
  return 0;
}

- (int64_t)unnamedFaceCount
{
  return self->_unnamedFaceCount;
}

- (int64_t)personModelId
{
  return self->_personModelId;
}

- (int64_t)personBuilderState
{
  return self->_personBuilderState;
}

+ (id)identifierCode
{
  return CFSTR("090");
}

+ (id)managedEntityName
{
  return CFSTR("DetectedFaceGroup");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHFaceGroup");
  return CFSTR("PHFaceGroup");
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_1389 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_1389, &__block_literal_global_1390);
  return (id)propertiesToFetchWithHint__array_1391;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_1387;
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
  block[2] = __51__PHFaceGroup_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_1381 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_1381, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_1382, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)fetchFaceGroupsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_35);
}

+ (id)fetchFaceGroupsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__PHFaceGroup_fetchFaceGroupsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchFaceGroupsForPerson:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PHFaceGroup_fetchFaceGroupsForPerson_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchFaceGroupsWithFace:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForFaceGroupsWithFace:options:](PHQuery, "queryForFaceGroupsWithFace:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1369;
  v36 = __Block_byref_object_dispose__1370;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        if (!v10)
          v10 = v14;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v11);
  }

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D716D0];
  objc_msgSend(v16, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke;
  v23[3] = &unk_1E35DB020;
  v26 = &v32;
  v19 = v16;
  v24 = v19;
  v20 = v7;
  v25 = v20;
  v27 = a1;
  objc_msgSend(v17, "batchFetchFaceGroupByFaceUUIDWithFaceUUIDs:predicate:library:completion:", v8, 0, v18, v23);

  v21 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v21;
}

+ (id)fetchEmptyFaceGroupsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_47);
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___PHFaceGroup;
  objc_msgSendSuper2(&v16, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "expressionType");
    v11 = v8;
    if (v10 == 3 || (v12 = objc_msgSend(v9, "expressionType"), v11 = v9, v12 == 3))
    {
      objc_msgSend(v11, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13
        && ((objc_msgSend(v13, "isEqualToString:", CFSTR("detectedFaces.personForFace")) & 1) != 0
         || (objc_msgSend(v14, "isEqualToString:", CFSTR("detectedFaces.@count")) & 1) != 0
         || objc_msgSend(v14, "isEqualToString:", CFSTR("detectedFaces.detectionType"))))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, objc_msgSend(v6, "comparisonPredicateModifier"), objc_msgSend(v6, "predicateOperatorType"), objc_msgSend(v6, "options"));
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v14 = 0;
    }
    v7 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

id __47__PHFaceGroup_fetchEmptyFaceGroupsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForEmptyFaceGroupsWithOptions:](PHQuery, "queryForEmptyFaceGroupsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke_2;
    v11[3] = &unk_1E35D6020;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching associated person by face group: %@", buf, 0xCu);
    }

  }
}

void __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  PHObjectPLAdapter *v7;
  void *v8;
  void *v9;
  PHManualFetchResult *v10;
  void *v11;
  PHManualFetchResult *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PHObject localIdentifierWithUUID:](PHFace, "localIdentifierWithUUID:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHObjectPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "fetchPropertySetsAsSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithFetchDictionary:propertyHint:photoLibrary:", v7, +[PHObject propertyFetchHintsForPropertySets:](PHFaceGroup, "propertyFetchHintsForPropertySets:", v8), *(_QWORD *)(a1 + 32));
  v10 = [PHManualFetchResult alloc];
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v10, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, *(_QWORD *)(a1 + 32), CFSTR("PHPerson"), v8, 0, 1);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v6);
}

id __48__PHFaceGroup_fetchFaceGroupsForPerson_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForFaceGroupsForPerson:options:](PHQuery, "queryForFaceGroupsForPerson:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__PHFaceGroup_fetchFaceGroupsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForFaceGroupsWithLocalIdentifiers:options:](PHQuery, "queryForFaceGroupsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __42__PHFaceGroup_fetchFaceGroupsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForFaceGroupsWithOptions:](PHQuery, "queryForFaceGroupsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __51__PHFaceGroup_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("uuid");
  v4[1] = CFSTR("unnamedFaceCount");
  v4[2] = CFSTR("personBuilderState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_1382;
  transformValueExpression_forKeyPath___passThroughSet_1382 = v2;

}

void __27__PHFaceGroup_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v9 = CFSTR("uuid");
  v10[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = CFSTR("unnamedFaceCount");
  v8 = CFSTR("unnamedFaceCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v10[2] = CFSTR("personBuilderState");
  v7 = CFSTR("personBuilderState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v4);
  v6 = (void *)entityKeyMap_pl_once_object_15_1387;
  entityKeyMap_pl_once_object_15_1387 = v5;

}

void __41__PHFaceGroup_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("uuid");
  v3[2] = CFSTR("unnamedFaceCount");
  v3[3] = CFSTR("personBuilderState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToFetchWithHint__array_1391;
  propertiesToFetchWithHint__array_1391 = v1;

}

@end
