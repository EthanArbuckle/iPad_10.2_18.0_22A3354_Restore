@implementation HMBModelCountMatchesQuery

- (id)countMatchesOn:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  void *v22;
  id result;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v8 = a3;
  v9 = a4;
  -[HMBModelQuery preparedQueries](self, "preparedQueries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sql");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  __encodeArguments(self, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(v12, "arguments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hmf_numberForKey:", CFSTR("_store_id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_8:
    result = (id)_HMFPreconditionFailure();
    __break(1u);
    return result;
  }
  objc_msgSend(v8, "sql");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke;
  v24[3] = &unk_1E8932E50;
  v17 = v12;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v19 = v15;
  v27 = v19;
  v20 = v8;
  v28 = v20;
  v29 = &v30;
  v21 = objc_msgSend(v16, "sqlBlockWithActivity:error:block:", 0, a5, v24);

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31[3]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (id)sqlSelectStatementForModelType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[HMBModelQuery sqlPredicate](self, "sqlPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT count('X') FROM queryable_%@, record_v2 WHERE _store_id = :_store_id AND _record_id == id AND model_data IS NOT NULL AND %@ LIMIT 1"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "statement");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = objc_msgSend(*(id *)(a1 + 48), "intValue");
  v8 = objc_msgSend(*(id *)(a1 + 56), "zoneRow");
  v15 = 0;
  +[HMBLocalZoneQueryResult bindPropertiesToStatement:arguments:zoneBindRowOffset:zoneRow:error:](HMBLocalZoneQueryResult, "bindPropertiesToStatement:arguments:zoneBindRowOffset:zoneRow:error:", v5, v6, v7, v8, &v15);
  v9 = v15;
  v10 = objc_msgSend(*(id *)(a1 + 32), "statement");
  v14 = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke_2;
  v13[3] = &unk_1E8933C98;
  v13[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "fetchSQLite3One:error:block:", v10, &v14, v13);

  v11 = v14;
  return v11;
}

uint64_t __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(a2, 0);
  return 0;
}

+ (id)queryWithSQLPredicate:(id)a3 indexedProperties:(id)a4 arguments:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMBModelCountMatchesQuery *v13;
  HMBMirrorOutputTuple *v15;
  SEL v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v8)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("_"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", CFSTR("_store_id"));
    objc_msgSend(v12, "addObjectsFromArray:", v8);
    v13 = -[HMBModelIndexedQuery initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:]([HMBModelCountMatchesQuery alloc], "initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:", v7, 0, 1, v11, v12, v10);

    return v13;
  }
LABEL_7:
  v15 = (HMBMirrorOutputTuple *)_HMFPreconditionFailure();
  return -[HMBMirrorOutputTuple initWithOutputBlockRow:recordRow:model:queryTable:externalID:externalData:](v15, v16, v17, v18, v19, v20, v21, v22);
}

@end
