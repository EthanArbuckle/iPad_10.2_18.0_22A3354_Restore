@implementation UIViewController(NAUIAdditions)

- (void)naui_addChildViewWithViewController:()NAUIAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "naui_addChildViewWithViewController:toView:", v4, v5);

}

- (void)naui_addChildViewWithViewController:()NAUIAdditions toView:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  objc_msgSend(a1, "addChildViewController:", v8);
}

- (uint64_t)naui_canAnimate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "naui_canAnimate");

  return v2;
}

- (BOOL)naui_isHorizontalSizeClassRegularOrGreater
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "naui_loadViewIfNecessary");
  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass") > 1;

  return v3;
}

- (BOOL)naui_isVerticalSizeClassRegularOrGreater
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "naui_loadViewIfNecessary");
  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass") > 1;

  return v3;
}

- (uint64_t)naui_hasAxisWithRegularSizeClassOrGreater
{
  if ((objc_msgSend(a1, "naui_isHorizontalSizeClassRegularOrGreater") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "naui_isVerticalSizeClassRegularOrGreater");
}

- (void)naui_loadViewIfNecessary
{
  objc_msgSend(a1, "view");

}

- (uint64_t)naui_isDescendantOfViewController:()NAUIAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  if (a1 == a3)
    return 1;
  v4 = a3;
  objc_msgSend(a1, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "naui_isDescendantOfViewController:", v4);

  return v6;
}

@end
