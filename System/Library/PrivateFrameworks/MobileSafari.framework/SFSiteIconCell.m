@implementation SFSiteIconCell

- (void)setVisualEffectGroupName:(id)a3
{
  -[_SFSiteIconView setVisualEffectGroupName:](self->_iconView, "setVisualEffectGroupName:", a3);
}

- (void)setBackdropCaptureView:(id)a3
{
  -[_SFSiteIconView setBackdropCaptureView:](self->_iconView, "setBackdropCaptureView:", a3);
}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SiteIcon");
}

- (SFSiteIconCell)initWithFrame:(CGRect)a3
{
  SFSiteIconCell *v3;
  SFSiteIconCell *v4;
  void *v5;
  _SFSiteIconView *v6;
  _SFSiteIconView *iconView;
  id v8;
  uint64_t v9;
  UIView *iconDimmingView;
  void *v11;
  UILabel *v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  SFSiteIconCell *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[10];

  v53[8] = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)SFSiteIconCell;
  v3 = -[SFSiteIconCell initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFSiteIconCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("SFSiteIconCell"));
    -[SFSiteIconCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(_SFSiteIconView);
    iconView = v4->_iconView;
    v4->_iconView = v6;

    -[_SFSiteIconView setAllowsDropShadow:](v4->_iconView, "setAllowsDropShadow:", 1);
    -[_SFSiteIconView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_iconView);
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[_SFSiteIconView bounds](v4->_iconView, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    iconDimmingView = v4->_iconDimmingView;
    v4->_iconDimmingView = (UIView *)v9;

    +[_SFSiteIcon cornerRadius](_SFSiteIcon, "cornerRadius");
    -[UIView _setContinuousCornerRadius:](v4->_iconDimmingView, "_setContinuousCornerRadius:");
    -[UIView setAlpha:](v4->_iconDimmingView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_iconDimmingView, "setBackgroundColor:", v11);

    -[UIView setAutoresizingMask:](v4->_iconDimmingView, "setAutoresizingMask:", 18);
    -[_SFSiteIconView addSubview:](v4->_iconView, "addSubview:", v4->_iconDimmingView);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A98]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", 32770);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v15, "pointSize");
    objc_msgSend(v16, "fontWithDescriptor:size:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v4->_titleLabel, "setFont:", v17);
    -[UILabel setMaximumContentSizeCategory:](v4->_titleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v18);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel _setUseShortcutIntrinsicContentSize:](v4->_titleLabel, "_setUseShortcutIntrinsicContentSize:", 1);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v19);
    LODWORD(v20) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    -[UILabel widthAnchor](v4->_titleLabel, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:multiplier:", v22, 1.15);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x1E0CB3718];
    -[_SFSiteIconView widthAnchor](v4->_iconView, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView heightAnchor](v4->_iconView, "heightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v49;
    -[_SFSiteIconView widthAnchor](v4->_iconView, "widthAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v45;
    -[_SFSiteIconView centerXAnchor](v4->_iconView, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v42;
    v53[3] = v47;
    -[UILabel centerXAnchor](v4->_titleLabel, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v37;
    -[_SFSiteIconView topAnchor](v4->_iconView, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v5;
    objc_msgSend(v5, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v23;
    -[UILabel topAnchor](v4->_titleLabel, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView bottomAnchor](v4->_iconView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v25, 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v26;
    objc_msgSend(v5, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 1143930880;
    objc_msgSend(v29, "sf_withPriority:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v32);

    v33 = v4;
  }

  return v4;
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[SFSiteIconCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSiteIconCell;
  -[SFSiteIconCell updateConstraints](&v4, sel_updateConstraints);
  -[UILabel text](self->_subtitleLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", objc_msgSend(v3, "length") == 0);

}

- (void)setIconFromBookmark:(id)a3
{
  id v4;

  v4 = a3;
  -[SFSiteIconCell _setAction:](self, "_setAction:", 0);
  -[_SFSiteIconView setBookmark:](self->_iconView, "setBookmark:", v4);

}

- (void)_setAction:(id)a3 backgroundEffect:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[_SFSiteIconView action](self->_iconView, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBSIsEqual();

  if ((v8 & 1) == 0)
  {
    -[_SFSiteIconView setAction:backgroundEffect:](self->_iconView, "setAction:backgroundEffect:", v10, v6);
    objc_msgSend(v10, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteIconCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v9);

  }
}

- (void)_setAction:(id)a3
{
  -[SFSiteIconCell _setAction:backgroundEffect:](self, "_setAction:backgroundEffect:", a3, 0);
}

- (SFSiteIconCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSiteIconCell;
  return -[SFSiteIconCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSiteIconCell;
  -[SFSiteIconCell layoutSubviews](&v7, sel_layoutSubviews);
  -[SFSiteIconCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_alternateUserInterfaceStyle");

  -[UILabel setOverrideUserInterfaceStyle:](self->_titleLabel, "setOverrideUserInterfaceStyle:", v4);
  -[UILabel setOverrideUserInterfaceStyle:](self->_subtitleLabel, "setOverrideUserInterfaceStyle:", v4);
  -[SFSiteIconCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sf_alternateTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTintColor:](self->_titleLabel, "setTintColor:", v6);

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSiteIconCell;
  -[SFSiteIconCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SFSiteIconCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E21E2B38;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v5, 0);
}

uint64_t __33__SFSiteIconCell_setHighlighted___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "setAlpha:", (double)*(unint64_t *)&a2);
}

- (UIView)contextMenuPreviewView
{
  return (UIView *)self->_iconView;
}

- (id)focusEffect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  -[_SFSiteIconView frame](self->_iconView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[_SFSiteIcon cornerRadius](_SFSiteIcon, "cornerRadius");
  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68], v4, v6, v8, v10, v11);
}

- (NSString)visualEffectGroupName
{
  return -[_SFSiteIconView visualEffectGroupName](self->_iconView, "visualEffectGroupName");
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return -[_SFSiteIconView backdropCaptureView](self->_iconView, "backdropCaptureView");
}

- (UIImage)icon
{
  return -[_SFSiteIconView image](self->_iconView, "image");
}

- (void)setIcon:(id)a3
{
  id v4;

  v4 = a3;
  -[SFSiteIconCell _setAction:](self, "_setAction:", 0);
  -[_SFSiteIconView setImage:](self->_iconView, "setImage:", v4);

  -[SFSiteIconCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  UILabel *subtitleLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
    goto LABEL_5;
  if (objc_msgSend(v4, "length"))
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->_subtitleLabel;
    self->_subtitleLabel = v6;

    -[UILabel _setUseShortcutIntrinsicContentSize:](self->_subtitleLabel, "_setUseShortcutIntrinsicContentSize:", 1);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A98]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v10, "fontWithDescriptor:size:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v11);
    -[UILabel setMaximumContentSizeCategory:](self->_subtitleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v12);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v13) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    -[SFSiteIconCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_subtitleLabel);
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel widthAnchor](self->_subtitleLabel, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    -[UILabel centerXAnchor](self->_subtitleLabel, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v23;
    -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v16, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v17;
    objc_msgSend(v15, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v21);

  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
LABEL_5:
    -[UILabel setText:](subtitleLabel, "setText:", v4);
    -[SFSiteIconCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)configureUsingAction:(id)a3 backgroundEffect:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SFSiteIconCell setTitle:](self, "setTitle:", &stru_1E21FE780);
  -[SFSiteIconCell setSubtitle:](self, "setSubtitle:", &stru_1E21FE780);
  -[SFSiteIconCell _setAction:backgroundEffect:](self, "_setAction:backgroundEffect:", v7, v6);

  -[SFSiteIconCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconDimmingView, 0);
}

@end
