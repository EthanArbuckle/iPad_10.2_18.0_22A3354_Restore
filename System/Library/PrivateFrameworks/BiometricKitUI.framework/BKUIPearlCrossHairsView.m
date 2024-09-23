@implementation BKUIPearlCrossHairsView

- (BKUIPearlCrossHairsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BKUIPearlCrossHairsView *v7;
  BKUIPearlCrossHairsView *v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  BKUIPearlCrossHairsRenderingView *v13;
  BKUIPearlCrossHairsRenderingView *renderingView;
  BKUIPearlCrossHairsRenderingView *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIImageView *arrowView;
  _Unwind_Exception *BYFlowSkipIdentifierFaceID_cold_1;
  objc_super v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)BKUIPearlCrossHairsView;
  v7 = -[BKUIPearlCrossHairsView initWithFrame:](&v25, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[BKUIPearlCrossHairsView setOpaque:](v7, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlCrossHairsView layer](v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", v9);

    -[BKUIPearlCrossHairsView setAutoresizesSubviews:](v8, "setAutoresizesSubviews:", 1);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v11 = (void (*)(void))getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
    v30 = getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
    if (!getMTLCreateSystemDefaultDeviceSymbolLoc_ptr)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke;
      v26[3] = &unk_1EA27FEE8;
      v26[4] = &v27;
      __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke((uint64_t)v26);
      v11 = (void (*)(void))v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (!v11)
    {
      BYFlowSkipIdentifierFaceID_cold_1 = (_Unwind_Exception *)getBYFlowSkipIdentifierFaceID_cold_1();
      _Block_object_dispose(&v27, 8);
      _Unwind_Resume(BYFlowSkipIdentifierFaceID_cold_1);
    }
    v11();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BKUIPearlCrossHairsRenderingView initWithFrame:device:]([BKUIPearlCrossHairsRenderingView alloc], "initWithFrame:device:", v12, x, y, width, height);
    renderingView = v8->_renderingView;
    v8->_renderingView = v13;

    -[BKUIPearlCrossHairsRenderingView setAutoresizingMask:](v8->_renderingView, "setAutoresizingMask:", 18);
    -[MTKView setClearColor:](v8->_renderingView, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    -[MTKView setFramebufferOnly:](v8->_renderingView, "setFramebufferOnly:", 0);
    -[BKUIPearlCrossHairsRenderingView setOpaque:](v8->_renderingView, "setOpaque:", 0);
    -[BKUIPearlCrossHairsRenderingView setSampleCount:](v8->_renderingView, "setSampleCount:", 4);
    v15 = v8->_renderingView;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTKView setPreferredFramesPerSecond:](v15, "setPreferredFramesPerSecond:", objc_msgSend(v16, "maximumFramesPerSecond"));

    -[BKUIPearlCrossHairsView addSubview:](v8, "addSubview:", v8->_renderingView);
    v17 = objc_alloc(MEMORY[0x1E0CEA658]);
    v18 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageNamed:inBundle:", CFSTR("Enrollment Hint Arrow"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "initWithImage:", v20);
    arrowView = v8->_arrowView;
    v8->_arrowView = (UIImageView *)v21;

    -[UIImageView setAlpha:](v8->_arrowView, "setAlpha:", 0.0);
    -[BKUIPearlCrossHairsView addSubview:](v8, "addSubview:", v8->_arrowView);

  }
  return v8;
}

- (void)setPitch:(double)a3 yaw:(double)a4
{
  -[BKUIPearlCrossHairsView _setPitch:yaw:animated:](self, "_setPitch:yaw:animated:", 1, a3 * -3.14159265 / 180.0, a4 * -3.14159265 / 180.0);
}

- (void)_setPitch:(double)a3 yaw:(double)a4 animated:(BOOL)a5
{
  float v5;
  double v6;
  float v7;

  v5 = a3;
  *(float *)&v6 = v5;
  v7 = a4;
  *((float *)&v6 + 1) = v7;
  -[BKUIPearlCrossHairsRenderingView setAxis:animated:](self->_renderingView, "setAxis:animated:", a5, v6);
}

- (double)angleFromDirection:(unint64_t)a3
{
  return (double)(int)a3 * 0.785398163;
}

- (void)nudgeCrossHairsAtAngle:(double)a3 completion:(id)a4
{
  id v6;
  BKUIPearlCrossHairsRenderingView *renderingView;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  CGAffineTransform v13;

  v6 = a4;
  -[BKUIPearlCrossHairsView _setPitch:yaw:animated:](self, "_setPitch:yaw:animated:", 0, 0.0, 0.0);
  -[BKUIPearlCrossHairsRenderingView setGrayscale:](self->_renderingView, "setGrayscale:", 1);
  -[BKUIPearlCrossHairsView setAlpha:](self, "setAlpha:", 1.0);
  renderingView = self->_renderingView;
  CGAffineTransformMakeRotation(&v13, -a3);
  -[BKUIPearlCrossHairsRenderingView setTransform:](renderingView, "setTransform:", &v13);
  -[BKUIPearlCrossHairsView _setPitch:yaw:animated:](self, "_setPitch:yaw:animated:", 1, 0.0, 0.261799388);
  v8 = dispatch_time(0, 500000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke;
  v10[3] = &unk_1EA280C10;
  v12 = xmmword_1DB2DFB80;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v10);

}

void __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_setPitch:yaw:animated:", 1, *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 56) * 0.5);
  v2 = dispatch_time(0, 250000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_2;
  v4[3] = &unk_1EA280C10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

void __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_setPitch:yaw:animated:", 1, *(double *)(a1 + 48) * 1.5, *(double *)(a1 + 56) * 1.75);
  v2 = dispatch_time(0, 500000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_3;
  v4[3] = &unk_1EA2800F8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

void __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_setPitch:yaw:animated:", 1, 0.0, 0.0);
  v2 = dispatch_time(0, 600000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_4;
  v4[3] = &unk_1EA2800F8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

uint64_t __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t result;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setGrayscale:", 0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)nudgeInDirection:(unint64_t)a3 smallNudgePeak:(id)a4 largeNudgePeak:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  NSObject *v24;
  id v25;
  id v26;
  unint64_t v27;
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  _BKUILoggingFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v30 = a3;
    _os_log_impl(&dword_1DB281000, v13, OS_LOG_TYPE_DEFAULT, "Nudging in direction %i", buf, 8u);
  }

  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  dispatch_group_enter(v14);
  v15 = MEMORY[0x1E0CEABB0];
  v16 = MEMORY[0x1E0C809B0];
  v27 = a3;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke;
  v28[3] = &unk_1EA27FB98;
  v28[4] = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2;
  v23[3] = &unk_1EA280D00;
  v23[4] = self;
  v24 = v14;
  v25 = v10;
  v26 = v11;
  v17 = v11;
  v18 = v10;
  v19 = v14;
  +[UIView bkui_animateWithDuration:animations:completion:](0.3, v15, v28, v23);
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_15;
  v21[3] = &unk_1EA2800F8;
  v21[4] = self;
  v22 = v12;
  v20 = v12;
  dispatch_group_notify(v19, MEMORY[0x1E0C80D38], v21);

}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, double, double);
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD, double, double);
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  _QWORD v20[5];
  void (**v21)(_QWORD, double, double);
  double v22;
  _QWORD v23[5];
  _QWORD aBlock[5];
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _QWORD v28[4];
  id v29;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "angleFromDirection:", *(_QWORD *)(a1 + 64));
  v3 = v2;
  v4 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_3;
  v28[3] = &unk_1EA27FB98;
  v5 = *(void **)(a1 + 32);
  v29 = *(id *)(a1 + 40);
  objc_msgSend(v5, "nudgeCrossHairsAtAngle:completion:", v28, v3);
  memset(&v27, 0, sizeof(v27));
  CGAffineTransformMakeRotation(&v27, -v3);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v26 = v27;
  objc_msgSend(v6, "setTransform:", &v26);
  aBlock[0] = v4;
  aBlock[1] = 3221225472;
  aBlock[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_4;
  aBlock[3] = &unk_1EA280C38;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v25 = v27;
  v7 = (void (**)(_QWORD, double, double))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  if (v9 != v10)
    __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2_cold_1();
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v7[2](v7, v9 * 0.375, v9 * 0.5);
  objc_msgSend(v11, "setCenter:");
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_5;
  v23[3] = &unk_1EA27FB98;
  v23[4] = *(_QWORD *)(a1 + 32);
  +[UIView bkui_animateWithDuration:animations:](0.3, MEMORY[0x1E0CEABB0], v23);
  v12 = MEMORY[0x1E0CEABB0];
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_6;
  v20[3] = &unk_1EA280C60;
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v7;
  v22 = v9;
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_7;
  v14[3] = &unk_1EA280CD8;
  v14[4] = *(_QWORD *)(a1 + 32);
  v16 = v21;
  v19 = v9;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  v13 = v21;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.5, 0.0, v12, 0x20000, v20, v14);

}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

double __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_4(uint64_t a1, double a2, double a3)
{
  CGFloat v4;
  CGFloat MidY;
  __int128 v6;
  double result;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  memset(&v15, 0, sizeof(v15));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4 = -CGRectGetMidX(v16);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  MidY = CGRectGetMidY(v17);
  CGAffineTransformMakeTranslation(&v15, v4, -MidY);
  memset(&v14, 0, sizeof(v14));
  v13 = v15;
  CGAffineTransformInvert(&v14, &v13);
  memset(&v13, 0, sizeof(v13));
  t1 = v15;
  v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&t2.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a1 + 72);
  CGAffineTransformConcat(&v12, &t1, &t2);
  t1 = v14;
  CGAffineTransformConcat(&v13, &v12, &t1);
  *(_QWORD *)&result = *(_OWORD *)&vaddq_f64(*(float64x2_t *)&v13.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v13.c, a3), *(float64x2_t *)&v13.a, a2));
  return result;
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.5);
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_6(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  (*(void (**)(_QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 48) * 0.5);
  return objc_msgSend(v1, "setCenter:");
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v2 = MEMORY[0x1E0CEABB0];
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_8;
  v9[3] = &unk_1EA280C88;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 72);
  v11 = *(id *)(a1 + 56);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_9;
  v4[3] = &unk_1EA280CB0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 72);
  v7 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.25, 0.0, v2, 0, v9, v4);

}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 56) * 7.0 * 0.0625, *(double *)(a1 + 56) * 0.5);
  objc_msgSend(v2, "setCenter:");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v2 = MEMORY[0x1E0CEABB0];
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_10;
  v9[3] = &unk_1EA280C60;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_11;
  v4[3] = &unk_1EA280CB0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.35, 0.0, v2, 0, v9, v4);

}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_10(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  (*(void (**)(_QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(double *)(a1 + 48) * 5.0 * 0.125, *(double *)(a1 + 48) * 0.5);
  return objc_msgSend(v1, "setCenter:");
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  v2 = MEMORY[0x1E0CEABB0];
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_12;
  v6[3] = &unk_1EA280C88;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_14;
  v4[3] = &unk_1EA27FC00;
  v5 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.75, 0.0, v2, 0, v6, v4);

}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_12(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 56) * 0.375, *(double *)(a1 + 56) * 0.5);
  objc_msgSend(v2, "setCenter:");
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_13;
  v4[3] = &unk_1EA27FB98;
  v4[4] = *(_QWORD *)(a1 + 32);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.2, 0.5, MEMORY[0x1E0CEABB0], 0, v4, 0);
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_14(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_16;
  v4[3] = &unk_1EA27FB98;
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_17;
  v3[3] = &unk_1EA27FC00;
  v3[4] = v5;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.2, 0.5, MEMORY[0x1E0CEABB0], 0, v4, v3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2_cold_1()
{
  __assert_rtn("-[BKUIPearlCrossHairsView nudgeInDirection:smallNudgePeak:largeNudgePeak:completion:]_block_invoke_2", "BKUIPearlCrossHairsView.m", 142, "sideLength == self.bounds.size.height");
}

@end
