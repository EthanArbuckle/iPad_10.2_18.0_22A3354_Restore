@implementation NUDebugRenderView

- (NUDebugRenderView)initWithFrame:(CGRect)a3
{
  NUDebugRenderView *v3;
  uint64_t v4;
  UILongPressGestureRecognizer *doubleTap;
  NUDebugRenderView *v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUDebugRenderView;
  v3 = -[NURenderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v3, sel__debugToggle_);
    doubleTap = v3->_doubleTap;
    v3->_doubleTap = (UILongPressGestureRecognizer *)v4;

    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v3->_doubleTap, "setNumberOfTouchesRequired:", 3);
    -[NUDebugRenderView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_doubleTap);
    if (objc_msgSend(MEMORY[0x24BE6C3A0], "isViewDebugEnabled"))
    {
      v8.receiver = v3;
      v8.super_class = (Class)NUDebugRenderView;
      -[NURenderView setDebugMode:](&v8, sel_setDebugMode_, 1);
    }
    v6 = v3;
  }

  return v3;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUDebugRenderView;
  -[NUDebugRenderView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUDebugRenderView;
  -[NUDebugRenderView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  objc_super v3;

  -[NUDebugRenderView _stopDeviceMotion](self, "_stopDeviceMotion");
  v3.receiver = self;
  v3.super_class = (Class)NUDebugRenderView;
  -[NUDebugRenderView dealloc](&v3, sel_dealloc);
}

- (void)setDebugMode:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  if (self->_showDebug != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)NUDebugRenderView;
    -[NURenderView setDebugMode:](&v8, sel_setDebugMode_);
    self->_showDebug = a3;
    -[NURenderView _roiLayer](self, "_roiLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_showDebug)
    {
      objc_msgSend(v5, "setBorderWidth:", 2.0);
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

      -[NUDebugRenderView _startDeviceMotion](self, "_startDeviceMotion");
      -[NUDebugRenderView _setupDeviceMotion](self, "_setupDeviceMotion");
    }
    else
    {
      -[NUDebugRenderView _stopDeviceMotion](self, "_stopDeviceMotion");
      objc_msgSend(v6, "setBorderWidth:", 0.0);
      -[NUDebugRenderView _resetOrientation:](self, "_resetOrientation:", 0);
    }

  }
}

- (BOOL)debugMode
{
  return self->_showDebug;
}

- (void)_debugToggle:(id)a3
{
  _BOOL4 showDebug;

  showDebug = self->_showDebug;
  if (objc_msgSend(a3, "state") == 1)
    -[NUDebugRenderView setDebugMode:](self, "setDebugMode:", !showDebug);
}

- (void)_orientWithX:(double)a3 andY:(double)a4
{
  double Width;
  double Height;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGFloat m34;
  void *v16;
  void *v17;
  CATransform3D v18;
  CATransform3D v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGFloat m33;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[NUDebugRenderView bounds](self, "bounds");
  Width = CGRectGetWidth(v28);
  -[NUDebugRenderView bounds](self, "bounds");
  Height = CGRectGetHeight(v29);
  if (Width >= Height)
    Height = Width;
  v9 = -1.0 / Height;
  -[NUDebugRenderView bounds](self, "bounds");
  v10 = CGRectGetWidth(v30);
  -[NUDebugRenderView bounds](self, "bounds");
  v11 = CGRectGetHeight(v31);
  if (v10 >= v11)
    v11 = v10;
  v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  *(_OWORD *)&v18.m23 = v12;
  *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v18.m33 = *(CGFloat *)(MEMORY[0x24BDE5598] + 80);
  v13 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v18.m11 = *MEMORY[0x24BDE5598];
  *(_OWORD *)&v18.m13 = v13;
  v18.m34 = v9;
  v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  *(_OWORD *)&v18.m43 = v14;
  CATransform3DTranslate(&v19, &v18, 0.0, 0.0, -v11);
  v24 = *(_OWORD *)&v19.m21;
  v25 = *(_OWORD *)&v19.m23;
  v26 = *(_OWORD *)&v19.m31;
  m33 = v19.m33;
  v22 = *(_OWORD *)&v19.m11;
  v23 = *(_OWORD *)&v19.m13;
  v20 = *(_OWORD *)&v19.m41;
  v21 = *(_OWORD *)&v19.m43;
  v18 = v19;
  CATransform3DRotate(&v19, &v18, a3, 0.0, 1.0, 0.0);
  v24 = *(_OWORD *)&v19.m21;
  v25 = *(_OWORD *)&v19.m23;
  v26 = *(_OWORD *)&v19.m31;
  m33 = v19.m33;
  v22 = *(_OWORD *)&v19.m11;
  v23 = *(_OWORD *)&v19.m13;
  v20 = *(_OWORD *)&v19.m41;
  v21 = *(_OWORD *)&v19.m43;
  v18 = v19;
  CATransform3DRotate(&v19, &v18, a4, 1.0, 0.0, 0.0);
  v24 = *(_OWORD *)&v19.m21;
  v25 = *(_OWORD *)&v19.m23;
  v26 = *(_OWORD *)&v19.m31;
  m33 = v19.m33;
  v22 = *(_OWORD *)&v19.m11;
  v23 = *(_OWORD *)&v19.m13;
  m34 = v19.m34;
  v20 = *(_OWORD *)&v19.m41;
  v21 = *(_OWORD *)&v19.m43;
  -[NURenderView _roiLayer](self, "_roiLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setZPosition:", 200.0);

  -[NURenderView _containerLayer](self, "_containerLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v19.m21 = v24;
  *(_OWORD *)&v19.m23 = v25;
  *(_OWORD *)&v19.m31 = v26;
  v19.m33 = m33;
  *(_OWORD *)&v19.m11 = v22;
  *(_OWORD *)&v19.m13 = v23;
  v19.m34 = m34;
  *(_OWORD *)&v19.m41 = v20;
  *(_OWORD *)&v19.m43 = v21;
  objc_msgSend(v17, "setSublayerTransform:", &v19);

}

- (void)_resetOrientation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[8];

  objc_msgSend(MEMORY[0x24BDE57D8], "begin", a3);
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.25);
  v4 = (void *)MEMORY[0x24BDE57D8];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimationTimingFunction:", v5);

  -[NURenderView _containerLayer](self, "_containerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v11[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v11[5] = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v11[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v11[7] = v8;
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v11[0] = *MEMORY[0x24BDE5598];
  v11[1] = v9;
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v11[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v11[3] = v10;
  objc_msgSend(v6, "setSublayerTransform:", v11);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)_startDeviceMotion
{
  CMMotionManager *v3;
  CMMotionManager *motionManager;

  v3 = (CMMotionManager *)objc_alloc_init(MEMORY[0x24BDC1400]);
  motionManager = self->_motionManager;
  self->_motionManager = v3;

  -[CMMotionManager setShowsDeviceMovementDisplay:](self->_motionManager, "setShowsDeviceMovementDisplay:", 1);
  -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.0166666667);
}

- (void)_stopDeviceMotion
{
  CMMotionManager *motionManager;

  -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
  motionManager = self->_motionManager;
  self->_motionManager = 0;

}

- (void)_setupDeviceMotion
{
  CMMotionManager *motionManager;
  void *v4;
  _QWORD v5[6];
  id v6;
  __int128 v7;
  id location;
  _QWORD v9[4];
  _QWORD v10[4];

  if (-[CMMotionManager isDeviceMotionAvailable](self->_motionManager, "isDeviceMotionAvailable"))
  {
    -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.0166666667);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    objc_initWeak(&location, self);
    motionManager = self->_motionManager;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __39__NUDebugRenderView__setupDeviceMotion__block_invoke;
    v5[3] = &unk_24C625A60;
    v5[4] = v10;
    v5[5] = v9;
    objc_copyWeak(&v6, &location);
    v7 = xmmword_20D1D46A0;
    -[CMMotionManager startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:](motionManager, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", 2, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(v10, 8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_doubleTap, 0);
}

void __39__NUDebugRenderView__setupDeviceMotion__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4;
  double v5;
  id WeakRetained;

  if (!a3)
  {
    objc_msgSend(a2, "rotationRate");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                - v4 * 0.1;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + v5 * 0.1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_orientWithX:andY:", *(double *)(a1 + 56) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(double *)(a1 + 64) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

  }
}

@end
