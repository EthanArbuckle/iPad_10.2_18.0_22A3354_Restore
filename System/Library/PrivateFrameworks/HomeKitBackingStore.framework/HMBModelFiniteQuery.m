@implementation HMBModelFiniteQuery

- (id)indexName
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("qf_%@_%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)performQueryOn:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMBLocalZoneQueryResultRecordID *v12;
  HMBModelFiniteQuery *v14;
  SEL v15;
  id v16;

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
    v12 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:]([HMBLocalZoneQueryResultRecordID alloc], "initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:", v6, v10, 0, v11, -[HMBModelQuery maximumRowsPerSelect](self, "maximumRowsPerSelect"));

    return v12;
  }
  else
  {
    v14 = (HMBModelFiniteQuery *)_HMFPreconditionFailure();
    return -[HMBModelFiniteQuery sqlSelectStatementForModelType:](v14, v15, v16);
  }
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT _record_id FROM queryable_%@ WHERE _store_id = :_store_id AND %@ LIMIT %lu"), v5, v6, -[HMBModelQuery maximumRowsPerSelect](self, "maximumRowsPerSelect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)queryWithSQLPredicate:(id)a3 maximumRowsReturned:(unint64_t)a4 indexedProperties:(id)a5 arguments:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMBModelFiniteQuery *v15;
  void *v16;
  HMBModelFiniteQuery *v17;
  HMBModelInfiniteQuery *v19;
  SEL v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count") + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", CFSTR("_store_id"));
    objc_msgSend(v14, "addObjectsFromArray:", v10);
    v15 = [HMBModelFiniteQuery alloc];
    v16 = (void *)objc_msgSend(v14, "copy");
    v17 = -[HMBModelIndexedQuery initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:](v15, "initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:", v9, 0, a4, v13, v16, v12);

    return v17;
  }
LABEL_9:
  v19 = (HMBModelInfiniteQuery *)_HMFPreconditionFailure();
  return -[HMBModelInfiniteQuery initWithSQLPredicate:sequenceArgumentName:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:](v19, v20, v21, v22, v23, v24, v25, v26);
}

@end
