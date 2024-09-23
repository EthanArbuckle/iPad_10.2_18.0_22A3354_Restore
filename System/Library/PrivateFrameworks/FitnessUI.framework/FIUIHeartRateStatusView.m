@implementation FIUIHeartRateStatusView

- (void)setFullHeartImageView:(id)a3
{
  objc_storeStrong((id *)&self->_fullHeartImageView, a3);
}

- (UIImageView)fullHeartImageView
{
  return self->_fullHeartImageView;
}

- (void)setAnimatingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_animatingImageView, a3);
}

- (FIUIAnimatingSpriteImageView)animatingImageView
{
  return self->_animatingImageView;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[5];
  CGAffineTransform v19;
  CGAffineTransform v20;
  _QWORD v21[6];
  _QWORD v22[5];
  _QWORD v23[6];
  _QWORD v24[5];

  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 1uLL:
        -[FIUIHeartRateStatusView _startMeasuringAnimationAnimated:](self, "_startMeasuringAnimationAnimated:", 0);
        if (state == 5)
        {
          v10 = (void *)MEMORY[0x24BEBDB00];
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __36__FIUIHeartRateStatusView_setState___block_invoke;
          v24[3] = &unk_24CF30600;
          v24[4] = self;
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_2;
          v23[3] = &unk_24CF313E0;
          v23[4] = self;
          v23[5] = 1;
          v11 = 0.5;
          v12 = v24;
          v13 = v23;
          v14 = 0x10000;
          goto LABEL_9;
        }
        -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAlpha:", 0.0);

        break;
      case 2uLL:
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_3;
        v22[3] = &unk_24CF30600;
        v22[4] = self;
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_4;
        v21[3] = &unk_24CF313E0;
        v21[4] = self;
        v21[5] = 2;
        objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v22, v21, 0.5);
        break;
      case 3uLL:
      case 6uLL:
        -[FIUIHeartRateStatusView animatingImageView](self, "animatingImageView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setAlpha:", 0.0);

        -[FIUIHeartRateStatusView animationSuspendedMeasuringView](self, "animationSuspendedMeasuringView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 0.0);

        -[FIUIHeartRateStatusView fullHeartImageView](self, "fullHeartImageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 1.0);

        -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAlpha:", 0.0);

        -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAlpha:", 0.0);

        -[FIUIHeartRateStatusView _suspendAnimations](self, "_suspendAnimations");
        break;
      case 4uLL:
        -[FIUIHeartRateStatusView _startMeasuringAnimationAnimated:](self, "_startMeasuringAnimationAnimated:", 1);
        break;
      case 5uLL:
        CGAffineTransformMakeRotation(&v20, 3.14159265);
        -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v20;
        objc_msgSend(v15, "setTransform:", &v19);

        v10 = (void *)MEMORY[0x24BEBDB00];
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_5;
        v18[3] = &unk_24CF30600;
        v18[4] = self;
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __36__FIUIHeartRateStatusView_setState___block_invoke_6;
        v17[3] = &unk_24CF313E0;
        v17[4] = self;
        v17[5] = 5;
        v11 = 0.5;
        v12 = v18;
        v13 = v17;
        v14 = 0x20000;
LABEL_9:
        objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", v14, v12, v13, v11, 0.0);
        break;
      default:
        break;
    }
    -[FIUIHeartRateStatusView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_startMeasuringAnimationAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD aBlock[5];

  if (self->_animationsSuspended)
  {
    -[FIUIHeartRateStatusView animatingImageView](self, "animatingImageView", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView fullHeartImageView](self, "fullHeartImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView animationSuspendedMeasuringView](self, "animationSuspendedMeasuringView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);

  }
  else
  {
    v8 = a3;
    -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

    v11 = -[FIUIHeartRateStatusView _loadHeartMeasuringImage](self, "_loadHeartMeasuringImage");
    -[FIUIHeartRateStatusView animatingImageView](self, "animatingImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startAnimating");

    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__FIUIHeartRateStatusView__startMeasuringAnimationAnimated___block_invoke;
    aBlock[3] = &unk_24CF30600;
    aBlock[4] = self;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (v8)
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v13, 0.5);
    else
      (*((void (**)(void *))v13 + 2))(v13);

  }
}

- (UIImageView)reloadOutlineView
{
  return self->_reloadOutlineView;
}

- (UIImageView)reloadArrowView
{
  return self->_reloadArrowView;
}

- (id)_loadHeartMeasuringImage
{
  void *v3;
  NSString *heartSpriteImageName;
  void *v5;
  NSObject *v6;

  -[FIUIAnimatingSpriteImageView spriteImage](self->_animatingImageView, "spriteImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    heartSpriteImageName = self->_heartSpriteImageName;
    if (heartSpriteImageName)
    {
      FIUIImageInBundle((uint64_t)heartSpriteImageName, (uint64_t)self->_resourceBundle);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[FIUIAnimatingSpriteImageView setSpriteImage:](self->_animatingImageView, "setSpriteImage:", v5);
        -[FIUIAnimatingSpriteImageView setSpriteColumnCount:](self->_animatingImageView, "setSpriteColumnCount:", self->_heartSpriteImageColumnCount);
        -[FIUIAnimatingSpriteImageView setSpriteFrameCount:](self->_animatingImageView, "setSpriteFrameCount:", self->_heartSpriteImageFrameCount);
      }
      else
      {
        _HKInitializeLogging();
        v6 = *MEMORY[0x24BDD3008];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3008], OS_LOG_TYPE_ERROR))
          -[FIUIHeartRateStatusView _loadHeartMeasuringImage].cold.1((uint64_t *)&self->_heartSpriteImageName, (uint64_t *)&self->_resourceBundle, v6);
      }

    }
  }
  -[FIUIAnimatingSpriteImageView spriteImage](self->_animatingImageView, "spriteImage");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __60__FIUIHeartRateStatusView__startMeasuringAnimationAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "fullHeartImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "animationSuspendedMeasuringView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "animatingImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)setAnimationsSuspended:(BOOL)a3
{
  if (self->_animationsSuspended != a3)
  {
    self->_animationsSuspended = a3;
    if (a3)
      -[FIUIHeartRateStatusView _suspendAnimations](self, "_suspendAnimations");
    else
      -[FIUIHeartRateStatusView _resumeAnimations](self, "_resumeAnimations");
  }
}

- (void)_resumeAnimations
{
  OUTLINED_FUNCTION_1(&dword_21307C000, a1, a3, "[HRStatusView] Starting animations", a5, a6, a7, a8, 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[FIUIHeartRateStatusView fullHeartImageView](self, "fullHeartImageView", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  CGRect v59;
  CGRect v60;

  -[FIUIHeartRateStatusView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[FIUIHeartRateStatusView fullHeartImageView](self, "fullHeartImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v60.origin.x = v12;
  v60.origin.y = v13;
  v60.size.width = v14;
  v60.size.height = v15;
  v59.origin.x = v4;
  v59.origin.y = v6;
  v59.size.width = v8;
  v59.size.height = v10;
  v16 = CGRectEqualToRect(v59, v60);

  if (!v16)
  {
    -[FIUIHeartRateStatusView bounds](self, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[FIUIHeartRateStatusView animatingImageView](self, "animatingImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    -[FIUIHeartRateStatusView bounds](self, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[FIUIHeartRateStatusView fullHeartImageView](self, "fullHeartImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

    -[FIUIHeartRateStatusView bounds](self, "bounds");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

    -[FIUIHeartRateStatusView bounds](self, "bounds");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    -[FIUIHeartRateStatusView animationSuspendedMeasuringView](self, "animationSuspendedMeasuringView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "center");
    v55 = v54;
    v57 = v56;
    -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setCenter:", v55, v57);

    -[FIUIHeartRateStatusView _resumeAnimations](self, "_resumeAnimations");
  }
}

- (void)_suspendAnimations
{
  OUTLINED_FUNCTION_1(&dword_21307C000, a1, a3, "[HRStatusView] Stopping animations", a5, a6, a7, a8, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadArrowView, 0);
  objc_storeStrong((id *)&self->_animationSuspendedMeasuringView, 0);
  objc_storeStrong((id *)&self->_reloadOutlineView, 0);
  objc_storeStrong((id *)&self->_animatingImageView, 0);
  objc_storeStrong((id *)&self->_fullHeartImageView, 0);
  objc_storeStrong((id *)&self->_resourceBundle, 0);
  objc_storeStrong((id *)&self->_heartSpriteImageName, 0);
}

- (FIUIHeartRateStatusView)initWithFrame:(CGRect)a3 heartFilledImageName:(id)a4 heartSpriteImageName:(id)a5 spriteFrameCount:(int64_t)a6 spriteColumnCount:(int64_t)a7 resourceBundle:(id)a8
{
  return -[FIUIHeartRateStatusView initWithFrame:heartFilledImageName:heartSpriteImageName:heartSuspendedSpriteImageName:spriteFrameCount:spriteColumnCount:resourceBundle:](self, "initWithFrame:heartFilledImageName:heartSpriteImageName:heartSuspendedSpriteImageName:spriteFrameCount:spriteColumnCount:resourceBundle:", a4, a5, a4, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (FIUIHeartRateStatusView)initWithFrame:(CGRect)a3 heartFilledImageName:(id)a4 heartSpriteImageName:(id)a5 heartSuspendedSpriteImageName:(id)a6 spriteFrameCount:(int64_t)a7 spriteColumnCount:(int64_t)a8 resourceBundle:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  FIUIHeartRateStatusView *v23;
  FIUIHeartRateStatusView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  FIUIAnimatingSpriteImageView *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a9;
  v41.receiver = self;
  v41.super_class = (Class)FIUIHeartRateStatusView;
  v23 = -[FIUIHeartRateStatusView initWithFrame:](&v41, sel_initWithFrame_, x, y, width, height);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_heartSpriteImageName, a5);
    v24->_heartSpriteImageFrameCount = a7;
    v24->_heartSpriteImageColumnCount = a8;
    objc_storeStrong((id *)&v24->_resourceBundle, a9);
    v24->_beatsPerMinute = 60.0;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", x, y, width, height);
    -[FIUIHeartRateStatusView setFullHeartImageView:](v24, "setFullHeartImageView:", v25);

    FIUIImageInBundle((uint64_t)v19, (uint64_t)v24->_resourceBundle);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHeartRateStatusView fullHeartImageView](v24, "fullHeartImageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setImage:", v26);

    -[FIUIHeartRateStatusView fullHeartImageView](v24, "fullHeartImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView fullHeartImageView](v24, "fullHeartImageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHeartRateStatusView addSubview:](v24, "addSubview:", v29);

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", x, y, width, height);
    -[FIUIHeartRateStatusView setAnimationSuspendedMeasuringView:](v24, "setAnimationSuspendedMeasuringView:", v30);

    FIUIImageInBundle((uint64_t)v21, (uint64_t)v24->_resourceBundle);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHeartRateStatusView animationSuspendedMeasuringView](v24, "animationSuspendedMeasuringView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage:", v31);

    -[FIUIHeartRateStatusView animationSuspendedMeasuringView](v24, "animationSuspendedMeasuringView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView animationSuspendedMeasuringView](v24, "animationSuspendedMeasuringView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHeartRateStatusView addSubview:](v24, "addSubview:", v34);

    v35 = -[FIUIAnimatingSpriteImageView initWithFrame:]([FIUIAnimatingSpriteImageView alloc], "initWithFrame:", x, y, width, height);
    -[FIUIHeartRateStatusView setAnimatingImageView:](v24, "setAnimatingImageView:", v35);

    -[FIUIHeartRateStatusView animatingImageView](v24, "animatingImageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContentMode:", 1);

    -[FIUIHeartRateStatusView animatingImageView](v24, "animatingImageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAlpha:", 0.0);

    -[FIUIHeartRateStatusView animatingImageView](v24, "animatingImageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHeartRateStatusView addSubview:](v24, "addSubview:", v38);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v24, sel__resumeAnimations, CFSTR("FIUIResumeAnimationsNotification"), 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v24, sel__suspendAnimations, CFSTR("FIUISuspendAnimationsNotification"), 0);

  }
  return v24;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  unint64_t state;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  state = self->_state;
  if (state <= 6)
  {
    if (((1 << state) & 0x6C) != 0)
    {
      -[FIUIHeartRateStatusView fullHeartImageView](self, "fullHeartImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = v5;
      objc_msgSend(v5, "intrinsicContentSize");
      v2 = v7;
      v3 = v8;

      goto LABEL_10;
    }
    if (((1 << state) & 0x12) != 0)
    {
      if (self->_animationsSuspended)
        -[FIUIHeartRateStatusView animationSuspendedMeasuringView](self, "animationSuspendedMeasuringView");
      else
        -[FIUIHeartRateStatusView animatingImageView](self, "animatingImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
LABEL_10:
  v9 = v2;
  v10 = v3;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setReloadHeartOutlineImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BEBD668]);
    -[FIUIHeartRateStatusView setReloadOutlineView:](self, "setReloadOutlineView:", v6);

    -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHeartRateStatusView addSubview:](self, "addSubview:", v7);

  }
  -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v4);

  -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  -[FIUIHeartRateStatusView reloadOutlineView](self, "reloadOutlineView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

  -[FIUIHeartRateStatusView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setReloadArrowImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BEBD668]);
    -[FIUIHeartRateStatusView setReloadArrowView:](self, "setReloadArrowView:", v6);

    -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHeartRateStatusView addSubview:](self, "addSubview:", v7);

  }
  -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v4);

  -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  -[FIUIHeartRateStatusView reloadArrowView](self, "reloadArrowView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

  -[FIUIHeartRateStatusView setNeedsLayout](self, "setNeedsLayout");
}

void __36__FIUIHeartRateStatusView_setState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "reloadArrowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  CGAffineTransformMakeRotation(&v5, 3.14159265);
  objc_msgSend(*(id *)(a1 + 32), "reloadArrowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

void __36__FIUIHeartRateStatusView_setState___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[56] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "reloadArrowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v5[0] = *MEMORY[0x24BDBD8B8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v3, "setTransform:", v5);

  }
}

void __36__FIUIHeartRateStatusView_setState___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "animatingImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "animationSuspendedMeasuringView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "fullHeartImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

_QWORD *__36__FIUIHeartRateStatusView_setState___block_invoke_4(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[56] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(result, "_suspendAnimations");
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_startBeatingHeart");
  }
  return result;
}

void __36__FIUIHeartRateStatusView_setState___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  objc_msgSend(*(id *)(a1 + 32), "animatingImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "fullHeartImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "animationSuspendedMeasuringView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "reloadOutlineView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "reloadArrowView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  CGAffineTransformMakeRotation(&v9, 6.28318531);
  objc_msgSend(*(id *)(a1 + 32), "reloadArrowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

_QWORD *__36__FIUIHeartRateStatusView_setState___block_invoke_6(uint64_t a1)
{
  _QWORD *result;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  result = *(_QWORD **)(a1 + 32);
  if (result[56] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(result, "reloadArrowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v5[0] = *MEMORY[0x24BDBD8B8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v3, "setTransform:", v5);

    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_suspendAnimations");
  }
  return result;
}

- (void)setBeatsPerMinute:(double)a3
{
  self->_beatsPerMinute = a3;
}

- (void)_startBeatingHeart
{
  if (!self->_isBeatingHeart && !self->_animationsSuspended)
  {
    self->_isBeatingHeart = 1;
    -[FIUIHeartRateStatusView _beatFullHeartOnce](self, "_beatFullHeartOnce");
  }
}

- (void)_beatFullHeartOnce
{
  double beatsPerMinute;
  _QWORD v3[5];
  _QWORD v4[5];
  __int128 v5;
  unint64_t v6;

  beatsPerMinute = self->_beatsPerMinute;
  v4[0] = MEMORY[0x24BDAC760];
  v5 = xmmword_21310E020;
  v4[1] = 3221225472;
  v4[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke;
  v4[3] = &unk_24CF31408;
  v4[4] = self;
  v6 = 0xBFE1111111111111;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_4;
  v3[3] = &unk_24CF31430;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateKeyframesWithDuration:delay:options:animations:completion:", 117637120, v4, v3, 60.0 / beatsPerMinute, 0.0);
}

uint64_t __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke(double *a1)
{
  double v2;
  uint64_t v3;
  double v4;
  double v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = a1[5];
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_2;
  v8[3] = &unk_24CF30600;
  *(double *)&v8[4] = a1[4];
  objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.0, v2);
  v4 = a1[6];
  v5 = a1[7];
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_3;
  v7[3] = &unk_24CF30600;
  *(double *)&v7[4] = a1[4];
  return objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, v4, v5);
}

void __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, 0.9, 0.9);
  objc_msgSend(*(id *)(a1 + 32), "fullHeartImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "fullHeartImageView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v3[0] = *MEMORY[0x24BDBD8B8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

uint64_t __45__FIUIHeartRateStatusView__beatFullHeartOnce__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedHeartbeat");
}

- (void)_finishedHeartbeat
{
  void *v3;
  _BOOL4 animationsSuspended;

  self->_isBeatingHeart = 0;
  -[FIUIHeartRateStatusView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    animationsSuspended = self->_animationsSuspended;

    if (!animationsSuspended)
    {
      if (self->_state == 2)
      {
        self->_isBeatingHeart = 1;
        -[FIUIHeartRateStatusView _beatFullHeartOnce](self, "_beatFullHeartOnce");
      }
      else if (self->_delayedStartMeasuringAnimation)
      {
        self->_delayedStartMeasuringAnimation = 0;
        -[FIUIHeartRateStatusView _startMeasuringAnimationAnimated:](self, "_startMeasuringAnimationAnimated:", 1);
      }
    }
  }
}

- (void)unloadAnimationAssets
{
  -[FIUIHeartRateStatusView _suspendAnimations](self, "_suspendAnimations");
  -[FIUIAnimatingSpriteImageView setSpriteImage:](self->_animatingImageView, "setSpriteImage:", 0);
}

- (BOOL)animationsSuspended
{
  return self->_animationsSuspended;
}

- (void)setReloadOutlineView:(id)a3
{
  objc_storeStrong((id *)&self->_reloadOutlineView, a3);
}

- (UIImageView)animationSuspendedMeasuringView
{
  return self->_animationSuspendedMeasuringView;
}

- (void)setAnimationSuspendedMeasuringView:(id)a3
{
  objc_storeStrong((id *)&self->_animationSuspendedMeasuringView, a3);
}

- (void)setReloadArrowView:(id)a3
{
  objc_storeStrong((id *)&self->_reloadArrowView, a3);
}

- (void)_loadHeartMeasuringImage
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_21307C000, log, OS_LOG_TYPE_ERROR, "Error reading heart image named %@ in bundle %@", (uint8_t *)&v5, 0x16u);
}

@end
