@implementation FigM2MController

- (FigM2MController)init
{
  const __CFAllocator *v3;
  __IOSurfaceAccelerator **p_accelRef;
  FigM2MController *v5;
  __CFDictionary *runOptions;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  p_accelRef = &self->_accelRef;
  if (IOSurfaceAcceleratorCreate() || -[FigM2MController queryCapabilities](self, "queryCapabilities"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    if (*p_accelRef)
      CFRelease(*p_accelRef);
    runOptions = self->_runOptions;
    if (runOptions)
      CFRelease(runOptions);
    v5 = 0;
  }
  else
  {
    self->_useCustomCoeff = 0;
    self->_runOptions = CFDictionaryCreateMutable(v3, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5 = self;
  }

  return v5;
}

- (int)queryCapabilities
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  CFTypeRef v6;
  const void *v7;
  int v8;

  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("AppleM2ScalerCSCDriver");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
    return 0;
  v5 = MatchingService;
  v6 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("IOSurfaceAcceleratorCapabilitiesDict"), 0, 0);
  if (v6)
  {
    v7 = v6;
    if (FigCFDictionaryGetInt32IfPresent()
      && FigCFDictionaryGetInt32IfPresent()
      && FigCFDictionaryGetInt32IfPresent()
      && FigCFDictionaryGetInt32IfPresent()
      && FigCFDictionaryGetInt32IfPresent()
      && FigCFDictionaryGetInt32IfPresent()
      && FigCFDictionaryGetCGFloatIfPresent()
      && FigCFDictionaryGetCGFloatIfPresent()
      && FigCFDictionaryGetCGFloatIfPresent()
      && FigCFDictionaryGetCGFloatIfPresent())
    {
      v8 = 0;
    }
    else
    {
      v8 = -1;
    }
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  IOObjectRelease(v5);
  return v8;
}

- (int)setCustomFilter:(int)a3 alignment:(int)a4 sourceWidth:(unint64_t)a5 sourceHeight:(unint64_t)a6 destinationWidth:(unint64_t)a7 destinationHeight:(unint64_t)a8 luma_param:(float)a9 chroma_param:(float)a10
{
  unsigned int *v19;
  unsigned int *v20;
  int vTaps;
  int vPhases;
  unsigned int *v23;
  unsigned int *v24;
  int hTaps;
  int hPhases;
  unsigned int *v27;
  int prePointBits;
  int postPointBits;
  float v30;
  int v31;
  int v33;
  int v34;
  unsigned int *v35;
  unsigned int *v36;
  int v37;

  self->_useCustomCoeff = 1;
  v19 = (unsigned int *)malloc_type_calloc(1uLL, 8 * (self->_cap.hPhases * self->_cap.hTaps + self->_cap.vPhases * self->_cap.vTaps), 0x100004052888210uLL);
  if (!v19)
    return -536870211;
  v20 = v19;
  if (a3 == 3)
  {
    filter_coefficients(self->_cap.vTaps, self->_cap.vPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v19, (float)a8 / (float)a6);
    vTaps = self->_cap.vTaps;
    vPhases = self->_cap.vPhases;
    v23 = &v20[vPhases * vTaps];
    filter_coefficients(vTaps, vPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v23, (float)a8 / (float)a6);
    v24 = &v23[self->_cap.vPhases * self->_cap.vTaps];
    filter_coefficients(self->_cap.hTaps, self->_cap.hPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v24, (float)a7 / (float)a5);
    hTaps = self->_cap.hTaps;
    hPhases = self->_cap.hPhases;
    v27 = &v24[hPhases * hTaps];
    prePointBits = self->_cap.prePointBits;
    postPointBits = self->_cap.postPointBits;
    v30 = (float)a7 / (float)a5;
    v31 = 3;
  }
  else
  {
    filter_coefficients(self->_cap.vTaps, self->_cap.vPhases, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v19, a10);
    v33 = self->_cap.vTaps;
    v34 = self->_cap.vPhases;
    v35 = &v20[v34 * v33];
    filter_coefficients(v33, v34, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v35, a9);
    v36 = &v35[self->_cap.vPhases * self->_cap.vTaps];
    filter_coefficients(self->_cap.hTaps, self->_cap.hPhases, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v36, a10);
    hTaps = self->_cap.hTaps;
    hPhases = self->_cap.hPhases;
    v27 = &v36[hPhases * hTaps];
    prePointBits = self->_cap.prePointBits;
    postPointBits = self->_cap.postPointBits;
    v30 = a9;
    v31 = a3;
  }
  filter_coefficients(hTaps, hPhases, v31, a4, prePointBits, postPointBits, v27, v30);
  v37 = IOSurfaceAcceleratorSetCustomFilter();
  free(v20);
  return v37;
}

- (void)dealloc
{
  __IOSurfaceAccelerator *accelRef;
  __CFDictionary *runOptions;
  objc_super v5;

  accelRef = self->_accelRef;
  if (accelRef)
    CFRelease(accelRef);
  runOptions = self->_runOptions;
  if (runOptions)
    CFRelease(runOptions);
  v5.receiver = self;
  v5.super_class = (Class)FigM2MController;
  -[FigM2MController dealloc](&v5, sel_dealloc);
}

- (CGSize)maxUpscale
{
  double width;
  double height;
  CGSize result;

  width = self->_cap.maxUpscale.width;
  height = self->_cap.maxUpscale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)maxDownscale
{
  double width;
  double height;
  CGSize result;

  width = self->_cap.maxDownscale.width;
  height = self->_cap.maxDownscale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)setCustomFilter:(int)a3 alignment:(int)a4 src:(__CVBuffer *)a5 dst:(__CVBuffer *)a6 luma_param:(float)a7 chroma_param:(float)a8
{
  uint64_t v12;
  uint64_t v13;
  size_t Width;
  size_t Height;
  size_t v17;
  size_t v18;
  double v19;
  double v20;

  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  Width = CVPixelBufferGetWidth(a5);
  Height = CVPixelBufferGetHeight(a5);
  v17 = CVPixelBufferGetWidth(a6);
  v18 = CVPixelBufferGetHeight(a6);
  *(float *)&v19 = a7;
  *(float *)&v20 = a8;
  return -[FigM2MController setCustomFilter:alignment:sourceWidth:sourceHeight:destinationWidth:destinationHeight:luma_param:chroma_param:](self, "setCustomFilter:alignment:sourceWidth:sourceHeight:destinationWidth:destinationHeight:luma_param:chroma_param:", v13, v12, Width, Height, v17, v18, v19, v20);
}

- (int)setHistogramMode:(int)a3 dstRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A258], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A268], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x));
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A270], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y));
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A278], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width));
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A260], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height));
  return 0;
}

- (int)copyHistogram:(id *)a3
{
  if (a3)
    return IOSurfaceAcceleratorGetHistogram();
  fig_log_get_emitter();
  FigDebugAssert3();
  return -536870911;
}

- (int)clearHistorgramMode
{
  CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A258]);
  CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A268]);
  CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A270]);
  CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A278]);
  CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A260]);
  return 0;
}

- (int)_transform:(__CVBuffer *)a3 srcRect:(CGRect)a4 dst:(__CVBuffer *)a5 dstRect:(CGRect)a6 symmetricTransform:(unsigned int)a7 sync_m2m:(BOOL)a8
{
  uint64_t v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v16;
  CGFloat v17;
  const void **v18;
  int result;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v8 = *(_QWORD *)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  v16 = CVPixelBufferGetIOSurface(a5);
  if (!self->_accelRef)
    goto LABEL_16;
  if (!IOSurface)
    goto LABEL_16;
  if (!v16)
    goto LABEL_16;
  if (!IOSurfaceGetCompressionTypeOfPlane())
    goto LABEL_19;
  v17 = (double)CVPixelBufferGetWidth(a5);
  v22.size.height = (double)CVPixelBufferGetHeight(a5);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v22.size.width = v17;
  if (CGRectEqualToRect(v20, v22)
    || (v21.origin.x = x, v21.origin.y = y, v21.size.width = width, v21.size.height = height, CGRectIsNull(v21)))
  {
LABEL_19:
    if (self->_useCustomCoeff)
      v18 = (const void **)MEMORY[0x1E0C9AE50];
    else
      v18 = (const void **)MEMORY[0x1E0C9AE40];
    CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A340], *v18);
    if ((_DWORD)v8)
      CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A330], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
    else
      CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E0D3A330]);
    result = IOSurfaceAcceleratorTransformSurface();
    if (result)
      return -1;
  }
  else
  {
LABEL_16:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)transform:(__CVBuffer *)a3 srcRect:(CGRect)a4 dst:(__CVBuffer *)a5 dstRect:(CGRect)a6 rotate:(int)a7 flipX:(BOOL)a8 flipY:(BOOL)a9 sync_m2m:(BOOL)a10
{
  unsigned int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;

  v10 = a9 | 2;
  if (!a8)
    v10 = a9;
  v11 = v10 ^ 3;
  v12 = v10 ^ 7;
  if (a7 == 6)
    v10 |= 4u;
  if (a7 == 8)
    v10 = v12;
  if (a7 == 3)
    v13 = v11;
  else
    v13 = v10;
  return -[FigM2MController _transform:srcRect:dst:dstRect:symmetricTransform:sync_m2m:](self, "_transform:srcRect:dst:dstRect:symmetricTransform:sync_m2m:", a3, a5, v13, a10, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (int)transform:(__CVBuffer *)a3 srcRect:(CGRect)a4 dst:(__CVBuffer *)a5 dstRect:(CGRect)a6 rotate:(int)a7 sync_m2m:(BOOL)a8
{
  uint64_t v8;

  if ((a7 - 3) > 5)
    v8 = 0;
  else
    v8 = dword_1D330574C[a7 - 3];
  return -[FigM2MController _transform:srcRect:dst:dstRect:symmetricTransform:sync_m2m:](self, "_transform:srcRect:dst:dstRect:symmetricTransform:sync_m2m:", a3, a5, v8, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (int)transform:(__CVBuffer *)a3 srcRect:(CGRect)a4 dst:(__CVBuffer *)a5 sync_m2m:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  double v14;

  if (a3)
  {
    v6 = a6;
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v14 = (float)CVPixelBufferGetWidth(a5);
    return -[FigM2MController transform:srcRect:dst:dstRect:rotate:sync_m2m:](self, "transform:srcRect:dst:dstRect:rotate:sync_m2m:", a3, a5, 1, v6, x, y, width, height, 0.0, 0.0, v14, (float)CVPixelBufferGetHeight(a5));
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
}

- (int)downsample:(__CVBuffer *)a3 dst:(__CVBuffer *)a4 sync_m2m:(BOOL)a5
{
  _BOOL8 v5;
  double Width;

  v5 = a5;
  Width = (double)CVPixelBufferGetWidth(a3);
  return -[FigM2MController transform:srcRect:dst:sync_m2m:](self, "transform:srcRect:dst:sync_m2m:", a3, a4, v5, 0.0, 0.0, Width, (double)CVPixelBufferGetHeight(a3));
}

@end
