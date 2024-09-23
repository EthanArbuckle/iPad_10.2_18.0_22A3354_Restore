@implementation CCUISensorAttributionWebsiteView

- (id)_titleLabelForSensorActivityData:(id)a3 maxSize:(CGSize)a4
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
  void *v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v6 = (objc_class *)MEMORY[0x1E0DC3990];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "website");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4B10], 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v8, "setMinimumScaleFactor:", 0.5);
  objc_msgSend(v8, "setText:", v9);
  objc_msgSend(v8, "setFont:", v11);
  objc_msgSend(v8, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompositingFilter:", v13);

  objc_msgSend(v8, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupBlending:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v15);

  objc_msgSend(v8, "sizeThatFits:", width, height);
  BSRectWithSize();
  objc_msgSend(v8, "setFrame:");

  return v8;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[CCUISensorAttributionWebsiteView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (CCUISensorAttributionWebsiteView)initWithSensorActivityData:(id)a3 maxSize:(CGSize)a4
{
  double width;
  id v6;
  CCUISensorAttributionWebsiteView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UILabel *websiteLabel;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  objc_super v20;
  _QWORD v21[2];

  width = a4.width;
  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CCUISensorAttributionWebsiteView;
  v7 = -[CCUISensorAttributionWebsiteView init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionWebsiteView layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v10);

    -[CCUISensorAttributionWebsiteView layer](v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[SBFView setAnimatedLayerProperties:](v7, "setAnimatedLayerProperties:", &unk_1E8D18830);
    -[CCUISensorAttributionWebsiteView setClipsToBounds:](v7, "setClipsToBounds:", 0);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3998]), "initWithDelegate:", v7);
    -[CCUISensorAttributionWebsiteView addInteraction:](v7, "addInteraction:", v12);
    -[CCUISensorAttributionWebsiteView _titleLabelForSensorActivityData:maxSize:](v7, "_titleLabelForSensorActivityData:maxSize:", v6, width, 20.0);
    v13 = objc_claimAutoreleasedReturnValue();
    websiteLabel = v7->_websiteLabel;
    v7->_websiteLabel = (UILabel *)v13;

    -[CCUISensorAttributionWebsiteView addSubview:](v7, "addSubview:", v7->_websiteLabel);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceLayoutDirection");

    -[UILabel bounds](v7->_websiteLabel, "bounds");
    if (v16 == 1)
    {
      v18 = width - v17;
      -[UILabel bounds](v7->_websiteLabel, "bounds");
    }
    else
    {
      v18 = 0.0;
    }
    -[UILabel setFrame:](v7->_websiteLabel, "setFrame:", v18, 0.0);
    -[CCUISensorAttributionWebsiteView setFrame:](v7, "setFrame:", 0.0, 0.0, width, 20.0);

  }
  return v7;
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
  return -[UILabel text](self->_websiteLabel, "text");
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

- (UILabel)websiteLabel
{
  return self->_websiteLabel;
}

- (void)setWebsiteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_websiteLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteLabel, 0);
}

@end
