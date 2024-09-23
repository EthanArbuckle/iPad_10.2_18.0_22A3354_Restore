@implementation NSComparisonPredicate(SQLitePredicate)

- (id)hd_sqlPredicateForSelect
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  char isKindOfClass;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  id v22;
  void *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  void *v39;
  double v40;

  objc_msgSend(a1, "leftExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "predicateOperatorType");
  if (v4 >= 6 && v4 != 10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported operator type in comparison expression: %@"), a1);
  if (objc_msgSend(v2, "expressionType") == 3)
    objc_msgSend(v2, "keyPath");
  else
    objc_msgSend(v2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "expressionType"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Expected constant value in right side of comparison expression: %@"), a1);
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "constantValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = v5;
  if (!a1)
  {
    v28 = 0;
    v11 = v7;
    goto LABEL_60;
  }
  if (qword_1ED5523A8 != -1)
    dispatch_once(&qword_1ED5523A8, &__block_literal_global_139);
  objc_msgSend((id)_MergedGlobals_213, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v7;
  if (!v9)
    goto LABEL_53;
  v39 = v3;
  v38 = v7;
  v12 = 0;
  if (!objc_msgSend(v9, "count"))
  {
    v11 = v7;
LABEL_43:
    v26 = objc_msgSend(v10, "count");
    v27 = *MEMORY[0x1E0C99778];
    if (v26 == 1 && v12)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v27, CFSTR("Expected constant value of type %@, received %@"), v12, v11);
    else
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v27, CFSTR("Constant value %@ not matching any expected type"), v11, v36);
    v3 = v39;
    v7 = v38;

    v28 = 0;
    goto LABEL_59;
  }
  v13 = 0;
  v37 = CFSTR("blob");
  v11 = v7;
  while (2)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    switch(v15)
    {
      case 0:
        goto LABEL_51;
      case 1:
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          _HDSQLiteValueForDate();
          v20 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v20;
        }
        goto LABEL_25;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = CFSTR("double");
LABEL_50:
          v37 = v29;
          goto LABEL_51;
        }
        objc_opt_class();
        v16 = CFSTR("double");
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_32;
        v40 = 0.0;
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "scanDouble:", &v40) || (objc_msgSend(v17, "isAtEnd") & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
        v34 = objc_claimAutoreleasedReturnValue();

        v35 = CFSTR("double");
LABEL_62:
        v37 = v35;
        v11 = (void *)v34;
LABEL_51:

        v21 = (__CFString *)v37;
LABEL_52:

        v3 = v39;
        v7 = v38;
LABEL_53:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _HDSQLiteValueForDate();
          v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            _HDSQLiteValueForUUID();
            v31 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v31;
          }
          v30 = v11;
          v11 = v30;
        }
        v28 = v30;
LABEL_59:

LABEL_60:
        objc_msgSend(a1, "predicateOperatorType");
        objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", v8, v28, HDSQLiteComparisonTypeForPredicateOperator());
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        return v32;
      case 3:
      case 6:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          v16 = CFSTR("integer");
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v40 = 0.0;
            objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "scanInteger:", &v40) && (objc_msgSend(v17, "isAtEnd") & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)&v40);
              v34 = objc_claimAutoreleasedReturnValue();

              v35 = CFSTR("integer");
              goto LABEL_62;
            }
            goto LABEL_31;
          }
LABEL_32:

          v12 = (__CFString *)v16;
          goto LABEL_38;
        }
        v29 = CFSTR("integer");
        goto LABEL_50;
      case 4:
      case 7:
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
LABEL_25:
        objc_msgSend((id)objc_opt_class(), "description");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v12 = v21;
        if ((isKindOfClass & 1) != 0)
          goto LABEL_52;
        goto LABEL_38;
      case 5:
      case 8:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _HDSQLiteValueForUUID();
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_35:

          v25 = 1;
          v11 = (void *)v19;
          goto LABEL_37;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_1E6D11BB8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "initWithUUIDString:", v23);

          _HDSQLiteValueForUUID();
          v19 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v24;
          goto LABEL_35;
        }
        v25 = 0;
LABEL_37:
        objc_msgSend((id)objc_opt_class(), "description");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v12 = v21;
        if ((v25 & 1) != 0)
          goto LABEL_52;
LABEL_38:
        if (++v13 >= (unint64_t)objc_msgSend(v10, "count"))
          goto LABEL_43;
        continue;
      default:
        goto LABEL_38;
    }
  }
}

@end
