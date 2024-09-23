@implementation HFCameraListItem

- (HFCameraListItem)initWithHome:(id)a3 room:(id)a4
{
  id v7;
  id v8;
  HFCameraListItem *v9;
  HFCameraListItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCameraListItem;
  v9 = -[HFCameraListItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_room, a4);
  }

  return v10;
}

- (HFCameraListItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_room_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraListItem.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCameraListItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  HFCameraItemProvider *v5;
  void *v6;
  HFCameraItemProvider *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v5 = [HFCameraItemProvider alloc];
  -[HFCameraListItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFCameraItemProvider initWithHome:](v5, "initWithHome:", v6);

  -[HFCameraListItem room](self, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraItemProvider setRoom:](v7, "setRoom:", v8);

  -[HFCameraItemProvider setOnlyShowsFavorites:](v7, "setOnlyShowsFavorites:", -[HFCameraListItem onlyShowsFavorites](self, "onlyShowsFavorites"));
  -[HFCameraItemProvider reloadItems](v7, "reloadItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__HFCameraListItem__subclass_updateWithOptions___block_invoke;
  v20[3] = &unk_1EA726968;
  v11 = v4;
  v21 = v11;
  v12 = (id)objc_msgSend(v9, "addFailureBlock:", v20);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __48__HFCameraListItem__subclass_updateWithOptions___block_invoke_2;
  v18[3] = &unk_1EA731870;
  v18[4] = self;
  v13 = v11;
  v19 = v13;
  v14 = (id)objc_msgSend(v9, "addSuccessBlock:", v18);
  v15 = v19;
  v16 = v13;

  return v16;
}

uint64_t __48__HFCameraListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __48__HFCameraListItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCameraListTitle"), CFSTR("HFCameraListTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

    objc_msgSend(v19, "addedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_80);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v10);

    }
  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hf_shouldBlockCurrentUserFromHome");

  if (v12)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  objc_msgSend(*(id *)(a1 + 32), "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  objc_msgSend(*(id *)(a1 + 32), "room");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "room");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("dependentHomeKitClasses"));

  v17 = *(void **)(a1 + 40);
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finishWithResult:", v18);

}

id __48__HFCameraListItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  self->_onlyShowsFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
