@implementation AKRoundedButton

+ (id)roundedButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[AKRoundedButton buttonWithType:](AKRoundedButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0CEB540], *MEMORY[0x1E0CEB5F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.75);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setTitleColor:forState:", v7, 4);
  objc_msgSend(v2, "setTitleColor:forState:", v7, 1);
  objc_msgSend(v2, "setTitleColor:forState:", v7, 5);
  objc_msgSend(v2, "_signInButtonEdgeInsets");
  objc_msgSend(v2, "setContentEdgeInsets:");
  objc_msgSend(v2, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 10.0);

  objc_msgSend(v2, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMasksToBounds:", 1);

  objc_msgSend(v2, "sizeToFit");
  return v2;
}

- (UIEdgeInsets)_signInButtonEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 8.0;
  v3 = 26.0;
  v4 = 8.0;
  v5 = 26.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKRoundedButton;
  -[AKRoundedButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[AKRoundedButton _updateColor](self, "_updateColor");
}

- (void)_updateColor
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__AKRoundedButton__updateColor__block_invoke;
  v2[3] = &unk_1E76789A0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.150000006);
}

void __31__AKRoundedButton__updateColor__block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  v3 = 1.0;
  if (v2)
    v3 = 0.5;
  objc_msgSend(v5, "colorWithAlphaComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v4);

}

@end
