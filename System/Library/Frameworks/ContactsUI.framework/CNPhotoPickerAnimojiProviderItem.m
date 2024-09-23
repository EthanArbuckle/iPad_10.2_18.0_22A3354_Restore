@implementation CNPhotoPickerAnimojiProviderItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  v4 = -[CNPhotoPickerProviderItem copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[CNPhotoPickerAnimojiProviderItem _generatedImageData](self, "_generatedImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_generatedImageData:", v5);

  -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_originalImageData:", v6);

  -[CNPhotoPickerAnimojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColorVariant:", v7);

  -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvatarRecord:", v8);

  -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPoseConfiguration:", v9);

  -[CNPhotoPickerAnimojiProviderItem originalImageSize](self, "originalImageSize");
  objc_msgSend(v4, "setOriginalImageSize:");
  -[CNPhotoPickerAnimojiProviderItem edgeInsets](self, "edgeInsets");
  objc_msgSend(v4, "setEdgeInsets:");
  return v4;
}

- (BOOL)allowsVariants
{
  void *v2;
  BOOL v3;

  -[CNPhotoPickerAnimojiProviderItem originalImageData](self, "originalImageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)localizedVariantsTitle
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  -[CNPhotoPickerAnimojiProviderItem originalImageData](self, "originalImageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("PHOTO_SELECT_COLOR");
  else
    v5 = CFSTR("PHOTO_ANIMOJI_SELECT_POSE");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)allowsMoveAndScale
{
  return 0;
}

- (BOOL)shouldShowCaption
{
  return 0;
}

- (id)imageData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[CNPhotoPickerAnimojiProviderItem _generatedImageData](self, "_generatedImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
    -[CNPhotoPickerProviderItem imageData](&v8, sel_imageData);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)originalImageData
{
  return self->__originalImageData;
}

- (void)updateVisualIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  -[CNPhotoPickerProviderItem updateVisualIdentity:](&v16, sel_updateVisualIdentity_, v4);
  objc_msgSend(v4, "updateImageType:", 3);
  -[CNPhotoPickerAnimojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    -[CNPhotoPickerAnimojiProviderItem transformForMemojiMetadata](self, "transformForMemojiMetadata");
    v6 = (void *)MEMORY[0x1E0C97350];
    -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    objc_msgSend(v6, "memojiMetadataDataForAvatarRecord:poseConfiguration:backgroundColorDescription:cropTransform:", v7, v8, v10, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMemojiMetadata:", v11);

  }
  else
  {
    objc_msgSend(v4, "setMemojiMetadata:", 0);
  }

}

- (CGAffineTransform)transformForMemojiMetadata
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat MidY;
  double v43;
  CGFloat v44;
  double v45;
  CGAffineTransform *result;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v6 = v5 / 3.0;
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v8 = v7 / 3.0;
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v10 = v9 / 3.0;
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v12 = v11 / 3.0;
  v13 = objc_alloc(MEMORY[0x1E0DC3870]);
  -[CNPhotoPickerAnimojiProviderItem imageData](self, "imageData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithData:", v14);

  objc_msgSend(v15, "size");
  v17 = v16 / 3.0;
  objc_msgSend(v15, "size");
  v19 = v18 / 3.0;
  v60.origin.x = v6;
  v60.origin.y = v8;
  v60.size.width = v10;
  v60.size.height = v12;
  if (CGRectEqualToRect(v60, *MEMORY[0x1E0C9D648]))
  {
    v8 = 0.0;
    v12 = v19;
    v10 = v17;
    v6 = 0.0;
  }
  v51 = v10;
  v20 = v6;
  v47 = v19;
  v48 = v12;
  v49 = v8;
  -[CNPhotoPickerAnimojiProviderItem originalImageSize](self, "originalImageSize");
  v22 = v21;
  -[CNPhotoPickerAnimojiProviderItem originalImageSize](self, "originalImageSize");
  v24 = v23;
  -[CNPhotoPickerAnimojiProviderItem edgeInsets](self, "edgeInsets");
  v26 = v25 / 3.0;
  -[CNPhotoPickerAnimojiProviderItem edgeInsets](self, "edgeInsets");
  v28 = v27 / 3.0;
  -[CNPhotoPickerAnimojiProviderItem edgeInsets](self, "edgeInsets");
  v30 = v29 / 3.0;
  -[CNPhotoPickerAnimojiProviderItem edgeInsets](self, "edgeInsets");
  v32 = v31 / 3.0;
  v33 = floor(v17 / 1.1);
  v34 = floor(v33 / (v22 / v24));
  if (v22 >= v24)
    v35 = v22;
  else
    v35 = v24;
  v50 = v20;
  if (v33 != v34)
  {
    if (v35 == v33)
    {
      v36 = (v33 - v34) * 0.5;
      v26 = v26 + v36;
      v30 = v30 + v36;
    }
    else
    {
      v37 = (v34 - v33) * 0.5;
      v28 = v28 + v37;
      v32 = v32 + v37;
    }
  }
  v38 = v35 - (v32 + v28);
  v39 = v35 - (v30 + v26);
  v40 = v35 * 0.5;
  v61.origin.x = v28;
  v61.origin.y = v26;
  v61.size.width = v38;
  v61.size.height = v39;
  v41 = v40 - CGRectGetMidX(v61);
  v62.origin.x = v28;
  v62.origin.y = v26;
  v62.size.width = v38;
  v62.size.height = v39;
  MidY = CGRectGetMidY(v62);
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeTranslation(&v59, v41 / v40, (v40 - MidY) / v40);
  v63.origin.x = v50;
  v63.origin.y = v49;
  v63.size.width = v51;
  v63.size.height = v48;
  v43 = v17 * 0.5 - CGRectGetMidX(v63);
  v64.origin.x = v50;
  v64.origin.y = v49;
  v64.size.width = v51;
  v64.size.height = v48;
  v44 = CGRectGetMidY(v64);
  memset(&v58, 0, sizeof(v58));
  CGAffineTransformMakeTranslation(&v58, v43 / (v17 * 0.5), (v47 * 0.5 - v44) / (v47 * 0.5));
  memset(&v57, 0, sizeof(v57));
  t1 = v59;
  t2 = v58;
  CGAffineTransformConcat(&v57, &t1, &t2);
  memset(&t1, 0, sizeof(t1));
  v45 = v33 + -30.0;
  CGAffineTransformMakeScale(&t1, v33 / v45, v33 / v45);
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformMakeScale(&t2, v45 / v51, v45 / v51);
  v53 = t1;
  memset(&v54, 0, sizeof(v54));
  v52 = t2;
  CGAffineTransformConcat(&v54, &v53, &v52);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v53 = v57;
  v52 = v54;
  CGAffineTransformConcat(retstr, &v53, &v52);

  return result;
}

- (CNPhotoPickerAnimojiProviderItem)initWithOriginalImageData:(id)a3 cropRect:(CGRect)a4 backgroundColorVariant:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  CNPhotoPickerAnimojiProviderItem *v15;
  id v16;
  CNPhotoPickerAnimojiProviderItem *v17;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  -[CNPhotoPickerAnimojiProviderItem imageData](self, "imageData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  v15 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](&v19, sel_initWithImageData_thumbnailImageData_fullscreenImageData_cropRect_, v14, 0, 0, x, y, width, height);

  if (v15)
  {
    objc_storeStrong((id *)&v15->__originalImageData, a3);
    objc_storeStrong((id *)&v15->_backgroundColorVariant, a5);
    v16 = -[CNPhotoPickerAnimojiProviderItem generateImageDataIfNeeded](v15, "generateImageDataIfNeeded");
    v17 = v15;
  }

  return v15;
}

- (CNPhotoPickerAnimojiProviderItem)initWithOriginalImageData:(id)a3 cropRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  CNPhotoPickerAnimojiProviderItem *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  -[CNPhotoPickerAnimojiProviderItem imageData](self, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  v12 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](&v14, sel_initWithImageData_thumbnailImageData_fullscreenImageData_cropRect_, v11, 0, 0, x, y, width, height);

  if (v12)
    objc_storeStrong((id *)&v12->__originalImageData, a3);

  return v12;
}

- (CNPhotoPickerAnimojiProviderItem)initWithAvatarRecord:(id)a3 imageProvider:(id)a4 renderingScope:(id)a5 renderingQueue:(id)a6 callbackQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  CNPhotoPickerAnimojiProviderItem *v16;
  CNPhotoPickerAnimojiProviderItem *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  v16 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](&v19, sel_initWithImageData_thumbnailImageData_fullscreenImageData_imageFilterName_cropRect_renderingQueue_callbackQueue_, 0, 0, 0, 0, a6, a7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_avatarRecord, a3);
    objc_storeStrong((id *)&v17->_imageProvider, a4);
    objc_storeStrong((id *)&v17->_renderingScope, a5);
  }

  return v17;
}

- (id)copyWithColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  CGImage *v9;
  CGImage *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  uint64_t v21;
  CNPhotoPickerAnimojiProviderItem *v22;
  void *v23;
  CNPhotoPickerAnimojiProviderItem *v24;
  void *v25;
  void *v26;
  void *v27;
  CGSize v29;
  CGRect v30;
  CGRect v31;

  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = a3;
  -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnui_imageWithDataPreservingScale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  if (!CGRectEqualToRect(v30, *MEMORY[0x1E0C9D648]))
  {
    v8 = objc_retainAutorelease(v7);
    v9 = (CGImage *)objc_msgSend(v8, "CGImage");
    -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
    v10 = CGImageCreateWithImageInRect(v9, v31);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(v10);
  }
  objc_msgSend(v7, "size");
  if (v11 > 256.0)
  {
    objc_msgSend(v7, "size");
    v13 = v12 * 0.00390625;
    objc_msgSend(v7, "size");
    v15 = v14 / v13;
    objc_msgSend(v7, "size");
    v17 = v16 / v13;
    objc_msgSend(v7, "scale");
    v19 = v18;
    v29.width = v15;
    v29.height = v17;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v19);
    v20 = UIGraphicsGetImageFromCurrentImageContext();
    objc_msgSend(v7, "drawInRect:", 0.0, 0.0, v15, v17);
    UIGraphicsGetImageFromCurrentImageContext();
    v21 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v7 = (void *)v21;
  }
  v22 = [CNPhotoPickerAnimojiProviderItem alloc];
  -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v24 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:](v22, "initWithOriginalImageData:cropRect:", v23);

  -[CNPhotoPickerAnimojiProviderItem setBackgroundColorVariant:](v24, "setBackgroundColorVariant:", v5);
  -[CNPhotoPickerAnimojiProviderItem renderAvatarWithBackgroundWithImage:](v24, "renderAvatarWithBackgroundWithImage:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem setThumbnailImageData:](v24, "setThumbnailImageData:", v25);
  -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerAnimojiProviderItem setAvatarRecord:](v24, "setAvatarRecord:", v26);

  -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerAnimojiProviderItem setPoseConfiguration:](v24, "setPoseConfiguration:", v27);

  -[CNPhotoPickerAnimojiProviderItem originalImageSize](self, "originalImageSize");
  -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v24, "setOriginalImageSize:");
  -[CNPhotoPickerAnimojiProviderItem edgeInsets](self, "edgeInsets");
  -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v24, "setEdgeInsets:");

  return v24;
}

- (id)copyWithPoseConfiguration:(id)a3 generatorProvider:(id)a4
{
  id v6;
  id v7;
  CNPhotoPickerAnimojiProviderItem *v8;
  void *v9;
  void *v10;
  CNPhotoPickerAnimojiProviderItem *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = [CNPhotoPickerAnimojiProviderItem alloc];
  -[CNPhotoPickerProviderItem renderingQueue](self, "renderingQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem callbackQueue](self, "callbackQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:](v8, "initWithImageData:thumbnailImageData:fullscreenImageData:imageFilterName:cropRect:renderingQueue:callbackQueue:", 0, 0, 0, 0, v9, v10, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[CNPhotoPickerAnimojiProviderItem originalImageSize](self, "originalImageSize");
  -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v11, "setOriginalImageSize:");
  -[CNPhotoPickerAnimojiProviderItem edgeInsets](self, "edgeInsets");
  -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v11, "setEdgeInsets:");
  -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerAnimojiProviderItem setAvatarRecord:](v11, "setAvatarRecord:", v12);

  -[CNPhotoPickerAnimojiProviderItem setPoseConfiguration:](v11, "setPoseConfiguration:", v7);
  -[CNPhotoPickerAnimojiProviderItem setStickerGeneratorProvider:](v11, "setStickerGeneratorProvider:", v6);

  -[CNPhotoPickerAnimojiProviderItem imageData](self, "imageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0DC3870];
    -[CNPhotoPickerAnimojiProviderItem imageData](self, "imageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithData:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithRenderingMode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem setLoadingPlaceholderImage:](v11, "setLoadingPlaceholderImage:", v17);

  }
  return v11;
}

- (id)variantIdentifier
{
  void *v2;
  void *v3;

  -[CNPhotoPickerAnimojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)imageType
{
  return 3;
}

- (id)renderDefaultAvatarImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;

  -[CNPhotoPickerAnimojiProviderItem imageProvider](self, "imageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPhotoPickerAnimojiProviderItem imageProvider](self, "imageProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem renderingScope](self, "renderingScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageForRecord:scope:", v5, v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

    UIImagePNGRepresentation(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)renderAvatarWithPoseWithSize:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  CNAvatarStickerGeneratorProvider *v8;
  void *v9;
  CNAvatarStickerGeneratorProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__47906;
  v27 = __Block_byref_object_dispose__47907;
  v28 = 0;
  -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadIfNeeded");

    -[CNPhotoPickerAnimojiProviderItem stickerGeneratorProvider](self, "stickerGeneratorProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = [CNAvatarStickerGeneratorProvider alloc];
      -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CNAvatarStickerGeneratorProvider initWithAvatarRecord:](v8, "initWithAvatarRecord:", v9);
      -[CNPhotoPickerAnimojiProviderItem setStickerGeneratorProvider:](self, "setStickerGeneratorProvider:", v10);

    }
    -[CNPhotoPickerAnimojiProviderItem stickerGeneratorProvider](self, "stickerGeneratorProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAsync:", 0);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v13 = (void *)getAVTStickerGeneratorOptionsClass_softClass_47908;
    v33 = getAVTStickerGeneratorOptionsClass_softClass_47908;
    v14 = MEMORY[0x1E0C809B0];
    if (!getAVTStickerGeneratorOptionsClass_softClass_47908)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __getAVTStickerGeneratorOptionsClass_block_invoke_47909;
      v29[3] = &unk_1E204EBC0;
      v29[4] = &v30;
      __getAVTStickerGeneratorOptionsClass_block_invoke_47909((uint64_t)v29);
      v13 = (void *)v31[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v30, 8);
    v16 = objc_alloc_init(v15);
    objc_msgSend(v16, "setCorrectClipping:", 1);
    -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    objc_msgSend(v16, "setSizeMultiplier:", a3 / v18);

    -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __65__CNPhotoPickerAnimojiProviderItem_renderAvatarWithPoseWithSize___block_invoke;
    v22[3] = &unk_1E204DDF8;
    v22[4] = self;
    v22[5] = &v23;
    objc_msgSend(v12, "stickerImageWithConfiguration:options:completionHandler:", v19, v16, v22);

    -[CNPhotoPickerAnimojiProviderItem setStickerGeneratorProvider:](self, "setStickerGeneratorProvider:", 0);
    v20 = (id)v24[5];

  }
  else
  {
    v20 = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)renderAvatarWithBackgroundWithImageData:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageWithDataPreservingScale:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem renderAvatarWithBackgroundWithImage:](self, "renderAvatarWithBackgroundWithImage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)renderAvatarWithBackgroundWithImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  UIImage *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  -[CNPhotoPickerAnimojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerVariantsManager colorGradientBackground:](CNPhotoPickerVariantsManager, "colorGradientBackground:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "scale");
  objc_msgSend(v8, "setScale:");
  objc_msgSend(v8, "setOpaque:", 0);
  v9 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(v4, "size");
  v10 = (void *)objc_msgSend(v9, "initWithSize:format:", v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__CNPhotoPickerAnimojiProviderItem_renderAvatarWithBackgroundWithImage___block_invoke;
  v16[3] = &unk_1E204DE20;
  v17 = v7;
  v18 = v4;
  v11 = v4;
  v12 = v7;
  objc_msgSend(v10, "imageWithActions:", v16);
  v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)generateImageDataIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  -[CNPhotoPickerAnimojiProviderItem imageData](self, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNPhotoPickerAnimojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[CNPhotoPickerAnimojiProviderItem renderAvatarWithBackgroundWithImageData:](self, "renderAvatarWithBackgroundWithImageData:", v4);
        v7 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v7;
      }
      goto LABEL_11;
    }
    -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CNPhotoPickerAnimojiProviderItem renderAvatarWithPoseWithSize:](self, "renderAvatarWithPoseWithSize:", 420.0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNPhotoPickerAnimojiProviderItem imageProvider](self, "imageProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
LABEL_11:
        -[CNPhotoPickerAnimojiProviderItem set_generatedImageData:](self, "set_generatedImageData:", v4);
        return v4;
      }
      -[CNPhotoPickerAnimojiProviderItem renderDefaultAvatarImage](self, "renderDefaultAvatarImage");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v9;
    goto LABEL_11;
  }
  -[CNPhotoPickerAnimojiProviderItem imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)generateAllImageDatasIfNeeded
{
  id v3;
  objc_super v4;

  v3 = -[CNPhotoPickerAnimojiProviderItem generateImageDataIfNeeded](self, "generateImageDataIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
  -[CNPhotoPickerProviderItem generateAllImageDatasIfNeeded](&v4, sel_generateAllImageDatasIfNeeded);
}

- (id)generateThumbnailImageDataIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNPhotoPickerAnimojiProviderItem renderAvatarWithPoseWithSize:](self, "renderAvatarWithPoseWithSize:", 120.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
  }
  -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNPhotoPickerProviderItem thumbnailImageData](self, "thumbnailImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[CNPhotoPickerAnimojiProviderItem generateImageDataIfNeeded](self, "generateImageDataIfNeeded");
    v9.receiver = self;
    v9.super_class = (Class)CNPhotoPickerAnimojiProviderItem;
    -[CNPhotoPickerProviderItem generateThumbnailImageDataIfNeeded](&v9, sel_generateThumbnailImageDataIfNeeded);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)applyVariantEffectToFullsizeImageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNPhotoPickerProviderItem setThumbnailImageData:](self, "setThumbnailImageData:", 0);
  -[CNPhotoPickerProviderItem renderingQueue](self, "renderingQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke;
  v7[3] = &unk_1E204F9B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (id)createVariantsItemsWithVariantsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNAvatarStickerGeneratorProvider *v8;
  void *v9;
  CNAvatarStickerGeneratorProvider *v10;
  void *v11;
  CNAvatarStickerGeneratorProvider *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  CNAvatarStickerGeneratorProvider *v16;

  v4 = a3;
  -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "avatarBackgrounds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke_2;
    v14[3] = &unk_1E204DE70;
    v14[4] = self;
    objc_msgSend(v6, "_cn_map:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = [CNAvatarStickerGeneratorProvider alloc];
    -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNAvatarStickerGeneratorProvider initWithAvatarRecord:](v8, "initWithAvatarRecord:", v9);

    -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhotoPickerVariantsManager avatarPoseConfigurationsForAvatarRecord:](CNPhotoPickerVariantsManager, "avatarPoseConfigurationsForAvatarRecord:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke;
    v15[3] = &unk_1E204DE48;
    v15[4] = self;
    v16 = v10;
    v12 = v10;
    objc_msgSend(v6, "_cn_map:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc(MEMORY[0x1E0C97220]);
  -[CNPhotoPickerAnimojiProviderItem _originalImageData](self, "_originalImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem cropRect](self, "cropRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v4, v13, v6, v8, v10, v12);

  objc_msgSend(v14, "setSource:", 3);
  -[CNPhotoPickerAnimojiProviderItem backgroundColorVariant](self, "backgroundColorVariant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVariant:", v16);

  -[CNPhotoPickerAnimojiProviderItem avatarRecord](self, "avatarRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSourceIdentifier:", v18);

  v19 = (void *)MEMORY[0x1E0C97350];
  -[CNPhotoPickerAnimojiProviderItem poseConfiguration](self, "poseConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataForPoseConfiguration:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPoseConfigurationData:", v21);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[4];
  id v15;
  CNPhotoPickerAnimojiProviderItem *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke;
  v17[3] = &unk_1E2050050;
  v17[4] = self;
  v18 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E2050050;
  v7 = v18;
  v15 = v7;
  v16 = self;
  v8 = _Block_copy(aBlock);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_3;
  v12[3] = &unk_1E2050050;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  v10 = _Block_copy(v12);
  LOBYTE(self) = objc_msgSend(v6, "isObject:equalToOther:withBlocks:", self, v9, v17, v8, v10, 0);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD aBlock[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke;
  v11[3] = &unk_1E204ED08;
  v11[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_2;
  aBlock[3] = &unk_1E204ED08;
  v5 = _Block_copy(aBlock);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_3;
  v9[3] = &unk_1E204ED08;
  v9[4] = self;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (AVTStickerConfiguration)poseConfiguration
{
  return self->_poseConfiguration;
}

- (void)setPoseConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_poseConfiguration, a3);
}

- (CNPhotoPickerColorVariant)backgroundColorVariant
{
  return self->_backgroundColorVariant;
}

- (void)setBackgroundColorVariant:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorVariant, a3);
}

- (CGSize)originalImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalImageSize.width;
  height = self->_originalImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOriginalImageSize:(CGSize)a3
{
  self->_originalImageSize = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (NSData)_originalImageData
{
  return self->__originalImageData;
}

- (void)set_originalImageData:(id)a3
{
  objc_storeStrong((id *)&self->__originalImageData, a3);
}

- (NSData)_generatedImageData
{
  return self->__generatedImageData;
}

- (void)set_generatedImageData:(id)a3
{
  objc_storeStrong((id *)&self->__generatedImageData, a3);
}

- (UIImage)loadingPlaceholderImage
{
  return self->_loadingPlaceholderImage;
}

- (void)setLoadingPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_loadingPlaceholderImage, a3);
}

- (CNAvatarStickerGeneratorProvider)stickerGeneratorProvider
{
  return self->_stickerGeneratorProvider;
}

- (void)setStickerGeneratorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stickerGeneratorProvider, a3);
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setRenderingScope:(id)a3
{
  objc_storeStrong((id *)&self->_renderingScope, a3);
}

- (AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_stickerGeneratorProvider, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderImage, 0);
  objc_storeStrong((id *)&self->__generatedImageData, 0);
  objc_storeStrong((id *)&self->__originalImageData, 0);
  objc_storeStrong((id *)&self->_backgroundColorVariant, 0);
  objc_storeStrong((id *)&self->_poseConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

uint64_t __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "avatarRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

uint64_t __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "backgroundColorVariant");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

uint64_t __40__CNPhotoPickerAnimojiProviderItem_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_originalImageData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

uint64_t __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "avatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "avatarRecord");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v10 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "avatarRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "avatarRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (!v5)
    goto LABEL_6;
LABEL_7:

  return v10;
}

uint64_t __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_opt_class();
  v3 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 40), "backgroundColorVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "backgroundColorVariant");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v9 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "backgroundColorVariant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorVariant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (!v6)
    goto LABEL_9;
LABEL_10:

  return v9;
}

uint64_t __44__CNPhotoPickerAnimojiProviderItem_isEqual___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_originalImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_originalImageData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_originalImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_originalImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

id __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "copyWithPoseConfiguration:generatorProvider:", a2, *(_QWORD *)(a1 + 40));
}

id __75__CNPhotoPickerAnimojiProviderItem_createVariantsItemsWithVariantsManager___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "copyWithColor:", a2);
}

void __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "generateImageDataIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2;
  v4[3] = &unk_1E204FB40;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __84__CNPhotoPickerAnimojiProviderItem_applyVariantEffectToFullsizeImageWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__CNPhotoPickerAnimojiProviderItem_renderAvatarWithBackgroundWithImage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "drawInRect:");

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "format");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "drawInRect:");

}

void __65__CNPhotoPickerAnimojiProviderItem_renderAvatarWithPoseWithSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  UIImage *image;

  v3 = a2;
  objc_msgSend(v3, "size");
  objc_msgSend(*(id *)(a1 + 32), "setOriginalImageSize:");
  +[CNAvatarImageUtilities transparencyInsetsForImage:requiringFullOpacity:](CNAvatarImageUtilities, "transparencyInsetsForImage:requiringFullOpacity:", v3, 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "setEdgeInsets:");
  +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:usingTransparencyInsets:widthMultiplier:](CNAvatarImageUtilities, "croppedAndCenteredAvatarImageForImage:usingTransparencyInsets:widthMultiplier:", v3, v5, v7, v9, v11, 1.0);
  image = (UIImage *)objc_claimAutoreleasedReturnValue();

  UIImagePNGRepresentation(image);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

+ (id)log
{
  if (log_cn_once_token_1_47936 != -1)
    dispatch_once(&log_cn_once_token_1_47936, &__block_literal_global_47937);
  return (id)log_cn_once_object_1_47938;
}

void __39__CNPhotoPickerAnimojiProviderItem_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerAnimojiProviderItem");
  v1 = (void *)log_cn_once_object_1_47938;
  log_cn_once_object_1_47938 = (uint64_t)v0;

}

@end
