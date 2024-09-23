@implementation FCHCZoneContentsExpectation

- (void)validate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  FCHCZoneContentsExpectation *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v18 = objc_alloc_init(MEMORY[0x1E0C94DE8]);
  v19 = self;
  -[FCHCZoneContentsExpectation zoneID](self, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRecordZoneIDs:", v4);

  objc_msgSend(v18, "setFetchAllChanges:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __39__FCHCZoneContentsExpectation_validate__block_invoke;
  v32[3] = &unk_1E463BBD8;
  v6 = v5;
  v33 = v6;
  objc_msgSend(v18, "setRecordChangedBlock:", v32);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __39__FCHCZoneContentsExpectation_validate__block_invoke_2;
  v25[3] = &unk_1E463BC00;
  v25[4] = &v26;
  objc_msgSend(v18, "setFetchRecordZoneChangesCompletionBlock:", v25);
  -[FCHCZoneContentsExpectation database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v18);

  objc_msgSend(v18, "waitUntilFinished");
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v8 = (uint64_t *)MEMORY[0x1E0C99750];
  if (v27[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error fetching zone changes from database: %@"), v27[5]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[FCHCZoneContentsExpectation recordTests](v19, "recordTests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    v12 = *v8;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __39__FCHCZoneContentsExpectation_validate__block_invoke_3;
        v20[3] = &unk_1E463BC28;
        v20[4] = v14;
        v15 = objc_msgSend(v6, "fc_containsObjectPassingTest:", v20);
        objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
        if ((v15 & 1) == 0)
        {
          v16 = (void *)MEMORY[0x1E0C99DA0];
          -[FCHCZoneContentsExpectation zoneID](v19, "zoneID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "raise:format:", v12, CFSTR("missing records in zone: %@\nfound: %@"), v17, v6);

        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    }
    while (v10);
  }

  _Block_object_dispose(&v26, 8);
}

uint64_t __39__FCHCZoneContentsExpectation_validate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __39__FCHCZoneContentsExpectation_validate__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __39__FCHCZoneContentsExpectation_validate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v41 = a1;
  objc_msgSend(*(id *)(a1 + 32), "unencryptedFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v51;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v14);
        objc_msgSend(v3, "encryptedValuesByKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = (v17 == 0) & v6;
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v12);
  }

  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(v41 + 32), "encryptedFields");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v47;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v25);
        objc_msgSend(v3, "valuesByKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = (v28 == 0) & v6;
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v23);
  }
  v40 = v10;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(*(id *)(v41 + 32), "expectedValues");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v43;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v33);
        objc_msgSend(*(id *)(v41 + 32), "expectedValues", v40);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "containsObject:", v34))
          objc_msgSend(v3, "encryptedValuesByKey");
        else
          objc_msgSend(v3, "valuesByKey");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = objc_msgSend(v38, "isEqual:", v36) & v6;
        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v31);
  }

  return v6;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)recordTests
{
  return self->_recordTests;
}

- (void)setRecordTests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordTests, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
