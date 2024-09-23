@implementation FigCapturePixelConverter

- (FigCapturePixelConverter)init
{
  return -[FigCapturePixelConverter initWithPrefetchPool:](self, "initWithPrefetchPool:", 0);
}

- (FigCapturePixelConverter)initWithPrefetchPool:(BOOL)a3
{
  FigCapturePixelConverter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCapturePixelConverter;
  result = -[FigCapturePixelConverter init](&v5, sel_init);
  if (result)
    result->_prefetchPool = a3;
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[FigCapturePixelConverter _purgeResources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePixelConverter;
  -[FigCapturePixelConverter dealloc](&v3, sel_dealloc);
}

- (void)_purgeResources
{
  const void *v2;
  const void *v3;

  if (a1)
  {

    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v3 = *(const void **)(a1 + 8);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
}

- (int)updateOutputPixelFormat:(unsigned int)a3 dimensions:(id)a4 poolCapacity:(int)a5 colorSpaceProperties:(int)a6 alwaysUseHardwareForConversion:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v11;
  BWVideoFormat *outputFormat;
  int v14;
  BWVideoFormatRequirements *v15;
  BWVideoFormat *v16;
  int v17;
  BWVideoFormatRequirements *v19;
  uint64_t v20;
  _QWORD v21[2];

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  if (!self->_pool
    || self->_poolCapacity != a5
    || (outputFormat = self->_outputFormat) == 0
    || -[BWVideoFormat pixelFormat](outputFormat, "pixelFormat") != a3
    || -[BWVideoFormat width](self->_outputFormat, "width") != a4.var0
    || -[BWVideoFormat height](self->_outputFormat, "height") != *(uint64_t *)&a4 >> 32
    || -[BWVideoFormat colorSpaceProperties](self->_outputFormat, "colorSpaceProperties") != (_DWORD)v8
    || self->_alwaysUseHardwareForConversion != v7)
  {
    -[FigCapturePixelConverter _purgeResources]((uint64_t)self);
    self->_alwaysUseHardwareForConversion = v7;
    self->_poolCapacity = a5;
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1));
    -[BWVideoFormatRequirements setWidth:](v15, "setWidth:", a4.var0);
    -[BWVideoFormatRequirements setHeight:](v15, "setHeight:", *(uint64_t *)&a4 >> 32);
    -[BWVideoFormatRequirements setPlaneAlignment:](v15, "setPlaneAlignment:", *MEMORY[0x1E0C85AD8]);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v15, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v15, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForCacheProfile:](BWVideoFormatRequirements, "cacheModesForCacheProfile:", 2));
    v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v15, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1));
    v19 = v15;
    v16 = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1));
    self->_outputFormat = v16;
    if (v16)
    {
      v17 = -[FigCapturePixelConverter _buildBufferPool]((uint64_t)self);
      if (v17)
      {
        v14 = v17;
        fig_log_get_emitter();
      }
      else
      {
        v14 = -[FigCapturePixelConverter _buildTransferSession]((uint64_t)self);
        if (!v14)
          return v14;
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v14 = -12780;
    }
    -[FigCapturePixelConverter _purgeResources]((uint64_t)self);
    return v14;
  }
  return 0;
}

- (uint64_t)_buildBufferPool
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  BWPixelBufferPool *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 48);
    if (v2 >= 1)
    {
      if (v2 == 1)
      {
        v3 = 0;
      }
      else
      {
        v8 = *MEMORY[0x1E0CA8FF0];
        v6 = *MEMORY[0x1E0CBC020];
        v7 = &unk_1E49FA590;
        v9[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
        v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      }
      LOBYTE(v5) = 0;
      v4 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:", *(_QWORD *)(v1 + 32), *(int *)(v1 + 48), CFSTR("CapturePixelConverter"), 0, v3, 0, v5);
      *(_QWORD *)(v1 + 24) = v4;
      if (!v4)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 4294954510;
      }
      if (*(_BYTE *)(v1 + 52))
        -[BWPixelBufferPool prefetchWithCompletionHandler:](v4, "prefetchWithCompletionHandler:", 0);
    }
    return 0;
  }
  return result;
}

- (uint64_t)_buildTransferSession
{
  VTSessionRef *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    v2 = (VTSessionRef *)(a1 + 8);
    v3 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)(a1 + 8));
    if ((_DWORD)v3)
    {
      v12 = v3;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v12;
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "colorSpaceProperties");
    if (*(_DWORD *)(a1 + 48) == 1 && !*(_BYTE *)(a1 + 16))
    {
      v5 = (const void *)*MEMORY[0x1E0C9AE40];
      VTSessionSetProperty(*v2, (CFStringRef)*MEMORY[0x1E0CED800], (CFTypeRef)*MEMORY[0x1E0C9AE40]);
      if (!(_DWORD)v4)
        VTSessionSetProperty(*v2, (CFStringRef)*MEMORY[0x1E0CED7F8], v5);
    }
    v6 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", v4);
    if (v6)
    {
      v7 = v6;
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CED7E0]);
      v10 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CED7C0]);
      v11 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CED7D8]);
      VTSessionSetProperties(*v2, (CFDictionaryRef)v8);

    }
  }
  return 0;
}

- (int)convertSampleBuffer:(opaqueCMSampleBuffer *)a3 cropRect:(CGRect)a4 outputSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  CFDictionaryRef DictionaryRepresentation;
  OSStatus v17;
  int CopyWithNewPixelBuffer;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v13 = ImageBuffer;
  v14 = -[BWPixelBufferPool newPixelBuffer](self->_pool, "newPixelBuffer");
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  v15 = v14;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectIsEmpty(v20))
  {
    DictionaryRepresentation = 0;
  }
  else
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v21);
  }
  v17 = VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
  if (v17 || (v17 = VTPixelTransferSessionTransferImage(self->_transferSession, v13, v15)) != 0)
  {
    CopyWithNewPixelBuffer = v17;
    fig_log_get_emitter();
  }
  else
  {
    CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v15, (CFTypeRef *)&self->_outputFormatDescription, a5);
    if (!CopyWithNewPixelBuffer)
      goto LABEL_9;
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_9:
  CFRelease(v15);
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  return CopyWithNewPixelBuffer;
}

- (int)convertPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 allocateOutputFromBufferPool:(BOOL)a5 outputPixelBuffer:(__CVBuffer *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CFDictionaryRef DictionaryRepresentation;
  int v14;
  int v15;
  OSStatus v16;
  CVPixelBufferRef v17;
  CVPixelBufferRef destinationBuffer;
  CGRect v20;
  CGRect v21;

  destinationBuffer = 0;
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    DictionaryRepresentation = 0;
    v14 = -12780;
    goto LABEL_13;
  }
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a5)
  {
    destinationBuffer = -[BWPixelBufferPool newPixelBuffer](self->_pool, "newPixelBuffer");
    if (!destinationBuffer)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      DictionaryRepresentation = 0;
      v14 = -12786;
      goto LABEL_13;
    }
  }
  else
  {
    v15 = BWCreateIOSurfaceBackedCVPixelBuffer(-[BWVideoFormat width](self->_outputFormat, "width"), -[BWVideoFormat height](self->_outputFormat, "height"), -[BWVideoFormat pixelFormat](self->_outputFormat, "pixelFormat"), &destinationBuffer, CFSTR("PixelConverter Output"));
    if (v15)
    {
      v14 = v15;
      fig_log_get_emitter();
      FigDebugAssert3();
      DictionaryRepresentation = 0;
      goto LABEL_13;
    }
  }
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectIsEmpty(v20))
  {
    DictionaryRepresentation = 0;
  }
  else
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v21);
  }
  v16 = VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
  if (v16 || (v16 = VTPixelTransferSessionTransferImage(self->_transferSession, a3, destinationBuffer)) != 0)
  {
    v14 = v16;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    v17 = destinationBuffer;
    *a6 = destinationBuffer;
    if (!v17)
    {
      v14 = 0;
      if (!DictionaryRepresentation)
        return v14;
      goto LABEL_16;
    }
    CFRetain(v17);
    v14 = 0;
  }
LABEL_13:
  if (destinationBuffer)
    CFRelease(destinationBuffer);
  if (DictionaryRepresentation)
LABEL_16:
    CFRelease(DictionaryRepresentation);
  return v14;
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

@end
