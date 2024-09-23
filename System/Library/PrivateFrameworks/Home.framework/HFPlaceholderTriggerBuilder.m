@implementation HFPlaceholderTriggerBuilder

+ (id)createPlaceholderTriggerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  HFPlaceholderTriggerBuilder *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HFTriggerBuilder initWithHome:context:]([HFPlaceholderTriggerBuilder alloc], "initWithHome:context:", v9, v7);

  -[HFTriggerBuilder setName:](v10, "setName:", CFSTR("Placeholder Trigger"));
  -[HFTriggerBuilder triggerActionSets](v10, "triggerActionSets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromTriggerActionSetsBuilder:", v8);

  -[HFTriggerBuilder triggerActionSets](v10, "triggerActionSets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPlaceholderTriggerBuilder setIsEditing:](v10, "setIsEditing:", objc_msgSend(v12, "hasActions"));

  return v10;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFPlaceholderTriggerName"), CFSTR("HFPlaceholderTriggerName"), 1);
}

- (id)commitItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allActionBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_map:", &__block_literal_global_197);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__HFPlaceholderTriggerBuilder_commitItem__block_invoke_2;
  v9[3] = &unk_1EA72A050;
  v9[4] = self;
  objc_msgSend(v6, "recover:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __41__HFPlaceholderTriggerBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performValidation");
}

id __41__HFPlaceholderTriggerBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  int v4;
  __CFString **v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "isEditing");
  v5 = HFOperationEditTrigger;
  if (!v4)
    v5 = HFOperationAddTrigger;
  v6 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", *v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "futureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

@end
