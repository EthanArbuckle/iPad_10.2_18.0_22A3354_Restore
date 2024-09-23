@implementation HFTimeEventBuilderItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFTimeEventBuilderItem;
  -[HFEventBuilderItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HFTimeEventBuilderItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1EA7289C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __54__HFTimeEventBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  char v17;
  __CFString *v18;
  HFImageIconDescriptor *v19;
  HFImageIconDescriptor *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "timeEventBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "naturalLanguageOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containingTriggerBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recurrences");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v7, "naturalLanguageNameWithOptions:recurrences:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("title"));

  objc_msgSend(*(id *)(a1 + 32), "timeEventBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "timeEventBuilder"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v17 = objc_opt_isKindOfClass(),
        v16,
        (v17 & 1) != 0))
  {
    v18 = CFSTR("HFImageIconIdentifierTriggerTime");
    if (v18)
    {
      v19 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v18);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("icon"));

    }
  }
  else
  {
    v18 = 0;
  }
  v20 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v18);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("icon"));

  v21 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setResults:", v21);

  v22 = (void *)MEMORY[0x1E0D519C0];
  v23 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v22, "futureWithResult:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (HFTimeEventBuilder)timeEventBuilder
{
  void *v2;
  void *v3;

  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFTimeEventBuilder *)v3;
}

- (void)setTimeEventBuilder:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HFEventBuilderItem setEventBuilders:](self, "setEventBuilders:", v4);

}

- (HFEventTriggerBuilder)containingTriggerBuilder
{
  return self->_containingTriggerBuilder;
}

- (void)setContainingTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_containingTriggerBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingTriggerBuilder, 0);
}

@end
