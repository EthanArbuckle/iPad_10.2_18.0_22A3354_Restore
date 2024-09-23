@implementation HFTimeConditionItem

- (HFTimeConditionItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithConditionType_condition_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTimeConditionItem.m"), 21, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTimeConditionItem init]",
    v5);

  return 0;
}

- (HFTimeConditionItem)initWithCondition:(id)a3
{
  id v4;
  HFTimeConditionItem *v5;

  v4 = a3;
  v5 = -[HFTimeConditionItem initWithConditionType:condition:](self, "initWithConditionType:condition:", objc_msgSend(v4, "timeConditionType"), v4);

  return v5;
}

- (HFTimeConditionItem)initWithConditionType:(unint64_t)a3
{
  return -[HFTimeConditionItem initWithConditionType:condition:](self, "initWithConditionType:condition:", a3, 0);
}

- (HFTimeConditionItem)initWithConditionType:(unint64_t)a3 condition:(id)a4
{
  id v6;
  HFTimeConditionItem *v7;
  HFTimeConditionItem *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HFTimeConditionItem;
  v7 = -[HFTimeConditionItem init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    -[HFTimeConditionItem setCondition:](v7, "setCondition:", v6);
  }

  return v8;
}

- (void)setCondition:(id)a3
{
  HFTimeCondition *v5;
  uint64_t v6;
  unint64_t v7;
  HFTimeCondition *v8;

  v5 = (HFTimeCondition *)a3;
  if (self->_condition != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_condition, a3);
    v5 = v8;
    if (v8)
    {
      v6 = -[HFTimeCondition timeConditionType](v8, "timeConditionType");
      v7 = -[HFTimeConditionItem type](self, "type");
      v5 = v8;
      if (v6 != v7)
      {
        NSLog(CFSTR("Condition %@ has expected type %d, but received type %d!"), v8, v6, -[HFTimeConditionItem type](self, "type"));
        v5 = v8;
      }
    }
  }

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
  void *v12;
  void *v13;
  uint64_t v14;
  HFTimeConditionNaturalLanguageOptions *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditionDisplayContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &unk_1EA7CD0C0;
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditionFomattingStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &unk_1EA7CD0D8;
  v11 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditionFomattingContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = &unk_1EA7CD0F0;
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  v15 = -[HFTimeConditionNaturalLanguageOptions initWithFormattingContext:formattingStyle:type:]([HFTimeConditionNaturalLanguageOptions alloc], "initWithFormattingContext:formattingStyle:type:", v14, v11, -[HFTimeConditionItem type](self, "type"));
  -[HFTimeConditionNaturalLanguageOptions setTimeContext:](v15, "setTimeContext:", v8 == 1);
  -[HFTimeConditionItem condition](self, "condition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hf_naturalLanguageSummaryWithOptions:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    +[HFTimeCondition hf_naturalLanguageSummaryForTypeOnlyWithOptions:](HFTimeCondition, "hf_naturalLanguageSummaryForTypeOnlyWithOptions:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "conditionTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("title"));

  objc_msgSend(v17, "conditionDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("description"));

  v20 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (HFTimeCondition)condition
{
  return self->_condition;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
