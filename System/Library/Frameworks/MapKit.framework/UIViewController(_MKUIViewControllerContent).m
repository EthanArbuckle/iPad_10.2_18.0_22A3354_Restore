@implementation UIViewController(_MKUIViewControllerContent)

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "isViewLoaded"))
  {
    objc_msgSend(a1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessibilityIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setAccessibilityIdentifier:()_MKUIViewControllerContent
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(a1, "isViewLoaded"))
  {
    objc_msgSend(a1, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityIdentifier:", v5);

  }
}

- (double)contentAlpha
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "alpha");
  v3 = v2;

  return v3;
}

- (void)setContentAlpha:()_MKUIViewControllerContent
{
  id v3;

  objc_msgSend(a1, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", a2);

}

- (uint64_t)contentVisibility
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &_MKContentVisibilityKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setContentVisibility:()_MKUIViewControllerContent
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_MKContentVisibilityKey, v2, (void *)0x301);

}

@end
