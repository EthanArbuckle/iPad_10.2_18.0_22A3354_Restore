@implementation NSPersistentStoreMap

+ (void)initialize
{
  objc_opt_self();
}

- (NSPersistentStoreMap)initWithStore:(id)a3
{
  NSPersistentStoreMap *v4;
  NSPersistentStoreMap *v5;
  id v6;
  NSStoreMappingGenerator *v7;
  const __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSPersistentStoreMap;
  v4 = -[NSPersistentStoreMap init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_store = (NSMappedObjectStore *)a3;
    v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v7 = +[NSStoreMappingGenerator defaultMappingGenerator]();
    if (-[NSPersistentStoreMap configurationName](v5, "configurationName"))
      v8 = -[NSPersistentStoreMap configurationName](v5, "configurationName");
    else
      v8 = CFSTR("PF_DEFAULT_CONFIGURATION_NAME");
    v5->_mappings = (NSDictionary *)-[NSStoreMappingGenerator mappingsDictForConfigurationWithName:inModel:]((uint64_t)v7, (uint64_t)v8, (void *)objc_msgSend((id)objc_msgSend(a3, "_persistentStoreCoordinator"), "managedObjectModel"));
    objc_msgSend(v6, "drain");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_store = 0;

  self->_databaseUUID = 0;
  self->_storeMetadata = 0;

  self->_mappings = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStoreMap;
  -[NSPersistentStoreMap dealloc](&v3, sel_dealloc);
}

- (id)configurationName
{
  return -[NSPersistentStore configurationName](self->_store, "configurationName");
}

- (id)dataForKey:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)addObject:(id)a3 objectIDMap:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)removeObject:(id)a3 objectIDMap:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)updateObject:(id)a3 objectIDMap:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)handleFetchRequest:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (unint64_t)nextPK64
{
  unint64_t v3;

  objc_sync_enter(self);
  v3 = self->_nextPK64 + 1;
  self->_nextPK64 = v3;
  objc_sync_exit(self);
  return v3;
}

- (uint64_t)databaseUUID
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 16);
    if (!result)
    {
      result = -[__CFString copy](+[_PFRoutines _getUUID](), "copy");
      *(_QWORD *)(v1 + 16) = result;
    }
  }
  return result;
}

- (id)_updatedMetadataWithSeed:(int)a3 includeVersioning:
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (result)
  {
    v5 = result;
    v6 = (void *)objc_msgSend(a2, "mutableCopy");
    if (!v6)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
    v7 = objc_msgSend(*((id *)v5 + 1), "type");
    if (!v7)
      v7 = objc_msgSend(a2, "objectForKey:", CFSTR("NSStoreType"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("NSStoreType"));
    v8 = (__CFString *)objc_msgSend(a2, "objectForKey:", CFSTR("NSStoreUUID"));
    if (!v8)
    {
      v8 = (__CFString *)*((_QWORD *)v5 + 2);
      if (!v8)
      {
        v8 = (__CFString *)-[__CFString copy](+[_PFRoutines _getUUID](), "copy");
        *((_QWORD *)v5 + 2) = v8;
        if (!v8)
          v8 = +[_PFRoutines _getUUID]();
      }
    }
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("NSStoreUUID"));
    if (!a3)
      return v6;
    objc_msgSend(v6, "setValue:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x1E1EF14B0);
    v9 = (void *)objc_msgSend(*((id *)v5 + 1), "_persistentStoreCoordinator");
    if (v9)
    {
      v10 = (void *)objc_msgSend(v9, "managedObjectModel");
      v11 = (void *)objc_msgSend(v10, "entityVersionHashesByName");
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3), 0x1E1EF1490);
      objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("NSStoreModelVersionHashes"));
      if (v10)
        v12 = objc_msgSend((id)objc_msgSend(v10, "versionIdentifiers"), "allObjects");
      else
        v12 = 0;
      objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("NSStoreModelVersionIdentifiers"));
      objc_msgSend(v6, "setObject:forKey:", -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v10, v11), 0x1E1EF0E90);
      v13 = objc_msgSend(v10, "versionChecksum");
      v14 = v6;
    }
    else
    {
      if (!objc_msgSend(v6, "objectForKey:", 0x1E1EF1490))
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", 0x1E1EF1490), 0x1E1EF1490);
      if (!objc_msgSend(v6, "objectForKey:", CFSTR("NSStoreModelVersionHashes")))
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", CFSTR("NSStoreModelVersionHashes")), CFSTR("NSStoreModelVersionHashes"));
      if (!objc_msgSend(v6, "objectForKey:", 0x1E1EF0E90))
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", 0x1E1EF0E90), 0x1E1EF0E90);
      if (!objc_msgSend(v6, "objectForKey:", CFSTR("NSStoreModelVersionIdentifiers")))
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(*((id *)v5 + 3), "objectForKey:", CFSTR("NSStoreModelVersionIdentifiers")), CFSTR("NSStoreModelVersionIdentifiers"));
      if (objc_msgSend(v6, "objectForKey:", CFSTR("NSStoreModelVersionChecksumKey")))
        return v6;
      v13 = objc_msgSend(*((id *)v5 + 3), "objectForKey:", CFSTR("NSStoreModelVersionChecksumKey"));
      v14 = v6;
    }
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("NSStoreModelVersionChecksumKey"));
    return v6;
  }
  return result;
}

- (uint64_t)_setMetadata:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(result + 24));
    if ((result & 1) == 0)
    {
      v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSStoreUUID"));
      if (v4)
      {
        if (*(void **)(v3 + 16) != v4)
        {
          v5 = objc_msgSend(v4, "copy");

          *(_QWORD *)(v3 + 16) = v5;
        }
      }

      result = a2;
      *(_QWORD *)(v3 + 24) = result;
    }
  }
  return result;
}

- (void)setMetadata:(void *)result
{
  uint64_t v2;
  id v3;

  if (result)
  {
    v2 = (uint64_t)result;
    v3 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](result, a2, 1);
    return (void *)-[NSPersistentStoreMap _setMetadata:](v2, v3);
  }
  return result;
}

@end
