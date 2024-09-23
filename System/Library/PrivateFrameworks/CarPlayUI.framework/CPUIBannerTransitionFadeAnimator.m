@implementation CPUIBannerTransitionFadeAnimator

+ (double)defaultTransitionDuration
{
  return 0.2;
}

- (void)actionsForTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CPUIBannerTransitionFadeAnimator *v12;
  id v13;

  v9 = a3;
  if (-[BNBannerTransitionAnimator isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v9, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDF6F90];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__CPUIBannerTransitionFadeAnimator_actionsForTransition___block_invoke;
    v10[3] = &unk_24DF245D8;
    v11 = v9;
    v12 = self;
    v7 = v5;
    v13 = v7;
    objc_msgSend(v6, "performWithoutAnimation:", v10);

    v8 = 1.0;
  }
  else
  {
    objc_msgSend(v9, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
  }
  objc_msgSend(v7, "setAlpha:", v8);

}

uint64_t __57__CPUIBannerTransitionFadeAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)CPUIBannerTransitionFadeAnimator;
  objc_msgSendSuper2(&v4, sel_actionsForTransition_, v2);
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

@end
