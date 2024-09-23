@implementation BWVisionPreviewRegistrationProvider

+ (void)initialize
{
  objc_opt_class();
}

- (BWVisionPreviewRegistrationProvider)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4
{
  BWVisionPreviewRegistrationProvider *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWVisionPreviewRegistrationProvider;
  v6 = -[BWVisionPreviewRegistrationProvider init](&v12, sel_init);
  if (v6)
  {
    if (!a3
      || (v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]),
          v8 = (_QWORD *)MEMORY[0x1E0D05960],
          v7)
      && (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05960]), &v6->_superWideOpticalCenterOffset)|| FigMotionSphereShiftStateInitialize((uint64_t)&v6->_superWideToWideShiftState, (const __CFDictionary *)a3, 7))|| (v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18])) != 0&& !CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v9, "objectForKeyedSubscript:", *v8), &v6->_wideOpticalCenterOffset)|| (v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30])) != 0&& (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v10, "objectForKeyedSubscript:", *v8), &v6->_teleOpticalCenterOffset)|| FigMotionSphereShiftStateInitialize((uint64_t)&v6->_wideToTeleShiftState, (const __CFDictionary *)a3, 7)))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    else
    {
      v6->_sensorBinningFactor = ($470D365275581EF16070F5A11344F73E)a4;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BWVisionPreviewRegistrationProvider cleanupResources](self, "cleanupResources");
  v3.receiver = self;
  v3.super_class = (Class)BWVisionPreviewRegistrationProvider;
  -[BWVisionPreviewRegistrationProvider dealloc](&v3, sel_dealloc);
}

- (void)allocateResourcesWithVideoFormat:(id)a3 metalContext:(id)a4
{
  BWVideoFormatRequirements *v6;
  OpaqueVTPixelRotationSession **p_registrationRotationSession;
  OpaqueVTPixelRotationSession *registrationRotationSession;
  BWVideoFormatRequirements *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_registrationPool)
  {
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", (int)FigCaptureRoundFloatToMultipleOf(4, (float)(unint64_t)objc_msgSend(a3, "width") * 0.3));
    -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", (int)FigCaptureRoundFloatToMultipleOf(4, (float)(unint64_t)objc_msgSend(a3, "height")));
    v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend(a3, "pixelFormat")));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
    v9 = v6;
    self->_registrationPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1)), 2, CFSTR("BWVisionPreviewRegistrationProvider"));
  }
  registrationRotationSession = self->_registrationRotationSession;
  p_registrationRotationSession = &self->_registrationRotationSession;
  if (!registrationRotationSession)
  {
    VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], p_registrationRotationSession);
    VTSessionSetProperty(*p_registrationRotationSession, (CFStringRef)*MEMORY[0x1E0CED768], MEMORY[0x1E0C9AAB0]);
  }
}

- (void)cleanupResources
{
  OpaqueVTPixelRotationSession *registrationRotationSession;
  OpaqueVTPixelRotationSession *v4;

  self->_registrationPool = 0;
  registrationRotationSession = self->_registrationRotationSession;
  if (registrationRotationSession)
  {
    VTPixelRotationSessionInvalidate(registrationRotationSession);
    v4 = self->_registrationRotationSession;
    if (v4)
    {
      CFRelease(v4);
      self->_registrationRotationSession = 0;
    }
  }
}

- ($D21EB8FBA11123F39B42670AFF832137)registerWiderCamera:(SEL)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(opaqueCMSampleBuffer *)a5 isMacroScene:(double)a6 macroTransitionType:(BOOL)a7
{
  _BOOL4 v8;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  BOOL v18;
  void *v19;
  double v20;
  double v21;
  CGFloat v22;
  BOOL v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  int v33;
  $D21EB8FBA11123F39B42670AFF832137 *result;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;

  v8 = a7;
  v44 = 0;
  v14 = (void *)MEMORY[0x1A858DD40](self, a3, a4, a5, a7, *(_QWORD *)&a8);
  v15 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 1, a4, a5, 0, v8, &v44, a6);
  v17 = v16;
  v18 = v44 == 0;
  objc_autoreleasePoolPop(v14);
  v19 = (void *)MEMORY[0x1A858DD40]();
  v20 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 0, a4, a5, 0, v8, &v44, a6);
  v22 = v21;
  v23 = v44 == 0;
  objc_autoreleasePoolPop(v19);
  v24 = (void *)MEMORY[0x1A858DD40]();
  v25 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 1, a4, a5, 1, v8, &v44, a6);
  v27 = v26;
  v28 = v44;
  objc_autoreleasePoolPop(v24);
  v29 = (void *)MEMORY[0x1A858DD40]();
  v30 = -[BWVisionPreviewRegistrationProvider _shiftCorrectionForLeftStrip:byRegisteringWide:tele:centerBias:widerToNarrowerCameraScale:isMacroScene:err:]((uint64_t)self, 0, a4, a5, 1, v8, &v44, a6);
  v32 = v31;
  v33 = v44;
  objc_autoreleasePoolPop(v29);
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[0].var1.y = 0u;
  retstr->var0[2].var1.y = 0.0;
  retstr->var0[1].var1 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
  retstr->var0[0].var0 = v18;
  retstr->var0[0].var1.x = v15;
  retstr->var0[0].var1.y = v17;
  retstr->var0[1].var0 = v23;
  retstr->var0[1].var1.x = v20;
  retstr->var0[1].var1.y = v22;
  if (v28 && v33)
  {
    v35 = 0;
    retstr->var0[2].var1 = (CGPoint)*MEMORY[0x1E0C9D538];
  }
  else
  {
    v36 = -0.0;
    if (v28)
      v37 = -0.0;
    else
      v37 = v25;
    v38 = v37 + *MEMORY[0x1E0C9D538];
    if (v28)
      v39 = -0.0;
    else
      v39 = v27;
    v40 = v39 + *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v33)
      v41 = -0.0;
    else
      v41 = v30;
    v42 = v41 + v38;
    if (!v33)
      v36 = v32;
    v43 = v36 + v40;
    if (!(v28 | v33))
    {
      v42 = v42 * 0.5;
      v43 = v43 * 0.5;
    }
    retstr->var0[2].var1.x = v42;
    retstr->var0[2].var1.y = v43;
    v35 = 1;
  }
  retstr->var0[2].var0 = v35;
  return result;
}

- (double)_shiftCorrectionForLeftStrip:(CMSampleBufferRef)sbuf byRegisteringWide:(opaqueCMSampleBuffer *)a4 tele:(int)a5 centerBias:(int)a6 widerToNarrowerCameraScale:(int *)a7 isMacroScene:(double)a8 err:
{
  __CVBuffer *ImageBuffer;
  __CVBuffer *v16;
  const __CFString *v17;
  int v18;
  int v19;
  __CVBuffer *v20;
  uint64_t v21;
  const void *v22;
  double v23;
  double v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v34;
  CGFloat b;
  CGFloat d;
  float MinX;
  double v41;
  double c;
  float MaxX;
  CGFloat v44;
  CGFloat v45;
  double y;
  double width;
  double height;
  float v49;
  float v50;
  float v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  double ty;
  double tx;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int v66;
  double v68;
  int *v70;
  double v71;
  double v72;
  CGAffineTransform v73;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v76;
  CGAffineTransform rect;
  _QWORD v78[3];
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v78[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  v16 = CMSampleBufferGetImageBuffer(a4);
  v71 = *MEMORY[0x1E0C9D538];
  v72 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v17 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v18 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), "isEqualToString:", *MEMORY[0x1E0D05A28]);
  if (!ImageBuffer || !v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v66 = -12780;
    if (!a7)
      return v71;
    goto LABEL_37;
  }
  v19 = v18;
  v70 = a7;
  v20 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 8), "newPixelBuffer");
  v21 = objc_msgSend(*(id *)(a1 + 8), "newPixelBuffer");
  v22 = (const void *)v21;
  if (v20 && v21)
  {
    v68 = a8;
    psn_pixelBufferRect(v20);
    v24 = v23;
    v25 = (void *)CMGetAttachment(a4, v17, 0);
    rect.a = psn_pixelBufferRect(v16);
    rect.b = v26;
    rect.c = v27;
    rect.d = v28;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]), (CGRect *)&rect);
    v76.a = 0.0;
    v76.b = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v76.c = _Q0;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), (CGRect *)&v76);
    if (a5)
    {
      v79.origin.x = v76.a;
      v79.origin.y = v76.b;
      v79.size.width = v76.c;
      v79.size.height = v76.d;
      v80 = CGRectInset(v79, 0.25, 0.0);
      v76.a = v80.origin.x;
      v76.b = v80.origin.y;
      v76.c = v80.size.width;
      v76.d = v80.size.height;
    }
    CVPixelBufferGetWidth(v16);
    CVPixelBufferGetHeight(v16);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(v76.a, v76.b, v76.c, v76.d);
    b = rect.b;
    d = rect.d;
    if (a2)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v34);
      v41 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, MinX);
      if (rect.c >= v24)
        c = v24;
      else
        c = rect.c;
    }
    else
    {
      if (rect.c >= v24)
        c = v24;
      else
        c = rect.c;
      MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      v41 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, MaxX) - c;
    }
    if (VTPixelRotationSessionRotateSubImage())
    {
      fig_log_get_emitter();
    }
    else
    {
      v44 = (double)CVPixelBufferGetWidth(v16) * 0.5;
      v45 = (double)CVPixelBufferGetHeight(v16) * 0.5;
      memset(&rect, 0, sizeof(rect));
      CGAffineTransformMakeTranslation(&rect, -v44, -v45);
      CGAffineTransformMakeScale(&t2, 1.0 / v68, 1.0 / v68);
      t1 = rect;
      CGAffineTransformConcat(&v76, &t1, &t2);
      rect = v76;
      CGAffineTransformMakeTranslation(&v73, v44, v45);
      t1 = rect;
      CGAffineTransformConcat(&v76, &t1, &v73);
      rect = v76;
      v81.origin.x = v41;
      v81.origin.y = b;
      v81.size.width = c;
      v81.size.height = d;
      v82 = CGRectApplyAffineTransform(v81, &v76);
      y = v82.origin.y;
      width = v82.size.width;
      height = v82.size.height;
      *(float *)&v82.origin.x = v82.origin.x;
      FigCaptureRoundFloatToMultipleOf(1, *(float *)&v82.origin.x);
      v49 = y;
      FigCaptureRoundFloatToMultipleOf(1, v49);
      v50 = width;
      FigCaptureRoundFloatToMultipleOf(2, v50);
      v51 = height;
      FigCaptureRoundFloatToMultipleOf(2, v51);
      if (!VTPixelRotationSessionRotateSubImage())
      {
        v52 = objc_alloc((Class)getVNImageRequestHandlerClass());
        v53 = MEMORY[0x1E0C9AA70];
        v54 = (void *)objc_msgSend(v52, "initWithCVPixelBuffer:options:", v22, MEMORY[0x1E0C9AA70]);
        v55 = (void *)objc_msgSend(objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass()), "initWithTargetedCVPixelBuffer:options:", v20, v53);
        t1.a = 0.0;
        v78[0] = v55;
        tx = v71;
        ty = v72;
        if (objc_msgSend(v54, "performRequests:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1), &t1))
        {
          v58 = (void *)objc_msgSend((id)objc_msgSend(v55, "results"), "firstObject");
          if (v58)
          {
            v59 = v58;
            objc_msgSend(v58, "alignmentTransform");
            tx = rect.tx;
            objc_msgSend(v59, "alignmentTransform");
            ty = v76.ty;
          }
          else
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            tx = v71;
            ty = v72;
          }
        }

        v60 = tx / v68;
        v61 = 0.01;
        v62 = 0.05;
        if (v19)
          v61 = 0.05;
        else
          v62 = 0.042;
        if (a6)
          v63 = v61 * 1.5;
        else
          v63 = v61;
        if (a6)
          v64 = v62 * 1.5;
        else
          v64 = v62;
        v65 = (double)CVPixelBufferGetWidth(ImageBuffer);
        v66 = -12780;
        if (fabs(v60) <= round(v64 * v65) && fabs(-ty / v68) <= round(v63 * v65))
        {
          v66 = 0;
          v71 = v60;
        }
        goto LABEL_33;
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    v66 = -12780;
LABEL_33:
    CFRelease(v20);
    goto LABEL_34;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v66 = -12780;
  if (v20)
    goto LABEL_33;
LABEL_34:
  if (v22)
    CFRelease(v22);
  a7 = v70;
  if (v70)
LABEL_37:
    *a7 = v66;
  return v71;
}

- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5
{
  const __CFString *v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  int v12;
  double Seconds;
  double v14;
  __CVBuffer *ImageBuffer;
  size_t Width;
  size_t Height;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  float64x2_t v22;
  float v23;
  double v24;
  double v25;
  uint64_t v26;
  float64x2_t v27;
  float64x2_t v28;
  CMTime v29;
  CMTime time;
  double v31;
  double v32;
  CGPoint result;

  v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v10 = (const __CFDictionary *)CMGetAttachment(a4, v8, 0);
  v11 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D05A28]);
  CMSampleBufferGetPresentationTimeStamp(&time, a3);
  Seconds = CMTimeGetSeconds(&time);
  CMSampleBufferGetPresentationTimeStamp(&v29, a4);
  v14 = CMTimeGetSeconds(&v29);
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(ImageBuffer);
  v31 = 0.0;
  v32 = 0.0;
  v18 = 720;
  if (v12)
    v18 = 80;
  v19 = 40;
  v20 = 24;
  if (!v12)
  {
    v20 = 40;
    v19 = 56;
  }
  v21 = (char *)self + v18;
  v22 = *(float64x2_t *)((char *)&self->super.isa + v20);
  v27 = *(float64x2_t *)((char *)&self->super.isa + v19);
  v28 = v22;
  v23 = (float)Height;
  FigMotionSphereShiftStateUpdateWithMetadata((uint64_t)self + v18, (CFDictionaryRef)v9);
  LODWORD(v26) = self->_sensorBinningFactor.height;
  FigMotionComputeWideToNarrowShift((const __CFDictionary *)v9, v10, 0, &v28, &v27, (int)(float)Width, (int)v23, self->_sensorBinningFactor.width, Seconds, v14, 0.0, v26, 0, (uint64_t)v21, &v31, 0);
  v24 = -v31;
  v25 = -v32;
  result.y = v25;
  result.x = v24;
  return result;
}

@end
