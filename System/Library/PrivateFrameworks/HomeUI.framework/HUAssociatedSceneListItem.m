@implementation HUAssociatedSceneListItem

- (HUAssociatedSceneListItem)initWithHome:(id)a3 serviceLikeItem:(id)a4 context:(unint64_t)a5
{
  id v9;
  id v10;
  HUAssociatedSceneListItem *v11;
  HUAssociatedSceneListItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUAssociatedSceneListItem;
  v11 = -[HUAssociatedSceneListItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    objc_storeStrong((id *)&v12->_serviceLikeItem, a4);
    v12->_context = a5;
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0D519C0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_1E6F4CD58;
  v11[4] = self;
  objc_msgSend(&unk_1E70429F0, "na_map:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke_2;
  v10[3] = &unk_1E6F4CD30;
  v10[4] = self;
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 32), "serviceLikeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessorySceneListContentItemManager computeNumberOfItemsToDisplayForContentSource:serviceLikeItem:home:](HUAccessorySceneListContentItemManager, "computeNumberOfItemsToDisplayForContentSource:serviceLikeItem:home:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  const __CFString *v16;
  _QWORD *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = objc_alloc_init(MEMORY[0x1E0D31578]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30B78]);

  if (v5)
    v11 = v8 == 0;
  else
    v11 = 1;
  v12 = v11;
  v13 = v11 && v7 == 0;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hf_currentUserIsRestrictedGuest");

    if (((v15 | v13) & 1) != 0)
    {
LABEL_12:
      v16 = (const __CFString *)MEMORY[0x1E0C9AAB0];
      v17 = (_QWORD *)MEMORY[0x1E0D30D70];
      goto LABEL_21;
    }
  }
  else if (v13)
  {
    goto LABEL_12;
  }
  if (v12)
    v18 = CFSTR("HUAssociatedSceneItemTitleSuggestedScenes");
  else
    v18 = CFSTR("HUAssociatedSceneItemTitleIncludedScenes");
  if (v12)
    v19 = v7;
  else
    v19 = v5;
  _HULocalizedStringWithDefaultValue(v18, v18, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30BF8]);

  v16 = CFSTR("AccessoryDetails.SuggestedScenes");
  v17 = (_QWORD *)MEMORY[0x1E0D30BA0];
LABEL_21:
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, *v17);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
}

@end
