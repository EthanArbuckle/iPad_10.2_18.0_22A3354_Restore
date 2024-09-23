@implementation UIViewController(MobileSafariFrameworkExtras)

- (void)safari_updateApplicationBackgroundStyle
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a1, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safari_wantsTransparentApplicationBackground");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v6);

    objc_msgSend(a1, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v8 == 2)
      v9 = 4;
    else
      v9 = 2;
  }
  else
  {
    objc_msgSend(v10, "setBackgroundColor:", 0);
    v9 = 0;
  }
  objc_msgSend(v3, "_setBackgroundStyle:", v9);

}

- (uint64_t)safari_wantsTransparentApplicationBackground
{
  return 0;
}

- (uint64_t)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 0;
}

- (id)safari_sheetPresentationController
{
  void *v1;
  id v2;

  objc_msgSend(a1, "presentationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 0;
}

- (uint64_t)safari_isPresentedByActivityViewController
{
  return objc_msgSend(a1, "safari_isEventuallyPresentedByViewControllerClass:", objc_opt_class());
}

- (uint64_t)safari_isEventuallyPresentedByViewControllerClass:()MobileSafariFrameworkExtras
{
  void *v5;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  objc_msgSend(a1, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  objc_msgSend(a1, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "safari_isEventuallyPresentedByViewControllerClass:", a3);

  return v10;
}

- (void)safari_dismissPresentedAlert
{
  id v1;

  objc_msgSend(a1, "presentedViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (id)_sf_viewControllerToPresentFrom
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      v3 = v2;
      if ((objc_msgSend(v2, "isBeingDismissed") & 1) != 0)
        break;

      objc_msgSend(v3, "presentedViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = v3;
      if (!v2)
      {
        v1 = v3;
        v3 = 0;
        break;
      }
    }

  }
  return v1;
}

- (double)_sf_bottomUnsafeAreaFrame
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "viewIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_sf_bottomUnsafeAreaFrame");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
  }

  return v4;
}

- (double)_sf_bottomUnsafeAreaFrameForToolbar
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "viewIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_sf_bottomUnsafeAreaFrameForToolbar");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
  }

  return v4;
}

- (void)_sf_presentViewControllerOnTopOfPresentedViewController:()MobileSafariFrameworkExtras animated:completion:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (*v13)(void *, char *, id, uint64_t, id);
  id v14;

  v14 = a3;
  v8 = a5;
  objc_msgSend(a1, "_sf_viewControllerToPresentFrom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == a1)
  {
    v11 = (void *)objc_opt_class();
    v12 = objc_msgSend(v11, "instanceMethodForSelector:", sel_presentViewController_animated_completion_);
    do
    {
      v11 = (void *)objc_msgSend(v11, "superclass");
      v13 = (void (*)(void *, char *, id, uint64_t, id))objc_msgSend(v11, "instanceMethodForSelector:", sel_presentViewController_animated_completion_);
    }
    while (v13 == (void (*)(void *, char *, id, uint64_t, id))v12);
    v13(a1, sel_presentViewController_animated_completion_, v14, a4, v8);
  }
  else
  {
    objc_msgSend(v9, "presentViewController:animated:completion:", v14, a4, v8);
  }

}

- (void)_sf_animateAlongsideTransitionOrPerform:()MobileSafariFrameworkExtras
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "transitionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __89__UIViewController_MobileSafariFrameworkExtras___sf_animateAlongsideTransitionOrPerform___block_invoke;
      v7[3] = &unk_1E21E5578;
      v8 = v4;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

    }
    else
    {
      v4[2](v4);
    }
  }

}

- (uint64_t)_sf_isMFMailComposeViewController
{
  return objectIsKindOfClass(a1, CFSTR("MFMailComposeViewController"));
}

- (uint64_t)_sf_isPKAddPassesViewController
{
  return objectIsKindOfClass(a1, CFSTR("PKAddPassesViewController"));
}

- (uint64_t)_sf_canEditFields
{
  _BOOL8 v2;
  void *v3;
  CGRect v5;

  if ((objc_msgSend(a1, "_isInPopoverPresentation") & 1) != 0)
    return 1;
  objc_msgSend(a1, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v2 = CGRectGetHeight(v5) > 320.0;

  return v2;
}

- (uint64_t)_sf_isPresentationControllerDismissalTransitionDidEndNotification:()MobileSafariFrameworkExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != a1)
  {
    objc_msgSend(a1, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 != v6)
    {
      v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "safari_BOOLForKey:", *MEMORY[0x1E0DC5210]);

  v6 = v5;
  if (v5 != a1)
    goto LABEL_5;
LABEL_6:

  return v7;
}

@end
