@implementation PHManualFetchResult

- (id)fetchedObjectIDs
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[PHManualFetchResult objects](self, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PHManualFetchResult objects](self, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[PHManualFetchResult isFullyBackedByObjectIDs](self, "isFullyBackedByObjectIDs"))
  {
    -[NSOrderedSet array](self->_objectIDs, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)objects
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_graphQuery, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8
{
  return -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:photosCount:videosCount:audiosCount:batchSize:](self, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:photosCount:videosCount:audiosCount:batchSize:", a3, a4, a5, a6, a7, a8, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 photosCount:(unint64_t)a9 videosCount:(unint64_t)a10 audiosCount:(unint64_t)a11
{
  return -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:photosCount:videosCount:audiosCount:batchSize:](self, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:photosCount:videosCount:audiosCount:batchSize:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (id)fetchSortDescriptors
{
  return 0;
}

- (PHManualFetchResult)initWithObjects:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PHManualFetchResult *v19;
  uint64_t v20;
  NSArray *objects;
  uint64_t v22;
  NSString *fetchType;
  uint64_t v24;
  NSSet *fetchPropertySets;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  NSOrderedSet *objectIDs;
  NSOrderedSet *v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  void *v56;
  _BOOL4 v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  uint64_t v66;

  v8 = a8;
  v66 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v64.receiver = self;
  v64.super_class = (Class)PHManualFetchResult;
  v19 = -[PHFetchResult init](&v64, sel_init);
  if (!v19)
    goto LABEL_31;
  v57 = v8;
  v20 = objc_msgSend(v14, "copy");
  objects = v19->_objects;
  v19->_objects = (NSArray *)v20;

  v22 = objc_msgSend(v16, "copy");
  fetchType = v19->super._fetchType;
  v19->super._fetchType = (NSString *)v22;

  v24 = objc_msgSend(v17, "copy");
  fetchPropertySets = v19->super._fetchPropertySets;
  v19->super._fetchPropertySets = (NSSet *)v24;

  v58 = v15;
  v26 = v15;
  v27 = v26;
  if (!v26)
  {
    objc_msgSend(v14, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", 0, v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v56 = v27;
  objc_storeStrong((id *)&v19->_photoLibrary, v27);
  objc_msgSend(v14, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v55 = v16;
  v59 = v17;
  if (v29)
  {
    objc_msgSend(v29, "photoLibrary");
    v31 = objc_claimAutoreleasedReturnValue();
    if ((id)v31 != v26)
    {
      v32 = (void *)v31;
      objc_msgSend(v30, "photoLibrary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "description");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "containsString:", CFSTR("Mock")) & 1) != 0)
      {
        objc_msgSend(v30, "photoLibrary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "photoLibraryURL");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "photoLibraryURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "path");
        v52 = v33;
        v37 = v14;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v35, "compare:", v38);

        v14 = v37;
        v16 = v55;

        v17 = v59;
        if (!v50)
          goto LABEL_13;
      }
      else
      {

        v17 = v59;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("PHManualFetchResult.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstObject == nil || firstObject.photoLibrary == photoLibrary || ([firstObject.photoLibrary.description containsString:@\"Mock\"] && [firstObject.photoLibrary.photoLibraryURL.path compare:photoLibrary.photoLibraryURL.path] == NSOrderedSame)"));
    }

  }
LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[NSArray isFullyBackedByObjectIDs](v19->_objects, "isFullyBackedByObjectIDs"))
  {
    -[NSArray objectIDs](v19->_objects, "objectIDs");
    v39 = objc_claimAutoreleasedReturnValue();
    objectIDs = v19->_objectIDs;
    v19->_objectIDs = (NSOrderedSet *)v39;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", -[NSArray count](v19->_objects, "count"));
    v41 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v42 = v19->_objects;
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v61 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "objectID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
            -[NSOrderedSet addObject:](v41, "addObject:", v47);

        }
        v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v44);
    }

    objectIDs = v19->_objectIDs;
    v19->_objectIDs = v41;
    v16 = v55;
    v17 = v59;
  }

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "UUIDString");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_storeStrong((id *)&v19->_identifier, v18);
  if (v57)
    -[PHFetchResult setRegisteredForChangeNotificationDeltas:](v19, "setRegisteredForChangeNotificationDeltas:", 1);

  v15 = v58;
LABEL_31:

  return v19;
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 batchSize:(unint64_t)a9
{
  return -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:photosCount:videosCount:audiosCount:batchSize:](self, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:photosCount:videosCount:audiosCount:batchSize:", a3, a4, a5, a6, a7, a8, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, a9);
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 photosCount:(unint64_t)a9 videosCount:(unint64_t)a10 audiosCount:(unint64_t)a11 batchSize:(unint64_t)a12
{
  id v17;
  id v18;
  id v19;
  void *v20;
  PHManualFetchResult *v21;
  uint64_t v22;
  NSString *fetchType;
  uint64_t v24;
  NSSet *fetchPropertySets;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  PHGraphQuery *graphQuery;
  void *v31;
  void *v32;
  PHBatchFetchingArray *v33;
  NSArray *objects;
  void *v35;
  void *v37;
  _BOOL4 v38;
  id v39;
  id v40;
  objc_super v41;

  v38 = a8;
  v40 = a3;
  v39 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  +[PHFetchResultMediaTypeCounts mediaTypeCountsWithPhotosCount:videosCount:audiosCount:](PHFetchResultMediaTypeCounts, "mediaTypeCountsWithPhotosCount:videosCount:audiosCount:", a9, a10, a11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = self;
  v41.super_class = (Class)PHManualFetchResult;
  v21 = -[PHFetchResult initWithMediaTypeCounts:](&v41, sel_initWithMediaTypeCounts_, v20);
  if (v21)
  {
    v22 = objc_msgSend(v17, "copy");
    fetchType = v21->super._fetchType;
    v21->super._fetchType = (NSString *)v22;

    v24 = objc_msgSend(v18, "copy");
    fetchPropertySets = v21->super._fetchPropertySets;
    v21->super._fetchPropertySets = (NSSet *)v24;

    objc_storeStrong((id *)&v21->_photoLibrary, a4);
    if (v21->super._fetchType && -[NSSet count](v21->super._fetchPropertySets, "count"))
      v26 = -[objc_class propertyFetchHintsForPropertySets:](+[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v21->super._fetchType), "propertyFetchHintsForPropertySets:", v21->super._fetchPropertySets);
    else
      v26 = 2;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("propertyHint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("batchSize"));

    graphQuery = v21->_graphQuery;
    if (graphQuery)
    {
      -[PHGraphQuery extraBatchFetchingArrayOptions](graphQuery, "extraBatchFetchingArrayOptions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addEntriesFromDictionary:", v31);

    }
    v32 = v40;
    v33 = -[PHBatchFetchingArray initWithOIDs:options:photoLibrary:]([PHBatchFetchingArray alloc], "initWithOIDs:options:photoLibrary:", v40, v27, v21->_photoLibrary);
    objects = v21->_objects;
    v21->_objects = &v33->super;

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)&v21->_identifier, v19);
    v17 = v37;
    if (v38)
      -[PHFetchResult setRegisteredForChangeNotificationDeltas:](v21, "setRegisteredForChangeNotificationDeltas:", 1);

  }
  else
  {
    v32 = v40;
  }

  return v21;
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 graphQuery:(id)obj
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PHManualFetchResult *v21;

  v9 = a8;
  objc_storeStrong((id *)&self->_graphQuery, obj);
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:batchSize:](self, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:batchSize:", v20, v19, v18, v17, v16, v9, 0);

  return v21;
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 graphQuery:(id)a9 batchSize:(unint64_t)a10
{
  _BOOL8 v10;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PHManualFetchResult *v22;

  v10 = a8;
  objc_storeStrong((id *)&self->_graphQuery, a9);
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:batchSize:](self, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:batchSize:", v21, v20, v19, v18, v17, v10, a10);

  return v22;
}

- (NSOrderedSet)objectIDs
{
  NSOrderedSet *objectIDs;
  NSArray *v5;
  void *v6;
  NSOrderedSet *v7;
  NSOrderedSet *v8;
  void *v10;

  objectIDs = self->_objectIDs;
  if (!objectIDs)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHManualFetchResult.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_objects isKindOfClass:[PHBatchFetchingArray class]]"));

    }
    v5 = self->_objects;
    -[NSArray oids](v5, "oids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
    v7 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_objectIDs;
    self->_objectIDs = v7;

    objectIDs = self->_objectIDs;
  }
  return objectIDs;
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
  v9.super_class = (Class)PHManualFetchResult;
  if (-[PHManualFetchResult isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[PHManualFetchResult identifier](self, "identifier");
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

  -[PHManualFetchResult identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHManualFetchResult;
    v5 = -[PHManualFetchResult hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (id)calculateMediaTypeCounts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  if (-[NSArray count](self->_objects, "count"))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x19AEBEADC]();
      objc_opt_class();
      -[NSArray objectAtIndexedSubscript:](self->_objects, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (v10)
      {
        v11 = objc_msgSend(v10, "mediaType");
        switch(v11)
        {
          case 3:
            ++v5;
            break;
          case 2:
            ++v4;
            break;
          case 1:
            ++v3;
            break;
        }
      }

      objc_autoreleasePoolPop(v7);
      ++v6;
    }
    while (v6 < -[NSArray count](self->_objects, "count"));
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v3 = 0;
  }
  return -[PHFetchResultMediaTypeCounts initWithPhotosCount:videosCount:audiosCount:]([PHFetchResultMediaTypeCounts alloc], "initWithPhotosCount:videosCount:audiosCount:", v3, v4, v5);
}

- (id)copyWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  PHManualFetchResult *v11;
  void *v12;
  id *v13;

  v4 = a3;
  -[PHManualFetchResult objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invalidateCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v8, "BOOLValue"))
  {
    objc_msgSend(v7, "oids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHFetchResult isRegisteredForChangeNotificationDeltas](self, "isRegisteredForChangeNotificationDeltas");
    v11 = [PHManualFetchResult alloc];
    -[PHManualFetchResult photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:batchSize:](v11, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:batchSize:", v9, v12, self->super._fetchType, self->super._fetchPropertySets, 0, v10, 0);

    objc_storeStrong(v13 + 21, self->_graphQuery);
  }
  else
  {
    v13 = (id *)-[PHManualFetchResult copy](self, "copy");
  }

  return v13;
}

- (BOOL)isFullyBackedByObjectIDs
{
  NSUInteger v3;
  void *v4;

  v3 = -[NSArray count](self->_objects, "count");
  -[PHManualFetchResult objectIDs](self, "objectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 == objc_msgSend(v4, "count");

  return v3;
}

- (id)changeHandlingKey
{
  return self->_identifier;
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  void *v5;
  void *v6;

  if (self->_graphQuery)
  {
    -[PHGraphQuery updatedQueryWithChange:](self->_graphQuery, "updatedQueryWithChange:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PHManualFetchResult fetchResultWithChangeHandlingValue:](self, "fetchResultWithChangeHandlingValue:", 0, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (void)prefetchObjectsAtIndexes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PHManualFetchResult objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "prefetchObjectsAtIndexes:", v5);

}

- (id)fetchRequest
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

- (id)fetchedObjectIDsSet
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[PHManualFetchResult objects](self, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PHManualFetchResult objects](self, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oidsSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[PHManualFetchResult isFullyBackedByObjectIDs](self, "isFullyBackedByObjectIDs"))
  {
    -[NSOrderedSet set](self->_objectIDs, "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PHManualFetchResult objects](self, "objects");
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
  id v6;
  id v7;
  PHGraphQuery *graphQuery;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  graphQuery = self->_graphQuery;
  if (graphQuery)
  {
    v9 = -[PHGraphQuery possibleChangesForChange:](graphQuery, "possibleChangesForChange:", v6);
    if (v9 == 15)
      goto LABEL_26;
  }
  else
  {
    v9 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "deletedObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[PHManualFetchResult objectIDs](self, "objectIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v16, "containsObject:", v15);

        if ((_DWORD)v15)
        {
          v9 |= 2uLL;
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "updatedObjectIDs", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[PHManualFetchResult objectIDs](self, "objectIDs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = objc_msgSend(v23, "containsObject:", v22);

        if ((_DWORD)v22)
        {
          v9 |= 8uLL;
          goto LABEL_25;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_25:

LABEL_26:
  return v9;
}

- (id)fetchUpdatedObjects
{
  void *v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PHFetchResult fetchPropertySets](self, "fetchPropertySets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult fetchType](self, "fetchType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PHPhotoLibrary classForFetchType:](PHPhotoLibrary, "classForFetchType:", v4);

  v6 = 2;
  if (objc_msgSend(v3, "count") && v5)
  {
    -[PHFetchResult fetchPropertySets](self, "fetchPropertySets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[objc_class propertyFetchHintsForPropertySets:](v5, "propertyFetchHintsForPropertySets:", v7);

  }
  -[PHManualFetchResult photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHManualFetchResult objectIDs](self, "objectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchPHObjectsForOIDs:propertyHint:includeTrash:overrideResultsWithClass:", v10, v6, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PHManualFetchResult)fetchResultWithChangeHandlingValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  PHManualFetchResult *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PHManualFetchResult *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[PHManualFetchResult fetchUpdatedObjects](self, "fetchUpdatedObjects");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }

  v15 = (void *)MEMORY[0x1E0C99DE8];
  -[PHManualFetchResult objects](self, "objects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PHManualFetchResult objects](self, "objects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        if (objc_msgSend(v23, "isTransient"))
        {
          objc_msgSend(v17, "addObject:", v23);
        }
        else
        {
          objc_msgSend(v23, "objectID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            objc_msgSend(v17, "addObject:", v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }

  v26 = [PHManualFetchResult alloc];
  -[PHManualFetchResult photoLibrary](self, "photoLibrary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult fetchType](self, "fetchType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult fetchPropertySets](self, "fetchPropertySets");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHManualFetchResult identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v26, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v17, v27, v28, v29, v30, 0);

  return v31;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHManualFetchResult;
  -[PHFetchResult description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

+ (id)emptyFetchResultWithPhotoLibrary:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v4, 0, 0, 0, 0);

  return v6;
}

+ (id)emptyFetchResultWithPhotoLibrary:(id)a3 fetchType:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v7, v6, 0, 0, 0);

  return v9;
}

@end
