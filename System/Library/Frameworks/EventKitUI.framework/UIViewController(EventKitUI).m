@implementation UIViewController(EventKitUI)

- (id)EKUI_viewHierarchy
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "EKUI_viewHierarchy");
    }
    else
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      EKUIMultiwindowAssert(0, CFSTR("Unable to fetch current window (from %@). Assuming main window, which may cause layout errors because of incorrect assumptions about size class or orientation."), v9, v10, v11, v12, v13, v14, (uint64_t)v8);

      EKUIMainWindowForMultiwindowError();
    }
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)isPresentedInsidePopover
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v1 = a1;
  if (!v1)
    return 0;
  v2 = v1;
  while (1)
  {
    objc_msgSend(v2, "popoverPresentationController");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(v2, "popoverPresentationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_isAdapted");

      if (!v6)
        break;
    }
    objc_msgSend(v2, "presentingViewController");
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v7;
    if (!v7)
      goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

@end
