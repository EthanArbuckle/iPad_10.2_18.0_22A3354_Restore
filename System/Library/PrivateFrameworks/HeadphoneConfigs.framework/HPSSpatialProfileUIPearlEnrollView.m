@implementation HPSSpatialProfileUIPearlEnrollView

- (id)crossHairs
{
  HPSSpatialProfileCrossHairs *enrollmentCustomCrossHairs;
  HPSSpatialProfileCrossHairs *v4;
  HPSSpatialProfileCrossHairs *v5;
  HPSSpatialProfileCrossHairs *v6;

  enrollmentCustomCrossHairs = self->_enrollmentCustomCrossHairs;
  if (!enrollmentCustomCrossHairs)
  {
    v4 = [HPSSpatialProfileCrossHairs alloc];
    v5 = -[HPSSpatialProfileCrossHairs initWithView:view:](v4, "initWithView:view:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_enrollmentCustomCrossHairs;
    self->_enrollmentCustomCrossHairs = v5;

    enrollmentCustomCrossHairs = self->_enrollmentCustomCrossHairs;
  }
  return enrollmentCustomCrossHairs;
}

- (HPSSpatialProfileUIPearlEnrollView)initWithVideoCaptureSession:(id)a3 inSheet:(BOOL)a4 squareNeedsPositionLayout:(BOOL)a5
{
  HPSSpatialProfileUIPearlEnrollView *v5;
  HPSSpatialProfileUIPearlEnrollView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileUIPearlEnrollView;
  v5 = -[BKUIPearlEnrollView initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:](&v8, sel_initWithVideoCaptureSession_inSheet_squareNeedsPositionLayout_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[HPSSpatialProfileUIPearlEnrollView setPauseBlur:](v5, "setPauseBlur:", 0);
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
    v15 = -[HPSSpatialProfileUIPearlEnrollView pauseBlur](self, "pauseBlur");
    v16 = 1024;
    v17 = -[HPSSpatialProfileUIPearlEnrollView forceBlur](self, "forceBlur");
    v18 = 2048;
    v19 = a3;
    v20 = 2048;
    v21 = a5;
    _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Set Camera Blur Blurring paused %d, Blurring forced %d, Requested Blur %f duration = %f ", buf, 0x22u);
  }

  if (a3 == 0.0 && -[HPSSpatialProfileUIPearlEnrollView forceBlur](self, "forceBlur"))
  {
    LODWORD(v7) = 0;
    a3 = 15.0;
  }
  else if (a3 == 0.0)
  {
    goto LABEL_9;
  }
  v12 = -[HPSSpatialProfileUIPearlEnrollView pauseBlur](self, "pauseBlur");
  v7 = v7 & !v12;
  if (v12)
    a3 = 0.0;
LABEL_9:
  v13.receiver = self;
  v13.super_class = (Class)HPSSpatialProfileUIPearlEnrollView;
  -[BKUIPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](&v13, sel_setCameraBlurAmount_useShade_duration_completion_, v7, v10, a3, a5);

}

- (void)nudgeLeft:(id)a3
{
  -[HPSSpatialProfileCrossHairs nudgeCustomDirection:completion:](self->_enrollmentCustomCrossHairs, "nudgeCustomDirection:completion:", 4, a3);
}

- (void)nudgeRight:(id)a3
{
  -[HPSSpatialProfileCrossHairs nudgeCustomDirection:completion:](self->_enrollmentCustomCrossHairs, "nudgeCustomDirection:completion:", 0, a3);
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
