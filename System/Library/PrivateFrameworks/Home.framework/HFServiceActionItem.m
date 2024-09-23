@implementation HFServiceActionItem

- (HFServiceActionItem)initWithHome:(id)a3 containingItem:(id)a4
{
  id v7;
  id v8;
  HFServiceActionItem *v9;
  HFServiceActionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceActionItem;
  v9 = -[HFServiceActionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_containingItem, a4);
  }

  return v10;
}

- (HFServiceActionItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItem.m"), 50, CFSTR("Use -initWithHome:containingItem:"));

  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItem actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItem actionBuilders](self, "actionBuilders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_prettyDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItem containingItem](self, "containingItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, actions: %@ builders: %@ containined in: \"%@\" %@>"), v5, self, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = a3;
  -[HFServiceActionItem containingItem](self, "containingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Must have a containing item"));
  -[HFServiceActionItem containingItem](self, "containingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[HFServiceActionItem actionBuilders](self, "actionBuilders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeSetObject:forKey:", v8, HFItemUpdateOptionActionBuilders);

    -[HFServiceActionItem containingItem](self, "containingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithOptions:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__HFServiceActionItem__subclass_updateWithOptions___block_invoke;
    v14[3] = &unk_1EA7289C8;
    v14[4] = self;
    objc_msgSend(v10, "flatMap:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __51__HFServiceActionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id v15;

  objc_msgSend(a2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("dependentHomeKitObjects"));

  v6 = *(void **)(a1 + 32);
  v14 = 0;
  v15 = 0;
  objc_msgSend(v6, "_getDesiredItemDescription:controlDescription:withSourceItemResults:", &v15, &v14, v4);
  v7 = v15;
  v8 = v14;
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("description"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("controlDescription"));

  if (_MergedGlobals_4_0 != -1)
    dispatch_once(&_MergedGlobals_4_0, &__block_literal_global_15_5);
  v9 = (id)qword_1F03ED2E8;
  objc_msgSend(v4, "removeObjectsForKeys:", v9);
  v10 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __51__HFServiceActionItem__subclass_updateWithOptions___block_invoke_3()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("errorDescription");
  v2[1] = CFSTR("longErrorDescription");
  v2[2] = CFSTR("badge");
  v2[3] = CFSTR("underlyingError");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1F03ED2E8;
  qword_1F03ED2E8 = v0;

}

- (void)addAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItem.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  -[HFServiceActionItem actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "addObject:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");
  -[HFServiceActionItem setActions:](self, "setActions:", v7);

}

- (void)addActionBuilder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItem.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionBuilder"));

  }
  -[HFServiceActionItem actionBuilders](self, "actionBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "addObject:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");
  -[HFServiceActionItem setActionBuilders:](self, "setActionBuilders:", v7);

}

- (id)serviceActionItemForChildServiceItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HFServiceActionItem *v9;
  void *v10;
  HFServiceActionItem *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItem services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Request to create a HFServiceActionItem from a service (%@) that's not one of our services (%@)"), v8, self);

  }
  v9 = [HFServiceActionItem alloc];
  -[HFServiceActionItem home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFServiceActionItem initWithHome:containingItem:](v9, "initWithHome:containingItem:", v10, v4);

  -[HFServiceActionItem actionBuilders](self, "actionBuilders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke;
  v22[3] = &unk_1EA729200;
  v14 = v5;
  v23 = v14;
  objc_msgSend(v12, "na_filter:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItem setActionBuilders:](v11, "setActionBuilders:", v15);

  -[HFServiceActionItem actions](self, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke_2;
  v20[3] = &unk_1EA72BC40;
  v21 = v14;
  v17 = v14;
  objc_msgSend(v16, "na_filter:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItem setActions:](v11, "setActions:", v18);

  return v11;
}

uint64_t __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HFHomeKitObject)homeKitObject
{
  void *v2;
  void *v3;

  -[HFServiceActionItem containingItem](self, "containingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v3;
}

- (NSSet)services
{
  void *v2;
  void *v3;

  -[HFServiceActionItem containingItem](self, "containingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFServiceActionItem containingItem](self, "containingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v2;
  void *v3;

  -[HFServiceActionItem containingItem](self, "containingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFCharacteristicValueSource *)v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFServiceActionItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItem containingItem](self, "containingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithValueSource:", v4);

  v9 = (void *)objc_msgSend(v5, "initWithHome:containingItem:", v6, v8);
  objc_msgSend(v9, "copyLatestResultsFromItem:", self);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFServiceActionItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFServiceActionItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;
  void *v4;

  -[HFServiceActionItem containingItem](self, "containingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromHomeKitObject:](HFNamingComponents, "namingComponentFromHomeKitObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_percentFormatter
{
  if (qword_1F03ED2F8 != -1)
    dispatch_once(&qword_1F03ED2F8, &__block_literal_global_34_2);
  return (id)qword_1F03ED2F0;
}

void __40__HFServiceActionItem__percentFormatter__block_invoke()
{
  HFPercentFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HFPercentFormatter);
  v1 = (void *)qword_1F03ED2F0;
  qword_1F03ED2F0 = (uint64_t)v0;

}

- (void)_getDesiredItemDescription:(id *)a3 controlDescription:(id *)a4 withSourceItemResults:(id)a5
{
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
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  id v39;
  id *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id *v51;
  id *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;

  v54 = a5;
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("controlDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("errorDescription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v51 = a4;
  v52 = a3;
  if (v10 && objc_msgSend(v10, "isEqualToString:", v8))
  {

    v9 = 0;
    v8 = 0;
  }
  -[HFServiceActionItem _characteristicTypeToTargetValuesMap](self, "_characteristicTypeToTargetValuesMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("childItems"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_firstObjectPassingTest:", &__block_literal_global_37_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "incrementalCharacteristicType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("childItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_firstObjectPassingTest:", &__block_literal_global_39_0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_3;
  v57[3] = &unk_1EA726EA8;
  v19 = v12;
  v58 = v19;
  LODWORD(v12) = objc_msgSend(v17, "na_any:", v57);

  if ((_DWORD)v12)
  {
    v50 = v14;
    v20 = v15;
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v18;
    v55[1] = 3221225472;
    v55[2] = __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_4;
    v55[3] = &unk_1EA726AB8;
    v22 = v19;
    v56 = v22;
    objc_msgSend(v21, "na_flatMap:", v55);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "count") != 1)
    {
      v26 = a4;
LABEL_35:

      v29 = v56;
      v40 = v52;
      v15 = v20;
      v14 = v50;
LABEL_36:

      if (!v40)
        goto LABEL_38;
      goto LABEL_37;
    }
    objc_msgSend(v23, "anyObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    v26 = v51;
    if (v25)
    {
      if (v20)
        objc_msgSend(v22, "objectForKeyedSubscript:", v20);
      else
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "count") || v53)
        goto LABEL_34;
      _HFLocalizedStringWithDefaultValue(CFSTR("HFSceneDescriptionValueOn"), CFSTR("HFSceneDescriptionValueOn"), 1);
      v41 = objc_claimAutoreleasedReturnValue();

      _HFLocalizedStringWithDefaultValue(CFSTR("HFSceneDescriptionValueOn"), CFSTR("HFSceneDescriptionValueOn"), 1);
      v49 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v49;
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFSceneDescriptionValueOff"), CFSTR("HFSceneDescriptionValueOff"), 1);
      v41 = objc_claimAutoreleasedReturnValue();

      _HFLocalizedStringWithDefaultValue(CFSTR("HFSceneDescriptionValueOff"), CFSTR("HFSceneDescriptionValueOff"), 1);
      v42 = v9;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v41;
LABEL_34:

    goto LABEL_35;
  }
  v27 = *MEMORY[0x1E0CB8AF0];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AF0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count") == 1)
    {
      objc_msgSend(v29, "anyObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "integerValue");

      if (!v31)
      {
        _HFLocalizedStringWithDefaultValue(CFSTR("HFSceneDescriptionValueClosed"), CFSTR("HFSceneDescriptionValueClosed"), 1);
        v32 = objc_claimAutoreleasedReturnValue();

        _HFLocalizedStringWithDefaultValue(CFSTR("HFSceneDescriptionValueClosed"), CFSTR("HFSceneDescriptionValueClosed"), 1);
        v33 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v33;
        v8 = (void *)v32;
      }
    }
LABEL_20:
    v26 = v51;
LABEL_21:
    v40 = v52;
    goto LABEL_36;
  }
  v34 = *MEMORY[0x1E0CB8AA8];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AA8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count") == 1)
    {
      objc_msgSend(v29, "anyObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "integerValue") == 1)
        v37 = CFSTR("HFSceneDescriptionValueClosed");
      else
        v37 = CFSTR("HFSceneDescriptionValueOpen");
      _HFLocalizedStringWithDefaultValue(v37, v37, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = v38;
      v9 = v39;
      v8 = v39;
    }
    goto LABEL_20;
  }
  v43 = *MEMORY[0x1E0CB8AE0];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AE0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v43);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v51;
    if (objc_msgSend(v29, "count") == 1)
    {
      objc_msgSend(v29, "anyObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "integerValue") == 1)
        v46 = CFSTR("HFSceneDescriptionValueLocked");
      else
        v46 = CFSTR("HFSceneDescriptionValueUnlocked");
      _HFLocalizedStringWithDefaultValue(v46, v46, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = v47;
      v9 = v48;
      v8 = v48;
    }
    goto LABEL_21;
  }
  v26 = v51;
  v40 = v52;
  if (v52)
LABEL_37:
    *v40 = objc_retainAutorelease(v8);
LABEL_38:
  if (v26)
    *v26 = objc_retainAutorelease(v9);

}

uint64_t __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

- (id)_characteristicTypeToTargetValuesMap
{
  void *v3;
  void (**v4)(void *, void *, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD aBlock[5];
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HFServiceActionItem__characteristicTypeToTargetValuesMap__block_invoke;
  aBlock[3] = &unk_1EA733668;
  aBlock[4] = self;
  v25 = v3;
  v35 = v25;
  v4 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HFServiceActionItem actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "characteristic");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "targetValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v4[2](v4, v12, v13);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v7);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HFServiceActionItem actionBuilders](self, "actionBuilders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v19;
          objc_msgSend(v20, "characteristic");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "targetValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v4[2](v4, v21, v22);
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v16);
  }

  v23 = v25;
  return v23;
}

void __59__HFServiceActionItem__characteristicTypeToTargetValuesMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    objc_msgSend(v12, "characteristicType");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v5 && v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v10);
      }
      objc_msgSend(v11, "addObject:", v5);

    }
  }

}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HFServiceActionItem containingItem](self, "containingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F0F70))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "accessoryRepresentableObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFAccessoryRepresentable *)v5;
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  return 0;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)containingItem
{
  return self->_containingItem;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSSet)actionBuilders
{
  return self->_actionBuilders;
}

- (void)setActionBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_actionBuilders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBuilders, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_containingItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
