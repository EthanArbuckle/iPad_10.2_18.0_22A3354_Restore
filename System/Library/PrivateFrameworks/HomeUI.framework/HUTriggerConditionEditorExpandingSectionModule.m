@implementation HUTriggerConditionEditorExpandingSectionModule

+ (id)sectionModuleForConditionType:(unint64_t)a3 itemUpdater:(id)a4 home:(id)a5
{
  id v7;
  id v8;
  __objc2_class **v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  if (a3)
  {
    if (a3 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = off_1E6F3DB18;
  }
  else
  {
    v9 = off_1E6F3DB58;
  }
  v10 = (void *)objc_msgSend(objc_alloc(*v9), "initWithItemUpdater:conditionType:home:", v7, a3, v8);
LABEL_7:

  return v10;
}

- (HUTriggerConditionEditorExpandingSectionModule)initWithItemUpdater:(id)a3 conditionType:(unint64_t)a4 home:(id)a5
{
  id v9;
  HUTriggerConditionEditorExpandingSectionModule *v10;
  HUTriggerConditionEditorExpandingSectionModule *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUTriggerConditionEditorExpandingSectionModule;
  v10 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_conditionType = a4;
    objc_storeStrong((id *)&v10->_home, a5);
    -[HUTriggerConditionEditorExpandingSectionModule _buildItemProvider](v11, "_buildItemProvider");
  }

  return v11;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerConditionEditorExpandingSectionModule itemProvider](self, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sectionID
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[HUTriggerConditionEditorExpandingSectionModule conditionType](self, "conditionType");
  v3 = CFSTR("location");
  if (v2 != 1)
    v3 = 0;
  if (v2)
    return (id)v3;
  else
    return CFSTR("time");
}

- (void)_buildItemProvider
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  char v16;
  id location;

  -[HUTriggerConditionEditorExpandingSectionModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areBulletinNotificationsSupported");

  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D31840]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke;
  v14[3] = &unk_1E6F4E590;
  objc_copyWeak(&v15, &location);
  v16 = v4;
  v6 = (void *)objc_msgSend(v5, "initWithResultsBlock:", v14);
  -[HUTriggerConditionEditorExpandingSectionModule setShowOptionsItem:](self, "setShowOptionsItem:", v6);

  -[HUTriggerConditionEditorExpandingSectionModule buildConditionOptionItems](self, "buildConditionOptionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorExpandingSectionModule setOptionItems:](self, "setOptionItems:", v7);

  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerConditionEditorExpandingSectionModule optionItems](self, "optionItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorExpandingSectionModule showOptionsItem](self, "showOptionsItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v12);
  -[HUTriggerConditionEditorExpandingSectionModule setItemProvider:](self, "setItemProvider:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  char v11;
  _QWORD v12[5];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_2;
    v12[3] = &unk_1E6F4C518;
    v12[4] = WeakRetained;
    __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_2((uint64_t)v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_13;
    v10[3] = &unk_1E6F51A40;
    v10[4] = v3;
    v11 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v5, "flatMap:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v13 = *MEMORY[0x1E0D30D70];
    v14[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

id __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_2(uint64_t a1)
{
  void *v2;
  HUTriggerConditionSummaryItem *v3;
  void *v4;
  void *v5;
  void *v6;
  HUTriggerConditionSummaryItem *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  HUTriggerConditionSummaryItem *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "condition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = [HUTriggerConditionSummaryItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "condition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUTriggerConditionSummaryItem initWithConditions:home:](v3, "initWithConditions:home:", v5, v6);

    v16 = CFSTR("triggerConditionSummaryStyle");
    v17 = &unk_1E7040990;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerConditionSummaryItem updateWithOptions:](v7, "updateWithOptions:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "noConditionSummaryTitle");
    v7 = (HUTriggerConditionSummaryItem *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D314B8];
    v14 = *MEMORY[0x1E0D30D18];
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outcomeWithResults:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;

  return v12;
}

id __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "conditionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30BF8]);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = (objc_msgSend(*(id *)(a1 + 32), "conditionIsDisabled") & 1) != 0 || *(_BYTE *)(a1 + 40) == 0;
  objc_msgSend(v8, "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30C80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D31570]);
  -[HUTriggerConditionEditorExpandingSectionModule sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:", v6);

  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[HUTriggerConditionEditorExpandingSectionModule showOptionsItem](self, "showOptionsItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUTriggerConditionEditorExpandingSectionModule showOptions](self, "showOptions"))
  {
    -[HUTriggerConditionEditorExpandingSectionModule optionItems](self, "optionItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__HUTriggerConditionEditorExpandingSectionModule_buildSectionsWithDisplayedItems___block_invoke;
  v16[3] = &unk_1E6F4DAD8;
  v17 = v4;
  v12 = v4;
  objc_msgSend(v10, "na_filter:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v13);

  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __82__HUTriggerConditionEditorExpandingSectionModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)selectOptionItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[HUTriggerConditionEditorExpandingSectionModule conditionForOptionItem:](self, "conditionForOptionItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[HUTriggerConditionEditorExpandingSectionModule setSelectedOptionItem:](self, "setSelectedOptionItem:", v4);
  -[HUTriggerConditionEditorExpandingSectionModule setCondition:](self, "setCondition:", v5);

  return v5;
}

- (id)updateSelectionWithCondition:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HUTriggerConditionEditorExpandingSectionModule selectOptionItemForCondition:](self, "selectOptionItemForCondition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorExpandingSectionModule setSelectedOptionItem:](self, "setSelectedOptionItem:", v5);

  -[HUTriggerConditionEditorExpandingSectionModule setCondition:](self, "setCondition:", v4);
  return -[HUTriggerConditionEditorExpandingSectionModule selectedOptionItem](self, "selectedOptionItem");
}

- (BOOL)doesOptionItemRequireInitialUserConfiguration:(id)a3
{
  return 0;
}

- (id)createNoConditionOptionItemWithTitle:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  v5 = objc_alloc(MEMORY[0x1E0D31840]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__HUTriggerConditionEditorExpandingSectionModule_createNoConditionOptionItemWithTitle___block_invoke;
  v11[3] = &unk_1E6F51A68;
  objc_copyWeak(&v14, &location);
  v13 = &v15;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "initWithResultsBlock:", v11);
  v8 = (void *)v16[5];
  v16[5] = v7;

  v9 = (id)v16[5];
  objc_destroyWeak(&v14);
  _Block_object_dispose(&v15, 8);

  objc_destroyWeak(&location);
  return v9;
}

id __87__HUTriggerConditionEditorExpandingSectionModule_createNoConditionOptionItemWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "selectedOptionItem");

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0D30E20];
  v9[0] = *MEMORY[0x1E0D30D18];
  v9[1] = v4;
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)selectOptionItemForCondition:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorExpandingSectionModule.m"), 165, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUTriggerConditionEditorExpandingSectionModule selectOptionItemForCondition:]", objc_opt_class());

  return 0;
}

- (id)conditionForOptionItem:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorExpandingSectionModule.m"), 171, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUTriggerConditionEditorExpandingSectionModule conditionForOptionItem:]", objc_opt_class());

  return 0;
}

- (id)buildConditionOptionItems
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorExpandingSectionModule.m"), 177, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUTriggerConditionEditorExpandingSectionModule buildConditionOptionItems]", objc_opt_class());

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)conditionTitle
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorExpandingSectionModule.m"), 183, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUTriggerConditionEditorExpandingSectionModule conditionTitle]", objc_opt_class());

  return &stru_1E6F60E80;
}

- (BOOL)conditionIsDisabled
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorExpandingSectionModule.m"), 189, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUTriggerConditionEditorExpandingSectionModule conditionIsDisabled]", objc_opt_class());

  return 1;
}

- (id)preferredConditionFromConditions:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorExpandingSectionModule.m"), 195, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUTriggerConditionEditorExpandingSectionModule preferredConditionFromConditions:]", objc_opt_class());

  return 0;
}

- (unint64_t)conditionType
{
  return self->_conditionType;
}

- (HFItem)showOptionsItem
{
  return self->_showOptionsItem;
}

- (void)setShowOptionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_showOptionsItem, a3);
}

- (NSArray)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
  objc_storeStrong((id *)&self->_optionItems, a3);
}

- (HFCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (HFItem)selectedOptionItem
{
  return self->_selectedOptionItem;
}

- (void)setSelectedOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOptionItem, a3);
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_showOptions = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_selectedOptionItem, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_storeStrong((id *)&self->_showOptionsItem, 0);
}

@end
