@implementation BPSIllustratedWatchView

- (BPSIllustratedWatchView)initWithFrame:(CGRect)a3
{
  BPSIllustratedWatchView *v3;
  BPSIllustratedWatchView *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  int AppBooleanValue;
  int v11;
  UIImageView *v12;
  UIImageView *watchView;
  UIImageView *v14;
  UIImageView *watchScreenImageView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  Boolean v33;
  Boolean keyExistsAndHasValidFormat;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)BPSIllustratedWatchView;
  v3 = -[BPSIllustratedWatchView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_usingCompactWatchAsset = -[BPSIllustratedWatchView _shouldUseCompactWatchAsset](v3, "_shouldUseCompactWatchAsset");
    BPSGetActiveSetupCompletedDevice();
    v5 = objc_claimAutoreleasedReturnValue();
    +[BPSBridgeAppContext shared](BPSBridgeAppContext, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "inWatchSetupFlow");

    if ((v7 & 1) != 0 || !v5)
    {
      objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "size");

    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x24BE6E4A0], "sizeFromDevice:", v5);
    }
    v32 = (void *)v5;
    v4->_usingAgaveWatchAsset = v8 == 19;
    v4->_usingAvoniaWatchAsset = (v8 & 0xFFFFFFFFFFFFFFFELL) == 20;
    if (PSIsInternalInstall())
    {
      keyExistsAndHasValidFormat = 0;
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DebugIdealAssetAgave"), CFSTR("com.apple.Bridge"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v4->_usingAgaveWatchAsset = AppBooleanValue != 0;
      v33 = 0;
      v11 = CFPreferencesGetAppBooleanValue(CFSTR("DebugIdealAssetAvonia"), CFSTR("com.apple.Bridge"), &v33);
      if (v33)
        v4->_usingAvoniaWatchAsset = v11 != 0;
    }
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    watchView = v4->_watchView;
    v4->_watchView = v12;

    -[BPSIllustratedWatchView _configureWatchImage](v4, "_configureWatchImage");
    -[BPSIllustratedWatchView addSubview:](v4, "addSubview:", v4->_watchView);
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    watchScreenImageView = v4->_watchScreenImageView;
    v4->_watchScreenImageView = v14;

    -[UIImageView addSubview:](v4->_watchView, "addSubview:", v4->_watchScreenImageView);
    v27 = (void *)MEMORY[0x24BDD1628];
    -[BPSIllustratedWatchView topAnchor](v4, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v4->_watchView, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v29;
    -[BPSIllustratedWatchView leadingAnchor](v4, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_watchView, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v17;
    -[BPSIllustratedWatchView trailingAnchor](v4, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_watchView, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v20;
    -[BPSIllustratedWatchView bottomAnchor](v4, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_watchView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v24);

    v4->_allowScaling = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v4, sel_textSizeDidChange_, *MEMORY[0x24BDF7670], 0);

  }
  return v4;
}

- (void)_configureWatchImage
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_usingAgaveWatchAsset)
  {
    if (self->_usingCompactWatchAsset)
      v3 = CFSTR("watch-ideal-compact-agave");
    else
      v3 = CFSTR("watch-ideal-agave");
  }
  else
  {
    v4 = CFSTR("watch-ideal-compact-aloe");
    if (!self->_usingCompactWatchAsset)
      v4 = CFSTR("watch-ideal-aloe");
    v5 = CFSTR("watch-ideal-avonia");
    if (self->_usingCompactWatchAsset)
      v5 = CFSTR("watch-ideal-compact-avonia");
    if (self->_usingAvoniaWatchAsset)
      v3 = v5;
    else
      v3 = v4;
  }
  v6 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", v3, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_watchView, "setImage:", v8);
  -[BPSIllustratedWatchView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)_shouldUseCompactWatchAsset
{
  NSString *v2;
  BOOL IsAccessibilityCategory;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (void)textSizeDidChange:(id)a3
{
  -[BPSIllustratedWatchView setUsingCompactWatchAsset:](self, "setUsingCompactWatchAsset:", -[BPSIllustratedWatchView _shouldUseCompactWatchAsset](self, "_shouldUseCompactWatchAsset", a3));
}

- (void)setUsingCompactWatchAsset:(BOOL)a3
{
  self->_usingCompactWatchAsset = a3;
  -[BPSIllustratedWatchView _updateCenteredSubviewConstraints](self, "_updateCenteredSubviewConstraints");
  -[BPSIllustratedWatchView _configureWatchImage](self, "_configureWatchImage");
}

- (void)setScreenImageName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *screenImageName;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSString *imageName;
  NSString *v20;
  NSString *v21;
  NSString *imageSearchBundlePath;
  int v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  screenImageName = self->_screenImageName;
  self->_screenImageName = v5;

  if (!-[NSString length](self->_screenImageName, "length"))
  {
    -[UIImageView setImage:](self->_watchScreenImageView, "setImage:", 0);
    goto LABEL_31;
  }
  self->_screenImageSize = 13;
  if (self->_usingAgaveWatchAsset)
  {
    v7 = 19;
  }
  else
  {
    if (!self->_usingAvoniaWatchAsset)
      goto LABEL_8;
    v7 = 21;
  }
  self->_screenImageSize = v7;
LABEL_8:
  objc_msgSend(MEMORY[0x24BE6E4A0], "resourceString:material:size:forAttributes:", self->_screenImageName, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_screenImageSearchBundleIdentifier
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:"),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[BPSIllustratedWatchView watchAssetBundle](self, "watchAssetBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (self->_usingAgaveWatchAsset && !v10)
  {
    self->_screenImageSize = 13;
    objc_msgSend(MEMORY[0x24BE6E4A0], "resourceString:material:size:forAttributes:", self->_screenImageName, 0, 13, 4);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", v12, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    bps_setup_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v12;
      _os_log_impl(&dword_21147E000, v13, OS_LOG_TYPE_DEFAULT, "Agave image doesn't exist, using aloe image for: %@", (uint8_t *)&v23, 0xCu);
    }

    if (v11)
      goto LABEL_16;
LABEL_18:
    self->_usingFallbackScreen = 1;
    self->_screenImageSize = 7;
    objc_msgSend(MEMORY[0x24BE6E4A0], "resourceString:material:size:forAttributes:", self->_screenImageName, 0, 7, 4);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", v14, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    bps_setup_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v14;
      _os_log_impl(&dword_21147E000, v15, OS_LOG_TYPE_DEFAULT, "Aloe image doesn't exist, using luxo image for: %@", (uint8_t *)&v23, 0xCu);
    }

    goto LABEL_21;
  }
  v12 = (NSString *)v8;
  if (!v10)
    goto LABEL_18;
LABEL_16:
  v14 = v12;
LABEL_21:
  bps_setup_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v14;
    _os_log_impl(&dword_21147E000, v16, OS_LOG_TYPE_DEFAULT, "Original ImageName: %@", (uint8_t *)&v23, 0xCu);
  }

  bps_setup_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = (NSString *)v4;
    _os_log_impl(&dword_21147E000, v17, OS_LOG_TYPE_DEFAULT, "Resolved ImageName: %@", (uint8_t *)&v23, 0xCu);
  }

  if (!v11)
  {
    bps_setup_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21147E000, v18, OS_LOG_TYPE_DEFAULT, "Did not resolve to valid screen image!", (uint8_t *)&v23, 2u);
    }

  }
  -[UIImageView setImage:](self->_watchScreenImageView, "setImage:", v11);
  imageName = self->_imageName;
  self->_imageName = v14;
  v20 = v14;

  objc_msgSend(v9, "bundlePath");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  imageSearchBundlePath = self->_imageSearchBundlePath;
  self->_imageSearchBundlePath = v21;

  -[BPSIllustratedWatchView setNeedsLayout](self, "setNeedsLayout");
LABEL_31:

}

- (id)watchAssetBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Bridge"));
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGAffineTransform *v34;
  CGFloat v35;
  NSValue *preferredCGSizeValue;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  NSObject *v43;
  void *v44;
  CGFloat v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  objc_super v49;
  CGAffineTransform v50;
  uint64_t v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v51 = *MEMORY[0x24BDAC8D0];
  v49.receiver = self;
  v49.super_class = (Class)BPSIllustratedWatchView;
  -[BPSIllustratedWatchView layoutSubviews](&v49, sel_layoutSubviews);
  if (self->_usingAgaveWatchAsset)
    v3 = 1.0;
  else
    v3 = 0.92;
  -[UIImageView image](self->_watchView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&v48, v3, v3);
  v9 = v8 * v48.c + v48.a * v6;
  v10 = v8 * v48.d + v48.b * v6;
  -[BPSIllustratedWatchView _unscaledWatchScreenInsetGuide](self, "_unscaledWatchScreenInsetGuide");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIImageView sizeThatFits:](self->_watchScreenImageView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  if (self->_allowScaling)
  {
    -[BPSIllustratedWatchView frame](self, "frame");
    if (v19 < v9 || (-[BPSIllustratedWatchView frame](self, "frame"), v20 < v10))
    {
      -[BPSIllustratedWatchView frame](self, "frame");
      v22 = v21 / v9;
      -[BPSIllustratedWatchView frame](self, "frame");
      v24 = fmin(v22, v23 / v10);
      self->_scaledDownFactor = v24;
      memset(&v50, 0, sizeof(v50));
      CGAffineTransformMakeScale(&v50, v24, v24);
      v47 = v50;
      v52.origin.x = 0.0;
      v52.origin.y = 0.0;
      v52.size.width = v9;
      v52.size.height = v10;
      v53 = CGRectApplyAffineTransform(v52, &v47);
      x = v53.origin.x;
      y = v53.origin.y;
      width = v53.size.width;
      height = v53.size.height;
      v47 = v50;
      v53.origin.x = v12;
      v53.origin.y = v14;
      v53.size.width = v16;
      v53.size.height = v18;
      v54 = CGRectApplyAffineTransform(v53, &v47);
      v45 = v54.origin.x;
      v14 = v54.origin.y;
      v16 = v54.size.width;
      v18 = v54.size.height;
      -[BPSIllustratedWatchView frame](self, "frame");
      self->_scaledDownXDelta = (v29 - width) * 0.5;
      -[BPSIllustratedWatchView frame](self, "frame");
      v31 = (v30 - height) * 0.5;
      self->_scaledDownYDelta = v31;
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeTranslation(&v47, self->_scaledDownXDelta, v31);
      v46 = v47;
      v55.origin.x = x;
      v55.origin.y = y;
      v55.size.width = width;
      v55.size.height = height;
      v56 = CGRectApplyAffineTransform(v55, &v46);
      v32 = v56.origin.x;
      v33 = v56.origin.y;
      v9 = v56.size.width;
      v10 = v56.size.height;
      v46 = v47;
      v34 = &v46;
      v35 = v45;
LABEL_17:
      v40 = v14;
      v41 = v16;
      v42 = v18;
      v59 = CGRectApplyAffineTransform(*(CGRect *)&v35, v34);
      v12 = v59.origin.x;
      v14 = v59.origin.y;
      v16 = v59.size.width;
      v18 = v59.size.height;
      goto LABEL_19;
    }
  }
  preferredCGSizeValue = self->_preferredCGSizeValue;
  if (preferredCGSizeValue)
  {
    -[NSValue CGSizeValue](preferredCGSizeValue, "CGSizeValue");
    if (v37 >= 2.22044605e-16)
    {
      if (v38 < 2.22044605e-16)
        v38 = v10 * v37 / v9;
    }
    else
    {
      v37 = v9 * v38 / v10;
    }
    v39 = fmin(v37 / v9, v38 / v10);
    self->_scaledDownFactor = v39;
    if (v39 < 1.0 || self->_allowUpScaling)
    {
      memset(&v50, 0, sizeof(v50));
      CGAffineTransformMakeScale(&v50, v39, v39);
      v47 = v50;
      v57.origin.x = 0.0;
      v57.origin.y = 0.0;
      v57.size.width = v9;
      v57.size.height = v10;
      v58 = CGRectApplyAffineTransform(v57, &v47);
      v32 = v58.origin.x;
      v33 = v58.origin.y;
      v9 = v58.size.width;
      v10 = v58.size.height;
      v47 = v50;
      v34 = &v47;
      v35 = v12;
      goto LABEL_17;
    }
  }
  else
  {
    self->_scaledDownFactor = 0.0;
    self->_scaledDownXDelta = 0.0;
    self->_scaledDownYDelta = 0.0;
  }
  v33 = 0.0;
  v32 = 0.0;
LABEL_19:
  bps_setup_log();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v60.origin.x = v12;
    v60.origin.y = v14;
    v60.size.width = v16;
    v60.size.height = v18;
    NSStringFromCGRect(v60);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50.a) = 138412290;
    *(_QWORD *)((char *)&v50.a + 4) = v44;
    _os_log_impl(&dword_21147E000, v43, OS_LOG_TYPE_DEFAULT, "watchScreenViewFrame: %@", (uint8_t *)&v50, 0xCu);

  }
  -[UIImageView setFrame:](self->_watchView, "setFrame:", v32, v33, v9, v10);
  -[UIImageView setFrame:](self->_watchScreenImageView, "setFrame:", v12, v14, v16, v18);
}

- (CGRect)_unscaledWatchScreenInsetGuide
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  if (self->_usingCompactWatchAsset)
  {
    if (self->_usingAgaveWatchAsset)
    {
      v6 = 21.0;
      v7 = 156.5;
      v8 = 128.0;
LABEL_6:
      v9 = 36.0;
      goto LABEL_15;
    }
    v6 = 29.0;
    if (self->_usingAvoniaWatchAsset)
      v6 = 10.0;
    v9 = 41.0;
    if (self->_usingAvoniaWatchAsset)
      v9 = 11.0;
    v7 = dbl_2114A3380[!self->_usingAvoniaWatchAsset];
    v8 = dbl_2114A3390[!self->_usingAvoniaWatchAsset];
  }
  else
  {
    if (self->_usingAgaveWatchAsset)
    {
      v7 = 156.5;
      v8 = 128.0;
      v6 = 76.0;
      goto LABEL_6;
    }
    v10 = 1.0 / v5;
    if (self->_usingAvoniaWatchAsset)
    {
      v9 = v10 + 11.0;
      v7 = 133.0;
      v8 = 111.0;
      v6 = 50.0;
    }
    else
    {
      v9 = v10 + 12.0;
      v7 = 126.0;
      v8 = 103.0;
      v6 = 83.0;
    }
  }
LABEL_15:
  result.size.height = v7;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v9;
  return result;
}

- (CGRect)watchScreenInsetGuide
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double scaledDownFactor;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  -[BPSIllustratedWatchView _unscaledWatchScreenInsetGuide](self, "_unscaledWatchScreenInsetGuide");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  scaledDownFactor = self->_scaledDownFactor;
  if (scaledDownFactor > 0.0)
  {
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, scaledDownFactor, scaledDownFactor);
    v21 = v22;
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    v24 = CGRectApplyAffineTransform(v23, &v21);
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, self->_scaledDownXDelta, self->_scaledDownYDelta);
    v20 = v21;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectApplyAffineTransform(v25, &v20);
    v4 = v26.origin.x;
    v6 = v26.origin.y;
    v8 = v26.size.width;
    v10 = v26.size.height;
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)addSyncTrapProgressView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *centeredSubviewCenterXConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_centeredSubviewCenterXConstraint)
  {
    bps_setup_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "Only one sync trap progress view is supported.", v15, 2u);
    }
  }
  else
  {
    -[BPSIllustratedWatchView watchView](self, "watchView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v4);

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BPSIllustratedWatchView centerXAnchor](self, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    centeredSubviewCenterXConstraint = self->_centeredSubviewCenterXConstraint;
    self->_centeredSubviewCenterXConstraint = v9;

    -[BPSIllustratedWatchView _updateCenteredSubviewConstraints](self, "_updateCenteredSubviewConstraints");
    v11 = (void *)MEMORY[0x24BDD1628];
    v16[0] = self->_centeredSubviewCenterXConstraint;
    -[BPSIllustratedWatchView centerYAnchor](self, "centerYAnchor");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject constraintEqualToAnchor:](v5, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v14);

  }
}

- (void)_updateCenteredSubviewConstraints
{
  double v2;

  v2 = 0.0;
  if (!self->_usingCompactWatchAsset && !self->_usingAgaveWatchAsset)
    v2 = 3.0;
  -[NSLayoutConstraint setConstant:](self->_centeredSubviewCenterXConstraint, "setConstant:", v2);
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

- (BOOL)allowScaling
{
  return self->_allowScaling;
}

- (void)setAllowScaling:(BOOL)a3
{
  self->_allowScaling = a3;
}

- (NSValue)preferredCGSizeValue
{
  return self->_preferredCGSizeValue;
}

- (void)setPreferredCGSizeValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (UIImageView)watchScreenImageView
{
  return self->_watchScreenImageView;
}

- (void)setWatchScreenImageView:(id)a3
{
  objc_storeStrong((id *)&self->_watchScreenImageView, a3);
}

- (UIImageView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
  objc_storeStrong((id *)&self->_watchView, a3);
}

- (double)scaledDownFactor
{
  return self->_scaledDownFactor;
}

- (void)setScaledDownFactor:(double)a3
{
  self->_scaledDownFactor = a3;
}

- (double)scaledDownXDelta
{
  return self->_scaledDownXDelta;
}

- (void)setScaledDownXDelta:(double)a3
{
  self->_scaledDownXDelta = a3;
}

- (double)scaledDownYDelta
{
  return self->_scaledDownYDelta;
}

- (void)setScaledDownYDelta:(double)a3
{
  self->_scaledDownYDelta = a3;
}

- (unint64_t)screenImageSize
{
  return self->_screenImageSize;
}

- (void)setScreenImageSize:(unint64_t)a3
{
  self->_screenImageSize = a3;
}

- (BOOL)usingCompactWatchAsset
{
  return self->_usingCompactWatchAsset;
}

- (BOOL)usingAgaveWatchAsset
{
  return self->_usingAgaveWatchAsset;
}

- (void)setUsingAgaveWatchAsset:(BOOL)a3
{
  self->_usingAgaveWatchAsset = a3;
}

- (BOOL)usingAvoniaWatchAsset
{
  return self->_usingAvoniaWatchAsset;
}

- (void)setUsingAvoniaWatchAsset:(BOOL)a3
{
  self->_usingAvoniaWatchAsset = a3;
}

- (NSLayoutConstraint)centeredSubviewCenterXConstraint
{
  return self->_centeredSubviewCenterXConstraint;
}

- (void)setCenteredSubviewCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centeredSubviewCenterXConstraint, a3);
}

- (NSString)imageSearchBundlePath
{
  return self->_imageSearchBundlePath;
}

- (void)setImageSearchBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (BOOL)allowUpScaling
{
  return self->_allowUpScaling;
}

- (void)setAllowUpScaling:(BOOL)a3
{
  self->_allowUpScaling = a3;
}

- (BOOL)usingFallbackScreen
{
  return self->_usingFallbackScreen;
}

- (void)setUsingFallbackScreen:(BOOL)a3
{
  self->_usingFallbackScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_imageSearchBundlePath, 0);
  objc_storeStrong((id *)&self->_centeredSubviewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_watchScreenImageView, 0);
  objc_storeStrong((id *)&self->_preferredCGSizeValue, 0);
  objc_storeStrong((id *)&self->_screenImageName, 0);
  objc_storeStrong((id *)&self->_screenImageSearchBundleIdentifier, 0);
}

@end
