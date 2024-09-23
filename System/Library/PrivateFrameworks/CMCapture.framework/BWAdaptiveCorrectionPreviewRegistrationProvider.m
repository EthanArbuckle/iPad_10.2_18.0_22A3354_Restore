@implementation BWAdaptiveCorrectionPreviewRegistrationProvider

- (CGPoint)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 widerToNarrowerCameraScale:(double)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BYTE __dst[288];
  double v13;
  double v14;
  _OWORD __src[18];
  CGPoint result;

  memset(__src, 0, sizeof(__src));
  v7 = 1.0 / a6;
  if (-[BWAdaptiveCorrectionPreviewRegistration computeApproximateCorrectionForWiderCamera:narrowerCameraPortType:narrowerPixelBufferDimensions:narrowerToWiderCameraScale:narrowerToWiderTransformsOut:](self->_registration, "computeApproximateCorrectionForWiderCamera:narrowerCameraPortType:narrowerPixelBufferDimensions:narrowerToWiderCameraScale:narrowerToWiderTransformsOut:", a3, a4, a5, __src, 1.0 / a6))
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    memcpy(__dst, __src, sizeof(__dst));
    +[BWAdaptiveCorrectionPreviewRegistration flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:](BWAdaptiveCorrectionPreviewRegistration, "flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:", __dst, a5, 1, 0.0, 0.0, 1.0, 1.0, v7);
    v8 = -v13;
    v9 = -v14;
  }
  v10 = v8;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BWAdaptiveCorrectionPreviewRegistrationProvider)initWithCameraInfoByPortType:(id)a3 excludeStaticComponentFromAlignmentShifts:(BOOL)a4
{
  _BOOL8 v4;
  BWAdaptiveCorrectionPreviewRegistrationProvider *v6;
  BWAdaptiveCorrectionPreviewRegistration *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationProvider;
  v6 = -[BWAdaptiveCorrectionPreviewRegistrationProvider init](&v9, sel_init);
  if (v6)
  {
    v7 = -[BWAdaptiveCorrectionPreviewRegistration initWithCameraInfoByPortType:excludeStaticComponentFromAlignmentShifts:]([BWAdaptiveCorrectionPreviewRegistration alloc], "initWithCameraInfoByPortType:excludeStaticComponentFromAlignmentShifts:", a3, v4);
    v6->_registration = v7;
    if (!v7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v6;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[BWAdaptiveCorrectionPreviewRegistrationProvider cleanupResources](self, "cleanupResources");

  v3.receiver = self;
  v3.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationProvider;
  -[BWAdaptiveCorrectionPreviewRegistrationProvider dealloc](&v3, sel_dealloc);
}

- (void)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4
{
  -[BWAdaptiveCorrectionPreviewRegistration allocateResourcesWithVideoFormat:metalContext:](self->_registration, "allocateResourcesWithVideoFormat:metalContext:", a3, a4);
}

- (void)cleanupResources
{
  -[BWAdaptiveCorrectionPreviewRegistration cleanupResources](self->_registration, "cleanupResources");
}

- ($D21EB8FBA11123F39B42670AFF832137)registerWiderCamera:(SEL)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(opaqueCMSampleBuffer *)a5 isMacroScene:(double)a6 macroTransitionType:(BOOL)a7
{
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $D21EB8FBA11123F39B42670AFF832137 *result;
  __CVBuffer *ImageBuffer;
  unsigned int Width;
  void *v19;
  CGPoint *p_var1;
  uint64_t i;
  _BYTE v27[576];
  CGRect rect;
  _OWORD __src[18];

  retstr->var0[2].var1.y = 0.0;
  retstr->var0[1].var1 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
  v11 = (double *)MEMORY[0x1E0C9D648];
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[0].var1.y = 0u;
  v12 = *v11;
  v13 = v11[1];
  v14 = v11[2];
  v15 = v11[3];
  memset(__src, 0, sizeof(__src));
  result = ($D21EB8FBA11123F39B42670AFF832137 *)-[BWAdaptiveCorrectionPreviewRegistration registerWiderSampleBufferUsingADC:narrowerSampleBuffer:narrowerRect:macroTransitionType:narrowerToWiderTransformsOut:](self->_registration, "registerWiderSampleBufferUsingADC:narrowerSampleBuffer:narrowerRect:macroTransitionType:narrowerToWiderTransformsOut:", a4, a5, *(_QWORD *)&a8, __src, v12, v13, v14, v15);
  if (!(_DWORD)result)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a5);
    Width = CVPixelBufferGetWidth(ImageBuffer);
    LODWORD(ImageBuffer) = CVPixelBufferGetHeight(ImageBuffer);
    v19 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    rect.origin.y = 0.0;
    rect.origin.x = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    rect.size = _Q0;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), &rect);
    memcpy(v27, __src, 0x120uLL);
    result = ($D21EB8FBA11123F39B42670AFF832137 *)+[BWAdaptiveCorrectionPreviewRegistration flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:](BWAdaptiveCorrectionPreviewRegistration, "flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:", v27, Width | ((unint64_t)ImageBuffer << 32), 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 1.0 / a6);
    p_var1 = &retstr->var0[0].var1;
    for (i = 64; i != 352; i += 96)
    {
      *(float64x2_t *)p_var1 = vnegq_f64(*(float64x2_t *)&v27[i + 288]);
      LOBYTE(p_var1[-1].y) = 1;
      p_var1 = (CGPoint *)((char *)p_var1 + 24);
    }
  }
  return result;
}

- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5
{
  double v7;
  double v8;
  __CVBuffer *ImageBuffer;
  unsigned int Width;
  void *v11;
  _BYTE v17[288];
  double v18;
  double v19;
  CGRect rect;
  _OWORD __src[18];
  CGPoint result;

  memset(__src, 0, sizeof(__src));
  if (-[BWAdaptiveCorrectionPreviewRegistration computeAlignmentFromWiderSampleBuffer:narrowerSampleBuffer:narrowerToWiderTransformsOut:](self->_registration, "computeAlignmentFromWiderSampleBuffer:narrowerSampleBuffer:narrowerToWiderTransformsOut:", a3, a4, __src))
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    Width = CVPixelBufferGetWidth(ImageBuffer);
    LODWORD(ImageBuffer) = CVPixelBufferGetHeight(ImageBuffer);
    v11 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    rect.origin.y = 0.0;
    rect.origin.x = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    rect.size = _Q0;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), &rect);
    memcpy(v17, __src, sizeof(v17));
    +[BWAdaptiveCorrectionPreviewRegistration flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:](BWAdaptiveCorrectionPreviewRegistration, "flattenNarrowerToWiderTransforms:narrowerDimensions:narrowerFinalCropRect:atNarrowerToWiderCameraScale:useYAnchorAtHeightCenter:", v17, Width | ((unint64_t)ImageBuffer << 32), 1, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 1.0 / a5);
    v7 = -v18;
    v8 = -v19;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

@end
