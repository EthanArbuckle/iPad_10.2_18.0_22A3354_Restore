@implementation HKMedicationsDemoSearchAssetInterface

- (HKMedicationsDemoSearchAssetInterface)initWithAssetPath:(id)a3
{
  id v4;
  HKMedicationsDemoSearchAssetInterface *v5;
  HKMedicationsDemoSearchAssetInterface *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsDemoSearchAssetInterface;
  v5 = -[HKMedicationsDemoSearchAssetInterface init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HKMedicationsDemoSearchAssetInterface setAssetPath:](v5, "setAssetPath:", v4);
    v7 = dispatch_queue_create("HKMedicationsDemoSearchAssetInterface", 0);
    -[HKMedicationsDemoSearchAssetInterface setQueue:](v6, "setQueue:", v7);

    v6->_interruptionLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (int)openAsset
{
  sqlite3 **p_db;
  os_unfair_lock_s *p_interruptionLock;
  int v6;

  p_db = &self->_db;
  if (self->_db)
    return 0;
  p_interruptionLock = &self->_interruptionLock;
  os_unfair_lock_lock(&self->_interruptionLock);
  v6 = sqlite3_open(-[NSString fileSystemRepresentation](self->_assetPath, "fileSystemRepresentation"), p_db);
  os_unfair_lock_unlock(p_interruptionLock);
  return v6;
}

- (void)close
{
  os_unfair_lock_s *p_interruptionLock;
  sqlite3 *db;

  p_interruptionLock = &self->_interruptionLock;
  os_unfair_lock_lock(&self->_interruptionLock);
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
  os_unfair_lock_unlock(p_interruptionLock);
}

- (id)medicationFromNDCCode:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD block[5];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[HKMedicationsDemoSearchAssetInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HKMedicationsDemoSearchAssetInterface_medicationFromNDCCode_error___block_invoke;
  block[3] = &unk_24EC1A048;
  v17 = v24;
  v18 = &v20;
  block[4] = self;
  v8 = v6;
  v16 = v8;
  v19 = &v26;
  dispatch_sync(v7, block);

  if (v21[3])
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    v11 = (void *)objc_msgSend(v10, "initWithUTF8String:", v21[3]);
    objc_msgSend(v9, "hk_assignError:code:description:", a4, 100, v11);

  }
  else
  {
    v13 = (void *)v27[5];
    if (v13)
    {
      v12 = v13;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 11, CFSTR("No medication matching NDC was found"));
  }
  v12 = 0;
LABEL_6:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

const char *__69__HKMedicationsDemoSearchAssetInterface_medicationFromNDCCode_error___block_invoke(uint64_t a1)
{
  const unsigned __int8 *v2;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  const unsigned __int8 *v6;
  HKFullMedicationSearchResult *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *result;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), (const char *)objc_msgSend(CFSTR("SELECT pr.product_id, pr.generic_name, pr.brand_name, pa.package_ndc, pa.description         FROM packaging AS pa         JOIN product_packaging AS pp ON pa.package_id=pp.packaging_id         JOIN product AS pr ON pp.product_id=pr.product_id         WHERE pa.package_ndc_11=? OR pa.package_ndc_10=?"), "UTF8String"), -1, &ppStmt, 0);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_7;
  }
  if (sqlite3_step(ppStmt) == 100)
  {
    v2 = sqlite3_column_text(ppStmt, 0);
    v3 = sqlite3_column_text(ppStmt, 1);
    v4 = sqlite3_column_text(ppStmt, 2);
    v5 = sqlite3_column_text(ppStmt, 3);
    v6 = sqlite3_column_text(ppStmt, 4);
    v7 = [HKFullMedicationSearchResult alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKFullMedicationSearchResult initWithProductId:packagingName:packagingNDC:productBrandName:productGenericName:route:doseForm:](v7, "initWithProductId:packagingName:packagingNDC:productBrandName:productGenericName:route:doseForm:", v8, v9, v10, v11, v12, 0, 0);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  result = (const char *)sqlite3_finalize(ppStmt);
  if ((_DWORD)result)
  {
LABEL_7:
    result = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  }
  return result;
}

- (id)genericMedicationsFromTokens:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v15;
  HKMedicationsDemoSearchAssetInterface *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[HKMedicationsDemoSearchAssetInterface queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HKMedicationsDemoSearchAssetInterface_genericMedicationsFromTokens_error___block_invoke;
  block[3] = &unk_24EC1A070;
  v8 = v6;
  v15 = v8;
  v16 = self;
  v17 = v24;
  v18 = &v20;
  v19 = &v26;
  dispatch_sync(v7, block);

  if (v21[3])
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    v11 = (void *)objc_msgSend(v10, "initWithUTF8String:", v21[3]);
    objc_msgSend(v9, "hk_assignError:code:description:", a4, 100, v11);

    v12 = 0;
  }
  else
  {
    objc_msgSend((id)v27[5], "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __76__HKMedicationsDemoSearchAssetInterface_genericMedicationsFromTokens_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  const unsigned __int8 *v8;
  HKGenericMedicationSearchResult *v9;
  void *v10;
  void *v11;
  HKGenericMedicationSearchResult *v12;
  id obj;
  uint64_t v14;
  sqlite3_stmt *ppStmt;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v14 = *(_QWORD *)v17;
    v4 = MEMORY[0x24BDBD1A8];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        ppStmt = 0;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8), (const char *)objc_msgSend(CFSTR("SELECT DISTINCT gm.generic_medication_id, gm.name             FROM token AS tk             LEFT JOIN ingredient_token AS ing_tk ON tk.token_id=ing_tk.token_id             LEFT JOIN ingredient_strength AS ingstr ON ingstr.component_id=ing_tk.ingredient_id             LEFT JOIN ingredient AS ing ON ingstr.ingredient_id=ing.ingredient_id             LEFT JOIN generic_medication_ingredient AS gmi ON gmi.ingredient_id=ing.ingredient_id             LEFT JOIN generic_medication AS gm ON gm.generic_medication_id=gmi.generic_medication_id             WHERE tk.token LIKE ? AND gm.generic_medication_id IS NOT NULL"), "UTF8String"), -1, &ppStmt, 0);
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
          || sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
        {
          goto LABEL_14;
        }
        while (sqlite3_step(ppStmt) == 100)
        {
          v7 = sqlite3_column_int(ppStmt, 0);
          v8 = sqlite3_column_text(ppStmt, 1);
          v9 = [HKGenericMedicationSearchResult alloc];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[HKGenericMedicationSearchResult initWithGenericMedicationId:genericMedicationName:brandName:ingredients:](v9, "initWithGenericMedicationId:genericMedicationName:brandName:ingredients:", v10, v11, 0, v4);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v12);
        }
        if (sqlite3_finalize(ppStmt))
        {
LABEL_14:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
          goto LABEL_15;
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_15:

}

- (id)expandedGenericMedicationSearchResult:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  objc_msgSend(v6, "genericMedicationId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "ingredients"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        !v10))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = v6;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    -[HKMedicationsDemoSearchAssetInterface queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __85__HKMedicationsDemoSearchAssetInterface_expandedGenericMedicationSearchResult_error___block_invoke;
    v17[3] = &unk_24EC1A098;
    v17[4] = self;
    v17[5] = v22;
    v17[6] = &v18;
    v17[7] = &v24;
    dispatch_sync(v12, v17);

    if (v19[3])
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = objc_alloc(MEMORY[0x24BDD17C8]);
      v15 = (void *)objc_msgSend(v14, "initWithUTF8String:", v19[3]);
      objc_msgSend(v13, "hk_assignError:code:description:", a4, 100, v15);

      v11 = 0;
    }
    else
    {
      v11 = (id)v25[5];
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    v11 = v6;
  }

  return v11;
}

void __85__HKMedicationsDemoSearchAssetInterface_expandedGenericMedicationSearchResult_error___block_invoke(_QWORD *a1)
{
  sqlite3_stmt *v2;
  id v3;
  id v4;
  uint64_t v5;
  const unsigned __int8 *v6;
  HKIngredientSearchResult *v7;
  void *v8;
  void *v9;
  HKIngredientSearchResult *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_prepare_v2(*(sqlite3 **)(a1[4] + 8), (const char *)objc_msgSend(CFSTR("SELECT ing.ingredient_id, ing.name         FROM generic_medication AS gm         LEFT JOIN generic_medication_ingredient AS gmi ON gm.generic_medication_id=gmi.generic_medication_id         LEFT JOIN ingredient AS ing ON gmi.ingredient_id=ing.ingredient_id         WHERE gm.generic_medication_id=?"), "UTF8String"), -1, &ppStmt, 0);
  if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24)
    || (v2 = ppStmt,
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "genericMedicationId"),
        v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
        LODWORD(v2) = sqlite3_bind_text(v2, 1, (const char *)objc_msgSend(v3, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), v3, (_DWORD)v2))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = sqlite3_errmsg(*(sqlite3 **)(a1[4] + 8));
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    while (sqlite3_step(ppStmt) == 100)
    {
      v5 = sqlite3_column_int(ppStmt, 0);
      v6 = sqlite3_column_text(ppStmt, 1);
      v7 = [HKIngredientSearchResult alloc];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HKIngredientSearchResult initWithIngredientId:ingredientName:strengthQuantity:strengthUnit:](v7, "initWithIngredientId:ingredientName:strengthQuantity:strengthUnit:", v8, v9, 0, 0);

      objc_msgSend(v4, "addObject:", v10);
    }
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copyByReplacingWithIngredients:", v4);
    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
  objc_storeStrong((id *)&self->_assetPath, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
}

@end
