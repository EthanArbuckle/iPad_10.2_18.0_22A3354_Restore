@implementation DNDNotificationFilterPredicateValidator

- (BOOL)validatePredicate:(id)a3 compileTimeIssues:(id *)a4 runTimeIssues:(id *)a5
{
  id v8;
  NSString *compileTimeIssues;
  BOOL v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v8 = a3;
  compileTimeIssues = self->_compileTimeIssues;
  self->_compileTimeIssues = 0;

  objc_msgSend(v8, "acceptVisitor:flags:", self, 3);
  if (a4)
    *a4 = objc_retainAutorelease(self->_compileTimeIssues);
  if (self->_compileTimeIssues)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    v11 = 0;
    if ((unint64_t)objc_msgSend(v12, "length") >= 0x186A1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("predicate will be ignored because it is too large"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (unint64_t)v14;
      if (a5)
      {
        v11 = objc_retainAutorelease(v14);
        *a5 = (id)v11;
      }
    }

    if ((unint64_t)self->_compileTimeIssues | v11)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "allowEvaluation");
      v11 = 0;
      v10 = 1;
    }
  }

  return v10;
}

- (void)visitPredicateOperator:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *compileTimeIssues;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "operatorType");
  if (v4 > 98)
  {
    if (v4 > 1099)
    {
      if ((unint64_t)(v4 - 1100) < 2 || v4 == 2000)
        goto LABEL_4;
    }
    else if ((unint64_t)(v4 - 99) < 2 || v4 == 1000)
    {
      goto LABEL_4;
    }
  }
  else if ((unint64_t)v4 <= 0xB)
  {
    if (((1 << v4) & 0x7BF) != 0)
      goto LABEL_4;
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "symbol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("operator '%@' is not allowed"), v7);
LABEL_16:
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    compileTimeIssues = self->_compileTimeIssues;
    self->_compileTimeIssues = v9;

    goto LABEL_4;
  }
  v5 = objc_msgSend(v11, "operatorType");
  if ((unint64_t)(v5 - 1100) >= 2 && v5 != 1000 && v5 != 2000)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "symbol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("operator '%@' is not recognized"), v7);
    goto LABEL_16;
  }
LABEL_4:

}

- (void)visitPredicateExpression:(id)a3
{
  unint64_t v4;
  NSString *v5;
  NSString *compileTimeIssues;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "expressionType");
  if (v4 > 0x14)
    goto LABEL_5;
  if (((1 << v4) & 0x10E0E3) == 0)
  {
    if (((1 << v4) & 0x8001C) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expression '%@' is not allowed"), v7);
LABEL_6:
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      compileTimeIssues = self->_compileTimeIssues;
      self->_compileTimeIssues = v5;

      goto LABEL_7;
    }
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expression '%@' is not recognized"), v7);
    goto LABEL_6;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compileTimeIssues, 0);
}

@end
