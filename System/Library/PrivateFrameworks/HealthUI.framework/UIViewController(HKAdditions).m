@implementation UIViewController(HKAdditions)

- (id)hk_window
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(a1, "parentViewController");
    else
      objc_msgSend(a1, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (uint64_t)hk_viewIsHidden
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_viewIsHidden:", v2);

  return v3;
}

- (uint64_t)_viewIsHidden:()HKAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(a1, "_viewIsHidden:", v7);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)hk_presentModalCardViewController:()HKAdditions fullScreen:animated:completion:
{
  id v9;
  id v10;

  v9 = a6;
  v10 = a3;
  objc_msgSend(v10, "setModalTransitionStyle:", 0);
  if (a4)
  {
    objc_msgSend(v10, "setModalPresentationStyle:", 2);
    objc_msgSend(v10, "setPreferredContentSize:", 10000.0, 10000.0);
  }
  else
  {
    objc_msgSend(v10, "setModalPresentationStyle:", 1);
  }
  objc_msgSend(a1, "presentViewController:animated:completion:", v10, 1, v9);

}

@end
