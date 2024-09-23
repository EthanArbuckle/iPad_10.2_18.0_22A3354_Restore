@implementation HUCameraStreamFullScreenAnimator

- (HUCameraStreamFullScreenAnimator)initWithSourceCameraCell:(id)a3
{
  id v5;
  HUCameraStreamFullScreenAnimator *v6;
  HUCameraStreamFullScreenAnimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraStreamFullScreenAnimator;
  v6 = -[HUCameraStreamFullScreenAnimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourceCameraCell, a3);

  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (CGRect)_toViewFinalFrame:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = *MEMORY[0x1E0CEBDB8];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_adjustPresentedViewFrame:(CGRect)a3 forTransitionContext:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    objc_msgSend(v8, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    x = x + v10;
    y = y + v11;
    width = width - (v10 + v12);
    height = height - (v11 + v13);

  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (HUGridCameraCell)sourceCameraCell
{
  return self->_sourceCameraCell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceCameraCell, 0);
}

@end
