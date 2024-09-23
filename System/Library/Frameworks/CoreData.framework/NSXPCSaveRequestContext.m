@implementation NSXPCSaveRequestContext

- (id)initForStore:(id)a3 request:(id)a4 metadata:(id)a5 forceInsertsToUpdates:(BOOL)a6 context:(id)a7
{
  NSXPCSaveRequestContext *v12;
  NSXPCSaveRequestContext *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NSXPCSaveRequestContext;
  v12 = -[NSXPCSaveRequestContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_store = (NSXPCStore *)a3;
    v12->_request = (NSSaveChangesRequest *)a4;
    v12->_context = (NSManagedObjectContext *)a7;
    v12->_metadata = (NSDictionary *)a5;
    v13->_changeCache = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a4, "updatedObjects"), "count")+ objc_msgSend((id)objc_msgSend(a4, "insertedObjects"), "count"));
    v13->_interrupts = 0;
    v13->_forceUpdates = a6;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  self->_request = 0;
  self->_context = 0;

  self->_metadata = 0;
  self->_changeCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCSaveRequestContext;
  -[NSXPCSaveRequestContext dealloc](&v3, sel_dealloc);
}

- (id)managedObjectContext
{
  return self->_context;
}

- (void)_updateRollbackCacheForObjectWithID:(void *)a3 relationship:(void *)a4 withValuesFrom:
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  int v18;
  Class *v19;
  void *v20;
  _QWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "objectForKey:", a2);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(a4, "count");
    v9 = v8;
    v21[1] = v21;
    if (v8 <= 1)
      v10 = 1;
    else
      v10 = v8;
    if (v8 >= 0x201)
      v11 = 1;
    else
      v11 = v10;
    v12 = (char *)v21 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200)
      v12 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v21 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    v22 = 0u;
    v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(a4);
          *(_QWORD *)&v12[8 * v15 + 8 * i] = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectID");
        }
        v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v15 += i;
      }
      while (v14);
    }
    v18 = objc_msgSend(a3, "isOrdered");
    v19 = (Class *)0x1E0C99E40;
    if (!v18)
      v19 = (Class *)0x1E0C99E60;
    v20 = (void *)objc_msgSend(objc_alloc(*v19), "initWithObjects:count:", v12, v9);
    -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:]((_QWORD *)v7, v20, a3, *(double *)(v7 + 32));

    if (v9 >= 0x201)
      NSZoneFree(0, v12);
  }
}

- (void)_encodeObjectsForSave:(char)a3 forDelete:
{
  double v4;
  double v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSIncrementalStoreNode *v10;
  void *v11;
  unint64_t *v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSIncrementalStoreNode *v30;
  NSXPCRow *v31;
  void *v32;
  _QWORD *v33;
  const void *v34;
  os_unfair_lock_s *v35;
  unsigned int v36;
  _QWORD *v37;
  unint64_t v38;
  uint64_t v39;
  _NSNoChangeToken *v40;
  uint64_t v41;
  id *v42;
  id v43;
  void *v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  id *v51;
  id v52;
  void *v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  id *v60;
  id v61;
  void *v62;
  void *v63;
  os_unfair_lock_s *v64;
  void *v65;
  void *v66;
  void *v67;
  id obj;
  uint64_t v70;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  NSIncrementalStoreNode *v77;
  _WORD *v78;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v72 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceReferenceDate");
  v5 = v4;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = a2;
  v73 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
  if (v73)
  {
    v70 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v73; ++i)
      {
        if (*(_QWORD *)v81 != v70)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "objectID");
        v76 = i;
        if ((a3 & 1) == 0)
        {
          v9 = v8;
          v10 = [NSIncrementalStoreNode alloc];
          v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (unint64_t *)objc_msgSend(v7, "entity");
          v13 = v12;
          v77 = v10;
          if (v12)
            v14 = (_QWORD *)v12[14];
          else
            v14 = 0;
          v15 = objc_msgSend((id)objc_msgSend(v12, "propertiesByName"), "values");
          v20 = _kvcPropertysPrimitiveGetters(v13);
          v21 = v14[7] + v14[6];
          if (v21)
          {
            for (j = 0; j != v21; ++j)
            {
              v23 = *(void **)(v15 + 8 * j);
              _PF_Handler_Primitive_GetProperty((id **)v7, j, 0, *(_QWORD *)(v20 + 8 * j), v16, v17, v18, v19);
              if (v24)
                objc_msgSend(v11, "setValue:forKey:", v24, objc_msgSend(v23, "name"));
            }
          }
          v26 = v14[12];
          v25 = v14[13];
          if (v26 < v25 + v26)
          {
            do
            {
              v27 = *(void **)(v15 + 8 * v26);
              _PF_Handler_Primitive_GetProperty((id **)v7, v26, 0, *(_QWORD *)(v20 + 8 * v26), v16, v17, v18, v19);
              if (v28)
                v29 = objc_msgSend(v28, "objectID");
              else
                v29 = NSKeyValueCoding_NullValue;
              objc_msgSend(v11, "setValue:forKey:", v29, objc_msgSend(v27, "name"));
              ++v26;
              --v25;
            }
            while (v25);
          }
          v30 = -[NSIncrementalStoreNode initWithObjectID:withValues:version:](v77, "initWithObjectID:withValues:version:", v9, v11, objc_msgSend(v7, "_versionReference") + 1);
          v31 = -[NSXPCRow initWithNode:]([NSXPCRow alloc], "initWithNode:", v30);

          if (v31)
            v31->super._birth = v5;
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v31, -[NSXPCRow objectID](v31, "objectID"));

          i = v76;
        }
        if (v7)
        {
          v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v33 = (_QWORD *)objc_msgSend(v7, "entity");
          v34 = (const void *)objc_msgSend(v7, "objectID");
          objc_msgSend(v32, "addObject:", v34);
          v78 = -[_NSQueryGenerationToken _generationalComponentForStore:](objc_msgSend((id)objc_msgSend(v7, "managedObjectContext"), "_queryGenerationToken"), *(id *)(a1 + 8));
          v35 = -[NSXPCStore _cachedRowForObjectWithID:generation:](*(os_unfair_lock_s **)(a1 + 8), v34, v78);
          v36 = objc_msgSend(v7, "_versionReference");
          objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v36));
          if (v33)
            v37 = (_QWORD *)v33[14];
          else
            v37 = 0;
          v74 = objc_msgSend((id)objc_msgSend(v33, "propertiesByName"), "values");
          v75 = v37;
          v38 = v37[6];
          v39 = v37[7];
          v40 = objc_alloc_init(_NSNoChangeToken);
          objc_msgSend(v32, "addObject:", v40);
          v41 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          if (v38 < v39 + v38)
          {
            v42 = (id *)(v74 + 8 * v38);
            do
            {
              v43 = *v42;
              v44 = (void *)objc_msgSend(v7, "primitiveValueForKey:", objc_msgSend(*v42, "name"));
              v45 = -[os_unfair_lock_s valueForPropertyDescription:](v35, "valueForPropertyDescription:", v43);
              if (v35
                && (!v44 ? (v46 = v41 == v45) : (v46 = 0), v46 || objc_msgSend(v44, "isEqual:", v45)))
              {
                v47 = v32;
                v48 = v40;
              }
              else
              {
                v47 = v32;
                if (v44)
                  v48 = v44;
                else
                  v48 = (void *)v41;
              }
              objc_msgSend(v47, "addObject:", v48);
              ++v42;
              --v39;
            }
            while (v39);
          }
          v49 = v75[12];
          v50 = v75[13];
          if (v49 < v50 + v49)
          {
            v51 = (id *)(v74 + 8 * v49);
            do
            {
              v52 = *v51;
              v53 = (void *)objc_msgSend((id)objc_msgSend(v7, "primitiveValueForKey:", objc_msgSend(*v51, "name")), "objectID");
              v54 = -[os_unfair_lock_s valueForPropertyDescription:](v35, "valueForPropertyDescription:", v52);
              if (v35
                && (!v53 ? (v55 = v41 == v54) : (v55 = 0), v55 || objc_msgSend(v53, "isEqual:", v54)))
              {
                v56 = v32;
                v57 = v40;
              }
              else
              {
                v56 = v32;
                if (v53)
                  v57 = v53;
                else
                  v57 = (void *)v41;
              }
              objc_msgSend(v56, "addObject:", v57);
              ++v51;
              --v50;
            }
            while (v50);
          }
          v58 = v75[14];
          v59 = v75[15];
          if (v58 < v59 + v58)
          {
            v60 = (id *)(v74 + 8 * v58);
            do
            {
              v61 = *v60;
              v62 = (void *)objc_msgSend(v7, "primitiveValueForKey:", objc_msgSend(*v60, "name"));
              v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
              objc_msgSend(v32, "addObject:", v63);

              if (objc_msgSend(v62, "isFault"))
                goto LABEL_65;
              if (!v62)
                v62 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
              v64 = -[NSXPCStore _cachedRowForRelationship:onObjectWithID:generation:](*(os_unfair_lock_s **)(a1 + 8), v61, v34, v78);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (-[os_unfair_lock_s count](v64, "count"))
                  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Array with content where there should be a set."), 0));
                v64 = (os_unfair_lock_s *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v64);
              }
              if (!v64)
                v64 = (os_unfair_lock_s *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
              if (-[os_unfair_lock_s isEqual:](v64, "isEqual:", v62))
              {
LABEL_65:
                objc_msgSend(v63, "addObject:", v40);
              }
              else
              {
                -[NSXPCSaveRequestContext _updateRollbackCacheForObjectWithID:relationship:withValuesFrom:](*(void **)(a1 + 40), (uint64_t)v34, v61, v62);
                v65 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v62);
                v66 = (void *)objc_msgSend(v65, "mutableCopy");
                objc_msgSend(v66, "minusSet:", v64);
                v67 = (void *)-[os_unfair_lock_s mutableCopy](v64, "mutableCopy");
                objc_msgSend(v67, "minusSet:", v65);

                objc_msgSend(v63, "addObject:", objc_msgSend(v66, "allObjects"));
                objc_msgSend(v63, "addObject:", objc_msgSend(v67, "allObjects"));

              }
              ++v60;
              --v59;
            }
            while (v59);
          }

          i = v76;
        }
        else
        {
          v32 = 0;
        }
        objc_msgSend(v72, "addObject:", v32);
      }
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    }
    while (v73);
  }
  return v72;
}

- (id)newEncodedSaveRequest
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  if (result)
  {
    v1 = (uint64_t)result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = v2;
    v4 = *(_QWORD *)(v1 + 24);
    if (v4)
      objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("NSMetadata"));
    v5 = (void *)objc_msgSend(*(id *)(v1 + 16), "insertedObjects");
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v5, 0), CFSTR("inserted"));
    v6 = (void *)objc_msgSend(*(id *)(v1 + 16), "deletedObjects");
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v6, 1), CFSTR("deleted"));
    v7 = (void *)objc_msgSend(*(id *)(v1 + 16), "updatedObjects");
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v7, 0), CFSTR("updated"));
    v8 = (void *)objc_msgSend(*(id *)(v1 + 16), "lockedObjects");
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v3, "setObject:forKey:", -[NSXPCSaveRequestContext _encodeObjectsForSave:forDelete:](v1, v8, 0), CFSTR("locked"));
    if (*(_BYTE *)(v1 + 56))
    {
      v9 = (id)objc_msgSend(v3, "objectForKey:", CFSTR("inserted"));
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("inserted"));
      v10 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("updated"));
      if (v10)
        objc_msgSend(v10, "addObjectsFromArray:", v9);
      else
        objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("updated"));

    }
    return +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v3);
  }
  return result;
}

@end
