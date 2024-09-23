@implementation UIViewController(FocusUI)

- (void)fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation:()FocusUI
{
  id v5;
  _QWORD v6[5];

  if (objc_msgSend(a1, "bs_isAppearingOrAppeared"))
  {
    if (objc_msgSend(MEMORY[0x24BEBDB00], "_isInAnimationBlockWithAnimationsEnabled"))
    {
      objc_msgSend(a1, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layoutIfNeeded");

    }
    else
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __88__UIViewController_FocusUI__fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation___block_invoke;
      v6[3] = &unk_24D20A9C0;
      v6[4] = a1;
      objc_msgSend(MEMORY[0x24BEBDB00], "fcui_animateWithAnimationType:actions:completion:", a3, v6, 0);
    }
  }
}

- (uint64_t)fcui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation
{
  return objc_msgSend(a1, "fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation:", 1);
}

@end
