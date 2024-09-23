@implementation HFCameraItemProvider

- (NSMutableSet)cameraItems
{
  return self->_cameraItems;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFCameraItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("service");
  v7[1] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HFCameraItem *__35__HFCameraItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  HFCameraItem *v5;
  void *v6;
  void *v7;
  HFCameraItem *v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = [HFCameraItem alloc];
  objc_msgSend(WeakRetained, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_characteristicValueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFAccessoryProfileItem initWithProfile:valueSource:](v5, "initWithProfile:valueSource:", v3, v7);

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD aBlock[4];
  id v25;
  id location;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFCameraItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v25, &location);
  v4 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HFCameraItemProvider home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "cameraProfiles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v8);
  }

  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __35__HFCameraItemProvider_reloadItems__block_invoke_2;
  v19[3] = &unk_1EA72E998;
  v19[4] = self;
  objc_msgSend(v5, "na_filter:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraItemProvider filter](self, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v12, v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __35__HFCameraItemProvider_reloadItems__block_invoke_3;
  v17[3] = &unk_1EA726E30;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v14, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  return v15;
}

- (id)filter
{
  return self->_filter;
}

uint64_t __35__HFCameraItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unsigned int (**v4)(_QWORD, _QWORD);
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_roomFilter");
  v4 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, id))v4)[2](v4, v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "_showInHomeDashboardFilter");
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __50__HFCameraItemProvider__showInHomeDashboardFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "onlyShowsFavorites"))
    v4 = objc_msgSend(v3, "hf_effectiveShowInHomeDashboard");
  else
    v4 = 1;

  return v4;
}

uint64_t __35__HFCameraItemProvider__roomFilter__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (!v2)
    return 1;
  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "isEqual:", v5);

  return v6;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (id)_showInHomeDashboardFilter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HFCameraItemProvider__showInHomeDashboardFilter__block_invoke;
  aBlock[3] = &unk_1EA72B160;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_roomFilter
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  -[HFCameraItemProvider room](self, "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFCameraItemProvider__roomFilter__block_invoke;
  aBlock[3] = &unk_1EA72E998;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (HMRoom)room
{
  return self->_room;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFCameraItemProvider)initWithHome:(id)a3
{
  id v5;
  HFCameraItemProvider *v6;
  HFCameraItemProvider *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFCameraItemProvider;
  v6 = -[HFItemProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraItemProvider setCameraItems:](v7, "setCameraItems:", v8);

  }
  return v7;
}

- (void)setCameraItems:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItems, a3);
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->_room, a3);
}

id __35__HFCameraItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "cameraItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "cameraItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HFCameraItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraItemProvider.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCameraItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFCameraItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)_favoriteFilter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__HFCameraItemProvider__favoriteFilter__block_invoke;
  aBlock[3] = &unk_1EA72B138;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

uint64_t __39__HFCameraItemProvider__favoriteFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "onlyShowsFavorites"))
    v4 = objc_msgSend(v3, "hf_effectiveIsFavorite");
  else
    v4 = 1;

  return v4;
}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  self->_onlyShowsFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraItems, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
