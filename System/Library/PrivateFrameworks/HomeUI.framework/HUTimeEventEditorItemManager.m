@implementation HUTimeEventEditorItemManager

- (HUTimeEventEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTimeEvent_triggerBuilder_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimeEventEditorItemManager.m"), 45, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTimeEventEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUTimeEventEditorItemManager)initWithTimeEvent:(id)a3 triggerBuilder:(id)a4 delegate:(id)a5
{
  id v10;
  id v11;
  HUTimeEventEditorItemManager *v12;
  HUTimeEventEditorItemManager *v13;
  uint64_t v14;
  NSMutableDictionary *significantEventToDefaultOffsetMap;
  HUInstructionsItem *v16;
  void *v17;
  uint64_t v18;
  HUInstructionsItem *instructionsItem;
  id v20;
  uint64_t v21;
  HUTimeEventEditorItemManager *v22;
  uint64_t v23;
  HFStaticItem *sunriseOptionItem;
  id v25;
  HUTimeEventEditorItemManager *v26;
  uint64_t v27;
  HFStaticItem *sunsetOptionItem;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  HFStaticItem *timeOptionItem;
  id v34;
  uint64_t v35;
  HFStaticItem *datePickerItem;
  HUInstructionsItem *v37;
  void *v38;
  uint64_t v39;
  HUInstructionsItem *recurrencesInstructionsItem;
  id v41;
  uint64_t v42;
  HFStaticItem *recurrencesItem;
  void *v45;
  id v46;
  _QWORD v47[4];
  HUTimeEventEditorItemManager *v48;
  id v49;
  _QWORD v50[4];
  HUTimeEventEditorItemManager *v51;
  id v52;
  id location;
  objc_super v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimeEventEditorItemManager.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerBuilder != nil"));

  }
  v54.receiver = self;
  v54.super_class = (Class)HUTimeEventEditorItemManager;
  v12 = -[HFItemManager initWithDelegate:sourceItem:](&v54, sel_initWithDelegate_sourceItem_, v11, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_triggerBuilder, a4);
    objc_storeStrong((id *)&v13->_timeEvent, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    significantEventToDefaultOffsetMap = v13->_significantEventToDefaultOffsetMap;
    v13->_significantEventToDefaultOffsetMap = (NSMutableDictionary *)v14;

    v16 = [HUInstructionsItem alloc];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorInstructionsTitle"), CFSTR("HUTimerTriggerEditorInstructionsTitle"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HUInstructionsItem initWithStyle:title:description:](v16, "initWithStyle:title:description:", 3, v17, 0);
    instructionsItem = v13->_instructionsItem;
    v13->_instructionsItem = (HUInstructionsItem *)v18;

    objc_initWeak(&location, v13);
    v20 = objc_alloc(MEMORY[0x1E0D31840]);
    v21 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke;
    v50[3] = &unk_1E6F5BAE0;
    v22 = v13;
    v51 = v22;
    objc_copyWeak(&v52, &location);
    v23 = objc_msgSend(v20, "initWithResultsBlock:", v50);
    sunriseOptionItem = v22->_sunriseOptionItem;
    v22->_sunriseOptionItem = (HFStaticItem *)v23;

    v25 = objc_alloc(MEMORY[0x1E0D31840]);
    v47[0] = v21;
    v47[1] = 3221225472;
    v47[2] = __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke_2;
    v47[3] = &unk_1E6F5BAE0;
    v26 = v22;
    v48 = v26;
    objc_copyWeak(&v49, &location);
    v27 = objc_msgSend(v25, "initWithResultsBlock:", v47);
    sunsetOptionItem = v26->_sunsetOptionItem;
    v26->_sunsetOptionItem = (HFStaticItem *)v27;

    v29 = objc_alloc(MEMORY[0x1E0D31840]);
    v55 = *MEMORY[0x1E0D30D18];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorTimeOption"), CFSTR("HUTimerTriggerEditorTimeOption"), 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v29, "initWithResults:", v31);
    timeOptionItem = v26->_timeOptionItem;
    v26->_timeOptionItem = (HFStaticItem *)v32;

    v34 = objc_alloc(MEMORY[0x1E0D31840]);
    v35 = objc_msgSend(v34, "initWithResults:", MEMORY[0x1E0C9AA70]);
    datePickerItem = v26->_datePickerItem;
    v26->_datePickerItem = (HFStaticItem *)v35;

    v37 = [HUInstructionsItem alloc];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorRepeatSectionTitle"), CFSTR("HUTimerTriggerEditorRepeatSectionTitle"), 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[HUInstructionsItem initWithStyle:title:description:](v37, "initWithStyle:title:description:", 2, v38, 0);
    recurrencesInstructionsItem = v26->_recurrencesInstructionsItem;
    v26->_recurrencesInstructionsItem = (HUInstructionsItem *)v39;

    v41 = objc_alloc(MEMORY[0x1E0D31840]);
    v42 = objc_msgSend(v41, "initWithResults:", MEMORY[0x1E0C9AA70]);
    recurrencesItem = v26->_recurrencesItem;
    v26->_recurrencesItem = (HFStaticItem *)v42;

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v52);

    objc_destroyWeak(&location);
  }

  return v13;
}

id __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "timeEvent");
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

id __74__HUTimeEventEditorItemManager_initWithTimeEvent_triggerBuilder_delegate___block_invoke_2(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "timeEvent");
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
    -[HUTimeEventEditorItemManager datePickerItem](self, "datePickerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      -[HUTimeEventEditorItemManager datePickerItem](self, "datePickerItem");
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
  -[HUTimeEventEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager timeOptionItem](self, "timeOptionItem");
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
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D31848]);
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HUTimeEventEditorItemManager instructionsItem](self, "instructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager timeOptionItem](self, "timeOptionItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager datePickerItem](self, "datePickerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager recurrencesInstructionsItem](self, "recurrencesInstructionsItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager recurrencesItem](self, "recurrencesItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithItems:", v13);

  v17[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUTimeEventEditorItemManager instructionsItem](self, "instructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimeEventEditorSectionIdentifierInstructions"));
    -[HUTimeEventEditorItemManager instructionsItem](self, "instructionsItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v10);

    objc_msgSend(v5, "addObject:", v8);
  }
  -[HUTimeEventEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v11;
  -[HUTimeEventEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v12;
  -[HUTimeEventEditorItemManager timeOptionItem](self, "timeOptionItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUTimeEventEditorItemManager datePickerShown](self, "datePickerShown"))
  {
    -[HUTimeEventEditorItemManager datePickerItem](self, "datePickerItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __65__HUTimeEventEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v34 = &unk_1E6F4DAD8;
  v17 = v4;
  v35 = v17;
  objc_msgSend(v14, "na_filter:", &v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count", v31, v32, v33, v34))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimeEventEditorSectionIdentifierDate"));
    objc_msgSend(v19, "setItems:", v18);
    objc_msgSend(v5, "addObject:", v19);

  }
  -[HUTimeEventEditorItemManager recurrencesInstructionsItem](self, "recurrencesInstructionsItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v17, "containsObject:", v20);

  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimeEventEditorSectionIdentifierRepeatInstructions"));
    -[HUTimeEventEditorItemManager recurrencesInstructionsItem](self, "recurrencesInstructionsItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setItems:", v24);

    objc_msgSend(v5, "addObject:", v22);
  }
  -[HUTimeEventEditorItemManager recurrencesItem](self, "recurrencesItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v17, "containsObject:", v25);

  if (v26)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTimeEventEditorSectionIdentifierRepeat"));
    -[HUTimeEventEditorItemManager recurrencesItem](self, "recurrencesItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setItems:", v29);

    objc_msgSend(v5, "addObject:", v27);
  }

  return v5;
}

uint64_t __65__HUTimeEventEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
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
  v9.super_class = (Class)HUTimeEventEditorItemManager;
  -[HFItemManager _itemsToHideInSet:](&v9, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
  {
    -[HUTimeEventEditorItemManager datePickerItem](self, "datePickerItem");
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
  -[HUTimeEventEditorItemManager sunriseOptionItem](self, "sunriseOptionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorItemManager sunsetOptionItem](self, "sunsetOptionItem");
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
  -[HUTimeEventEditorItemManager significantEventToDefaultOffsetMap](self, "significantEventToDefaultOffsetMap");
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
  -[HUTimeEventEditorItemManager significantEventToDefaultOffsetMap](self, "significantEventToDefaultOffsetMap");
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

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFTimeEventBuilder)timeEvent
{
  return self->_timeEvent;
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
  objc_storeStrong((id *)&self->_timeEvent, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_defaultFireTimeComponents, 0);
}

@end
