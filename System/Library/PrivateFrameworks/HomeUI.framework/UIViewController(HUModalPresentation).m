@implementation UIViewController(HUModalPresentation)

- (id)hu_delegateForModalPresentation
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    do
    {
      if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF23EFD0))
      {
        v4 = v2;

        v3 = v4;
      }
      objc_msgSend(v2, "parentViewController");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
