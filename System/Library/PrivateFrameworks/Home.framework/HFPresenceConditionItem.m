@implementation HFPresenceConditionItem

- (HFPresenceConditionItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCondition_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPresenceConditionItem.m"), 20, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPresenceConditionItem init]",
    v5);

  return 0;
}

- (HFPresenceConditionItem)initWithCondition:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HFPresenceConditionItem *v9;
  HFPresenceConditionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFPresenceConditionItem;
  v9 = -[HFPresenceConditionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_condition, a3);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HFPresenceConditionNaturalLanguageOptions *v12;
  void *v13;
  HFPresenceConditionNaturalLanguageOptions *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditionFomattingContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &unk_1EA7CC3E8;
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditionFomattingStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &unk_1EA7CC400;
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12 = [HFPresenceConditionNaturalLanguageOptions alloc];
  -[HFPresenceConditionItem home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HFPresenceConditionNaturalLanguageOptions initWithHome:formattingContext:formattingStyle:](v12, "initWithHome:formattingContext:formattingStyle:", v13, v8, v11);

  -[HFPresenceConditionItem condition](self, "condition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_naturalLanguageSummaryWithOptions:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "conditionTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("title"));

  v18 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "futureWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (HFPresenceCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
