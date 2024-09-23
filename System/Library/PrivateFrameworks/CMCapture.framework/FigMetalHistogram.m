@implementation FigMetalHistogram

- (FigMetalHistogram)initWithMetalContext:(id)a3
{
  id v5;
  FigMetalHistogram *v6;
  FigMetalHistogram *v7;
  void **p_metalContext;
  void *v9;
  uint64_t v10;
  void *v11;
  FigMetalHistogram *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FigMetalHistogram;
  v6 = -[FigMetalHistogram init](&v14, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  p_metalContext = (void **)&v6->_metalContext;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if (!v7->_metalContext)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", v9, 0),
          v11 = *p_metalContext,
          *p_metalContext = (void *)v10,
          v11,
          !*p_metalContext))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_11;
    }

  }
  if (-[FigMetalHistogram _initShaders]((uint64_t)v7))
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_11:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = v7;
LABEL_8:

  return v12;
}

- (uint64_t)_initShaders
{
  uint64_t v2;
  void *v3;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "computePipelineStateFor:constants:", CFSTR("histogramSingleComponent"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v2;

  if (*(_QWORD *)(a1 + 16))
    return 0;
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)singleComponentGPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5
{
  signed int PixelFormatType;
  int result;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int WidthOfPlane;
  unsigned int HeightOfPlane;
  int16x4_t v15;
  float64x2_t v16;
  float64x2_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  double y;
  double height;
  double width;
  double __dst;
  $A1886C520643A86ACC5362F227C8A889 *__dsta;
  _QWORD v36[4];
  unsigned int v37;
  unsigned int v38;
  _QWORD v39[4];
  unsigned int v40;
  unsigned int v41;
  int64x2_t v42;
  uint64_t v43;
  _QWORD v44[3];
  int16x4_t v45[2];
  CGRect v46;

  if (!a3 || !a5)
    goto LABEL_60;
  y = a4.origin.y;
  height = a4.size.height;
  width = a4.size.width;
  __dst = a4.origin.x;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  result = -12780;
  v10 = 10;
  if (PixelFormatType > 796423727)
  {
    if (PixelFormatType > 2016686639)
    {
      if (PixelFormatType <= 2084075055)
      {
        if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
        {
          v10 = 20;
          goto LABEL_38;
        }
        v11 = 2084070960;
        goto LABEL_35;
      }
      if (PixelFormatType == 2084075056)
        goto LABEL_38;
      if (PixelFormatType == 2088265264)
        goto LABEL_32;
      v12 = 2088269360;
    }
    else
    {
      if (PixelFormatType <= 1278226487)
      {
        if (PixelFormatType != 796423728)
        {
          if (PixelFormatType == 875704422)
            goto LABEL_38;
          v11 = 875704438;
          goto LABEL_35;
        }
LABEL_32:
        v10 = 588;
        goto LABEL_38;
      }
      if (PixelFormatType == 1278226488)
        goto LABEL_38;
      if (PixelFormatType == 1882468912)
        goto LABEL_32;
      v12 = 1885745712;
    }
LABEL_31:
    if (PixelFormatType != v12)
      return result;
    goto LABEL_32;
  }
  if (PixelFormatType > 758674991)
  {
    if (PixelFormatType > 792225327)
    {
      if (PixelFormatType == 792225328 || PixelFormatType == 792229424)
        goto LABEL_38;
      v12 = 796419632;
    }
    else
    {
      if (PixelFormatType == 758674992)
        goto LABEL_38;
      if (PixelFormatType == 762865200)
        goto LABEL_32;
      v12 = 762869296;
    }
    goto LABEL_31;
  }
  if (PixelFormatType <= 645424687)
  {
    if (PixelFormatType == 641230384)
      goto LABEL_38;
    v11 = 641234480;
    goto LABEL_35;
  }
  if (PixelFormatType == 645424688 || PixelFormatType == 645428784)
    goto LABEL_32;
  v11 = 758670896;
LABEL_35:
  if (PixelFormatType != v11)
    return result;
LABEL_38:
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  v46.size.width = width;
  v46.origin.x = __dst;
  v46.origin.y = y;
  v46.size.height = height;
  if (CGRectIsNull(v46))
  {
    v15.i32[0] = 0;
    v15.i16[2] = HeightOfPlane;
    v15.i16[3] = WidthOfPlane;
    goto LABEL_47;
  }
  v16.f64[0] = __dst;
  if (__dst < 0.0
    || __dst + width > (double)WidthOfPlane
    || width <= 0.0
    || (v17.f64[0] = height, y < 0.0)
    || y + height > (double)HeightOfPlane
    || height <= 0.0)
  {
LABEL_60:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v16.f64[1] = y;
  v17.f64[1] = width;
  v15 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(v16)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(v17)));
LABEL_47:
  v45[0] = v15;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  v19 = (void *)v18;
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", a3, v10, 1, 0, (float)WidthOfPlane, (float)HeightOfPlane);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_59:

    return -12786;
  }
  v21 = (void *)v20;
  objc_msgSend(v19, "computeCommandEncoder");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_59;
  }
  v23 = (void *)v22;
  __dsta = a5;
  -[FigMetalContext device](self->_metalContext, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "newBufferWithLength:options:", 1024, 0);

  v26 = objc_retainAutorelease(v25);
  bzero((void *)objc_msgSend(v26, "contents"), 0x400uLL);
  v27 = (((unint64_t)objc_msgSend(v21, "width") >> 1) + 15) >> 4;
  v28 = (((unint64_t)objc_msgSend(v21, "height") >> 1) + 15) >> 4;
  objc_msgSend(v23, "setComputePipelineState:", self->_pipelineStates[0]);
  objc_msgSend(v23, "setTexture:atIndex:", v21, 0);
  objc_msgSend(v23, "setBuffer:offset:atIndex:", v26, 0, 0);
  objc_msgSend(v23, "setBytes:length:atIndex:", v45, 8, 1);
  v44[0] = v27;
  v44[1] = v28;
  v44[2] = 1;
  v42 = vdupq_n_s64(0x10uLL);
  v43 = 1;
  objc_msgSend(v23, "dispatchThreadgroups:threadsPerThreadgroup:", v44, &v42);
  objc_msgSend(v23, "endEncoding");
  if (*MEMORY[0x1E0CA1FC0])
  {
    v29 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke;
    v39[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    v40 = WidthOfPlane;
    v41 = HeightOfPlane;
    objc_msgSend(v19, "addCompletedHandler:", v39);
    v36[0] = v29;
    v36[1] = 3221225472;
    v36[2] = __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke_2;
    v36[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    v37 = WidthOfPlane;
    v38 = HeightOfPlane;
    objc_msgSend(v19, "addCompletedHandler:", v36);
  }
  -[FigMetalContext commitAndWait](self->_metalContext, "commitAndWait");
  v30 = objc_retainAutorelease(v26);
  memcpy(__dsta, (const void *)objc_msgSend(v30, "contents"), sizeof($A1886C520643A86ACC5362F227C8A889));

  return 0;
}

uint64_t __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

void __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "GPUEndTime");
  objc_msgSend(v2, "GPUStartTime");

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
}

- (int)singleComponentCPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5
{
  return -[FigMetalHistogram singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:](self, "singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:", a3, 1, 1, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int)singleComponentCPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 subSampleX:(unsigned int)a5 subSampleY:(unsigned int)a6 outputHistogram:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  int BytesPerRowOfPlane;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  char *BaseAddressOfPlane;
  unsigned int v23;
  unsigned int v24;
  char *v25;
  unsigned int i;
  int v28;
  CGRect v29;

  if (!a3)
    goto LABEL_23;
  if (!a7)
    goto LABEL_23;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((CVPixelBufferGetPixelFormatType(a3) & 0xFFFFFFEF) != 0x34323066)
    goto LABEL_23;
  bzero(a7, 0x400uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v28 = BytesPerRowOfPlane;
  if (!CGRectIsNull(v29))
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    if (x >= 0.0 && x + width <= (double)WidthOfPlane && width > 0.0)
    {
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      if (y >= 0.0 && y + height <= (double)HeightOfPlane && height > 0.0)
      {
        v18 = x;
        v19 = y;
        v16 = width;
        v17 = height;
        goto LABEL_13;
      }
    }
LABEL_23:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v16 = CVPixelBufferGetWidthOfPlane(a3, 0);
  v17 = CVPixelBufferGetHeightOfPlane(a3, 0);
  v18 = 0;
  v19 = 0;
LABEL_13:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v23 = v19 + (a6 >> 1);
  if (v23 < v17 + v19)
  {
    v24 = v16 + v18;
    v25 = &BaseAddressOfPlane[v23 * v28];
    do
    {
      for (i = v18 + (a5 >> 1); i < v24; i += a5)
        ++a7->var0[v25[i]];
      v25 += v28 * a6;
      v23 += a6;
    }
    while (v23 < v17 + v19);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  return 0;
}

- (int)singleComponentGPUAverageInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputAverage:(float *)a5
{
  double height;
  double width;
  double y;
  double x;
  unsigned int WidthOfPlane;
  unsigned int HeightOfPlane;
  size_t v14;
  size_t v15;
  int v16;
  uint64_t v17;
  int32x4_t v18;
  int64x2_t v19;
  int32x4_t v20;
  int64x2_t v21;
  uint32x4_t v22;
  int v23;
  _BYTE v25[1024];
  CGRect v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  bzero(v25, 0x400uLL);
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226488 || !a5)
    goto LABEL_20;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (CGRectIsNull(v26))
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    goto LABEL_12;
  }
  v14 = CVPixelBufferGetWidthOfPlane(a3, 0);
  if (x < 0.0
    || x + width > (double)v14
    || width <= 0.0
    || (v15 = CVPixelBufferGetHeightOfPlane(a3, 0), y < 0.0)
    || y + height > (double)v15
    || height <= 0.0)
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  WidthOfPlane = width;
  HeightOfPlane = height;
LABEL_12:
  v16 = -[FigMetalHistogram singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:](self, "singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:", a3, v25, x, y, width, height);
  if (v16)
  {
    v23 = v16;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    v17 = 0;
    v18 = (int32x4_t)xmmword_1A3161E00;
    v19 = 0uLL;
    v20.i64[0] = 0x400000004;
    v20.i64[1] = 0x400000004;
    v21 = 0uLL;
    do
    {
      v22 = (uint32x4_t)vmulq_s32(*(int32x4_t *)&v25[v17], v18);
      v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v22);
      v19 = (int64x2_t)vaddw_u32((uint64x2_t)v19, *(uint32x2_t *)v22.i8);
      v18 = vaddq_s32(v18, v20);
      v17 += 16;
    }
    while (v17 != 1024);
    v23 = 0;
    *a5 = (float)(unint64_t)vaddvq_s64(vaddq_s64(v19, v21))
        / (float)((float)((float)WidthOfPlane * (float)HeightOfPlane) * 255.0);
  }
  return v23;
}

- (int)singleComponentCPUAverageInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputAverage:(float *)a5
{
  double height;
  double width;
  double y;
  double x;
  unsigned int BytesPerRowOfPlane;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  unsigned __int8 *BaseAddressOfPlane;
  unint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int result;
  CGRect v24;

  if (!a3)
    goto LABEL_19;
  if (!a5)
    goto LABEL_19;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226488)
    goto LABEL_19;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (!CGRectIsNull(v24))
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    if (x >= 0.0 && x + width <= (double)WidthOfPlane && width > 0.0)
    {
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      if (y >= 0.0 && y + height <= (double)HeightOfPlane && height > 0.0)
      {
        v14 = x;
        v15 = y;
        v12 = width;
        v13 = height;
        goto LABEL_13;
      }
    }
LABEL_19:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v12 = CVPixelBufferGetWidthOfPlane(a3, 0);
  v13 = CVPixelBufferGetHeightOfPlane(a3, 0);
  v14 = 0;
  v15 = 0;
LABEL_13:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v19 = 0;
  v20 = v13 + v15;
  if (v15 < v13 + v15)
  {
    v19 = 0;
    v21 = v12 + v14;
    do
    {
      v22 = v14;
      if (v14 < v21)
      {
        do
          v19 += BaseAddressOfPlane[v22++];
        while (v21 != v22);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      ++v15;
    }
    while (v15 != v20);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  result = 0;
  *a5 = (float)v19 / (float)((float)(v13 * v12) * 255.0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self->_pipelineStates, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
