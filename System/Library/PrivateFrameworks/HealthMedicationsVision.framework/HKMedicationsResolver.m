@implementation HKMedicationsResolver

- (HKMedicationsResolver)initWithAssetUrl:(id)a3
{
  id v5;
  HKMedicationsResolver *v6;
  HKMedicationsResolver *v7;
  uint64_t v8;
  HDSQLiteDatabase *db;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationsResolver;
  v6 = -[HKMedicationsResolver init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetUrl, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE40E30]), "initMemoryDatabase");
    db = v7->_db;
    v7->_db = (HDSQLiteDatabase *)v8;

    if (-[HDSQLiteDatabase openWithError:](v7->_db, "openWithError:", 0))
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x24BDD2FE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
        -[HKMedicationsResolver initWithAssetUrl:].cold.1(v10);
    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HDSQLiteDatabase close](self->_db, "close");
  v3.receiver = self;
  v3.super_class = (Class)HKMedicationsResolver;
  -[HKMedicationsResolver dealloc](&v3, sel_dealloc);
}

- (uint64_t)setupDatabaseWithError:(uint64_t)a1
{
  void *v3;
  char v4;
  os_log_t *v5;
  uint64_t v6;
  os_log_t v7;
  _QWORD v9[5];

  if (!a1)
    return 0;
  v3 = *(void **)(a1 + 8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__HKMedicationsResolver_setupDatabaseWithError___block_invoke;
  v9[3] = &unk_24EC1A0E8;
  v9[4] = a1;
  v4 = objc_msgSend(v3, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("ATTACH DATABASE ? AS pbs_assets;"),
         a2,
         v9,
         0);
  v5 = (os_log_t *)MEMORY[0x24BDD2FE8];
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[HKMedicationsResolver setupDatabaseWithError:].cold.2();
  }
  v6 = objc_msgSend(*(id *)(a1 + 8), "executeSQLStatements:error:", &unk_24EC1D550, 0);
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[HKMedicationsResolver setupDatabaseWithError:].cold.1(v7);
  }
  return v6;
}

void __48__HKMedicationsResolver_setupDatabaseWithError___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(v3, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (uint64_t)setupNgramTables:(uint64_t)a1
{
  uint64_t v2;

  if (!a1)
    return 0;
  v2 = objc_msgSend(*(id *)(a1 + 8), "executeSQLStatements:error:", &unk_24EC1D568, a2);
  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[HKMedicationsResolver setupNgramTables:].cold.1();
  }
  return v2;
}

- (BOOL)resetResolverWithError:(id *)a3
{
  self->_numberOfNewNgrams = 0;
  self->_numberOfUsedNgrams = 0;
  return -[HKMedicationsResolver resetInMemoryDBWithError:](self, "resetInMemoryDBWithError:", a3);
}

- (BOOL)resetInMemoryDBWithError:(id *)a3
{
  char v3;

  v3 = -[HDSQLiteDatabase executeSQLStatements:error:](self->_db, "executeSQLStatements:error:", &unk_24EC1D580, a3);
  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[HKMedicationsResolver resetInMemoryDBWithError:].cold.1();
  }
  return v3;
}

- (uint64_t)createNgramAssetsWithError:(uint64_t)a1
{
  if (a1
    && objc_msgSend(*(id *)(a1 + 8), "executeSQLStatements:error:", &unk_24EC1D598, a2)
    && objc_msgSend(*(id *)(a1 + 8), "executeSQLStatements:error:", &unk_24EC1D5B0, a2))
  {
    return objc_msgSend(*(id *)(a1 + 8), "executeSQLStatements:error:", &unk_24EC1D5C8, a2);
  }
  else
  {
    return 0;
  }
}

- (uint64_t)dropNgramAssetsWithError:(uint64_t)a1
{
  uint64_t v2;

  if (!a1)
    return 0;
  v2 = objc_msgSend(*(id *)(a1 + 8), "executeSQLStatements:error:", &unk_24EC1D5E0, a2);
  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[HKMedicationsResolver dropNgramAssetsWithError:].cold.1();
  }
  return v2;
}

- (HKMedicationsMapResult)createNgramMapsWithError:(uint64_t)a1
{
  HKMedicationsMapResult *v4;
  void *v5;
  uint64_t v6;
  HKMedicationsMapResult *v7;
  int v8;
  HKMedicationsMapResult *v9;
  HKMedicationsNumberToNumberMap *v10;
  void *v11;
  HKMedicationsNumberToNumberMap *v12;
  HKMedicationsNumberToNumberPairListMap *v13;
  void *v14;
  HKMedicationsNumberToNumberMap *v15;
  void *v16;
  HKMedicationsNumberToNumberMap *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  HKMedicationsNumberToNumberMap *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  HKMedicationsNumberToNumberMap *v30;
  _QWORD v31[4];
  HKMedicationsNumberToNumberMap *v32;
  _QWORD v33[4];
  HKMedicationsNumberToNumberMap *v34;
  _QWORD v35[4];
  HKMedicationsNumberToNumberMap *v36;
  _QWORD v37[4];
  HKMedicationsMapResult *v38;

  if (!a1)
  {
    v9 = 0;
    return v9;
  }
  v4 = objc_alloc_init(HKMedicationsMapResult);
  v5 = *(void **)(a1 + 8);
  v6 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke;
  v37[3] = &unk_24EC1A110;
  v7 = v4;
  v38 = v7;
  v8 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT SUM(ngram_weight) FROM ngram_id_list"), a2, 0, v37);
  v9 = 0;
  if (v8)
  {
    v10 = objc_alloc_init(HKMedicationsNumberToNumberMap);
    v11 = *(void **)(a1 + 8);
    v35[0] = v6;
    v35[1] = 3221225472;
    v35[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_2;
    v35[3] = &unk_24EC1A110;
    v12 = v10;
    v36 = v12;
    if (objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT hg_id, ngram_count FROM common_map"), a2, 0, v35))
    {
      -[HKMedicationsMapResult setCommonDict:](v7, "setCommonDict:", v12);

      v13 = objc_alloc_init(HKMedicationsNumberToNumberPairListMap);
      v14 = *(void **)(a1 + 8);
      v33[0] = v6;
      v33[1] = 3221225472;
      v33[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_3;
      v33[3] = &unk_24EC1A110;
      v12 = v13;
      v34 = v12;
      if (objc_msgSend(v14, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT hg_id, specific_id, ngram_count FROM unique_map"), a2, 0, v33))
      {
        -[HKMedicationsMapResult setUniqueDict:](v7, "setUniqueDict:", v12);

        v15 = objc_alloc_init(HKMedicationsNumberToNumberMap);
        v16 = *(void **)(a1 + 8);
        v31[0] = v6;
        v31[1] = 3221225472;
        v31[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_4;
        v31[3] = &unk_24EC1A110;
        v12 = v15;
        v32 = v12;
        if (objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT hg_id, ngram_count FROM pbs_assets.common_ngram_count WHERE hg_id IN (SELECT hg_id FROM common_map)"), a2, 0, v31))
        {
          -[HKMedicationsMapResult setCommonSetSizeDict:](v7, "setCommonSetSizeDict:", v12);

          v17 = objc_alloc_init(HKMedicationsNumberToNumberMap);
          v18 = *(void **)(a1 + 8);
          v29[0] = v6;
          v29[1] = 3221225472;
          v29[2] = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_5;
          v29[3] = &unk_24EC1A110;
          v12 = v17;
          v30 = v12;
          if (objc_msgSend(v18, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT specific_id, ngram_count FROM pbs_assets.unique_ngram_count WHERE specific_id IN (SELECT specific_id FROM unique_map)"), a2, 0, v29))
          {
            -[HKMedicationsMapResult setUniqueSetSizeDict:](v7, "setUniqueSetSizeDict:", v12);

            v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v20 = *(void **)(a1 + 8);
            v24 = v6;
            v25 = 3221225472;
            v26 = __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_6;
            v27 = &unk_24EC1A110;
            v21 = v19;
            v28 = v21;
            if (objc_msgSend(v20, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT hg_id FROM (SELECT hg_id FROM common_map UNION SELECT hg_id FROM unique_map)"), a2, 0, &v24))
            {
              -[HKMedicationsMapResult setDistinctHgIds:](v7, "setDistinctHgIds:", v21, v24, v25, v26, v27);

              v9 = v7;
              goto LABEL_15;
            }

LABEL_14:
            v9 = 0;
            goto LABEL_15;
          }
          v22 = v30;
        }
        else
        {
          v22 = v32;
        }
      }
      else
      {
        v22 = v34;
      }
    }
    else
    {
      v22 = v36;
    }

    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNgramCount:", HDSQLiteColumnAsInt64());
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "setInteger:forKey:", HDSQLiteColumnAsInt64(), v2);
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = HDSQLiteColumnAsInt64();
  v3 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "addInteger:andInteger:forKey:", HDSQLiteColumnAsInt64(), v3, v2);
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "setInteger:forKey:", HDSQLiteColumnAsInt64(), v2);
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "setInteger:forKey:", HDSQLiteColumnAsInt64(), v2);
  return 1;
}

uint64_t __50__HKMedicationsResolver_createNgramMapsWithError___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

- (id)createNgramCountsWithError:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  HKMedicationsNgramCounts *v16;

  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    v16 = objc_alloc_init(HKMedicationsNgramCounts);
    v4 = MEMORY[0x24BDAC760];
    v5 = *(void **)(a1 + 8);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke;
    v10[3] = &unk_24EC1A138;
    v10[4] = &v11;
    if ((objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM ngram_list;"),
            a2,
            0,
            v10) & 1) != 0
      && (v6 = *(void **)(a1 + 8),
          v9[0] = v4,
          v9[1] = 3221225472,
          v9[2] = __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke_2,
          v9[3] = &unk_24EC1A138,
          v9[4] = &v11,
          objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM ngram_id_list;"),
                          a2,
                          0,
                          v9)))
    {
      v7 = (id)v12[5];
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setSeen:", HDSQLiteColumnAsInt64());
  return 1;
}

uint64_t __52__HKMedicationsResolver_createNgramCountsWithError___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setUsed:", HDSQLiteColumnAsInt64());
  return 1;
}

- (BOOL)lineHasUsefulInfo
{
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  _QWORD v5[9];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (!a1)
    return 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v1 = *(void **)(a1 + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__HKMedicationsResolver_lineHasUsefulInfo__block_invoke;
  v5[3] = &unk_24EC1A160;
  v5[4] = &v19;
  v5[5] = &v15;
  v5[6] = &v11;
  v5[7] = v10;
  v5[8] = &v6;
  objc_msgSend(v1, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*), COUNT(ngram_id), SUM(ngram_weight), SUM(is_unit), SUM(is_number), MAX(ngram_prob) FROM ngram_list_line LEFT JOIN pbs_assets.ngram_map ON ngram_list_line.ngram = pbs_assets.ngram_map.ngram;"),
    0,
    0,
    v5);
  v2 = v7[3] >= 0.6;
  if (!v12[3])
  {
    v3 = v20[3];
    if (!v3 || (float)((float)v16[3] / (float)v3) < 0.05)
      v2 = 0;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v2;
}

uint64_t __42__HKMedicationsResolver_lineHasUsefulInfo__block_invoke(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = MEMORY[0x227683918](a2, 5);
  return 1;
}

- (void)processNgramLine:(id)a3 n:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  HDSQLiteDatabase *db;
  char v21;
  id v22;
  void *v23;
  HDSQLiteDatabase *v24;
  char v25;
  id v26;
  id v27;
  HDSQLiteDatabase *v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("compare to"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v6, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:](self, v10, v7, 2, 0.95);

  if ((v11 & 1) == 0
    && -[HKMedicationsResolver countOfContinousDigitsInLine:](self, "countOfContinousDigitsInLine:", v6) <= 5)
  {
    v30 = v7;
    objc_msgSend(v6, "normalizeForType:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolver ngramsFrom:minLength:maxLength:]((uint64_t)self, v12, 3, a4 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          db = self->_db;
          v34 = 0;
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __44__HKMedicationsResolver_processNgramLine_n___block_invoke;
          v33[3] = &unk_24EC1A0E8;
          v33[4] = v19;
          v21 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](db, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO ngram_list_line (ngram) VALUES (?);"),
                  &v34,
                  v33,
                  0);
          v22 = v34;
          v23 = v22;
          if ((v21 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
              -[HKMedicationsResolver processNgramLine:n:].cold.3();

            v27 = v14;
            goto LABEL_20;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v16)
          continue;
        break;
      }
    }

    if (-[HKMedicationsResolver lineHasUsefulInfo]((uint64_t)self))
    {
      v24 = self->_db;
      v32 = 0;
      v25 = -[HDSQLiteDatabase executeSQLStatements:error:](v24, "executeSQLStatements:error:", &unk_24EC1D5F8, &v32);
      v26 = v32;
      v27 = v26;
      if ((v25 & 1) == 0)
      {
        _HKInitializeLogging();
        v7 = v30;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
          -[HKMedicationsResolver processNgramLine:n:].cold.2();
LABEL_23:

        goto LABEL_24;
      }

    }
    v28 = self->_db;
    v31 = 0;
    v29 = -[HDSQLiteDatabase executeSQLStatements:error:](v28, "executeSQLStatements:error:", &unk_24EC1D610, &v31);
    v27 = v31;
    if ((v29 & 1) != 0)
    {
LABEL_20:
      v7 = v30;
    }
    else
    {
      _HKInitializeLogging();
      v7 = v30;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
        -[HKMedicationsResolver processNgramLine:n:].cold.1();
    }
    goto LABEL_23;
  }
LABEL_24:

}

- (uint64_t)checkLCSCriterion:(void *)a1 transcripts:(void *)a2 strings:(void *)a3 normalizationType:(uint64_t)a4 tolerance:(float)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  if (a1)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v9;
    v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v27)
    {
      v12 = *(_QWORD *)v34;
      v25 = *(_QWORD *)v34;
      v26 = v9;
      v28 = v10;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "normalizeForType:", a4, v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v15 = v10;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "normalizeForType:", a4);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (float)objc_msgSend(a1, "consecutiveLCSUsingTranscript:prediction:", v14, v20);
                v22 = v21 / (float)(unint64_t)objc_msgSend(v20, "length");

                if (v22 >= a5)
                {

                  v23 = 1;
                  v9 = v26;
                  v10 = v28;
                  goto LABEL_20;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v17)
                continue;
              break;
            }
          }

          v10 = v28;
          v12 = v25;
        }
        v23 = 0;
        v9 = v26;
        v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v27);
    }
    else
    {
      v23 = 0;
    }
LABEL_20:

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)ngramsFrom:(uint64_t)a3 minLength:(uint64_t)a4 maxLength:
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[HKMedicationsNgramGenerator tokensFrom:minimumLength:maximumLength:](HKMedicationsNgramGenerator, "tokensFrom:minimumLength:maximumLength:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a3, a4, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

uint64_t __44__HKMedicationsResolver_processNgramLine_n___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)checkNgramFrame
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to insert or replace into ngram_list: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)fillNgramsForText:(uint64_t)a3 n:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "lowercaseString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "processNgramLine:n:", v10, a3);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    -[HKMedicationsResolver checkNgramFrame]((uint64_t)a1);

  }
}

- (uint64_t)looksLikeGenericInText:(uint64_t)a1
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v2 = a1;
  v20 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("\n"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24EC1D658, (_QWORD)v15);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v8, "lowercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setWithObject:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:]((void *)v2, v12, v9, 2, 0.9);

          if ((v13 & 1) != 0)
          {
            v2 = 1;
            goto LABEL_12;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v5)
          continue;
        break;
      }
    }
    v2 = 0;
LABEL_12:

  }
  return v2;
}

- (BOOL)getGenericSpecificIdForClinicalId:(uint64_t)a3 genericId:
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v3 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  if (a1 && a3)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v5 = *(void **)(a1 + 8);
    v13 = 0;
    v11[5] = a3;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke;
    v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v12[4] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke_2;
    v11[3] = &unk_24EC1A1A8;
    v11[4] = &v14;
    v6 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT specific_id FROM generic_map where clinical_id = ? LIMIT 1;"),
           &v13,
           v12,
           v11);
    v7 = v13;
    if ((v6 & 1) != 0)
    {
      v3 = *((_BYTE *)v15 + 24) != 0;
    }
    else
    {
      _HKInitializeLogging();
      v8 = (id)*MEMORY[0x24BDD2FE8];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v19 = v10;
        v20 = 2048;
        v21 = a2;
        v22 = 2112;
        v23 = v7;
        _os_log_error_impl(&dword_223139000, v8, OS_LOG_TYPE_ERROR, "[%@] failed to find specific id for clinical id (%ld): %@", buf, 0x20u);
      }

      v3 = 0;
    }
    _Block_object_dispose(&v14, 8);

  }
  return v3;
}

uint64_t __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __69__HKMedicationsResolver_getGenericSpecificIdForClinicalId_genericId___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  **(_QWORD **)(a1 + 40) = HDSQLiteColumnAsInt64();
  return 0;
}

- (id)resolveText:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  HKMedicationsResolverResult *v12;
  int v13;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  HKMedicationsMercuryIdGroup *v29;
  double v30;
  void *v31;
  HKMedicationsResolver *v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  float v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  if (!self->_dbReady)
  {
    if ((-[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)a4) & 1) == 0)
    {
      v12 = 0;
      self->_dbReady = 0;
      goto LABEL_14;
    }
    v13 = -[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)a4);
    self->_dbReady = v13;
    if (!v13)
      goto LABEL_10;
  }
  if (-[HKMedicationsResolver dropNgramAssetsWithError:]((uint64_t)self, (uint64_t)a4))
  {
    v32 = self;
    -[HKMedicationsResolver createNgramCountsWithError:]((uint64_t)self, (uint64_t)a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && (v8 = objc_msgSend(v6, "seen"),
          v9 = objc_msgSend(v7, "used"),
          -[HKMedicationsResolver fillNgramsForText:n:](self, v33, 5),
          -[HKMedicationsResolver createNgramAssetsWithError:]((uint64_t)self, (uint64_t)a4))
      && (-[HKMedicationsResolver createNgramCountsWithError:]((uint64_t)self, (uint64_t)a4),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          (v7 = v31) != 0))
    {
      v10 = objc_msgSend(v31, "seen");
      v11 = objc_msgSend(v31, "used");
      if (v11 == v9)
      {
        v12 = objc_alloc_init(HKMedicationsResolverResult);
      }
      else
      {
        v32->_numberOfNewNgrams = v10 - v8;
        v32->_numberOfUsedNgrams = v11 - v9;
        -[HKMedicationsResolver createNgramMapsWithError:]((uint64_t)v32, (uint64_t)a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          objc_msgSend(v15, "distinctHgIds");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v16)
          {
            v36 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v48 != v36)
                  objc_enumerationMutation(obj);
                v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                objc_msgSend(v15, "commonDict");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "integerForKey:", objc_msgSend(v18, "integerValue"));

                v21 = objc_msgSend(v15, "ngramCount");
                objc_msgSend(v15, "commonSetSizeDict");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "integerForKey:", objc_msgSend(v18, "integerValue"));

                v24 = v23 + v21;
                v43 = 0;
                v44 = &v43;
                v45 = 0x2020000000;
                v46 = (float)v20 / (float)(v23 + v21 - v20);
                v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v15, "uniqueDict");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v18, "integerValue");
                v37[0] = MEMORY[0x24BDAC760];
                v37[1] = 3221225472;
                v37[2] = __43__HKMedicationsResolver_resolveText_error___block_invoke;
                v37[3] = &unk_24EC1A1D0;
                v41 = v20;
                v42 = v24;
                v38 = v15;
                v28 = v25;
                v39 = v28;
                v40 = &v43;
                objc_msgSend(v26, "enumerateIntegersForKey:block:", v27, v37);

                objc_msgSend(v28, "sortUsingComparator:", &__block_literal_global);
                if (*((float *)v44 + 6) > 0.03)
                {
                  v29 = objc_alloc_init(HKMedicationsMercuryIdGroup);
                  -[HKMedicationsMercuryIdGroup setPrimaryHgId:](v29, "setPrimaryHgId:", objc_msgSend(v18, "integerValue"));
                  LODWORD(v30) = *((_DWORD *)v44 + 6);
                  -[HKMedicationsMercuryIdGroup setMaxJaccardSimilarity:](v29, "setMaxJaccardSimilarity:", v30);
                  -[HKMedicationsMercuryIdGroup setSubHgIds:](v29, "setSubHgIds:", v28);
                  -[HKMedicationsMercuryIdGroup setIngredientMatched:](v29, "setIngredientMatched:", 0);
                  objc_msgSend(v34, "addObject:", v29);

                }
                _Block_object_dispose(&v43, 8);
              }
              v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
            }
            while (v16);
          }

          objc_msgSend(v34, "sortUsingComparator:", &__block_literal_global_295);
          v12 = objc_alloc_init(HKMedicationsResolverResult);
          -[HKMedicationsResolverResult setLooksGeneric:](v12, "setLooksGeneric:", -[HKMedicationsResolver looksLikeGenericInText:]((uint64_t)v32, v33));
          -[HKMedicationsResolverResult setResolvedIds:](v12, "setResolvedIds:", v34);
          -[HKMedicationsResolverResult setNumberOfNewNgrams:](v12, "setNumberOfNewNgrams:", v32->_numberOfNewNgrams);
          -[HKMedicationsResolverResult setNumberOfUsedNgrams:](v12, "setNumberOfUsedNgrams:", v32->_numberOfUsedNgrams);

        }
        else
        {
          v12 = 0;
        }

        v7 = v31;
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_10:
    v12 = 0;
  }
LABEL_14:

  return v12;
}

void __43__HKMedicationsResolver_resolveText_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  float v11;
  HKMedicationsMercuryId *v12;

  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 56) + a2;
  objc_msgSend(*(id *)(a1 + 32), "uniqueSetSizeDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerForKey:", a3);

  v12 = objc_alloc_init(HKMedicationsMercuryId);
  -[HKMedicationsMercuryId setHgId:](v12, "setHgId:", a3);
  *(float *)&v9 = (float)v6 / (float)(v5 - v6 + v8);
  -[HKMedicationsMercuryId setJaccardSimilarity:](v12, "setJaccardSimilarity:", v9);
  -[HKMedicationsMercuryId setTradeNameMatched:](v12, "setTradeNameMatched:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(float *)(v10 + 24);
  if (v11 < (float)((float)v6 / (float)(v5 - v6 + v8)))
    v11 = (float)v6 / (float)(v5 - v6 + v8);
  *(float *)(v10 + 24) = v11;

}

uint64_t __43__HKMedicationsResolver_resolveText_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "jaccardSimilarity");
  v7 = v6;
  objc_msgSend(v5, "jaccardSimilarity");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "jaccardSimilarity");
    v11 = v10;
    objc_msgSend(v5, "jaccardSimilarity");
    if (v11 <= v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "hgId"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "hgId"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "compare:", v14);

    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __43__HKMedicationsResolver_resolveText_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "maxJaccardSimilarity");
  v7 = v6;
  objc_msgSend(v5, "maxJaccardSimilarity");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "maxJaccardSimilarity");
    v11 = v10;
    objc_msgSend(v5, "maxJaccardSimilarity");
    if (v11 <= v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "primaryHgId"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "primaryHgId"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "compare:", v14);

    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)filterAndAddGenerics:(id)a3 transcripts:(id)a4 criterion:(float)a5 limit:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  HKMedicationsResolverResult *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKMedicationsResolverResult *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  id v55;
  void *v56;
  int v57;
  HKMedicationsNumberToStringMap *v58;
  HKMedicationsNumberToStringMap *ingredients;
  HKMedicationsNumberToStringMap *v60;
  HKMedicationsNumberToStringMap *tradenames;
  void *v62;
  void *v63;
  NSDictionary *v64;
  NSDictionary *abbreviations;
  int64_t v67;
  unint64_t v68;
  void *v69;
  HKMedicationsResolverResult *v70;
  id v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  _QWORD v82[5];
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = v12;
  v81 = v13;
  v15 = objc_alloc_init(HKMedicationsResolverResult);
  objc_msgSend(v12, "resolvedIds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 < a6)
    a6 = v17;
  if (a5 == 0.0)
  {
    objc_msgSend(v14, "resolvedIds");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subarrayWithRange:", 0, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolverResult setResolvedIds:](v15, "setResolvedIds:", v19);

    objc_msgSend(v14, "ngramList");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolverResult setNgramList:](v15, "setNgramList:", v20);

    objc_msgSend(v14, "usedNgrams");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolverResult setUsedNgrams:](v15, "setUsedNgrams:", v21);

    v22 = v15;
  }
  else
  {
    v70 = v15;
    if (!self->_dbReady)
    {
      if ((-[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)a7) & 1) == 0)
      {
        v22 = 0;
        self->_dbReady = 0;
        goto LABEL_60;
      }
      v57 = -[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)a7);
      self->_dbReady = v57;
      if (!v57)
        goto LABEL_59;
    }
    if (!self->_ingredients)
    {
      -[HKMedicationsResolver ingredientsWithError:]((uint64_t)self, (uint64_t)a7);
      v58 = (HKMedicationsNumberToStringMap *)objc_claimAutoreleasedReturnValue();
      ingredients = self->_ingredients;
      self->_ingredients = v58;

      if (*a7)
        goto LABEL_59;
    }
    if (!self->_tradenames)
    {
      -[HKMedicationsResolver tradenamesWithError:]((uint64_t)self, (uint64_t)a7);
      v60 = (HKMedicationsNumberToStringMap *)objc_claimAutoreleasedReturnValue();
      tradenames = self->_tradenames;
      self->_tradenames = v60;

      if (*a7)
        goto LABEL_59;
    }
    if (!self->_abbreviations)
    {
      -[HKMedicationsResolver abbreviationsWithError:]((uint64_t)self, (uint64_t)a7);
      v64 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      abbreviations = self->_abbreviations;
      self->_abbreviations = v64;

      if (*a7)
      {
LABEL_59:
        v22 = 0;
        goto LABEL_60;
      }
    }
    v67 = a6;
    v71 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v14, "resolvedIds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v14;
    objc_msgSend(v14, "resolvedIds");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25 >= 0x32)
      v26 = 50;
    else
      v26 = v25;
    objc_msgSend(v23, "subarrayWithRange:", 0, v26, v67);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = v27;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
    if (v74)
    {
      v73 = *(_QWORD *)v93;
      v28 = 0x24BDBC000uLL;
      do
      {
        for (i = 0; i != v74; ++i)
        {
          if (*(_QWORD *)v93 != v73)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          v31 = objc_alloc_init(*(Class *)(v28 + 3824));
          v79 = v30;
          -[HKMedicationsNumberToStringMap stringForKey:](self->_ingredients, "stringForKey:", objc_msgSend(v30, "primaryHgId"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (!v32)
            goto LABEL_28;
          objc_msgSend(v32, "componentsSeparatedByString:", CFSTR(","));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObjectsFromArray:", v34);
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v35 = v34;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v89;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v89 != v38)
                  objc_enumerationMutation(v35);
                -[HKMedicationsResolver abbreviate:]((id *)&self->super.isa, *(void **)(*((_QWORD *)&v88 + 1) + 8 * j));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                if (v40)
                  objc_msgSend(v31, "addObject:", v40);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
            }
            while (v37);
          }

          v41 = objc_msgSend(v31, "count");
          if (v41)
          {
LABEL_28:
            v76 = v33;
            v77 = v31;
            v78 = i;
            v75 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:](self, v81, v31, 2, a5);
            v80 = objc_alloc_init(*(Class *)(v28 + 3824));
            v84 = 0u;
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            objc_msgSend(v79, "subHgIds");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
            if (v43)
            {
              v44 = v43;
              v45 = 0;
              v46 = *(_QWORD *)v85;
              do
              {
                for (k = 0; k != v44; ++k)
                {
                  if (*(_QWORD *)v85 != v46)
                    objc_enumerationMutation(v42);
                  v48 = objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * k), "hgId");
                  -[HKMedicationsNumberToStringMap stringForKey:](self->_tradenames, "stringForKey:", v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v49
                    && (objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v49),
                        v50 = (void *)objc_claimAutoreleasedReturnValue(),
                        v51 = -[HKMedicationsResolver checkLCSCriterion:transcripts:strings:normalizationType:tolerance:](self, v81, v50, 2, a5), v50, v51))
                  {
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v48);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "addObject:", v52);

                    v53 = 1;
                  }
                  else
                  {
                    v53 = 0;
                  }
                  v45 |= v53;

                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
              }
              while (v44);
            }
            else
            {
              v45 = 0;
            }

            v33 = v76;
            if (((v75 | v45) & 1) != 0)
            {
              -[HKMedicationsResolver updateIdGroup:ingredientMatched:tradeNameMatched:matchingTradeNames:]((uint64_t)self, v79, v75, v45 & 1, v80);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "addObject:", v54);

            }
            v28 = 0x24BDBC000;
            v31 = v77;
            i = v78;
          }

        }
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
      }
      while (v74);
    }

    objc_msgSend(v71, "sortUsingComparator:", &__block_literal_global_298);
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __80__HKMedicationsResolver_filterAndAddGenerics_transcripts_criterion_limit_error___block_invoke_2;
    v82[3] = &unk_24EC1A298;
    v82[4] = self;
    v14 = v69;
    v55 = v69;
    v83 = v55;
    objc_msgSend(v71, "enumerateObjectsUsingBlock:", v82);
    if (objc_msgSend(v71, "count") <= v68)
    {
      v15 = v70;
      -[HKMedicationsResolverResult setResolvedIds:](v70, "setResolvedIds:", v71);
    }
    else
    {
      objc_msgSend(v71, "subarrayWithRange:", 0, v68 - 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v70;
      -[HKMedicationsResolverResult setResolvedIds:](v70, "setResolvedIds:", v56);

    }
    objc_msgSend(v55, "ngramList");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolverResult setNgramList:](v15, "setNgramList:", v62);

    objc_msgSend(v55, "usedNgrams");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolverResult setUsedNgrams:](v15, "setUsedNgrams:", v63);

    v22 = v15;
  }
LABEL_60:

  return v22;
}

- (HKMedicationsNumberToStringMap)ingredientsWithError:(uint64_t)a1
{
  HKMedicationsNumberToStringMap *v4;
  void *v5;
  HKMedicationsNumberToStringMap *v6;
  int v7;
  HKMedicationsNumberToStringMap *v8;
  _QWORD v10[4];
  HKMedicationsNumberToStringMap *v11;

  if (!a1)
    return (HKMedicationsNumberToStringMap *)0;
  v4 = objc_alloc_init(HKMedicationsNumberToStringMap);
  v5 = *(void **)(a1 + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__HKMedicationsResolver_ingredientsWithError___block_invoke;
  v10[3] = &unk_24EC1A110;
  v6 = v4;
  v11 = v6;
  v7 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT hg_id, ingredient FROM ingredients"), a2, 0, v10);
  v8 = 0;
  if (v7)
    v8 = v6;

  return v8;
}

- (HKMedicationsNumberToStringMap)tradenamesWithError:(uint64_t)a1
{
  HKMedicationsNumberToStringMap *v4;
  void *v5;
  HKMedicationsNumberToStringMap *v6;
  int v7;
  HKMedicationsNumberToStringMap *v8;
  _QWORD v10[4];
  HKMedicationsNumberToStringMap *v11;

  if (!a1)
    return (HKMedicationsNumberToStringMap *)0;
  v4 = objc_alloc_init(HKMedicationsNumberToStringMap);
  v5 = *(void **)(a1 + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__HKMedicationsResolver_tradenamesWithError___block_invoke;
  v10[3] = &unk_24EC1A110;
  v6 = v4;
  v11 = v6;
  v7 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT specific_id, trade_name FROM trade_names"), a2, 0, v10);
  v8 = 0;
  if (v7)
    v8 = v6;

  return v8;
}

- (id)abbreviationsWithError:(uint64_t)a1
{
  id v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  _QWORD v10[4];
  id v11;

  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = *(void **)(a1 + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__HKMedicationsResolver_abbreviationsWithError___block_invoke;
  v10[3] = &unk_24EC1A110;
  v6 = v4;
  v11 = v6;
  v7 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT word, abbreviation FROM abbreviations"), a2, 0, v10);
  v8 = 0;
  if (v7)
    v8 = v6;

  return v8;
}

- (id)abbreviate:(id *)a1
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v2 = a1;
  v43 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a2, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
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
          v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v2[8], "objectForKeyedSubscript:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
          {
            v40 = v15;
            v41 = v16;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = v9;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v24, "allKeys");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "firstObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (id)objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v26, v27);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v21);
      }

      v2 = v3;
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (HKMedicationsMercuryIdGroup)updateIdGroup:(unsigned int)a3 ingredientMatched:(int)a4 tradeNameMatched:(void *)a5 matchingTradeNames:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  float v17;
  float v18;
  void *v19;
  int v20;
  float v21;
  float v22;
  HKMedicationsMercuryId *v23;
  double v24;
  float v25;
  float v26;
  HKMedicationsMercuryIdGroup *v27;
  double v28;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a5;
  if (a1)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v7, "subHgIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "hgId");
          objc_msgSend(v15, "jaccardSimilarity");
          v18 = v17;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v8, "containsObject:", v19);

          if (v20)
          {
            v21 = v18 + 1.0;
            if (!a3)
              v21 = v18;
            v22 = v21 + 1.0;
            v23 = objc_alloc_init(HKMedicationsMercuryId);
            -[HKMedicationsMercuryId setHgId:](v23, "setHgId:", v16);
            *(float *)&v24 = v22;
            -[HKMedicationsMercuryId setJaccardSimilarity:](v23, "setJaccardSimilarity:", v24);
            -[HKMedicationsMercuryId setTradeNameMatched:](v23, "setTradeNameMatched:", 1);
            objc_msgSend(v9, "addObject:", v23);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v12);
    }

    objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_300);
    objc_msgSend(v7, "maxJaccardSimilarity");
    if (a3)
      v25 = v25 + 1.0;
    if (a4)
      v26 = v25 + 1.0;
    else
      v26 = v25;
    v27 = objc_alloc_init(HKMedicationsMercuryIdGroup);
    -[HKMedicationsMercuryIdGroup setPrimaryHgId:](v27, "setPrimaryHgId:", objc_msgSend(v7, "primaryHgId"));
    *(float *)&v28 = v26;
    -[HKMedicationsMercuryIdGroup setMaxJaccardSimilarity:](v27, "setMaxJaccardSimilarity:", v28);
    -[HKMedicationsMercuryIdGroup setIngredientMatched:](v27, "setIngredientMatched:", a3);
    -[HKMedicationsMercuryIdGroup setSubHgIds:](v27, "setSubHgIds:", v9);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t __80__HKMedicationsResolver_filterAndAddGenerics_transcripts_criterion_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "maxJaccardSimilarity");
  v7 = v6;
  objc_msgSend(v5, "maxJaccardSimilarity");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "maxJaccardSimilarity");
    v11 = v10;
    objc_msgSend(v5, "maxJaccardSimilarity");
    if (v11 <= v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "primaryHgId"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "primaryHgId"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "compare:", v14);

    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __80__HKMedicationsResolver_filterAndAddGenerics_transcripts_criterion_limit_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HKMedicationsMercuryId *v4;
  float v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v9 = 0;
  if (-[HKMedicationsResolver getGenericSpecificIdForClinicalId:genericId:](*(_QWORD *)(a1 + 32), objc_msgSend(v3, "primaryHgId"), (uint64_t)&v9))
  {
    v4 = objc_alloc_init(HKMedicationsMercuryId);
    -[HKMedicationsMercuryId setHgId:](v4, "setHgId:", v9);
    objc_msgSend(v3, "maxJaccardSimilarity");
    *(float *)&v6 = v5 + 1.0;
    -[HKMedicationsMercuryId setJaccardSimilarity:](v4, "setJaccardSimilarity:", v6);
    -[HKMedicationsMercuryId setTradeNameMatched:](v4, "setTradeNameMatched:", 1);
    objc_msgSend(v3, "subHgIds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend(*(id *)(a1 + 40), "looksGeneric"))
      objc_msgSend(v8, "insertObject:atIndex:", v4, 0);
    else
      objc_msgSend(v8, "addObject:", v4);
    objc_msgSend(v3, "setSubHgIds:", v8);
    -[HKMedicationsMercuryId jaccardSimilarity](v4, "jaccardSimilarity");
    objc_msgSend(v3, "setMaxJaccardSimilarity:");

  }
}

uint64_t __93__HKMedicationsResolver_updateIdGroup_ingredientMatched_tradeNameMatched_matchingTradeNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "jaccardSimilarity");
  v7 = v6;
  objc_msgSend(v5, "jaccardSimilarity");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "jaccardSimilarity");
    v11 = v10;
    objc_msgSend(v5, "jaccardSimilarity");
    if (v11 <= v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "hgId"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "hgId"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "compare:", v14);

    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __48__HKMedicationsResolver_abbreviationsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  MEMORY[0x227683930](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x227683930](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

  return 1;
}

uint64_t __46__HKMedicationsResolver_ingredientsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = HDSQLiteColumnAsInt64();
  MEMORY[0x227683930](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setString:forKey:", v5, v4);

  return 1;
}

uint64_t __45__HKMedicationsResolver_tradenamesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = HDSQLiteColumnAsInt64();
  MEMORY[0x227683930](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setString:forKey:", v5, v4);

  return 1;
}

- (int64_t)consecutiveLCSUsingTranscript:(id)a3 prediction:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  int64_t v16;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = objc_msgSend(v6, "length");
  v19 = (uint64_t)&v19;
  v9 = 8 * (v7 + 1 + (v7 + 1) * v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v9);
  v21 = v7;
  if (v7 < 1)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    v12 = (uint64_t)&v10[8 * v8 + 16];
    v20 = 8 * v8 + 8;
    v13 = 1;
    do
    {
      if (v8 >= 1)
      {
        for (i = 0; i != v8; ++i)
        {
          v15 = objc_msgSend(v5, "characterAtIndex:", v13 - 1);
          if (v15 == objc_msgSend(v6, "characterAtIndex:", i))
          {
            v16 = *(_QWORD *)&v10[8 * i];
            *(_QWORD *)(v12 + 8 * i) = v16 + 1;
            if (v16 >= v11)
              v11 = v16 + 1;
          }
          else
          {
            *(_QWORD *)(v12 + 8 * i) = 0;
          }
        }
      }
      v12 += v20;
      v10 += v20;
    }
    while (v13++ != v21);
  }

  return v11;
}

- (int64_t)countOfContinousDigitsInLine:(id)a3
{
  id v3;
  int64_t v4;
  int64_t v5;
  unint64_t v6;
  unsigned int v7;
  int64_t v8;
  int64_t v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v3, "characterAtIndex:", v6) - 48;
      if (v4 <= v5)
        v8 = v5;
      else
        v8 = v4;
      if (v7 < 0xA)
        ++v5;
      else
        v5 = 0;
      if (v7 >= 0xA)
        v4 = v8;
      ++v6;
    }
    while (v6 < objc_msgSend(v3, "length"));
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 <= v5)
    v9 = v5;
  else
    v9 = v4;

  return v9;
}

- (id)hkt_ngramsFrom:(id)a3 minLength:(int64_t)a4 maxLength:(int64_t)a5
{
  return -[HKMedicationsResolver ngramsFrom:minLength:maxLength:]((uint64_t)self, a3, a4, a5);
}

- (BOOL)hkt_prepareNgramAssetWithError:(id *)a3
{
  if (-[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)a3)
    && -[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)a3))
  {
    return -[HKMedicationsResolver createNgramAssetsWithError:]((uint64_t)self, (uint64_t)a3);
  }
  else
  {
    return 0;
  }
}

- (id)hkt_createNgramMapsWithError:(id *)a3
{
  return -[HKMedicationsResolver createNgramMapsWithError:]((uint64_t)self, (uint64_t)a3);
}

- (int64_t)hkt_ngramIdCountWithError:(id *)a3
{
  HDSQLiteDatabase *db;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__HKMedicationsResolver_hkt_ngramIdCountWithError___block_invoke;
  v6[3] = &unk_24EC1A138;
  v6[4] = &v7;
  if ((-[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](db, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM ngram_id_list"), a3, 0, v6) & 1) != 0)v4 = v8[3];
  else
    v4 = -1;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __51__HKMedicationsResolver_hkt_ngramIdCountWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

- (id)hkt_ngramsWithError:(id *)a3
{
  HDSQLiteDatabase *db;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  db = self->_db;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__HKMedicationsResolver_hkt_ngramsWithError___block_invoke;
  v8[3] = &unk_24EC1A138;
  v8[4] = &v9;
  if ((-[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](db, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT * from ngram_list"), a3, 0, v8) & 1) != 0)v6 = (id)v10[5];
  else
    v6 = 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __45__HKMedicationsResolver_hkt_ngramsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  MEMORY[0x227683930](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  return 1;
}

- (BOOL)hkt_looksLikeGenericInText:(id)a3
{
  return -[HKMedicationsResolver looksLikeGenericInText:]((uint64_t)self, a3);
}

- (BOOL)hkt_setUpDatabase
{
  int v3;
  id v4;
  id v5;
  int v6;
  id v7;
  int v8;
  id v9;
  BOOL v10;
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = 0;
  v3 = -[HKMedicationsResolver setupDatabaseWithError:]((uint64_t)self, (uint64_t)&v15);
  v4 = v15;
  v5 = v4;
  if (v3)
  {
    v14 = v4;
    v6 = -[HKMedicationsResolver setupNgramTables:]((uint64_t)self, (uint64_t)&v14);
    v7 = v14;

    if (!v6)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v13 = v7;
    v8 = -[HKMedicationsResolver dropNgramAssetsWithError:]((uint64_t)self, (uint64_t)&v13);
    v5 = v13;

    if (v8)
    {
      v12 = v5;
      v9 = -[HKMedicationsResolver createNgramCountsWithError:]((uint64_t)self, (uint64_t)&v12);
      v7 = v12;

      v10 = 1;
LABEL_7:
      v5 = v7;
      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviations, 0);
  objc_storeStrong((id *)&self->_tradenames, 0);
  objc_storeStrong((id *)&self->_ingredients, 0);
  objc_storeStrong((id *)&self->_assetUrl, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)initWithAssetUrl:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_223139000, v2, v3, "[%@] failed to open in-memory db", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)setupDatabaseWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_223139000, v2, v3, "[%@] failed to create ngram_list", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)setupDatabaseWithError:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to attach asset db: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)setupNgramTables:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to create ngram tables: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)resetInMemoryDBWithError:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to reset assets: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)dropNgramAssetsWithError:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to drop assets: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)processNgramLine:n:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to delete from ngram_list_line: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)processNgramLine:n:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to insert into ngram_list_frame: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)processNgramLine:n:.cold.3()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_223139000, v2, v3, "[%@] failed to insert into ngram_list_line: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
