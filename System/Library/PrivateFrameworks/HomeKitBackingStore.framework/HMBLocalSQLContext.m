@implementation HMBLocalSQLContext

- (void)reloadSQLQueryMetadata
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__HMBLocalSQLContext_Queryable__reloadSQLQueryMetadata__block_invoke;
  v3[3] = &unk_1E8933B28;
  v3[4] = self;
  v2 = -[HMBLocalSQLContext sqlBlockWithActivity:block:](self, "sqlBlockWithActivity:block:", 0, v3);
}

- (BOOL)prepareTablesWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;
  HMBLocalSQLQueryTable *v14;
  HMBLocalSQLQueryTable *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  HMBLocalSQLQueryTable *v24;
  uint64_t v25;
  BOOL v26;
  HMBLocalSQLQueryTable *v27;
  void *v28;
  HMBLocalSQLContext *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMBLocalSQLQueryTable *v33;
  uint64_t k;
  HMBLocalSQLQueryTable *v35;
  HMBLocalSQLQueryTable *v36;
  BOOL v37;
  void *v38;
  HMBLocalSQLContext *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  HMBLocalSQLQueryTable *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  HMBLocalSQLContext *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMBLocalSQLContext *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id *v58;
  id v59;
  id v60;
  HMBLocalSQLContext *v61;
  HMBLocalSQLQueryTable *obj;
  uint64_t v63;
  uint64_t v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  HMBLocalSQLQueryTable *v87;
  __int16 v88;
  HMBLocalSQLQueryTable *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _QWORD v93[5];

  v93[2] = *MEMORY[0x1E0C80C00];
  if (!__reloadSQLQueryMetadata(self, a3))
    return 0;
  -[HMBLocalSQLContext queryTables](self, "queryTables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke;
  v83[3] = &unk_1E89333F8;
  v83[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v83);

  v93[0] = CFSTR("CREATE TABLE IF NOT EXISTS index_sentinel(                 store_id            INTEGER NOT NULL, type                TEXT NOT NULL, CONSTRAINT fk_index_sentinel FOREIGN KEY (store_id) REFERENCES store_v2 (id) ON DELETE CASCADE);");
  v93[1] = CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS index_sentinel_unique ON index_sentinel (store_id, type);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v80;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v80 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i)), "UTF8String");
        v78 = 0;
        v13 = -[HMBSQLContext runSQLite3:error:](self, "runSQLite3:error:", v12, &v78);
        v14 = (HMBLocalSQLQueryTable *)v78;
        v15 = v14;
        if (!v13)
        {
          v48 = (void *)MEMORY[0x1D17B6230]();
          v49 = self;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = v51;
            v86 = 2112;
            v87 = v15;
            _os_log_impl(&dword_1CCD48000, v50, OS_LOG_TYPE_ERROR, "%{public}@Adding sentinel table failed: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v48);
          if (a3)
          {
            v15 = objc_retainAutorelease(v15);
            v47 = 0;
            *a3 = v15;
          }
          else
          {
            v47 = 0;
          }
          v31 = v7;
          goto LABEL_49;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
      if (v9)
        continue;
      break;
    }
  }
  v58 = a3;
  v59 = v7;

  +[HMBModel hmbModelClassesWithQueries](HMBModel, "hmbModelClassesWithQueries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLContext queryTables](self, "queryTables");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v6;
  v75[1] = 3221225472;
  v75[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_44;
  v75[3] = &unk_1E8933448;
  v60 = v16;
  v76 = v60;
  v19 = v17;
  v77 = v19;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v75);

  v74 = 0u;
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  v15 = (HMBLocalSQLQueryTable *)v19;
  v20 = -[HMBLocalSQLQueryTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v72;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v72 != v22)
          objc_enumerationMutation(v15);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j));
        v24 = (HMBLocalSQLQueryTable *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v25 = -[HMBLocalSQLQueryTable UTF8String](v24, "UTF8String");
        v70 = 0;
        v26 = -[HMBSQLContext runSQLite3:error:](self, "runSQLite3:error:", v25, &v70);
        v27 = (HMBLocalSQLQueryTable *)v70;
        if (!v26)
        {
          v52 = (void *)MEMORY[0x1D17B6230]();
          v53 = self;
          HMFGetOSLogHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = v55;
            v86 = 2112;
            v87 = v27;
            _os_log_impl(&dword_1CCD48000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to clean up queryable table: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v52);
          v36 = v27;
          obj = v15;
LABEL_44:
          v7 = v59;
          if (v58)
            *v58 = objc_retainAutorelease(v27);

          v47 = 0;
          goto LABEL_47;
        }

      }
      v21 = -[HMBLocalSQLQueryTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
      if (v21)
        continue;
      break;
    }
  }

  v28 = (void *)MEMORY[0x1D17B6230]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v60;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "hmbDescription");
    v33 = (HMBLocalSQLQueryTable *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v85 = v32;
    v86 = 2112;
    v87 = v33;
    _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Preparing query contexts for %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = (HMBLocalSQLQueryTable *)v60;
  v64 = -[HMBLocalSQLQueryTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
  if (v64)
  {
    v63 = *(_QWORD *)v67;
    v61 = v29;
    while (2)
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v67 != v63)
          objc_enumerationMutation(obj);
        v35 = *(HMBLocalSQLQueryTable **)(*((_QWORD *)&v66 + 1) + 8 * k);
        v36 = -[HMBLocalSQLQueryTable initWithContext:queryModel:]([HMBLocalSQLQueryTable alloc], "initWithContext:queryModel:", v29, v35);
        v65 = 0;
        v37 = -[HMBLocalSQLQueryTable prepareWithError:](v36, "prepareWithError:", &v65);
        v27 = (HMBLocalSQLQueryTable *)v65;
        v38 = (void *)MEMORY[0x1D17B6230]();
        v39 = v29;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (!v37)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v85 = v56;
            v86 = 2112;
            v87 = v35;
            v88 = 2112;
            v89 = v27;
            _os_log_impl(&dword_1CCD48000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare query context for %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v38);
          v24 = v27;
          goto LABEL_44;
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBLocalSQLQueryTable modelType](v36, "modelType");
          v43 = (HMBLocalSQLQueryTable *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v42;
          v86 = 2112;
          v87 = v43;
          _os_log_impl(&dword_1CCD48000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Prepared query context for %@", buf, 0x16u);

          v29 = v61;
        }

        objc_autoreleasePoolPop(v38);
        -[HMBLocalSQLContext queryContextsByClass](v39, "queryContextsByClass");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v36, v35);

        -[HMBLocalSQLContext queryContextsByModelType](v39, "queryContextsByModelType");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBLocalSQLQueryTable modelType](v36, "modelType");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKey:", v36, v46);

      }
      v47 = 1;
      v64 = -[HMBLocalSQLQueryTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
      if (v64)
        continue;
      break;
    }
    v7 = v59;
LABEL_47:
    v31 = v60;
  }
  else
  {
    v47 = 1;
    v7 = v59;
  }

LABEL_49:
  return v47;
}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "columnNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Query Table: %@ <%@>", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "indexes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_38;
  v15[3] = &unk_1E89333D0;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_44(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a2;
  v8 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_2;
  v11[3] = &unk_1E8933420;
  v10 = v7;
  v12 = v10;
  v13 = &v15;
  v14 = a4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);
  if (!*((_BYTE *)v16 + 24))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

  _Block_object_dispose(&v15, 8);
}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_2(_QWORD *a1, Class aClass)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;

  v3 = (void *)a1[4];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(aClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("queryable_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqualToString:", v6);

  if ((_DWORD)v3)
  {
    v7 = (_BYTE *)a1[6];
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *v7 = 1;
  }
}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "columns");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEBUG, "%{public}@    %@ <%@>", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);

}

uint64_t __55__HMBLocalSQLContext_Queryable__reloadSQLQueryMetadata__block_invoke(uint64_t a1)
{
  __reloadSQLQueryMetadata(*(void **)(a1 + 32), 0);
  return 0;
}

- (HMBLocalSQLContext)initWithURL:(id)a3
{
  HMBLocalSQLContext *v3;
  uint64_t v4;
  NSMapTable *queryContextsByClass;
  uint64_t v6;
  NSMutableDictionary *queryContextsByModelType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMBLocalSQLContext;
  v3 = -[HMBSQLContext initWithURL:](&v9, sel_initWithURL_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    queryContextsByClass = v3->_queryContextsByClass;
    v3->_queryContextsByClass = (NSMapTable *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    queryContextsByModelType = v3->_queryContextsByModelType;
    v3->_queryContextsByModelType = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (id)sqlBlockWithActivity:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __49__HMBLocalSQLContext_sqlBlockWithActivity_block___block_invoke;
  v10[3] = &unk_1E8933BA0;
  v11 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalSQLContext;
  v10[0] = MEMORY[0x1E0C809B0];
  v6 = v11;
  -[HMBSQLContext sqlBlockWithActivity:block:](&v9, sel_sqlBlockWithActivity_block_, a3, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sqlTransactionWithActivity:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __55__HMBLocalSQLContext_sqlTransactionWithActivity_block___block_invoke;
  v10[3] = &unk_1E8933BA0;
  v11 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalSQLContext;
  v10[0] = MEMORY[0x1E0C809B0];
  v6 = v11;
  -[HMBSQLContext sqlTransactionWithActivity:block:](&v9, sel_sqlTransactionWithActivity_block_, a3, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)sqlBlockWithActivity:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMBLocalSQLContext *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4 && *a4)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *a4;
      v18 = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring SQL block request due to previous error: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = 0;
    v16 = 0;
  }
  else
  {
    -[HMBLocalSQLContext sqlBlockWithActivity:block:](self, "sqlBlockWithActivity:block:", v8, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;
    if (a4 && v15)
    {
      v15 = objc_retainAutorelease(v15);
      v16 = 0;
      *a4 = v15;
    }
  }

  return v16;
}

- (BOOL)sqlTransactionWithActivity:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMBLocalSQLContext *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4 && *a4)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *a4;
      v18 = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring SQL block request due to previous error: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = 0;
    v16 = 0;
  }
  else
  {
    -[HMBLocalSQLContext sqlTransactionWithActivity:block:](self, "sqlTransactionWithActivity:block:", v8, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;
    if (a4 && v15)
    {
      v15 = objc_retainAutorelease(v15);
      v16 = 0;
      *a4 = v15;
    }
  }

  return v16;
}

- (BOOL)prepareWithError:(id *)a3
{
  sqlite3 *v5;
  sqlite3_stmt *v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  sqlite3_stmt *v12;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  sqlite3_stmt *v18;
  id v19;
  sqlite3_stmt *v20;
  id v21;
  sqlite3_stmt *v22;
  id v23;
  sqlite3_stmt *v24;
  id v25;
  sqlite3_stmt *v26;
  id v27;
  void *v28;
  HMBSQLQueryStatement *v29;
  HMBSQLQueryStatement *selectReadyInputBlocks;
  void *v31;
  HMBSQLQueryStatement *v32;
  HMBSQLQueryStatement *selectReadyRollbackBlocks;
  sqlite3_stmt *v34;
  id v35;
  sqlite3_stmt *v36;
  id v37;
  sqlite3_stmt *v38;
  id v39;
  sqlite3_stmt *v40;
  id v41;
  sqlite3_stmt *v42;
  id v43;
  sqlite3_stmt *v44;
  id v45;
  sqlite3_stmt *v46;
  id v47;
  sqlite3_stmt *v48;
  id v49;
  sqlite3_stmt *v50;
  id v51;
  sqlite3_stmt *v52;
  id v53;
  sqlite3_stmt *v54;
  id v55;
  sqlite3_stmt *v56;
  id v57;
  sqlite3_stmt *v58;
  id v59;
  sqlite3_stmt *v60;
  id v61;
  sqlite3_stmt *v62;
  id v63;
  sqlite3_stmt *v64;
  id v65;
  sqlite3_stmt *v66;
  id v67;
  sqlite3_stmt *v68;
  id v69;
  sqlite3_stmt *v70;
  id v71;
  sqlite3_stmt *v72;
  id v73;
  sqlite3_stmt *v74;
  id v75;
  sqlite3_stmt *v76;
  id v77;
  sqlite3_stmt *v78;
  id v79;
  sqlite3_stmt *v80;
  id v81;
  sqlite3_stmt *v82;
  id v83;
  sqlite3_stmt *v84;
  id v85;
  sqlite3_stmt *v86;
  id v87;
  sqlite3_stmt *v88;
  id v89;
  sqlite3_stmt *v90;
  id v91;
  sqlite3_stmt *v92;
  id v93;
  sqlite3_stmt *v94;
  id v95;
  sqlite3_stmt *v96;
  id v97;
  sqlite3_stmt *v98;
  id v99;
  sqlite3_stmt *v100;
  id v101;
  sqlite3_stmt *v102;
  id v103;
  sqlite3_stmt *v104;
  id v105;
  sqlite3_stmt *v106;
  id v107;
  sqlite3_stmt *v108;
  id v109;
  sqlite3_stmt *v110;
  HMBSQLQueryStatement *v111;
  HMBSQLQueryStatement *selectAllRecordRows;
  HMBSQLQueryStatement *v113;
  HMBSQLQueryStatement *selectAllRecordTypeRows;
  void *v115;
  HMBSQLQueryStatement *v116;
  HMBSQLQueryStatement *selectAllRecordParentModelIDRows;
  HMBSQLQueryStatement *v118;
  HMBSQLQueryStatement *selectAllRecordParentModelIDTypeRows;
  sqlite3_stmt *v120;
  id v121;
  sqlite3_stmt *v122;
  id v123;
  sqlite3_stmt *v124;
  id v125;
  sqlite3_stmt *v126;
  void *v127;
  HMBLocalSQLContext *v128;
  NSObject *v129;
  void *v130;
  const char *v131;
  BOOL v132;
  BOOL v133;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  objc_super v190;
  uint8_t buf[4];
  void *v192;
  __int16 v193;
  id v194;
  uint64_t v195;

  v195 = *MEMORY[0x1E0C80C00];
  v190.receiver = self;
  v190.super_class = (Class)HMBLocalSQLContext;
  if (-[HMBSQLContext prepareWithError:](&v190, sel_prepareWithError_))
  {
    v5 = -[HMBSQLContext context](self, "context");
    v189 = 0;
    v6 = prepareSQLite3(v5, "INSERT INTO store_v2 (label, identifier_data, replication_data) VALUES (?1, ?2, ?3)", &v189);
    v7 = v189;
    self->insertStore = v6;
    v188 = v7;
    v8 = prepareSQLite3(v5, "DELETE FROM store_v2 WHERE id=?1;", &v188);
    v9 = v188;

    self->deleteStore = v8;
    v187 = v9;
    v10 = prepareSQLite3(v5, "SELECT id, label, identifier_data, replication_data FROM store_v2 WHERE id=?1;", &v187);
    v11 = v187;

    self->selectStore = v10;
    v186 = v11;
    v12 = prepareSQLite3(v5, "SELECT id, label, identifier_data, replication_data FROM store_v2;", &v186);
    v13 = v186;

    self->selectStores = v12;
    v185 = v13;
    v14 = prepareSQLite3(v5, "UPDATE store_v2 SET replication_data=?2 WHERE id=?1;", &v185);
    v15 = v185;

    self->updateStoreReplicationData = v14;
    v184 = v15;
    v16 = prepareSQLite3(v5, "INSERT INTO block_v2 (store_v2_id, type) VALUES (?1, ?2);", &v184);
    v17 = v184;

    self->insertBlock = v16;
    v183 = v17;
    v18 = prepareSQLite3(v5, "SELECT id, type, options_data FROM block_v2 WHERE id=?1;", &v183);
    v19 = v183;

    self->selectBlock = v18;
    v182 = v19;
    v20 = prepareSQLite3(v5, "DELETE FROM block_v2 WHERE id=?1;", &v182);
    v21 = v182;

    self->deleteBlock = v20;
    v181 = v21;
    v22 = prepareSQLite3(v5, "DELETE FROM block_v2 WHERE store_v2_id=?1;", &v181);
    v23 = v181;

    self->deleteBlocksStore = v22;
    v180 = v23;
    v24 = prepareSQLite3(v5, "UPDATE block_v2 SET options_data=?2 WHERE id=?1;", &v180);
    v25 = v180;

    self->updateBlock = v24;
    v179 = v25;
    v26 = prepareSQLite3(v5, "SELECT id, options_data FROM block_v2 WHERE store_v2_id=?1 AND type=?2 AND options_data IS NOT NULL ORDER BY id;",
            &v179);
    v27 = v179;

    self->selectReadyBlocks = v26;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT id, type, options_data FROM block_v2 WHERE store_v2_id=:_store_id AND id>:_sequence_offset AND (type=1 OR type=2) AND options_data IS NOT NULL ORDER BY id LIMIT (%ld)"), +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", self, v28);
    selectReadyInputBlocks = self->_selectReadyInputBlocks;
    self->_selectReadyInputBlocks = v29;

    if (!self->_selectReadyInputBlocks)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT id, type, options_data FROM block_v2 WHERE store_v2_id=:_store_id AND id<=:_sequence_offset AND type=3 ORDER BY id DESC LIMIT (%lu)"), +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", self, v31);
    selectReadyRollbackBlocks = self->_selectReadyRollbackBlocks;
    self->_selectReadyRollbackBlocks = v32;

    if (!self->_selectReadyRollbackBlocks)
      goto LABEL_12;
    v178 = v27;
    v34 = prepareSQLite3(v5, "DELETE FROM block_v2 WHERE store_v2_id=?1 AND options_data IS NULL;", &v178);
    v35 = v178;

    self->deleteNullBlocks = v34;
    v177 = v35;
    v36 = prepareSQLite3(v5, "INSERT INTO transaction_v2 (store_v2_id, block_id, type, external_id, external_data, model_encoding, model_data) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7);",
            &v177);
    v37 = v177;

    self->insertItem = v36;
    v176 = v37;
    v38 = prepareSQLite3(v5, "INSERT INTO transaction_v2 (store_v2_id, block_id, type, external_id, model_encoding, model_data) SELECT ?1, ?2, ?3, COALESCE(external_id, randomblob(16)), 0, uuid FROM record_v2 WHERE store_v2_id = ?1 AND type = ?4 AND model_data IS NOT NULL;",
            &v176);
    v39 = v176;

    self->insertDeletionItemsForRecordsOfType = v38;
    v175 = v39;
    v40 = prepareSQLite3(v5, "INSERT INTO transaction_v2 (store_v2_id, block_id, type, external_id, model_encoding, model_data) SELECT ?1, ?2, ?3, COALESCE(external_id, randomblob(16)), 0, uuid FROM record_v2 WHERE store_v2_id = ?1 AND uuid = ?4 AND model_data IS NOT NULL;",
            &v175);
    v41 = v175;

    self->insertDeletionItemsForRecordWithUUID = v40;
    v174 = v41;
    v42 = prepareSQLite3(v5, "INSERT INTO transaction_v2 (store_v2_id, block_id, type, external_id, model_encoding, model_data) SELECT ?1, ?2, ?3, COALESCE(external_id, randomblob(16)), 0, uuid FROM record_v2 WHERE store_v2_id = ?1 AND parent_uuid = ?4 AND model_data IS NOT NULL;",
            &v174);
    v43 = v174;

    self->insertDeletionItemsForRecordsWithParentUUID = v42;
    v173 = v43;
    v44 = prepareSQLite3(v5, "INSERT OR REPLACE INTO transaction_v2 (store_v2_id, block_id, type, external_id, external_data, model_encoding, model_data) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7);",
            &v173);
    v45 = v173;

    self->updateItem = v44;
    v172 = v45;
    v46 = prepareSQLite3(v5, "DELETE FROM transaction_v2 WHERE id=?1;", &v172);
    v47 = v172;

    self->deleteItem = v46;
    v171 = v47;
    v48 = prepareSQLite3(v5, "DELETE FROM transaction_v2 where block_id=?1;", &v171);
    v49 = v171;

    self->deleteItemsBlock = v48;
    v170 = v49;
    v50 = prepareSQLite3(v5, "DELETE FROM transaction_v2 WHERE store_v2_id=?1;", &v170);
    v51 = v170;

    self->deleteItemsStore = v50;
    v169 = v51;
    v52 = prepareSQLite3(v5, "DELETE FROM transaction_v2 WHERE store_v2_id=?1 AND type=?2 AND external_id=?3;", &v169);
    v53 = v169;

    self->deleteItemStoreExternal = v52;
    v168 = v53;
    v54 = prepareSQLite3(v5, "SELECT id, external_id, external_data, model_encoding, model_data FROM transaction_v2 WHERE  block_id=?1 AND id>?2 ORDER BY id LIMIT ?3;",
            &v168);
    v55 = v168;

    self->selectItemsBlockLimit = v54;
    v167 = v55;
    v56 = prepareSQLite3(v5, "SELECT id, external_id, external_data, model_encoding, model_data FROM transaction_v2 WHERE  block_id=?1;",
            &v167);
    v57 = v167;

    self->selectItemsBlock = v56;
    v166 = v57;
    v58 = prepareSQLite3(v5, "DELETE FROM transaction_v2 WHERE block_id IN (SELECT id FROM block_v2 WHERE store_v2_id=?1 AND options_data IS NULL)", &v166);
    v59 = v166;

    self->deleteNullItems = v58;
    v165 = v59;
    v60 = prepareSQLite3(v5, "DELETE FROM transaction_v2 WHERE block_id IN (SELECT id FROM block_v2 WHERE store_v2_id=?1 AND type=?2 AND options_data IS NULL)", &v165);
    v61 = v165;

    self->deleteNullItemsType = v60;
    v164 = v61;
    v62 = prepareSQLite3(v5, "INSERT INTO record_v2                                         (store_v2_id, external_id, external_data, uuid, parent_uuid, type, model_encoding, model_data, model_schema, push_encoding, push_data, push_block_id)                                         VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12);",
            &v164);
    v63 = v164;

    self->insertRecord = v62;
    v163 = v63;
    v64 = prepareSQLite3(v5, "UPDATE record_v2 SET model_encoding=?2, model_data=?3, model_schema=?4 WHERE id=?1", &v163);
    v65 = v163;

    self->updateRecord = v64;
    v162 = v65;
    v66 = prepareSQLite3(v5, "UPDATE record_v2 SET external_id=?2, external_data=?3 WHERE id=?1", &v162);
    v67 = v162;

    self->updateRecordExternal = v66;
    v161 = v67;
    v68 = prepareSQLite3(v5, "UPDATE record_v2 SET external_data=?3 WHERE store_v2_id=?1 AND external_id=?2", &v161);
    v69 = v161;

    self->updateRecordExternalExternal = v68;
    v160 = v69;
    v70 = prepareSQLite3(v5, "UPDATE record_v2 SET external_data=?3 WHERE store_v2_id=?1 AND uuid=?2", &v160);
    v71 = v160;

    self->updateRecordExternalUUID = v70;
    v159 = v71;
    v72 = prepareSQLite3(v5, "UPDATE record_v2 SET push_encoding = ?2, push_data = ?3, push_block_id = ?4 WHERE id = ?1;",
            &v159);
    v73 = v159;

    self->updateRecordPush = v72;
    v158 = v73;
    v74 = prepareSQLite3(v5, "UPDATE record_v2 SET push_encoding = ?3, push_data = ?4, push_block_id = ?5 WHERE store_v2_id = ?1 AND uuid=?2;",
            &v158);
    v75 = v158;

    self->updateRecordPushUUID = v74;
    v157 = v75;
    v76 = prepareSQLite3(v5, "UPDATE record_v2 SET push_encoding = 0, push_data = NULL, push_block_id = NULL WHERE id=?1 AND push_block_id=?2;",
            &v157);
    v77 = v157;

    self->updateRecordClearPushExpected = v76;
    v156 = v77;
    v78 = prepareSQLite3(v5, "UPDATE record_v2 SET push_encoding = 0, push_data = NULL, push_block_id = NULL WHERE push_block_id=?1", &v156);
    v79 = v156;

    self->updateRecordsClearPush = v78;
    v155 = v79;
    v80 = prepareSQLite3(v5, "UPDATE record_v2 SET type = ?2, model_schema = ?3 WHERE id = ?1", &v155);
    v81 = v155;

    self->updateRecordType = v80;
    v154 = v81;
    v82 = prepareSQLite3(v5, "DELETE FROM record_v2 WHERE id=?1;", &v154);
    v83 = v154;

    self->deleteRecord = v82;
    v153 = v83;
    v84 = prepareSQLite3(v5, "DELETE FROM record_v2 WHERE id=?1 and push_block_id=?2;", &v153);
    v85 = v153;

    self->deleteRecordBlock = v84;
    v152 = v85;
    v86 = prepareSQLite3(v5, "DELETE FROM record_v2 WHERE store_v2_id=?1 AND uuid=?2;", &v152);
    v87 = v152;

    self->deleteRecordUUID = v86;
    v151 = v87;
    v88 = prepareSQLite3(v5, "DELETE FROM record_v2 WHERE store_v2_id=?1 AND external_id=?2;", &v151);
    v89 = v151;

    self->deleteRecordExternal = v88;
    v150 = v89;
    v90 = prepareSQLite3(v5, "DELETE FROM record_v2 WHERE store_v2_id=?1;", &v150);
    v91 = v150;

    self->deleteRecordsStore = v90;
    v149 = v91;
    v92 = prepareSQLite3(v5, "DELETE FROM record_v2 WHERE store_v2_id = ?1 AND (model_encoding = 0 OR model_data IS NULL) AND (push_block_id IS NULL OR push_block_id NOT IN (SELECT id FROM block_v2))", &v149);
    v93 = v149;

    self->deleteZombieRecords = v92;
    v148 = v93;
    v94 = prepareSQLite3(v5, "SELECT uuid FROM record_v2 WHERE store_v2_id=?1 AND external_id=?2", &v148);
    v95 = v148;

    self->selectRecordUUIDExternal = v94;
    v147 = v95;
    v96 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE push_block_id=?1", &v147);
    v97 = v147;

    self->selectRecordsPushBlock = v96;
    v146 = v97;
    v98 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=?1 and uuid=?2", &v146);
    v99 = v146;

    self->selectRecordUUID = v98;
    v145 = v99;
    v100 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=?1 and external_id=?2", &v145);
    v101 = v145;

    self->selectRecordExternal = v100;
    v144 = v101;
    v102 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=?1 and parent_uuid=?2", &v144);
    v103 = v144;

    self->selectRecordsParentUUID = v102;
    v143 = v103;
    v104 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=?1 and type=?2", &v143);
    v105 = v143;

    self->selectRecordsOfType = v104;
    v142 = v105;
    v106 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=?1 AND parent_uuid=?3 AND type=?2", &v142);
    v107 = v142;

    self->selectRecordsParentUUIDType = v106;
    v141 = v107;
    v108 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=?1", &v141);
    v109 = v141;

    self->selectRecords = v108;
    v140 = v109;
    v110 = prepareSQLite3(v5, "SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE id=?1", &v140);
    v27 = v140;

    self->selectRecord = v110;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=:_store_id AND id>:_sequence_offset ORDER BY id LIMIT (%lu)"), +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", self, v28);
    selectAllRecordRows = self->_selectAllRecordRows;
    self->_selectAllRecordRows = v111;

    if (!self->_selectAllRecordRows)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=:_store_id AND type=:_model_type AND id>:_sequence_offset ORDER BY id LIMIT (%lu)"), +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v113 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", self, v31);
    selectAllRecordTypeRows = self->_selectAllRecordTypeRows;
    self->_selectAllRecordTypeRows = v113;

    if (self->_selectAllRecordTypeRows)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=:_store_id AND parent_uuid=:_parent_uuid AND id>:_sequence_offset ORDER BY id LIMIT (%lu)"), +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      v116 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", self, v115);
      selectAllRecordParentModelIDRows = self->_selectAllRecordParentModelIDRows;
      self->_selectAllRecordParentModelIDRows = v116;

      if (self->_selectAllRecordParentModelIDRows)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT record_v2.id, record_v2.external_id, record_v2.external_data, record_v2.model_encoding, record_v2.model_data, record_v2.model_schema, record_v2.type, record_v2.push_encoding, record_v2.push_data, record_v2.push_block_id, record_v2.uuid FROM record_v2 WHERE store_v2_id=:_store_id AND parent_uuid=:_parent_uuid AND type == :_type AND id>:_sequence_offset ORDER BY id LIMIT (%lu)"), +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v118 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", self, v28);
        selectAllRecordParentModelIDTypeRows = self->_selectAllRecordParentModelIDTypeRows;
        self->_selectAllRecordParentModelIDTypeRows = v118;

        if (!self->_selectAllRecordParentModelIDTypeRows)
          goto LABEL_21;
        v139 = v27;
        v120 = prepareSQLite3(v5, "INSERT INTO index_sentinel (store_id, type) VALUES(?1, ?2);", &v139);
        v121 = v139;

        self->insertIndexSentinel = v120;
        v138 = v121;
        v122 = prepareSQLite3(v5, "DELETE FROM index_sentinel WHERE type = ?1;", &v138);
        v123 = v138;

        self->deleteIndexSentinels = v122;
        v137 = v123;
        v124 = prepareSQLite3(v5, "DELETE FROM index_sentinel WHERE store_id = ?1;", &v137);
        v125 = v137;

        self->deleteIndexSentinelsStore = v124;
        v136 = v125;
        v126 = prepareSQLite3(v5, "SELECT COUNT('X') FROM index_sentinel WHERE store_id = ?1 and type = ?2;", &v136);
        v27 = v136;

        self->selectIndexSentinel = v126;
        if (v27)
        {
          v127 = (void *)MEMORY[0x1D17B6230]();
          v128 = self;
          HMFGetOSLogHandle();
          v129 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          HMFGetLogIdentifier();
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v192 = v130;
          v193 = 2112;
          v194 = v27;
          v131 = "%{public}@unable to prepare SQL statements: %@";
          goto LABEL_18;
        }
        v135 = 0;
        v133 = -[HMBLocalSQLContext prepareTablesWithError:](self, "prepareTablesWithError:", &v135);
        v27 = v135;
        if (!v133)
        {
          v127 = (void *)MEMORY[0x1D17B6230]();
          v128 = self;
          HMFGetOSLogHandle();
          v129 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          HMFGetLogIdentifier();
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v192 = v130;
          v193 = 2112;
          v194 = v27;
          v131 = "%{public}@Failed to prepare tables: %@";
LABEL_18:
          _os_log_impl(&dword_1CCD48000, v129, OS_LOG_TYPE_ERROR, v131, buf, 0x16u);

LABEL_19:
          objc_autoreleasePoolPop(v127);
          if (a3)
          {
            v27 = objc_retainAutorelease(v27);
            v132 = 0;
            *a3 = v27;
            goto LABEL_22;
          }
LABEL_21:
          v132 = 0;
          goto LABEL_22;
        }
        v132 = 1;
      }
      else
      {
        v132 = 0;
        v28 = v115;
      }
    }
    else
    {
LABEL_12:
      v132 = 0;
      v28 = v31;
    }
LABEL_22:

    return v132;
  }
  return 0;
}

- (BOOL)initializeNewlyCreatedDatabaseWithError:(id *)a3
{
  HMBLocalSQLContext *v4;
  sqlite3 *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMBLocalSQLContext *v14;
  sqlite3 *v15;
  id v16;
  const char *v17;
  void *v18;
  HMBLocalSQLContext *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMBLocalSQLContext *v23;
  NSObject *v24;
  void *v25;
  HMBLocalSQLContext *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  id v41;
  uint64_t v42;
  BOOL v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  HMBLocalSQLContext *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  HMBLocalSQLContext *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMBLocalSQLContext *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v64;
  HMBLocalSQLContext *v65;
  NSObject *v66;
  void *v67;
  id *v68;
  uint64_t v69;
  objc_super v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[12];
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  id v80;
  uint8_t v81[32];
  __int128 v82;
  __int128 v83;
  uint8_t v84[4];
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  uint8_t buf[32];
  __int128 v91;
  __int128 v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = self;
  v5 = -[HMBSQLContext context](v4, "context");
  *(_QWORD *)&v72 = 0;
  selectSQLite3(v5, "SELECT name FROM sqlite_master WHERE type = 'table' and name in ('zone_v2', 'zone_subscription_v2', 'db_subscription_v2', 'fetch_v2', 'queue_v2', 'scoreboard_v2', 'xact_v2', 'xact_block_v2')", MEMORY[0x1E0C9AA70], &v72);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)v72;
  v68 = a3;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      v82 = 0u;
      v83 = 0u;
      memset(v81, 0, sizeof(v81));
      v8 = objc_msgSend(&unk_1E8947948, "countByEnumeratingWithState:objects:count:", v81, v84, 16);
      if (v8)
      {
        v9 = v8;
        v69 = **(_QWORD **)&v81[16];
        do
        {
          v10 = 0;
          v11 = v6;
          v12 = v7;
          do
          {
            if (**(_QWORD **)&v81[16] != v69)
              objc_enumerationMutation(&unk_1E8947948);
            v13 = *(_QWORD *)(*(_QWORD *)&v81[8] + 8 * v10);
            v14 = v4;
            v15 = -[HMBSQLContext context](v4, "context");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@;"), v13);
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v17 = (const char *)objc_msgSend(v16, "UTF8String");
            *(_QWORD *)v76 = v12;
            selectSQLite3(v15, v17, MEMORY[0x1E0C9AA70], v76);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = *(id *)v76;

            if (!v6)
            {
              v18 = (void *)MEMORY[0x1D17B6230]();
              v19 = v14;
              HMFGetOSLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v21;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v13;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)&buf[24] = 0;
                _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove old table %@: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v18);
            }
            ++v10;
            v11 = v6;
            v12 = v7;
            v4 = v14;
          }
          while (v9 != v10);
          v9 = objc_msgSend(&unk_1E8947948, "countByEnumeratingWithState:objects:count:", v81, v84, 16);
        }
        while (v9);
      }
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B6230]();
    v23 = v4;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v84 = 138543618;
      v85 = v25;
      v86 = 2112;
      v87 = v7;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine if old tables are in the database: %@", v84, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v6 = 0;
  }

  v26 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("CREATE TABLE IF NOT EXISTS store_v2(                              id                  INTEGER PRIMARY KEY AUTOINCREMENT,                label               STRING  NOT NULL,                                 identifier_data     BLOB UNIQUE NOT NULL,                             replication_data    BLOB                                             );"),
    CFSTR("CREATE TABLE IF NOT EXISTS block_v2(                              id                  INTEGER PRIMARY KEY AUTOINCREMENT,                store_v2_id         INTEGER NOT NULL CONSTRAINT fetch_store_v2_id_fkey REFERENCES store_v2 (id) ON DELETE RESTRICT,             type                INTEGER NOT NULL,                                 options_data        BLOB                                             );"),
    CFSTR("CREATE TABLE IF NOT EXISTS transaction_v2(                        id                  INTEGER PRIMARY KEY AUTOINCREMENT,                store_v2_id         INTEGER NOT NULL CONSTRAINT fetch_store_v2_id_fkey REFERENCES store_v2 (id) ON DELETE RESTRICT,             block_id            INTEGER NOT NULL CONSTRAINT transaction_v2_block_v2_id_fkey REFERENCES block_v2 (id) ON DELETE RESTRICT,             type                INTEGER NOT NULL,                                 external_id         BLOB    NOT NULL,                                 external_data       BLOB,                                             model_encoding      INTEGER NOT NULL,                                 model_data          BLOB                                             );"),
    CFSTR("CREATE TABLE IF NOT EXISTS record_v2(                             id                  INTEGER PRIMARY KEY AUTOINCREMENT,                store_v2_id         INTEGER NOT NULL CONSTRAINT record_v2_group_id_fkey REFERENCES store_v2 (id) ON DELETE RESTRICT,             uuid                BLOB    NOT NULL,                                 parent_uuid         BLOB    NOT NULL,                                 type                TEXT,                                             model_schema        BLOB,                                             external_id         BLOB,                                             external_data       BLOB,                                             model_encoding      INTEGER NOT NULL,                                 model_data          BLOB,                                             push_encoding       INTEGER NOT NULL,                                 push_data           BLOB,                                             push_block_id       INTEGER CONSTRAINT record_v2_block_v2_fkey REFERENCES block_v2 (id) ON DELETE RESTRICT            );"),
    CFSTR("CREATE TABLE IF NOT EXISTS index_sentinel(                 store_id            INTEGER NOT NULL, type                TEXT NOT NULL, CONSTRAINT fk_index_sentinel FOREIGN KEY (store_id) REFERENCES store_v2 (id) ON DELETE CASCADE);"),
    0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 0, sizeof(buf));
  v91 = 0u;
  v92 = 0u;
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", buf, v84, 16);
  if (v29)
  {
    v30 = v29;
    v31 = **(_QWORD **)&buf[16];
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (**(_QWORD **)&buf[16] != v31)
          objc_enumerationMutation(v28);
        v33 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 8 * i));
        -[HMBSQLContext runSQLite3:](v26, "runSQLite3:", objc_msgSend(v33, "UTF8String"));
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v46 = (void *)v34;
          v47 = (void *)MEMORY[0x1D17B6230]();
          v48 = v26;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v81 = 138543874;
            *(_QWORD *)&v81[4] = v50;
            *(_WORD *)&v81[12] = 2112;
            *(_QWORD *)&v81[14] = v33;
            *(_WORD *)&v81[22] = 2112;
            *(_QWORD *)&v81[24] = v46;
            _os_log_impl(&dword_1CCD48000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize SQL table %@: %@", v81, 0x20u);

          }
          objc_autoreleasePoolPop(v47);
          sqlite3_close(-[HMBSQLContext context](v48, "context"));
          v51 = v46;
          v44 = v51;
          v36 = v28;
          goto LABEL_39;
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", buf, v84, 16);
      if (v30)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS transaction_v2_ukey ON transaction_v2 (store_v2_id, type, external_id);"),
    CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS record_v2_external_store_v2_id_ukey ON record_v2 (store_v2_id, external_id);"),
    CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS record_v2_uuid_store_v2_id_ukey ON record_v2 (store_v2_id, uuid);"),
    CFSTR("CREATE INDEX IF NOT EXISTS block_v2_store_type ON block_v2 (store_v2_id, type, id);"),
    CFSTR("CREATE INDEX IF NOT EXISTS transaction_v2_block_id ON transaction_v2 (block_id, id);"),
    CFSTR("CREATE INDEX IF NOT EXISTS record_v2_push_id ON record_v2 (push_block_id, id);"),
    CFSTR("CREATE INDEX IF NOT EXISTS record_v2_store ON record_v2 (store_v2_id);"),
    CFSTR("CREATE INDEX IF NOT EXISTS record_v2_store_uuid ON record_v2 (store_v2_id, uuid);"),
    CFSTR("CREATE INDEX IF NOT EXISTS record_v2_store_parent_uuid ON record_v2 (store_v2_id, parent_uuid);"),
    CFSTR("CREATE INDEX IF NOT EXISTS record_v2_store_type_parent_uuid ON record_v2 (store_v2_id, parent_uuid, type);"),
    CFSTR("CREATE INDEX IF NOT EXISTS record_v2_store_external ON record_v2 (store_v2_id, external_id);"),
    CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS index_sentinel_unique ON index_sentinel (store_id, type);"),
    0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v36 = v35;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v73;
    while (2)
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v73 != v39)
          objc_enumerationMutation(v36);
        v41 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j));
        -[HMBSQLContext runSQLite3:](v26, "runSQLite3:", objc_msgSend(v41, "UTF8String"));
        v42 = objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v52 = (void *)v42;
          v53 = (void *)MEMORY[0x1D17B6230]();
          v54 = v26;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v76 = 138543874;
            *(_QWORD *)&v76[4] = v56;
            v77 = 2112;
            v78 = (uint64_t)v41;
            v79 = 2112;
            v80 = v52;
            _os_log_impl(&dword_1CCD48000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize SQL index %@: %@", v76, 0x20u);

          }
          objc_autoreleasePoolPop(v53);
          sqlite3_close(-[HMBSQLContext context](v54, "context"));
          v44 = v52;

          v45 = v44;
          goto LABEL_43;
        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      if (v38)
        continue;
      break;
    }
  }

  v71 = 0;
  v43 = -[HMBSQLContext setSchemaVersion:error:](v26, "setSchemaVersion:error:", 1, &v71);
  v44 = v71;
  if (v43)
  {
    v45 = 0;
  }
  else
  {
    v64 = (void *)MEMORY[0x1D17B6230]();
    v65 = v26;
    HMFGetOSLogHandle();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v76 = 138543874;
      *(_QWORD *)&v76[4] = v67;
      v77 = 2048;
      v78 = 1;
      v79 = 2112;
      v80 = v44;
      _os_log_impl(&dword_1CCD48000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to updated schema version to current version %lu: %@", v76, 0x20u);

    }
    objc_autoreleasePoolPop(v64);
    sqlite3_close(-[HMBSQLContext context](v65, "context"));
    v51 = v44;
    v44 = v51;
LABEL_39:
    v45 = v51;
  }
LABEL_43:

  if (v45)
  {
    v57 = (void *)MEMORY[0x1D17B6230]();
    v58 = v26;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBSQLContext url](v58, "url");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v84 = 138543874;
      v85 = v60;
      v86 = 2112;
      v87 = v61;
      v88 = 2112;
      v89 = v45;
      _os_log_impl(&dword_1CCD48000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to create SQLite datastore %@: %@", v84, 0x20u);

    }
    objc_autoreleasePoolPop(v57);
    v62 = 0;
    if (v68)
      *v68 = objc_retainAutorelease(v45);
  }
  else
  {
    v70.receiver = v26;
    v70.super_class = (Class)HMBLocalSQLContext;
    v62 = -[HMBSQLContext initializeNewlyCreatedDatabaseWithError:](&v70, sel_initializeNewlyCreatedDatabaseWithError_, v68);
  }

  return v62;
}

- (void)finalize
{
  HMBLocalSQLContext *v2;
  sqlite3_stmt *insertStore;
  sqlite3_stmt *deleteStore;
  sqlite3_stmt *selectStore;
  sqlite3_stmt *selectStores;
  sqlite3_stmt *updateStoreReplicationData;
  sqlite3_stmt *insertBlock;
  sqlite3_stmt *selectBlock;
  sqlite3_stmt *deleteBlock;
  sqlite3_stmt *deleteBlocksStore;
  sqlite3_stmt *updateBlock;
  sqlite3_stmt *selectReadyBlocks;
  sqlite3_stmt *deleteNullBlocks;
  sqlite3_stmt *insertItem;
  sqlite3_stmt *insertDeletionItemsForRecordsOfType;
  sqlite3_stmt *insertDeletionItemsForRecordWithUUID;
  sqlite3_stmt *insertDeletionItemsForRecordsWithParentUUID;
  sqlite3_stmt *updateItem;
  sqlite3_stmt *deleteItem;
  sqlite3_stmt *deleteItemsBlock;
  sqlite3_stmt *deleteItemsStore;
  sqlite3_stmt *deleteItemStoreExternal;
  sqlite3_stmt *selectItemsBlock;
  sqlite3_stmt *selectItemsBlockLimit;
  sqlite3_stmt *deleteNullItems;
  sqlite3_stmt *deleteNullItemsType;
  sqlite3_stmt *insertRecord;
  sqlite3_stmt *updateRecord;
  sqlite3_stmt *updateRecordExternal;
  sqlite3_stmt *updateRecordExternalExternal;
  sqlite3_stmt *updateRecordExternalUUID;
  sqlite3_stmt *updateRecordPush;
  sqlite3_stmt *updateRecordPushUUID;
  sqlite3_stmt *updateRecordClearPushExpected;
  sqlite3_stmt *updateRecordsClearPush;
  sqlite3_stmt *updateRecordType;
  sqlite3_stmt *deleteRecord;
  sqlite3_stmt *deleteRecordBlock;
  sqlite3_stmt *deleteRecordUUID;
  sqlite3_stmt *deleteRecordExternal;
  sqlite3_stmt *deleteRecordsStore;
  sqlite3_stmt *deleteZombieRecords;
  sqlite3_stmt *selectRecord;
  sqlite3_stmt *selectRecordUUIDExternal;
  sqlite3_stmt *selectRecordUUID;
  sqlite3_stmt *selectRecordExternal;
  sqlite3_stmt *selectRecordsPushBlock;
  sqlite3_stmt *selectRecordsParentUUID;
  sqlite3_stmt *selectRecordsParentUUIDType;
  sqlite3_stmt *selectRecordsOfType;
  sqlite3_stmt *selectRecords;
  sqlite3_stmt *insertIndexSentinel;
  sqlite3_stmt *deleteIndexSentinels;
  sqlite3_stmt *deleteIndexSentinelsStore;
  sqlite3_stmt *selectIndexSentinel;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_super v66;

  v2 = self;
  insertStore = v2->insertStore;
  if (insertStore)
  {
    sqlite3_finalize(insertStore);
    v2->insertStore = 0;
  }
  deleteStore = v2->deleteStore;
  if (deleteStore)
  {
    sqlite3_finalize(deleteStore);
    v2->deleteStore = 0;
  }
  selectStore = v2->selectStore;
  if (selectStore)
  {
    sqlite3_finalize(selectStore);
    v2->selectStore = 0;
  }
  selectStores = v2->selectStores;
  if (selectStores)
  {
    sqlite3_finalize(selectStores);
    v2->selectStores = 0;
  }
  updateStoreReplicationData = v2->updateStoreReplicationData;
  if (updateStoreReplicationData)
  {
    sqlite3_finalize(updateStoreReplicationData);
    v2->updateStoreReplicationData = 0;
  }
  insertBlock = v2->insertBlock;
  if (insertBlock)
  {
    sqlite3_finalize(insertBlock);
    v2->insertBlock = 0;
  }
  selectBlock = v2->selectBlock;
  if (selectBlock)
  {
    sqlite3_finalize(selectBlock);
    v2->selectBlock = 0;
  }
  deleteBlock = v2->deleteBlock;
  if (deleteBlock)
  {
    sqlite3_finalize(deleteBlock);
    v2->deleteBlock = 0;
  }
  deleteBlocksStore = v2->deleteBlocksStore;
  if (deleteBlocksStore)
  {
    sqlite3_finalize(deleteBlocksStore);
    v2->deleteBlocksStore = 0;
  }
  updateBlock = v2->updateBlock;
  if (updateBlock)
  {
    sqlite3_finalize(updateBlock);
    v2->updateBlock = 0;
  }
  selectReadyBlocks = v2->selectReadyBlocks;
  if (selectReadyBlocks)
  {
    sqlite3_finalize(selectReadyBlocks);
    v2->selectReadyBlocks = 0;
  }
  deleteNullBlocks = v2->deleteNullBlocks;
  if (deleteNullBlocks)
  {
    sqlite3_finalize(deleteNullBlocks);
    v2->deleteNullBlocks = 0;
  }
  insertItem = v2->insertItem;
  if (insertItem)
  {
    sqlite3_finalize(insertItem);
    v2->insertItem = 0;
  }
  insertDeletionItemsForRecordsOfType = v2->insertDeletionItemsForRecordsOfType;
  if (insertDeletionItemsForRecordsOfType)
  {
    sqlite3_finalize(insertDeletionItemsForRecordsOfType);
    v2->insertDeletionItemsForRecordsOfType = 0;
  }
  insertDeletionItemsForRecordWithUUID = v2->insertDeletionItemsForRecordWithUUID;
  if (insertDeletionItemsForRecordWithUUID)
  {
    sqlite3_finalize(insertDeletionItemsForRecordWithUUID);
    v2->insertDeletionItemsForRecordWithUUID = 0;
  }
  insertDeletionItemsForRecordsWithParentUUID = v2->insertDeletionItemsForRecordsWithParentUUID;
  if (insertDeletionItemsForRecordsWithParentUUID)
  {
    sqlite3_finalize(insertDeletionItemsForRecordsWithParentUUID);
    v2->insertDeletionItemsForRecordsWithParentUUID = 0;
  }
  updateItem = v2->updateItem;
  if (updateItem)
  {
    sqlite3_finalize(updateItem);
    v2->updateItem = 0;
  }
  deleteItem = v2->deleteItem;
  if (deleteItem)
  {
    sqlite3_finalize(deleteItem);
    v2->deleteItem = 0;
  }
  deleteItemsBlock = v2->deleteItemsBlock;
  if (deleteItemsBlock)
  {
    sqlite3_finalize(deleteItemsBlock);
    v2->deleteItemsBlock = 0;
  }
  deleteItemsStore = v2->deleteItemsStore;
  if (deleteItemsStore)
  {
    sqlite3_finalize(deleteItemsStore);
    v2->deleteItemsStore = 0;
  }
  deleteItemStoreExternal = v2->deleteItemStoreExternal;
  if (deleteItemStoreExternal)
  {
    sqlite3_finalize(deleteItemStoreExternal);
    v2->deleteItemStoreExternal = 0;
  }
  selectItemsBlock = v2->selectItemsBlock;
  if (selectItemsBlock)
  {
    sqlite3_finalize(selectItemsBlock);
    v2->selectItemsBlock = 0;
  }
  selectItemsBlockLimit = v2->selectItemsBlockLimit;
  if (selectItemsBlockLimit)
  {
    sqlite3_finalize(selectItemsBlockLimit);
    v2->selectItemsBlockLimit = 0;
  }
  deleteNullItems = v2->deleteNullItems;
  if (deleteNullItems)
  {
    sqlite3_finalize(deleteNullItems);
    v2->deleteNullItems = 0;
  }
  deleteNullItemsType = v2->deleteNullItemsType;
  if (deleteNullItemsType)
  {
    sqlite3_finalize(deleteNullItemsType);
    v2->deleteNullItemsType = 0;
  }
  insertRecord = v2->insertRecord;
  if (insertRecord)
  {
    sqlite3_finalize(insertRecord);
    v2->insertRecord = 0;
  }
  updateRecord = v2->updateRecord;
  if (updateRecord)
  {
    sqlite3_finalize(updateRecord);
    v2->updateRecord = 0;
  }
  updateRecordExternal = v2->updateRecordExternal;
  if (updateRecordExternal)
  {
    sqlite3_finalize(updateRecordExternal);
    v2->updateRecordExternal = 0;
  }
  updateRecordExternalExternal = v2->updateRecordExternalExternal;
  if (updateRecordExternalExternal)
  {
    sqlite3_finalize(updateRecordExternalExternal);
    v2->updateRecordExternalExternal = 0;
  }
  updateRecordExternalUUID = v2->updateRecordExternalUUID;
  if (updateRecordExternalUUID)
  {
    sqlite3_finalize(updateRecordExternalUUID);
    v2->updateRecordExternalUUID = 0;
  }
  updateRecordPush = v2->updateRecordPush;
  if (updateRecordPush)
  {
    sqlite3_finalize(updateRecordPush);
    v2->updateRecordPush = 0;
  }
  updateRecordPushUUID = v2->updateRecordPushUUID;
  if (updateRecordPushUUID)
  {
    sqlite3_finalize(updateRecordPushUUID);
    v2->updateRecordPushUUID = 0;
  }
  updateRecordClearPushExpected = v2->updateRecordClearPushExpected;
  if (updateRecordClearPushExpected)
  {
    sqlite3_finalize(updateRecordClearPushExpected);
    v2->updateRecordClearPushExpected = 0;
  }
  updateRecordsClearPush = v2->updateRecordsClearPush;
  if (updateRecordsClearPush)
  {
    sqlite3_finalize(updateRecordsClearPush);
    v2->updateRecordsClearPush = 0;
  }
  updateRecordType = v2->updateRecordType;
  if (updateRecordType)
  {
    sqlite3_finalize(updateRecordType);
    v2->updateRecordType = 0;
  }
  deleteRecord = v2->deleteRecord;
  if (deleteRecord)
  {
    sqlite3_finalize(deleteRecord);
    v2->deleteRecord = 0;
  }
  deleteRecordBlock = v2->deleteRecordBlock;
  if (deleteRecordBlock)
  {
    sqlite3_finalize(deleteRecordBlock);
    v2->deleteRecordBlock = 0;
  }
  deleteRecordUUID = v2->deleteRecordUUID;
  if (deleteRecordUUID)
  {
    sqlite3_finalize(deleteRecordUUID);
    v2->deleteRecordUUID = 0;
  }
  deleteRecordExternal = v2->deleteRecordExternal;
  if (deleteRecordExternal)
  {
    sqlite3_finalize(deleteRecordExternal);
    v2->deleteRecordExternal = 0;
  }
  deleteRecordsStore = v2->deleteRecordsStore;
  if (deleteRecordsStore)
  {
    sqlite3_finalize(deleteRecordsStore);
    v2->deleteRecordsStore = 0;
  }
  deleteZombieRecords = v2->deleteZombieRecords;
  if (deleteZombieRecords)
  {
    sqlite3_finalize(deleteZombieRecords);
    v2->deleteZombieRecords = 0;
  }
  selectRecord = v2->selectRecord;
  if (selectRecord)
  {
    sqlite3_finalize(selectRecord);
    v2->selectRecord = 0;
  }
  selectRecordUUIDExternal = v2->selectRecordUUIDExternal;
  if (selectRecordUUIDExternal)
  {
    sqlite3_finalize(selectRecordUUIDExternal);
    v2->selectRecordUUIDExternal = 0;
  }
  selectRecordUUID = v2->selectRecordUUID;
  if (selectRecordUUID)
  {
    sqlite3_finalize(selectRecordUUID);
    v2->selectRecordUUID = 0;
  }
  selectRecordExternal = v2->selectRecordExternal;
  if (selectRecordExternal)
  {
    sqlite3_finalize(selectRecordExternal);
    v2->selectRecordExternal = 0;
  }
  selectRecordsPushBlock = v2->selectRecordsPushBlock;
  if (selectRecordsPushBlock)
  {
    sqlite3_finalize(selectRecordsPushBlock);
    v2->selectRecordsPushBlock = 0;
  }
  selectRecordsParentUUID = v2->selectRecordsParentUUID;
  if (selectRecordsParentUUID)
  {
    sqlite3_finalize(selectRecordsParentUUID);
    v2->selectRecordsParentUUID = 0;
  }
  selectRecordsParentUUIDType = v2->selectRecordsParentUUIDType;
  if (selectRecordsParentUUIDType)
  {
    sqlite3_finalize(selectRecordsParentUUIDType);
    v2->selectRecordsParentUUIDType = 0;
  }
  selectRecordsOfType = v2->selectRecordsOfType;
  if (selectRecordsOfType)
  {
    sqlite3_finalize(selectRecordsOfType);
    v2->selectRecordsOfType = 0;
  }
  selectRecords = v2->selectRecords;
  if (selectRecords)
  {
    sqlite3_finalize(selectRecords);
    v2->selectRecords = 0;
  }
  insertIndexSentinel = v2->insertIndexSentinel;
  if (insertIndexSentinel)
  {
    sqlite3_finalize(insertIndexSentinel);
    v2->insertIndexSentinel = 0;
  }
  deleteIndexSentinels = v2->deleteIndexSentinels;
  if (deleteIndexSentinels)
  {
    sqlite3_finalize(deleteIndexSentinels);
    v2->deleteIndexSentinels = 0;
  }
  deleteIndexSentinelsStore = v2->deleteIndexSentinelsStore;
  if (deleteIndexSentinelsStore)
  {
    sqlite3_finalize(deleteIndexSentinelsStore);
    v2->deleteIndexSentinelsStore = 0;
  }
  selectIndexSentinel = v2->selectIndexSentinel;
  if (selectIndexSentinel)
  {
    sqlite3_finalize(selectIndexSentinel);
    v2->selectIndexSentinel = 0;
  }

  -[HMBLocalSQLContext selectReadyInputBlocks](v2, "selectReadyInputBlocks");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "finalize");

  -[HMBLocalSQLContext selectReadyRollbackBlocks](v2, "selectReadyRollbackBlocks");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "finalize");

  -[HMBLocalSQLContext selectAllRecordRows](v2, "selectAllRecordRows");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "finalize");

  -[HMBLocalSQLContext selectAllRecordTypeRows](v2, "selectAllRecordTypeRows");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "finalize");

  -[HMBLocalSQLContext selectAllRecordParentModelIDRows](v2, "selectAllRecordParentModelIDRows");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "finalize");

  -[HMBLocalSQLContext selectAllRecordParentModelIDTypeRows](v2, "selectAllRecordParentModelIDTypeRows");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "finalize");

  -[HMBLocalSQLContext queryContextsByModelType](v2, "queryContextsByModelType");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_6919);

  -[HMBLocalSQLContext queryContextsByClass](v2, "queryContextsByClass");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "removeAllObjects");

  -[HMBLocalSQLContext queryContextsByModelType](v2, "queryContextsByModelType");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "removeAllObjects");

  v66.receiver = v2;
  v66.super_class = (Class)HMBLocalSQLContext;
  -[HMBSQLContext finalize](&v66, sel_finalize);
}

- (int64_t)migrateFromSchemaVersion:(int64_t)a3 error:(id *)a4
{
  void *v6;
  HMBLocalSQLContext *v7;
  NSObject *v8;
  void *v9;
  HMBLocalSQLContext *v12;
  void *v13;
  sqlite3 *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMBLocalSQLContext *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMBLocalSQLContext *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  objc_super v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 2)
  {
    v6 = (void *)MEMORY[0x1D17B6230](self, a2);
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v9;
      v38 = 2048;
      v39 = a3;
      v40 = 2048;
      v41 = 1;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failing database migration because the database has a later version than our current known version (%ld > %ld).", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    return 0;
  }
  if (!a3 && -[HMBLocalSQLContext migrateToSchema01WithError:](self, "migrateToSchema01WithError:", a4) != 3)
  {
LABEL_10:
    v34.receiver = self;
    v34.super_class = (Class)HMBLocalSQLContext;
    return -[HMBSQLContext migrateFromSchemaVersion:error:](&v34, sel_migrateFromSchemaVersion_error_, a3, a4);
  }
  v12 = self;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8947960);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMBSQLContext context](v12, "context");
  v35 = 0;
  selectSQLite3(v14, "SELECT name FROM sqlite_master WHERE type = 'table'", MEMORY[0x1E0C9AA70], &v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v35;
  if (v15)
  {
    v17 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v15, "na_arrayByFlattening");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isSubsetOfSet:", v19) & 1) != 0)
    {

      goto LABEL_10;
    }
    v24 = (void *)MEMORY[0x1D17B6230]();
    v21 = v12;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hmbDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmbDescription");
      v33 = v24;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v26;
      v38 = 2112;
      v39 = (int64_t)v27;
      v40 = 2112;
      v41 = (uint64_t)v28;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Set of found tables: %@ does not contain all required tables: %@", buf, 0x20u);

      v24 = v33;
    }

    objc_autoreleasePoolPop(v24);
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      v38 = 2112;
      v39 = (int64_t)v16;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to query all required tables: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

  v29 = (void *)MEMORY[0x1D17B6230]();
  v30 = v12;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v32;
    _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Requiring re-init after migration because all required tables do not exist", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v29);
  return 1;
}

- (unint64_t)_insertZoneWithIdentification:(id)a3 name:(id)a4 error:(id *)a5
{
  sqlite3_stmt *insertStore;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  sqlite3_stmt *v13;
  void *v14;
  id v15;
  unint64_t v16;
  id v18;
  id v19;
  id v20;

  insertStore = self->insertStore;
  v20 = 0;
  v9 = a3;
  hmbBindStringSQLite3(insertStore, 1, a4, &v20);
  v10 = v20;
  v11 = self->insertStore;
  v19 = v10;
  hmbBindDataSQLite3(v11, 2, v9, &v19);

  v12 = v19;
  v13 = self->insertStore;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  hmbBindDataSQLite3(v13, 3, v14, &v18);
  v15 = v18;

  v16 = __execRowAndSetError(self, (uint64_t)self->insertStore, v15, a5);
  return v16;
}

- (BOOL)_deleteZoneWithRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteStore;
  id v7;
  id v9;

  deleteStore = self->deleteStore;
  v9 = 0;
  hmbBindIntSQLite3(deleteStore, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteStore, v7, a4);

  return (char)a4;
}

- (id)_fetchAllZones:(id *)a3
{
  void *v5;
  sqlite3_stmt *selectStores;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  selectStores = self->selectStores;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__HMBLocalSQLContext__fetchAllZones___block_invoke;
  v10[3] = &unk_1E8933C08;
  v7 = v5;
  v11 = v7;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", selectStores, a3, v10))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)_selectZoneWithRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *selectStore;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6904;
  v14 = __Block_byref_object_dispose__6905;
  v15 = 0;
  hmbBindIntSQLite3(self->selectStore, 1, a3, a4);
  selectStore = self->selectStore;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HMBLocalSQLContext__selectZoneWithRow_error___block_invoke;
  v9[3] = &unk_1E8933C98;
  v9[4] = &v10;
  if (-[HMBSQLContext fetchSQLite3One:error:block:](self, "fetchSQLite3One:error:block:", selectStore, a4, v9))
    v7 = (id)v11[5];
  else
    v7 = 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)_updateZoneWithRow:(unint64_t)a3 replication:(id)a4 error:(id *)a5
{
  sqlite3_stmt *updateStoreReplicationData;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  id v14;
  id v15;

  updateStoreReplicationData = self->updateStoreReplicationData;
  v15 = 0;
  v9 = a4;
  hmbBindIntSQLite3(updateStoreReplicationData, 1, a3, &v15);
  v10 = v15;
  v11 = self->updateStoreReplicationData;
  v14 = v10;
  hmbBindUUIDSQLite3(v11, 2, v9, &v14);

  v12 = v14;
  LOBYTE(a5) = __execAndSetError(self, self->updateStoreReplicationData, v12, a5);

  return (char)a5;
}

- (unint64_t)_insertBlockWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5
{
  sqlite3_stmt *insertBlock;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  unint64_t v12;
  id v14;
  id v15;

  insertBlock = self->insertBlock;
  v15 = 0;
  hmbBindIntSQLite3(insertBlock, 1, a3, &v15);
  v9 = v15;
  v10 = self->insertBlock;
  v14 = v9;
  hmbBindIntSQLite3(v10, 2, a4, &v14);
  v11 = v14;

  v12 = __execRowAndSetError(self, (uint64_t)self->insertBlock, v11, a5);
  return v12;
}

- (BOOL)_deleteBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteBlock;
  id v7;
  id v9;

  deleteBlock = self->deleteBlock;
  v9 = 0;
  hmbBindIntSQLite3(deleteBlock, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteBlock, v7, a4);

  return (char)a4;
}

- (BOOL)_deleteBlocksWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteBlocksStore;
  id v7;
  id v9;

  deleteBlocksStore = self->deleteBlocksStore;
  v9 = 0;
  hmbBindIntSQLite3(deleteBlocksStore, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteBlocksStore, v7, a4);

  return (char)a4;
}

- (BOOL)_updateBlockWithRow:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  sqlite3_stmt *updateBlock;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  id v14;
  id v15;

  updateBlock = self->updateBlock;
  v15 = 0;
  v9 = a4;
  hmbBindIntSQLite3(updateBlock, 1, a3, &v15);
  v10 = v15;
  v11 = self->updateBlock;
  v14 = v10;
  hmbBindDataSQLite3(v11, 2, v9, &v14);

  v12 = v14;
  LOBYTE(a5) = __execAndSetError(self, self->updateBlock, v12, a5);

  return (char)a5;
}

- (id)_selectReadyBlocksWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  sqlite3_stmt *selectReadyBlocks;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  hmbBindIntSQLite3(self->selectReadyBlocks, 1, a3, a5);
  hmbBindIntSQLite3(self->selectReadyBlocks, 2, a4, a5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  selectReadyBlocks = self->selectReadyBlocks;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__HMBLocalSQLContext__selectReadyBlocksWithZoneRow_type_error___block_invoke;
  v13[3] = &unk_1E8933CE8;
  v15 = a4;
  v10 = v8;
  v14 = v10;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", selectReadyBlocks, a5, v13))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)_selectBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *selectBlock;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  hmbBindIntSQLite3(self->selectBlock, 1, a3, a4);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6904;
  v14 = __Block_byref_object_dispose__6905;
  selectBlock = self->selectBlock;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HMBLocalSQLContext__selectBlockWithRow_error___block_invoke;
  v9[3] = &unk_1E8933C98;
  v9[4] = &v10;
  if (-[HMBSQLContext fetchSQLite3One:error:block:](self, "fetchSQLite3One:error:block:", selectBlock, a4, v9))
    v7 = (id)v11[5];
  else
    v7 = 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)_deleteNullBlocksWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteNullBlocks;
  id v7;
  id v9;

  deleteNullBlocks = self->deleteNullBlocks;
  v9 = 0;
  hmbBindIntSQLite3(deleteNullBlocks, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteNullBlocks, v7, a4);

  return (char)a4;
}

- (unint64_t)_insertBlockWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 options:(id)a5 items:(id)a6 error:(id *)a7
{
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v28;
  id obj;
  unint64_t v30;
  HMBLocalSQLContext *v31;
  unint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a5;
  v11 = a6;
  v38 = 0;
  v30 = a3;
  v31 = self;
  v12 = a4;
  v32 = -[HMBLocalSQLContext _insertBlockWithZoneRow:type:error:](self, "_insertBlockWithZoneRow:type:error:", a3, a4, &v38);
  v13 = v38;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    obj = v14;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v19, "externalID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "externalData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "modelEncoding");
        objc_msgSend(v19, "modelData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v13;
        -[HMBLocalSQLContext _insertItemWithZoneRow:blockRow:type:externalID:externalData:modelEncoding:modelData:error:](v31, "_insertItemWithZoneRow:blockRow:type:externalID:externalData:modelEncoding:modelData:error:", v30, v32, v12, v20, v21, v22, v23, &v33);
        v24 = v33;

        if (v24)
        {
          if (a7)
            *a7 = objc_retainAutorelease(v24);
          v14 = obj;

          v32 = 0;
          v25 = v28;
          goto LABEL_15;
        }
        v13 = 0;
      }
      v14 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      v13 = 0;
      v24 = 0;
      if (v16)
        continue;
      break;
    }
  }
  else
  {
    v24 = v13;
  }

  v25 = v28;
  -[HMBLocalSQLContext _updateBlockWithRow:options:error:](v31, "_updateBlockWithRow:options:error:", v32, v28, a7);
LABEL_15:

  return v32;
}

- (unint64_t)_insertItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 externalID:(id)a6 externalData:(id)a7 modelEncoding:(unint64_t)a8 modelData:(id)a9 error:(id *)a10
{
  sqlite3_stmt *insertItem;
  id v18;
  id v19;
  id v20;
  id v21;
  sqlite3_stmt *v22;
  id v23;
  sqlite3_stmt *v24;
  id v25;
  sqlite3_stmt *v26;
  id v27;
  sqlite3_stmt *v28;
  id v29;
  sqlite3_stmt *v30;
  id v31;
  sqlite3_stmt *v32;
  id v33;
  unint64_t v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;

  insertItem = self->insertItem;
  v42 = 0;
  v18 = a9;
  v19 = a7;
  v20 = a6;
  hmbBindIntSQLite3(insertItem, 1, a3, &v42);
  v21 = v42;
  v22 = self->insertItem;
  v41 = v21;
  hmbBindIntSQLite3(v22, 2, a4, &v41);
  v23 = v41;

  v24 = self->insertItem;
  v40 = v23;
  hmbBindIntSQLite3(v24, 3, a5, &v40);
  v25 = v40;

  v26 = self->insertItem;
  v39 = v25;
  hmbBindDataSQLite3(v26, 4, v20, &v39);

  v27 = v39;
  v28 = self->insertItem;
  v38 = v27;
  hmbBindDataSQLite3(v28, 5, v19, &v38);

  v29 = v38;
  v30 = self->insertItem;
  v37 = v29;
  hmbBindIntSQLite3(v30, 6, a8, &v37);
  v31 = v37;

  v32 = self->insertItem;
  v36 = v31;
  hmbBindDataSQLite3(v32, 7, v18, &v36);

  v33 = v36;
  v34 = __execRowAndSetError(self, (uint64_t)self->insertItem, v33, a10);

  return v34;
}

- (unint64_t)_insertDeletionItemsWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelType:(id)a6 error:(id *)a7
{
  sqlite3_stmt *insertDeletionItemsForRecordsOfType;
  id v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  unint64_t v21;
  id v23;
  id v24;
  id v25;
  id v26;

  insertDeletionItemsForRecordsOfType = self->insertDeletionItemsForRecordsOfType;
  v26 = 0;
  v13 = a6;
  hmbBindIntSQLite3(insertDeletionItemsForRecordsOfType, 1, a3, &v26);
  v14 = v26;
  v15 = self->insertDeletionItemsForRecordsOfType;
  v25 = v14;
  hmbBindIntSQLite3(v15, 2, a4, &v25);
  v16 = v25;

  v17 = self->insertDeletionItemsForRecordsOfType;
  v24 = v16;
  hmbBindIntSQLite3(v17, 3, a5, &v24);
  v18 = v24;

  v19 = self->insertDeletionItemsForRecordsOfType;
  v23 = v18;
  hmbBindStringSQLite3(v19, 4, v13, &v23);

  v20 = v23;
  v21 = __execRowAndSetError(self, (uint64_t)self->insertDeletionItemsForRecordsOfType, v20, a7);

  return v21;
}

- (unint64_t)_insertDeletionItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelID:(id)a6 error:(id *)a7
{
  sqlite3_stmt *insertDeletionItemsForRecordWithUUID;
  id v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  unint64_t v21;
  id v23;
  id v24;
  id v25;
  id v26;

  insertDeletionItemsForRecordWithUUID = self->insertDeletionItemsForRecordWithUUID;
  v26 = 0;
  v13 = a6;
  hmbBindIntSQLite3(insertDeletionItemsForRecordWithUUID, 1, a3, &v26);
  v14 = v26;
  v15 = self->insertDeletionItemsForRecordWithUUID;
  v25 = v14;
  hmbBindIntSQLite3(v15, 2, a4, &v25);
  v16 = v25;

  v17 = self->insertDeletionItemsForRecordWithUUID;
  v24 = v16;
  hmbBindIntSQLite3(v17, 3, a5, &v24);
  v18 = v24;

  v19 = self->insertDeletionItemsForRecordWithUUID;
  v23 = v18;
  hmbBindUUIDSQLite3(v19, 4, v13, &v23);

  v20 = v23;
  v21 = __execRowAndSetError(self, (uint64_t)self->insertDeletionItemsForRecordWithUUID, v20, a7);

  return v21;
}

- (unint64_t)_insertDeletionItemsWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 parentModelID:(id)a6 error:(id *)a7
{
  sqlite3_stmt *insertDeletionItemsForRecordsWithParentUUID;
  id v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  unint64_t v21;
  id v23;
  id v24;
  id v25;
  id v26;

  insertDeletionItemsForRecordsWithParentUUID = self->insertDeletionItemsForRecordsWithParentUUID;
  v26 = 0;
  v13 = a6;
  hmbBindIntSQLite3(insertDeletionItemsForRecordsWithParentUUID, 1, a3, &v26);
  v14 = v26;
  v15 = self->insertDeletionItemsForRecordsWithParentUUID;
  v25 = v14;
  hmbBindIntSQLite3(v15, 2, a4, &v25);
  v16 = v25;

  v17 = self->insertDeletionItemsForRecordsWithParentUUID;
  v24 = v16;
  hmbBindIntSQLite3(v17, 3, a5, &v24);
  v18 = v24;

  v19 = self->insertDeletionItemsForRecordsWithParentUUID;
  v23 = v18;
  hmbBindUUIDSQLite3(v19, 4, v13, &v23);

  v20 = v23;
  v21 = __execRowAndSetError(self, (uint64_t)self->insertDeletionItemsForRecordsWithParentUUID, v20, a7);

  return v21;
}

- (unint64_t)_insertItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelType:(id)a6 error:(id *)a7
{
  sqlite3_stmt *insertDeletionItemsForRecordsOfType;
  id v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  unint64_t v21;
  id v23;
  id v24;
  id v25;
  id v26;

  insertDeletionItemsForRecordsOfType = self->insertDeletionItemsForRecordsOfType;
  v26 = 0;
  v13 = a6;
  hmbBindIntSQLite3(insertDeletionItemsForRecordsOfType, 1, a3, &v26);
  v14 = v26;
  v15 = self->insertDeletionItemsForRecordsOfType;
  v25 = v14;
  hmbBindIntSQLite3(v15, 2, a4, &v25);
  v16 = v25;

  v17 = self->insertDeletionItemsForRecordsOfType;
  v24 = v16;
  hmbBindIntSQLite3(v17, 3, a5, &v24);
  v18 = v24;

  v19 = self->insertDeletionItemsForRecordsOfType;
  v23 = v18;
  hmbBindStringSQLite3(v19, 4, v13, &v23);

  v20 = v23;
  v21 = __execRowAndSetError(self, (uint64_t)self->insertDeletionItemsForRecordsOfType, v20, a7);

  return v21;
}

- (BOOL)_updateItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 externalID:(id)a6 externalData:(id)a7 modelEncoding:(unint64_t)a8 modelData:(id)a9 error:(id *)a10
{
  sqlite3_stmt *updateItem;
  id v18;
  id v19;
  id v20;
  id v21;
  sqlite3_stmt *v22;
  id v23;
  sqlite3_stmt *v24;
  id v25;
  sqlite3_stmt *v26;
  id v27;
  sqlite3_stmt *v28;
  id v29;
  sqlite3_stmt *v30;
  id v31;
  sqlite3_stmt *v32;
  id v33;
  BOOL v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;

  updateItem = self->updateItem;
  v42 = 0;
  v18 = a9;
  v19 = a7;
  v20 = a6;
  hmbBindIntSQLite3(updateItem, 1, a3, &v42);
  v21 = v42;
  v22 = self->updateItem;
  v41 = v21;
  hmbBindIntSQLite3(v22, 2, a4, &v41);
  v23 = v41;

  v24 = self->updateItem;
  v40 = v23;
  hmbBindIntSQLite3(v24, 3, a5, &v40);
  v25 = v40;

  v26 = self->updateItem;
  v39 = v25;
  hmbBindDataSQLite3(v26, 4, v20, &v39);

  v27 = v39;
  v28 = self->updateItem;
  v38 = v27;
  hmbBindDataSQLite3(v28, 5, v19, &v38);

  v29 = v38;
  v30 = self->updateItem;
  v37 = v29;
  hmbBindIntSQLite3(v30, 6, a8, &v37);
  v31 = v37;

  v32 = self->updateItem;
  v36 = v31;
  hmbBindDataSQLite3(v32, 7, v18, &v36);

  v33 = v36;
  v34 = __execAndSetError(self, self->updateItem, v33, a10);

  return v34;
}

- (BOOL)_deleteItemWithRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteItem;
  id v7;
  id v9;

  deleteItem = self->deleteItem;
  v9 = 0;
  hmbBindIntSQLite3(deleteItem, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteItem, v7, a4);

  return (char)a4;
}

- (BOOL)_deleteItemsWithBlockRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteItemsBlock;
  id v7;
  id v9;

  deleteItemsBlock = self->deleteItemsBlock;
  v9 = 0;
  hmbBindIntSQLite3(deleteItemsBlock, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteItemsBlock, v7, a4);

  return (char)a4;
}

- (BOOL)_deleteItemWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteItemsStore;
  id v7;
  id v9;

  deleteItemsStore = self->deleteItemsStore;
  v9 = 0;
  hmbBindIntSQLite3(deleteItemsStore, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteItemsStore, v7, a4);

  return (char)a4;
}

- (BOOL)_deleteItemWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 externalID:(id)a5 error:(id *)a6
{
  sqlite3_stmt *deleteItemStoreExternal;
  id v11;
  id v12;
  sqlite3_stmt *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  id v18;
  id v19;
  id v20;

  deleteItemStoreExternal = self->deleteItemStoreExternal;
  v20 = 0;
  v11 = a5;
  hmbBindIntSQLite3(deleteItemStoreExternal, 1, a3, &v20);
  v12 = v20;
  v13 = self->deleteItemStoreExternal;
  v19 = v12;
  hmbBindIntSQLite3(v13, 2, a4, &v19);
  v14 = v19;

  v15 = self->deleteItemStoreExternal;
  v18 = v14;
  hmbBindDataSQLite3(v15, 3, v11, &v18);

  v16 = v18;
  LOBYTE(a6) = __execAndSetError(self, self->deleteItemStoreExternal, v16, a6);

  return (char)a6;
}

- (id)_selectItemsWithBlockRow:(unint64_t)a3 rowGreaterThan:(unint64_t)a4 limit:(unint64_t)a5 returning:(unint64_t)a6 error:(id *)a7
{
  void *v12;
  sqlite3_stmt *selectItemsBlockLimit;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  unint64_t v19;

  hmbBindIntSQLite3(self->selectItemsBlockLimit, 1, a3, a7);
  hmbBindIntSQLite3(self->selectItemsBlockLimit, 2, a4, a7);
  hmbBindIntSQLite3(self->selectItemsBlockLimit, 3, a5, a7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  selectItemsBlockLimit = self->selectItemsBlockLimit;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HMBLocalSQLContext__selectItemsWithBlockRow_rowGreaterThan_limit_returning_error___block_invoke;
  v17[3] = &unk_1E8933CE8;
  v19 = a6;
  v14 = v12;
  v18 = v14;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", selectItemsBlockLimit, a7, v17))
    v15 = v14;
  else
    v15 = 0;

  return v15;
}

- (id)_selectItemsWithBlockRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  sqlite3_stmt *selectItemsBlock;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  hmbBindIntSQLite3(self->selectItemsBlock, 1, a3, a5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  selectItemsBlock = self->selectItemsBlock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__HMBLocalSQLContext__selectItemsWithBlockRow_returning_error___block_invoke;
  v13[3] = &unk_1E8933CE8;
  v15 = a4;
  v10 = v8;
  v14 = v10;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", selectItemsBlock, a5, v13))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (BOOL)_deleteNullItemsWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5
{
  sqlite3_stmt *deleteNullItemsType;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  id v13;
  id v14;

  deleteNullItemsType = self->deleteNullItemsType;
  v14 = 0;
  hmbBindIntSQLite3(deleteNullItemsType, 1, a3, &v14);
  v9 = v14;
  v10 = self->deleteNullItemsType;
  v13 = v9;
  hmbBindIntSQLite3(v10, 2, a4, &v13);
  v11 = v13;

  LOBYTE(a5) = __execAndSetError(self, self->deleteNullItemsType, v11, a5);
  return (char)a5;
}

- (BOOL)_deleteNullItemsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteNullItems;
  id v7;
  id v9;

  deleteNullItems = self->deleteNullItems;
  v9 = 0;
  hmbBindIntSQLite3(deleteNullItems, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteNullItems, v7, a4);

  return (char)a4;
}

- (BOOL)_insertIndexSentinelWithZoneRow:(unint64_t)a3 modelType:(id)a4 error:(id *)a5
{
  sqlite3_stmt *insertIndexSentinel;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  id v14;
  id v15;

  insertIndexSentinel = self->insertIndexSentinel;
  v15 = 0;
  v9 = a4;
  hmbBindIntSQLite3(insertIndexSentinel, 1, a3, &v15);
  v10 = v15;
  v11 = self->insertIndexSentinel;
  v14 = v10;
  hmbBindStringSQLite3(v11, 2, v9, &v14);

  v12 = v14;
  LOBYTE(a5) = __execAndSetError(self, self->insertIndexSentinel, v12, a5);

  return (char)a5;
}

- (id)_selectIndexSentinelForZoneRow:(unint64_t)a3 modelType:(id)a4 error:(id *)a5
{
  id v8;
  sqlite3_stmt *selectIndexSentinel;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v8 = a4;
  hmbBindIntSQLite3(self->selectIndexSentinel, 1, a3, a5);
  hmbBindStringSQLite3(self->selectIndexSentinel, 2, v8, a5);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6904;
  v17 = __Block_byref_object_dispose__6905;
  selectIndexSentinel = self->selectIndexSentinel;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HMBLocalSQLContext__selectIndexSentinelForZoneRow_modelType_error___block_invoke;
  v12[3] = &unk_1E8933C98;
  v12[4] = &v13;
  if (-[HMBSQLContext fetchSQLite3One:error:block:](self, "fetchSQLite3One:error:block:", selectIndexSentinel, a5, v12))
    v10 = (id)v14[5];
  else
    v10 = 0;
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (BOOL)_deleteIndexSentinelsWithModelType:(id)a3 error:(id *)a4
{
  sqlite3_stmt *deleteIndexSentinels;
  id v7;
  id v9;

  deleteIndexSentinels = self->deleteIndexSentinels;
  v9 = 0;
  hmbBindStringSQLite3(deleteIndexSentinels, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteIndexSentinels, v7, a4);

  return (char)a4;
}

- (BOOL)_deleteIndexSentinelsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteIndexSentinelsStore;
  id v7;
  id v9;

  deleteIndexSentinelsStore = self->deleteIndexSentinelsStore;
  v9 = 0;
  hmbBindIntSQLite3(deleteIndexSentinelsStore, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteIndexSentinelsStore, v7, a4);

  return (char)a4;
}

- (id)flush:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__HMBLocalSQLContext_flush___block_invoke;
  v4[3] = &unk_1E8933C30;
  v4[4] = self;
  v5 = a3;
  -[HMBLocalSQLContext sqlTransactionWithActivity:block:](self, "sqlTransactionWithActivity:block:", 0, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)queryTables
{
  return (NSDictionary *)objc_getProperty(self, a2, 504, 1);
}

- (void)setQueryTables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (NSMapTable)queryContextsByClass
{
  return (NSMapTable *)objc_getProperty(self, a2, 512, 1);
}

- (void)setQueryContextsByClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (NSMutableDictionary)queryContextsByModelType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 520, 1);
}

- (void)setQueryContextsByModelType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (HMBSQLQueryStatement)selectReadyInputBlocks
{
  return self->_selectReadyInputBlocks;
}

- (void)setSelectReadyInputBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_selectReadyInputBlocks, a3);
}

- (HMBSQLQueryStatement)selectReadyRollbackBlocks
{
  return self->_selectReadyRollbackBlocks;
}

- (void)setSelectReadyRollbackBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_selectReadyRollbackBlocks, a3);
}

- (HMBSQLQueryStatement)selectAllRecordRows
{
  return self->_selectAllRecordRows;
}

- (void)setSelectAllRecordRows:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllRecordRows, a3);
}

- (HMBSQLQueryStatement)selectAllRecordTypeRows
{
  return self->_selectAllRecordTypeRows;
}

- (void)setSelectAllRecordTypeRows:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllRecordTypeRows, a3);
}

- (HMBSQLQueryStatement)selectAllRecordParentModelIDRows
{
  return self->_selectAllRecordParentModelIDRows;
}

- (void)setSelectAllRecordParentModelIDRows:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllRecordParentModelIDRows, a3);
}

- (HMBSQLQueryStatement)selectAllRecordParentModelIDTypeRows
{
  return self->_selectAllRecordParentModelIDTypeRows;
}

- (void)setSelectAllRecordParentModelIDTypeRows:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllRecordParentModelIDTypeRows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectAllRecordParentModelIDTypeRows, 0);
  objc_storeStrong((id *)&self->_selectAllRecordParentModelIDRows, 0);
  objc_storeStrong((id *)&self->_selectAllRecordTypeRows, 0);
  objc_storeStrong((id *)&self->_selectAllRecordRows, 0);
  objc_storeStrong((id *)&self->_selectReadyRollbackBlocks, 0);
  objc_storeStrong((id *)&self->_selectReadyInputBlocks, 0);
  objc_storeStrong((id *)&self->_queryContextsByModelType, 0);
  objc_storeStrong((id *)&self->_queryContextsByClass, 0);
  objc_storeStrong((id *)&self->_queryTables, 0);
}

id __28__HMBLocalSQLContext_flush___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = v3;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@removing all records and transactions from local", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v32 = 0;
  objc_msgSend(v5, "runSQLite3:error:", "DELETE FROM transaction_v2", &v32);
  v8 = v32;
  v31 = v8;
  objc_msgSend(v5, "runSQLite3:error:", "DELETE FROM record_v2", &v31);
  v9 = v31;

  v30 = v9;
  objc_msgSend(v5, "runSQLite3:error:", "DELETE FROM block_v2", &v30);
  v10 = v30;

  v29 = v10;
  objc_msgSend(v5, "runSQLite3:error:", "DELETE FROM index_sentinel", &v29);
  v11 = v29;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "queryContextsByClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      v18 = v11;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "dropTableSQL");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = objc_msgSend(v19, "UTF8String");
        v24 = v18;
        objc_msgSend(v5, "runSQLite3:error:", v20, &v24);
        v11 = v24;

        ++v17;
        v18 = v11;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v15);
  }

  if (*(_BYTE *)(a1 + 40))
  {
    v23 = v11;
    objc_msgSend(v5, "runSQLite3:error:", "DELETE FROM store_v2", &v23);
    v21 = v23;

    v11 = v21;
  }

  return v11;
}

uint64_t __69__HMBLocalSQLContext__selectIndexSentinelForZoneRow_modelType_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sqlite3_column_int64(a2, 0));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __63__HMBLocalSQLContext__selectItemsWithBlockRow_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowItem *v3;

  v3 = -[HMBLocalSQLContextRowItem initWithStatement:returning:]([HMBLocalSQLContextRowItem alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

uint64_t __84__HMBLocalSQLContext__selectItemsWithBlockRow_rowGreaterThan_limit_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowItem *v3;

  v3 = -[HMBLocalSQLContextRowItem initWithStatement:returning:]([HMBLocalSQLContextRowItem alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

uint64_t __48__HMBLocalSQLContext__selectBlockWithRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HMBLocalSQLContextRowBlock *v4;
  sqlite3_int64 v5;
  sqlite3_int64 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = [HMBLocalSQLContextRowBlock alloc];
  v5 = sqlite3_column_int64(a2, 0);
  v6 = sqlite3_column_int64(a2, 1);
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMBLocalSQLContextRowBlock initWithBlockRow:type:options:](v4, "initWithBlockRow:type:options:", v5, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return 0;
}

uint64_t __63__HMBLocalSQLContext__selectReadyBlocksWithZoneRow_type_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HMBLocalSQLContextRowBlock *v4;
  sqlite3_int64 v5;
  uint64_t v6;
  void *v7;
  HMBLocalSQLContextRowBlock *v8;

  v4 = [HMBLocalSQLContextRowBlock alloc];
  v5 = sqlite3_column_int64(a2, 0);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMBLocalSQLContextRowBlock initWithBlockRow:type:options:](v4, "initWithBlockRow:type:options:", v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  return 0;
}

uint64_t __47__HMBLocalSQLContext__selectZoneWithRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  void *v5;
  void *v6;
  HMBLocalSQLContextRowZone *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = sqlite3_column_int64(a2, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "hmbStringWithSQLite3Column:column:", a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBLocalSQLContextRowZone initWithZoneRow:name:token:]([HMBLocalSQLContextRowZone alloc], "initWithZoneRow:name:token:", v4, v5, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDWithSQLite3Column:column:", a2, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setReplication:", v10);

  return 0;
}

uint64_t __37__HMBLocalSQLContext__fetchAllZones___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  void *v5;
  void *v6;
  HMBLocalSQLContextRowZone *v7;
  void *v8;

  v4 = sqlite3_column_int64(a2, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "hmbStringWithSQLite3Column:column:", a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBLocalSQLContextRowZone initWithZoneRow:name:token:]([HMBLocalSQLContextRowZone alloc], "initWithZoneRow:name:token:", v4, v5, v6);
  objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDWithSQLite3Column:column:", a2, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLContextRowZone setReplication:](v7, "setReplication:", v8);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  return 0;
}

uint64_t __30__HMBLocalSQLContext_finalize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "finalize");
}

uint64_t __55__HMBLocalSQLContext_sqlTransactionWithActivity_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__HMBLocalSQLContext_sqlBlockWithActivity_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)unlinkDatastoreAt:(id)a3 everything:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("^%@(?:|-shm|-wal)(\\..*)?$"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v10, 0, &v46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v46;
  if (v12)
  {
    v13 = v12;
    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v17;
      v50 = 2112;
      v51 = v13;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@unable to compile expression: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    v40 = v10;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingLastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v19, &v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v45;
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    v39 = v21;
    if (v13)
    {
      v22 = (void *)MEMORY[0x1D17B6230]();
      v23 = a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v25;
        v50 = 2112;
        v51 = v19;
        v52 = 2112;
        v53 = v13;
        _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@unable to get files in %@ (%@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
    }
    else
    {
      v37 = v7;
      v38 = v6;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v26 = v21;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v42 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v11, "firstMatchInString:options:range:", v31, 0, 0, objc_msgSend(v31, "length"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (v32)
            {
              objc_msgSend(v32, "rangeAtIndex:", 1);
              if (v34 || v4)
              {
                objc_msgSend(v19, "stringByAppendingPathComponent:", v31);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "removeItemAtPath:error:", v36, 0);

              }
            }

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v28);
      }

      v7 = v37;
      v6 = v38;
      v13 = 0;
    }

    v10 = v40;
  }

}

+ (id)openWithURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[HMBSQLFile openContextWithURL:usingSubclass:error:](HMBSQLFile, "openContextWithURL:usingSubclass:error:", v5, objc_opt_class(), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1)
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_106);
  return (id)logCategory__hmf_once_v23;
}

void __33__HMBLocalSQLContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23;
  logCategory__hmf_once_v23 = v0;

}

- (unint64_t)_insertRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelID:(id)a6 parentModelID:(id)a7 modelType:(id)a8 modelEncoding:(unint64_t)a9 modelData:(id)a10 modelSchema:(id)a11 pushEncoding:(unint64_t)a12 pushData:(id)a13 pushBlockRow:(id)a14 error:(id *)a15
{
  sqlite3_stmt *insertRecord;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  sqlite3_stmt *v28;
  id v29;
  sqlite3_stmt *v30;
  id v31;
  sqlite3_stmt *v32;
  id v33;
  sqlite3_stmt *v34;
  id v35;
  sqlite3_stmt *v36;
  id v37;
  sqlite3_stmt *v38;
  id v39;
  sqlite3_stmt *v40;
  id v41;
  sqlite3_stmt *v42;
  id v43;
  sqlite3_stmt *v44;
  id v45;
  sqlite3_stmt *v46;
  id v47;
  sqlite3_stmt *v48;
  id v49;
  unint64_t v50;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68[2];

  insertRecord = self->insertRecord;
  v68[0] = 0;
  v56 = a14;
  v55 = a13;
  v21 = a11;
  v54 = a10;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  hmbBindIntSQLite3(insertRecord, 1, a3, v68);
  v27 = v68[0];
  v28 = self->insertRecord;
  v67 = v27;
  hmbBindDataSQLite3(v28, 2, v26, &v67);

  v29 = v67;
  v30 = self->insertRecord;
  v66 = v29;
  hmbBindDataSQLite3(v30, 3, v25, &v66);

  v31 = v66;
  v32 = self->insertRecord;
  v65 = v31;
  hmbBindUUIDSQLite3(v32, 4, v24, &v65);

  v33 = v65;
  v34 = self->insertRecord;
  v64 = v33;
  hmbBindUUIDSQLite3(v34, 5, v23, &v64);

  v35 = v64;
  v36 = self->insertRecord;
  v63 = v35;
  hmbBindStringSQLite3(v36, 6, v22, &v63);

  v37 = v63;
  v38 = self->insertRecord;
  v62 = v37;
  hmbBindIntSQLite3(v38, 7, a9, &v62);
  v39 = v62;

  v40 = self->insertRecord;
  v61 = v39;
  hmbBindDataSQLite3(v40, 8, v54, &v61);

  v41 = v61;
  v42 = self->insertRecord;
  v60 = v41;
  hmbBindUUIDSQLite3(v42, 9, v21, &v60);

  v43 = v60;
  v44 = self->insertRecord;
  v59 = v43;
  hmbBindIntSQLite3(v44, 10, a12, &v59);
  v45 = v59;

  v46 = self->insertRecord;
  v58 = v45;
  hmbBindDataSQLite3(v46, 11, v55, &v58);

  v47 = v58;
  v48 = self->insertRecord;
  v57 = v47;
  hmbBindIntNumberSQLite3(v48, 12, v56, &v57);

  v49 = v57;
  v50 = __execRowAndSetError(self, (uint64_t)self->insertRecord, v49, a15);

  return v50;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  sqlite3_stmt *updateRecordExternal;
  id v11;
  id v12;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  id v19;
  id v20;
  id v21;

  updateRecordExternal = self->updateRecordExternal;
  v21 = 0;
  v11 = a5;
  v12 = a4;
  hmbBindIntSQLite3(updateRecordExternal, 1, a3, &v21);
  v13 = v21;
  v14 = self->updateRecordExternal;
  v20 = v13;
  hmbBindDataSQLite3(v14, 2, v12, &v20);

  v15 = v20;
  v16 = self->updateRecordExternal;
  v19 = v15;
  hmbBindDataSQLite3(v16, 3, v11, &v19);

  v17 = v19;
  LOBYTE(a6) = __execAndSetError(self, self->updateRecordExternal, v17, a6);

  return (char)a6;
}

- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  sqlite3_stmt *updateRecordExternalExternal;
  id v11;
  id v12;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  id v19;
  id v20;
  id v21;

  updateRecordExternalExternal = self->updateRecordExternalExternal;
  v21 = 0;
  v11 = a5;
  v12 = a4;
  hmbBindIntSQLite3(updateRecordExternalExternal, 1, a3, &v21);
  v13 = v21;
  v14 = self->updateRecordExternalExternal;
  v20 = v13;
  hmbBindDataSQLite3(v14, 2, v12, &v20);

  v15 = v20;
  v16 = self->updateRecordExternalExternal;
  v19 = v15;
  hmbBindDataSQLite3(v16, 3, v11, &v19);

  v17 = v19;
  LOBYTE(a6) = __execAndSetError(self, self->updateRecordExternalExternal, v17, a6);

  return (char)a6;
}

- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  sqlite3_stmt *updateRecordExternalUUID;
  id v11;
  id v12;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  id v19;
  id v20;
  id v21;

  updateRecordExternalUUID = self->updateRecordExternalUUID;
  v21 = 0;
  v11 = a5;
  v12 = a4;
  hmbBindIntSQLite3(updateRecordExternalUUID, 1, a3, &v21);
  v13 = v21;
  v14 = self->updateRecordExternalUUID;
  v20 = v13;
  hmbBindUUIDSQLite3(v14, 2, v12, &v20);

  v15 = v20;
  v16 = self->updateRecordExternalUUID;
  v19 = v15;
  hmbBindDataSQLite3(v16, 3, v11, &v19);

  v17 = v19;
  LOBYTE(a6) = __execAndSetError(self, self->updateRecordExternalUUID, v17, a6);

  return (char)a6;
}

- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 pushEncoding:(unint64_t)a5 pushData:(id)a6 pushBlockRow:(id)a7 error:(id *)a8
{
  sqlite3_stmt *updateRecordPushUUID;
  id v15;
  id v16;
  id v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  sqlite3_stmt *v21;
  id v22;
  sqlite3_stmt *v23;
  id v24;
  sqlite3_stmt *v25;
  id v26;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  updateRecordPushUUID = self->updateRecordPushUUID;
  v32 = 0;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  hmbBindIntSQLite3(updateRecordPushUUID, 1, a3, &v32);
  v18 = v32;
  v19 = self->updateRecordPushUUID;
  v31 = v18;
  hmbBindUUIDSQLite3(v19, 2, v17, &v31);

  v20 = v31;
  v21 = self->updateRecordPushUUID;
  v30 = v20;
  hmbBindIntSQLite3(v21, 3, a5, &v30);
  v22 = v30;

  v23 = self->updateRecordPushUUID;
  v29 = v22;
  hmbBindDataSQLite3(v23, 4, v16, &v29);

  v24 = v29;
  v25 = self->updateRecordPushUUID;
  v28 = v24;
  hmbBindIntNumberSQLite3(v25, 5, v15, &v28);

  v26 = v28;
  LOBYTE(a8) = __execAndSetError(self, self->updateRecordPushUUID, v26, a8);

  return (char)a8;
}

- (BOOL)_updateRecordsClearPushWithPushBlockRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *updateRecordsClearPush;
  id v7;
  id v9;

  updateRecordsClearPush = self->updateRecordsClearPush;
  v9 = 0;
  hmbBindIntSQLite3(updateRecordsClearPush, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->updateRecordsClearPush, v7, a4);

  return (char)a4;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 modelEncoding:(unint64_t)a4 modelData:(id)a5 modelSchema:(id)a6 error:(id *)a7
{
  sqlite3_stmt *updateRecord;
  id v13;
  id v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  sqlite3_stmt *v18;
  id v19;
  sqlite3_stmt *v20;
  id v21;
  id v23;
  id v24;
  id v25;
  id v26;

  updateRecord = self->updateRecord;
  v26 = 0;
  v13 = a6;
  v14 = a5;
  hmbBindIntSQLite3(updateRecord, 1, a3, &v26);
  v15 = v26;
  v16 = self->updateRecord;
  v25 = v15;
  hmbBindIntSQLite3(v16, 2, a4, &v25);
  v17 = v25;

  v18 = self->updateRecord;
  v24 = v17;
  hmbBindDataSQLite3(v18, 3, v14, &v24);

  v19 = v24;
  v20 = self->updateRecord;
  v23 = v19;
  hmbBindUUIDSQLite3(v20, 4, v13, &v23);

  v21 = v23;
  LOBYTE(a7) = __execAndSetError(self, self->updateRecord, v21, a7);

  return (char)a7;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 pushBlockRow:(id)a4 pushData:(id)a5 pushEncoding:(unint64_t)a6 error:(id *)a7
{
  sqlite3_stmt *updateRecordPush;
  id v13;
  id v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  sqlite3_stmt *v18;
  id v19;
  sqlite3_stmt *v20;
  id v21;
  id v23;
  id v24;
  id v25;
  id v26;

  updateRecordPush = self->updateRecordPush;
  v26 = 0;
  v13 = a5;
  v14 = a4;
  hmbBindIntSQLite3(updateRecordPush, 1, a3, &v26);
  v15 = v26;
  v16 = self->updateRecordPush;
  v25 = v15;
  hmbBindIntSQLite3(v16, 2, a6, &v25);
  v17 = v25;

  v18 = self->updateRecordPush;
  v24 = v17;
  hmbBindDataSQLite3(v18, 3, v13, &v24);

  v19 = v24;
  v20 = self->updateRecordPush;
  v23 = v19;
  hmbBindIntNumberSQLite3(v20, 4, v14, &v23);

  v21 = v23;
  LOBYTE(a7) = __execAndSetError(self, self->updateRecordPush, v21, a7);

  return (char)a7;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 modelType:(id)a4 modelSchema:(id)a5 error:(id *)a6
{
  sqlite3_stmt *updateRecordType;
  id v11;
  id v12;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  id v19;
  id v20;
  id v21;

  updateRecordType = self->updateRecordType;
  v21 = 0;
  v11 = a5;
  v12 = a4;
  hmbBindIntSQLite3(updateRecordType, 1, a3, &v21);
  v13 = v21;
  v14 = self->updateRecordType;
  v20 = v13;
  hmbBindStringSQLite3(v14, 2, v12, &v20);

  v15 = v20;
  v16 = self->updateRecordType;
  v19 = v15;
  hmbBindUUIDSQLite3(v16, 3, v11, &v19);

  v17 = v19;
  LOBYTE(a6) = __execAndSetError(self, self->updateRecordType, v17, a6);

  return (char)a6;
}

- (BOOL)_deleteRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 error:(id *)a5
{
  sqlite3_stmt *deleteRecordUUID;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  id v14;
  id v15;

  deleteRecordUUID = self->deleteRecordUUID;
  v15 = 0;
  v9 = a4;
  hmbBindIntSQLite3(deleteRecordUUID, 1, a3, &v15);
  v10 = v15;
  v11 = self->deleteRecordUUID;
  v14 = v10;
  hmbBindUUIDSQLite3(v11, 2, v9, &v14);

  v12 = v14;
  LOBYTE(a5) = __execAndSetError(self, self->deleteRecordUUID, v12, a5);

  return (char)a5;
}

- (BOOL)_deleteRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 error:(id *)a5
{
  sqlite3_stmt *deleteRecordExternal;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  id v14;
  id v15;

  deleteRecordExternal = self->deleteRecordExternal;
  v15 = 0;
  v9 = a4;
  hmbBindIntSQLite3(deleteRecordExternal, 1, a3, &v15);
  v10 = v15;
  v11 = self->deleteRecordExternal;
  v14 = v10;
  hmbBindDataSQLite3(v11, 2, v9, &v14);

  v12 = v14;
  LOBYTE(a5) = __execAndSetError(self, self->deleteRecordExternal, v12, a5);

  return (char)a5;
}

- (BOOL)_deleteRecordWithRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteRecord;
  id v7;
  id v9;

  deleteRecord = self->deleteRecord;
  v9 = 0;
  hmbBindIntSQLite3(deleteRecord, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteRecord, v7, a4);

  return (char)a4;
}

- (unint64_t)_deleteRecordWithRow:(unint64_t)a3 expectedOutputBlockRow:(unint64_t)a4 error:(id *)a5
{
  sqlite3_stmt *deleteRecordBlock;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  unint64_t v12;
  sqlite3_stmt *v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  id v20;

  deleteRecordBlock = self->deleteRecordBlock;
  v20 = 0;
  hmbBindIntSQLite3(deleteRecordBlock, 1, a3, &v20);
  v9 = v20;
  v10 = self->deleteRecordBlock;
  v19 = v9;
  hmbBindIntSQLite3(v10, 2, a4, &v19);
  v11 = v19;

  if (v11)
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    v13 = self->deleteRecordBlock;
    v18 = 0;
    v14 = -[HMBSQLContext execSQLite3:error:](self, "execSQLite3:error:", v13, &v18);
    v15 = v18;
    v16 = v15;
    if (v14)
    {
      v12 = 2;
    }
    else if (v15)
    {
      v12 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v15);
    }
    else
    {
      v12 = 1;
    }

  }
  return v12;
}

- (unint64_t)_clearPushForRecordRow:(unint64_t)a3 expectedOutputBlockRow:(unint64_t)a4 error:(id *)a5
{
  sqlite3_stmt *updateRecordClearPushExpected;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  unint64_t v12;
  sqlite3_stmt *v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  id v20;

  updateRecordClearPushExpected = self->updateRecordClearPushExpected;
  v20 = 0;
  hmbBindIntSQLite3(updateRecordClearPushExpected, 1, a3, &v20);
  v9 = v20;
  v10 = self->updateRecordClearPushExpected;
  v19 = v9;
  hmbBindIntSQLite3(v10, 2, a4, &v19);
  v11 = v19;

  if (v11)
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    v13 = self->updateRecordClearPushExpected;
    v18 = 0;
    v14 = -[HMBSQLContext execSQLite3:error:](self, "execSQLite3:error:", v13, &v18);
    v15 = v18;
    v16 = v15;
    if (v14)
    {
      v12 = 2;
    }
    else if (v15)
    {
      v12 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v15);
    }
    else
    {
      v12 = 1;
    }

  }
  return v12;
}

- (BOOL)_deleteRecordsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteRecordsStore;
  id v7;
  id v9;

  deleteRecordsStore = self->deleteRecordsStore;
  v9 = 0;
  hmbBindIntSQLite3(deleteRecordsStore, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteRecordsStore, v7, a4);

  return (char)a4;
}

- (BOOL)_deleteZombieRecordsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *deleteZombieRecords;
  id v7;
  id v9;

  deleteZombieRecords = self->deleteZombieRecords;
  v9 = 0;
  hmbBindIntSQLite3(deleteZombieRecords, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->deleteZombieRecords, v7, a4);

  return (char)a4;
}

- (id)_selectRecordModelIDWithZoneRow:(unint64_t)a3 externalID:(id)a4 error:(id *)a5
{
  id v8;
  sqlite3_stmt *selectRecordUUIDExternal;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v8 = a4;
  hmbBindIntSQLite3(self->selectRecordUUIDExternal, 1, a3, a5);
  hmbBindDataSQLite3(self->selectRecordUUIDExternal, 2, v8, a5);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7150;
  v17 = __Block_byref_object_dispose__7151;
  selectRecordUUIDExternal = self->selectRecordUUIDExternal;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__HMBLocalSQLContext_Record___selectRecordModelIDWithZoneRow_externalID_error___block_invoke;
  v12[3] = &unk_1E8933C98;
  v12[4] = &v13;
  if (-[HMBSQLContext fetchSQLite3One:error:block:](self, "fetchSQLite3One:error:block:", selectRecordUUIDExternal, a5, v12))
  {
    v10 = (id)v14[5];
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)_selectRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  id v10;
  sqlite3_stmt *selectRecordUUID;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v10 = a4;
  hmbBindIntSQLite3(self->selectRecordUUID, 1, a3, a6);
  hmbBindUUIDSQLite3(self->selectRecordUUID, 2, v10, a6);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7150;
  v19 = __Block_byref_object_dispose__7151;
  v20 = 0;
  selectRecordUUID = self->selectRecordUUID;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__HMBLocalSQLContext_Record___selectRecordWithZoneRow_modelID_returning_error___block_invoke;
  v14[3] = &unk_1E8933CC0;
  v14[4] = &v15;
  v14[5] = a5;
  if (-[HMBSQLContext fetchSQLite3One:error:block:](self, "fetchSQLite3One:error:block:", selectRecordUUID, a6, v14))
    v12 = (id)v16[5];
  else
    v12 = 0;
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)_selectRecordWithRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  sqlite3_stmt *selectRecord;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  hmbBindIntSQLite3(self->selectRecord, 1, a3, a5);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7150;
  v16 = __Block_byref_object_dispose__7151;
  v17 = 0;
  selectRecord = self->selectRecord;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__HMBLocalSQLContext_Record___selectRecordWithRow_returning_error___block_invoke;
  v11[3] = &unk_1E8933CC0;
  v11[4] = &v12;
  v11[5] = a4;
  if (-[HMBSQLContext fetchSQLite3One:error:block:](self, "fetchSQLite3One:error:block:", selectRecord, a5, v11))
    v9 = (id)v13[5];
  else
    v9 = 0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)_selectRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  id v10;
  sqlite3_stmt *selectRecordExternal;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v10 = a4;
  hmbBindIntSQLite3(self->selectRecordExternal, 1, a3, a6);
  hmbBindDataSQLite3(self->selectRecordExternal, 2, v10, a6);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7150;
  v19 = __Block_byref_object_dispose__7151;
  v20 = 0;
  selectRecordExternal = self->selectRecordExternal;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__HMBLocalSQLContext_Record___selectRecordWithZoneRow_externalID_returning_error___block_invoke;
  v14[3] = &unk_1E8933CC0;
  v14[4] = &v15;
  v14[5] = a5;
  if (-[HMBSQLContext fetchSQLite3One:error:block:](self, "fetchSQLite3One:error:block:", selectRecordExternal, a6, v14))
  {
    v12 = (id)v16[5];
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)_selectRecordsWithZoneRow:(unint64_t)a3 parentModelID:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  sqlite3_stmt *selectRecordsParentUUID;
  id v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  unint64_t v19;

  selectRecordsParentUUID = self->selectRecordsParentUUID;
  v11 = a4;
  hmbBindIntSQLite3(selectRecordsParentUUID, 1, a3, a6);
  hmbBindUUIDSQLite3(self->selectRecordsParentUUID, 2, v11, a6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->selectRecordsParentUUID;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_parentModelID_returning_error___block_invoke;
  v17[3] = &unk_1E8933CE8;
  v19 = a5;
  v14 = v12;
  v18 = v14;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", v13, a6, v17))
    v15 = v14;
  else
    v15 = 0;

  return v15;
}

- (id)_selectRecordWithZoneRow:(unint64_t)a3 parentModelID:(id)a4 modelType:(id)a5 returning:(unint64_t)a6 error:(id *)a7
{
  sqlite3_stmt *selectRecordsParentUUIDType;
  id v13;
  id v14;
  void *v15;
  sqlite3_stmt *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  unint64_t v22;

  selectRecordsParentUUIDType = self->selectRecordsParentUUIDType;
  v13 = a5;
  v14 = a4;
  hmbBindIntSQLite3(selectRecordsParentUUIDType, 1, a3, a7);
  hmbBindStringSQLite3(self->selectRecordsParentUUIDType, 2, v13, a7);

  hmbBindUUIDSQLite3(self->selectRecordsParentUUIDType, 3, v14, a7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->selectRecordsParentUUIDType;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __95__HMBLocalSQLContext_Record___selectRecordWithZoneRow_parentModelID_modelType_returning_error___block_invoke;
  v20[3] = &unk_1E8933CE8;
  v22 = a6;
  v17 = v15;
  v21 = v17;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", v16, a7, v20))
    v18 = v17;
  else
    v18 = 0;

  return v18;
}

- (id)_selectRecordsWithZoneRow:(unint64_t)a3 modelType:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  sqlite3_stmt *selectRecordsOfType;
  id v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  unint64_t v19;

  selectRecordsOfType = self->selectRecordsOfType;
  v11 = a4;
  hmbBindIntSQLite3(selectRecordsOfType, 1, a3, a6);
  hmbBindStringSQLite3(self->selectRecordsOfType, 2, v11, a6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->selectRecordsOfType;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error___block_invoke;
  v17[3] = &unk_1E8933CE8;
  v19 = a5;
  v14 = v12;
  v18 = v14;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", v13, a6, v17))
    v15 = v14;
  else
    v15 = 0;

  return v15;
}

- (BOOL)_selectRecordsWithZoneRow:(unint64_t)a3 modelType:(id)a4 returning:(unint64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  sqlite3_stmt *selectRecordsOfType;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  unint64_t v20;

  v12 = a7;
  selectRecordsOfType = self->selectRecordsOfType;
  v14 = a4;
  hmbBindIntSQLite3(selectRecordsOfType, 1, a3, a6);
  hmbBindStringSQLite3(self->selectRecordsOfType, 2, v14, a6);

  v15 = self->selectRecordsOfType;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error_handler___block_invoke;
  v18[3] = &unk_1E8933D10;
  v19 = v12;
  v20 = a5;
  v16 = v12;
  LOBYTE(a6) = -[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", v15, a6, v18);

  return (char)a6;
}

- (id)_selectRecordsWithZoneRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  sqlite3_stmt *selectRecords;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  hmbBindIntSQLite3(self->selectRecords, 1, a3, a5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  selectRecords = self->selectRecords;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_returning_error___block_invoke;
  v13[3] = &unk_1E8933CE8;
  v15 = a4;
  v10 = v8;
  v14 = v10;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", selectRecords, a5, v13))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)_selectRecordsWithBlockRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  sqlite3_stmt *selectRecordsPushBlock;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  hmbBindIntSQLite3(self->selectRecordsPushBlock, 1, a3, a5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  selectRecordsPushBlock = self->selectRecordsPushBlock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HMBLocalSQLContext_Record___selectRecordsWithBlockRow_returning_error___block_invoke;
  v13[3] = &unk_1E8933CE8;
  v15 = a4;
  v10 = v8;
  v14 = v10;
  if (-[HMBSQLContext fetchSQLite3:error:block:](self, "fetchSQLite3:error:block:", selectRecordsPushBlock, a5, v13))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)selectAllRecordsWithZoneRow:(unint64_t)a3 returning:(unint64_t)a4
{
  return -[HMBLocalSQLIteratorRowRecord initWithSQLContext:zoneRow:returning:]([HMBLocalSQLIteratorRowRecord alloc], "initWithSQLContext:zoneRow:returning:", self, a3, a4);
}

- (BOOL)_resetOutputForRecordsWithBlockRow:(unint64_t)a3 error:(id *)a4
{
  sqlite3_stmt *updateRecordsClearPush;
  id v7;
  id v9;

  updateRecordsClearPush = self->updateRecordsClearPush;
  v9 = 0;
  hmbBindIntSQLite3(updateRecordsClearPush, 1, a3, &v9);
  v7 = v9;
  LOBYTE(a4) = __execAndSetError(self, self->updateRecordsClearPush, v7, a4);

  return (char)a4;
}

uint64_t __73__HMBLocalSQLContext_Record___selectRecordsWithBlockRow_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

uint64_t __72__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

uint64_t __90__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  HMBLocalSQLContextRowRecord *v5;

  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  objc_autoreleasePoolPop(v4);
  return 0;
}

uint64_t __82__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

uint64_t __95__HMBLocalSQLContext_Record___selectRecordWithZoneRow_parentModelID_modelType_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

uint64_t __86__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_parentModelID_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

uint64_t __82__HMBLocalSQLContext_Record___selectRecordWithZoneRow_externalID_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;
  uint64_t v4;
  void *v5;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __67__HMBLocalSQLContext_Record___selectRecordWithRow_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;
  uint64_t v4;
  void *v5;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __79__HMBLocalSQLContext_Record___selectRecordWithZoneRow_modelID_returning_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HMBLocalSQLContextRowRecord *v3;
  uint64_t v4;
  void *v5;

  v3 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a2, *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __79__HMBLocalSQLContext_Record___selectRecordModelIDWithZoneRow_externalID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDWithSQLite3Column:column:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

- (int64_t)migrateToSchema01WithError:(id *)a3
{
  id v5;
  int64_t v6;
  _BOOL4 v7;

  -[HMBSQLContext runSQLite3:](self, "runSQLite3:", objc_msgSend(CFSTR("CREATE TABLE IF NOT EXISTS index_sentinel(                 store_id            INTEGER NOT NULL, type                TEXT NOT NULL, CONSTRAINT fk_index_sentinel FOREIGN KEY (store_id) REFERENCES store_v2 (id) ON DELETE CASCADE);"),
      "UTF8String"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a3)
    {
LABEL_3:
      v5 = objc_retainAutorelease(v5);
      v6 = 0;
      *a3 = v5;
      goto LABEL_10;
    }
LABEL_6:
    v6 = 0;
    goto LABEL_10;
  }
  -[HMBSQLContext runSQLite3:](self, "runSQLite3:", objc_msgSend(CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS index_sentinel_unique ON index_sentinel (store_id, type);"),
      "UTF8String"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a3)
      goto LABEL_3;
    goto LABEL_6;
  }
  v7 = -[HMBSQLContext setSchemaVersion:error:](self, "setSchemaVersion:error:", 1, a3);
  v5 = 0;
  if (v7)
    v6 = 3;
  else
    v6 = 0;
LABEL_10:

  return v6;
}

@end
