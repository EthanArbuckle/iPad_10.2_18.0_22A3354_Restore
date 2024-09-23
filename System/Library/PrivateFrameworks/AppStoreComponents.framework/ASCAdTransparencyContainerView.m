@implementation ASCAdTransparencyContainerView

+ (id)developerNameFontCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy adTransparencyDeveloperNamePointSizeProvider:](__ASCLayoutProxy, "adTransparencyDeveloperNamePointSizeProvider:", v3);
  v5 = v4;

  if (!developerNameFontCompatibleWithTraitCollection__textFont
    || (objc_msgSend((id)developerNameFontCompatibleWithTraitCollection__textFont, "pointSize"), v6 != v5))
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", v5, *MEMORY[0x1E0DC4B90]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)developerNameFontCompatibleWithTraitCollection__textFont;
    developerNameFontCompatibleWithTraitCollection__textFont = v7;

  }
  return (id)developerNameFontCompatibleWithTraitCollection__textFont;
}

+ (double)edgePadding
{
  return 5.0;
}

+ (double)buttonTextPadding
{
  return 4.0;
}

- (ASCAdTransparencyContainerView)initWithFrame:(CGRect)a3
{
  ASCAdTransparencyContainerView *v3;
  ASCAdTransparencyContainerView *v4;
  void *v5;
  ASCAdTransparencyButtonView *v6;
  uint64_t v7;
  ASCAdTransparencyButtonView *adTransparencyButton;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)ASCAdTransparencyContainerView;
  v3 = -[ASCAdTransparencyContainerView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCAdTransparencyContainerView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyContainerView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = [ASCAdTransparencyButtonView alloc];
    v7 = -[ASCAdTransparencyButtonView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    adTransparencyButton = v4->_adTransparencyButton;
    v4->_adTransparencyButton = (ASCAdTransparencyButtonView *)v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    v11 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[ASCAdTransparencyContainerView addSubview:](v4, "addSubview:", v4->_adTransparencyButton);
    -[ASCAdTransparencyContainerView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[ASCAdTransparencyContainerView updateFont](v4, "updateFont");
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[ASCAdTransparencyContainerView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v14, sel_updateFont);

  }
  return v4;
}

- (ASCAdTransparencyContainerView)initWithCoder:(id)a3
{
  -[ASCAdTransparencyContainerView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCAdTransparencyContainerView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isBackgroundHidden
{
  void *v3;
  void *v4;
  char v5;

  -[ASCAdTransparencyContainerView backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[ASCAdTransparencyContainerView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  return v5;
}

- (void)setBackgroundHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *backgroundView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  -[ASCAdTransparencyContainerView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v8);
      backgroundView = self->_backgroundView;
      self->_backgroundView = v9;

      -[UIVisualEffectView layer](self->_backgroundView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", 5.0);

      -[UIVisualEffectView layer](self->_backgroundView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMasksToBounds:", 1);

      -[ASCAdTransparencyContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
    }
    -[ASCAdTransparencyContainerView backgroundView](self, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v7;
  -[ASCAdTransparencyContainerView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[ASCAdTransparencyContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDeveloperName:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *developerName;

  v4 = (NSString *)a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    ASCLocalizedFormatString(CFSTR("DEVELOPER_NAME_TEXT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyContainerView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
  else
  {
    -[ASCAdTransparencyContainerView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);
  }

  developerName = self->_developerName;
  self->_developerName = v4;

  -[ASCAdTransparencyContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = 0.0;
  if (!-[ASCAdTransparencyContainerView isBackgroundHidden](self, "isBackgroundHidden"))
  {
    +[ASCAdTransparencyContainerView edgePadding](ASCAdTransparencyContainerView, "edgePadding");
    v6 = v7;
  }
  +[ASCAdTransparencyContainerView buttonTextPadding](ASCAdTransparencyContainerView, "buttonTextPadding");
  v9 = v8;
  -[ASCAdTransparencyContainerView adTransparencyButton](self, "adTransparencyButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", width, height);
  v12 = v11;
  v14 = v13;

  -[ASCAdTransparencyContainerView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intrinsicContentSize");
  v17 = v16;

  v18 = v6 + v9 + v6 + v12 + v17;
  v19 = v6 + v6 + v14;
  result.height = v19;
  result.width = v18;
  return result;
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v68.receiver = self;
  v68.super_class = (Class)ASCAdTransparencyContainerView;
  -[ASCAdTransparencyContainerView layoutSubviews](&v68, sel_layoutSubviews);
  -[ASCAdTransparencyContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = 0.0;
  if (!-[ASCAdTransparencyContainerView isBackgroundHidden](self, "isBackgroundHidden"))
  {
    +[ASCAdTransparencyContainerView edgePadding](ASCAdTransparencyContainerView, "edgePadding");
    v11 = v12;
  }
  +[ASCAdTransparencyContainerView buttonTextPadding](ASCAdTransparencyContainerView, "buttonTextPadding");
  v63 = v13;
  -[ASCAdTransparencyContainerView adTransparencyButton](self, "adTransparencyButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v8, v10);
  v16 = v15;
  v18 = v17;

  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v19, v11, v11, v16, v18, v4, v6, v8, v10);
  v66 = v6;
  v67 = v4;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v65 = v10;
  v27 = v26;
  -[ASCAdTransparencyContainerView adTransparencyButton](self, "adTransparencyButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v69.origin.x = v11;
  v69.origin.y = v11;
  v69.size.width = v16;
  v69.size.height = v18;
  v29 = v8 - CGRectGetMaxX(v69) - v63 - v11;
  -[ASCAdTransparencyContainerView titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdTransparencyContainerView bounds](self, "bounds");
  objc_msgSend(v30, "sizeThatFits:", v29, v31);
  v33 = v32;
  v35 = v34;

  v70.origin.x = v11;
  v70.origin.y = v11;
  v70.size.width = v16;
  v70.size.height = v18;
  v36 = v63 + CGRectGetMaxX(v70);
  v64 = v36;
  -[ASCAdTransparencyContainerView bounds](self, "bounds");
  v38 = v37 * 0.5 - v35 * 0.5;
  v62 = v38;
  if (v33 < v29)
    v29 = v33;
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v39, v36, v38, v29, v35, v67, v66, v8, v65);
  v41 = v40;
  v43 = v42;
  v44 = v8;
  v46 = v45;
  v48 = v47;
  -[ASCAdTransparencyContainerView titleLabel](self, "titleLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", v41, v43, v46, v48);

  v71.origin.y = v62;
  v71.origin.x = v64;
  v71.size.width = v29;
  v71.size.height = v35;
  v50 = v11 + CGRectGetMaxX(v71);
  if (v44 >= v50)
    v51 = v50;
  else
    v51 = v44;
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v52, 0.0, 0.0, v51, v65, v67, v66, v44, v65);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  -[ASCAdTransparencyContainerView backgroundView](self, "backgroundView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFrame:", v54, v56, v58, v60);

}

- (void)addAdTransparencyTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ASCAdTransparencyContainerView adTransparencyButton](self, "adTransparencyButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (void)updateFont
{
  void *v3;
  void *v4;
  id v5;

  -[ASCAdTransparencyContainerView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCAdTransparencyContainerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCAdTransparencyContainerView developerNameFontCompatibleWithTraitCollection:](ASCAdTransparencyContainerView, "developerNameFontCompatibleWithTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (NSString)developerName
{
  return self->_developerName;
}

- (ASCAdTransparencyButtonView)adTransparencyButton
{
  return self->_adTransparencyButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_adTransparencyButton, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
}

@end
