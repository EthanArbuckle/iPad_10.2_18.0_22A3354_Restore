@implementation PFUbiquityPeerRangeReservationContext

- (PFUbiquityPeerRangeReservationContext)init
{
  PFUbiquityPeerRangeReservationContext *v2;
  PFUbiquityPeerRangeReservationContext *v3;
  NSMutableDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityPeerRangeReservationContext;
  v2 = -[PFUbiquityPeerRangeReservationContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_moc = 0;
    v2->_store = 0;
    v2->_psc = 0;
    v2->_peerEntityNameRangeStartSet = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_globalIDToLocalURI = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_unresolvedGlobalObjectIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_globalObjectIDs = 0;
    v3->_numRangesToReserve = 0;
    v3->_storeNameToFetchedMetadata = v4;
  }
  return v3;
}

- (PFUbiquityPeerRangeReservationContext)initWithPersistentStore:(id)a3 andGlobalObjectIDs:(id)a4
{
  PFUbiquityPeerRangeReservationContext *v6;
  NSManagedObjectContext *moc;

  v6 = -[PFUbiquityPeerRangeReservationContext init](self, "init");
  if (v6)
  {
    v6->_store = (NSPersistentStore *)a3;
    v6->_psc = (NSPersistentStoreCoordinator *)(id)objc_msgSend(a3, "persistentStoreCoordinator");
    moc = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
    v6->_moc = moc;
    if (v6->_psc)
    {
      -[NSManagedObjectContext setPersistentStoreCoordinator:](moc, "setPersistentStoreCoordinator:");
      moc = v6->_moc;
    }
    -[NSManagedObjectContext setUndoManager:](moc, "setUndoManager:", 0);
    v6->_globalObjectIDs = (NSArray *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_store = 0;
  self->_psc = 0;

  self->_moc = 0;
  self->_peerEntityNameRangeStartSet = 0;

  self->_globalIDToLocalURI = 0;
  self->_unresolvedGlobalObjectIDs = 0;

  self->_storeNameToFetchedMetadata = 0;
  self->_globalObjectIDs = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerRangeReservationContext;
  -[PFUbiquityPeerRangeReservationContext dealloc](&v3, sel_dealloc);
}

- (uint64_t)createNewPeerRangesWithCache:(_QWORD *)a3 Error:
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PFUbiquitySQLCorePeerRange *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v47;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id obj;
  id obja;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[6];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[8];
  __int128 v78;
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
  uint64_t v90;
  _BYTE v91[128];
  uint8_t v92[128];
  _BYTE buf[24];
  void (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  uint64_t v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v90 = 0;
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = *(id *)(a1 + 8);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    if (v4)
    {
      v61 = *(_QWORD *)v87;
      do
      {
        v5 = 0;
        v63 = v4;
        do
        {
          if (*(_QWORD *)v87 != v61)
            objc_enumerationMutation(obj);
          v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v5));
          v66 = v5;
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
          if (v7)
          {
            v8 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v7; ++i)
              {
                if (*(_QWORD *)v83 != v8)
                  objc_enumerationMutation(v6);
                v10 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
                v11 = (void *)objc_msgSend(v6, "objectForKey:", v10);
                v12 = (id)objc_msgSend(v3, "objectForKey:", v10);
                if (!v12)
                  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
                v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(v12, "integerValue") + (objc_msgSend(v11, "count") << 10));

                objc_msgSend(v3, "setObject:forKey:", v13, v10);
              }
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
            }
            while (v7);
          }
          v5 = v66 + 1;
        }
        while (v66 + 1 != v63);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
      }
      while (v4);
    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v52 = v14;
    v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v79 != v17)
            objc_enumerationMutation(v3);
          v19 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
          objc_msgSend(v15, "addObject:", objc_msgSend(v3, "objectForKey:", v19));
          objc_msgSend(v14, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "managedObjectModel"), "entitiesByName"), "objectForKey:", v19));
        }
        v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
      }
      while (v16);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v94 = __Block_byref_object_copy__68;
    v95 = __Block_byref_object_dispose__68;
    v96 = 0;
    v20 = *(void **)(a1 + 48);
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke;
    v77[3] = &unk_1E1EDD4D0;
    v77[4] = a1;
    v77[5] = v14;
    v77[6] = v15;
    v77[7] = buf;
    objc_msgSend(v20, "performBlockAndWait:", v77);
    v21 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
    if (v21)
    {
      v47 = v21;
      v22 = 0;
      LOBYTE(v23) = 1;
      v50 = v15;
      do
      {
        v64 = (void *)objc_msgSend(v14, "objectAtIndex:", v22);
        v24 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectAtIndex:", v22);
        v25 = objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", v22), "integerValue");
        v57 = objc_msgSend(v24, "integerValue");
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v49 = *(id *)(a1 + 8);
        v26 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
        if (v26)
        {
          v53 = *(_QWORD *)v74;
          v51 = v22;
          do
          {
            v27 = 0;
            v54 = v26;
            do
            {
              if (*(_QWORD *)v74 != v53)
                objc_enumerationMutation(v49);
              v62 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v27);
              v28 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:"), "objectForKey:", objc_msgSend(v64, "name"));
              v71 = 0u;
              v72 = 0u;
              v69 = 0u;
              v70 = 0u;
              v67 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
              if (v67)
              {
                v55 = v27;
                v56 = v28;
                obja = *(id *)v70;
                do
                {
                  v29 = 0;
                  v30 = -v25;
                  do
                  {
                    if (*(id *)v70 != obja)
                      objc_enumerationMutation(v56);
                    v31 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v29);
                    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v57 + v30 + 1);
                    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v57 + v30 + 1024);
                    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(v31, "integerValue") + 1023);
                    v35 = -[PFUbiquitySQLCorePeerRange initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:]([PFUbiquitySQLCorePeerRange alloc], "initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:", v62, objc_msgSend(v64, "name"), v32, v33, v31, v34);
                    v23 = -[PFUbiquityPeerRangeCache cacheSQLCorePeerRange:error:](a2, v35);
                    if (v23)
                    {
                      v36 = *(void **)(a1 + 48);
                      v68[0] = MEMORY[0x1E0C809B0];
                      v68[1] = 3221225472;
                      v68[2] = __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke_2;
                      v68[3] = &unk_1E1EDD430;
                      v68[4] = a1;
                      v68[5] = v35;
                      objc_msgSend(v36, "performBlockAndWait:", v68);
                      --*(_QWORD *)(a1 + 72);
                    }

                    ++v29;
                    v30 += 1024;
                  }
                  while (v67 != v29);
                  v25 = -v30;
                  v67 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
                }
                while (v67);
                v25 = -v30;
                v22 = v51;
                v14 = v52;
                v15 = v50;
                v27 = v55;
              }
              ++v27;
            }
            while (v27 != v54);
            v26 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
          }
          while (v26);
        }
        ++v22;
      }
      while (v22 != v47);
    }
    else
    {
      LOBYTE(v23) = 1;
    }

    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
    _Block_object_dispose(buf, 8);
    if (v23)
    {
      v37 = 1;
LABEL_56:

      return v37;
    }
    if (v90)
    {
      if (a3)
      {
        v37 = 0;
        *a3 = v90;
        goto LABEL_56;
      }
    }
    else
    {
      v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityPeerRangeReservationContext.m");
      v45 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFU"
                             "biquityPeerRangeReservationContext.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 200;
        _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v37 = 0;
    goto LABEL_56;
  }
  return 0;
}

id __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke(uint64_t a1)
{
  id result;

  result = -[NSSQLCore _newReservedKeysForEntities:counts:](*(void **)(*(_QWORD *)(a1 + 32) + 40), *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

void __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke_2(uint64_t a1)
{
  -[NSSQLCore addPeerRange:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 40));
}

- (uint64_t)prepareForRangeReservationWithRangeStart:(uint64_t)a3 andGlobalID:(uint64_t)a4 andEntityName:
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    objc_msgSend(*(id *)(result + 24), "addObject:");
    if (a3)
      v8 = *(_QWORD *)(a3 + 32);
    else
      v8 = 0;
    v9 = (id)objc_msgSend(*(id *)(v7 + 8), "valueForKey:", v8);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (a3)
        v10 = *(_QWORD *)(a3 + 32);
      else
        v10 = 0;
      objc_msgSend(*(id *)(v7 + 8), "setValue:forKey:", v9, v10);

    }
    v11 = (id)objc_msgSend(v9, "valueForKey:", a4);
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v9, "setValue:forKey:", v11, a4);

    }
    v12 = objc_msgSend(a2, "integerValue");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
LABEL_12:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v11);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "integerValue");
        if (v12 > result && v12 < result + 1023)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v14)
            goto LABEL_12;
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      result = objc_msgSend(v11, "containsObject:", a2);
      if ((result & 1) == 0)
      {
        result = objc_msgSend(v11, "addObject:", a2);
        ++*(_QWORD *)(v7 + 72);
      }
    }
  }
  return result;
}

- (uint64_t)createLocalIDStringForStoreUUID:(uint64_t)a3 entityName:(uint64_t)a4 andPrimaryKeyString:
{
  if (result)
    return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("x-coredata://%@/%@/%@"), a2, a3, a4);
  return result;
}

@end
