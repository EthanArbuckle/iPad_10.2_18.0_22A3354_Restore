@implementation FCRecordSource

- (BOOL)recognizesRecordID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[FCRecordSource recordIDPrefixes](self, "recordIDPrefixes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[FCRecordSource recognizesRecordID:inRecordIDPrefixes:](FCRecordSource, "recognizesRecordID:inRecordIDPrefixes:", v4, v5);

  return v6;
}

+ (BOOL)recognizesRecordID:(id)a3 inRecordIDPrefixes:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__FCRecordSource_recognizesRecordID_inRecordIDPrefixes___block_invoke;
  v8[3] = &unk_1E463C7A0;
  v9 = v5;
  v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "fc_containsObjectPassingTest:", v8);

  return (char)a4;
}

uint64_t __56__FCRecordSource_recognizesRecordID_inRecordIDPrefixes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
}

- (id)_ckRecordIDFromIdentifier:(void *)a1
{
  id v3;
  void *v4;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!objc_msgSend(v3, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier.length != 0");
      *(_DWORD *)buf = 136315906;
      v8 = "-[FCRecordSource _ckRecordIDFromIdentifier:]";
      v9 = 2080;
      v10 = "FCRecordSource.m";
      v11 = 1024;
      v12 = 1135;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    if (objc_msgSend(v4, "length"))
      a1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v4);
    else
      a1 = 0;
  }

  return a1;
}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke(uint64_t a1, void *a2)
{
  return -[FCRecordSource _ckRecordIDFromIdentifier:](*(void **)(a1 + 32), a2);
}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_2(uint64_t a1, void *a2)
{
  return -[FCRecordSource _identifierFromCKRecordID:](*(void **)(a1 + 32), a2);
}

- (id)recordIDPrefixes
{
  return &unk_1E470C600;
}

void __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 40);
        if (v8)
          v9 = *(void **)(v8 + 104);
        else
          v9 = 0;
        if (objc_msgSend(v9, "cacheContainsKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6), (_QWORD)v15))
        {
          v10 = *(_QWORD *)(a1 + 40);
          if (v10)
            v11 = *(void **)(v10 + 96);
          else
            v11 = 0;
          objc_msgSend(v11, "objectForKey:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCFaultableRecord recordBase]((uint64_t)v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NTPBRecordBase hasExpiredAssetURLs](v13))
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

        }
        ++v6;
      }
      while (v4 != v6);
      v14 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v4 = v14;
    }
    while (v14);
  }

}

- (id)resolveLocalizableExperimentalizableFieldforKey:(id)a3 inRecord:(id)a4 activeExperimentIDKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FCRecordSource localizedExperimentalizedKeysByOriginalKey](self, "localizedExperimentalizedKeysByOriginalKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_safeObjectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource experimentalizedKeysByOriginalKey](self, "experimentalizedKeysByOriginalKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_safeObjectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_safeObjectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource experimentalizedKeysByOriginalKey](self, "experimentalizedKeysByOriginalKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0DE7910];
  -[FCRecordSource activeTreatmentID](self, "activeTreatmentID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "nf_object:isEqualToObject:", v23, v25);

  if (v19)
    v27 = v19;
  else
    v27 = v20;
  if (v16)
    v28 = v16;
  else
    v28 = v20;
  if (v19)
    v28 = v19;
  if (v13)
    v28 = v13;
  if (v26)
    v29 = v28;
  else
    v29 = v27;
  v30 = v29;

  return v30;
}

- (NSDictionary)experimentalizedKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  return self->_experimentalizedKeysByOriginalKey;
}

- (NSDictionary)localizedExperimentalizedKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  return self->_localizedExperimentalizedKeysByOriginalKey;
}

- (NSString)activeTreatmentID
{
  return self->_activeTreatmentID;
}

- (NSDictionary)localizedKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  return self->_localizedKeysByOriginalKey;
}

- (void)_deriveDesiredKeysIfNeeded
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (!*(_QWORD *)(a1 + 16))
      -[FCRecordSource _deriveDesiredKeys]((_QWORD *)a1);
    os_unfair_lock_unlock(v2);
  }
}

void __51__FCRecordSource__faultableRecordsWithIdentifiers___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectsForKeys:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __30__FCRecordSource_saveRecords___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  FCHeldRecords *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[FCRecordSource _saveCKRecordsWithWriteLock:updateFetchDateForRecordIdentifiers:fetchContext:](*(id **)(a1 + 32), *(void **)(a1 + 40), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 96);
  else
    v4 = 0;
  objc_msgSend(v4, "objectsForKeys:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12, (_QWORD)v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFaultableRecord record]((uint64_t)v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  v15 = [FCHeldRecords alloc];
  v16 = *(_QWORD **)(a1 + 32);
  if (v16)
    v16 = (_QWORD *)v16[13];
  v17 = v16;
  objc_msgSend(v17, "holdTokensForKeys:", v2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:](v15, "initWithRecordsByID:interestTokensByID:", v6, v18);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

- (id)_fetchErrorForKey:(id)a1
{
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v2, "fetchErrorsByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_saveCKRecordsWithWriteLock:(void *)a3 updateFetchDateForRecordIdentifiers:(void *)a4 fetchContext:
{
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  _QWORD *v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v36 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v35 = v7;
    obj = v7;
    v38 = v9;
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v44)
    {
      v42 = *(_QWORD *)v46;
      v37 = v8;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v46 != v42)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend((id)objc_opt_class(), "identifierFromCKRecord:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a1[13], "cacheContainsKey:", v12))
          {
            objc_msgSend(a1[12], "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCFaultableRecord recordBase]((uint64_t)v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
              LODWORD(v8) = v8[2] == 1 && NSClassFromString(CFSTR("XCTest")) != 0;
            v20 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v14, "modificationDate", v35);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dateWithPBDate:", v21);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_opt_class(), "modificationDateFromCKRecord:", v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "fc_isLaterThan:withPrecision:", v19, 1);
            if (-[NTPBRecordBase needsAssetURLRefresh](v14) || (v23 & 1) != 0 || (_DWORD)v8)
            {
              -[FCRecordSource _recordFromCKRecord:](a1, v11);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKey:", v26, v12);
            }
            else
            {
              -[FCFaultableRecord record]((uint64_t)v13);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)objc_msgSend(v24, "copy");

              objc_msgSend(v25, "base");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setFetchDate:", v27);

              +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v25);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKey:", v28, v12);

            }
            v8 = v37;

            v9 = v38;
          }
          else
          {
            -[FCRecordSource _recordFromCKRecord:](a1, v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "base");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKey:", v15, v12);

            objc_msgSend(v40, "addObject:", v12);
            v16 = (void *)MEMORY[0x1E0CB37E8];
            v17 = objc_msgSend(v14, "cacheLifetimeHint");
            if (v17 == 2)
              v18 = 2;
            else
              v18 = v17 == 1;
            objc_msgSend(v16, "numberWithInteger:", v18, v35);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKey:", v19, v12);
          }

          objc_msgSend(v9, "addObject:", v12);
        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v44);
    }

    v29 = v36;
    if (objc_msgSend(v36, "count"))
      objc_msgSend(a1[12], "updateObjectsForKeys:withBlock:", v36, &__block_literal_global_86);
    v30 = a1[12];
    objc_msgSend(v43, "allValues");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObjects:forKeys:", v31, v32);

    objc_msgSend(a1[13], "didInsertKeysIntoCache:withLifetimeHints:", v40, v39);
    objc_msgSend(a1[13], "persistableHints");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_msgSend(a1[12], "setObject:forKey:", v33, CFSTR("cacheHints"));

    v7 = v35;
  }
  else
  {
    v38 = 0;
    v29 = v36;
  }

  return v38;
}

+ (id)identifierFromCKRecord:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_recordFromCKRecord:(void *)a1
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1A8580B64]();
    v5 = (objc_class *)MEMORY[0x1E0D627F8];
    v6 = v3;
    v7 = objc_alloc_init(v5);
    objc_msgSend((id)objc_opt_class(), "identifierFromCKRecord:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v8);

    objc_msgSend((id)objc_opt_class(), "changeTagFromCKRecord:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChangeTag:", v9);

    objc_msgSend((id)objc_opt_class(), "modificationDateFromCKRecord:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "pbDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModificationDate:", v11);

    objc_msgSend(v7, "setRecordType:", objc_msgSend(a1, "pbRecordType"));
    objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFetchDate:", v12);
    objc_msgSend(v7, "setAssetURLsDate:", v12);

    objc_msgSend(a1, "recordFromCKRecord:base:", v6, v7);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
  }

  return a1;
}

+ (id)changeTagFromCKRecord:(id)a3
{
  return (id)objc_msgSend(a3, "recordChangeTag");
}

+ (id)modificationDateFromCKRecord:(id)a3
{
  return (id)objc_msgSend(a3, "modificationDate");
}

void __76__FCRecordSource_fetchCoordinator_filterKeysToFetch_isFirstAttempt_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 40);
        if (v8)
          v9 = *(void **)(v8 + 104);
        else
          v9 = 0;
        if (objc_msgSend(v9, "cacheContainsKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6)))
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
        objc_msgSend(*(id *)(a1 + 40), "fetchErrorsByKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if (objc_msgSend(v11, "fc_isCKUnknownItemError"))
            objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
          if (!*(_BYTE *)(a1 + 48))
            objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
        }

        ++v6;
      }
      while (v4 != v6);
      v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v4 = v12;
    }
    while (v12);
  }

}

- (FCThreadSafeMutableDictionary)fetchErrorsByKey
{
  return self->_fetchErrorsByKey;
}

- (void)fetchCoordinator:(id)a3 addFetchOperation:(id)a4 context:(id)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB3828];
  v6 = a4;
  objc_msgSend(v5, "fc_sharedConcurrentQueue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v6);

}

- (id)fetchOperationForRecordsWithIDs:(id)a3
{
  id v4;
  FCRecordsFetchOperation *v5;
  FCRecordSource *v6;
  id v7;
  FCRecordSource *v8;
  uint64_t v9;
  NSArray *recordIdentifiers;
  objc_super v12;

  v4 = a3;
  v5 = [FCRecordsFetchOperation alloc];
  v6 = self;
  v7 = v4;
  if (v5)
  {
    v12.receiver = v5;
    v12.super_class = (Class)FCRecordsFetchOperation;
    v8 = -[FCRecordSource init](&v12, sel_init);
    v5 = (FCRecordsFetchOperation *)v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8[2]._experimentalizableFieldsPostfix, self);
      v9 = objc_msgSend(v7, "copy");
      recordIdentifiers = v5->_recordIdentifiers;
      v5->_recordIdentifiers = (NSArray *)v9;

    }
  }

  return v5;
}

- (BOOL)isRecordStale:(id)a3 withCachePolicy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  char v11;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "cachePolicy"))
  {
    objc_msgSend((id)objc_opt_class(), "defaultCachePolicy");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  switch(objc_msgSend(v7, "cachePolicy"))
  {
    case 0:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record sources must provide a real cache policy as the default fallback"));
        v14 = 136315906;
        v15 = "-[FCRecordSource isRecordStale:withCachePolicy:]";
        v16 = 2080;
        v17 = "FCRecordSource.m";
        v18 = 1024;
        v19 = 692;
        v20 = 2114;
        v21 = v13;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

      }
      goto LABEL_9;
    case 1:
      v11 = 1;
      break;
    case 2:
    case 3:
      objc_msgSend(v7, "maximumCachedAge");
      if (v9 != 0.0)
        goto LABEL_6;
      goto LABEL_9;
    case 4:
    case 5:
LABEL_6:
      objc_msgSend(v5, "base");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "maximumCachedAge");
      v11 = objc_msgSend(v10, "fc_isCachedAgeGreaterThan:");

      break;
    default:
LABEL_9:
      v11 = 0;
      break;
  }

  return v11;
}

+ (id)defaultCachePolicy
{
  if (qword_1ED0F7BB8 != -1)
    dispatch_once(&qword_1ED0F7BB8, &__block_literal_global_13);
  return (id)_MergedGlobals_31;
}

- (id)keyValueRepresentationOfRecord:(id)a3
{
  return a3;
}

- (id)cachedRecordsWithIDs:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  void *v6;
  void *v7;
  FCCacheCoordinator *v8;
  id v9;
  void *v10;
  FCHeldRecords *v11;
  _QWORD v13[4];
  id v14;
  FCRecordSource *v15;
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    -[FCCacheCoordinator holdTokensForKeys:](cacheCoordinator, "holdTokensForKeys:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v8 = self->_cacheCoordinator;
    else
      v8 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_2;
    v13[3] = &unk_1E463B228;
    v14 = v4;
    v15 = self;
    v16 = v7;
    v9 = v7;
    -[FCCacheCoordinator performCacheRead:](v8, "performCacheRead:", v13);
    objc_msgSend(v9, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_36, &__block_literal_global_38_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:]([FCHeldRecords alloc], "initWithRecordsByID:interestTokensByID:", v10, v6);

  }
  else
  {
    v11 = objc_alloc_init(FCHeldRecords);
  }

  return v11;
}

id __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return -[FCFaultableRecord record](a2);
}

id __39__FCRecordSource_cachedRecordsWithIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  -[FCFaultableRecord recordBase](a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_localizedKeysByOriginalKeyForContentStoreFrontID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[FCRecordSource localizableKeys](self, "localizableKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          FCCKLocalizedRecordKey(v11, (uint64_t)v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v8);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[FCRecordSource alwaysLocalizedKeys](self, "alwaysLocalizedKeys", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
          FCCKLocalizedRecordKey(v18, (uint64_t)v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v19, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v15);
    }

  }
  return v5;
}

- (NSArray)localizableKeys
{
  return 0;
}

- (NSArray)alwaysLocalizedKeys
{
  return 0;
}

- (void)_deriveDesiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;

  if (a1)
  {
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentStoreFrontID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryLanguageCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "experimentalizableFieldsPostfix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v3;
    v7 = (void *)MEMORY[0x1E0C99E20];
    v8 = v5;
    v9 = v6;
    objc_msgSend(a1, "nonLocalizableKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "localizableKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    objc_msgSend(a1, "_localizedKeysByOriginalKeyForContentStoreFrontID:", v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v14);

    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v15, "isContentStoreFrontSupported");

    if ((v14 & 1) == 0)
    {
      objc_msgSend(a1, "alwaysLocalizedKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v16);

    }
    objc_msgSend(a1, "experimentalizableKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v17);

    objc_msgSend(a1, "_experimentalizedKeysByOriginalKeyForExperimentPostfix:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v19);

    objc_msgSend(a1, "localizableExperimentalizableKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v20);

    objc_msgSend(a1, "_localizedExperimentalizedKeysByOriginalKeyForContentStoreFrontID:experimentPostfix:", v36, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v22);

    objc_msgSend(a1, "localizableLanguageSpecificKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v23);

    -[FCRecordSource _localizedLanguageSpecificKeysByOriginalKeyForContentStoreFrontID:languageCode:](a1, v36, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v25);

    objc_msgSend(v11, "allObjects");
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)a1[2];
    a1[2] = v26;

    objc_msgSend(a1, "_localizedKeysByOriginalKeyForContentStoreFrontID:", v36);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)a1[3];
    a1[3] = v28;

    objc_msgSend(a1, "_experimentalizedKeysByOriginalKeyForExperimentPostfix:", v9);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)a1[4];
    a1[4] = v30;

    objc_msgSend(a1, "_localizedExperimentalizedKeysByOriginalKeyForContentStoreFrontID:experimentPostfix:", v36, v9);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)a1[5];
    a1[5] = v32;

    -[FCRecordSource _localizedLanguageSpecificKeysByOriginalKeyForContentStoreFrontID:languageCode:](a1, v36, v8);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)a1[6];
    a1[6] = v34;

  }
}

- (id)_localizedLanguageSpecificKeysByOriginalKeyForContentStoreFrontID:(void *)a3 languageCode:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(a1, "localizableLanguageSpecificKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          FCCKLocalizedLanguageSpecificRecordKey(v13, (uint64_t)v5, (uint64_t)v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v14, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  return v7;
}

- (NSArray)localizableLanguageSpecificKeys
{
  return 0;
}

- (id)_localizedExperimentalizedKeysByOriginalKeyForContentStoreFrontID:(id)a3 experimentPostfix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[FCRecordSource localizableExperimentalizableKeys](self, "localizableExperimentalizableKeys", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          FCCKLocalizedExperimentizedRecordKey(v14, (uint64_t)v6, (uint64_t)v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v15, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (id)_experimentalizedKeysByOriginalKeyForExperimentPostfix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[FCRecordSource experimentalizableKeys](self, "experimentalizableKeys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          FCCKExperimentizedRecordKey(v11, (uint64_t)v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (NSString)experimentalizableFieldsPostfix
{
  return self->_experimentalizableFieldsPostfix;
}

- (NSArray)localizableExperimentalizableKeys
{
  return 0;
}

- (NSArray)experimentalizableKeys
{
  return 0;
}

+ (BOOL)supportsDeletions
{
  return 0;
}

id __95__FCRecordSource__saveCKRecordsWithWriteLock_updateFetchDateForRecordIdentifiers_fetchContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FCFaultableRecord record](a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchDate:", v5);

  +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  if (self)
    self = (FCRecordSource *)self->_localStore;
  return -[FCRecordSource storeSize](self, "storeSize", a3);
}

- (id)interestTokenForRecordIDs:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  void *v6;

  v4 = a3;
  -[FCRecordSource _prepareForUse]((uint64_t)self);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  -[FCCacheCoordinator holdTokenForKeys:](cacheCoordinator, "holdTokenForKeys:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_prepareForUse
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  FCKeyValueStoreClassRegistry *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  FCKeyValueStore *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 56), "lock");
    if (!*(_QWORD *)(v1 + 96))
    {
      v3 = (void *)MEMORY[0x1A8580B64](v2);
      v4 = objc_alloc_init(FCKeyValueStoreClassRegistry);
      -[FCKeyValueStoreClassRegistry registerClass:](v4, "registerClass:", objc_opt_class());
      -[FCKeyValueStoreClassRegistry registerClass:](v4, "registerClass:", objc_opt_class());
      +[FCKeyValueStoreSavePolicy defaultPolicy](FCKeyValueStoreSavePolicy, "defaultPolicy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(id *)(v1 + 80);
      if (v6)
      {
        v7 = *(_QWORD *)(v1 + 88);

        if (v7)
        {
          v8 = *(_QWORD *)(v1 + 88);
          v9 = *(id *)(v1 + 80);
          +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:backgroundTaskable:](FCKeyValueStoreSavePolicy, "appBackgroundPolicyWithActivityMonitor:backgroundTaskable:", v9, v8);
          v10 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v10;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.newsd"));

      if (v13)
        v14 = 4;
      else
        v14 = 0;
      v15 = [FCKeyValueStore alloc];
      objc_msgSend((id)v1, "storeFilename");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(id *)(v1 + 72);
      v18 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:savePolicy:](v15, "initWithName:directory:version:options:classRegistry:migrator:savePolicy:", v16, v17, objc_msgSend((id)v1, "storeVersion"), v14, v4, 0, v5);
      v19 = *(void **)(v1 + 96);
      *(_QWORD *)(v1 + 96) = v18;

      objc_msgSend(*(id *)(v1 + 96), "setShouldExportJSONSidecar:", 1);
      objc_msgSend(*(id *)(v1 + 96), "setJSONEncodingHandlersWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", &__block_literal_global_79, 0, 0, 0);
      objc_msgSend(*(id *)(v1 + 96), "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fc_arrayByRemovingObject:", CFSTR("cacheHints"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = *(void **)(v1 + 104);
      objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", CFSTR("cacheHints"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setupWithInitialKeys:persistedHints:", v21, v23);

      objc_autoreleasePoolPop(v3);
    }
    return objc_msgSend(*(id *)(v1 + 56), "unlock");
  }
  return result;
}

- (FCRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8
{
  id v15;
  id v16;
  id v17;
  FCRecordSource *v18;
  FCRecordSource *v19;
  FCThreadSafeMutableDictionary *v20;
  FCThreadSafeMutableDictionary *fetchErrorsByKey;
  NFUnfairLock *v22;
  NFUnfairLock *initializationLock;
  FCCacheCoordinator *v24;
  FCCacheCoordinator *cacheCoordinator;
  FCFetchCoordinator *v26;
  FCFetchCoordinator *fetchCoordinator;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v17 = a8;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentDatabase != nil");
    *(_DWORD *)buf = 136315906;
    v36 = "-[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentaliz"
          "ableFieldsPostfix:activeTreatmentID:]";
    v37 = 2080;
    v38 = "FCRecordSource.m";
    v39 = 1024;
    v40 = 130;
    v41 = 2114;
    v42 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v36 = "-[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentaliz"
          "ableFieldsPostfix:activeTreatmentID:]";
    v37 = 2080;
    v38 = "FCRecordSource.m";
    v39 = 1024;
    v40 = 131;
    v41 = 2114;
    v42 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v34.receiver = self;
  v34.super_class = (Class)FCRecordSource;
  v18 = -[FCRecordSource init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentDatabase, a3);
    objc_storeStrong((id *)&v19->_contentDirectory, a4);
    objc_storeStrong((id *)&v19->_appActivityMonitor, a5);
    objc_storeStrong((id *)&v19->_backgroundTaskable, a6);
    objc_storeStrong((id *)&v19->_experimentalizableFieldsPostfix, a7);
    objc_storeStrong((id *)&v19->_activeTreatmentID, a8);
    v20 = objc_alloc_init(FCThreadSafeMutableDictionary);
    fetchErrorsByKey = v19->_fetchErrorsByKey;
    v19->_fetchErrorsByKey = v20;

    v22 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E0D60B18]);
    initializationLock = v19->_initializationLock;
    v19->_initializationLock = v22;

    v24 = objc_alloc_init(FCCacheCoordinator);
    cacheCoordinator = v19->_cacheCoordinator;
    v19->_cacheCoordinator = v24;

    -[FCCacheCoordinator setDelegate:](v19->_cacheCoordinator, "setDelegate:", v19);
    v26 = objc_alloc_init(FCFetchCoordinator);
    fetchCoordinator = v19->_fetchCoordinator;
    v19->_fetchCoordinator = v26;

    -[FCFetchCoordinator setDelegate:](v19->_fetchCoordinator, "setDelegate:", v19);
    v19->_derivedKeysLock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

- (FCRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6
{
  return -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:](self, "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:", a3, a4, a5, a6, 0, 0);
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  FCCacheCoordinatorFlushPolicy *v14;
  FCCacheCoordinator *cacheCoordinator;
  int v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("zero-interest");
  if (a3 == 1)
    v5 = CFSTR("low");
  if (a3 == 2)
    v5 = CFSTR("high");
  v6 = v5;
  v7 = (void *)FCRecordSourceLog;
  if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[FCRecordSource recordType](self, "recordType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v9;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "will enable flushing %{public}@ records with %{public}@ threshold", (uint8_t *)&v16, 0x16u);

  }
  if (a3 == 2)
  {
    v13 = -[FCRecordSource highThresholdDataSizeLimit](self, "highThresholdDataSizeLimit");
  }
  else
  {
    if (a3 != 1)
    {
      v10 = a3 == 0;
      v11 = 0;
      v12 = v10;
      goto LABEL_15;
    }
    v13 = -[FCRecordSource lowThresholdDataSizeLimit](self, "lowThresholdDataSizeLimit");
  }
  v11 = v13;
  v12 = 0;
LABEL_15:
  v14 = -[FCCacheCoordinatorFlushPolicy initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:]([FCCacheCoordinatorFlushPolicy alloc], "initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:", (unint64_t)((double)v11 * 0.7), v11, v12);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  -[FCCacheCoordinator enableFlushingWithPolicy:](cacheCoordinator, "enableFlushingWithPolicy:", v14);

}

- (void)fetchCoordinator:(id)a3 filterKeysToFetch:(id)a4 isFirstAttempt:(BOOL)a5 context:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  FCCacheCoordinator *cacheCoordinator;
  void *v35;
  id v36;
  uint64_t v37;
  double *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  FCRecordSource *v45;
  BOOL v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v11 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v11, (uint64_t)v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12 && *(_BYTE *)(v12 + 8))
  {
    v36 = v10;
    v38 = (double *)v12;
    if ((*(_QWORD *)(v12 + 16) | 4) == 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't be filtering for this cache policy"));
      *(_DWORD *)buf = 136315906;
      v49 = "-[FCRecordSource fetchCoordinator:filterKeysToFetch:isFirstAttempt:context:]";
      v50 = 2080;
      v51 = "FCRecordSource.m";
      v52 = 1024;
      v53 = 849;
      v54 = 2114;
      v55 = v35;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v9, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordSource _faultableRecordsWithIdentifiers:]((id *)&self->super.isa, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      v37 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCFaultableRecord recordBase]((uint64_t)v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NTPBRecordBase needsAssetURLRefresh](v23))
          {
            objc_msgSend(v23, "fetchDate");
            v24 = objc_claimAutoreleasedReturnValue();
            if (!v24)
              goto LABEL_14;
            v25 = (void *)v24;
            v26 = v9;
            v27 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v23, "fetchDate");
            v28 = v18;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "dateWithPBDate:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "fc_timeIntervalUntilNow");
            v32 = v31;
            v33 = v38[3];

            v9 = v26;
            v19 = v37;

            v18 = v28;
            if (v32 < v33)
LABEL_14:
              objc_msgSend(v9, "removeObject:", v21);
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v18);
    }

    v10 = v36;
    v13 = v38;
  }
  else
  {
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __76__FCRecordSource_fetchCoordinator_filterKeysToFetch_isFirstAttempt_context___block_invoke;
    v43[3] = &unk_1E463B200;
    v44 = v9;
    v45 = self;
    v46 = a5;
    -[FCCacheCoordinator performCacheRead:](cacheCoordinator, "performCacheRead:", v43);
    v16 = v44;
  }

}

- (id)fetchCoordinator:(id)a3 fetchOperationForKeys:(id)a4 context:(id)a5 qualityOfService:(int64_t)a6 relativePriority:(int64_t)a7
{
  id v10;
  id v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  FCCKContentBatchedRefreshRecordsOperation *v31;
  _BYTE *v32;
  FCCKContentDatabase *contentDatabase;
  void *v34;
  const char *v35;
  SEL v36;
  void *v37;
  SEL v38;
  void *v39;
  const char *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  id v49;
  const char *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  FCCKContentBatchedFetchRecordsOperation *v56;
  FCCKContentDatabase *v57;
  const char *v58;
  void *v59;
  SEL v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  void *v71;
  int64_t v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  _QWORD newValue[5];
  id v79;
  id v80;
  void *v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  _QWORD v88[5];
  id v89;
  void *v90;
  uint64_t v91;
  _QWORD v92[5];
  uint8_t v93[128];
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13 && *(_BYTE *)(v13 + 8))
  {
    v73 = a6;
    v74 = (void *)v13;
    v75 = v11;
    objc_msgSend(v10, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_63;
    v87[3] = &unk_1E463C7F0;
    v87[4] = self;
    objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", v87);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = v10;
    objc_msgSend(v10, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordSource _faultableRecordsWithIdentifiers:]((id *)&self->super.isa, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v84 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCFaultableRecord recordBase]((uint64_t)v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[NTPBRecordBase needsAssetURLRefresh](v26);

          if (!v27)
          {
            -[FCFaultableRecord recordBase]((uint64_t)v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "changeTag");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              -[FCRecordSource _ckRecordIDFromIdentifier:](self, v24);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v29, v30);

            }
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
      }
      while (v21);
    }

    v31 = objc_alloc_init(FCCKContentBatchedRefreshRecordsOperation);
    v32 = v31;
    if (self)
      contentDatabase = self->_contentDatabase;
    else
      contentDatabase = 0;
    v34 = v77;
    -[FCCKContentBatchedRefreshRecordsOperation setDatabase:]((uint64_t)v31, contentDatabase);
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v35, v77, 384);
      objc_setProperty_nonatomic_copy(v32, v36, v18, 392);
      -[FCRecordSource desiredKeys](self, "desiredKeys");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_nonatomic_copy(v32, v38, v37, 400);
    }
    else
    {
      -[FCRecordSource desiredKeys](self, "desiredKeys");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v76;
    v14 = v74;

    objc_msgSend(v32, "setQualityOfService:", v73);
    if (objc_msgSend((id)objc_opt_class(), "supportsDeletions"))
    {
      if (v32)
        v32[368] = 1;
      objc_msgSend((id)objc_opt_class(), "canaryRecordName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v39);
        if (v32)
          objc_setProperty_nonatomic_copy(v32, v40, v41, 408);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v43 = v42;
    objc_msgSend(v32, "operationID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      v46 = v45;
      v47 = objc_msgSend(v77, "count");
      -[FCRecordSource recordType](self, "recordType");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v95 = v47;
      v96 = 2114;
      v97 = v48;
      v98 = 2114;
      v99 = v44;
      _os_log_impl(&dword_1A1B90000, v46, OS_LOG_TYPE_INFO, "will refresh %lu %{public}@ records with operation ID %{public}@", buf, 0x20u);

      v34 = v77;
    }
    newValue[0] = MEMORY[0x1E0C809B0];
    newValue[1] = 3221225472;
    newValue[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_67;
    newValue[3] = &unk_1E463C868;
    newValue[4] = self;
    v79 = v74;
    v80 = v44;
    v82 = v43;
    v81 = v34;
    v49 = v34;
    v51 = v44;
    v52 = v49;
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v50, newValue, 416);
      v52 = v81;
    }

    v11 = v75;
  }
  else
  {
    objc_msgSend(v10, "allObjects");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = MEMORY[0x1E0C809B0];
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke;
    v92[3] = &unk_1E463C9B8;
    v92[4] = self;
    objc_msgSend(v53, "fc_arrayByTransformingWithBlock:", v92);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = objc_alloc_init(FCCKContentBatchedFetchRecordsOperation);
    v32 = v56;
    if (self)
      v57 = self->_contentDatabase;
    else
      v57 = 0;
    -[FCCKContentBatchedFetchRecordsOperation setDatabase:]((uint64_t)v56, v57);
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v58, v55, 376);
      -[FCRecordSource desiredKeys](self, "desiredKeys");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_nonatomic_copy(v32, v60, v59, 384);
    }
    else
    {
      -[FCRecordSource desiredKeys](self, "desiredKeys");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v32, "setQualityOfService:", a6);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v62 = v61;
    objc_msgSend(v32, "operationID");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      v65 = v64;
      v66 = v11;
      v67 = objc_msgSend(v55, "count");
      -[FCRecordSource recordType](self, "recordType");
      v68 = v14;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v95 = v67;
      v11 = v66;
      v96 = 2114;
      v97 = v69;
      v98 = 2112;
      v99 = v63;
      _os_log_impl(&dword_1A1B90000, v65, OS_LOG_TYPE_INFO, "will fetch %lu %{public}@ records with operation ID %@", buf, 0x20u);

      v14 = v68;
      v54 = MEMORY[0x1E0C809B0];

    }
    v88[0] = v54;
    v88[1] = 3221225472;
    v88[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_61;
    v88[3] = &unk_1E463C7C8;
    v88[4] = self;
    v89 = v63;
    v91 = v62;
    v90 = v55;
    v18 = v55;
    v19 = v63;
    v71 = v18;
    if (v32)
    {
      objc_setProperty_nonatomic_copy(v32, v70, v88, 400);
      v71 = v90;
    }

  }
  return v32;
}

- (NSDictionary)localizedLanguageSpecificKeysByOriginalKey
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  return self->_localizedLanguageSpecificKeysByOriginalKey;
}

- (NSArray)desiredKeys
{
  -[FCRecordSource _deriveDesiredKeysIfNeeded]((uint64_t)self);
  return self->_desiredKeys;
}

- (id)_faultableRecordsWithIdentifiers:(id *)a1
{
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__9;
    v13 = __Block_byref_object_dispose__9;
    v14 = 0;
    v4 = a1[13];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__FCRecordSource__faultableRecordsWithIdentifiers___block_invoke;
    v6[3] = &unk_1E463AD58;
    v8 = &v9;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v4, "performCacheRead:", v6);

    a1 = (id *)(id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  return a1;
}

- (id)_identifierFromCKRecordID:(void *)a1
{
  id v3;
  void *v4;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "ckRrecordID != nil");
      *(_DWORD *)buf = 136315906;
      v8 = "-[FCRecordSource _identifierFromCKRecordID:]";
      v9 = 2080;
      v10 = "FCRecordSource.m";
      v11 = 1024;
      v12 = 1141;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v4, "recordName");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)saveRecords:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  if (objc_msgSend(v4, "count"))
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v6 = cacheCoordinator;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__FCRecordSource_saveRecords___block_invoke;
    v9[3] = &unk_1E463AFC0;
    v9[4] = self;
    v10 = v4;
    v11 = &v12;
    -[FCCacheCoordinator performCacheWrite:](v6, "performCacheWrite:", v9);

  }
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __36__FCRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v0;

  objc_msgSend((id)_MergedGlobals_31, "setCachePolicy:", 4);
  return objc_msgSend((id)_MergedGlobals_31, "setMaximumCachedAge:", 1.79769313e308);
}

void __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_4(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  id v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count") || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = *(id **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[FCRecordSource _saveCKRecordsWithWriteLock:updateFetchDateForRecordIdentifiers:fetchContext:](v2, v3, *(void **)(a1 + 40), *(void **)(a1 + 56));

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v5 = *(id **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 64));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = -[FCRecordSource _deleteRecordsWithWriteLockWithIDs:](v5, v7);

  }
}

- (FCRecordSource)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRecordSource init]";
    v9 = 2080;
    v10 = "FCRecordSource.m";
    v11 = 1024;
    v12 = 107;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCRecordSource init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)recordType
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRecordSource recordType]";
    v9 = 2080;
    v10 = "FCRecordSource.m";
    v11 = 1024;
    v12 = 160;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCRecordSource recordType]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (int)pbRecordType
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRecordSource pbRecordType]";
    v9 = 2080;
    v10 = "FCRecordSource.m";
    v11 = 1024;
    v12 = 166;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCRecordSource pbRecordType]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)storeFilename
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRecordSource storeFilename]";
    v9 = 2080;
    v10 = "FCRecordSource.m";
    v11 = 1024;
    v12 = 172;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCRecordSource storeFilename]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (unint64_t)storeVersion
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRecordSource storeVersion]";
    v9 = 2080;
    v10 = "FCRecordSource.m";
    v11 = 1024;
    v12 = 178;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCRecordSource storeVersion]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRecordSource lowThresholdDataSizeLimit]";
    v9 = 2080;
    v10 = "FCRecordSource.m";
    v11 = 1024;
    v12 = 184;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCRecordSource lowThresholdDataSizeLimit]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (unint64_t)highThresholdDataSizeLimit
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRecordSource highThresholdDataSizeLimit]";
    v9 = 2080;
    v10 = "FCRecordSource.m";
    v11 = 1024;
    v12 = 190;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCRecordSource highThresholdDataSizeLimit]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCRecordSource recordFromCKRecord:base:]";
    v14 = 2080;
    v15 = "FCRecordSource.m";
    v16 = 1024;
    v17 = 201;
    v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCRecordSource recordFromCKRecord:base:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (id)canaryRecordName
{
  return 0;
}

- (NSArray)nonLocalizableKeys
{
  return 0;
}

- (id)valueFromCKRecord:(id)a3 baseKey:(id)a4 localizedKeys:(id)a5 localizedLanguageSpecificKeys:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "ckRecord");
    *(_DWORD *)buf = 136315906;
    v28 = "-[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:]";
    v29 = 2080;
    v30 = "FCRecordSource.m";
    v31 = 1024;
    v32 = 308;
    v33 = 2114;
    v34 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "baseKey");
    *(_DWORD *)buf = 136315906;
    v28 = "-[FCRecordSource valueFromCKRecord:baseKey:localizedKeys:localizedLanguageSpecificKeys:]";
    v29 = 2080;
    v30 = "FCRecordSource.m";
    v31 = 1024;
    v32 = 309;
    v33 = 2114;
    v34 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_9;
  v14 = (void *)v13;
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = v12;
  }
  else
  {
LABEL_9:
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_13;
    v19 = (void *)v18;
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
LABEL_13:
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v17 = v11;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v23;
}

- (id)fetchOperationForRecordsWithIDs:(id)a3 ignoreCacheForRecordIDs:(id)a4
{
  id v6;
  id v7;
  FCRecordsFetchOperation *v8;
  FCRecordSource *v9;
  id v10;
  id v11;
  FCRecordSource *v12;
  uint64_t v13;
  NSArray *recordIdentifiers;
  uint64_t v15;
  NSArray *ignoreCacheForRecordIDs;
  objc_super v18;

  v6 = a4;
  v7 = a3;
  v8 = [FCRecordsFetchOperation alloc];
  v9 = self;
  v10 = v7;
  v11 = v6;
  if (v8)
  {
    v18.receiver = v8;
    v18.super_class = (Class)FCRecordsFetchOperation;
    v12 = -[FCRecordSource init](&v18, sel_init);
    v8 = (FCRecordsFetchOperation *)v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12[2]._experimentalizableFieldsPostfix, self);
      v13 = objc_msgSend(v10, "copy");
      recordIdentifiers = v8->_recordIdentifiers;
      v8->_recordIdentifiers = (NSArray *)v13;

      v15 = objc_msgSend(v11, "copy");
      ignoreCacheForRecordIDs = v8->_ignoreCacheForRecordIDs;
      v8->_ignoreCacheForRecordIDs = (NSArray *)v15;

    }
  }

  return v8;
}

- (id)cachedRecordWithID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v11 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource cachedRecordsWithIDs:](self, "cachedRecordsWithIDs:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)savePBRecords:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FCRecordSource *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  if (objc_msgSend(v4, "count"))
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v6 = cacheCoordinator;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__FCRecordSource_savePBRecords___block_invoke;
    v9[3] = &unk_1E463AFC0;
    v10 = v4;
    v11 = self;
    v12 = &v13;
    -[FCCacheCoordinator performCacheWrite:](v6, "performCacheWrite:", v9);

  }
  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __32__FCRecordSource_savePBRecords___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  v48 = a1;
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v52;
    v45 = *(_QWORD *)v52;
    v46 = v2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v52 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v6);
        objc_msgSend(v7, "base", v45, v46);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = *(_QWORD *)(a1 + 40);
          if (v10)
            v11 = *(void **)(v10 + 104);
          else
            v11 = 0;
          if (objc_msgSend(v11, "cacheContainsKey:", v9))
          {
            v12 = *(_QWORD *)(a1 + 40);
            if (v12)
              v13 = *(void **)(v12 + 96);
            else
              v13 = 0;
            objc_msgSend(v13, "objectForKey:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCFaultableRecord recordBase]((uint64_t)v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v15, "modificationDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "dateWithPBDate:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v8, "modificationDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "dateWithPBDate:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v21, "fc_isLaterThan:withPrecision:", v18, 1))
            {
              +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v7);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKey:", v22, v9);

            }
            v5 = v45;
            v2 = v46;
            a1 = v48;
          }
          else
          {
            +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v7);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setObject:forKey:", v23, v9);

            v24 = (void *)MEMORY[0x1E0CB37E8];
            v25 = objc_msgSend(v8, "cacheLifetimeHint");
            if (v25 == 2)
              v26 = 2;
            else
              v26 = v25 == 1;
            objc_msgSend(v24, "numberWithInteger:", v26);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setObject:forKey:", v14, v9);
          }

          objc_msgSend(v2, "addObject:", v9);
        }

        ++v6;
      }
      while (v4 != v6);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      v4 = v27;
    }
    while (v27);
  }

  v28 = *(_QWORD **)(a1 + 40);
  if (v28)
    v28 = (_QWORD *)v28[12];
  v29 = v28;
  objc_msgSend(v49, "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "allKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObjects:forKeys:", v30, v31);

  v32 = *(_QWORD **)(v48 + 40);
  if (v32)
    v32 = (_QWORD *)v32[13];
  v33 = v32;
  objc_msgSend(v49, "allKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "didInsertKeysIntoCache:withLifetimeHints:", v34, v47);

  v35 = *(_QWORD *)(v48 + 40);
  if (v35)
    v36 = *(void **)(v35 + 104);
  else
    v36 = 0;
  objc_msgSend(v36, "persistableHints");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = *(_QWORD *)(v48 + 40);
    if (v38)
      v39 = *(void **)(v38 + 96);
    else
      v39 = 0;
    objc_msgSend(v39, "setObject:forKey:", v37, CFSTR("cacheHints"));
  }
  v40 = *(_QWORD **)(v48 + 40);
  if (v40)
    v40 = (_QWORD *)v40[13];
  v41 = v40;
  objc_msgSend(v41, "holdTokenForKeys:", v2);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *(_QWORD *)(*(_QWORD *)(v48 + 48) + 8);
  v44 = *(void **)(v43 + 40);
  *(_QWORD *)(v43 + 40) = v42;

}

- (id)convertRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FCHeldRecords *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1A8580B64](v8);
        objc_msgSend((id)objc_opt_class(), "identifierFromCKRecord:", v12, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCRecordSource _recordFromCKRecord:](self, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v15, v14);
        objc_msgSend(v6, "setObject:forKey:", v14, v14);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v8;
    }
    while (v8);
  }

  v16 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:]([FCHeldRecords alloc], "initWithRecordsByID:interestTokensByID:", v5, v6);
  return v16;
}

- (id)deleteRecordsWithIDs:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  FCCacheCoordinator *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  __int128 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "supportsDeletions") & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should only attempt to delete when the record source supports deletions"));
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCRecordSource deleteRecordsWithIDs:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCRecordSource.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v16) = 648;
    WORD2(v16) = 2114;
    *(_QWORD *)((char *)&v16 + 6) = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v16 = __Block_byref_object_copy__9;
  *((_QWORD *)&v16 + 1) = __Block_byref_object_dispose__9;
  v17 = 0;
  if (objc_msgSend(v4, "count"))
  {
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v6 = cacheCoordinator;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__FCRecordSource_deleteRecordsWithIDs___block_invoke;
    v12[3] = &unk_1E463AD58;
    v14 = buf;
    v12[4] = self;
    v13 = v4;
    -[FCCacheCoordinator performCacheWrite:](v6, "performCacheWrite:", v12);

  }
  else
  {
    v7 = objc_opt_new();
    v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v7;

  }
  v9 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v9;
}

void __39__FCRecordSource_deleteRecordsWithIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[FCRecordSource _deleteRecordsWithWriteLockWithIDs:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_deleteRecordsWithWriteLockWithIDs:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  FCHeldRecords *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = v3;
  if (!a1)
    goto LABEL_15;
  v4 = v3;
  if ((objc_msgSend((id)objc_opt_class(), "supportsDeletions") & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should only attempt to delete when the record source supports deletions"));
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCRecordSource _deleteRecordsWithWriteLockWithIDs:]";
    v32 = 2080;
    v33 = "FCRecordSource.m";
    v34 = 1024;
    v35 = 1247;
    v36 = 2114;
    v37 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v4)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordIDs != nil", v24);
        *(_DWORD *)buf = 136315906;
        v31 = "-[FCRecordSource _deleteRecordsWithWriteLockWithIDs:]";
        v32 = 2080;
        v33 = "FCRecordSource.m";
        v34 = 1024;
        v35 = 1248;
        v36 = 2114;
        v37 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v4)
  {
    goto LABEL_5;
  }
  v5 = a1[12];
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsForKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[12], "updateObjectsForKeys:withBlock:", v8, &__block_literal_global_88);
  objc_msgSend(a1[12], "objectsForKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFaultableRecord record]((uint64_t)v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v18, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  v19 = [FCHeldRecords alloc];
  objc_msgSend(a1[13], "holdTokensForKeys:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  a1 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:](v19, "initWithRecordsByID:interestTokensByID:", v10, v20);

LABEL_15:
  return a1;
}

- (void)updateFetchDateForRecordIDs:(id)a3
{
  id v4;
  FCCacheCoordinator *cacheCoordinator;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self);
    if (self)
      cacheCoordinator = self->_cacheCoordinator;
    else
      cacheCoordinator = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__FCRecordSource_updateFetchDateForRecordIDs___block_invoke;
    v6[3] = &unk_1E463AD10;
    v6[4] = self;
    v7 = v4;
    -[FCCacheCoordinator performCacheWrite:](cacheCoordinator, "performCacheWrite:", v6);

  }
}

id __46__FCRecordSource_updateFetchDateForRecordIDs___block_invoke(uint64_t a1)
{
  return -[FCRecordSource _saveCKRecordsWithWriteLock:updateFetchDateForRecordIdentifiers:fetchContext:](*(id **)(a1 + 32), 0, *(void **)(a1 + 40), 0);
}

- (int64_t)storageSize
{
  FCKeyValueStore *localStore;

  -[FCRecordSource _prepareForUse]((uint64_t)self);
  if (self)
    localStore = self->_localStore;
  else
    localStore = 0;
  return -[FCKeyValueStore storeSize](localStore, "storeSize");
}

- (void)save
{
  NFUnfairLock *initializationLock;
  FCKeyValueStore *v4;

  if (self)
  {
    -[NFUnfairLock lock](self->_initializationLock, "lock");
    v4 = self->_localStore;
    initializationLock = self->_initializationLock;
  }
  else
  {
    objc_msgSend(0, "lock");
    v4 = 0;
    initializationLock = 0;
  }
  -[NFUnfairLock unlock](initializationLock, "unlock");
  -[FCKeyValueStore save](v4, "save");

}

- (void)addCacheObserver:(id)a3
{
  FCCacheCoordinator *cacheCoordinator;
  id v5;

  v5 = a3;
  -[FCRecordSource _prepareForUse]((uint64_t)self);
  if (self)
    cacheCoordinator = self->_cacheCoordinator;
  else
    cacheCoordinator = 0;
  -[FCCacheCoordinator addObserver:](cacheCoordinator, "addObserver:", v5);

}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  FCKeyValueStore *localStore;
  FCKeyValueStore *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  FCKeyValueStore *v16;
  FCKeyValueStore *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)FCRecordSourceLog;
  if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "count");
    if (self)
      localStore = self->_localStore;
    else
      localStore = 0;
    v12 = localStore;
    -[FCKeyValueStore allKeys](v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") - 1;
    -[FCRecordSource recordType](self, "recordType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 134218754;
    v20 = v10;
    v21 = 2048;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "record source is flushing %lu of %lu %{public}@ records: %{public}@", (uint8_t *)&v19, 0x2Au);

  }
  if (self)
    v16 = self->_localStore;
  else
    v16 = 0;
  v17 = v16;
  objc_msgSend(v7, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCKeyValueStore removeObjectsForKeys:](v17, "removeObjectsForKeys:", v18);

}

void __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  double v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v15, (_QWORD)v35);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[FCRecordSource _identifierFromCKRecordID:](*(void **)(a1 + 32), v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v16, v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchErrorsByKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v9);

  }
  if (objc_msgSend(v5, "count", (_QWORD)v35))
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "saveRecords:", v20);

    v22 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      v24 = objc_msgSend(v5, "count");
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 40);
      v27 = v8 - *(double *)(a1 + 56);
      *(_DWORD *)buf = 134218754;
      v40 = v24;
      v41 = 2114;
      v42 = v25;
      v43 = 2112;
      v44 = v26;
      v45 = 2048;
      v46 = v27;
      v28 = "successfully fetched %lu %{public}@ records with operation ID %@, total time: %f";
      v29 = v23;
      v30 = 42;
LABEL_17:
      _os_log_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_INFO, v28, buf, v30);

    }
  }
  else
  {
    v31 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      v32 = *(void **)(a1 + 48);
      v23 = v31;
      v33 = objc_msgSend(v32, "count");
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v40 = v33;
      v41 = 2114;
      v42 = v25;
      v43 = 2112;
      v44 = v34;
      v28 = "failed to fetch %lu %{public}@ records with operation ID %@";
      v29 = v23;
      v30 = 32;
      goto LABEL_17;
    }
  }

}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_63(uint64_t a1, void *a2)
{
  return -[FCRecordSource _ckRecordIDFromIdentifier:](*(void **)(a1 + 32), a2);
}

void __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_67(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[5];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v14 = v13;
  if (objc_msgSend(v10, "count") || objc_msgSend(v9, "count") || objc_msgSend(v11, "count"))
  {
    v15 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_2;
    v45[3] = &unk_1E463C818;
    v45[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v45);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v15;
    v44[1] = 3221225472;
    v44[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_3;
    v44[3] = &unk_1E463C818;
    v44[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v44);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 104);
    else
      v19 = 0;
    v38[0] = v15;
    v38[1] = 3221225472;
    v38[2] = __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_4;
    v38[3] = &unk_1E463C840;
    v39 = v10;
    v40 = v16;
    v20 = *(void **)(a1 + 40);
    v41 = *(_QWORD *)(a1 + 32);
    v42 = v20;
    v43 = v17;
    v21 = v17;
    v22 = v16;
    objc_msgSend(v19, "performCacheWrite:", v38);

  }
  if (v12 && objc_msgSend(v12, "code") != 2)
  {
    v34 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      v35 = *(void **)(a1 + 56);
      v24 = v34;
      v36 = objc_msgSend(v35, "count");
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v47 = v36;
      v48 = 2114;
      v49 = v26;
      v50 = 2114;
      v51 = v37;
      v31 = "failed to refresh %lu %{public}@ records with operation ID %{public}@";
      v32 = v24;
      v33 = 32;
      goto LABEL_13;
    }
  }
  else
  {
    v23 = (void *)FCRecordSourceLog;
    if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      v25 = objc_msgSend(v9, "count");
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v10, "count");
      v28 = objc_msgSend(v11, "count");
      v29 = *(_QWORD *)(a1 + 48);
      v30 = v14 - *(double *)(a1 + 64);
      *(_DWORD *)buf = 134219266;
      v47 = v25;
      v48 = 2114;
      v49 = v26;
      v50 = 2048;
      v51 = v27;
      v52 = 2048;
      v53 = v28;
      v54 = 2114;
      v55 = v29;
      v56 = 2048;
      v57 = v30;
      v31 = "successfully refreshed %lu %{public}@ records with %lu changes and %lu deletions, operation ID %{public}@, total time: %f";
      v32 = v24;
      v33 = 62;
LABEL_13:
      _os_log_impl(&dword_1A1B90000, v32, OS_LOG_TYPE_INFO, v31, buf, v33);

    }
  }

}

id __99__FCRecordSource_fetchCoordinator_fetchOperationForKeys_context_qualityOfService_relativePriority___block_invoke_3(uint64_t a1, void *a2)
{
  return -[FCRecordSource _identifierFromCKRecordID:](*(void **)(a1 + 32), a2);
}

id __34__FCRecordSource__initializeStore__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  if (v4)
  {
    -[FCFaultableRecord record]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)forceRefreshDesiredKeys
{
  os_unfair_lock_s *p_derivedKeysLock;

  p_derivedKeysLock = &self->_derivedKeysLock;
  os_unfair_lock_lock(&self->_derivedKeysLock);
  -[FCRecordSource _deriveDesiredKeys](self);
  os_unfair_lock_unlock(p_derivedKeysLock);
}

id __53__FCRecordSource__deleteRecordsWithWriteLockWithIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCFaultableRecord record](a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeletedFromCloud:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModificationDate:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "pbDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchDate:", v6);

  +[FCFaultableRecord faultableRecordWithRecord:]((uint64_t)FCFaultableRecord, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)t_startOverridingExperimentalizableFieldsPostfix:(id)a3 treatmentID:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *experimentalizableFieldsPostfix;
  NSString *activeTreatmentID;
  NSString *v10;
  NSArray *desiredKeys;
  NSString *v12;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  experimentalizableFieldsPostfix = self->_experimentalizableFieldsPostfix;
  self->_experimentalizableFieldsPostfix = v6;
  v12 = v6;

  activeTreatmentID = self->_activeTreatmentID;
  self->_activeTreatmentID = v7;
  v10 = v7;

  desiredKeys = self->_desiredKeys;
  self->_desiredKeys = 0;

}

- (void)t_stopOverridingExperimentalizableFieldsPostfixAndTreatmentID
{
  NSString *experimentalizableFieldsPostfix;
  NSString *activeTreatmentID;
  NSArray *desiredKeys;

  experimentalizableFieldsPostfix = self->_experimentalizableFieldsPostfix;
  self->_experimentalizableFieldsPostfix = 0;

  activeTreatmentID = self->_activeTreatmentID;
  self->_activeTreatmentID = 0;

  desiredKeys = self->_desiredKeys;
  self->_desiredKeys = 0;

}

- (id)jsonEncodableObject
{
  if (self)
    self = (FCRecordSource *)self->_localStore;
  return -[FCRecordSource jsonEncodableObject](self, "jsonEncodableObject");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTreatmentID, 0);
  objc_storeStrong((id *)&self->_experimentalizableFieldsPostfix, 0);
  objc_storeStrong((id *)&self->_fetchErrorsByKey, 0);
  objc_storeStrong((id *)&self->_fetchCoordinator, 0);
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_backgroundTaskable, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_contentDirectory, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
  objc_storeStrong((id *)&self->_initializationLock, 0);
  objc_storeStrong((id *)&self->_localizedLanguageSpecificKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_localizedExperimentalizedKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_experimentalizedKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_localizedKeysByOriginalKey, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
}

@end
