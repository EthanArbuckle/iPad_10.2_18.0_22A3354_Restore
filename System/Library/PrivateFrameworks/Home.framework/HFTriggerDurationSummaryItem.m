@implementation HFTriggerDurationSummaryItem

- (HFTriggerDurationSummaryItem)initWithTriggerBuilder:(id)a3
{
  id v5;
  HFTriggerDurationSummaryItem *v6;
  HFTriggerDurationSummaryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFTriggerDurationSummaryItem;
  v6 = -[HFTriggerDurationSummaryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_triggerBuilder, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = (void *)objc_opt_new();
  -[HFTriggerDurationSummaryItem triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportsEndEvents") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[HFTriggerDurationSummaryItem triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "areActionsAffectedByEndEvents");

  if ((v7 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    goto LABEL_11;
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFTriggerDurationSummaryTitle"), CFSTR("HFTriggerDurationSummaryTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HFTriggerDurationSummaryItem triggerBuilder](self, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v11, "hf_supportsSharedEventAutomation") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("isDisabled"));

  -[HFTriggerDurationSummaryItem triggerBuilder](self, "triggerBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "designatedDurationEventBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CBA4D0];
  if (v14)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "duration");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v15, "hf_naturalLanguageTurnOffAfterDuration:style:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("description"));

  if (v14)
LABEL_11:
  v19 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "futureWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
