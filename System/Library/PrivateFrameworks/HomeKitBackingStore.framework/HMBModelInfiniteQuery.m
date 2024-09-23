@implementation HMBModelInfiniteQuery

- (HMBModelInfiniteQuery)initWithSQLPredicate:(id)a3 sequenceArgumentName:(id)a4 maximumRowsPerSelect:(unint64_t)a5 indexNameSuffix:(id)a6 indexedColumns:(id)a7 arguments:(id)a8
{
  id v15;
  HMBModelInfiniteQuery *v16;
  HMBModelInfiniteQuery *v17;
  objc_super v19;

  v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMBModelInfiniteQuery;
  v16 = -[HMBModelIndexedQuery initWithSQLPredicate:initialSequence:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:](&v19, sel_initWithSQLPredicate_initialSequence_maximumRowsPerSelect_indexNameSuffix_indexedColumns_arguments_, a3, 0, a5, a6, a7, a8);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_sequenceArgumentName, a4);

  return v17;
}

- (id)performQueryOn:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HMBLocalZoneQueryResultRecordIDSequence *v24;
  HMBModelInfiniteQuery *v26;
  SEL v27;
  id v28;
  void *v29;

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
    -[HMBModelInfiniteQuery sequenceArgumentName](self, "sequenceArgumentName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;

LABEL_5:
      objc_msgSend((id)objc_opt_class(), "hmbEncodeQueryableParameter:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arguments");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModelInfiniteQuery sequenceArgumentName](self, "sequenceArgumentName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v7;
      v22 = v6;
      v23 = objc_msgSend(v21, "unsignedIntegerValue");

      v24 = -[HMBLocalZoneQueryResultRecordIDSequence initWithLocalZone:statement:initialSequence:sequenceBindOffset:arguments:maximumRowsPerSelect:]([HMBLocalZoneQueryResultRecordIDSequence alloc], "initWithLocalZone:statement:initialSequence:sequenceBindOffset:arguments:maximumRowsPerSelect:", v22, v10, v18, v23, v11, -[HMBModelQuery maximumRowsPerSelect](self, "maximumRowsPerSelect"));
      return v24;
    }
    -[HMBModelQuery arguments](self, "arguments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModelInfiniteQuery sequenceArgumentName](self, "sequenceArgumentName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_5;
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v26 = (HMBModelInfiniteQuery *)_HMFPreconditionFailure();
  return -[HMBModelInfiniteQuery sqlSelectStatementForModelType:](v26, v27, v28);
}

- (id)sqlSelectStatementForModelType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[HMBModelQuery arguments](self, "arguments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelInfiniteQuery sequenceArgumentName](self, "sequenceArgumentName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelQuery sqlPredicate](self, "sqlPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT _record_id, %@ FROM queryable_%@ WHERE _store_id = :_store_id AND %@"), v9, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)sequenceArgumentName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceArgumentName, 0);
}

+ (id)queryWithSQLPredicate:(id)a3 sequenceArgumentName:(id)a4 indexedProperties:(id)a5 arguments:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  HMBModelInfiniteQuery *v21;
  unint64_t v22;
  void *v23;
  HMBModelInfiniteQuery *v24;
  HMBModelCountMatchesQuery *v26;
  SEL v27;
  id v28;
  id v29;
  id *v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
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
  if (!v11)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v13 = v12;
  if (!v12)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("_"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count") + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", CFSTR("_store_id"));
  objc_msgSend(v15, "addObjectsFromArray:", v11);
  objc_msgSend(v13, "objectForKey:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v17 = v16;
  objc_msgSend(v16, "propertyName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v20 & 1) != 0)
  {
    v21 = [HMBModelInfiniteQuery alloc];
    v22 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
    v23 = (void *)objc_msgSend(v15, "copy");
    v24 = -[HMBModelInfiniteQuery initWithSQLPredicate:sequenceArgumentName:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:](v21, "initWithSQLPredicate:sequenceArgumentName:maximumRowsPerSelect:indexNameSuffix:indexedColumns:arguments:", v9, v10, v22, v14, v23, v13);

    return v24;
  }
LABEL_13:
  v26 = (HMBModelCountMatchesQuery *)_HMFPreconditionFailure();
  return -[HMBModelCountMatchesQuery countMatchesOn:arguments:error:](v26, v27, v28, v29, v30);
}

@end
