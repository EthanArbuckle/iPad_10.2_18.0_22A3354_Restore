@implementation AVSemanticSegmentationMatte

+ (void)initialize
{
  objc_opt_class();
}

- (id)debugDescription
{
  uint64_t v3;
  __CVBuffer *pixelBuffer;
  size_t Width;
  __CVBuffer *v6;
  size_t Height;
  uint64_t v8;
  __CFString *matteType;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  -[AVSemanticSegmentationMatte pixelFormatType](self, "pixelFormatType");
  v3 = AVStringForOSType();
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    Width = CVPixelBufferGetWidth(pixelBuffer);
    v6 = self->_pixelBuffer;
    if (v6)
    {
      Height = CVPixelBufferGetHeight(v6);
      goto LABEL_6;
    }
  }
  else
  {
    Width = 0;
  }
  Height = 0;
LABEL_6:
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" v.%d.%d"), (self->_version >> 16), (unsigned __int16)self->_version);
  matteType = (__CFString *)self->_matteType;
  v10 = CFSTR("Skin");
  v11 = CFSTR("Teeth");
  if (matteType == CFSTR("AVSemanticSegmentationMatteTypeGlasses"))
    v12 = CFSTR("Glasses");
  else
    v12 = 0;
  if (matteType != CFSTR("AVSemanticSegmentationMatteTypeTeeth"))
    v11 = v12;
  if (matteType != CFSTR("AVSemanticSegmentationMatteTypeSkin"))
    v10 = v11;
  if (matteType == CFSTR("AVSemanticSegmentationMatteTypeHair"))
    v13 = CFSTR("Hair");
  else
    v13 = v10;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %zux%zu%@"), v13, v3, Width, Height, v8);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVSemanticSegmentationMatte debugDescription](self, "debugDescription"));
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    CFRelease(pixelBuffer);

  v4.receiver = self;
  v4.super_class = (Class)AVSemanticSegmentationMatte;
  -[AVSemanticSegmentationMatte dealloc](&v4, sel_dealloc);
}

+ (AVSemanticSegmentationMatte)semanticSegmentationMatteFromImageSourceAuxiliaryDataType:(CFStringRef)imageSourceAuxiliaryDataType dictionaryRepresentation:(NSDictionary *)imageSourceAuxiliaryDataInfoDictionary error:(NSError *)outError
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  const __CFDictionary *v25;
  CVReturn v26;
  size_t BytesPerRow;
  size_t v28;
  int64_t v29;
  char *v30;
  char *BaseAddress;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  char *v35;
  const __CFString *v36;
  AVSemanticSegmentationMatte *v37;
  AVSemanticSegmentationMatte *v38;
  int v39;
  NSError *v40;
  id v42;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  v9 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxiliaryDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
  v10 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxiliaryDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C8]);
  v11 = -[NSDictionary objectForKeyedSubscript:](imageSourceAuxiliaryDataInfoDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
  v12 = v11;
  if (v9)
    v13 = v10 == 0;
  else
    v13 = 1;
  v14 = !v13;
  if (v13 && !v11)
  {
    fig_log_get_emitter();
LABEL_48:
    FigDebugAssert3();
    v38 = 0;
    v39 = -11865;
    goto LABEL_35;
  }
  v15 = *MEMORY[0x1E0CBC730];
  v44[0] = *MEMORY[0x1E0CBC738];
  v44[1] = v15;
  v16 = *MEMORY[0x1E0CBC728];
  v44[2] = *MEMORY[0x1E0CBC748];
  v44[3] = v16;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4), "containsObject:", imageSourceAuxiliaryDataType) & 1) == 0)goto LABEL_47;
  if (!v14)
  {
LABEL_26:
    if (FigCFEqual())
    {
      v36 = CFSTR("AVSemanticSegmentationMatteTypeSkin");
LABEL_34:
      v37 = [AVSemanticSegmentationMatte alloc];
      v38 = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:auxiliaryMetadata:](v37, "initWithType:pixelBuffer:auxiliaryMetadata:", v36, pixelBufferOut, v12);
      v39 = 0;
      goto LABEL_35;
    }
    if (FigCFEqual())
    {
      v36 = CFSTR("AVSemanticSegmentationMatteTypeHair");
      goto LABEL_34;
    }
    if (FigCFEqual())
    {
      v36 = CFSTR("AVSemanticSegmentationMatteTypeTeeth");
      goto LABEL_34;
    }
    if (FigCFEqual())
    {
      v36 = CFSTR("AVSemanticSegmentationMatteTypeGlasses");
      goto LABEL_34;
    }
    fig_log_get_emitter();
    goto LABEL_48;
  }
  v17 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD030]), "intValue");
  v18 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD128]), "intValue");
  v19 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEA8]), "intValue");
  v20 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC888]), "intValue");
  if (!(_DWORD)v17 || !v18 || !v19 || (v21 = v20) == 0)
  {
LABEL_47:
    fig_log_get_emitter();
    goto LABEL_48;
  }
  v42 = v12;
  v22 = (void *)objc_msgSend(a1, "_allSupportedSemanticSegmentationMattePixelFormatTypes");
  if ((objc_msgSend(v22, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17)) & 1) != 0)
  {
    v23 = v19;
    v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v21);
    v25 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0], v24, *MEMORY[0x1E0CA8F68], 0);
    v26 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v18, v19, v17, v25, &pixelBufferOut);
    if (!v26)
    {
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      v28 = BytesPerRow;
      if (BytesPerRow >= v21)
        v29 = v21;
      else
        v29 = BytesPerRow;
      v30 = (char *)objc_msgSend(v9, "bytes");
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
      v32 = objc_msgSend(v9, "length");
      if (v29 <= v32)
      {
        v33 = &v30[v32];
        v34 = 1;
        do
        {
          memcpy(BaseAddress, v30, v29);
          if (v34 >= v23)
            break;
          v35 = &v30[v29 + v21];
          v30 += v21;
          BaseAddress += v28;
          ++v34;
        }
        while (v35 <= v33);
      }
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      v12 = v42;
      goto LABEL_26;
    }
    v39 = v26;
    v38 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v38 = 0;
    v39 = -11864;
  }
LABEL_35:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (outError && v39)
  {
    if (ErrorIsAVFoundationError())
      v40 = (NSError *)AVLocalizedError();
    else
      v40 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
    *outError = v40;
  }
  return v38;
}

- (AVSemanticSegmentationMatteType)matteType
{
  return self->_matteType;
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatteByApplyingExifOrientation:(CGImagePropertyOrientation)exifOrientation
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
  AVSemanticSegmentationMatte *v26;
  NSString *v27;
  CVPixelBufferRef v28;
  AVSemanticSegmentationMatte *v29;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  VTPixelRotationSessionRef pixelRotationSessionOut;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
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
    pixelBuffer = self->_pixelBuffer;
    if (!pixelBuffer)
      goto LABEL_38;
    Width = CVPixelBufferGetWidth(pixelBuffer);
    Height = CVPixelBufferGetHeight(self->_pixelBuffer);
    PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
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
    v33 = *MEMORY[0x1E0CA8FF0];
    v34[0] = MEMORY[0x1E0C9AA70];
    v15 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
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
          v18 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, self->_pixelBuffer, pixelBufferOut);
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
          v18 = VTPixelRotationSessionRotateImage(pixelRotationSessionOut, self->_pixelBuffer, pixelBufferOut);
        }
      }
      v25 = v18;
    }
    v26 = [AVSemanticSegmentationMatte alloc];
    v27 = -[AVSemanticSegmentationMatte matteType](self, "matteType");
    if (v25)
      v28 = 0;
    else
      v28 = pixelBufferOut;
    v29 = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:](v26, "initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:", v27, v28, 0);
    v29->_version = self->_version;
    CVPixelBufferRelease(pixelBufferOut);
    if (pixelRotationSessionOut)
      CFRelease(pixelRotationSessionOut);
    if (pixelTransferSessionOut)
      CFRelease(pixelTransferSessionOut);
    return v29;
  }
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatteByReplacingSemanticSegmentationMatteWithPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)outError
{
  uint64_t PixelFormatType;
  CFTypeRef v8;
  AVSemanticSegmentationMatte *v9;
  uint64_t v11;
  NSError *v12;

  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_allSupportedSemanticSegmentationMattePixelFormatTypes"), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType)) & 1) == 0)goto LABEL_7;
  v8 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
  if (v8)
    CFAutorelease(v8);
  if (FigCFEqual())
  {
    v9 = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:]([AVSemanticSegmentationMatte alloc], "initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:", -[AVSemanticSegmentationMatte matteType](self, "matteType"), pixelBuffer, 0);
  }
  else
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    if (outError)
    {
      if (ErrorIsAVFoundationError())
        v11 = AVLocalizedError();
      else
        v11 = AVLocalizedErrorWithUnderlyingOSStatus();
      v12 = (NSError *)v11;
      v9 = 0;
      *outError = v12;
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
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
  v5 = -[AVSemanticSegmentationMatte pixelFormatType](self, "pixelFormatType");
  Width = CVPixelBufferGetWidth(-[AVSemanticSegmentationMatte mattingImage](self, "mattingImage"));
  Height = CVPixelBufferGetHeight(-[AVSemanticSegmentationMatte mattingImage](self, "mattingImage"));
  BytesPerRow = CVPixelBufferGetBytesPerRow(-[AVSemanticSegmentationMatte mattingImage](self, "mattingImage"));
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
  v12 = -[AVSemanticSegmentationMatte mattingImage](self, "mattingImage");
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
  v16 = -[AVSemanticSegmentationMatte copyAuxiliaryMetadata](self, "copyAuxiliaryMetadata");
  if (v16)
  {
    v17 = v16;
    -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CBC6D0]);
    CFRelease(v17);
  }
  if (outAuxDataType)
    *outAuxDataType = (NSString *)-[AVSemanticSegmentationMatte auxiliaryImageType](self, "auxiliaryImageType");
  return v14;
}

- (OSType)pixelFormatType
{
  __CVBuffer *pixelBuffer;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    LODWORD(pixelBuffer) = CVPixelBufferGetPixelFormatType(pixelBuffer);
  return pixelBuffer;
}

- (CVPixelBufferRef)mattingImage
{
  return self->_pixelBuffer;
}

- (signed)versionMajor
{
  return HIWORD(self->_version);
}

- (signed)versionMinor
{
  return self->_version;
}

- (AVSemanticSegmentationMatte)initWithType:(id)a3 pixelBuffer:(__CVBuffer *)a4 semanticSegmentationMatteMetadataDictionary:(id)a5
{
  AVSemanticSegmentationMatte *v8;
  void *v9;
  __CVBuffer *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVSemanticSegmentationMatte;
  v8 = -[AVSemanticSegmentationMatte init](&v13, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "_allSupportedSemanticSegmentationMatteTypes");
    if ((objc_msgSend(v9, "containsObject:", a3) & 1) != 0)
    {
      v8->_matteType = (NSString *)a3;
      if (a4)
        v10 = (__CVBuffer *)CFRetain(a4);
      else
        v10 = 0;
      v8->_pixelBuffer = v10;
      if (a5)
        v8->_version = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05488]), "intValue");
    }
    else
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, v9);

      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v11);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
      return 0;
    }
  }
  return v8;
}

- (AVSemanticSegmentationMatte)initWithType:(id)a3 pixelBuffer:(__CVBuffer *)a4 auxiliaryMetadata:(CGImageMetadata *)a5
{
  AVSemanticSegmentationMatte *v6;
  AVSemanticSegmentationMatte *v7;

  v6 = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:](self, "initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:", a3, a4, 0);
  v7 = v6;
  if (a5 && v6)
    v6->_version = objc_msgSend(AVAuxiliaryMetadataStringTagWithPrefixedKey(a5, *MEMORY[0x1E0D05478], *MEMORY[0x1E0D05480]), "intValue");
  return v7;
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
    v5 = (const __CFString *)*MEMORY[0x1E0D05470];
    v6 = (const __CFString *)*MEMORY[0x1E0D05478];
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E0D05470], (CFStringRef)*MEMORY[0x1E0D05478], 0))goto LABEL_7;
    if (!self->_version)
    {
LABEL_8:
      CFRelease(v4);
      return 0;
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05480], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:")))
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
  __CFString *matteType;
  __CFString **v4;

  matteType = (__CFString *)self->_matteType;
  if (matteType == CFSTR("AVSemanticSegmentationMatteTypeSkin"))
  {
    v4 = (__CFString **)MEMORY[0x1E0CBC738];
    return *v4;
  }
  if (matteType == CFSTR("AVSemanticSegmentationMatteTypeHair"))
  {
    v4 = (__CFString **)MEMORY[0x1E0CBC730];
    return *v4;
  }
  if (matteType == CFSTR("AVSemanticSegmentationMatteTypeTeeth"))
  {
    v4 = (__CFString **)MEMORY[0x1E0CBC748];
    return *v4;
  }
  if (matteType == CFSTR("AVSemanticSegmentationMatteTypeGlasses"))
    return (__CFString *)*MEMORY[0x1E0CBC728];
  else
    return 0;
}

+ (id)_allSupportedSemanticSegmentationMatteTypes
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVSemanticSegmentationMatteTypeHair");
  v3[1] = CFSTR("AVSemanticSegmentationMatteTypeSkin");
  v3[2] = CFSTR("AVSemanticSegmentationMatteTypeTeeth");
  v3[3] = CFSTR("AVSemanticSegmentationMatteTypeGlasses");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
}

+ (id)_allSupportedSemanticSegmentationMattePixelFormatTypes
{
  return &unk_1E424D798;
}

@end
