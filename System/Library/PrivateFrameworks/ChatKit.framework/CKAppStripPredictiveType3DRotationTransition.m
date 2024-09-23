@implementation CKAppStripPredictiveType3DRotationTransition

- (void)transitionFromView:(id)a3 toView:(id)a4 withDirection:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  double v37;
  _OWORD v38[8];
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5 <= 0)
    v14 = 1.57079633;
  else
    v14 = -1.57079633;
  if (a5 <= 0)
    v15 = -1.57079633;
  else
    v15 = 1.57079633;
  objc_msgSend(v12, "bringSubviewToFront:", v10);
  objc_msgSend(v10, "setAlpha:", 1.0);
  objc_msgSend(v9, "setAlpha:", 1.0);
  objc_msgSend(v10, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDoubleSided:", 0);

  objc_msgSend(v9, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDoubleSided:", 0);

  objc_msgSend(v13, "bounds");
  v19 = v18 * 0.5;
  objc_msgSend(v10, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAnchorPointZ:", v19);

  objc_msgSend(v9, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAnchorPointZ:", v19);

  objc_msgSend(v9, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setZPosition:", v19);

  objc_msgSend(v10, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setZPosition:", v19);

  memset(&v41, 0, sizeof(v41));
  CATransform3DMakeRotation(&v41, v14, 1.0, 0.0, 0.0);
  v40 = v41;
  objc_msgSend(v10, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v40;
  objc_msgSend(v24, "setTransform:", &v39);

  objc_msgSend(v9, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v38[5] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v38[6] = v27;
  v38[7] = v28;
  v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v38[0] = *MEMORY[0x1E0CD2610];
  v38[1] = v29;
  v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v38[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v38[3] = v30;
  v38[4] = v26;
  objc_msgSend(v25, "setTransform:", v38);

  v31 = (void *)MEMORY[0x1E0CEABB0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __99__CKAppStripPredictiveType3DRotationTransition_transitionFromView_toView_withDirection_completion___block_invoke;
  v34[3] = &unk_1E274A420;
  v37 = v15;
  v35 = v9;
  v36 = v10;
  v32 = v10;
  v33 = v9;
  objc_msgSend(v31, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v34, v11, 0.5, 0.0, 14.0, 0.0);

}

void __99__CKAppStripPredictiveType3DRotationTransition_transitionFromView_toView_withDirection_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[8];
  CATransform3D v9;
  CATransform3D v10;
  CATransform3D v11;

  memset(&v11, 0, sizeof(v11));
  CATransform3DMakeRotation(&v11, *(CGFloat *)(a1 + 48), 1.0, 0.0, 0.0);
  v10 = v11;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  objc_msgSend(v2, "setTransform:", &v9);

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v8[5] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v8[7] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v8[0] = *MEMORY[0x1E0CD2610];
  v8[1] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v8[3] = v7;
  objc_msgSend(v3, "setTransform:", v8);

}

@end
