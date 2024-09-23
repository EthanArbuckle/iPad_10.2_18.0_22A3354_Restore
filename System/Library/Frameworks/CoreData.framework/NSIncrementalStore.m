@implementation NSIncrementalStore

- (BOOL)load:(id *)a3
{
  return 1;
}

+ (id)identifierForNewStoreAtURL:(NSURL *)storeURL
{
  return +[_PFRoutines _getUUID]();
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  void *v7;

  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption")));
  v6 = objc_msgSend(v5, "loadMetadata:", a4);
  v7 = 0;
  if (v6)
    v7 = (void *)objc_msgSend(v5, "metadata");

  return v7;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  void *v7;
  NSSaveChangesRequest *v8;
  uint64_t v9;

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, a4, 0);
  objc_msgSend(v7, "setMetadata:", a3);
  v8 = objc_alloc_init(NSSaveChangesRequest);
  v9 = objc_msgSend(v7, "executeRequest:withContext:error:", v8, 0, a5);

  return v9 != 0;
}

- (void)dealloc
{
  objc_super v3;

  self->_storeMetadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSIncrementalStore;
  -[NSPersistentStore dealloc](&v3, sel_dealloc);
}

- (id)metadata
{
  NSDictionary *storeMetadata;
  id v4;
  unint64_t lastIdentifier;
  id v6;
  NSDictionary *v7;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;

  storeMetadata = self->_storeMetadata;
  if (storeMetadata)
  {
    v4 = -[NSDictionary objectForKey:](storeMetadata, "objectForKey:", CFSTR("_NSMetadataLastIdentifier"));
    lastIdentifier = self->_lastIdentifier;
    if (lastIdentifier != objc_msgSend(v4, "unsignedLongValue"))
    {
      v6 = (id)-[NSDictionary mutableCopy](self->_storeMetadata, "mutableCopy");
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_lastIdentifier), CFSTR("_NSMetadataLastIdentifier"));

      v7 = (NSDictionary *)objc_msgSend(v6, "copy");
LABEL_7:
      self->_storeMetadata = v7;

    }
  }
  else
  {
    v12 = 0;
    if (!-[NSIncrementalStore loadMetadata:](self, "loadMetadata:", &v12))
    {
      v9 = v12;
      if (v12)
      {
        v10 = (const __CFString *)*MEMORY[0x1E0CB3388];
      }
      else
      {
        v9 = CFSTR("Unknown failure");
        v10 = CFSTR("Reason");
      }
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, v10);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to load metadata"), v11));
    }
    if (!self->_storeMetadata)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend((id)objc_opt_class(), "identifierForNewStoreAtURL:", -[NSPersistentStore URL](self, "URL")), CFSTR("NSStoreUUID"));
      self->_lastIdentifier = 0;
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0), CFSTR("_NSMetadataLastIdentifier"));
      v7 = (NSDictionary *)-[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:](self, "_updatedMetadataWithSeed:includeVersioning:", v6, 1);
      goto LABEL_7;
    }
  }
  return self->_storeMetadata;
}

- (void)setMetadata:(id)a3
{
  -[NSIncrementalStore _setMetadata:includeVersioning:](self, "_setMetadata:includeVersioning:", a3, 1);
}

- (BOOL)loadMetadata:(NSError *)error
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSArray)obtainPermanentIDsForObjects:(NSArray *)array error:(NSError *)error
{
  NSUInteger v7;
  NSArray *v8;
  NSUInteger v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSManagedObjectID *v13;

  v7 = -[NSArray count](array, "count");
  if (__CFADD__(v7, self->_lastIdentifier))
  {
    v8 = 0;
    if (error)
      *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Keyspace exhausted"), CFSTR("Problem")));
  }
  else
  {
    v9 = v7;
    v8 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        v11 = objc_msgSend(-[NSArray objectAtIndex:](array, "objectAtIndex:", i), "entity");
        v12 = (void *)MEMORY[0x1E0CB37E8];
        ++self->_lastIdentifier;
        v13 = -[NSIncrementalStore newObjectIDForEntity:referenceObject:](self, "newObjectIDForEntity:referenceObject:", v11, objc_msgSend(v12, "numberWithUnsignedLongLong:"));
        -[NSArray addObject:](v8, "addObject:", v13);

      }
    }
  }
  return v8;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSArray *v16;
  BOOL v17;
  _QWORD *v18;
  id v19;
  id v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count"))
    return 1;
  v28 = 0;
  v23 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "allObjects");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v15, "objectID"), "isTemporaryID"))
          objc_msgSend(v10, "addObject:", v15);
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }
  v16 = -[NSIncrementalStore obtainPermanentIDsForObjects:error:](self, "obtainPermanentIDsForObjects:error:", v10, &v28);
  v17 = v16 != 0;
  if (v16)
  {
    v18 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](a4, v10, v16);
    if (v18)
      -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)a3, (uint64_t)v18);

  }
  v19 = v28;
  objc_msgSend(v23, "drain");
  v20 = v28;
  if (v28)
  {
    if (a5)
      *a5 = v28;
    v21 = v20;
  }
  return v17;
}

- (NSIncrementalStoreNode)newValuesForObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)newValueForRelationship:(NSRelationshipDescription *)relationship forObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSManagedObjectID)newObjectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data
{
  return (NSManagedObjectID *)objc_msgSend(objc_alloc((Class)-[NSPersistentStore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:", entity)), "initWithObject:", data);
}

- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID
{
  if ((NSIncrementalStore *)-[NSManagedObjectID persistentStore](objectID, "persistentStore") != self)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot retrieve referenceObject from an objectID that was not created by this store"), 0));
  return -[NSManagedObjectID _referenceData](objectID, "_referenceData");
}

- (id)_rawMetadata__
{
  return self->_storeMetadata;
}

- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t lastIdentifier;
  id v12;
  objc_super v13;

  v4 = a4;
  v7 = -[NSDictionary objectForKey:](self->_storeMetadata, "objectForKey:", CFSTR("_NSMetadataLastIdentifier"));
  if (self->_storeMetadata != a3 || (v8 = self->_lastIdentifier, v8 != objc_msgSend(v7, "unsignedLongValue")))
  {
    v9 = (void *)objc_msgSend(a3, "mutableCopy");
    v10 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("_NSMetadataLastIdentifier"));
    if (v10)
    {
      lastIdentifier = self->_lastIdentifier;
      if (lastIdentifier > objc_msgSend(v10, "unsignedLongValue"))
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_lastIdentifier), CFSTR("_NSMetadataLastIdentifier"));
    }
    v12 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:](self, "_updatedMetadataWithSeed:includeVersioning:", v9, v4);

    v13.receiver = self;
    v13.super_class = (Class)NSIncrementalStore;
    -[NSPersistentStore setMetadata:](&v13, sel_setMetadata_, v12);

    self->_storeMetadata = (NSDictionary *)v12;
  }
}

- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
