@implementation NSAtomicStore

+ (void)initialize
{
  objc_opt_self();
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("metadataForPersistentStoreWithURL:error: must be overriden by your store class to provide metadata"), 0));
}

- (NSAtomicStore)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSMappedObjectStore must be initialized with initWithPersistentStoreCoordinator:configurationName:URL:options"), 0));
}

- (NSAtomicStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator configurationName:(NSString *)configurationName URL:(NSURL *)url options:(NSDictionary *)options
{
  NSManagedObjectModel *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSAtomicStore *v18;
  objc_super v24;
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
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = -[NSPersistentStoreCoordinator managedObjectModel](coordinator, "managedObjectModel");
  v8 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              if (objc_msgSend(v17, "_isAttribute")
                && objc_msgSend(v17, "attributeType") == 1000
                && objc_msgSend(v17, "isFileBackedFuture"))
              {

                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Atomic stores do not support file backed futures"), 0));
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v14);
        }
      }
      v9 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }
  v24.receiver = self;
  v24.super_class = (Class)NSAtomicStore;
  v18 = -[NSPersistentStore initWithPersistentStoreCoordinator:configurationName:URL:options:](&v24, sel_initWithPersistentStoreCoordinator_configurationName_URL_options_, coordinator, configurationName, url, options);
  if (v18)
  {
    v18->_nodeCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18->_entityCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  self->_nodeCache = 0;
  self->_entityCache = 0;

  self->_storeMetadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSAtomicStore;
  -[NSPersistentStore dealloc](&v3, sel_dealloc);
}

- (BOOL)save:(NSError *)error
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("save: must be overriden by your store class to save data to the store"), 0));
}

- (BOOL)load:(NSError *)error
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("load: must be overriden by your store class to load data from the store"), 0));
}

- (void)addCacheNodes:(NSSet *)cacheNodes
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", -[NSPersistentStore configurationName](self, "configurationName")), "valueForKey:", CFSTR("name")));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](cacheNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(cacheNodes);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "entity"), "name")) & 1) == 0)
        {

          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store %@ cannot hold instances of entity %@"), self, objc_msgSend((id)objc_msgSend(v10, "objectID"), "entity")), 0));
        }
        if (self)
        {
          -[NSMutableDictionary setObject:forKey:](self->_nodeCache, "setObject:forKey:", v10, objc_msgSend(v10, "objectID"));
          -[NSAtomicStore _insertNodeIntoEntityCache:]((uint64_t)self, v10);
        }
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](cacheNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSSet)cacheNodes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSMutableDictionary allValues](self->_nodeCache, "allValues"));
}

- (NSAtomicStoreCacheNode)cacheNodeForObjectID:(NSManagedObjectID *)objectID
{
  return (NSAtomicStoreCacheNode *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objectID);
}

- (NSAtomicStoreCacheNode)newCacheNodeForManagedObject:(NSManagedObject *)managedObject
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("newCacheNodeForManagedObject: must be overriden by your store class to create a cache node from a managed object"), 0));
}

- (void)updateCacheNode:(NSAtomicStoreCacheNode *)node fromManagedObject:(NSManagedObject *)managedObject
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("updateCacheNode:fromManagedObject: must be overriden by your store class to update a cache node from a managed object"), 0));
}

- (id)newReferenceObjectForManagedObject:(NSManagedObject *)managedObject
{
  int64_t v4;

  objc_sync_enter(self);
  v4 = self->_nextReference + 1;
  self->_nextReference = v4;
  objc_sync_exit(self);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v4);
}

- (NSManagedObjectID)objectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data
{
  NSManagedObjectID *result;

  result = (NSManagedObjectID *)objc_msgSend(objc_alloc((Class)-[NSPersistentStore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:", entity)), "initWithObject:", data);
  if (BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
    return result;
  return result;
}

- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID
{
  if (!objectID)
    return 0;
  if ((NSAtomicStore *)-[NSManagedObjectID persistentStore](objectID, "persistentStore") != self)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot retrieve referenceObject from an objectID that was not created by this store"), 0));
  return -[NSManagedObjectID _referenceData](objectID, "_referenceData");
}

- (id)_rawMetadata__
{
  return self->_storeMetadata;
}

- (id)metadata
{
  id result;

  result = self->_storeMetadata;
  if (!result)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", +[_PFRoutines _getUUID](), CFSTR("NSStoreUUID"));
    self->_storeMetadata = (NSMutableDictionary *)result;
  }
  return result;
}

- (void)setMetadata:(id)a3
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSAtomicStore;
  -[NSPersistentStore setMetadata:](&v6, sel_setMetadata_);
  if ((objc_msgSend(a3, "isEqual:", self->_storeMetadata) & 1) == 0)
  {
    v5 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:](self, "_updatedMetadataWithSeed:includeVersioning:", a3, 1);

    self->_storeMetadata = (NSMutableDictionary *)v5;
  }
}

- (uint64_t)_insertNodeIntoEntityCache:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = objc_msgSend((id)objc_msgSend(a2, "objectID"), "entity");
  if (v4)
  {
    if ((*(_BYTE *)(v4 + 120) & 4) != 0)
    {
      v5 = *(void **)(v4 + 72);
    }
    else
    {
      do
      {
        v5 = (void *)v4;
        v4 = objc_msgSend((id)v4, "superentity");
      }
      while (v4);
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v5, "name");
  v7 = (id)objc_msgSend(*(id *)(a1 + 104), "objectForKey:", v6);
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 104), "setObject:forKey:", v7, v6);

  }
  return objc_msgSend(v7, "addObject:", a2);
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9;
  id result;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  NSAtomicStoreCacheNode *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  id **v51;
  unint64_t *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  id v75;
  id obj;
  id obja;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  if (!a3)
LABEL_89:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown command type %@"), a4, a5, a3), 0));
  switch(objc_msgSend(a3, "requestType"))
  {
    case 1:
      if (objc_msgSend(a3, "resultType") == 4)
        goto LABEL_4;
      return -[NSAtomicStore executeFetchRequest:withContext:]((uint64_t)self, a3, (_QWORD **)a4);
    case 2:
      if (!self)
        return 0;
      if (-[NSSaveChangesRequest hasChanges]((_BOOL8)a3) || (*(_BYTE *)&self->super._flags & 4) != 0)
      {
        obj = a3;
        v11 = (void *)objc_msgSend(a3, "insertedObjects");
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v96;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v96 != v16)
                objc_enumerationMutation(v11);
              v18 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v18, "objectID"), "isTemporaryID"))
              {
                v19 = -[NSAtomicStore _getNewIDForObject:](self, v18);
                objc_msgSend(v12, "addObject:", v18);
                objc_msgSend(v13, "addObject:", v19);

              }
            }
            v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
          }
          while (v15);
        }
        if (objc_msgSend(v12, "count"))
        {
          v20 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](a4, v12, v13);
          if (v20)
            -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)obj, (uint64_t)v20);

        }
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v92;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v92 != v23)
                objc_enumerationMutation(v11);
              if (*(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j))
              {
                v25 = -[NSAtomicStore newCacheNodeForManagedObject:](self, "newCacheNodeForManagedObject:");
                -[NSMutableDictionary setObject:forKey:](self->_nodeCache, "setObject:forKey:", v25, -[NSAtomicStoreCacheNode objectID](v25, "objectID"));
                -[NSAtomicStore _insertNodeIntoEntityCache:]((uint64_t)self, v25);

              }
            }
            v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
          }
          while (v22);
        }
        v26 = (void *)objc_msgSend(obj, "deletedObjects");
        v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v88;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v88 != v30)
                objc_enumerationMutation(v26);
              v32 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
              if (-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objc_msgSend(v32, "objectID")))
              {
                objc_msgSend(v27, "addObject:", -[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objc_msgSend(v32, "objectID")));
              }
            }
            v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
          }
          while (v29);
        }
        -[NSAtomicStore willRemoveCacheNodes:](self, "willRemoveCacheNodes:", v27);

        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v33 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v84;
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v84 != v35)
                objc_enumerationMutation(v26);
              v37 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v36);
              if (v37)
              {
                v38 = (void *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objc_msgSend(v37, "objectID"));
                v39 = objc_msgSend(v38, "objectID");
                if (v39)
                  -[NSMutableDictionary removeObjectForKey:](self->_nodeCache, "removeObjectForKey:", v39);
                v40 = objc_msgSend((id)objc_msgSend(v38, "objectID"), "entity");
                if (v40)
                {
                  if ((*(_BYTE *)(v40 + 120) & 4) != 0)
                  {
                    v41 = *(void **)(v40 + 72);
                  }
                  else
                  {
                    do
                    {
                      v41 = (void *)v40;
                      v40 = objc_msgSend((id)v40, "superentity");
                    }
                    while (v40);
                  }
                }
                else
                {
                  v41 = 0;
                }
                v42 = objc_msgSend(v41, "name");
                if (v42)
                {
                  v43 = v42;
                  v44 = (void *)-[NSMutableDictionary objectForKey:](self->_entityCache, "objectForKey:", v42);
                  if (v44)
                  {
                    v45 = v44;
                    objc_msgSend(v44, "removeObject:", v38);
                    if (!objc_msgSend(v45, "count"))
                      -[NSMutableDictionary removeObjectForKey:](self->_entityCache, "removeObjectForKey:", v43);
                  }
                }
              }
              ++v36;
            }
            while (v36 != v34);
            v46 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
            v34 = v46;
          }
          while (v46);
        }
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        obja = (id)objc_msgSend(obj, "updatedObjects");
        v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v80;
          do
          {
            for (m = 0; m != v48; ++m)
            {
              if (*(_QWORD *)v80 != v49)
                objc_enumerationMutation(obja);
              v51 = *(id ***)(*((_QWORD *)&v79 + 1) + 8 * m);
              if (v51)
              {
                v52 = (unint64_t *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * m), "entity");
                if (v52)
                  v53 = (_QWORD *)v52[14];
                else
                  v53 = 0;
                v58 = _kvcPropertysPrimitiveGetters(v52);
                v60 = v53[18];
                v59 = v53[19];
                if (v60 < v59 + v60)
                {
                  do
                  {
                    _PF_Handler_Primitive_GetProperty(v51, v60, 0, *(_QWORD *)(v58 + 8 * v60), v54, v55, v56, v57);
                    objc_msgSend(v61, "count");
                    ++v60;
                    --v59;
                  }
                  while (v59);
                }
                v63 = v53[26];
                v62 = v53[27];
                if (v63 < v62 + v63)
                {
                  do
                  {
                    _PF_Handler_Primitive_GetProperty(v51, v63, 0, *(_QWORD *)(v58 + 8 * v63), v54, v55, v56, v57);
                    objc_msgSend(v64, "count");
                    ++v63;
                    --v62;
                  }
                  while (v62);
                }
                v65 = (void *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objc_msgSend(v51, "objectID"));
                -[NSAtomicStore updateCacheNode:fromManagedObject:](self, "updateCacheNode:fromManagedObject:", v65, v51);
                objc_msgSend(v65, "_setVersionNumber:", objc_msgSend(v65, "_versionNumber") + 1);
              }
            }
            v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
          }
          while (v48);
        }
        v78 = 0;
        v66 = -[NSAtomicStore metadata](self, "metadata");
        if (objc_msgSend((id)objc_msgSend(v66, "objectForKey:", 0x1E1EF14D0), "integerValue") != self->_nextReference)
        {
          v67 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
          v68 = (void *)objc_msgSend(v66, "mutableCopy");
          objc_msgSend(v68, "setObject:forKey:", v67, 0x1E1EF14D0);
          -[NSAtomicStore setMetadata:](self, "setMetadata:", v68);

        }
        if (!-[NSAtomicStore save:](self, "save:", &v78))
        {
          if (v78)
          {
            v74 = objc_msgSend(v78, "code");
            if (v78)
              v73 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("NSCoreDataPrimaryError"), 0);
            else
              v73 = 0;
          }
          else
          {
            v73 = 0;
            v74 = 134030;
          }
          v75 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99750], v74, (uint64_t)CFSTR("Error saving the persistent store."), v73);
          objc_exception_throw(v75);
        }
        -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 0);
      }
      return (id)NSArray_EmptyArray;
    case 3:
LABEL_4:
      if (!self)
        return 0;
      v9 = (id)objc_msgSend(a3, "copy");
      objc_msgSend(v9, "setPredicate:", -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", objc_msgSend(v9, "predicate")));
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(-[NSAtomicStore _retrieveNodesSatisfyingRequest:]((uint64_t)self, v9), "count")));
    case 8:
      if (!a5)
        return 0;
      v69 = (void *)MEMORY[0x1E0CB35C8];
      v70 = *MEMORY[0x1E0CB28A8];
      v71 = &unk_1E1F4A3E0;
      goto LABEL_86;
    case 10:
      if (!a5)
        return 0;
      v69 = (void *)MEMORY[0x1E0CB35C8];
      v70 = *MEMORY[0x1E0CB28A8];
      v71 = &unk_1E1F4A408;
LABEL_86:
      v72 = (id)objc_msgSend(v69, "errorWithDomain:code:userInfo:", v70, 134091, v71);
      result = 0;
      *a5 = v72;
      return result;
    default:
      goto LABEL_89;
  }
}

- (id)executeFetchRequest:(_QWORD *)a3 withContext:
{
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t v22;
  char v23;
  void *v24;
  _DWORD *v25;
  void *v26;
  void **v27;
  unint64_t v28;
  void *v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  size_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  id v47;
  void *v48;
  char *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSKnownKeysDictionary *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *v63;
  unint64_t v64;
  void **v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  char *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[80];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v75 = a1;
  if (!a1)
    return 0;
  v4 = a2;
  if (objc_msgSend(a2, "propertiesToGroupBy"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported fetch request: store %@ does not support GROUP BY"), v75), 0));
  v5 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", objc_msgSend(v4, "predicate"));
  v6 = -[NSPersistentStore faultHandler](v75);
  v7 = (id)objc_msgSend(v4, "copy");
  objc_msgSend(v7, "setPredicate:", v5);
  v8 = -[NSAtomicStore _retrieveNodesSatisfyingRequest:](v75, v7);
  v9 = objc_msgSend(v4, "resultType");
  v10 = objc_msgSend(v4, "resultType");
  v11 = objc_msgSend(v4, "includesPropertyValues");
  v12 = objc_msgSend(v4, "returnsObjectsAsFaults");
  v13 = objc_msgSend(v8, "count");
  v14 = v13;
  v66 = v13;
  if (!v9)
  {
    v65 = &v63;
    MEMORY[0x1E0C80A78](v13);
    v20 = (char *)&v63 - v19;
    if (v14 >= 0x201)
    {
      v20 = (char *)NSAllocateScannedUncollectable();
      objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
    }
    else
    {
      bzero((char *)&v63 - v19, 8 * v18);
      objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
      if (!v14)
      {
        v21 = 1;
LABEL_18:
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v20, v14);
        if ((v21 & 1) == 0)
        {
          v27 = (void **)v20;
          v28 = v14;
          do
          {
            v29 = *v27++;

            --v28;
          }
          while (v28);
        }
        if (v14 >= 0x201)
          NSZoneFree(0, v20);
        goto LABEL_72;
      }
    }
    v22 = 0;
    v23 = v11 ^ 1 | v12;
    do
    {
      v24 = *(void **)&v20[8 * v22];
      v25 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a3, v24, v6);
      if ((v23 & 1) == 0)
      {
        v26 = (void *)objc_msgSend(*(id *)(v75 + 96), "objectForKey:", v24);
        if (v25)
          v25[4] |= 0x200u;
        _PFFaultHandlerFulfillFault(v6, (uint64_t)v25, (uint64_t)a3, v26, 1);
      }
      *(_QWORD *)&v20[8 * v22++] = v25;
    }
    while (v66 != v22);
    v21 = 0;
    v14 = v66;
    goto LABEL_18;
  }
  if (v10 != 2)
    goto LABEL_72;
  v65 = &v63;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v63 - v16;
  if (v14 > 0x200)
    v17 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v63 - v16, 8 * v15);
  objc_msgSend(v8, "getObjects:range:", v17, 0, v14);
  v30 = (id)objc_msgSend(v4, "propertiesToFetch");
  if (!v30)
  {
    v31 = (_QWORD *)objc_msgSend(v4, "entity");
    if (v31)
      v32 = v31[14];
    else
      v32 = 0;
    v33 = objc_msgSend((id)objc_msgSend(v31, "propertiesByName"), "values");
    v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v33 + 8 * *(_QWORD *)(v32 + 48), *(_QWORD *)(v32 + 56) + *(_QWORD *)(v32 + 48));
  }
  v34 = objc_msgSend(v30, "count");
  v35 = MEMORY[0x1E0C80A78](v34);
  v37 = (char *)&v63 - v36;
  v39 = 8 * v38;
  v64 = v35;
  if (v35 > 0x200)
  {
    v37 = (char *)NSAllocateScannedUncollectable();
    v69 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)&v63 - v36, v39);
    MEMORY[0x1E0C80A78](v40);
    v69 = (char *)&v63 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v69, v39);
  }
  v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v71 = objc_opt_class();
  if (!v14)
  {
    v8 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v17, 0);
    goto LABEL_69;
  }
  v63 = v4;
  v76 = 0;
  v41 = 0;
  v67 = v37;
  v74 = v30;
  do
  {
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
    v77 = 0u;
    v42 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v77, v81, 16, v63);
    if (!v42)
      goto LABEL_60;
    v43 = 0;
    v44 = *(_QWORD *)v78;
    do
    {
      v45 = 0;
      v70 = (int)v43;
      v46 = &v69[8 * (int)v43];
      v68 = v43;
      v73 = &v37[8 * (int)v43];
      do
      {
        v47 = v41;
        if (*(_QWORD *)v78 != v44)
          objc_enumerationMutation(v74);
        v48 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v45);
        v49 = v17;
        v50 = (void *)objc_msgSend(*(id *)(v75 + 96), "objectForKey:", *(_QWORD *)&v17[8 * v76]);
        v51 = objc_msgSend(v48, "_propertyType");
        v52 = objc_msgSend(v48, "name");
        if (objc_msgSend(v48, "_isAttribute"))
        {
          v53 = objc_msgSend(v50, "valueForKey:", v52);
          goto LABEL_44;
        }
        if (v51 != 5)
        {
          if (v51 == 4)
          {
            v53 = objc_msgSend((id)objc_msgSend(v50, "valueForKey:", v52), "objectID");
LABEL_44:
            v54 = (void *)v53;
          }
          else
          {
            v54 = 0;
          }
          v17 = v49;
          v41 = v47;
          goto LABEL_46;
        }
        v55 = (void *)objc_msgSend(v48, "expression");
        v54 = (void *)objc_msgSend(v55, "expressionValueWithObject:context:", v50, v72);
        if (objc_msgSend(v55, "expressionType") == 50)
        {
          v17 = v49;
          if ((objc_msgSend(v55, "isCountOnlyRequest") & 1) != 0
            || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "requestExpression"), "expressionValueWithObject:context:", 0, 0), "resultType") == 4)
          {
            v54 = (void *)objc_msgSend(v54, "lastObject");
          }
        }
        else
        {
          v17 = v49;
        }
        v41 = v47;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v54 = (void *)objc_msgSend(v54, "objectID");
LABEL_46:
        if (!v41)
          *(_QWORD *)&v73[8 * v45] = v52;
        *(_QWORD *)&v46[8 * v45++] = v54;
      }
      while (v42 != v45);
      v30 = v74;
      v56 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
      v42 = v56;
      v43 = v70 + v45;
      v37 = v67;
    }
    while (v56);
    LODWORD(v42) = v45 + v68;
    v14 = v66;
LABEL_60:
    if (!v41)
      v41 = -[NSKnownKeysMappingStrategy initForKeys:count:]([NSKnownKeysMappingStrategy alloc], "initForKeys:count:", v37, (int)v42);
    v57 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v41);
    v58 = v76;
    *(_QWORD *)&v17[8 * v76] = v57;
    -[NSKnownKeysDictionary setValues:](v57, "setValues:", v69);
    v76 = v58 + 1;
  }
  while (v58 + 1 != v14);
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v17, v14);
  v59 = 0;
  do

  while (v14 != v59);
  if (v14 >= 0x201)
    NSZoneFree(0, v17);
  v4 = v63;
LABEL_69:
  if (v64 >= 0x201)
  {
    NSZoneFree(0, v37);
    NSZoneFree(0, v69);
  }

LABEL_72:
  v60 = objc_msgSend(v4, "fetchOffset");
  if (v60)
  {
    if (v60 <= v14)
      objc_msgSend(v8, "removeObjectsInRange:", 0);
    else
      objc_msgSend(v8, "removeAllObjects");
    v14 = objc_msgSend(v8, "count");
  }
  v61 = objc_msgSend(v4, "fetchLimit");
  if (v61 && v14 > v61)
    objc_msgSend(v8, "removeObjectsInRange:", v61, v14 - v61);
  return v8;
}

- (void)_retrieveNodesSatisfyingRequest:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "entity");
  v5 = (void *)v4;
  if (v4)
  {
    if ((*(_BYTE *)(v4 + 120) & 4) != 0)
    {
      v6 = *(void **)(v4 + 72);
    }
    else
    {
      do
      {
        v6 = (void *)v4;
        v4 = objc_msgSend((id)v4, "superentity");
      }
      while (v4);
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 104), "objectForKey:", objc_msgSend(v6, "name"));
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v26 = (void *)objc_msgSend(a2, "predicate");
  if (!v26)
    v26 = (void *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v9 = objc_msgSend(a2, "fetchLimit");
  if (objc_msgSend(a2, "sortDescriptors"))
    v10 = 1;
  else
    v10 = v9 == 0;
  v11 = !v10;
  v12 = objc_msgSend(a2, "includesSubentities", a2);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
LABEL_16:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
      v19 = objc_msgSend((id)objc_msgSend(v18, "objectID"), "entity");
      if ((v5 == (void *)v19 || v12 && objc_msgSend(v5, "_subentitiesIncludes:", v19))
        && objc_msgSend(v26, "evaluateWithObject:", v18))
      {
        objc_msgSend(v8, "addObject:", v18);
      }
      if (v11 && objc_msgSend(v8, "count") > v9)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v15)
          goto LABEL_16;
        break;
      }
    }
  }
  v20 = objc_msgSend(v25, "sortDescriptors");
  if (v20)
    objc_msgSend(v8, "sortUsingDescriptors:", v20);
  v21 = objc_msgSend(v8, "count");
  if (v21)
  {
    v22 = v21;
    for (i = 0; i != v22; ++i)
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", i, objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", i), "objectID"));
  }
  return v8;
}

- (void)_getNewIDForObject:(void *)result
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "newReferenceObjectForManagedObject:", a2);
    v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "objectIDFactoryForEntity:", objc_msgSend(a2, "entity"))), "initWithObject:", v4);

    return (void *)v5;
  }
  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  if (self)
    self = (NSAtomicStore *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", a3, a4, a5);
  return self;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  const __CFAllocator *v12;
  CFIndex v13;
  __CFArray *Mutable;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self)
    v7 = (void *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", a4);
  else
    v7 = 0;
  v8 = objc_msgSend(a3, "name");
  v9 = objc_msgSend(a3, "isToMany");
  v10 = (void *)objc_msgSend(v7, "valueForKey:", v8);
  v11 = v10;
  if ((v9 & 1) == 0)
    return (id)objc_msgSend(v10, "objectID");
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v13 = objc_msgSend(v10, "count");
  Mutable = CFArrayCreateMutable(v12, v13, MEMORY[0x1E0C9B378]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v11);
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "objectID"));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }
  return Mutable;
}

- (void)_didLoadMetadata
{
  void *v3;

  v3 = (void *)objc_msgSend(-[NSAtomicStore metadata](self, "metadata"), "objectForKey:", 0x1E1EF14D0);
  if (v3)
    v3 = (void *)objc_msgSend(v3, "integerValue");
  self->_nextReference = (int64_t)v3;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "objectID");
        if ((objc_msgSend(v12, "isTemporaryID") & 1) != 0)
        {
          v13 = -[NSAtomicStore _getNewIDForObject:](self, v11);
          objc_msgSend(v6, "addObject:", v13);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  return v6;
}

@end
