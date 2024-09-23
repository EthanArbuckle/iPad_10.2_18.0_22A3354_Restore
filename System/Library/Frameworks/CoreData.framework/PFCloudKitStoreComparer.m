@implementation PFCloudKitStoreComparer

- (PFCloudKitStoreComparer)initWithStore:(id)a3 otherStore:(id)a4
{
  PFCloudKitStoreComparer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitStoreComparer;
  v6 = -[PFCloudKitStoreComparer init](&v8, sel_init);
  if (v6)
  {
    v6->_cache = -[PFCloudKitStoreComparisonCache initWithStore:otherStore:]([PFCloudKitStoreComparisonCache alloc], "initWithStore:otherStore:", a3, a4);
    v6->_archivingUtilities = objc_alloc_init(PFCloudKitArchivingUtilities);
    v6->_onlyCompareSharedZones = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreComparer;
  -[PFCloudKitStoreComparer dealloc](&v3, sel_dealloc);
}

- (BOOL)ensureContentsMatch:(id *)a3
{
  return -[PFCloudKitStoreComparer ensureContentsOfStore:matchContentsOfStore:error:](self, "ensureContentsOfStore:matchContentsOfStore:error:", -[PFCloudKitStoreComparisonCache store](self->_cache, "store"), -[PFCloudKitStoreComparisonCache otherStore](self->_cache, "otherStore"), a3);
}

- (BOOL)ensureContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 error:(id *)a5
{
  _BOOL4 v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v31 = 0;
  if ((objc_msgSend((id)objc_msgSend(a3, "URL"), "isEqual:", objc_msgSend(a4, "URL")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(a3, "isCloudKitEnabled") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey")), "BOOLValue");
  if ((objc_msgSend(a4, "isCloudKitEnabled") & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "options"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey")), "BOOLValue");
  if (v10 != v11)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB28A8];
    v36 = *MEMORY[0x1E0CB2D68];
    v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stores don't match because they do not have the same mirroring options:\n%@ - %@\n%@ - %@"), a3, objc_msgSend(a3, "options"), a4, objc_msgSend(a4, "options"));
    v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v26 = v23;
    v27 = v24;
    goto LABEL_19;
  }
  v40[0] = a3;
  v40[1] = a4;
  if (!-[PFCloudKitStoreComparer ensureStoresAgreeOnCloudKitTables:error:](self, "ensureStoresAgreeOnCloudKitTables:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2), &v31)|| !-[PFCloudKitStoreComparer compareContentOfStore:toStore:error:](self, "compareContentOfStore:toStore:error:", a3, a4, &v31))
  {
LABEL_15:
    v14 = v31;
    if (!v31)
    {
LABEL_16:
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v22 = __pflogFaultLog;
      v9 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v9)
        return v9;
      *(_DWORD *)buf = 136315394;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
      v34 = 1024;
      v35 = 123;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_22;
    }
LABEL_20:
    if (a5)
    {
      LOBYTE(v9) = 0;
      *a5 = v14;
      return v9;
    }
LABEL_22:
    LOBYTE(v9) = 0;
    return v9;
  }
  v12 = objc_msgSend(a3, "mirroringDelegate");
  v13 = objc_msgSend(a4, "mirroringDelegate");
  if (!v12 || !v13)
  {
    if (!(v12 | v13))
      goto LABEL_2;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB28A8];
    v38 = *MEMORY[0x1E0CB2D68];
    v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stores don't match because they do not have the same mirroring configuration:\n%@ - %@\n%@ - %@"), a3, v12, a4, v13);
    v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v26 = v28;
    v27 = v29;
LABEL_19:
    v14 = (void *)objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 134060, v25);
    v31 = v14;
    if (!v14)
      goto LABEL_16;
    goto LABEL_20;
  }
  if (!-[PFCloudKitStoreComparer compareCloudKitMetadataOfStore:toStore:error:](self, "compareCloudKitMetadataOfStore:toStore:error:", a3, a4, &v31))goto LABEL_15;
LABEL_2:
  LOBYTE(v9) = 1;
  return v9;
}

- (id)getObjectMatchingRecordID:(id)a3 fromStore:(id)a4 withManagedObjectContext:(id)a5
{
  void *v5;
  _QWORD v7[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__52;
  v12 = __Block_byref_object_dispose__52;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__PFCloudKitStoreComparer_getObjectMatchingRecordID_fromStore_withManagedObjectContext___block_invoke;
  v7[3] = &unk_1E1EDE460;
  v7[4] = self;
  v7[5] = a3;
  v7[7] = a5;
  v7[8] = &v8;
  v7[6] = a4;
  objc_msgSend(a5, "performBlockAndWait:", v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __88__PFCloudKitStoreComparer_getObjectMatchingRecordID_fromStore_withManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectIDForRecordID:inStore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 56), "objectWithID:", v2);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "entity"), "attributesByName"), "objectForKey:", CFSTR("ckRecordID")))
    {
      v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "valueForKey:", CFSTR("ckRecordID"));
      if (objc_msgSend(v3, "length"))
      {
        v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectIDForIdentifier:inStore:", v3, *(_QWORD *)(a1 + 48));
        if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "recordName"), "isEqualToString:", v3) & 1) != 0)
        {
          if ((objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectID"), "isEqual:", v4) & 1) == 0)
          {
            v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Record name appears to point to two different objects: %@ / %@");
            v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectID");
            _NSCoreDataLog(17, v5, v7, v8, v9, v10, v11, v12, v6);
            v13 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectID");
              *(_DWORD *)buf = 138412546;
              v28 = v14;
              v29 = 2112;
              v30 = v4;
              v15 = "CoreData: Record name appears to point to two different objects: %@ / %@";
              v16 = v13;
LABEL_11:
              _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, v15, buf, 0x16u);
            }
          }
        }
        else
        {
          v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Record name does not match recordID, even though our metadata linked this row with '%@': %@");
          _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, *(_QWORD *)(a1 + 40));
          v24 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v25 = *(_QWORD *)(a1 + 40);
            v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            *(_DWORD *)buf = 138412546;
            v28 = v25;
            v29 = 2112;
            v30 = v26;
            v15 = "CoreData: Record name does not match recordID, even though our metadata linked this row with '%@': %@";
            v16 = v24;
            goto LABEL_11;
          }
        }
      }
    }
  }
}

- (BOOL)compareContentOfStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  _BOOL4 v9;
  PFCloudKitStoreComparisonCache *cache;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v52 = 0;
  if ((objc_msgSend((id)objc_msgSend(a3, "URL"), "isEqual:", objc_msgSend(a4, "URL")) & 1) != 0)
    goto LABEL_2;
  if (!-[PFCloudKitStoreComparisonCache populate:](self->_cache, "populate:", &v52)
    || !-[PFCloudKitStoreComparer compareDatabaseScopeAndIdentityInStore:toStore:error:](self, "compareDatabaseScopeAndIdentityInStore:toStore:error:", a3, a4, &v52)|| !-[PFCloudKitStoreComparer compareObjectsInStore:toStore:error:](self, "compareObjectsInStore:toStore:error:", a3, a4, &v52))
  {
    goto LABEL_24;
  }
  if (!-[PFCloudKitStoreComparisonCache checkCloudKitMetadata](self->_cache, "checkCloudKitMetadata"))
    goto LABEL_2;
  cache = self->_cache;
  if (!self->_onlyCompareSharedZones)
  {
    v19 = -[PFCloudKitStoreComparisonCache mtmKeysForStore:](cache, "mtmKeysForStore:", a3);
    v20 = -[PFCloudKitStoreComparisonCache mtmKeysForStore:](self->_cache, "mtmKeysForStore:", a4);
    if ((objc_msgSend(v19, "isEqualToSet:", v20) & 1) != 0)
      goto LABEL_2;
    v21 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v21, "minusSet:", v20);
    v22 = (void *)objc_msgSend(v20, "mutableCopy");
    objc_msgSend(v22, "minusSet:", v19);
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mirrored relationships don't match for stores:\nStore has these extra keys: %@\n%@\nOther Store has these extra keys: %@\n%@"), objc_msgSend(a3, "URL"), objc_msgSend((id)objc_msgSend(v21, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_), objc_msgSend(a4, "URL"), objc_msgSend((id)objc_msgSend(v22, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_));
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB28A8];
    v60 = *MEMORY[0x1E0CB2D68];
    v61[0] = v23;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = v61;
    v28 = &v60;
LABEL_23:
    v52 = (void *)objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 134060, objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1));

LABEL_24:
    if (v52)
    {
      if (a5)
      {
        LOBYTE(v9) = 0;
        *a5 = v52;
        return v9;
      }
    }
    else
    {
      v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v45 = __pflogFaultLog;
      v9 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v9)
        return v9;
      *(_DWORD *)buf = 136315394;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
      v55 = 1024;
      v56 = 228;
      _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v9) = 0;
    return v9;
  }
  v11 = -[PFCloudKitStoreComparisonCache sharedZoneIDsForStore:](cache, "sharedZoneIDsForStore:", a3);
  if (!objc_msgSend(v11, "isEqualToSet:", -[PFCloudKitStoreComparisonCache sharedZoneIDsForStore:](self->_cache, "sharedZoneIDsForStore:", a4)))
  {
    v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to handle skewed shares yet.");
    _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, v47);
    v36 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle skewed shares yet.", buf, 2u);
    }
    goto LABEL_2;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (!v12)
  {
LABEL_2:
    LOBYTE(v9) = 1;
    return v9;
  }
  v13 = v12;
  v14 = *(_QWORD *)v49;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v49 != v14)
        objc_enumerationMutation(v11);
      v16 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
      v17 = -[PFCloudKitStoreComparisonCache mtmKeysForRecordZone:inStore:](self->_cache, "mtmKeysForRecordZone:inStore:", v16, a3);
      v18 = -[PFCloudKitStoreComparisonCache mtmKeysForRecordZone:inStore:](self->_cache, "mtmKeysForRecordZone:inStore:", v16, a4);
      if ((objc_msgSend(v17, "isEqualToSet:", v18) & 1) == 0)
      {
        v21 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v21, "minusSet:", v18);
        v22 = (void *)objc_msgSend(v18, "mutableCopy");
        objc_msgSend(v22, "minusSet:", v17);
        v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mirrored relationships don't match for stores:\nStore has these extra keys: %@\n%@\nOther Store has these extra keys: %@\n%@"), objc_msgSend(a3, "URL"), objc_msgSend((id)objc_msgSend(v21, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_), objc_msgSend(a4, "URL"), objc_msgSend((id)objc_msgSend(v22, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_));
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB28A8];
        v57 = *MEMORY[0x1E0CB2D68];
        v58 = v37;
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v58;
        v28 = &v57;
        goto LABEL_23;
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    LOBYTE(v9) = 1;
    if (v13)
      continue;
    return v9;
  }
}

- (BOOL)compareDatabaseScopeAndIdentityInStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  uint64_t v9;
  int64_t v10;
  _BOOL4 v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x1E0C80C00];
  v9 = -[PFCloudKitStoreComparisonCache databaseScopeForStoreWithIdentifier:](self->_cache, "databaseScopeForStoreWithIdentifier:", objc_msgSend(a3, "identifier"));
  v10 = -[PFCloudKitStoreComparisonCache databaseScopeForStoreWithIdentifier:](self->_cache, "databaseScopeForStoreWithIdentifier:", objc_msgSend(a4, "identifier"));
  if (!self->_onlyCompareSharedZones && v9 != v10)
  {
    v16 = v10;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v41[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-scope"), objc_msgSend(a3, "identifier"));
    v42[0] = softLinkCKDatabaseScopeString(v9);
    v41[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-scope"), objc_msgSend(a4, "identifier"));
    v19 = softLinkCKDatabaseScopeString(v16);
    v41[2] = *MEMORY[0x1E0CB2D68];
    v42[1] = v19;
    v42[2] = CFSTR("CloudKit database scope doesn't match.");
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v42;
    v22 = v41;
    goto LABEL_11;
  }
  LOBYTE(v12) = 1;
  if (!self->_onlyCompareSharedZones && v9 != 1)
  {
    v13 = -[PFCloudKitStoreComparisonCache identityRecordNameForStoreWithIdentifier:](self->_cache, "identityRecordNameForStoreWithIdentifier:", objc_msgSend(a3, "identifier"));
    v14 = -[PFCloudKitStoreComparisonCache identityRecordNameForStoreWithIdentifier:](self->_cache, "identityRecordNameForStoreWithIdentifier:", objc_msgSend(a4, "identifier"));
    if (v13 != v14)
    {
      v15 = v14;
      if ((-[__CFString isEqualToString:](v13, "isEqualToString:", v14) & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB28A8];
        v39[0] = *MEMORY[0x1E0CB2D68];
        v40[0] = CFSTR("Store identity record names do not match.");
        v39[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-identity"), objc_msgSend(a3, "identifier"));
        if (v13)
          v32 = v13;
        else
          v32 = CFSTR("nil");
        v40[1] = v32;
        v39[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-identity"), objc_msgSend(a4, "identifier"));
        if (v15)
          v33 = v15;
        else
          v33 = CFSTR("nil");
        v40[2] = v33;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = v40;
        v22 = v39;
LABEL_11:
        v23 = (void *)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 134060, objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 3));
        if (v23)
        {
          if (a5)
          {
            LOBYTE(v12) = 0;
            *a5 = v23;
            return v12;
          }
        }
        else
        {
          v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
          v31 = __pflogFaultLog;
          v12 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
          if (!v12)
            return v12;
          *(_DWORD *)buf = 136315394;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
          v37 = 1024;
          v38 = 273;
          _os_log_fault_impl(&dword_18A253000, v31, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        LOBYTE(v12) = 0;
        return v12;
      }
    }
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)compareObjectsInStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  BOOL v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  id v76;
  _BYTE v77[128];
  _QWORD v78[5];
  _QWORD v79[5];
  _QWORD v80[3];
  _QWORD v81[5];

  v81[3] = *MEMORY[0x1E0C80C00];
  v68 = 0;
  v9 = -[PFCloudKitStoreComparisonCache identifiersForStore:](self->_cache, "identifiersForStore:");
  v10 = -[PFCloudKitStoreComparisonCache identifiersForStore:](self->_cache, "identifiersForStore:", a4);
  v11 = -[PFCloudKitStoreComparisonCache recordIdsForStore:](self->_cache, "recordIdsForStore:", a3);
  v12 = -[PFCloudKitStoreComparisonCache recordIdsForStore:](self->_cache, "recordIdsForStore:", a4);
  v63 = -[PFCloudKitStoreComparisonCache sharedZoneIDsForStore:](self->_cache, "sharedZoneIDsForStore:", a3);
  v61 = a4;
  v60 = -[PFCloudKitStoreComparisonCache sharedZoneIDsForStore:](self->_cache, "sharedZoneIDsForStore:", a4);
  v62 = v11;
  if (!self->_onlyCompareSharedZones)
  {
    v36 = objc_msgSend(v9, "count");
    if (v36 == objc_msgSend(v10, "count"))
    {
      if ((objc_msgSend(v11, "isEqualToSet:", v12) & 1) != 0)
        goto LABEL_2;
      v37 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v37, "minusSet:", v12);
      v19 = (id)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v19, "minusSet:", v11);
      v56 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB28A8];
      v80[0] = *MEMORY[0x1E0CB2D68];
      v59 = v12;
      v81[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stores do not contain the same record names. (%@:%lu / %@:%lu)"), objc_msgSend(a3, "identifier"), objc_msgSend(v11, "count"), objc_msgSend(a4, "identifier"), objc_msgSend(v12, "count"));
      v80[1] = objc_msgSend(a3, "identifier");
      v81[1] = v37;
      v80[2] = objc_msgSend(a4, "identifier");
      v81[2] = v19;
      v68 = (void *)objc_msgSend(v56, "errorWithDomain:code:userInfo:", v54, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3));

    }
    else
    {
      v53 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v53, "minusSet:", v10);
      v52 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v52, "minusSet:", v9);
      v38 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v38, "minusSet:", v12);
      v59 = v12;
      v19 = (id)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v19, "minusSet:", v62);
      v57 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB28A8];
      v78[0] = *MEMORY[0x1E0CB2D68];
      v79[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stores do not contain the same identifiers. (%@:%lu / %@:%lu)"), objc_msgSend(a3, "identifier"), objc_msgSend(v9, "count"), objc_msgSend(a4, "identifier"), objc_msgSend(v10, "count"));
      v78[1] = objc_msgSend(a3, "identifier");
      v79[1] = v53;
      v78[2] = objc_msgSend(a4, "identifier");
      v79[2] = v52;
      v78[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-RecordIDs"), objc_msgSend(a3, "identifier"));
      v79[3] = v38;
      v78[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-RecordIDs"), objc_msgSend(a4, "identifier"));
      v79[4] = v19;
      v68 = (void *)objc_msgSend(v57, "errorWithDomain:code:userInfo:", v55, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 5));

LABEL_36:
      v11 = v62;
    }
LABEL_37:

    v35 = 0;
LABEL_38:
    v12 = v59;
    goto LABEL_39;
  }
LABEL_2:
  if (objc_msgSend(v11, "count")
    && (v66 = 0u,
        v67 = 0u,
        v64 = 0u,
        v65 = 0u,
        (v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v77, 16)) != 0))
  {
    v14 = v13;
    v15 = *(_QWORD *)v65;
    v58 = a5;
    v59 = v12;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v65 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v16);
        if (!self->_onlyCompareSharedZones
          || objc_msgSend(v63, "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v16), "zoneID"))&& objc_msgSend(v60, "containsObject:", objc_msgSend(v17, "zoneID")))
        {
          v18 = -[PFCloudKitStoreComparer getObjectMatchingRecordID:fromStore:withManagedObjectContext:](self, "getObjectMatchingRecordID:fromStore:withManagedObjectContext:", v17, a3, -[PFCloudKitStoreComparisonCache storeMoc](self->_cache, "storeMoc"));
          v19 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "entity"), "relationshipsByName"), "allValues");
          if (!v18)
          {
            v39 = (void *)MEMORY[0x1E0CB35C8];
            v40 = *MEMORY[0x1E0CB28A8];
            v69 = *MEMORY[0x1E0CB2D68];
            v70 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve object with recordID '%@' from store %@"), v17, a3);
            v68 = (void *)objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
            a5 = v58;
            goto LABEL_37;
          }
          v20 = -[PFCloudKitStoreComparer getObjectMatchingRecordID:fromStore:withManagedObjectContext:](self, "getObjectMatchingRecordID:fromStore:withManagedObjectContext:", v17, v61, -[PFCloudKitStoreComparisonCache otherStoreMoc](self->_cache, "otherStoreMoc"));
          if (!v20)
          {
            v41 = (void *)MEMORY[0x1E0CB35C8];
            v42 = *MEMORY[0x1E0CB28A8];
            v71 = *MEMORY[0x1E0CB2D68];
            v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve object with recordID '%@' from store %@"), v17, v61);
            v68 = (void *)objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
LABEL_35:

            a5 = v58;
            goto LABEL_36;
          }
          v21 = objc_msgSend(v18, "entity");
          if (v21)
            v22 = *(_QWORD *)(v21 + 160);
          else
            v22 = 0;
          v23 = objc_msgSend(v20, "entity");
          if (v23)
            v24 = *(_QWORD *)(v23 + 160);
          else
            v24 = 0;
          if (v22 != v24)
          {
            v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Objects appear to be from different entities:\nStore: %@\nOther Store: %@");
            _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)v18);
            v32 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v74 = (const char *)v18;
              v75 = 2112;
              v76 = v20;
              _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: Objects appear to be from different entities:\nStore: %@\nOther Store: %@", buf, 0x16u);
            }
          }
          if (!-[PFCloudKitStoreComparer compareAttributesOnObject:toObject:error:](self, "compareAttributesOnObject:toObject:error:", v18, v20, &v68))goto LABEL_35;
          v33 = -[PFCloudKitStoreComparer compareRelationshipsOfRecordID:withStoreObject:andOtherObject:error:](self, "compareRelationshipsOfRecordID:withStoreObject:andOtherObject:error:", v17, v18, v20, &v68);

          v11 = v62;
          if (!v33)
          {
            v35 = 0;
            a5 = v58;
            goto LABEL_38;
          }
        }
        ++v16;
      }
      while (v14 != v16);
      v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      v14 = v34;
      v35 = 1;
      a5 = v58;
      v12 = v59;
    }
    while (v34);
  }
  else
  {
    v35 = 1;
  }
LABEL_39:

  if (!v35)
  {
    if (v68)
    {
      if (a5)
        *a5 = v68;
    }
    else
    {
      v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v50 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v74 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        v75 = 1024;
        LODWORD(v76) = 403;
        _os_log_fault_impl(&dword_18A253000, v50, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v35;
}

- (BOOL)compareAttributesOnObject:(id)a3 toObject:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id obj;
  _QWORD v46[7];
  _QWORD v47[7];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  uint64_t v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  int v67;
  _QWORD v68[5];
  _QWORD v69[5];
  uint64_t v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v59 = &v58;
  v60 = 0x3052000000;
  v61 = __Block_byref_object_copy__52;
  v62 = __Block_byref_object_dispose__52;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3052000000;
  v55 = __Block_byref_object_copy__52;
  v56 = __Block_byref_object_dispose__52;
  v57 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "entity"), "attributesByName"), "allValues");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
  if (!v8)
    goto LABEL_18;
  obj = v7;
  v9 = *(_QWORD *)v49;
  v10 = MEMORY[0x1E0C809B0];
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v49 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v11);
      v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue");
      v14 = (void *)objc_msgSend(a3, "managedObjectContext");
      v47[0] = v10;
      v47[1] = 3221225472;
      v47[2] = __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke;
      v47[3] = &unk_1E1EDE1F0;
      v47[5] = v12;
      v47[6] = &v58;
      v47[4] = a3;
      objc_msgSend(v14, "performBlockAndWait:", v47);
      v15 = (void *)objc_msgSend(a4, "managedObjectContext");
      v46[0] = v10;
      v46[1] = 3221225472;
      v46[2] = __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke_2;
      v46[3] = &unk_1E1EDE1F0;
      v46[5] = v12;
      v46[6] = &v52;
      v46[4] = a4;
      objc_msgSend(v15, "performBlockAndWait:", v46);
      v16 = v59[5];
      if (v13)
      {
        if (!-[PFCloudKitStoreComparer validateValue:againstOtherValue:forIgnoredAttribute:](self, "validateValue:againstOtherValue:forIgnoredAttribute:", v16, v53[5], v12))
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          v27 = objc_msgSend((id)objc_msgSend(v12, "entity"), "name");
          v28 = objc_msgSend(v12, "name");
          v29 = +[PFCloudKitStoreComparer trimExcessiveValuesForLog:](PFCloudKitStoreComparer, "trimExcessiveValuesForLog:", v59[5]);
          v30 = objc_msgSend(v26, "stringWithFormat:", CFSTR("Ignored attribute (%@:%@) appears to have been synced:\nValue: %@\nOther value: %@"), v27, v28, v29, +[PFCloudKitStoreComparer trimExcessiveValuesForLog:](PFCloudKitStoreComparer, "trimExcessiveValuesForLog:", v53[5]));
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v70 = *MEMORY[0x1E0CB2D68];
          v71 = v30;
          v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
          v33 = objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v32);
LABEL_24:
          v19 = (void *)v33;
          v20 = 0;
          goto LABEL_25;
        }
LABEL_12:

        v59[5] = 0;
        v53[5] = 0;
        goto LABEL_13;
      }
      v17 = v53[5];
      if (v16)
      {
        if (!v17
          || !-[PFCloudKitStoreComparer isValue:equalToValue:forAttribute:](self, "isValue:equalToValue:forAttribute:"))
        {
LABEL_19:
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = *MEMORY[0x1E0CB2D68];
          v69[0] = CFSTR("Attribute values do not match.");
          v68[0] = v22;
          v68[1] = CFSTR("storeObjectID");
          v69[1] = objc_msgSend(a3, "objectID");
          v68[2] = CFSTR("otherStoreObjectID");
          v69[2] = objc_msgSend(a4, "objectID");
          v68[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("store-%@"), objc_msgSend(v12, "name"));
          v23 = (const __CFString *)v59[5];
          if (!v23)
            v23 = CFSTR("nil");
          v69[3] = v23;
          v68[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("otherStore-%@"), objc_msgSend(v12, "name"));
          v24 = (const __CFString *)v53[5];
          if (!v24)
            v24 = CFSTR("nil");
          v69[4] = v24;
          v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
          v33 = objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v25);
          goto LABEL_24;
        }
        goto LABEL_12;
      }
      if (v17)
        goto LABEL_19;
LABEL_13:
      ++v11;
    }
    while (v8 != v11);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
    v8 = v18;
  }
  while (v18);
LABEL_18:
  v19 = 0;
  v20 = 1;
LABEL_25:

  v59[5] = 0;
  v53[5] = 0;
  if (!v20)
  {
    if (v19)
    {
      if (a5)
        *a5 = v19;
    }
    else
    {
      v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v41 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        v66 = 1024;
        v67 = 468;
        _os_log_fault_impl(&dword_18A253000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  return v20;
}

id __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

id __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4 forAttribute:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a5, "attributeType");
  if (v9 <= 699)
  {
    if (v9 <= 299)
    {
      if (!v9)
      {
        v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Not sure what to do with undefined attributes");
        _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, v57);
        v31 = __pflogFaultLog;
        v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!v13)
          return v13;
        *(_WORD *)buf = 0;
        v32 = "CoreData: Not sure what to do with undefined attributes";
        v33 = v31;
        v34 = 2;
        goto LABEL_51;
      }
      if (v9 != 100 && v9 != 200)
        goto LABEL_49;
    }
    else if (v9 > 499)
    {
      if (v9 != 500 && v9 != 600)
        goto LABEL_49;
    }
    else if (v9 != 300 && v9 != 400)
    {
      goto LABEL_49;
    }
    goto LABEL_25;
  }
  if (v9 <= 1099)
  {
    if (v9 <= 899)
    {
      if (v9 != 700)
      {
        if (v9 != 800)
          goto LABEL_49;
LABEL_25:
        LOBYTE(v13) = objc_msgSend(a3, "isEqualToNumber:", a4);
        return v13;
      }
      goto LABEL_54;
    }
    if (v9 == 900)
    {
      LOBYTE(v13) = objc_msgSend(a3, "isEqualToDate:", a4);
      return v13;
    }
    if (v9 != 1000)
      goto LABEL_49;
LABEL_48:
    LOBYTE(v13) = objc_msgSend(a3, "isEqualToData:", a4);
    return v13;
  }
  if (v9 <= 1799)
  {
    if (v9 != 1100)
    {
      if (v9 == 1200)
      {
        v10 = objc_msgSend(a3, "absoluteString");
        v11 = (id)objc_msgSend(a4, "absoluteString");
        v12 = (id)v10;
LABEL_55:
        LOBYTE(v13) = objc_msgSend(v12, "isEqualToString:", v11);
        return v13;
      }
LABEL_49:
      v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown attribute type: %lu");
      v36 = objc_msgSend(a5, "attributeType");
      _NSCoreDataLog(17, v35, v37, v38, v39, v40, v41, v42, v36);
      v43 = __pflogFaultLog;
      v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v13)
        return v13;
      *(_DWORD *)buf = 134217984;
      v64 = objc_msgSend(a5, "attributeType");
      v32 = "CoreData: Unknown attribute type: %lu";
      v33 = v43;
      v34 = 12;
      goto LABEL_51;
    }
    goto LABEL_61;
  }
  if (v9 == 1800)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_48;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_54:
      v12 = a3;
      v11 = a4;
      goto LABEL_55;
    }
    getCloudKitCKRecordClass[0]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = objc_msgSend(a3, "recordID");
      v45 = (id)objc_msgSend(a4, "recordID");
      v46 = (id)v44;
LABEL_62:
      LOBYTE(v13) = objc_msgSend(v46, "isEqual:", v45);
      return v13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown value type '%@' for attribute: %@");
      v48 = objc_opt_class();
      _NSCoreDataLog(17, v47, v49, v50, v51, v52, v53, v54, v48);
      v55 = __pflogFaultLog;
      v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v13)
        return v13;
      *(_DWORD *)buf = 138412546;
      v64 = objc_opt_class();
      v65 = 2112;
      v66 = a5;
      v32 = "CoreData: Unknown value type '%@' for attribute: %@";
      v33 = v55;
      v34 = 22;
LABEL_51:
      _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, v32, buf, v34);
LABEL_52:
      LOBYTE(v13) = 0;
      return v13;
    }
LABEL_61:
    v46 = a3;
    v45 = a4;
    goto LABEL_62;
  }
  if (v9 != 2100)
    goto LABEL_49;
  v14 = (void *)objc_msgSend(a5, "elements");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v20 = objc_msgSend(a3, "valueForKey:", objc_msgSend(v19, "name"));
        v21 = objc_msgSend(a4, "valueForKey:", objc_msgSend(v19, "name"));
        if (v20)
          v22 = v21 == 0;
        else
          v22 = 1;
        if (v22)
        {
          if (v20 | v21)
            goto LABEL_52;
        }
        else if (!-[PFCloudKitStoreComparer isValue:equalToValue:forAttribute:](self, "isValue:equalToValue:forAttribute:", v20, v21, v19))
        {
          goto LABEL_52;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      LOBYTE(v13) = 1;
    }
    while (v16);
  }
  else
  {
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)validateValue:(id)a3 againstOtherValue:(id)a4 forIgnoredAttribute:(id)a5
{
  BOOL result;

  result = 1;
  if (a3)
  {
    if (a4)
      return !-[PFCloudKitStoreComparer isValue:equalToValue:forAttribute:](self, "isValue:equalToValue:forAttribute:");
  }
  return result;
}

- (BOOL)compareRelationshipsOfRecordID:(id)a3 withStoreObject:(id)a4 andOtherObject:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v45 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectID"), "persistentStore");
  v52 = a5;
  v44 = (void *)objc_msgSend((id)objc_msgSend(a5, "objectID"), "persistentStore");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v51 = a4;
  obj = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "entity"), "relationshipsByName"), "allValues");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v50 = *(_QWORD *)v54;
    v48 = *MEMORY[0x1E0CB28A8];
    v47 = *MEMORY[0x1E0CB2D68];
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v50)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v13);
      v15 = (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue") & 1) != 0? 1: objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inverseRelationship"), "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue");
      v16 = -[PFCloudKitStoreComparer getRecordIDsForRelationship:onObject:](self, "getRecordIDsForRelationship:onObject:", v14, v51);
      v17 = -[PFCloudKitStoreComparer getRecordIDsForRelationship:onObject:](self, "getRecordIDsForRelationship:onObject:", v14, v52);
      if (!objc_msgSend(v16, "isEqualToSet:", v17))
        break;
      if (v15)
      {
        v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ignored relationship (%@:%@) appears to have been synced:\nValue: %@\nOther value: %@"), objc_msgSend((id)objc_msgSend(v14, "entity"), "name"), objc_msgSend(v14, "name"), v16, v17);
        v69 = v47;
        v70 = v33;
        v12 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v48, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
LABEL_32:
        if (v12)
        {
          if (a6)
          {
            LOBYTE(v32) = 0;
            *a6 = v12;
            return v32;
          }
        }
        else
        {
          v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
          v41 = __pflogFaultLog;
          v32 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
          if (!v32)
            return v32;
          *(_DWORD *)buf = 136315394;
          v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
          v59 = 1024;
          v60 = 646;
          _os_log_fault_impl(&dword_18A253000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        LOBYTE(v32) = 0;
        return v32;
      }
      if (!objc_msgSend(v14, "isToMany")
        || !objc_msgSend((id)objc_msgSend(v14, "inverseRelationship"), "isToMany")
        || !-[PFCloudKitStoreComparisonCache checkCloudKitMetadata](self->_cache, "checkCloudKitMetadata"))
      {
        v22 = 1;
        goto LABEL_23;
      }
      v43 = v12;
      v18 = -[PFCloudKitStoreComparisonCache recordIDsRelatedToRecordID:byRelationshipNamed:inStore:](self->_cache, "recordIDsRelatedToRecordID:byRelationshipNamed:inStore:", a3, objc_msgSend(v14, "name"), v45);
      v19 = -[PFCloudKitStoreComparisonCache recordIDsRelatedToRecordID:byRelationshipNamed:inStore:](self->_cache, "recordIDsRelatedToRecordID:byRelationshipNamed:inStore:", a3, objc_msgSend(v14, "name"), v44);
      v20 = objc_msgSend(v18, "count");
      if (v20 != objc_msgSend(v16, "count") || (objc_msgSend(v16, "isEqualToSet:", v18) & 1) == 0)
      {
        v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mirrored relationships don't match actual record for '%@' in %@\nObject: %@\nMirrored Relationships: %@"), a3, objc_msgSend(v45, "URL"), objc_msgSend((id)objc_msgSend(v16, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34), objc_msgSend((id)objc_msgSend(v18, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34));
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v67 = v47;
        v68 = v28;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v68;
        v27 = &v67;
        goto LABEL_21;
      }
      v21 = objc_msgSend(v19, "count");
      if (v21 != objc_msgSend(v17, "count") || (objc_msgSend(v19, "isEqualToSet:", v17) & 1) == 0)
      {
        v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mirrored relationships don't match actual record for '%@' in %@\nObject: %@\nMirrored Relationships: %@"), a3, objc_msgSend(v44, "URL"), objc_msgSend((id)objc_msgSend(v17, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34), objc_msgSend((id)objc_msgSend(v19, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34));
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v65 = v47;
        v66 = v29;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v66;
        v27 = &v65;
        goto LABEL_21;
      }
      if ((objc_msgSend(v18, "isEqualToSet:", v19) & 1) == 0)
      {
        v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mirrored relationships don't match for object with record name (%@): \nStore: %@\nOther Store: %@"), a3, objc_msgSend((id)objc_msgSend(v18, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34), objc_msgSend((id)objc_msgSend(v19, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34));
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v63 = v47;
        v64 = v30;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v64;
        v27 = &v63;
        goto LABEL_21;
      }
      v22 = 1;
      v12 = v43;
LABEL_23:

      if (!v22)
        goto LABEL_32;
      if (v11 == ++v13)
      {
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
        v11 = v31;
        if (v31)
          goto LABEL_3;
        goto LABEL_30;
      }
    }
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relationship doesn't match for object with record name (%@): %@\nStore: %@\nOther Store: %@"), objc_msgSend(v14, "name"), a3, objc_msgSend((id)objc_msgSend(v16, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34), objc_msgSend((id)objc_msgSend(v17, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_34));
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v61 = v47;
    v62 = v23;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v62;
    v27 = &v61;
LABEL_21:
    v12 = (void *)objc_msgSend(v24, "errorWithDomain:code:userInfo:", v48, 134060, objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1));
    v22 = 0;
    goto LABEL_23;
  }
LABEL_30:
  LOBYTE(v32) = 1;
  return v32;
}

- (id)getRecordIDsForRelationship:(id)a3 onObject:(id)a4
{
  id v7;
  void *v8;
  _QWORD v10[8];

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = (void *)objc_msgSend(a4, "managedObjectContext");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke;
  v10[3] = &unk_1E1EDE7A8;
  v10[4] = a4;
  v10[5] = a3;
  v10[6] = v7;
  v10[7] = self;
  objc_msgSend(v8, "performBlockAndWait:", v10);
  return v7;
}

uint64_t __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke(uint64_t a1)
{
  void *v2;
  int8x16_t v3;
  uint64_t result;
  _QWORD v5[4];
  __int128 v6;
  int8x16_t v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  if (objc_msgSend(*(id *)(a1 + 40), "isToMany"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke_2;
    v5[3] = &unk_1E1EE17D0;
    v3 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    v6 = *(_OWORD *)(a1 + 48);
    v7 = v3;
    return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "recordIDForObjectID:", objc_msgSend(v2, "objectID"));
    if (result)
      return objc_msgSend(*(id *)(a1 + 48), "addObject:", result);
  }
  return result;
}

void __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "recordIDForObjectID:", objc_msgSend(a2, "objectID")));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "checkCloudKitMetadata"))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "inverseRelationship"), "isToMany"))
    {
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "mirroredRelationshipForObject:relatedToObject:byRelationship:", *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 48));
      if (v4)
      {
        v5 = (void *)v4;
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "inverseRelationship"), "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue"))
        {
          v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found mirrored relationship for ignored relationship: %@");
          _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
          v13 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            return;
          *(_DWORD *)buf = 138412290;
          v45 = (uint64_t)v5;
          v22 = "CoreData: Found mirrored relationship for ignored relationship: %@";
          v30 = v13;
          v31 = 12;
LABEL_19:
          _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, v22, buf, v31);
          return;
        }
        if ((objc_msgSend((id)objc_msgSend(v5, "isUploaded"), "BOOLValue") & 1) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(v5, "needsDelete"), "BOOLValue"))
          {
            v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found mirrored relationship that's marked deleted but the objects are linked.");
            _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v43);
            v21 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              v22 = "CoreData: Found mirrored relationship that's marked deleted but the objects are linked.";
LABEL_14:
              v30 = v21;
              v31 = 2;
              goto LABEL_19;
            }
          }
          else if (objc_msgSend((id)objc_msgSend(v5, "isPending"), "BOOLValue"))
          {
            v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found pending mirrored relationship for linked objects (%@).\n%@\n%@");
            v33 = objc_msgSend(*(id *)(a1 + 48), "name");
            _NSCoreDataLog(17, v32, v34, v35, v36, v37, v38, v39, v33);
            v40 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v41 = objc_msgSend(*(id *)(a1 + 48), "name");
              v42 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138412802;
              v45 = v41;
              v46 = 2112;
              v47 = v42;
              v48 = 2112;
              v49 = a2;
              v22 = "CoreData: Found pending mirrored relationship for linked objects (%@).\n%@\n%@";
              v30 = v40;
              v31 = 32;
              goto LABEL_19;
            }
          }
        }
        else
        {
          v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found mirrored relationship not marked uploaded, but this method is supposed to make sure store contents are equal, so shouldn't it be?");
          _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, v43);
          v21 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            v22 = "CoreData: Found mirrored relationship not marked uploaded, but this method is supposed to make sure st"
                  "ore contents are equal, so shouldn't it be?";
            goto LABEL_14;
          }
        }
      }
    }
  }
}

- (BOOL)ensureStoresAgreeOnCloudKitTables:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSSQLBlockRequestContext *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t v46[128];
  _BYTE buf[24];
  char v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v5)
          objc_enumerationMutation(a3);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v48 = 1;
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __67__PFCloudKitStoreComparer_ensureStoresAgreeOnCloudKitTables_error___block_invoke;
        v39[3] = &unk_1E1EDF6D0;
        v39[4] = buf;
        v8 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", v39, 0, v7);
        -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v7, v8, 0);
        objc_msgSend(v34, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24)), objc_msgSend(v7, "identifier"));

        _Block_object_dispose(buf, 8);
      }
      v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v4);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = (void *)objc_msgSend(v34, "allKeys");
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(v34, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
        v15 = v14;
        if (v10)
        {
          v16 = objc_msgSend(v10, "BOOLValue");
          if (v16 != objc_msgSend(v15, "BOOLValue"))
          {
            v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0CB2D68];
            v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stores disagree about whether or not CloudKit metadata tables are present: %@\n%@"), a3, v34);
            v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v18);
            v20 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          v10 = v14;
          -[PFCloudKitStoreComparisonCache _setCheckCloudKitMetadata:](self->_cache, "_setCheckCloudKitMetadata:", objc_msgSend(v10, "BOOLValue"));
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v11);
  }
  v19 = 0;
  v20 = 1;
LABEL_20:

  if (!v20)
  {
    v21 = v19;
    if (v21)
    {
      if (a4)
        *a4 = v21;
    }
    else
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v29 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 744;
        _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v20;
}

uint64_t __67__PFCloudKitStoreComparer_ensureStoresAgreeOnCloudKitTables_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = *(void **)(a2 + 8);
  else
    v4 = 0;
  result = objc_msgSend((id)objc_msgSend(v4, "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentStoreMirroringDelegateOptionKey"));
  if (result)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = *(void **)(result + 40);
    result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if (!a2)
          {
            result = objc_msgSend(v10, "tableName");
            goto LABEL_16;
          }
          v11 = *(_QWORD *)(a2 + 24);
          result = objc_msgSend(v10, "tableName");
          if (!v11)
            goto LABEL_16;
          result = -[NSSQLiteConnection _hasTableWithName:isTemp:](v11, result, 0);
          if (!(_DWORD)result)
            goto LABEL_16;
          ++v9;
        }
        while (v7 != v9);
        result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v7 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  else
  {
LABEL_16:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)compareCloudKitMetadataOfStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  BOOL v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  if (!-[PFCloudKitStoreComparer ensureMirroredRelationshipsMatchForStore:otherStore:error:](self, "ensureMirroredRelationshipsMatchForStore:otherStore:error:", a3, a4, &v21)|| !-[PFCloudKitStoreComparer ensureMoveReceiptsMatchForStore:otherStore:error:](self, "ensureMoveReceiptsMatchForStore:otherStore:error:", a3, a4, &v21))
  {
    v10 = v21;
    v11 = v21;
    if (v11)
    {
      if (a5)
      {
        v9 = 0;
        *a5 = v11;
        goto LABEL_10;
      }
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        v24 = 1024;
        v25 = 771;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v9 = 0;
    goto LABEL_10;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)ensureMoveReceiptsMatchForStore:(id)a3 otherStore:(id)a4 error:(id *)a5
{
  PFCloudKitStoreComparer *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  int v34;
  char v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  id v47;
  id obj;
  id v49;
  PFCloudKitStoreComparer *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[10];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  uint64_t v65;
  _QWORD v66[10];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[4];
  _QWORD v84[4];
  _QWORD v85[5];
  _QWORD v86[5];
  uint8_t v87[128];
  _BYTE buf[24];
  void (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v7 = self;
  v93 = *MEMORY[0x1E0C80C00];
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 1;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3052000000;
  v74 = __Block_byref_object_copy__52;
  v75 = __Block_byref_object_dispose__52;
  v76 = 0;
  v8 = -[PFCloudKitStoreComparisonCache recordIdsForStore:](self->_cache, "recordIdsForStore:");
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
  if (v9)
  {
    v51 = *MEMORY[0x1E0CB28A8];
    v52 = *MEMORY[0x1E0CB2D68];
    v53 = *(_QWORD *)v68;
    v49 = a3;
    v50 = v7;
    v47 = a4;
LABEL_3:
    v10 = 0;
    v54 = v9;
    while (1)
    {
      if (*(_QWORD *)v68 != v53)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v10);
      v12 = -[PFCloudKitStoreComparisonCache metadataForObjectWithID:](v7->_cache, "metadataForObjectWithID:", -[PFCloudKitStoreComparisonCache objectIDForRecordID:inStore:](v7->_cache, "objectIDForRecordID:inStore:", v11, a3));
      v13 = -[PFCloudKitStoreComparisonCache metadataForObjectWithID:](v7->_cache, "metadataForObjectWithID:", -[PFCloudKitStoreComparisonCache objectIDForRecordID:inStore:](v7->_cache, "objectIDForRecordID:inStore:", v11, a4));
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      v89 = __Block_byref_object_copy__52;
      v90 = __Block_byref_object_dispose__52;
      v91 = 0;
      v15 = (void *)objc_msgSend(v12, "managedObjectContext");
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke;
      v66[3] = &unk_1E1EDFD80;
      v66[4] = v12;
      v66[5] = v14;
      v66[6] = v7;
      v66[7] = buf;
      v66[8] = &v71;
      v66[9] = &v77;
      objc_msgSend(v15, "performBlockAndWait:", v66);
      if (*((_BYTE *)v78 + 24))
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v60 = 0;
        v61 = &v60;
        v62 = 0x3052000000;
        v63 = __Block_byref_object_copy__52;
        v64 = __Block_byref_object_dispose__52;
        v65 = 0;
        v17 = (void *)objc_msgSend(v13, "managedObjectContext");
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke_2;
        v59[3] = &unk_1E1EDFD80;
        v59[4] = v13;
        v59[5] = v16;
        v59[6] = v7;
        v59[7] = &v60;
        v59[8] = &v71;
        v59[9] = &v77;
        objc_msgSend(v17, "performBlockAndWait:", v59);
        v18 = objc_msgSend(v14, "count");
        if (v18 == objc_msgSend(v16, "count"))
        {
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v19 = (void *)objc_msgSend(v14, "allKeys");
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v87, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v56;
            while (2)
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v56 != v21)
                  objc_enumerationMutation(v19);
                v23 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
                if ((objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v23), "isEqualToDate:", objc_msgSend(v16, "objectForKeyedSubscript:", v23)) & 1) == 0)
                {
                  *((_BYTE *)v78 + 24) = 0;
                  a4 = v47;
                  v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v85[0] = v52;
                  v85[1] = CFSTR("recordID");
                  v86[0] = CFSTR("Move receipt dates don't match.");
                  v86[1] = v11;
                  v85[2] = CFSTR("movedRecordName");
                  v86[2] = v23;
                  v85[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-receipts"), objc_msgSend(v49, "identifier"));
                  v86[3] = v14;
                  v85[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-receipts"), objc_msgSend(v47, "identifier"));
                  v86[4] = v16;
                  v25 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v51, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 5));
                  a3 = v49;
                  goto LABEL_19;
                }
              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v87, 16);
              a4 = v47;
              a3 = v49;
              if (v20)
                continue;
              break;
            }
          }
        }
        else
        {
          *((_BYTE *)v78 + 24) = 0;
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v83[0] = v52;
          v83[1] = CFSTR("recordID");
          v84[0] = CFSTR("Move receipts don't match.");
          v84[1] = v11;
          v83[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-receipts"), objc_msgSend(a3, "identifier"));
          v84[2] = v14;
          v83[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-receipts"), objc_msgSend(a4, "identifier"));
          v84[3] = v16;
          v25 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v51, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 4));
LABEL_19:
          v72[5] = v25;
        }
        v7 = v50;
        if (*((_BYTE *)v78 + 24))
        {
          v27 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v27 != (void *)v61[5])
          {
            v28 = (void *)objc_msgSend((id)objc_msgSend(v27, "recordID"), "recordName");
            if (!objc_msgSend(v28, "isEqual:", objc_msgSend((id)objc_msgSend((id)v61[5], "recordID"), "recordName"))|| (v29 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "recordID"), "zoneID"), "zoneName"), (objc_msgSend(v29, "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v61[5], "recordID"), "zoneID"), "zoneName")) & 1) == 0))
            {
              *((_BYTE *)v78 + 24) = 0;
              v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v81[0] = v52;
              v81[1] = CFSTR("recordID");
              v82[0] = CFSTR("Shares don't match for record zone.");
              v82[1] = v11;
              v81[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-share"), objc_msgSend(a3, "identifier"));
              v31 = *(const __CFString **)(*(_QWORD *)&buf[8] + 40);
              if (!v31)
                v31 = CFSTR("nil");
              v82[2] = v31;
              v81[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-share"), objc_msgSend(a4, "identifier"));
              v32 = (const __CFString *)v61[5];
              if (!v32)
                v32 = CFSTR("nil");
              v82[3] = v32;
              v33 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v51, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 4));
              v72[5] = v33;
            }
          }
        }

        v61[5] = 0;
        _Block_object_dispose(&v60, 8);
      }

      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
      v34 = *((unsigned __int8 *)v78 + 24);
      _Block_object_dispose(buf, 8);
      if (!v34)
        break;
      if (++v10 == v54)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  if (!*((_BYTE *)v78 + 24))
  {
    v37 = (id)v72[5];
    if (v37)
    {
      if (a5)
        *a5 = v37;
    }
    else
    {
      v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v45 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 881;
        _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v72[5] = 0;
  v35 = *((_BYTE *)v78 + 24);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);
  return v35;
}

void __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "moveReceipts", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "movedAt"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "recordName"));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  v7 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(*(id *)(a1 + 32), "recordZone"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordZone"), "encodedShareData"), v7, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 40));
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v8)
  {
    v9 = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }

}

void __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "moveReceipts", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "movedAt"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "recordName"));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  v7 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID]((void *)objc_msgSend(*(id *)(a1 + 32), "recordZone"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordZone"), "encodedShareData"), v7, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 40));
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v8)
  {
    v9 = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }

}

- (BOOL)ensureMirroredRelationshipsMatchForStore:(id)a3 otherStore:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSManagedObjectContext *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  id *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v31[13];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3052000000;
  v43 = __Block_byref_object_copy__52;
  v44 = __Block_byref_object_dispose__52;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v60[0] = a3;
  v60[1] = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v61, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
      v13 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
      -[NSManagedObjectContext setPersistentStoreCoordinator:](v13, "setPersistentStoreCoordinator:", objc_msgSend(v12, "_persistentStoreCoordinator"));
      -[NSManagedObjectContext _setAllowAncillaryEntities:](v13, "_setAllowAncillaryEntities:", 1);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __85__PFCloudKitStoreComparer_ensureMirroredRelationshipsMatchForStore_otherStore_error___block_invoke;
      v31[3] = &unk_1E1EE17F8;
      v31[4] = v12;
      v31[5] = self;
      v31[6] = v13;
      v31[7] = a3;
      v31[8] = a4;
      v31[9] = &v50;
      v31[10] = &v46;
      v31[11] = &v36;
      v31[12] = &v40;
      -[NSManagedObjectContext performBlockAndWait:](v13, "performBlockAndWait:", v31);

      if (!*((_BYTE *)v37 + 24))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v61, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  if (!*((_BYTE *)v37 + 24))
  {
    v17 = a5;
    v18 = (id)v41[5];
    goto LABEL_14;
  }
  v14 = v51[3];
  v15 = v47[3];
  if (v14 != v15)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0CB2D68];
    v17 = a5;
    v59 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stores don't have the same number of mirrored relationships: %lu / %lu"), v14, v15);
    v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v18 = (id)objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v20);
LABEL_14:
    if (v18)
    {
      if (v17)
      {
        v16 = 0;
        *v17 = v18;
        goto LABEL_20;
      }
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        v56 = 1024;
        v57 = 952;
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v16 = 0;
    goto LABEL_20;
  }
  v16 = 1;
LABEL_20:

  v41[5] = 0;
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  return v16;
}

id __85__PFCloudKitStoreComparer_ensureMirroredRelationshipsMatchForStore_otherStore_error___block_invoke(uint64_t a1)
{
  NSFetchRequest *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id result;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath](NSCKMirroredRelationship, "entityPath"));
  v19[0] = *(_QWORD *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1));
  -[NSFetchRequest setResultType:](v2, "setResultType:", 4);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 8))
  {
    v4 = (void *)objc_msgSend(*(id *)(v3 + 16), "sharedZoneIDsForStore:", *(_QWORD *)(a1 + 32));
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9++), "zoneName"));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recordZone.ckRecordZoneName IN %@"), v5));

  }
  v13 = 0;
  result = (id)objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v2, &v13);
  if (result)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11 == *(_QWORD *)(a1 + 56))
    {
      result = (id)objc_msgSend((id)objc_msgSend(result, "lastObject"), "unsignedIntegerValue");
      v12 = *(_QWORD *)(a1 + 72);
    }
    else
    {
      if (v11 != *(_QWORD *)(a1 + 64))
        return result;
      result = (id)objc_msgSend((id)objc_msgSend(result, "lastObject"), "unsignedIntegerValue");
      v12 = *(_QWORD *)(a1 + 80);
    }
    *(_QWORD *)(*(_QWORD *)(v12 + 8) + 24) = result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    result = v13;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)ensureRecordMetadataMatchesForRecordID:(id)a3 inStore:(id)a4 andOtherStore:(id)a5 error:(id *)a6
{
  unint64_t v10;
  unint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  BOOL v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v37;
  _QWORD v38[6];
  _QWORD v39[6];
  void *v40;
  _BYTE buf[24];
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v40 = 0;
  v10 = -[PFCloudKitStoreComparisonCache metadataForRecordID:inStore:](self->_cache, "metadataForRecordID:inStore:", a3, a4);
  v11 = -[PFCloudKitStoreComparisonCache metadataForRecordID:inStore:](self->_cache, "metadataForRecordID:inStore:", a3, a5);
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (v10 | v11)
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Hmmmm I think something changed around this method because the metadata should have been verified for equivalent entries by now.");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v37);
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Hmmmm I think something changed around this method because the metadata should have been verified for equivalent entries by now.", buf, 2u);
      }
    }
    goto LABEL_17;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v42 = __Block_byref_object_copy__52;
  v43 = __Block_byref_object_dispose__52;
  v44 = 0;
  v22 = (void *)objc_msgSend((id)v10, "managedObjectContext");
  v23 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke;
  v39[3] = &unk_1E1EDD618;
  v39[4] = v10;
  v39[5] = buf;
  objc_msgSend(v22, "performBlockAndWait:", v39);
  v24 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:]((uint64_t)self->_archivingUtilities, *(void **)(*(_QWORD *)&buf[8] + 40), &v40);

  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
  if (v24)
  {
    v38[0] = v23;
    v38[1] = 3221225472;
    v38[2] = __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke_2;
    v38[3] = &unk_1E1EDD618;
    v38[4] = v12;
    v38[5] = buf;
    objc_msgSend((id)objc_msgSend(v12, "managedObjectContext"), "performBlockAndWait:", v38);
    v25 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:]((uint64_t)self->_archivingUtilities, *(void **)(*(_QWORD *)&buf[8] + 40), &v40);

    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
    v26 = v25
       && -[PFCloudKitStoreComparer ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:](self, "ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:", v24, v25, &v40)&& -[PFCloudKitStoreComparer ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:](self, "ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:", objc_msgSend(v24, "encryptedValues"), objc_msgSend(v25, "encryptedValues"), &v40);

  }
  else
  {
    v26 = 0;
  }

  _Block_object_dispose(buf, 8);
  if (v26)
  {
LABEL_17:
    LOBYTE(v27) = 1;
    return v27;
  }
  if (!v40)
  {
    v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
    v35 = __pflogFaultLog;
    v27 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v27)
      return v27;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1011;
    _os_log_fault_impl(&dword_18A253000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_24;
  }
  if (!a6)
  {
LABEL_24:
    LOBYTE(v27) = 0;
    return v27;
  }
  LOBYTE(v27) = 0;
  *a6 = v40;
  return v27;
}

id __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "encodedRecord");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "encodedRecord");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)ensureContentsOfRecordStorageMatchForStorage:(id)a3 andOtherStore:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  _BOOL4 v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(a4, "allKeys"));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v9)
  {
    v10 = v9;
    v31 = a5;
    v11 = *(_QWORD *)v33;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("_PFFakeCKDatabaseAncestorRecordKey")) & 1) == 0)
      {
        v14 = (__CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", v13);
        v15 = objc_msgSend(a4, "objectForKeyedSubscript:", v13);
        if (v14 != (__CFString *)v15)
        {
          v16 = (const __CFString *)v15;
          getCloudKitCKAssetClass[0]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            getCloudKitCKAssetClass[0]();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 && (-[__CFString isEqual:](v14, "isEqual:", v16) & 1) == 0)
              break;
          }
        }
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    v18 = *MEMORY[0x1E0CB28A8];
    v40[0] = CFSTR("mismatchField");
    v40[1] = CFSTR("value");
    v19 = CFSTR("nil");
    if (v14)
      v20 = v14;
    else
      v20 = CFSTR("nil");
    v41[0] = v13;
    v41[1] = v20;
    v40[2] = CFSTR("oValue");
    if (v16)
      v19 = v16;
    v41[2] = v19;
    v21 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v18, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3));

    if (v21)
    {
      if (v31)
      {
        LOBYTE(v17) = 0;
        *v31 = (id)v21;
        return v17;
      }
    }
    else
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v29 = __pflogFaultLog;
      v17 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v17)
        return v17;
      *(_DWORD *)buf = 136315394;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
      v38 = 1024;
      v39 = 1075;
      _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v17) = 0;
  }
  else
  {
LABEL_13:

    LOBYTE(v17) = 1;
  }
  return v17;
}

+ (id)trimExcessiveValuesForLog:(id)a3
{
  void *v4;
  uint64_t v5;
  id result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(a3, "length") >= 0x101)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = objc_msgSend(a3, "substringToIndex:", 255);
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(a3, "fileURL"))
      && (unint64_t)objc_msgSend(a3, "length") >= 0x101)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = objc_msgSend(a3, "subdataWithRange:", 0, 255);
LABEL_9:
      result = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("Trimmed: %@"), v5);
      if (result)
        return result;
    }
  }
  return a3;
}

- (PFCloudKitStoreComparisonCache)cache
{
  return self->_cache;
}

- (PFCloudKitArchivingUtilities)archivingUtilities
{
  return self->_archivingUtilities;
}

- (BOOL)onlyCompareSharedZones
{
  return self->_onlyCompareSharedZones;
}

- (void)setOnlyCompareSharedZones:(BOOL)a3
{
  self->_onlyCompareSharedZones = a3;
}

@end
