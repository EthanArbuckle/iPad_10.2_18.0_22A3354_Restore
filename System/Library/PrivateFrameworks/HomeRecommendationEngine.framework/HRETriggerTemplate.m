@implementation HRETriggerTemplate

- (id)triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  void *v5;
  void *v6;

  -[HRETriggerTemplate _subclass_triggerBuilderForRecommendation:withObjects:](self, "_subclass_triggerBuilderForRecommendation:withObjects:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRETemplate title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v6);

  return v5;
}

- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  objc_class *v5;
  void *v6;
  void *v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ doesn't implement %@"), v6, v7);

  return 0;
}

- (id)iconDescriptorForRecommendation:(id)a3 withObjects:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v5 = a3;
  -[HRETriggerTemplate iconDescriptorsByTriggerCharacteristic](self, "iconDescriptorsByTriggerCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v5, "triggerBuilders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke;
  v12[3] = &unk_24F217458;
  v12[4] = self;
  objc_msgSend(v8, "na_flatMap:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") != 1)
  {

LABEL_5:
    -[HRETriggerTemplate defaultIconDescriptor](self, "defaultIconDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v10;
}

id __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "characteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke_2;
    v10[3] = &unk_24F217430;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "na_map:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "iconDescriptorsByTriggerCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (Class)recommendationClass
{
  return (Class)objc_opt_class();
}

- (HFIconDescriptor)defaultIconDescriptor
{
  return self->_defaultIconDescriptor;
}

- (void)setDefaultIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultIconDescriptor, a3);
}

- (NSDictionary)iconDescriptorsByTriggerCharacteristic
{
  return self->_iconDescriptorsByTriggerCharacteristic;
}

- (void)setIconDescriptorsByTriggerCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptorsByTriggerCharacteristic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptorsByTriggerCharacteristic, 0);
  objc_storeStrong((id *)&self->_defaultIconDescriptor, 0);
}

@end
