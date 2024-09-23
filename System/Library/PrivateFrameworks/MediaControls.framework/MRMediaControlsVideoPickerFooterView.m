@implementation MRMediaControlsVideoPickerFooterView

- (MRMediaControlsVideoPickerFooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRMediaControlsVideoPickerFooterView *v7;
  uint64_t v8;
  UILabel *customTitleLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)MRMediaControlsVideoPickerFooterView;
  v7 = -[MPButton initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    customTitleLabel = v7->_customTitleLabel;
    v7->_customTitleLabel = (UILabel *)v8;

    -[MRMediaControlsVideoPickerFooterView customTitleLabel](v7, "customTitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 1);

    -[MRMediaControlsVideoPickerFooterView customTitleLabel](v7, "customTitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 1);

    -[MRMediaControlsVideoPickerFooterView titleLabelText](v7, "titleLabelText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMediaControlsVideoPickerFooterView customTitleLabel](v7, "customTitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[MRMediaControlsVideoPickerFooterView customTitleLabel](v7, "customTitleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMediaControlsVideoPickerFooterView addSubview:](v7, "addSubview:", v14);

  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MRMediaControlsVideoPickerFooterView;
  -[MPButton layoutSubviews](&v17, sel_layoutSubviews);
  -[MRMediaControlsVideoPickerFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[MRMediaControlsVideoPickerFooterView customTitleLabel](self, "customTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v4, v6);

  UIRectCenteredIntegralRect();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[MRMediaControlsVideoPickerFooterView customTitleLabel](self, "customTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MRMediaControlsVideoPickerFooterView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");

  UIRoundToScale();
  if (v6 >= height)
    v7 = height;
  else
    v7 = v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (id)titleLabelText
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = MGGetSInt32Answer();
  if (v2 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("AIRPLAY_VIDEO_PICKER_BUTTON_TITLE_IPAD");
  }
  else if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("AIRPLAY_VIDEO_PICKER_BUTTON_TITLE_IPOD");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("AIRPLAY_VIDEO_PICKER_BUTTON_TITLE_IPHONE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E581FBA8, CFSTR("MediaControls"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  BOOL v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRMediaControlsVideoPickerFooterView;
  -[MRMediaControlsVideoPickerFooterView setHighlighted:](&v11, sel_setHighlighted_);
  if (v3)
    v5 = 0.0;
  else
    v5 = 0.47;
  -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alpha");
  v8 = v7;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__MRMediaControlsVideoPickerFooterView_setHighlighted___block_invoke;
  v9[3] = &unk_1E581B370;
  v9[4] = self;
  v10 = v3;
  v9[5] = v8;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v9, 0, v5, 0.0);
}

void __55__MRMediaControlsVideoPickerFooterView_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 48))
    v1 = *(double *)(a1 + 40) * 0.2;
  else
    v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "customTitleLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *visualStylingProvider;
  void *v7;
  MTVisualStylingProvider *v8;
  void *v9;
  MTVisualStylingProvider *v10;

  v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v10 = v5;
    -[MRMediaControlsVideoPickerFooterView customTitleLabel](self, "customTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", v7);

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    v8 = self->_visualStylingProvider;
    -[MRMediaControlsVideoPickerFooterView customTitleLabel](self, "customTitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v8, "automaticallyUpdateView:withStyle:", v9, 0);

    v5 = v10;
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
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = *MEMORY[0x1E0DC4A88];
  -[MRMediaControlsVideoPickerFooterView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsVideoPickerFooterView customTitleLabel](self, "customTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsVideoPickerFooterView customTitleLabel](self, "customTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

  -[MRMediaControlsVideoPickerFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UILabel)customTitleLabel
{
  return self->_customTitleLabel;
}

- (void)setCustomTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTitleLabel, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end
