@implementation HFAccessoryLikeItemProvider

- (NSMutableSet)accessoryLikeItems
{
  return self->_accessoryLikeItems;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryLikeItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("accessory"));
  objc_msgSend(v3, "addObject:", CFSTR("service"));
  objc_msgSend(v3, "addObject:", CFSTR("serviceGroup"));
  objc_msgSend(v3, "addObject:", CFSTR("mediaSystem"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

uint64_t __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "filterBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "filterBlock");
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v3);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

id __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "hf_homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "buildItemForAccessoryRepresentable:", a2);
}

- (id)buildItemForAccessoryRepresentable:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFAccessoryLikeItemProvider valueSource](self, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryListUtilities accessoryRepresentableItemForAccessoryRepresentable:valueSource:](HFAccessoryListUtilities, "accessoryRepresentableItemForAccessoryRepresentable:valueSource:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[4];
  HFAccessoryLikeItemProvider *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[HFAccessoryLikeItemProvider accessoryContainer](self, "accessoryContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_accessoryLikeObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[HFAccessoryLikeItemProvider objectLevel](self, "objectLevel");
  -[HFAccessoryLikeItemProvider accessoryTypeGroups](self, "accessoryTypeGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryListUtilities accessoryRepresentableObjectsFromAccessoryLikeObjects:objectLevel:accessoryTypeGroups:](HFAccessoryListUtilities, "accessoryRepresentableObjectsFromAccessoryLikeObjects:objectLevel:accessoryTypeGroups:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    -[HFAccessoryLikeItemProvider accessoryContainer](self, "accessoryContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F0444708))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "hf_demoModeAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x20uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = self;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "%@: including demo mode accessories: %@", buf, 0x16u);
    }

    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }
  -[HFAccessoryLikeItemProvider accessoryContainerFilter](self, "accessoryContainerFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HFAccessoryLikeItemProvider accessoryContainerFilter](self, "accessoryContainerFilter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filterAccessoryRepresentableObjects:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v18;
  }
  v19 = MEMORY[0x1E0C809B0];
  v24[4] = self;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_3;
  v25[3] = &unk_1EA72B188;
  v25[4] = self;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_4;
  v24[3] = &unk_1EA73FC28;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v7, &__block_literal_global_226, &__block_literal_global_50_9, v25, v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_5;
  v23[3] = &unk_1EA72C438;
  v23[4] = self;
  objc_msgSend(v20, "flatMap:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (unint64_t)objectLevel
{
  return self->_objectLevel;
}

- (NSArray)accessoryTypeGroups
{
  return self->_accessoryTypeGroups;
}

- (HFAccessoryLikeObjectContainer)accessoryContainer
{
  return self->_accessoryContainer;
}

- (HFAccessoryRepresentableObjectFiltering)accessoryContainerFilter
{
  return self->_accessoryContainerFilter;
}

id __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "accessoryLikeItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "accessoryLikeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setFilterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setObjectLevel:(unint64_t)a3
{
  self->_objectLevel = a3;
}

- (HFAccessoryLikeItemProvider)initWithAccessoryContainer:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  HFAccessoryLikeItemProvider *v9;
  uint64_t v10;
  NSMutableSet *accessoryLikeItems;
  uint64_t v12;
  HFCharacteristicValueSource *valueSource;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFAccessoryLikeItemProvider;
  v9 = -[HFItemProvider init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryLikeItems = v9->_accessoryLikeItems;
    v9->_accessoryLikeItems = (NSMutableSet *)v10;

    objc_storeStrong((id *)&v9->_accessoryContainer, a3);
    objc_storeStrong((id *)&v9->_home, a4);
    objc_msgSend(v8, "hf_characteristicValueManager");
    v12 = objc_claimAutoreleasedReturnValue();
    valueSource = v9->_valueSource;
    v9->_valueSource = (HFCharacteristicValueSource *)v12;

  }
  return v9;
}

- (void)setAccessoryTypeGroups:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryTypeGroups, a3);
}

- (HFAccessoryLikeItemProvider)initWithHome:(id)a3
{
  return -[HFAccessoryLikeItemProvider initWithAccessoryContainer:inHome:](self, "initWithAccessoryContainer:inHome:", a3, a3);
}

- (HFAccessoryLikeItemProvider)initWithRoom:(id)a3
{
  id v4;
  void *v5;
  HFAccessoryLikeItemProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFAccessoryLikeItemProvider initWithAccessoryContainer:inHome:](self, "initWithAccessoryContainer:inHome:", v4, v5);

  return v6;
}

id __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "accessoryRepresentableObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setAccessoryContainerFilter:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryContainerFilter, a3);
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (void)setAccessoryLikeItems:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLikeItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryLikeItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessoryTypeGroups, 0);
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_accessoryContainerFilter, 0);
  objc_storeStrong((id *)&self->_accessoryContainer, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
