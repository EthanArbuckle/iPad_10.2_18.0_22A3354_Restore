@implementation UIView(ChatKit)

- (uint64_t)ck_performRevealAnimated:()ChatKit completion:
{
  return objc_msgSend(a1, "ck_performAnimationVisibility:animated:completion:", 1, a3, a4);
}

- (uint64_t)ck_performHideAnimated:()ChatKit completion:
{
  return objc_msgSend(a1, "ck_performAnimationVisibility:animated:completion:", 0, a3, a4);
}

- (void)ck_performAnimationVisibility:()ChatKit animated:completion:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CD26F8];
    v8 = a5;
    objc_msgSend(v7, "ck_springAnimationForRevealingSticker:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD26F8], "ck_opacityAnimationForRevealingSticker:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAnimations:", v12);

    objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v11, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v13 = (void *)MEMORY[0x1E0CD28B0];
    objc_msgSend(v9, "settlingDuration");
    v15 = v14;
    objc_msgSend(v10, "settlingDuration");
    if (v15 >= v16)
      v16 = v15;
    objc_msgSend(v13, "setAnimationDuration:", v16);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v8);

    objc_msgSend(a1, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAnimation:forKey:", v11, 0);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    v9 = a5;
    objc_msgSend(a1, "ck_performUnanimatedVisibility:completion:", a3, v9);
  }

}

- (void)ck_performUnanimatedVisibility:()ChatKit completion:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = &unk_1E2870A20;
  else
    v5 = &unk_1E2870A38;
  if (a3)
    v6 = &unk_1E2870A38;
  else
    v6 = &unk_1E2870A20;
  v7 = (void *)MEMORY[0x1E0CD2710];
  v8 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToValue:", v5);
  objc_msgSend(v9, "setFromValue:", v6);
  v10 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToValue:", v5);
  objc_msgSend(v11, "setFromValue:", v6);
  objc_msgSend(v11, "setFillMode:", v10);
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnimations:", v13);

  objc_msgSend(v12, "setFillMode:", v10);
  objc_msgSend(v12, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.01);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v8);

  objc_msgSend(a1, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v12, 0);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (double)ck_identityTransformFrame
{
  double v2;
  double v3;
  __int128 v4;
  double v5;
  CGAffineTransform v7;
  _OWORD v8[3];
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  objc_msgSend(a1, "transform");
  v9 = v10;
  if (CGAffineTransformIsIdentity(&v9))
  {
    objc_msgSend(a1, "frame");
    return v2;
  }
  else
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v8[0] = *MEMORY[0x1E0C9BAA8];
    v8[1] = v4;
    v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(a1, "setTransform:", v8);
    objc_msgSend(a1, "frame");
    v3 = v5;
    v7 = v10;
    objc_msgSend(a1, "setTransform:", &v7);
  }
  return v3;
}

- (double)ck_identityTransformFrameInView:()ChatKit
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  v4 = a3;
  objc_msgSend(a1, "ck_identityTransformFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;

  return v15;
}

@end
