@implementation CNPhotoPickerProviderSuggestionsGroup

- (CNPhotoPickerProviderSuggestionsGroup)initWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  CNPhotoPickerProviderSuggestionsGroup *v5;
  CNPhotoPickerProviderSuggestionsGroup *v6;
  CNPhotoPickerProviderSuggestionsGroup *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerProviderSuggestionsGroup;
  v5 = -[CNPhotoPickerProviderGroup initWithProviders:groupType:environment:allowAddItem:](&v9, sel_initWithProviders_groupType_environment_allowAddItem_, a3, 1, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (id)providerOfClass:(Class)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[CNPhotoPickerProviderGroup providers](self, "providers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CNPhotoPickerProviderSuggestionsGroup_providerOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e33_B16__0___CNPhotoPickerProvider__8lu32l8;
  v7[4] = a3;
  objc_msgSend(v4, "_cn_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexForDefaultMonogram
{
  void *v3;
  int64_t v4;

  if (!-[CNPhotoPickerProviderGroup allowAddItem](self, "allowAddItem"))
    return 0;
  -[CNPhotoPickerProviderSuggestionsGroup addItems](self, "addItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)itemsForProviderIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNPhotoPickerProviderSuggestionsGroup dedupedSuggestionItemsGroupedByProvider](self, "dedupedSuggestionItemsGroupedByProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dedupedSuggestionItemsGroupedByProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  -[CNPhotoPickerProviderSuggestionsGroup providerOfClass:](self, "providerOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderSuggestionsGroup providerOfClass:](self, "providerOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v3, "containsContactImage") & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[CNPhotoPickerProviderGroup itemsGroupedByProvider](self, "itemsGroupedByProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      objc_msgSend(v3, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cn_map:", &__block_literal_global_58953);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __80__CNPhotoPickerProviderSuggestionsGroup_dedupedSuggestionItemsGroupedByProvider__block_invoke_2;
      v17[3] = &unk_1E204F1C8;
      v18 = v13;
      v14 = v13;
      objc_msgSend(v9, "_cn_filter:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v14;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v15);

  }
  else
  {
    -[CNPhotoPickerProviderGroup itemsGroupedByProvider](self, "itemsGroupedByProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)loadAvailablePaddingItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  CNPhotoPickerVariantsManager *v13;
  void *v14;
  id v15;

  -[CNPhotoPickerProviderSuggestionsGroup providerOfClass:](self, "providerOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = v3;
    -[CNPhotoPickerProviderGroup itemsGroupedByProvider](self, "itemsGroupedByProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE033250))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *MEMORY[0x1E0D13850];
    objc_msgSend(v10, "itemText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    if ((_DWORD)v11)
    {
      if (objc_msgSend(v8, "imageType") == 2)
      {
        objc_msgSend(v8, "createColorVariantItemsExcludingSelf");
        v13 = (CNPhotoPickerVariantsManager *)objc_claimAutoreleasedReturnValue();
        -[CNPhotoPickerProviderGroup setAvailablePaddingItems:](self, "setAvailablePaddingItems:", v13);
      }
      else
      {
        v13 = objc_alloc_init(CNPhotoPickerVariantsManager);
        objc_msgSend(v8, "createVariantsItemsWithVariantsManager:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPhotoPickerProviderGroup setAvailablePaddingItems:](self, "setAvailablePaddingItems:", v14);

      }
      -[CNPhotoPickerProviderGroup setPaddingItems:](self, "setPaddingItems:", 0);
    }

    v3 = v15;
  }

}

- (void)prepareDisplayItems:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPhotoPickerProviderGroup availablePaddingItems](self, "availablePaddingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[CNPhotoPickerProviderSuggestionsGroup loadAvailablePaddingItems](self, "loadAvailablePaddingItems");
  v6 = -[CNPhotoPickerProviderSuggestionsGroup indexForDefaultMonogram](self, "indexForDefaultMonogram");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") > v6)
  {
    objc_msgSend(v7, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__CNPhotoPickerProviderSuggestionsGroup_prepareDisplayItems___block_invoke;
    v18[3] = &unk_1E204F1C8;
    v9 = v8;
    v19 = v9;
    v10 = objc_msgSend(v7, "_cn_indexOfFirstObjectPassingTest:", v18);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v10;
      objc_msgSend(v7, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addIndex:", v6);
      objc_msgSend(v13, "addIndex:", v11);
      v14 = objc_msgSend(v13, "count");
      if (v14 >= objc_msgSend(v7, "count"))
      {
        CNUILogContactPhotoPicker();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v13;
          v22 = 2112;
          v23 = v7;
          _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_DEFAULT, "Failed to update placeholder monogram, attempting to remove indices: %@ from display items: %@", buf, 0x16u);
        }

      }
      else
      {
        objc_msgSend(v7, "removeObjectsAtIndexes:", v13);
        objc_msgSend(v7, "insertObject:atIndex:", v12, v6);
      }

    }
  }
  -[CNPhotoPickerProviderSuggestionsGroup providerItems:withMaxRecentsAndMonogramsCount:](self, "providerItems:withMaxRecentsAndMonogramsCount:", v7, -[CNPhotoPickerProviderSuggestionsGroup maxRecentsAndMonogramsCount](self, "maxRecentsAndMonogramsCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderSuggestionsGroup paddedDisplayItems:](self, "paddedDisplayItems:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroup setDisplayItems:](self, "setDisplayItems:", v17);

}

- (id)providerItems:(id)a3 withMaxRecentsAndMonogramsCount:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v10 >= a4)
            goto LABEL_10;
          ++v10;
        }
        objc_msgSend(v6, "addObject:", v13, (_QWORD)v15);
LABEL_10:
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)paddedDisplayItems:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  CNPhotoPickerProviderSuggestionsGroup *v31;
  id v32;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= -[CNPhotoPickerProviderGroup itemsPerRow](self, "itemsPerRow"))
    goto LABEL_9;
  -[CNPhotoPickerProviderGroup availablePaddingItems](self, "availablePaddingItems");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_10;
  v7 = (void *)v6;
  v8 = objc_msgSend(v4, "count");
  v9 = v8 % -[CNPhotoPickerProviderGroup itemsPerRow](self, "itemsPerRow");

  if (!v9)
    goto LABEL_10;
  v10 = -[CNPhotoPickerProviderGroup itemsPerRow](self, "itemsPerRow");
  v11 = objc_msgSend(v4, "count");
  v12 = -[CNPhotoPickerProviderGroup itemsPerRow](self, "itemsPerRow");
  v13 = v10 + v11 / v12 * v12 - v11;
  -[CNPhotoPickerProviderGroup paddingItems](self, "paddingItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  -[CNPhotoPickerProviderGroup paddingItems](self, "paddingItems");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16
    || (v17 = (void *)v16,
        -[CNPhotoPickerProviderGroup paddingItems](self, "paddingItems"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "count"),
        v18,
        v17,
        v13 < v19))
  {
    v15 = v13;
  }
  if (!v15)
  {
LABEL_9:
    -[CNPhotoPickerProviderGroup setPaddingItems:](self, "setPaddingItems:", MEMORY[0x1E0C9AA60]);
LABEL_10:
    v27 = v4;
    goto LABEL_11;
  }
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_22_58941);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_cn_map:", &__block_literal_global_23_58942);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerProviderGroup availablePaddingItems](self, "availablePaddingItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke_3;
  v29[3] = &unk_1E204F250;
  v23 = v4;
  v30 = v23;
  v31 = self;
  v32 = v21;
  v24 = v21;
  objc_msgSend(v22, "_cn_filter:", v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_cn_take:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerProviderGroup setPaddingItems:](self, "setPaddingItems:", v26);
  objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v26);
  v27 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v27;
}

- (int64_t)addProviderItem:(id)a3
{
  id v4;
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPhotoPickerProviderSuggestionsGroup defaultMonogramItem](self, "defaultMonogramItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[CNPhotoPickerProviderGroup removedItems](self, "removedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      v24 = MEMORY[0x1E0C809B0];
      v8 = __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke;
      v9 = &v24;
    }
    else
    {
      v23 = MEMORY[0x1E0C809B0];
      v8 = __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke_2;
      v9 = &v23;
    }
    v9[1] = 3221225472;
    v9[2] = (uint64_t)v8;
    v9[3] = (uint64_t)&unk_1E204F1C8;
    v11 = v4;
    v9[4] = (uint64_t)v11;
    objc_msgSend(v7, "_cn_filter:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerProviderGroup setRemovedItems:](self, "setRemovedItems:", v12);

    -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    v15 = -[CNPhotoPickerProviderSuggestionsGroup maxRecentsAndMonogramsCount](self, "maxRecentsAndMonogramsCount");

    if (v14 <= v15)
    {
      v25 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderGroup setAddedItems:](self, "setAddedItems:", v18);
    }
    else
    {
      v26[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderGroup addedItems](self, "addedItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_cn_take:", objc_msgSend(v18, "count") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderGroup setAddedItems:](self, "setAddedItems:", v20);

    }
    -[CNPhotoPickerProviderGroup reloadDisplayItemsNotifyDelegate:](self, "reloadDisplayItemsNotifyDelegate:", 0);
    -[CNPhotoPickerProviderGroup displayItems](self, "displayItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v21, "indexOfObject:", v11);

  }
  return v10;
}

- (int64_t)removeProviderItem:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  objc_super v8;

  v4 = a3;
  -[CNPhotoPickerProviderSuggestionsGroup defaultMonogramItem](self, "defaultMonogramItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerProviderSuggestionsGroup;
    v6 = -[CNPhotoPickerProviderGroup removeProviderItem:](&v8, sel_removeProviderItem_, v4);
  }

  return v6;
}

- (id)defaultMonogramItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNPhotoPickerProviderSuggestionsGroup providerOfClass:](self, "providerOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNPhotoPickerProviderGroup itemsGroupedByProvider](self, "itemsGroupedByProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reloadMonogramProviderGroupWithVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[CNPhotoPickerProviderSuggestionsGroup providerOfClass:](self, "providerOfClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v9, v5, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setDelegate:", self);
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroup itemsGroupedByProvider](self, "itemsGroupedByProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  -[CNPhotoPickerProviderSuggestionsGroup loadAvailablePaddingItems](self, "loadAvailablePaddingItems");
  -[CNPhotoPickerProviderGroup reloadDisplayItemsNotifyDelegate:](self, "reloadDisplayItemsNotifyDelegate:", 1);

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
  v7[2] = __63__CNPhotoPickerProviderSuggestionsGroup_providerItemDidUpdate___block_invoke;
  v7[3] = &unk_1E2050400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (id)addItems
{
  return self->_addItems;
}

- (void)setAddItems:(id)a3
{
  objc_storeStrong((id *)&self->_addItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addItems, 0);
}

void __63__CNPhotoPickerProviderSuggestionsGroup_providerItemDidUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerProviderGroup:didUpdateItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

BOOL __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

uint64_t __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

uint64_t __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "removedPaddingItems"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", v3),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v3, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v8) ^ 1;

  }
  return v6;
}

uint64_t __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageData");
}

uint64_t __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v3 = v2;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    v6 = objc_msgSend(v5, "hasUnknownColor");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __61__CNPhotoPickerProviderSuggestionsGroup_prepareDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (*(void **)(a1 + 32) == a2)
  {
    isKindOfClass = 0;
  }
  else
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

uint64_t __80__CNPhotoPickerProviderSuggestionsGroup_dedupedSuggestionItemsGroupedByProvider__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __80__CNPhotoPickerProviderSuggestionsGroup_dedupedSuggestionItemsGroupedByProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageData");
}

uint64_t __57__CNPhotoPickerProviderSuggestionsGroup_providerOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
