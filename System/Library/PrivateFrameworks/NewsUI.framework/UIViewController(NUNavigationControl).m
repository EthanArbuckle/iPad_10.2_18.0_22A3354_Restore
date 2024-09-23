@implementation UIViewController(NUNavigationControl)

- (id)navigationControl
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(a1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_254E616F0);

  if (!v4 || (v5 = v2) == 0)
  {
    objc_msgSend(v2, "navigationControl");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
