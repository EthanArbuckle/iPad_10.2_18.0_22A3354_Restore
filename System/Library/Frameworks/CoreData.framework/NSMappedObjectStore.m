@implementation NSMappedObjectStore

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSMappedObjectStore)init
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSMappedObjectStore must be initialized with initWithPersistentStoreCoordinator:configurationName:URL:options:"), 0));
}

- (NSMappedObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  void *v7;
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
  uint64_t v18;
  NSMappedObjectStore *v19;
  NSMappedObjectStore *v20;
  void *v21;
  CFIndex v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CFSetCallBacks callBacks;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = (void *)objc_msgSend(a3, "managedObjectModel");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v45 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              v18 = objc_msgSend(v17, "_propertyType");
              switch(v18)
              {
                case 2:
                  if (objc_msgSend(v17, "attributeType") == 1000
                    && objc_msgSend(v17, "isFileBackedFuture"))
                  {

                    v31 = (void *)MEMORY[0x1E0C99DA0];
                    v32 = *MEMORY[0x1E0C99778];
                    v33 = CFSTR("Core Data provided atomic stores do not support file backed futures");
LABEL_35:
                    objc_exception_throw((id)objc_msgSend(v31, "exceptionWithName:reason:userInfo:", v32, v33, 0));
                  }
                  break;
                case 6:

                  v31 = (void *)MEMORY[0x1E0C99DA0];
                  v32 = *MEMORY[0x1E0C99778];
                  v33 = CFSTR("Core Data provided atomic stores do not support derived properties");
                  goto LABEL_35;
                case 7:

                  v31 = (void *)MEMORY[0x1E0C99DA0];
                  v32 = *MEMORY[0x1E0C99778];
                  v33 = CFSTR("Core Data provided atomic stores do not support composite attributes");
                  goto LABEL_35;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v14);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v9);
  }
  v43.receiver = self;
  v43.super_class = (Class)NSMappedObjectStore;
  v19 = -[NSPersistentStore initWithPersistentStoreCoordinator:configurationName:URL:options:](&v43, sel_initWithPersistentStoreCoordinator_configurationName_URL_options_, a3, a4, a5, a6);
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_msgSend((id)objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](v19, "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", a4);
    v22 = *MEMORY[0x1E0C9B3B0];
    callBacks.retain = 0;
    callBacks.release = 0;
    callBacks.version = v22;
    *(_OWORD *)&callBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 24);
    callBacks.hash = *(CFSetHashCallBack *)(MEMORY[0x1E0C9B3B0] + 40);
    v20->_entitiesToFetch = (NSSet *)CFSetCreateMutable(0, objc_msgSend(v21, "count"), &callBacks);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
          -[NSSet addObject:](v20->_entitiesToFetch, "addObject:", v27);
          -[NSSet addObjectsFromArray:](v20->_entitiesToFetch, "addObjectsFromArray:", objc_msgSend(v27, "subentities"));
          v28 = objc_msgSend(v27, "superentity");
          if (v28)
          {
            v29 = (void *)v28;
            do
            {
              -[NSSet addObject:](v20->_entitiesToFetch, "addObject:", v29);
              v29 = (void *)objc_msgSend(v29, "superentity");
            }
            while (v29);
          }
        }
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      }
      while (v24);
    }
  }
  return v20;
}

- (void)dealloc
{
  id v3;
  NSSet *entitiesToFetch;
  objc_super v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);

  self->_theMap = 0;
  entitiesToFetch = self->_entitiesToFetch;
  if (entitiesToFetch)
    CFRelease(entitiesToFetch);
  objc_msgSend(v3, "drain");
  v5.receiver = self;
  v5.super_class = (Class)NSMappedObjectStore;
  -[NSPersistentStore dealloc](&v5, sel_dealloc);
}

- (_QWORD)_setMap:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[12];
    if (v4 != a2)
    {

      result = a2;
      v3[12] = result;
    }
  }
  return result;
}

- (void)saveDocumentToPath:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  id result;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  NSURL *v39;
  id v40;
  _QWORD *v41;
  id v42;
  void *v43;
  __int128 v44;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (!a3)
LABEL_61:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown command type %@"), a4, a5, a3), 0));
  switch(objc_msgSend(a3, "requestType"))
  {
    case 1:
      if (objc_msgSend(a3, "resultType") == 4)
        goto LABEL_4;
      if (!-[NSSet containsObject:](self->_entitiesToFetch, "containsObject:", objc_msgSend(a3, "entity")))
        return (id)NSArray_EmptyArray;
      return -[NSMappedObjectStore executeFetchRequest:withContext:]((unint64_t)self, a3, (_QWORD **)a4);
    case 2:
      if (!self)
        return 0;
      if (-[NSSaveChangesRequest hasChanges]((_BOOL8)a3) || (*(_BYTE *)&self->super._flags & 4) != 0)
      {
        v41 = a4;
        v42 = a3;
        v15 = (void *)objc_msgSend(a3, "insertedObjects");
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v57 != v19)
                objc_enumerationMutation(v15);
              v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              v22 = (void *)objc_msgSend(v21, "objectID");
              if (objc_msgSend(v22, "isTemporaryID"))
              {
                v23 = -[NSMappedObjectStore getNewIDForObject:]((id *)&self->super.super.isa, v21);
                objc_msgSend(v16, "setObject:forKey:", v23, v22);
                objc_msgSend(v43, "addObject:", v21);
                objc_msgSend(v17, "addObject:", v23);

              }
            }
            v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          }
          while (v18);
        }
        if (objc_msgSend(v43, "count"))
        {
          v24 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](v41, v43, v17);
          if (v24)
            -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)v42, (uint64_t)v24);

        }
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v25 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v53 != v26)
                objc_enumerationMutation(v15);
              v28 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
              if (v28)
                -[NSPersistentStoreMap addObject:objectIDMap:](self->_theMap, "addObject:objectIDMap:", v28, v16);
            }
            v25 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          }
          while (v25);
        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v29 = (void *)objc_msgSend(v42, "deletedObjects");
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v49 != v31)
                objc_enumerationMutation(v29);
              v33 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k);
              if (v33)
                -[NSPersistentStoreMap removeObject:objectIDMap:](self->_theMap, "removeObject:objectIDMap:", v33, v16);
            }
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
          }
          while (v30);
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v34 = (void *)objc_msgSend(v42, "updatedObjects");
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v45;
          do
          {
            for (m = 0; m != v35; ++m)
            {
              if (*(_QWORD *)v45 != v36)
                objc_enumerationMutation(v34);
              v38 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m);
              if (v38)
                -[NSPersistentStoreMap updateObject:objectIDMap:](self->_theMap, "updateObject:objectIDMap:", v38, v16);
            }
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
          }
          while (v35);
        }
        v39 = -[NSPersistentStore URL](self, "URL");
        if (v39)
          -[NSMappedObjectStore saveDocumentToPath:](self, "saveDocumentToPath:", -[NSURL path](v39, "path"));
        -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 0);

      }
      return (id)NSArray_EmptyArray;
    case 3:
LABEL_4:
      if (!self)
        return 0;
      v9 = (id)objc_msgSend(a3, "copy");
      objc_msgSend(v9, "setPredicate:", -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", objc_msgSend(v9, "predicate")));
      v10 = objc_msgSend(-[NSPersistentStoreMap handleFetchRequest:](self->_theMap, "handleFetchRequest:", v9), "count");
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v10));
    case 8:
      if (!a5)
        return 0;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB28A8];
      v14 = &unk_1E1F4AA70;
      goto LABEL_56;
    case 10:
      if (!a5)
        return 0;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB28A8];
      v14 = &unk_1E1F4AA98;
LABEL_56:
      v40 = (id)objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 134091, v14);
      result = 0;
      *a5 = v40;
      return result;
    default:
      goto LABEL_61;
  }
}

- (void)executeFetchRequest:(_QWORD *)a3 withContext:
{
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
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
  uint64_t v21;
  char v22;
  void *v23;
  _DWORD *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  size_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  void *v45;
  char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSKnownKeysDictionary *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v60;
  unint64_t v61;
  void **v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  char *v70;
  id v71;
  unint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[80];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v72 = a1;
  if (!a1)
    return 0;
  v4 = a2;
  if (objc_msgSend(a2, "propertiesToGroupBy"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported fetch request: store %@ does not support GROUP BY"), v72), 0));
  v5 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", objc_msgSend(v4, "predicate"));
  v6 = -[NSPersistentStore faultHandler](v72);
  v7 = (id)objc_msgSend(v4, "copy");
  objc_msgSend(v7, "setPredicate:", v5);
  v8 = (void *)objc_msgSend(*(id *)(v72 + 96), "handleFetchRequest:", v7);
  v9 = objc_msgSend(v4, "resultType");
  v10 = objc_msgSend(v4, "resultType");
  v11 = objc_msgSend(v4, "includesPropertyValues");
  v12 = objc_msgSend(v4, "returnsObjectsAsFaults");
  v13 = objc_msgSend(v8, "count");
  v14 = v13;
  v63 = v13;
  if (v9)
  {
    if (v10 != 2)
      goto LABEL_70;
    v62 = &v60;
    MEMORY[0x1E0C80A78](v13);
    v17 = (char *)&v60 - v16;
    if (v14 > 0x200)
      v17 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v60 - v16, 8 * v15);
    objc_msgSend(v8, "getObjects:range:", v17, 0, v14);
    v27 = (id)objc_msgSend(v4, "propertiesToFetch");
    if (!v27)
    {
      v28 = (_QWORD *)objc_msgSend(v4, "entity");
      if (v28)
        v29 = v28[14];
      else
        v29 = 0;
      v30 = objc_msgSend((id)objc_msgSend(v28, "propertiesByName"), "values");
      v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v30 + 8 * *(_QWORD *)(v29 + 48), *(_QWORD *)(v29 + 56) + *(_QWORD *)(v29 + 48));
    }
    v31 = objc_msgSend(v27, "count");
    v32 = MEMORY[0x1E0C80A78](v31);
    v34 = (char *)&v60 - v33;
    v36 = 8 * v35;
    v61 = v32;
    if (v32 > 0x200)
    {
      v34 = (char *)NSAllocateScannedUncollectable();
      v66 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v60 - v33, v36);
      MEMORY[0x1E0C80A78](v37);
      v66 = (char *)&v60 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v66, v36);
    }
    v69 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v68 = objc_opt_class();
    if (!v14)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v17, 0);
      goto LABEL_67;
    }
    v60 = v4;
    v73 = 0;
    v38 = 0;
    v64 = v34;
    v71 = v27;
    while (1)
    {
      v76 = 0u;
      v77 = 0u;
      v75 = 0u;
      v74 = 0u;
      v39 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v78, 16, v60);
      if (!v39)
        goto LABEL_58;
      v40 = 0;
      v41 = *(_QWORD *)v75;
      do
      {
        v42 = 0;
        v67 = (int)v40;
        v43 = &v66[8 * (int)v40];
        v65 = v40;
        v70 = &v34[8 * (int)v40];
        do
        {
          v44 = v38;
          if (*(_QWORD *)v75 != v41)
            objc_enumerationMutation(v71);
          v45 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v42);
          v46 = v17;
          v47 = (void *)objc_msgSend(*(id *)(v72 + 96), "dataForKey:", objc_msgSend(*(id *)&v17[8 * v73], "_referenceData"));
          v48 = objc_msgSend(v45, "_propertyType");
          v49 = objc_msgSend(v45, "name");
          if (v48 != 5)
          {
            if (v48 == 4)
            {
              v50 = objc_msgSend((id)objc_msgSend(v47, "valueForKey:", v49), "objectID");
LABEL_42:
              v51 = (void *)v50;
            }
            else
            {
              if (v48 == 2)
              {
                v50 = objc_msgSend(v47, "valueForKey:", v49);
                goto LABEL_42;
              }
              v51 = 0;
            }
            v17 = v46;
            v38 = v44;
            goto LABEL_49;
          }
          v52 = (void *)objc_msgSend(v45, "expression");
          v51 = (void *)objc_msgSend(v52, "expressionValueWithObject:context:", v47, v69);
          if (objc_msgSend(v52, "expressionType") == 50)
          {
            v17 = v46;
            if ((objc_msgSend(v52, "isCountOnlyRequest") & 1) != 0
              || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v52, "requestExpression"), "expressionValueWithObject:context:", 0, 0), "resultType") == 4)
            {
              v51 = (void *)objc_msgSend(v51, "lastObject");
            }
          }
          else
          {
            v17 = v46;
          }
          v38 = v44;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v51 = (void *)objc_msgSend(v51, "objectID");
LABEL_49:
          if (!v38)
            *(_QWORD *)&v70[8 * v42] = v49;
          *(_QWORD *)&v43[8 * v42++] = v51;
        }
        while (v39 != v42);
        v27 = v71;
        v53 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
        v39 = v53;
        v40 = v67 + v42;
        v34 = v64;
      }
      while (v53);
      LODWORD(v39) = v42 + v65;
      v14 = v63;
LABEL_58:
      if (!v38)
        v38 = -[NSKnownKeysMappingStrategy initForKeys:count:]([NSKnownKeysMappingStrategy alloc], "initForKeys:count:", v34, (int)v39);
      v54 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v38);
      v55 = v73;
      *(_QWORD *)&v17[8 * v73] = v54;
      -[NSKnownKeysDictionary setValues:](v54, "setValues:", v66);
      v73 = v55 + 1;
      if (v55 + 1 == v14)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v17, v14);
        v56 = 0;
        do

        while (v14 != v56);
        if (v14 >= 0x201)
          NSZoneFree(0, v17);
        v4 = v60;
LABEL_67:
        if (v61 >= 0x201)
        {
          NSZoneFree(0, v34);
          NSZoneFree(0, v66);
        }

        goto LABEL_70;
      }
    }
  }
  v62 = &v60;
  MEMORY[0x1E0C80A78](v13);
  v20 = (char *)&v60 - v19;
  if (v14 >= 0x201)
  {
    v20 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
  }
  else
  {
    bzero((char *)&v60 - v19, 8 * v18);
    objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
    if (!v14)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v20, 0);
      goto LABEL_70;
    }
  }
  v21 = 0;
  v22 = v11 ^ 1 | v12;
  do
  {
    v23 = *(void **)&v20[8 * v21];
    v24 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a3, v23, v6);
    if ((v22 & 1) == 0)
    {
      v25 = (void *)objc_msgSend(*(id *)(v72 + 96), "dataForKey:", objc_msgSend(v23, "_referenceData"));
      if (v24)
        v24[4] |= 0x200u;
      _PFFaultHandlerFulfillFault(v6, (uint64_t)v24, (uint64_t)a3, v25, 1);
    }
    *(_QWORD *)&v20[8 * v21++] = v24;
  }
  while (v63 != v21);
  v14 = v63;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v20, v63);
  v26 = 0;
  do

  while (v14 != v26);
  if (v14 >= 0x201)
    NSZoneFree(0, v20);
LABEL_70:
  v57 = objc_msgSend(v4, "fetchOffset");
  if (v57)
  {
    if (v57 <= v14)
      objc_msgSend(v8, "removeObjectsInRange:", 0);
    else
      objc_msgSend(v8, "removeAllObjects");
    v14 = objc_msgSend(v8, "count");
  }
  v58 = objc_msgSend(v4, "fetchLimit");
  if (v58 && v14 > v58)
    objc_msgSend(v8, "removeObjectsInRange:", v58, v14 - v58);
  return v8;
}

- (id)getNewIDForObject:(id *)result
{
  id *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result[12], "nextPK64");
    v5 = (objc_class *)objc_msgSend(v3, "objectIDFactoryForEntity:", objc_msgSend(a2, "entity"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v4);
    v7 = objc_msgSend([v5 alloc], "initWithObject:", v6);

    return (id *)v7;
  }
  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return -[NSPersistentStoreMap dataForKey:](self->_theMap, "dataForKey:", objc_msgSend(a3, "_referenceData"));
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  id v7;
  void *v8;
  id v9;

  v7 = -[NSPersistentStoreMap retainedObjectIDsForRelationship:forObjectID:](self->_theMap, "retainedObjectIDsForRelationship:forObjectID:", a3, a4, a5, a6);
  if ((objc_msgSend(a3, "isToMany") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v7, "lastObject");
    v9 = v8;

    return v8;
  }
  return v7;
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
  id *v13;
  id *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "objectID");
        if (objc_msgSend(v12, "isTemporaryID"))
          v13 = -[NSMappedObjectStore getNewIDForObject:]((id *)&self->super.super.isa, v11);
        else
          v13 = v12;
        v14 = v13;
        objc_msgSend(v6, "addObject:", v13);

      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  return v6;
}

- (id)identifier
{
  return (id)-[NSPersistentStoreMap databaseUUID]((uint64_t)self->_theMap);
}

- (id)_rawMetadata__
{
  NSPersistentStoreMap *theMap;

  theMap = self->_theMap;
  if (theMap)
    return theMap->_storeMetadata;
  else
    return 0;
}

- (id)metadata
{
  NSPersistentStoreMap *theMap;

  theMap = self->_theMap;
  if (theMap)
    return theMap->_storeMetadata;
  else
    return 0;
}

- (void)setMetadata:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSMappedObjectStore;
  -[NSPersistentStore setMetadata:](&v5, sel_setMetadata_);
  -[NSPersistentStoreMap setMetadata:](self->_theMap, a3);
}

@end
