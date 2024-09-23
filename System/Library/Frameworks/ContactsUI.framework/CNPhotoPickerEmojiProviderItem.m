@implementation CNPhotoPickerEmojiProviderItem

- (CNPhotoPickerEmojiProviderItem)initWithStringRepresentation:(id)a3 backgroundColorVariant:(id)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CNPhotoPickerVariantsManager *v8;
  id v10;
  id v11;
  CNPhotoPickerEmojiProviderItem *v12;
  CNPhotoPickerEmojiProviderItem *v13;
  void *v14;
  CNPhotoPickerEmojiProviderItem *v15;

  height = a5.height;
  width = a5.width;
  v8 = (CNPhotoPickerVariantsManager *)a3;
  v10 = a3;
  v11 = a4;
  v12 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](self, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stringRepresentation, v8);
    v14 = v11;
    if (!v11)
    {
      v8 = objc_alloc_init(CNPhotoPickerVariantsManager);
      -[CNPhotoPickerVariantsManager randomColorVariant](v8, "randomColorVariant");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v13->_backgroundColorVariant, v14);
    if (!v11)
    {

    }
    v13->_size.width = width;
    v13->_size.height = height;
    v15 = v13;
  }

  return v13;
}

- (id)copyWithStringRepresentation:(id)a3
{
  id v4;
  CNPhotoPickerEmojiProviderItem *v5;
  void *v6;
  CNPhotoPickerEmojiProviderItem *v7;

  v4 = a3;
  v5 = [CNPhotoPickerEmojiProviderItem alloc];
  -[CNPhotoPickerEmojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerEmojiProviderItem size](self, "size");
  v7 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v5, "initWithStringRepresentation:backgroundColorVariant:size:", v4, v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerEmojiProviderItem;
  v4 = -[CNPhotoPickerProviderItem copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[CNPhotoPickerEmojiProviderItem size](self, "size");
  objc_msgSend(v4, "setSize:");
  -[CNPhotoPickerEmojiProviderItem stringRepresentation](self, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringRepresentation:", v5);

  -[CNPhotoPickerEmojiProviderItem dataRepresentation](self, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataRepresentation:", v6);

  -[CNPhotoPickerEmojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColorVariant:", v7);

  return v4;
}

- (BOOL)allowsVariants
{
  return 1;
}

- (BOOL)allowsMoveAndScale
{
  return 0;
}

- (unint64_t)imageType
{
  return 4;
}

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;

  -[CNPhotoPickerEmojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)updateVisualIdentity:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerEmojiProviderItem;
  v3 = a3;
  -[CNPhotoPickerProviderItem updateVisualIdentity:](&v4, sel_updateVisualIdentity_, v3);
  objc_msgSend(v3, "updateImageType:", 4, v4.receiver, v4.super_class);

}

- (id)imageData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v3 = *MEMORY[0x1E0D13848];
  -[CNPhotoPickerEmojiProviderItem stringRepresentation](self, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[CNPhotoPickerEmojiProviderItem dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    v7 = -[CNPhotoPickerEmojiProviderItem generateThumbnailImageDataIfNeeded](self, "generateThumbnailImageDataIfNeeded");
    -[CNPhotoPickerEmojiProviderItem dataRepresentation](self, "dataRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerEmojiProviderItem;
  -[CNPhotoPickerProviderItem imageData](&v9, sel_imageData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)thumbnailImageData
{
  void *v3;
  void *v4;
  objc_super v6;

  -[CNPhotoPickerEmojiProviderItem dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPhotoPickerEmojiProviderItem dataRepresentation](self, "dataRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNPhotoPickerEmojiProviderItem;
    -[CNPhotoPickerProviderItem thumbnailImageData](&v6, sel_thumbnailImageData);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)generateThumbnailImageDataIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  UIImage *v10;
  void *v11;
  objc_super v13;

  -[CNPhotoPickerEmojiProviderItem dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  v5 = *MEMORY[0x1E0D13850];
  -[CNPhotoPickerEmojiProviderItem stringRepresentation](self, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v6))
  {

LABEL_7:
    -[CNPhotoPickerEmojiProviderItem stringRepresentation](self, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerEmojiProviderItem generateImageRepresentationForEmojiString:](self, "generateImageRepresentationForEmojiString:", v9);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerEmojiProviderItem setDataRepresentation:](self, "setDataRepresentation:", v11);

    -[CNPhotoPickerEmojiProviderItem dataRepresentation](self, "dataRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[CNPhotoPickerEmojiProviderItem thumbnailImageData](self, "thumbnailImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerEmojiProviderItem;
  v8 = -[CNPhotoPickerProviderItem generateThumbnailImageDataIfNeeded](&v13, sel_generateThumbnailImageDataIfNeeded);
LABEL_2:
  -[CNPhotoPickerEmojiProviderItem thumbnailImageData](self, "thumbnailImageData");
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

  v3 = objc_alloc(MEMORY[0x1E0C97220]);
  -[CNPhotoPickerEmojiProviderItem imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v6, "setSource:", 4);
  -[CNPhotoPickerEmojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVariant:", v8);

  -[CNPhotoPickerEmojiProviderItem stringRepresentation](self, "stringRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayString:", v9);

  return v6;
}

- (id)generateImageRepresentationForEmojiString:(id)a3
{
  __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  CNPhotoPickerVariantsManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[2];
  CGSize v29;
  CGRect v30;
  CGRect v31;

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = &stru_1E20507A8;
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  v7 = a3;
  v29.width = 190.0;
  v29.height = 190.0;
  UIGraphicsBeginImageContextWithOptions(v29, 0, 3.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, 190.0, 190.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addClip");
  -[CNPhotoPickerEmojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(CNPhotoPickerVariantsManager);
    -[CNPhotoPickerVariantsManager randomColorVariant](v10, "randomColorVariant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerEmojiProviderItem setBackgroundColorVariant:](self, "setBackgroundColorVariant:", v11);

  }
  -[CNPhotoPickerEmojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerVariantsManager colorGradientBackground:](CNPhotoPickerVariantsManager, "colorGradientBackground:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "drawInRect:", 0.0, 0.0, 190.0, 190.0);
  +[CNUIFontRepository visualIdentityEditorTextFont](CNUIFontRepository, "visualIdentityEditorTextFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fontWithSize:", 120.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  v27 = *MEMORY[0x1E0DC1138];
  v28[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v6, v18);

  objc_msgSend(v19, "size");
  v21 = v20;
  v23 = v22;
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = 190.0;
  v30.size.height = 190.0;
  v24 = CGRectGetMidX(v30) - v21 * 0.5;
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = 190.0;
  v31.size.height = 190.0;
  objc_msgSend(v19, "drawInRect:", v24, CGRectGetMidY(v31) - v23 * 0.5, v21, v23);
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v25;
}

- (id)updatedProviderItemWithText:(id)a3
{
  id v4;
  CNPhotoPickerEmojiProviderItem *v5;
  void *v6;
  CNPhotoPickerEmojiProviderItem *v7;

  v4 = a3;
  v5 = [CNPhotoPickerEmojiProviderItem alloc];
  -[CNPhotoPickerEmojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerEmojiProviderItem size](self, "size");
  v7 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v5, "initWithStringRepresentation:backgroundColorVariant:size:", v4, v6);

  return v7;
}

- (id)updatedProviderItemWithText:(id)a3 backgroundColorVariant:(id)a4
{
  id v6;
  id v7;
  CNPhotoPickerEmojiProviderItem *v8;
  CNPhotoPickerEmojiProviderItem *v9;

  v6 = a4;
  v7 = a3;
  v8 = [CNPhotoPickerEmojiProviderItem alloc];
  -[CNPhotoPickerEmojiProviderItem size](self, "size");
  v9 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v8, "initWithStringRepresentation:backgroundColorVariant:size:", v7, v6);

  return v9;
}

- (id)createVariantsItemsWithVariantsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  if (-[CNPhotoPickerEmojiProviderItem allowsVariants](self, "allowsVariants"))
  {
    objc_msgSend(v4, "avatarBackgrounds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__CNPhotoPickerEmojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke;
    v8[3] = &unk_1E204DE70;
    v8[4] = self;
    objc_msgSend(v5, "_cn_map:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (void)setStringRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_stringRepresentation, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void)setDataRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_dataRepresentation, a3);
}

- (CNPhotoPickerColorVariant)backgroundColorVariant
{
  return self->_backgroundColorVariant;
}

- (void)setBackgroundColorVariant:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorVariant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorVariant, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

id __73__CNPhotoPickerEmojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedProviderItemWithText:backgroundColorVariant:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)addNewEmojiProviderItemWithSize:(CGSize)a3
{
  return -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:]([CNPhotoPickerEmojiProviderItem alloc], "initWithStringRepresentation:backgroundColorVariant:size:", &stru_1E20507A8, 0, a3.width, a3.height);
}

+ (id)thumbnailViewForImage:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v5, v5);
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, v5, v5);
  objc_msgSend(v6, "center");
  objc_msgSend(v7, "setCenter:");
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setContentMode:", 2);
  objc_msgSend(v7, "setImage:", v3);

  objc_msgSend(v6, "addSubview:", v7);
  return v6;
}

+ (id)suggestedEmojiItemsForString:(id)a3 variantsManager:(id)a4 size:(CGSize)a5 locale:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const void *v15;
  void *v16;
  uint64_t v17;
  uint64_t EmojiTokensForString;
  const __CFArray *v19;
  CFIndex i;
  CNPhotoPickerEmojiProviderItem *v21;
  uint64_t String;
  void *v23;
  CNPhotoPickerEmojiProviderItem *v24;
  uint64_t v25;
  void *v27;
  id v28;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  height = a5.height;
  width = a5.width;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    v29 = v10;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F270]), "initWithQueryString:andLocale:", v10, v12);
    objc_msgSend(v27, "tokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    objc_msgSend(v12, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (const void *)CEMCreateEmojiLocaleData();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v13;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v34;
      v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(obj);
        if ((unint64_t)objc_msgSend(v16, "count") > 2)
          break;
        EmojiTokensForString = CEMEmojiLocaleDataCreateEmojiTokensForString();
        if (EmojiTokensForString)
        {
          v19 = (const __CFArray *)EmojiTokensForString;
          for (i = 0; i < CFArrayGetCount(v19); ++i)
          {
            CFArrayGetValueAtIndex(v19, i);
            v21 = [CNPhotoPickerEmojiProviderItem alloc];
            String = CEMEmojiTokenGetString();
            objc_msgSend(v11, "randomColorVariant");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:](v21, "initWithStringRepresentation:backgroundColorVariant:size:", String, v23, width, height);

            objc_msgSend(v16, "arrayByAddingObject:", v24);
            v25 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v25;
          }
          CFRelease(v19);
        }
        if (++v17 == v32)
        {
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v32)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }

    if (v15)
      CFRelease(v15);

    v12 = v28;
    v10 = v29;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

@end
