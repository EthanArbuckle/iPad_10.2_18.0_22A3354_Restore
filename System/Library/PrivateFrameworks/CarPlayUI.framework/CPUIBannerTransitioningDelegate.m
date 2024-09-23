@implementation CPUIBannerTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[CPUIBannerTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:userInfo:](self, "animationControllerForPresentedController:presentingController:sourceController:userInfo:", a3, a4, a5, 0);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[CPUIBannerTransitioningDelegate animationControllerForDismissedController:userInfo:](self, "animationControllerForDismissedController:userInfo:", a3, 0);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a6;
  objc_msgSend(v7, "objectForKey:", CFSTR("CPUIBannerTransitionAnimationStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("CPUIBannerTransitionAnimationStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

  }
  else
  {
    v10 = 0;
  }

  v11 = (void *)objc_msgSend(objc_alloc(-[CPUIBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v10)), "initForPresenting:", 1);
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
  objc_msgSend(v5, "objectForKey:", CFSTR("CPUIBannerTransitionAnimationStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("CPUIBannerTransitionAnimationStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = 1;
  }

  v9 = (void *)objc_msgSend(objc_alloc(-[CPUIBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v8)), "initForPresenting:", 0);
  return v9;
}

- (id)animationControllerForResizingController:(id)a3 userInfo:(id)a4
{
  return -[BNBannerTransitionAnimator initForPresenting:]([CPUIBannerTransitionAnimator alloc], "initForPresenting:", 1);
}

- (Class)_bannerTransitionAnimatorClassForAnimationStyle:(int64_t)a3
{
  return (Class)(id)objc_opt_class();
}

@end
