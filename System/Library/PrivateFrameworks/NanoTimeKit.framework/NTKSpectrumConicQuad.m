@implementation NTKSpectrumConicQuad

- (NTKSpectrumConicQuad)initWithRole:(unint64_t)a3 screenScale:(double)a4
{
  NTKSpectrumConicQuad *v6;
  NTKSpectrumConicQuad *v7;
  uint64_t v8;
  MTLDevice *device;
  uint64_t v10;
  NSCalendar *calendar;
  uint64_t v12;
  CAMediaTimingFunction *mediaTimingFunction;
  uint64_t v14;
  uint64_t v15;
  MTLBuffer *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NTKSpectrumConicQuad;
  v6 = -[CLKUIQuad init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_screenScale = a4;
    objc_msgSend(off_1E6BCA700, "sharedDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    device = v7->_device;
    v7->_device = (MTLDevice *)v8;

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v10 = objc_claimAutoreleasedReturnValue();
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v10;

    v7->_style = 2;
    v7->_role = a3;
    v7->_opacity = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v12 = objc_claimAutoreleasedReturnValue();
    mediaTimingFunction = v7->_mediaTimingFunction;
    v7->_mediaTimingFunction = (CAMediaTimingFunction *)v12;

    v14 = 0;
    v7->_vignetteOpacity = 0.0;
    v7->_overlayOpacity = 0.0;
    do
    {
      v15 = -[MTLDevice newBufferWithLength:options:](v7->_device, "newBufferWithLength:options:", 104, 1);
      v16 = v7->_conicUniformsBuffers[v14];
      v7->_conicUniformsBuffers[v14] = (MTLBuffer *)v15;

      ++v14;
    }
    while (v14 != 3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__significantTimeChanged, *MEMORY[0x1E0DC4838], 0);

  }
  return v7;
}

- (void)dealloc
{
  NTKSpectrumResourceManager *resourceManager;
  NTKSpectrumResourceManager *v4;
  void *v5;
  objc_super v6;

  resourceManager = self->_resourceManager;
  if (resourceManager)
  {
    -[NTKSpectrumResourceManager removeClient](resourceManager, "removeClient");
    v4 = self->_resourceManager;
    self->_resourceManager = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);

  v6.receiver = self;
  v6.super_class = (Class)NTKSpectrumConicQuad;
  -[NTKSpectrumConicQuad dealloc](&v6, sel_dealloc);
}

- (void)setupForQuadView:(id)a3
{
  float64_t v4;
  float64x2_t v5;
  NTKSpectrumResourceManager *resourceManager;
  NTKSpectrumResourceManager *v7;
  NTKSpectrumResourceManager *v8;
  NTKSpectrumResourceManager *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "bounds");
  v5.f64[1] = v4;
  *(float32x2_t *)self->_size = vcvt_f32_f64(vmulq_n_f64(v5, self->_screenScale));
  resourceManager = self->_resourceManager;
  if (resourceManager)
  {
    -[NTKSpectrumResourceManager removeClient](resourceManager, "removeClient");
    v7 = self->_resourceManager;
    self->_resourceManager = 0;

  }
  +[NTKSpectrumResourceManager sharedInstanceWithPixelFormat:](NTKSpectrumResourceManager, "sharedInstanceWithPixelFormat:", objc_msgSend(v10, "colorPixelFormat"));
  v8 = (NTKSpectrumResourceManager *)objc_claimAutoreleasedReturnValue();
  v9 = self->_resourceManager;
  self->_resourceManager = v8;

  -[NTKSpectrumResourceManager addClient](self->_resourceManager, "addClient");
}

- (BOOL)prepareForTime:(double)a3
{
  return -[CLKUIQuad isOpaque](self, "isOpaque", a3) || self->_opacity > 0.0;
}

- (void)setFromColor:(id)a3 toColor:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  CLKUIConvertToRGBfFromUIColor();
  CLKUIConvertToRGBfFromUIColor();
  CLKUIConvertToUIColorFromRGBf();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSpectrumConicQuad setFromColor:toColor:midColor:interpolation:](self, "setFromColor:toColor:midColor:interpolation:", v7, v6, v8, 0);

}

- (void)setFromColor:(id)a3 toColor:(id)a4 midColor:(id)a5 interpolation:(unint64_t)a6
{
  id v9;
  id v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;

  v9 = a5;
  v10 = a4;
  CLKUIConvertToRGBfFromUIColor();
  v23 = v11;
  CLKUIConvertToRGBfFromUIColor();
  v22 = v12;

  CLKUIConvertToRGBfFromUIColor();
  v24 = v13;

  v14.i64[0] = 0x3F0000003F000000;
  v14.i64[1] = 0x3F0000003F000000;
  LODWORD(_D2) = vcvt_f16_f32(v23).u32[0];
  _S3 = v23.i32[2];
  __asm { FCVT            H3, S3 }
  WORD2(_D2) = _S3;
  HIWORD(_D2) = 15360;
  _Q0 = vmulq_f32(vaddq_f32(v23, v22), v14);
  *(_QWORD *)self->_fromColor = _D2;
  v14.i32[0] = vcvt_f16_f32(v22).u32[0];
  LODWORD(_D2) = v22.i32[2];
  __asm { FCVT            H2, S2 }
  v14.i16[2] = _D2;
  v14.i16[3] = 15360;
  *(_QWORD *)self->_toColor = v14.i64[0];
  v14.i32[0] = vcvt_f16_f32(v24).u32[0];
  LODWORD(_D2) = v24.i32[2];
  __asm { FCVT            H2, S2 }
  v14.i16[2] = _D2;
  v14.i16[3] = 15360;
  *(_QWORD *)self->_midColor = v14.i64[0];
  v14.i32[0] = vcvt_f16_f32(_Q0).u32[0];
  _Q0.i32[0] = _Q0.i32[2];
  __asm { FCVT            H0, S0 }
  v14.i16[2] = _Q0.i16[0];
  *(_QWORD *)self->_aliasColor = v14.i64[0];
  self->_colorInterpolation = a6;
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4;
  unint64_t frame;
  MTLBuffer *v6;
  uint64_t v7;
  _BOOL4 v9;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double endOverrideTime;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  float v26;
  unint64_t style;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  float v36;
  unint64_t toStyle;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float styleTransitionFraction;
  float v52;
  float v53;
  float v54;
  float v55;
  float32x4_t v56;
  int8x16_t v57;
  float32x4_t v58;
  float32x4_t v59;
  int8x16_t v61;
  float32x2_t v62;
  void *v63;
  void *v64;
  void *v65;
  simd_float4 x;
  simd_float4 v67;
  double v68[2];
  float64x2_t v69;
  __int128 v70;
  double v71;
  double v72;

  v4 = a3;
  frame = self->_frame;
  self->_frame = frame + 1;
  v6 = objc_retainAutorelease(self->_conicUniformsBuffers[frame % 3]);
  v7 = -[MTLBuffer contents](v6, "contents");
  *(float32x2_t *)(v7 + 80) = vmul_f32(*(float32x2_t *)self->_size, (float32x2_t)0xBF000000BF000000);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)self->_fromColor;
  *(_QWORD *)(v7 + 32) = *(_QWORD *)self->_toColor;
  *(_QWORD *)(v7 + 40) = *(_QWORD *)self->_midColor;
  *(_QWORD *)(v7 + 48) = *(_QWORD *)self->_aliasColor;
  *(float *)(v7 + 92) = self->_vignetteOpacity;
  *(float *)(v7 + 96) = self->_overlayOpacity;
  _S10 = 1.0;
  if (!-[CLKUIQuad isOpaque](self, "isOpaque"))
    _S10 = self->_opacity;
  v9 = self->_masking && self->_maskRadius > 0.0;
  __asm { FCVT            H0, S10 }
  *(_WORD *)(v7 + 8) = _H0;
  *(float *)(v7 + 88) = self->_maskRadius;
  v15 = CACurrentMediaTime();
  v16 = _S10 < 1.0;
  if (v9)
    v16 |= 2uLL;
  if (self->_vignetteOpacity > 0.0)
    v16 |= 8uLL;
  if (self->_overlayOpacity > 0.0)
    v16 |= 4uLL;
  if (self->_colorInterpolation == 16)
    v17 = v16 | 0x10;
  else
    v17 = v16;
  -[NTKSpectrumResourceManager renderPipelineForConfig:](self->_resourceManager, "renderPipelineForConfig:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  endOverrideTime = self->_endOverrideTime;
  if (v15 < endOverrideTime || self->_overrideDate)
  {
    v20 = (v15 - self->_startOverrideTime) / (endOverrideTime - self->_startOverrideTime);
    *(float *)&v20 = v20;
    if (*(float *)&v20 > 1.0)
      *(float *)&v20 = 1.0;
    -[CAMediaTimingFunction _solveForInput:](self->_mediaTimingFunction, "_solveForInput:", v20);
    v22 = self->_startSecondAngle + (float)((float)(self->_endSecondAngle - self->_startSecondAngle) * v21);
    v23 = self->_startMinuteAngle + (float)((float)(self->_endMinuteAngle - self->_startMinuteAngle) * v21);
    v24 = self->_startHourAngle + (float)((float)(self->_endHourAngle - self->_startHourAngle) * v21);
  }
  else
  {
    v68[0] = 0.0;
    v71 = 0.0;
    v72 = 0.0;
    +[NTKDate faceDate](NTKDate, "faceDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NTKHourMinuteSecondAnglesForTime(v68, &v72, &v71, v33, self->_calendar);

    v34 = v71;
    v22 = v34 / 6.2832;
    v35 = v72;
    v23 = v35 / 6.2832;
    v36 = v68[0];
    v24 = v36 / 6.2832;
  }
  if ((*((_BYTE *)self + 192) & 1) != 0)
  {
    style = self->_style;
    if (style == 1)
    {
      v30 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
      v28 = v23;
      v29 = v23;
    }
    else
    {
      v28 = v24;
      v29 = v23;
      v30 = v22;
      if (!style)
      {
        v28 = v22;
        v29 = v22;
        v30 = v22;
      }
    }
    toStyle = self->_toStyle;
    v38 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
    if (toStyle)
    {
      v39 = v23;
    }
    else
    {
      v24 = v22;
      v39 = v22;
    }
    if (toStyle == 1)
      v24 = v23;
    else
      v23 = v39;
    if (toStyle == 1)
      v22 = v38;
    v40 = vabds_f32(v30, v22);
    v41 = -1.0;
    if (v30 <= 0.5)
      v42 = -1.0;
    else
      v42 = 1.0;
    if (v40 <= 0.5)
      v42 = -0.0;
    v43 = v22 + v42;
    v44 = vabds_f32(v29, v23);
    if (v29 <= 0.5)
      v45 = -1.0;
    else
      v45 = 1.0;
    if (v44 <= 0.5)
      v46 = -0.0;
    else
      v46 = v45;
    v47 = v23 + v46;
    v48 = vabds_f32(v28, v24);
    if (v28 > 0.5)
      v41 = 1.0;
    if (v48 <= 0.5)
      v49 = -0.0;
    else
      v49 = v41;
    v50 = v24 + v49;
    styleTransitionFraction = self->_styleTransitionFraction;
    v26 = v30 + (float)((float)(v43 - v30) * styleTransitionFraction);
    v23 = v29 + (float)((float)(v47 - v29) * styleTransitionFraction);
    v24 = v28 + (float)((float)(v50 - v28) * styleTransitionFraction);
  }
  else
  {
    v25 = self->_style;
    if (self->_role == 1)
    {
      if (v25 == 1)
      {
        v26 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
        v24 = v23;
      }
      else
      {
        v26 = v24;
        if (!v25)
        {
          *(_QWORD *)(v7 + 24) = *(_QWORD *)self->_midColor;
          *(_QWORD *)(v7 + 32) = *(_QWORD *)self->_midColor;
          v24 = v22;
          v23 = v22;
          v26 = v22;
        }
      }
    }
    else
    {
      v31 = (float)(v23 + 0.5) - floorf(v23 + 0.5);
      if (v25)
      {
        v32 = v23;
      }
      else
      {
        v24 = v22;
        v32 = v22;
      }
      if (v25 == 1)
        v24 = v23;
      else
        v23 = v32;
      if (v25 == 1)
        v26 = v31;
      else
        v26 = v22;
    }
  }
  v52 = v26 - floorf(v26);
  v53 = v23 - floorf(v23);
  v54 = v24 - floorf(v24);
  if (v52 >= v53)
  {
    if (v53 >= v54)
    {
      v55 = v53;
    }
    else
    {
      if (v52 >= v54)
        v55 = v54;
      else
        v55 = v52;
      if (v52 < v54)
        v52 = v54;
      v54 = v53;
    }
  }
  else
  {
    if (v52 >= v54)
    {
      v55 = v52;
    }
    else
    {
      if (v53 >= v54)
        v55 = v54;
      else
        v55 = v53;
      if (v53 < v54)
        v53 = v54;
      v54 = v52;
    }
    v52 = v53;
  }
  v56.i64[0] = __PAIR64__(LODWORD(v55), LODWORD(v54));
  v56.f32[2] = v52;
  v56.f32[3] = v52 + -1.0;
  *(float16x4_t *)v7 = vcvt_f16_f32(v56);
  v57.i64[0] = __PAIR64__(LODWORD(v52), LODWORD(v55));
  *(float *)&v57.i32[2] = v54 + 1.0;
  *(float *)&v57.i32[3] = v54;
  v58 = (float32x4_t)vextq_s8(v57, v57, 0xCuLL);
  v58.f32[3] = v52 + -1.0;
  v59 = vsubq_f32((float32x4_t)v57, v58);
  __asm { FMOV            V4.4S, #1.0 }
  *(float16x4_t *)v59.f32 = vcvt_f16_f32(vdivq_f32(_Q4, v59));
  _Q4.i64[0] = __PAIR64__(LODWORD(v55), LODWORD(v54));
  *(_QWORD *)(v7 + 16) = v59.i64[0];
  _Q4.i64[1] = LODWORD(v52);
  x = (simd_float4)vmlaq_f32((float32x4_t)vdupq_n_s32(0x40490FDBu), (float32x4_t)vdupq_n_s32(0x40C90FDBu), _Q4);
  v67 = _simd_sin_f4(x);
  v61 = (int8x16_t)_simd_cos_f4(x);
  *(int32x2_t *)(v7 + 56) = vzip1_s32(*(int32x2_t *)v67.f32, *(int32x2_t *)v61.i8);
  *(int32x2_t *)(v7 + 64) = vzip2_s32(*(int32x2_t *)v67.f32, *(int32x2_t *)v61.i8);
  *(int32x2_t *)(v7 + 72) = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v67, (int8x16_t)v67, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL));
  objc_msgSend(v4, "setLabel:", CFSTR("Spectrum Encoder"));
  v62 = *(float32x2_t *)self->_size;
  v68[0] = 0.0;
  v68[1] = 0.0;
  v69 = vcvtq_f64_f32(v62);
  v70 = xmmword_1B755D450;
  objc_msgSend(v4, "setViewport:", v68);
  objc_msgSend(v4, "setCullMode:", 0);
  objc_msgSend(v4, "setRenderPipelineState:", v18);
  if ((v17 & 8) != 0)
  {
    -[NTKSpectrumResourceManager vignetteTexture](self->_resourceManager, "vignetteTexture");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFragmentTexture:atIndex:", v63, 1);

  }
  if ((v17 & 4) != 0)
  {
    -[NTKSpectrumResourceManager overlayTexture](self->_resourceManager, "overlayTexture");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFragmentTexture:atIndex:", v64, 2);

  }
  -[NTKSpectrumResourceManager verticesBuffer](self->_resourceManager, "verticesBuffer", *(_OWORD *)&x);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVertexBuffer:offset:atIndex:", v65, 0, 0);

  objc_msgSend(v4, "setVertexBuffer:offset:atIndex:", v6, 0, 1);
  objc_msgSend(v4, "setFragmentBuffer:offset:atIndex:", v6, 0, 0);
  objc_msgSend(v4, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);

}

- (void)setOverrideDate:(id)a3 hourRadians:(double)a4 minuteRadians:(double)a5 secondRadians:(double)a6
{
  double v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    v11 = CACurrentMediaTime();
    self->_startOverrideTime = v11;
    self->_endOverrideTime = v11;
    *(float *)&v11 = a6;
    *(float *)&v11 = (float)(*(float *)&v11 / 6.2832) - floorf(*(float *)&v11 / 6.2832);
    self->_startSecondAngle = *(float *)&v11;
    self->_endSecondAngle = *(float *)&v11;
    *(float *)&v11 = a5;
    *(float *)&v11 = (float)(*(float *)&v11 / 6.2832) - floorf(*(float *)&v11 / 6.2832);
    self->_startMinuteAngle = *(float *)&v11;
    self->_endMinuteAngle = *(float *)&v11;
    *(float *)&v11 = a4;
    *(float *)&v11 = (float)(*(float *)&v11 / 6.2832) - floorf(*(float *)&v11 / 6.2832);
    self->_startHourAngle = *(float *)&v11;
    self->_endHourAngle = *(float *)&v11;
  }
  else
  {
    -[NTKSpectrumConicQuad setOverrideDate:duration:completion:](self, "setOverrideDate:duration:completion:", 0, 0, 0.0);
  }

}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  -[NTKSpectrumConicQuad setOverrideDate:duration:completion:](self, "setOverrideDate:duration:completion:", a3, 0, a4);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v9;
  void (**v10)(_QWORD, double, double, float, float, float, float);
  NSDate **p_overrideDate;
  char v12;
  int *v13;
  int *v14;
  int *v15;
  int *v16;
  int *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float startSecondAngle;
  float endSecondAngle;
  BOOL v33;
  float v34;
  float startMinuteAngle;
  float endMinuteAngle;
  float v37;
  float startHourAngle;
  float endHourAngle;
  float v40;
  double v41;
  double v42;
  double v43;

  v9 = a3;
  v10 = (void (**)(_QWORD, double, double, float, float, float, float))a5;
  p_overrideDate = &self->_overrideDate;
  v12 = NTKEqualObjects(v9, self->_overrideDate);
  v13 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
  v14 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
  v15 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
  v16 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
  v17 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
  if ((v12 & 1) == 0)
  {
    +[NTKDate faceDate](NTKDate, "faceDate");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = *p_overrideDate;
    if (!*p_overrideDate)
      v20 = (void *)v18;
    v21 = v20;
    if (v9)
    {
      v22 = v9;
    }
    else
    {
      objc_msgSend(v19, "dateByAddingTimeInterval:", a4);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;
    v24 = CACurrentMediaTime();
    self->_startOverrideTime = v24;
    self->_endOverrideTime = v24 + a4;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    v42 = 0.0;
    v43 = 0.0;
    v41 = 0.0;
    NTKHourMinuteSecondAnglesForTime(&v43, &v42, &v41, v21, self->_calendar);
    v25 = v41;
    self->_startSecondAngle = (float)(v25 / 6.2832) - floorf(v25 / 6.2832);
    v26 = v42;
    self->_startMinuteAngle = (float)(v26 / 6.2832) - floorf(v26 / 6.2832);
    v27 = v43;
    self->_startHourAngle = (float)(v27 / 6.2832) - floorf(v27 / 6.2832);
    NTKHourMinuteSecondAnglesForTime(&v43, &v42, &v41, v23, self->_calendar);
    v28 = v41;
    self->_endSecondAngle = (float)(v28 / 6.2832) - floorf(v28 / 6.2832);
    v29 = v42;
    self->_endMinuteAngle = (float)(v29 / 6.2832) - floorf(v29 / 6.2832);
    v30 = v43;
    v17 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
    self->_endHourAngle = (float)(v30 / 6.2832) - floorf(v30 / 6.2832);
    startSecondAngle = self->_startSecondAngle;
    endSecondAngle = self->_endSecondAngle;
    if (vabds_f32(startSecondAngle, endSecondAngle) > 0.5)
    {
      v33 = startSecondAngle <= 0.5;
      v34 = -1.0;
      if (!v33)
        v34 = 1.0;
      self->_endSecondAngle = endSecondAngle + v34;
    }
    startMinuteAngle = self->_startMinuteAngle;
    endMinuteAngle = self->_endMinuteAngle;
    if (vabds_f32(startMinuteAngle, endMinuteAngle) > 0.5)
    {
      v37 = -1.0;
      if (startMinuteAngle > 0.5)
        v37 = 1.0;
      self->_endMinuteAngle = endMinuteAngle + v37;
    }
    startHourAngle = self->_startHourAngle;
    endHourAngle = self->_endHourAngle;
    if (vabds_f32(startHourAngle, endHourAngle) > 0.5)
    {
      v33 = startHourAngle <= 0.5;
      v40 = -1.0;
      if (!v33)
        v40 = 1.0;
      self->_endHourAngle = endHourAngle + v40;
    }

    v16 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
    v15 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
    v14 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
    v13 = &OBJC_IVAR___NTKComplicationController__displayWrappersToTouchObservers;
  }
  if (v10)
    v10[2](v10, *(double *)((char *)&self->super.super.isa + v13[312]), self->_endOverrideTime, *(float *)((char *)&self->super.super.isa + v14[315]), *(float *)((char *)&self->super.super.isa + v15[316]), *(float *)((char *)&self->super.super.isa + v16[317]), *(float *)((char *)&self->super.super.isa + v17[318]));

}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  *((_BYTE *)self + 192) &= ~1u;
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  float v5;

  *((_BYTE *)self + 192) |= 1u;
  v5 = a3;
  self->_styleTransitionFraction = v5;
  self->_style = a4;
  self->_toStyle = a5;
}

- (void)_significantTimeChanged
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "%@ received significant time change with current timezone: %@", (uint8_t *)&v14, 0x16u);

  }
  -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v3);
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "%@ did set new timezone after significant time change to: %@", (uint8_t *)&v14, 0x16u);

  }
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (float)maskRadius
{
  return self->_maskRadius;
}

- (void)setMaskRadius:(float)a3
{
  self->_maskRadius = a3;
}

- (BOOL)isMasking
{
  return self->_masking;
}

- (void)setMasking:(BOOL)a3
{
  self->_masking = a3;
}

- (float)vignetteOpacity
{
  return self->_vignetteOpacity;
}

- (void)setVignetteOpacity:(float)a3
{
  self->_vignetteOpacity = a3;
}

- (float)overlayOpacity
{
  return self->_overlayOpacity;
}

- (void)setOverlayOpacity:(float)a3
{
  self->_overlayOpacity = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_conicUniformsBuffers[i], 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
