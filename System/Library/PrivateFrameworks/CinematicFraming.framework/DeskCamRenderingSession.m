@implementation DeskCamRenderingSession

- (DeskCamRenderingSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceType:(int)a5 isFrontFacingCamera:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  DeskCamRenderingSession *v12;
  int32x4_t *v13;
  int v14;
  int32x4_t *v15;
  objc_super v17;

  v6 = a6;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DeskCamRenderingSession;
  v12 = -[DeskCamRenderingSession init](&v17, sel_init);
  v13 = (int32x4_t *)v12;
  if (v12)
  {
    v12->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    objc_storeStrong((id *)&v12->_portType, a4);
    v13[2].i32[0] = a5;
    v13[1].i8[0] = v6;
    if (v6)
      v14 = 4;
    else
      v14 = 3;
    v13[1].i32[1] = v14;
    v13[7] = vdupq_n_s32(0x7FC00000u);
    v13[8].i64[0] = 0;
    -[int32x4_t _initializeMetal](v13, "_initializeMetal");
    v15 = v13;
  }

  return (DeskCamRenderingSession *)v13;
}

- (void)dealloc
{
  void *v3;
  __CVMetalTextureCache *metalTextureCacheRef;
  __CVMetalTextureCache *v5;
  objc_super v6;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commit");
  objc_msgSend(v3, "waitUntilCompleted");
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  metalTextureCacheRef = self->_metalTextureCacheRef;
  if (metalTextureCacheRef)
  {
    CVMetalTextureCacheFlush(metalTextureCacheRef, 0);
    v5 = self->_metalTextureCacheRef;
    if (v5)
      CFRelease(v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)DeskCamRenderingSession;
  -[DeskCamRenderingSession dealloc](&v6, sel_dealloc);
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
  -[DeskCamRenderingSession _initializeControls](self, "_initializeControls");
}

- (void)_initializeControls
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;

  -[DeskCamSessionOptions imageBlendingPercentage](self->_options, "imageBlendingPercentage");
  self->_imageBlendingControls.blendingPercentage = v3;
  -[DeskCamSessionOptions imageBlendingRadiusUpscaler](self->_options, "imageBlendingRadiusUpscaler");
  self->_imageBlendingControls.radiusUpscaler = v4;
  self->_imageBlurringControls.enabled = -[DeskCamSessionOptions imageBlurringEnabled](self->_options, "imageBlurringEnabled");
  self->_imageBlurringControls.size = -[DeskCamSessionOptions imageBlurringKernelSize](self->_options, "imageBlurringKernelSize");
  -[DeskCamSessionOptions imageBlurringSigma](self->_options, "imageBlurringSigma");
  self->_imageBlurringControls.sigma = v5;
  _resetGaussianWeights(self->_imageBlurringControls.size, self->_imageBlurringControls.weights, v5);
  self->_imageSharpeningControls.enabled = -[DeskCamSessionOptions imageSharpeningEnabled](self->_options, "imageSharpeningEnabled");
  self->_imageSharpeningControls.size = -[DeskCamSessionOptions imageSharpeningKernelSize](self->_options, "imageSharpeningKernelSize");
  -[DeskCamSessionOptions imageSharpeningSigma](self->_options, "imageSharpeningSigma");
  self->_imageSharpeningControls.sigma = v6;
  _resetGaussianWeights(self->_imageSharpeningControls.size, self->_imageSharpeningControls.weights, v6);
  -[DeskCamSessionOptions imageSharpeningAmount](self->_options, "imageSharpeningAmount");
  self->_imageSharpeningControls.amount = v7;
  self->_imageToneMappingControls.enabled = -[DeskCamSessionOptions imageToneMappingEnabled](self->_options, "imageToneMappingEnabled");
  -[DeskCamSessionOptions imageToneMappingExponent](self->_options, "imageToneMappingExponent");
  self->_imageToneMappingControls.exponent = v8;
  -[DeskCamSessionOptions imageToneMappingScaler](self->_options, "imageToneMappingScaler");
  self->_imageToneMappingControls.scaler = v9;
}

- (void)registerCameraCalibrationDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  float v18;
  float v19;
  _OWORD *v20;
  __int128 v21;
  id v22;
  _OWORD *v23;
  __int128 v24;
  id v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  int32x4_t v29;
  int32x4_t v30;
  __int128 v31;
  void *v32;
  id v33;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrixReferenceDimensions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Width"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  *(_DWORD *)&self->_anon_90[7] = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrixReferenceDimensions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Height"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  *(_DWORD *)&self->_anon_90[11] = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("X"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  *(_DWORD *)&self->_anon_90[79] = v13;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Y"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  *(_DWORD *)&self->_anon_90[83] = v16;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PixelSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  *(float *)&self->_anon_90[87] = v19 * v19;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCoefficients"));
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (_OWORD *)objc_msgSend(v33, "bytes");
  v21 = v20[1];
  *(_OWORD *)&self->_anon_90[127] = *v20;
  *(_OWORD *)&self->_anon_90[143] = v21;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InverseLensDistortionCoefficients"));
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (_OWORD *)objc_msgSend(v22, "bytes");
  v24 = v23[1];
  *(_OWORD *)&self->_anon_90[95] = *v23;
  *(_OWORD *)&self->_anon_90[111] = v24;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrix"));
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = (_OWORD *)objc_msgSend(v25, "bytes");
  v28 = v26[1];
  v27 = v26[2];
  *(_OWORD *)&self->_anon_90[23] = *v26;
  *(_OWORD *)&self->_anon_90[39] = v28;
  *(_OWORD *)&self->_anon_90[55] = v27;
  v29 = *(int32x4_t *)&self->_anon_90[23];
  v30 = *(int32x4_t *)&self->_anon_90[39];
  v31 = *(_OWORD *)&self->_anon_90[55];
  *(_DWORD *)&self->_anon_90[31] = v31;
  *(_DWORD *)&self->_anon_90[47] = DWORD1(v31);
  *(_QWORD *)&self->_anon_90[23] = vzip1q_s32(v29, v30).u64[0];
  *(_QWORD *)&self->_anon_90[39] = vtrn2q_s32(v29, v30).u64[0];
  *(_DWORD *)&self->_anon_90[63] = DWORD2(v31);
  *(_QWORD *)&self->_anon_90[55] = vzip1q_s32(vdupq_laneq_s32(v29, 2), vdupq_laneq_s32(v30, 2)).u64[0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DistortionCalibrationValidMaxRadiusInPixels"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  *(_DWORD *)&self->_anon_90[91] = objc_msgSend(v32, "intValue");
}

- (void)registerGravity:(DeskCamRenderingSession *)self
{
  float32x4_t v2;
  float32x4_t v3;
  uint32x4_t v4;
  uint32x4_t v6;
  float v7;
  int32x4_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float v11;
  float32x4_t v12;
  int32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float v18;
  float32x4_t v19;

  v3 = v2;
  v4 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v2), (int8x16_t)vcgezq_f32(v2)));
  v4.i32[3] = v4.i32[2];
  if ((vmaxvq_u32(v4) & 0x80000000) == 0)
  {
    v6 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)self->_gravity), (int8x16_t)vcgezq_f32(*(float32x4_t *)self->_gravity)));
    v6.i32[3] = v6.i32[2];
    if ((vmaxvq_u32(v6) & 0x80000000) != 0)
    {
      v13 = (int32x4_t)vmulq_f32(v3, v3);
      v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
      v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
      v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
      v12 = vmulq_n_f32(v3, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]);
    }
    else
    {
      v16 = v3;
      v19 = *(float32x4_t *)self->_gravity;
      -[DeskCamSessionOptions gravityVectorSmoothingAlpha](self->_options, "gravityVectorSmoothingAlpha");
      v18 = v7;
      v8 = (int32x4_t)vmulq_f32(v16, v16);
      v8.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v8, 2), vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1))).u32[0];
      v9 = vrsqrte_f32((float32x2_t)v8.u32[0]);
      v10 = vmul_f32(v9, vrsqrts_f32((float32x2_t)v8.u32[0], vmul_f32(v9, v9)));
      v17 = vmulq_n_f32(v16, vmul_f32(v10, vrsqrts_f32((float32x2_t)v8.u32[0], vmul_f32(v10, v10))).f32[0]);
      -[DeskCamSessionOptions gravityVectorSmoothingAlpha](self->_options, "gravityVectorSmoothingAlpha");
      v12 = vmlaq_n_f32(vmulq_n_f32(v17, 1.0 - v11), v19, v18);
    }
    *(float32x4_t *)self->_gravity = v12;
  }
}

- (void)registerCameraOrientation:(int)a3
{
  if ((a3 + 1) <= 1)
  {
    if (self->_isFrontFacingCamera)
      a3 = 4;
    else
      a3 = 3;
  }
  self->_cameraOrientation = a3;
}

- (void)registerOutputType:(int)a3
{
  self->_outputType = a3;
}

- (CGRect)_shiftFramingSpaceRectangleToExploitSensorSpace:(CGRect)a3
{
  double width;
  double x;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float v10;
  double height;
  double v12;
  float v13;
  float v14;
  double v15;
  double v16;
  float v17;
  double v18;
  float v19;
  int v20;
  float v21;
  float v22;
  unsigned int v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float v29;
  double y;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  unsigned int v40;
  float v41;
  unsigned int v42;
  CGRect result;

  if (self->_isFrontFacingCamera)
  {
    width = a3.size.width;
    x = a3.origin.x;
    v6 = (float)*(int *)&self->_anon_90[91];
    v7 = *(float32x2_t *)&self->_anon_90[79];
    v8.i32[0] = v7.i32[0];
    v8.f32[1] = v7.f32[1] + v6;
    v9 = vsub_f32(v8, v7);
    v10 = *(float *)&self->_anon_90[87] * vaddv_f32(vmul_f32(v9, v9));
    v36 = self->_framingSpaceRectangle.origin.x;
    height = self->_framingSpaceRectangle.size.height;
    v38 = self->_framingSpaceRectangle.size.width;
    v12 = COERCE_FLOAT(vmla_n_f32(v7, v9, 1.0/ (float)((float)((float)((float)self[232]+ (float)((float)((float)self[236]+ (float)((float)((float)self[240]+ (float)((float)((float)self[244]+ (float)((float)((float)self[248] + (float)((float)((float)self[252] + (float)((float)((float)self[256] + (float)((float)self[260] * v10)) * v10)) * v10)) * v10))* v10))* v10))* v10))* 0.01)+ 1.0)).i32[1])- height;
    -[DeskCamSessionOptions framingSpaceExtendPercentage](self->_options, "framingSpaceExtendPercentage");
    v13 = x + width * 0.5;
    v15 = width * v14;
    v16 = v13 - v15 * 0.5;
    v17 = v16;
    *(float *)&v15 = v15 + v16;
    v40 = LODWORD(v15);
    v41 = v17;
    v37 = height;
    v39 = v12;
    v18 = height + v12;
    v19 = 0.0;
    v20 = 30;
    v21 = -1000.0;
    while (vabds_f32(v19, v21) > 0.005)
    {
      v22 = (float)(v21 + v19) * 0.5;
      *(float *)&v23 = v18 + v22;
      v42 = v23;
      v24 = distortPoint((float32x2_t *)&self->_anon_90[7], (float32x2_t)__PAIR64__(v23, LODWORD(v41)));
      v25 = distortPoint((float32x2_t *)&self->_anon_90[7], (float32x2_t)__PAIR64__(v42, v40));
      v26 = *(float32x2_t *)&self->_anon_90[79];
      v27 = vsub_f32(v24, v26);
      v28 = vsub_f32(v25, v26);
      v29 = sqrtf(vaddv_f32(vmul_f32(v28, v28)));
      if (sqrtf(vaddv_f32(vmul_f32(v27, v27))) < v6 && v29 < v6)
      {
        v21 = (float)(v21 + v19) * 0.5;
        v22 = v19;
      }
      else
      {
        v19 = (float)(v21 + v19) * 0.5;
      }
      if (!--v20)
        goto LABEL_14;
    }
    v22 = v19;
LABEL_14:
    v32 = v39 + v22;
    y = self->_framingSpaceRectangle.origin.y;
    if (v32 > y)
    {
      self->_framingSpaceRectangle.origin.x = v36;
      self->_framingSpaceRectangle.origin.y = v32;
      y = v39 + v22;
      self->_framingSpaceRectangle.size.width = v38;
      self->_framingSpaceRectangle.size.height = v37;
    }
  }
  else
  {
    y = self->_framingSpaceRectangle.origin.y;
  }
  v33 = self->_framingSpaceRectangle.origin.x;
  v34 = self->_framingSpaceRectangle.size.width;
  v35 = self->_framingSpaceRectangle.size.height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = y;
  result.origin.x = v33;
  return result;
}

- (CGRect)_defaultFramingSpaceViewport:(float)a3
{
  double Width;
  int v6;
  int height;
  double MidX;
  double MidY;
  float v10;
  CGSize size;
  CGSize v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect result;

  -[DeskCamRenderingSession _framingSpaceRectangleLandscapeLeft](self, "_framingSpaceRectangleLandscapeLeft");
  self->_framingSpaceRectangle = v31;
  Width = CGRectGetWidth(v31);
  v6 = self->_outputDimensions.width;
  height = self->_outputDimensions.height;
  MidX = CGRectGetMidX(self->_framingSpaceRectangle);
  MidY = CGRectGetMidY(self->_framingSpaceRectangle);
  if (self->_isFrontFacingCamera && (self->_deviceType & 0xFFFFFFFE) == 2)
  {
    -[DeskCamSessionOptions framingSpaceScalingFactor](self->_options, "framingSpaceScalingFactor");
    size = self->_framingSpaceRectangle.size;
    __asm { FMOV            V3.2D, #0.5 }
    v17 = (CGSize)vmulq_n_f64((float64x2_t)size, v10);
    self->_framingSpaceRectangle.origin = (CGPoint)vmlsq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmlaq_f64((float64x2_t)self->_framingSpaceRectangle.origin, _Q3, (float64x2_t)size))), _Q3, (float64x2_t)v17);
    self->_framingSpaceRectangle.size = v17;
  }
  v18 = Width * a3;
  v19 = v18;
  v20 = MidX - v18 * 0.5;
  v21 = (float)(v18 / (float)((float)v6 / (float)height));
  v22 = MidY - v21 * 0.5;
  -[DeskCamRenderingSession _shiftFramingSpaceRectangleToExploitSensorSpace:](self, "_shiftFramingSpaceRectangleToExploitSensorSpace:", v20, v22, v18, v21);
  self->_framingSpaceRectangle.origin.x = v23;
  self->_framingSpaceRectangle.origin.y = v24;
  self->_framingSpaceRectangle.size.width = v25;
  self->_framingSpaceRectangle.size.height = v26;
  v27 = v20;
  v28 = v22;
  v29 = v19;
  v30 = v21;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)_framingSpaceRectangleLandscapeLeft
{
  double v2;
  double v3;
  float v4;
  float Width;
  double v6;
  float Height;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v2 = COERCE_FLOAT(*(_QWORD *)&self->_anon_90[7]);
  v3 = COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_anon_90[7]));
  v4 = (float)self->_outputDimensions.width / (float)self->_outputDimensions.height;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = v2;
  v14.size.height = v3;
  Width = CGRectGetWidth(v14);
  v6 = (float)(Width / v4);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v2;
  v15.size.height = v3;
  if (CGRectGetHeight(v15) < v6)
  {
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = v2;
    v16.size.height = v3;
    Height = CGRectGetHeight(v16);
    Width = v4 * Height;
    v6 = Height;
  }
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v2;
  v17.size.height = v3;
  v8 = Width;
  v9 = CGRectGetMidX(v17) - Width * 0.5;
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v2;
  v18.size.height = v3;
  v10 = CGRectGetMidY(v18) - v6 * 0.5;
  v11 = v9;
  v12 = v8;
  v13 = v6;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (int)processBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4
{
  void *v7;
  void *v8;
  int v9;
  int deviceType;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64x2_t v28;
  uint64_t v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  int64x2_t v35;
  uint64_t v36;
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  int64x2_t v40;
  uint64_t v41;
  _QWORD v42[3];
  _OWORD v43[29];
  _BYTE v44[8];
  id v45;
  id v46;
  _BYTE v47[8];
  id v48;
  id v49;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "computeCommandEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = 0;
  v45 = 0;
  v46 = 0;
  v9 = cachedTexturesFromPixelBuffer(a3, (uint64_t)v47, self->_metalTextureCacheRef);
  if (v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_13:
    v16 = 0;
    goto LABEL_10;
  }
  v9 = cachedTexturesFromPixelBuffer(a4, (uint64_t)v44, self->_metalTextureCacheRef);
  if (v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_13;
  }
  memset(v43, 0, sizeof(v43));
  -[DeskCamRenderingSession _undistortControls](self, "_undistortControls");
  deviceType = self->_deviceType;
  if ((deviceType - 2) >= 2)
  {
    if (deviceType == 1)
    {
      v16 = (id)qword_1EFEFC090;
      objc_msgSend(v8, "setComputePipelineState:", v16);
      objc_msgSend(v8, "setTexture:atIndex:", v48, 0);
      objc_msgSend(v8, "setTexture:atIndex:", v49, 1);
      objc_msgSend(v8, "setTexture:atIndex:", v45, 2);
      objc_msgSend(v8, "setTexture:atIndex:", v46, 3);
      objc_msgSend(v8, "setBytes:length:atIndex:", v43, 464, 0);
      objc_msgSend(v8, "setImageblockWidth:height:", 32, 32);
      v42[0] = objc_msgSend(v45, "width");
      v42[1] = objc_msgSend(v45, "height");
      v42[2] = 1;
      v40 = vdupq_n_s64(0x20uLL);
      v41 = 1;
      objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v42, &v40);
      goto LABEL_9;
    }
LABEL_8:
    v17 = (id)qword_1EFEFC0A0;
    objc_msgSend(v8, "setComputePipelineState:", v17);
    objc_msgSend(v8, "setTexture:atIndex:", v48, 0);
    objc_msgSend(v8, "setTexture:atIndex:", v49, 1);
    objc_msgSend(v8, "setTexture:atIndex:", self->_warpedRGBLowResTexture, 2);
    objc_msgSend(v8, "setBytes:length:atIndex:", v43, 464, 0);
    v18 = objc_msgSend(v17, "threadExecutionWidth");
    v19 = objc_msgSend(v17, "maxTotalThreadsPerThreadgroup");
    v20 = -[MTLTexture width](self->_warpedRGBLowResTexture, "width");
    v21 = -[MTLTexture height](self->_warpedRGBLowResTexture, "height");
    v34[0] = v20;
    v34[1] = v21;
    v34[2] = 1;
    v33[0] = v18;
    v33[1] = v19 / v18;
    v33[2] = 1;
    objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v34, v33);
    v22 = (id)qword_1EFEFC0B0;

    objc_msgSend(v8, "setComputePipelineState:", v22);
    objc_msgSend(v8, "setTexture:atIndex:", self->_warpedRGBLowResTexture, 0);
    objc_msgSend(v8, "setTexture:atIndex:", self->_blurredRGBLowResTexture, 1);
    objc_msgSend(v8, "setBytes:length:atIndex:", &self->_imageBlurringControls, 1036, 0);
    v23 = objc_msgSend(v22, "threadExecutionWidth");
    v24 = objc_msgSend(v22, "maxTotalThreadsPerThreadgroup");
    v25 = -[MTLTexture width](self->_blurredRGBLowResTexture, "width");
    v26 = -[MTLTexture height](self->_blurredRGBLowResTexture, "height");
    v32[0] = v25;
    v32[1] = v26;
    v32[2] = 1;
    v31[0] = v23;
    v31[1] = v24 / v23;
    v31[2] = 1;
    objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v32, v31);
    v16 = (id)qword_1EFEFC0C0;

    objc_msgSend(v8, "setComputePipelineState:", v16);
    objc_msgSend(v8, "setTexture:atIndex:", v48, 0);
    objc_msgSend(v8, "setTexture:atIndex:", v49, 1);
    objc_msgSend(v8, "setTexture:atIndex:", self->_blurredRGBLowResTexture, 2);
    objc_msgSend(v8, "setTexture:atIndex:", v45, 3);
    objc_msgSend(v8, "setTexture:atIndex:", v46, 4);
    objc_msgSend(v8, "setBytes:length:atIndex:", v43, 464, 0);
    objc_msgSend(v8, "setBytes:length:atIndex:", &self->_imageBlendingControls, 8, 1);
    objc_msgSend(v8, "setImageblockWidth:height:", 32, 32);
    v30[0] = objc_msgSend(v45, "width");
    v30[1] = objc_msgSend(v45, "height");
    v30[2] = 1;
    v28 = vdupq_n_s64(0x20uLL);
    v29 = 1;
    objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v30, &v28);
    goto LABEL_9;
  }
  if (self->_outputType != 2)
    goto LABEL_8;
  v11 = (id)qword_1EFEFC0D0;
  objc_msgSend(v8, "setComputePipelineState:", v11);
  objc_msgSend(v8, "setTexture:atIndex:", v48, 0);
  objc_msgSend(v8, "setTexture:atIndex:", v49, 1);
  objc_msgSend(v8, "setTexture:atIndex:", self->_warpedRGBHiResTexture, 2);
  objc_msgSend(v8, "setBytes:length:atIndex:", v43, 464, 0);
  objc_msgSend(v8, "setBytes:length:atIndex:", &self->_imageToneMappingControls, 12, 1);
  v12 = objc_msgSend(v11, "threadExecutionWidth");
  v13 = objc_msgSend(v11, "maxTotalThreadsPerThreadgroup");
  v14 = -[MTLTexture width](self->_warpedRGBHiResTexture, "width");
  v15 = -[MTLTexture height](self->_warpedRGBHiResTexture, "height");
  v39[0] = v14;
  v39[1] = v15;
  v39[2] = 1;
  v38[0] = v12;
  v38[1] = v13 / v12;
  v38[2] = 1;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v39, v38);
  v16 = (id)qword_1EFEFC0E0;

  objc_msgSend(v8, "setComputePipelineState:", v16);
  objc_msgSend(v8, "setTexture:atIndex:", self->_warpedRGBHiResTexture, 0);
  objc_msgSend(v8, "setTexture:atIndex:", v45, 1);
  objc_msgSend(v8, "setTexture:atIndex:", v46, 2);
  objc_msgSend(v8, "setBytes:length:atIndex:", &self->_imageSharpeningControls, 1040, 0);
  objc_msgSend(v8, "setImageblockWidth:height:", 32, 32);
  v37[0] = objc_msgSend(v45, "width");
  v37[1] = objc_msgSend(v45, "height");
  v37[2] = 1;
  v35 = vdupq_n_s64(0x20uLL);
  v36 = 1;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v37, &v35);
LABEL_9:
  objc_msgSend(v8, "endEncoding");
  objc_msgSend(v7, "commit");
  objc_msgSend(v7, "waitUntilCompleted");
  v9 = 0;
LABEL_10:

  return v9;
}

- ($26F3230B48D5AC37CD558AA3BD3E34C9)_undistortControls
{
  CGFloat v5;
  double v6;
  __int128 v7;
  __int128 v8;
  float v9;
  CGFloat v10;
  float v11;
  double v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  $26F3230B48D5AC37CD558AA3BD3E34C9 *result;
  __int128 v38;
  CGPoint origin;
  CGSize size;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v45;
  BOOL isFrontFacingCamera;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  *(_OWORD *)&retstr[4].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[4].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[4].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[4].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr[3].var3 = 0u;
  *(_OWORD *)&retstr[4].var0.var2 = 0u;
  *(_OWORD *)&retstr[3].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[3].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[3].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[3].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr[2].var3 = 0u;
  *(_OWORD *)&retstr[3].var0.var2 = 0u;
  *(_OWORD *)&retstr[2].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[2].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[2].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[2].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr[1].var3 = 0u;
  *(_OWORD *)&retstr[2].var0.var2 = 0u;
  *(_OWORD *)&retstr[1].var2.var5.var0 = 0u;
  *(_OWORD *)&retstr[1].var2.var5.var4 = 0u;
  *(_OWORD *)&retstr[1].var2.var4.var0 = 0u;
  *(_OWORD *)&retstr[1].var2.var4.var4 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr[1].var0.var2 = 0u;
  *(_OWORD *)&retstr->var2.var5.var0 = 0u;
  *(_OWORD *)&retstr->var2.var5.var4 = 0u;
  *(_OWORD *)&retstr->var2.var4.var0 = 0u;
  *(_OWORD *)&retstr->var2.var4.var4 = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  -[DeskCamRenderingSession _updatePitchAndRoll](self, "_updatePitchAndRoll");
  -[DeskCamRenderingSession _viewportScaleMultiplier](self, "_viewportScaleMultiplier");
  -[DeskCamRenderingSession _defaultFramingSpaceViewport:](self, "_defaultFramingSpaceViewport:");
  -[DeskCamRenderingSession _scaleViewportToFitInFramingSpace:](self, "_scaleViewportToFitInFramingSpace:");
  self->_outputCropRectangle.size.width = v5;
  self->_outputCropRectangle.size.height = v6;
  v7 = *(_OWORD *)&self->_anon_90[23];
  v8 = *(_OWORD *)&self->_anon_90[39];
  v9 = COERCE_FLOAT(*(_QWORD *)&self->_anon_90[31]);
  v10 = v9 - v5 * 0.5;
  v11 = COERCE_FLOAT(*(_QWORD *)&self->_anon_90[47]);
  v12 = v11 - v6 * 0.5;
  self->_outputCropRectangle.origin.x = v10;
  self->_outputCropRectangle.origin.y = v12;
  *(float *)&v5 = v10 + (v5 + -1.0) * 0.5;
  *(float *)&v10 = v12 + (v6 + -1.0) * 0.5;
  v13 = (float)(*(float *)&v5 - v9) / *(float *)&v7;
  v14 = (float)(*(float *)&v10 - v11) / *((float *)&v8 + 1);
  v15 = v6 + v12 + -1.0;
  if (!self->_isFrontFacingCamera)
    v15 = v12;
  v16 = v15;
  v17 = (float)(v16 - v11) / *((float *)&v8 + 1);
  LODWORD(v18) = 0;
  *((float *)&v18 + 1) = v17;
  LODWORD(v19) = 0;
  *((float *)&v19 + 1) = 0.0 - v17;
  __asm { FMOV            V1.4S, #1.0 }
  _Q1.i64[0] = __PAIR64__(LODWORD(v14), LODWORD(v13));
  *(_OWORD *)&self->_inputPlaneShift[7] = v18;
  *(_OWORD *)&self->_outputPlaneShift[7] = v19;
  *(float32x4_t *)&self->_camera2PlaneShift[7] = vsubq_f32((float32x4_t)0, _Q1);
  *(float32x4_t *)&self->_plane2CameraShift[7] = _Q1;
  -[DeskCamRenderingSession _pitchMatrix](self, "_pitchMatrix");
  *(_DWORD *)&self->_anon_130[15] = v25;
  *(_DWORD *)&self->_anon_130[31] = v26;
  *(_QWORD *)&self->_anon_130[7] = v27;
  *(_QWORD *)&self->_anon_130[23] = v28;
  *(_DWORD *)&self->_anon_130[47] = v29;
  *(_QWORD *)&self->_anon_130[39] = v30;
  -[DeskCamRenderingSession _rollMatrix](self, "_rollMatrix");
  *(_DWORD *)&self->_anon_160[15] = v31;
  *(_DWORD *)&self->_anon_160[31] = v32;
  *(_QWORD *)&self->_anon_160[7] = v33;
  *(_QWORD *)&self->_anon_160[23] = v34;
  *(_DWORD *)&self->_anon_160[47] = v35;
  *(_QWORD *)&self->_anon_160[39] = v36;
  result = ($26F3230B48D5AC37CD558AA3BD3E34C9 *)-[DeskCamRenderingSession _translationVector](self, "_translationVector");
  *(_OWORD *)&self->_translationVector[7] = v38;
  if (self->_outputType == 2)
  {
    origin = self->_outputCropRectangle.origin;
    size = self->_outputCropRectangle.size;
    v42 = *(_OWORD *)&self->_camera2PlaneShift[7];
    v41 = *(_OWORD *)&self->_plane2CameraShift[7];
    v43 = *(_OWORD *)&self->_inputPlaneShift[7];
    v44 = *(_OWORD *)&self->_outputPlaneShift[7];
    v52 = *(_OWORD *)&self->_anon_130[7];
    v53 = *(_OWORD *)&self->_anon_130[23];
    v54 = *(_OWORD *)&self->_anon_130[39];
    v55 = *(_OWORD *)&self->_anon_160[7];
    v56 = *(_OWORD *)&self->_anon_160[23];
    v45 = 2 * !self->_isFrontFacingCamera;
    isFrontFacingCamera = self->_isFrontFacingCamera;
    v57 = *(_OWORD *)&self->_anon_160[39];
  }
  else
  {
    v45 = 0;
    isFrontFacingCamera = 0;
    origin = self->_framingSpaceRectangle.origin;
    size = self->_framingSpaceRectangle.size;
    v52 = *MEMORY[0x1E0C83FE8];
    v53 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v54 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
    v55 = *MEMORY[0x1E0C83FE8];
    v56 = v53;
    v57 = v54;
    v41 = 0uLL;
    v43 = 0uLL;
    v44 = 0uLL;
    v38 = 0uLL;
    v42 = 0uLL;
  }
  v47 = *(_OWORD *)&self->_anon_90[119];
  *(_OWORD *)&retstr[4].var0.var2 = *(_OWORD *)&self->_anon_90[103];
  *(_OWORD *)&retstr[4].var2.var4.var0 = v47;
  v48 = *(_OWORD *)&self->_anon_90[151];
  *(_OWORD *)&retstr[4].var2.var4.var4 = *(_OWORD *)&self->_anon_90[135];
  *(_OWORD *)&retstr[4].var2.var5.var0 = v48;
  v49 = *(_OWORD *)&self->_anon_90[55];
  *(_OWORD *)&retstr[3].var2.var4.var4 = *(_OWORD *)&self->_anon_90[39];
  *(_OWORD *)&retstr[3].var2.var5.var0 = v49;
  v50 = *(_OWORD *)&self->_anon_90[87];
  *(_OWORD *)&retstr[3].var2.var5.var4 = *(_OWORD *)&self->_anon_90[71];
  *(_OWORD *)&retstr[3].var3 = v50;
  v51 = *(_OWORD *)&self->_anon_90[23];
  *(_OWORD *)&retstr[3].var0.var2 = *(_OWORD *)&self->_anon_90[7];
  *(_OWORD *)&retstr[3].var2.var4.var0 = v51;
  *(float32x2_t *)&retstr->var0.var2 = vcvt_f32_f64((float64x2_t)origin);
  *(float32x2_t *)&retstr->var2.var2 = vcvt_f32_f64((float64x2_t)size);
  *(_OWORD *)&retstr->var2.var4.var0 = v42;
  *(_OWORD *)&retstr->var2.var4.var4 = v41;
  *(_OWORD *)&retstr->var2.var5.var0 = v43;
  *(_OWORD *)&retstr->var2.var5.var4 = v44;
  *(_OWORD *)&retstr->var3 = v55;
  *(_OWORD *)&retstr[1].var0.var2 = v56;
  *(_OWORD *)&retstr[1].var2.var4.var0 = v57;
  *(_OWORD *)&retstr[1].var2.var4.var4 = v52;
  *(_OWORD *)&retstr[1].var2.var5.var0 = v53;
  *(_OWORD *)&retstr[1].var2.var5.var4 = v54;
  *(_OWORD *)&retstr[1].var3 = v38;
  retstr[2].var0.var2 = v45;
  retstr[2].var2.var3 = 0;
  *(_QWORD *)&retstr[2].var2.var1 = 0;
  LOBYTE(retstr[4].var2.var5.var7) = isFrontFacingCamera;
  return result;
}

- (float)_viewportScaleMultiplier
{
  float roll;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  DeskCamSessionOptions *options;
  float v13;

  roll = self->_roll;
  v4 = vabds_f32(90.0, roll);
  v5 = vabds_f32(270.0, roll);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = vabds_f32(180.0, roll);
  v8 = vabds_f32(360.0, roll);
  if (v7 >= v8)
    v7 = v8;
  if (roll >= v7)
    v9 = v7;
  else
    v9 = self->_roll;
  -[DeskCamSessionOptions viewportScaleMultiplierMin](self->_options, "viewportScaleMultiplierMin");
  v11 = v10;
  options = self->_options;
  if (v6 >= v9)
  {
    -[DeskCamSessionOptions viewportScaleMultiplierLandscape](options, "viewportScaleMultiplierLandscape");
    v6 = v9;
  }
  else
  {
    -[DeskCamSessionOptions viewportScaleMultiplierPortrait](options, "viewportScaleMultiplierPortrait");
  }
  return v11 + (float)((float)((float)(v6 / -45.0) + 1.0) * (float)(v13 - v11));
}

- (CGRect)_scaleViewportToFitInFramingSpace:(CGRect)a3
{
  unsigned int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  double v11;
  double v12;
  float y;
  float v14;
  unsigned int v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  double x;
  double v23;
  double width;
  double height;
  uint64_t i;
  float32x2_t v27;
  float32x2_t v28;
  uint32x2_t v29;
  uint64_t j;
  float32x2_t v31;
  float32x2_t v32;
  uint32x2_t v33;
  float32x4_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float32x2_t v40;
  double v41;
  double v42;
  double v43;
  float32x2_t v44;
  double v45;
  double v46;
  double v47;
  int8x8_t v48[5];
  CGRect v49;
  CGRect result;

  v48[4] = *(int8x8_t *)MEMORY[0x1E0C80C00];
  if (!self->_isFrontFacingCamera)
  {
    -[DeskCamRenderingSession _rollMatrix](self, "_rollMatrix");
    v4 = 0;
    v46 = v6;
    v47 = v5;
    v45 = v7;
    v8 = -1.0;
    v9 = 1.0;
    v10 = 0.5;
    do
    {
      *(CGRect *)&v11 = CGRectInset(a3, a3.size.width * (float)(1.0 - (float)((float)(v10 + v9) * 0.5)) * 0.5, a3.size.height * (float)(1.0 - (float)((float)(v10 + v9) * 0.5)) * 0.5);
      v12 = v11;
      *(float *)&v11 = v11;
      *(float *)&v12 = v12 + v49.size.width + v8;
      if (self->_isFrontFacingCamera)
      {
        y = v49.origin.y;
        *((float *)&v12 + 1) = y;
        *((float *)&v11 + 1) = y;
        v14 = -100000.0;
      }
      else
      {
        y = v49.origin.y + v49.size.height + v8;
        *((float *)&v12 + 1) = y;
        *((float *)&v11 + 1) = y;
        v14 = 100000.0;
      }
      *(float *)&v15 = y + v14;
      v43 = v12;
      HIDWORD(v12) = v15;
      v41 = COERCE_DOUBLE(__PAIR64__(v15, LODWORD(v11)));
      v42 = v12;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v11, *(double *)&self->_anon_90[23], *(double *)&self->_anon_90[39], *(double *)&self->_anon_90[55], v47, v46, v45);
      v40 = v16;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v43, *(double *)&self->_anon_90[23], *(double *)&self->_anon_90[39], *(double *)&self->_anon_90[55], v47, v46, v45);
      v44 = v17;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v41, *(double *)&self->_anon_90[23], *(double *)&self->_anon_90[39], *(double *)&self->_anon_90[55], v47, v46, v45);
      v19 = v18;
      -[DeskCamRenderingSession _projectPoint:intrinsicMatrix:rotationMatrix:](self, "_projectPoint:intrinsicMatrix:rotationMatrix:", v42, *(double *)&self->_anon_90[23], *(double *)&self->_anon_90[39], *(double *)&self->_anon_90[55], v47, v46, v45);
      v21 = v20;
      x = self->_framingSpaceRectangle.origin.x;
      v23 = self->_framingSpaceRectangle.origin.y;
      width = self->_framingSpaceRectangle.size.width;
      height = self->_framingSpaceRectangle.size.height;
      _getLineToRectIntersectionPoints(v48, v19, v40, x, v23, width, height);
      for (i = 0; i != 4; ++i)
      {
        v27 = (float32x2_t)v48[i];
        v28 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
        v29 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v27, v28));
        if ((vpmin_u32(v29, v29).u32[0] & 0x80000000) != 0)
          break;
        v27 = v28;
      }
      _getLineToRectIntersectionPoints(v48, v21, v44, x, v23, width, height);
      for (j = 0; j != 4; ++j)
      {
        v31 = (float32x2_t)v48[j];
        v32 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
        v33 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v31, v32));
        if ((vpmin_u32(v33, v33).u32[0] & 0x80000000) != 0)
          break;
        v31 = v32;
      }
      *(int32x2_t *)v34.f32 = vrev64_s32((int32x2_t)v27);
      *(float32x2_t *)&v34.u32[2] = v31;
      if ((vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_f32(v34, (float32x4_t)vdupq_n_s32(0x7F7FFFFFu)), (int8x16_t)xmmword_1D4E43CF0)) & 0xF) != 0)v9 = (float)(v10 + v9) * 0.5;
      else
        v10 = (float)(v10 + v9) * 0.5;
      v8 = -1.0;
      if (v4 > 0xD)
        break;
      ++v4;
    }
    while ((float)(v9 - v10) > 0.001);
    a3 = CGRectInset(a3, a3.size.width * (float)(1.0 - v10) * 0.5, a3.size.height * (float)(1.0 - v10) * 0.5);
  }
  v35 = a3.origin.x;
  v36 = a3.origin.y;
  v37 = a3.size.width;
  v38 = a3.size.height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (double)_translationVector
{
  double v3;
  double v4;
  double v5;
  float v6;
  float v7;
  unsigned int v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  float32x2_t v22;
  float32x2_t v23;
  uint32x2_t v24;
  float32x4_t v25;
  uint64_t v26;
  float32x2_t v27;
  uint32x2_t v28;
  float32x4_t v29;
  float32x2_t v30;
  int32x2_t v31;
  float32x2_t v32;
  int32x2_t v33;
  float32x2_t v34;
  BOOL v35;
  float32x2_t v36;
  unsigned int v37;
  int8x8_t v38;
  double v40;
  double v41;
  double v42;
  int8x8_t v43[5];

  v43[4] = *(int8x8_t *)MEMORY[0x1E0C80C00];
  v4 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  a2.n128_f32[0] = v4;
  *(float *)&v5 = v4 + *(double *)(a1 + 64) + -1.0;
  if (*(_BYTE *)(a1 + 16))
  {
    v6 = v3;
    *((float *)&v5 + 1) = v6;
    a2.n128_f32[1] = v6;
    v7 = -100000.0;
  }
  else
  {
    v6 = v3 + *(double *)(a1 + 72) + -1.0;
    *((float *)&v5 + 1) = v6;
    a2.n128_f32[1] = v6;
    v7 = 100000.0;
  }
  *(float *)&v8 = v6 + v7;
  v42 = v5;
  HIDWORD(v5) = v8;
  v41 = v5;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", a2.n128_f64[0], *(double *)(a1 + 160), *(double *)(a1 + 176), *(double *)(a1 + 192), *(double *)(a1 + 352), *(double *)(a1 + 368), *(double *)(a1 + 384), __PAIR64__(v8, a2.n128_u32[0]), a2.n128_u64[1]);
  v10 = v9;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", v42, *(double *)(a1 + 160), *(double *)(a1 + 176), *(double *)(a1 + 192), *(double *)(a1 + 352), *(double *)(a1 + 368), *(double *)(a1 + 384));
  v12 = v11;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", v40, *(double *)(a1 + 160), *(double *)(a1 + 176), *(double *)(a1 + 192), *(double *)(a1 + 352), *(double *)(a1 + 368), *(double *)(a1 + 384));
  v14 = v13;
  objc_msgSend((id)a1, "_projectPoint:intrinsicMatrix:rotationMatrix:", v41, *(double *)(a1 + 160), *(double *)(a1 + 176), *(double *)(a1 + 192), *(double *)(a1 + 352), *(double *)(a1 + 368), *(double *)(a1 + 384));
  v16 = v15;
  v17 = *(double *)(a1 + 80);
  v18 = *(double *)(a1 + 88);
  v19 = *(double *)(a1 + 96);
  v20 = *(double *)(a1 + 104);
  _getLineToRectIntersectionPoints(v43, v14, v10, v17, v18, v19, v20);
  v21 = 0;
  v22 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
  while (1)
  {
    v23 = (float32x2_t)v43[v21];
    v24 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v23, v22));
    if ((vpmin_u32(v24, v24).u32[0] & 0x80000000) != 0)
      break;
    if (++v21 == 4)
    {
      v23 = v22;
      break;
    }
  }
  _getLineToRectIntersectionPoints(v43, v16, v12, v17, v18, v19, v20);
  v26 = 0;
  v27 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
  while (1)
  {
    *(int8x8_t *)v25.f32 = v43[v26];
    v28 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)v25.f32, v27));
    if ((vpmin_u32(v28, v28).u32[0] & 0x80000000) != 0)
      break;
    if (++v26 == 4)
    {
      *(float32x2_t *)v25.f32 = v27;
      break;
    }
  }
  v29 = *(float32x4_t *)(a1 + 160);
  v30 = vsub_f32(v23, v10);
  v31 = (int32x2_t)vmul_f32(v30, v30);
  v32 = vsub_f32(*(float32x2_t *)v25.f32, v12);
  v33 = (int32x2_t)vmul_f32(v32, v32);
  v34 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v31, v33), (float32x2_t)vzip2_s32(v31, v33)));
  v35 = (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v34, 1), v34).u8[0] & 1) == 0;
  v36.i32[0] = vextq_s8((int8x16_t)v29, (int8x16_t)v29, 8uLL).u32[0];
  v36.i32[1] = *(_DWORD *)(a1 + 184);
  if (v35)
    v37 = 0;
  else
    v37 = -1;
  v29.i32[1] = *(_DWORD *)(a1 + 180);
  v38 = (int8x8_t)vdup_n_s32(v37);
  *(float32x2_t *)v25.f32 = vdiv_f32(vsub_f32((float32x2_t)vbsl_s8(v38, (int8x8_t)v23, *(int8x8_t *)v25.f32), v36), *(float32x2_t *)v29.f32);
  v25.i32[2] = 1.0;
  *(float32x2_t *)v29.f32 = vdiv_f32(vsub_f32((float32x2_t)vbsl_s8(v38, (int8x8_t)v10, (int8x8_t)v12), v36), *(float32x2_t *)v29.f32);
  v29.i32[2] = 1.0;
  v25.i64[0] = vsubq_f32(v25, v29).u64[0];
  return *(double *)v25.i64;
}

- (double)_projectPoint:(__n128)a3 intrinsicMatrix:(double)a4 rotationMatrix:(float32x4_t)a5
{
  double v9;

  _S7 = a3.n128_u32[1];
  _Q0 = vaddq_f32(a7, vmlaq_n_f32(vmulq_n_f32(a5, (float)(*(float *)&a1 - a2.n128_f32[2]) / a2.n128_f32[0]), a6, (float)(*((float *)&a1 + 1) - a3.n128_f32[2]) / a3.n128_f32[1]));
  _Q0.i64[0] = vdivq_f32(_Q0, (float32x4_t)vdupq_laneq_s32((int32x4_t)_Q0, 2)).u64[0];
  *(float *)&v9 = vmlas_n_f32(a2.n128_f32[2], a2.n128_f32[0], _Q0.f32[0]);
  __asm { FMLA            S2, S7, V0.S[1] }
  HIDWORD(v9) = _S2;
  return v9;
}

- (void)_updatePitchAndRoll
{
  -[DeskCamRenderingSession _updatePitch](self, "_updatePitch");
  -[DeskCamRenderingSession _updateRoll](self, "_updateRoll");
}

- (void)_updatePitch
{
  uint32x4_t v3;
  float32x4_t v4;
  _BOOL4 v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  BOOL v20;
  float v21;
  float32x4_t v22;

  v3 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)self->_gravity), (int8x16_t)vcgezq_f32(*(float32x4_t *)self->_gravity)));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    -[DeskCamSessionOptions pitchDefaultAngleValue](self->_options, "pitchDefaultAngleValue");
    v14 = v21;
LABEL_6:
    v20 = 0;
    goto LABEL_7;
  }
  v22 = *(float32x4_t *)self->_gravity;
  *(__n64 *)v4.f32 = simd_matrix3x3((float32x4_t)_PromotedConst_0);
  _Q2.f32[0] = COERCE_FLOAT(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, *(float *)&v22), _Q1, *(float32x2_t *)&v22, 1), _Q2, v22, 2).i32[2]);
  __asm { FMLA            S1, S2, V0.S[2] }
  v11 = !self->_isFrontFacingCamera;
  v12 = (dbl_1D4E43D00[v11] + asinf(_Q2.f32[0] / fabsf(sqrtf(_Q1.f32[0])))) * 180.0 / dbl_1D4E43D10[v11];
  -[DeskCamSessionOptions pitchRefinementValue](self->_options, "pitchRefinementValue");
  v14 = v13 + v12;
  -[DeskCamSessionOptions pitchValueLowerThreshold](self->_options, "pitchValueLowerThreshold");
  if (v14 >= v15)
  {
    -[DeskCamSessionOptions pitchValueUpperThreshold](self->_options, "pitchValueUpperThreshold");
    if (v14 <= v16)
      goto LABEL_6;
  }
  -[DeskCamSessionOptions pitchValueUpperThreshold](self->_options, "pitchValueUpperThreshold", *(_OWORD *)&v22);
  v18 = fminf(v14, v17);
  -[DeskCamSessionOptions pitchValueLowerThreshold](self->_options, "pitchValueLowerThreshold");
  v14 = fmaxf(v18, v19);
  v20 = 1;
LABEL_7:
  self->_pitch = v14;
  self->_gimbalLock = v20;
}

- (__n64)_pitchMatrix
{
  float v1;
  float v2;
  __float2 v3;
  float32x4_t v4;
  float32x4_t v6;

  v2 = -1.0;
  if (!*(_BYTE *)(a1 + 16))
    v2 = 1.0;
  v6 = (float32x4_t)LODWORD(v2);
  v1 = *(float *)(a1 + 128) * 3.14159265 / 180.0;
  v3 = __sincosf_stret(v1 * 0.5);
  v4 = vmulq_n_f32(v6, v3.__sinval);
  v4.i32[3] = LODWORD(v3.__cosval);
  return simd_matrix3x3(v4);
}

- (void)_updateRoll
{
  float v3;
  int v4;
  uint32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;

  if (self->_isFrontFacingCamera
    || (v5 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(*(float32x4_t *)self->_gravity), (int8x16_t)vcgezq_f32(*(float32x4_t *)self->_gravity))), v5.i32[3] = v5.i32[2], (vmaxvq_u32(v5) & 0x80000000) != 0))
  {
    v3 = 270.0;
    switch(self->_cameraOrientation)
    {
      case 0:
        if (self->_isFrontFacingCamera)
          goto LABEL_4;
        goto LABEL_7;
      case 1:
        goto LABEL_10;
      case 2:
        v4 = 1119092736;
        goto LABEL_9;
      case 3:
LABEL_7:
        v3 = 0.0;
        goto LABEL_10;
      case 4:
LABEL_4:
        v4 = 1127481344;
LABEL_9:
        v3 = *(float *)&v4;
        goto LABEL_10;
      default:
        return;
    }
  }
  v9 = *(float32x4_t *)self->_gravity;
  *(__n64 *)v6.f32 = simd_matrix3x3((float32x4_t)_PromotedConst_0);
  v6.i64[0] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, v9.f32[0]), v7, *(float32x2_t *)v9.f32, 1), v8, v9, 2).u64[0];
  v3 = (atan2f(v6.f32[0], v6.f32[1]) + 3.14159265) * 180.0 / 3.14159265;
LABEL_10:
  self->_roll = v3;
}

- (__n64)_rollMatrix
{
  float v1;
  float v2;
  float32x4_t v3;
  __float2 v4;
  float32x4_t v5;
  float32x4_t v7;

  v2 = -1.0;
  if (!*(_BYTE *)(a1 + 16))
    v2 = 1.0;
  v3.i64[0] = 0;
  v3.i64[1] = LODWORD(v2);
  v7 = v3;
  v1 = *(float *)(a1 + 132) * 3.14159265 / 180.0;
  v4 = __sincosf_stret(v1 * 0.5);
  v5 = vmulq_n_f32(v7, v4.__sinval);
  v5.i32[3] = LODWORD(v4.__cosval);
  return simd_matrix3x3(v5);
}

- (BOOL)transformIsValid
{
  return !self->_gimbalLock;
}

- (double)transformMatrix
{
  float v2;
  float v3;
  float v4;
  unint64_t v5;
  float32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  uint64_t v14;
  simd_float3x3 v15;
  uint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  float32x4_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x2_t v36;
  float32x4_t v37;
  uint64_t v43;
  float32x4_t v44;
  float32x4_t v47;
  __int128 v48;
  __int128 v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  __int128 v53;
  __int128 v54;
  float32x4_t v55;
  __int128 v56;
  __int128 v57;
  float32x4_t v58;
  simd_float3x3 v59;

  v2 = *(double *)(a1 + 64);
  v3 = v2;
  v4 = *(double *)(a1 + 72);
  LODWORD(v5) = 0;
  *((float *)&v5 + 1) = v4;
  v48 = v5;
  v49 = LODWORD(v3);
  *(float32x2_t *)v6.f32 = vcvt_f32_f64(*(float64x2_t *)(a1 + 48));
  v6.i64[1] = COERCE_UNSIGNED_INT(1.0);
  v47 = v6;
  v7 = *(int32x4_t *)(a1 + 160);
  v8 = *(int32x4_t *)(a1 + 176);
  v9 = *(int32x4_t *)(a1 + 192);
  v10 = vzip1q_s32(v7, v9);
  v11 = vzip2q_s32(v7, v9);
  v12 = vzip1q_s32(v7, v8);
  v12.i32[2] = v9.i32[0];
  v52 = (float32x4_t)v12;
  v59.columns[0] = (simd_float3)vzip1q_s32(v10, v8);
  v13 = vzip2q_s32(v7, v8);
  v13.i32[2] = *(_QWORD *)(a1 + 200);
  v50 = (float32x4_t)v13;
  v51 = (float32x4_t)vzip2q_s32(v10, vdupq_lane_s32(*(int32x2_t *)v8.i8, 1));
  v59.columns[0].i32[3] = 0;
  v59.columns[2] = (simd_float3)vzip1q_s32(v11, vdupq_laneq_s32(v8, 2));
  v59.columns[1] = (simd_float3)v51;
  v59.columns[1].i32[3] = 0;
  v59.columns[2].i32[3] = 0;
  v15 = __invert_f3(v59);
  v14 = 0;
  v15.columns[2] = (simd_float3)vaddq_f32((float32x4_t)v15.columns[2], vaddq_f32(*(float32x4_t *)(a1 + 448), *(float32x4_t *)(a1 + 416)));
  v53 = v49;
  v54 = v48;
  v55 = v47;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  do
  {
    *(__int128 *)((char *)&v56 + v14) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v15.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v53 + v14))), (float32x4_t)v15.columns[1], *(float32x2_t *)((char *)&v53 + v14), 1), (float32x4_t)v15.columns[2], *(float32x4_t *)((char *)&v53 + v14), 2);
    v14 += 16;
  }
  while (v14 != 48);
  v16 = 0;
  v17 = *(float32x4_t *)(a1 + 304);
  v18 = *(float32x4_t *)(a1 + 320);
  v19 = *(float32x4_t *)(a1 + 336);
  v53 = v56;
  v54 = v57;
  v55 = v58;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  do
  {
    *(__int128 *)((char *)&v56 + v16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(__int128 *)((char *)&v53 + v16))), v18, *(float32x2_t *)((char *)&v53 + v16), 1), v19, *(float32x4_t *)((char *)&v53 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  v20 = 0;
  v21 = v56;
  v22 = v57;
  HIDWORD(v21) = 0;
  HIDWORD(v22) = 0;
  v23 = vaddq_f32(v58, *(float32x4_t *)(a1 + 432));
  v24 = *(float32x4_t *)(a1 + 352);
  v25 = *(float32x4_t *)(a1 + 368);
  v26 = *(float32x4_t *)(a1 + 384);
  v53 = v21;
  v54 = v22;
  v55 = v23;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  do
  {
    *(__int128 *)((char *)&v56 + v20) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(*(__int128 *)((char *)&v53 + v20))), v25, *(float32x2_t *)((char *)&v53 + v20), 1), v26, *(float32x4_t *)((char *)&v53 + v20), 2);
    v20 += 16;
  }
  while (v20 != 48);
  v27 = 0;
  v28 = v56;
  v29 = v57;
  HIDWORD(v28) = 0;
  HIDWORD(v29) = 0;
  v30 = vaddq_f32(v58, vaddq_f32(*(float32x4_t *)(a1 + 464), *(float32x4_t *)(a1 + 400)));
  v53 = v28;
  v54 = v29;
  v55 = v30;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  do
  {
    *(__int128 *)((char *)&v56 + v27) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v52, COERCE_FLOAT(*(__int128 *)((char *)&v53 + v27))), v51, *(float32x2_t *)((char *)&v53 + v27), 1), v50, *(float32x4_t *)((char *)&v53 + v27), 2);
    v27 += 16;
  }
  while (v27 != 48);
  v31 = 0;
  v32 = v56;
  v33 = v57;
  v34 = v58;
  HIDWORD(v32) = 0;
  HIDWORD(v33) = 0;
  v34.i32[3] = 0;
  v35.i64[0] = *(_QWORD *)(a1 + 144);
  v36 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)v35.f32), *(float64x2_t *)(a1 + 96)));
  v37.i32[0] = 0;
  v37.i64[1] = 0;
  v37.i32[1] = v36.i32[1];
  __asm { FMOV            V3.4S, #1.0 }
  *(float32x2_t *)_Q3.f32 = vcvt_f32_f64(vmlsq_f64((float64x2_t)0, vcvtq_f64_f32(v36), *(float64x2_t *)(a1 + 80)));
  v53 = v32;
  v54 = v33;
  v55 = v34;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  do
  {
    *(__int128 *)((char *)&v56 + v31) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v36.u32[0], COERCE_FLOAT(*(__int128 *)((char *)&v53 + v31))), v37, *(float32x2_t *)((char *)&v53 + v31), 1), _Q3, *(float32x4_t *)((char *)&v53 + v31), 2);
    v31 += 16;
  }
  while (v31 != 48);
  v43 = 0;
  v44.i32[1] = 0;
  v44.i64[1] = 0;
  v44.f32[0] = 1.0 / v35.f32[0];
  v35.i32[0] = 0;
  v35.i64[1] = 0;
  v35.f32[1] = 1.0 / v35.f32[1];
  v53 = v56;
  v54 = v57;
  v55 = v58;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  do
  {
    *(__int128 *)((char *)&v56 + v43) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(__int128 *)((char *)&v53 + v43))), v35, *(float32x2_t *)((char *)&v53 + v43), 1), (float32x4_t)xmmword_1D4E43AA0, *(float32x4_t *)((char *)&v53 + v43), 2);
    v43 += 16;
  }
  while (v43 != 48);
  return *(double *)&v56;
}

- (unsigned)exifOrientation
{
  unsigned int result;
  int v4;

  if (self->_outputType == 2)
    return 1;
  v4 = self->_cameraOrientation - 1;
  result = 6;
  switch(v4)
  {
    case 0:
      return result;
    case 1:
      result = 8;
      break;
    case 3:
      if (self->_isFrontFacingCamera)
        result = 1;
      else
        result = 3;
      break;
    default:
      if (self->_isFrontFacingCamera)
        result = 3;
      else
        result = 1;
      break;
  }
  return result;
}

- (float32x2_t)trapezoid
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  float32x2_t *v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;

  -[float32x2_t transformMatrix](a1, "transformMatrix");
  if (a1[2].i8[0])
  {
    v5 = (float32x4_t)xmmword_1D4E43D20;
    v6 = (float32x4_t)xmmword_1D4E43AA0;
    __asm { FMOV            V5.4S, #1.0 }
    _Q3 = (float32x4_t)xmmword_1D4E43D30;
  }
  else
  {
    v5 = (float32x4_t)xmmword_1D4E43AA0;
    _Q5 = (float32x4_t)xmmword_1D4E43D30;
    __asm { FMOV            V3.4S, #1.0 }
    v6 = (float32x4_t)xmmword_1D4E43D20;
  }
  v13 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, v5.f32[0]), v3, *(float32x2_t *)v5.f32, 1), v4, v5, 2);
  v14 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, _Q5.f32[0]), v3, *(float32x2_t *)_Q5.f32, 1), v4, _Q5, 2);
  v15 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, v6.f32[0]), v3, *(float32x2_t *)v6.f32, 1), v4, v6, 2);
  v16 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, _Q3.f32[0]), v3, *(float32x2_t *)_Q3.f32, 1), v4, _Q3, 2);
  v18 = a1[18];
  v17 = a1 + 18;
  v19 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v18), *(float64x2_t *)v17[-6].f32));
  v20 = vcvt_f32_f64(vmlsq_f64((float64x2_t)0, vcvtq_f64_f32(v19), *(float64x2_t *)v17[-8].f32));
  v21 = vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v14.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v14, 2))), v20), v19);
  v22 = vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2))), v20), v19);
  v23 = vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v16.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2))), v20), v19);
  v24 = distortPoint(v17, vdiv_f32(vsub_f32(vmul_f32(v18, vdiv_f32(*(float32x2_t *)v13.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2))), v20), v19));
  distortPoint(v17, v21);
  distortPoint(v17, v22);
  distortPoint(v17, v23);
  return vdiv_f32(v24, *v17);
}

- (float32x2_t)focusPoint
{
  float32x2_t *v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  int32x4_t v6;
  float32x2_t v7;

  v1 = a1;
  -[float32x2_t transformMatrix](a1, "transformMatrix");
  v2.i64[0] = 0x3F0000003F000000;
  v2.i64[1] = 0x3F0000003F000000;
  v6 = (int32x4_t)vaddq_f32(v5, vmlaq_f32(vmulq_f32(v3, v2), v2, v4));
  v7 = v1[18];
  v1 += 18;
  *(float32x2_t *)v4.f32 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v7), *(float64x2_t *)v1[-6].f32));
  return vdiv_f32(distortPoint(v1, vdiv_f32(vsub_f32(vmul_f32(v7, vdiv_f32(*(float32x2_t *)v6.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v6, 2))), vcvt_f32_f64(vmlsq_f64((float64x2_t)0, vcvtq_f64_f32(*(float32x2_t *)v4.f32), *(float64x2_t *)v1[-8].f32))), *(float32x2_t *)v4.f32)), *v1);
}

- (void)_initializeMetal
{
  MTLDevice *v3;
  MTLDevice *metalDevice;
  MTLDevice *v5;
  MTLCommandQueue *v6;
  MTLCommandQueue *commandQueue;
  uint64_t v8;
  void *v9;
  MTLDevice *v10;
  MTLLibrary *v11;
  id v12;
  MTLLibrary *library;
  const __CFDictionary *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
  v3 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  metalDevice = self->_metalDevice;
  self->_metalDevice = v3;

  v5 = self->_metalDevice;
  if (v5
    && (v6 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v5, "newCommandQueue"),
        commandQueue = self->_commandQueue,
        self->_commandQueue = v6,
        commandQueue,
        self->_commandQueue)
    && (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()),
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = self->_metalDevice;
    v15 = 0;
    v11 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](v10, "newDefaultLibraryWithBundle:error:", v9, &v15);
    v12 = v15;
    library = self->_library;
    self->_library = v11;

    if (!self->_library
      || -[DeskCamRenderingSession _allocateTextures](self, "_allocateTextures")
      || -[DeskCamRenderingSession _compileShaders](self, "_compileShaders"))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

    }
    else
    {
      v16 = *MEMORY[0x1E0CA8F48];
      v17[0] = &unk_1E98AFA58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, self->_metalDevice, 0, &self->_metalTextureCacheRef);

    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (int)_allocateTextures
{
  int height;
  int v4;
  void *v5;
  void *v6;
  MTLTexture *v7;
  MTLTexture *warpedRGBLowResTexture;
  void *v9;
  MTLTexture *v10;
  MTLTexture *blurredRGBLowResTexture;
  void *v12;
  MTLTexture *v13;
  MTLTexture *warpedRGBHiResTexture;
  int v15;

  if ((self->_deviceType & 0xFFFFFFFE) == 2)
  {
    height = self->_outputDimensions.height;
    v4 = height + 31;
    if (height >= 0)
      v4 = self->_outputDimensions.height;
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, (uint64_t)(self->_outputDimensions.width + (self->_outputDimensions.width < 0 ? 0x1F : 0)) >> 5, (uint64_t)v4 >> 5, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUsage:", 3);
    objc_msgSend(v5, "setResourceOptions:", 32);
    -[MTLCommandQueue device](self->_commandQueue, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (MTLTexture *)objc_msgSend(v6, "newTextureWithDescriptor:", v5);
    warpedRGBLowResTexture = self->_warpedRGBLowResTexture;
    self->_warpedRGBLowResTexture = v7;

    if (!self->_warpedRGBLowResTexture)
      goto LABEL_10;
    -[MTLCommandQueue device](self->_commandQueue, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (MTLTexture *)objc_msgSend(v9, "newTextureWithDescriptor:", v5);
    blurredRGBLowResTexture = self->_blurredRGBLowResTexture;
    self->_blurredRGBLowResTexture = v10;

    if (!self->_blurredRGBLowResTexture)
      goto LABEL_10;
    objc_msgSend(v5, "setWidth:", self->_outputDimensions.width);
    objc_msgSend(v5, "setHeight:", self->_outputDimensions.height);
    -[MTLCommandQueue device](self->_commandQueue, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (MTLTexture *)objc_msgSend(v12, "newTextureWithDescriptor:", v5);
    warpedRGBHiResTexture = self->_warpedRGBHiResTexture;
    self->_warpedRGBHiResTexture = v13;

    if (self->_warpedRGBHiResTexture)
    {
      v15 = 0;
    }
    else
    {
LABEL_10:
      fig_log_get_emitter();
      FigDebugAssert3();
      v15 = -1;
    }
  }
  else
  {
    v15 = 0;
    v5 = 0;
  }

  return v15;
}

- (int)_compileShaders
{
  uint64_t v3;
  __CFString *v4;
  void *v5;

  v3 = 0;
  while (1)
  {
    -[DeskCamRenderingSession _compileComputeShader:](self, "_compileComputeShader:", *(__CFString **)((char *)&_deskCamShaderList + v3));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = *(__CFString **)((char *)&_deskCamShaderList + v3 + 8);
    *(__CFString **)((char *)&_deskCamShaderList + v3 + 8) = v4;

    if (!*(__CFString **)((char *)&_deskCamShaderList + v3 + 8))
      break;
    v3 += 16;
    if (v3 == 96)
      return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12786;
}

- (id)_newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  id v8;
  MTLDevice *metalDevice;
  void *v10;

  v8 = a5;
  metalDevice = self->_metalDevice;
  if (metalDevice)
  {
    v10 = (void *)-[MTLDevice newBufferWithLength:options:](metalDevice, "newBufferWithLength:options:", a3, a4);
    objc_msgSend(v10, "setLabel:", v8);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

- (id)_compileComputeShader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!v4 || !self->_library || !self->_metalDevice)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v6 = 0;
LABEL_11:
    v9 = 0;
    goto LABEL_8;
  }
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "setLabel:", v4),
        v7 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v4),
        objc_msgSend(v6, "setComputeFunction:", v7),
        v7,
        objc_msgSend(v6, "computeFunction"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_11;
  }
  v9 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self->_metalDevice, "newComputePipelineStateWithDescriptor:options:reflection:error:", v6, 0, 0, 0);
  if (!v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_8:

  return v9;
}

- (DeskCamSessionOptions)options
{
  return self->_options;
}

- (CGRect)subjectRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_subjectRect.origin.x;
  y = self->_subjectRect.origin.y;
  width = self->_subjectRect.size.width;
  height = self->_subjectRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)zoomFactorApplied
{
  return self->_zoomFactorApplied;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warpedRGBHiResTexture, 0);
  objc_storeStrong((id *)&self->_blurredRGBLowResTexture, 0);
  objc_storeStrong((id *)&self->_warpedRGBLowResTexture, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
