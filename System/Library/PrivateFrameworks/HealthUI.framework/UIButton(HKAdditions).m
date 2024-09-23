@implementation UIButton(HKAdditions)

+ (id)hk_buttonTintedWithColor:()HKAdditions title:target:action:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[HKDynamicButton buttonWithType:](HKDynamicButton, "buttonWithType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  objc_msgSend(v12, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", 1);

  objc_msgSend(v12, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsDefaultTighteningForTruncation:", 1);

  objc_msgSend(v12, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HKMediumScaledPreferredBodyFontWithButton(v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v17);

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "setTitle:forState:", v10, 0);

  objc_msgSend(v12, "setTitleColor:forState:", v11, 0);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", v9, a6, 64);

  objc_msgSend(v12, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", 288.0, 0.0);
  objc_msgSend(v18, "constraintEqualToConstant:", v20 + 22.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeightConstraint:", v21);

  return v12;
}

+ (id)hk_roundRectButtonTintedWithColor:()HKAdditions title:target:action:
{
  id v9;
  id v10;
  id v11;
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
  double v24;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[HKColoredButton buttonWithType:](HKColoredButton, "buttonWithType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "setTitle:forState:", v10, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitleColor:forState:", v13, 0);

  objc_msgSend(v12, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 1);

  objc_msgSend(v12, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextAlignment:", 1);

  objc_msgSend(v12, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllowsDefaultTighteningForTruncation:", 1);

  objc_msgSend(v12, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _HKMediumScaledPreferredBodyFontWithValue(17.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v18);

  objc_msgSend(v12, "setBackgroundColor:", v11);
  if (v9 && a6)
    objc_msgSend(v12, "addTarget:action:forControlEvents:", v9, a6, 64);
  objc_msgSend(v12, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", 14.0);

  objc_msgSend(v12, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 50.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeightConstraint:", v21);

  objc_msgSend(v12, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", 288.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = 1144750080;
  objc_msgSend(v23, "setPriority:", v24);
  objc_msgSend(v23, "setActive:", 1);

  return v12;
}

+ (id)hk_multiLineRoundRectButtonTintedWithColor:()HKAdditions title:target:action:
{
  id v9;
  id v10;
  id v11;
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
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[HKColoredButton buttonWithType:](HKColoredButton, "buttonWithType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "setTitle:forState:", v10, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitleColor:forState:", v13, 0);

  objc_msgSend(v12, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _HKMediumScaledPreferredBodyFontWithValue(17.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v15);

  objc_msgSend(v12, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  objc_msgSend(v12, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextAlignment:", 1);

  objc_msgSend(v12, "setBackgroundColor:", v11);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", v9, a6, 64);

  objc_msgSend(v12, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  objc_msgSend(v12, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", 14.0);

  objc_msgSend(v12, "setContentEdgeInsets:", 11.0, 0.0, 11.0, 0.0);
  objc_msgSend(v12, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeThatFits:", 288.0, 0.0);
  v23 = v22 + 22.0;

  v24 = 50.0;
  if (v23 >= 50.0)
    v24 = v23;
  objc_msgSend(v20, "constraintEqualToConstant:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeightConstraint:", v25);

  objc_msgSend(v12, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 288.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v28) = 1144750080;
  objc_msgSend(v27, "setPriority:", v28);
  objc_msgSend(v27, "setActive:", 1);

  return v12;
}

+ (id)imageWithFillColor:()HKAdditions
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  CGColor *v6;
  void *v7;
  CGSize v9;
  CGRect v10;

  v3 = a3;
  v9.width = 1.0;
  v9.height = 1.0;
  UIGraphicsBeginImageContext(v9);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = objc_retainAutorelease(v3);
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  CGContextFillRect(CurrentContext, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v7;
}

+ (id)hk_currentValueViewInfoButtonWithTarget:()HKAdditions action:
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v5 = (objc_class *)MEMORY[0x1E0DC3518];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 25.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("info.circle"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forState:", v9, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v10);

  objc_msgSend(v7, "setIsAccessibilityElement:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CURRENT_VALUE_INFO_BUTTON_ACCESSIBILITY_LABEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v12);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);
  LODWORD(v13) = 1144750080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v13);

  return v7;
}

+ (id)hk_chartShowMoreDataButtonWithTitleOverride:()HKAdditions target:action:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHOW_MORE_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)MEMORY[0x1E0DC3518];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_buttonTintedWithColor:title:target:action:", v12, v9, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("ShowMoreData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", v14);

  objc_msgSend(v13, "setContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
  return v13;
}

@end
