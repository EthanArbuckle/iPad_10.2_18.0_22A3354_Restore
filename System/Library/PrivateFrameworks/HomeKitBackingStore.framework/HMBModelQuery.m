@implementation HMBModelQuery

- (HMBModelQuery)initWithSQLPredicate:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 arguments:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMBModelQuery *v14;
  HMBModelQuery *v15;
  uint64_t v16;
  NSDictionary *arguments;
  uint64_t v18;
  NSMapTable *preparedQueries;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMBModelQuery;
  v14 = -[HMBModelQuery init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sqlPredicate, a3);
    v16 = objc_msgSend(v13, "copy");
    arguments = v15->_arguments;
    v15->_arguments = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_initialSequence, a4);
    v15->_maximumRowsPerSelect = a5;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    preparedQueries = v15->_preparedQueries;
    v15->_preparedQueries = (NSMapTable *)v18;

  }
  return v15;
}

- (void)setModelClass:(Class)a3
{
  HMBModelQuery *v5;
  SEL v6;
  id v7;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_7:
    v5 = (HMBModelQuery *)_HMFPreconditionFailure();
    -[HMBModelQuery prepareOnTable:](v5, v6, v7);
    return;
  }
  if (!self->_modelClass)
    objc_storeStrong((id *)&self->_modelClass, a3);
  if (-[HMBModelQuery modelClass](self, "modelClass") != a3)
    goto LABEL_7;
}

- (id)prepareOnTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMBSQLQueryStatement *v10;
  void *v11;
  NSString **p_sqlSelect;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *v21;
  void *v22;
  NSDictionary *argumentFields;
  NSDictionary *v24;
  NSDictionary *encodedDefaultValuesByArgumentName;
  NSDictionary *v26;
  void *v28;
  HMBModelQuery *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  HMBModelQuery *v40;
  _QWORD v41[5];
  id v42;
  NSDictionary *v43;
  NSDictionary *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelQuery preparedQueries](self, "preparedQueries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "modelType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModelQuery sqlSelectStatementForModelType:](self, "sqlSelectStatementForModelType:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[HMBSQLQueryStatement initWithContext:statement:]([HMBSQLQueryStatement alloc], "initWithContext:statement:", v5, v8);
    if (!v10)
    {
      v28 = (void *)MEMORY[0x1D17B6230]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v31;
        v47 = 2112;
        v48 = v8;
        _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare statement: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v32 = (void *)MEMORY[0x1E0C99DA0];
      v33 = *MEMORY[0x1E0C99768];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to prepare statement: %@"), v8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, v34, 0);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v35);
    }
    v7 = v10;
    -[HMBModelQuery preparedQueries](self, "preparedQueries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, v5);

    p_sqlSelect = &self->_sqlSelect;
    if (!self->_sqlSelect && v8)
    {
      v13 = (void *)MEMORY[0x1E0C99E08];
      -[HMBModelQuery arguments](self, "arguments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C99E08];
      -[HMBModelQuery arguments](self, "arguments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[objc_class hmbProperties](-[HMBModelQuery modelClass](self, "modelClass"), "hmbProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arguments");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __32__HMBModelQuery_prepareOnTable___block_invoke;
      v41[3] = &unk_1E89327F8;
      v41[4] = self;
      v42 = v18;
      v20 = v36;
      v43 = v20;
      v21 = v17;
      v44 = v21;
      v37 = v18;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v41);

      -[HMBModelQuery arguments](self, "arguments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __32__HMBModelQuery_prepareOnTable___block_invoke_37;
      v38[3] = &unk_1E8932820;
      v7 = v7;
      v39 = v7;
      v40 = self;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v38);

      argumentFields = self->_argumentFields;
      self->_argumentFields = v20;
      v24 = v20;

      encodedDefaultValuesByArgumentName = self->_encodedDefaultValuesByArgumentName;
      self->_encodedDefaultValuesByArgumentName = v21;
      v26 = v21;

      objc_storeStrong((id *)p_sqlSelect, v8);
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMBModelQuery modelClass](self, "modelClass");
  if (v4)
  {
    NSStringFromClass(-[HMBModelQuery modelClass](self, "modelClass"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Unknown");
  }
  -[HMBModelQuery sqlPredicate](self, "sqlPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMBModelUnindexedQuery class: %@ query: '%@'>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  return v7;
}

- (id)performQueryOn:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)sqlSelectStatementForModelType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)hasExpectedIndexes
{
  HMBModelQuery *v3;
  SEL v4;

  if (+[HMBSQLStatement explainStatements](HMBSQLStatement, "explainStatements"))
    return 1;
  v3 = (HMBModelQuery *)_HMFPreconditionFailure();
  return -[HMBModelQuery preparedQueries](v3, v4);
}

- (NSMapTable)preparedQueries
{
  return self->_preparedQueries;
}

- (NSString)sqlPredicate
{
  return self->_sqlPredicate;
}

- (unint64_t)maximumRowsPerSelect
{
  return self->_maximumRowsPerSelect;
}

- (NSNumber)initialSequence
{
  return self->_initialSequence;
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (NSString)sqlSelect
{
  return self->_sqlSelect;
}

- (NSDictionary)argumentFields
{
  return self->_argumentFields;
}

- (NSDictionary)encodedDefaultValuesByArgumentName
{
  return self->_encodedDefaultValuesByArgumentName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedDefaultValuesByArgumentName, 0);
  objc_storeStrong((id *)&self->_argumentFields, 0);
  objc_storeStrong((id *)&self->_sqlSelect, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_initialSequence, 0);
  objc_storeStrong((id *)&self->_sqlPredicate, 0);
  objc_storeStrong((id *)&self->_preparedQueries, 0);
}

void __32__HMBModelQuery_prepareOnTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "arguments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!objc_msgSend(v38, "isEqualToString:", CFSTR("_sequence_offset")) || v7)
    && (objc_msgSend(v38, "hasPrefix:", CFSTR("_")) & 1) == 0)
  {
    if (!v7)
    {
      v14 = (void *)MEMORY[0x1D17B6230]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "arguments");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v17;
        v41 = 2112;
        v42 = v38;
        v43 = 2112;
        v44 = (uint64_t)v18;
        _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@The query statement's SQL contains an argument named '%@' which does not exist as an argument in the query's argument dictionary: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = *MEMORY[0x1E0C99768];
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "arguments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("The query statement's SQL contains an argument named '%@' which does not exist as an argument in the query's argument dictionary: %@"), v38, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v23, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v24);
    }
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v7, "propertyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v25 = (void *)MEMORY[0x1D17B6230]();
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "propertyName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(*(id *)(a1 + 32), "modelClass");
        v31 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v40 = v28;
        v41 = 2112;
        v42 = v29;
        v43 = 2112;
        v44 = v30;
        v45 = 2112;
        v46 = v31;
        _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_ERROR, "%{public}@The query statement's SQL contains an argument for a property named '%@' which does not exist as a property on %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      v32 = (void *)MEMORY[0x1E0C99DA0];
      v33 = *MEMORY[0x1E0C99768];
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "propertyName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("The query statement's SQL contains an argument for a property named '%@' which does not exist as a property on %@: %@"), v35, objc_msgSend(*(id *)(a1 + 32), "modelClass"), *(_QWORD *)(a1 + 40));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, v36, 0);
      v37 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v37);
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v10, v38);
    objc_msgSend(v7, "defaultValue");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "encodeQueryableValue:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v13, v38);

  }
}

void __32__HMBModelQuery_prepareOnTable___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "arguments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "arguments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@The query's argument dictionary contains an argument named '%@' which does not exist as an argument in the query statement's SQL: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "arguments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("The query's argument dictionary contains an argument named '%@' which does not exist as an argument in the query statement's SQL: %@"), v19, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v18);
  }

}

@end
