@implementation HUExpandableItemContainerModule

- (NSArray)expandableModules
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUExpandableItemContainerModule.m"), 16, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUExpandableItemContainerModule expandableModules]", objc_opt_class());

  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isShowOptionsItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUExpandableItemContainerModule expandableModules](self, "expandableModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HUExpandableItemContainerModule_isShowOptionsItem___block_invoke;
  v9[3] = &unk_1E6F582E0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

BOOL __53__HUExpandableItemContainerModule_isShowOptionsItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "showOptionsItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)isOptionItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUExpandableItemContainerModule expandableModules](self, "expandableModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HUExpandableItemContainerModule_isOptionItem___block_invoke;
  v9[3] = &unk_1E6F582E0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

BOOL __48__HUExpandableItemContainerModule_isOptionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "showOptionsItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != *(void **)(a1 + 32);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldExpandModuleForShowOptionsItem:(id)a3
{
  void *v3;
  char v4;

  -[HUExpandableItemContainerModule expandableModuleForItem:](self, "expandableModuleForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showOptions");

  return v4;
}

- (void)setModuleExpanded:(BOOL)a3 forItem:(id)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[HUExpandableItemContainerModule expandableModuleForItem:](self, "expandableModuleForItem:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "showOptions") != v4)
  {
    objc_msgSend(v13, "setShowOptions:", v4);
    -[HUExpandableItemContainerModule expandableModules](self, "expandableModules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__HUExpandableItemContainerModule_setModuleExpanded_forItem___block_invoke;
    v14[3] = &unk_1E6F58308;
    v15 = v13;
    objc_msgSend(v7, "na_each:", v14);

    v8 = (void *)MEMORY[0x1E0D314C0];
    -[HFItemModule itemProviders](self, "itemProviders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestToReloadItemProviders:senderSelector:", v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemModule itemUpdater](self, "itemUpdater");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "performItemUpdateRequest:", v10);

  }
}

uint64_t __61__HUExpandableItemContainerModule_setModuleExpanded_forItem___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(result + 32) != a2)
    return objc_msgSend(a2, "setShowOptions:", 0);
  return result;
}

- (id)expandableModuleForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUExpandableItemContainerModule expandableModules](self, "expandableModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HUExpandableItemContainerModule_expandableModuleForItem___block_invoke;
  v9[3] = &unk_1E6F582E0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__HUExpandableItemContainerModule_expandableModuleForItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

@end
