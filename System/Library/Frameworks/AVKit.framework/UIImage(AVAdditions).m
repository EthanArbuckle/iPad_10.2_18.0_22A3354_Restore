@implementation UIImage(AVAdditions)

+ (void)avkit_imageWithSymbolNamed:()AVAdditions font:completion:
{
  __CFString *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  AVMobileImageConfiguration *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  _QWORD block[4];
  AVMobileImageConfiguration *v27;
  __CFString *v28;
  void (**v29)(_QWORD, _QWORD);
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, _QWORD))objc_msgSend(a5, "copy");
  if (v8 == CFSTR("gobackward.15") || v8 == CFSTR("goforward.15"))
  {
    v8 = v8;
    if (MapImageNameNumberAware_onceToken != -1)
      dispatch_once(&MapImageNameNumberAware_onceToken, &__block_literal_global_151);
    if (objc_msgSend((id)MapImageNameNumberAware_sDigitAwareSet, "containsObject:", v8))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "languageCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ar")) & 1) != 0
        || objc_msgSend(v13, "isEqualToString:", CFSTR("hi")))
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberingSystem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "isEqualToString:", CFSTR("latn")))
        {
          -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR(".westernarabic"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "languageCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v16 != 0;
    if (v16)
    {
      v19 = v16;
    }
    else
    {
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("ar")) & 1) == 0
        && !objc_msgSend(v18, "isEqualToString:", CFSTR("hi")))
      {
        goto LABEL_22;
      }
      -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR(".%@"), v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    v8 = v20;
LABEL_22:

    goto LABEL_23;
  }
  v11 = v8 == CFSTR("forward.end.fill.tv");
LABEL_23:
  v21 = -[AVMobileImageConfiguration initWithImageName:font:imageContainedInBundle:]([AVMobileImageConfiguration alloc], "initWithImageName:font:imageContainedInBundle:", v8, v9, v11);

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && v8
    && (objc_msgSend(a1, "avkit_loadedImageConfigurations"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "containsObject:", v21),
        v22,
        v23))
  {
    +[AVImage imageWithConfiguration:](AVImage, "imageWithConfiguration:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v24);

  }
  else if (v9 && v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_avkit_imageLoadingQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke;
    block[3] = &unk_1E5BB34F0;
    v27 = v21;
    v28 = v8;
    v30 = a1;
    v29 = v10;
    dispatch_async(v25, block);

  }
}

+ (id)avkit_loadedImageConfigurations
{
  if (avkit_loadedImageConfigurations_onceToken != -1)
    dispatch_once(&avkit_loadedImageConfigurations_onceToken, &__block_literal_global_16699);
  return (id)avkit_loadedImageConfigurations_avkit_loadedImageConfigurations;
}

+ (id)_avkit_imageLoadingQueue
{
  if (_avkit_imageLoadingQueue_createImageLoadingQueueOnceToken != -1)
    dispatch_once(&_avkit_imageLoadingQueue_createImageLoadingQueueOnceToken, &__block_literal_global_98_16665);
  return (id)_avkit_imageLoadingQueue_AVMobileImageLoadingQueue;
}

+ (id)avkit_flatWhiteResizableTemplateImage
{
  if (avkit_flatWhiteResizableTemplateImage_onceToken != -1)
    dispatch_once(&avkit_flatWhiteResizableTemplateImage_onceToken, &__block_literal_global_82_16697);
  return (id)avkit_flatWhiteResizableTemplateImage_solidWhitePixelTemplateImage;
}

+ (void)avkit_imageNamed:()AVAdditions completion:
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  AVMobileImageConfiguration *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  AVMobileImageConfiguration *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;

  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD))objc_msgSend(a4, "copy");
  v8 = -[AVMobileImageConfiguration initWithImageName:font:imageContainedInBundle:]([AVMobileImageConfiguration alloc], "initWithImageName:font:imageContainedInBundle:", v6, 0, 0);
  v9 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v6 && v9)
  {
    objc_msgSend(a1, "avkit_loadedImageConfigurations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v8);

    if (v11)
    {
      AVBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVImage imageNamed:inBundle:compatibleWithTraitCollection:](AVImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v6, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v7)[2](v7, v13);

      goto LABEL_9;
    }
  }
  else if (!v6)
  {
    goto LABEL_9;
  }
  if (avkit_imageNamed_completion__onceToken != -1)
    dispatch_once(&avkit_imageNamed_completion__onceToken, &__block_literal_global_90);
  v14 = avkit_imageNamed_completion__imageQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_2;
  v15[3] = &unk_1E5BB34F0;
  v16 = v6;
  v19 = a1;
  v17 = v8;
  v18 = v7;
  dispatch_async(v14, v15);

LABEL_9:
}

+ (id)avkit_imageWithSymbolNamed:()AVAdditions textStyle:scale:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0DC3888];
  v8 = a3;
  objc_msgSend(v7, "configurationWithTextStyle:scale:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)avkit_imageWithSize:()AVAdditions ofText:font:scaleFactor:completion:
{
  id v13;
  id v14;
  void (**v15)(id, void *);
  NSObject *v16;
  AVMobileImageConfiguration *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  AVMobileImageConfiguration *v25;
  void (**v26)(id, void *);
  double v27;
  double v28;
  double v29;
  uint8_t buf[16];

  v13 = a6;
  v14 = a7;
  v15 = a8;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_ERROR, "Error: -[UIImage avkit_imageFromString:font:completion:] called off of the main thread. The AVMobileTextImageCache should only be accessed on the main thread.", buf, 2u);
    }

  }
  v17 = -[AVMobileImageConfiguration initWithString:font:]([AVMobileImageConfiguration alloc], "initWithString:font:", v13, v14);
  objc_msgSend(MEMORY[0x1E0DC3870], "_avkit_textImageCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v15[2](v15, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_avkit_imageLoadingQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke;
    v21[3] = &unk_1E5BB3540;
    v27 = a1;
    v28 = a2;
    v22 = v13;
    v23 = v14;
    v29 = a3;
    v24 = v18;
    v25 = v17;
    v26 = v15;
    dispatch_async(v20, v21);

  }
}

+ (id)_avkit_imageWithSize:()AVAdditions ofText:font:scaleFactor:
{
  id v11;
  id v12;
  NSObject *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGContext *CurrentContext;
  CGContext *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v29;
  _QWORD v30[2];
  uint8_t buf[4];
  id v32;
  uint64_t v33;
  CGSize v34;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  _AVLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v11;
    _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "Rendering image with text: \"%@\", buf, 0xCu);
  }

  objc_msgSend(v12, "pointSize");
  objc_msgSend(v12, "fontWithSize:", v14 * a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor", *MEMORY[0x1E0DC1138], *MEMORY[0x1E0DC1140], v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sizeWithAttributes:", v17);
  v19 = (a1 - v18) * 0.5;
  v21 = (a2 - v20) * 0.5;
  v34.width = a1;
  v34.height = a2;
  UIGraphicsBeginImageContext(v34);
  objc_msgSend(v11, "drawAtPoint:withAttributes:", v17, v19, v21);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetShouldAntialias(CurrentContext, 1);
  v23 = UIGraphicsGetCurrentContext();
  CGContextSetAllowsAntialiasing(v23, 1);
  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v25 = (void *)MEMORY[0x1E0DC3870];
  v26 = objc_retainAutorelease(v24);
  objc_msgSend(v25, "imageWithCGImage:scale:orientation:", objc_msgSend(v26, "CGImage"), objc_msgSend(v26, "imageOrientation"), a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_avkit_textImageCache
{
  if (_avkit_textImageCache_createTextImageCacheOnceToken != -1)
    dispatch_once(&_avkit_textImageCache_createTextImageCacheOnceToken, &__block_literal_global_100_16662);
  return (id)_avkit_textImageCache_AVMobileTextImageCache;
}

@end
