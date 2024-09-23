@implementation AVTUserInfoView

+ (double)textVerticalPadding
{
  return 8.0;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTUserInfoView;
  -[AVTUserInfoView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[AVTUserInfoView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AVTUserInfoView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);
    goto LABEL_8;
  }
  -[AVTUserInfoView userInfoEffectView](self, "userInfoEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[AVTUserInfoView _configure](self, "_configure");
  if (!-[AVTUserInfoView isRegisteredForCategorySizeChange](self, "isRegisteredForCategorySizeChange"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);
LABEL_8:

    -[AVTUserInfoView setIsRegisteredForCategorySizeChange:](self, "setIsRegisteredForCategorySizeChange:", v3 != 0);
  }
}

- (void)setContainerBackgroundColor:(id)a3
{
  UIVisualEffectView *userInfoEffectView;
  id v4;
  id v5;

  if (self->_containerBackgroundColor != a3)
  {
    self->_containerBackgroundColor = (UIColor *)a3;
    userInfoEffectView = self->_userInfoEffectView;
    v4 = a3;
    -[UIVisualEffectView contentView](userInfoEffectView, "contentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (void)_configure
{
  UIVisualEffectView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIVisualEffectView *userInfoEffectView;
  UIVisualEffectView *v10;
  id v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *userInfoLabel;
  UILabel *v16;
  void *v17;
  id v18;

  *(_OWORD *)&self->_textInsets.top = xmmword_1DCA6A2F0;
  *(_OWORD *)&self->_textInsets.bottom = xmmword_1DCA6A2F0;
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 20.0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v18);
  -[UIVisualEffectView contentView](v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUserInfoView containerBackgroundColor](self, "containerBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setBackgroundColor:", v5);
  }
  else
  {
    +[AVTUIColorRepository appBackgroundColor](AVTUIColorRepository, "appBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v6);

  }
  -[UIVisualEffectView contentView](v3, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.649999976);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView layer](v3, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

  userInfoEffectView = self->_userInfoEffectView;
  self->_userInfoEffectView = v3;
  v10 = v3;

  v11 = objc_alloc(MEMORY[0x1E0CEA700]);
  v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[AVTUIColorRepository userInfoLabelColor](AVTUIColorRepository, "userInfoLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  -[UILabel setTextAlignment:](v12, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 2);
  -[UILabel setAdjustsFontSizeToFitWidth:](v12, "setAdjustsFontSizeToFitWidth:", 0);
  -[UILabel setBaselineAdjustment:](v12, "setBaselineAdjustment:", 1);
  +[AVTUIFontRepository userInfoLabelFont](AVTUIFontRepository, "userInfoLabelFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v12, "setFont:", v14);

  userInfoLabel = self->_userInfoLabel;
  self->_userInfoLabel = v12;
  v16 = v12;

  -[AVTUserInfoView addSubview:](self, "addSubview:", v10);
  -[UIVisualEffectView contentView](v10, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addSubview:", v16);
  -[AVTUserInfoView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[AVTUserInfoView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)setTextInsets:(NSDirectionalEdgeInsets)a3
{
  self->_textInsets = a3;
  -[AVTUserInfoView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[AVTUserInfoView userInfoLabel](self, "userInfoLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AVTUserInfoView userInfoLabel](self, "userInfoLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[AVTUserInfoView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[12];

  v38[10] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)AVTUserInfoView;
  -[AVTUserInfoView updateConstraints](&v37, sel_updateConstraints);
  -[AVTUserInfoView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTUserInfoView activeConstraints](self, "activeConstraints");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v4);
    -[AVTUserInfoView centerYAnchor](self, "centerYAnchor");
    v24 = (void *)v4;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView centerYAnchor](self->_userInfoEffectView, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v34;
    -[AVTUserInfoView centerXAnchor](self, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView centerXAnchor](self->_userInfoEffectView, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v31;
    -[AVTUserInfoView leadingAnchor](self, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](self->_userInfoEffectView, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v28;
    -[AVTUserInfoView trailingAnchor](self, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](self->_userInfoEffectView, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v25;
    -[AVTUserInfoView topAnchor](self, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](self->_userInfoEffectView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v21;
    -[AVTUserInfoView bottomAnchor](self, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](self->_userInfoEffectView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[5] = v18;
    -[UIVisualEffectView topAnchor](self->_userInfoEffectView, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](self->_userInfoLabel, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -self->_textInsets.top);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[6] = v15;
    -[UIVisualEffectView bottomAnchor](self->_userInfoEffectView, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_userInfoLabel, "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v5, self->_textInsets.bottom);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v38[7] = v6;
    -[UIVisualEffectView leadingAnchor](self->_userInfoEffectView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_userInfoLabel, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -self->_textInsets.leading);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[8] = v9;
    -[UIVisualEffectView trailingAnchor](self->_userInfoEffectView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_userInfoLabel, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, self->_textInsets.trailing);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[9] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
    -[AVTUserInfoView setActiveConstraints:](self, "setActiveConstraints:", v13);

  }
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  void *v5;
  void *v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)AVTUserInfoView;
  -[AVTUserInfoView layoutSubviews](&v7, sel_layoutSubviews);
  -[AVTUserInfoView userInfoEffectView](self, "userInfoEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetHeight(v8) * 0.5;
  -[AVTUserInfoView userInfoEffectView](self, "userInfoEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v4);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  id v5;

  +[AVTUIFontRepository userInfoLabelFont](AVTUIFontRepository, "userInfoLabelFont", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTUserInfoView userInfoLabel](self, "userInfoLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (NSDirectionalEdgeInsets)textInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_textInsets.top;
  leading = self->_textInsets.leading;
  bottom = self->_textInsets.bottom;
  trailing = self->_textInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UIColor)containerBackgroundColor
{
  return self->_containerBackgroundColor;
}

- (BOOL)isRegisteredForCategorySizeChange
{
  return self->_isRegisteredForCategorySizeChange;
}

- (void)setIsRegisteredForCategorySizeChange:(BOOL)a3
{
  self->_isRegisteredForCategorySizeChange = a3;
}

- (UIVisualEffectView)userInfoEffectView
{
  return self->_userInfoEffectView;
}

- (void)setUserInfoEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoEffectView, a3);
}

- (UILabel)userInfoLabel
{
  return self->_userInfoLabel;
}

- (void)setUserInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoLabel, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_userInfoLabel, 0);
  objc_storeStrong((id *)&self->_userInfoEffectView, 0);
}

@end
