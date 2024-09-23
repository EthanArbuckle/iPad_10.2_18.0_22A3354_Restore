@implementation UIView(SafariGraphicsUtilities)

- (uint64_t)ss_setUntransformedFrame:()SafariGraphicsUtilities
{
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v10 = fabs(a5);
  if (a5 >= 0.0)
    v11 = a5;
  else
    v11 = v10;
  v12 = fabs(a4);
  if (a4 >= 0.0)
    v13 = a4;
  else
    v13 = v12;
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "setBounds:");
  objc_msgSend(a1, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anchorPoint");
  v16 = v15;
  v18 = v17;
  v19 = -0.0;
  if (a4 >= 0.0)
    v20 = -0.0;
  else
    v20 = a4;
  v21 = a2 + v20;
  if (a5 < 0.0)
    v19 = a5;
  v22 = a3 + v19;

  return objc_msgSend(a1, "setCenter:", v21 + v16 * v13, v22 + v18 * v11);
}

+ (uint64_t)sf_animate:()SafariGraphicsUtilities usingDefaultMotionWithDelay:options:animations:completion:
{
  LODWORD(a5) = *MEMORY[0x1E0CD23C0];
  LODWORD(a6) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(a7) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  return objc_msgSend(a1, "sf_animate:usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", a3, 0.0, a5, a6, a7);
}

+ (void)sf_animate:()SafariGraphicsUtilities usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:
{
  void (**v20)(_QWORD);
  void (**v21)(id, uint64_t);
  _QWORD v22[4];
  void (**v23)(_QWORD);
  void *v24;
  float v25;
  float v26;
  float v27;

  v20 = a10;
  v21 = a11;
  if ((a8 & 1) != 0)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __156__UIView_SafariGraphicsUtilities__sf_animate_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_preferredFrameRateRange_animations_completion___block_invoke;
    v22[3] = &unk_1E21E34D8;
    v24 = a1;
    v25 = a4;
    v26 = a5;
    v27 = a6;
    v23 = v20;
    objc_msgSend(a1, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", a9, v22, v21, a2, a3);

  }
  else
  {
    if (v20)
      v20[2](v20);
    if (v21)
      v21[2](v21, 1);
  }

}

- (double)ss_untransformedFrame
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchorPoint");
  v6 = v5;

  objc_msgSend(a1, "center");
  return v7 - v6 * v3;
}

+ (void)sf_animate:()SafariGraphicsUtilities usingDefaultTimingWithOptions:animations:completion:
{
  void (**v10)(id, uint64_t);
  void (**v11)(void);

  v11 = a5;
  v10 = a6;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(a1, "_animateUsingDefaultTimingWithOptions:animations:completion:", a4, v11, v10);
  }
  else
  {
    if (v11)
      v11[2]();
    if (v10)
      v10[2](v10, 1);
  }

}

+ (uint64_t)sf_animate:()SafariGraphicsUtilities usingDefaultMotionWithOptions:animations:completion:
{
  LODWORD(a3) = *MEMORY[0x1E0CD23C0];
  LODWORD(a4) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(a5) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  return objc_msgSend(a1, "sf_animate:usingDefaultTimingWithOptions:preferredFrameRateRange:animations:completion:", a3, a4, a5);
}

+ (void)sf_animate:()SafariGraphicsUtilities withDuration:delay:options:animations:completion:
{
  void (**v14)(id, uint64_t);
  void (**v15)(void);

  v15 = a7;
  v14 = a8;
  if ((a5 & 1) != 0)
  {
    objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:", a6, v15, v14, a2, a3);
  }
  else
  {
    if (v15)
      v15[2]();
    if (v14)
      v14[2](v14, 1);
  }

}

+ (void)sf_animate:()SafariGraphicsUtilities usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:
{
  void (**v14)(id, uint64_t);
  void (**v15)(void);

  v15 = a7;
  v14 = a8;
  if ((a5 & 1) != 0)
  {
    objc_msgSend(a1, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", a6, v15, v14, a2, a3);
  }
  else
  {
    if (v15)
      v15[2]();
    if (v14)
      v14[2](v14, 1);
  }

}

+ (void)sf_animated:()SafariGraphicsUtilities usingFastSpringWithDelay:options:animations:completion:
{
  void (**v12)(id, uint64_t);
  void (**v13)(void);

  v13 = a6;
  v12 = a7;
  if ((a4 & 1) != 0)
  {
    objc_msgSend(a1, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", a5, v13, v12, 0.25, a2, 3.0, 4000.0, 500.0, 0.0);
  }
  else
  {
    if (v13)
      v13[2]();
    if (v12)
      v12[2](v12, 1);
  }

}

+ (void)sf_animate:()SafariGraphicsUtilities usingDefaultTimingWithOptions:preferredFrameRateRange:animations:completion:
{
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  void *v20;
  float v21;
  float v22;
  float v23;

  v16 = a8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__UIView_SafariGraphicsUtilities__sf_animate_usingDefaultTimingWithOptions_preferredFrameRateRange_animations_completion___block_invoke;
  v18[3] = &unk_1E21E34D8;
  v21 = a2;
  v22 = a3;
  v23 = a4;
  v19 = v16;
  v20 = a1;
  v17 = v16;
  objc_msgSend(a1, "sf_animate:usingDefaultTimingWithOptions:animations:completion:", a6, a7, v18, a9);

}

+ (uint64_t)sf_animateUsingDefaultDampedSpringWithDelay:()SafariGraphicsUtilities initialSpringVelocity:options:preferredFrameRateRange:animations:completion:
{
  return objc_msgSend(a1, "sf_animate:usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", 1, a3, a4, a5);
}

@end
