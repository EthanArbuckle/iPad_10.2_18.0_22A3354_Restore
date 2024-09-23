@implementation AVPortraitEffectsMatte

+ (void)initialize
{
  objc_opt_class();
}

- (id)debugDescription
{
  uint64_t v3;
  AVPortraitEffectsMatteInternal *internal;
  __CVBuffer *pixelBuffer;
  size_t Width;
  __CVBuffer *v7;
  size_t Height;
  uint64_t v9;

  -[AVPortraitEffectsMatte pixelFormatType](self, "pixelFormatType");
  v3 = AVStringForOSType();
  internal = self->_internal;
  pixelBuffer = internal->pixelBuffer;
  if (!pixelBuffer)
  {
    Width = 0;
    goto LABEL_5;
  }
  Width = CVPixelBufferGetWidth(pixelBuffer);
  internal = self->_internal;
  v7 = internal->pixelBuffer;
  if (!v7)
  {
LABEL_5:
    Height = 0;
    goto LABEL_6;
  }
  Height = CVPixelBufferGetHeight(v7);
  internal = self->_internal;
LABEL_6:
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" v.%d.%d"), (internal->version >> 16), (unsigned __int16)internal->version);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %zux%zu%@"), v3, Width, Height, v9);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVPortraitEffectsMatte debugDescription](self, "debugDescription"));
}

- (void)dealloc
{
  AVPortraitEffectsMatteInternal *internal;
  __CVBuffer *pixelBuffer;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    pixelBuffer = internal->pixelBuffer;
    if (pixelBuffer)
    {
      CFRelease(pixelBuffer);
      internal = self->_internal;
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)AVPortraitEffectsMatte;
  -[AVPortraitEffectsMatte dealloc](&v5, sel_dealloc);
}

+ (AVPortraitEffectsMatte)portraitEffectsMatteFromDictionaryRepresentation:(NSDictionary *)imageSourceAuxDataInfoDictionary error:(NSError *)outError
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  int v11;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  BOOL v19;
  int64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFDictionary *v26;
  CVReturn v27;
  CVPixelBufferRef v28;
  size_t BytesPerRow;
  size_t v30;
  char *v31;
  char *BaseAddress;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  char *v36;
  AVPortraitEffectsMatte *v37;
  AVPortraitEffectsMatte *v38;
  NSError *v39;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v7 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
  v8 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C8]);
  v9 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = v10;
  if (v11 == 1 && v9 == 0)
    goto LABEL_41;
  v13 = v9;
  if ((v11 & 1) != 0)
    goto LABEL_32;
  v14 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD030]), "intValue");
  v15 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD128]), "intValue");
  v16 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEA8]), "intValue");
  v17 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC888]), "intValue");
  v18 = !(_DWORD)v14 || v15 == 0;
  v19 = v18 || v16 == 0;
  if (v19 || v17 == 0)
  {
LABEL_41:
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    v27 = -11865;
    goto LABEL_34;
  }
  LODWORD(v21) = v17;
  v22 = (void *)objc_msgSend(a1, "_allSupportedPortraitEffectsMattePixelFormatTypes");
  if ((objc_msgSend(v22, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14)) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    v27 = -11864;
    goto LABEL_34;
  }
  v23 = v16;
  v24 = (int)v21;
  v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (int)v21);
  v26 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0], v25, *MEMORY[0x1E0CA8F68], 0);
  v27 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v15, v16, v14, v26, &pixelBufferOut);
  v28 = pixelBufferOut;
  if (v27)
  {
    v38 = 0;
    if (!pixelBufferOut)
      goto LABEL_34;
    goto LABEL_33;
  }
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  v30 = BytesPerRow;
  if (BytesPerRow >= (int)v21)
    v21 = (int)v21;
  else
    v21 = BytesPerRow;
  v31 = (char *)objc_msgSend(v7, "bytes");
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  v33 = objc_msgSend(v7, "length");
  if (v21 <= v33)
  {
    v34 = &v31[v33];
    v35 = 1;
    do
    {
      memcpy(BaseAddress, v31, v21);
      if (v35 >= v23)
        break;
      v36 = &v31[v21 + v24];
      v31 += v24;
      BaseAddress += v30;
      ++v35;
    }
    while (v36 <= v34);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
LABEL_32:
  v37 = [AVPortraitEffectsMatte alloc];
  v38 = -[AVPortraitEffectsMatte initWithPixelBuffer:auxiliaryMetadata:](v37, "initWithPixelBuffer:auxiliaryMetadata:", pixelBufferOut, v13);
  v27 = 0;
  v28 = pixelBufferOut;
  if (pixelBufferOut)
LABEL_33:
    CFRelease(v28);
LABEL_34:
  if (outError && v27)
  {
    if (ErrorIsAVFoundationError())
      v39 = (NSError *)AVLocalizedError();
    else
      v39 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
    *outError = v39;
  }
  return v38;
}

- (AVPortraitEffectsMatte)portraitEffectsMatteByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation
{
  __CVBuffer *pixelBuffer;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  unsigned __int32 v9;
  int v10;
  int v11;
  void *v12;
  size_t v14;
  const __CFDictionary *v15;
  const __CFAllocator *v16;
  const void *v17;
  OSStatus v18;
  VTPixelRotationSessionRef v19;
  const __CFString *v20;
  const void *v21;
  const void *v22;
  BOOL v23;
  CFStringRef *v24;
  OSStatus v25;
  AVPortraitEffectsMatte *v26;
  CVPixelBufferRef v27;
  AVPortraitEffectsMatte *v28;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  VTPixelRotationSessionRef pixelRotationSessionOut;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  pixelRotationSessionOut = 0;
  pixelBufferOut = 0;
  pixelTransferSessionOut = 0;
  if (exifOrientation - 1 >= 8)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v12);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
    return 0;
  }
  else
  {
    pixelBuffer = self->_internal->pixelBuffer;
    if (!pixelBuffer)
      goto LABEL_38;
    Width = CVPixelBufferGetWidth(pixelBuffer);
    Height = CVPixelBufferGetHeight(self->_internal->pixelBuffer);
    PixelFormatType = CVPixelBufferGetPixelFormatType(self->_internal->pixelBuffer);
    v9 = exifOrientation - 2;
    v10 = 1;
    v11 = 270;
    switch(v9)
    {
      case 0u:
        goto LABEL_9;
      case 1u:
        v10 = 0;
        goto LABEL_5;
      case 2u:
LABEL_5:
        v11 = 180;
        goto LABEL_10;
      case 3u:
        goto LABEL_14;
      case 4u:
        v10 = 0;
        goto LABEL_12;
      case 5u:
LABEL_12:
        v11 = 90;
        goto LABEL_14;
      case 6u:
        v10 = 0;
LABEL_14:
        v14 = Height;
        break;
      default:
        v10 = 0;
LABEL_9:
        v11 = 0;
LABEL_10:
        v14 = Width;
        Width = Height;
        break;
    }
    v32 = *MEMORY[0x1E0CA8FF0];
    v33[0] = MEMORY[0x1E0C9AA70];
    v15 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, Width, PixelFormatType, v15, &pixelBufferOut))
    {
LABEL_38:
      v25 = 0;
    }
    else
    {
      v17 = (const void *)*MEMORY[0x1E0CA8EB8];
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
      if (((v11 == 0) & ~v10) != 0)
      {
        v18 = VTPixelTransferSessionCreate(v16, &pixelTransferSessionOut);
        if (!v18)
          v18 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, self->_internal->pixelBuffer, pixelBufferOut);
      }
      else
      {
        v18 = VTPixelRotationSessionCreate(v16, &pixelRotationSessionOut);
        if (!v18)
        {
          v19 = pixelRotationSessionOut;
          v20 = (const __CFString *)*MEMORY[0x1E0CED7A0];
          v21 = (const void *)AVCaptureVTRotationFromDegrees(v11);
          VTSessionSetProperty(v19, v20, v21);
          v22 = (const void *)*MEMORY[0x1E0C9AE50];
          VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E0CED768], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
          VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E0CED750], v17);
          if (v10)
          {
            v23 = v11 == 90 || v11 == 270;
            v24 = (CFStringRef *)MEMORY[0x1E0CED780];
            if (!v23)
              v24 = (CFStringRef *)MEMORY[0x1E0CED778];
            VTSessionSetProperty(pixelRotationSessionOut, *v24, v22);
          }
          v18 = VTPixelRotationSessionRotateImage(pixelRotationSessionOut, self->_internal->pixelBuffer, pixelBufferOut);
        }
      }
      v25 = v18;
    }
    v26 = [AVPortraitEffectsMatte alloc];
    if (v25)
      v27 = 0;
    else
      v27 = pixelBufferOut;
    v28 = -[AVPortraitEffectsMatte initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:](v26, "initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:", v27, 0);
    v28->_internal->version = self->_internal->version;
    CVPixelBufferRelease(pixelBufferOut);
    if (pixelRotationSessionOut)
      CFRelease(pixelRotationSessionOut);
    if (pixelTransferSessionOut)
      CFRelease(pixelTransferSessionOut);
    return v28;
  }
}

- (AVPortraitEffectsMatte)portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError
{
  uint64_t PixelFormatType;
  CFTypeRef v7;
  AVPortraitEffectsMatte *v8;
  uint64_t v10;
  NSError *v11;

  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_allSupportedPortraitEffectsMattePixelFormatTypes"), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType)) & 1) == 0)goto LABEL_7;
  v7 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
  if (v7)
    CFAutorelease(v7);
  if (FigCFEqual())
  {
    v8 = -[AVPortraitEffectsMatte initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:]([AVPortraitEffectsMatte alloc], "initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:", pixelBuffer, 0);
  }
  else
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    if (outError)
    {
      if (ErrorIsAVFoundationError())
        v10 = AVLocalizedError();
      else
        v10 = AVLocalizedErrorWithUnderlyingOSStatus();
      v11 = (NSError *)v10;
      v8 = 0;
      *outError = v11;
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (NSDictionary)dictionaryRepresentationForAuxiliaryDataType:(NSString *)outAuxDataType
{
  uint64_t v5;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v9;
  uint64_t v10;
  void *v11;
  __CVBuffer *v12;
  void *BaseAddress;
  NSDictionary *v14;
  uint64_t v15;
  CGImageMetadata *v16;
  CGImageMetadata *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v5 = -[AVPortraitEffectsMatte pixelFormatType](self, "pixelFormatType");
  Width = CVPixelBufferGetWidth(-[AVPortraitEffectsMatte mattingImage](self, "mattingImage"));
  Height = CVPixelBufferGetHeight(-[AVPortraitEffectsMatte mattingImage](self, "mattingImage"));
  BytesPerRow = CVPixelBufferGetBytesPerRow(-[AVPortraitEffectsMatte mattingImage](self, "mattingImage"));
  if (!(_DWORD)v5
    || !Width
    || !Height
    || (v9 = BytesPerRow) == 0
    || (v10 = objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", BytesPerRow * Height)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v11 = (void *)v10;
  v12 = -[AVPortraitEffectsMatte mattingImage](self, "mattingImage");
  if (CVPixelBufferLockBaseAddress(v12, 1uLL))
    return 0;
  BaseAddress = CVPixelBufferGetBaseAddress(v12);
  memcpy((void *)objc_msgSend(v11, "mutableBytes"), BaseAddress, v9 * Height);
  CVPixelBufferUnlockBaseAddress(v12, 1uLL);
  v14 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBC6C0]);
  v19[0] = *MEMORY[0x1E0CBD030];
  v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v19[1] = *MEMORY[0x1E0CBD128];
  v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Width);
  v19[2] = *MEMORY[0x1E0CBCEA8];
  v20[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Height);
  v19[3] = *MEMORY[0x1E0CBC888];
  v20[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
  v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBC6C8]);
  v16 = -[AVPortraitEffectsMatte copyAuxiliaryMetadata](self, "copyAuxiliaryMetadata");
  if (v16)
  {
    v17 = v16;
    -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CBC6D0]);
    CFRelease(v17);
  }
  if (outAuxDataType)
    *outAuxDataType = (NSString *)-[AVPortraitEffectsMatte auxiliaryImageType](self, "auxiliaryImageType");
  return v14;
}

- (OSType)pixelFormatType
{
  __CVBuffer *pixelBuffer;

  pixelBuffer = self->_internal->pixelBuffer;
  if (pixelBuffer)
    LODWORD(pixelBuffer) = CVPixelBufferGetPixelFormatType(pixelBuffer);
  return pixelBuffer;
}

- (CVPixelBufferRef)mattingImage
{
  return self->_internal->pixelBuffer;
}

- (signed)versionMajor
{
  return HIWORD(self->_internal->version);
}

- (signed)versionMinor
{
  return self->_internal->version;
}

- (AVPortraitEffectsMatte)initWithPixelBuffer:(__CVBuffer *)a3 portraitEffectsMatteMetadataDictionary:(id)a4
{
  AVPortraitEffectsMatte *v6;
  AVPortraitEffectsMatteInternal *internal;
  __CVBuffer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVPortraitEffectsMatte;
  v6 = -[AVPortraitEffectsMatte init](&v10, sel_init);
  if (v6)
  {
    internal = objc_alloc_init(AVPortraitEffectsMatteInternal);
    v6->_internal = internal;
    if (internal)
    {
      if (a3)
      {
        v8 = (__CVBuffer *)CFRetain(a3);
        internal = v6->_internal;
      }
      else
      {
        v8 = 0;
      }
      internal->pixelBuffer = v8;
      if (a4)
        v6->_internal->version = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05440]), "intValue");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVPortraitEffectsMatte)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryMetadata:(CGImageMetadata *)a4
{
  AVPortraitEffectsMatte *v5;
  AVPortraitEffectsMatte *v6;

  v5 = -[AVPortraitEffectsMatte initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:](self, "initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:", a3, 0);
  v6 = v5;
  if (a4 && v5)
    v5->_internal->version = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a4, *MEMORY[0x1E0D05430], *MEMORY[0x1E0D05438]), "intValue");
  return v6;
}

- (CGImageMetadata)copyAuxiliaryMetadata
{
  CGImageMetadata *Mutable;
  CGImageMetadata *v4;
  const __CFString *v5;
  const __CFString *v6;

  Mutable = CGImageMetadataCreateMutable();
  v4 = Mutable;
  if (Mutable)
  {
    v5 = (const __CFString *)*MEMORY[0x1E0D05428];
    v6 = (const __CFString *)*MEMORY[0x1E0D05430];
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E0D05428], (CFStringRef)*MEMORY[0x1E0D05430], 0))goto LABEL_7;
    if (!self->_internal->version)
    {
LABEL_8:
      CFRelease(v4);
      return 0;
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05438], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:")))
    {
LABEL_7:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_8;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v4;
}

- (__CFString)auxiliaryImageType
{
  return (__CFString *)*MEMORY[0x1E0CBC720];
}

+ (id)_allSupportedPortraitEffectsMattePixelFormatTypes
{
  return &unk_1E424D978;
}

@end
