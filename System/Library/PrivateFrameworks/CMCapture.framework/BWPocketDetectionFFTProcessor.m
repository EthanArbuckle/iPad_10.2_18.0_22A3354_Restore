@implementation BWPocketDetectionFFTProcessor

+ (void)initialize
{
  objc_opt_class();
}

- (BWPocketDetectionFFTProcessor)initWithMetalCommandQueue:(id)a3
{
  BWPocketDetectionFFTProcessor *v4;
  BWPocketDetectionFFTProcessor *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWPocketDetectionFFTProcessor;
  v4 = -[BWPocketDetectionFFTProcessor init](&v8, sel_init);
  v5 = v4;
  if (!a3)
    goto LABEL_6;
  if (v4)
  {
    v4->_metalCommandQueue = (MTLCommandQueue *)a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), v5->_metalCommandQueue);
    v5->_metalContext = (FigMetalContext *)v6;
    if (v6)
    {
      v5->_useMetalForScalingAndResultAccumulation = 1;
      return v5;
    }
LABEL_6:
    FigDebugAssert3();

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BWPocketDetectionFFTProcessor cleanupResources](self, "cleanupResources");

  v3.receiver = self;
  v3.super_class = (Class)BWPocketDetectionFFTProcessor;
  -[BWPocketDetectionFFTProcessor dealloc](&v3, sel_dealloc);
}

- (int)allocateResources
{
  CMIFFTTransform *v3;
  CMIFFTTransform *v4;
  MTLBuffer *v5;
  int v6;
  MTLTexture *v7;
  MTLBuffer *v8;
  MTLTexture *v9;
  OSStatus v10;
  BWVideoFormatRequirements *v11;
  BWPixelBufferPool *v12;
  OpaqueVTPixelRotationSession **p_cropSession;
  OSStatus v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  self->_resourcesCleaned = 0;
  v3 = (CMIFFTTransform *)objc_msgSend(MEMORY[0x1E0D08A90], "CMIFFT2DTransform:figMetalContext:width:height:layout:precision:", -[FigMetalContext device](self->_metalContext, "device"), 0, 1024, 1024, 0, 0);
  self->_fftTransform = v3;
  if (!v3)
    goto LABEL_16;
  v4 = v3;
  v5 = (MTLBuffer *)objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newBufferWithLength:options:", 0x800000, 0);
  self->_fftMetalBuffer = v5;
  if (!v5)
    goto LABEL_16;
  if (!self->_useMetalForScalingAndResultAccumulation)
  {
    v11 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v11, "setWidth:", 1024);
    -[BWVideoFormatRequirements setHeight:](v11, "setHeight:", 1024);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", &unk_1E49FFFA8);
    v16[0] = v11;
    v12 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1)), 1, CFSTR("BWPocketDetectionNode"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
    self->_fftBufferPool = v12;
    if (!v12)
    {
LABEL_16:
      FigDebugAssert3();
      return -1;
    }
    p_cropSession = &self->_cropSession;
    v14 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], p_cropSession);
    if (v14)
    {
      v10 = v14;
    }
    else
    {
      v10 = VTSessionSetProperty(*p_cropSession, (CFStringRef)*MEMORY[0x1E0CED768], MEMORY[0x1E0C9AAB0]);
      if (!v10)
        return v10;
    }
LABEL_18:
    FigDebugAssert3();
    return v10;
  }
  v6 = -[BWPocketDetectionFFTProcessor _setupPipelines](self, "_setupPipelines");
  if (v6)
  {
    v10 = v6;
    goto LABEL_18;
  }
  v7 = (MTLTexture *)-[MTLBuffer newTextureWithDescriptor:offset:bytesPerRow:](self->_fftMetalBuffer, "newTextureWithDescriptor:offset:bytesPerRow:", objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, 2048, 1024, 0), 0, 0x2000);
  self->_fftMetalTexture = v7;
  if (!v7)
    goto LABEL_16;
  v8 = (MTLBuffer *)objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newBufferWithLength:options:", 4096, 0);
  self->_fftResultAccumulationMetalBuffer = v8;
  if (!v8)
    goto LABEL_16;
  v9 = (MTLTexture *)-[MTLBuffer newTextureWithDescriptor:offset:bytesPerRow:](self->_fftResultAccumulationMetalBuffer, "newTextureWithDescriptor:offset:bytesPerRow:", objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, 64, 16, 0), 0, 256);
  v10 = 0;
  self->_fftResultAccumulationMetalTexture = v9;
  if (!v9)
    goto LABEL_16;
  return v10;
}

- (void)cleanupResources
{
  MTLTexture **p_fftResultAccumulationMetalTexture;
  OpaqueVTPixelRotationSession *cropSession;

  if (!self->_resourcesCleaned)
  {

    self->_fftMetalBuffer = 0;
    if (self->_useMetalForScalingAndResultAccumulation)
    {

      self->_fftMetalTexture = 0;
      self->_fftResultAccumulationMetalBuffer = 0;
      p_fftResultAccumulationMetalTexture = &self->_fftResultAccumulationMetalTexture;

    }
    else
    {

      p_fftResultAccumulationMetalTexture = &self->_cropSession;
      cropSession = self->_cropSession;
      if (!cropSession)
      {
LABEL_8:
        self->_resourcesCleaned = 1;
        return;
      }
      VTPixelRotationSessionInvalidate(cropSession);
      if (*p_fftResultAccumulationMetalTexture)
        CFRelease(*p_fftResultAccumulationMetalTexture);
    }
    *p_fftResultAccumulationMetalTexture = 0;
    goto LABEL_8;
  }
}

+ (int)prewarmShaders
{
  void *v2;
  void *v3;
  BWPocketDetectionFFTProcessor *v4;
  BWPocketDetectionFFTProcessor *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  CVReturn v8;
  int v10;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
  if (!v2)
  {
    FigDebugAssert3();
    v3 = 0;
LABEL_11:
    v5 = 0;
LABEL_13:
    v8 = -1;
    goto LABEL_8;
  }
  v3 = (void *)objc_msgSend(v2, "newCommandQueue");
  if (!v3)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  v4 = -[BWPocketDetectionFFTProcessor initWithMetalCommandQueue:]([BWPocketDetectionFFTProcessor alloc], "initWithMetalCommandQueue:", v3);
  v5 = v4;
  if (!v4)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  if (v4->_useMetalForScalingAndResultAccumulation)
  {
    v6 = *MEMORY[0x1E0CA8FF0];
    v12[0] = *MEMORY[0x1E0CA8F80];
    v12[1] = v6;
    v13[0] = &unk_1E49F7E30;
    v13[1] = MEMORY[0x1E0C9AA70];
    v12[2] = *MEMORY[0x1E0CA90E0];
    v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2304);
    v12[3] = *MEMORY[0x1E0CA8FD8];
    v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1728);
    v12[4] = *MEMORY[0x1E0CA9040];
    v13[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704422);
    v7 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
    v8 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x900uLL, 0x6C0uLL, 0x34323066u, v7, &pixelBufferOut);
    -[BWPocketDetectionFFTProcessor allocateResources](v5, "allocateResources");
    v10 = 0;
    -[BWPocketDetectionFFTProcessor processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:](v5, "processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:", pixelBufferOut, &v10, 0.0, 0.0, 2304.0, 1728.0);
    -[BWPocketDetectionFFTProcessor cleanupResources](v5, "cleanupResources");
    if (pixelBufferOut)
    {
      CFRelease(pixelBufferOut);
      pixelBufferOut = 0;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (int)processFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5
{
  if (self->_useMetalForScalingAndResultAccumulation)
    -[BWPocketDetectionFFTProcessor _processMetalOptimizedFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:](self, "_processMetalOptimizedFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  else
    -[BWPocketDetectionFFTProcessor _processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:](self, "_processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return 0;
}

- (int)_processMetalOptimizedFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  signed int PixelFormatType;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  MTLTexture *fftMetalTexture;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  double MidY;
  int v26;
  float64x2_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  uint64_t i;
  CGFloat MidX;
  int64x2_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  int v41;
  _QWORD v42[3];
  _QWORD v43[3];
  float v44;
  float32x2_t v45;
  CGRect v46;
  CGRect v47;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v13 = -12780;
  v14 = 10;
  if (PixelFormatType <= 796423727)
  {
    if (PixelFormatType > 758674991)
    {
      if (PixelFormatType > 792225327)
      {
        if (PixelFormatType == 792225328 || PixelFormatType == 792229424)
          goto LABEL_36;
        v16 = 796419632;
      }
      else
      {
        if (PixelFormatType == 758674992)
          goto LABEL_36;
        if (PixelFormatType == 762865200)
          goto LABEL_30;
        v16 = 762869296;
      }
      goto LABEL_29;
    }
    if (PixelFormatType <= 645424687)
    {
      if (PixelFormatType == 641230384)
        goto LABEL_36;
      v15 = 641234480;
    }
    else
    {
      if (PixelFormatType == 645424688 || PixelFormatType == 645428784)
        goto LABEL_30;
      v15 = 758670896;
    }
  }
  else
  {
    if (PixelFormatType <= 2016686639)
    {
      if (PixelFormatType <= 1278226487)
      {
        if (PixelFormatType != 796423728)
        {
          if (PixelFormatType == 875704422)
            goto LABEL_36;
          v15 = 875704438;
          goto LABEL_33;
        }
LABEL_30:
        v14 = 588;
        goto LABEL_36;
      }
      if (PixelFormatType == 1278226488)
        goto LABEL_36;
      if (PixelFormatType == 1882468912)
        goto LABEL_30;
      v16 = 1885745712;
LABEL_29:
      if (PixelFormatType != v16)
        return v13;
      goto LABEL_30;
    }
    if (PixelFormatType > 2084075055)
    {
      if (PixelFormatType == 2084075056)
        goto LABEL_36;
      if (PixelFormatType == 2088265264)
        goto LABEL_30;
      v16 = 2088269360;
      goto LABEL_29;
    }
    if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
    {
      v14 = 20;
      goto LABEL_36;
    }
    v15 = 2084070960;
  }
LABEL_33:
  if (PixelFormatType != v15)
    return v13;
LABEL_36:
  v17 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, v14, 17, 0);
  fftMetalTexture = self->_fftMetalTexture;
  v19 = (void *)-[MTLCommandQueue commandBuffer](self->_metalCommandQueue, "commandBuffer");
  if (v19)
  {
    v20 = v19;
    v21 = (void *)objc_msgSend(v19, "computeCommandEncoder");
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v21, "setComputePipelineState:", self->_computePipelines[0]);
      objc_msgSend(v22, "setTexture:atIndex:", v17, 0);
      objc_msgSend(v22, "setTexture:atIndex:", fftMetalTexture, 1);
      if (height >= width)
        v23 = width;
      else
        v23 = height;
      v24 = (int)v23;
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      MidX = CGRectGetMidX(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      MidY = CGRectGetMidY(v47);
      if (v24 >= 0)
        v26 = v24;
      else
        v26 = v24 + 1;
      v27.f64[0] = MidX;
      v27.f64[1] = MidY;
      v45 = vcvt_f32_f64(vsubq_f64(v27, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(v26 >> 1)), 0)));
      v44 = (float)v24 * 0.00097656;
      objc_msgSend(v22, "setBytes:length:atIndex:", &v45, 8, 0);
      objc_msgSend(v22, "setBytes:length:atIndex:", &v44, 4, 1);
      v28 = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[0], "threadExecutionWidth");
      v29 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[0], "maxTotalThreadsPerThreadgroup");
      v43[0] = (v28 + 2047) / v28;
      v43[1] = (v29 / v28 + 1023) / (v29 / v28);
      v43[2] = 1;
      v42[0] = v28;
      v42[1] = v29 / v28;
      v42[2] = 1;
      objc_msgSend(v22, "dispatchThreadgroups:threadsPerThreadgroup:", v43, v42);
      objc_msgSend(v22, "endEncoding");
      v13 = -[CMIFFTTransform encodeToCommandBuffer:inputBuffer:direction:](self->_fftTransform, "encodeToCommandBuffer:inputBuffer:direction:", v20, -[MTLTexture buffer](self->_fftMetalTexture, "buffer"), 1);
      if (v13)
      {
        FigDebugAssert3();
      }
      else
      {
        v30 = (void *)objc_msgSend(v20, "computeCommandEncoder");
        objc_msgSend(v30, "setComputePipelineState:", self->_computePipelines[1]);
        objc_msgSend(v30, "setTexture:atIndex:", self->_fftMetalTexture, 0);
        objc_msgSend(v30, "setTexture:atIndex:", self->_fftResultAccumulationMetalTexture, 1);
        v41 = 1024;
        objc_msgSend(v30, "setBytes:length:atIndex:", &v41, 4, 0);
        objc_msgSend(v30, "endEncoding");
        v39 = xmmword_1A3161DC0;
        v40 = 1;
        v37 = vdupq_n_s64(0x20uLL);
        v38 = 1;
        objc_msgSend(v30, "dispatchThreadgroups:threadsPerThreadgroup:", &v39, &v37);
        objc_msgSend(v20, "commit");
        objc_msgSend(v20, "waitUntilCompleted");
        v31 = objc_msgSend((id)-[MTLTexture buffer](self->_fftResultAccumulationMetalTexture, "buffer"), "contents");
        v32 = 0;
        v33 = 0.0;
        do
        {
          for (i = 0; i != 256; i += 16)
            v33 = (float)((float)((float)(v33 + COERCE_FLOAT(*(_OWORD *)(v31 + i)))
                                + COERCE_FLOAT(HIDWORD(*(_QWORD *)(v31 + i))))
                        + COERCE_FLOAT(*(_QWORD *)(v31 + i + 8)))
                + COERCE_FLOAT(HIDWORD(*(_OWORD *)(v31 + i)));
          ++v32;
          v31 += 256;
        }
        while (v32 != 16);
        *a5 = v33;
      }
      return v13;
    }
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_processFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __CVBuffer *v11;
  int v12;
  uint64_t v13;
  void *v14;
  CVReturn v15;
  uint64_t v16;
  _BYTE *BaseAddress;
  size_t BytesPerRow;
  float v19;
  uint64_t v20;
  float *v21;
  uint64_t v22;
  float *v23;
  int v24;
  uint64_t v25;
  float *v26;
  float *v27;
  float v28;
  uint64_t v29;
  float *v30;
  float *v31;
  int v32;
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = -[BWPixelBufferPool newPixelBuffer](self->_fftBufferPool, "newPixelBuffer");
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  CGRectGetMidX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  CGRectGetMidY(v35);
  CVPixelBufferGetWidth(v11);
  CVPixelBufferGetHeight(v11);
  v12 = VTPixelRotationSessionRotateSubImage();
  if (v12)
  {
    v24 = v12;
LABEL_21:
    FigDebugAssert3();
    goto LABEL_17;
  }
  v13 = -[MTLCommandQueue commandBuffer](self->_metalCommandQueue, "commandBuffer");
  if (!v13)
  {
    FigDebugAssert3();
    v24 = FigSignalErrorAt();
    goto LABEL_17;
  }
  v14 = (void *)v13;
  v15 = CVPixelBufferLockBaseAddress(v11, 1uLL);
  if (v15)
  {
    v24 = v15;
    goto LABEL_21;
  }
  v16 = -[MTLBuffer contents](self->_fftMetalBuffer, "contents");
  BaseAddress = CVPixelBufferGetBaseAddress(v11);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v11);
  v20 = 0;
  v21 = (float *)(v16 + 4);
  do
  {
    v22 = 0;
    v23 = v21;
    do
    {
      LOBYTE(v19) = BaseAddress[v22];
      v19 = (float)LODWORD(v19) / 255.0;
      *(v23 - 1) = v19;
      *v23 = 0.0;
      v23 += 2;
      ++v22;
    }
    while (v22 != 1024);
    ++v20;
    BaseAddress += BytesPerRow;
    v21 += 2048;
  }
  while (v20 != 1024);
  CVPixelBufferUnlockBaseAddress(v11, 1uLL);
  v24 = -[CMIFFTTransform encodeToCommandBuffer:inputBuffer:direction:](self->_fftTransform, "encodeToCommandBuffer:inputBuffer:direction:", v14, self->_fftMetalBuffer, 1);
  if (v24)
    goto LABEL_21;
  objc_msgSend(v14, "commit");
  objc_msgSend(v14, "waitUntilCompleted");
  v25 = 0;
  v26 = (float *)(v16 + 8188);
  v27 = (float *)(v16 + 4);
  v28 = 0.0;
  do
  {
    v29 = 0;
    v30 = v27;
    v31 = v26;
    do
    {
      if (v25 >= v29)
        v32 = v29;
      else
        v32 = v25;
      v28 = (float)(v28
                  + (float)((float)((float)(*v30 * *v30) + (float)(*(v30 - 1) * *(v30 - 1)))
                          * (float)((float)v32 * 0.0019531)))
          + (float)((float)((float)(*(v31 - 1) * *(v31 - 1)) + (float)(*v31 * *v31)) * (float)((float)v32 * 0.0019531));
      ++v29;
      v31 -= 2;
      v30 += 2;
    }
    while (v29 != 512);
    ++v25;
    v26 += 2048;
    v27 += 2048;
  }
  while (v25 != 512);
  *a5 = v28;
LABEL_17:
  CVPixelBufferRelease(v11);
  return v24;
}

- (int)_setupPipelines
{
  uint64_t v3;
  MTLComputePipelineState **computePipelines;
  char i;
  char v6;
  int v7;

  v3 = 0;
  computePipelines = self->_computePipelines;
  for (i = 1; ; i = 0)
  {
    v6 = i;
    v7 = -[BWPocketDetectionFFTProcessor _loadKernel:name:](self, "_loadKernel:name:", &computePipelines[v3], (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", kKernelNames[v3]));
    if (v7)
      break;
    v3 = 1;
    if ((v6 & 1) == 0)
      return v7;
  }
  FigDebugAssert3();
  return v7;
}

- (int)_loadKernel:(id *)a3 name:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int result;

  v6 = (id)objc_msgSend((id)-[FigMetalContext library](self->_metalContext, "library"), "newFunctionWithName:", a4);
  if (v6
    && (v7 = objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newComputePipelineStateWithFunction:error:", v6, 0)) != 0)
  {
    v8 = (void *)v7;
    result = 0;
    *a3 = v8;
  }
  else
  {
    FigDebugAssert3();
    return -1;
  }
  return result;
}

@end
