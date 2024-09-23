@implementation ACHPredicateExpressionValidator

- (id)validateTemplate:(id)a3
{
  id v4;
  NSMutableArray *issues;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  NSObject *v77;
  ACHPredicateExpressionValidationResult *v78;

  v4 = a3;
  *(_WORD *)&self->_operatorsValid = 257;
  issues = self->_issues;
  self->_issues = 0;

  ACHLogAssets();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ACHPredicateExpressionValidator validateTemplate:].cold.3(v4, v6);

  objc_msgSend(v4, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "predicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ActivitySharingCompetitions"));

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" == 1"), v8);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "acceptVisitor:flags:", self, 31);

  }
  objc_msgSend(v4, "gracePredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v4, "gracePredicate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateWithFormat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "acceptVisitor:flags:", self, 31);
  }
  objc_msgSend(v4, "valueExpression");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v4, "valueExpression");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDD1548];
      objc_msgSend(v4, "valueExpression");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "expressionWithFormat:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "acceptVisitor:flags:", self, 31);
    }
  }
  objc_msgSend(v4, "graceValueExpression");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v4, "graceValueExpression");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    if (v27)
    {
      v28 = (void *)MEMORY[0x24BDD1548];
      objc_msgSend(v4, "graceValueExpression");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "expressionWithFormat:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "acceptVisitor:flags:", self, 31);
    }
  }
  objc_msgSend(v4, "progressExpression");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v4, "progressExpression");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    if (v34)
    {
      v35 = (void *)MEMORY[0x24BDD1548];
      objc_msgSend(v4, "progressExpression");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "expressionWithFormat:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "acceptVisitor:flags:", self, 31);
    }
  }
  objc_msgSend(v4, "graceProgressExpression");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    objc_msgSend(v4, "graceProgressExpression");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "length");

    if (v41)
    {
      v42 = (void *)MEMORY[0x24BDD1548];
      objc_msgSend(v4, "graceProgressExpression");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "expressionWithFormat:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "acceptVisitor:flags:", self, 31);
    }
  }
  objc_msgSend(v4, "goalExpression");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    objc_msgSend(v4, "goalExpression");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "length");

    if (v48)
    {
      v49 = (void *)MEMORY[0x24BDD1548];
      objc_msgSend(v4, "goalExpression");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "expressionWithFormat:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "acceptVisitor:flags:", self, 31);
    }
  }
  objc_msgSend(v4, "graceGoalExpression");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    objc_msgSend(v4, "graceGoalExpression");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "length");

    if (v55)
    {
      v56 = (void *)MEMORY[0x24BDD1548];
      objc_msgSend(v4, "graceGoalExpression");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "expressionWithFormat:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "acceptVisitor:flags:", self, 31);
    }
  }
  objc_msgSend(v4, "visibilityPredicate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v4, "visibilityPredicate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "predicateWithFormat:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "acceptVisitor:flags:", self, 31);
  }
  objc_msgSend(v4, "graceVisibilityPredicate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    v64 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v4, "graceVisibilityPredicate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "predicateWithFormat:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "acceptVisitor:flags:", self, 31);
  }
  objc_msgSend(v4, "availabilityPredicate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    v68 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v4, "availabilityPredicate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "predicateWithFormat:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v70, "acceptVisitor:flags:", self, 31);
  }
  objc_msgSend(v4, "alertabilityPredicate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    v72 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v4, "alertabilityPredicate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "predicateWithFormat:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v74, "acceptVisitor:flags:", self, 31);
  }
  ACHLogDefault();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    -[ACHPredicateExpressionValidator validateTemplate:].cold.2();

  if (self->_operatorsValid && self->_predicateExpressionValid)
  {
    v76 = 1;
  }
  else
  {
    ACHLogDefault();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      -[ACHPredicateExpressionValidator validateTemplate:].cold.1(v4, v77);

    v76 = 0;
  }
  v78 = -[ACHPredicateExpressionValidationResult initWithValid:issues:]([ACHPredicateExpressionValidationResult alloc], "initWithValid:issues:", v76, self->_issues);

  return v78;
}

- (void)visitPredicateOperator:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v4 = a3;
  ACHLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACHPredicateExpressionValidator visitPredicateOperator:].cold.1();

  v6 = objc_msgSend(v4, "operatorType");
  if (v6 >= 6)
  {
    if (v6 - 99 >= 2)
      v7 = CFSTR("Unknown operator type: %lu");
    else
      v7 = CFSTR("Invalid operator type: %lu");
    if (v6 - 6 >= 6)
      v8 = v7;
    else
      v8 = CFSTR("Invalid operator type: %lu");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, objc_msgSend(v4, "operatorType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHPredicateExpressionValidator _addIssue:](self, "_addIssue:", v9);
    self->_operatorsValid = 0;

  }
}

- (void)visitPredicate:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ACHPredicateExpressionValidator visitPredicate:].cold.1();

}

- (void)visitPredicateExpression:(id)a3 keyPathScope:(id)a4 key:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  _BYTE buf[12];
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  ACHLogDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = CFSTR("nil");
    *(_DWORD *)buf = 138543874;
    if (v9)
      v15 = v9;
    *(_QWORD *)&buf[4] = v8;
    v18 = 2114;
    v19 = v15;
    v20 = 2114;
    v21 = v10;
    _os_log_debug_impl(&dword_214029000, v11, OS_LOG_TYPE_DEBUG, "visitPredicateExpression:%{public}@ keyPathScope:%{public}@ key:%{public}@", buf, 0x20u);
  }

  if (visitPredicateExpression_keyPathScope_key__onceToken != -1)
    dispatch_once(&visitPredicateExpression_keyPathScope_key__onceToken, &__block_literal_global_223);
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", &stru_24D1281D8) & 1) == 0)
  {
    objc_msgSend((id)visitPredicateExpression_keyPathScope_key__allowedKeysByScope, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13)
    {
      if ((objc_msgSend(v13, "containsObject:", v10) & 1) != 0)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid scoped key \"%@\" for scope \"%@\"), v10, v9, *(_QWORD *)buf);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid scope: %@"), v9, v16, *(_QWORD *)buf);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHPredicateExpressionValidator _addIssue:](self, "_addIssue:", v14);
    self->_predicateExpressionValid = 0;

    goto LABEL_12;
  }
  if ((objc_msgSend((id)visitPredicateExpression_keyPathScope_key__allowedScopelessKeys, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid scopeless key \"%@\"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHPredicateExpressionValidator _addIssue:](self, "_addIssue:", v12);
    self->_predicateExpressionValid = 0;
LABEL_12:

  }
}

- (void)visitPredicateExpression:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  ACHLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACHPredicateExpressionValidator visitPredicateExpression:].cold.2(v4, v5);

  if (objc_msgSend(v4, "expressionType") == 4)
  {
    if (visitPredicateExpression__onceToken != -1)
      dispatch_once(&visitPredicateExpression__onceToken, &__block_literal_global_3);
    objc_msgSend(v4, "function");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ACHLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACHPredicateExpressionValidator visitPredicateExpression:].cold.1();

    if ((objc_msgSend((id)visitPredicateExpression__allowedFunctionNames, "containsObject:", v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid function \"%@\"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHPredicateExpressionValidator _addIssue:](self, "_addIssue:", v8);
      self->_predicateExpressionValid = 0;

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issues, 0);
}

void __60__ACHPredicateExpressionValidator_visitPredicateExpression___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24D138FA0);
  v1 = (void *)visitPredicateExpression__allowedFunctionNames;
  visitPredicateExpression__allowedFunctionNames = v0;

}

void __77__ACHPredicateExpressionValidator_visitPredicateExpression_keyPathScope_key___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D138FB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)visitPredicateExpression_keyPathScope_key__allowedScopelessKeys;
  visitPredicateExpression_keyPathScope_key__allowedScopelessKeys = v0;

  v5 = CFSTR("workout");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D138FD0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)visitPredicateExpression_keyPathScope_key__allowedKeysByScope;
  visitPredicateExpression_keyPathScope_key__allowedKeysByScope = v3;

}

- (id)validateExpressionString:(id)a3
{
  id v4;
  NSMutableArray *issues;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  ACHPredicateExpressionValidationResult *v10;

  v4 = a3;
  *(_WORD *)&self->_operatorsValid = 257;
  issues = self->_issues;
  self->_issues = 0;

  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acceptVisitor:flags:", self, 31);
  ACHLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACHPredicateExpressionValidator validateExpressionString:].cold.2();

  if (self->_operatorsValid && self->_predicateExpressionValid)
  {
    v8 = 1;
  }
  else
  {
    ACHLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ACHPredicateExpressionValidator validateExpressionString:].cold.1();

    v8 = 0;
  }
  v10 = -[ACHPredicateExpressionValidationResult initWithValid:issues:]([ACHPredicateExpressionValidationResult alloc], "initWithValid:issues:", v8, self->_issues);

  return v10;
}

- (void)_addIssue:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *issues;
  NSObject *v7;

  v4 = a3;
  if (!self->_issues)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    issues = self->_issues;
    self->_issues = v5;

  }
  ACHLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ACHPredicateExpressionValidator _addIssue:].cold.1();

  -[NSMutableArray addObject:](self->_issues, "addObject:", v4);
}

- (void)validateTemplate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_214029000, a2, v4, "Template contains invalid predicate/expression: %{public}@", v5);

  OUTLINED_FUNCTION_5_0();
}

- (void)validateTemplate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_0(&dword_214029000, v0, v1, "validateTemplate result _operatorsValid: %{public}@, _predicateExpressionValid: %{public}@");
  OUTLINED_FUNCTION_5();
}

- (void)validateTemplate:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_214029000, a2, OS_LOG_TYPE_DEBUG, "[ACHPredicateExpressionValidator] validating %@", v4, 0xCu);

  OUTLINED_FUNCTION_5_0();
}

- (void)validateExpressionString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_214029000, v0, v1, "Invalid expression string: %{public}@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)validateExpressionString:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_0(&dword_214029000, v0, v1, "validateExpressionString result _operatorsValid: %{public}@, _predicateExpressionValid: %{public}@");
  OUTLINED_FUNCTION_5();
}

- (void)_addIssue:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_214029000, v0, OS_LOG_TYPE_ERROR, "Adding predicate validation issue: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)visitPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_214029000, v0, v1, "visitPredicate: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)visitPredicateExpression:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_214029000, v0, v1, "function name \"%{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)visitPredicateExpression:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  int v3;
  void *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = objc_msgSend(a1, "expressionType");
  _os_log_debug_impl(&dword_214029000, a2, OS_LOG_TYPE_DEBUG, "visitPredicateExpression \"%{public}@\", type \"%lu\" ", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5_0();
}

- (void)visitPredicateOperator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_214029000, v0, v1, "visitPredicateOperator: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
