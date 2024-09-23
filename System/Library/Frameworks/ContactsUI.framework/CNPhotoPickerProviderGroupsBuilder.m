@implementation CNPhotoPickerProviderGroupsBuilder

- (CNPhotoPickerProviderGroupsBuilder)initWithVisualIdentity:(id)a3 avatarStore:(id)a4 environment:(id)a5 contactViewCache:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNPhotoPickerProviderGroupsBuilder *v15;
  CNPhotoPickerProviderGroupsBuilder *v16;
  CNPhotoPickerProviderGroupsBuilder *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNPhotoPickerProviderGroupsBuilder;
  v15 = -[CNPhotoPickerProviderGroupsBuilder init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_visualIdentity, a3);
    objc_storeStrong((id *)&v16->_avatarStore, a4);
    objc_storeStrong((id *)&v16->_environment, a5);
    objc_storeStrong((id *)&v16->_contactViewCache, a6);
    v17 = v16;
  }

  return v16;
}

- (BOOL)includesAnyPhotoContent
{
  return -[CNPhotoPickerProviderGroupsBuilder includeTakePhotoItem](self, "includeTakePhotoItem")
      || -[CNPhotoPickerProviderGroupsBuilder includePhotoFromLibraryItem](self, "includePhotoFromLibraryItem")
      || -[CNPhotoPickerProviderGroupsBuilder includeContactImage](self, "includeContactImage")
      || -[CNPhotoPickerProviderGroupsBuilder includeUnifiedContactImages](self, "includeUnifiedContactImages")
      || -[CNPhotoPickerProviderGroupsBuilder includeFaces](self, "includeFaces")
      || -[CNPhotoPickerProviderGroupsBuilder includeMonograms](self, "includeMonograms");
}

- (id)addItemsContentGroup
{
  CNPhotoPickerAddItemsProvider *v3;
  void *v4;
  CNPhotoPickerAddItemsProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = [CNPhotoPickerAddItemsProvider alloc];
  -[CNPhotoPickerProviderGroupsBuilder visualIdentity](self, "visualIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPhotoPickerAddItemsProvider initWithVisualIdentity:allowsTakePhotoItem:allowsPhotoFromLibraryItem:allowsMonograms:allowsEmoji:](v3, "initWithVisualIdentity:allowsTakePhotoItem:allowsPhotoFromLibraryItem:allowsMonograms:allowsEmoji:", v4, -[CNPhotoPickerProviderGroupsBuilder includeTakePhotoItem](self, "includeTakePhotoItem"), -[CNPhotoPickerProviderGroupsBuilder includePhotoFromLibraryItem](self, "includePhotoFromLibraryItem"), -[CNPhotoPickerProviderGroupsBuilder includeMonograms](self, "includeMonograms"), -[CNPhotoPickerProviderGroupsBuilder includesEmojiContent](self, "includesEmojiContent"));

  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroupsBuilder environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerProviderGroup addItemsGroupWithProviders:environment:](CNPhotoPickerProviderGroup, "addItemsGroupWithProviders:environment:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)injectedItemsGroup
{
  void *v2;
  void *v3;

  -[CNPhotoPickerProviderGroupsBuilder environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerProviderGroup injectedItemsGroupWithEnvironment:](CNPhotoPickerProviderGroup, "injectedItemsGroupWithEnvironment:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)photoContentGroup
{
  void *v3;
  CNPhotoPickerMonogramProvider *v4;
  void *v5;
  CNPhotoPickerMonogramProvider *v6;
  CNPhotoPickerAccountPhotoProvider *v7;
  void *v8;
  CNPhotoPickerAccountPhotoProvider *v9;
  CNPhotoPickerRecentsProvider *v10;
  void *v11;
  CNPhotoPickerRecentsProvider *v12;
  CNPhotoPickerPhotoFacesProvider *v13;
  void *v14;
  CNPhotoPickerPhotoFacesProvider *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNPhotoPickerProviderGroupsBuilder includeMonograms](self, "includeMonograms"))
  {
    v4 = [CNPhotoPickerMonogramProvider alloc];
    -[CNPhotoPickerProviderGroupsBuilder visualIdentity](self, "visualIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNPhotoPickerMonogramProvider initWithVisualIdentity:](v4, "initWithVisualIdentity:", v5);
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[CNPhotoPickerProviderGroupsBuilder includeContactImage](self, "includeContactImage"))
  {
    v7 = [CNPhotoPickerAccountPhotoProvider alloc];
    -[CNPhotoPickerProviderGroupsBuilder visualIdentity](self, "visualIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNPhotoPickerAccountPhotoProvider initWithVisualIdentity:includeUnifiedContactImages:](v7, "initWithVisualIdentity:includeUnifiedContactImages:", v8, -[CNPhotoPickerProviderGroupsBuilder includeUnifiedContactImages](self, "includeUnifiedContactImages"));
    objc_msgSend(v3, "addObject:", v9);

  }
  if (-[CNPhotoPickerProviderGroupsBuilder includeRecents](self, "includeRecents"))
  {
    v10 = [CNPhotoPickerRecentsProvider alloc];
    -[CNPhotoPickerProviderGroupsBuilder visualIdentity](self, "visualIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNPhotoPickerRecentsProvider initWithVisualIdentity:](v10, "initWithVisualIdentity:", v11);
    objc_msgSend(v3, "addObject:", v12);

  }
  if (-[CNPhotoPickerProviderGroupsBuilder includeFaces](self, "includeFaces"))
  {
    v13 = [CNPhotoPickerPhotoFacesProvider alloc];
    -[CNPhotoPickerProviderGroupsBuilder visualIdentity](self, "visualIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNPhotoPickerPhotoFacesProvider initWithVisualIdentity:](v13, "initWithVisualIdentity:", v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  -[CNPhotoPickerProviderGroupsBuilder environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerProviderGroup suggestionsGroupWithProviders:environment:allowAddItem:](CNPhotoPickerProviderGroup, "suggestionsGroupWithProviders:environment:allowAddItem:", v3, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)animojiContentGroup
{
  CNPhotoPickerAnimojiProvider *v3;
  void *v4;
  void *v5;
  CNPhotoPickerAnimojiProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = [CNPhotoPickerAnimojiProvider alloc];
  -[CNPhotoPickerProviderGroupsBuilder visualIdentity](self, "visualIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroupsBuilder avatarStore](self, "avatarStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNPhotoPickerAnimojiProvider initWithVisualIdentity:avatarStore:](v3, "initWithVisualIdentity:avatarStore:", v4, v5);

  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroupsBuilder environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerProviderGroup animojiGroupWithProviders:environment:allowAddItem:](CNPhotoPickerProviderGroup, "animojiGroupWithProviders:environment:allowAddItem:", v7, v8, -[CNPhotoPickerProviderGroupsBuilder includeAddAnimojiItem](self, "includeAddAnimojiItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)emojiContentGroup
{
  CNPhotoPickerEmojiProvider *v3;
  void *v4;
  CNPhotoPickerEmojiProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = [CNPhotoPickerEmojiProvider alloc];
  -[CNPhotoPickerProviderGroupsBuilder visualIdentity](self, "visualIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPhotoPickerEmojiProvider initWithVisualIdentity:](v3, "initWithVisualIdentity:", v4);

  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderGroupsBuilder environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerProviderGroup emojiGroupWithProviders:environment:allowAddItem:](CNPhotoPickerProviderGroup, "emojiGroupWithProviders:environment:allowAddItem:", v6, v7, -[CNPhotoPickerProviderGroupsBuilder includeAddEmojiItem](self, "includeAddEmojiItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNPhotoPickerProviderGroupsBuilder includeTakePhotoItem](self, "includeTakePhotoItem")
    || -[CNPhotoPickerProviderGroupsBuilder includePhotoFromLibraryItem](self, "includePhotoFromLibraryItem")
    || -[CNPhotoPickerProviderGroupsBuilder includeMonograms](self, "includeMonograms")
    && -[CNPhotoPickerProviderGroupsBuilder includesEmojiContent](self, "includesEmojiContent"))
  {
    -[CNPhotoPickerProviderGroupsBuilder addItemsContentGroup](self, "addItemsContentGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[CNPhotoPickerProviderGroupsBuilder includesAnyPhotoContent](self, "includesAnyPhotoContent"))
  {
    -[CNPhotoPickerProviderGroupsBuilder photoContentGroup](self, "photoContentGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNPhotoPickerProviderGroupsBuilder includeAnimoji](self, "includeAnimoji"))
  {
    -[CNPhotoPickerProviderGroupsBuilder animojiContentGroup](self, "animojiContentGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  if (-[CNPhotoPickerProviderGroupsBuilder includesEmojiContent](self, "includesEmojiContent"))
  {
    -[CNPhotoPickerProviderGroupsBuilder emojiContentGroup](self, "emojiContentGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  if (-[CNPhotoPickerProviderGroupsBuilder shouldOrderEmojiBeforeAnimoji](self, "shouldOrderEmojiBeforeAnimoji"))
  {
    objc_msgSend(v6, "_cn_reversed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  }

  return v3;
}

- (BOOL)includeContactImage
{
  return self->_includeContactImage;
}

- (void)setIncludeContactImage:(BOOL)a3
{
  self->_includeContactImage = a3;
}

- (BOOL)includeUnifiedContactImages
{
  return self->_includeUnifiedContactImages;
}

- (void)setIncludeUnifiedContactImages:(BOOL)a3
{
  self->_includeUnifiedContactImages = a3;
}

- (BOOL)includeTakePhotoItem
{
  return self->_includeTakePhotoItem;
}

- (void)setIncludeTakePhotoItem:(BOOL)a3
{
  self->_includeTakePhotoItem = a3;
}

- (BOOL)includePhotoFromLibraryItem
{
  return self->_includePhotoFromLibraryItem;
}

- (void)setIncludePhotoFromLibraryItem:(BOOL)a3
{
  self->_includePhotoFromLibraryItem = a3;
}

- (BOOL)includeMonograms
{
  return self->_includeMonograms;
}

- (void)setIncludeMonograms:(BOOL)a3
{
  self->_includeMonograms = a3;
}

- (BOOL)includeFaces
{
  return self->_includeFaces;
}

- (void)setIncludeFaces:(BOOL)a3
{
  self->_includeFaces = a3;
}

- (BOOL)includeAnimoji
{
  return self->_includeAnimoji;
}

- (void)setIncludeAnimoji:(BOOL)a3
{
  self->_includeAnimoji = a3;
}

- (BOOL)includeAddAnimojiItem
{
  return self->_includeAddAnimojiItem;
}

- (void)setIncludeAddAnimojiItem:(BOOL)a3
{
  self->_includeAddAnimojiItem = a3;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (void)setIncludeRecents:(BOOL)a3
{
  self->_includeRecents = a3;
}

- (BOOL)shouldOrderEmojiBeforeAnimoji
{
  return self->_shouldOrderEmojiBeforeAnimoji;
}

- (void)setShouldOrderEmojiBeforeAnimoji:(BOOL)a3
{
  self->_shouldOrderEmojiBeforeAnimoji = a3;
}

- (BOOL)includesEmojiContent
{
  return self->_includesEmojiContent;
}

- (void)setIncludesEmojiContent:(BOOL)a3
{
  self->_includesEmojiContent = a3;
}

- (BOOL)includeAddEmojiItem
{
  return self->_includeAddEmojiItem;
}

- (void)setIncludeAddEmojiItem:(BOOL)a3
{
  self->_includeAddEmojiItem = a3;
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);
}

+ (id)builderWithVisualIdentity:(id)a3 avatarStore:(id)a4 environment:(id)a5 contactViewCache:(id)a6 photoPickerConfiguration:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CNPhotoPickerProviderGroupsBuilder *v16;
  _BOOL8 v17;
  _BOOL8 v18;
  _BOOL8 v19;
  _BOOL4 v20;
  _BOOL8 v21;
  _BOOL8 v22;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = -[CNPhotoPickerProviderGroupsBuilder initWithVisualIdentity:avatarStore:environment:contactViewCache:]([CNPhotoPickerProviderGroupsBuilder alloc], "initWithVisualIdentity:avatarStore:environment:contactViewCache:", v11, v15, v14, v13);

  -[CNPhotoPickerProviderGroupsBuilder setIncludeContactImage:](v16, "setIncludeContactImage:", objc_msgSend(v12, "includeContactImage"));
  -[CNPhotoPickerProviderGroupsBuilder setIncludeUnifiedContactImages:](v16, "setIncludeUnifiedContactImages:", objc_msgSend(v12, "includeUnifiedContactImages"));
  if (objc_msgSend(v12, "allowPhotoCapture"))
    v17 = +[CNPhotoPickerCapabilities allowsCameraAccess](CNPhotoPickerCapabilities, "allowsCameraAccess");
  else
    v17 = 0;
  -[CNPhotoPickerProviderGroupsBuilder setIncludeTakePhotoItem:](v16, "setIncludeTakePhotoItem:", v17);
  if (objc_msgSend(v12, "allowPhotoFromLibrary"))
    v18 = +[CNPhotoPickerCapabilities allowsPhotoLibraryAccess](CNPhotoPickerCapabilities, "allowsPhotoLibraryAccess");
  else
    v18 = 0;
  -[CNPhotoPickerProviderGroupsBuilder setIncludePhotoFromLibraryItem:](v16, "setIncludePhotoFromLibraryItem:", v18);
  -[CNPhotoPickerProviderGroupsBuilder setIncludeMonograms:](v16, "setIncludeMonograms:", objc_msgSend(v12, "includeMonograms"));
  if (objc_msgSend(v12, "includeFaces"))
    v19 = +[CNPhotoPickerCapabilities allowsPhotoLibraryAccess](CNPhotoPickerCapabilities, "allowsPhotoLibraryAccess");
  else
    v19 = 0;
  -[CNPhotoPickerProviderGroupsBuilder setIncludeFaces:](v16, "setIncludeFaces:", v19);
  if (objc_msgSend(v12, "includeAnimoji"))
  {
    v20 = +[CNPhotoPickerCapabilities allowsAvatarUI](CNPhotoPickerCapabilities, "allowsAvatarUI");
    if (v15)
      v21 = v20;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  -[CNPhotoPickerProviderGroupsBuilder setIncludeAnimoji:](v16, "setIncludeAnimoji:", v21);
  v22 = -[CNPhotoPickerProviderGroupsBuilder includeAnimoji](v16, "includeAnimoji")
     && objc_msgSend(v12, "allowAnimojiCreation")
     && +[CNPhotoPickerCapabilities allowsAvatarStoreAccess](CNPhotoPickerCapabilities, "allowsAvatarStoreAccess");
  -[CNPhotoPickerProviderGroupsBuilder setIncludeAddAnimojiItem:](v16, "setIncludeAddAnimojiItem:", v22);
  -[CNPhotoPickerProviderGroupsBuilder setIncludeRecents:](v16, "setIncludeRecents:", objc_msgSend(v12, "includeRecents"));
  -[CNPhotoPickerProviderGroupsBuilder setIncludesEmojiContent:](v16, "setIncludesEmojiContent:", objc_msgSend(v12, "includeEmoji"));
  -[CNPhotoPickerProviderGroupsBuilder setIncludeAddEmojiItem:](v16, "setIncludeAddEmojiItem:", objc_msgSend(v12, "includeEmoji"));
  -[CNPhotoPickerProviderGroupsBuilder setShouldOrderEmojiBeforeAnimoji:](v16, "setShouldOrderEmojiBeforeAnimoji:", objc_msgSend(v11, "identityType") == 1);

  return v16;
}

@end
