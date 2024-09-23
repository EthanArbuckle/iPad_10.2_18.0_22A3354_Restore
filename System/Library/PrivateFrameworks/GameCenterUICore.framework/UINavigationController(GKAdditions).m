@implementation UINavigationController(GKAdditions)

- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  gk_dispatch_as_group();

}

- (void)_gkResetContents
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&off_2550E6F90;
  objc_msgSendSuper2(&v7, sel__gkResetContents);
  objc_msgSend(a1, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = (id)objc_msgSend(a1, "popToRootViewControllerAnimated:", 0);
    objc_msgSend(a1, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_gkResetContents");
  }
}

- (id)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_2550E6F90;
  return objc_msgSendSuper2(&v2, sel__gkUpdateContentsWithCompletionHandlerAndError_);
}

- (void)_gkForceNextContentUpdate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&off_2550E6F90;
  objc_msgSendSuper2(&v8, sel__gkForceNextContentUpdate);
  objc_msgSend(a1, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(a1, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      objc_msgSend(v5, "_gkForceNextContentUpdate");
    objc_msgSend(a1, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_gkForceNextContentUpdate");

  }
}

- (void)_gkHandleURLPathComponents:()GKAdditions query:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(a1, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(a1, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (id)objc_msgSend(a1, "popToRootViewControllerAnimated:", 0);
    objc_msgSend(v9, "_gkHandleURLPathComponents:query:", v11, v6);
  }

}

- (void)_gkRefreshContentsForDataType:()GKAdditions userInfo:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkRefreshContentsForDataType:userInfo:", a3, v6);

}

- (uint64_t)_gkShouldRefreshContentsForDataType:()GKAdditions userInfo:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  objc_msgSend(a1, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_gkShouldRefreshContentsForDataType:userInfo:", a3, v6);

  return v8;
}

- (void)makeNavigationBarBackgroundTranslucent
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAutoScrollEdgeTransitionDistance:", 40.0);

  objc_msgSend(a1, "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setManualScrollEdgeAppearanceEnabled:", 1);

}

@end
