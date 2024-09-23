@implementation HUNaturalLightingItemProvider

- (HUNaturalLightingItemProvider)initWithHome:(id)a3
{
  id v5;
  HUNaturalLightingItemProvider *v6;
  HUNaturalLightingItemProvider *v7;
  uint64_t v8;
  NSMutableSet *naturalLightingItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNaturalLightingItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    naturalLightingItems = v7->_naturalLightingItems;
    v7->_naturalLightingItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  -[HUNaturalLightingItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_homeKitObjectsSupportingNaturalLighting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HUNaturalLightingItemProvider_reloadItems__block_invoke;
  v12[3] = &unk_1E6F4D8E8;
  v12[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__HUNaturalLightingItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1E6F53E48;
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, v12, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __44__HUNaturalLightingItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_1E6F4D2A0;
  v10[4] = self;
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __44__HUNaturalLightingItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "homeKitObjectFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeKitObjectFilter");
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v3);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

HUNaturalLightingItem *__44__HUNaturalLightingItemProvider_reloadItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  HUNaturalLightingItem *v4;
  void *v5;
  HUNaturalLightingItem *v6;

  objc_msgSend(*(id *)(a1 + 32), "sourceItemForHomeKitObject:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [HUNaturalLightingItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "defaultSelectedValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUNaturalLightingItem initWithSourceItem:defaultSelected:](v4, "initWithSourceItem:defaultSelected:", v3, objc_msgSend(v5, "BOOLValue"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __44__HUNaturalLightingItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "naturalLightingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "naturalLightingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sourceItemForHomeKitObject:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D315E8]);
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D317D0], "serviceItemForService:valueSource:", v7, v4);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v10)
    {
      v12 = 0;
      goto LABEL_12;
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D310A8]), "initWithAccessory:valueSource:", v10, v4);
  }
  v12 = (void *)v11;
LABEL_12:

  return v12;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUNaturalLightingItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *MEMORY[0x1E0D308D0];
  v8[0] = *MEMORY[0x1E0D308D8];
  v8[1] = v4;
  v8[2] = *MEMORY[0x1E0D308A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (id)lightProfileFilter
{
  return self->_lightProfileFilter;
}

- (void)setLightProfileFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)homeKitObjectFilter
{
  return self->_homeKitObjectFilter;
}

- (void)setHomeKitObjectFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)defaultSelectedValue
{
  return self->_defaultSelectedValue;
}

- (void)setDefaultSelectedValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSelectedValue, a3);
}

- (NSMutableSet)naturalLightingItems
{
  return self->_naturalLightingItems;
}

- (void)setNaturalLightingItems:(id)a3
{
  objc_storeStrong((id *)&self->_naturalLightingItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_naturalLightingItems, 0);
  objc_storeStrong((id *)&self->_defaultSelectedValue, 0);
  objc_storeStrong(&self->_homeKitObjectFilter, 0);
  objc_storeStrong(&self->_lightProfileFilter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
