@implementation HFCameraSmartDetectionCondition

- (HFCameraSmartDetectionCondition)initWithPredicate:(id)a3
{
  id v4;
  HFCameraSmartDetectionCondition *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  HFCameraSmartDetectionCondition *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HFCameraSmartDetectionCondition;
  v5 = -[HFCondition initWithPredicate:](&v31, sel_initWithPredicate_, v4);
  if (v5)
  {
    objc_opt_class();
    v6 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_msgSend(v8, "subpredicates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 != 2)
        goto LABEL_26;
      objc_msgSend(v8, "subpredicates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[HFCameraSmartDetectionCondition _predicateIsValidForSignificantEventKeyPath:](HFCameraSmartDetectionCondition, "_predicateIsValidForSignificantEventKeyPath:", v12);
      if (v13)
      {
        objc_msgSend(v8, "subpredicates");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[HFCameraSmartDetectionCondition _predicateIsValidForPersonFamiliarityKeyPath:](HFCameraSmartDetectionCondition, "_predicateIsValidForPersonFamiliarityKeyPath:", v15))
        {

LABEL_18:
          v16 = v5;
LABEL_27:

          goto LABEL_28;
        }
        v29 = v15;
        v26 = v14;
      }
      v30 = v12;
      objc_msgSend(v8, "subpredicates", v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[HFCameraSmartDetectionCondition _predicateIsValidForSignificantEventKeyPath:](HFCameraSmartDetectionCondition, "_predicateIsValidForSignificantEventKeyPath:", v18))
      {
        objc_msgSend(v8, "subpredicates");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v28 = v11;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = +[HFCameraSmartDetectionCondition _predicateIsValidForPersonFamiliarityKeyPath:](HFCameraSmartDetectionCondition, "_predicateIsValidForPersonFamiliarityKeyPath:", v20);

        v11 = v28;
      }
      else
      {
        v21 = 0;
      }

      if (v13)
      {

      }
      if (v21)
        goto LABEL_18;
    }
    objc_opt_class();
    v22 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    if (v24
      && +[HFCameraSmartDetectionCondition _predicateIsValidForSignificantEventKeyPath:](HFCameraSmartDetectionCondition, "_predicateIsValidForSignificantEventKeyPath:", v24))
    {
      v16 = v5;

      goto LABEL_27;
    }

LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  v16 = 0;
LABEL_28:

  return v16;
}

+ (BOOL)_predicateIsValidForSignificantEventKeyPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "expressionType") == 4)
  {
    objc_msgSend(v6, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arguments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB85F0]);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_predicateIsValidForPersonFamiliarityKeyPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "expressionType") == 4)
  {
    objc_msgSend(v6, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arguments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB85F8]);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  return -[HFConditionUISummary initWithCondition:title:description:]([HFConditionUISummary alloc], "initWithCondition:title:description:", self, 0, 0);
}

@end
