@implementation HUCCFavoriteActionSetItemProvider

id __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "actionSetItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "actionSetItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableSet)actionSetItems
{
  return self->_actionSetItems;
}

- (void)setMaximumNumberOfItems:(unint64_t)a3
{
  self->_maximumNumberOfItems = a3;
}

id __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_alloc(MEMORY[0x1E0D31148]);
  v6 = objc_msgSend(WeakRetained, "actionSetItemStyle");
  objc_msgSend(WeakRetained, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_characteristicValueManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithActionSet:actionSetItemStyle:valueSource:", v3, v6, v8);

  return v9;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;
  id location;

  v3 = (void *)MEMORY[0x1E0D314A8];
  -[HUCCFavoriteActionSetItemProvider home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "favoriteActionSetsForHome:withLimit:", v4, -[HUCCFavoriteActionSetItemProvider maximumNumberOfItems](self, "maximumNumberOfItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6F4D228;
  objc_copyWeak(&v14, &location);
  v7 = _Block_copy(aBlock);
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)maximumNumberOfItems
{
  return self->_maximumNumberOfItems;
}

- (unint64_t)actionSetItemStyle
{
  return self->_actionSetItemStyle;
}

- (HUCCFavoriteActionSetItemProvider)initWithHome:(id)a3 actionSetItemStyle:(unint64_t)a4
{
  id v7;
  HUCCFavoriteActionSetItemProvider *v8;
  HUCCFavoriteActionSetItemProvider *v9;
  uint64_t v10;
  NSMutableSet *actionSetItems;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUCCFavoriteActionSetItemProvider;
  v8 = -[HFItemProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    actionSetItems = v9->_actionSetItems;
    v9->_actionSetItems = (NSMutableSet *)v10;

    v9->_maximumNumberOfItems = -1;
    v9->_actionSetItemStyle = a4;
  }

  return v9;
}

- (HUCCFavoriteActionSetItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_actionSetItemStyle_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCCFavoriteActionSetItemProvider.m"), 24, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCCFavoriteActionSetItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUCCFavoriteActionSetItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:actionSetItemStyle:", v5, -[HUCCFavoriteActionSetItemProvider actionSetItemStyle](self, "actionSetItemStyle"));

  return v6;
}

- (id)invalidationReasons
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUCCFavoriteActionSetItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308B0];
  v8[0] = *MEMORY[0x1E0D308A8];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setActionSetItems:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
