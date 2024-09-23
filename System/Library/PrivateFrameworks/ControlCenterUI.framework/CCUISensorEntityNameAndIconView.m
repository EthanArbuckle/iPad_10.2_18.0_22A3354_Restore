@implementation CCUISensorEntityNameAndIconView

- (id)_titleLabelForSensorAttributionEntity:(id)a3 maxSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[3];
  _QWORD v24[4];

  height = a4.height;
  width = a4.width;
  v24[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[CCUISensorEntityNameAndIconView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v7, "executableDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4B10], 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "setUsesDefaultHyphenation:", 1);
  v17 = *MEMORY[0x1E0DC1138];
  v23[0] = *MEMORY[0x1E0DC1178];
  v23[1] = v17;
  v24[0] = v16;
  v24[1] = v14;
  v23[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, v19);
  if (IsAccessibilityCategory)
    v21 = 0;
  else
    v21 = 2;
  objc_msgSend(v11, "setNumberOfLines:", v21);
  objc_msgSend(v11, "setAttributedText:", v20);
  objc_msgSend(v11, "sizeThatFits:", width, height);
  if (IsAccessibilityCategory)
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);
  BSRectWithSize();
  objc_msgSend(v11, "setFrame:");

  return v11;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[CCUISensorEntityNameAndIconView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (CCUISensorEntityNameAndIconView)initWithSensorEntity:(id)a3 maxSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  CCUISensorEntityNameAndIconView *v8;
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
  void *v35;
  NSString *v36;
  _BOOL4 IsAccessibilityCategory;
  UIImageView *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double MaxX;
  double v48;
  objc_super v50;
  _QWORD v51[2];

  height = a4.height;
  width = a4.width;
  v51[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CCUISensorEntityNameAndIconView;
  v8 = -[CCUISensorEntityNameAndIconView init](&v50, sel_init);
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

    -[CCUISensorEntityNameAndIconView addSubview:](v8, "addSubview:", v8->_entityIconView);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorEntityNameAndIconView layer](v8, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFilters:", v19);

    -[SBFView setAnimatedLayerProperties:](v8, "setAnimatedLayerProperties:", &unk_1E8D18878);
    -[CCUISensorEntityNameAndIconView setClipsToBounds:](v8, "setClipsToBounds:", 0);
    -[CCUISensorEntityNameAndIconView _titleLabelForSensorAttributionEntity:maxSize:](v8, "_titleLabelForSensorAttributionEntity:maxSize:", v7, v12, height);
    v20 = objc_claimAutoreleasedReturnValue();
    appNameLabel = v8->_appNameLabel;
    v8->_appNameLabel = (UILabel *)v20;

    -[CCUISensorEntityNameAndIconView addSubview:](v8, "addSubview:", v8->_appNameLabel);
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
    -[CCUISensorEntityNameAndIconView traitCollection](v8, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "preferredContentSizeCategory");
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

    if (IsAccessibilityCategory)
    {
      v38 = v8->_entityIconView;
      -[UIImageView center](v38, "center");
      v40 = v39;
      -[UILabel center](v8->_appNameLabel, "center");
      -[UIImageView setCenter:](v38, "setCenter:", v40);
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "userInterfaceLayoutDirection");
    if (v42 == 1)
      v43 = v24;
    else
      v43 = v32;
    v44 = 0.0;
    if (v42 == 1)
      v45 = v11;
    else
      v45 = v29;
    if (v42 == 1)
      v46 = v11;
    else
      v46 = v31;
    MaxX = CGRectGetMaxX(*(CGRect *)&v43);

    if (v31 >= v11)
      v48 = v31;
    else
      v48 = v11;
    -[CCUISensorEntityNameAndIconView setFrame:](v8, "setFrame:", 0.0, 0.0, MaxX, v48);

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
