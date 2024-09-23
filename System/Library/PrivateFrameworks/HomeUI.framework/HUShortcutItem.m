@implementation HUShortcutItem

- (HUShortcutItem)initWithTriggerBuilder:(id)a3 selectable:(BOOL)a4
{
  id v7;
  HUShortcutItem *v8;
  HUShortcutItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUShortcutItem;
  v8 = -[HUShortcutItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
    v9->_selectable = a4;
  }

  return v9;
}

- (HUShortcutItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTriggerBuilder_selectable_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUShortcutItem.m"), 31, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUShortcutItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUShortcutItem triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTriggerBuilder:", v5);

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
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
  void *v16;

  -[HUShortcutItem triggerBuilder](self, "triggerBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    NSLog(CFSTR("triggerBuilder must be set before asking HUTriggerBuilderItem to update"));
  -[HUShortcutItem triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUShortcutItem triggerBuilder](self, "triggerBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerActionSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionSetsSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "summaryText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summaryIconDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryShortcutsItemTitle"), CFSTR("HUTriggerSummaryShortcutsItemTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30BF8]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30C68]);
    if (!-[HUShortcutItem selectable](self, "selectable"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C98]);
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithResult:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
