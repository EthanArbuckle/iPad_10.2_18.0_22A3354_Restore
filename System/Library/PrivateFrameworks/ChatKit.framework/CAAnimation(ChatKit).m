@implementation CAAnimation(ChatKit)

+ (id)ck_springAnimationForRevealingSticker:()ChatKit
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    v6 = &unk_1E2870918;
  else
    v6 = &unk_1E2870930;
  if (a3)
    v7 = &unk_1E2870930;
  else
    v7 = &unk_1E2870918;
  objc_msgSend(v4, "setFromValue:", v6);
  objc_msgSend(v5, "setToValue:", v7);
  objc_msgSend(v5, "setMass:", 2.0);
  objc_msgSend(v5, "setStiffness:", 300.0);
  objc_msgSend(v5, "setDamping:", 400.0);
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  return v5;
}

+ (id)ck_springAnimationForRevealingReactWithASticker
{
  void *v0;
  __int128 v1;
  void *v2;
  _OWORD v4[2];

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v4[0] = *MEMORY[0x1E0C9D648];
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v4, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFromValue:", v2);

  objc_msgSend(v0, "setMass:", 1.0);
  objc_msgSend(v0, "setStiffness:", 109.0);
  objc_msgSend(v0, "setDamping:", 14.6);
  objc_msgSend(v0, "setInitialVelocity:", 10.0);
  objc_msgSend(v0, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v0, "setRemovedOnCompletion:", 0);
  return v0;
}

+ (id)ck_opacityAnimationForRevealingSticker:()ChatKit
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    v6 = &unk_1E2870918;
  else
    v6 = &unk_1E2870930;
  if (a3)
    v7 = &unk_1E2870930;
  else
    v7 = &unk_1E2870918;
  objc_msgSend(v4, "setFromValue:", v6);
  objc_msgSend(v5, "setToValue:", v7);
  objc_msgSend(v5, "setMass:", 2.0);
  objc_msgSend(v5, "setStiffness:", 300.0);
  objc_msgSend(v5, "setDamping:", 400.0);
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  return v5;
}

+ (id)ck_stickerFlyInMoveAnimationFromRect:()ChatKit toRect:
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v39;
  double v40;
  _QWORD v41[5];

  v41[4] = *MEMORY[0x1E0C80C00];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (CKMainScreenScale_once_54 != -1)
  {
    v39 = a7;
    v40 = a8;
    dispatch_once(&CKMainScreenScale_once_54, &__block_literal_global_132);
    a7 = v39;
    a8 = v40;
  }
  v16 = *(double *)&CKMainScreenScale_sMainScreenScale_54;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_54 == 0.0)
    v16 = 1.0;
  v17 = a1 * v16 + floor((a3 * v16 - v14 * v16) * 0.5);
  v18 = a2 * v16 + floor((a4 * v16 - v15 * v16) * 0.5);
  v19 = 1.0 / v16;
  v20 = v19 * v17;
  v21 = v19 * v18;
  v22 = *(double *)&CKMainScreenScale_sMainScreenScale_54;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_54 == 0.0)
    v22 = 1.0;
  v23 = a5 * v22 + floor((a7 * v22 - v14 * v22) * 0.5);
  v24 = a6 * v22 + floor((a8 * v22 - v15 * v22) * 0.5);
  v25 = 1.0 / v22;
  v26 = v25 * v23;
  v27 = v25 * v24;
  v28 = v25 * v23 - v20;
  v29 = v20 + v28 * 0.35;
  v30 = v20 + v28 * 0.7;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v31, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTimingFunction:", v32);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v20, v21);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v33;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v29, v21 + (v27 - v21) * 0.35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v34;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v30, v21 + (v27 - v21) * 0.7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v35;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v26, v27);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setValues:", v37);

  objc_msgSend(v31, "setKeyTimes:", &unk_1E286F790);
  objc_msgSend(v31, "setDuration:", 0.5);
  objc_msgSend(v31, "setRemovedOnCompletion:", 0);
  return v31;
}

+ (id)ck_stickerFlyInSpringAnimation
{
  void *v0;
  double v1;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFromValue:", &unk_1E28713A0);
  objc_msgSend(v0, "setToValue:", &unk_1E28713B0);
  objc_msgSend(v0, "setMass:", 1.0);
  objc_msgSend(v0, "setStiffness:", 109.66);
  objc_msgSend(v0, "setDamping:", 14.6);
  objc_msgSend(v0, "setInitialVelocity:", 20.0);
  objc_msgSend(v0, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v0, "setAdditive:", 1);
  objc_msgSend(v0, "setBeginTime:", 0.34);
  objc_msgSend(v0, "settlingDuration");
  objc_msgSend(v0, "setDuration:", v1 + -0.3);
  objc_msgSend(v0, "setRemovedOnCompletion:", 0);
  return v0;
}

+ (id)ck_stickerFlyInScaleAnimation
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setValues:", &unk_1E286F7A8);
  objc_msgSend(v0, "setKeyTimes:", &unk_1E286F7C0);
  objc_msgSend(v0, "setDuration:", 0.7);
  objc_msgSend(v0, "setCalculationMode:", *MEMORY[0x1E0CD2920]);
  objc_msgSend(v0, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimingFunction:", v1);

  objc_msgSend(v0, "setAdditive:", 1);
  objc_msgSend(v0, "setRemovedOnCompletion:", 0);
  return v0;
}

+ (id)ck_stickerFlyInBoundsAnimationFromSize:()ChatKit toSize:
{
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds.size"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v13 = a1;
  *(double *)&v13[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v13, "{CGSize=dd}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v9);

  *(double *)v12 = a3;
  *(double *)&v12[1] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v12, "{CGSize=dd}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v10);

  objc_msgSend(v8, "setDuration:", 0.7);
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  return v8;
}

+ (id)ck_stickerFlyInTransformAnimationTo:()ChatKit
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v18[8];
  _OWORD v19[8];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v19[5] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v19[7] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v19[0] = *MEMORY[0x1E0CD2610];
  v19[1] = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v19[3] = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v19, "{CATransform3D=dddddddddddddddd}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v10 = a3[5];
  v18[4] = a3[4];
  v18[5] = v10;
  v11 = a3[7];
  v18[6] = a3[6];
  v18[7] = v11;
  v12 = a3[1];
  v18[0] = *a3;
  v18[1] = v12;
  v13 = a3[3];
  v18[2] = a3[2];
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v18, "{CATransform3D=dddddddddddddddd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", v15);

  objc_msgSend(v4, "setKeyTimes:", &unk_1E286F7D8);
  objc_msgSend(v4, "setDuration:", 0.7);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v16);

  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  return v4;
}

@end
