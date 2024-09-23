@implementation CNPhotoPickerProviderItem

- (CNPhotoPickerProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 cropRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CNPhotoPickerProviderItem *v20;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultSchedulerProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.PhotoPickerProviderItem.renderingQueue"));
  objc_msgSend(v17, "mainThreadScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](self, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", v15, v14, v13, 0, v18, v19, x, y, width, height);

  return v20;
}

- (CNPhotoPickerProviderItem)initWithImageData:(id)a3 thumbnailImageData:(id)a4 fullscreenImageData:(id)a5 imageFilterName:(id)a6 cropRect:(CGRect)a7 renderingQueue:(id)a8 callbackQueue:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  CNPhotoPickerProviderItem *v23;
  CNPhotoPickerProviderItem *v24;
  uint64_t v25;
  NSData *imageData;
  CNPhotoPickerProviderItem *v27;
  id v29;
  id v30;
  objc_super v31;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v19 = a3;
  v30 = a4;
  v29 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v31.receiver = self;
  v31.super_class = (Class)CNPhotoPickerProviderItem;
  v23 = -[CNPhotoPickerProviderItem init](&v31, sel_init);
  v24 = v23;
  if (v23)
  {
    -[CNPhotoPickerProviderItem rotateImageDataIfNeeded:](v23, "rotateImageDataIfNeeded:", v19, v29, v30);
    v25 = objc_claimAutoreleasedReturnValue();
    imageData = v24->_imageData;
    v24->_imageData = (NSData *)v25;

    objc_storeStrong((id *)&v24->_thumbnailImageData, a4);
    objc_storeStrong((id *)&v24->_fullscreenImageData, a5);
    objc_storeStrong((id *)&v24->_imageFilterName, a6);
    v24->_cropRect.origin.x = x;
    v24->_cropRect.origin.y = y;
    v24->_cropRect.size.width = width;
    v24->_cropRect.size.height = height;
    objc_storeStrong((id *)&v24->_renderingQueue, a8);
    objc_storeStrong((id *)&v24->_callbackQueue, a9);
    v24->_allowsEditing = 1;
    v27 = v24;
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSData *imageData;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  imageData = self->_imageData;
  -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem fullscreenImageData](self, "fullscreenImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v8 = (void *)objc_msgSend(v4, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", imageData, v6, v7);

  objc_msgSend(v8, "setImageFilterName:", self->_imageFilterName);
  objc_msgSend(v8, "setAssetIdentifier:", self->_assetIdentifier);
  return v8;
}

- (BOOL)allowsVariants
{
  return 1;
}

- (BOOL)allowsMoveAndScale
{
  return 1;
}

- (BOOL)shouldShowCaption
{
  return 1;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (NSString)localizedVariantsTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PHOTO_SELECT_FILTER"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)imageData
{
  NSData *filteredImageData;
  NSData **p_filteredImageData;
  NSData *v5;
  NSData *v6;

  p_filteredImageData = &self->_filteredImageData;
  filteredImageData = self->_filteredImageData;
  if (!filteredImageData)
  {
    if (self->_imageFilterName)
    {
      objc_msgSend((id)objc_opt_class(), "generateImageDataWithData:filterName:", self->_imageData, self->_imageFilterName);
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      v6 = self->_filteredImageData;
      self->_filteredImageData = v5;

    }
    else
    {
      p_filteredImageData = &self->_imageData;
    }
    filteredImageData = *p_filteredImageData;
  }
  return filteredImageData;
}

- (NSData)originalImageData
{
  return self->_imageData;
}

- (void)generateAllImageDatasIfNeeded
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[CNPhotoPickerProviderItem imageData](self, "imageData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[CNPhotoPickerProviderItem fullscreenImageData](self, "fullscreenImageData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        return;
    }
    else
    {

    }
  }
  v8 = -[CNPhotoPickerProviderItem generateThumbnailImageDataIfNeeded](self, "generateThumbnailImageDataIfNeeded");
  -[CNPhotoPickerProviderItem fullscreenImageData](self, "fullscreenImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[CNPhotoPickerProviderItem imageData](self, "imageData");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerProviderItem setFullscreenImageData:](self, "setFullscreenImageData:", v10);

  }
}

- (id)generateThumbnailImageDataIfNeeded
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  CGRect v8;

  -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
    v4 = CGRectEqualToRect(v8, *MEMORY[0x1E0C9D648]);
    -[CNPhotoPickerProviderItem imageData](self, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CNPhotoPickerProviderItem setThumbnailImageData:](self, "setThumbnailImageData:", v5);
    }
    else
    {
      -[CNPhotoPickerProviderItem generateThumbnailImageDataWithData:](self, "generateThumbnailImageDataWithData:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderItem setThumbnailImageData:](self, "setThumbnailImageData:", v6);

    }
  }
  return -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
}

- (id)generateThumbnailImageDataWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  objc_msgSend(v5, "generateThumbnailImageDataWithData:cropRect:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearThumbnailImage
{
  -[CNPhotoPickerProviderItem setThumbnailImage:](self, "setThumbnailImage:", 0);
}

- (void)thumbnailViewWithPlaceholderProvider:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  -[CNPhotoPickerProviderItem loadingPlaceholderImage](self, "loadingPlaceholderImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_opt_class();
    -[CNPhotoPickerProviderItem loadingPlaceholderImage](self, "loadingPlaceholderImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thumbnailViewForImage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

  }
  else
  {
    v6[2](v6, 0);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CNPhotoPickerProviderItem_thumbnailViewWithPlaceholderProvider_completion___block_invoke;
  v13[3] = &unk_1E204B080;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  -[CNPhotoPickerProviderItem thumbnailViewWithCompletion:](self, "thumbnailViewWithCompletion:", v13);

}

- (void)thumbnailViewWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[CNPhotoPickerProviderItem thumbnailImage](self, "thumbnailImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_class();
    -[CNPhotoPickerProviderItem thumbnailImage](self, "thumbnailImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailViewForImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

  }
  else
  {
    -[CNPhotoPickerProviderItem renderingQueue](self, "renderingQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke;
    v10[3] = &unk_1E204F9B0;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

- (void)fullSizeViewWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  -[CNPhotoPickerProviderItem imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[CNPhotoPickerProviderItem fullscreenImageData](self, "fullscreenImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CNPhotoPickerProviderItem thumbnailViewWithCompletion:](self, "thumbnailViewWithCompletion:", v9);
      goto LABEL_5;
    }
  }
  v6 = (void *)objc_opt_class();
  -[CNPhotoPickerProviderItem croppedFullSizeImage](self, "croppedFullSizeImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailViewForImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v8);

LABEL_5:
}

- (UIImage)fullSizeImage
{
  UIImage *fullSizeImage;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  UIImage *v8;
  UIImage *v9;

  fullSizeImage = self->_fullSizeImage;
  if (!fullSizeImage)
  {
    -[CNPhotoPickerProviderItem imageData](self, "imageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {
      -[CNPhotoPickerProviderItem fullscreenImageData](self, "fullscreenImageData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        -[CNPhotoPickerProviderItem fullscreenImageData](self, "fullscreenImageData");
      else
        -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v4);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->_fullSizeImage;
    self->_fullSizeImage = v8;

    fullSizeImage = self->_fullSizeImage;
  }
  return fullSizeImage;
}

- (UIImage)croppedFullSizeImage
{
  UIImage *croppedFullSizeImage;
  void *v4;
  _BOOL4 v5;
  UIImage *v6;
  UIImage *v7;
  UIImage *v8;
  UIImage *v9;
  CGImage *v10;
  CGImage *v11;
  UIImage *v12;
  UIImage *v13;
  CGRect v15;
  CGRect v16;

  croppedFullSizeImage = self->_croppedFullSizeImage;
  if (croppedFullSizeImage)
  {
LABEL_8:
    v8 = croppedFullSizeImage;
    return v8;
  }
  -[CNPhotoPickerProviderItem fullSizeImage](self, "fullSizeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
    v5 = CGRectEqualToRect(v15, *MEMORY[0x1E0C9D648]);
    -[CNPhotoPickerProviderItem fullSizeImage](self, "fullSizeImage");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = self->_croppedFullSizeImage;
      self->_croppedFullSizeImage = v6;

    }
    else
    {
      v9 = objc_retainAutorelease(v6);
      v10 = -[UIImage CGImage](v9, "CGImage");
      -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
      v11 = CGImageCreateWithImageInRect(v10, v16);

      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v11);
      v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v13 = self->_croppedFullSizeImage;
      self->_croppedFullSizeImage = v12;

      CGImageRelease(v11);
    }
    croppedFullSizeImage = self->_croppedFullSizeImage;
    goto LABEL_8;
  }
  v8 = 0;
  return v8;
}

- (void)applyVariantEffectToFullsizeImageWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[CNPhotoPickerProviderItem imageFilterName](self, "imageFilterName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNPhotoPickerProviderItem setThumbnailImageData:](self, "setThumbnailImageData:", 0);
    -[CNPhotoPickerProviderItem renderingQueue](self, "renderingQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke;
    v7[3] = &unk_1E204F9B0;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "performBlock:", v7);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)updateContact:(id)a3
{
  id v4;
  CNVisualIdentity *v5;

  v4 = a3;
  v5 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v4);
  -[CNPhotoPickerProviderItem updateVisualIdentity:](self, "updateVisualIdentity:", v5);
  -[CNVisualIdentity updateImageForContact:](v5, "updateImageForContact:", v4);

}

- (void)updateVisualIdentity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setMemojiMetadata:", 0);
  -[CNPhotoPickerProviderItem generateAllImageDatasIfNeeded](self, "generateAllImageDatasIfNeeded");
  -[CNPhotoPickerProviderItem imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImageData:", v4);

  -[CNPhotoPickerProviderItem imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_md5Hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImageHash:", v6);

  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  objc_msgSend(v9, "setCropRect:");
  -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailImageData:", v7);

  -[CNPhotoPickerProviderItem fullscreenImageData](self, "fullscreenImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFullscreenImageData:", v8);

  objc_msgSend(v9, "updateImageType:", 1);
}

- (id)generatePhotoFilterVariants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v31[5];
  id v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNPhotoPickerProviderItem originalImageData](self, "originalImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerProviderItem generateThumbnailImageDataWithData:](self, "generateThumbnailImageDataWithData:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageWithDataPreservingScale:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  if (v8 > 256.0 || (objc_msgSend(v7, "size"), v9 = 1.0, v10 > 256.0))
  {
    objc_msgSend(v7, "size");
    v12 = v11;
    objc_msgSend(v7, "size");
    if (v12 >= v13)
      v14 = v13;
    else
      v14 = v12;
    v9 = 256.0 / v14;
  }
  v15 = objc_alloc((Class)objc_opt_class());
  -[CNPhotoPickerProviderItem originalImageData](self, "originalImageData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem originalImageData](self, "originalImageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v18 = (void *)objc_msgSend(v15, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v16, v5, v17);

  objc_msgSend(v18, "setImageFilterName:", 0);
  CNContactsUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PHOTO_FILTER_ORIGINAL_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocalizedVariantDisplayName:", v20);

  objc_msgSend(v3, "_cn_addNonNilObject:", v18);
  objc_msgSend(v7, "scale");
  v22 = v21;
  objc_msgSend(v7, "size");
  v24 = v9 * v23;
  objc_msgSend(v7, "size");
  v26 = v9 * v25;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __56__CNPhotoPickerProviderItem_generatePhotoFilterVariants__block_invoke;
  v31[3] = &unk_1E204B0A8;
  v31[4] = self;
  v27 = v3;
  v32 = v27;
  +[CNPhotoPickerImageWithEffectGenerator imagesByApplyingEffectsToImageData:withScaleFactor:originalImageScale:cropRect:completion:](CNPhotoPickerImageWithEffectGenerator, "imagesByApplyingEffectsToImageData:withScaleFactor:originalImageScale:cropRect:completion:", v5, v31, v9, v22, 0.0, 0.0, v24, v26);
  v28 = v32;
  v29 = v27;

  return v29;
}

- (id)rotateImageDataIfNeeded:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  UIImage *v14;
  id v15;
  CGSize v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageWithDataPreservingScale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "imageOrientation"))
  {
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "scale");
    v10 = v9;
    v17.width = v6;
    v17.height = v8;
    UIGraphicsBeginImageContextWithOptions(v17, 0, v10);
    objc_msgSend(v4, "size");
    v12 = v11;
    objc_msgSend(v4, "size");
    objc_msgSend(v4, "drawInRect:", 0.0, 0.0, v12, v13);
    UIGraphicsGetImageFromCurrentImageContext();
    v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    UIImageJPEGRepresentation(v14, 0.8);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v3;
  }

  return v15;
}

- (unint64_t)imageType
{
  return 1;
}

- (id)contactImageForMetadataStore
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0C97220]);
  -[CNPhotoPickerProviderItem originalImageData](self, "originalImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v13, v6, v8, v10, v12);

  -[CNPhotoPickerProviderItem imageFilterName](self, "imageFilterName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVariant:", v15);

  objc_msgSend(v14, "setSource:", 2);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  BOOL (*v12)(uint64_t);
  void *v13;
  CNPhotoPickerProviderItem *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__CNPhotoPickerProviderItem_isEqual___block_invoke;
  v16[3] = &unk_1E2050050;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __37__CNPhotoPickerProviderItem_isEqual___block_invoke_2;
  v13 = &unk_1E2050050;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:equalToOther:withBlocks:", self, v7, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __33__CNPhotoPickerProviderItem_hash__block_invoke;
  v3[3] = &unk_1E204ED08;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageData, a3);
}

- (NSString)recentsIdentifier
{
  return self->_recentsIdentifier;
}

- (void)setRecentsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recentsIdentifier, a3);
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetIdentifier, a3);
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (NSString)localizedVariantDisplayName
{
  return self->_localizedVariantDisplayName;
}

- (void)setLocalizedVariantDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedVariantDisplayName, a3);
}

- (CNScheduler)renderingQueue
{
  return self->_renderingQueue;
}

- (CNScheduler)callbackQueue
{
  return self->_callbackQueue;
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (void)setSortDate:(id)a3
{
  objc_storeStrong((id *)&self->_sortDate, a3);
}

- (CNPhotoPickerProviderItemDelegate)delegate
{
  return (CNPhotoPickerProviderItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setFullSizeImage:(id)a3
{
  objc_storeStrong((id *)&self->_fullSizeImage, a3);
}

- (void)setCroppedFullSizeImage:(id)a3
{
  objc_storeStrong((id *)&self->_croppedFullSizeImage, a3);
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (UIImage)loadingPlaceholderImage
{
  return self->_loadingPlaceholderImage;
}

- (void)setLoadingPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_loadingPlaceholderImage, a3);
}

- (NSData)fullscreenImageData
{
  return self->_fullscreenImageData;
}

- (void)setFullscreenImageData:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenImageData, a3);
}

- (NSData)filteredImageData
{
  return self->_filteredImageData;
}

- (void)setFilteredImageData:(id)a3
{
  objc_storeStrong((id *)&self->_filteredImageData, a3);
}

- (NSString)imageFilterName
{
  return self->_imageFilterName;
}

- (void)setImageFilterName:(id)a3
{
  objc_storeStrong((id *)&self->_imageFilterName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilterName, 0);
  objc_storeStrong((id *)&self->_filteredImageData, 0);
  objc_storeStrong((id *)&self->_fullscreenImageData, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_croppedFullSizeImage, 0);
  objc_storeStrong((id *)&self->_fullSizeImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_localizedVariantDisplayName, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_recentsIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

uint64_t __33__CNPhotoPickerProviderItem_hash__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "imageData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

uint64_t __37__CNPhotoPickerProviderItem_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToData:", v3);

  return v4;
}

BOOL __37__CNPhotoPickerProviderItem_isEqual___block_invoke_2(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect v15;
  CGRect v16;

  objc_msgSend(*(id *)(a1 + 32), "cropRect");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "cropRect");
  v16.origin.x = v10;
  v16.origin.y = v11;
  v16.size.width = v12;
  v16.size.height = v13;
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  return CGRectEqualToRect(v15, v16);
}

void __56__CNPhotoPickerProviderItem_generatePhotoFilterVariants__block_invoke(uint64_t a1, UIImage *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  UIImageJPEGRepresentation(a2, 0.8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "originalImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cropRect");
  v9 = (void *)objc_msgSend(v6, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v7, v12, v8);

  objc_msgSend(v9, "setImageFilterName:", v5);
  +[CNPhotoPickerImageWithEffectGenerator displayNameForFilterNamed:](CNPhotoPickerImageWithEffectGenerator, "displayNameForFilterNamed:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setLocalizedVariantDisplayName:", v10);
  objc_msgSend(*(id *)(a1 + 32), "assetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssetIdentifier:", v11);

  objc_msgSend(*(id *)(a1 + 40), "_cn_addNonNilObject:", v9);
}

void __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "generateAllImageDatasIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2;
  v3[3] = &unk_1E204FB40;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performBlock:", v3);

}

uint64_t __77__CNPhotoPickerProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "generateThumbnailImageDataIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke_2;
  v7[3] = &unk_1E204F098;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

void __57__CNPhotoPickerProviderItem_thumbnailViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setThumbnailImage:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend((id)objc_opt_class(), "thumbnailViewForImage:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __77__CNPhotoPickerProviderItem_thumbnailViewWithPlaceholderProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "loadingPlaceholderImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, BOOL))(v2 + 16))(v2, v4, v5 != 0);

  }
}

+ (id)generateImageDataWithData:(id)a3 filterName:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  UIImage *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C9DD90];
  v7 = a4;
  objc_msgSend(v6, "contextWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerImageWithEffectGenerator imageByApplyingEffect:withContext:toImageData:](CNPhotoPickerImageWithEffectGenerator, "imageByApplyingEffect:withContext:toImageData:", v7, v8, v5);
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    UIImageJPEGRepresentation(v9, 0.8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

+ (id)generateThumbnailImageDataWithData:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  id v10;
  CGImage *v11;
  CGImage *v12;
  UIImage *v13;
  CGRect v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  if (v8)
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    if (CGRectEqualToRect(v15, *MEMORY[0x1E0C9D648]))
    {
      v9 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v8);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (CGImage *)objc_msgSend(v10, "CGImage");
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      v12 = CGImageCreateWithImageInRect(v11, v16);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v12);
      v13 = (UIImage *)objc_claimAutoreleasedReturnValue();

      CGImageRelease(v12);
      UIImageJPEGRepresentation(v13, 0.8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  v5 = fmax(v4, 90.0);
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

@end
