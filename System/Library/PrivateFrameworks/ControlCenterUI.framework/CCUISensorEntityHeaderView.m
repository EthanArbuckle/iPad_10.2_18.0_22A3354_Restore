@implementation CCUISensorEntityHeaderView

- (id)_titleLabelForSensorAttributionEntity:(id)a3 maxSize:(CGSize)a4
{
  double height;
  double width;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  height = a4.height;
  width = a4.width;
  v20[3] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0DC3990];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "executableDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AD8], 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setUsesDefaultHyphenation:", 1);
  v14 = *MEMORY[0x1E0DC1138];
  v19[0] = *MEMORY[0x1E0DC1178];
  v19[1] = v14;
  v20[0] = v13;
  v20[1] = v11;
  v19[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v16);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setAttributedText:", v17);
  objc_msgSend(v8, "sizeThatFits:", width, height);
  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
  BSRectWithSize();
  objc_msgSend(v8, "setFrame:");

  return v8;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[CCUISensorEntityHeaderView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (CCUISensorEntityHeaderView)initWithSensorEntity:(id)a3 maxSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  CCUISensorEntityHeaderView *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIImageView *entityIconView;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UILabel *appNameLabel;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIImageView *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double MaxX;
  double v45;
  objc_super v47;
  _QWORD v48[2];

  height = a4.height;
  width = a4.width;
  v48[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CCUISensorEntityHeaderView;
  v8 = -[CCUISensorEntityHeaderView init](&v47, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "iconSize");
    v11 = v10;
    v12 = width - (v10 + 16.0);
    if (v9)
    {
      +[CCUISensorEntityIconCache sharedInstance](CCUISensorEntityIconCache, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageForEntity:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v14);
    entityIconView = v8->_entityIconView;
    v8->_entityIconView = (UIImageView *)v15;

    -[CCUISensorEntityHeaderView addSubview:](v8, "addSubview:", v8->_entityIconView);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorEntityHeaderView layer](v8, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFilters:", v19);

    -[SBFView setAnimatedLayerProperties:](v8, "setAnimatedLayerProperties:", &unk_1E8D188D8);
    -[CCUISensorEntityHeaderView setClipsToBounds:](v8, "setClipsToBounds:", 0);
    -[CCUISensorEntityHeaderView _titleLabelForSensorAttributionEntity:maxSize:](v8, "_titleLabelForSensorAttributionEntity:maxSize:", v7, v12, height);
    v20 = objc_claimAutoreleasedReturnValue();
    appNameLabel = v8->_appNameLabel;
    v8->_appNameLabel = (UILabel *)v20;

    -[CCUISensorEntityHeaderView addSubview:](v8, "addSubview:", v8->_appNameLabel);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceLayoutDirection");

    v24 = 0.0;
    if (v23 == 1)
    {
      -[UILabel bounds](v8->_appNameLabel, "bounds");
      v24 = v25 + 8.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceLayoutDirection");

    if (v27 == 1)
    {
      -[UILabel bounds](v8->_appNameLabel, "bounds");
      v29 = v28;
      -[UILabel bounds](v8->_appNameLabel, "bounds");
      v31 = v30;
      v32 = 0.0;
    }
    else
    {
      v32 = v11 + 8.0;
      -[UILabel bounds](v8->_appNameLabel, "bounds");
      v29 = v33;
      -[UILabel bounds](v8->_appNameLabel, "bounds");
      v31 = v34;
    }
    -[UIImageView setFrame:](v8->_entityIconView, "setFrame:", v24, 0.0, v11, v11);
    -[UILabel setFrame:](v8->_appNameLabel, "setFrame:", v32, 0.0, v29, v31);
    v35 = v8->_entityIconView;
    -[UIImageView center](v35, "center");
    v37 = v36;
    -[UILabel center](v8->_appNameLabel, "center");
    -[UIImageView setCenter:](v35, "setCenter:", v37);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "userInterfaceLayoutDirection");
    if (v39 == 1)
      v40 = v24;
    else
      v40 = v32;
    v41 = 0.0;
    if (v39 == 1)
      v42 = v11;
    else
      v42 = v29;
    if (v39 == 1)
      v43 = v11;
    else
      v43 = v31;
    MaxX = CGRectGetMaxX(*(CGRect *)&v40);

    if (v31 >= v11)
      v45 = v31;
    else
      v45 = v11;
    -[CCUISensorEntityHeaderView setFrame:](v8, "setFrame:", 0.0, 0.0, MaxX, v45);

  }
  return v8;
}

+ (CGSize)iconSize
{
  double v2;
  double v3;
  CGSize result;

  +[CCUISensorEntityIconCache iconSize](CCUISensorEntityIconCache, "iconSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)horizontalPaddingBetweenIconAndLabel
{
  return 8.0;
}

+ (int64_t)maximumNumberOfLines
{
  return 2;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (id)largeContentTitle
{
  return -[UILabel text](self->_appNameLabel, "text");
}

- (CGRect)cachedExpandedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->cachedExpandedRect.origin.x;
  y = self->cachedExpandedRect.origin.y;
  width = self->cachedExpandedRect.size.width;
  height = self->cachedExpandedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (UIImageView)entityIconView
{
  return self->_entityIconView;
}

- (void)setEntityIconView:(id)a3
{
  objc_storeStrong((id *)&self->_entityIconView, a3);
}

- (UILabel)appNameLabel
{
  return self->_appNameLabel;
}

- (void)setAppNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNameLabel, 0);
  objc_storeStrong((id *)&self->_entityIconView, 0);
}

@end
