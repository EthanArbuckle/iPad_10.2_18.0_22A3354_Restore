@implementation HUCameraStreamFullScreenPresentingAnimator

- (HUCameraStreamFullScreenPresentingAnimator)initWithSourceCameraCell:(id)a3 cameraSnapshot:(id)a4
{
  id v7;
  HUCameraStreamFullScreenPresentingAnimator *v8;
  HUCameraStreamFullScreenPresentingAnimator *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUCameraStreamFullScreenPresentingAnimator;
  v8 = -[HUCameraStreamFullScreenAnimator initWithSourceCameraCell:](&v11, sel_initWithSourceCameraCell_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_cameraSnapshot, a4);

  return v9;
}

- (HUCameraStreamFullScreenPresentingAnimator)initWithSourceCameraCell:(id)a3 cameraSnapshot:(id)a4 snapshotDemoURL:(id)a5
{
  id v9;
  id v10;
  HUCameraStreamFullScreenPresentingAnimator *v11;
  HUCameraStreamFullScreenPresentingAnimator *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraStreamFullScreenPresentingAnimator;
  v11 = -[HUCameraStreamFullScreenAnimator initWithSourceCameraCell:](&v14, sel_initWithSourceCameraCell_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cameraSnapshot, a4);
    objc_storeStrong((id *)&v12->_demoSnapshotURL, a5);
  }

  return v12;
}

- (double)transitionDuration:(id)a3
{
  double result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraStreamFullScreenPresentingAnimator;
  -[HUCameraStreamFullScreenAnimator transitionDuration:](&v4, sel_transitionDuration_, a3);
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  HUCameraStreamFullScreenPresentingAnimator *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  HUCameraStreamFullScreenPresentingAnimator *v54;
  id v55;
  id v56;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[HUCameraStreamFullScreenAnimator _toViewFinalFrame:](self, "_toViewFinalFrame:", v4);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v8, "setAlpha:", 0.0);
  objc_msgSend(v5, "addSubview:", v8);
  -[HUCameraStreamFullScreenAnimator sourceCameraCell](self, "sourceCameraCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraViewFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[HUCameraStreamFullScreenAnimator sourceCameraCell](self, "sourceCameraCell");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:fromView:", v19, v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA450]), "initWithFrame:", v21, v23, v25, v27);
  objc_msgSend(v28, "setContentMode:", 1);
  -[HUCameraStreamFullScreenPresentingAnimator cameraSnapshot](self, "cameraSnapshot");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCameraSource:", v29);

  objc_msgSend(v5, "addSubview:", v28);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    v30 = objc_alloc(MEMORY[0x1E0CEA638]);
    -[HUCameraStreamFullScreenPresentingAnimator demoSnapshotURL](self, "demoSnapshotURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithContentsOfFile:", v32);

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v33);
    objc_msgSend(v28, "bounds");
    objc_msgSend(v34, "setFrame:");
    objc_msgSend(v34, "setContentMode:", 1);
    objc_msgSend(v34, "setAutoresizingMask:", 18);
    objc_msgSend(v28, "addSubview:", v34);

  }
  -[HUCameraStreamFullScreenAnimator sourceCameraCell](self, "sourceCameraCell");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setCameraViewAlpha:", 0.0);

  v36 = (void *)MEMORY[0x1E0CEABB0];
  -[HUCameraStreamFullScreenPresentingAnimator transitionDuration:](self, "transitionDuration:", v4);
  v38 = v37;
  v39 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke;
  v52[3] = &unk_1E6F4DFD0;
  v53 = v28;
  v54 = self;
  v55 = v4;
  v56 = v8;
  v45[0] = v39;
  v45[1] = 3221225472;
  v45[2] = __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_3;
  v45[3] = &unk_1E6F4DFF8;
  v46 = v56;
  v47 = v53;
  v48 = v6;
  v49 = self;
  v50 = v55;
  v51 = v5;
  v40 = v5;
  v41 = v55;
  v42 = v6;
  v43 = v53;
  v44 = v56;
  objc_msgSend(v36, "animateKeyframesWithDuration:delay:options:animations:completion:", 327680, v52, v45, v38, 0.0);

}

void __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "_toViewFinalFrame:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "_adjustPresentedViewFrame:forTransitionContext:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v3 = (void *)MEMORY[0x1E0CEABB0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.5, 0.5);

}

uint64_t __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_3(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[7], "_toViewFinalFrame:", a1[8]);
  objc_msgSend(a1[6], "setFrame:");
  objc_msgSend(a1[9], "addSubview:", a1[6]);
  objc_msgSend(a1[7], "sourceCameraCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCameraViewAlpha:", 1.0);

  return objc_msgSend(a1[8], "completeTransition:", 1);
}

- (HMCameraSnapshot)cameraSnapshot
{
  return self->_cameraSnapshot;
}

- (NSURL)demoSnapshotURL
{
  return self->_demoSnapshotURL;
}

- (void)setDemoSnapshotURL:(id)a3
{
  objc_storeStrong((id *)&self->_demoSnapshotURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoSnapshotURL, 0);
  objc_storeStrong((id *)&self->_cameraSnapshot, 0);
}

@end
