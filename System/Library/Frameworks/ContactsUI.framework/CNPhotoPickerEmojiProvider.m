@implementation CNPhotoPickerEmojiProvider

- (CNPhotoPickerEmojiProvider)initWithVisualIdentity:(id)a3
{
  id v5;
  CNPhotoPickerEmojiProvider *v6;
  CNPhotoPickerEmojiProvider *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  CNPhotoPickerVariantsManager *v11;
  CNPhotoPickerVariantsManager *variantsManager;
  CNPhotoPickerEmojiProvider *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerEmojiProvider;
  v6 = -[CNPhotoPickerEmojiProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = v7->_variantsManager;
    v7->_variantsManager = v11;

    v13 = v7;
  }

  return v7;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  double height;
  double width;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CNPhotoPickerEmojiProviderItem *v19;
  void *v20;
  void *v21;
  CNPhotoPickerEmojiProviderItem *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  height = a3.height;
  width = a3.width;
  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a5, a6, a7, a8, a3.width, a3.height, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CNPhotoPickerEmojiProvider variantsManager](self, "variantsManager", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultEmojis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
        v19 = [CNPhotoPickerEmojiProviderItem alloc];
        objc_msgSend(v18, "emojiString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "colorVariant");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v19, "initWithStringRepresentation:backgroundColorVariant:size:", v20, v21, width, height);

        objc_msgSend(v11, "addObject:", v22);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
