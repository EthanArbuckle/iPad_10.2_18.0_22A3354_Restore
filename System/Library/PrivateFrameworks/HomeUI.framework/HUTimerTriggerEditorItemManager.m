@implementation HUTimerTriggerEditorItemManager

- (HUTimerTriggerEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTimerTriggerBuilder_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimerTriggerEditorItemManager.m"), 46, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTimerTriggerEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUTimerTriggerEditorItemManager)initWithTimerTriggerBuilder:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HUTimerTriggerEditorItemManager *v10;
  HUTimerTriggerEditorItemManager *v11;
  uint64_t v12;
  NSMutableDictionary *significantEventToDefaultOffsetMap;
  HUTriggerConditionEditorItemModule *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HUTriggerConditionEditorItemModule *conditionModule;
  HUInstructionsItem *v20;
  void *v21;
  uint64_t v22;
  HUInstructionsItem *instructionsItem;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  HFStaticItem *sunriseOptionItem;
  id v29;
  uint64_t v30;
  HFStaticItem *sunsetOptionItem;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  HFStaticItem *timeOptionItem;
  id v37;
  uint64_t v38;
  HFStaticItem *datePickerItem;
  HUInstructionsItem *v40;
  void *v41;
  uint64_t v42;
  HUInstructionsItem *recurrencesInstructionsItem;
  id v44;
  uint64_t v45;
  HFStaticItem *recurrencesItem;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id location;
  objc_super v56;
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimerTriggerEditorItemManager.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timerTriggerBuilder != nil"));

  }
  v56.receiver = self;
  v56.super_class = (Class)HUTimerTriggerEditorItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v56, sel_initWithDelegate_sourceItem_, v9, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_timerTriggerBuilder, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    significantEventToDefaultOffsetMap = v11->_significantEventToDefaultOffsetMap;
    v11->_significantEventToDefaultOffsetMap = (NSMutableDictionary *)v12;

    v14 = [HUTriggerConditionEditorItemModule alloc];
    objc_msgSend(v8, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conditionCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E70418F0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HUTriggerConditionEditorItemModule initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:](v14, "initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:", v11, v15, v16, v17);
    conditionModule = v11->_conditionModule;
    v11->_conditionModule = (HUTriggerConditionEditorItemModule *)v18;

    v20 = [HUInstructionsItem alloc];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorInstructionsTitle"), CFSTR("HUTimerTriggerEditorInstructionsTitle"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HUInstructionsItem initWithStyle:title:description:](v20, "initWithStyle:title:description:", 3, v21, 0);
    instructionsItem = v11->_instructionsItem;
    v11->_instructionsItem = (HUInstructionsItem *)v22;

    objc_initWeak(&location, v11);
    v24 = objc_alloc(MEMORY[0x1E0D31840]);
    v25 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke;
    v52[3] = &unk_1E6F5BAE0;
    v26 = v8;
    v53 = v26;
    objc_copyWeak(&v54, &location);
    v27 = objc_msgSend(v24, "initWithResultsBlock:", v52);
    sunriseOptionItem = v11->_sunriseOptionItem;
    v11->_sunriseOptionItem = (HFStaticItem *)v27;

    v29 = objc_alloc(MEMORY[0x1E0D31840]);
    v49[0] = v25;
    v49[1] = 3221225472;
    v49[2] = __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke_2;
    v49[3] = &unk_1E6F5BAE0;
    v50 = v26;
    objc_copyWeak(&v51, &location);
    v30 = objc_msgSend(v29, "initWithResultsBlock:", v49);
    sunsetOptionItem = v11->_sunsetOptionItem;
    v11->_sunsetOptionItem = (HFStaticItem *)v30;

    v32 = objc_alloc(MEMORY[0x1E0D31840]);
    v57 = *MEMORY[0x1E0D30D18];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorTimeOption"), CFSTR("HUTimerTriggerEditorTimeOption"), 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "initWithResults:", v34);
    timeOptionItem = v11->_timeOptionItem;
    v11->_timeOptionItem = (HFStaticItem *)v35;

    v37 = objc_alloc(MEMORY[0x1E0D31840]);
    v38 = objc_msgSend(v37, "initWithResults:", MEMORY[0x1E0C9AA70]);
    datePickerItem = v11->_datePickerItem;
    v11->_datePickerItem = (HFStaticItem *)v38;

    v40 = [HUInstructionsItem alloc];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorRepeatSectionTitle"), CFSTR("HUTimerTriggerEditorRepeatSectionTitle"), 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[HUInstructionsItem initWithStyle:title:description:](v40, "initWithStyle:title:description:", 2, v41, 0);
    recurrencesInstructionsItem = v11->_recurrencesInstructionsItem;
    v11->_recurrencesInstructionsItem = (HUInstructionsItem *)v42;

    v44 = objc_alloc(MEMORY[0x1E0D31840]);
    v45 = objc_msgSend(v44, "initWithResults:", MEMORY[0x1E0C9AA70]);
    recurrencesItem = v11->_recurrencesItem;
    v11->_recurrencesItem = (HFStaticItem *)v45;

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v54);

    objc_destroyWeak(&location);
  }

  return v11;
}

id __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "eventBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *MEMORY[0x1E0CB9B88];
  objc_msgSend(WeakRetained, "defaultOffsetForSignificantEvent:", *MEMORY[0x1E0CB9B88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "significantEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    objc_msgSend(v4, "significantEventOffset");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CBA920], "hf_localizedStringForSignficantEvent:offset:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D519C0];
  v16 = *MEMORY[0x1E0D30D18];
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __72__HUTimerTriggerEditorItemManager_initWithTimerTriggerBuilder_delegate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "eventBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *MEMORY[0x1E0CB9B90];
  objc_msgSend(WeakRetained, "defaultOffsetForSignificantEvent:", *MEMORY[0x1E0CB9B90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "significantEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    objc_msgSend(v4, "significantEventOffset");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CBA920], "hf_localizedStringForSignficantEvent:offset:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D519C0];
  v16 = *MEMORY[0x1E0D30D18];
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setDatePickerShown:(BOOL)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (self->_datePickerShown != a3)
  {
    self->_datePickerShown = a3;
    -[HFItemManager allItems](self, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTriggerEditorItemManager datePickerItem](self, "datePickerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      -[HUTimerTriggerEditorItemManager datePickerItem](self, "datePickerItem");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithObject:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v9, a2);

    }
  }
}

- (NSSet)dateOptionsItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUTimerTriggerEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager timeOptionItem](self, "timeOptionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

- (id)_buildItemProvidersForHome:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D31848]);
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HUTimerTriggerEditorItemManager instructionsItem](self, "instructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager timeOptionItem](self, "timeOptionItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager datePickerItem](self, "datePickerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager recurrencesInstructionsItem](self, "recurrencesInstructionsItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager recurrencesItem](self, "recurrencesItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithItems:", v13);

  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager conditionModule](self, "conditionModule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "itemProviders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUTimerTriggerEditorItemManager instructionsItem](self, "instructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimerTriggerEditorSectionIdentifierInstructions"));
    -[HUTimerTriggerEditorItemManager instructionsItem](self, "instructionsItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v10);

    objc_msgSend(v5, "addObject:", v8);
  }
  -[HUTimerTriggerEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v11;
  -[HUTimerTriggerEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v12;
  -[HUTimerTriggerEditorItemManager timeOptionItem](self, "timeOptionItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUTimerTriggerEditorItemManager datePickerShown](self, "datePickerShown"))
  {
    -[HUTimerTriggerEditorItemManager datePickerItem](self, "datePickerItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __68__HUTimerTriggerEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v36 = &unk_1E6F4DAD8;
  v17 = v4;
  v37 = v17;
  objc_msgSend(v14, "na_filter:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count", v33, v34, v35, v36))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimerTriggerEditorSectionIdentifierDate"));
    objc_msgSend(v19, "setItems:", v18);
    objc_msgSend(v5, "addObject:", v19);

  }
  -[HUTimerTriggerEditorItemManager recurrencesInstructionsItem](self, "recurrencesInstructionsItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v17, "containsObject:", v20);

  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimerTriggerEditorSectionIdentifierRepeatInstructions"));
    -[HUTimerTriggerEditorItemManager recurrencesInstructionsItem](self, "recurrencesInstructionsItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setItems:", v24);

    objc_msgSend(v5, "addObject:", v22);
  }
  -[HUTimerTriggerEditorItemManager recurrencesItem](self, "recurrencesItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v17, "containsObject:", v25);

  if (v26)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimerTriggerEditorSectionIdentifierRepeat"));
    -[HUTimerTriggerEditorItemManager recurrencesItem](self, "recurrencesItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setItems:", v29);

    objc_msgSend(v5, "addObject:", v27);
  }
  -[HUTimerTriggerEditorItemManager conditionModule](self, "conditionModule");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "buildSectionsWithDisplayedItems:", v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v31);

  return v5;
}

uint64_t __68__HUTimerTriggerEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)HUTimerTriggerEditorItemManager;
  -[HFItemManager _itemsToHideInSet:](&v9, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
  {
    -[HUTimerTriggerEditorItemManager datePickerItem](self, "datePickerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  return v5;
}

- (void)updateForSignificantEventOffsetChange
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HUTimerTriggerEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager allItems](self, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByIntersectingWithSet:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v10, a2);
}

- (id)defaultOffsetForSignificantEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUTimerTriggerEditorItemManager significantEventToDefaultOffsetMap](self, "significantEventToDefaultOffsetMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  return v6;
}

- (void)setDefaultOffset:(id)a3 forSignificantEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HUTimerTriggerEditorItemManager significantEventToDefaultOffsetMap](self, "significantEventToDefaultOffsetMap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (NSDateComponents)defaultFireTimeComponents
{
  return self->_defaultFireTimeComponents;
}

- (void)setDefaultFireTimeComponents:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFireTimeComponents, a3);
}

- (HFTimerTriggerBuilder)timerTriggerBuilder
{
  return self->_timerTriggerBuilder;
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (void)setConditionModule:(id)a3
{
  objc_storeStrong((id *)&self->_conditionModule, a3);
}

- (BOOL)datePickerShown
{
  return self->_datePickerShown;
}

- (HFStaticItem)sunriseOptionItem
{
  return self->_sunriseOptionItem;
}

- (void)setSunriseOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_sunriseOptionItem, a3);
}

- (HFStaticItem)sunsetOptionItem
{
  return self->_sunsetOptionItem;
}

- (void)setSunsetOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_sunsetOptionItem, a3);
}

- (HFStaticItem)timeOptionItem
{
  return self->_timeOptionItem;
}

- (void)setTimeOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_timeOptionItem, a3);
}

- (HFStaticItem)datePickerItem
{
  return self->_datePickerItem;
}

- (void)setDatePickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_datePickerItem, a3);
}

- (HFStaticItem)recurrencesItem
{
  return self->_recurrencesItem;
}

- (void)setRecurrencesItem:(id)a3
{
  objc_storeStrong((id *)&self->_recurrencesItem, a3);
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (HUInstructionsItem)recurrencesInstructionsItem
{
  return self->_recurrencesInstructionsItem;
}

- (void)setRecurrencesInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_recurrencesInstructionsItem, a3);
}

- (NSMutableDictionary)significantEventToDefaultOffsetMap
{
  return self->_significantEventToDefaultOffsetMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantEventToDefaultOffsetMap, 0);
  objc_storeStrong((id *)&self->_recurrencesInstructionsItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_recurrencesItem, 0);
  objc_storeStrong((id *)&self->_datePickerItem, 0);
  objc_storeStrong((id *)&self->_timeOptionItem, 0);
  objc_storeStrong((id *)&self->_sunsetOptionItem, 0);
  objc_storeStrong((id *)&self->_sunriseOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_timerTriggerBuilder, 0);
  objc_storeStrong((id *)&self->_defaultFireTimeComponents, 0);
}

@end
