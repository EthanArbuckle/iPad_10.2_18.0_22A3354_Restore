@implementation CNPhotoPickerMonogramProviderItem

- (CNPhotoPickerMonogramProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 cropRect:(CGRect)a6 renderingScope:(id)a7 avatarRenderer:(id)a8 isVariantOptionItem:(BOOL)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  CNPhotoPickerMonogramProviderItem *v20;
  CNPhotoPickerMonogramProviderItem *v21;
  objc_super v23;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v17 = a7;
  v18 = a8;
  -[CNPhotoPickerMonogramProviderItem imageData](self, "imageData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)CNPhotoPickerMonogramProviderItem;
  v20 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](&v23, sel_initWithImageData_thumbnailImageData_fullscreenImageData_cropRect_, v19, 0, 0, x, y, width, height);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_renderingScope, a7);
    objc_storeStrong((id *)&v20->_avatarRenderer, a8);
    v20->_isVariantOptionItem = a9;
    v21 = v20;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNPhotoPickerMonogramProviderItem;
  v4 = -[CNPhotoPickerProviderItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRenderingScope:", v5);

  -[CNPhotoPickerMonogramProviderItem avatarRenderer](self, "avatarRenderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvatarRenderer:", v6);

  -[CNPhotoPickerMonogramProviderItem visualIdentity](self, "visualIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualIdentity:", v7);

  -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMonogramData:", v8);

  objc_msgSend(v4, "setIsVariantOptionItem:", -[CNPhotoPickerMonogramProviderItem isVariantOptionItem](self, "isVariantOptionItem"));
  return v4;
}

- (void)setVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_visualIdentity, a3);
  -[CNPhotoPickerMonogramProviderItem renderMonogramData](self, "renderMonogramData");
}

- (BOOL)allowsVariants
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CNPhotoPickerMonogramProviderItem monogramVariantItemForColor:](self, "monogramVariantItemForColor:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monogramData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = -[CNPhotoPickerMonogramProviderItem isVariantOptionItem](self, "isVariantOptionItem");

  return v5;
}

- (unint64_t)imageType
{
  return 2;
}

- (UIColor)backgroundColor
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D70A78]);
  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithColorName:", v6);
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D70A78], "defaultGradientStartColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v8;
}

- (BOOL)shouldShowCaption
{
  return 0;
}

- (BOOL)allowsEditing
{
  _BOOL4 v3;
  objc_super v5;

  if (-[CNPhotoPickerMonogramProviderItem allowsVariants](self, "allowsVariants")
    || (v3 = -[CNPhotoPickerMonogramProviderItem allowsMoveAndScale](self, "allowsMoveAndScale")))
  {
    v5.receiver = self;
    v5.super_class = (Class)CNPhotoPickerMonogramProviderItem;
    LOBYTE(v3) = -[CNPhotoPickerProviderItem allowsEditing](&v5, sel_allowsEditing);
  }
  return v3;
}

- (BOOL)allowsMoveAndScale
{
  return 0;
}

- (BOOL)isGrayMonogramItem
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)localizedVariantsTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PHOTO_SELECT_COLOR"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)variantIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)imageData
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = -[CNPhotoPickerMonogramProviderItem isContactImage](self, "isContactImage"),
        v4,
        !v5))
  {
    -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerMonogramProviderItem;
    -[CNPhotoPickerProviderItem imageData](&v8, sel_imageData);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)thumbnailImageData
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = -[CNPhotoPickerMonogramProviderItem isContactImage](self, "isContactImage"),
        v4,
        !v5))
  {
    -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerMonogramProviderItem;
    -[CNPhotoPickerProviderItem thumbnailImageData](&v8, sel_thumbnailImageData);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)generateThumbnailImageDataIfNeeded
{
  void *v3;

  -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!-[CNPhotoPickerMonogramProviderItem isContactImage](self, "isContactImage"))
  {
    -[CNPhotoPickerMonogramProviderItem renderMonogramData](self, "renderMonogramData");
  }
  return -[CNPhotoPickerMonogramProviderItem thumbnailImageData](self, "thumbnailImageData");
}

- (id)generateMonogramImage
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[CNPhotoPickerMonogramProviderItem isVariantOptionItem](self, "isVariantOptionItem");
  if (v3)
    v4 = 4;
  else
    v4 = 0;
  v5 = *MEMORY[0x1E0D13848];
  -[CNPhotoPickerMonogramProviderItem monogramText](self, "monogramText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) & 1) != 0)
  {
    -[CNPhotoPickerMonogramProviderItem visualIdentity](self, "visualIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "abbreviatedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNPhotoPickerMonogramProviderItem monogramText](self, "monogramText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v3 && (*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v8))
  {
    -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhotoPickerVariantsManager monogramColorGradientBackground:](CNPhotoPickerVariantsManager, "monogramColorGradientBackground:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNPhotoPickerMonogramProviderItem avatarRenderer](self, "avatarRenderer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "renderMonogramForString:color:scope:prohibitedSources:", v8, v11, v13, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)generateMonogramData
{
  UIImage *v2;
  void *v3;

  -[CNPhotoPickerMonogramProviderItem generateMonogramImage](self, "generateMonogramImage");
  v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)renderMonogramData
{
  id v3;

  -[CNPhotoPickerMonogramProviderItem generateMonogramData](self, "generateMonogramData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerMonogramProviderItem updateWithMonogramData:](self, "updateWithMonogramData:", v3);

}

- (NSString)monogramText
{
  void *v3;
  NSString *v4;
  NSString *monogramText;

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))() & 1) == 0)
  {
    -[CNPhotoPickerMonogramProviderItem visualIdentity](self, "visualIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "abbreviatedName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    monogramText = self->_monogramText;
    self->_monogramText = v4;

  }
  return self->_monogramText;
}

- (void)updateWithMonogramData:(id)a3
{
  id v4;

  -[CNPhotoPickerMonogramProviderItem setMonogramData:](self, "setMonogramData:", a3);
  -[CNPhotoPickerProviderItem clearThumbnailImage](self, "clearThumbnailImage");
  -[CNPhotoPickerProviderItem delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerItemDidUpdate:", self);

}

- (void)updateVisualIdentity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "clearImage");
  -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImageData:", v4);

  -[CNPhotoPickerMonogramProviderItem monogramData](self, "monogramData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_md5Hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImageHash:", v6);

  -[CNPhotoPickerMonogramProviderItem thumbnailImageData](self, "thumbnailImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setThumbnailImageData:", v7);

  -[CNPhotoPickerMonogramProviderItem visualIdentity](self, "visualIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "abbreviatedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAbbreviatedName:", v9);

  objc_msgSend(v10, "updateImageType:", 2);
  objc_msgSend(v10, "setMemojiMetadata:", 0);

}

- (id)monogramVariantItemForColor:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CNPhotoPickerMonogramProviderItem *v17;
  void *v18;
  CNPhotoPickerMonogramProviderItem *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  v7 = v6;
  v9 = v8;
  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;
  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rightToLeft");
  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", v14, objc_msgSend(v15, "avatarViewStyle"), v4, v7, v9, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [CNPhotoPickerMonogramProviderItem alloc];
  -[CNPhotoPickerMonogramProviderItem avatarRenderer](self, "avatarRenderer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CNPhotoPickerMonogramProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:](v17, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:renderingScope:avatarRenderer:isVariantOptionItem:", 0, 0, 0, v16, v18, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[CNPhotoPickerProviderItem delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem setDelegate:](v19, "setDelegate:", v20);

  -[CNPhotoPickerMonogramProviderItem visualIdentity](self, "visualIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  -[CNPhotoPickerMonogramProviderItem setVisualIdentity:](v19, "setVisualIdentity:", v22);

  return v19;
}

- (id)createVariantsItemsWithVariantsManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!-[CNPhotoPickerMonogramProviderItem allowsVariants](self, "allowsVariants", a3))
    return MEMORY[0x1E0C9AA60];
  -[CNPhotoPickerMonogramProviderItem monogramVariantItemForColor:](self, "monogramVariantItemForColor:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerMonogramProviderItem createColorVariantItems](self, "createColorVariantItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createColorVariantItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0D70A78], "availableColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CNPhotoPickerMonogramProviderItem_createColorVariantItems__block_invoke;
  v7[3] = &unk_1E204E588;
  v7[4] = self;
  objc_msgSend(v3, "_cn_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_51569);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createColorVariantItemsExcludingSelf
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[CNPhotoPickerMonogramProviderItem createColorVariantItems](self, "createColorVariantItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__CNPhotoPickerMonogramProviderItem_createColorVariantItemsExcludingSelf__block_invoke;
  v6[3] = &unk_1E204F1C8;
  v6[4] = self;
  objc_msgSend(v3, "_cn_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contactImageForMetadataStore
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0C97220]);
  -[CNPhotoPickerMonogramProviderItem imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v6, "setSource:", 1);
  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVariant:", v11);

  }
  -[CNPhotoPickerMonogramProviderItem monogramText](self, "monogramText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayString:", v12);

  return v6;
}

- (id)updatedProviderItemWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNPhotoPickerMonogramProviderItem visualIdentity](self, "visualIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAbbreviatedName:", v4);

  -[CNPhotoPickerMonogramProviderItem renderingScope](self, "renderingScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerMonogramProviderItem monogramVariantItemForColor:](self, "monogramVariantItemForColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke;
  v17[3] = &unk_1E2050050;
  v17[4] = self;
  v18 = v4;
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E2050050;
  aBlock[4] = self;
  v8 = v18;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_3;
  v13[3] = &unk_1E2050050;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  v11 = _Block_copy(v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v10, v6, self, v17, v9, v11, 0);

  return (char)self;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke;
  v7[3] = &unk_1E204ED08;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke_2;
  aBlock[3] = &unk_1E204ED08;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (void)setMonogramText:(id)a3
{
  objc_storeStrong((id *)&self->_monogramText, a3);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (void)setAvatarRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRenderer, a3);
}

- (CNAvatarImageRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setRenderingScope:(id)a3
{
  objc_storeStrong((id *)&self->_renderingScope, a3);
}

- (BOOL)isContactImage
{
  return self->_isContactImage;
}

- (void)setIsContactImage:(BOOL)a3
{
  self->_isContactImage = a3;
}

- (BOOL)hasUnknownColor
{
  return self->_hasUnknownColor;
}

- (void)setHasUnknownColor:(BOOL)a3
{
  self->_hasUnknownColor = a3;
}

- (NSData)monogramData
{
  return self->_monogramData;
}

- (void)setMonogramData:(id)a3
{
  objc_storeStrong((id *)&self->_monogramData, a3);
}

- (BOOL)isVariantOptionItem
{
  return self->_isVariantOptionItem;
}

- (void)setIsVariantOptionItem:(BOOL)a3
{
  self->_isVariantOptionItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramData, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_monogramText, 0);
}

uint64_t __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "visualIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __41__CNPhotoPickerMonogramProviderItem_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "renderingScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "objectHash:", v4);

  return v5;
}

uint64_t __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "visualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "visualIdentity");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "visualIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "visualIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

uint64_t __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 32), "renderingScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "renderingScope");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorName");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v14 = 0;
      v12 = 1;
LABEL_7:

      goto LABEL_8;
    }
    v14 = (void *)v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "renderingScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "renderingScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (!v4)
    goto LABEL_7;
LABEL_8:

  return v12;
}

uint64_t __45__CNPhotoPickerMonogramProviderItem_isEqual___block_invoke_3(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasUnknownColor");
  return v2 ^ objc_msgSend(*(id *)(a1 + 40), "hasUnknownColor") ^ 1;
}

uint64_t __73__CNPhotoPickerMonogramProviderItem_createColorVariantItemsExcludingSelf__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "variantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variantIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5) ^ 1;
  return v6;
}

uint64_t __60__CNPhotoPickerMonogramProviderItem_createColorVariantItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "monogramVariantItemForColor:", a2);
}

BOOL __60__CNPhotoPickerMonogramProviderItem_createColorVariantItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "monogramData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
