@implementation SFPrivacyReportIconView

- (SFPrivacyReportIconView)initWithFrame:(CGRect)a3
{
  SFPrivacyReportIconView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *mask;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SFPrivacyReportIconView *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SFPrivacyReportIconView;
  v3 = -[SFPrivacyReportIconView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("shield.lefthalf.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    mask = v3->_mask;
    v3->_mask = (UIImageView *)v6;

    -[SFPrivacyReportIconView bounds](v3, "bounds");
    -[UIImageView setFrame:](v3->_mask, "setFrame:");
    -[UIImageView setAutoresizingMask:](v3->_mask, "setAutoresizingMask:", 18);
    -[SFPrivacyReportIconView setMaskView:](v3, "setMaskView:", v3->_mask);
    -[SFPrivacyReportIconView gradientLayer](v3, "gradientLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStartPoint:", 1.0, 0.0);

    -[SFPrivacyReportIconView gradientLayer](v3, "gradientLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEndPoint:", 0.0, 1.0);

    -[SFPrivacyReportIconView _updateColors](v3, "_updateColors");
    -[SFPrivacyReportIconView _updateSymbolConfiguration](v3, "_updateSymbolConfiguration");
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[SFPrivacyReportIconView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v10, v3, sel__updateSymbolConfiguration);

    v12 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFPrivacyReportIconView;
  -[SFPrivacyReportIconView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[SFPrivacyReportIconView _updateColors](self, "_updateColors");
}

- (void)_updateColors
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[0] = objc_msgSend(v3, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[1] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportIconView gradientLayer](self, "gradientLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColors:", v5);

}

- (void)_updateSymbolConfiguration
{
  double v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[SFPrivacyReportIconView traitCollection](self, "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "horizontalSizeClass") == 2 && objc_msgSend(v7, "verticalSizeClass") == 2)
    v3 = 50.0;
  else
    v3 = 34.0;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView preferredSymbolConfiguration](self->_mask, "preferredSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToConfiguration:", v5);

  if ((v6 & 1) == 0)
  {
    -[UIImageView setPreferredSymbolConfiguration:](self->_mask, "setPreferredSymbolConfiguration:", v4);
    -[SFPrivacyReportIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_mask, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
}

@end
