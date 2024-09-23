@implementation HUAccessorySceneListContentItem

- (HUAccessorySceneListContentItem)initWithContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  HUAccessorySceneListContentItem *v11;
  HUAccessorySceneListContentItem *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySceneListContentItem;
  v11 = -[HUAccessorySceneListContentItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_contentSource = a3;
    objc_storeStrong((id *)&v11->_serviceLikeItem, a4);
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[HUAccessorySceneListContentItem contentSource](self, "contentSource", a3);
  -[HUAccessorySceneListContentItem serviceLikeItem](self, "serviceLikeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySceneListContentItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessorySceneListContentItemManager computeNumberOfItemsToDisplayForContentSource:serviceLikeItem:home:](HUAccessorySceneListContentItemManager, "computeNumberOfItemsToDisplayForContentSource:serviceLikeItem:home:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "flatMap:", &__block_literal_global_211);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __63__HUAccessorySceneListContentItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0D31578];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30B78]);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(v6, "numberWithInt:", v7 == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)contentSource
{
  return self->_contentSource;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
}

@end
