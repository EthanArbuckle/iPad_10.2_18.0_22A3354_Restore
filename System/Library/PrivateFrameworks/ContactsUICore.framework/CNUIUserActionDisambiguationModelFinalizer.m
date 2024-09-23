@implementation CNUIUserActionDisambiguationModelFinalizer

BOOL __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") == 1;
}

uint64_t __82__CNUIUserActionDisambiguationModelFinalizer_removeDefaultActionFromListOfActions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

+ (id)modelWithDefaultAction:(id)a3 actions:(id)a4 recentActions:(id)a5 directoryServiceActions:(id)a6 foundOnDeviceActions:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CNUIUserActionDisambiguationModelFinalizer *v16;
  void *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[CNUIUserActionDisambiguationModelFinalizer initWithDefaultAction:actions:recentActions:directoryServiceActions:foundOnDeviceActions:]([CNUIUserActionDisambiguationModelFinalizer alloc], "initWithDefaultAction:actions:recentActions:directoryServiceActions:foundOnDeviceActions:", v15, v14, v13, v12, v11);

  -[CNUIUserActionDisambiguationModelFinalizer model](v16, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)model
{
  CNUIUserActionListModel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNUIUserActionListModel *v8;

  -[CNUIUserActionDisambiguationModelFinalizer removeUninterestingItentActions](self, "removeUninterestingItentActions");
  -[CNUIUserActionDisambiguationModelFinalizer removeDiscoveredActionsAlreadyCurated](self, "removeDiscoveredActionsAlreadyCurated");
  -[CNUIUserActionDisambiguationModelFinalizer removeDuplicateIntentActionsFromSameProvider](self, "removeDuplicateIntentActionsFromSameProvider");
  -[CNUIUserActionDisambiguationModelFinalizer promoteLoneManagedCallProviderActionToBeDefault](self, "promoteLoneManagedCallProviderActionToBeDefault");
  -[CNUIUserActionDisambiguationModelFinalizer promoteLoneActionToBeDefault](self, "promoteLoneActionToBeDefault");
  -[CNUIUserActionDisambiguationModelFinalizer removeDefaultActionFromListOfActions](self, "removeDefaultActionFromListOfActions");
  v3 = [CNUIUserActionListModel alloc];
  -[CNUIUserActionDisambiguationModelFinalizer defaultAction](self, "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModelFinalizer directoryServiceActions](self, "directoryServiceActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModelFinalizer foundOnDeviceActions](self, "foundOnDeviceActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNUIUserActionListModel initWithDefaultAction:actions:directoryServiceActions:foundOnDeviceActions:](v3, "initWithDefaultAction:actions:directoryServiceActions:foundOnDeviceActions:", v4, v5, v6, v7);

  return v8;
}

- (NSArray)foundOnDeviceActions
{
  return self->_foundOnDeviceActions;
}

- (NSArray)directoryServiceActions
{
  return self->_directoryServiceActions;
}

- (void)removeUninterestingItentActions
{
  void *v3;
  _QWORD v4[5];

  -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__CNUIUserActionDisambiguationModelFinalizer_removeUninterestingItentActions__block_invoke;
  v4[3] = &unk_1EA6039B0;
  v4[4] = self;
  objc_msgSend(v3, "_cn_removeObjectsPassingTest:", v4);

}

- (void)removeDuplicateIntentActionsFromSameProvider
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_groupBy:", &__block_literal_global_3_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_cn_all:", &__block_literal_global_6);

  if ((v6 & 1) == 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "hash"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_3;
    v17[3] = &unk_1EA603A38;
    v18 = v4;
    objc_msgSend(v14, "_cn_flatMap:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setArray:", v15);

  }
}

- (void)removeDiscoveredActionsAlreadyCurated
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_14);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_2;
    v6[3] = &unk_1EA6039B0;
    v7 = v5;
    objc_msgSend(v4, "_cn_removeObjectsPassingTest:", v6);

  }
}

- (void)removeDefaultActionFromListOfActions
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CNUIUserActionDisambiguationModelFinalizer defaultAction](self, "defaultAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__CNUIUserActionDisambiguationModelFinalizer_removeDefaultActionFromListOfActions__block_invoke;
    v5[3] = &unk_1EA6039B0;
    v5[4] = self;
    objc_msgSend(v4, "_cn_removeObjectsPassingTest:", v5);

  }
}

- (void)promoteLoneManagedCallProviderActionToBeDefault
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNUIUserActionDisambiguationModelFinalizer defaultAction](self, "defaultAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cn_filter:", &__block_literal_global_11);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIUserActionDisambiguationModelFinalizer setDefaultAction:](self, "setDefaultAction:", v5);

    }
  }
}

- (CNUIUserActionItem)defaultAction
{
  return self->_defaultAction;
}

- (void)promoteLoneActionToBeDefault
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  -[CNUIUserActionDisambiguationModelFinalizer defaultAction](self, "defaultAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
    {
      v6 = *MEMORY[0x1E0D137F8];
      -[CNUIUserActionDisambiguationModelFinalizer directoryServiceActions](self, "directoryServiceActions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      if (v8)
      {
        -[CNUIUserActionDisambiguationModelFinalizer foundOnDeviceActions](self, "foundOnDeviceActions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9);

        if (v10)
        {
          -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "shouldPromoteLoneActionToBeDefault");

          if (v13)
          {
            -[CNUIUserActionDisambiguationModelFinalizer actions](self, "actions");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUIUserActionDisambiguationModelFinalizer setDefaultAction:](self, "setDefaultAction:", v14);

          }
        }
      }
    }
  }
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (CNUIUserActionDisambiguationModelFinalizer)initWithDefaultAction:(id)a3 actions:(id)a4 recentActions:(id)a5 directoryServiceActions:(id)a6 foundOnDeviceActions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CNUIUserActionDisambiguationModelFinalizer *v18;
  CNUIUserActionDisambiguationModelFinalizer *v19;
  uint64_t v20;
  NSMutableArray *actions;
  CNUIUserActionDisambiguationModelFinalizer *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CNUIUserActionDisambiguationModelFinalizer;
  v18 = -[CNUIUserActionDisambiguationModelFinalizer init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_defaultAction, a3);
    v20 = objc_msgSend(v14, "mutableCopy");
    actions = v19->_actions;
    v19->_actions = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v19->_recentActions, a5);
    objc_storeStrong((id *)&v19->_directoryServiceActions, a6);
    objc_storeStrong((id *)&v19->_foundOnDeviceActions, a7);
    v22 = v19;
  }

  return v19;
}

uint64_t __77__CNUIUserActionDisambiguationModelFinalizer_removeUninterestingItentActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "options") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "recentActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v3) ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

uint64_t __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

BOOL __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "group") == 7;
}

BOOL __93__CNUIUserActionDisambiguationModelFinalizer_promoteLoneManagedCallProviderActionToBeDefault__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "group") == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundOnDeviceActions, 0);
  objc_storeStrong((id *)&self->_directoryServiceActions, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
}

uint64_t __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "group") == 8 || objc_msgSend(v3, "group") == 9)
  {
    v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_3;
    v7[3] = &unk_1EA6039B0;
    v8 = v3;
    v5 = objc_msgSend(v4, "_cn_any:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2 | v2)
    return objc_msgSend((id)v2, "isEqual:", a2);
  else
    return 1;
}

id __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_filter:", &__block_literal_global_8_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v5 = (void **)v9;
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    v5 = &v8;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_4(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "options") & 0x10) == 0;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSArray)recentActions
{
  return self->_recentActions;
}

- (void)setRecentActions:(id)a3
{
  objc_storeStrong((id *)&self->_recentActions, a3);
}

- (void)setDirectoryServiceActions:(id)a3
{
  objc_storeStrong((id *)&self->_directoryServiceActions, a3);
}

- (void)setFoundOnDeviceActions:(id)a3
{
  objc_storeStrong((id *)&self->_foundOnDeviceActions, a3);
}

@end
