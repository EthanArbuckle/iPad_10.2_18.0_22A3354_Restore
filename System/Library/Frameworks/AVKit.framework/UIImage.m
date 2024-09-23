@implementation UIImage

void __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  +[AVImage imageWithConfiguration:](AVImage, "imageWithConfiguration:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke_2;
  block[3] = &unk_1E5BB3518;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v8 = v3;
  v12 = v4;
  v9 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v10 = v2;
  v11 = v5;
  v6 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 64), "avkit_loadedImageConfigurations");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __61__UIImage_AVAdditions__avkit_flatWhiteResizableTemplateImage__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 1.0, 1.0);
  objc_msgSend(v4, "imageWithActions:", &__block_literal_global_85);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resizableImageWithCapInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithRenderingMode:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)avkit_flatWhiteResizableTemplateImage_solidWhitePixelTemplateImage;
  avkit_flatWhiteResizableTemplateImage_solidWhitePixelTemplateImage = v2;

}

void __61__UIImage_AVAdditions__avkit_flatWhiteResizableTemplateImage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v4 = a2;
  objc_msgSend(v2, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  objc_msgSend(v4, "fillRect:", 0.0, 0.0, 1.0, 1.0);
}

void __55__UIImage_AVAdditions__avkit_loadedImageConfigurations__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)avkit_loadedImageConfigurations_avkit_loadedImageConfigurations;
  avkit_loadedImageConfigurations_avkit_loadedImageConfigurations = v0;

}

void __48__UIImage_AVAdditions___avkit_imageLoadingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.avkit.UIKit_AVAdditions.AVMobileImageLoadingQueue", v2);
  v1 = (void *)_avkit_imageLoadingQueue_AVMobileImageLoadingQueue;
  _avkit_imageLoadingQueue_AVMobileImageLoadingQueue = (uint64_t)v0;

}

uint64_t __45__UIImage_AVAdditions___avkit_textImageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_avkit_textImageCache_AVMobileTextImageCache;
  _avkit_textImageCache_AVMobileTextImageCache = (uint64_t)v0;

  objc_msgSend((id)_avkit_textImageCache_AVMobileTextImageCache, "setCountLimit:", 10);
  return objc_msgSend((id)_avkit_textImageCache_AVMobileTextImageCache, "setName:", CFSTR("com.apple.avkit.UIKit_AVAdditions.AVMobileTextImageCache"));
}

void __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3870], "_avkit_imageWithSize:ofText:font:scaleFactor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke_2;
  v4[3] = &unk_1E5BB4B48;
  v5 = *(id *)(a1 + 48);
  v6 = v2;
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  AVBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVImage imageNamed:inBundle:compatibleWithTraitCollection:](AVImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_3;
  block[3] = &unk_1E5BB3518;
  v9 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v13 = v6;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 64), "avkit_loadedImageConfigurations");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

void __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.avkit.images", v2);
  v1 = (void *)avkit_imageNamed_completion__imageQueue;
  avkit_imageNamed_completion__imageQueue = (uint64_t)v0;

}

@end
