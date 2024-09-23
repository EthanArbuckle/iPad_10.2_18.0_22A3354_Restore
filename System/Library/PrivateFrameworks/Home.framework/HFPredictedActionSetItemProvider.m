@implementation HFPredictedActionSetItemProvider

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFPredictedActionSetItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("actionSet");
  v7[1] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, 0, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_1EA72C438;
  v9[4] = WeakRetained;
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

HFActionSetItem *__47__HFPredictedActionSetItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  HFActionSetItem *v8;
  void *v9;
  HFActionSetItem *v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = [HFActionSetItem alloc];
    objc_msgSend(WeakRetained, "valueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFActionSetItem initWithActionSet:actionSetItemStyle:valueSource:](v8, "initWithActionSet:actionSetItemStyle:valueSource:", v7, 2, v9);

  }
  else
  {
    NSLog(CFSTR("Unsupported HomeKit object %@"), v5);
    v10 = 0;
  }

  return v10;
}

id __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke_2;
  v8[3] = &unk_1EA72C3E8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)orderedItems
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFPredictedActionSetItemProvider predictions](self, "predictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke;
  v6[3] = &unk_1EA72C410;
  v6[4] = self;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v3;
  void *v4;
  void *v5;

  -[HFPredictedActionSetItemProvider overrideValueSource](self, "overrideValueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFPredictedActionSetItemProvider overrideValueSource](self, "overrideValueSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFPredictedActionSetItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_characteristicValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFCharacteristicValueSource *)v4;
}

id __62__HFPredictedActionSetItemProvider_fetchUserActionPredictions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained, "itemCount");
    v7 = v6 - objc_msgSend(v3, "count");
    if (v7 >= 1)
    {
      objc_msgSend(v5, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hf_orderedActionSets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "removeObjectsInArray:", v3);
      if (objc_msgSend(v10, "count"))
      {
        v11 = objc_msgSend(v10, "count");
        if (v7 >= v11)
          v12 = v11;
        else
          v12 = v7;
        objc_msgSend(v10, "subarrayWithRange:", 0, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v14;
      }

    }
    objc_msgSend(v5, "setPredictions:", v3);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  return v16;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_predictions, a3);
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v13, &location);
  v4 = _Block_copy(aBlock);
  -[HFPredictedActionSetItemProvider fetchUserActionPredictions](self, "fetchUserActionPredictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_1EA72C460;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v7;
}

- (id)fetchUserActionPredictions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  -[HFPredictedActionSetItemProvider predictionsManager](self, "predictionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchUserActionPredictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HFPredictedActionSetItemProvider_fetchUserActionPredictions__block_invoke;
  v7[3] = &unk_1EA72A438;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (HFPredictionsManager)predictionsManager
{
  return self->_predictionsManager;
}

- (HFPredictedActionSetItemProvider)initWithHome:(id)a3 predictionsManagerDelegate:(id)a4 itemCount:(unint64_t)a5
{
  id v9;
  id v10;
  HFPredictedActionSetItemProvider *v11;
  HFPredictedActionSetItemProvider *v12;
  uint64_t v13;
  NSMutableSet *allItems;
  HFPredictionsManager *v15;
  void *v16;
  uint64_t v17;
  HFPredictionsManager *predictionsManager;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HFPredictedActionSetItemProvider;
  v11 = -[HFItemProvider init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    allItems = v12->_allItems;
    v12->_allItems = (NSMutableSet *)v13;

    v12->_itemCount = a5;
    v15 = [HFPredictionsManager alloc];
    objc_msgSend(v9, "userActionPredictionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HFPredictionsManager initWithHome:predictionsController:delegate:predictionLimit:filterTypes:](v15, "initWithHome:predictionsController:delegate:predictionLimit:filterTypes:", v9, v16, v10, a5, &unk_1EA7CDCC0);
    predictionsManager = v12->_predictionsManager;
    v12->_predictionsManager = (HFPredictionsManager *)v17;

  }
  return v12;
}

- (HFPredictedActionSetItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_predictionsManager_itemLimit_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPredictedActionSetItemProvider.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPredictedActionSetItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFPredictedActionSetItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictedActionSetItemProvider predictionsManager](self, "predictionsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHome:predictionsManagerDelegate:itemCount:", v5, v7, -[HFPredictedActionSetItemProvider itemCount](self, "itemCount"));

  return v8;
}

- (void)setAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_allItems, a3);
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (void)setPredictionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_predictionsManager, a3);
}

- (void)setOverrideValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_predictionsManager, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
