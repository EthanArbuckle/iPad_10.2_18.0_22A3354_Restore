@implementation HUAccessorySceneListItemManager

- (HUAccessorySceneListItemManager)initWithDelegate:(id)a3 serviceLikeItem:(id)a4
{
  id v7;
  HUAccessorySceneListItemManager *v8;
  HUAccessorySceneListItemManager *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAccessorySceneListItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_serviceLikeItem, a4);

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  HUAccessorySceneListContentItem *v5;
  void *v6;
  HFItem *v7;
  HFItem *existingScenesContentItem;
  HUAccessorySceneListContentItem *v9;
  void *v10;
  HFItem *v11;
  HFItem *suggestedScenesContentItem;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUAccessorySceneListContentItem alloc];
  -[HUAccessorySceneListItemManager serviceLikeItem](self, "serviceLikeItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUAccessorySceneListContentItem initWithContentSource:serviceLikeItem:home:](v5, "initWithContentSource:serviceLikeItem:home:", 0, v6, v4);
  existingScenesContentItem = self->_existingScenesContentItem;
  self->_existingScenesContentItem = v7;

  v9 = [HUAccessorySceneListContentItem alloc];
  -[HUAccessorySceneListItemManager serviceLikeItem](self, "serviceLikeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUAccessorySceneListContentItem initWithContentSource:serviceLikeItem:home:](v9, "initWithContentSource:serviceLikeItem:home:", 1, v10, v4);

  suggestedScenesContentItem = self->_suggestedScenesContentItem;
  self->_suggestedScenesContentItem = v11;

  -[HUAccessorySceneListItemManager existingScenesContentItem](self, "existingScenesContentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  -[HUAccessorySceneListItemManager suggestedScenesContentItem](self, "suggestedScenesContentItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithItems:", v17);
  v21 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
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
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUAccessorySceneListItemManager existingScenesContentItem](self, "existingScenesContentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("existingScenes"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySceneListIncludedScenesHeaderTitle"), CFSTR("HUAccessorySceneListIncludedScenesHeaderTitle"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHeaderTitle:", v9);

    -[HUAccessorySceneListItemManager existingScenesContentItem](self, "existingScenesContentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v11);

    objc_msgSend(v5, "addObject:", v8);
  }
  -[HUAccessorySceneListItemManager suggestedScenesContentItem](self, "suggestedScenesContentItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "containsObject:", v12);

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("suggestedScenes"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySceneListSuggestedScenesHeaderTitle"), CFSTR("HUAccessorySceneListSuggestedScenesHeaderTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHeaderTitle:", v15);

    -[HUAccessorySceneListItemManager suggestedScenesContentItem](self, "suggestedScenesContentItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setItems:", v17);

    objc_msgSend(v5, "addObject:", v14);
  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (HFItem)existingScenesContentItem
{
  return self->_existingScenesContentItem;
}

- (HFItem)suggestedScenesContentItem
{
  return self->_suggestedScenesContentItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedScenesContentItem, 0);
  objc_storeStrong((id *)&self->_existingScenesContentItem, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
}

@end
