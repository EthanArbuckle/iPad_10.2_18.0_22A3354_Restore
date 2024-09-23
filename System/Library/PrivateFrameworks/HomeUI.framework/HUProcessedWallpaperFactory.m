@implementation HUProcessedWallpaperFactory

- (unint64_t)processVersionNumber
{
  return 5;
}

- (id)applyCustomFilterForWallpaper:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  HUProcessedWallpaperFactory *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1B8FF57D4(v7, objc_msgSend(v6, sel_type) == (id)6);

  return v9;
}

- (NSArray)supportedVariants
{
  if (_MergedGlobals_638 != -1)
    dispatch_once(&_MergedGlobals_638, &__block_literal_global_51_1);
  return (NSArray *)(id)qword_1ED580C58;
}

void __48__HUProcessedWallpaperFactory_supportedVariants__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED580C58;
  qword_1ED580C58 = (uint64_t)&unk_1E7042D80;

}

- (id)processedImageForVariant:(int64_t)a3 wallpaper:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!a3)
  {
    NSLog(CFSTR("Asking for original variant from processing factory for wallpaper %@"), v8);
    if (v10)
      goto LABEL_3;
LABEL_6:
    v12 = 0;
    goto LABEL_12;
  }
  if (!v9)
    goto LABEL_6;
LABEL_3:
  switch(a3)
  {
    case 1:
      -[HUProcessedWallpaperFactory _processedImageForWallpaper:image:](self, "_processedImageForWallpaper:image:", v8, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[HUProcessedWallpaperFactory _darkContentBlurredImageForWallpaper:image:](self, "_darkContentBlurredImageForWallpaper:image:", v8, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[HUProcessedWallpaperFactory _lightContentBlurredImageForWallpaper:image:](self, "_lightContentBlurredImageForWallpaper:image:", v8, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[HUProcessedWallpaperFactory _darkContentDarkModeBlurredImageForWallpaper:image:](self, "_darkContentDarkModeBlurredImageForWallpaper:image:", v8, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = v10;
      break;
  }
  v12 = v11;
LABEL_12:

  return v12;
}

- (CGRect)_scaledCropRectForBounds:(CGRect)a3 wallpaper:(id)a4 image:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat x;
  CGFloat y;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "scale");
  v11 = v10;
  objc_msgSend(v8, "cropInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "cropInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;

    objc_msgSend(v8, "cropInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "center");
    v18 = v17;
    v20 = v19;

    v11 = 1.0;
  }
  else
  {
    objc_msgSend(v9, "size");
    v15 = v21 / width;
    objc_msgSend(v9, "size");
    if (v15 >= v22 / height)
      v15 = v22 / height;
    objc_msgSend(v9, "size");
    UIRectGetCenter();
    v18 = v23;
    v20 = v24;
  }
  v25 = width * v15;
  v26 = height * v15;
  CGAffineTransformMakeScale(&v35, v11, v11);
  v36.origin.x = v18 - round(v25 * 0.5);
  v36.origin.y = v20 - round(v26 * 0.5);
  v36.size.width = v25;
  v36.size.height = v26;
  v37 = CGRectApplyAffineTransform(v36, &v35);
  x = v37.origin.x;
  y = v37.origin.y;
  v29 = v37.size.width;
  v30 = v37.size.height;

  v31 = x;
  v32 = y;
  v33 = v29;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)_croppedImageFromWallpaper:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  CGContext *CurrentContext;
  CGContext *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  id v38;
  CGImage *v39;
  CGImage *v40;
  CGContext *v41;
  CGSize v42;
  CGRect v43;
  CGRect v44;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D319F0], "contentSizeForWallpaper");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "hf_sizeInScreenScale");
  v13 = v12;
  v15 = v14;
  v16 = v11;
  v17 = v9;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    v18 = v13 / v9;
    v19 = v15 / v11;
    v20 = v13 / v9 < 1.0 || v19 < 1.0;
    v16 = v11;
    v17 = v9;
    if (v20)
    {
      if (v18 >= v19)
        v18 = v15 / v11;
      v17 = v9 * v18;
      v16 = v11 * v18;
    }
  }
  if (objc_msgSend(v6, "type") == 2
    || objc_msgSend(v6, "type") == 3
    || objc_msgSend(v6, "type") == 4
    || objc_msgSend(v6, "type") == 5)
  {
    goto LABEL_14;
  }
  objc_msgSend(v6, "cropInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

LABEL_18:
    objc_msgSend(v7, "imageWithNormalizedOrientation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v27 = v26;
    v42.width = v17;
    v42.height = v16;
    UIGraphicsBeginImageContextWithOptions(v42, 1, v27);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, v16);
    v29 = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(v29, 1.0, -1.0);
    -[HUProcessedWallpaperFactory _scaledCropRectForBounds:wallpaper:image:](self, "_scaledCropRectForBounds:wallpaper:image:", v6, v7, 0.0, 0.0, v9, v11);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = objc_retainAutorelease(v24);
    v39 = (CGImage *)objc_msgSend(v38, "CGImage");
    v43.origin.x = v31;
    v43.origin.y = v33;
    v43.size.width = v35;
    v43.size.height = v37;
    v40 = CGImageCreateWithImageInRect(v39, v43);
    v41 = UIGraphicsGetCurrentContext();
    v44.origin.x = 0.0;
    v44.origin.y = 0.0;
    v44.size.width = v17;
    v44.size.height = v16;
    CGContextDrawImage(v41, v44, v40);
    UIGraphicsGetImageFromCurrentImageContext();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v40);
    UIGraphicsEndImageContext();

    goto LABEL_15;
  }
  if (v17 != v13 || v16 != v15)
    goto LABEL_18;
LABEL_14:
  v21 = v7;
LABEL_15:

  return v21;
}

- (id)_processedImageForWallpaper:(id)a3 image:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUProcessedWallpaperFactory _croppedImageFromWallpaper:image:](self, "_croppedImageFromWallpaper:image:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") == 4
    || objc_msgSend(v6, "type") == 5
    || objc_msgSend(v6, "type") == 1
    || objc_msgSend(v6, "type") == 6)
  {
    v8 = v7;
  }
  else
  {
    if (objc_msgSend(v6, "type") == 2 || objc_msgSend(v6, "type") == 3)
    {
      v10 = *MEMORY[0x1E0CD2C30];
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.08);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUProcessedWallpaperFactory _layerWithCompositingFilterType:color:](self, "_layerWithCompositingFilterType:color:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *MEMORY[0x1E0CD2C28];
      v14 = (void *)MEMORY[0x1E0CEA478];
      v15 = 0.04;
    }
    else
    {
      v16 = *MEMORY[0x1E0CD2C30];
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUProcessedWallpaperFactory _layerWithCompositingFilterType:color:](self, "_layerWithCompositingFilterType:color:", v16, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *MEMORY[0x1E0CD2C28];
      v14 = (void *)MEMORY[0x1E0CEA478];
      v15 = 0.1;
    }
    objc_msgSend(v14, "colorWithWhite:alpha:", 0.0, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUProcessedWallpaperFactory _layerWithCompositingFilterType:color:](self, "_layerWithCompositingFilterType:color:", v13, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v12;
    v21[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUProcessedWallpaperFactory _imageByApplyingLayerEffects:toImage:](self, "_imageByApplyingLayerEffects:toImage:", v20, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_darkContentBlurredImageForWallpaper:(id)a3 image:(id)a4
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  objc_msgSend(v4, "scale");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  if (v6 != v9)
  {
    objc_msgSend(v4, "scale");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    NSLog(CFSTR("Wallpaper processing will incorrectly scale image, as wallpaper scale (%f) doesn't match screen scale (%f)"), v11, v13);

  }
  objc_msgSend((id)objc_opt_class(), "_defaultBackdropSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSaturationDeltaFactor:", 5.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.9, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColorTint:", v15);

  objc_msgSend(v14, "setColorTintAlpha:", 0.8);
  objc_msgSend(v4, "_applyBackdropViewSettings:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_darkContentDarkModeBlurredImageForWallpaper:(id)a3 image:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "_defaultBackdropSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSaturationDeltaFactor:", 5.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.2, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorTint:", v6);

  objc_msgSend(v5, "setColorTintAlpha:", 0.8);
  objc_msgSend(v4, "_applyBackdropViewSettings:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_lightContentBlurredImageForWallpaper:(id)a3 image:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_defaultBackdropSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRenderingHint:", 1);
  objc_msgSend(v6, "setSaturationDeltaFactor:", 4.0);
  objc_msgSend(v6, "setColorTint:", 0);
  objc_msgSend(v6, "setColorTintAlpha:", 0.0);
  v7 = *MEMORY[0x1E0CD2E70];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.305882353, 0.3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUProcessedWallpaperFactory _layerWithCompositingFilterType:color:](self, "_layerWithCompositingFilterType:color:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0CD2E98];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.396078431, 0.32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUProcessedWallpaperFactory _layerWithCompositingFilterType:color:](self, "_layerWithCompositingFilterType:color:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v9;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_applyBackdropViewSettings:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUProcessedWallpaperFactory _imageByApplyingLayerEffects:toImage:](self, "_imageByApplyingLayerEffects:toImage:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_defaultBackdropSettings
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", -4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequiresColorStatistics:", 0);
  objc_msgSend(v2, "setGrayscaleTintAlpha:", 0.0);
  objc_msgSend(v2, "setGrayscaleTintMaskAlpha:", 0.0);
  objc_msgSend(v2, "setColorTintMaskAlpha:", 0.0);
  objc_msgSend(v2, "setColorBurnTintAlpha:", 0.0);
  objc_msgSend(v2, "setDarkeningTintAlpha:", 0.0);
  objc_msgSend(v2, "setFilterMaskAlpha:", 0.0);
  objc_msgSend(v2, "setBlurRadius:", 36.0);
  return v2;
}

- (id)_layerWithCompositingFilterType:(id)a3 color:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = (void *)MEMORY[0x1E0CD27A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCompositingFilter:", v9);
  v10 = objc_retainAutorelease(v6);
  v11 = objc_msgSend(v10, "CGColor");

  objc_msgSend(v8, "setBackgroundColor:", v11);
  return v8;
}

- (id)_imageByApplyingLayerEffects:(id)a3 toImage:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hf_sizeInScreenScale");
  v8 = v7;
  v10 = v9;
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v6);
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  objc_msgSend(v13, "setContentsScale:");

  objc_msgSend(v13, "setFrame:", v11, v12, v8, v10);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v21, "setFrame:", v11, v12, v8, v10);
        objc_msgSend(v13, "addSublayer:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v8, v10);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__HUProcessedWallpaperFactory__imageByApplyingLayerEffects_toImage___block_invoke;
  v26[3] = &unk_1E6F5D948;
  v27 = v13;
  v23 = v13;
  objc_msgSend(v22, "imageWithActions:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __68__HUProcessedWallpaperFactory__imageByApplyingLayerEffects_toImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderInContext:", objc_msgSend(a2, "CGContext"));
}

@end
