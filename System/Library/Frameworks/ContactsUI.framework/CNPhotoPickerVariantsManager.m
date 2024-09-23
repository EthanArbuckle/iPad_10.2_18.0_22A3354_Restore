@implementation CNPhotoPickerVariantsManager

- (CNPhotoPickerVariantsManager)init
{
  CNPhotoPickerVariantsManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSArray *avatarBackgrounds;
  uint64_t v8;
  NSArray *defaultEmojis;
  CNPhotoPickerVariantsManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNPhotoPickerVariantsManager;
  v2 = -[CNPhotoPickerVariantsManager init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("PhotoPickerVariants"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "avatarBackgroundsFromDictionary:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    avatarBackgrounds = v2->_avatarBackgrounds;
    v2->_avatarBackgrounds = (NSArray *)v6;

    objc_msgSend((id)objc_opt_class(), "defaultEmojisFromDictionary:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    defaultEmojis = v2->_defaultEmojis;
    v2->_defaultEmojis = (NSArray *)v8;

    v10 = v2;
  }

  return v2;
}

- (id)randomColorVariant
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CNPhotoPickerVariantsManager avatarBackgrounds](self, "avatarBackgrounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = arc4random_uniform(objc_msgSend(v3, "count"));

  -[CNPhotoPickerVariantsManager avatarBackgrounds](self, "avatarBackgrounds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)avatarBackgrounds
{
  return self->_avatarBackgrounds;
}

- (void)setAvatarBackgrounds:(id)a3
{
  objc_storeStrong((id *)&self->_avatarBackgrounds, a3);
}

- (NSArray)defaultEmojis
{
  return self->_defaultEmojis;
}

- (void)setDefaultEmojis:(id)a3
{
  objc_storeStrong((id *)&self->_defaultEmojis, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultEmojis, 0);
  objc_storeStrong((id *)&self->_avatarBackgrounds, 0);
}

+ (id)avatarBackgroundsFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke;
  v11[3] = &unk_1E204C020;
  v12 = v4;
  v13 = a1;
  v5 = avatarBackgroundsFromDictionary__onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&avatarBackgroundsFromDictionary__onceToken, v11);
    v8 = v12;
  }
  v9 = (id)avatarBackgroundsFromDictionary__avatarBackgrounds;

  return v9;
}

+ (id)defaultEmojisFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke;
  v11[3] = &unk_1E204C020;
  v12 = v4;
  v13 = a1;
  v5 = defaultEmojisFromDictionary__onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&defaultEmojisFromDictionary__onceToken, v11);
    v8 = v12;
  }
  v9 = (id)defaultEmojisFromDictionary__defaultEmojis;

  return v9;
}

+ (id)colorFromRGBArray:(id)a3
{
  id v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 2)
  {
    +[CNUIColorRepository photoPickerAvatarBackgroundDefaultColor](CNUIColorRepository, "photoPickerAvatarBackgroundDefaultColor");
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = (float)(v5 / 255.0);

    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = (float)(v8 / 255.0);

    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = (float)(v11 / 255.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v6, v9, v12, 1.0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)colorFromRGBString:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = colorFromRGBString__cn_once_token_1;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&colorFromRGBString__cn_once_token_1, &__block_literal_global_5856);
  v5 = (id)colorFromRGBString__cn_once_object_1;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__CNPhotoPickerVariantsManager_colorFromRGBString___block_invoke_2;
  v11[3] = &unk_1E20488B0;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "_cn_map:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "colorFromRGBArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)colorVariantWithColorNamed:(id)a3
{
  id v3;
  void *v4;
  CNPhotoPickerColorVariant *v5;

  v3 = a3;
  +[CNPhotoPickerVariantsManager colorFromRGBString:](CNPhotoPickerVariantsManager, "colorFromRGBString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPhotoPickerColorVariant initWithColor:named:]([CNPhotoPickerColorVariant alloc], "initWithColor:named:", v4, v3);

  return v5;
}

+ (id)avatarPoseConfigurationsForAvatarRecord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getAVTPoseSelectionViewControllerClass_softClass;
  v12 = getAVTPoseSelectionViewControllerClass_softClass;
  if (!getAVTPoseSelectionViewControllerClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getAVTPoseSelectionViewControllerClass_block_invoke;
    v8[3] = &unk_1E204EBC0;
    v8[4] = &v9;
    __getAVTPoseSelectionViewControllerClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v5, "poseConfigurationsForTypes:avatarRecord:", 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharingProfileAvatarPoseConfigurationForAvatarRecord:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "avatarPoseConfigurationsForAvatarRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_30_5840);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (id)monogramColorGradientBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CNPhotoPickerVariantsManager_monogramColorGradientBackground___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (monogramColorGradientBackground__onceToken != -1)
  {
    dispatch_once(&monogramColorGradientBackground__onceToken, block);
    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0D70A78], "defaultGradientStartColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)monogramColorGradientBackground__gradientColors, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)monogramColorGradientBackground__gradientColors, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

+ (id)colorGradientBackground:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CNPhotoPickerVariantsManager_colorGradientBackground___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = colorGradientBackground__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&colorGradientBackground__onceToken, block);
  objc_msgSend((id)colorGradientBackground__gradientColors, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)gradientStartColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compositeColorForTopColor:bottomColor:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)nonAlphaColorForBackgroundColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compositeColorForTopColor:bottomColor:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)compositeColorForTopColor:(id)a3 bottomColor:(id)a4
{
  id v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v13 = 0.0;
  v14 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v5 = a3;
  objc_msgSend(a4, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v10, &v9, &v8, &v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", ((1.0 - v7) * (v11 * v14) + v10 * v7) / (v7 + v11 * (1.0 - v7)), ((1.0 - v7) * (v11 * v13) + v9 * v7) / (v7 + v11 * (1.0 - v7)), ((1.0 - v7) * (v11 * v12) + v8 * v7) / (v7 + v11 * (1.0 - v7)));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)gradientBackgroundImageForColor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "gradientBackgroundImageForColor:bottomColor:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)gradientBackgroundImageForColor:(id)a3 bottomColor:(id)a4
{
  id v6;
  id v7;
  CGColorSpace *DeviceRGB;
  CGContext *v9;
  void *v10;
  id v11;
  __CFArray *Mutable;
  id v13;
  id v14;
  CGGradient *v15;
  CGImage *Image;
  void *v17;
  CGPoint v19;
  CGPoint v20;
  CGRect v21;

  v6 = a3;
  v7 = a4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(0, 0x32uLL, 0x32uLL, 8uLL, 0xC8uLL, DeviceRGB, 1u);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 1.0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v9, (CGColorRef)objc_msgSend(v11, "CGColor"));

  v21.size.width = 50.0;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.height = 50.0;
  CGContextFillRect(v9, v21);
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E0C9B378]);
  v13 = objc_retainAutorelease(v6);
  CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v13, "CGColor"));
  if (v7)
  {
    CFArrayAppendValue(Mutable, (const void *)objc_msgSend(objc_retainAutorelease(v7), "CGColor"));
  }
  else
  {
    objc_msgSend(a1, "gradientStartColor:", v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v14, "CGColor"));

  }
  v15 = CGGradientCreateWithColors(DeviceRGB, Mutable, 0);
  v20.y = 50.0;
  v19.x = 0.0;
  v19.y = 0.0;
  v20.x = 0.0;
  CGContextDrawLinearGradient(v9, v15, v19, v20, 0);
  Image = CGBitmapContextCreateImage(v9);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGGradientRelease(v15);
  CGContextRelease(v9);
  CGColorSpaceRelease(DeviceRGB);
  CFRelease(Mutable);

  return v17;
}

+ (id)generateGradientColorsByColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("PhotoPickerVariants"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("avatarBackgrounds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CNPhotoPickerVariantsManager_generateGradientColorsByColor__block_invoke;
  v10[3] = &unk_1E2048918;
  v12 = a1;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "_cn_each:", v10);

  return v8;
}

+ (id)generateMonogramGradientColorsByColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0D70A78], "availableColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __69__CNPhotoPickerVariantsManager_generateMonogramGradientColorsByColor__block_invoke;
  v13 = &unk_1E2048940;
  v5 = v4;
  v14 = v5;
  v15 = a1;
  objc_msgSend(v3, "_cn_each:", &v10);
  objc_msgSend(MEMORY[0x1E0D70A78], "defaultGradientStartColor", v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "gradientBackgroundImageForColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  v8 = v5;
  return v8;
}

void __69__CNPhotoPickerVariantsManager_generateMonogramGradientColorsByColor__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "color");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "gradientBackgroundImageForColor:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

void __61__CNPhotoPickerVariantsManager_generateGradientColorsByColor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rgbValuesTop"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rgbValuesBottom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "colorFromRGBArray:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "colorFromRGBArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "gradientBackgroundImageForColor:bottomColor:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

}

void __56__CNPhotoPickerVariantsManager_colorGradientBackground___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "generateGradientColorsByColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)colorGradientBackground__gradientColors;
  colorGradientBackground__gradientColors = v1;

}

void __64__CNPhotoPickerVariantsManager_monogramColorGradientBackground___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "generateMonogramGradientColorsByColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)monogramColorGradientBackground__gradientColors;
  monogramColorGradientBackground__gradientColors = v1;

}

uint64_t __85__CNPhotoPickerVariantsManager_sharingProfileAvatarPoseConfigurationForAvatarRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("big_happy"));

  return v3;
}

uint64_t __51__CNPhotoPickerVariantsManager_colorFromRGBString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "numberFromString:", a2);
}

void __51__CNPhotoPickerVariantsManager_colorFromRGBString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v0, "setNumberStyle:", 1);
  v1 = (void *)colorFromRGBString__cn_once_object_1;
  colorFromRGBString__cn_once_object_1 = (uint64_t)v0;

}

void __60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("defaultEmojis"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke_2;
  v5[3] = &__block_descriptor_40_e49___CNPhotoPickerDefaultEmoji_16__0__NSDictionary_8l;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "_cn_map:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultEmojisFromDictionary__defaultEmojis;
  defaultEmojisFromDictionary__defaultEmojis = v2;

}

CNPhotoPickerDefaultEmoji *__60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNPhotoPickerDefaultEmoji *v8;
  CNPhotoPickerColorVariant *v9;
  CNPhotoPickerDefaultEmoji *v10;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("emojiString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "colorFromRGBArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CNPhotoPickerDefaultEmoji alloc];
  v9 = -[CNPhotoPickerColorVariant initWithColor:named:]([CNPhotoPickerColorVariant alloc], "initWithColor:named:", v7, v6);
  v10 = -[CNPhotoPickerDefaultEmoji initWithEmojiString:colorVariant:](v8, "initWithEmojiString:colorVariant:", v4, v9);

  return v10;
}

void __64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("avatarBackgrounds"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke_2;
  v5[3] = &__block_descriptor_40_e49___CNPhotoPickerColorVariant_16__0__NSDictionary_8l;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "_cn_map:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)avatarBackgroundsFromDictionary__avatarBackgrounds;
  avatarBackgroundsFromDictionary__avatarBackgrounds = v2;

}

CNPhotoPickerColorVariant *__64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  CNPhotoPickerColorVariant *v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("rgbValuesTop"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "colorFromRGBArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNPhotoPickerColorVariant initWithColor:named:]([CNPhotoPickerColorVariant alloc], "initWithColor:named:", v5, v4);

  return v6;
}

@end
