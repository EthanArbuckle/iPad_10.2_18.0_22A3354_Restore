@implementation HFLocationEventBuilderItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFLocationEventBuilderItem;
  -[HFEventBuilderItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1EA7289C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  HFImageIconDescriptor *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "locationEventBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = CFSTR("HFImageIconIdentifierTriggerLocation");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "locationEventBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "locationEventBuilder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke_2;
      v20[3] = &unk_1EA7273E0;
      v21 = v12;
      v13 = v12;
      __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v20);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }
  v14 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v9);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("icon"));

  v15 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setResults:", v15);

  v16 = (void *)MEMORY[0x1E0D519C0];
  v17 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v16, "futureWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

__CFString *__58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  __CFString *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "locationEventType");
  if (v1 <= 2)
    v2 = *off_1EA73DD28[v1];
  return v2;
}

- (HFLocationEventBuilder)locationEventBuilder
{
  void *v2;
  void *v3;

  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFLocationEventBuilder *)v3;
}

- (void)setLocationEventBuilder:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HFEventBuilderItem setEventBuilders:](self, "setEventBuilders:", v4);

}

@end
