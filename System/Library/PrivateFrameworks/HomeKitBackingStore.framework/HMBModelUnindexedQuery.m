@implementation HMBModelUnindexedQuery

- (id)performQueryOn:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMBLocalZoneQueryResultRecordID *v12;
  void *v13;
  HMBLocalZoneQueryResultRecordID *v14;
  HMBModelUnindexedQuery *v16;
  SEL v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[HMBModelQuery preparedQueries](self, "preparedQueries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sql");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    __encodeArguments(self, v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [HMBLocalZoneQueryResultRecordID alloc];
    -[HMBModelQuery initialSequence](self, "initialSequence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:](v12, "initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:", v6, v10, v13, v11, -[HMBModelQuery maximumRowsPerSelect](self, "maximumRowsPerSelect"));

    return v14;
  }
  else
  {
    v16 = (HMBModelUnindexedQuery *)_HMFPreconditionFailure();
    return -[HMBModelUnindexedQuery sqlSelectStatementForModelType:](v16, v17, v18);
  }
}

- (id)sqlSelectStatementForModelType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HMBModelQuery initialSequence](self, "initialSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  v7 = CFSTR("DESC");
  if (!v6)
    v7 = CFSTR("ASC");
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[HMBModelQuery sqlPredicate](self, "sqlPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SELECT _record_id FROM queryable_%@ WHERE _store_id = :_store_id AND _record_id > :_sequence_offset AND %@ ORDER BY _record_id %@ LIMIT %lu"), v4, v10, v8, -[HMBModelQuery maximumRowsPerSelect](self, "maximumRowsPerSelect"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)queryWithSQLPredicate:(id)a3 ascending:(BOOL)a4 arguments:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMBModelUnindexedQuery *v12;
  HMBModelIndexedQuery *v14;
  SEL v15;
  id v16;
  id v17;
  unint64_t v18;
  id v19;
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_8:
    v14 = (HMBModelIndexedQuery *)_HMFPreconditionFailure();
    return -[HMBModelIndexedQuery initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:](v14, v15, v16, v17, v18, v19, v20, v21);
  }
  v10 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
  if (v6)
    v11 = &unk_1E8947730;
  else
    v11 = &unk_1E8947748;
  v12 = -[HMBModelQuery initWithSQLPredicate:initialSequence:maximumRowsPerSelect:arguments:]([HMBModelUnindexedQuery alloc], "initWithSQLPredicate:initialSequence:maximumRowsPerSelect:arguments:", v7, v11, v10, v9);

  return v12;
}

@end
