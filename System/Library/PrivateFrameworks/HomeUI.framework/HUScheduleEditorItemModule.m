@implementation HUScheduleEditorItemModule

- (HUScheduleEditorItemModule)initWithItemUpdater:(id)a3 scheduleBuilder:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HUScheduleEditorItemModule *v10;
  uint64_t v11;
  HFScheduleBuilder *originalScheduleBuilder;
  uint64_t v13;
  HFScheduleBuilder *updatedScheduleBuilder;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleEditorItemModule.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemUpdater"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleEditorItemModule.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduleBuilder"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUScheduleEditorItemModule;
  v10 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, v7);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    originalScheduleBuilder = v10->_originalScheduleBuilder;
    v10->_originalScheduleBuilder = (HFScheduleBuilder *)v11;

    v13 = objc_msgSend(v9, "copy");
    updatedScheduleBuilder = v10->_updatedScheduleBuilder;
    v10->_updatedScheduleBuilder = (HFScheduleBuilder *)v13;

    -[HUScheduleEditorItemModule _buildItemProviders](v10, "_buildItemProviders");
  }

  return v10;
}

- (HUScheduleEditorItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_scheduleBuilder_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleEditorItemModule.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUScheduleEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUScheduleEditorItemModule scheduleTypeItemProvider](self, "scheduleTypeItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleEditorItemModule scheduleRuleItemProvider](self, "scheduleRuleItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleEditorItemModule staticItemProvider](self, "staticItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUScheduleEditorItemModule scheduleTypeItemProvider](self, "scheduleTypeItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "intersectsSet:", v7);

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUScheduleEditorTypesItemSectionIdentifier"));
    -[HUScheduleEditorItemModule scheduleTypeItemProvider](self, "scheduleTypeItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_89);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setItems:", v13);
    objc_msgSend(v5, "addObject:", v9);

  }
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUScheduleEditorRulesItemSectionIdentifier"));
  if (-[HUScheduleEditorItemModule selectedScheduleType](self, "selectedScheduleType") == 2)
    v16 = CFSTR("HUScheduleRuleEditor_Times_Title");
  else
    v16 = CFSTR("HUScheduleRuleEditor_Dates_Title");
  _HULocalizedStringWithDefaultValue(v16, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHeaderTitle:", v17);

  -[HUScheduleEditorItemModule scheduleRuleItemProvider](self, "scheduleRuleItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "items");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "intersectsSet:", v19);

  if (v20)
  {
    -[HUScheduleEditorItemModule scheduleRuleItemProvider](self, "scheduleRuleItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31758], "sortComparatorForScheduleRules");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sortedArrayUsingComparator:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v25);

  }
  -[HUScheduleEditorItemModule addScheduleRuleItem](self, "addScheduleRuleItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "containsObject:", v26);

  if (v27)
  {
    -[HUScheduleEditorItemModule addScheduleRuleItem](self, "addScheduleRuleItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v28);

  }
  if ((objc_msgSend(v14, "hmf_isEmpty") & 1) == 0)
  {
    objc_msgSend(v15, "setItems:", v14);
    objc_msgSend(v5, "addObject:", v15);
  }

  return v5;
}

uint64_t __62__HUScheduleEditorItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30DA8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30DA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = -1;
  else
    v10 = v9 != 0;
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
    v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D31750]);
  -[HUScheduleEditorItemModule originalScheduleBuilder](self, "originalScheduleBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithScheduleBuilder:", v4);
  -[HUScheduleEditorItemModule setScheduleTypeItemProvider:](self, "setScheduleTypeItemProvider:", v5);

  -[HUScheduleEditorItemModule originalScheduleBuilder](self, "originalScheduleBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "estimatedScheduleType");

  -[HUScheduleEditorItemModule scheduleTypeItemProvider](self, "scheduleTypeItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSelectedType:", v7);

  v9 = objc_alloc(MEMORY[0x1E0D31740]);
  -[HUScheduleEditorItemModule originalScheduleBuilder](self, "originalScheduleBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithScheduleBuilder:", v10);
  -[HUScheduleEditorItemModule setScheduleRuleItemProvider:](self, "setScheduleRuleItemProvider:", v11);

  objc_initWeak(&location, self);
  v12 = objc_alloc(MEMORY[0x1E0D31840]);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __49__HUScheduleEditorItemModule__buildItemProviders__block_invoke;
  v22 = &unk_1E6F4C4E8;
  objc_copyWeak(&v23, &location);
  v13 = (void *)objc_msgSend(v12, "initWithResultsBlock:", &v19);
  -[HUScheduleEditorItemModule setAddScheduleRuleItem:](self, "setAddScheduleRuleItem:", v13, v19, v20, v21, v22);

  -[HUScheduleEditorItemModule addScheduleRuleItem](self, "addScheduleRuleItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithItems:", v17);
  -[HUScheduleEditorItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

id __49__HUScheduleEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_AddRule_Title"), CFSTR("HUScheduleRuleEditor_AddRule_Title"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D519C0];
  v4 = *MEMORY[0x1E0D30D70];
  v11[0] = *MEMORY[0x1E0D30D18];
  v11[1] = v4;
  v12[0] = v2;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "scheduleTypeItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "selectedType") == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)selectedScheduleType
{
  void *v2;
  unint64_t v3;

  -[HUScheduleEditorItemModule scheduleTypeItemProvider](self, "scheduleTypeItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedType");

  return v3;
}

- (BOOL)updateSelectedScheduleType:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v20;
  HUScheduleEditorItemModule *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = self;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating selected schedule type to %@", (uint8_t *)&v20, 0x20u);

  }
  -[HUScheduleEditorItemModule originalScheduleBuilder](self, "originalScheduleBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "estimatedScheduleType");

  if (v10 == objc_msgSend(v5, "type"))
  {
    -[HUScheduleEditorItemModule originalScheduleBuilder](self, "originalScheduleBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31728], "scheduleBuilderFromType:withDefaultRules:", objc_msgSend(v5, "type"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUScheduleEditorItemModule updateScheduleBuilder:](self, "updateScheduleBuilder:", v12);
  -[HUScheduleEditorItemModule scheduleTypeItemProvider](self, "scheduleTypeItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateSelectedType:", objc_msgSend(v5, "type"));

  v14 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleEditorItemModule itemProviders](self, "itemProviders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestToReloadItemProviders:senderSelector:", v15, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "performItemUpdateRequest:", v16);

  return 1;
}

- (BOOL)updateScheduleBuilder:(id)a3
{
  id v5;
  NSObject *v6;
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
  void *v17;
  id v18;
  int v20;
  HUScheduleEditorItemModule *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = self;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating schedule builder to %@", (uint8_t *)&v20, 0x20u);

  }
  -[HUScheduleEditorItemModule setUpdatedScheduleBuilder:](self, "setUpdatedScheduleBuilder:", v5);
  -[HUScheduleEditorItemModule updatedScheduleBuilder](self, "updatedScheduleBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleEditorItemModule scheduleTypeItemProvider](self, "scheduleTypeItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheduleBuilder:", v8);

  -[HUScheduleEditorItemModule updatedScheduleBuilder](self, "updatedScheduleBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleEditorItemModule scheduleRuleItemProvider](self, "scheduleRuleItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScheduleBuilder:", v10);

  -[HUScheduleEditorItemModule delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleEditorItemModule updatedScheduleBuilder](self, "updatedScheduleBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheduleEditorModule:didUpdateScheduleBuilder:", self, v13);

  v14 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleEditorItemModule itemProviders](self, "itemProviders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestToReloadItemProviders:senderSelector:", v15, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "performItemUpdateRequest:", v16);

  return 1;
}

- (HFScheduleBuilder)originalScheduleBuilder
{
  return self->_originalScheduleBuilder;
}

- (HFScheduleBuilder)updatedScheduleBuilder
{
  return self->_updatedScheduleBuilder;
}

- (void)setUpdatedScheduleBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_updatedScheduleBuilder, a3);
}

- (HFItem)addScheduleRuleItem
{
  return self->_addScheduleRuleItem;
}

- (void)setAddScheduleRuleItem:(id)a3
{
  objc_storeStrong((id *)&self->_addScheduleRuleItem, a3);
}

- (HUScheduleEditorItemModuleDelegate)delegate
{
  return (HUScheduleEditorItemModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFScheduleTypeItemProvider)scheduleTypeItemProvider
{
  return self->_scheduleTypeItemProvider;
}

- (void)setScheduleTypeItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleTypeItemProvider, a3);
}

- (HFScheduleRuleItemProvider)scheduleRuleItemProvider
{
  return self->_scheduleRuleItemProvider;
}

- (void)setScheduleRuleItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleRuleItemProvider, a3);
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_scheduleRuleItemProvider, 0);
  objc_storeStrong((id *)&self->_scheduleTypeItemProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addScheduleRuleItem, 0);
  objc_storeStrong((id *)&self->_updatedScheduleBuilder, 0);
  objc_storeStrong((id *)&self->_originalScheduleBuilder, 0);
}

@end
