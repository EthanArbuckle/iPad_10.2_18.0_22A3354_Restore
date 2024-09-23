@implementation UIView(MUXCrossPlatformOperations)

- (uint64_t)_mapsui_fittingSize
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
}

- (uint64_t)_mapsui_setCardCorner
{
  objc_msgSend(a1, "setClipsToBounds:", 1);
  return objc_msgSend(a1, "_setContinuousCornerRadius:", 10.0);
}

- (void)_mapsui_performImageLoadingTransitionWithAnimations:()MUXCrossPlatformOperations completion:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101__UIView_MUXCrossPlatformOperations___mapsui_performImageLoadingTransitionWithAnimations_completion___block_invoke;
  v9[3] = &unk_1E2E02EC0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", a1, 5242882, a3, v9, 0.3);

}

- (void)_mapsui_addSelectGestureRecognizerWithTarget:()MUXCrossPlatformOperations action:
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x1E0DC3D80];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setAllowedPressTypes:", &unk_1E2E55C60);
  objc_msgSend(v8, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v8, "addTarget:action:", v7, a4);

  objc_msgSend(a1, "addGestureRecognizer:", v8);
}

+ (void)_mapsui_animateWithDuration:()MUXCrossPlatformOperations animations:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__UIView_MUXCrossPlatformOperations___mapsui_animateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E2E03490;
  v12 = a2;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "animateWithDuration:animations:completion:", v10, a5, a2);

}

- (BOOL)_mapsui_isRTL
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 1;
}

@end
