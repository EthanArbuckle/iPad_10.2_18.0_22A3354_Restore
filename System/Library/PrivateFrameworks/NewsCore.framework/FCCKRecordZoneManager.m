@implementation FCCKRecordZoneManager

- (id)initWithDatabase:(void *)a3 recordZoneNames:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FCAsyncSerialQueue *v21;
  id v22;
  id v24;
  id v25;
  id obj;
  id v27;
  id *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v6 = a3;
  if (a1
    && (v33.receiver = a1,
        v33.super_class = (Class)FCCKRecordZoneManager,
        (v28 = (id *)objc_msgSendSuper2(&v33, sel_init)) != 0))
  {
    v24 = a2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v6;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      v12 = *MEMORY[0x1E0C94730];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v14, v12);
          objc_msgSend(v7, "addObject:", v15);
          v16 = -[FCCKRecordZone initWithDatabase:delegate:recordZoneID:]((id *)[FCCKRecordZone alloc], v27, v28, v15);
          objc_msgSend(v8, "setObject:forKey:", v16, v14);

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v10);
    }

    objc_storeStrong(v28 + 1, v24);
    v17 = v28[2];
    v28[2] = v7;
    v18 = v7;

    v19 = v28[3];
    v28[3] = v8;
    v20 = v8;

    v21 = -[FCAsyncSerialQueue initWithQualityOfService:]([FCAsyncSerialQueue alloc], "initWithQualityOfService:", 25);
    v22 = v28[5];
    v28[5] = v21;

    v6 = v25;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)recordZoneWithName:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[3], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)prepareRecordZonesForUseWithCompletionHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E464A008;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v5, "enqueueBlock:", v6);

  }
}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FCCKPrivateFetchRecordZonesOperation *v9;
  FCCKPrivateFetchRecordZonesOperation *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E4643418;
  v5 = v3;
  v18 = v5;
  v19 = *(id *)(a1 + 40);
  v6 = _Block_copy(aBlock);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 && *(_QWORD *)(v8 + 32))
  {
    (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
  }
  else
  {
    v9 = objc_alloc_init(FCCKPrivateFetchRecordZonesOperation);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(_QWORD *)(v11 + 16);
    else
      v12 = 0;
    -[FCCKPrivateFetchRecordZonesOperation setRecordZoneIDs:](v9, "setRecordZoneIDs:", v12);
    -[FCOperation setQualityOfService:](v10, "setQualityOfService:", 25);
    -[FCOperation setRelativePriority:](v10, "setRelativePriority:", 1);
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E463B858;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v7;
    -[FCCKPrivateFetchRecordZonesOperation setFetchRecordZonesCompletionBlock:](v10, "setFetchRecordZonesCompletionBlock:", v15);
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      v14 = *(_QWORD *)(v13 + 8);
    else
      v14 = 0;
    -[FCCKPrivateDatabase addOperation:](v14, v10);

  }
}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  FCCKPrivateSaveRecordZonesOperation *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "code") == 2)
    {
      v24 = v5;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C94940]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v30 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "code") == 26)
            {
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v15);
              objc_msgSend(v7, "addObject:", v17);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v12);
      }

      v5 = v24;
    }
    if (objc_msgSend(v7, "count"))
    {
      v18 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
      -[FCCKPrivateSaveRecordZonesOperation setRecordZonesToSave:](v18, "setRecordZonesToSave:", v7);
      -[FCOperation setQualityOfService:](v18, "setQualityOfService:", 25);
      -[FCOperation setRelativePriority:](v18, "setRelativePriority:", 1);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_4;
      v25[3] = &unk_1E4643CF8;
      v19 = v5;
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(a1 + 40);
      v26 = v19;
      v27 = v20;
      v28 = v21;
      -[FCCKPrivateSaveRecordZonesOperation setSaveRecordZonesCompletionBlock:](v18, "setSaveRecordZonesCompletionBlock:", v25);
      v22 = *(_QWORD *)(a1 + 32);
      if (v22)
        v23 = *(_QWORD *)(v22 + 8);
      else
        v23 = 0;
      -[FCCKPrivateDatabase addOperation:](v23, v18);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    -[FCAssetHandle setFetchOperation:](*(_QWORD *)(a1 + 32), v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    v5 = (void *)MEMORY[0x1E0C99E08];
    v6 = a1[4];
    v7 = a2;
    objc_msgSend(v5, "dictionaryWithDictionary:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fc_dictionaryWithKeySelector:", sel_zoneID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
    -[FCAssetHandle setFetchOperation:](a1[5], v8);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)ensureRecordZoneExistsWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__FCCKRecordZoneManager_ensureRecordZoneExistsWithID_completionHandler___block_invoke;
  v10[3] = &unk_1E4644870;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FCCKRecordZoneManager prepareRecordZonesForUseWithCompletionHandler:]((uint64_t)self, v10);

}

void __72__FCCKRecordZoneManager_ensureRecordZoneExistsWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 32);
  else
    v5 = 0;
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Subscriptions"));

  if (v8)
  {
    if (!v6)
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
      {
        if (*(_QWORD *)(v9 + 32) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing record zone for ID %@"), *(_QWORD *)(a1 + 40));
          *(_DWORD *)buf = 136315906;
          v14 = "-[FCCKRecordZoneManager ensureRecordZoneExistsWithID:completionHandler:]_block_invoke";
          v15 = 2080;
          v16 = "FCCKRecordZoneManager.m";
          v17 = 1024;
          v18 = 152;
          v19 = 2114;
          v20 = v10;
          v11 = MEMORY[0x1E0C81028];
LABEL_15:
          _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }
    }
  }
  else if (!v6)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      if (*(_QWORD *)(v12 + 32) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing record zone for ID %@"), *(_QWORD *)(a1 + 40));
        *(_DWORD *)buf = 136315906;
        v14 = "-[FCCKRecordZoneManager ensureRecordZoneExistsWithID:completionHandler:]_block_invoke";
        v15 = 2080;
        v16 = "FCCKRecordZoneManager.m";
        v17 = 1024;
        v18 = 156;
        v19 = 2114;
        v20 = v10;
        v11 = MEMORY[0x1E0C81028];
        goto LABEL_15;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_ckRecordZonesByID, 0);
  objc_storeStrong((id *)&self->_fcRecordZonesByName, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
