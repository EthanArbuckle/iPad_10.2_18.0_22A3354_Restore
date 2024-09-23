@implementation VCCameraAnimator

- (BOOL)animating
{
  return self->_animation.duration > 0.0;
}

- (float)duration
{
  return self->_animation.duration;
}

- (VCCameraAnimator)init
{
  VCCameraAnimator *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VCCameraAnimator;
  v2 = -[VCCameraAnimator init](&v4, sel_init);
  -[VCCameraAnimator configureWithPreset:](v2, "configureWithPreset:", 0);
  -[VCCameraAnimator reset](v2, "reset");
  return v2;
}

- (void)startAtTime:(id *)a3 withCamera:(id)a4
{
  id v7;
  VCCamera *v8;
  VCCamera *animatedCamera;
  __int128 v10;
  float v11;
  float v12;
  float v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float v20;
  __int128 v21;
  id v22;

  v7 = a4;
  objc_storeStrong((id *)&self->_targetCamera, a4);
  v8 = (VCCamera *)objc_msgSend(v7, "copy");
  animatedCamera = self->_animatedCamera;
  self->_animatedCamera = v8;

  v10 = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = a3->var3;
  *(_OWORD *)&self->_currentTime.value = v10;
  v22 = v7;
  objc_msgSend(v22, "rotation");
  self->_animation.targetValue.arr[0] = v11;
  objc_msgSend(v22, "rotation");
  self->_animation.targetValue.arr[1] = v12;
  objc_msgSend(v22, "rotation");
  self->_animation.targetValue.arr[2] = v13;
  objc_msgSend(v22, "focalLength");
  v15 = v14;
  objc_msgSend(v22, "sensorSize");
  self->_animation.targetValue.arr[3] = vdiv_f32(v15, v16).f32[0];
  objc_msgSend(v22, "focalLength");
  v18 = v17;
  objc_msgSend(v22, "sensorSize");
  self->_animation.targetValue.arr[4] = COERCE_FLOAT(vdiv_f32(v18, v19).i32[1]);
  objc_msgSend(v22, "zoomFactor");
  self->_animation.targetValue.arr[5] = v20;

  v21 = *(_OWORD *)&self->_animation.targetValue.arr[2];
  *(_OWORD *)self->_animation.currValue.arr = *(_OWORD *)self->_animation.targetValue.arr;
  *(_OWORD *)&self->_animation.currValue.arr[2] = v21;
  *(_OWORD *)&self->_animation.currValue.arr[4] = *(_OWORD *)&self->_animation.targetValue.arr[4];
  *(_OWORD *)self->_animation.velocity.arr = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[2] = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[4] = 0u;
  self->_animation.duration = 0.0;

}

- (void)updateToTime:(id *)a3
{
  CMTime *p_currentTime;
  double Seconds;
  float v7;
  VCCamera *v8;
  float v9;
  float v10;
  float v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float v18;
  double v19;
  double v20;
  __n128 v21;
  VCCamera *v22;
  unsigned int v23;
  unsigned int v24;
  float64x2_t v25;
  double v26;
  __int128 v27;
  double v28;
  unsigned int v29;
  double v30;
  CMTime v31;
  CMTime time;

  if ((self->_currentTime.flags & 1) != 0)
  {
    p_currentTime = (CMTime *)&self->_currentTime;
    time = *(CMTime *)a3;
    Seconds = CMTimeGetSeconds(&time);
    v31 = *p_currentTime;
    v7 = Seconds - CMTimeGetSeconds(&v31);
    if (v7 > 0.0)
    {
      v8 = self->_targetCamera;
      -[VCCamera rotation](v8, "rotation");
      self->_animation.targetValue.arr[0] = v9;
      -[VCCamera rotation](v8, "rotation");
      self->_animation.targetValue.arr[1] = v10;
      -[VCCamera rotation](v8, "rotation");
      self->_animation.targetValue.arr[2] = v11;
      -[VCCamera focalLength](v8, "focalLength");
      v13 = v12;
      -[VCCamera sensorSize](v8, "sensorSize");
      self->_animation.targetValue.arr[3] = vdiv_f32(v13, v14).f32[0];
      -[VCCamera focalLength](v8, "focalLength");
      v16 = v15;
      -[VCCamera sensorSize](v8, "sensorSize");
      self->_animation.targetValue.arr[4] = COERCE_FLOAT(vdiv_f32(v16, v17).i32[1]);
      -[VCCamera zoomFactor](v8, "zoomFactor");
      self->_animation.targetValue.arr[5] = v18;

      SpringAnimation<double,6ul>::update((uint64_t)&self->_animation, v7, v19, v20, v21);
      v22 = self->_animatedCamera;
      -[VCCamera setRotation:](v22, "setRotation:", COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr)));
      v30 = self->_animation.currValue.arr[3];
      -[VCCamera sensorSize](v22, "sensorSize");
      v29 = v23;
      v28 = self->_animation.currValue.arr[4];
      -[VCCamera sensorSize](v22, "sensorSize");
      v25.f64[0] = v30;
      v25.f64[1] = v28;
      -[VCCamera setFocalLength:](v22, "setFocalLength:", COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v25, vcvtq_f64_f32((float32x2_t)__PAIR64__(v24, v29))))));
      v26 = self->_animation.currValue.arr[5];
      *(float *)&v26 = v26;
      -[VCCamera setZoomFactor:](v22, "setZoomFactor:", v26);

      v27 = *(_OWORD *)&a3->var0;
      p_currentTime->epoch = a3->var3;
      *(_OWORD *)&p_currentTime->value = v27;
    }
  }
}

- (void)reset
{
  VCCamera *targetCamera;
  VCCamera *animatedCamera;
  __int128 v5;

  targetCamera = self->_targetCamera;
  self->_targetCamera = 0;

  animatedCamera = self->_animatedCamera;
  self->_animatedCamera = 0;

  self->_currentTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v5 = *(_OWORD *)&self->_animation.targetValue.arr[2];
  *(_OWORD *)self->_animation.currValue.arr = *(_OWORD *)self->_animation.targetValue.arr;
  *(_OWORD *)&self->_animation.currValue.arr[2] = v5;
  *(_OWORD *)&self->_animation.currValue.arr[4] = *(_OWORD *)&self->_animation.targetValue.arr[4];
  *(_OWORD *)self->_animation.velocity.arr = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[2] = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[4] = 0u;
  self->_animation.duration = 0.0;
}

- (void)interrupt
{
  VCCamera *v3;
  unsigned int v4;
  unsigned int v5;
  float64x2_t v6;
  double v7;
  VCCamera *v8;
  unsigned int v9;
  unsigned int v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  double v17;
  double v18;

  v3 = self->_targetCamera;
  -[VCCamera setRotation:](v3, "setRotation:", COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr)));
  v17 = self->_animation.currValue.arr[3];
  -[VCCamera sensorSize](v3, "sensorSize");
  v15 = v4;
  v13 = self->_animation.currValue.arr[4];
  -[VCCamera sensorSize](v3, "sensorSize");
  v6.f64[0] = v17;
  v6.f64[1] = v13;
  -[VCCamera setFocalLength:](v3, "setFocalLength:", COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v6, vcvtq_f64_f32((float32x2_t)__PAIR64__(v5, v15))))));
  v7 = self->_animation.currValue.arr[5];
  *(float *)&v7 = v7;
  -[VCCamera setZoomFactor:](v3, "setZoomFactor:", v7);

  v8 = self->_animatedCamera;
  -[VCCamera setRotation:](v8, "setRotation:", COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr)));
  v18 = self->_animation.currValue.arr[3];
  -[VCCamera sensorSize](v8, "sensorSize");
  v16 = v9;
  v14 = self->_animation.currValue.arr[4];
  -[VCCamera sensorSize](v8, "sensorSize");
  v11.f64[0] = v18;
  v11.f64[1] = v14;
  -[VCCamera setFocalLength:](v8, "setFocalLength:", COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v11, vcvtq_f64_f32((float32x2_t)__PAIR64__(v10, v16))))));
  v12 = self->_animation.currValue.arr[5];
  *(float *)&v12 = v12;
  -[VCCamera setZoomFactor:](v8, "setZoomFactor:", v12);

  self->_animation.duration = 0.0;
}

- (void)stop
{
  VCCamera *v3;
  unsigned int v4;
  unsigned int v5;
  float64x2_t v6;
  double v7;
  VCCamera *v8;
  unsigned int v9;
  unsigned int v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  double v17;
  double v18;

  v3 = self->_targetCamera;
  -[VCCamera setRotation:](v3, "setRotation:", COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr)));
  v17 = self->_animation.currValue.arr[3];
  -[VCCamera sensorSize](v3, "sensorSize");
  v15 = v4;
  v13 = self->_animation.currValue.arr[4];
  -[VCCamera sensorSize](v3, "sensorSize");
  v6.f64[0] = v17;
  v6.f64[1] = v13;
  -[VCCamera setFocalLength:](v3, "setFocalLength:", COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v6, vcvtq_f64_f32((float32x2_t)__PAIR64__(v5, v15))))));
  v7 = self->_animation.currValue.arr[5];
  *(float *)&v7 = v7;
  -[VCCamera setZoomFactor:](v3, "setZoomFactor:", v7);

  v8 = self->_animatedCamera;
  -[VCCamera setRotation:](v8, "setRotation:", COERCE_DOUBLE(vcvt_f32_f64(*(float64x2_t *)self->_animation.currValue.arr)));
  v18 = self->_animation.currValue.arr[3];
  -[VCCamera sensorSize](v8, "sensorSize");
  v16 = v9;
  v14 = self->_animation.currValue.arr[4];
  -[VCCamera sensorSize](v8, "sensorSize");
  v11.f64[0] = v18;
  v11.f64[1] = v14;
  -[VCCamera setFocalLength:](v8, "setFocalLength:", COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v11, vcvtq_f64_f32((float32x2_t)__PAIR64__(v10, v16))))));
  v12 = self->_animation.currValue.arr[5];
  *(float *)&v12 = v12;
  -[VCCamera setZoomFactor:](v8, "setZoomFactor:", v12);

  self->_animation.duration = 0.0;
  *(_OWORD *)self->_animation.velocity.arr = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[2] = 0u;
  *(_OWORD *)&self->_animation.velocity.arr[4] = 0u;
}

- (VCCamera)targetCamera
{
  return self->_targetCamera;
}

- (VCCamera)animatedCamera
{
  return self->_animatedCamera;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedCamera, 0);
  objc_storeStrong((id *)&self->_targetCamera, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)configureWithPreset:(unint64_t)a3
{
  double v3;

  if (a3 <= 2)
  {
    v3 = dbl_1D4E43E30[a3];
    *(_QWORD *)&self->_animation.stiffness = qword_1D4E43E18[a3];
    self->_animation.mass = v3;
    self->_animation.dampRatio = 1.0;
  }
}

@end
