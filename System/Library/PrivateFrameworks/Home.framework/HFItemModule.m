@implementation HFItemModule

uint64_t __24__HFItemModule_allItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

uint64_t __29__HFItemModule_containsItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __45__HFItemModule_updateModuleIdentifierInItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "moduleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModuleIdentifier:", v4);

}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (NSSet)allItems
{
  void *v2;
  void *v3;

  -[HFItemModule itemProviders](self, "itemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_159);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)containsItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFItemModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__HFItemModule_containsItem___block_invoke;
  v9[3] = &unk_1EA72C350;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (NSSet)itemProviders
{
  NSSet *itemProviders;
  NSSet *v5;
  NSSet *v6;
  NSSet *v7;
  void *v9;
  objc_class *v10;
  void *v11;

  itemProviders = self->_itemProviders;
  if (itemProviders
    || (-[HFItemModule buildItemProviders](self, "buildItemProviders"),
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue(),
        v6 = self->_itemProviders,
        self->_itemProviders = v5,
        v6,
        (itemProviders = self->_itemProviders) != 0))
  {
    v7 = itemProviders;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemModule.m"), 47, CFSTR("%@ must either override itemProviders or buildItemProviders, but does not"), v11);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)setReorderableHomeKitItemList:(id)a3
{
  id v4;

  v4 = a3;
  if (-[HFItemModule supportsReordering](self, "supportsReordering"))
    -[HFItemModule setClientReorderableHomeKitItemList:](self, "setClientReorderableHomeKitItemList:", v4);

}

- (void)setClientReorderableHomeKitItemList:(id)a3
{
  objc_storeStrong((id *)&self->_clientReorderableHomeKitItemList, a3);
}

- (id)_itemComparator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFItemModule reorderableHomeKitItemList](self, "reorderableHomeKitItemList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedHomeKitItemComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = _Block_copy(v3);
  }
  else
  {
    +[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v6);

  }
  return v5;
}

- (HFReorderableHomeKitItemList)reorderableHomeKitItemList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[HFItemModule supportsReordering](self, "supportsReordering"))
  {
    -[HFItemModule clientReorderableHomeKitItemList](self, "clientReorderableHomeKitItemList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HFItemModule clientReorderableHomeKitItemList](self, "clientReorderableHomeKitItemList");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFItemModule itemUpdater](self, "itemUpdater");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "latestResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemModule _reorderableHomeKitItemListKey](self, "_reorderableHomeKitItemListKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return (HFReorderableHomeKitItemList *)v4;
}

- (BOOL)supportsReordering
{
  void *v2;
  BOOL v3;

  -[HFItemModule _reorderableHomeKitItemListKey](self, "_reorderableHomeKitItemListKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (HFItemUpdating)itemUpdater
{
  return (HFItemUpdating *)objc_loadWeakRetained((id *)&self->_itemUpdater);
}

- (HFReorderableHomeKitItemList)clientReorderableHomeKitItemList
{
  return self->_clientReorderableHomeKitItemList;
}

- (id)_reorderableHomeKitItemListKey
{
  return 0;
}

- (void)updateModuleIdentifierInItems
{
  void *v3;
  _QWORD v4[5];

  -[HFItemModule allItems](self, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HFItemModule_updateModuleIdentifierInItems__block_invoke;
  v4[3] = &unk_1EA730AE8;
  v4[4] = self;
  objc_msgSend(v3, "na_each:", v4);

}

- (HFItemModule)initWithItemUpdater:(id)a3
{
  id v4;
  HFItemModule *v5;
  HFItemModule *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  NSString *moduleIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFItemModule;
  v5 = -[HFItemModule init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemUpdater, v4);
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%p"), v9, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    moduleIdentifier = v6->_moduleIdentifier;
    v6->_moduleIdentifier = (NSString *)v10;

  }
  return v6;
}

- (HFItemModule)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemModule.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFItemModule init]",
    v5);

  return 0;
}

- (id)buildItemProviders
{
  return 0;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemModule.m"), 58, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFItemModule buildSectionsWithDisplayedItems:]", objc_opt_class());

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFItemModule allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HFItemModule_matchingItemForHomeKitObject___block_invoke;
  v9[3] = &unk_1EA7295B8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __45__HFItemModule_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F0850))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reset
{
  NSSet *v3;
  NSSet *itemProviders;

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v3;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableHomeKitItemList, 0);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_destroyWeak((id *)&self->_itemUpdater);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
