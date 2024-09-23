@implementation PHRecentContentSyndicationCollectionsResult

- (BOOL)_hasReachedGroupCapacity
{
  return -[NSArray count](self->_objects, "count") == self->_maxNumberOfStacks;
}

- (id)_transientCollectionForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_objects;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "transientIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_transientCollectionForAssetOID:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  void *v7;
  id v8;
  _OWORD v10[4];
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v10, 0, sizeof(v10));
  v5 = self->_objects;
  if (-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v10, v11, 16))
  {
    v6 = (void *)**((_QWORD **)&v10[0] + 1);
    objc_msgSend(**((id **)&v10[0] + 1), "assetOids", *(_QWORD *)&v10[0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containsObject:", v4);

    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PHRecentContentSyndicationCollectionsResult)initWithObjects:(id)a3 photoLibrary:(id)a4 fetchOptions:(id)a5 maxNumberOfStacks:(int64_t)a6 maxNumberOfAssetsPerStack:(int64_t)a7 fetchType:(id)a8 fetchPropertySets:(id)a9 identifier:(id)a10 registerIfNeeded:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PHRecentContentSyndicationCollectionsResult *v23;
  uint64_t v24;
  NSArray *objects;
  uint64_t v26;
  NSString *fetchType;
  uint64_t v28;
  PHFetchOptions *fetchOptions;
  uint64_t v30;
  NSSet *fetchPropertySets;
  id v32;
  void *v33;
  void *v34;
  objc_super v36;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v36.receiver = self;
  v36.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
  v23 = -[PHFetchResult init](&v36, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    objects = v23->_objects;
    v23->_objects = (NSArray *)v24;

    v26 = objc_msgSend(v20, "copy");
    fetchType = v23->super._fetchType;
    v23->super._fetchType = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    fetchOptions = v23->_fetchOptions;
    v23->_fetchOptions = (PHFetchOptions *)v28;

    v30 = objc_msgSend(v21, "copy");
    fetchPropertySets = v23->super._fetchPropertySets;
    v23->super._fetchPropertySets = (NSSet *)v30;

    v23->_maxNumberOfStacks = a6;
    v23->_maxNumberOfAssetsPerStack = a7;
    v32 = v18;
    if (!v32)
    {
      objc_msgSend(v17, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v19, v33);
      v32 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)&v23->_photoLibrary, v32);
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "UUIDString");
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)&v23->_identifier, v22);
    if (a11)
      -[PHFetchResult setRegisteredForChangeNotificationDeltas:](v23, "setRegisteredForChangeNotificationDeltas:", 1);

  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
  if (-[PHRecentContentSyndicationCollectionsResult isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[PHRecentContentSyndicationCollectionsResult identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[PHRecentContentSyndicationCollectionsResult identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
    v5 = -[PHRecentContentSyndicationCollectionsResult hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (id)copyWithOptions:(id)a3
{
  void *v4;
  PHRecentContentSyndicationCollectionsResult *v5;
  PHPhotoLibrary *photoLibrary;
  PHFetchOptions *fetchOptions;
  int64_t maxNumberOfStacks;
  int64_t maxNumberOfAssetsPerStack;
  NSString *fetchType;
  NSSet *fetchPropertySets;
  NSString *identifier;
  PHRecentContentSyndicationCollectionsResult *v13;
  uint64_t v15;

  -[PHRecentContentSyndicationCollectionsResult objects](self, "objects", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PHRecentContentSyndicationCollectionsResult alloc];
  photoLibrary = self->_photoLibrary;
  fetchOptions = self->_fetchOptions;
  maxNumberOfStacks = self->_maxNumberOfStacks;
  maxNumberOfAssetsPerStack = self->_maxNumberOfAssetsPerStack;
  fetchType = self->super._fetchType;
  fetchPropertySets = self->super._fetchPropertySets;
  identifier = self->_identifier;
  LOBYTE(v15) = -[PHFetchResult isRegisteredForChangeNotificationDeltas](self, "isRegisteredForChangeNotificationDeltas");
  v13 = -[PHRecentContentSyndicationCollectionsResult initWithObjects:photoLibrary:fetchOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v5, "initWithObjects:photoLibrary:fetchOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v4, photoLibrary, fetchOptions, maxNumberOfStacks, maxNumberOfAssetsPerStack, fetchType, fetchPropertySets, identifier, v15);

  return v13;
}

- (id)changeHandlingKey
{
  return self->_identifier;
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PHRecentContentSyndicationCollectionsResult *v19;
  PHRecentContentSyndicationCollectionsResult *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_25542);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredSetUsingPredicate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        -[PHRecentContentSyndicationCollectionsResult _transientCollectionForAssetOID:](self, "_transientCollectionForAssetOID:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14), (_QWORD)v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {

          goto LABEL_12;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "updatedObjectIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredSetUsingPredicate:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "count");
  if (v18)
  {
LABEL_12:
    +[PHAssetCollection fetchRecentContentSyndicationAssetCollectionsWithOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:](PHAssetCollection, "fetchRecentContentSyndicationAssetCollectionsWithOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:", self->_fetchOptions, self->_maxNumberOfStacks, self->_maxNumberOfAssetsPerStack, (_QWORD)v22);
    v19 = (PHRecentContentSyndicationCollectionsResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = self;
  }
  v20 = v19;

  return v20;
}

- (id)additionalChangedIdentifiersFromPreviousIdentifiers:(id)a3 currentIdentifiers:(id)a4 inFetchResultBeforeChanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  void *v26;
  id v27;
  id obj;
  PHRecentContentSyndicationCollectionsResult *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = v8;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v9;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intersectSet:", v12);

  v30 = v10;
  v29 = self;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v30, "_transientCollectionForIdentifier:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHRecentContentSyndicationCollectionsResult _transientCollectionForIdentifier:](v29, "_transientCollectionForIdentifier:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "assetOids");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "assetOids");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToArray:", v22);

        if ((v23 & 1) == 0)
          objc_msgSend(v27, "addObject:", v17);

        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  return v27;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (id)fetchRequest
{
  return 0;
}

- (id)fetchSortDescriptors
{
  return 0;
}

- (int64_t)collectionFetchType
{
  return 1;
}

- (id)containerIdentifier
{
  return 0;
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PHRecentContentSyndicationCollectionsResult objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateRegistrationForChangeNotificationDeltas
{
  -[PHFetchResult setRegisteredForChangeNotificationDeltas:](self, "setRegisteredForChangeNotificationDeltas:", 1);
}

- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v41;
  unint64_t v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v44 = a3;
  objc_msgSend(v44, "insertedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v54;
    v8 = 1;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v9), "entity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D71880], "entityName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v44, "deletedObjectIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v15)
  {
    v16 = v15;
    v41 = v8;
    v17 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v19, "entity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D71880], "entityName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if (v23)
        {
          -[PHRecentContentSyndicationCollectionsResult _transientCollectionForAssetOID:](self, "_transientCollectionForAssetOID:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v8 = v41 | 0xA;
            goto LABEL_21;
          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v16)
        continue;
      break;
    }
    v8 = v41;
  }
LABEL_21:

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v44, "updatedObjectIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v26)
  {
    v27 = v26;
    v42 = v8;
    v28 = *(_QWORD *)v46;
    while (2)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v30, "entity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D71880], "entityName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqualToString:", v33);

        if (v34)
        {
          v35 = (void *)MEMORY[0x1E0D71A28];
          v57[0] = CFSTR("syndicationState");
          v57[1] = CFSTR("savedAssetType");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D71880], "entityName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v35, "indexValueForAttributeNames:entity:", v36, v37);

          objc_msgSend(v30, "entity");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v38) = objc_msgSend(v44, "anyUpdatedObjectsWithChangedAttributes:ofEntity:", v38, v39);

          if ((v38 & 1) != 0)
          {
            v8 = 11;
            goto LABEL_32;
          }
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      if (v27)
        continue;
      break;
    }
    v8 = v42;
  }
LABEL_32:

  return v8;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
  -[PHFetchResult description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)objects
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
}

uint64_t __117__PHRecentContentSyndicationCollectionsResult_changeHandlingValueUsingSeedOids_withChange_usingManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (id)pointerComparableIdentifiersFromIdentifiers:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v5 = 0;
LABEL_19:
    v16 = v3;
    goto LABEL_20;
  }
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "longLongValue", (_QWORD)v19);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 < 1 || (v12 & 0x8000000000000000) == 0)
        {
          PLPhotoKitGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v24 = v11;
            _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Unable to translate value: %lld in PHRecentContentSyndicationCollectionsResult to a tagged pointer equivalent.", buf, 0xCu);
          }

          goto LABEL_15;
        }
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

  if (!v5)
    goto LABEL_19;
  v15 = objc_msgSend(v5, "count");
  if (v15 != objc_msgSend(v6, "count"))
    goto LABEL_19;
  v16 = v5;
  v5 = v16;
LABEL_20:
  v17 = v16;

  return v17;
}

@end
