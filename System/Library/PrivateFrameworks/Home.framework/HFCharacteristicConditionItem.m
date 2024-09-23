@implementation HFCharacteristicConditionItem

- (HFCharacteristicConditionItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCondition_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicConditionItem.m"), 22, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCharacteristicConditionItem init]",
    v5);

  return 0;
}

- (HFCharacteristicConditionItem)initWithCondition:(id)a3
{
  id v6;
  HFCharacteristicConditionItem *v7;
  HFCharacteristicConditionItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicConditionItem.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("condition != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFCharacteristicConditionItem;
  v7 = -[HFCharacteristicConditionItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_condition, a3);

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HFCharacteristicConditionNaturalLanguageOptions *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("conditionFomattingContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = &unk_1EA7CD300;
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = -[HFCharacteristicConditionNaturalLanguageOptions initWithFormattingContext:]([HFCharacteristicConditionNaturalLanguageOptions alloc], "initWithFormattingContext:", v9);
  -[HFCharacteristicConditionItem condition](self, "condition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_naturalLanguageSummaryWithOptions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "conditionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("title"));

  v14 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (HFCharacteristicCondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
