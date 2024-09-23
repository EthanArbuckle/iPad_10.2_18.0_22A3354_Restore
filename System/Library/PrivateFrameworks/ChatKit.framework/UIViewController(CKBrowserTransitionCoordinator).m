@implementation UIViewController(CKBrowserTransitionCoordinator)

- (id)__ck_topViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "visibleViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v5 = a1;
      return v5;
    }
    objc_msgSend(a1, "presentedViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v2;
  objc_msgSend(v2, "__ck_topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
