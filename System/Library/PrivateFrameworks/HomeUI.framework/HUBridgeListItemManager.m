@implementation HUBridgeListItemManager

- (HUBridgeListItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HUBridgeListItemManager *v10;
  HUBridgeListItemManager *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUBridgeListItemManager.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HUBridgeListItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, v9, 0);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_overrideHome, a3);

  return v11;
}

- (HUBridgeListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUBridgeListItemManager.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUBridgeListItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (BOOL)isBridgeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUBridgeListItemManager bridgeItemProvider](self, "bridgeItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (BOOL)isResidentDeviceItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUBridgeListItemManager residentDeviceItemProvider](self, "residentDeviceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)bridgeItemForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUBridgeListItemManager bridgeItemProvider](self, "bridgeItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HUBridgeListItemManager_bridgeItemForAccessory___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __50__HUBridgeListItemManager_bridgeItemForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D316E8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithHome:", v5);
  -[HUBridgeListItemManager setResidentDeviceItemProvider:](self, "setResidentDeviceItemProvider:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311C0]), "initWithHome:", v5);
  -[HUBridgeListItemManager setBridgeItemProvider:](self, "setBridgeItemProvider:", v7);

  -[HUBridgeListItemManager residentDeviceItemProvider](self, "residentDeviceItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  -[HUBridgeListItemManager bridgeItemProvider](self, "bridgeItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUBridgeAndResidentDeviceHubSectionIdentifier"));
  -[HUBridgeListItemManager residentDeviceItemProvider](self, "residentDeviceItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "residentDeviceItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:filteringToDisplayedItems:", v11, v4);

  _HULocalizedStringWithDefaultValue(CFSTR("HUBridgeAndResidentListHomeHubSectionTitle"), CFSTR("HUBridgeAndResidentListHomeHubSectionTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v12);

  _HULocalizedStringWithDefaultValue(CFSTR("HUBridgeAndResidentListHomeHubSectionFooter"), CFSTR("HUBridgeAndResidentListHomeHubSectionFooter"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFooterTitle:", v13);

  objc_msgSend(v5, "addObject:", v6);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUBridgeAndResidentDeviceBridgeSectionIdentifier"));
  -[HUBridgeListItemManager bridgeItemProvider](self, "bridgeItemProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItemsUsingDefaultSortComparator:", v16);

  _HULocalizedStringWithDefaultValue(CFSTR("HUBridgeAndResidentListBridgesSectionTitle"), CFSTR("HUBridgeAndResidentListBridgesSectionTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHeaderTitle:", v17);

  objc_msgSend(v5, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUBridgeListItemManager;
  v3 = -[HFItemManager _itemsToHideInSet:](&v5, sel__itemsToHideInSet_, a3);
  return 0;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUBridgeListItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)residentDeviceItemComparator
{
  return &__block_literal_global_294;
}

uint64_t __55__HUBridgeListItemManager_residentDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v4;
  if (!v7)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_7:
    v9 = 0;
  }

  objc_msgSend(v9, "residentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "status");

  if ((v13 & 2) != 0)
  {
    v23 = -1;
    goto LABEL_21;
  }
  v14 = objc_opt_class();
  v15 = v5;
  if (v15)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v15;
    if (v16)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v14, objc_opt_class());

  }
  v17 = 0;
LABEL_16:

  objc_msgSend(v17, "residentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "status");

  if ((v21 & 2) != 0)
  {
    v23 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v22 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v23 = ((uint64_t (**)(_QWORD, id, id))v22)[2](v22, v7, v15);

  }
LABEL_21:

  return v23;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFBridgeItemProvider)bridgeItemProvider
{
  return self->_bridgeItemProvider;
}

- (void)setBridgeItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeItemProvider, a3);
}

- (HFResidentDeviceItemProvider)residentDeviceItemProvider
{
  return self->_residentDeviceItemProvider;
}

- (void)setResidentDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_residentDeviceItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_bridgeItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
}

@end
