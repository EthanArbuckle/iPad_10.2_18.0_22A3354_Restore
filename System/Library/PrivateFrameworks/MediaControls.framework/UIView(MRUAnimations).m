@implementation UIView(MRUAnimations)

+ (void)mru_animateUsingType:()MRUAnimations animations:completion:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a4;
  v9 = a5;
  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3F40], "behaviorWithDampingRatio:response:", 0.8165, 0.51302);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v12 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_4;
      v18[3] = &unk_1E581B8C8;
      v19 = v8;
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_5;
      v16[3] = &unk_1E581B8F0;
      v17 = v9;
      objc_msgSend(v11, "_animateUsingSpringBehavior:tracking:animations:completion:", v10, 0, v18, v16);

      v13 = v19;
LABEL_7:

      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3F40], "behaviorWithDampingRatio:response:", 0.8165, 0.51302);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v15 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_2;
      v22[3] = &unk_1E581B8C8;
      v23 = v8;
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_3;
      v20[3] = &unk_1E581B8F0;
      v21 = v9;
      objc_msgSend(v14, "_animateUsingSpringBehavior:tracking:animations:completion:", v10, 0, v22, v20);

      v13 = v23;
      goto LABEL_7;
    case 0:
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke;
      v24[3] = &unk_1E581B8C8;
      v25 = v8;
      objc_msgSend(a1, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 1, v24, v9, 0.8, 0.0, 2.0, 300.0, 42.0, 0.0);
      v10 = v25;
LABEL_8:

      break;
  }

}

+ (uint64_t)mru_animateUsingType:()MRUAnimations animations:
{
  return objc_msgSend(a1, "mru_animateUsingType:animations:completion:", a3, a4, 0);
}

+ (uint64_t)mru_animateWithSpringParameters:()MRUAnimations options:animations:
{
  __int128 v5;
  _OWORD v7[2];
  uint64_t v8;

  v5 = *(_OWORD *)(a3 + 16);
  v7[0] = *(_OWORD *)a3;
  v7[1] = v5;
  v8 = *(_QWORD *)(a3 + 32);
  return objc_msgSend(a1, "mru_animateWithSpringParameters:options:animations:completion:", v7, a4, a5, 0);
}

+ (uint64_t)mru_animateWithSpringParameters:()MRUAnimations options:animations:completion:
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", a4, a5, a6, *a3, 0.0, a3[1], a3[3], a3[2], a3[4]);
}

@end
