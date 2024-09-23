@implementation HUCCFavoriteServiceItemProvider

- (HUCCFavoriteServiceItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCCFavoriteServiceItemProvider.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCCFavoriteServiceItemProvider init]",
    v5);

  return 0;
}

- (HUCCFavoriteServiceItemProvider)initWithHome:(id)a3
{
  id v5;
  HUCCFavoriteServiceItemProvider *v6;
  HUCCFavoriteServiceItemProvider *v7;
  uint64_t v8;
  NSMutableSet *serviceLikeItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUCCFavoriteServiceItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    serviceLikeItems = v7->_serviceLikeItems;
    v7->_serviceLikeItems = (NSMutableSet *)v8;

    v7->_maximumNumberOfItems = -1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUCCFavoriteServiceItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
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
  -[HUCCFavoriteServiceItemProvider home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "favoriteServicesForHome:withLimit:", v4, -[HUCCFavoriteServiceItemProvider maximumNumberOfItems](self, "maximumNumberOfItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6F4D228;
  objc_copyWeak(&v14, &location);
  v7 = _Block_copy(aBlock);
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

id __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    if (objc_msgSend(v9, "hf_isMediaAccessory"))
    {
      v10 = objc_alloc(MEMORY[0x1E0D31508]);
      objc_msgSend(v9, "mediaProfile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithValueSource:mediaProfileContainer:", v6, v11);

    }
    else
    {
      if (objc_msgSend(v9, "hf_isProgrammableSwitch"))
      {
        v16 = (objc_class *)MEMORY[0x1E0D316A8];
      }
      else if (objc_msgSend(v9, "hf_isRemoteControl"))
      {
        v16 = (objc_class *)MEMORY[0x1E0D318A8];
      }
      else
      {
        v16 = (objc_class *)MEMORY[0x1E0D310A8];
      }
      v12 = (void *)objc_msgSend([v16 alloc], "initWithAccessory:valueSource:", v9, v6);
    }
  }
  else
  {
    objc_opt_class();
    v13 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(MEMORY[0x1E0D317D0], "itemClassForService:", v15)), "initWithValueSource:service:", v6, v15);
    }
    else
    {
      objc_opt_class();
      v17 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      if (v19)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317B8]), "initWithValueSource:serviceGroup:", v6, v19);
      }
      else
      {
        objc_opt_class();
        v20 = v17;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
        v22 = v21;

        if (v22)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31508]), "initWithValueSource:mediaProfileContainer:", v6, v22);
        }
        else
        {
          NSLog(CFSTR("Unsupported HomeKit object %@"), v20);
          v12 = 0;
        }

      }
    }

  }
  return v12;
}

id __46__HUCCFavoriteServiceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "serviceLikeItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "serviceLikeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidationReasons
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUCCFavoriteServiceItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308A0];
  v8[0] = *MEMORY[0x1E0D308D0];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E0D308B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)maximumNumberOfItems
{
  return self->_maximumNumberOfItems;
}

- (void)setMaximumNumberOfItems:(unint64_t)a3
{
  self->_maximumNumberOfItems = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (void)setServiceLikeItems:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLikeItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
