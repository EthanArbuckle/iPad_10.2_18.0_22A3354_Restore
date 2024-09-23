@implementation NUNIAstronomyRotationModel

- (NUNIAstronomyRotationModel)init
{
  NUNIAstronomyRotationModel *v2;
  NUNIAstronomyRotationModel *v3;
  NUNIAstronomyRotationModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUNIAstronomyRotationModel;
  v2 = -[NUNIAstronomyRotationModel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_interactionSettings = (const NUNIAstronomyInteractionSettings *)&init_defaults;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NUNIAstronomyRotationModel stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)NUNIAstronomyRotationModel;
  -[NUNIAstronomyRotationModel dealloc](&v3, sel_dealloc);
}

- (BOOL)isAtHomeCoordinate
{
  NUNIRotatable **p_rotatable;
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;

  p_rotatable = &self->_rotatable;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(WeakRetained, "homeCoordinate");
  v5 = v4;
  v7 = v6;

  v8 = objc_loadWeakRetained((id *)p_rotatable);
  objc_msgSend(v8, "centerCoordinate");
  v10 = v9;
  v12 = v11;

  v13 = v5;
  v14 = v10;
  if (vabds_f32(v13, v14) >= 0.001)
    return 0;
  v15 = v7;
  v16 = v12;
  return vabds_f32(v15, v16) < 0.001;
}

- (void)stop
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_state = 0;
  *(_QWORD *)self->_accumulatedPushVector = 0;
  *(_QWORD *)&self->_effectivePushDeceleration = 0;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)_handleDisplayLink
{
  -[NUNIAstronomyRotationModel performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__update, 0, 0);
}

- (void)_update
{
  CFTimeInterval v3;
  float v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  const NUNIAstronomyInteractionSettings *v10;
  const NUNIAstronomyInteractionSettings *v11;
  float var1;
  float var0;
  float v14;
  float v15;
  float v16;
  float32x2_t v17;
  double v18;
  double v19;
  float var3;
  float var2;
  float v22;
  float v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  double v35;
  id v36;
  id v37;
  double v38;
  double v39;
  float64x2_t v40;
  int32x2_t v41;
  id v42;
  id v43;
  float64_t v44;
  float64_t v45;

  v3 = CACurrentMediaTime();
  v4 = v3 - self->_previousDisplayLinkCallbackTime;
  self->_previousDisplayLinkCallbackTime = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(WeakRetained, "centerCoordinate");
  v7 = v6;
  v9 = v8;

  v10 = -[NUNIAstronomyRotationModel interactionSettings](self, "interactionSettings");
  v11 = v10;
  var1 = v10[1].var1;
  if (var1 == 0.0)
  {
    var0 = v10[1].var0;
LABEL_9:
    self->_effectivePushDeceleration = var0;
    goto LABEL_10;
  }
  v14 = v3 - self->_pushStartTime;
  if (var1 >= v14)
    v15 = v3 - self->_pushStartTime;
  else
    v15 = v10[1].var1;
  var0 = self->_effectivePushDeceleration;
  v16 = v10[1].var0;
  if (var0 > v16 && v15 > 0.001)
  {
    var0 = 1.0 - powf(1.0 - v16, var1 / v15);
    goto LABEL_9;
  }
LABEL_10:
  v17 = vmul_n_f32(*(float32x2_t *)self->_accumulatedPushVector, var0);
  *(float32x2_t *)self->_accumulatedPushVector = v17;
  v18 = v7 + vmuls_lane_f32(v4, v17, 1);
  v19 = v9 + (float)(v4 * v17.f32[0]);
  if (self->_isPulling)
  {
    var3 = v11[1].var3;
    if (var3 == 0.0)
    {
      var2 = v11[1].var2;
    }
    else
    {
      v22 = v3 - self->_pullStartTime;
      if (var3 >= v22)
        v23 = v3 - self->_pullStartTime;
      else
        v23 = v11[1].var3;
      var2 = self->_effectivePullAcceleration;
      if (var2 >= v11[1].var2 || v23 <= 0.001)
        goto LABEL_20;
      var2 = powf(v11[1].var2, var3 / v23);
    }
    self->_effectivePullAcceleration = var2;
LABEL_20:
    v24 = var2;
    v18 = v18 - (v18 - self->_landingCoordinate.latitude) * v24;
    v19 = v19 - (v19 - self->_landingCoordinate.longitude) * v24;
  }
  v25 = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(v25, "homeCoordinate");
  v27 = v26;
  v29 = v28;

  v30 = _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(v18, v19, v27, v29);
  v32 = v31;
  v33 = v30;
  v34 = 80.0;
  if (v33 <= 80.0)
  {
    v34 = v33;
    if (v33 < -80.0)
      v34 = -80.0;
  }
  v35 = v34;
  v36 = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(v36, "setCenterCoordinate:", v35, v32);

  v37 = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(v37, "centerCoordinate");
  v44 = v39;
  v45 = v38;

  if (!self->_isPulling
    || (v40.f64[0] = v45,
        v40.f64[1] = v44,
        *(float32x2_t *)&v40.f64[0] = vsub_f32(vcvt_f32_f64(v40), vcvt_f32_f64((float64x2_t)self->_landingCoordinate)),
        sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(*(float32x2_t *)&v40, *(float32x2_t *)&v40).i32[1]), *(float *)v40.f64, *(float *)v40.f64)) < 0.1))
  {
    v41 = vcgt_f32((float32x2_t)vdup_n_s32(0x3DCCCCCDu), vabs_f32(*(float32x2_t *)self->_accumulatedPushVector));
    if ((v41.i32[0] & v41.i32[1] & 1) != 0)
    {
      if (self->_isPulling)
      {
        v42 = objc_loadWeakRetained((id *)&self->_rotatable);
        objc_msgSend(v42, "setCenterCoordinate:", v27, v29);

      }
      v43 = objc_loadWeakRetained((id *)&self->_observer);
      objc_msgSend(v43, "rotationModelStoppedByDecelerating:", self);

      -[NUNIAstronomyRotationModel stop](self, "stop");
    }
  }
}

- (void)push:(NUNIAstronomyRotationModel *)self
{
  float32x2_t v2;
  float32x2_t v3;
  const NUNIAstronomyInteractionSettings *v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t state;
  double latitude;
  double longitude;
  CADisplayLink *v15;
  CADisplayLink *displayLink;
  CADisplayLink *v17;
  void *v18;
  CLLocationDegrees v19;

  v3 = v2;
  v5 = -[NUNIAstronomyRotationModel interactionSettings](self, "interactionSettings");
  v6 = CACurrentMediaTime();
  self->_effectivePullAcceleration = v5[1].var2 * 0.01;
  *(float32x2_t *)self->_accumulatedPushVector = vadd_f32(*(float32x2_t *)self->_accumulatedPushVector, v3);
  self->_effectivePushDeceleration = 1.0;
  self->_pushStartTime = v6;
  self->_pullStartTime = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rotatable);
  objc_msgSend(WeakRetained, "homeCoordinate");
  v9 = v8;
  v11 = v10;

  state = self->_state;
  if (state == 1)
  {
    latitude = self->_landingCoordinate.latitude;
    longitude = self->_landingCoordinate.longitude;
  }
  else
  {
    latitude = v9;
    longitude = v11;
    if (!state)
    {
      objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__handleDisplayLink, v9, v11);
      v15 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v15;

      v17 = self->_displayLink;
      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v17, "addToRunLoop:forMode:", v18, *MEMORY[0x24BDBCB80]);

      self->_previousDisplayLinkCallbackTime = v6;
      self->_state = 1;
      latitude = v9;
      longitude = v11;
    }
  }
  self->_landingCoordinate.latitude = _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(latitude, longitude, v9, v11);
  self->_landingCoordinate.longitude = v19;
}

- (const)interactionSettings
{
  return self->_interactionSettings;
}

- (NUNIRotatable)rotatable
{
  return (NUNIRotatable *)objc_loadWeakRetained((id *)&self->_rotatable);
}

- (void)setRotatable:(id)a3
{
  objc_storeWeak((id *)&self->_rotatable, a3);
}

- (NUNIAstronomyRotationModelObserver)observer
{
  return (NUNIAstronomyRotationModelObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (BOOL)isPulling
{
  return self->_pulling;
}

- (void)setPulling:(BOOL)a3
{
  self->_pulling = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_rotatable);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
