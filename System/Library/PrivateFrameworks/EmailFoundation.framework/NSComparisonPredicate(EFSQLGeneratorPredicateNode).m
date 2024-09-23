@implementation NSComparisonPredicate(EFSQLGeneratorPredicateNode)

- (EFSQLGeneratorComparisonPredicateNode)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  EFSQLGeneratorComparisonPredicateNode *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  uint8_t buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a1, "leftExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "keyPathMappers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3518], "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "ef_publicDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSComparisonPredicate(EFSQLGeneratorPredicateNode) predicateNodeFromPropertyMapper:addingTablesUsed:].cold.1((uint64_t)v10, v14, buf, v13);
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLGeneratorPredicateNode.m"), 131, CFSTR("Couldn't map keypath %@ from predicate"), v10);

  }
  objc_msgSend(v12, "tableName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_addOptionalObject:", v16);
  objc_msgSend(a1, "rightExpression");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "expressionType"))
  {
    if (objc_msgSend(v17, "expressionType") != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLGeneratorPredicateNode.m"), 142, CFSTR("Comparison expression to an invalid type: %lu"), objc_msgSend(v17, "expressionType"));

    }
    objc_msgSend(a1, "rightExpression");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "keyPathMappers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "tableName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v22);

    v23 = -[EFSQLGeneratorComparisonPredicateNode initWithValueSource:predicateOperator:comparisonSource:]([EFSQLGeneratorComparisonPredicateNode alloc], "initWithValueSource:predicateOperator:comparisonSource:", v12, objc_msgSend(a1, "predicateOperatorType"), v21);
  }
  else
  {
    objc_msgSend(a1, "rightExpression");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constantValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v27;

    v23 = -[EFSQLGeneratorComparisonPredicateNode initWithValueSource:predicateOperator:constantValue:]([EFSQLGeneratorComparisonPredicateNode alloc], "initWithValueSource:predicateOperator:constantValue:", v12, objc_msgSend(a1, "predicateOperatorType"), v19);
  }

  return v23;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__NSComparisonPredicate_EFSQLGeneratorPredicateNode__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, block);
  return (id)log_log_7;
}

- (void)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Couldn't map keypath %{public}@ from predicate: %{public}@", buf, 0x16u);

}

@end
