@implementation HFAudioAnalysisDetectionCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  return -[HFConditionUISummary initWithCondition:title:description:]([HFConditionUISummary alloc], "initWithCondition:title:description:", self, 0, 0);
}

- (HFAudioAnalysisDetectionCondition)initWithPredicate:(id)a3
{
  id v4;
  HFAudioAnalysisDetectionCondition *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HFAudioAnalysisDetectionCondition *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HFAudioAnalysisDetectionCondition;
  v5 = -[HFCondition initWithPredicate:](&v25, sel_initWithPredicate_, v4);
  if (!v5)
    goto LABEL_9;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
  {
    objc_opt_class();
    v16 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "subpredicates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 != 1)
    {

      goto LABEL_22;
    }
    objc_opt_class();
    objc_msgSend(v18, "subpredicates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v6;
    else
      v22 = 0;
    v23 = v22;

    if (!v23)
      goto LABEL_22;
  }
  objc_msgSend(v6, "leftExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "expressionType") != 4)
  {

    goto LABEL_20;
  }
  objc_msgSend(v6, "leftExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arguments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8350]);

  if (!v14)
  {
LABEL_20:

LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }

LABEL_9:
  v15 = v5;
LABEL_23:

  return v15;
}

@end
