@implementation HFAccessoryCategoryStatusItemProvider

+ (id)_categoryStatusItemClasses
{
  id v2;
  void *v3;

  if (_MergedGlobals_2_5 != -1)
    dispatch_once(&_MergedGlobals_2_5, &__block_literal_global_2_32);
  v2 = (id)qword_1ED378A38;
  objc_msgSend(v2, "arrayByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __84__HFAccessoryCategoryStatusItemProvider__createStatusItemsForHome_room_valueSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildStatusItemWithClass:home:room:valueSource:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)_buildStatusItemWithClass:(Class)a3 home:(id)a4 room:(id)a5 valueSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend([a3 alloc], "initWithHome:room:valueSource:", v12, v11, v10);

  objc_opt_class();
  v14 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
    -[HFAccessoryCategoryStatusItemProvider _buildStatusItemsForGroupedStatusItem:](self, "_buildStatusItemsForGroupedStatusItem:", v16);

  return v14;
}

- (HFAccessoryCategoryStatusItemProvider)initWithHome:(id)a3 room:(id)a4
{
  return -[HFAccessoryCategoryStatusItemProvider initWithHome:room:overrideValueSource:](self, "initWithHome:room:overrideValueSource:", a3, a4, 0);
}

- (HFAccessoryCategoryStatusItemProvider)initWithHome:(id)a3 room:(id)a4 overrideValueSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HFAccessoryCategoryStatusItemProvider *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "hf_characteristicValueManager");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  -[HFAccessoryCategoryStatusItemProvider _createStatusItemsForHome:room:valueSource:](self, "_createStatusItemsForHome:room:valueSource:", v9, v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)HFAccessoryCategoryStatusItemProvider;
  v17 = -[HFStaticItemProvider initWithItems:](&v19, sel_initWithItems_, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a3);
    objc_storeStrong((id *)&v17->_room, a4);
    objc_storeStrong((id *)&v17->_valueSource, v14);
  }

  return v17;
}

- (id)_createStatusItemsForHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "_categoryStatusItemClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HFAccessoryCategoryStatusItemProvider__createStatusItemsForHome_room_valueSource___block_invoke;
  v17[3] = &unk_1EA73CDD0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "na_map:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __67__HFAccessoryCategoryStatusItemProvider__categoryStatusItemClasses__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378A38;
  qword_1ED378A38 = v0;

}

- (HFAccessoryCategoryStatusItemProvider)initWithItems:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_room_overrideValueSource_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryCategoryStatusItemProvider.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryCategoryStatusItemProvider initWithItems:]",
    v6);

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
  -[HFAccessoryCategoryStatusItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryCategoryStatusItemProvider room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryCategoryStatusItemProvider valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHome:room:valueSource:", v5, v6, v7);

  return v8;
}

- (void)_buildStatusItemsForGroupedStatusItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "statusItemClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HFAccessoryCategoryStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke;
  v7[3] = &unk_1EA731CE0;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "na_each:", v7);

}

void __79__HFAccessoryCategoryStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_buildStatusItemWithClass:home:room:valueSource:", a2, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addItem:", v8);
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFAccessoryCategoryStatusItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("user"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
