@implementation UIViewController

uint64_t __121__UIViewController_CFXAdditions__counterRotationViewForSnapshot_atCenterPoint_toWindowOrientation_fromWindowOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  CGAffineTransformMakeRotation(&v5, *(CGFloat *)(a1 + 112));
  v2 = *(void **)(a1 + 40);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setZRotation:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 56) * 0.5);
}

void __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_3;
    v10[3] = &unk_24EE57B60;
    v11 = *(id *)(a1 + 32);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_4;
    v7[3] = &unk_24EE58808;
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v10, v7, 0.25);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

uint64_t __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
