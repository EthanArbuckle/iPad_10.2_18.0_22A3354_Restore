@implementation MRMediaControlsVideoPickerHeaderView

- (MRMediaControlsVideoPickerHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRMediaControlsVideoPickerHeaderView *v7;
  uint64_t v8;
  UILabel *titleLabel;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImageView *airPlayIconImageView;
  void *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)MRMediaControlsVideoPickerHeaderView;
  v7 = -[MRMediaControlsVideoPickerHeaderView initWithFrame:](&v17, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    -[UILabel setTextAlignment:](v7->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLAY_VIDEO_PICKER_TITLE"), &stru_1E581FBA8, CFSTR("MediaControls"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7->_titleLabel, "setText:", v11);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    airPlayIconImageView = v7->_airPlayIconImageView;
    v7->_airPlayIconImageView = (UIImageView *)v12;

    +[MediaControlsTheme airplayVideoImage](MediaControlsTheme, "airplayVideoImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v7->_airPlayIconImageView, "setImage:", v14);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 32.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v7->_airPlayIconImageView, "setPreferredSymbolConfiguration:", v15);

    -[MRMediaControlsVideoPickerHeaderView addSubview:](v7, "addSubview:", v7->_titleLabel);
    -[MRMediaControlsVideoPickerHeaderView addSubview:](v7, "addSubview:", v7->_airPlayIconImageView);
  }
  return v7;
}

- (void)layoutSubviews
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
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MRMediaControlsVideoPickerHeaderView;
  -[MRMediaControlsVideoPickerHeaderView layoutSubviews](&v28, sel_layoutSubviews);
  -[MRMediaControlsVideoPickerHeaderView bounds](self, "bounds");
  -[MRMediaControlsVideoPickerHeaderView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  -[UIImageView sizeThatFits:](self->_airPlayIconImageView, "sizeThatFits:", v3, v4);
  UIRectCenteredXInRect();
  v26 = v6;
  v27 = v5;
  v8 = v7;
  v10 = v9;
  UIRectInset();
  UIRectInset();
  v12 = v11;
  v14 = v13;
  -[MRMediaControlsVideoPickerHeaderView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v12, v14);

  UIRectCenteredXInRect();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[MRMediaControlsVideoPickerHeaderView airPlayIconImageView](self, "airPlayIconImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v27, v26, v8, v10);

  -[MRMediaControlsVideoPickerHeaderView titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MRMediaControlsVideoPickerHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");

  UIRoundToScale();
  v8 = v7;
  -[UIImageView sizeThatFits:](self->_airPlayIconImageView, "sizeThatFits:", width, height);
  v10 = v9 + 10.0;
  -[MRMediaControlsVideoPickerHeaderView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v10 + v12 + 10.0;

  if (v8 >= v13)
    v14 = v8;
  else
    v14 = v13;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider **p_visualStylingProvider;
  MTVisualStylingProvider *visualStylingProvider;
  void *v8;
  MTVisualStylingProvider *v9;
  void *v10;
  MTVisualStylingProvider *v11;
  void *v12;
  MTVisualStylingProvider *v13;
  void *v14;
  MTVisualStylingProvider *v15;

  v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v15 = v5;
    -[MRMediaControlsVideoPickerHeaderView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", v8);

    v9 = *p_visualStylingProvider;
    -[MRMediaControlsVideoPickerHeaderView airPlayIconImageView](self, "airPlayIconImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v9, "stopAutomaticallyUpdatingView:", v10);

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    v11 = *p_visualStylingProvider;
    -[MRMediaControlsVideoPickerHeaderView titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v11, "automaticallyUpdateView:withStyle:", v12, 0);

    v13 = *p_visualStylingProvider;
    -[MRMediaControlsVideoPickerHeaderView airPlayIconImageView](self, "airPlayIconImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v13, "automaticallyUpdateView:withStyle:", v14, 0);

    v5 = v15;
  }

}

- (void)_updateStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = *MEMORY[0x1E0DC4AB8];
  -[MRMediaControlsVideoPickerHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsVideoPickerHeaderView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[MRMediaControlsVideoPickerHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UIImageView)airPlayIconImageView
{
  return self->_airPlayIconImageView;
}

- (void)setAirPlayIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_airPlayIconImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_airPlayIconImageView, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end
