@implementation CNPhotoPickerMonogramProvider

- (CNPhotoPickerMonogramProvider)initWithVisualIdentity:(id)a3
{
  id v5;
  CNPhotoPickerMonogramProvider *v6;
  CNPhotoPickerMonogramProvider *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  CNPhotoPickerMonogramProvider *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerMonogramProvider;
  v6 = -[CNPhotoPickerMonogramProvider init](&v13, sel_init);
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

    v11 = v7;
  }

  return v7;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  _BOOL8 v8;
  double height;
  double width;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v8 = a5;
  height = a3.height;
  width = a3.width;
  v21[1] = *MEMORY[0x1E0C80C00];
  v13 = (objc_class *)MEMORY[0x1E0D70A78];
  v14 = a8;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithRandomColor");
  v16 = (void *)objc_opt_class();
  -[CNPhotoPickerMonogramProvider visualIdentity](self, "visualIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v17, v8, v15, width, height, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setDelegate:", v14);
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)providerItemForVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = (void *)MEMORY[0x1E0DC3BF8];
  v10 = a3;
  objc_msgSend(v9, "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  objc_msgSend(a1, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v10, v5, 0, width, height, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)providerItemWithRandomBackgroundColorForVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = (objc_class *)MEMORY[0x1E0D70A78];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithRandomColor");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  objc_msgSend(a1, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v10, v5, v11, width, height, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)providerItemForVisualIdentity:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 backgroundColor:(id)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  CNPhotoPickerEmojiProviderItem *v16;
  uint64_t v17;
  CNPhotoPickerEmojiProviderItem *v18;

  v7 = a6;
  height = a4.height;
  width = a4.width;
  v12 = a7;
  v13 = a3;
  objc_msgSend(v13, "abbreviatedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[CNUIStringUtilities stringIsSingleEmoji:](CNUIStringUtilities, "stringIsSingleEmoji:", v14);

  if (v15)
  {
    v16 = [CNPhotoPickerEmojiProviderItem alloc];
    objc_msgSend(v13, "abbreviatedName");
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v16, "initWithStringRepresentation:backgroundColorVariant:size:", v17, 0, width, height);
    v13 = (id)v17;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "generateMonogramItemForVisualIdentity:size:scale:RTL:isVariantOptionItem:backgroundColor:", v13, v7, 0, v12, width, height, a5);
    v18 = (CNPhotoPickerEmojiProviderItem *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)generateMonogramItemForVisualIdentity:(id)a3 size:(CGSize)a4 scale:(double)a5 RTL:(BOOL)a6 isVariantOptionItem:(BOOL)a7 backgroundColor:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v14;
  id v15;
  void *v16;
  CNAvatarImageRenderer *v17;
  void *v18;
  CNPhotoPickerMonogramProviderItem *v19;
  CNPhotoPickerMonogramProviderItem *v20;

  v8 = a7;
  v9 = a6;
  height = a4.height;
  width = a4.width;
  v14 = a8;
  v15 = a3;
  +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v16);
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v9, 0, v14, width, height, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [CNPhotoPickerMonogramProviderItem alloc];
  v20 = -[CNPhotoPickerMonogramProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:](v19, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:", 0, 0, 0, v18, v17, v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNPhotoPickerMonogramProviderItem setVisualIdentity:](v20, "setVisualIdentity:", v15);

  return v20;
}

@end
