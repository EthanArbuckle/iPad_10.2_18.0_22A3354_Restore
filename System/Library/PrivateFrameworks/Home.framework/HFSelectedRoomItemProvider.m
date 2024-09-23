@implementation HFSelectedRoomItemProvider

- (HFSelectedRoomItemProvider)initWithHome:(id)a3 serviceLikeBuilder:(id)a4
{
  id v7;
  id v8;
  HFSelectedRoomItemProvider *v9;
  HFSelectedRoomItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSelectedRoomItemProvider;
  v9 = -[HFItemProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_serviceLikeBuilder, a4);
  }

  return v10;
}

- (HFSelectedRoomItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_serviceLikeBuilder_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSelectedRoomItemProvider.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSelectedRoomItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFSelectedRoomItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSelectedRoomItemProvider serviceLikeBuilder](self, "serviceLikeBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:serviceLikeBuilder:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int (**v8)(_QWORD, _QWORD);
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  HFRoomBuilderItem *v16;
  HFItemProviderReloadResults *v17;
  void *v18;

  -[HFSelectedRoomItemProvider roomBuilderItem](self, "roomBuilderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roomBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSelectedRoomItemProvider serviceLikeBuilder](self, "serviceLikeBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFSelectedRoomItemProvider filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFSelectedRoomItemProvider filter](self, "filter");
    v8 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (((unsigned int (**)(_QWORD, void *))v8)[2](v8, v6))
      v9 = v6;
    else
      v9 = 0;
    v10 = v9;

    v6 = v10;
  }
  if (v4 == v6)
    v11 = objc_msgSend(v4, "isEqual:", v4) ^ 1;
  else
    v11 = 1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v15 = v11;
  else
    v15 = 1;
  if (v6 && v15)
  {
    v16 = -[HFRoomBuilderItem initWithRoomBuilder:]([HFRoomBuilderItem alloc], "initWithRoomBuilder:", v6);
    objc_msgSend(v12, "addObject:", v16);
    -[HFSelectedRoomItemProvider setRoomBuilderItem:](self, "setRoomBuilderItem:", v16);

  }
  if (v3 && ((v11 ^ 1) & 1) == 0)
    objc_msgSend(v14, "addObject:", v3);
  if ((v15 & 1) == 0)
    objc_msgSend(v13, "addObject:", v3);
  v17 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", v12, v14, v13);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)items
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFSelectedRoomItemProvider roomBuilderItem](self, "roomBuilderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFSelectedRoomItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("room"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeBuilder)serviceLikeBuilder
{
  return self->_serviceLikeBuilder;
}

- (void)setServiceLikeBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLikeBuilder, a3);
}

- (HFRoomBuilderItem)roomBuilderItem
{
  return self->_roomBuilderItem;
}

- (void)setRoomBuilderItem:(id)a3
{
  objc_storeStrong((id *)&self->_roomBuilderItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilderItem, 0);
  objc_storeStrong((id *)&self->_serviceLikeBuilder, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
