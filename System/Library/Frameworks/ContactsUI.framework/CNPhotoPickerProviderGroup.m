@implementation CNPhotoPickerProviderGroup

- (CNPhotoPickerProviderGroup)initWithProviders:(id)a3 groupType:(int64_t)a4 environment:(id)a5 allowAddItem:(BOOL)a6
{
  id v11;
  id v12;
  CNPhotoPickerProviderGroup *v13;
  CNPhotoPickerProviderGroup *v14;
  NSArray *v15;
  uint64_t v16;
  NSArray *displayItems;
  NSArray *addedItems;
  NSArray *removedItems;
  uint64_t v20;
  NSMutableDictionary *itemsGroupedByProvider;
  void *v22;
  uint64_t v23;
  CNScheduler *workQueue;
  uint64_t v25;
  CNScheduler *providerItemRenderingQueue;
  uint64_t v27;
  CNScheduler *callbackQueue;
  CNPhotoPickerProviderGroup *v29;
  objc_super v31;

  v11 = a3;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CNPhotoPickerProviderGroup;
  v13 = -[CNPhotoPickerProviderGroup init](&v31, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_providers, a3);
    v14->_groupType = a4;
    v14->_allowAddItem = a6;
    v15 = (NSArray *)MEMORY[0x1E0C9AA60];
    if (a6)
    {
      -[CNPhotoPickerProviderGroup addItems](v14, "addItems");
      v16 = objc_claimAutoreleasedReturnValue();
      displayItems = v14->_displayItems;
      v14->_displayItems = (NSArray *)v16;
    }
    else
    {
      displayItems = v14->_displayItems;
      v14->_displayItems = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    addedItems = v14->_addedItems;
    v14->_addedItems = v15;

    removedItems = v14->_removedItems;
    v14->_removedItems = v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    itemsGroupedByProvider = v14->_itemsGroupedByProvider;
    v14->_itemsGroupedByProvider = (NSMutableDictionary *)v20;

    objc_msgSend(v12, "defaultSchedulerProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.PhotoPickerProvider.workQueue"));
    workQueue = v14->_workQueue;
    v14->_workQueue = (CNScheduler *)v23;

    v25 = objc_msgSend(v22, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.PhotoPickerProvider.ProviderItem.workQueue"));
    providerItemRenderingQueue = v14->_providerItemRenderingQueue;
    v14->_providerItemRenderingQueue = (CNScheduler *)v25;

    objc_msgSend(v22, "mainThreadScheduler");
    v27 = objc_claimAutoreleasedReturnValue();
    callbackQueue = v14->_callbackQueue;
    v14->_callbackQueue = (CNScheduler *)v27;

    v29 = v14;
  }

  return v14;
}

- (void)loadProvidersItemsForSize:(CGSize)a3 itemsPerRow:(double)a4 scale:(double)a5 RTL:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  BOOL v22;

  height = a3.height;
  width = a3.width;
  self->_itemsPerRow = (unint64_t)a4;
  -[CNPhotoPickerProviderGroup workQueue](self, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroup providerItemRenderingQueue](self, "providerItemRenderingQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroup callbackQueue](self, "callbackQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke;
  v16[3] = &unk_1E2047EF8;
  v19 = width;
  v20 = height;
  v21 = a5;
  v22 = a6;
  v16[4] = self;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v11, "performBlock:", v16);

}

- (id)suggestionsProviderPrecedingFacesProvider
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  -[CNPhotoPickerProviderGroup providers](self, "providers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_1484);

  v5 = v4 - 1;
  if (v4 == 1
    || (-[CNPhotoPickerProviderGroup providers](self, "providers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 >= v7))
  {
LABEL_5:
    v9 = 0;
  }
  else
  {
    -[CNPhotoPickerProviderGroup providers](self, "providers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)setItemsPerRow:(unint64_t)a3
{
  -[CNPhotoPickerProviderGroup setItemsPerRow:requiresFullReload:](self, "setItemsPerRow:requiresFullReload:", a3, 0);
}

- (void)setItemsPerRow:(unint64_t)a3 requiresFullReload:(BOOL)a4
{
  if (self->_itemsPerRow != a3)
  {
    self->_itemsPerRow = a3;
    -[CNPhotoPickerProviderGroup reloadDisplayItemsNotifyDelegate:requiresFullReload:](self, "reloadDisplayItemsNotifyDelegate:requiresFullReload:", 1, a4);
  }
}

- (id)itemsForProviderIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNPhotoPickerProviderGroup itemsGroupedByProvider](self, "itemsGroupedByProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reloadDisplayItemsNotifyDelegate:(BOOL)a3
{
  -[CNPhotoPickerProviderGroup reloadDisplayItemsNotifyDelegate:requiresFullReload:](self, "reloadDisplayItemsNotifyDelegate:requiresFullReload:", a3, 0);
}

- (void)reloadDisplayItemsNotifyDelegate:(BOOL)a3 requiresFullReload:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  -[CNPhotoPickerProviderGroup providers](self, "providers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke;
  v17[3] = &unk_1E2047F60;
  v17[4] = self;
  v15 = v7;
  v18 = v15;
  objc_msgSend(v9, "_cn_each:", v17);

  if (-[CNPhotoPickerProviderGroup allowAddItem](self, "allowAddItem"))
  {
    -[CNPhotoPickerProviderGroup addItems](self, "addItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertObject:atIndex:", v11, 0);

  }
  objc_msgSend(v15, "_cn_flatten");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_3;
  v16[3] = &unk_1E204F1C8;
  v16[4] = self;
  objc_msgSend(v12, "_cn_filter:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerProviderGroup prepareDisplayItems:](self, "prepareDisplayItems:", v13);
  if (v5)
  {
    -[CNPhotoPickerProviderGroup delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "photoPickerProviderGroupDidUpdate:requiresFullReload:", self, v4);

  }
}

- (NSArray)addItems
{
  NSArray *addItems;
  CNPhotoPickerGlyphProviderItem *v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  addItems = self->_addItems;
  if (!addItems)
  {
    v4 = -[CNPhotoPickerGlyphProviderItem initWithSymbolImageNamed:]([CNPhotoPickerGlyphProviderItem alloc], "initWithSymbolImageNamed:", CFSTR("plus"));
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_addItems;
    self->_addItems = v5;

    addItems = self->_addItems;
  }
  return addItems;
}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[CNPhotoPickerProviderGroup displayItems](self, "displayItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)providerItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[CNPhotoPickerProviderGroup numberOfItems](self, "numberOfItems") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[CNPhotoPickerProviderGroup displayItems](self, "displayItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)addProviderItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroup addedItems](self, "addedItems", v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroup setAddedItems:](self, "setAddedItems:", v8);

  -[CNPhotoPickerProviderGroup reloadDisplayItemsNotifyDelegate:](self, "reloadDisplayItemsNotifyDelegate:", 0);
  -[CNPhotoPickerProviderGroup displayItems](self, "displayItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v5);

  return v10;
}

- (int64_t)removeProviderItem:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPhotoPickerProviderGroup displayItems](self, "displayItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v4);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CNPhotoPickerProviderGroup paddingItems](self, "paddingItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v4);

      if (!v10)
      {
        -[CNPhotoPickerProviderGroup removedItems](self, "removedItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayByAddingObject:", v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPhotoPickerProviderGroup setRemovedItems:](self, "setRemovedItems:", v21);

LABEL_11:
        -[CNPhotoPickerProviderGroup reloadDisplayItemsNotifyDelegate:](self, "reloadDisplayItemsNotifyDelegate:", 0);
        goto LABEL_12;
      }
      -[CNPhotoPickerProviderGroup paddingItems](self, "paddingItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke_2;
      v27 = &unk_1E204F1C8;
      v12 = v4;
      v28 = v12;
      objc_msgSend(v11, "_cn_filter:", &v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderGroup setPaddingItems:](self, "setPaddingItems:", v13, v24, v25, v26, v27);

      -[CNPhotoPickerProviderGroup removedPaddingItems](self, "removedPaddingItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[CNPhotoPickerProviderGroup removedPaddingItems](self, "removedPaddingItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "arrayByAddingObject:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPhotoPickerProviderGroup setRemovedPaddingItems:](self, "setRemovedPaddingItems:", v16);

      }
      else
      {
        v31[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPhotoPickerProviderGroup setRemovedPaddingItems:](self, "setRemovedPaddingItems:", v22);

      }
      v19 = v28;
    }
    else
    {
      -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke;
      v29[3] = &unk_1E204F1C8;
      v30 = v4;
      objc_msgSend(v17, "_cn_filter:", v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderGroup setAddedItems:](self, "setAddedItems:", v18);

      v19 = v30;
    }

    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (void)removeAllAddedProviderItems
{
  -[CNPhotoPickerProviderGroup setAddedItems:](self, "setAddedItems:", MEMORY[0x1E0C9AA60]);
  -[CNPhotoPickerProviderGroup reloadDisplayItemsNotifyDelegate:](self, "reloadDisplayItemsNotifyDelegate:", 0);
}

- (BOOL)hasAddedProviderItems
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D137F8];
  -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v2;
}

- (void)providerItemDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNPhotoPickerProviderGroup callbackQueue](self, "callbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CNPhotoPickerProviderGroup_providerItemDidUpdate___block_invoke;
  v7[3] = &unk_1E2050400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (int64_t)groupType
{
  return self->_groupType;
}

- (BOOL)allowAddItem
{
  return self->_allowAddItem;
}

- (BOOL)showCircleMask
{
  return self->_showCircleMask;
}

- (CNPhotoPickerProviderGroupDelegate)delegate
{
  return (CNPhotoPickerProviderGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)itemsPerRow
{
  return self->_itemsPerRow;
}

- (NSArray)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (void)setAddItems:(id)a3
{
  objc_storeStrong((id *)&self->_addItems, a3);
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayItems, a3);
}

- (NSArray)addedItems
{
  return self->_addedItems;
}

- (void)setAddedItems:(id)a3
{
  objc_storeStrong((id *)&self->_addedItems, a3);
}

- (NSArray)removedItems
{
  return self->_removedItems;
}

- (void)setRemovedItems:(id)a3
{
  objc_storeStrong((id *)&self->_removedItems, a3);
}

- (NSMutableDictionary)itemsGroupedByProvider
{
  return self->_itemsGroupedByProvider;
}

- (void)setItemsGroupedByProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemsGroupedByProvider, a3);
}

- (NSArray)availablePaddingItems
{
  return self->_availablePaddingItems;
}

- (void)setAvailablePaddingItems:(id)a3
{
  objc_storeStrong((id *)&self->_availablePaddingItems, a3);
}

- (NSArray)removedPaddingItems
{
  return self->_removedPaddingItems;
}

- (void)setRemovedPaddingItems:(id)a3
{
  objc_storeStrong((id *)&self->_removedPaddingItems, a3);
}

- (NSArray)paddingItems
{
  return self->_paddingItems;
}

- (void)setPaddingItems:(id)a3
{
  objc_storeStrong((id *)&self->_paddingItems, a3);
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNScheduler)providerItemRenderingQueue
{
  return self->_providerItemRenderingQueue;
}

- (CNScheduler)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_providerItemRenderingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_paddingItems, 0);
  objc_storeStrong((id *)&self->_removedPaddingItems, 0);
  objc_storeStrong((id *)&self->_availablePaddingItems, 0);
  objc_storeStrong((id *)&self->_itemsGroupedByProvider, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_addItems, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52__CNPhotoPickerProviderGroup_providerItemDidUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerProviderGroup:didUpdateItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

BOOL __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

uint64_t __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemsForProviderIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_cn_insertNonNilObject:atIndex:", v6, 0);
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_2;
      v9[3] = &unk_1E204F1C8;
      v9[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "_cn_filter:", v9);
      v7 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "_cn_addNonNilObject:", v7);
      v6 = (void *)v7;
    }

  }
}

BOOL __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "removedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObjectIdenticalTo:", v3);

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "addedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v3);

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __71__CNPhotoPickerProviderGroup_suggestionsProviderPrecedingFacesProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[6];
  id v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "suggestionsProviderPrecedingFacesProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "providers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "loadItemsForSize:scale:RTL:renderingQueue:callbackQueue:itemDelegate:", *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 48);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_2;
        v14[3] = &unk_1E2049108;
        v14[4] = *(_QWORD *)(a1 + 32);
        v14[5] = v8;
        v15 = v9;
        v16 = v8 == v2;
        v11 = v9;
        objc_msgSend(v10, "performBlock:", v14);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v12 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_3;
  v13[3] = &unk_1E204F648;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "performBlock:", v13);

}

uint64_t __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "itemsGroupedByProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  return objc_msgSend(*(id *)(a1 + 32), "reloadDisplayItemsNotifyDelegate:", *(unsigned __int8 *)(a1 + 56));
}

void __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerProviderGroupDidUpdate:requiresFullReload:", *(_QWORD *)(a1 + 32), 0);

}

+ (id)injectedItemsGroupWithEnvironment:(id)a3
{
  id v3;
  CNPhotoPickerProviderInjectedItemsGroup *v4;

  v3 = a3;
  v4 = -[CNPhotoPickerProviderInjectedItemsGroup initWithEnvironment:]([CNPhotoPickerProviderInjectedItemsGroup alloc], "initWithEnvironment:", v3);

  return v4;
}

+ (id)suggestionsGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CNPhotoPickerProviderSuggestionsGroup *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CNPhotoPickerProviderSuggestionsGroup initWithProviders:environment:allowAddItem:]([CNPhotoPickerProviderSuggestionsGroup alloc], "initWithProviders:environment:allowAddItem:", v8, v7, v5);

  return v9;
}

+ (id)animojiGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CNPhotoPickerProviderAnimojiGroup *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CNPhotoPickerProviderAnimojiGroup initWithProviders:environment:allowAddItem:]([CNPhotoPickerProviderAnimojiGroup alloc], "initWithProviders:environment:allowAddItem:", v8, v7, v5);

  return v9;
}

+ (id)emojiGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CNPhotoPickerProviderEmojiGroup *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CNPhotoPickerProviderEmojiGroup initWithProviders:environment:allowAddItem:]([CNPhotoPickerProviderEmojiGroup alloc], "initWithProviders:environment:allowAddItem:", v8, v7, v5);

  return v9;
}

+ (id)addItemsGroupWithProviders:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  CNPhotoPickerProviderAddItemsGroup *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNPhotoPickerProviderAddItemsGroup initWithProviders:environment:]([CNPhotoPickerProviderAddItemsGroup alloc], "initWithProviders:environment:", v6, v5);

  return v7;
}

@end
