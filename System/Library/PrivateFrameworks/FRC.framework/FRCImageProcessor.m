@implementation FRCImageProcessor

- (FRCImageProcessor)initWithUsage:(int64_t)a3
{
  return -[FRCImageProcessor initWithUsage:normalizationMode:](self, "initWithUsage:normalizationMode:", a3, 0);
}

- (id)initLegacyModeWithUsage:(int64_t)a3
{
  return -[FRCImageProcessor initWithUsage:normalizationMode:](self, "initWithUsage:normalizationMode:", a3, 1);
}

- (FRCImageProcessor)initWithUsage:(int64_t)a3 normalizationMode:(int64_t)a4
{
  FRCImageProcessor *v6;
  FRCImageProcessor *v7;
  Normalization *v8;
  Normalization *normalization;
  FRCScaler *v10;
  FRCScaler *scaler;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *completionSemaphore;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FRCImageProcessor;
  v6 = -[FRCImageProcessor init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_usage = a3;
    v6->_inputRotation = 0;
    FRCGetInputFrameSizeForUsage(a3, (uint64_t *)&v6->_width, (uint64_t *)&v6->_height);
    v8 = -[Normalization initWithMode:]([Normalization alloc], "initWithMode:", a4);
    normalization = v7->_normalization;
    v7->_normalization = v8;

    v10 = objc_alloc_init(FRCScaler);
    scaler = v7->_scaler;
    v7->_scaler = v10;

    -[FRCImageProcessor allocateNormalizedBuffers](v7, "allocateNormalizedBuffers");
    v12 = dispatch_semaphore_create(0);
    completionSemaphore = v7->_completionSemaphore;
    v7->_completionSemaphore = (OS_dispatch_semaphore *)v12;

  }
  return v7;
}

- (void)dealloc
{
  __CVPixelBufferPool *denormalizedBufferPool;
  objc_super v4;

  -[FRCImageProcessor releaseNormalizedBuffers](self, "releaseNormalizedBuffers");
  if (self->_rgbaBuffersAllocated)
  {
    CVPixelBufferRelease(self->_rgbaFirst);
    CVPixelBufferRelease(self->_rgbaSecond);
    self->_rgbaBuffersAllocated = 0;
  }
  denormalizedBufferPool = self->_denormalizedBufferPool;
  if (denormalizedBufferPool)
  {
    CFRelease(denormalizedBufferPool);
    self->_denormalizedBufferPool = 0;
  }
  self->_rgbaPixelFormat = 0;
  v4.receiver = self;
  v4.super_class = (Class)FRCImageProcessor;
  -[FRCImageProcessor dealloc](&v4, sel_dealloc);
}

- (void)setSelfNormalization:(BOOL)a3
{
  -[Normalization setSelfNormalization:](self->_normalization, "setSelfNormalization:", a3);
}

- (BOOL)selfNormalization
{
  return -[Normalization selfNormalization](self->_normalization, "selfNormalization");
}

- (void)allocateNormalizedBuffers
{
  uint64_t v3;
  size_t v4;

  v3 = 0;
  v4 = 0;
  FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&v4, &v3);
  if (!self->_normalizedFirst)
    self->_normalizedFirst = createPixelBuffer(v4, 3 * v3, 0x4C303068u, 0);
  if (!self->_normalizedSecond)
    self->_normalizedSecond = createPixelBuffer(v4, 3 * v3, 0x4C303068u, 0);
}

- (void)releaseNormalizedBuffers
{
  CVPixelBufferRelease(self->_normalizedFirst);
  CVPixelBufferRelease(self->_normalizedSecond);
  self->_normalizedFirst = 0;
  self->_normalizedSecond = 0;
}

- (void)allocteRGBABuffersForBuffer:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  size_t v7;
  size_t v8;

  self->_rgbaPixelFormat = -[FRCImageProcessor rgbaPixelFormatForBuffer:useScaler:](self, "rgbaPixelFormatForBuffer:useScaler:", a3, 1);
  Width = CVPixelBufferGetWidth(a3);
  v8 = Width;
  Height = CVPixelBufferGetHeight(a3);
  v7 = Height;
  if (self->_inputScaling)
  {
    Width >>= 1;
    Height >>= 1;
    v7 = Height;
    v8 = Width;
  }
  if (Width < Height)
    swapWidthAndHeight((uint64_t *)&v8, (uint64_t *)&v7);
  if (!self->_rgbaFirst)
    self->_rgbaFirst = createPixelBuffer(v8, v7, self->_rgbaPixelFormat, 0);
  if (!self->_rgbaSecond)
    self->_rgbaSecond = createPixelBuffer(v8, v7, self->_rgbaPixelFormat, 0);
  self->_rgbaBuffersAllocated = 1;
}

- (BOOL)shouldScaleBuffer:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  unint64_t v8;
  size_t v9;

  Width = CVPixelBufferGetWidth(a3);
  v9 = Width;
  Height = CVPixelBufferGetHeight(a3);
  v8 = Height;
  if (CVPixelBufferGetPixelFormatType(a3) == 1278226536)
  {
    Height /= 3uLL;
    v8 = Height;
  }
  if (Width < Height)
  {
    swapWidthAndHeight((uint64_t *)&v9, (uint64_t *)&v8);
    Width = v9;
  }
  return self->_width < Width || self->_height < v8;
}

- (void)preProcessFirstInput:(__CVBuffer *)a3 secondInput:(__CVBuffer *)a4 waitForCompletion:(BOOL)a5
{
  _BOOL8 v5;
  OSType PixelFormatType;
  char v10;
  BOOL v11;
  char v12;
  __CVBuffer *rgbaSecond;
  int8x16_t v14;
  Normalization *normalization;
  __CVBuffer *rgbaFirst;
  __CVBuffer *normalizedFirst;
  __CVBuffer *v18;
  __CVBuffer *normalizedSecond;
  _QWORD v20[5];

  v5 = a5;
  kdebug_trace();
  if (!a3)
    *(int8x16_t *)&self->_normalizedFirst = vextq_s8(*(int8x16_t *)&self->_normalizedFirst, *(int8x16_t *)&self->_normalizedFirst, 8uLL);
  -[FRCImageProcessor storeColorProperties:](self, "storeColorProperties:", a4);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  v10 = 0;
  if (PixelFormatType != 1882468912 && PixelFormatType != 1885745712)
    v10 = isYUV420(a4);
  self->_isYUV = isBufferYUV(a4);
  v11 = -[FRCImageProcessor shouldScaleBuffer:](self, "shouldScaleBuffer:", a4);
  self->_inputScaling = v11;
  if (!self->_inputRotation && !v11)
  {
    v12 = self->_isYUV ? v10 : 1;
    if ((v12 & 1) != 0)
    {
      self->_useGPUOnlyForPreProcessing = 1;
      self->_rgbaFirst = a3;
      self->_rgbaSecond = a4;
      self->_rgbaPixelFormat = -[FRCImageProcessor rgbaPixelFormatForBuffer:useScaler:](self, "rgbaPixelFormatForBuffer:useScaler:", a4, 0);
      goto LABEL_19;
    }
  }
  if (!self->_rgbaPixelFormat)
  {
    -[FRCImageProcessor allocteRGBABuffersForBuffer:](self, "allocteRGBABuffersForBuffer:", a4);
    if (a3)
      goto LABEL_15;
LABEL_17:
    v14 = *(int8x16_t *)&self->_rgbaFirst;
    *(int8x16_t *)&self->_rgbaFirst = vextq_s8(v14, v14, 8uLL);
    rgbaSecond = (__CVBuffer *)v14.i64[0];
    goto LABEL_18;
  }
  if (!a3)
    goto LABEL_17;
LABEL_15:
  -[FRCScaler downScaleFrameSource:destination:rotate:waitForCompletion:](self->_scaler, "downScaleFrameSource:destination:rotate:waitForCompletion:", a3, self->_rgbaFirst, self->_inputRotation, v5);
  rgbaSecond = self->_rgbaSecond;
LABEL_18:
  -[FRCScaler downScaleFrameSource:destination:rotate:waitForCompletion:](self->_scaler, "downScaleFrameSource:destination:rotate:waitForCompletion:", a4, rgbaSecond, self->_inputRotation, v5);
LABEL_19:
  normalization = self->_normalization;
  if (a3)
  {
    rgbaFirst = self->_rgbaFirst;
    normalizedFirst = self->_normalizedFirst;
  }
  else
  {
    rgbaFirst = 0;
    normalizedFirst = 0;
  }
  v18 = self->_rgbaSecond;
  normalizedSecond = self->_normalizedSecond;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__FRCImageProcessor_preProcessFirstInput_secondInput_waitForCompletion___block_invoke;
  v20[3] = &unk_1E97869B0;
  v20[4] = self;
  -[Normalization normalizeFramesFirstInput:secondInput:firstOutput:secondOutput:callback:](normalization, "normalizeFramesFirstInput:secondInput:firstOutput:secondOutput:callback:", rgbaFirst, v18, normalizedFirst, normalizedSecond, v20);
}

uint64_t __72__FRCImageProcessor_preProcessFirstInput_secondInput_waitForCompletion___block_invoke(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  __int128 v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *a2;
  *(_OWORD *)(v2 + 92) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)(v2 + 80) = v3;
  NSLog(CFSTR("Mean: %f, STD: %f, First: %f, %f, Second: %f, %f\n"), *(float *)a2, 1.0 / *((float *)a2 + 1), *((float *)a2 + 2), *((float *)a2 + 4), *((float *)a2 + 3), *((float *)a2 + 5));
  return kdebug_trace();
}

- (void)storeColorProperties:(__CVBuffer *)a3
{
  uint64_t v5;
  CFTypeRef v6;
  uint64_t v7;
  CFTypeRef v8;
  uint64_t v9;
  CFTypeRef v10;
  BOOL v11;
  NSDictionary *colorProperties;
  NSDictionary *v14;
  NSDictionary *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CA8D68];
  v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
  v7 = *MEMORY[0x1E0CA8E98];
  v8 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
  v9 = *MEMORY[0x1E0CA8EE8];
  v10 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0);
  if (v6)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11 || v10 == 0)
  {
    colorProperties = self->_colorProperties;
    self->_colorProperties = 0;

  }
  else
  {
    v16[0] = v5;
    v16[1] = v7;
    v17[0] = v6;
    v17[1] = v8;
    v16[2] = v9;
    v17[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = self->_colorProperties;
    self->_colorProperties = v14;

  }
}

- (BOOL)shouldCropOutputFrame:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  size_t v8;

  Width = CVPixelBufferGetWidth(a3);
  v8 = Width;
  Height = CVPixelBufferGetHeight(a3);
  if (Width < Height)
  {
    swapWidthAndHeight((uint64_t *)&v8, (uint64_t *)&Height);
    Width = v8;
  }
  return Width < self->_width || Height < self->_height;
}

- (void)postProcessNormalizedFrame:(__CVBuffer *)a3 output:(__CVBuffer *)a4 timeScale:(float)a5 waitForCompletion:(BOOL)a6
{
  _BOOL8 v6;
  BOOL inputScaling;
  NSDictionary *colorProperties;
  size_t Width;
  size_t Height;
  char v15;
  BOOL *p_useGPUOnlyForPreProcessing;
  __CVPixelBufferPool *denormalizedBufferPool;
  NSDictionary *v18;
  Normalization *normalization;
  _QWORD v20[5];
  BOOL v21;
  BOOL v22;
  CVPixelBufferRef pixelBufferOut;

  v6 = a6;
  if (self->_inputRotation)
    inputScaling = 1;
  else
    inputScaling = self->_inputScaling;
  colorProperties = self->_colorProperties;
  if (colorProperties)
    CMSetAttachments(a4, (CFDictionaryRef)colorProperties, 1u);
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v15 = Width | Height;
  if (((Width | Height) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[FRCImageProcessor postProcessNormalizedFrame:output:timeScale:waitForCompletion:].cold.1(Width, Height);
    pixelBufferOut = 0;
    p_useGPUOnlyForPreProcessing = &self->_useGPUOnlyForPreProcessing;
  }
  else
  {
    pixelBufferOut = 0;
    p_useGPUOnlyForPreProcessing = &self->_useGPUOnlyForPreProcessing;
    if (self->_useGPUOnlyForPreProcessing)
    {
      pixelBufferOut = a4;
      goto LABEL_17;
    }
  }
  denormalizedBufferPool = self->_denormalizedBufferPool;
  if (!denormalizedBufferPool)
  {
    denormalizedBufferPool = createPixelBufferPool(self->_width, self->_height, self->_rgbaPixelFormat, 0);
    self->_denormalizedBufferPool = denormalizedBufferPool;
  }
  CVPixelBufferPoolCreatePixelBuffer(0, denormalizedBufferPool, &pixelBufferOut);
  v18 = self->_colorProperties;
  if (v18 && *p_useGPUOnlyForPreProcessing)
    CMSetAttachments(pixelBufferOut, (CFDictionaryRef)v18, 1u);
LABEL_17:
  normalization = self->_normalization;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__FRCImageProcessor_postProcessNormalizedFrame_output_timeScale_waitForCompletion___block_invoke;
  v20[3] = &unk_1E97869D8;
  v21 = inputScaling;
  v22 = v6;
  v20[4] = self;
  -[Normalization denormalizeFrame:destination:params:timeScale:callback:](normalization, "denormalizeFrame:destination:params:timeScale:callback:", a3, pixelBufferOut, &self->_normalizationParams, v20, COERCE_DOUBLE((unint64_t)LODWORD(a5)));
  if (v15 & 1 | !self->_useGPUOnlyForPreProcessing)
  {
    -[FRCScaler upScaleAndCropFrameSource:destination:upscale:rotate:waitForCompletion:](self->_scaler, "upScaleAndCropFrameSource:destination:upscale:rotate:waitForCompletion:", pixelBufferOut, a4, self->_inputScaling, FRCGetReverseRotation(self->_inputRotation), v6);
    CVPixelBufferRelease(pixelBufferOut);
  }
  else if (v6)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __83__FRCImageProcessor_postProcessNormalizedFrame_output_timeScale_waitForCompletion___block_invoke(intptr_t result)
{
  if (!*(_BYTE *)(result + 40))
  {
    if (*(_BYTE *)(result + 41))
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(result + 32) + 112));
  }
  return result;
}

- (float)firstFramePixelMean
{
  return self->_normalizationParams.anchor_mean[0];
}

- (float)secondFramePixelMean
{
  return self->_normalizationParams.anchor_mean[1];
}

- (unsigned)rgbaPixelFormatForBuffer:(__CVBuffer *)a3 useScaler:(BOOL)a4
{
  _BOOL4 v4;
  OSType PixelFormatType;
  CFDictionaryRef v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  OSType v12;
  int v13;
  int v14;

  v4 = a4;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v7 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], PixelFormatType);
  -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90F0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9180]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    v12 = CVPixelBufferGetPixelFormatType(a3);
  }
  else
  {
    if (v4)
      v13 = 1999843442;
    else
      v13 = 1815162994;
    if (v9 == 10)
      v14 = v13;
    else
      v14 = 1380411457;
    if (v9 == 8)
      v12 = 1111970369;
    else
      v12 = v14;
  }

  return v12;
}

- (int64_t)inputRotation
{
  return self->_inputRotation;
}

- (void)setInputRotation:(int64_t)a3
{
  self->_inputRotation = a3;
}

- (__CVBuffer)normalizedFirst
{
  return self->_normalizedFirst;
}

- (__CVBuffer)normalizedSecond
{
  return self->_normalizedSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorProperties, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_normalization, 0);
}

- (void)postProcessNormalizedFrame:(uint64_t)a1 output:(uint64_t)a2 timeScale:waitForCompletion:.cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_debug_impl(&dword_1D425A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Output Buffer not aligned %ld x %ld", (uint8_t *)&v2, 0x16u);
}

@end
