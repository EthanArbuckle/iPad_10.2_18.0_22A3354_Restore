@implementation NURenderView

- (NUImageGeometry)geometry
{
  return self->_geometry;
}

- (id)_containerLayer
{
  return self->_containerLayer;
}

- (id)_roiLayer
{
  return self->_roiLayer;
}

- (id)_backfillLayer
{
  return self->_backfillLayer;
}

- (void)setGeometry:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  NUImageGeometry *geometry;
  CGAffineTransform v17[2];
  CGRect v18;
  CGRect v19;

  v4 = a3;
  -[NURenderView geometry](self, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  objc_msgSend(v5, "size");
  if ((NUPixelSizeEqualToSize() & 1) == 0)
  {
    objc_msgSend(v4, "size");
    NUPixelSizeToCGSize();
    v7 = v6;
    v9 = v8;
    -[NURenderView window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 1.0;
    if (v11)
      objc_msgSend(v11, "scale", 1.0);
    v13 = 1.0 / v12;
    v14 = v7 * v13;
    v15 = v9 * v13;
    -[NURenderView setBounds:](self, "setBounds:", 0.0, 0.0, v14, v15);
    memset(&v17[1], 0, sizeof(CGAffineTransform));
    -[NURenderView transform](self, "transform");
    v17[0] = v17[1];
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v14;
    v18.size.height = v15;
    v19 = CGRectApplyAffineTransform(v18, v17);
    -[NURenderView setFrame:](self, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

  }
  geometry = self->_geometry;
  self->_geometry = (NUImageGeometry *)v4;

}

- (void)transitionToSize:(CGSize)a3 offset:(CGPoint)a4 duration:(double)a5 animationCurve:(id)a6 completion:(id)a7
{
  double y;
  double x;
  id v12;
  void (**v13)(_QWORD);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double v18;
  CGFloat v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  CATransform3D v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  CATransform3D v27;
  CATransform3D v28;
  double v29;
  double v30;
  CATransform3D v31;

  y = a4.y;
  x = a4.x;
  v12 = a6;
  v13 = (void (**)(_QWORD))a7;
  -[NURenderView frame](self, "frame");
  NUPixelSizeFromCGSize();
  NUPixelSizeFromCGSize();
  v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  *(_OWORD *)&v31.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  *(_OWORD *)&v31.m33 = v14;
  v15 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v31.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  *(_OWORD *)&v31.m43 = v15;
  v16 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v31.m11 = *MEMORY[0x24BDE5598];
  *(_OWORD *)&v31.m13 = v16;
  v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v31.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  *(_OWORD *)&v31.m23 = v17;
  if ((NUPixelSizeIsEmpty() & 1) == 0 && (NUPixelSizeIsEmpty() & 1) == 0)
  {
    NUScaleToFitSizeInSize();
    NUScaleToDouble();
    v19 = v18;
    -[NURenderView transform](self, "transform");
    v20 = 1.0;
    if (v30 != 0.0)
    {
      -[NURenderView transform](self, "transform", 1.0);
      v20 = v29;
    }
    CATransform3DMakeTranslation(&v31, x * (1.0 / v20), y * (1.0 / v20), 0.0);
    v27 = v31;
    CATransform3DScale(&v28, &v27, v19, v19, 1.0);
    v31 = v28;
  }
  if (a5 <= 0.0)
  {
    -[CALayer removeAllAnimations](self->_geometryAnimationLayer, "removeAllAnimations");
    v24 = v31;
    -[CALayer setSublayerTransform:](self->_geometryAnimationLayer, "setSublayerTransform:", &v24);
    if (v13)
      v13[2](v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("sublayerTransform"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDuration:", a5);
    objc_msgSend(v21, "setTimingFunction:", v12);
    v28 = v31;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setToValue:", v22);

    objc_msgSend(v21, "setRemovedOnCompletion:", 0);
    objc_msgSend(v21, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v21, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v23 = (void *)MEMORY[0x24BDE57D8];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __75__NURenderView_transitionToSize_offset_duration_animationCurve_completion___block_invoke;
    v25[3] = &unk_24C625A38;
    v26 = v13;
    objc_msgSend(v23, "setCompletionBlock:", v25);
    -[CALayer addAnimation:forKey:](self->_geometryAnimationLayer, "addAnimation:forKey:", v21, CFSTR("NUTransitionAnimationKey"));
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  }
}

- (NURenderView)initWithFrame:(CGRect)a3
{
  NURenderView *v3;
  NURenderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NURenderView;
  v3 = -[NURenderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _NUViewCommonInit(v3);
  return v4;
}

- (NURenderView)initWithCoder:(id)a3
{
  NURenderView *v3;
  NURenderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NURenderView;
  v3 = -[NURenderView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _NUViewCommonInit(v3);
  return v4;
}

- (BOOL)inLiveResize
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[NURenderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NURenderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[_NUContainerLayer setFrame:](self->_containerLayer, "setFrame:", v5, v7, v9, v11);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)renderFrameReachedTargetSize
{
  CALayer *geometryAnimationLayer;
  _BOOL4 v4;
  void *v5;
  _QWORD *v6;
  os_log_t *v7;
  void *v8;
  _BOOL4 transitionAnimationInFlight;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  CALayer *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  NSObject *v18;
  _OWORD v19[8];
  CATransform3D v20;
  uint8_t buf[4];
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[NURenderView frame](self, "frame");
  NUPixelSizeFromCGSize();
  geometryAnimationLayer = self->_geometryAnimationLayer;
  if (geometryAnimationLayer)
    -[CALayer sublayerTransform](geometryAnimationLayer, "sublayerTransform");
  else
    memset(&v20, 0, sizeof(v20));
  v4 = CATransform3DIsIdentity(&v20);
  -[CALayer animationForKey:](self->_geometryAnimationLayer, "animationForKey:", CFSTR("NUTransitionAnimationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (_QWORD *)MEMORY[0x24BE6C478];
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_593);
  v7 = (os_log_t *)MEMORY[0x24BE6C488];
  v8 = (void *)*MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    transitionAnimationInFlight = self->_transitionAnimationInFlight;
    v10 = v8;
    NSStringFromNUPixelSize();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v22 = transitionAnimationInFlight;
    v23 = 1024;
    v24 = v5 != 0;
    v25 = 1024;
    v26 = !v4;
    v27 = 2112;
    v28 = v11;
    _os_log_debug_impl(&dword_20D1BC000, v10, OS_LOG_TYPE_DEBUG, "-[NURenderView renderFrameReachedTargetSize] - transitionInFlight: %d   has animation: %d   hasSublayerTransform: %d   currentSize: %@", buf, 0x1Eu);

    if (v4)
    {
LABEL_8:
      if (!v5)
        return;
      goto LABEL_16;
    }
  }
  else if (v4)
  {
    goto LABEL_8;
  }
  if (*v6 != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_593);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_DEBUG, "-[NURenderView renderFrameReachedTargetSize] - removing sublayer transform", buf, 2u);
  }
  v13 = self->_geometryAnimationLayer;
  v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v19[5] = v14;
  v15 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v19[7] = v15;
  v16 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v19[0] = *MEMORY[0x24BDE5598];
  v19[1] = v16;
  v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v19[3] = v17;
  -[CALayer setSublayerTransform:](v13, "setSublayerTransform:", v19);
  if (v5)
  {
LABEL_16:
    if (self->_transitionAnimationInFlight)
    {
      self->_shouldRemoveAnimation = 1;
    }
    else
    {
      if (*v6 != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_593);
      v18 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_DEBUG, "-[NURenderView renderFrameReachedTargetSize] - removing transition", buf, 2u);
      }
      -[CALayer removeAnimationForKey:](self->_geometryAnimationLayer, "removeAnimationForKey:", CFSTR("NUTransitionAnimationKey"));
    }
  }
}

- (CGRect)convertRectToImage:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NURenderView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toLayer:", self->_containerLayer, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  _NUContainerLayer *containerLayer;
  CATransform3D v11;
  CATransform3D v12;

  objc_msgSend(a3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scale");
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v7 = v9;

  }
  memset(&v12, 0, sizeof(v12));
  CATransform3DMakeScale(&v12, 1.0 / v7, 1.0 / v7, 1.0);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  containerLayer = self->_containerLayer;
  v11 = v12;
  -[_NUContainerLayer setTransform:](containerLayer, "setTransform:", &v11);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)transitionToSize:(CGSize)a3 duration:(double)a4 animationCurve:(id)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  double v12;
  double v13;
  id v14;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v14 = a5;
  -[NURenderView frame](self, "frame");
  -[NURenderView transitionToSize:offset:duration:animationCurve:completion:](self, "transitionToSize:offset:duration:animationCurve:completion:", v14, v11, width, height, (v12 - width) * -0.5, (v13 - height) * -0.5, a4);

}

- (void)animationDidStart:(id)a3
{
  CALayer *geometryAnimationLayer;
  id v5;
  void *v6;
  int v7;

  geometryAnimationLayer = self->_geometryAnimationLayer;
  v5 = a3;
  -[CALayer animationForKey:](geometryAnimationLayer, "animationForKey:", CFSTR("NUTransitionAnimationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if (v7)
  {
    self->_transitionAnimationInFlight = 1;
    self->_shouldRemoveAnimation = 0;
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  CALayer *geometryAnimationLayer;
  id v7;
  void *v8;
  int v9;
  _QWORD *v10;
  os_log_t *v11;
  NSObject *v12;
  void *v14;
  NSObject *v15;
  _BOOL4 shouldRemoveAnimation;
  _DWORD v17[2];
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  geometryAnimationLayer = self->_geometryAnimationLayer;
  v7 = a3;
  -[CALayer animationForKey:](geometryAnimationLayer, "animationForKey:", CFSTR("NUTransitionAnimationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    v10 = (_QWORD *)MEMORY[0x24BE6C478];
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_593);
    v11 = (os_log_t *)MEMORY[0x24BE6C488];
    v12 = *MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      shouldRemoveAnimation = self->_shouldRemoveAnimation;
      v17[0] = 67109376;
      v17[1] = v4;
      v18 = 1024;
      v19 = shouldRemoveAnimation;
      _os_log_debug_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_DEBUG, "-[NURenderView animationDidStop:finished:] - finished: %d shouldRemoveAnimation: %d", (uint8_t *)v17, 0xEu);
    }
    self->_transitionAnimationInFlight = 0;
    if (self->_shouldRemoveAnimation && v4)
    {
      -[CALayer animationForKey:](self->_geometryAnimationLayer, "animationForKey:", CFSTR("NUTransitionAnimationKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (*v10 != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_593);
        v15 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v17[0]) = 0;
          _os_log_debug_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_DEBUG, "-[NURenderView animationDidStop:finished:] - removing transition", (uint8_t *)v17, 2u);
        }
        -[CALayer removeAnimationForKey:](self->_geometryAnimationLayer, "removeAnimationForKey:", CFSTR("NUTransitionAnimationKey"));
      }
    }
  }
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryAnimationLayer, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
  objc_storeStrong((id *)&self->_roiLayer, 0);
  objc_storeStrong((id *)&self->_backfillLayer, 0);
}

uint64_t __75__NURenderView_transitionToSize_offset_duration_animationCurve_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
