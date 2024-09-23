@implementation UIViewController(AuthKitUI)

- (id)ak_topPresentedViewController
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "presentedViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      objc_msgSend(v1, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isBeingDismissed");

      if ((v5 & 1) != 0)
        break;
      objc_msgSend(v1, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = v6;
      if (!v3)
        return v6;
    }
  }
  v6 = v1;
  return v6;
}

@end
