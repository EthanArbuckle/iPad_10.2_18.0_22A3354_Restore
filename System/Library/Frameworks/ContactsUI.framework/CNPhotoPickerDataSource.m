@implementation CNPhotoPickerDataSource

- (CNPhotoPickerDataSource)initWithVisualIdentity:(id)a3 contactViewCache:(id)a4 photoPickerConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CNPhotoPickerDataSource *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "avatarStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerProviderGroupsBuilder builderWithVisualIdentity:avatarStore:environment:contactViewCache:photoPickerConfiguration:](CNPhotoPickerProviderGroupsBuilder, "builderWithVisualIdentity:avatarStore:environment:contactViewCache:photoPickerConfiguration:", v12, v11, v13, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v12) = objc_msgSend(v8, "allowPhotoCapture");
  self->_allowsPhotoLibraryAccess = (char)v12;
  objc_msgSend(v14, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CNPhotoPickerDataSource initWithVisualIdentity:contactViewCache:providerGroups:avatarStore:](self, "initWithVisualIdentity:contactViewCache:providerGroups:avatarStore:", v10, v9, v15, v11);

  return v16;
}

- (CNPhotoPickerDataSource)initWithVisualIdentity:(id)a3 contactViewCache:(id)a4 providerGroups:(id)a5 avatarStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNPhotoPickerDataSource *v15;
  CNPhotoPickerDataSource *v16;
  NSIndexPath *activePhotoIndexPath;
  CNPhotoPickerVariantsManager *v18;
  CNPhotoPickerVariantsManager *variantsManager;
  void *v20;
  uint64_t v21;
  NSMutableArray *groupIsCollapsedState;
  NSArray *emojiSuggestionItems;
  CNPhotoPickerDataSource *v24;
  CNPhotoPickerDataSource *v25;
  _QWORD v27[4];
  CNPhotoPickerDataSource *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CNPhotoPickerDataSource;
  v15 = -[CNPhotoPickerDataSource init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_visualIdentity, a3);
    objc_storeStrong((id *)&v16->_contactViewCache, a4);
    activePhotoIndexPath = v16->_activePhotoIndexPath;
    v16->_activePhotoIndexPath = 0;

    objc_storeStrong((id *)&v16->_providerGroups, a5);
    objc_storeStrong((id *)&v16->_avatarStore, a6);
    v18 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = v16->_variantsManager;
    v16->_variantsManager = v18;

    objc_msgSend(v13, "_cn_map:", &__block_literal_global_12930);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "mutableCopy");
    groupIsCollapsedState = v16->_groupIsCollapsedState;
    v16->_groupIsCollapsedState = (NSMutableArray *)v21;

    emojiSuggestionItems = v16->_emojiSuggestionItems;
    v16->_emojiSuggestionItems = (NSArray *)MEMORY[0x1E0C9AA60];

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __94__CNPhotoPickerDataSource_initWithVisualIdentity_contactViewCache_providerGroups_avatarStore___block_invoke_2;
    v27[3] = &unk_1E2049458;
    v24 = v16;
    v28 = v24;
    objc_msgSend(v13, "_cn_each:", v27);
    v25 = v24;

  }
  return v16;
}

- (void)loadProviderGroupsItemsForSize:(CGSize)a3 itemsPerRow:(double)a4 scale:(double)a5 RTL:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "loadProvidersItemsForSize:itemsPerRow:scale:RTL:", v6, width, height, a4, a5);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (unint64_t)itemsPerRow
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "itemsPerRow");

  return v4;
}

- (unint64_t)itemsPerRowForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "itemsPerRow");
  return v6;
}

- (void)setItemsPerRow:(unint64_t)a3
{
  -[CNPhotoPickerDataSource setItemsPerRow:requiresFullReload:](self, "setItemsPerRow:requiresFullReload:", a3, 0);
}

- (void)setItemsPerRow:(unint64_t)a3 requiresFullReload:(BOOL)a4
{
  id v6;
  _QWORD v7[5];
  BOOL v8;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CNPhotoPickerDataSource_setItemsPerRow_requiresFullReload___block_invoke;
  v7[3] = &__block_descriptor_41_e36_v16__0__CNPhotoPickerProviderGroup_8l;
  v7[4] = a3;
  v8 = a4;
  objc_msgSend(v6, "_cn_each:", v7);

}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerDataSource groupIsCollapsedState](self, "groupIsCollapsedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    v10 = 2 * -[CNPhotoPickerDataSource itemsPerRowForSection:](self, "itemsPerRowForSection:", a3);
    v11 = objc_msgSend(v6, "numberOfItems");
    if (v10 >= v11)
      v10 = v11;
  }
  else
  {
    v10 = objc_msgSend(v6, "numberOfItems");
  }

  return v10;
}

- (int64_t)sectionIndexForProviderGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CNPhotoPickerDataSource_sectionIndexForProviderGroup___block_invoke;
  v9[3] = &unk_1E20494A0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "_cn_indexOfFirstObjectPassingTest:", v9);

  return v7;
}

- (int64_t)sectionIndexForProviderGroupType:(int64_t)a3
{
  void *v4;
  int64_t v5;
  _QWORD v7[5];

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CNPhotoPickerDataSource_sectionIndexForProviderGroupType___block_invoke;
  v7[3] = &__block_descriptor_40_e36_B16__0__CNPhotoPickerProviderGroup_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", v7);

  return v5;
}

- (id)indexPathsToReloadForUpdatedGroup:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v5 = -[CNPhotoPickerDataSource sectionIndexForProviderGroup:](self, "sectionIndexForProviderGroup:", v4);
  v6 = objc_msgSend(v4, "numberOfItems");
  v7 = v6 - 1;
  if (v6 < 1)
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v8 = v6;
    v9 = 0;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      ++v9;
      v10 = v12;
    }
    while (v8 != v9);
  }
  if ((objc_msgSend(v4, "allowAddItem") & 1) != 0)
  {
    objc_msgSend(v12, "_cn_takeLast:", v7);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  return v12;
}

- (id)titleForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "groupType");
  if (v6 == 3)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v11 = CFSTR("PHOTO_EDIT_EMOJI_HEADER");
LABEL_8:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v6 == 2)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v11 = CFSTR("PHOTO_EDIT_ANIMOJI_HEADER");
    goto LABEL_8;
  }
  if (v6 != 1)
  {
    v9 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom"))
  {
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PHOTO_EDIT_PHOTOS_HEADER"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
LABEL_9:

LABEL_11:
  return v9;
}

- (id)actionTitleForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "groupType") == 2)
  {
    -[CNPhotoPickerDataSource groupIsCollapsedState](self, "groupIsCollapsedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PHOTO_EDIT_ANIMOJI_HEADER_COLLAPSE_ACTION"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PHOTO_EDIT_ANIMOJI_HEADER_EXPAND_ACTION"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v14 = v13;
    else
      v14 = v11;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isItemAtIndexPathAddItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "allowAddItem"))
  {
    v7 = objc_msgSend(v4, "row");
    objc_msgSend(v6, "addItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 < objc_msgSend(v8, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)providerGroupAtSection:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  if (a3 < 0
    || (-[CNPhotoPickerDataSource providerGroups](self, "providerGroups"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)providerGroupAtIndexPath:(id)a3
{
  return -[CNPhotoPickerDataSource providerGroupAtSection:](self, "providerGroupAtSection:", objc_msgSend(a3, "section"));
}

- (id)providerItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CNPhotoPickerDataSource providerGroupAtIndexPath:](self, "providerGroupAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "providerItemAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)monogramProviderDefaultItemWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  v6 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1;
  -[CNPhotoPickerDataSource visualIdentity](self, "visualIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v7, v6, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)monogramProviderMonogramItemWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  v6 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1;
  -[CNPhotoPickerDataSource visualIdentity](self, "visualIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  +[CNPhotoPickerMonogramProvider monogramProviderItemForVisualIdentity:size:scale:RTL:isVariantOptionItem:backgroundColor:](CNPhotoPickerMonogramProvider, "monogramProviderItemForVisualIdentity:size:scale:RTL:isVariantOptionItem:backgroundColor:", v8, v6, 1, 0, width, height, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)suggestionsGroup
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)injectedItemsGroup
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)findActiveIndexPathInGroup:(id)a3 withImageData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v6);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "numberOfItems") < 1)
    goto LABEL_8;
  v10 = 0;
  while (1)
  {
    objc_msgSend(v6, "providerItemAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToData:", v7);

    if ((v13 & 1) != 0)
      break;
    if (++v10 >= objc_msgSend(v6, "numberOfItems"))
      goto LABEL_8;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)indexOfAddedItem:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v6 = a3;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__CNPhotoPickerDataSource_indexOfAddedItem_inGroupOfType___block_invoke;
  v15[3] = &__block_descriptor_40_e36_B16__0__CNPhotoPickerProviderGroup_8l;
  v15[4] = a4;
  objc_msgSend(v7, "_cn_firstObjectPassingTest:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (v9 = objc_msgSend(v8, "addProviderItem:", v6), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = v9;
    v12 = (void *)MEMORY[0x1E0CB36B0];
    -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForItem:inSection:", v11, objc_msgSend(v13, "indexOfObjectIdenticalTo:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)removeItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CNPhotoPickerDataSource_removeItem___block_invoke;
  v9[3] = &unk_1E2049508;
  v6 = v4;
  v10 = v6;
  v11 = &v13;
  v12 = &v17;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  if (v18[3] == 0x7FFFFFFFFFFFFFFFLL || v14[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

- (void)updateGroupCollapsedStateForSection:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  -[CNPhotoPickerDataSource groupIsCollapsedState](self, "groupIsCollapsedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[CNPhotoPickerDataSource groupIsCollapsedState](self, "groupIsCollapsedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    -[CNPhotoPickerDataSource groupIsCollapsedState](self, "groupIsCollapsedState");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 ^ 1u);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", a3, v10);

  }
}

- (void)photoPickerProviderGroupDidUpdate:(id)a3 requiresFullReload:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[CNPhotoPickerDataSource delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNPhotoPickerDataSource delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoPickerProviderGroupDidUpdate:requiresFullReload:", v8, v4);

  }
}

- (void)photoPickerProviderGroup:(id)a3 didUpdateItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[CNPhotoPickerDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CNPhotoPickerDataSource delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoPickerProviderGroup:didUpdateItem:", v9, v6);

  }
}

- (id)uniqueEmojiSuggestionItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CNPhotoPickerDataSource emojiSuggestionItems](self, "emojiSuggestionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_map:", &__block_literal_global_33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__CNPhotoPickerDataSource_uniqueEmojiSuggestionItems___block_invoke_2;
  v10[3] = &unk_1E2049550;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "_cn_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_visualIdentity, a3);
}

- (NSIndexPath)activePhotoIndexPath
{
  return self->_activePhotoIndexPath;
}

- (void)setActivePhotoIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_activePhotoIndexPath, a3);
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (CNPhotoPickerProviderGroupDelegate)delegate
{
  return (CNPhotoPickerProviderGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (NSArray)emojiSuggestionItems
{
  return self->_emojiSuggestionItems;
}

- (void)setEmojiSuggestionItems:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSuggestionItems, a3);
}

- (NSArray)providerGroups
{
  return self->_providerGroups;
}

- (NSMutableArray)groupIsCollapsedState
{
  return self->_groupIsCollapsedState;
}

- (void)setGroupIsCollapsedState:(id)a3
{
  objc_storeStrong((id *)&self->_groupIsCollapsedState, a3);
}

- (BOOL)allowsPhotoLibraryAccess
{
  return self->_allowsPhotoLibraryAccess;
}

- (void)setAllowsPhotoLibraryAccess:(BOOL)a3
{
  self->_allowsPhotoLibraryAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIsCollapsedState, 0);
  objc_storeStrong((id *)&self->_providerGroups, 0);
  objc_storeStrong((id *)&self->_emojiSuggestionItems, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_activePhotoIndexPath, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);
}

uint64_t __54__CNPhotoPickerDataSource_uniqueEmojiSuggestionItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __54__CNPhotoPickerDataSource_uniqueEmojiSuggestionItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

uint64_t __38__CNPhotoPickerDataSource_removeItem___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "removeProviderItem:", a1[4]);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

BOOL __58__CNPhotoPickerDataSource_indexOfAddedItem_inGroupOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupType") == *(_QWORD *)(a1 + 32);
}

BOOL __45__CNPhotoPickerDataSource_injectedItemsGroup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupType") == 4;
}

BOOL __43__CNPhotoPickerDataSource_suggestionsGroup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupType") == 1;
}

BOOL __60__CNPhotoPickerDataSource_sectionIndexForProviderGroupType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupType") == *(_QWORD *)(a1 + 32);
}

uint64_t __56__CNPhotoPickerDataSource_sectionIndexForProviderGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__CNPhotoPickerDataSource_setItemsPerRow_requiresFullReload___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setItemsPerRow:requiresFullReload:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __94__CNPhotoPickerDataSource_initWithVisualIdentity_contactViewCache_providerGroups_avatarStore___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

id __94__CNPhotoPickerDataSource_initWithVisualIdentity_contactViewCache_providerGroups_avatarStore___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "groupType") == 2)
    return MEMORY[0x1E0C9AAB0];
  else
    return MEMORY[0x1E0C9AAA0];
}

+ (AVTAvatarStore)avatarStore
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (!+[CNPhotoPickerCapabilities allowsAvatarUI](CNPhotoPickerCapabilities, "allowsAvatarUI"))
    return (AVTAvatarStore *)0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getAVTAvatarStoreClass_softClass;
  v9 = getAVTAvatarStoreClass_softClass;
  if (!getAVTAvatarStoreClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getAVTAvatarStoreClass_block_invoke;
    v5[3] = &unk_1E204EBC0;
    v5[4] = &v6;
    __getAVTAvatarStoreClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return (AVTAvatarStore *)objc_alloc_init(v3);
}

@end
