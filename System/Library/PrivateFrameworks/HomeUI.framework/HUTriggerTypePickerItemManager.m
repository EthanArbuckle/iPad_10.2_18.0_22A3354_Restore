@implementation HUTriggerTypePickerItemManager

- (HUTriggerTypePickerItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  HUTriggerTypePickerItemManager *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUTriggerTypePickerItemManager;
  result = -[HFItemManager initWithDelegate:sourceItem:](&v5, sel_initWithDelegate_sourceItem_, a3, a4);
  if (result)
    result->_showSuggestedAutomations = 0;
  return result;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  HURecommendedTriggerItemModule *v5;
  HFItemModule *suggestedAutomationsModule;
  HURecommendedTriggerItemModule *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HURecommendedTriggerItemModule initWithItemUpdater:home:]([HURecommendedTriggerItemModule alloc], "initWithItemUpdater:home:", self, v4);

  -[HURecommendedTriggerItemModule setHideSectionHeaderTitle:](v5, "setHideSectionHeaderTitle:", 1);
  -[HURecommendedTriggerItemModule setMaximumNumberOfShownRecommendations:](v5, "setMaximumNumberOfShownRecommendations:", 0x7FFFFFFFFFFFFFFFLL);
  -[HURecommendedTriggerItemModule setFilter:](v5, "setFilter:", &__block_literal_global_296);
  -[HURecommendedTriggerItemModule setConfigureBlock:](v5, "setConfigureBlock:", &__block_literal_global_9_2);
  -[HURecommendedTriggerItemModule setEngineOptions:](v5, "setEngineOptions:", -[HURecommendedTriggerItemModule engineOptions](v5, "engineOptions") | 0x10);
  suggestedAutomationsModule = self->_suggestedAutomationsModule;
  self->_suggestedAutomationsModule = &v5->super;
  v7 = v5;

  -[HUTriggerTypePickerItemManager suggestedAutomationsModule](self, "suggestedAutomationsModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __59__HUTriggerTypePickerItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hu_asTriggerRecommendation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_all:", &__block_literal_global_7_4);

  return v4;
}

BOOL __59__HUTriggerTypePickerItemManager__buildItemModulesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __59__HUTriggerTypePickerItemManager__buildItemModulesForHome___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessoryCountType:", 1);
}

- (id)_buildItemProvidersForHome:(id)a3
{
  HUInstructionsItem *v4;
  void *v5;
  void *v6;
  HUInstructionsItem *v7;
  HUInstructionsItem *v8;
  void *v9;
  void *v10;
  HUInstructionsItem *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[9];

  v34[8] = *MEMORY[0x1E0C80C00];
  v4 = [HUInstructionsItem alloc];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTypePickerEventsSectionTitle"), CFSTR("HUTriggerTypePickerEventsSectionTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTypePickerEventsSectionDescription"), CFSTR("HUTriggerTypePickerEventsSectionDescription"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUInstructionsItem initWithStyle:title:description:](v4, "initWithStyle:title:description:", 0, v5, v6);
  -[HUTriggerTypePickerItemManager setEventsInstructionsItem:](self, "setEventsInstructionsItem:", v7);

  v8 = [HUInstructionsItem alloc];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTypePickerSuggestionsSectionTitle"), CFSTR("HUTriggerTypePickerSuggestionsSectionTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTypePickerSuggestionsSectionDescription"), CFSTR("HUTriggerTypePickerSuggestionsSectionDescription"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUInstructionsItem initWithStyle:title:description:](v8, "initWithStyle:title:description:", 0, v9, v10);
  -[HUTriggerTypePickerItemManager setSuggestionsInstructionsItem:](self, "setSuggestionsInstructionsItem:", v11);

  -[HUTriggerTypePickerItemManager _createLocationItemForType:](self, "_createLocationItemForType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTypePickerItemManager setLeavingLocationTriggerItem:](self, "setLeavingLocationTriggerItem:", v12);

  -[HUTriggerTypePickerItemManager _createLocationItemForType:](self, "_createLocationItemForType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTypePickerItemManager setArrivingAtLocationTriggerItem:](self, "setArrivingAtLocationTriggerItem:", v13);

  -[HUTriggerTypePickerItemManager _createTimeItem](self, "_createTimeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTypePickerItemManager setTimerTriggerItem:](self, "setTimerTriggerItem:", v14);

  -[HUTriggerTypePickerItemManager _createCharacteristicItemForSource:](self, "_createCharacteristicItemForSource:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTypePickerItemManager setCharacteristicTriggerItem:](self, "setCharacteristicTriggerItem:", v15);

  -[HUTriggerTypePickerItemManager _createCharacteristicItemForSource:](self, "_createCharacteristicItemForSource:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTypePickerItemManager setAlarmTriggerItem:](self, "setAlarmTriggerItem:", v16);

  -[HUTriggerTypePickerItemManager _createCustomItem](self, "_createCustomItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTypePickerItemManager setCustomAutomationItem:](self, "setCustomAutomationItem:", v17);

  v31 = objc_alloc(MEMORY[0x1E0D31848]);
  v18 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerTypePickerItemManager eventsInstructionsItem](self, "eventsInstructionsItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v32;
  -[HUTriggerTypePickerItemManager leavingLocationTriggerItem](self, "leavingLocationTriggerItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v19;
  -[HUTriggerTypePickerItemManager arrivingAtLocationTriggerItem](self, "arrivingAtLocationTriggerItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v20;
  -[HUTriggerTypePickerItemManager timerTriggerItem](self, "timerTriggerItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v21;
  -[HUTriggerTypePickerItemManager characteristicTriggerItem](self, "characteristicTriggerItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v22;
  -[HUTriggerTypePickerItemManager alarmTriggerItem](self, "alarmTriggerItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v23;
  -[HUTriggerTypePickerItemManager customAutomationItem](self, "customAutomationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v24;
  -[HUTriggerTypePickerItemManager suggestionsInstructionsItem](self, "suggestionsInstructionsItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v31, "initWithItems:", v27);

  v33 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  void *v28;
  _QWORD v29[6];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerTypePickerSectionIdentifierEventsInstructions"));
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerTypePickerSectionIdentifierTriggerTypes"));
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerTypePickerSectionIdentifierSuggestionsInstructions"));
  -[HUTriggerTypePickerItemManager suggestedAutomationsModule](self, "suggestedAutomationsModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v4;
  if (v6)
  {
    -[HUTriggerTypePickerItemManager suggestedAutomationsModule](self, "suggestedAutomationsModule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildSectionsWithDisplayedItems:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[HUTriggerTypePickerItemManager eventsInstructionsItem](self, "eventsInstructionsItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v9);

  -[HUTriggerTypePickerItemManager arrivingAtLocationTriggerItem](self, "arrivingAtLocationTriggerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  -[HUTriggerTypePickerItemManager leavingLocationTriggerItem](self, "leavingLocationTriggerItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v11;
  -[HUTriggerTypePickerItemManager timerTriggerItem](self, "timerTriggerItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v12;
  -[HUTriggerTypePickerItemManager characteristicTriggerItem](self, "characteristicTriggerItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v13;
  -[HUTriggerTypePickerItemManager alarmTriggerItem](self, "alarmTriggerItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v14;
  -[HUTriggerTypePickerItemManager customAutomationItem](self, "customAutomationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setItems:", v16);

  -[HUTriggerTypePickerItemManager suggestionsInstructionsItem](self, "suggestionsInstructionsItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setItems:", v18);

  v27[0] = v5;
  v27[1] = v26;
  v27[2] = v25;
  v27[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_arrayByFlattening");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v20, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUTriggerTypePickerItemManager;
  -[HFItemManager _itemsToHideInSet:](&v13, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!-[HUTriggerTypePickerItemManager showSuggestedAutomations](self, "showSuggestedAutomations"))
  {
    -[HUTriggerTypePickerItemManager suggestedAutomationsModule](self, "suggestedAutomationsModule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v7);

  }
  -[HUTriggerTypePickerItemManager suggestedAutomationsModule](self, "suggestedAutomationsModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "count"))
  {
    -[HUTriggerTypePickerItemManager suggestionsInstructionsItem](self, "suggestionsInstructionsItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  return v5;
}

- (id)_createCustomItem
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0D31840]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__HUTriggerTypePickerItemManager__createCustomItem__block_invoke;
  v5[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithResultsBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __51__HUTriggerTypePickerItemManager__createCustomItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerCustomButtonTitle"), CFSTR("HUEventTypePickerCustomButtonTitle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D30BF8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerCustomButtonDescription"), CFSTR("HUEventTypePickerCustomButtonDescription"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = *MEMORY[0x1E0D30C60];
  v4 = objc_alloc(MEMORY[0x1E0D31460]);
  v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x1E0D307B0]);
  v13[2] = v5;
  v12[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _os_feature_enabled_impl() ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_createTimeItem
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0D31840]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HUTriggerTypePickerItemManager__createTimeItem__block_invoke;
  v5[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithResultsBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __49__HUTriggerTypePickerItemManager__createTimeItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerTimerButtonTitle"), CFSTR("HUEventTypePickerTimerButtonTitle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = *MEMORY[0x1E0D30BF8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerTimerButtonDescription"), CFSTR("HUEventTypePickerTimerButtonDescription"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = *MEMORY[0x1E0D30C60];
  v4 = objc_alloc(MEMORY[0x1E0D31460]);
  v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x1E0D30870]);
  v12[2] = v5;
  v11[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_createLocationItemForType:(unint64_t)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke;
  v7[3] = &unk_1E6F4E678;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_opt_new();
  if (*(_QWORD *)(a1 + 40) == 1)
    v4 = CFSTR("HUEventTypePickerLeavingLocationButtonTitle");
  else
    v4 = CFSTR("HUEventTypePickerArrivingAtLocationButtonTitle");
  v5 = 1;
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  if (*(_QWORD *)(a1 + 40) == 1)
    v7 = CFSTR("HUEventTypePickerLeavingLocationButtonDescription");
  else
    v7 = CFSTR("HUEventTypePickerArrivingAtLocationButtonDescription");
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30BF8]);

  v9 = (id *)MEMORY[0x1E0D30800];
  if (*(_QWORD *)(a1 + 40) != 1)
    v9 = (id *)MEMORY[0x1E0D307D8];
  v10 = *v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithImageIdentifier:", v10);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30C60]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30B78]);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke_2;
  v18[3] = &unk_1E6F57CE0;
  v18[4] = WeakRetained;
  v13 = __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke_2((uint64_t)v18);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  if (v13)
    v5 = objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1;
  objc_msgSend(v14, "numberWithInt:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30C80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __61__HUTriggerTypePickerItemManager__createLocationItemForType___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "supportsBeingCurrentLocationDevice") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D314E0], "sharedDispatcher");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "authorizationStatus");

    v4 = HFLocationServicesAvailableForAuthorizationStatus();
    v5 = (void *)MEMORY[0x1E0CBA780];
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "hf_presenceDisableReasonsForHome:", v6);

    v7 = v5 & 2;
    if ((v5 & 2) != 0)
      v8 = 0;
    else
      v8 = v4;
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109888;
      v11[1] = v8;
      v12 = 1024;
      v13 = v3;
      v14 = 1024;
      v15 = v4;
      v16 = 1024;
      v17 = v7 >> 1;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Location automations allowed=%{BOOL}d, locationServicesAuthStatus=%d, locationServicesEnabled=%{BOOL}d, homeKitLocationServicesDisabled=%{BOOL}d", (uint8_t *)v11, 0x1Au);
    }
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Location automations disabled because supportsBeingCurrentLocationDevice us false", (uint8_t *)v11, 2u);
    }
    v8 = 1;
  }

  return v8;
}

- (id)_createCharacteristicItemForSource:(unint64_t)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HUTriggerTypePickerItemManager__createCharacteristicItemForSource___block_invoke;
  v7[3] = &unk_1E6F4E678;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __69__HUTriggerTypePickerItemManager__createCharacteristicItemForSource___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = CFSTR("HUEventTypePickerCharacteristicButtonTitle");
  else
    v5 = CFSTR("HUEventTypePickerAlarmButtonTitle");
  if (v4)
    v6 = CFSTR("HUEventTypePickerCharacteristicButtonDescription");
  else
    v6 = CFSTR("HUEventTypePickerAlarmButtonDescription");
  if (v4)
    v7 = (id *)MEMORY[0x1E0D30860];
  else
    v7 = (id *)MEMORY[0x1E0D30868];
  v8 = 1;
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D18]);

  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30BF8]);

  v11 = (objc_class *)MEMORY[0x1E0D31460];
  v12 = *v7;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithImageIdentifier:", v12);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C60]);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HUCharacteristicTriggerServicePickerViewController canPickServicesFromSource:home:](HUCharacteristicTriggerServicePickerViewController, "canPickServicesFromSource:home:", v15, v16))
  {
    v8 = 1;
    if (objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggeringServices:", 1))
      v8 = objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 2) ^ 1;
  }
  objc_msgSend(v14, "numberWithInt:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30C80]);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30B78]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_hasMinimumRequiredTriggeringServices:(int64_t)a3
{
  void *v4;
  void *v5;

  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_allVisibleServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "count") >= (unint64_t)a3;

  return a3;
}

- (BOOL)_hasMinimumRequiredTriggerableServices:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hf_enabledResidentsSupportsMediaActions"))
  {
    -[HFItemManager home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_mediaAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "hf_allVisibleServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") + v8;

  return v10 >= a3;
}

- (HFStaticItem)leavingLocationTriggerItem
{
  return self->_leavingLocationTriggerItem;
}

- (void)setLeavingLocationTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_leavingLocationTriggerItem, a3);
}

- (HFStaticItem)arrivingAtLocationTriggerItem
{
  return self->_arrivingAtLocationTriggerItem;
}

- (void)setArrivingAtLocationTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_arrivingAtLocationTriggerItem, a3);
}

- (HFStaticItem)timerTriggerItem
{
  return self->_timerTriggerItem;
}

- (void)setTimerTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_timerTriggerItem, a3);
}

- (HFStaticItem)characteristicTriggerItem
{
  return self->_characteristicTriggerItem;
}

- (void)setCharacteristicTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicTriggerItem, a3);
}

- (HFStaticItem)alarmTriggerItem
{
  return self->_alarmTriggerItem;
}

- (void)setAlarmTriggerItem:(id)a3
{
  objc_storeStrong((id *)&self->_alarmTriggerItem, a3);
}

- (HFStaticItem)customAutomationItem
{
  return self->_customAutomationItem;
}

- (void)setCustomAutomationItem:(id)a3
{
  objc_storeStrong((id *)&self->_customAutomationItem, a3);
}

- (HFItemModule)suggestedAutomationsModule
{
  return self->_suggestedAutomationsModule;
}

- (void)setSuggestedAutomationsModule:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedAutomationsModule, a3);
}

- (BOOL)showSuggestedAutomations
{
  return self->_showSuggestedAutomations;
}

- (void)setShowSuggestedAutomations:(BOOL)a3
{
  self->_showSuggestedAutomations = a3;
}

- (HUInstructionsItem)eventsInstructionsItem
{
  return self->_eventsInstructionsItem;
}

- (void)setEventsInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_eventsInstructionsItem, a3);
}

- (HUInstructionsItem)suggestionsInstructionsItem
{
  return self->_suggestionsInstructionsItem;
}

- (void)setSuggestionsInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsInstructionsItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsInstructionsItem, 0);
  objc_storeStrong((id *)&self->_eventsInstructionsItem, 0);
  objc_storeStrong((id *)&self->_suggestedAutomationsModule, 0);
  objc_storeStrong((id *)&self->_customAutomationItem, 0);
  objc_storeStrong((id *)&self->_alarmTriggerItem, 0);
  objc_storeStrong((id *)&self->_characteristicTriggerItem, 0);
  objc_storeStrong((id *)&self->_timerTriggerItem, 0);
  objc_storeStrong((id *)&self->_arrivingAtLocationTriggerItem, 0);
  objc_storeStrong((id *)&self->_leavingLocationTriggerItem, 0);
}

@end
