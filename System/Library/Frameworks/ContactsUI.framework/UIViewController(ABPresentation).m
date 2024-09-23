@implementation UIViewController(ABPresentation)

- (uint64_t)ab_isInSheet
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  result = dyld_program_sdk_at_least();
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "_existingPresentationControllerImmediate:effective:", 0, 1);
    result = objc_claimAutoreleasedReturnValue();
    if (result)
    {
      v3 = (void *)result;
      while (objc_msgSend(v3, "presentationStyle") != 2 && objc_msgSend(v3, "presentationStyle") != 1)
      {
        objc_msgSend(v3, "presentingViewController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_existingPresentationControllerImmediate:effective:", 0, 1);
        v5 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v5;
        if (!v5)
          return 0;
      }

      return 1;
    }
  }
  return result;
}

- (BOOL)ab_shouldUseTransparentBackgroundInPopovers
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1 || !objc_msgSend(a1, "ab_isInPopover"))
    return 0;
  objc_msgSend(a1, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (id)cnui_appropriatePresentationController
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    do
    {
      objc_msgSend(v1, "parentViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "parentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  objc_msgSend(v3, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cnui_addChildViewController:()ABPresentation
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "addChildViewController:", v6);
  objc_msgSend(a1, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  if ((objc_msgSend(a1, "shouldAutomaticallyForwardAppearanceMethods") & 1) == 0)
    objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, 0);
  objc_msgSend(v4, "addSubview:", v5);
  objc_msgSend(v6, "didMoveToParentViewController:", a1);
  if ((objc_msgSend(a1, "shouldAutomaticallyForwardAppearanceMethods") & 1) == 0)
    objc_msgSend(v6, "endAppearanceTransition");

}

- (uint64_t)ab_shouldShowNavBarButtons
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "ab_isInPopover"))
    return 1;
  objc_msgSend(a1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1;
  else
    v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState") == 2;

  return v3;
}

- (BOOL)_ab_isInPopoverRecursive:()ABPresentation
{
  uint64_t v5;
  void *v6;
  int v7;
  int isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  char v15;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(a1, "_existingPresentationControllerImmediate:effective:", 0, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      return 0;
    v6 = (void *)v5;
    v7 = a3 ^ 1;
    while (1)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (((isKindOfClass | v7) & 1) != 0)
        break;
      objc_msgSend(v6, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_existingPresentationControllerImmediate:effective:", 0, 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
      if (!v10)
        return 0;
    }
    v15 = isKindOfClass;

    return (v15 & 1) != 0;
  }
  objc_msgSend(a1, "_popoverController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || (a3 & 1) != 0)
  {

    return v12 != 0;
  }
  objc_msgSend(v11, "contentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == a1;

  return v14;
}

- (uint64_t)ab_isInPopover
{
  return objc_msgSend(a1, "_ab_isInPopoverRecursive:", 1);
}

- (uint64_t)ab_isDirectlyInPopover
{
  return objc_msgSend(a1, "_ab_isInPopoverRecursive:", 0);
}

@end
