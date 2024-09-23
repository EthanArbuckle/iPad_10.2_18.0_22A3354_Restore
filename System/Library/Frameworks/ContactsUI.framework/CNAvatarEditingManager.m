@implementation CNAvatarEditingManager

- (CNAvatarEditingManager)initWithAvatarRecord:(id)a3 variantsManager:(id)a4
{
  return -[CNAvatarEditingManager initWithAvatarRecord:poseConfiguration:variantsManager:](self, "initWithAvatarRecord:poseConfiguration:variantsManager:", a3, 0, a4);
}

- (CNAvatarEditingManager)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 variantsManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAvatarEditingManager *v12;
  CNAvatarEditingManager *v13;
  CNAvatarEditingManager *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAvatarEditingManager;
  v12 = -[CNAvatarEditingManager init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarRecord, a3);
    objc_storeStrong((id *)&v13->_poseConfiguration, a4);
    objc_storeStrong((id *)&v13->_variantsManager, a5);
    v14 = v13;
  }

  return v13;
}

- (id)initForEditingWithAvatarRecord:(id)a3 variantsManager:(id)a4 fromViewController:(id)a5
{
  id v9;
  CNAvatarEditingManager *v10;
  CNAvatarEditingManager *v11;
  CNAvatarEditingManager *v12;

  v9 = a5;
  v10 = -[CNAvatarEditingManager initWithAvatarRecord:variantsManager:](self, "initWithAvatarRecord:variantsManager:", a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_viewController, a5);
    v12 = v11;
  }

  return v11;
}

- (CNPhotoPickerAnimojiProviderItem)originalItem
{
  CNPhotoPickerAnimojiProviderItem *originalItem;
  void *v4;
  CNPhotoPickerAnimojiProviderItem *v5;
  CNPhotoPickerAnimojiProviderItem *v6;

  originalItem = self->_originalItem;
  if (!originalItem)
  {
    -[CNAvatarEditingManager avatarRecord](self, "avatarRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:](CNPhotoPickerAnimojiProvider, "providerItemForAvatarRecord:", v4);
    v5 = (CNPhotoPickerAnimojiProviderItem *)objc_claimAutoreleasedReturnValue();
    v6 = self->_originalItem;
    self->_originalItem = v5;

    originalItem = self->_originalItem;
  }
  return originalItem;
}

- (UIViewController)viewController
{
  UIViewController *viewController;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  UIViewController *v8;
  UIViewController *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  viewController = self->_viewController;
  if (!viewController)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)getAVTCombinedPickerViewControllerClass_softClass;
    v15 = getAVTCombinedPickerViewControllerClass_softClass;
    if (!getAVTCombinedPickerViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getAVTCombinedPickerViewControllerClass_block_invoke;
      v11[3] = &unk_1E204EBC0;
      v11[4] = &v12;
      __getAVTCombinedPickerViewControllerClass_block_invoke((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    v6 = [v5 alloc];
    -[CNAvatarEditingManager avatarRecord](self, "avatarRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIViewController *)objc_msgSend(v6, "initWithSelectedRecord:", v7);

    -[UIViewController setDelegate:](v8, "setDelegate:", self);
    v9 = self->_viewController;
    self->_viewController = v8;

    viewController = self->_viewController;
  }
  return viewController;
}

- (id)captureFlashViewWithSize:(CGSize)a3 alpha:(double)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setAlpha:", a4);
  return v5;
}

- (void)combinedPickerViewControllerDidCancel:(id)a3
{
  id v4;

  -[CNAvatarEditingManager delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarEditingManager:didFinishWithProviderItem:", self, 0);

}

- (void)combinedPickerViewController:(id)a3 didSelectRecord:(id)a4 withStickerConfiguration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v7 = a5;
  v8 = a4;
  -[CNAvatarEditingManager setAvatarRecord:](self, "setAvatarRecord:", v8);
  +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:](CNPhotoPickerAnimojiProvider, "providerItemForAvatarRecord:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPoseConfiguration:", v7);
  -[CNAvatarEditingManager originalItem](self, "originalItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "originalImageSize");
  objc_msgSend(v9, "setOriginalImageSize:");

  -[CNAvatarEditingManager originalItem](self, "originalItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeInsets");
  objc_msgSend(v9, "setEdgeInsets:");

  -[CNAvatarEditingManager setPoseConfiguration:](self, "setPoseConfiguration:", v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke;
  v13[3] = &unk_1E2050400;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v12, "applyVariantEffectToFullsizeImageWithCompletion:", v13);

}

- (id)fullScreenImageFromImage:(id)a3 inSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[CNAvatarEditingManager computeFullscreenImageRectForScreenWithSize:](self, "computeFullscreenImageRectForScreenWithSize:", width, height);
  -[CNAvatarEditingManager renderImage:inRect:](self, "renderImage:inRect:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)computeFullscreenImageRectForScreenWithSize:(CGSize)a3
{
  double width;
  double height;
  double v5;
  double v6;
  CGRect result;

  if (a3.width <= a3.height)
    width = a3.width;
  else
    width = a3.height;
  if (a3.width <= a3.height)
    height = a3.height;
  else
    height = a3.width;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)renderImage:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  id v13;
  void *v14;
  CGSize v16;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  objc_msgSend(v6, "size");
  objc_msgSend(v6, "size");
  objc_msgSend(v6, "scale");
  UIRoundToScale();
  v8 = v7;
  objc_msgSend(v6, "scale");
  UIRoundToScale();
  v10 = v9;
  objc_msgSend(v6, "scale");
  v12 = v11;
  v16.width = width;
  v16.height = height;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v12);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  objc_msgSend(v6, "drawInRect:", 0.0, v10, width, v8);

  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

- (id)compositeImageDataForImage:(id)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  UIImage *v18;
  void *v19;
  CGSize v21;
  CGRect v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[CNAvatarEditingManager viewController](self, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "userInterfaceStyle") == 2)
      +[CNUIColorRepository photoPickerCaptureDarkBackgroundColor](CNUIColorRepository, "photoPickerCaptureDarkBackgroundColor");
    else
      +[CNUIColorRepository photoPickerCaptureLightBackgroundColor](CNUIColorRepository, "photoPickerCaptureLightBackgroundColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "size");
  v13 = v12;
  objc_msgSend(v6, "size");
  v15 = v14;
  objc_msgSend(v6, "scale");
  v17 = v16;
  v21.width = v13;
  v21.height = v15;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v17);
  objc_msgSend(v9, "setFill");
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v13;
  v22.size.height = v15;
  UIRectFill(v22);
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v13, v15);
  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  UIImagePNGRepresentation(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)prepareAvatarImageForPicker:(id)a3 synchronousCompletion:(id)a4
{
  void (**v6)(id, void *, double, double, double, double);
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  double x;
  double y;
  double width;
  double height;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v6 = (void (**)(id, void *, double, double, double, double))a4;
  v7 = a3;
  +[CNAvatarImageUtilities transparencyInsetsForImage:requiringFullOpacity:](CNAvatarImageUtilities, "transparencyInsetsForImage:requiringFullOpacity:", v7, 0);
  v9 = v8;
  objc_msgSend(v7, "size");
  v11 = v10;
  objc_msgSend(v7, "size");
  -[CNAvatarEditingManager croppedAndCenteredImageForGeneratedImage:toSize:](self, "croppedAndCenteredImageForGeneratedImage:toSize:", v7, v11, v12 + v12);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  +[CNAvatarImageUtilities transparencyInsetsForImage:requiringFullOpacity:](CNAvatarImageUtilities, "transparencyInsetsForImage:requiringFullOpacity:", v50, 0);
  v14 = v13;
  v15 = (void *)MEMORY[0x1E0D13A80];
  objc_msgSend(v50, "size");
  v17 = v16;
  objc_msgSend(v50, "size");
  objc_msgSend(v15, "centeredSquareCropRectInRect:", 0.0, 0.0, v17, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v50, "size");
  v28 = v27;
  objc_msgSend(v7, "scale");
  v30 = v28 - v14 / v29;
  v51.origin.x = v20;
  v51.origin.y = v22;
  v51.size.width = v24;
  v51.size.height = v26;
  v31 = v30 - CGRectGetMaxY(v51);
  objc_msgSend(v7, "scale");
  v33 = v31 - v32;
  if (v9 != 0.0)
    v33 = 0.0;
  v34 = v22 + v33;
  objc_msgSend(v50, "size");
  v36 = v35 * 0.1;
  +[CNAvatarImageUtilities paddedImage:withPadding:](CNAvatarImageUtilities, "paddedImage:withPadding:", v50, v35 * 0.1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52.origin.x = v20;
  v52.origin.y = v34;
  v52.size.width = v24;
  v52.size.height = v26;
  v53 = CGRectOffset(v52, v36, v36);
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  objc_msgSend(v7, "scale");
  v43 = v42 * x;
  objc_msgSend(v7, "scale");
  v45 = y * v44;
  objc_msgSend(v7, "scale");
  v47 = width * v46;
  objc_msgSend(v7, "scale");
  v49 = v48;

  v6[2](v6, v37, v43, v45, v47, height * v49);
}

- (void)presentImagePickerForImage:(id)a3 cropRect:(CGRect)a4 fadeIn:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a3;
  -[CNAvatarEditingManager setImageWithAlpha:](self, "setImageWithAlpha:", v14);
  -[CNAvatarEditingManager compositeImageDataForImage:backgroundColor:](self, "compositeImageDataForImage:backgroundColor:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAvatarEditingManager createImagePickerForEditingImageData:withCropRect:customBackgroundColor:](self, "createImagePickerForEditingImageData:withCropRect:customBackgroundColor:", v15, 0, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setModalTransitionStyle:", 2);
  objc_msgSend(v16, "setModalPresentationStyle:", 3);
  if (v6)
  {
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[CNAvatarEditingManager captureFlashViewWithSize:alpha:](self, "captureFlashViewWithSize:alpha:", v18, v19, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v20);

    -[CNAvatarEditingManager viewController](self, "viewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke;
    v25[3] = &unk_1E204F9B0;
    v26 = v20;
    v27 = v13;
    v23 = v20;
    objc_msgSend(v22, "presentViewController:animated:completion:", v16, 0, v25);

  }
  else
  {
    -[CNAvatarEditingManager viewController](self, "viewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "presentViewController:animated:completion:", v16, 1, 0);

  }
}

- (id)croppedAndCenteredImageForGeneratedImage:(id)a3 toSize:(CGSize)a4
{
  void *v4;
  void *v5;

  -[CNAvatarEditingManager fullScreenImageFromImage:inSize:](self, "fullScreenImageFromImage:inSize:", a3, a4.width, a4.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:widthMultiplier:](CNAvatarImageUtilities, "croppedAndCenteredAvatarImageForImage:widthMultiplier:", v4, 1.1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imagePickerForItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = a3;
  objc_msgSend(v5, "originalImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarEditingManager setImageWithAlpha:](self, "setImageWithAlpha:", v7);

  objc_msgSend(v5, "backgroundColorVariant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerVariantsManager nonAlphaColorForBackgroundColor:](CNPhotoPickerVariantsManager, "nonAlphaColorForBackgroundColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAvatarEditingManager imageWithAlpha](self, "imageWithAlpha");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarEditingManager compositeImageDataForImage:backgroundColor:](self, "compositeImageDataForImage:backgroundColor:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cropRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[CNAvatarEditingManager createImagePickerForEditingImageData:withCropRect:customBackgroundColor:](self, "createImagePickerForEditingImageData:withCropRect:customBackgroundColor:", v12, v10, v14, v16, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)createImagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 customBackgroundColor:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[7];
  _QWORD v26[8];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v26[7] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  if (v11)
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3880]), "_initWithSourceImageData:cropRect:", v11, x, y, width, height);
  else
    v13 = objc_alloc_init(MEMORY[0x1E0DC3880]);
  v14 = v13;
  objc_msgSend(v13, "setDelegate:", self);
  if (v12)
  {
    v15 = v12;
  }
  else
  {
    +[CNUIColorRepository photoPickerCaptureBackgroundColor](CNUIColorRepository, "photoPickerCaptureBackgroundColor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(v14, "_setImagePickerSavingOptions:", 7);
  v17 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v14, "_properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *MEMORY[0x1E0DC5910];
  v25[0] = *MEMORY[0x1E0DC4C68];
  v25[1] = v20;
  v26[0] = MEMORY[0x1E0C9AAB0];
  v26[1] = MEMORY[0x1E0C9AAB0];
  v21 = *MEMORY[0x1E0DC58C8];
  v25[2] = *MEMORY[0x1E0DC5860];
  v25[3] = v21;
  v26[2] = MEMORY[0x1E0C9AAB0];
  v26[3] = MEMORY[0x1E0C9AAB0];
  v22 = *MEMORY[0x1E0DC5900];
  v25[4] = *MEMORY[0x1E0DC5858];
  v25[5] = v22;
  v26[4] = MEMORY[0x1E0C9AAB0];
  v26[5] = MEMORY[0x1E0C9AAA0];
  v25[6] = *MEMORY[0x1E0DC58B0];
  v26[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addEntriesFromDictionary:", v23);

  objc_msgSend(v14, "_setProperties:", v19);
  return v14;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIImage *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSObject *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  CNPhotoPickerAnimojiProviderItem *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNAvatarEditingManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNAvatarEditingManager imageWithAlpha](self, "imageWithAlpha");
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C70]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "CGRectValue");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
    }
    else
    {
      v14 = *MEMORY[0x1E0C9D648];
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v22;
    v25 = v24;

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CA0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "size");
    v28 = v27;
    v30 = v29;

    if (v23 != v28 || v25 != v30)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v49 = 134218752;
        v50 = v28;
        v51 = 2048;
        v52 = v30;
        v53 = 2048;
        v54 = v23;
        v55 = 2048;
        v56 = v25;
        _os_log_impl(&dword_18AC56000, v32, OS_LOG_TYPE_DEFAULT, "Scaling cropRect, image size mismatch detected with returned UIImagePickerControllerOriginalImage {%.2f, %.2f} and original image provided on initialization {%.2f, %.2f}", (uint8_t *)&v49, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0D13A80], "scaledCropRect:fromSize:toSize:", v14, v16, v18, v20, v28, v30, v23, v25);
      objc_msgSend(MEMORY[0x1E0D13A80], "squareCropRect:toFitSize:");
      v14 = v33;
      v16 = v34;
      v18 = v35;
      v20 = v36;
    }
    -[CNAvatarEditingManager originalItem](self, "originalItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "backgroundColorVariant");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = v38;
    }
    else
    {
      -[CNAvatarEditingManager variantsManager](self, "variantsManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "avatarBackgrounds");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstObject");
      v40 = (id)objc_claimAutoreleasedReturnValue();

    }
    v43 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:]([CNPhotoPickerAnimojiProviderItem alloc], "initWithOriginalImageData:cropRect:backgroundColorVariant:", v10, v40, v14, v16, v18, v20);
    -[CNAvatarEditingManager originalItem](self, "originalItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "originalImageSize");
    -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v43, "setOriginalImageSize:");

    -[CNAvatarEditingManager avatarRecord](self, "avatarRecord");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem setAvatarRecord:](v43, "setAvatarRecord:", v45);

    -[CNAvatarEditingManager poseConfiguration](self, "poseConfiguration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem setPoseConfiguration:](v43, "setPoseConfiguration:", v46);

    -[CNAvatarEditingManager originalItem](self, "originalItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "edgeInsets");
    -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v43, "setEdgeInsets:");

    -[CNAvatarEditingManager delegate](self, "delegate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "avatarEditingManager:didFinishWithProviderItem:", self, v43);

  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v3;

  if (self->_viewController)
  {
    -[CNAvatarEditingManager viewController](self, "viewController", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (CNAvatarEditingManagerDelegate)delegate
{
  return (CNAvatarEditingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOriginalItem:(id)a3
{
  objc_storeStrong((id *)&self->_originalItem, a3);
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
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

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (UIImage)imageWithAlpha
{
  return self->_imageWithAlpha;
}

- (void)setImageWithAlpha:(id)a3
{
  objc_storeStrong((id *)&self->_imageWithAlpha, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWithAlpha, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_poseConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_originalItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_2;
  v7[3] = &unk_1E204F648;
  v8 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_3;
  v4[3] = &unk_1E204FB68;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0x20000, v7, v4, 0.1, 0.0);

}

uint64_t __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  void *v36;
  _QWORD v37[6];
  uint64_t v38;
  double *v39;
  uint64_t v40;
  const char *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  objc_msgSend(*(id *)(a1 + 32), "originalItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "edgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "edgeInsets");
  if (v6 != v14 || v4 != v11 || v10 != v13)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "edgeInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(*(id *)(a1 + 32), "originalItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEdgeInsets:", v19, v21, v23, v25);

    goto LABEL_11;
  }
  v17 = v12;

  if (v8 != v17)
    goto LABEL_10;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 40), "originalImageSize");
  v28 = v27;
  v30 = v29;
  objc_msgSend(*(id *)(a1 + 32), "originalItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setOriginalImageSize:", v28, v30);

  v32 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 40), "imageData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cnui_imageWithDataPreservingScale:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__32682;
  v48 = __Block_byref_object_dispose__32683;
  v49 = 0;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x4010000000;
  v41 = "";
  v35 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v42 = *MEMORY[0x1E0C9D648];
  v43 = v35;
  v36 = *(void **)(a1 + 32);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke_6;
  v37[3] = &unk_1E204C3C8;
  v37[4] = &v44;
  v37[5] = &v38;
  objc_msgSend(v36, "prepareAvatarImageForPicker:synchronousCompletion:", v34, v37);
  objc_msgSend(*(id *)(a1 + 32), "presentImagePickerForImage:cropRect:fadeIn:completion:", v45[5], 0, 0, v39[4], v39[5], v39[6], v39[7]);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

}

void __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke_6(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v12;
  double *v13;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v12 = a2;
  v13 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v13[4] = a3;
  v13[5] = a4;
  v13[6] = a5;
  v13[7] = a6;

}

+ (id)log
{
  if (log_cn_once_token_1_32701 != -1)
    dispatch_once(&log_cn_once_token_1_32701, &__block_literal_global_32702);
  return (id)log_cn_once_object_1_32703;
}

void __29__CNAvatarEditingManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityPicker");
  v1 = (void *)log_cn_once_object_1_32703;
  log_cn_once_object_1_32703 = (uint64_t)v0;

}

@end
