@implementation NSDictionaryStoreMap

+ (void)initialize
{
  objc_opt_self();
}

- (NSDictionaryStoreMap)initWithStore:(id)a3
{
  return -[NSDictionaryStoreMap initWithStore:fromPath:](self, "initWithStore:fromPath:", a3, 0);
}

- (NSDictionaryStoreMap)initWithStore:(id)a3 fromPath:(id)a4
{
  NSDictionaryStoreMap *v6;
  NSBinaryObjectStoreFile *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)NSDictionaryStoreMap;
  v6 = -[NSPersistentStoreMap initWithStore:](&v23, sel_initWithStore_);
  if (v6)
  {
    if (a4)
    {
      v7 = objc_alloc_init(NSBinaryObjectStoreFile);
      v7->_storeOptions = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "options"), "copy");
      v22 = 0;
      if ((-[NSBinaryObjectStoreFile readFromFile:error:]((uint64_t)v7, (uint64_t)a4, &v22) & 1) == 0)
      {

        v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v22, *MEMORY[0x1E0CB3388]);
        v17 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 259, (uint64_t)CFSTR("Can't read binary data from file"), v16);
        objc_exception_throw(v17);
      }
      if (v7->_databaseVersion != 134481920)
      {

        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't load binary data from file (file was created by an incompatible version of CoreData)"), 0));
      }
      -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v7->_fullMetadata);
      v6->super._nextPK64 = v7->_primaryKeyGeneration;
      v8 = v7->_mapData;
      v6->_theMap = v8;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = (void *)-[NSMutableDictionary allValues](v8, "allValues");
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v9);
            -[NSStoreMapNode _setMap:](*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12++), (uint64_t)v6);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v10);
      }

    }
    else
    {
      v6->_theMap = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1024);
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", +[_PFRoutines _getUUID](), CFSTR("NSStoreUUID"), CFSTR("Binary"), CFSTR("NSStoreType"), 0);
      v14 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](v6, v13, 1);
      -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v14);
    }
  }
  return v6;
}

- (NSDictionaryStoreMap)initWithStore:(id)a3 fromArchivedData:(id)a4
{
  NSDictionaryStoreMap *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  objc_super v35;
  uint64_t v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)NSDictionaryStoreMap;
  v6 = -[NSPersistentStoreMap initWithStore:](&v35, sel_initWithStore_);
  if (v6)
  {
    if (a4)
    {
      v7 = (void *)objc_msgSend(a3, "options");
      v8 = v7;
      if (byte_1ECD8DE1C)
      {
        v9 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("_NSBinaryStoreInsecureDecodingCompatibilityOption"));
        if (v9)
          v10 = objc_msgSend(v9, "BOOLValue") ^ 1;
        else
          v10 = 1;
      }
      else
      {
        v10 = 0;
      }
      v34 = 0;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a4, &v34);
      if (v34)
      {
        v23 = objc_msgSend(v34, "code");
        v39 = *MEMORY[0x1E0CB3388];
        v40[0] = v34;
        v24 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
        v25 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v23, (uint64_t)CFSTR("Keyed archiver failure"), v24);
        objc_exception_throw(v25);
      }
      v12 = (id)+[NSBinaryObjectStore _classesForPropertyValues]();
      if (v10)
      {
        objc_msgSend(v11, "setRequiresSecureCoding:", 1);
        objc_msgSend(v11, "_allowDecodingCyclesInSecureMode");
        v13 = objc_msgSend(v8, "objectForKey:", CFSTR("NSBinaryStoreSecureDecodingClasses"));
        if (v13)
        {
          v12 = (id)objc_msgSend(v12, "mutableCopy");
          objc_msgSend(v12, "unionSet:", v13);
        }
      }
      else
      {
        objc_msgSend(v11, "setRequiresSecureCoding:", 0);
      }
      objc_msgSend(v11, "setDecodingFailurePolicy:", 1);
      if (objc_msgSend(v11, "decodeIntForKey:", CFSTR("_NSStoreMapArchiveVersion")) != 134481920)
      {
        v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], 262, (uint64_t)CFSTR("Can't load data from archived data (archived data was created by an incompatible version of CoreData)"), 0);
        objc_exception_throw(v26);
      }
      v14 = (void *)objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v12, CFSTR("_NSStoreMapArchiveMetadata"));
      if (v14)
      {
        v15 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](v6, v14, 1);
        -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v15);
      }
      v16 = (void *)objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_NSStoreMapArchiveNextPK"));
      if (v16)
        v16 = (void *)objc_msgSend(v16, "unsignedLongLongValue");
      v6->super._nextPK64 = (unint64_t)v16;
      v17 = (NSMutableDictionary *)(id)objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v12, CFSTR("_NSStoreMapArchiveData"));
      v6->_theMap = v17;
      if (v17)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v18 = (void *)-[NSMutableDictionary allValues](v17, "allValues", 0);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v18);
              -[NSStoreMapNode _setMap:](*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), (uint64_t)v6);
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v19);
        }
      }
      if (objc_msgSend(v11, "error"))
      {
        v34 = (id)objc_msgSend(v11, "error");
        v27 = objc_msgSend(v34, "code");
        v36 = *MEMORY[0x1E0CB3388];
        v37 = v34;
        v28 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v27, (uint64_t)CFSTR("Keyed archiver failure"), v28);
        objc_exception_throw(v29);
      }
      objc_msgSend(v11, "finishDecoding");

      if (v34)
      {

        return 0;
      }
    }
    else
    {
      v6->_theMap = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1024);
    }
  }
  return v6;
}

- (void)saveToPath:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  NSBinaryObjectStoreFile *v6;
  NSDictionary *v7;
  uint64_t v8;
  unsigned __int8 v9;
  _NSCoreDataException *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _NSCoreDataException *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _NSCoreDataException *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  char v25;

  if (!a1)
    return;
  v25 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = objc_msgSend(a2, "stringByDeletingLastPathComponent");
  if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v25) & 1) == 0)
  {
    v10 = [_NSCoreDataException alloc];
    v11 = *MEMORY[0x1E0C99778];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Directory does not exist : %@"), v5);
LABEL_10:
    v13 = v12;
    v14 = v10;
    v15 = v11;
    v16 = 514;
    v17 = 0;
    goto LABEL_17;
  }
  if (!v25)
  {
    v10 = [_NSCoreDataException alloc];
    v11 = *MEMORY[0x1E0C99778];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not a directory : %@"), v5);
    goto LABEL_10;
  }
  v6 = objc_alloc_init(NSBinaryObjectStoreFile);
  v6->_storeOptions = (NSDictionary *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "options"), "copy");
  v6->_databaseVersion = 134481920;
  v7 = *(NSDictionary **)(a1 + 24);
  if (v6->_fullMetadata != v7)
  {
    v8 = -[NSDictionary copy](v7, "copy");

    v6->_fullMetadata = (NSDictionary *)v8;
  }
  v6->_primaryKeyGeneration = *(_QWORD *)(a1 + 32);
  -[NSXPCStoreServerConnectionContext setActiveStore:]((uint64_t)v6, *(void **)(a1 + 48));
  v24 = 0;
  v9 = -[NSBinaryObjectStoreFile writeToFile:error:](v6, (uint64_t)a2, (uint64_t)&v24);

  if ((v9 & 1) == 0)
  {
    if (v24)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v24, *MEMORY[0x1E0CB3388]);
      v19 = v24;
      if (v24)
      {
LABEL_15:
        if (objc_msgSend(v19, "code") != 513)
        {
          v23 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], objc_msgSend(v24, "code"), (uint64_t)CFSTR("Binary store save failed."), v18);
          -[_NSCoreDataException _setDomain:]((uint64_t)v23, (void *)objc_msgSend(v24, "domain"));
          objc_exception_throw(v23);
        }
        v20 = [_NSCoreDataException alloc];
        v21 = *MEMORY[0x1E0C99778];
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Directory is not writable : %@"), v5);
        v14 = v20;
        v15 = v21;
        v16 = 513;
        v17 = v18;
LABEL_17:
        v22 = -[_NSCoreDataException initWithName:code:reason:userInfo:](v14, v15, v16, v13, v17);
        objc_exception_throw(v22);
      }
    }
    else
    {
      v18 = 0;
    }
    v19 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, 0);
    v24 = v19;
    goto LABEL_15;
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_theMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSDictionaryStoreMap;
  -[NSPersistentStoreMap dealloc](&v3, sel_dealloc);
}

- (id)dataForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", a3);
}

- (void)addObject:(id)a3 objectIDMap:(id)a4
{
  id **v4;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  id **v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  NSDictionaryMapNode *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v4 = (id **)a3;
  v64 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    v57 = 0;
    goto LABEL_41;
  }
  v8 = objc_msgSend(a3, "entity");
  v9 = (void *)objc_msgSend(a3, "objectID");
  v53 = (id **)a3;
  if (!a3)
  {
    v50 = (void *)MEMORY[0x1E0C99DA0];
    v51 = *MEMORY[0x1E0C99778];
    v52 = CFSTR("Can't construct a node from nil.");
    goto LABEL_48;
  }
  v10 = (uint64_t)v9;
  if (objc_msgSend(v9, "isTemporaryID"))
    v10 = objc_msgSend(a4, "objectForKey:", v10);
  if (!v8)
  {
    v50 = (void *)MEMORY[0x1E0C99DA0];
    v51 = *MEMORY[0x1E0C99768];
    v52 = CFSTR("Can't find entity for object");
LABEL_48:
    objc_exception_throw((id)objc_msgSend(v50, "exceptionWithName:reason:userInfo:", v51, v52, 0));
  }
  v11 = *(_QWORD **)(v8 + 112);
  v56 = objc_msgSend((id)objc_msgSend((id)v8, "propertiesByName"), "values");
  v12 = PF_CALLOC_OBJECT_ARRAY(objc_msgSend(*(id *)(v8 + 104), "length"));
  if (objc_msgSend(a3, "isFault"))
    objc_msgSend(a3, "willAccessValueForKey:", 0);
  v58 = _kvcPropertysPrimitiveGetters((unint64_t *)v8);
  v57 = -[NSDictionaryMapNode initWithValues:objectID:]([NSDictionaryMapNode alloc], "initWithValues:objectID:", v12, v10);
  -[NSStoreMapNode _setMap:]((uint64_t)v57, (uint64_t)self);
  v18 = v11[6];
  v17 = v11[7];
  v4 = v53;
  if (v18 < v17 + v18)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty(v53, v18, 0, *(_QWORD *)(v58 + 8 * v18), v13, v14, v15, v16);
      if (v19)
        v12[v18] = v19;
      ++v18;
      --v17;
    }
    while (v17);
  }
  v20 = v11[12];
  v21 = v11[13];
  v22 = v56;
  if (v20 < v21 + v20)
  {
    do
    {
      v23 = objc_msgSend(*(id *)(v22 + 8 * v20), "name");
      _PF_Handler_Primitive_GetProperty(v53, v20, v23, *(_QWORD *)(v58 + 8 * v20), v24, v25, v26, v27);
      if (v28)
      {
        v29 = (void *)v28;
        if (-[NSManagedObject _isValidRelationshipDestination__](v28))
        {
          v30 = (void *)objc_msgSend(v29, "objectID");
          if (objc_msgSend(v30, "isTemporaryID"))
            v30 = (void *)objc_msgSend(a4, "objectForKey:", v30);
          if ((NSMappedObjectStore *)objc_msgSend(v30, "persistentStore") != self->super._store)
          {
            v48 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v53, CFSTR("Source object"), v29, CFSTR("Destination Object"), *(_QWORD *)(v56 + 8 * v20), CFSTR("Relationship"), 0);

LABEL_43:
            v49 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 133010, (uint64_t)CFSTR("CoreData does not support persistent cross-store relationships"), v48);
            objc_exception_throw(v49);
          }
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend(v30, "_referenceData"), 0);
          if (v57)
            -[NSMutableDictionary setObject:forKey:](v57->super._relatedNodes, "setObject:forKey:", v31, v23);

          v22 = v56;
        }
      }
      ++v20;
      --v21;
    }
    while (v21);
  }
  v32 = v11[18];
  v55 = v11[19] + v32;
  if (v32 < v55)
  {
    do
    {
      v33 = objc_msgSend(*(id *)(v22 + 8 * v32), "name");
      _PF_Handler_Primitive_GetProperty(v4, v32, v33, *(_QWORD *)(v58 + 8 * v32), v34, v35, v36, v37);
      if (v38)
      {
        v39 = v38;
        v54 = v33;
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v38, "count"));
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v60 != v43)
                objc_enumerationMutation(v39);
              v45 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              if (-[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v45))
              {
                v46 = (void *)objc_msgSend(v45, "objectID");
                if (objc_msgSend(v46, "isTemporaryID"))
                  v46 = (void *)objc_msgSend(a4, "objectForKey:", v46);
                if ((NSMappedObjectStore *)objc_msgSend(v46, "persistentStore") != self->super._store)
                {
                  v48 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v53, CFSTR("Source object"), v45, CFSTR("Destination Object"), *(_QWORD *)(v56 + 8 * v32), CFSTR("Relationship"), 0);

                  goto LABEL_43;
                }
                objc_msgSend(v40, "addObject:", objc_msgSend(v46, "_referenceData"));
              }
            }
            v42 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          }
          while (v42);
        }
        v47 = objc_msgSend(v40, "count");
        if (v57 && v47)
          -[NSMutableDictionary setObject:forKey:](v57->super._relatedNodes, "setObject:forKey:", v40, v54);

        v4 = v53;
        v22 = v56;
      }
      ++v32;
    }
    while (v32 != v55);
  }
LABEL_41:
  -[NSMutableDictionary setObject:forKey:](self->_theMap, "setObject:forKey:", v57, objc_msgSend((id)objc_msgSend(v4, "objectID"), "_referenceData"));
  -[NSStoreMapNode _setVersionNumber:](v57, "_setVersionNumber:", 1);

}

- (void)removeObject:(id)a3 objectIDMap:(id)a4
{
  -[NSMutableDictionary removeObjectForKey:](self->_theMap, "removeObjectForKey:", objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData"));
}

- (void)updateObject:(id)a3 objectIDMap:(id)a4
{
  unint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  int v21;

  v7 = (unint64_t *)objc_msgSend(a3, "entity");
  if (v7)
    v8 = (_QWORD *)v7[14];
  else
    v8 = 0;
  v13 = _kvcPropertysPrimitiveGetters(v7);
  v14 = v8[18];
  v15 = v8[19];
  if (v14 < v15 + v14)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty((id **)a3, v14, 0, *(_QWORD *)(v13 + 8 * v14), v9, v10, v11, v12);
      objc_msgSend(v16, "count");
      ++v14;
      --v15;
    }
    while (v15);
  }
  v17 = v8[26];
  v18 = v8[27];
  if (v17 < v18 + v17)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty((id **)a3, v17, 0, *(_QWORD *)(v13 + 8 * v17), v9, v10, v11, v12);
      objc_msgSend(v19, "count");
      ++v17;
      --v18;
    }
    while (v18);
  }
  v20 = objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData");
  v21 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", v20), "_versionNumber");
  -[NSDictionaryStoreMap removeObject:objectIDMap:](self, "removeObject:objectIDMap:", a3, a4);
  -[NSDictionaryStoreMap addObject:objectIDMap:](self, "addObject:objectIDMap:", a3, a4);
  objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", v20), "_setVersionNumber:", (v21 + 1));
}

- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;

  v5 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", objc_msgSend(a4, "_referenceData")), "destinationsForRelationship:", objc_msgSend(a3, "name"));
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "count");
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      v10 = (void *)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", objc_msgSend(v6, "objectAtIndex:", i));
      if (v10)
        objc_msgSend(v8, "addObject:", objc_msgSend(v10, "objectID"));
    }
  }
  return v8;
}

- (id)handleFetchRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMutableDictionary allValues](self->_theMap, "allValues");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_msgSend(a3, "entity");
  v7 = (void *)objc_msgSend(a3, "predicate");
  v8 = objc_msgSend(a3, "fetchLimit");
  v25 = v8;
  if (objc_msgSend(a3, "sortDescriptors"))
    v9 = 1;
  else
    v9 = v8 == 0;
  v10 = !v9;
  v11 = objc_msgSend(a3, "includesSubentities", a3);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
LABEL_9:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v16);
      v18 = objc_msgSend(v17, "entity");
      if ((v6 == (void *)v18 || v11 && objc_msgSend(v6, "_subentitiesIncludes:", v18))
        && (!v7 || objc_msgSend(v7, "evaluateWithObject:", v17)))
      {
        objc_msgSend(v5, "addObject:", v17);
      }
      if (v10 && objc_msgSend(v5, "count") > v25)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v14)
          goto LABEL_9;
        break;
      }
    }
  }
  v19 = objc_msgSend(v24, "sortDescriptors");
  if (v19)
    objc_msgSend(v5, "sortUsingDescriptors:", v19);
  v20 = objc_msgSend(v5, "count");
  if (v20)
  {
    v21 = v20;
    for (i = 0; i != v21; ++i)
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", i, objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", i), "objectID"));
  }
  return v5;
}

- (uint64_t)_archivedData
{
  uint64_t v2;
  void *v3;

  if (!a1)
    return 0;
  v2 = objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 1024);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initForWritingWithMutableData:", v2);
  objc_msgSend(v3, "encodeInt:forKey:", 134481920, CFSTR("_NSStoreMapArchiveVersion"));
  objc_msgSend(v3, "encodeObject:forKey:", a1[3], CFSTR("_NSStoreMapArchiveMetadata"));
  objc_msgSend(v3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[4]), CFSTR("_NSStoreMapArchiveNextPK"));
  objc_msgSend(v3, "encodeObject:forKey:", a1[6], CFSTR("_NSStoreMapArchiveData"));
  objc_msgSend(v3, "finishEncoding");

  return v2;
}

@end
