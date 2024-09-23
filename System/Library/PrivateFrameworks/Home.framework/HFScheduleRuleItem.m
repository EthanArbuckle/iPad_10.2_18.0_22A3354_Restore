@implementation HFScheduleRuleItem

- (HFScheduleRuleItem)initWithScheduleRule:(id)a3
{
  id v5;
  HFScheduleRuleItem *v6;
  HFScheduleRuleItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFScheduleRuleItem;
  v6 = -[HFScheduleRuleItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rule, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HFImageIconDescriptor *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFScheduleRuleItem rule](self, "rule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFScheduleUtilities localizedStringForRule:](HFScheduleUtilities, "localizedStringForRule:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  v7 = -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", CFSTR("calendar.badge.clock"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("icon"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("elementWithMaxWidth"));
  v8 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFScheduleRuleItem rule](self, "rule");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HFScheduleRuleItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HFScheduleRuleItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HFScheduleRuleItem rule](v4, "rule");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFScheduleRuleItem rule](self, "rule");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFScheduleRuleItem rule](self, "rule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HFScheduleRule)rule
{
  return self->_rule;
}

- (void)setRule:(id)a3
{
  objc_storeStrong((id *)&self->_rule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rule, 0);
}

@end
