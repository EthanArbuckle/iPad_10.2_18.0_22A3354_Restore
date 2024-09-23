@implementation BPSWatchView

- (BPSWatchView)initWithStyle:(unint64_t)a3 versionModifier:(id)a4 allowsMaterialFallback:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  BPSWatchView *v9;
  uint64_t v10;
  NSString *styleVersionSuffix;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  BPSRemoteImageView *v28;
  BPSRemoteImageView *watchImageView;
  UIImageView *v30;
  UIImageView *watchScreenImageView;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  objc_super v44;

  v5 = a5;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)BPSWatchView;
  v9 = -[BPSWatchView initWithFrame:](&v44, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    styleVersionSuffix = v9->_styleVersionSuffix;
    v9->_styleVersionSuffix = (NSString *)v10;

    v9->_style = a3;
    _WatchImageNameForStyle(a3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _WatchImageNameForStyle(v9->_style, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v12;
    if (v9->_styleVersionSuffix)
    {
      objc_msgSend(v12, "stringByAppendingString:");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", v9->_styleVersionSuffix);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v12;
      v15 = v13;
    }
    v16 = v15;
    objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v5 && !objc_msgSend(v17, "material"))
    {
      BPSGetActiveSetupCompletedDevice();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(MEMORY[0x24BE6E4A0], "materialFromDevice:", v33);
      v42 = (void *)v33;
      v35 = objc_msgSend(MEMORY[0x24BE6E4A0], "sizeFromDevice:", v33);
      v36 = v9->_style - 1;
      if (v36 > 7)
        v37 = 0;
      else
        v37 = qword_2114A23F8[v36];
      objc_msgSend(MEMORY[0x24BE6E4A0], "resourceString:material:size:forAttributes:", v14, v34, v35, v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x24BE6E4A0];
      v39 = objc_msgSend(v18, "fallbackMaterialForSize:", v35);
      v40 = v9->_style - 1;
      if (v40 > 7)
        v41 = 0;
      else
        v41 = qword_2114A23F8[v40];
      objc_msgSend(v38, "resourceString:material:size:forAttributes:", v16, v39, v35, v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = objc_msgSend(v18, "size");
      v20 = v9->_style - 1;
      if (v20 > 7)
        v21 = 0;
      else
        v21 = qword_2114A23F8[v20];
      objc_msgSend(v18, "resourceString:forAttributes:", v14, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BE6E4A0];
      v24 = objc_msgSend(v18, "fallbackMaterialForSize:", v19);
      v25 = v9->_style - 1;
      if (v25 > 7)
        v26 = 0;
      else
        v26 = qword_2114A23F8[v25];
      objc_msgSend(v23, "resourceString:material:size:forAttributes:", v16, v24, v19, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = objc_alloc_init(BPSRemoteImageView);
    watchImageView = v9->_watchImageView;
    v9->_watchImageView = v28;

    -[BPSRemoteImageView setFallbackImageName:](v9->_watchImageView, "setFallbackImageName:", v27);
    -[BPSRemoteImageView setDesiredImageName:](v9->_watchImageView, "setDesiredImageName:", v22);
    -[BPSRemoteImageView updateImagesWithAnimation:](v9->_watchImageView, "updateImagesWithAnimation:", 0);
    -[BPSWatchView addSubview:](v9, "addSubview:", v9->_watchImageView);
    v30 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    watchScreenImageView = v9->_watchScreenImageView;
    v9->_watchScreenImageView = v30;

    -[BPSRemoteImageView addSubview:](v9->_watchImageView, "addSubview:", v9->_watchScreenImageView);
  }

  return v9;
}

- (void)overrideMaterial:(unint64_t)a3 size:(unint64_t)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  self->_sizeOverride = a4;
  _WatchImageNameForStyle(self->_style, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  _WatchImageNameForStyle(self->_style, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_styleVersionSuffix)
  {
    objc_msgSend(v17, "stringByAppendingString:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", self->_styleVersionSuffix);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v17;
    v9 = v7;
  }
  v10 = v9;
  objc_msgSend(MEMORY[0x24BE6E4A0], "resourceString:material:size:forAttributes:", v8, a3, self->_sizeOverride, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BE6E4A0];
  objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceString:material:size:forAttributes:", v10, objc_msgSend(v13, "fallbackMaterialForSize:", a4), a4, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[BPSWatchView watchImageView](self, "watchImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDesiredImageName:", v11);

  -[BPSWatchView watchImageView](self, "watchImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFallbackImageName:", v14);

  -[BPSRemoteImageView updateImagesWithAnimation:](self->_watchImageView, "updateImagesWithAnimation:", 0);
}

- (BPSRemoteImageView)watchImageView
{
  return self->_watchImageView;
}

- (UIImageView)watchScreenImageView
{
  return self->_watchScreenImageView;
}

- (BPSWatchView)initWithStyle:(unint64_t)a3
{
  return -[BPSWatchView initWithStyle:versionModifier:allowsMaterialFallback:](self, "initWithStyle:versionModifier:allowsMaterialFallback:", a3, 0, 0);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[BPSRemoteImageView intrinsicContentSize](self->_watchImageView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BPSWatchView;
  -[BPSWatchView layoutSubviews](&v5, sel_layoutSubviews);
  -[BPSRemoteImageView sizeThatFits:](self->_watchImageView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[BPSRemoteImageView setFrame:](self->_watchImageView, "setFrame:", 0.0, 0.0, v3, v4);
  -[BPSWatchView layoutWatchScreenImageView](self, "layoutWatchScreenImageView");
}

- (void)layoutWatchScreenImageView
{
  uint64_t v3;

  v3 = -[BPSWatchView deviceSize](self, "deviceSize");
  -[BPSWatchView screenImageSize](self, "screenImageSize");
  -[UIImageView setFrame:](self->_watchScreenImageView, "setFrame:", _ScreenInsets(self->_style, v3));
}

- (CGSize)screenImageSize
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t style;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  double *v14;
  _QWORD *v15;
  double v16;
  double v17;
  CGSize result;

  v3 = -[BPSWatchView deviceSize](self, "deviceSize");
  -[UIImageView sizeThatFits:](self->_watchScreenImageView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v5 = v4;
  v7 = v6;
  style = self->_style;
  if (style == 3 || style == 7)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11;

    v13 = v3 - 1;
    if (v12 <= 2.0)
    {
      if (v13 < 0x15 && ((0x1C30C3u >> v13) & 1) != 0)
      {
        v14 = (double *)((char *)&unk_2114A31D8 + 8 * v13);
        v15 = &unk_2114A3280;
        goto LABEL_17;
      }
    }
    else if (v13 < 0x15 && ((0x1C30C3u >> v13) & 1) != 0)
    {
      v14 = (double *)((char *)&unk_2114A3088 + 8 * v13);
      v15 = &unk_2114A3130;
LABEL_17:
      v7 = *v14;
      v5 = *(double *)&v15[v13];
    }
  }
  else if (style == 6)
  {
    v13 = v3 - 1;
    if (v3 - 1 < 8 && ((0xC3u >> v13) & 1) != 0)
    {
      v14 = (double *)((char *)&unk_2114A3008 + 8 * v13);
      v15 = &unk_2114A3048;
      goto LABEL_17;
    }
  }
  v16 = v5;
  v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BPSWatchView)initWithStyle:(unint64_t)a3 andVersionModifier:(id)a4
{
  return -[BPSWatchView initWithStyle:versionModifier:allowsMaterialFallback:](self, "initWithStyle:versionModifier:allowsMaterialFallback:", a3, a4, 0);
}

- (BPSWatchView)initWithStyle:(unint64_t)a3 allowsMaterialFallback:(BOOL)a4
{
  return -[BPSWatchView initWithStyle:versionModifier:allowsMaterialFallback:](self, "initWithStyle:versionModifier:allowsMaterialFallback:", a3, 0, a4);
}

- (id)watchAssetBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Bridge"));
}

- (void)setScreenImageName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *screenImageName;
  unint64_t sizeOverride;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  screenImageName = self->_screenImageName;
  self->_screenImageName = v5;

  if (-[NSString length](self->_screenImageName, "length"))
  {
    sizeOverride = self->_sizeOverride;
    if (sizeOverride)
    {
      objc_msgSend(MEMORY[0x24BE6E4A0], "resourceString:material:size:forAttributes:", self->_screenImageName, 0, sizeOverride, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resourceString:forAttributes:", self->_screenImageName, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!self->_screenImageSearchBundleIdentifier
      || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:"),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[BPSWatchView watchAssetBundle](self, "watchAssetBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_wantsLightenBlendedScreen)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithImage:", v11);
      objc_msgSend(v11, "size");
      -[BPSWatchView screenBackground:](self, "screenBackground:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithImage:", v13);
      v15 = (void *)v14;
      if (v12 && v14)
      {
        v32 = v8;
        v16 = (void *)MEMORY[0x24BDBF658];
        v33[0] = CFSTR("inputImage");
        v33[1] = CFSTR("inputBackgroundImage");
        v34[0] = v12;
        v34[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v31 = v10;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "filterWithName:withInputParameters:", CFSTR("CILightenBlendMode"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "outputImage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF648]), "initWithOptions:", 0);
        objc_msgSend(v19, "extent");
        v21 = objc_msgSend(v20, "createCGImage:fromRect:", v19);
        v22 = objc_alloc(MEMORY[0x24BDF6AC8]);
        objc_msgSend(v11, "scale");
        v23 = v21;
        v10 = v31;
        v24 = objc_msgSend(v22, "initWithCGImage:scale:orientation:", v23, 0);

        v8 = v32;
        v11 = (void *)v24;
      }
      else
      {
        NSLog(CFSTR("Error: Unable to create CIImages for screenImage: %@"), v4);
      }

    }
    if (PBIsInternalInstall() && -[BPSWatchView wantsInternalFPOLabel](self, "wantsInternalFPOLabel"))
    {
      v25 = objc_alloc(MEMORY[0x24BDF6B68]);
      objc_msgSend(v11, "size");
      v26 = (void *)objc_msgSend(v25, "initWithSize:");
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBackgroundColor:", v27);

      objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 10.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFont:", v28);

      objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTextColor:", v29);

      objc_msgSend(v26, "setNumberOfLines:", 0);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FPO [No Radars Please] %@"), v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v30);

      -[UIImageView addSubview:](self->_watchScreenImageView, "addSubview:", v26);
    }
    -[UIImageView setImage:](self->_watchScreenImageView, "setImage:", v11);
    -[BPSWatchView setNeedsLayout](self, "setNeedsLayout");

  }
  else
  {
    -[UIImageView setImage:](self->_watchScreenImageView, "setImage:", 0);
  }
  -[BPSWatchView applyScreenStyle](self, "applyScreenStyle");

}

- (id)screenBackground:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CGSize v12;

  height = a3.height;
  width = a3.width;
  if (a3.width == *MEMORY[0x24BDBF148] && a3.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v10 = 0;
  }
  else
  {
    -[BPSWatchView image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12.width = width;
    v12.height = height;
    UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);
    v8 = _ScreenInsets(self->_style, -[BPSWatchView deviceSize](self, "deviceSize"));
    objc_msgSend(v7, "drawAtPoint:", -v8, -v9);
    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v10;
}

- (CGRect)watchScreenInsetGuide
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v3 = _ScreenInsets(self->_style, -[BPSWatchView deviceSize](self, "deviceSize"));
  v5 = v4;
  -[BPSWatchView screenImageSize](self, "screenImageSize");
  v7 = v6;
  v9 = v8;
  v10 = v3;
  v11 = v5;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[BPSRemoteImageView sizeThatFits:](self->_watchImageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_cleanedImageName:(id *)a3 withFallbackImage:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  void *v14;
  id v15;

  if (PBIsInternalInstall())
  {
    objc_msgSend(*a4, "rangeOfString:", CFSTR("448h"));
    v7 = v6;
    objc_msgSend(*a4, "rangeOfString:", CFSTR("394h"));
    if (v8 | v7)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathForResource:ofType:", *a4, CFSTR("png"));
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v15;
      if (!v15)
      {
        if (v7)
          v11 = CFSTR("448h");
        else
          v11 = CFSTR("394h");
        v12 = *a4;
        v13 = v11;
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", v13, CFSTR("regular"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*a3, "stringByReplacingOccurrencesOfString:withString:", v13, CFSTR("regular"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        *a3 = v14;
        v10 = 0;
      }

    }
  }
}

- (unint64_t)deviceSize
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "size");

  if (self->_sizeOverride)
    return self->_sizeOverride;
  else
    return v4;
}

- (id)image
{
  return (id)-[BPSRemoteImageView image](self->_watchImageView, "image");
}

- (NSString)screenImageSearchBundleIdentifier
{
  return self->_screenImageSearchBundleIdentifier;
}

- (void)setScreenImageSearchBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_screenImageSearchBundleIdentifier, a3);
}

- (NSString)screenImageName
{
  return self->_screenImageName;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)sizeOverride
{
  return self->_sizeOverride;
}

- (void)setSizeOverride:(unint64_t)a3
{
  self->_sizeOverride = a3;
}

- (void)setWatchImageView:(id)a3
{
  objc_storeStrong((id *)&self->_watchImageView, a3);
}

- (NSString)styleVersionSuffix
{
  return self->_styleVersionSuffix;
}

- (void)setStyleVersionSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (BOOL)wantsLightenBlendedScreen
{
  return self->_wantsLightenBlendedScreen;
}

- (void)setWantsLightenBlendedScreen:(BOOL)a3
{
  self->_wantsLightenBlendedScreen = a3;
}

- (BOOL)wantsInternalFPOLabel
{
  return self->_wantsInternalFPOLabel;
}

- (void)setWantsInternalFPOLabel:(BOOL)a3
{
  self->_wantsInternalFPOLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchScreenImageView, 0);
  objc_storeStrong((id *)&self->_styleVersionSuffix, 0);
  objc_storeStrong((id *)&self->_watchImageView, 0);
  objc_storeStrong((id *)&self->_screenImageName, 0);
  objc_storeStrong((id *)&self->_screenImageSearchBundleIdentifier, 0);
}

@end
