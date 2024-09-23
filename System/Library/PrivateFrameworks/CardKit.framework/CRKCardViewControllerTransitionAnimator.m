@implementation CRKCardViewControllerTransitionAnimator

void __118___CRKCardViewControllerTransitionAnimator_transitionFromCardViewController_toCardViewController_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setAnimations:", 0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4;
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);

}

void __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setOpacity:", v1);

}

uint64_t __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  double x;
  double y;
  double Width;
  void *v5;
  double v6;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  x = v8.origin.x;
  y = v8.origin.y;
  Width = CGRectGetWidth(v8);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "contentHeightForWidth:");
  return objc_msgSend(v5, "setFrame:", x, y, Width, v6);
}

void __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setOpacity:", v3);

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v5, "setOpacity:", v4);

}

uint64_t __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

@end
