@implementation HFDateComponentsCondition

- (HFDateComponentsCondition)initWithDateComponents:(id)a3 comparisonType:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  HFDateComponentsCondition *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  unint64_t v16;

  v6 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __67__HFDateComponentsCondition_initWithDateComponents_comparisonType___block_invoke;
  v14 = &unk_1EA73E330;
  v15 = v6;
  v16 = a4;
  v7 = v6;
  __67__HFDateComponentsCondition_initWithDateComponents_comparisonType___block_invoke((uint64_t)&v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFDateComponentsCondition initWithPredicate:](self, "initWithPredicate:", v8, v11, v12, v13, v14);

  return v9;
}

id __67__HFDateComponentsCondition_initWithDateComponents_comparisonType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CBA4D0], "predicateForEvaluatingTriggerOccurringAfterDateWithComponents:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v1 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CBA4D0], "predicateForEvaluatingTriggerOccurringOnDateWithComponents:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v1)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA4D0], "predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (HFDateComponentsCondition)initWithPredicate:(id)a3
{
  id v4;
  HFDateComponentsCondition *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HFDateComponentsCondition *v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  NSDateComponents *dateComponents;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFDateComponentsCondition;
  v5 = -[HFCondition initWithPredicate:](&v17, sel_initWithPredicate_, v4);
  if (!v5)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "predicateOperatorType");
    if (v7 >= 5)
    {
LABEL_9:

      goto LABEL_10;
    }
    v5->_comparisonType = qword_1DD669CA0[v7];
    objc_msgSend(v6, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "expressionType") != 4)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v8, "function");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("now")) || objc_msgSend(v9, "expressionType"))
    {

      goto LABEL_8;
    }
    objc_msgSend(v9, "constantValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
    objc_msgSend(v9, "constantValue");
    v14 = objc_claimAutoreleasedReturnValue();
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v14;

LABEL_13:
    v11 = v5;
    goto LABEL_14;
  }
LABEL_10:
  v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)isTimeOfDayCondition
{
  void *v2;
  BOOL v3;

  -[HFDateComponentsCondition dateComponents](self, "dateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "hf_validComponents") & 0xFFFFFFFFFFFFFF9FLL) == 0;

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HFDateComponentsCondition dateComponents](self, "dateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "hf_compareNextMatchingDate:", v9);

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDateComponentsCondition dateComponents](self, "dateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("dateComponents"));

  v6 = -[HFDateComponentsCondition comparisonType](self, "comparisonType");
  if (v6 > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1EA73E350[v6];
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("comparisonType"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)timeConditionType
{
  objc_super v4;

  if (-[HFDateComponentsCondition isTimeOfDayCondition](self, "isTimeOfDayCondition"))
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)HFDateComponentsCondition;
  return -[HFTimeCondition timeConditionType](&v4, sel_timeConditionType);
}

- (unint64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end
