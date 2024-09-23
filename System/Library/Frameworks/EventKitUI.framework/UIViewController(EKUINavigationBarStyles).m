@implementation UIViewController(EKUINavigationBarStyles)

- (uint64_t)ekui_adjustNavAndToolBarToTranslucentGrayStyles
{
  objc_msgSend(a1, "ekui_adjustNavBarToTranslucentGrayStyle");
  return objc_msgSend(a1, "ekui_adjustToolBarToTranslucentGrayStyle");
}

- (void)ekui_adjustNavBarToTranslucentGrayStyle
{
  void *v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", v2);

  objc_msgSend(a1, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEdgeAppearance:", v4);

}

- (void)ekui_adjustToolBarToTranslucentGrayStyle
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toolbar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "standardAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShadowColor:", v3);

  objc_msgSend(v4, "setScrollEdgeAppearance:", v2);
}

- (uint64_t)ekui_adjustNavAndToolBarToTransparentStyles
{
  objc_msgSend(a1, "ekui_adjustNavBarToTransparentStyle");
  return objc_msgSend(a1, "ekui_adjustToolBarToTransparentStyle");
}

- (void)ekui_adjustNavBarToTransparentStyle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v8, "configureWithOpaqueBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v2);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowColor:", v3);

  objc_msgSend(a1, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEdgeAppearance:", v8);

  v5 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v6);

  objc_msgSend(a1, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStandardAppearance:", v5);

}

- (void)ekui_adjustToolBarToTransparentStyle
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toolbar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scrollEdgeAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureWithOpaqueBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setShadowColor:", 0);
  objc_msgSend(v4, "setScrollEdgeAppearance:", v2);

}

@end
