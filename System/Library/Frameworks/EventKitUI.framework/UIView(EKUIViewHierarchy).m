@implementation UIView(EKUIViewHierarchy)

- (double)ekui_size
{
  double v1;

  objc_msgSend(a1, "bounds");
  return v1;
}

- (uint64_t)ekui_horizontalSizeClass
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ekui_futureTraitCollection");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  v5 = objc_msgSend(v2, "horizontalSizeClass");

  return v5;
}

- (uint64_t)ekui_verticalSizeClass
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ekui_futureTraitCollection");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  v5 = objc_msgSend(v2, "verticalSizeClass");

  return v5;
}

- (double)ekui_width
{
  CGRect v2;

  objc_msgSend(a1, "bounds");
  return CGRectGetWidth(v2);
}

- (double)ekui_height
{
  CGRect v2;

  objc_msgSend(a1, "bounds");
  return CGRectGetHeight(v2);
}

- (uint64_t)ekui_interfaceOrientation
{
  void *v2;
  uint64_t v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceOrientation");

  return v3;
}

- (void)ekui_affineTransform
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "affineTransform");
    v3 = v4;
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }

}

@end
