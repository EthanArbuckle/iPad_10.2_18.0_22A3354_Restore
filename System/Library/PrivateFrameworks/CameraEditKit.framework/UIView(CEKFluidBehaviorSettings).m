@implementation UIView(CEKFluidBehaviorSettings)

+ (void)cek_animateWithSettings:()CEKFluidBehaviorSettings interactive:animations:completion:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v15, "behaviorType");
  if ((unint64_t)(v11 - 1) < 2)
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    _CEKModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_animateUsingSpringBehavior:tracking:animations:completion:", v15, a4, v13, v10);
LABEL_5:

    goto LABEL_6;
  }
  if (!v11)
  {
    v14 = (void *)MEMORY[0x1E0DC3F10];
    _CEKModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_animateWithFrictionBounceAnimations:completion:", v13, v10);
    goto LABEL_5;
  }
LABEL_6:

}

+ (void)cek_animateWithSettings:()CEKFluidBehaviorSettings mode:animations:completion:
{
  void (**v10)(_QWORD);
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a5;
  v11 = a6;
  switch(a4)
  {
    case 1:
      v10[2](v10);
      if (v11)
        goto LABEL_5;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v10);
      if (v11)
LABEL_5:
        v11[2](v11, 1, 0);
      break;
    case 3:
      v12 = a1;
      v13 = v17;
      v14 = 0;
      goto LABEL_9;
    case 4:
      v15 = (void *)MEMORY[0x1E0DC3F10];
      _CEKModifyFrameRateForAnimationBlockFromSettings(v10, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_animateByRetargetingAnimations:completion:", v16, v11);

      break;
    case 5:
      v12 = a1;
      v13 = v17;
      v14 = 1;
LABEL_9:
      objc_msgSend(v12, "cek_animateWithSettings:interactive:animations:completion:", v13, v14, v10, v11);
      break;
    default:
      break;
  }

}

@end
