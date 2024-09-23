@implementation CKAppMenuPresentationAnimator

- (void)animateTransition:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v3 = *MEMORY[0x1E0CEBDB8];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", v3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  objc_msgSend(v4, "finalFrameForViewController:", v16);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v16, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  objc_msgSend(v4, "completeTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end
