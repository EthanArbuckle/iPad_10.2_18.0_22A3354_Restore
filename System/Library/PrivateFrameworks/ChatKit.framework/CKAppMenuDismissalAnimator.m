@implementation CKAppMenuDismissalAnimator

- (void)animateTransition:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *MEMORY[0x1E0CEBDA8];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(v4, "completeTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end
