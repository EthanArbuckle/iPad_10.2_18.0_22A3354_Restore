@implementation PFUbiquityPeerRangeCache

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
    _rangeReservationLock = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB38E0]);
}

- (PFUbiquityPeerRangeCache)initWithPrivateStore:(id)a3 storeName:(id)a4 andLocalPeerID:(id)a5
{
  PFUbiquityPeerRangeCache *v8;

  v8 = -[PFUbiquityPeerRangeCache init](self, "init");
  if (v8)
  {
    v8->_cachedRanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_allEntityRanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_storeName = (NSString *)a4;
    v8->_localPeerID = (NSString *)a5;
    v8->_translatedGlobalIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_cachedStorePeerRanges = 0;
    v8->_privateStore = (NSPersistentStore *)a3;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_privateStore = 0;
  self->_cachedRanges = 0;

  self->_allEntityRanges = 0;
  self->_translatedGlobalIDs = 0;

  self->_storeName = 0;
  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerRangeCache;
  -[PFUbiquityPeerRangeCache dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerRangeCache;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\tlocalPeerID: %@\n\tstoreName: %@\n"), -[PFUbiquityPeerRangeCache description](&v3, sel_description), self->_storeName, self->_localPeerID);
}

- (uint64_t)cachePeerRanges:(uint64_t)a1
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 56))
    return 1;
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator");
  v4 = v3;
  if (v3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3052000000;
    v19 = __Block_byref_object_copy__67;
    v20 = __Block_byref_object_dispose__67;
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__PFUbiquityPeerRangeCache_cachePeerRanges___block_invoke;
    v15[3] = &unk_1E1EDD618;
    v15[4] = a1;
    v15[5] = &v16;
    objc_msgSend(v3, "performBlockAndWait:", v15);
    v5 = (id)v17[5];
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)v17[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if (!-[PFUbiquityPeerRangeCache cacheSQLCorePeerRange:error:](a1, *(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * i)))
          {
            v2 = 0;
            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
    v2 = 1;
LABEL_15:
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v2 = 1;
  }

  *(_BYTE *)(a1 + 56) = 1;
  return v2;
}

id __44__PFUbiquityPeerRangeCache_cachePeerRanges___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLCore allPeerRanges](*(void **)(*(_QWORD *)(a1 + 32) + 48));
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

- (BOOL)cacheSQLCorePeerRange:(uint64_t)a1 error:(_QWORD *)a2
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  if (a1)
  {
    if (a2)
      v4 = a2[1];
    else
      v4 = 0;
    v5 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v4);
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (a2)
        v6 = a2[1];
      else
        v6 = 0;
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v5, v6);

    }
    if (a2)
      v7 = a2[2];
    else
      v7 = 0;
    v8 = (id)objc_msgSend(v5, "objectForKey:", v7);
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (a2)
        v9 = a2[2];
      else
        v9 = 0;
      objc_msgSend(v5, "setObject:forKey:", v8, v9);

    }
    if (a2)
      v10 = a2[5];
    else
      v10 = 0;
    objc_msgSend(v8, "setObject:forKey:", a2, v10);
    if (a2)
      v11 = a2[2];
    else
      v11 = 0;
    v12 = (id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v11);
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a2)
        v13 = a2[2];
      else
        v13 = 0;
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v12, v13);

    }
    objc_msgSend(v12, "addObject:", a2);
  }
  return a1 != 0;
}

- (uint64_t)refreshPeerRangeCache:(uint64_t)result
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 56) = 0;

    *(_QWORD *)(v1 + 8) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(v1 + 16) = objc_alloc_init(MEMORY[0x1E0C99E08]);

    *(_QWORD *)(v1 + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    return -[PFUbiquityPeerRangeCache cachePeerRanges:](v1);
  }
  return result;
}

- (uint64_t)createGlobalObjectIDForManagedObjectID:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  PFUbiquityGlobalObjectID *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  if (!result)
    return result;
  v2 = a2;
  v3 = result;
  v4 = objc_msgSend(a2, "entity");
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
  v7 = objc_msgSend((id)objc_msgSend(v2, "entity"), "name");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v2, "_referenceData64"));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = (void *)MEMORY[0x1E0C99D80];
    if (!v2)
      v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, CFSTR("Couldn't parse numeric primary key out of the provided object ID."), objc_msgSend(v19, "dictionaryWithObject:forKey:", v2, CFSTR("objectID"))));
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", objc_msgSend(*(id *)(v3 + 16), "objectForKey:", v6), 0);
  if (!objc_msgSend(v11, "count"))
    goto LABEL_14;
  objc_msgSend(v11, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rangeStart <= %@ AND %@ <= rangeEnd"), v10, v10));
  if (objc_msgSend(v11, "count") != 1)
  {
    if ((unint64_t)objc_msgSend(v11, "count") >= 2
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nFound multiple ranges for entity: %@ and local primary key: %@"), "-[PFUbiquityPeerRangeCache cachedRangeForLocalPrimaryKey:ofEntityNamed:]", 255, v3, v6, v10);
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v12 = objc_msgSend(v11, "objectAtIndex:", 0);
LABEL_15:

  if (v12)
  {
    v13 = objc_msgSend(*(id *)(v12 + 40), "unsignedIntegerValue");
    v9 = v13 + v9 - objc_msgSend(*(id *)(v12 + 24), "unsignedIntegerValue");
    v14 = [PFUbiquityGlobalObjectID alloc];
    v15 = *(_QWORD *)(v3 + 40);
    v16 = *(_QWORD *)(v12 + 8);
  }
  else
  {
    v14 = [PFUbiquityGlobalObjectID alloc];
    v16 = *(_QWORD *)(v3 + 32);
    v15 = *(_QWORD *)(v3 + 40);
  }
  return (uint64_t)-[PFUbiquityGlobalObjectID initWithStoreName:entityName:primaryKeyInteger:andPeerID:](v14, "initWithStoreName:entityName:primaryKeyInteger:andPeerID:", v15, v7, v9, v16);
}

- (uint64_t)createMapOfManagedObjectIDsForGlobalIDs:(uint64_t)a3 count:(_QWORD *)a4 error:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  if (!a1)
    return 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__67;
  v24 = __Block_byref_object_dispose__67;
  v25 = 0;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__67;
  v18 = __Block_byref_object_dispose__67;
  v19 = 0;
  v8 = (id)objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator");
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__PFUbiquityPeerRangeCache_createMapOfManagedObjectIDsForGlobalIDs_count_error___block_invoke;
    v13[3] = &unk_1E1EDF960;
    v13[4] = a1;
    v13[5] = a2;
    v13[6] = v8;
    v13[7] = &v20;
    v13[8] = &v14;
    v13[9] = a3;
    objc_msgSend(v8, "performBlockAndWait:", v13);
    v9 = (id)v15[5];
    if (a4)
    {
      v10 = v15[5];
      if (v10)
        *a4 = v10;
    }
    v11 = v21[5];
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

void __80__PFUbiquityPeerRangeCache_createMapOfManagedObjectIDsForGlobalIDs_count_error___block_invoke(uint64_t a1)
{
  PFUbiquityPeerRangeReservationContext *v1;
  id v2;
  NSArray *globalObjectIDs;
  void *v4;
  uint64_t v5;
  uint64_t i;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  const __CFString *v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v45 = *(_QWORD *)(a1 + 72);
  objc_msgSend((id)_rangeReservationLock, "lock");
  v1 = -[PFUbiquityPeerRangeReservationContext initWithPersistentStore:andGlobalObjectIDs:]([PFUbiquityPeerRangeReservationContext alloc], "initWithPersistentStore:andGlobalObjectIDs:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40));
  v51 = (uint64_t)v1;
  v46 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "identifier");
  v47 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "managedObjectModel"), "entitiesByName");
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v1)
    globalObjectIDs = v1->_globalObjectIDs;
  else
    globalObjectIDs = 0;
  v4 = (void *)objc_msgSend(v2, "initWithArray:", globalObjectIDs);
  objc_msgSend(v4, "sortUsingComparator:", globalObjectIDComparator);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v5)
  {
    v49 = *(_QWORD *)v54;
    do
    {
      v50 = v5;
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v54 != v49)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v7);
        if (v8)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", v8, v7);
        }
        else
        {
          if (v7)
            v9 = v7[2];
          else
            v9 = 0;
          v10 = objc_msgSend(v47, "objectForKey:", v9);
          v11 = v10;
          if (v10)
          {
            if ((*(_BYTE *)(v10 + 120) & 4) != 0)
            {
              v12 = *(void **)(v10 + 72);
            }
            else
            {
              do
              {
                v12 = (void *)v10;
                v10 = objc_msgSend((id)v10, "superentity");
              }
              while (v10);
            }
          }
          else
          {
            v12 = 0;
          }
          v13 = objc_msgSend(v12, "name");
          if (v7)
            v14 = (void *)v7[3];
          else
            v14 = 0;
          v15 = +[PFUbiquityPeerRangeCache integerFromPrimaryKeyString:]((uint64_t)PFUbiquityPeerRangeCache, v14);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v15);
          objc_opt_self();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v15 & 0xFFFFFFFFFFFFFC00);
          if (v7)
            v18 = v7[4];
          else
            v18 = 0;
          v19 = *(_QWORD *)(a1 + 32);
          if (v19)
          {
            v20 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v19 + 8), "objectForKey:", v18), "objectForKey:", v13);
            objc_opt_self();
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v15 & 0xFFFFFFFFFFFFFC00);
            v22 = objc_msgSend(v20, "objectForKey:", v21);

            if (v22
              || ((v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", objc_msgSend(v20, "allValues"), 0), v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v15), objc_msgSend(v23, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("peerStart <= %@ AND peerEnd >= %@"), v24, v24)), !objc_msgSend(v23, "count"))|| objc_msgSend(v23, "count") != 1? (v22 = 0): (v22 = objc_msgSend(v23, "objectAtIndex:", 0)), v23,
                  v24,
                  v22))
            {
              v25 = objc_msgSend(*(id *)(v22 + 40), "unsignedIntValue");
              v26 = v15 - v25 + objc_msgSend(*(id *)(v22 + 24), "unsignedIntValue");
            }
            else
            {
              v26 = 0x7FFFFFFFFFFFFFFFLL;
            }
          }
          else
          {
            v26 = 0;
          }
          if (v7)
            v27 = (void *)v7[4];
          else
            v27 = 0;
          if (objc_msgSend(v27, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
          {
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v13), 0);
            objc_msgSend(v28, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rangeStart <= %@ AND rangeEnd >= %@"), v16, v16));
            if (objc_msgSend(v28, "count"))
            {
              if (v26 == 0x7FFFFFFFFFFFFFFFLL)
              {
                -[PFUbiquityPeerRangeReservationContext prepareForRangeReservationWithRangeStart:andGlobalID:andEntityName:](v51, v16, (uint64_t)v7, v13);
                v29 = 0;
                v26 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else
              {
                v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("p%ld"), v26);
                if (v7)
                  v35 = v7[2];
                else
                  v35 = 0;
                v29 = (void *)-[PFUbiquityPeerRangeReservationContext createLocalIDStringForStoreUUID:entityName:andPrimaryKeyString:](v51, v46, v35, (uint64_t)v34);

              }
            }
            else
            {
              if (v7)
              {
                v32 = v7[2];
                v33 = v7[3];
              }
              else
              {
                v32 = 0;
                v33 = 0;
              }
              v29 = (void *)-[PFUbiquityPeerRangeReservationContext createLocalIDStringForStoreUUID:entityName:andPrimaryKeyString:](v51, v46, v32, v33);
              v26 = v15;
            }

          }
          else if (v26 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[PFUbiquityPeerRangeReservationContext prepareForRangeReservationWithRangeStart:andGlobalID:andEntityName:](v51, v17, (uint64_t)v7, v13);
            v29 = 0;
            v26 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("p%ld"), v26);
            if (v7)
              v31 = v7[2];
            else
              v31 = 0;
            v29 = (void *)-[PFUbiquityPeerRangeReservationContext createLocalIDStringForStoreUUID:entityName:andPrimaryKeyString:](v51, v46, v31, (uint64_t)v30);

          }
          if (v29)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v29, v7);
            v37 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "_newObjectIDForEntity:referenceData64:", v11, v26);
            if (v7)
              objc_setProperty_nonatomic(v7, v36, v37, 48);

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", v29, v7);
          }

        }
        v1 = (PFUbiquityPeerRangeReservationContext *)v51;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v5);
  }
  if (v1 && v1->_numRangesToReserve >= 1)
  {
    v38 = *(_QWORD *)(a1 + 32);
    if (v45 >= 5)
    {
      v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nUnable to resolve global object IDs: %@\n%@\n%@"), v38, v1->_globalObjectIDs, *(_QWORD *)(v38 + 8), *(_QWORD *)(v38 + 16));
      v43 = (void *)MEMORY[0x1E0C99DA0];
      v57 = CFSTR("PFUbiquitySetupCheckForFork");
      v58 = MEMORY[0x1E0C9AAB0];
      v44 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      objc_exception_throw((id)objc_msgSend(v43, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v42, v44));
    }
    if (-[PFUbiquityPeerRangeReservationContext createNewPeerRangesWithCache:Error:]((uint64_t)v1, v38, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)))
    {
      v39 = (void *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v45 + 1, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v39)
      {
        objc_msgSend(v40, "addEntriesFromDictionary:", v39);
      }
      else
      {

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
      }

    }
    else
    {

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
    }
  }
  v41 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);

  objc_msgSend((id)_rangeReservationLock, "unlock");
}

+ (uint64_t)integerFromPrimaryKeyString:(uint64_t)a1
{
  objc_opt_self();
  if (objc_msgSend(a2, "characterAtIndex:", 0) == 112)
    return objc_msgSend((id)objc_msgSend(a2, "substringFromIndex:", 1), "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

@end
