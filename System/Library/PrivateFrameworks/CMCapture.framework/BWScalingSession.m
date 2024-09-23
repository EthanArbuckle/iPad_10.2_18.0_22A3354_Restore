@implementation BWScalingSession

- (BWScalingSession)init
{
  BWScalingSession *v2;
  BWScalingSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWScalingSession;
  v2 = -[BWScalingSession init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    VTSessionSetProperty(v2->_rotationSession, (CFStringRef)*MEMORY[0x1E0CED768], MEMORY[0x1E0C9AAB0]);
    -[BWScalingSession _ensurePixelTransferSession](v3, "_ensurePixelTransferSession");
    if (!v3->_transferSession)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v3;
}

- (void)_ensurePixelTransferSession
{
  OpaqueVTPixelTransferSession **p_transferSession;
  const void *v3;

  p_transferSession = &self->_transferSession;
  if (!self->_transferSession)
  {
    VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], p_transferSession);
    v3 = (const void *)MEMORY[0x1E0C9AAB0];
    VTSessionSetProperty(*p_transferSession, (CFStringRef)*MEMORY[0x1E0CED7F8], MEMORY[0x1E0C9AAB0]);
    VTSessionSetProperty(*p_transferSession, (CFStringRef)*MEMORY[0x1E0CED800], v3);
    VTSessionSetProperty(*p_transferSession, (CFStringRef)*MEMORY[0x1E0CED868], MEMORY[0x1E0C9AAA0]);
    VTSessionSetProperty(*p_transferSession, (CFStringRef)*MEMORY[0x1E0CED808], v3);
  }
}

- (void)dealloc
{
  OpaqueVTPixelRotationSession *rotationSession;
  OpaqueVTPixelRotationSession *v4;
  OpaqueVTPixelTransferSession *transferSession;
  OpaqueVTPixelTransferSession *v6;
  objc_super v7;

  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    VTPixelRotationSessionInvalidate(rotationSession);
    v4 = self->_rotationSession;
    if (v4)
      CFRelease(v4);
  }
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v6 = self->_transferSession;
    if (v6)
      CFRelease(v6);
  }

  v7.receiver = self;
  v7.super_class = (Class)BWScalingSession;
  -[BWScalingSession dealloc](&v7, sel_dealloc);
}

- (int)scalePixelBuffer:(__CVBuffer *)a3 rect:(CGRect)a4 intoPixelBuffer:(__CVBuffer *)a5 rect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  OpaqueVTPixelTransferSession *transferSession;
  const __CFString *v38;
  CFDictionaryRef DictionaryRepresentation;
  CFTypeRef v40;
  OSStatus v41;
  OpaqueVTPixelTransferSession *v42;
  const __CFString *v43;
  CFDictionaryRef v44;
  CFTypeRef v45;
  OSStatus v46;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  if (!a3 || !a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  if (CGRectIsNull(a4))
  {
    v14 = psn_pixelBufferRect(a3);
    v13 = v17;
    v12 = v18;
    v11 = v19;
  }
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  if (CGRectIsNull(v48))
  {
    x = psn_pixelBufferRect(a5);
    y = v20;
    width = v21;
    height = v22;
  }
  v23 = ss_conformRectForMSR420vfPixelBuffer(a3, 0, v14, v13, v12, v11);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = ss_conformRectForMSR420vfPixelBuffer(a5, 1, x, y, width, height);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  transferSession = self->_transferSession;
  v38 = (const __CFString *)*MEMORY[0x1E0CED850];
  v49.origin.x = v23;
  v49.origin.y = v25;
  v49.size.width = v27;
  v49.size.height = v29;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v49);
  v40 = CFAutorelease(DictionaryRepresentation);
  v41 = VTSessionSetProperty(transferSession, v38, v40);
  if (v41)
    goto LABEL_12;
  v42 = self->_transferSession;
  v43 = (const __CFString *)*MEMORY[0x1E0CED7D0];
  v50.origin.x = v30;
  v50.origin.y = v32;
  v50.size.width = v34;
  v50.size.height = v36;
  v44 = CGRectCreateDictionaryRepresentation(v50);
  v45 = CFAutorelease(v44);
  v41 = VTSessionSetProperty(v42, v43, v45);
  if (v41)
  {
LABEL_12:
    v46 = v41;
    fig_log_get_emitter();
LABEL_15:
    FigDebugAssert3();
    return v46;
  }
  v46 = VTPixelTransferSessionTransferImage(self->_transferSession, a3, a5);
  if (v46)
  {
    fig_log_get_emitter();
    goto LABEL_15;
  }
  return v46;
}

- (int)scalePixelBuffer:(__CVBuffer *)a3 rect:(CGRect)a4 exifOrientation:(int)a5 intoPixelBuffer:(__CVBuffer *)a6 rect:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  int v25;
  double v26;
  double v27;
  __CVBuffer *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  BWPixelBufferPool *intermediateBufferPool;
  OSStatus v34;
  OpaqueVTPixelRotationSession *rotationSession;
  VTSessionRef *p_rotationSession;
  CFTypeRef *v37;
  int v38;
  double v40;
  double v41;
  CGRect v42;

  if (!a3 || !a6 || (a5 - 9) <= 0xFFFFFFF7)
    goto LABEL_47;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a4.size.height;
  v14 = a4.size.width;
  v15 = a4.origin.y;
  v16 = a4.origin.x;
  if (CGRectIsNull(a4))
  {
    v16 = psn_pixelBufferRect(a3);
    v15 = v19;
    v14 = v20;
    v13 = v21;
  }
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v40 = v16;
  v41 = v15;
  if (CGRectIsNull(v42))
  {
    psn_pixelBufferRect(a6);
    width = v22;
    height = v23;
  }
  v24 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(a5, 0);
  v25 = v24;
  if (v24 == 270 || (v26 = width, v27 = height, v24 == 90))
  {
    v26 = height;
    v27 = width;
  }
  if (v26 / v14 < 0.251256281 || v26 / v14 > 3.98 || v27 / v13 > 3.98 || v27 / v13 < 0.251256281)
  {
    v29 = (int)v26;
    v30 = (int)v27;
    if (self->_intermediateBufferPool)
    {
      v31 = v29 | (v30 << 32);
      v32 = FigCaptureVideoDimensionsAreEqual(*(_QWORD *)&self->_intermediateBufferPoolDimensions, v31);
      intermediateBufferPool = self->_intermediateBufferPool;
      if (v32)
      {
LABEL_21:
        if (intermediateBufferPool)
        {
          v28 = -[BWPixelBufferPool newPixelBuffer](intermediateBufferPool, "newPixelBuffer");
          v34 = -[BWScalingSession scalePixelBuffer:rect:intoPixelBuffer:rect:](self, "scalePixelBuffer:rect:intoPixelBuffer:rect:", a3, v28, v40, v41, v14, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v26, v27);
          if (v34)
            goto LABEL_48;
          goto LABEL_23;
        }
LABEL_47:
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
    }
    else
    {
      intermediateBufferPool = 0;
      v31 = v29 | (v30 << 32);
    }

    intermediateBufferPool = -[BWScalingSession _newIntermediatePoolWithDimensions:pixelFormat:](self, "_newIntermediatePoolWithDimensions:pixelFormat:", v31, CVPixelBufferGetPixelFormatType(a3));
    self->_intermediateBufferPool = intermediateBufferPool;
    self->_intermediateBufferPoolDimensions.width = v29;
    self->_intermediateBufferPoolDimensions.height = v30;
    goto LABEL_21;
  }
  v28 = 0;
LABEL_23:
  p_rotationSession = (VTSessionRef *)&self->_rotationSession;
  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    if (self->_rotationSessionDegrees == v25)
    {
LABEL_36:
      v38 = VTPixelRotationSessionRotateSubImage();
      if (!v38)
        goto LABEL_37;
      fig_log_get_emitter();
      goto LABEL_49;
    }
    CFRelease(rotationSession);
    *p_rotationSession = 0;
  }
  v34 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_rotationSession);
  if (!v34)
  {
    if (v25 == 270)
    {
      v37 = (CFTypeRef *)MEMORY[0x1E0CEDA38];
    }
    else if (v25 == 180)
    {
      v37 = (CFTypeRef *)MEMORY[0x1E0CEDA30];
    }
    else
    {
      v37 = (CFTypeRef *)(v25 == 90 ? MEMORY[0x1E0CEDA40] : MEMORY[0x1E0CEDA28]);
    }
    v34 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x1E0CED7A0], *v37);
    if (!v34)
    {
      self->_rotationSessionDegrees = v25;
      if (!self->_rotationSession)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v38 = 0;
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
LABEL_48:
  v38 = v34;
  fig_log_get_emitter();
LABEL_49:
  FigDebugAssert3();
LABEL_37:
  if (v28)
    CFRelease(v28);
  return v38;
}

- (id)_newIntermediatePoolWithDimensions:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4;
  BWVideoFormatRequirements *v6;
  BWVideoFormatRequirements *v8;
  _QWORD v9[2];

  v4 = *(_QWORD *)&a4;
  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", a3.var0);
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", *(uint64_t *)&a3 >> 32);
  v8 = v6;
  return -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1)), 1, CFSTR("BWVideoPIPOverlayNode Intermediate Pool"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
}

- (void)invalidate
{
  OpaqueVTPixelRotationSession *rotationSession;
  OpaqueVTPixelRotationSession *v4;
  OpaqueVTPixelTransferSession *transferSession;
  OpaqueVTPixelTransferSession *v6;

  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    VTPixelRotationSessionInvalidate(rotationSession);
    v4 = self->_rotationSession;
    if (v4)
    {
      CFRelease(v4);
      self->_rotationSession = 0;
    }
  }
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v6 = self->_transferSession;
    if (v6)
    {
      CFRelease(v6);
      self->_transferSession = 0;
    }
  }
}

@end
