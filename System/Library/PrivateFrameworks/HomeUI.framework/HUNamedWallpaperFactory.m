@implementation HUNamedWallpaperFactory

- (id)allWallpapersForCollection:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 1)
  {
    NSLog(CFSTR("Unknown collection type %ld"), a2, a3);
    return 0;
  }
  else
  {
    v11[0] = CFSTR("HUBaseColorLightBlue_Blur");
    v11[1] = CFSTR("HUBaseColorDarkBlue_Blur");
    v11[2] = CFSTR("HUBaseColorLightGreen_Blur");
    v11[3] = CFSTR("HUGradientColorGreen_Blur");
    v11[4] = CFSTR("HUBaseColorDarkGreen_Blur");
    v11[5] = CFSTR("HUGradientColorOrange_Blur");
    v11[6] = CFSTR("HUGradientColorBlue_Blur");
    v11[7] = CFSTR("HUBaseColorRed_Blur");
    v11[8] = CFSTR("HUBaseColorOrange_Blur");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_map:", &__block_literal_global_40);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v10[0] = CFSTR("HUSunrise");
    v10[1] = CFSTR("HUWildflowers");
    v10[2] = CFSTR("HUArchitectural");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_67);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "na_safeAddObjectsFromArray:", v5);
    return v8;
  }
}

id __54__HUNamedWallpaperFactory_allWallpapersForCollection___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D319F0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithType:assetIdentifier:cropInfo:", 4, v3, 0);

  return v4;
}

id __54__HUNamedWallpaperFactory_allWallpapersForCollection___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D319F0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithType:assetIdentifier:cropInfo:", 5, v3, 0);

  return v4;
}

- (id)allWallpaperThumbnailsForCollection:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 1)
    return 0;
  v11[0] = CFSTR("HUBaseColorLightBlue_Blur_Thumbnail");
  v11[1] = CFSTR("HUBaseColorDarkBlue_Blur_Thumbnail");
  v11[2] = CFSTR("HUBaseColorLightGreen_Blur_Thumbnail");
  v11[3] = CFSTR("HUGradientColorGreen_Blur_Thumbnail");
  v11[4] = CFSTR("HUBaseColorDarkGreen_Blur_Thumbnail");
  v11[5] = CFSTR("HUGradientColorOrange_Blur_Thumbnail");
  v11[6] = CFSTR("HUGradientColorBlue_Blur_Thumbnail");
  v11[7] = CFSTR("HUBaseColorRed_Blur_Thumbnail");
  v11[8] = CFSTR("HUBaseColorOrange_Blur_Thumbnail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_70);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v10[0] = CFSTR("HUSunrise_Thumbnail");
  v10[1] = CFSTR("HUWildflowers_Thumbnail");
  v10[2] = CFSTR("HUArchitectural_Thumbnail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_71);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v5);
  return v8;
}

id __63__HUNamedWallpaperFactory_allWallpaperThumbnailsForCollection___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D319F0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithType:assetIdentifier:cropInfo:", 4, v3, 0);

  return v4;
}

id __63__HUNamedWallpaperFactory_allWallpaperThumbnailsForCollection___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D319F0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithType:assetIdentifier:cropInfo:", 5, v3, 0);

  return v4;
}

- (id)defaultWallpaperForCollection:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D319F0]), "initWithType:assetIdentifier:cropInfo:", 5, CFSTR("HUSunrise"), 0);
  NSLog(CFSTR("Unknown collection type %ld"), a2, a3);
  return 0;
}

- (id)imageForWallpaper:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "type") != 2
    || (v4 = (void *)objc_opt_class(),
        objc_msgSend(v3, "assetIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "_gradientWallpaperImageForIdentifier:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(v3, "assetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HUImageNamed(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      NSLog(CFSTR("Unable to find named wallpaper for wallpaper %@"), v3);
      objc_msgSend((id)objc_opt_class(), "_defaultBlackWallpaperImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

+ (id)_defaultBlackWallpaperImage
{
  if (_MergedGlobals_616 != -1)
    dispatch_once(&_MergedGlobals_616, &__block_literal_global_75);
  return (id)qword_1ED580A78;
}

void __54__HUNamedWallpaperFactory__defaultBlackWallpaperImage__block_invoke()
{
  double Width;
  double Height;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  CGSize v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v7);
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v8);
  if (Width < Height)
    Width = Height;
  v6.width = Width;
  v6.height = Width;
  UIGraphicsBeginImageContextWithOptions(v6, 1, 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = Width;
  v9.size.height = Width;
  UIRectFill(v9);
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED580A78;
  qword_1ED580A78 = v3;

  UIGraphicsEndImageContext();
}

+ (id)_gradientWallpaperImageForIdentifier:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double Width;
  double Height;
  id v8;
  id v9;
  uint64_t *v10;
  const __CFArray *v11;
  double v12;
  CGFloat v13;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  CGGradient *v16;
  void *v17;
  NSObject *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];
  CGSize v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    objc_msgSend(v4, "scale");
    Width = 2880.0 / v5;
  }
  else
  {
    objc_msgSend(v4, "bounds");
    Width = CGRectGetWidth(v26);
    objc_msgSend(v4, "bounds");
    Height = CGRectGetHeight(v27);
    if (Width < Height)
      Width = Height;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HUGradientColorBlue")))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.37254902, 1.0, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[0] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.42745098, 0.843137255, 0.839215686, 1.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = v23;
LABEL_11:
    v10[1] = objc_msgSend(v9, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "scale");
    v13 = v12;
    v24.width = 1.0;
    v24.height = Width;
    UIGraphicsBeginImageContextWithOptions(v24, 1, v13);
    CurrentContext = UIGraphicsGetCurrentContext();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v20 = xmmword_1B943EB60;
    v16 = CGGradientCreateWithColors(DeviceRGB, v11, (const CGFloat *)&v20);
    v25.x = 0.0;
    v25.y = Width;
    CGContextDrawLinearGradient(CurrentContext, v16, *MEMORY[0x1E0C9D538], v25, 0);
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CGGradientRelease(v16);
    CGColorSpaceRelease(DeviceRGB);
    UIGraphicsEndImageContext();

    goto LABEL_12;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HUGradientColorOrange")))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.992156863, 0.580392157, 0.0196078431, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.921568627, 0.439215686, 1.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = &v22;
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HUGradientColorGreen")))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.176470588, 0.729411765, 0.270588235, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.725490196, 0.811764706, 0.392156863, 1.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = &v21;
    goto LABEL_11;
  }
  HFLogForCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v20) = 138412290;
    *(_QWORD *)((char *)&v20 + 4) = v3;
    _os_log_error_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_ERROR, "Unknown identifier specified: %@, defaulting to black", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "_defaultBlackWallpaperImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v17;
}

@end
