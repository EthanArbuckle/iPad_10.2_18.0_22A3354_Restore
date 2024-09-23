@implementation SFFooterButton

- (SFFooterButton)initWithFrame:(CGRect)a3
{
  SFFooterButton *v3;
  SFFooterButton *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  SFFooterButton *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SFFooterButton;
  v3 = -[SFFooterButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFFooterButton setAdjustsImageSizeForAccessibilityContentSizeCategory:](v3, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    -[SFFooterButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFFooterButton setRole:](v4, "setRole:", 1);
    objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setButtonSize:", 0);
    objc_msgSend(v5, "setCornerStyle:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBaseForegroundColor:", v6);

    objc_msgSend(v5, "contentInsets");
    objc_msgSend(v5, "setContentInsets:");
    -[SFFooterButton setConfiguration:](v4, "setConfiguration:", v5);

    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[SFFooterButton registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v7, v4, sel_setNeedsUpdateConfiguration);

    v9 = v4;
  }

  return v4;
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SFFooterButton configuration](self, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFooterButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "sf_usesVibrantAppearance") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBaseBackgroundColor:", v5);

  }
  else
  {
    objc_msgSend(v6, "setBaseBackgroundColor:", v3);
  }

  -[SFFooterButton setConfiguration:](self, "setConfiguration:", v6);
}

- (SFFooterButton)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFFooterButton;
  return -[SFFooterButton initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
