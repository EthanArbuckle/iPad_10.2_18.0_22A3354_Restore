@implementation HUQuickControlCollectionItemManager

- (HUQuickControlCollectionItemManager)initWithDelegate:(id)a3 gridItemProviderCreator:(id)a4 supplementaryItemProviderCreator:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUQuickControlCollectionItemManager *v12;
  void *v13;
  id gridItemProviderCreator;
  void *v15;
  id supplementaryItemProviderCreator;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlCollectionItemManager.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gridItemProviderCreator"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCollectionItemManager;
  v12 = -[HFItemManager initWithDelegate:sourceItem:](&v19, sel_initWithDelegate_sourceItem_, v9, 0);
  if (v12)
  {
    v13 = _Block_copy(v10);
    gridItemProviderCreator = v12->_gridItemProviderCreator;
    v12->_gridItemProviderCreator = v13;

    v15 = _Block_copy(v11);
    supplementaryItemProviderCreator = v12->_supplementaryItemProviderCreator;
    v12->_supplementaryItemProviderCreator = v15;

  }
  return v12;
}

- (BOOL)isGridItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUQuickControlCollectionItemManager gridItemProvider](self, "gridItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;

  v4 = a3;
  -[HUQuickControlCollectionItemManager gridItemProviderCreator](self, "gridItemProviderCreator");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionItemManager setGridItemProvider:](self, "setGridItemProvider:", v6);

  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[HUQuickControlCollectionItemManager gridItemProvider](self, "gridItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlCollectionItemManager supplementaryItemProviderCreator](self, "supplementaryItemProviderCreator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUQuickControlCollectionItemManager supplementaryItemProviderCreator](self, "supplementaryItemProviderCreator");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v11)[2](v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionItemManager setSupplementaryItemProvider:](self, "setSupplementaryItemProvider:", v12);

    -[HUQuickControlCollectionItemManager supplementaryItemProvider](self, "supplementaryItemProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  return v9;
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
  void *v19;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("grid"));
  -[HUQuickControlCollectionItemManager gridItemProvider](self, "gridItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v11);

  objc_msgSend(v5, "addObject:", v6);
  -[HUQuickControlCollectionItemManager supplementaryItemProvider](self, "supplementaryItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("supplementary"));
    -[HUQuickControlCollectionItemManager supplementaryItemProvider](self, "supplementaryItemProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingComparator:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v18);

    objc_msgSend(v5, "addObject:", v13);
  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (HFItemProvider)gridItemProvider
{
  return self->_gridItemProvider;
}

- (void)setGridItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_gridItemProvider, a3);
}

- (NSCopying)supplementaryItem
{
  return self->_supplementaryItem;
}

- (id)gridItemProviderCreator
{
  return self->_gridItemProviderCreator;
}

- (id)supplementaryItemProviderCreator
{
  return self->_supplementaryItemProviderCreator;
}

- (HFItemProvider)supplementaryItemProvider
{
  return self->_supplementaryItemProvider;
}

- (void)setSupplementaryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryItemProvider, 0);
  objc_storeStrong(&self->_supplementaryItemProviderCreator, 0);
  objc_storeStrong(&self->_gridItemProviderCreator, 0);
  objc_storeStrong((id *)&self->_supplementaryItem, 0);
  objc_storeStrong((id *)&self->_gridItemProvider, 0);
}

@end
