@implementation BNDefaultBannerTransitioningDelegate

- (BNDefaultBannerTransitioningDelegate)init
{
  BNDefaultBannerTransitioningDelegate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BNDefaultBannerTransitioningDelegate;
  result = -[BNDefaultBannerTransitioningDelegate init](&v3, sel_init);
  if (result)
    result->_resizeAnimationCustomizationPermitted = 1;
  return result;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[BNDefaultBannerTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:userInfo:](self, "animationControllerForPresentedController:presentingController:sourceController:userInfo:", a3, a4, a5, 0);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[BNDefaultBannerTransitioningDelegate animationControllerForDismissedController:userInfo:](self, "animationControllerForDismissedController:userInfo:", a3, 0);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a6;
  objc_msgSend(v7, "objectForKey:", CFSTR("BNBannerTransitionAnimationStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("BNBannerTransitionAnimationStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

  }
  else
  {
    v10 = 0;
  }

  v11 = (void *)objc_msgSend(objc_alloc(-[BNDefaultBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v10)), "initForPresenting:", 1);
  return v11;
}

- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("BNBannerTransitionAnimationStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("BNBannerTransitionAnimationStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = 0;
  }

  v9 = (void *)objc_msgSend(objc_alloc(-[BNDefaultBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v8)), "initForPresenting:", 0);
  return v9;
}

- (id)animationControllerForResizingController:(id)a3 userInfo:(id)a4
{
  id v5;
  BNBannerAnimator *v6;
  void *v7;
  BNBannerAnimator *v8;

  v5 = a3;
  v6 = [BNBannerAnimator alloc];
  -[BNDefaultBannerTransitioningDelegate _sizeTransitionAnimationSettingsForViewController:](self, "_sizeTransitionAnimationSettingsForViewController:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BNBannerAnimator initWithAnimationSettings:](v6, "initWithAnimationSettings:", v7);
  return v8;
}

- (id)animationControllerMorphFromPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  return (id)objc_opt_new();
}

- (id)sizeTransitionAnimationSettingsForPresentable:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNDefaultBannerTransitioningDelegate _sizeTransitionAnimationSettingsForViewController:](self, "_sizeTransitionAnimationSettingsForViewController:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_sizeTransitionAnimationSettingsForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (!self->_resizeAnimationCustomizationPermitted
    || (objc_msgSend(v4, "bannerSizeTransitionAnimationSettings"),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "isHostedContent"))
    {
      +[BNBannerAnimator defaultResizeAnimationSettings](BNBannerAnimator, "defaultResizeAnimationSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (Class)_bannerTransitionAnimatorClassForAnimationStyle:(int64_t)a3
{
  return (Class)(id)objc_opt_class();
}

- (BOOL)isResizeAnimationCustomizationPermitted
{
  return self->_resizeAnimationCustomizationPermitted;
}

- (void)setResizeAnimationCustomizationPermitted:(BOOL)a3
{
  self->_resizeAnimationCustomizationPermitted = a3;
}

@end
