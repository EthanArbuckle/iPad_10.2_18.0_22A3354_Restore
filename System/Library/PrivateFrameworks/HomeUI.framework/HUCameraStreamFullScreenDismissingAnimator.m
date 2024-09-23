@implementation HUCameraStreamFullScreenDismissingAnimator

- (HUCameraStreamFullScreenDismissingAnimator)initWithSourceCameraCell:(id)a3 cameraViewSnapshot:(id)a4 cameraOverlaySnapshot:(id)a5
{
  id v9;
  id v10;
  HUCameraStreamFullScreenDismissingAnimator *v11;
  HUCameraStreamFullScreenDismissingAnimator *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraStreamFullScreenDismissingAnimator;
  v11 = -[HUCameraStreamFullScreenAnimator initWithSourceCameraCell:](&v14, sel_initWithSourceCameraCell_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cameraViewSnapshot, a4);
    objc_storeStrong((id *)&v12->_cameraOverlaySnapshot, a5);
  }

  return v12;
}

- (double)transitionDuration:(id)a3
{
  double result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraStreamFullScreenDismissingAnimator;
  -[HUCameraStreamFullScreenAnimator transitionDuration:](&v4, sel_transitionDuration_, a3);
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
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
  double v36;
  double v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  id v44;
  HUCameraStreamFullScreenDismissingAnimator *v45;
  id v46;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v6, "frame");
  v9 = (void *)objc_msgSend(v8, "initWithFrame:");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[HUCameraStreamFullScreenDismissingAnimator cameraViewSnapshot](self, "cameraViewSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  objc_msgSend(v5, "convertRect:fromView:", v6);
  -[HUCameraStreamFullScreenAnimator _adjustPresentedViewFrame:forTransitionContext:](self, "_adjustPresentedViewFrame:forTransitionContext:", v4);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HUCameraStreamFullScreenDismissingAnimator cameraViewSnapshot](self, "cameraViewSnapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[HUCameraStreamFullScreenDismissingAnimator cameraViewSnapshot](self, "cameraViewSnapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentMode:", 1);

  -[HUCameraStreamFullScreenDismissingAnimator cameraOverlaySnapshot](self, "cameraOverlaySnapshot");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  objc_msgSend(v5, "convertRect:fromView:", v6);
  -[HUCameraStreamFullScreenAnimator _adjustPresentedViewFrame:forTransitionContext:](self, "_adjustPresentedViewFrame:forTransitionContext:", v4);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[HUCameraStreamFullScreenDismissingAnimator cameraOverlaySnapshot](self, "cameraOverlaySnapshot");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  objc_msgSend(v6, "removeFromSuperview");
  -[HUCameraStreamFullScreenAnimator _toViewFinalFrame:](self, "_toViewFinalFrame:", v4);
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v5, "addSubview:", v7);
  objc_msgSend(v5, "addSubview:", v9);
  -[HUCameraStreamFullScreenDismissingAnimator cameraViewSnapshot](self, "cameraViewSnapshot");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v32);

  -[HUCameraStreamFullScreenDismissingAnimator cameraOverlaySnapshot](self, "cameraOverlaySnapshot");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v33);

  -[HUCameraStreamFullScreenAnimator sourceCameraCell](self, "sourceCameraCell");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setCameraViewAlpha:", 0.0);

  v35 = (void *)MEMORY[0x1E0CEABB0];
  -[HUCameraStreamFullScreenDismissingAnimator transitionDuration:](self, "transitionDuration:", v4);
  v37 = v36;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke;
  v43[3] = &unk_1E6F4E020;
  v44 = v5;
  v45 = self;
  v46 = v9;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_3;
  v41[3] = &unk_1E6F4E048;
  v41[4] = self;
  v42 = v4;
  v38 = v4;
  v39 = v9;
  v40 = v5;
  objc_msgSend(v35, "animateKeyframesWithDuration:delay:options:animations:completion:", 327680, v43, v41, v37, 0.0);

}

void __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sourceCameraCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraViewFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "sourceCameraCell");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 40), "cameraViewSnapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  objc_msgSend(*(id *)(a1 + 40), "cameraOverlaySnapshot");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);

  v23 = (void *)MEMORY[0x1E0CEABB0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_2;
  v26[3] = &unk_1E6F4C638;
  v24 = *(id *)(a1 + 48);
  v25 = *(_QWORD *)(a1 + 40);
  v27 = v24;
  v28 = v25;
  objc_msgSend(v23, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v26, 0.0, 0.5);

}

void __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "cameraOverlaySnapshot");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

uint64_t __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sourceCameraCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCameraViewAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

- (UIView)cameraViewSnapshot
{
  return self->_cameraViewSnapshot;
}

- (UIView)cameraOverlaySnapshot
{
  return self->_cameraOverlaySnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraOverlaySnapshot, 0);
  objc_storeStrong((id *)&self->_cameraViewSnapshot, 0);
}

@end
