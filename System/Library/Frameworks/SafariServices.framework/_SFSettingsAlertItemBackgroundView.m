@implementation _SFSettingsAlertItemBackgroundView

- (_SFSettingsAlertItemBackgroundView)initWithFrame:(CGRect)a3
{
  _SFSettingsAlertItemBackgroundView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *highlightView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *highlightToTopConstraint;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *highlightToBottomConstraint;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *highlightToLeadingConstraint;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *highlightToLeadingWithSpaceConstraint;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *highlightPixelHeightConstraint;
  void *v30;
  uint64_t v31;
  NSLayoutConstraint *highlightPixelWidthConstraint;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _SFSettingsAlertItemBackgroundView *v37;
  objc_super v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)_SFSettingsAlertItemBackgroundView;
  v3 = -[_SFSettingsAlertItemBackgroundView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[_SFSettingsAlertItemBackgroundView _highlightEffect](v3, "_highlightEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithEffect:", v5);
    highlightView = v3->_highlightView;
    v3->_highlightView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_highlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFSettingsAlertItemBackgroundView bounds](v3, "bounds");
    -[UIVisualEffectView setFrame:](v3->_highlightView, "setFrame:");
    -[UIVisualEffectView setHidden:](v3->_highlightView, "setHidden:", 1);
    -[UIVisualEffectView contentView](v3->_highlightView, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_highlightView, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[_SFSettingsAlertItemBackgroundView addSubview:](v3, "addSubview:", v3->_highlightView);
    -[UIVisualEffectView topAnchor](v3->_highlightView, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItemBackgroundView topAnchor](v3, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    highlightToTopConstraint = v3->_highlightToTopConstraint;
    v3->_highlightToTopConstraint = (NSLayoutConstraint *)v13;

    -[UIVisualEffectView bottomAnchor](v3->_highlightView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItemBackgroundView bottomAnchor](v3, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    highlightToBottomConstraint = v3->_highlightToBottomConstraint;
    v3->_highlightToBottomConstraint = (NSLayoutConstraint *)v17;

    -[UIVisualEffectView leadingAnchor](v3->_highlightView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItemBackgroundView leadingAnchor](v3, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    highlightToLeadingConstraint = v3->_highlightToLeadingConstraint;
    v3->_highlightToLeadingConstraint = (NSLayoutConstraint *)v21;

    -[UIVisualEffectView leadingAnchor](v3->_highlightView, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItemBackgroundView leadingAnchor](v3, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v24, 1.0);
    v25 = objc_claimAutoreleasedReturnValue();
    highlightToLeadingWithSpaceConstraint = v3->_highlightToLeadingWithSpaceConstraint;
    v3->_highlightToLeadingWithSpaceConstraint = (NSLayoutConstraint *)v25;

    -[UIVisualEffectView heightAnchor](v3->_highlightView, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _SFOnePixel();
    objc_msgSend(v27, "constraintEqualToConstant:");
    v28 = objc_claimAutoreleasedReturnValue();
    highlightPixelHeightConstraint = v3->_highlightPixelHeightConstraint;
    v3->_highlightPixelHeightConstraint = (NSLayoutConstraint *)v28;

    -[UIVisualEffectView widthAnchor](v3->_highlightView, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _SFOnePixel();
    objc_msgSend(v30, "constraintEqualToConstant:");
    v31 = objc_claimAutoreleasedReturnValue();
    highlightPixelWidthConstraint = v3->_highlightPixelWidthConstraint;
    v3->_highlightPixelWidthConstraint = (NSLayoutConstraint *)v31;

    -[UIVisualEffectView trailingAnchor](v3->_highlightView, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItemBackgroundView trailingAnchor](v3, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItemBackgroundView addConstraints:](v3, "addConstraints:", v36);

    -[_SFSettingsAlertItemBackgroundView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v37 = v3;
  }

  return v3;
}

- (void)setMode:(int64_t)a3
{
  void *v4;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[_SFSettingsAlertItemBackgroundView _highlightEffect](self, "_highlightEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_highlightView, "setEffect:", v4);

    -[_SFSettingsAlertItemBackgroundView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (id)_highlightEffect
{
  unint64_t mode;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  mode = self->_mode;
  if (mode > 6)
    v3 = 0;
  else
    v3 = qword_1A3CB1238[mode];
  v4 = (void *)MEMORY[0x1E0DC3F08];
  objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultPopoverBackgroundEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectForBlurEffect:style:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateConstraints
{
  void *v3;
  NSLayoutConstraint *highlightToBottomConstraint;
  NSLayoutConstraint *highlightToLeadingWithSpaceConstraint;
  NSLayoutConstraint *highlightPixelHeightConstraint;
  void *v7;
  int64_t mode;
  void *v9;
  void *v10;
  NSLayoutConstraint *highlightToTopConstraint;
  void *v12;
  _QWORD *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[8];

  v27[6] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)_SFSettingsAlertItemBackgroundView;
  -[_SFSettingsAlertItemBackgroundView updateConstraints](&v20, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  highlightToBottomConstraint = self->_highlightToBottomConstraint;
  v27[0] = self->_highlightToTopConstraint;
  v27[1] = highlightToBottomConstraint;
  highlightToLeadingWithSpaceConstraint = self->_highlightToLeadingWithSpaceConstraint;
  v27[2] = self->_highlightToLeadingConstraint;
  v27[3] = highlightToLeadingWithSpaceConstraint;
  highlightPixelHeightConstraint = self->_highlightPixelHeightConstraint;
  v27[4] = self->_highlightPixelWidthConstraint;
  v27[5] = highlightPixelHeightConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v7);

  -[UIVisualEffectView setHidden:](self->_highlightView, "setHidden:", self->_mode == 0);
  -[_SFSettingsAlertItemBackgroundView setBackgroundColor:](self, "setBackgroundColor:", 0);
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isBrowsingAssistantEnabled"))
  {
    mode = self->_mode;
    if (mode != 1)
      goto LABEL_5;
    -[UIVisualEffectView setHidden:](self->_highlightView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertItemBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v9);

  }
  mode = self->_mode;
LABEL_5:
  switch(mode)
  {
    case 0:
    case 1:
      v10 = (void *)MEMORY[0x1E0CB3718];
      highlightToTopConstraint = self->_highlightToTopConstraint;
      v21[0] = self->_highlightToLeadingConstraint;
      v21[1] = highlightToTopConstraint;
      v21[2] = self->_highlightToBottomConstraint;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v21;
      goto LABEL_12;
    case 2:
      v10 = (void *)MEMORY[0x1E0CB3718];
      v15 = self->_highlightPixelHeightConstraint;
      v26[0] = self->_highlightToTopConstraint;
      v26[1] = v15;
      v26[2] = self->_highlightToLeadingWithSpaceConstraint;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v26;
      goto LABEL_12;
    case 3:
      v10 = (void *)MEMORY[0x1E0CB3718];
      v14 = self->_highlightPixelHeightConstraint;
      v25[0] = self->_highlightToTopConstraint;
      v25[1] = v14;
      v25[2] = self->_highlightToLeadingConstraint;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v25;
      goto LABEL_12;
    case 4:
      v10 = (void *)MEMORY[0x1E0CB3718];
      v16 = self->_highlightPixelHeightConstraint;
      v24[0] = self->_highlightToBottomConstraint;
      v24[1] = v16;
      v24[2] = self->_highlightToLeadingWithSpaceConstraint;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v24;
      goto LABEL_12;
    case 5:
      v10 = (void *)MEMORY[0x1E0CB3718];
      v17 = self->_highlightPixelHeightConstraint;
      v23[0] = self->_highlightToBottomConstraint;
      v23[1] = v17;
      v23[2] = self->_highlightToLeadingConstraint;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v23;
      goto LABEL_12;
    case 6:
      v10 = (void *)MEMORY[0x1E0CB3718];
      v18 = self->_highlightToBottomConstraint;
      v22[0] = self->_highlightToTopConstraint;
      v22[1] = v18;
      v22[2] = self->_highlightPixelWidthConstraint;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v22;
LABEL_12:
      objc_msgSend(v12, "arrayWithObjects:count:", v13, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activateConstraints:", v19);

      break;
    default:
      return;
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPixelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_highlightPixelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToLeadingWithSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToTopConstraint, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end
