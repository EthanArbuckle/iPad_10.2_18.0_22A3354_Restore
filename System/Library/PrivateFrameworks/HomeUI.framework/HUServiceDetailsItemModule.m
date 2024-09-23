@implementation HUServiceDetailsItemModule

+ (id)serviceDetailsItemSectionComparatorForSortStrategy:(id)a3
{
  void *v5;
  _QWORD v7[6];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HUServiceDetailsItemModuleSortStrategyProgrammableSwitch")))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__HUServiceDetailsItemModule_serviceDetailsItemSectionComparatorForSortStrategy___block_invoke;
    v7[3] = &__block_descriptor_48_e41_q24__0__HFItemSection_8__HFItemSection_16l;
    v7[4] = a2;
    v7[5] = a1;
    v5 = _Block_copy(v7);
  }
  else
  {
    v5 = &__block_literal_global_283;
  }
  return v5;
}

uint64_t __81__HUServiceDetailsItemModule_serviceDetailsItemSectionComparatorForSortStrategy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"));
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"));
  v10 = objc_claimAutoreleasedReturnValue();

  if (v8 || !v10)
  {
    if (!v8 || v10)
    {
      if (v8 | v10)
      {
        objc_msgSend((id)v8, "componentsSeparatedByString:", CFSTR("-"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "componentsSeparatedByString:", CFSTR("-"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "count");
        if (v14 != objc_msgSend(v13, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("HUServiceDetailsItemModule.m"), 47, CFSTR("Programmable Switch Strategy expects identically padded section sorting keys."));

        }
        if (!objc_msgSend(v12, "count"))
          goto LABEL_16;
        v24 = v6;
        v25 = v5;
        v15 = 1;
        do
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v15 - 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v15 - 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "integerValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "integerValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v18, "compare:", v19);

          if (v15 >= objc_msgSend(v12, "count"))
            break;
          ++v15;
        }
        while (!v11);
        v6 = v24;
        v5 = v25;
        if (!v11)
        {
LABEL_16:
          objc_msgSend(v5, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v20, "compare:", v21);

        }
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = -1;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __81__HUServiceDetailsItemModule_serviceDetailsItemSectionComparatorForSortStrategy___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v4, "headerTitle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v5, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v5, "headerTitle");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_msgSend(v10, "localizedStandardCompare:", v15);
  if (!v16)
  {
    objc_msgSend(v4, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "compare:", v18);

  }
  return v16;
}

- (HUServiceDetailsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUServiceDetailsItemModule *v13;
  HUServiceDetailsItemModule *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsItemModule.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsItemModule.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceItem"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUServiceDetailsItemModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, v9);
  v14 = v13;
  if (v13)
  {
    -[HUServiceDetailsItemModule setHome:](v13, "setHome:", v10);
    -[HUServiceDetailsItemModule setSourceItem:](v14, "setSourceItem:", v12);
  }

  return v14;
}

- (id)itemProviders
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsItemModule.m"), 95, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUServiceDetailsItemModule itemProviders]", objc_opt_class());

  return 0;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
