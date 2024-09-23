@implementation UIView(GKUIBackdropView)

- (uint64_t)_gkSetDrawsAsBackdropOverlay:()GKUIBackdropView
{
  objc_msgSend(a1, "_setDrawsAsBackdropOverlay:");
  return objc_msgSend(a1, "setAlpha:", 0.35);
}

- (void)_gkSetDrawsAsKnockout:()GKUIBackdropView inBackdrop:
{
  uint64_t v6;
  id v7;

  v7 = a4;
  if (GKHasSlowerGraphicsHardware_onceToken_0 != -1)
    dispatch_once(&GKHasSlowerGraphicsHardware_onceToken_0, &__block_literal_global_54);
  if ((unint64_t)GKHasSlowerGraphicsHardware_processorCount_0 > 1)
  {
    if ((_DWORD)a3)
      v6 = 7;
    else
      v6 = 0;
    objc_msgSend(a1, "_setBackdropMaskViewFlags:", v6);
    objc_msgSend(v7, "updateMaskViewsForView:", a1);
  }
  else if (objc_msgSend(a1, "_drawsAsBackdropOverlay") != (_DWORD)a3)
  {
    objc_msgSend(a1, "_setDrawsAsBackdropOverlay:", a3);
  }

}

+ (id)_gkStandardBackdropView
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2010);
}

- (id)_gkApplyFakeStatusBarView
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarHeight");
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v3, v5, v7, v10);
  objc_msgSend((id)objc_opt_class(), "_gkStandardBackdropView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 34);
  objc_msgSend(v11, "addSubview:", v12);
  objc_msgSend(a1, "addSubview:", v11);

  return v11;
}

- (id)_gkBackdropView
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    do
    {
      v2 = v1;
      objc_getAssociatedObject(v1, CFSTR("GKBackdropView"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "superview");
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v1 && !v3);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_gkApplyBackdropViewWithGroupName:()GKUIBackdropView
{
  void *v4;
  id v5;

  v5 = a3;
  objc_getAssociatedObject(a1, CFSTR("GKBackdropView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setGroupName:", v5);
  objc_msgSend(a1, "insertSubview:atIndex:", v4, 0);

}

- (void)_gkApplyBackdropViewIfNeededWithGroupName:()GKUIBackdropView
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_getAssociatedObject(a1, CFSTR("GKBackdropView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "_gkStandardBackdropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, CFSTR("GKBackdropView"), v4, (void *)1);
    if (v7)
      objc_msgSend(v4, "setGroupName:", v7);
    objc_msgSend(a1, "insertSubview:atIndex:", v4, 0);
    if (*MEMORY[0x1E0D253F8])
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6 != 1)
      {
        objc_msgSend(v4, "frame");
        objc_msgSend(v4, "setFrame:");
        objc_msgSend(v4, "setAutoresizingMask:", 0);
      }
    }
  }

}

- (void)_gkUseAsModalSheetBackgroundWithGroupName:()GKUIBackdropView
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(a1, "_gkApplyBackdropViewIfNeededWithGroupName:");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formSheetCornerRadius");
    v6 = v5;
    objc_msgSend(a1, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", v6);

    objc_msgSend(a1, "setClipsToBounds:", 1);
  }
}

@end
