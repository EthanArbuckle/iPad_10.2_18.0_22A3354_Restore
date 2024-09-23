@implementation ADMutableCameraCalibration

- (ADMutableCameraCalibration)init
{
  ADLensDistortionModel *v3;
  ADLensDistortionModel *distortionModel;

  if (self)
  {
    v3 = (ADLensDistortionModel *)objc_opt_new();
    distortionModel = self->super._distortionModel;
    self->super._distortionModel = v3;

  }
  return self;
}

- (__n128)setIntrinsicMatrix:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

- (void)setReferenceDimensions:(CGSize)a3
{
  self->super._referenceDimensions = a3;
}

- (__n128)setCameraToPlatformTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (void)setPixelSize:(float)a3
{
  self->super._pixelSize = a3;
}

- (void)setDistortionModel:(id)a3
{
  ADLensDistortionModel *v4;
  ADLensDistortionModel *distortionModel;

  v4 = (ADLensDistortionModel *)a3;
  if (!v4)
    v4 = (ADLensDistortionModel *)objc_opt_new();
  distortionModel = self->super._distortionModel;
  self->super._distortionModel = v4;

}

- (void)crop:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  float32x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double x;
  double y;

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  -[ADCameraCalibration referenceDimensions](self, "referenceDimensions");
  v7 = v6;
  v9 = v8;
  -[ADMutableCameraCalibration setReferenceDimensions:](self, "setReferenceDimensions:", width, height);
  -[ADCameraCalibration intrinsicMatrix](self, "intrinsicMatrix");
  v11.f64[0] = x;
  v11.f64[1] = y;
  -[ADMutableCameraCalibration setIntrinsicMatrix:](self, "setIntrinsicMatrix:", v12, v13, COERCE_DOUBLE(vcvt_f32_f64(vsubq_f64(vcvtq_f64_f32(v10), v11))));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ADCameraCalibration distortionModel](self, "distortionModel");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "crop:fromDimensions:", x, y, width, height, v7, v9);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("distortion model does not implement a crop method"), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    -[ADCameraCalibration distortionModel](self, "distortionModel");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "crop:", x, y, width, height);
  }

}

- (void)centerCrop:(CGSize)a3
{
  double height;
  double width;
  double v6;
  float v7;
  double v8;

  height = a3.height;
  width = a3.width;
  -[ADCameraCalibration referenceDimensions](self, "referenceDimensions");
  v7 = v6 - width;
  -[ADCameraCalibration referenceDimensions](self, "referenceDimensions");
  *(float *)&v8 = v8 - height;
  -[ADMutableCameraCalibration crop:](self, "crop:", (float)(v7 * 0.5), (float)(*(float *)&v8 * 0.5), width, height);
}

- (BOOL)scale:(CGSize)a3
{
  double v3;
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v11;
  float v12;
  void *v13;
  double v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  CGFloat v21;
  __int16 v22;
  CGFloat v23;
  uint64_t v24;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = self->super._referenceDimensions.width;
  v6 = self->super._referenceDimensions.height;
  v8 = fabs(v6 * a3.width - v7 * a3.height);
  v9 = a3.width * (v7 * 0.001);
  if (v8 > v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      v17 = v7;
      v18 = 2048;
      v19 = v6;
      v20 = 2048;
      v21 = width;
      v22 = 2048;
      v23 = height;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot scale camera calibration. referenceDimensions (%f, %f) has a different aspect ratio than requested dimensions (%f, %f)", buf, 0x2Au);
    }
  }
  else
  {
    *(float *)&v3 = a3.width / v7;
    self->super._referenceDimensions = a3;
    v11 = *(_OWORD *)&self->super._anon_10[32];
    v12 = *(float *)&self->super._anon_10[20] * *(float *)&v3;
    v15 = v3;
    *(float *)self->super._anon_10 = *(float *)self->super._anon_10 * *(float *)&v3;
    *(float *)&self->super._anon_10[20] = v12;
    *(_DWORD *)&self->super._anon_10[40] = DWORD2(v11);
    *(float32x2_t *)&self->super._anon_10[32] = vmul_n_f32(*(float32x2_t *)&v11, *(float *)&v3);
    -[ADCameraCalibration distortionModel](self, "distortionModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale:", v15);

    self->super._pixelSize = self->super._pixelSize / *(float *)&v15;
  }
  return v8 <= v9;
}

- (BOOL)adjustForImageRotation:(int64_t)a3
{
  int v5;
  int v6;
  float32x2_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  unsigned int v14;
  unsigned int v15;
  void *v21;
  double v22;
  double v23;
  double v24;
  float v25;
  __float2 v26;
  unint64_t v27;
  uint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  int v34;
  int v35;
  float64x2_t v36;
  __int128 v37;
  _OWORD v38[4];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  -[ADCameraCalibration intrinsicMatrix](self, "intrinsicMatrix");
  v34 = v5;
  v35 = v6;
  v36 = vcvtq_f64_f32(v7);
  -[ADCameraCalibration referenceDimensions](self, "referenceDimensions");
  v10 = rotateUVPoint(a3, v36.f64[0], v36.f64[1], v8, v9);
  v12 = v11 != *(double *)(MEMORY[0x24BDBEFB0] + 8) || v10 != *MEMORY[0x24BDBEFB0];
  if (v12)
  {
    LODWORD(v13) = 0;
    HIDWORD(v13) = v35;
    *(float *)&v14 = v10;
    *(float *)&v15 = v11;
    __asm { FMOV            V2.4S, #1.0 }
    -[ADMutableCameraCalibration setIntrinsicMatrix:](self, "setIntrinsicMatrix:", COERCE_DOUBLE((unint64_t)v34), v13, COERCE_DOUBLE(__PAIR64__(v15, v14)));
    -[ADCameraCalibration distortionModel](self, "distortionModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADCameraCalibration referenceDimensions](self, "referenceDimensions");
    objc_msgSend(v21, "adjustForImageRotation:forDimensions:", a3);

    -[ADCameraCalibration referenceDimensions](self, "referenceDimensions");
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v24 = v23;
    else
      v24 = v22;
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v23 = v22;
    -[ADMutableCameraCalibration setReferenceDimensions:](self, "setReferenceDimensions:", v24, v23);
    v25 = 0.0;
    if ((unint64_t)(a3 - 1) <= 2)
      v25 = flt_2363E1484[a3 - 1];
    v26 = __sincosf_stret(v25);
    *(float *)&v27 = v26.__cosval;
    *((float *)&v27 + 1) = -v26.__sinval;
    v37 = v27;
    -[ADCameraCalibration cameraToPlatformTransform](self, "cameraToPlatformTransform");
    v28 = 0;
    v29.i32[3] = 0;
    v30.i32[3] = 0;
    v31.i32[3] = 0;
    v32.i32[3] = 1.0;
    v38[0] = v37;
    v38[1] = (unint64_t)v26;
    v38[2] = xmmword_2363DF690;
    v38[3] = xmmword_2363DF6A0;
    do
    {
      *(__int128 *)((char *)&v39 + v28 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(v38[v28])), v30, *(float32x2_t *)&v38[v28], 1), v31, (float32x4_t)v38[v28], 2), v32, (float32x4_t)v38[v28], 3);
      ++v28;
    }
    while (v28 != 4);
    -[ADMutableCameraCalibration setCameraToPlatformTransform:](self, "setCameraToPlatformTransform:", *(double *)&v39, *(double *)&v40, *(double *)&v41, *(double *)&v42);
  }
  return v12;
}

+ (id)new
{
  return objc_alloc_init(ADMutableCameraCalibration);
}

@end
