@implementation NTKPeopleComplicationImageView

- (NTKPeopleComplicationImageView)initWithFrame:(CGRect)a3
{
  NTKPeopleComplicationImageView *v3;
  UILabel *v4;
  UILabel *nameLabel;
  void *v6;
  UIImageView *v7;
  UIImageView *profileImageView;
  UIView *v9;
  UIView *ringView;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKPeopleComplicationImageView;
  v3 = -[NTKPeopleComplicationImageView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_nameLabel, "setTextColor:", v6);

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_nameLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](v3->_nameLabel, "setTextAlignment:", 1);
    -[NTKPeopleComplicationImageView addSubview:](v3, "addSubview:", v3->_nameLabel);
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    profileImageView = v3->_profileImageView;
    v3->_profileImageView = v7;

    -[UIImageView setContentMode:](v3->_profileImageView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v3->_profileImageView, "setClipsToBounds:", 1);
    -[NTKPeopleComplicationImageView addSubview:](v3, "addSubview:", v3->_profileImageView);
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    ringView = v3->_ringView;
    v3->_ringView = v9;

    -[UIView setClipsToBounds:](v3->_ringView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    -[UIView layer](v3->_ringView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderColor:", v12);

    v3->_usingPersonSymbol = 0;
    -[NTKPeopleComplicationImageView addSubview:](v3, "addSubview:", v3->_ringView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  double width;
  double height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)NTKPeopleComplicationImageView;
  -[NTKPeopleComplicationImageView layoutSubviews](&v30, sel_layoutSubviews);
  -[NTKPeopleComplicationImageView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  if (v3 >= v4)
    v11 = v4;
  else
    v11 = v3;
  v12 = (v3 - v11) * 0.5;
  v13 = (v4 - v11) * 0.5;
  -[UIImageView setFrame:](self->_profileImageView, "setFrame:", v12, v13, v11, v11);
  -[UIImageView layer](self->_profileImageView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v11 * 0.5);

  -[UIView setFrame:](self->_ringView, "setFrame:", v12, v13, v11, v11);
  -[UIView layer](self->_ringView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v11 * 0.5);

  -[UIView layer](self->_ringView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "borderWidth");
  v18 = v17 * 0.5;
  -[UIView layer](self->_ringView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "borderWidth");
  v21 = v20 * 0.5;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v9;
  v31.size.height = v10;
  v32 = CGRectInset(v31, v18, v21);
  width = v32.size.width;
  height = v32.size.height;

  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", width, height);
  v26 = v24;
  v27 = v25;
  if (v25 > 0.0 && v24 > 0.0)
  {
    v28 = v24 / v25;
    v29 = width * width / (v28 * v28 + 1.0);
    v27 = sqrtf(v29);
    v26 = v28 * v27;
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", (v9 - v26) * 0.5, (v10 - v27) * 0.5);
}

- (void)setImageProvider:(id)a3
{
  CLKImageProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  double v18;
  double v19;
  void *v20;
  CLKSymbolImageProvider *v21;
  CLKSymbolImageProvider *personSymbolImageProvider;
  CLKSymbolImageProvider *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CLKSymbolImageProvider *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_storeStrong((id *)&self->_imageProvider, a3);
  v5 = self->_imageProvider;
  -[CLKImageProvider nameAbbreviation](v5, "nameAbbreviation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v7);

  -[CLKImageProvider profileImage](v5, "profileImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    -[UILabel text](self->_nameLabel, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C94538], "_symbolImageProviderWithSystemName:", CFSTR("person.crop.circle.fill"));
      v21 = (CLKSymbolImageProvider *)objc_claimAutoreleasedReturnValue();
      personSymbolImageProvider = self->_personSymbolImageProvider;
      self->_personSymbolImageProvider = v21;

      v23 = self->_personSymbolImageProvider;
      -[UIImageView frame](self->_profileImageView, "frame");
      v25 = v24;
      v27 = v26;
      -[UIImageView frame](self->_profileImageView, "frame");
      v17 = 1;
      -[CLKSymbolImageProvider finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:maskToCircle:](v23, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:maskToCircle:", 0, 5, 1, v25, v27);
      v28 = self->_personSymbolImageProvider;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKSymbolImageProvider createSymbolImageForType:color:](v28, "createSymbolImageForType:color:", 2, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_profileImageView, "setImage:", v30);

      -[UIImageView setHidden:](self->_profileImageView, "setHidden:", 0);
      -[UILabel setHidden:](self->_nameLabel, "setHidden:", 1);
      goto LABEL_5;
    }
  }
  -[CLKImageProvider profileImage](v5, "profileImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_profileImageView, "setImage:", v11);

  -[CLKImageProvider profileImage](v5, "profileImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", v12 != 0);

  -[CLKImageProvider profileImage](v5, "profileImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHidden:](self->_profileImageView, "setHidden:", v13 == 0);

  v14 = (void *)MEMORY[0x1E0C944D0];
  -[CLKImageProvider fontSize](v5, "fontSize");
  objc_msgSend(v14, "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CLKFontWithAlternativePunctuation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v16);

  v17 = 0;
LABEL_5:
  self->_usingPersonSymbol = v17;
  -[CLKImageProvider borderWidth](v5, "borderWidth");
  v19 = v18;
  -[UIView layer](self->_ringView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBorderWidth:", v19);

  -[NTKPeopleComplicationImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setColor:(id)a3
{
  UIColor **p_color;
  id v6;
  uint64_t v7;
  id v8;

  p_color = &self->_color;
  objc_storeStrong((id *)&self->_color, a3);
  v6 = a3;
  -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", *p_color);
  v7 = -[UIColor CGColor](*p_color, "CGColor");
  -[UIView layer](self->_ringView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBorderColor:", v7);
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKPeopleComplicationImageView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("NTKPeopleComplicationImageProviderMetadataKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKPeopleComplicationImageView setImageProvider:](self, "setImageProvider:", v6);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (int64_t)_profileImageFilterStyle
{
  void *v2;
  void *v3;
  int v4;

  -[NTKPeopleComplicationImageView filterProvider](self, "filterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowGossamerUI(v3);

  if (v4)
    return 5;
  else
    return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  UIColor *v6;
  UIColor *color;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[NTKPeopleComplicationImageView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorForView:accented:", self, 1);
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  color = self->_color;
  self->_color = v6;

  self->_monochromeTintAmount = a3;
  -[NTKPeopleComplicationImageView filterProvider](self, "filterProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, 3, a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (self->_usingPersonSymbol)
    {
      -[UIImageView layer](self->_profileImageView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFilters:", v17);
    }
    else
    {
      -[NTKPeopleComplicationImageView filterProvider](self, "filterProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filtersForView:style:fraction:", self, -[NTKPeopleComplicationImageView _profileImageFilterStyle](self, "_profileImageFilterStyle"), a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageView layer](self->_profileImageView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFilters:", v9);

    }
    -[UILabel layer](self->_nameLabel, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v17);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v13, self->_color);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGColor");
  -[UIView layer](self->_ringView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderColor:", v15);

}

- (void)updateMonochromeColor
{
  -[NTKPeopleComplicationImageView transitionToMonochromeWithFraction:](self, "transitionToMonochromeWithFraction:", 1.0);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_personSymbolImageProvider, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_profileImageView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
