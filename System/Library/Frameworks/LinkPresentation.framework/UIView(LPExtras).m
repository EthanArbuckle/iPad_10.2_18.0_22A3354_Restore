@implementation UIView(LPExtras)

- (void)_lp_setOpacity:()LPExtras
{
  float v2;
  double v3;
  id v4;

  v2 = a2;
  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v3 = v2;
  objc_msgSend(v4, "setOpacity:", v3);

}

- (void)_lp_setShadowRadius:()LPExtras
{
  id v3;

  objc_msgSend(a1, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowRadius:", a2);

}

- (void)_lp_setShadowOffset:()LPExtras
{
  id v5;

  objc_msgSend(a1, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", a2, a3);

}

- (void)_lp_setShadowColor:()LPExtras
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v6, "CGColor");
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

}

- (void)_lp_setShadowOpacity:()LPExtras
{
  float v2;
  double v3;
  id v4;

  v2 = a2;
  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v3 = v2;
  objc_msgSend(v4, "setShadowOpacity:", v3);

}

- (void)_lp_setCompositingFilter:()LPExtras
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", v5);

}

- (void)_lp_insertSubview:()LPExtras aboveSubview:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
    objc_msgSend(a1, "insertSubview:aboveSubview:", v7, v6);
  else
    objc_msgSend(a1, "addSubview:", v7);

}

- (void)_lp_insertSubview:()LPExtras belowSubview:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
    objc_msgSend(a1, "insertSubview:belowSubview:", v7, v6);
  else
    objc_msgSend(a1, "insertSubview:atIndex:", v7, 0);

}

- (double)_lp_backingScaleFactor
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v6 = v7;
  }

  return v6;
}

- (uint64_t)_lp_setForceLTR:()LPExtras
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 4;
  return objc_msgSend(a1, "setSemanticContentAttribute:", v3);
}

- (BOOL)_lp_isLTR
{
  return !+[LPTestingOverrides forceRTL](LPTestingOverrides, "forceRTL")
      && objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 0;
}

- (void)_lp_setCornerRadius:()LPExtras continuous:
{
  uint64_t *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", a2);

  v7 = (uint64_t *)MEMORY[0x1E0CD2A68];
  if (!a4)
    v7 = (uint64_t *)MEMORY[0x1E0CD2A60];
  v8 = *v7;
  objc_msgSend(a1, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerCurve:", v8);

  if (a2 != 0.0)
  {
    objc_msgSend(a1, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", 1);

  }
}

- (uint64_t)_lp_setCornerRadius:()LPExtras
{
  return objc_msgSend(a1, "_lp_setCornerRadius:continuous:", 1);
}

- (uint64_t)_lp_prefersDarkInterface
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_lp_prefersDarkInterface");

  return v2;
}

- (uint64_t)_lp_disableAutomaticVibrancy
{
  return objc_msgSend(a1, "_setOverrideUserInterfaceRenderingMode:", 1);
}

+ (LPFlippedView)_lp_createFlippedView
{
  return objc_alloc_init(LPFlippedView);
}

- (void)_lp_applyAndRegisterForUpdatesToValue:()LPExtras withApplyCallback:
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void (**v9)(id, void *, id);
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(id, void *, id);

  v6 = a3;
  v7 = a4;
  v7[2](v7, a1, v6);
  objc_msgSend(v6, "dependentTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__UIView_LPExtras___lp_applyAndRegisterForUpdatesToValue_withApplyCallback___block_invoke;
  v12[3] = &unk_1E44A8E10;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v13 = v10;
  v11 = (id)objc_msgSend(a1, "registerForTraitChanges:withHandler:", v8, v12);

}

@end
