@implementation HFCharacteristicCondition

- (HFCharacteristicCondition)initWithPredicate:(id)a3
{
  id v4;
  HFCharacteristicCondition *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMCharacteristic *characteristic;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id value;
  HFCharacteristicCondition *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HFCharacteristicCondition;
  v5 = -[HFCondition initWithPredicate:](&v21, sel_initWithPredicate_, v4);
  if (!v5)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v6 = v4;
  objc_msgSend(v6, "subpredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != 2
    || (objc_msgSend((id)objc_opt_class(), "_characteristicPredicateInCompoundPredicate:", v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "_characteristicPredicateInCompoundPredicate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constantValue");
  v12 = objc_claimAutoreleasedReturnValue();
  characteristic = v5->_characteristic;
  v5->_characteristic = (HMCharacteristic *)v12;

  objc_msgSend((id)objc_opt_class(), "_valuePredicateInCompoundPredicate:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {

    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "_valuePredicateInCompoundPredicate:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_operatorType = objc_msgSend(v15, "predicateOperatorType");
  objc_msgSend(v15, "rightExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constantValue");
  v17 = objc_claimAutoreleasedReturnValue();
  value = v5->_value;
  v5->_value = (id)v17;

LABEL_7:
  v19 = v5;
LABEL_11:

  return v19;
}

- (HFCharacteristicCondition)initWithCharacteristic:(id)a3 operatorType:(unint64_t)a4 value:(id)a5
{
  void *v6;
  HFCharacteristicCondition *v7;

  objc_msgSend(MEMORY[0x1E0CBA4D0], "predicateForEvaluatingTriggerWithCharacteristic:relatedBy:toValue:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFCharacteristicCondition initWithPredicate:](self, "initWithPredicate:", v6);

  return v7;
}

+ (id)_characteristicPredicateInCompoundPredicate:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "subpredicates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_188);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __73__HFCharacteristicCondition__characteristicPredicateInCompoundPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v10;
  void *v11;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_9;
  }
  v3 = v2;
  objc_msgSend(v3, "leftExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "expressionType") != 3)
    goto LABEL_5;
  objc_msgSend(v3, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB86F0]);

  if (v7)
  {
    objc_msgSend(v3, "rightExpression");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "expressionType"))
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(v3, "rightExpression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constantValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = 1;
      goto LABEL_7;
    }
  }
LABEL_6:
  v8 = 0;
LABEL_7:

LABEL_9:
  return v8;
}

+ (id)_valuePredicateInCompoundPredicate:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "subpredicates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_4_6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __64__HFCharacteristicCondition__valuePredicateInCompoundPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    objc_msgSend(v3, "leftExpression");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "expressionType") == 3)
    {
      objc_msgSend(v3, "leftExpression");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8B58]);

      if (!v7)
      {
        v8 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v3, "rightExpression");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "expressionType") == 0;
    }
    else
    {
      v8 = 0;
    }

LABEL_9:
    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  HFConditionUISummary *v8;

  v4 = a3;
  -[HFCharacteristicCondition _nameFormattingContext:](self, "_nameFormattingContext:", objc_msgSend(v4, "formattingContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "formattingContext");

  if (v6 != 5)
  {
    objc_msgSend(v5, "hf_stringByCapitalizingFirstWord");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v8 = -[HFConditionUISummary initWithCondition:title:description:]([HFConditionUISummary alloc], "initWithCondition:title:description:", self, v5, 0);

  return v8;
}

- (id)_nameFormattingContext:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[HFCharacteristicCondition characteristic](self, "characteristic", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[HFCharacteristicCondition value](self, "value"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    -[HFCharacteristicCondition value](self, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[HFCharacteristicCondition characteristic](self, "characteristic");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
LABEL_17:
        objc_msgSend(CFSTR("HFConditionNameUnknown"), "stringByAppendingString:", &stru_1EA741FF8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _HFLocalizedStringWithDefaultValue(v10, v10, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      HFLogForCategory(0x2EuLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v31;
        v41 = 2112;
        v42 = v32;
        _os_log_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ missing characteristic. Using unknown condition string", buf, 0x16u);

      }
    }
    else
    {
      HFLogForCategory(0x2EuLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCharacteristicCondition characteristic](self, "characteristic");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "uniqueIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v34;
        v41 = 2112;
        v42 = v35;
        v43 = 2112;
        v44 = v37;
        _os_log_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ missing value for characteristic %@. Using unknown condition string", buf, 0x20u);

      }
    }

    goto LABEL_17;
  }
  -[HFCharacteristicCondition characteristic](self, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3658];
  -[HFCharacteristicCondition characteristic](self, "characteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_valueFormatterForCharacteristic:options:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCharacteristicCondition value](self, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringForObjectValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HFCharacteristicCondition operatorType](self, "operatorType");
  v17 = 0;
  if (v16 <= 5)
    v17 = off_1EA73E2B0[v16];
  -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", &stru_1EA741FF8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18;
  v26 = 0;
  if (v10 && v15 && v18)
  {
    HFLocalizedStringWithFormat(v18, CFSTR("%@%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:
  return v26;
}

@end
