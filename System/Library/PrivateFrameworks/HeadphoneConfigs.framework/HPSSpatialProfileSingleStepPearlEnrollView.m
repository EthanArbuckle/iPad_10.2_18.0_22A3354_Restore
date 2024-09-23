@implementation HPSSpatialProfileSingleStepPearlEnrollView

- (id)crossHairs
{
  HPSSpatialProfileSingleStepCrossHairs *enrollmentCustomCrossHairs;
  HPSSpatialProfileSingleStepCrossHairs *v4;
  HPSSpatialProfileSingleStepCrossHairs *v5;
  HPSSpatialProfileSingleStepCrossHairs *v6;

  enrollmentCustomCrossHairs = self->_enrollmentCustomCrossHairs;
  if (!enrollmentCustomCrossHairs)
  {
    v4 = [HPSSpatialProfileSingleStepCrossHairs alloc];
    v5 = -[HPSSpatialProfileSingleStepCrossHairs initWithView:view:](v4, "initWithView:view:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_enrollmentCustomCrossHairs;
    self->_enrollmentCustomCrossHairs = v5;

    enrollmentCustomCrossHairs = self->_enrollmentCustomCrossHairs;
  }
  return enrollmentCustomCrossHairs;
}

- (HPSSpatialProfileSingleStepPearlEnrollView)initWithVideoCaptureSession:(id)a3 inSheet:(BOOL)a4 squareNeedsPositionLayout:(BOOL)a5
{
  HPSSpatialProfileSingleStepPearlEnrollView *v5;
  HPSSpatialProfileSingleStepPearlEnrollView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  v5 = -[BKUIPearlEnrollView initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:](&v8, sel_initWithVideoCaptureSession_inSheet_squareNeedsPositionLayout_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[HPSSpatialProfileSingleStepPearlEnrollView setPauseBlur:](v5, "setPauseBlur:", 0);
  return v6;
}

- (void)setCameraBlurAmount:(double)a3 useShade:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  uint64_t v7;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  objc_super v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v7 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  sharedBluetoothSettingsLogComponent();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v15 = -[HPSSpatialProfileSingleStepPearlEnrollView pauseBlur](self, "pauseBlur");
    v16 = 1024;
    v17 = -[HPSSpatialProfileSingleStepPearlEnrollView forceBlur](self, "forceBlur");
    v18 = 2048;
    v19 = a3;
    v20 = 2048;
    v21 = a5;
    _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Set Camera Blur Blurring paused %d, Blurring forced %d, Requested Blur %f duration = %f ", buf, 0x22u);
  }

  if (a3 == 0.0 && -[HPSSpatialProfileSingleStepPearlEnrollView forceBlur](self, "forceBlur"))
  {
    LODWORD(v7) = 0;
    a3 = 15.0;
  }
  else if (a3 == 0.0)
  {
    goto LABEL_9;
  }
  v12 = -[HPSSpatialProfileSingleStepPearlEnrollView pauseBlur](self, "pauseBlur");
  v7 = v7 & !v12;
  if (v12)
    a3 = 0.0;
LABEL_9:
  v13.receiver = self;
  v13.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  -[BKUIPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](&v13, sel_setCameraBlurAmount_useShade_duration_completion_, v7, v10, a3, a5);

}

- (void)nudgeLeft:(id)a3
{
  -[HPSSpatialProfileSingleStepCrossHairs nudgeCustomDirection:completion:](self->_enrollmentCustomCrossHairs, "nudgeCustomDirection:completion:", 4, a3);
}

- (void)nudgeRight:(id)a3
{
  -[HPSSpatialProfileSingleStepCrossHairs nudgeCustomDirection:completion:](self->_enrollmentCustomCrossHairs, "nudgeCustomDirection:completion:", 0, a3);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  HPSSpatialProfileSingleStepPearlMovieLoopView *v5;
  HPSSpatialProfileSingleStepPearlMovieLoopView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  if (_os_feature_enabled_impl())
  {
    -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      v5 = [HPSSpatialProfileSingleStepPearlMovieLoopView alloc];
      v6 = -[HPSSpatialProfileSingleStepPearlMovieLoopView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[BKUIPearlEnrollView setTutorialMovieView:](self, "setTutorialMovieView:", v6);

      -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollView setTutorialMovieView:](self, "setTutorialMovieView:", v7);

      -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSSpatialProfileSingleStepPearlEnrollView addSubview:](self, "addSubview:", v8);

      -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "load");

    }
  }
  -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 0);

  -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 0.0);

  v14.receiver = self;
  v14.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  -[BKUIPearlEnrollView layoutSubviews](&v14, sel_layoutSubviews);
}

- (void)setAlpha:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HPSSpatialProfileSingleStepPearlEnrollView;
  -[HPSSpatialProfileSingleStepPearlEnrollView setAlpha:](&v6, sel_setAlpha_);
  -[BKUIPearlEnrollView tutorialMovieView](self, "tutorialMovieView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

}

- (BOOL)faceCaptured
{
  return self->_faceCaptured;
}

- (void)setFaceCaptured:(BOOL)a3
{
  self->_faceCaptured = a3;
}

- (BOOL)pauseBlur
{
  return self->_pauseBlur;
}

- (void)setPauseBlur:(BOOL)a3
{
  self->_pauseBlur = a3;
}

- (BOOL)forceBlur
{
  return self->_forceBlur;
}

- (void)setForceBlur:(BOOL)a3
{
  self->_forceBlur = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentCustomCrossHairs, 0);
}

@end
