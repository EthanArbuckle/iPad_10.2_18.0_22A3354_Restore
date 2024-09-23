@implementation SSCHistogram

- (SSCHistogram)initWithOptionalCommandQueue:(id)a3
{
  id v4;
  SSCHistogram *v5;
  void *v6;
  FigMetalContext *v7;
  FigMetalContext *metalContext;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSCHistogram;
  v5 = -[SSCHistogram init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (v7 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:]([FigMetalContext alloc], "initWithbundle:andOptionalCommandQueue:", v6, v4), metalContext = v5->_metalContext, v5->_metalContext = v7, metalContext, !v5->_metalContext)|| -[SSCHistogram _initShaders]((uint64_t)v5))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v6 = 0;
  }

  return v5;
}

- (uint64_t)_initShaders
{
  uint64_t v2;
  void *v3;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "computePipelineStateFor:constants:", CFSTR("SSCHistogram::singleComponent"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v2;

  if (*(_QWORD *)(a1 + 16))
    return 0;
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)singleComponentGPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5 optionalChannelConfig:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  signed int PixelFormatType;
  int result;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int WidthOfPlane;
  uint64_t v20;
  void *v21;
  int v22;

  if (!a3 || !a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  result = -12780;
  v16 = 10;
  if (PixelFormatType <= 796423727)
  {
    if (PixelFormatType > 758674991)
    {
      if (PixelFormatType > 792225327)
      {
        if (PixelFormatType == 792225328 || PixelFormatType == 792229424)
          goto LABEL_38;
        v18 = 796419632;
      }
      else
      {
        if (PixelFormatType == 758674992)
          goto LABEL_38;
        if (PixelFormatType == 762865200)
          goto LABEL_32;
        v18 = 762869296;
      }
      goto LABEL_31;
    }
    if (PixelFormatType <= 645424687)
    {
      if (PixelFormatType == 641230384)
        goto LABEL_38;
      v17 = 641234480;
    }
    else
    {
      if (PixelFormatType == 645424688 || PixelFormatType == 645428784)
        goto LABEL_32;
      v17 = 758670896;
    }
    goto LABEL_35;
  }
  if (PixelFormatType > 2016686639)
  {
    if (PixelFormatType > 2084075055)
    {
      if (PixelFormatType == 2084075056)
        goto LABEL_38;
      if (PixelFormatType == 2088265264)
        goto LABEL_32;
      v18 = 2088269360;
LABEL_31:
      if (PixelFormatType != v18)
        return result;
      goto LABEL_32;
    }
    if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
    {
      v16 = 20;
      goto LABEL_38;
    }
    v17 = 2084070960;
LABEL_35:
    if (PixelFormatType != v17)
      return result;
    goto LABEL_38;
  }
  if (PixelFormatType > 1278226487)
  {
    if (PixelFormatType == 1278226488)
      goto LABEL_38;
    if (PixelFormatType == 1882468912)
      goto LABEL_32;
    v18 = 1885745712;
    goto LABEL_31;
  }
  if (PixelFormatType == 796423728)
  {
LABEL_32:
    v16 = 588;
    goto LABEL_38;
  }
  if (PixelFormatType != 875704422)
  {
    v17 = 875704438;
    goto LABEL_35;
  }
LABEL_38:
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", a3, v16, 1, 0, (float)WidthOfPlane, (float)CVPixelBufferGetHeightOfPlane(a3, 0));
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    v22 = -[SSCHistogram singleComponentGPUHistogramInputTexture:validRect:outputHistogram:optionalChannelConfig:](self, "singleComponentGPUHistogramInputTexture:validRect:outputHistogram:optionalChannelConfig:", v20, a5, a6, x, y, width, height);

    return v22;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
}

- (int)singleComponentGPUHistogramInputTexture:(id)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5 optionalChannelConfig:(id *)a6
{
  id v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  int16x4_t v13;
  float64x2_t v14;
  float64x2_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  double y;
  double height;
  double width;
  id *v31;
  double x;
  void *v33;
  _QWORD v34[4];
  unsigned int v35;
  unsigned int v36;
  _QWORD v37[4];
  unsigned int v38;
  unsigned int v39;
  int64x2_t v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  int v44;
  int16x4_t v45[2];
  CGRect v46;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = v9;
  v44 = 0;
  v43 = 0;
  if (!a6)
  {
    LODWORD(v43) = 1;
    v44 = 1056964608;
    a6 = ($1230CF39250A084FEEB876D19862D23B *)&v43;
  }
  if (!v9)
    goto LABEL_26;
  if (!a5)
    goto LABEL_26;
  v11 = objc_msgSend(v9, "width");
  v12 = objc_msgSend(v10, "height");
  if (((v11 | v12) & 1) != 0)
    goto LABEL_26;
  v46.size.width = width;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.height = height;
  if (CGRectIsNull(v46))
  {
    v13.i32[0] = 0;
    v13.i16[2] = v12;
    v13.i16[3] = v11;
    goto LABEL_15;
  }
  v14.f64[0] = x;
  if (x < 0.0
    || x + width > (double)v11
    || width <= 0.0
    || (v15.f64[0] = height, y < 0.0)
    || y + height > (double)v12
    || height <= 0.0)
  {
LABEL_26:
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = -12780;
    goto LABEL_20;
  }
  v14.f64[1] = y;
  v15.f64[1] = width;
  v13 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(v14)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(v15)));
LABEL_15:
  v45[0] = v13;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, "computeCommandEncoder");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      v31 = a5;
      -[FigMetalContext device](self->_metalContext, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "newBufferWithLength:options:", 1024, 0);

      v22 = objc_retainAutorelease(v21);
      bzero((void *)objc_msgSend(v22, "contents"), 0x400uLL);
      v23 = (((objc_msgSend(v10, "width") / (unint64_t)a6->var0) >> 1) + 15) >> 4;
      v24 = (((objc_msgSend(v10, "height") / (unint64_t)a6->var0) >> 1) + 15) >> 4;
      objc_msgSend(v19, "setComputePipelineState:", self->_pipelineStates[0]);
      v33 = v10;
      objc_msgSend(v19, "setTexture:atIndex:", v10, 0);
      objc_msgSend(v19, "setBuffer:offset:atIndex:", v22, 0, 0);
      objc_msgSend(v19, "setBytes:length:atIndex:", v45, 8, 1);
      objc_msgSend(v19, "setBytes:length:atIndex:", a6, 12, 2);
      v42[0] = v23;
      v42[1] = v24;
      v42[2] = 1;
      v40 = vdupq_n_s64(0x10uLL);
      v41 = 1;
      objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", v42, &v40);
      objc_msgSend(v19, "endEncoding");
      if (*MEMORY[0x1E0CA1FC0])
      {
        v25 = MEMORY[0x1E0C809B0];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __104__SSCHistogram_singleComponentGPUHistogramInputTexture_validRect_outputHistogram_optionalChannelConfig___block_invoke;
        v37[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
        v38 = v11;
        v39 = v12;
        objc_msgSend(v17, "addCompletedHandler:", v37);
        v34[0] = v25;
        v34[1] = 3221225472;
        v34[2] = __104__SSCHistogram_singleComponentGPUHistogramInputTexture_validRect_outputHistogram_optionalChannelConfig___block_invoke_2;
        v34[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
        v35 = v11;
        v36 = v12;
        objc_msgSend(v17, "addCompletedHandler:", v34);
      }
      -[FigMetalContext commit](self->_metalContext, "commit");
      *v31 = -[SSCHistogramResult initWithCommandBuffer:andHistogramBuffer:]([SSCHistogramResult alloc], "initWithCommandBuffer:andHistogramBuffer:", v17, v22);

      v26 = 0;
      v10 = v33;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v26 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
  }
LABEL_20:

  return v26;
}

uint64_t __104__SSCHistogram_singleComponentGPUHistogramInputTexture_validRect_outputHistogram_optionalChannelConfig___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

void __104__SSCHistogram_singleComponentGPUHistogramInputTexture_validRect_outputHistogram_optionalChannelConfig___block_invoke_2(uint64_t a1, void *a2)
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
  return -[SSCHistogram singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:](self, "singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:", a3, 1, 1, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int)singleComponentCPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 subSampleX:(unsigned int)a5 subSampleY:(unsigned int)a6 outputHistogram:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  uint64_t v16;
  void *v17;
  int BytesPerRowOfPlane;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  char *BaseAddressOfPlane;
  unsigned int v26;
  unsigned int v27;
  char *v28;
  unsigned int i;
  int v31;
  CGRect v32;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = -[SSCHistogramResult initForCpuUsage]([SSCHistogramResult alloc], "initForCpuUsage");
  *a7 = v15;
  v16 = objc_msgSend(v15, "getHistogramBins");
  if (!a3)
    goto LABEL_22;
  v17 = (void *)v16;
  if ((CVPixelBufferGetPixelFormatType(a3) & 0xFFFFFFEF) != 0x34323066)
    goto LABEL_22;
  bzero(v17, 0x400uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v31 = BytesPerRowOfPlane;
  if (!CGRectIsNull(v32))
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    if (x >= 0.0 && x + width <= (double)WidthOfPlane && width > 0.0)
    {
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      if (y >= 0.0 && y + height <= (double)HeightOfPlane && height > 0.0)
      {
        v21 = x;
        v22 = y;
        v19 = width;
        v20 = height;
        goto LABEL_12;
      }
    }
LABEL_22:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v19 = CVPixelBufferGetWidthOfPlane(a3, 0);
  v20 = CVPixelBufferGetHeightOfPlane(a3, 0);
  v21 = 0;
  v22 = 0;
LABEL_12:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v26 = v22 + (a6 >> 1);
  if (v26 < v20 + v22)
  {
    v27 = v19 + v21;
    v28 = &BaseAddressOfPlane[v26 * v31];
    do
    {
      for (i = v21 + (a5 >> 1); i < v27; i += a5)
        ++*((_DWORD *)v17 + v28[i]);
      v28 += v31 * a6;
      v26 += a6;
    }
    while (v26 < v20 + v22);
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
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int32x4_t v21;
  int64x2_t v22;
  int32x4_t v23;
  int64x2_t v24;
  uint32x4_t v25;
  id v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226488 || !a5)
    goto LABEL_20;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (CGRectIsNull(v28))
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
  v27 = 0;
  v16 = -[SSCHistogram singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:optionalChannelConfig:](self, "singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:optionalChannelConfig:", a3, &v27, 0, x, y, width, height);
  v17 = v27;
  v18 = v17;
  if (v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

  }
  else
  {
    v19 = objc_msgSend(v17, "getHistogramBins");
    v20 = 0;
    v21 = (int32x4_t)xmmword_1D33053A0;
    v22 = 0uLL;
    v23.i64[0] = 0x400000004;
    v23.i64[1] = 0x400000004;
    v24 = 0uLL;
    do
    {
      v25 = (uint32x4_t)vmulq_s32(*(int32x4_t *)(v19 + v20), v21);
      v24 = (int64x2_t)vaddw_high_u32((uint64x2_t)v24, v25);
      v22 = (int64x2_t)vaddw_u32((uint64x2_t)v22, *(uint32x2_t *)v25.i8);
      v21 = vaddq_s32(v21, v23);
      v20 += 16;
    }
    while (v20 != 1024);
    *a5 = (float)(unint64_t)vaddvq_s64(vaddq_s64(v22, v24))
        / (float)((float)((float)WidthOfPlane * (float)HeightOfPlane) * 255.0);

    return 0;
  }
  return v16;
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
