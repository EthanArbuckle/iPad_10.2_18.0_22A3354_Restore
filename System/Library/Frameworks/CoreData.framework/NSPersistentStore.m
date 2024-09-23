@implementation NSPersistentStore

- (id)objectIDFactoryForEntity:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  objc_class *v9;
  objc_class *v10;
  unint64_t *v11;
  id v13;

  if (!self->_oidFactories)
    return 0;
  v5 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  if (!v5)
  {
    v13 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134098, (uint64_t)CFSTR("objectIDFactoryForEntity invoked after store was removed"), 0);
    objc_exception_throw(v13);
  }
  v6 = _PFModelMapSlotForEntity(v5[12], a3);
  if (v6 < 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("objectIDFactoryForEntity invoked before model was finalized"), 0));
  v7 = v6;
  result = self->_oidFactories[v6];
  if (!result)
  {
    v9 = -[objc_class classWithStore:andEntity:](-[NSPersistentStore _objectIDClass](self, "_objectIDClass"), "classWithStore:andEntity:", self, a3);
    v10 = v9;
    v11 = (unint64_t *)&self->_oidFactories[v7];
    while (!__ldaxr(v11))
    {
      if (!__stlxr((unint64_t)v9, v11))
      {
        objc_msgSend(a3, "_addFactoryToRetainList:", v9);
        return self->_oidFactories[v7];
      }
    }
    __clrex();
    if (v9 != self->_oidFactories[v7])
    {
      -[objc_class _storeDeallocated](v9, "_storeDeallocated");

    }
    return self->_oidFactories[v7];
  }
  return result;
}

- (id)_persistentStoreCoordinator
{
  return self->_coordinator;
}

- (NSDictionary)options
{
  return self->_options;
}

- (unint64_t)faultHandler
{
  unint64_t *v1;
  id v2;
  id v3;

  if (result)
  {
    v1 = (unint64_t *)(result + 48);
    if (!*(_QWORD *)(result + 48))
    {
      v2 = objc_alloc((Class)objc_opt_class());
      v3 = -[NSFaultHandler initWithPersistenceStore:](v2);
      while (!__ldaxr(v1))
      {
        if (!__stlxr((unint64_t)v3, v1))
          return *v1;
      }
      __clrex();

    }
    return *v1;
  }
  return result;
}

- (BOOL)_isPersistentStoreAlive
{
  return -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator")
      && !-[NSPersistentStoreCoordinator _isDeallocating](self->_coordinator, "_isDeallocating");
}

- (void)_setMetadataDirty:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_flags = (_objectStoreFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (void)doFilesystemCleanupOnRemove:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_flags = (_objectStoreFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

+ (void)initialize
{
  objc_opt_self();
}

- (void)willRemoveFromPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator
{
  _BYTE *coreSpotlightDelegate;
  void *v5;
  _QWORD v6[5];

  coreSpotlightDelegate = self->_coreSpotlightDelegate;
  if (coreSpotlightDelegate)
  {
    coreSpotlightDelegate[72] = 0;
    v5 = (void *)*((_QWORD *)coreSpotlightDelegate + 4);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__NSCoreDataCoreSpotlightDelegate__invalidate__block_invoke;
    v6[3] = &unk_1E1EDD520;
    v6[4] = coreSpotlightDelegate;
    objc_msgSend(v5, "performBlock:", v6);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", coordinator), "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorWillRemoveStoreNotification"), self, 0);
  -[NSPersistentStore _unload:](self, "_unload:", 0);
}

- (id)_updatedMetadataWithSeed:(id)a3 includeVersioning:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSDictionary *v22;
  uint64_t v23;
  id v25;

  v4 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  v8 = -[NSPersistentStore type](self, "type");
  if (v8 || (v8 = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("NSStoreType"))) != 0)
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("NSStoreType"));
  v9 = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("NSStoreUUID"));
  if (!v9)
  {
    v9 = -[NSPersistentStore identifier](self, "identifier");
    if (!v9)
      v9 = (NSString *)+[_PFRoutines _getUUID]();
  }
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("NSStoreUUID"));
  if (v4)
  {
    objc_msgSend(v7, "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x1E1EF14B0);
    v10 = -[NSString isEqualToString:](-[NSPersistentStore type](self, "type"), "isEqualToString:", CFSTR("SQLite"))
       || -[NSString isEqualToString:](-[NSPersistentStore type](self, "type"), "isEqualToString:", CFSTR("Binary"));
    v11 = v10 | -[NSString isEqualToString:](-[NSPersistentStore type](self, "type"), "isEqualToString:", CFSTR("NSXPCStore"));
    v12 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
    if (v12)
    {
      v13 = (void *)objc_msgSend(v12, "managedObjectModel");
      v14 = (void *)objc_msgSend(v13, "entityVersionHashesByName");
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3), 0x1E1EF1490);
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("NSStoreModelVersionHashes"));
      if (v13)
        v15 = objc_msgSend((id)objc_msgSend(v13, "versionIdentifiers"), "allObjects");
      else
        v15 = 0;
      objc_msgSend(v7, "setObject:forKey:", v15, CFSTR("NSStoreModelVersionIdentifiers"));
      if (v11)
        objc_msgSend(v7, "setObject:forKey:", -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v13, v14), 0x1E1EF0E90);
      v16 = objc_msgSend(v13, "versionChecksum");
      v17 = CFSTR("NSStoreModelVersionChecksumKey");
      v18 = v7;
      goto LABEL_19;
    }
    if (!objc_msgSend(v7, "objectForKey:", 0x1E1EF1490))
    {
      v19 = -[NSDictionary objectForKey:](-[NSPersistentStore metadata](self, "metadata"), "objectForKey:", 0x1E1EF1490);
      if (v19)
        objc_msgSend(v7, "setObject:forKey:", v19, 0x1E1EF1490);
    }
    if (!objc_msgSend(v7, "objectForKey:", CFSTR("NSStoreModelVersionHashes")))
    {
      v20 = -[NSDictionary objectForKey:](-[NSPersistentStore metadata](self, "metadata"), "objectForKey:", CFSTR("NSStoreModelVersionHashes"));
      if (v20)
        objc_msgSend(v7, "setObject:forKey:", v20, CFSTR("NSStoreModelVersionHashes"));
    }
    if (!objc_msgSend(v7, "objectForKey:", 0x1E1EF0E90))
    {
      if (v11)
      {
        v21 = -[NSDictionary objectForKey:](-[NSPersistentStore metadata](self, "metadata"), "objectForKey:", 0x1E1EF0E90);
        if (v21)
          objc_msgSend(v7, "setObject:forKey:", v21, 0x1E1EF0E90);
      }
    }
    if (!objc_msgSend(v7, "objectForKey:", CFSTR("NSStoreModelVersionChecksumKey")))
    {
      objc_opt_class();
      v22 = (objc_opt_isKindOfClass() & 1) != 0
          ? (NSDictionary *)-[NSPersistentStore _rawMetadata](self, "_rawMetadata")
          : -[NSPersistentStore metadata](self, "metadata");
      v23 = -[NSDictionary objectForKey:](v22, "objectForKey:", CFSTR("NSStoreModelVersionChecksumKey"));
      if (v23)
        objc_msgSend(v7, "setObject:forKey:", v23, CFSTR("NSStoreModelVersionChecksumKey"));
    }
    if (!objc_msgSend(v7, "objectForKey:", CFSTR("NSStoreModelVersionIdentifiers")))
    {
      v25 = -[NSDictionary objectForKey:](-[NSPersistentStore metadata](self, "metadata"), "objectForKey:", CFSTR("NSStoreModelVersionIdentifiers"));
      if (v25)
      {
        v16 = (uint64_t)v25;
        v18 = v7;
        v17 = CFSTR("NSStoreModelVersionIdentifiers");
LABEL_19:
        objc_msgSend(v18, "setObject:forKey:", v16, v17);
      }
    }
  }
  return v7;
}

- (NSCoreDataCoreSpotlightDelegate)coreSpotlightExporter
{
  return (NSCoreDataCoreSpotlightDelegate *)self->_coreSpotlightDelegate;
}

- (BOOL)isReadOnly
{
  return *(_DWORD *)&self->_flags & 1;
}

- (NSString)configurationName
{
  if (self->_configurationName)
    return self->_configurationName;
  else
    return (NSString *)CFSTR("PF_DEFAULT_CONFIGURATION_NAME");
}

- (__CFSet)_entitiesForConfiguration
{
  __CFSet *entitiesInConfiguration;
  unint64_t *p_entitiesInConfiguration;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *context;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  p_entitiesInConfiguration = (unint64_t *)&self->_entitiesInConfiguration;
  entitiesInConfiguration = self->_entitiesInConfiguration;
  if (!entitiesInConfiguration)
  {
    entitiesInConfiguration = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    context = (void *)MEMORY[0x18D76B4E4]();
    v5 = (void *)objc_msgSend(self->_managedObjectModel, "entitiesForConfiguration:", -[NSPersistentStore configurationName](self, "configurationName"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          CFSetAddValue(entitiesInConfiguration, *(const void **)(*((_QWORD *)&v31 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v7);
    }
    v10 = -[NSPersistentStore ancillaryModels](self, "ancillaryModels");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14));
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v24;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v24 != v18)
                  objc_enumerationMutation(v15);
                CFSetAddValue(entitiesInConfiguration, *(const void **)(*((_QWORD *)&v23 + 1) + 8 * v19++));
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
            }
            while (v17);
          }
          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v12);
    }
    objc_autoreleasePoolPop(context);
    while (!__ldaxr(p_entitiesInConfiguration))
    {
      if (!__stlxr((unint64_t)entitiesInConfiguration, p_entitiesInConfiguration))
        return entitiesInConfiguration;
    }
    __clrex();
    if (entitiesInConfiguration)
      CFRelease(entitiesInConfiguration);
    return (__CFSet *)*p_entitiesInConfiguration;
  }
  return entitiesInConfiguration;
}

- (void)dealloc
{
  __CFSet *entitiesInConfiguration;
  id *oidFactories;
  NSPersistentStore *v5;
  uint64_t v6;
  void *temporaryIDClass;
  id *v8;
  NSPersistentStore *v9;
  uint64_t v10;
  objc_super v11;

  entitiesInConfiguration = self->_entitiesInConfiguration;
  if (entitiesInConfiguration)
  {
    CFRelease(entitiesInConfiguration);
    self->_entitiesInConfiguration = 0;
  }
  oidFactories = self->_oidFactories;
  if (oidFactories)
  {
    v5 = (NSPersistentStore *)*oidFactories;
    if (*oidFactories != self)
    {
      v6 = 1;
      do
      {
        -[NSPersistentStore _storeDeallocated](v5, "_storeDeallocated");
        v5 = (NSPersistentStore *)self->_oidFactories[v6++];
      }
      while (v5 != self);
    }
  }
  temporaryIDClass = self->_temporaryIDClass;
  if (temporaryIDClass)
  {
    objc_msgSend(temporaryIDClass, "_storeDeallocated");

    self->_temporaryIDClass = 0;
  }

  self->_configurationName = 0;
  self->_coordinator = 0;
  v8 = self->_oidFactories;
  if (v8)
  {
    v9 = (NSPersistentStore *)*v8;
    if (*v8 != self)
    {
      v10 = 0;
      do
      {
        if (v9)
        {
          CFRelease(v9);
          v8 = self->_oidFactories;
        }
        v8[v10] = 0;
        v8 = self->_oidFactories;
        v9 = (NSPersistentStore *)v8[++v10];
      }
      while (v9 != self);
    }
    PF_FREE_OBJECT_ARRAY(v8);
    self->_oidFactories = 0;
  }
  self->_defaultFaultHandler = 0;
  self->_coreSpotlightDelegate = 0;
  self->_url = 0;
  self->_options = 0;

  v11.receiver = self;
  v11.super_class = (Class)NSPersistentStore;
  -[NSPersistentStore dealloc](&v11, sel_dealloc);
}

- (BOOL)_unload:(id *)a3
{
  _objectStoreFlags flags;
  NSString *v6;
  NSString *v7;
  BOOL result;
  void *v9;

  flags = self->_flags;
  v6 = -[NSURL path](self->_url, "path");
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_7;
  if (!self->_url)
  {
    result = 0;
    goto LABEL_9;
  }
  v7 = v6;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v6))
  {
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", -[NSURL path](self->_url, "path"), a3);
    if (a3 && !result)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to unload store file because file at path '%@' could not be removed"), v7), CFSTR("reason"), 0));
      result = 0;
      *a3 = v9;
    }
  }
  else
  {
LABEL_7:
    result = 1;
  }
LABEL_9:
  self->_coordinator = 0;
  return result;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  if (-[NSPersistentStoreCoordinator _isDeallocating](self->_coordinator, "_isDeallocating"))
    return 0;
  else
    return self->_coordinator;
}

- (NSString)identifier
{
  NSString *v3;

  v3 = -[NSDictionary objectForKey:](-[NSPersistentStore metadata](self, "metadata"), "objectForKey:", CFSTR("NSStoreUUID"));
  if (!v3)
  {
    v3 = (NSString *)+[_PFRoutines _getUUID]();
    -[NSPersistentStore setIdentifier:](self, "setIdentifier:", v3);
  }
  return v3;
}

- (_BYTE)_updateMetadata
{
  if (result)
  {
    if ((result[56] & 1) == 0)
      return (_BYTE *)objc_msgSend(result, "setMetadata:", objc_msgSend(result, "_updatedMetadataWithSeed:includeVersioning:", objc_msgSend(result, "metadata"), 1));
  }
  return result;
}

- (void)_preflightCrossCheck
{
  NSURL *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  stat v27;

  v3 = -[NSPersistentStore URL](self, "URL");
  if (-[NSURL isFileURL](v3, "isFileURL")
    && ((__CFString *)-[NSPersistentStore type](self, "type") != CFSTR("SQLite")
     || (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, v3) & 1) == 0))
  {
    memset(&v27, 0, sizeof(v27));
    if (stat(-[NSString fileSystemRepresentation](-[NSURL path](v3, "path"), "fileSystemRepresentation"), &v27))
    {
      v4 = *__error();
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v6 = *MEMORY[0x1E0CB2FE0];
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = -[NSURL path](v3, "path");
      v9 = *MEMORY[0x1E0CB2AA0];
      v10 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, v4, objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0CB2AA0]));
      _NSCoreDataLog(1, (uint64_t)CFSTR("Error opening store: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
      if (v4 != 20)
      {
        if (v4 == 13)
        {
          v17 = 513;
        }
        else
        {
          if (v4 == 2)
            goto LABEL_9;
          v17 = 512;
        }
LABEL_12:
        v18 = *MEMORY[0x1E0CB3388];
        if (v10)
          v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, *MEMORY[0x1E0CB3388]);
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = *MEMORY[0x1E0CB28A8];
        v21 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v17, v10);
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = -[NSURL path](v3, "path");
        v24 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v21, v18, v23, v9, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self), CFSTR("NSAffectedStoresErrorKey"), 0);
        v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v20, 134030, v24);
        v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("Could not write to file."), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v25, CFSTR("NSCoreDataPrimaryError")));
        objc_exception_throw(v26);
      }
LABEL_9:
      v17 = 4;
      goto LABEL_12;
    }
  }
}

- (NSURL)URL
{
  return self->_url;
}

- (NSPersistentStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)root configurationName:(NSString *)name URL:(NSURL *)url options:(NSDictionary *)options
{
  NSPersistentStore *v11;
  _PFModelMap *modelMap;
  unint64_t entityCount;
  id *v14;
  objc_super v16;

  objc_opt_self();
  objc_opt_class();
  objc_opt_class();
  v16.receiver = self;
  v16.super_class = (Class)NSPersistentStore;
  v11 = -[NSPersistentStore init](&v16, sel_init);
  if (v11)
  {
    v11->_flags = (_objectStoreFlags)(*(_DWORD *)&v11->_flags & 0xFFFFFFFE | objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption")), "BOOLValue"));
    v11->_coordinator = root;
    v11->_configurationName = (NSString *)-[NSString copy](name, "copy");
    if (root && (modelMap = root->_modelMap) != 0)
      entityCount = modelMap->_entityCount;
    else
      entityCount = 0;
    v14 = (id *)PF_CALLOC_OBJECT_ARRAY(entityCount + 1);
    v11->_oidFactories = v14;
    v14[entityCount] = v11;
    v11->_defaultFaultHandler = 0;
    v11->_url = url;
    if (url)
      CFRetain(url);
    v11->_options = (NSDictionary *)-[NSDictionary copy](options, "copy");
    *(_DWORD *)&v11->_flags &= ~2u;
    v11->_managedObjectModel = -[NSPersistentStoreCoordinator managedObjectModel](root, "managedObjectModel");
    v11->_coreSpotlightDelegate = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("NSCoreDataCoreSpotlightExporter"));
  }
  return v11;
}

+ (BOOL)doURLStuff:(id)a3 createdStubFile:(BOOL *)a4 readOnly:(BOOL *)a5 error:(id *)a6 options:(id)a7
{
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;

  if (!a3 || !objc_msgSend(a3, "isFileURL"))
    return 1;
  v12 = (void *)objc_msgSend(a3, "path");
  v13 = (char *)objc_msgSend(v12, "fileSystemRepresentation");
  v14 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "BOOLValue");
    v17 = objc_msgSend(v15, "BOOLValue") ^ 1;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v18 = objc_msgSend(a7, "valueForKey:", CFSTR("NSPersistentStoreFileProtectionKey"));
  if (v18)
  {
    if ((objc_msgSend((id)*MEMORY[0x1E0CB2AE0], "isEqualToString:", v18) & 1) != 0)
    {
      LODWORD(v18) = 4;
    }
    else if ((objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "isEqualToString:", v18) & 1) != 0)
    {
      LODWORD(v18) = 3;
    }
    else if ((objc_msgSend((id)*MEMORY[0x1E0CB2AB8], "isEqualToString:", v18) & 1) != 0)
    {
      LODWORD(v18) = 2;
    }
    else if ((objc_msgSend((id)*MEMORY[0x1E0CB2AB0], "isEqualToString:", v18) & 1) != 0)
    {
      LODWORD(v18) = 1;
    }
    else if ((objc_msgSend((id)*MEMORY[0x1E0CB2AD0], "isEqualToString:", v18) & 1) != 0)
    {
      LODWORD(v18) = 7;
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey"), v19, v20, v21, v22, v23, v24, v18);
      LODWORD(v18) = 0;
    }
  }
  if (access(v13, 4))
  {
    v25 = *__error();
    if ((_DWORD)v25 != 2)
    {
      if ((_DWORD)v25 == 20)
      {
        if (a6)
        {
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v37 = *MEMORY[0x1E0CB28A8];
          v38 = (void *)MEMORY[0x1E0C99D80];
          v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Component of path %@ is not a directory"), v12);
          v28 = objc_msgSend(v38, "dictionaryWithObjectsAndKeys:", v39, CFSTR("reason"), v12, *MEMORY[0x1E0CB2AA0], 0);
          v29 = v36;
          v30 = v37;
          v31 = 258;
          goto LABEL_37;
        }
      }
      else if ((_DWORD)v25 == 13)
      {
        if (a6)
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v27 = *MEMORY[0x1E0CB28A8];
          v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No access to file; code = %d"), 13),
                  CFSTR("reason"));
          v29 = v26;
          v30 = v27;
          v31 = 257;
LABEL_37:
          *a6 = (id)objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v31, v28);
          goto LABEL_38;
        }
      }
      else if (a6)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v41 = *MEMORY[0x1E0CB28A8];
        v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown failure to access file: %d"), v25), CFSTR("reason"));
        v29 = v40;
        v30 = v41;
        v31 = 256;
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    if (v16)
    {
      if (!a6)
        return 0;
      v32 = 0;
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to open missing file read only; code = %d"),
                      2),
                    CFSTR("reason")));
      return v32;
    }
    v43 = _PFCeateStubFileAtPath(v13, v18);
    if ((v43 & 0x80000000) == 0)
    {
      close(v43);
      v32 = 1;
      *a4 = 1;
      return v32;
    }
    if (!a6)
    {
LABEL_60:
      +[_PFRoutines _logFileAccessDebugInformation:]((uint64_t)_PFRoutines, v13);
      +[_PFRoutines _logDirectoryAccessDebugInformation:]((uint64_t)_PFRoutines, (void *)objc_msgSend(v12, "stringByDeletingLastPathComponent"));
      return 0;
    }
    v44 = *__error();
    if ((int)v44 > 12)
    {
      if ((_DWORD)v44 != 13)
      {
        if ((_DWORD)v44 == 17)
        {
          v45 = (void *)MEMORY[0x1E0CB35C8];
          v46 = *MEMORY[0x1E0CB28A8];
          v49 = (void *)MEMORY[0x1E0C99D80];
          v50 = CFSTR("File unexpectedly appeared during sanity check");
LABEL_58:
          v55 = objc_msgSend(v49, "dictionaryWithObject:forKey:", v50, CFSTR("reason"));
          v56 = v45;
          v57 = v46;
          v58 = 512;
          goto LABEL_59;
        }
        goto LABEL_56;
      }
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB28A8];
      v53 = (void *)MEMORY[0x1E0C99D80];
      v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No access to create file; code = %d"), 13);
    }
    else
    {
      if ((_DWORD)v44 != 1)
      {
        if ((_DWORD)v44 == 2)
        {
          v45 = (void *)MEMORY[0x1E0CB35C8];
          v46 = *MEMORY[0x1E0CB28A8];
          v47 = (void *)MEMORY[0x1E0C99D80];
          v48 = (void *)MEMORY[0x1E0CB3940];
          v44 = 2;
LABEL_57:
          v50 = (const __CFString *)objc_msgSend(v48, "stringWithFormat:", CFSTR("Failed to create file; code = %d"),
                                      v44);
          v49 = v47;
          goto LABEL_58;
        }
LABEL_56:
        v45 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB28A8];
        v47 = (void *)MEMORY[0x1E0C99D80];
        v48 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_57;
      }
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB28A8];
      v53 = (void *)MEMORY[0x1E0C99D80];
      v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No permissions to create file; code = %d"),
              1);
    }
    v55 = objc_msgSend(v53, "dictionaryWithObject:forKey:", v54, CFSTR("reason"));
    v56 = v51;
    v57 = v52;
    v58 = 513;
LABEL_59:
    *a6 = (id)objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, v58, v55);
    goto LABEL_60;
  }
  if (!v17)
  {
    if (!v15)
    {
      v32 = 1;
      if (access(v13, 2))
      {
        *a5 = 1;
        +[_PFRoutines _logFileAccessDebugInformation:]((uint64_t)_PFRoutines, v13);
      }
      return v32;
    }
    return 1;
  }
  v32 = 1;
  if (access(v13, 2))
  {
    v33 = *__error();
    *a5 = 1;
    if (a6)
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB28A8];
      v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No write permissions to file: %d"), v33), CFSTR("reason"));
      v29 = v34;
      v30 = v35;
      v31 = 513;
      goto LABEL_37;
    }
LABEL_38:
    +[_PFRoutines _logFileAccessDebugInformation:]((uint64_t)_PFRoutines, v13);
    return 0;
  }
  return v32;
}

+ (Class)rowCacheClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isCloudKitEnabled
{
  id v2;

  v2 = -[NSPersistentStore mirroringDelegate](self, "mirroringDelegate");
  if (v2)
  {
    objc_opt_class();
    LOBYTE(v2) = objc_opt_isKindOfClass();
  }
  return v2 & 1;
}

- (id)mirroringDelegate
{
  return (id)objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", CFSTR("NSPersistentStoreMirroringOptionsKey")), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStore;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (URL: %@)"), -[NSPersistentStore description](&v3, sel_description), -[NSPersistentStore URL](self, "URL"));
}

- (NSPersistentStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStore;
  return -[NSPersistentStore init](&v3, sel_init);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (NSDictionary)metadataForPersistentStoreWithURL:(NSURL *)url error:(NSError *)error
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreWithURL:(NSURL *)url error:(NSError *)error
{
  NSString *v8;
  BOOL result;
  id v10;
  void *v11;

  if ((id)objc_opt_class() == a1)
    return +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)metadata, 0, url, 0, error);
  if (!-[NSURL isFileURL](url, "isFileURL"))
    return 1;
  v8 = -[NSURL path](url, "path");
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isWritableFileAtPath:", v8);
  if (error)
  {
    if (!result)
    {
      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", url, *MEMORY[0x1E0CB3308], 0);
      *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, v11);

      return 0;
    }
  }
  return result;
}

- (void)setReadOnly:(BOOL)readOnly
{
  self->_flags = (_objectStoreFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | readOnly);
}

- (void)setURL:(NSURL *)URL
{
  NSURL *v5;

  -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 1);
  v5 = self->_url;
  if (v5 != URL)
  {
    if (v5)
      CFRelease(v5);
    self->_url = URL;
    if (URL)
      CFRetain(URL);
  }
}

- (void)setIdentifier:(NSString *)identifier
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NSPersistentStore metadata](self, "metadata"));
  v6 = v5;
  if (identifier)
    objc_msgSend(v5, "setObject:forKey:", identifier, CFSTR("NSStoreUUID"));
  else
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("NSStoreUUID"));
  -[NSPersistentStore setMetadata:](self, "setMetadata:", v6);
}

- (NSDictionary)metadata
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)setMetadata:(NSDictionary *)metadata
{
  NSDictionary *v5;

  v5 = (NSDictionary *)-[NSPersistentStore _rawMetadata](self, "_rawMetadata");
  if (v5 != metadata && (-[NSDictionary isEqual:](metadata, "isEqual:", v5) & 1) == 0)
    -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 1);
}

- (NSString)type
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)loadMetadata:(NSError *)error
{
  return 1;
}

+ (Class)migrationManagerClass
{
  return (Class)objc_opt_class();
}

- (id)_rawMetadata__
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7
{
  int v11;
  BOOL v12;
  const std::__fs::filesystem::path *v13;
  const std::__fs::filesystem::path *v14;
  void *v15;
  std::error_code *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _copyfile_state *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  if (!a5)
    return 0;
  v11 = objc_msgSend(a5, "isFileURL", a3, a4);
  v12 = 0;
  if (!a3 || !v11)
    return v12;
  if (!objc_msgSend(a3, "isFileURL"))
    return 0;
  v13 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation");
  v14 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a5, "path"), "fileSystemRepresentation");
  v15 = (void *)objc_msgSend(a6, "objectForKey:", CFSTR("NSPersistentStoreUnlinkDestroyOption"));
  if (v15 && objc_msgSend(v15, "BOOLValue"))
  {
    rename(v14, v13, v16);
    if (v17)
    {
      v18 = *__error();
      v12 = v18 == 2;
      if (a7 && (_DWORD)v18 != 2)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0CB2FE0];
        v21 = (void *)MEMORY[0x1E0C99D80];
        v22 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(a5, "path"), objc_msgSend(a3, "path"), 0);
        v23 = (void *)objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v18, objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v22, *MEMORY[0x1E0CB2AA0], 0));
        v12 = 0;
        *a7 = v23;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v25 = copyfile_state_alloc();
    if (copyfile((const char *)v14, (const char *)v13, v25, 0xFu))
    {
      v26 = *__error();
      v12 = v26 == 2;
      if (a7 && (_DWORD)v26 != 2)
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2FE0];
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(a5, "path"), objc_msgSend(a3, "path"), 0);
        v31 = (void *)objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v26, objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v30, *MEMORY[0x1E0CB2AA0], 0));
        v12 = 0;
        *a7 = v31;
      }
    }
    else
    {
      v12 = 1;
    }
    copyfile_state_free(v25);
  }
  return v12;
}

+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (a3)
  {
    v7 = objc_msgSend(a3, "isFileURL");
    if (v7)
    {
      if (unlink((const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation")))
      {
        v8 = *__error();
        LOBYTE(v7) = v8 == 2;
        if (a5 && (_DWORD)v8 != 2)
        {
          v9 = (void *)MEMORY[0x1E0CB35C8];
          v10 = *MEMORY[0x1E0CB2FE0];
          v11 = (void *)MEMORY[0x1E0C99D80];
          v12 = objc_msgSend(a3, "path");
          v13 = (void *)objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v8, objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, *MEMORY[0x1E0CB2AA0], 0));
          LOBYTE(v7) = 0;
          *a5 = v13;
        }
      }
      else
      {
        LOBYTE(v7) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6
{
  if (a6)
    *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Store does not support encryption"), a4, a5, *MEMORY[0x1E0CB2D50], 0));
  return 0;
}

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (BOOL)load:(id *)a3
{
  NSString *v4;
  id *oidFactories;
  NSPersistentStore *v6;
  uint64_t v7;
  void *temporaryIDClass;

  v4 = -[NSPersistentStore identifier](self, "identifier", a3);
  oidFactories = self->_oidFactories;
  if (oidFactories)
  {
    v6 = (NSPersistentStore *)*oidFactories;
    if (*oidFactories != self)
    {
      v7 = 1;
      do
      {
        -[NSPersistentStore setObjectStoreIdentifier:](v6, "setObjectStoreIdentifier:", v4);
        v6 = (NSPersistentStore *)self->_oidFactories[v7++];
      }
      while (v6 != self);
    }
  }
  temporaryIDClass = self->_temporaryIDClass;
  if (temporaryIDClass)
    objc_msgSend(temporaryIDClass, "setObjectStoreIdentifier:", v4);
  return 1;
}

- (void)_resetObjectIDFactoriesForStoreUUIDChange
{
  void **v2;
  void ***v3;
  uint64_t v4;

  if (a1)
  {
    v2 = a1[5];
    if (v2)
    {
      v3 = (void ***)*v2;
      if (*v2 != a1)
      {
        v4 = 0;
        do
        {
          if (v3)
          {
            objc_msgSend(v3, "_storeDeallocated");
            CFRelease(v3);
            v2 = a1[5];
          }
          v2[v4] = 0;
          v2 = a1[5];
          v3 = (void ***)v2[++v4];
        }
        while (v3 != a1);
      }
    }
  }
}

+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3
{
  return 0;
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)_isCloudKitOptioned
{
  return 0;
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return 0;
}

+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  return +[NSSQLCore cachedModelForPersistentStoreWithURL:options:error:](NSSQLCore, "cachedModelForPersistentStoreWithURL:options:error:", a3, a4, a5);
}

- (unint64_t)entityIDForEntityDescription:(id)a3
{
  return 0;
}

- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3
{
  return (id)NSArray_EmptyArray;
}

- (BOOL)supportsConcurrentRequestHandling
{
  return 0;
}

- (BOOL)supportsGenerationalQuerying
{
  return 0;
}

- (BOOL)_hasActiveGenerations
{
  return 0;
}

- (id)currentQueryGeneration
{
  _QWORD *v2;

  if (!currentQueryGeneration_token)
  {
    v2 = -[_NSQueryGenerationToken initForNonGenerationalStore:]([_NSQueryGenerationToken alloc], self);
    while (!__ldaxr((unint64_t *)&currentQueryGeneration_token))
    {
      if (!__stlxr((unint64_t)v2, (unint64_t *)&currentQueryGeneration_token))
        return (id)currentQueryGeneration_token;
    }
    __clrex();

  }
  return (id)currentQueryGeneration_token;
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  if (+[_NSQueryGenerationToken identifierIsForNonGenerationalStore:]((uint64_t)_NSQueryGenerationToken, (uint64_t)a3))return -[NSPersistentStore currentQueryGeneration](self, "currentQueryGeneration");
  else
    return 0;
}

- (id)currentChangeToken
{
  return 0;
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4AC00);
  return 0;
}

- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4
{
  return 1;
}

- (id)ancillaryModels
{
  return 0;
}

@end
