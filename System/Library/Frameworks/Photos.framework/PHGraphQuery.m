@implementation PHGraphQuery

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[PHGraphQuery graphQueryType](self, "graphQueryType");
  if (v3 > 7)
    v4 = 0;
  else
    v4 = off_1E35DE3A0[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PHGraphQuery graphSubject](self, "graphSubject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHGraphQuery graphSubject](self, "graphSubject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("PHGraphQuery(type=%@, subject=(%@ uuid=%@))"), v4, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHGraphQuery;
  v4 = -[PHQuery copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[PHGraphQuery graphSubject](self, "graphSubject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setGraphSubject:", v6);

  objc_msgSend(v4, "setGraphQueryType:", -[PHGraphQuery graphQueryType](self, "graphQueryType"));
  return v4;
}

- (id)updatedQueryWithChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PHObject *graphSubject;
  PHGraphQuery *v14;
  void *v15;

  if (!-[PHGraphQuery _graphQueryIntersectsWithChange:](self, "_graphQueryIntersectsWithChange:", a3))
    goto LABEL_12;
  switch(-[PHGraphQuery graphQueryType](self, "graphQueryType"))
  {
    case 1:
    case 2:
      v4 = (void *)objc_opt_class();
      -[PHQuery fetchOptions](self, "fetchOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "graphQueryForSocialGroupsWithOptions:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v7 = (void *)objc_opt_class();
      -[PHGraphQuery _graphRefetchSocialGroup](self, "_graphRefetchSocialGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHQuery fetchOptions](self, "fetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "graphQueryForPersonsInSocialGroup:options:", v5, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      v10 = (void *)objc_opt_class();
      -[PHGraphQuery _graphRefetchSocialGroup](self, "_graphRefetchSocialGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHQuery fetchOptions](self, "fetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "graphQueryForKeyAssetForSocialGroup:createIfNeeded:options:", v5, 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      v15 = (void *)objc_opt_class();
      -[PHGraphQuery _graphRefetchSocialGroup](self, "_graphRefetchSocialGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHQuery fetchOptions](self, "fetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "graphQueryForInclusiveAssetsForSocialGroup:options:", v5, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6:
      v11 = (void *)objc_opt_class();
      -[PHGraphQuery _graphRefetchSocialGroup](self, "_graphRefetchSocialGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHQuery fetchOptions](self, "fetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "graphQueryForExclusiveAssetsForSocialGroup:options:", v5, v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v14 = (PHGraphQuery *)v9;

      break;
    case 7:
      v12 = (void *)objc_opt_class();
      graphSubject = self->_graphSubject;
      -[PHQuery fetchOptions](self, "fetchOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "graphQueryForAssetsForPerson:options:", graphSubject, v5);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = (PHGraphQuery *)v6;
      break;
    default:
      goto LABEL_12;
  }

  if (!v14)
LABEL_12:
    v14 = self;
  return v14;
}

- (unint64_t)possibleChangesForChange:(id)a3
{
  if (-[PHGraphQuery _graphQueryIntersectsWithChange:](self, "_graphQueryIntersectsWithChange:", a3))
    return 15;
  else
    return 0;
}

- (id)executeQuery
{
  void *v2;
  PHFetchResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHManualFetchResult *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  PHManualFetchResult *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v2 = self;
  switch(-[PHGraphQuery graphQueryType](self, "graphQueryType"))
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      v23.receiver = v2;
      v23.super_class = (Class)PHGraphQuery;
      -[PHQuery executeQuery](&v23, sel_executeQuery);
      return (id)objc_claimAutoreleasedReturnValue();
    case 1:
      v4 = -[PHFetchResult initWithQuery:registerIfNeeded:]([PHFetchResult alloc], "initWithQuery:registerIfNeeded:", v2, 0);
      v5 = (void *)objc_opt_class();
      objc_msgSend(v2, "fetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_filterSocialGroupsWithFetchResult:option:graphQuery:", v4, v6, v2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 2:
      objc_msgSend(v2, "fetchOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchPropertySets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v9 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v2, "fetchOptions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchPropertySets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithArray:", v11);
        v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }

      v12 = [PHManualFetchResult alloc];
      objc_msgSend(v2, "seedOIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "fetchOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "fetchOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "fetchLimit");

      v19 = 200;
      if (v18 < 0xC8)
        v19 = v18;
      v20 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:graphQuery:batchSize:](v12, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:graphQuery:batchSize:", v13, v15, CFSTR("PHSocialGroup"), v4, v16, 0, v2, v19);

      v21 = (void *)objc_opt_class();
      objc_msgSend(v2, "fetchOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_filterSocialGroupsWithFetchResult:option:graphQuery:", v20, v22, v2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      return v2;
    default:
      return v2;
  }
}

- (id)changeHandlingContainerIdentifier
{
  void *v2;
  void *v3;

  -[PHGraphQuery graphSubject](self, "graphSubject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_graphRefetchSocialGroup
{
  PHObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = self->_graphSubject;
  -[PHObject photoLibrary](v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSocialGroupContext:", 2);
  -[PHObject localIdentifier](v2, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSocialGroup fetchSocialGroupsWithLocalIdentifiers:options:](PHSocialGroup, "fetchSocialGroupsWithLocalIdentifiers:options:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_graphQueryIntersectsWithChange:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  char v15;
  void *v16;
  char v17;

  v4 = a3;
  if ((unint64_t)(-[PHGraphQuery graphQueryType](self, "graphQueryType") - 1) > 1)
  {
    objc_msgSend(v4, "updatedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHGraphQuery graphSubject](self, "graphSubject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "containsObject:", v8);

    if (v9)
    {
      switch(-[PHGraphQuery graphQueryType](self, "graphQueryType"))
      {
        case 3:
          -[PHGraphQuery graphSubject](self, "graphSubject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "changedPropertyNamesForObjectID:entityClass:", v11, objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("memberPersonIDs");
          goto LABEL_8;
        case 4:
          -[PHGraphQuery graphSubject](self, "graphSubject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "changedPropertyNamesForObjectID:entityClass:", v11, objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("keyAssetID");
          goto LABEL_8;
        case 5:
        case 6:
          -[PHGraphQuery graphSubject](self, "graphSubject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "changedPropertyNamesForObjectID:entityClass:", v11, objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("inclusiveAssetIDs");
LABEL_8:
          v15 = objc_msgSend(v12, "containsObject:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_9;
          goto LABEL_11;
        case 7:
          objc_msgSend(MEMORY[0x1E0D71780], "entityName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v4, "containsChangesForEntityWithManagedEntityName:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_11;
LABEL_9:
          v5 = 1;
          break;
        default:
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      v5 = 0;
    }
  }
  else
  {
    v5 = objc_msgSend(v4, "containsChangesForEntityClass:", objc_opt_class());
  }

  return v5;
}

- (id)extraBatchFetchingArrayOptions
{
  unint64_t v3;
  void *v4;
  NSObject *v6;
  int v7;
  int64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PHGraphQuery graphQueryType](self, "graphQueryType");
  if (v3 > 7)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = -[PHGraphQuery graphQueryType](self, "graphQueryType");
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Unknown graph query type: %ld", (uint8_t *)&v7, 0xCu);
    }

  }
  else if (v3 == 2)
  {
    v9 = CFSTR("fetchedObjectClass");
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  v4 = (void *)MEMORY[0x1E0C9AA70];
  return v4;
}

- (PHObject)graphSubject
{
  return (PHObject *)objc_getProperty(self, a2, 280, 1);
}

- (void)setGraphSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (int64_t)graphQueryType
{
  return self->_graphQueryType;
}

- (void)setGraphQueryType:(int64_t)a3
{
  self->_graphQueryType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphSubject, 0);
}

+ (id)_graphBasePredicateWithLabelCode:(unsigned int)a3 options:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v4 = *(_QWORD *)&a3;
  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %u"), CFSTR("primaryLabelCode"), v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "socialGroupContext"))
  {
    v8 = (void *)MEMORY[0x1E0CB3528];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K > %d).@count > 0"), CFSTR("values"), CFSTR("valueName"), CFSTR("socialGroupVerifiedType"), CFSTR("intValue"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v15;
    goto LABEL_5;
  }
  v7 = v6;
  if (objc_msgSend(v5, "socialGroupContext") == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K == %d).@count > 0"), CFSTR("values"), CFSTR("valueName"), CFSTR("socialGroupVerifiedType"), CFSTR("intValue"), 1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v14;
LABEL_5:
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)graphQueryForSocialGroupsWithOptions:(id)a3
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

  v4 = a3;
  objc_msgSend(a1, "_graphBasePredicateWithLabelCode:options:", 1000, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pl_firstObjectPassingTest:", &__block_literal_global_36904);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "sortDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_graphFetchSocialGroupsObjectIDsSortedByDescriptors:library:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryForType:withBasePredicate:seedOIDs:inLibrary:", CFSTR("PHSocialGroup"), v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setGraphQueryType:", 2);
  }
  else
  {
    objc_msgSend(v4, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSocialGroup"), v5, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setGraphQueryType:", 1);
  }
  objc_msgSend(v12, "setFetchOptions:", v4);
  objc_msgSend(v12, "setGraphSubject:", 0);

  return v12;
}

+ (id)queryForSocialGroupsWithUUIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__36869;
  v25 = __Block_byref_object_dispose__36870;
  v26 = 0;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __54__PHGraphQuery_queryForSocialGroupsWithUUIDs_options___block_invoke;
  v18 = &unk_1E35DF920;
  v9 = v8;
  v19 = v9;
  v20 = &v21;
  objc_msgSend(v9, "performBlockAndWait:", &v15);
  v10 = v22[5];
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ AND %K IN %@"), CFSTR("primaryLabel"), v10, CFSTR("uuid"), v5, v15, v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSocialGroup"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setFetchOptions:", v6);
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

+ (id)graphQueryForPersonsInSocialGroup:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "memberPersonIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForPersonsWithObjectIDs:options:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setGraphSubject:", v7);
  objc_msgSend(v12, "setGraphQueryType:", 3);

  return v12;
}

+ (id)graphQueryForExclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "exclusiveAssetIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForVisibleAssetsWithObjectIDs:options:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setGraphSubject:", v7);
  objc_msgSend(v12, "setGraphQueryType:", 6);

  return v12;
}

+ (id)graphQueryForInclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "inclusiveAssetIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryForVisibleAssetsWithObjectIDs:options:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setGraphSubject:", v7);
  objc_msgSend(v12, "setGraphQueryType:", 5);

  return v12;
}

+ (id)graphQueryForKeyAssetForSocialGroup:(id)a3 createIfNeeded:(BOOL)a4 options:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[2];

  v6 = a4;
  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "keyAssetID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (v11)
  {
    objc_msgSend(v10, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHGraphQuery.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options.photoLibrary.managedObjectContext"));

    }
    objc_msgSend(v10, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __75__PHGraphQuery_graphQueryForKeyAssetForSocialGroup_createIfNeeded_options___block_invoke;
    v33[3] = &unk_1E35DEE50;
    v34 = v10;
    v35 = v11;
    v36 = &v37;
    objc_msgSend(v16, "performBlockAndWait:", v33);

  }
  if (_os_feature_enabled_impl())
  {
    v17 = !*((_BYTE *)v38 + 24) || v11 == 0;
    if (v17 && v6)
    {
      objc_msgSend(v9, "exclusiveAssetIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count") == 0;

      if (!v20)
      {
        objc_msgSend(v10, "photoLibrary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "photoAnalysisClient");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71960]), "initWithServiceProvider:", v22);
        v24 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v9, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setWithObject:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "updateKeyAssetOfSocialGroupsWithUUIDs:reply:", v26, &__block_literal_global_59);

      }
    }
  }
  if (v11)
  {
    v41[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v9, "photoLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryForVisibleAssetsWithObjectIDs:options:", v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setGraphSubject:", v9);
  objc_msgSend(v30, "setGraphQueryType:", 4);

  _Block_object_dispose(&v37, 8);
  return v30;
}

+ (id)graphQueryForAssetsForPerson:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__36869;
  v37 = __Block_byref_object_dispose__36870;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__36869;
  v31 = __Block_byref_object_dispose__36870;
  v32 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __53__PHGraphQuery_graphQueryForAssetsForPerson_options___block_invoke;
  v22 = &unk_1E35DE5F8;
  v25 = &v27;
  v10 = v6;
  v23 = v10;
  v11 = v9;
  v24 = v11;
  v26 = &v33;
  objc_msgSend(v11, "performBlockAndWait:", &v19);
  if (v28[5])
  {
    objc_msgSend(v10, "photoLibrary", v19, v20, v21, v22, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "queryForVisibleAssetsWithObjectIDs:options:", v28[5], v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGraphSubject:", v10);
    objc_msgSend(v14, "setGraphQueryType:", 7);
  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "uuid", v19, v20, v21, v22, v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v34[5];
      *(_DWORD *)buf = 136315650;
      v40 = "+[PHGraphQuery graphQueryForAssetsForPerson:options:]";
      v41 = 2112;
      v42 = v16;
      v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to fetch assets for person %@ with error: %@", buf, 0x20u);

    }
    v14 = 0;
    v13 = v7;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v14;
}

+ (id)queryForSearchEntitiesWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %u"), CFSTR("primaryLabelCode"), 1100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForType:withBasePredicate:inLibrary:](PHQuery, "queryForType:withBasePredicate:inLibrary:", CFSTR("PHSearchEntity"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchOptions:", v4);
  return v7;
}

+ (id)_graphFetchSocialGroupsObjectIDsSortedByDescriptors:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHGraphQuery.m"), 440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v8, "photoLibraryForCurrentQueueQoS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__36869;
  v25 = __Block_byref_object_dispose__36870;
  v26 = (id)MEMORY[0x1E0C9AA60];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke;
  v16[3] = &unk_1E35DE380;
  v11 = v7;
  v17 = v11;
  v12 = v10;
  v19 = &v21;
  v20 = a1;
  v18 = v12;
  objc_msgSend(v9, "performBlockAndWait:", v16);
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

+ (id)_filterSocialGroupsWithFetchResult:(id)a3 option:(id)a4 graphQuery:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
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
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  PHManualFetchResult *v31;
  void *v32;
  PHManualFetchResult *v33;
  const char *v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  v13 = objc_msgSend(v10, "socialGroupContext");
  if (v13 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13 != 1)
    {
      if (v13)
        goto LABEL_5;
      v14 = (void *)MEMORY[0x1E0CB3528];
      v36 = a1;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("socialGroupVerifiedType"), 1);
      v35 = a2;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v15;
      v16 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("socialGroupVerifiedType"), 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count > 0"), CFSTR("exclusiveAssetIDs"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "andPredicateWithSubpredicates:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "orPredicateWithSubpredicates:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      a1 = v36;
      a2 = v35;
      if (!v22)
        goto LABEL_5;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("socialGroupVerifiedType"), 1);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v24;
  if (!v24)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHGraphQuery.m"), 498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

    v22 = 0;
  }
LABEL_9:
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v12, "count"))
  {
    v26 = 0;
    while (1)
    {
      v27 = (void *)MEMORY[0x19AEBEADC]();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "evaluateWithObject:", v28))
      {
        objc_msgSend(v28, "objectID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v29);

      }
      if (objc_msgSend(v10, "fetchLimit"))
      {
        v30 = objc_msgSend(v25, "count");
        if (v30 == objc_msgSend(v10, "fetchLimit"))
          break;
      }

      objc_autoreleasePoolPop(v27);
      if (objc_msgSend(v12, "count") <= (unint64_t)++v26)
        goto LABEL_18;
    }

    objc_autoreleasePoolPop(v27);
  }
LABEL_18:
  v31 = [PHManualFetchResult alloc];
  objc_msgSend(v12, "photoLibrary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:graphQuery:](v31, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:graphQuery:", v25, v32, CFSTR("PHSocialGroup"), 0, 0, 1, v11);

  return v33;
}

+ (id)_nodeTableFromNodeValuesInFetchResult:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("node"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("node.uuid"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0C99E08];
          v25 = CFSTR("objectID");
          v26 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dictionaryWithDictionary:", v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("uuid"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);

        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("valueName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHSocialGroup propertyNameFromNodeValueName:](PHSocialGroup, "propertyNameFromNodeValueName:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHSocialGroup nodeValueKeyPathForNodeValueName:](PHSocialGroup, "nodeValueKeyPathForNodeValueName:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v15);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }

  return v4;
}

void __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pl_map:", &__block_literal_global_95);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71798], "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %u AND %K IN %@"), CFSTR("node.primaryLabelCode"), 1000, CFSTR("valueName"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setResultType:", 2);
  v17[0] = CFSTR("valueName");
  v17[1] = CFSTR("intValue");
  v17[2] = CFSTR("stringValue");
  v17[3] = CFSTR("node");
  v17[4] = CFSTR("node.uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v6);

  v7 = *(void **)(a1 + 40);
  v16 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v4, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  objc_msgSend(*(id *)(a1 + 56), "_nodeTableFromNodeValuesInFetchResult:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_pl_map:", &__block_literal_global_108_36877);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

uint64_t __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("objectID"));
}

id __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSocialGroup nodeValueNameFromPropertyName:](PHSocialGroup, "nodeValueNameFromPropertyName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__PHGraphQuery_graphQueryForAssetsForPerson_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v2 = (void *)MEMORY[0x1E0D71B28];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v2, "fetchAssetIDsHavingAssetPersonEdgesToPersonID:inManagedObjectContext:error:", v3, v4, &v16);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v16;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  v14 = v6;
  v15 = v14;
  if (!v9)
    v12 = objc_retainAutorelease(v14);

  objc_storeStrong(v11, v12);
}

void __75__PHGraphQuery_graphQueryForKeyAssetForSocialGroup_createIfNeeded_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isVisibleForSocialGroupKeyAssetFetch");
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Error getting social group key asset from assetID: %@", buf, 0xCu);
    }

  }
}

void __75__PHGraphQuery_graphQueryForKeyAssetForSocialGroup_createIfNeeded_options___block_invoke_57(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_ERROR, "Error updating key asset for social group: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __54__PHGraphQuery_queryForSocialGroupsWithUUIDs_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pl_graphCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectIDForLabelWithCode:inContext:", 1000, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

BOOL __53__PHGraphQuery_graphQueryForSocialGroupsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSocialGroup nodeValueNameFromPropertyName:](PHSocialGroup, "nodeValueNameFromPropertyName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

@end
