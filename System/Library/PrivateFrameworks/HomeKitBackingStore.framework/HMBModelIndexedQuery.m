@implementation HMBModelIndexedQuery

- (HMBModelIndexedQuery)initWithSQLPredicate:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 indexNameSuffix:(id)a6 indexedColumns:(id)a7 arguments:(id)a8
{
  id v14;
  id v15;
  HMBModelIndexedQuery *v16;
  uint64_t v17;
  NSString *indexNameSuffix;
  uint64_t v19;
  NSArray *indexedColumns;
  objc_super v22;

  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMBModelIndexedQuery;
  v16 = -[HMBModelQuery initWithSQLPredicate:initialSequence:maximumRowsPerSelect:arguments:](&v22, sel_initWithSQLPredicate_initialSequence_maximumRowsPerSelect_arguments_, a3, a4, a5, a8);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    indexNameSuffix = v16->_indexNameSuffix;
    v16->_indexNameSuffix = (NSString *)v17;

    v19 = objc_msgSend(v15, "copy");
    indexedColumns = v16->_indexedColumns;
    v16->_indexedColumns = (NSArray *)v19;

  }
  return v16;
}

- (NSString)indexName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(-[HMBModelQuery modelClass](self, "modelClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelIndexedQuery indexNameSuffix](self, "indexNameSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("qi_%@_%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)hasExpectedIndexes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  uint64_t v14;
  void *v15;
  HMBModelIndexedQuery *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  HMBModelIndexedQuery *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!+[HMBSQLStatement explainStatements](HMBSQLStatement, "explainStatements"))
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMBModelIndexedQuery indexName](self, "indexName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("INDEX %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBModelQuery preparedQueries](self, "preparedQueries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_12;
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C809B0];
  while (1)
  {
    objc_msgSend(v9, "queryPlans");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke;
    v23[3] = &unk_1E8932870;
    v12 = v5;
    v24 = v12;
    v25 = self;
    v13 = objc_msgSend(v11, "na_any:", v23);

    if ((v13 & 1) == 0)
      break;

    objc_msgSend(v7, "nextObject");
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
    if (!v14)
      goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x1D17B6230]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = sqlite3_sql((sqlite3_stmt *)objc_msgSend(v9, "statement"));
    *(_DWORD *)buf = 138543874;
    v27 = v18;
    v28 = 2112;
    v29 = v12;
    v30 = 2080;
    v31 = v19;
    _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Didn't find reference to %@ in query plan for %s:", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v9, "queryPlans");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_146;
  v22[3] = &unk_1E8932898;
  v22[4] = v16;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v22);

LABEL_10:
  return v13;
}

- (NSString)indexNameSuffix
{
  return self->_indexNameSuffix;
}

- (NSArray)indexedColumns
{
  return self->_indexedColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexedColumns, 0);
  objc_storeStrong((id *)&self->_indexNameSuffix, 0);
}

uint64_t __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "detail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "indexedColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_2;
  v9[3] = &unk_1E8932848;
  v10 = v3;
  v7 = v3;
  LODWORD(v4) = objc_msgSend(v6, "na_allObjectsPassTest:", v9);

  return v5 & v4;
}

void __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (int)objc_msgSend(v3, "row");
    v9 = (int)objc_msgSend(v3, "parent");
    objc_msgSend(v3, "detail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    v15 = 2048;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@    %lu.%lu %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "detail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("("));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "containsString:", v3);
  return v7;
}

+ (id)queryWithSQLPredicate:(id)a3 ascending:(BOOL)a4 indexedProperties:(id)a5 arguments:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  HMBModelIndexedQuery *v17;
  HMBModelFiniteQuery *v19;
  SEL v20;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v10)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_10:
    v19 = (HMBModelFiniteQuery *)_HMFPreconditionFailure();
    return -[HMBModelFiniteQuery indexName](v19, v20);
  }
  v13 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
  if (v8)
    v14 = &unk_1E8947730;
  else
    v14 = &unk_1E8947748;
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count") + 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", CFSTR("_store_id"));
  objc_msgSend(v16, "addObjectsFromArray:", v10);
  objc_msgSend(v16, "addObject:", CFSTR("_record_id"));
  v17 = -[HMBModelIndexedQuery initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:]([HMBModelIndexedQuery alloc], "initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:", v9, v14, v13, v15, v16, v12);

  return v17;
}

@end
