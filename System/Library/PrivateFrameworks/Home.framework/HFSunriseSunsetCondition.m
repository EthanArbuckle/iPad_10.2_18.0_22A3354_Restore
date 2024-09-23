@implementation HFSunriseSunsetCondition

- (HFSunriseSunsetCondition)initWithPredicate:(id)a3
{
  id v4;
  HFSunriseSunsetCondition *v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSString *significantEvent;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  uint64_t v26;
  NSDateComponents *offset;
  HFSunriseSunsetCondition *v28;
  objc_super v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HFSunriseSunsetCondition;
  v5 = -[HFCondition initWithPredicate:](&v30, sel_initWithPredicate_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = objc_msgSend(v6, "predicateOperatorType");
      if (v7 < 4)
      {
        v5->_comparisonType = qword_1DD669C80[v7];
        objc_msgSend(v6, "leftExpression");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "expressionType") == 3)
        {
          v9 = *MEMORY[0x1E0CB9B90];
          v31[0] = *MEMORY[0x1E0CB9B88];
          v31[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "keyPath");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "containsObject:", v11);

          if (v12)
          {
            objc_msgSend(v8, "keyPath");
            v13 = objc_claimAutoreleasedReturnValue();
            significantEvent = v5->_significantEvent;
            v5->_significantEvent = (NSString *)v13;

            objc_msgSend(v6, "rightExpression");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "expressionType") == 4)
            {
              objc_msgSend(v15, "function");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("add:to:"));

              if (v17)
              {
                objc_msgSend(v15, "arguments");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "firstObject");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v19, "expressionType") == 4)
                {
                  objc_msgSend(v19, "function");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("now"));

                  if (v21)
                  {
                    objc_msgSend(v18, "lastObject");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v22, "expressionType"))
                    {
                      objc_msgSend(v22, "constantValue");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      isKindOfClass = objc_opt_isKindOfClass();

                      if ((isKindOfClass & 1) != 0)
                      {
                        objc_msgSend(v22, "constantValue");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "hf_negativeValue");
                        v26 = objc_claimAutoreleasedReturnValue();
                        offset = v5->_offset;
                        v5->_offset = (NSDateComponents *)v26;

                      }
                    }

                  }
                }

              }
            }

            goto LABEL_16;
          }
        }

      }
    }
    v28 = 0;
    goto LABEL_20;
  }
LABEL_16:
  v28 = v5;
LABEL_20:

  return v28;
}

- (HFSunriseSunsetCondition)initWithSignificantEvent:(id)a3 comparisonType:(unint64_t)a4
{
  return -[HFSunriseSunsetCondition initWithSignificantEvent:offset:comparisonType:](self, "initWithSignificantEvent:offset:comparisonType:", a3, 0, a4);
}

- (HFSunriseSunsetCondition)initWithSignificantEvent:(id)a3 offset:(id)a4 comparisonType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HFSunriseSunsetCondition *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__HFSunriseSunsetCondition_initWithSignificantEvent_offset_comparisonType___block_invoke;
  v15[3] = &unk_1EA73E308;
  v16 = v8;
  v17 = v9;
  v18 = a5;
  v10 = v9;
  v11 = v8;
  __75__HFSunriseSunsetCondition_initWithSignificantEvent_offset_comparisonType___block_invoke(v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HFSunriseSunsetCondition initWithPredicate:](self, "initWithPredicate:", v12);

  return v13;
}

id __75__HFSunriseSunsetCondition_initWithSignificantEvent_offset_comparisonType___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA850]), "initWithSignificantEvent:offset:", a1[4], a1[5]);
  v3 = a1[6];
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CBA4D0], "predicateForEvaluatingTriggerOccurringAfterSignificantEvent:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CBA4D0], "predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  int64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    goto LABEL_11;
  -[HFSunriseSunsetCondition significantEvent](self, "significantEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB9B90];
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9B90]) & 1) != 0)
  {
    objc_msgSend(v7, "significantEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB9B88];
    v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB9B88]);

    if ((v12 & 1) != 0)
    {
      v13 = 1;
      goto LABEL_18;
    }
  }
  else
  {

    v11 = *MEMORY[0x1E0CB9B88];
  }
  -[HFSunriseSunsetCondition significantEvent](self, "significantEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", v11) & 1) != 0)
  {
    objc_msgSend(v7, "significantEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v9);

    if ((v16 & 1) != 0)
    {
LABEL_11:
      v13 = -1;
      goto LABEL_18;
    }
  }
  else
  {

  }
  -[HFSunriseSunsetCondition offset](self, "offset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  v19 = 0.0;
  if (v17)
  {
    -[HFSunriseSunsetCondition offset](self, "offset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_timeInterval");
    v19 = v21;

  }
  objc_msgSend(v7, "offset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v7, "offset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hf_timeInterval");
    v18 = v24;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v25, "compare:", v26);

LABEL_18:
  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSunriseSunsetCondition significantEvent](self, "significantEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("significantEvent"));

  -[HFSunriseSunsetCondition offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("offset"));

  v8 = -[HFSunriseSunsetCondition comparisonType](self, "comparisonType");
  if (v8 > 2)
    v9 = CFSTR("(unknown)");
  else
    v9 = off_1EA73E350[v8];
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("comparisonType"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unint64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (NSDateComponents)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end
