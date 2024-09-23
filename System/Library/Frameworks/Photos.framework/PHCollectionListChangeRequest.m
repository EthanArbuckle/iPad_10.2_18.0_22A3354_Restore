@implementation PHCollectionListChangeRequest

- (id)initForNewObject
{
  PHCollectionListChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *collectionsHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCollectionListChangeRequest;
  v2 = -[PHChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("childCollections"), v2->super._helper);
    collectionsHelper = v2->_collectionsHelper;
    v2->_collectionsHelper = v5;

  }
  return v2;
}

- (PHCollectionListChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHCollectionListChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *collectionsHelper;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHCollectionListChangeRequest;
  v8 = -[PHChangeRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("childCollections"), v8->super._helper);
    collectionsHelper = v8->_collectionsHelper;
    v8->_collectionsHelper = v11;

  }
  return v8;
}

- (PHCollectionListChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHCollectionListChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *collectionsHelper;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PHCollectionListChangeRequest;
  v11 = -[PHChangeRequest init](&v17, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("childCollections"), v8, v11->super._helper);
      collectionsHelper = v11->_collectionsHelper;
      v11->_collectionsHelper = v14;

    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHCollectionListChangeRequest collectionsHelper](self, "collectionsHelper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("Folder");
}

- (PHObjectPlaceholder)placeholderForCreatedCollectionList
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

- (void)_setOriginalCollectionList:(id)a3
{
  objc_storeStrong((id *)&self->_originalCollectionList, a3);
}

- (void)_prepareWithFetchResult:(id)a3
{
  void *v4;
  PHRelationshipChangeRequestHelper *collectionsHelper;
  void *v6;
  id v7;

  v7 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_collectionsHelper, "originalObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    collectionsHelper = self->_collectionsHelper;
    objc_msgSend(v7, "fetchedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](collectionsHelper, "setOriginalObjectIDs:", v6);

  }
}

- (void)_prepareAssetIDsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHRelationshipChangeRequestHelper *collectionsHelper;
  void *v11;
  id v12;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_collectionsHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_originalCollectionList)
    {
      +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "librarySpecificFetchOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[PHCollectionListChangeRequest isTopLevelUserCollection](self, "isTopLevelUserCollection"))
        +[PHQuery queryForTopLevelUserCollectionsWithOptions:](PHQuery, "queryForTopLevelUserCollectionsWithOptions:", v5);
      else
        +[PHQuery queryForCollectionsInCollectionList:options:](PHQuery, "queryForCollectionsInCollectionList:options:", self->_originalCollectionList, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "executeQuery");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHCollectionListChangeRequest _prepareWithFetchResult:](self, "_prepareWithFetchResult:", v7);

    }
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_collectionsHelper, "originalObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_collectionsHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_collectionsHelper, "mutableObjectIDsAndUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    collectionsHelper = self->_collectionsHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](collectionsHelper, "originalObjectIDs");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](collectionsHelper, "setMutableObjectIDsAndUUIDs:", v11);

  }
}

- (id)_mutableObjectIDsAndUUIDs
{
  -[PHCollectionListChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_collectionsHelper, "mutableObjectIDsAndUUIDs");
}

- (void)insertChildCollection:(id)a3 inChildCollectionsAtIndex:(unint64_t)a4
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

    -[PHCollectionListChangeRequest insertChildCollections:atIndexes:](self, "insertChildCollections:atIndexes:", v8, v9);
  }
}

- (void)removeChildCollectionFromChildCollectionsAtIndex:(unint64_t)a3
{
  id v4;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PHCollectionListChangeRequest removeChildCollectionsAtIndexes:](self, "removeChildCollectionsAtIndexes:", v4);

  }
}

- (void)insertChildCollections:(id)collections atIndexes:(NSIndexSet *)indexes
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
  v6 = collections;
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
      -[PHCollectionListChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertObjects:atIndexes:", v10, v7);

    }
  }

}

- (void)removeChildCollectionsAtIndexes:(NSIndexSet *)indexes
{
  void *v4;
  NSIndexSet *v5;

  v5 = indexes;
  if (-[NSIndexSet count](v5, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHCollectionListChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsAtIndexes:", v5);

  }
}

- (void)replaceChildCollectionsAtIndex:(unint64_t)a3 withChildCollection:(id)a4
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

    -[PHCollectionListChangeRequest replaceChildCollectionsAtIndexes:withChildCollections:](self, "replaceChildCollectionsAtIndexes:withChildCollections:", v8, v9);
  }
}

- (void)replaceChildCollectionsAtIndexes:(NSIndexSet *)indexes withChildCollections:(id)collections
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
  v7 = collections;
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
      -[PHCollectionListChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceObjectsAtIndexes:withObjects:", v6, v10);

    }
  }

}

- (void)moveChildCollectionsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)toIndex
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSIndexSet *v10;

  v10 = indexes;
  if (-[NSIndexSet count](v10, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHCollectionListChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
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

- (void)addChildCollection:(id)a3
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

    -[PHCollectionListChangeRequest addChildCollections:](self, "addChildCollections:", v6, v7, v8);
  }
}

- (void)removeChildCollection:(id)a3
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

    -[PHCollectionListChangeRequest removeChildCollections:](self, "removeChildCollections:", v6, v7, v8);
  }
}

- (void)addChildCollections:(id)collections
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
  v4 = collections;
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
      -[PHCollectionListChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v7);

    }
  }

}

- (void)removeChildCollections:(id)collections
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
  v4 = collections;
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
      -[PHCollectionListChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectsInArray:", v7);

    }
  }

}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71898], "insertNewFolderWithTitle:kind:intoLibrary:", 0, 4000, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v7);

  if (a4 && !v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create collection list"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
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
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v11 = objc_msgSend(v10, "allowMutationToManagedObject:propertyKey:error:", v8, v9, &v23);
  v12 = v23;

  if (!v11)
    goto LABEL_5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("title")))
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("customSortKey")) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("customSortAscending")) & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property %@"), v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v19;
      v17 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v21;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ((objc_msgSend(v8, "canPerformEditOperation:", 64) & 1) != 0)
  {
LABEL_9:
    v17 = 1;
    goto LABEL_12;
  }
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation on property %@"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v12 = (id)v16;
LABEL_5:
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v17 = 0;
    *a5 = v12;
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
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
  void *v31;
  char v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  int v44;
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v15 = 0;
    v32 = 0;
    goto LABEL_17;
  }
  v10 = objc_msgSend(v7, "kindValue");
  objc_msgSend(v7, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isKindOfEntity:", v9);

  if (!v12 || (v10 - 3998) >= 3)
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid collection list type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v20);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0;
LABEL_11:

    v15 = v33;
    goto LABEL_12;
  }
  -[PHChangeRequest helper](self, "helper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v14 = objc_msgSend(v13, "applyMutationsToManagedObject:error:", v7, &v45);
  v15 = v45;

  if (!v14)
  {
    v32 = 0;
    if (!a5)
      goto LABEL_17;
    goto LABEL_15;
  }
  -[PHCollectionListChangeRequest collectionsHelper](self, "collectionsHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mutableObjectIDsAndUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v7;
    objc_msgSend(v16, "setAllowsInsert:", objc_msgSend(v18, "canPerformEditOperation:", 4));
    objc_msgSend(v16, "setAllowsMove:", objc_msgSend(v18, "canPerformEditOperation:", 16));
    objc_msgSend(v16, "setAllowsRemove:", objc_msgSend(v18, "canPerformEditOperation:", 2));
    objc_msgSend(MEMORY[0x1E0D71778], "entityName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDestinationEntityName:", v19);

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __82__PHCollectionListChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke;
    v42[3] = &unk_1E35D76C8;
    v20 = v18;
    v43 = v20;
    v44 = v10;
    objc_msgSend(v16, "setIsDestinationObjectValid:", v42);
    if (-[PHCollectionListChangeRequest isTopLevelUserCollection](self, "isTopLevelUserCollection"))
    {
      +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "librarySpecificFetchOptions");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3528];
      +[PHCollection predicateForUserCollections](PHCollection, "predicateForUserCollections");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "notPredicateWithSubpredicate:", v23);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      +[PHQuery queryForTopLevelCollectionsMatchingPredicate:options:](PHQuery, "queryForTopLevelCollectionsMatchingPredicate:options:", v38, v39);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "executeQuery");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fetchedObjectIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "originalObjectIDs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v25);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setOriginalObjectIDs:", v36);
      objc_msgSend(v16, "mutableObjectIDsAndUUIDs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fetchedObjectIDs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB36B8];
      objc_msgSend(v40, "fetchedObjectIDs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "indexSetWithIndexesInRange:", 0, objc_msgSend(v29, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "insertObjects:atIndexes:", v27, v30);

    }
    objc_msgSend(v20, "albums", v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v15;
    v32 = objc_msgSend(v16, "applyMutationsToManagedObject:orderedMutableChildren:error:", v20, v31, &v41);
    v33 = v41;

    goto LABEL_11;
  }
  v32 = 1;
LABEL_12:

  if (!a5)
    goto LABEL_17;
LABEL_15:
  if ((v32 & 1) == 0)
  {
    v15 = objc_retainAutorelease(v15);
    v32 = 0;
    *a5 = v15;
  }
LABEL_17:

  return v32;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCollectionListChangeRequest;
  -[PHCollectionListChangeRequest description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCollectionListChangeRequest title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_collectionsHelper, "mutableObjectIDsAndUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" title=%@ hasAssetChanges=%d"), v4, v5 != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (PHRelationshipChangeRequestHelper)collectionsHelper
{
  return self->_collectionsHelper;
}

- (BOOL)isTopLevelUserCollection
{
  return self->_isTopLevelUserCollection;
}

- (void)setIsTopLevelUserCollection:(BOOL)a3
{
  self->_isTopLevelUserCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionsHelper, 0);
  objc_storeStrong((id *)&self->_originalCollectionList, 0);
}

uint64_t __82__PHCollectionListChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  int v11;
  id v12;
  int v13;
  int v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    do
    {
      v7 = v4;
      objc_msgSend(v4, "objectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqual:", v8);

      objc_msgSend(v7, "parentFolder");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v4 && !v9);

    if ((v9 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

  }
  v10 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "isSmartAlbum");

    if (v11)
    {
      v12 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_18:
        v17 = 0;
        goto LABEL_19;
      }
      v13 = objc_msgSend(v12, "isUserCreated");

      if (!v13)
        goto LABEL_18;
    }
  }
  else
  {

  }
  v14 = *(_DWORD *)(a1 + 40);
  v15 = v10;
  objc_opt_class();
  v16 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "kindValue") == 1508;

  v17 = (v14 != 3998) ^ v16;
LABEL_19:

  return v17;
}

+ (id)_changeRequestForCollectionList:(id)a3 optionalChildCollections:(id)a4
{
  id v5;
  id v6;
  PHCollectionListChangeRequest *v7;
  PHCollectionListChangeRequest *v8;
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
    v8 = [PHCollectionListChangeRequest alloc];
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHCollectionListChangeRequest initWithUUID:objectID:](v8, "initWithUUID:objectID:", v9, v10);

    -[PHCollectionListChangeRequest _setOriginalCollectionList:](v7, "_setOriginalCollectionList:", v5);
    if (v6)
      -[PHCollectionListChangeRequest _prepareWithFetchResult:](v7, "_prepareWithFetchResult:", v6);
  }

  return v7;
}

+ (PHCollectionListChangeRequest)changeRequestForCollectionList:(PHCollectionList *)collectionList
{
  return (PHCollectionListChangeRequest *)objc_msgSend(a1, "_changeRequestForCollectionList:optionalChildCollections:", collectionList, 0);
}

+ (PHCollectionListChangeRequest)changeRequestForTopLevelCollectionListUserCollections:(PHFetchResult *)childCollections
{
  PHFetchResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = childCollections;
  +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHCollectionList fetchRootAlbumCollectionListWithOptions:](PHCollectionList, "fetchRootAlbumCollectionListWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_changeRequestForCollectionList:optionalChildCollections:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIsTopLevelUserCollection:", 1);
  return (PHCollectionListChangeRequest *)v9;
}

+ (PHCollectionListChangeRequest)creationRequestForCollectionListWithTitle:(NSString *)title
{
  NSString *v3;
  id v4;

  v3 = title;
  v4 = -[PHCollectionListChangeRequest initForNewObject]([PHCollectionListChangeRequest alloc], "initForNewObject");
  objc_msgSend(v4, "setTitle:", v3);

  return (PHCollectionListChangeRequest *)v4;
}

+ (void)deleteCollectionLists:(id)collectionLists
{
  objc_msgSend(a1, "_deleteCollectionLists:withOperation:topLevelSelector:", collectionLists, 0, a2);
}

+ (void)expungeCollectionLists:(id)a3
{
  objc_msgSend(a1, "_deleteCollectionLists:withOperation:topLevelSelector:", a3, 1, a2);
}

+ (void)undeleteCollectionLists:(id)a3
{
  objc_msgSend(a1, "_deleteCollectionLists:withOperation:topLevelSelector:", a3, 2, a2);
}

+ (void)_deleteCollectionLists:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5
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

@end
