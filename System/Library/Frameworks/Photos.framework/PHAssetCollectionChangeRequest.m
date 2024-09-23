@implementation PHAssetCollectionChangeRequest

- (id)initForNewObject
{
  PHAssetCollectionChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *assetsHelper;
  PHRelationshipChangeRequestHelper *v7;
  PHRelationshipChangeRequestHelper *customKeyAssetHelper;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHAssetCollectionChangeRequest;
  v2 = -[PHChangeRequest init](&v10, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("assets"), v2->super._helper);
    assetsHelper = v2->_assetsHelper;
    v2->_assetsHelper = v5;

    v7 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("customKeyAsset"), v2->super._helper);
    customKeyAssetHelper = v2->_customKeyAssetHelper;
    v2->_customKeyAssetHelper = v7;

  }
  return v2;
}

- (PHAssetCollectionChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHAssetCollectionChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *assetsHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *customKeyAssetHelper;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetCollectionChangeRequest;
  v8 = -[PHChangeRequest init](&v16, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("assets"), v8->super._helper);
    assetsHelper = v8->_assetsHelper;
    v8->_assetsHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("customKeyAsset"), v8->super._helper);
    customKeyAssetHelper = v8->_customKeyAssetHelper;
    v8->_customKeyAssetHelper = v13;

  }
  return v8;
}

- (PHAssetCollectionChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHAssetCollectionChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *assetsHelper;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *customKeyAssetHelper;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHAssetCollectionChangeRequest;
  v11 = -[PHChangeRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("assets"), v8, v11->super._helper);
      assetsHelper = v11->_assetsHelper;
      v11->_assetsHelper = v14;

      v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("customKeyAsset"), v8, v11->super._helper);
      customKeyAssetHelper = v11->_customKeyAssetHelper;
      v11->_customKeyAssetHelper = v16;

    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHAssetCollectionChangeRequest assetsHelper](self, "assetsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

  -[PHAssetCollectionChangeRequest customKeyAssetHelper](self, "customKeyAssetHelper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeToXPCDict:", v4);

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("Album");
}

- (PHObjectPlaceholder)placeholderForCreatedAssetCollection
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (unsigned)customSortKey
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("customSortKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v5, "intValue");
  return v3;
}

- (void)setCustomSortKey:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("customSortKey"));

}

- (BOOL)customSortAscending
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("customSortAscending"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setCustomSortAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("customSortAscending"));

}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setTitle:(NSString *)title
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;

  v10 = title;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("title"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("title"));
  }

}

- (BOOL)isPinned
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isPinned"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setIsPinned:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isPinned"));

}

- (void)_prepareCustomKeyAssetIDIfNeeded
{
  void *v3;
  void *v4;
  PHRelationshipChangeRequestHelper *customKeyAssetHelper;
  void *v6;
  id v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_customKeyAssetHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_customKeyAssetHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customKeyAssetHelper, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    customKeyAssetHelper = self->_customKeyAssetHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](customKeyAssetHelper, "originalObjectIDs");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](customKeyAssetHelper, "setMutableObjectIDsAndUUIDs:", v6);

  }
}

- (id)_mutableCustomKeyAssetObjectIDsAndUUIDs
{
  -[PHAssetCollectionChangeRequest _prepareCustomKeyAssetIDIfNeeded](self, "_prepareCustomKeyAssetIDIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customKeyAssetHelper, "mutableObjectIDsAndUUIDs");
}

- (void)setCustomKeyAsset:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  PLObjectIDOrUUIDFromPHObject(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (self->_originalAssetCollection
      || (-[PHChangeRequest helper](self, "helper"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isNewRequest"),
          v5,
          v6))
    {
      -[PHChangeRequest didMutate](self, "didMutate");
      -[PHAssetCollectionChangeRequest _mutableAssetsObjectIDsAndUUIDs](self, "_mutableAssetsObjectIDsAndUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v4) & 1) == 0)
        -[PHAssetCollectionChangeRequest addAsset:](self, "addAsset:", v10);
      -[PHAssetCollectionChangeRequest _mutableCustomKeyAssetObjectIDsAndUUIDs](self, "_mutableCustomKeyAssetObjectIDsAndUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAllObjects");

      -[PHAssetCollectionChangeRequest _mutableCustomKeyAssetObjectIDsAndUUIDs](self, "_mutableCustomKeyAssetObjectIDsAndUUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

    }
  }

}

- (void)_setOriginalAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_originalAssetCollection, a3);
}

- (void)_prepareWithFetchResult:(id)a3
{
  void *v4;
  PHRelationshipChangeRequestHelper *assetsHelper;
  void *v6;
  id v7;

  v7 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_assetsHelper, "originalObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    assetsHelper = self->_assetsHelper;
    objc_msgSend(v7, "fetchedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](assetsHelper, "setOriginalObjectIDs:", v6);

  }
}

- (void)_prepareAssetIDsIfNeeded
{
  void *v3;
  PHAssetCollection *originalAssetCollection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHRelationshipChangeRequestHelper *assetsHelper;
  void *v10;
  id v11;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_assetsHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    originalAssetCollection = self->_originalAssetCollection;
    if (originalAssetCollection)
    {
      +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", originalAssetCollection, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executeQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetCollectionChangeRequest _prepareWithFetchResult:](self, "_prepareWithFetchResult:", v6);

    }
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_assetsHelper, "originalObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_assetsHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    assetsHelper = self->_assetsHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](assetsHelper, "originalObjectIDs");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](assetsHelper, "setMutableObjectIDsAndUUIDs:", v10);

  }
}

- (id)_mutableAssetsObjectIDsAndUUIDs
{
  -[PHAssetCollectionChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
}

- (void)insertAsset:(id)a3 inAssetsAtIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = a3;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = a3;
    objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4, v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAssetCollectionChangeRequest insertAssets:atIndexes:](self, "insertAssets:atIndexes:", v8, v9);
  }
}

- (void)removeAssetFromAssetsAtIndex:(unint64_t)a3
{
  id v4;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PHAssetCollectionChangeRequest removeAssetsAtIndexes:](self, "removeAssetsAtIndexes:", v4);

  }
}

- (void)insertAssets:(id)assets atIndexes:(NSIndexSet *)indexes
{
  id v6;
  NSIndexSet *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = assets;
  v7 = indexes;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!v10)
        {
          -[PHChangeRequest didMutate](self, "didMutate");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
    if (v10)
    {
      -[PHAssetCollectionChangeRequest _mutableAssetsObjectIDsAndUUIDs](self, "_mutableAssetsObjectIDsAndUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertObjects:atIndexes:", v10, v7);

    }
  }

}

- (void)removeAssetsAtIndexes:(NSIndexSet *)indexes
{
  void *v4;
  NSIndexSet *v5;

  v5 = indexes;
  if (-[NSIndexSet count](v5, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHAssetCollectionChangeRequest _mutableAssetsObjectIDsAndUUIDs](self, "_mutableAssetsObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsAtIndexes:", v5);

  }
}

- (void)replaceAssetInAssetsAtIndex:(unint64_t)a3 withAsset:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0CB36B8];
    v7 = a4;
    objc_msgSend(v6, "indexSetWithIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAssetCollectionChangeRequest replaceAssetsAtIndexes:withAssets:](self, "replaceAssetsAtIndexes:withAssets:", v8, v9);
  }
}

- (void)replaceAssetsAtIndexes:(NSIndexSet *)indexes withAssets:(id)assets
{
  NSIndexSet *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = indexes;
  v7 = assets;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!v10)
        {
          -[PHChangeRequest didMutate](self, "didMutate");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
    if (v10)
    {
      -[PHAssetCollectionChangeRequest _mutableAssetsObjectIDsAndUUIDs](self, "_mutableAssetsObjectIDsAndUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceObjectsAtIndexes:withObjects:", v6, v10);

    }
  }

}

- (void)moveAssetsAtIndexes:(NSIndexSet *)fromIndexes toIndex:(NSUInteger)toIndex
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSIndexSet *v10;

  v10 = fromIndexes;
  if (-[NSIndexSet count](v10, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHAssetCollectionChangeRequest _mutableAssetsObjectIDsAndUUIDs](self, "_mutableAssetsObjectIDsAndUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsAtIndexes:", v10);
    v8 = -[NSIndexSet count](v10, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", toIndex, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObjects:atIndexes:", v7, v9);

  }
}

- (void)addAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAssetCollectionChangeRequest addAssets:](self, "addAssets:", v6, v7, v8);
  }
}

- (void)removeAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAssetCollectionChangeRequest removeAssets:](self, "removeAssets:", v6, v7, v8);
  }
}

- (void)addAssets:(id)assets
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = assets;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          -[PHChangeRequest didMutate](self, "didMutate");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
    if (v7)
    {
      -[PHAssetCollectionChangeRequest _mutableAssetsObjectIDsAndUUIDs](self, "_mutableAssetsObjectIDsAndUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v7);

    }
  }

}

- (void)removeAssets:(id)assets
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = assets;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          -[PHChangeRequest didMutate](self, "didMutate");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
    if (v7)
    {
      -[PHAssetCollectionChangeRequest _mutableAssetsObjectIDsAndUUIDs](self, "_mutableAssetsObjectIDsAndUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectsInArray:", v7);

    }
  }

}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  id v9;

  -[PHAssetCollectionChangeRequest title](self, "title", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend((id)objc_opt_class(), "validateAssetCollectionTitle:error:", v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (a4 && !v6)
    *a4 = objc_retainAutorelease(v7);

  return v6 != 0;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71778], "insertNewAlbumIntoLibrary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v7);

  if (!a4 || v6)
  {
    -[PHChangeRequest helper](self, "helper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
      objc_msgSend(v6, "setImportedByBundleIdentifier:", v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create asset collection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v11 = objc_msgSend(v10, "allowMutationToManagedObject:propertyKey:error:", v8, v9, &v26);
  v12 = v26;

  if (!v11)
    goto LABEL_11;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("title")))
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("customKeyAsset")))
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property %@"), v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v20;
      v18 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v22;
      goto LABEL_14;
    }
    if (objc_msgSend(v8, "kindValue") != 2)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation on property %@"), v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v14;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v30;
      v17 = &v29;
      goto LABEL_10;
    }
LABEL_7:
    v18 = 1;
    goto LABEL_14;
  }
  if ((objc_msgSend(v8, "canPerformEditOperation:", 64) & 1) != 0)
    goto LABEL_7;
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v31 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation on property %@"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v14;
  v15 = (void *)MEMORY[0x1E0C99D80];
  v16 = (void **)v32;
  v17 = &v31;
LABEL_10:
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v12 = (id)v24;
LABEL_11:
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v18 = 0;
    *a5 = v12;
  }
  else
  {
    v18 = 0;
  }
LABEL_14:

  return v18;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  char v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void **v38;
  uint64_t *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  id v47;
  id v48[2];
  uint8_t buf[4];
  _BOOL4 v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  int v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = 0;
  PLSafeEntityForNameInManagedObjectContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;

  if (v11)
  {
    objc_msgSend(v8, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isKindOfEntity:", v11);

    if (v14)
    {
      v15 = objc_msgSend(v8, "kindValue");
      if (v15 > 1504)
      {
        if (v15 != 1508 && v15 != 1505)
          goto LABEL_27;
      }
      else if (v15 != 2 && v15 != 1000)
      {
        goto LABEL_27;
      }
      if (!objc_msgSend(v8, "isCloudSharedAlbum")
        || -[PHChangeRequest isClientEntitled](self, "isClientEntitled"))
      {
        -[PHChangeRequest helper](self, "helper");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v12;
        v18 = objc_msgSend(v17, "applyMutationsToManagedObject:error:", v8, v48);
        v19 = v48[0];

        if (!v18)
        {
          v16 = 0;
LABEL_31:
          v12 = v19;
          if (!a5)
            goto LABEL_34;
          goto LABEL_32;
        }
        PLPhotoKitGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = -[PHChangeRequest isMutated](self, "isMutated");
          -[PHChangeRequest helper](self, "helper");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "mutations");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C0950);
          if (v24)
            v24 = objc_msgSend(v8, "isCloudSharedAlbum");
          *(_DWORD *)buf = 67109634;
          v50 = v21;
          v51 = 2112;
          v52 = v23;
          v53 = 1024;
          v54 = v24;
          _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update %d", buf, 0x18u);

        }
        if (-[PHChangeRequest isMutated](self, "isMutated"))
        {
          -[PHChangeRequest helper](self, "helper");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "mutations");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", CFSTR("title"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C0950))
            {
              if (objc_msgSend(v8, "isCloudSharedAlbum"))
              {
                v28 = (void *)MEMORY[0x1E0D719E0];
                objc_msgSend(v9, "pathManager");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "libraryURL");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v28) = objc_msgSend(v28, "sharedStreamsEnabledForPhotoLibraryURL:", v30);

                if ((_DWORD)v28)
                  objc_msgSend(MEMORY[0x1E0D719E0], "updateCloudSharedAlbumMetadataOnServer:", v8);
              }
            }
          }
        }
        -[PHAssetCollectionChangeRequest assetsHelper](self, "assetsHelper");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "mutableObjectIDsAndUUIDs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v33 = v8;
          objc_msgSend(v31, "setAllowsInsert:", objc_msgSend(v33, "canPerformEditOperation:", 4));
          objc_msgSend(v31, "setAllowsMove:", objc_msgSend(v33, "canPerformEditOperation:", 16));
          objc_msgSend(v31, "setAllowsRemove:", objc_msgSend(v33, "canPerformEditOperation:", 2));
          objc_msgSend(MEMORY[0x1E0D71880], "entityName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setDestinationEntityName:", v34);

          objc_msgSend(v31, "setIsDestinationObjectValid:", &__block_literal_global_22960);
          if ((objc_msgSend(v33, "conformsToProtocol:", &unk_1EE3C09B0) & 1) != 0)
            objc_msgSend(v33, "userEditableAssets");
          else
            objc_msgSend(v33, "mutableAssets");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v19;
          v45 = objc_msgSend(v31, "applyMutationsToManagedObject:orderedMutableChildren:error:", v33, v42, &v47);
          v12 = v47;

          if (!v45)
          {
            v16 = 0;
            if (!a5)
              goto LABEL_34;
LABEL_32:
            if ((v16 & 1) == 0)
              goto LABEL_33;
            goto LABEL_34;
          }
          v19 = v12;
        }
        else
        {

        }
        -[PHAssetCollectionChangeRequest customKeyAssetHelper](self, "customKeyAssetHelper");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "mutableObjectIDsAndUUIDs");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v43)
        {
          v16 = 1;
          goto LABEL_30;
        }
        objc_msgSend(v36, "setAllowsInsert:", 1);
        objc_msgSend(MEMORY[0x1E0D71880], "entityName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setDestinationEntityName:", v44);

        v46 = v19;
        v16 = objc_msgSend(v36, "applyMutationsToManagedObjectToOneRelationship:error:", v8, &v46);
        v40 = v46;
LABEL_29:

        v19 = v40;
LABEL_30:

        goto LABEL_31;
      }
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot modify iCloud Shared Streams"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v36;
      v37 = (void *)MEMORY[0x1E0C99D80];
      v38 = (void **)v58;
      v39 = &v57;
LABEL_28:
      objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v19);
      v40 = (id)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      goto LABEL_29;
    }
LABEL_27:
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid album type"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v36;
    v37 = (void *)MEMORY[0x1E0C99D80];
    v38 = &v56;
    v39 = &v55;
    goto LABEL_28;
  }
  if (a5)
  {
LABEL_33:
    v12 = objc_retainAutorelease(v12);
    v16 = 0;
    *a5 = v12;
    goto LABEL_34;
  }
  v16 = 0;
LABEL_34:

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAssetCollectionChangeRequest;
  -[PHAssetCollectionChangeRequest description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollectionChangeRequest title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_assetsHelper, "mutableObjectIDsAndUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" title=%@ hasAssetChanges=%d"), v4, v5 != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (PHAssetCollection)originalAssetCollection
{
  return self->_originalAssetCollection;
}

- (void)setOriginalAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_originalAssetCollection, a3);
}

- (PHRelationshipChangeRequestHelper)assetsHelper
{
  return self->_assetsHelper;
}

- (PHRelationshipChangeRequestHelper)customKeyAssetHelper
{
  return self->_customKeyAssetHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_assetsHelper, 0);
  objc_storeStrong((id *)&self->_originalAssetCollection, 0);
}

uint64_t __83__PHAssetCollectionChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

+ (id)_changeRequestForAssetCollection:(id)a3 optionalAssets:(id)a4
{
  id v5;
  id v6;
  PHAssetCollectionChangeRequest *v7;
  PHAssetCollectionChangeRequest *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isTransient") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = [PHAssetCollectionChangeRequest alloc];
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHAssetCollectionChangeRequest initWithUUID:objectID:](v8, "initWithUUID:objectID:", v9, v10);

    -[PHAssetCollectionChangeRequest _setOriginalAssetCollection:](v7, "_setOriginalAssetCollection:", v5);
    if (v6)
      -[PHAssetCollectionChangeRequest _prepareWithFetchResult:](v7, "_prepareWithFetchResult:", v6);
  }

  return v7;
}

+ (PHAssetCollectionChangeRequest)changeRequestForAssetCollection:(PHAssetCollection *)assetCollection
{
  return (PHAssetCollectionChangeRequest *)objc_msgSend(a1, "_changeRequestForAssetCollection:optionalAssets:", assetCollection, 0);
}

+ (PHAssetCollectionChangeRequest)creationRequestForAssetCollectionWithTitle:(NSString *)title
{
  NSString *v3;
  id v4;

  v3 = title;
  v4 = -[PHAssetCollectionChangeRequest initForNewObject]([PHAssetCollectionChangeRequest alloc], "initForNewObject");
  objc_msgSend(v4, "setTitle:", v3);

  return (PHAssetCollectionChangeRequest *)v4;
}

+ (id)validateAssetCollectionTitle:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a3;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Empty title unsupported"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v8)
    *a4 = objc_retainAutorelease(v9);
LABEL_7:

  return v8;
}

+ (id)creationRequestForAssetCollectionCopyFromAssetCollection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  __int128 *p_buf;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "assetCollectionType") == 1)
  {
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = objc_claimAutoreleasedReturnValue();

    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__23246;
    v42 = __Block_byref_object_dispose__23247;
    v43 = 0;
    objc_msgSend(v4, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __91__PHAssetCollectionChangeRequest_creationRequestForAssetCollectionCopyFromAssetCollection___block_invoke;
    v20 = &unk_1E35DAD50;
    v10 = v4;
    v21 = v10;
    v22 = &v34;
    v23 = &v30;
    v24 = &v26;
    p_buf = &buf;
    objc_msgSend(v9, "performBlockAndWait:", &v17);

    objc_msgSend(v10, "title", v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "creationRequestForAssetCollectionWithTitle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAssets:", v7);
    objc_msgSend(v12, "setCustomSortKey:", *((unsigned int *)v35 + 6));
    objc_msgSend(v12, "setCustomSortAscending:", *((_DWORD *)v31 + 6) != 0);
    objc_msgSend(v12, "setIsPinned:", *((unsigned __int8 *)v27 + 24));
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v38 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v13, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCustomKeyAsset:", v15);

    }
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Asset collection type is not an user album: %@", (uint8_t *)&buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

+ (void)deleteAssetCollections:(id)assetCollections
{
  objc_msgSend(a1, "_deleteAssetCollections:withOperation:topLevelSelector:", assetCollections, 0, a2);
}

+ (void)expungeAssetCollections:(id)a3
{
  objc_msgSend(a1, "_deleteAssetCollections:withOperation:topLevelSelector:", a3, 1, a2);
}

+ (void)undeleteAssetCollections:(id)a3
{
  objc_msgSend(a1, "_deleteAssetCollections:withOperation:topLevelSelector:", a3, 2, a2);
}

+ (void)_deleteAssetCollections:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[PHObject assertAllObjects:forSelector:areOfType:](PHObject, "assertAllObjects:forSelector:areOfType:", v7, a5, objc_opt_class());
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHCollectionDeleteRequest, "deleteRequestForObject:operation:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), a4, (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

void __91__PHAssetCollectionChangeRequest_creationRequestForAssetCollectionCopyFromAssetCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0D71778];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumWithObjectID:inLibrary:", v3, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "customSortKey");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "customSortAscending");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v11, "isPinned");
  objc_msgSend(v11, "customKeyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v11, "customKeyAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

@end
