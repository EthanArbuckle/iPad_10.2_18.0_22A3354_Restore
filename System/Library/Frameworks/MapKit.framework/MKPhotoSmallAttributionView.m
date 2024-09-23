@implementation MKPhotoSmallAttributionView

- (id)attributionFont
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smallAttributionFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pointSize");
  if (v4 > 18.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F0]);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (MKPhotoSmallAttributionView)initWithMapItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  MKPhotoSmallAttributionView *v7;
  _MKUILabel *v8;
  _MKUILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 IsMacCatalyst;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _MKUILabel *label;
  _MKUILabel *v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  UIView *v30;
  void *v31;
  double v32;
  void *v33;
  UIView *backgroundView;
  MKPhotoSmallAttributionView *v35;
  objc_super v37;

  objc_msgSend(a3, "_mapkit_preferredFirstPhotoVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v37.receiver = self;
    v37.super_class = (Class)MKPhotoSmallAttributionView;
    v7 = -[MKPhotoSmallAttributionView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    if (v7)
    {
      v8 = [_MKUILabel alloc];
      -[MKPhotoSmallAttributionView bounds](v7, "bounds");
      v9 = -[_MKUILabel initWithFrame:](v8, "initWithFrame:");
      v10 = (void *)MEMORY[0x1E0CB3940];
      _MKLocalizedStringFromThisBundle(CFSTR("Photos on %@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "providerName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setText:](v9, "setText:", v13);

      -[MKPhotoSmallAttributionView attributionFont](v7, "attributionFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setFont:](v9, "setFont:", v14);

      IsMacCatalyst = MapKitIdiomIsMacCatalyst();
      v16 = 0.75;
      if (IsMacCatalyst)
        v16 = 0.85;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setTextColor:](v9, "setTextColor:", v17);

      -[MKPhotoSmallAttributionView traitCollection](v7, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "userInterfaceIdiom");

      if (v19 == 5)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKUILabel setTextColor:](v9, "setTextColor:", v20);

      }
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setBackgroundColor:](v9, "setBackgroundColor:", v21);

      -[_MKUILabel setTextAlignment:](v9, "setTextAlignment:", 1);
      label = v7->_label;
      v7->_label = v9;
      v23 = v9;

      -[_MKUILabel sizeToFit](v7->_label, "sizeToFit");
      -[_MKUILabel frame](v7->_label, "frame");
      v7->_labelSize.width = v24;
      v7->_labelSize.height = v25;
      -[_MKUILabel font](v7->_label, "font");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_mapkit_scaledValueForValue:", 12.0);
      v7->_labelSize.width = v7->_labelSize.width + round(v27);

      -[_MKUILabel font](v7->_label, "font");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_mapkit_scaledValueForValue:", 21.0);
      v7->_labelSize.height = round(v29);

      objc_msgSend(MEMORY[0x1E0CEABE8], "photoSmallAttributionVisualEffectView");
      v30 = (UIView *)objc_claimAutoreleasedReturnValue();
      +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "userInterfaceIdiom") == 2)
        v32 = 5.0;
      else
        v32 = 4.0;

      -[UIView _setCornerRadius:continuous:maskedCorners:](v30, "_setCornerRadius:continuous:maskedCorners:", 1, 15, v32);
      -[MKPhotoSmallAttributionView addSubview:](v7, "addSubview:", v30);
      -[UIView contentView](v30, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addSubview:", v23);

      backgroundView = v7->_backgroundView;
      v7->_backgroundView = v30;

      -[MKPhotoSmallAttributionView setClipsToBounds:](v7, "setClipsToBounds:", 1);
    }
    self = v7;
    v35 = self;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double height;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKPhotoSmallAttributionView;
  -[MKPhotoSmallAttributionView layoutSubviews](&v9, sel_layoutSubviews);
  -[MKPhotoSmallAttributionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  width = self->_labelSize.width;
  height = self->_labelSize.height;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[_MKUILabel setFrame:](self->_label, "setFrame:", (v4 - width) * 0.5, (v6 - height) * 0.5, width, height);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  uint64_t v4;
  double width;
  double height;
  CGSize result;

  -[MKPhotoSmallAttributionView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  width = self->_labelSize.width;
  if (v4 == 5)
  {
    width = width + 4.0;
    height = self->_labelSize.height + 8.0;
  }
  else
  {
    height = self->_labelSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
