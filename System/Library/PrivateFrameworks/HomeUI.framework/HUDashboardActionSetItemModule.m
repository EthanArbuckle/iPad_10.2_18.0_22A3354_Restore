@implementation HUDashboardActionSetItemModule

- (id)_reorderableHomeKitItemListKey
{
  return (id)*MEMORY[0x1E0D30CA8];
}

- (id)_itemComparator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  HUDashboardActionSetItemModule *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUDashboardActionSetItemModule;
  -[HFItemModule _itemComparator](&v22, sel__itemComparator);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardActionSetItemModule context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryTypeGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardActionSetItemModule actionSetItemProvider](self, "actionSetItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__HUDashboardActionSetItemModule__itemComparator__block_invoke;
    v19[3] = &unk_1E6F55898;
    v20 = v5;
    v11 = v6;
    v21 = v11;
    objc_msgSend(v9, "na_each:", v19);

    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __49__HUDashboardActionSetItemModule__itemComparator__block_invoke_2;
    v16[3] = &unk_1E6F558C0;
    v17 = v11;
    v18 = self;
    v12 = v11;
    v13 = _Block_copy(v16);

    v3 = v13;
  }
  v14 = _Block_copy(v3);

  return v14;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
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
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("scenesSection"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUGridScenesSectionTitle"), CFSTR("HUGridScenesSectionTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardActionSetItemModule predictedActionSetItemProvider](self, "predictedActionSetItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v10);
  -[HUDashboardActionSetItemModule actionSetItemProvider](self, "actionSetItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardActionSetItemModule _itemComparator](self, "_itemComparator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v15);
  objc_msgSend(v6, "setItems:", v8);
  v16 = (void *)MEMORY[0x1E0D314B0];
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterSections:toDisplayedItems:", v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSSet)predictedActionSetItems
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HUDashboardActionSetItemModule predictedActionSetItemProvider](self, "predictedActionSetItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (HFPredictedActionSetItemProvider)predictedActionSetItemProvider
{
  return self->_predictedActionSetItemProvider;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  if (-[HUDashboardActionSetItemModule showPredictedScenes](self, "showPredictedScenes", a3)
    && (-[HUDashboardActionSetItemModule context](self, "context"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "includePredictedScenes"),
        v4,
        v5))
  {
    -[HUDashboardActionSetItemModule predictedActionSetItems](self, "predictedActionSetItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_124);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUDashboardActionSetItemModule actionSetItemProvider](self, "actionSetItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__HUDashboardActionSetItemModule__itemsToHideInSet___block_invoke_2;
    v13[3] = &unk_1E6F55928;
    v14 = v7;
    v10 = v7;
    objc_msgSend(v9, "na_filter:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    -[HUDashboardActionSetItemModule predictedActionSetItems](self, "predictedActionSetItems");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (HFActionSetItemProvider)actionSetItemProvider
{
  return self->_actionSetItemProvider;
}

- (BOOL)showPredictedScenes
{
  void *v2;
  void *v3;
  char v4;

  -[HUDashboardActionSetItemModule context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_showPredictedScenesOnDashboard");

  return v4;
}

uint64_t __52__HUDashboardActionSetItemModule__itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

id __52__HUDashboardActionSetItemModule__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "actionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = (void *)MEMORY[0x1E0D314C0];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "predictedActionSetItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v5, *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "itemUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v6);

}

- (void)predictionsManagerDidUpdatePredictions:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HUDashboardActionSetItemModule initialPredictionUpdateFuture](self, "initialPredictionUpdateFuture", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if ((v5 & 1) == 0)
  {
    -[HUDashboardActionSetItemModule initialPredictionUpdateFuture](self, "initialPredictionUpdateFuture");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithNoResult");

  }
}

- (NAFuture)initialPredictionUpdateFuture
{
  return self->_initialPredictionUpdateFuture;
}

uint64_t __48__HUDashboardActionSetItemModule__updateFilters__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  int v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideHomeKitObject:", v3);

  return v6 ^ 1u;
}

- (id)buildItemProviders
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D31150]);
  -[HUDashboardActionSetItemModule context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:actionSetItemStyle:", v6, 1);
  -[HUDashboardActionSetItemModule setActionSetItemProvider:](self, "setActionSetItemProvider:", v7);

  -[HUDashboardActionSetItemModule context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardActionSetItemModule actionSetItemProvider](self, "actionSetItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRoom:", v9);

  -[HUDashboardActionSetItemModule context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "includePredictedScenes");

  if ((_DWORD)v9)
  {
    v12 = objc_alloc(MEMORY[0x1E0D31668]);
    -[HUDashboardActionSetItemModule context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithHome:predictionsManagerDelegate:itemCount:", v14, self, 2);
    -[HUDashboardActionSetItemModule setPredictedActionSetItemProvider:](self, "setPredictedActionSetItemProvider:", v15);

  }
  -[HUDashboardActionSetItemModule _updateFilters](self, "_updateFilters");
  -[HUDashboardActionSetItemModule valueSource](self, "valueSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HUDashboardActionSetItemModule valueSource](self, "valueSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardActionSetItemModule actionSetItemProvider](self, "actionSetItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValueSource:", v17);

    -[HUDashboardActionSetItemModule valueSource](self, "valueSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardActionSetItemModule predictedActionSetItemProvider](self, "predictedActionSetItemProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValueSource:", v19);

  }
  -[HUDashboardActionSetItemModule actionSetItemProvider](self, "actionSetItemProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v21);

  -[HUDashboardActionSetItemModule predictedActionSetItemProvider](self, "predictedActionSetItemProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v22);

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setPredictedActionSetItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_predictedActionSetItemProvider, a3);
}

- (void)setActionSetItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetItemProvider, a3);
}

- (void)_updateFilters
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v5, &location);
  -[HUDashboardActionSetItemModule actionSetItemProvider](self, "actionSetItemProvider", v4, 3221225472, __48__HUDashboardActionSetItemModule__updateFilters__block_invoke, &unk_1E6F4DD60);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilter:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (HUDashboardActionSetItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v8;
  id v9;
  HUDashboardActionSetItemModule *v10;
  HUDashboardActionSetItemModule *v11;
  NAFuture *v12;
  NAFuture *initialPredictionUpdateFuture;
  void *v14;
  uint64_t v15;
  void *v16;
  NAFuture *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23[2];
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUDashboardActionSetItemModule;
  v10 = -[HFItemModule initWithItemUpdater:](&v27, sel_initWithItemUpdater_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a3);
    v12 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    initialPredictionUpdateFuture = v11->_initialPredictionUpdateFuture;
    v11->_initialPredictionUpdateFuture = v12;

    objc_initWeak(&location, v11);
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke;
    v24[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v14, "afterDelay:performBlock:", v24, 5.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v11->_initialPredictionUpdateFuture;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke_2;
    v21[3] = &unk_1E6F55870;
    objc_copyWeak(v23, &location);
    v18 = v16;
    v22 = v18;
    v23[1] = (id)a2;
    v19 = (id)-[NAFuture addSuccessBlock:](v17, "addSuccessBlock:", v21);

    objc_destroyWeak(v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "initialPredictionUpdateFuture");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isFinished");

  if ((v2 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "initialPredictionUpdateFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_timeoutError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v4);

  }
}

void __49__HUDashboardActionSetItemModule__itemComparator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  double v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "actionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup:", *(_QWORD *)(a1 + 32));
  v6 = v5;

  v7 = *(void **)(a1 + 40);
  LODWORD(v8) = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, v3);

}

uint64_t __49__HUDashboardActionSetItemModule__itemComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t (**v10)(_QWORD, _QWORD, _QWORD);
  objc_super v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:", v7);
  if (!v9)
  {
    v12.receiver = *(id *)(a1 + 40);
    v12.super_class = (Class)HUDashboardActionSetItemModule;
    objc_msgSendSuper2(&v12, sel__itemComparator);
    v10 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = ((uint64_t (**)(_QWORD, id, id))v10)[2](v10, v5, v6);

  }
  return v9;
}

- (BOOL)supportsReorderingForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HUDashboardActionSetItemModule predictedActionSetItemProvider](self, "predictedActionSetItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) != 0)
    return 0;
  -[HUDashboardActionSetItemModule context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryTypeGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v8 = 0;
  else
    v8 = -[HFItemModule supportsReordering](self, "supportsReordering");

  return v8;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setInitialPredictionUpdateFuture:(id)a3
{
  objc_storeStrong((id *)&self->_initialPredictionUpdateFuture, a3);
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_initialPredictionUpdateFuture, 0);
  objc_storeStrong((id *)&self->_predictedActionSetItemProvider, 0);
  objc_storeStrong((id *)&self->_actionSetItemProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
