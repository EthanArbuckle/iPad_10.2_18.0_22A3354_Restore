@implementation UIVisualEffectView(MobileSafariFrameworkExtras)

- (void)sf_configureAsStartPageBackground
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sf_configureAsStartPageBackgroundWithNonVibrantBackgroundColor:", v2);

}

+ (uint64_t)sf_startPageCellBackgroundEffectViewWithShadow:()MobileSafariFrameworkExtras
{
  return objc_msgSend(a1, "sf_startPageCellBackgroundEffectViewWithShadow:shadowRadius:", 12.0);
}

+ (id)sf_startPageBackgroundTraits
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sf_configureAsStartPageBackgroundWithNonVibrantBackgroundColor:()MobileSafariFrameworkExtras
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(a1, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sf_backgroundBlurEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sf_usesVibrantAppearance"))
  {
    if (v5)
    {
      if (debugOpaqueInPopover_onceToken != -1)
        dispatch_once(&debugOpaqueInPopover_onceToken, &__block_literal_global_33_0);
      if (debugOpaqueInPopover_flag)
        goto LABEL_6;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

      objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v5, 6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", 0);

      objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v7;
    objc_msgSend(a1, "setEffect:", v7);

    objc_msgSend(a1, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 0;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    goto LABEL_10;
  }
LABEL_6:
  objc_msgSend(a1, "sf_configureAsStartPageBackgroundIgnoringVibrancyWithBackgroundColor:", v13);
LABEL_10:

}

+ (id)safari_statusBarGradientBlurEffectView
{
  id v0;

  if (safari_statusBarGradientBlurEffectView_onceToken != -1)
    dispatch_once(&safari_statusBarGradientBlurEffectView_onceToken, &__block_literal_global_47);
  v0 = objc_alloc(MEMORY[0x1E0DC3F58]);
  return (id)objc_msgSend(v0, "initWithEffect:", safari_statusBarGradientBlurEffectView_gradientBlur);
}

+ (id)sf_startPageCellBackgroundEffectViewWithShadow:()MobileSafariFrameworkExtras shadowRadius:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;

  v6 = objc_alloc_init(a1);
  objc_msgSend(v6, "_setGroupName:", CFSTR("start-page-cell"));
  objc_msgSend(v6, "_setContinuousCornerRadius:", 10.0);
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", 10.0);

  if (a4)
  {
    if (debugShadows_onceToken != -1)
      dispatch_once(&debugShadows_onceToken, &__block_literal_global_29_0);
    if (debugShadows_flag != 2)
      goto LABEL_9;
  }
  else if (debugShadows_onceToken != -1)
  {
    dispatch_once(&debugShadows_onceToken, &__block_literal_global_29_0);
  }
  if (debugShadows_flag == 1)
  {
LABEL_9:
    objc_msgSend(v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowRadius:", a2);
    objc_msgSend(v8, "setShadowPathIsBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setShadowColor:", objc_msgSend(v9, "CGColor"));

    objc_msgSend(v8, "setShadowOffset:", 0.0, 6.0);
    LODWORD(v10) = 0;
    objc_msgSend(v8, "setShadowOpacity:", v10);

  }
  return v6;
}

+ (id)sf_startPageLabelVibrancyEffectView
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0DC3F08];
  objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectForBlurEffect:style:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v2);
  return v3;
}

- (void)sf_configureAsStartPageBackgroundIgnoringVibrancy
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sf_configureAsStartPageBackgroundIgnoringVibrancyWithBackgroundColor:", v2);

}

- (void)sf_configureAsStartPageBackgroundIgnoringVibrancyWithBackgroundColor:()MobileSafariFrameworkExtras
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(a1, "setEffect:", 0);
  objc_msgSend(a1, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "shadowPathIsBounds"))
  {
    LODWORD(v6) = *(_DWORD *)"\nף=";
    objc_msgSend(v7, "setShadowOpacity:", v6);
  }

}

- (void)sf_configureAsStartPageForegroundWithEffectStyle:()MobileSafariFrameworkExtras
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "sf_usesVibrantAppearance") & 1) != 0)
  {
    objc_msgSend(v10, "sf_backgroundBlurEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v7, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setEffect:", v9);

  }
  else
  {
    objc_msgSend(a1, "setEffect:", 0);
  }

}

- (void)sf_setHighlighted:()MobileSafariFrameworkExtras cellState:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0DC34D8];
  v7 = a4;
  objc_msgSend(v6, "listGroupedCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatedConfigurationForState:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sf_setHighlighted:cellState:nonVibrantBackgroundColor:", a3, v7, v9);

}

- (void)sf_setHighlighted:()MobileSafariFrameworkExtras cellState:nonVibrantBackgroundColor:
{
  void *v6;
  void *v7;
  id v8;

  v8 = a5;
  objc_msgSend(a1, "effect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(a1, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
}

@end
