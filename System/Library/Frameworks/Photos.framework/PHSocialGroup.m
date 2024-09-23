@implementation PHSocialGroup

- (id)memberPersonIDs
{
  return self->_memberPersonIDs;
}

- (id)inclusiveAssetIDs
{
  return self->_inclusiveAssetIDs;
}

- (id)exclusiveAssetIDs
{
  return self->_exclusiveAssetIDs;
}

- (id)keyAssetID
{
  return self->_keyAssetID;
}

- (PHSocialGroup)initWithNodeContainer:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHSocialGroup *v12;
  uint64_t v13;
  NSString *customTitle;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSSet *memberPersonIDs;
  void *v24;
  uint64_t v25;
  NSSet *inclusiveAssetIDs;
  void *v27;
  uint64_t v28;
  NSSet *exclusiveAssetIDs;
  void *v30;
  void *v31;
  uint64_t v32;
  NSManagedObjectID *keyAssetID;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44[0] = MEMORY[0x1E0C9AAA0];
  v43[0] = CFSTR("deleted");
  v43[1] = CFSTR("uuid");
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v8;
  v43[2] = CFSTR("objectID");
  objc_msgSend(v6, "sourceNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v41.receiver = self;
  v41.super_class = (Class)PHSocialGroup;
  v12 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v41, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v11, 2, v7);
  if (v12)
  {
    objc_msgSend(v6, "customTitle");
    v13 = objc_claimAutoreleasedReturnValue();
    customTitle = v12->_customTitle;
    v12->_customTitle = (NSString *)v13;

    v12->_socialGroupVerifiedType = objc_msgSend(v6, "socialGroupVerifiedType");
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v6, "members", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "objectID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v18);
    }

    v22 = objc_msgSend(v15, "copy");
    memberPersonIDs = v12->_memberPersonIDs;
    v12->_memberPersonIDs = (NSSet *)v22;

    objc_msgSend(v6, "inclusiveAssetIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    inclusiveAssetIDs = v12->_inclusiveAssetIDs;
    v12->_inclusiveAssetIDs = (NSSet *)v25;

    objc_msgSend(v6, "exclusiveAssetIDs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    exclusiveAssetIDs = v12->_exclusiveAssetIDs;
    v12->_exclusiveAssetIDs = (NSSet *)v28;

    objc_msgSend(v6, "keyAsset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    keyAssetID = v12->_keyAssetID;
    v12->_keyAssetID = (NSManagedObjectID *)v32;

    objc_msgSend(v6, "manualOrder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_manualOrder = objc_msgSend(v34, "integerValue");

    objc_msgSend(v6, "automaticOrder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_automaticOrder = objc_msgSend(v35, "integerValue");

    v12->_keyAssetPickSource = objc_msgSend(v6, "keyAssetPickSource");
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PHObject objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSocialGroup customTitle](self, "customTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ customTitle=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v11.receiver = self;
  v11.super_class = (Class)PHSocialGroup;
  -[PHObject description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHObject uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("UUID: %@, "), v6);

  -[PHSocialGroup customTitle](self, "customTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Custom Title: %@, "), v7);

  objc_msgSend(v5, "appendFormat:", CFSTR("Number of Inclusive Assets: %lu, "), -[NSSet count](self->_inclusiveAssetIDs, "count"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Number of Exclusive Assets: %lu, "), -[NSSet count](self->_exclusiveAssetIDs, "count"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Manual Order: %ld, "), -[PHSocialGroup manualOrder](self, "manualOrder"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Automatic Order: %ld, "), -[PHSocialGroup automaticOrder](self, "automaticOrder"));
  v8 = -[PHSocialGroup socialGroupVerifiedType](self, "socialGroupVerifiedType") + 1;
  if (v8 > 3)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E35D5D80[v8];
  objc_msgSend(v5, "appendFormat:", CFSTR("Verified Type: %@, "), v9);
  objc_msgSend(v5, "appendFormat:", CFSTR("Key Asset ID: %@, "), self->_keyAssetID);
  objc_msgSend(v5, "appendFormat:", CFSTR("Key Asset pick source: %lld, "), -[PHSocialGroup keyAssetPickSource](self, "keyAssetPickSource"));
  return v5;
}

- (id)exclusiveAssetInternalPredicateWithPeopleCount:(int64_t)a3 exactCount:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)MEMORY[0x1E0CB3880];
  -[PHSocialGroup exclusiveAssetIDs](self, "exclusiveAssetIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("self in %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  if (v4)
    v11 = CFSTR("%K.@count == %d");
  else
    v11 = CFSTR("%K.@count >= %d");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v11, CFSTR("detectedFaces"), a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (signed)socialGroupVerifiedType
{
  return self->_socialGroupVerifiedType;
}

- (int64_t)manualOrder
{
  return self->_manualOrder;
}

- (int64_t)automaticOrder
{
  return self->_automaticOrder;
}

- (int64_t)keyAssetPickSource
{
  return self->_keyAssetPickSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_keyAssetID, 0);
  objc_storeStrong((id *)&self->_exclusiveAssetIDs, 0);
  objc_storeStrong((id *)&self->_inclusiveAssetIDs, 0);
  objc_storeStrong((id *)&self->_memberPersonIDs, 0);
}

+ (id)nodeValueNameFromPHSocialGroupPropertyName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("objectID")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("uuid")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71788], "entityName");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHSocialGroup");
  return CFSTR("PHSocialGroup");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 0;
}

+ (id)identifierCode
{
  return CFSTR("071");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_693;
}

+ (id)propertyNameFromNodeValueName:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("node")) & 1) != 0)
  {
    v4 = CFSTR("objectID");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("node.uuid")) & 1) != 0)
  {
    v4 = CFSTR("uuid");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

+ (id)nodeValueKeyPathForNodeValueName:(id)a3
{
  id v5;
  const __CFString *v6;
  void *v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("manualOrder")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("automaticOrder")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("socialGroupVerifiedType")) & 1) != 0)
  {
    v6 = CFSTR("intValue");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("customTitle")) & 1) != 0)
  {
    v6 = CFSTR("stringValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSocialGroup.m"), 196, CFSTR("Unsupported propertyName: %@"), v5);

    v6 = 0;
  }

  return (id)v6;
}

+ (id)nodeValueNameFromPropertyName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("objectID")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("uuid")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

+ (id)fetchSocialGroupsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_684);
}

+ (id)fetchSocialGroupsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "_pl_map:", &__block_literal_global_106);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchSocialGroupsWithUUIDs:options:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchSocialGroupsWithUUIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PHSocialGroup_fetchSocialGroupsWithUUIDs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsPassingExclusiveContainmentForPersons:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSocialGroup.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUIDs.count > 1"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__672;
  v25 = __Block_byref_object_dispose__673;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibraryForCurrentQueueQoS");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PHSocialGroup_fetchAssetsPassingExclusiveContainmentForPersons_options___block_invoke;
  v17[3] = &unk_1E35DEE50;
  v11 = v7;
  v18 = v11;
  v12 = v10;
  v19 = v12;
  v20 = &v21;
  objc_msgSend(v12, "performBlockAndWait:", v17);
  objc_msgSend((id)v22[5], "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchVisibleAssetsWithObjectIDs:options:](PHAsset, "fetchVisibleAssetsWithObjectIDs:options:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __74__PHSocialGroup_fetchAssetsPassingExclusiveContainmentForPersons_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71940], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("personUUID"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v4, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  objc_msgSend(v6, "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(v10, "count");
    if (v11 >= objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v15 = objc_alloc(MEMORY[0x1E0D71B30]);
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "initWithPersons:inContext:", v10, v16);

      v23 = 0;
      -[NSObject runAssetContainment:](v12, "runAssetContainment:", &v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      objc_msgSend(v17, "exclusiveAssetIDs");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        PLBackendGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v18;
          _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Error running asset containment with persons: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      objc_msgSend(v10, "valueForKey:", CFSTR("personUUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject minusSet:](v12, "minusSet:", v13);

      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v12;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "fetchAssetsPassingExclusiveContainmentForPersons: persons with these UUIDs not found: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Error fetching persons with IDs: %@", buf, 0xCu);
    }
  }

}

id __52__PHSocialGroup_fetchSocialGroupsWithUUIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHGraphQuery queryForSocialGroupsWithUUIDs:options:](PHGraphQuery, "queryForSocialGroupsWithUUIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __63__PHSocialGroup_fetchSocialGroupsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", a2);
}

PHFetchResult *__46__PHSocialGroup_fetchSocialGroupsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  PHFetchResult *v4;
  PHFetchResult *v5;

  +[PHGraphQuery graphQueryForSocialGroupsWithOptions:](PHGraphQuery, "graphQueryForSocialGroupsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "executeQuery");
    v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(PHFetchResult);
  }
  v5 = v4;

  return v5;
}

void __29__PHSocialGroup_entityKeyMap__block_invoke()
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
  _QWORD v10[2];
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
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
  v16[1] = CFSTR("objectID");
  v14 = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v2;
  v16[2] = CFSTR("changeFlag0");
  v13 = CFSTR("socialGroupVerifiedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v3;
  v16[3] = CFSTR("changeFlag2");
  v12 = CFSTR("memberPersonIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v4;
  v16[4] = CFSTR("changeFlag3");
  v11 = CFSTR("keyAssetID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v5;
  v16[5] = CFSTR("changeFlag4");
  v10[0] = CFSTR("inclusiveAssetIDs");
  v10[1] = CFSTR("exclusiveAssetIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v7);
  v9 = (void *)entityKeyMap_pl_once_object_15_693;
  entityKeyMap_pl_once_object_15_693 = v8;

}

@end
