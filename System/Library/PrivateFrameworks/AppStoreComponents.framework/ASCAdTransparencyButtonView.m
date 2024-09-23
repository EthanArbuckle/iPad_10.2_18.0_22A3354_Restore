@implementation ASCAdTransparencyButtonView

+ (id)titleColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (id)selectedTitleColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "titleColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)adTransparencyButtonImage
{
  return +[ASCImageRenderer bundleImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "bundleImageNamed:compatibleWithTraitCollection:", CFSTR("adTransparencyButton"), 0);
}

+ (id)adButtonTitleLocalized
{
  return (id)ASCLocalizedString(CFSTR("IAD_PRIVACY_MARKER_BUTTON_TITLE"), a2);
}

+ (id)buttonFontCompatibleWithTraitColletion:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy adTransparencyButtonTitlePointSizeProvider:](__ASCLayoutProxy, "adTransparencyButtonTitlePointSizeProvider:", v3);
  v5 = v4;

  if (!buttonFontCompatibleWithTraitColletion__buttonFont
    || (objc_msgSend((id)buttonFontCompatibleWithTraitColletion__buttonFont, "pointSize"), v6 != v5))
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", v5, *MEMORY[0x1E0DC4B90]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)buttonFontCompatibleWithTraitColletion__buttonFont;
    buttonFontCompatibleWithTraitColletion__buttonFont = v7;

  }
  return (id)buttonFontCompatibleWithTraitColletion__buttonFont;
}

- (ASCAdTransparencyButtonView)initWithFrame:(CGRect)a3
{
  ASCAdTransparencyButtonView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)ASCAdTransparencyButtonView;
  v3 = -[ASCAdTransparencyButtonView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[ASCAdTransparencyButtonView adTransparencyButtonImage](ASCAdTransparencyButtonView, "adTransparencyButtonImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setBackgroundImage:forState:](v3, "setBackgroundImage:forState:", v4, 0);

    +[ASCAdTransparencyButtonView titleColor](ASCAdTransparencyButtonView, "titleColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 0);

    +[ASCAdTransparencyButtonView selectedTitleColor](ASCAdTransparencyButtonView, "selectedTitleColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setTitleColor:forState:](v3, "setTitleColor:forState:", v6, 4);

    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.8, 0.996078431, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setTintColor:](v3, "setTintColor:", v7);

    -[ASCAdTransparencyButtonView setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCAdTransparencyButtonView _setTouchInsets:](v3, "_setTouchInsets:", -10.0, -5.0, -10.0, -5.0);
    +[ASCAdTransparencyButtonView adButtonTitleLocalized](ASCAdTransparencyButtonView, "adButtonTitleLocalized");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setTitle:forState:](v3, "setTitle:forState:", v8, 0);

    -[ASCAdTransparencyButtonView imageView](v3, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMode:", 0);

    -[ASCAdTransparencyButtonView updateFont](v3, "updateFont");
    -[ASCAdTransparencyButtonView updateInsets](v3, "updateInsets");
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)-[ASCAdTransparencyButtonView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v11, sel_onPreferredContentSizeCategoryChange);

  }
  return v3;
}

- (ASCAdTransparencyButtonView)initWithCoder:(id)a3
{
  -[ASCAdTransparencyButtonView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCAdTransparencyButtonView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setLoading:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    +[ASCSemanticColor loading]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setTintColor:](self, "setTintColor:", v4);

    -[ASCAdTransparencyButtonView setTitle:forState:](self, "setTitle:forState:", 0, 0);
  }
  else
  {
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.8, 0.996078431, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setTintColor:](self, "setTintColor:", v5);

    +[ASCAdTransparencyButtonView adButtonTitleLocalized](ASCAdTransparencyButtonView, "adButtonTitleLocalized");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[ASCAdTransparencyButtonView setTitle:forState:](self, "setTitle:forState:", v6, 0);

  }
}

- (void)updateFont
{
  void *v3;
  void *v4;
  id v5;

  -[ASCAdTransparencyButtonView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCAdTransparencyButtonView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCAdTransparencyButtonView buttonFontCompatibleWithTraitColletion:](ASCAdTransparencyButtonView, "buttonFontCompatibleWithTraitColletion:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)updateInsets
{
  void *v3;
  double v4;
  double v5;

  objc_opt_self();
  -[ASCAdTransparencyButtonView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy adTransparencyButtonScaledCapInset:in:](__ASCLayoutProxy, "adTransparencyButtonScaledCapInset:in:", v3, 3.0);
  v5 = v4;

  -[ASCAdTransparencyButtonView setContentEdgeInsets:](self, "setContentEdgeInsets:", 0.0, v5, 0.0, v5);
}

- (void)onPreferredContentSizeCategoryChange
{
  -[ASCAdTransparencyButtonView updateFont](self, "updateFont");
  -[ASCAdTransparencyButtonView updateInsets](self, "updateInsets");
}

@end
