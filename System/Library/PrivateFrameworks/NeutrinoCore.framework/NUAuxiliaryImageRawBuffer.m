@implementation NUAuxiliaryImageRawBuffer

- (NUAuxiliaryImageRawBuffer)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5
{
  id v8;
  void *v9;
  NUAuxiliaryImageRawBuffer *v10;
  CVPixelBufferRef v11;
  uint64_t v12;
  NSString *cgAuxIdentifier;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!v8)
  {
    NUAssertLogger_13197();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cgIdentifier != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_13197();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v22;
        v34 = 2114;
        v35 = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUAuxiliaryImage.m", 534, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"cgIdentifier != nil");
  }
  v9 = v8;
  v31.receiver = self;
  v31.super_class = (Class)NUAuxiliaryImageRawBuffer;
  v10 = -[NUAuxiliaryImageRawBuffer init](&v31, sel_init);
  v11 = CVPixelBufferRetain(a3);
  v10->_auxiliaryImageType = a4;
  v10->_pixelBuffer = v11;
  v12 = objc_msgSend(v9, "copy");
  cgAuxIdentifier = v10->_cgAuxIdentifier;
  v10->_cgAuxIdentifier = (NSString *)v12;

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  -[NUAuxiliaryImageRawBuffer setMetadata:](self, "setMetadata:", 0);
  -[NUAuxiliaryImageRawBuffer setCompatibilityMetadata:](self, "setCompatibilityMetadata:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NUAuxiliaryImageRawBuffer;
  -[NUAuxiliaryImageRawBuffer dealloc](&v3, sel_dealloc);
}

- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3
{
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  size_t v13;
  const __CFDictionary *v14;
  const __CFAllocator *v15;
  NSObject *v16;
  const void *v17;
  OSStatus v18;
  OSStatus v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  CFTypeRef *v23;
  const void *v24;
  CFStringRef *v25;
  OpaqueVTPixelRotationSession *v26;
  __CVBuffer *v27;
  OSStatus v28;
  OSStatus v29;
  uint64_t v30;
  NUAuxiliaryImageRawBuffer *v31;
  NUAuxiliaryImageRawBuffer *v33;
  CVPixelBufferRef v34;
  int64_t v35;
  void *v36;
  void *v37;
  id v38;
  VTSessionRef session;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  OSStatus v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  session = 0;
  pixelBufferOut = 0;
  if (a3 - 9 <= 0xFFFFFFF7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unsupported EXIF orientation"), 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  Width = CVPixelBufferGetWidth(-[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer"));
  Height = CVPixelBufferGetHeight(-[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer"));
  PixelFormatType = CVPixelBufferGetPixelFormatType(-[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer"));
  v8 = 0;
  v9 = 270;
  v10 = 1;
  v11 = 1;
  switch(a3)
  {
    case 2u:
      v9 = 0;
      v12 = 0;
      v10 = 0;
      goto LABEL_6;
    case 3u:
      v8 = 0;
      v12 = 0;
      v10 = 0;
      v9 = 180;
      goto LABEL_9;
    case 4u:
      v12 = 0;
      v10 = 0;
      v9 = 180;
LABEL_6:
      v8 = 1;
      goto LABEL_9;
    case 5u:
      goto LABEL_13;
    case 6u:
      v10 = 0;
      v11 = 0;
      goto LABEL_11;
    case 7u:
      v10 = 0;
LABEL_11:
      v9 = 90;
      v8 = 1;
      goto LABEL_13;
    case 8u:
      v8 = 0;
      v11 = 0;
LABEL_13:
      v12 = v8;
      v8 = v11;
      v13 = Height;
      break;
    default:
      v9 = 0;
      v12 = 0;
      v10 = 0;
LABEL_9:
      v13 = Width;
      Width = Height;
      break;
  }
  v43 = *MEMORY[0x1E0CA8FF0];
  v44[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1, session);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13, Width, PixelFormatType, v14, &pixelBufferOut))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_190);
    v16 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "[NUAuxiliaryImage] Failed to create rotated pixel buffer", buf, 2u);
    }
    goto LABEL_41;
  }
  v17 = (const void *)*MEMORY[0x1E0CA8EB8];
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
  v18 = VTPixelRotationSessionCreate(v15, (VTPixelRotationSessionRef *)&session);
  if (v18)
  {
    v19 = v18;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_190);
    v20 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_DWORD *)buf = 67109120;
    v42 = v19;
    v21 = "[NUAuxiliaryImage] VTImageRotationSessionCreate failed (%d)";
    v22 = v20;
LABEL_46:
    _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, v21, buf, 8u);
LABEL_40:
    CVPixelBufferRelease(pixelBufferOut);
LABEL_41:
    v31 = self;
    goto LABEL_42;
  }
  if (v9 > 179)
  {
    if (v9 == 180)
      v23 = (CFTypeRef *)MEMORY[0x1E0CEDA30];
    else
      v23 = (CFTypeRef *)MEMORY[0x1E0CEDA38];
  }
  else if (v9)
  {
    v23 = (CFTypeRef *)MEMORY[0x1E0CEDA40];
  }
  else
  {
    v23 = (CFTypeRef *)MEMORY[0x1E0CEDA28];
  }
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CED7A0], *v23);
  v24 = (const void *)*MEMORY[0x1E0C9AE50];
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CED768], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CED750], v17);
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E0CED758], (CFTypeRef)*MEMORY[0x1E0C9AE40]);
  if (v8)
  {
    if (v10 | v12)
      v25 = (CFStringRef *)MEMORY[0x1E0CED780];
    else
      v25 = (CFStringRef *)MEMORY[0x1E0CED778];
    VTSessionSetProperty(session, *v25, v24);
  }
  v26 = (OpaqueVTPixelRotationSession *)session;
  v27 = -[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer");
  v28 = VTPixelRotationSessionRotateImage(v26, v27, pixelBufferOut);
  if (v28)
  {
    v29 = v28;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_190);
    v30 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_DWORD *)buf = 67109120;
    v42 = v29;
    v21 = "[NUAuxiliaryImage] VTImageRotationSessionTransferImage failed (%d)";
    v22 = v30;
    goto LABEL_46;
  }
  v33 = [NUAuxiliaryImageRawBuffer alloc];
  v34 = pixelBufferOut;
  v35 = -[NUAuxiliaryImageRawBuffer auxiliaryImageType](self, "auxiliaryImageType");
  -[NUAuxiliaryImageRawBuffer cgAuxIdentifier](self, "cgAuxIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:](v33, "initWithPixelBuffer:auxiliaryImageType:identifier:", v34, v35, v36);

  -[NUAuxiliaryImageRawBuffer setMetadata:](v31, "setMetadata:", -[NUAuxiliaryImageRawBuffer metadata](self, "metadata"));
  -[NUAuxiliaryImageRawBuffer colorSpace](self, "colorSpace");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUAuxiliaryImageRawBuffer setColorSpace:](v31, "setColorSpace:", v37);

  -[NUAuxiliaryImageRawBuffer setCompatibilityMetadata:](v31, "setCompatibilityMetadata:", -[NUAuxiliaryImageRawBuffer compatibilityMetadata](self, "compatibilityMetadata"));
  CVPixelBufferRelease(pixelBufferOut);
  if (session)
    CFRelease(session);
LABEL_42:

  return v31;
}

- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  NUAuxiliaryImageRawBuffer *v6;
  int64_t v7;
  void *v8;
  NUAuxiliaryImageRawBuffer *v9;
  void *v10;

  v6 = [NUAuxiliaryImageRawBuffer alloc];
  v7 = -[NUAuxiliaryImageRawBuffer auxiliaryImageType](self, "auxiliaryImageType");
  -[NUAuxiliaryImageRawBuffer cgAuxIdentifier](self, "cgAuxIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:](v6, "initWithPixelBuffer:auxiliaryImageType:identifier:", a3, v7, v8);

  -[NUAuxiliaryImageRawBuffer setMetadata:](v9, "setMetadata:", -[NUAuxiliaryImageRawBuffer metadata](self, "metadata"));
  -[NUAuxiliaryImageRawBuffer colorSpace](self, "colorSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUAuxiliaryImageRawBuffer setColorSpace:](v9, "setColorSpace:", v10);

  -[NUAuxiliaryImageRawBuffer setCompatibilityMetadata:](v9, "setCompatibilityMetadata:", -[NUAuxiliaryImageRawBuffer compatibilityMetadata](self, "compatibilityMetadata"));
  return v9;
}

- (id)auxiliaryImageByUpdatingMetadata:(CGImageMetadata *)a3
{
  NUAuxiliaryImageRawBuffer *v5;
  __CVBuffer *v6;
  int64_t v7;
  void *v8;
  NUAuxiliaryImageRawBuffer *v9;
  void *v10;

  v5 = [NUAuxiliaryImageRawBuffer alloc];
  v6 = -[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer");
  v7 = -[NUAuxiliaryImageRawBuffer auxiliaryImageType](self, "auxiliaryImageType");
  -[NUAuxiliaryImageRawBuffer cgAuxIdentifier](self, "cgAuxIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:](v5, "initWithPixelBuffer:auxiliaryImageType:identifier:", v6, v7, v8);

  -[NUAuxiliaryImageRawBuffer setMetadata:](v9, "setMetadata:", a3);
  -[NUAuxiliaryImageRawBuffer colorSpace](self, "colorSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUAuxiliaryImageRawBuffer setColorSpace:](v9, "setColorSpace:", v10);

  -[NUAuxiliaryImageRawBuffer setCompatibilityMetadata:](v9, "setCompatibilityMetadata:", -[NUAuxiliaryImageRawBuffer compatibilityMetadata](self, "compatibilityMetadata"));
  return v9;
}

- (CGImage)cgImageRef
{
  OSStatus v3;
  OSStatus v4;
  NSObject *v5;
  CGImage *v6;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  off_t DataSize;
  CVPixelBufferRef v11;
  CGDataProvider *v12;
  void *v13;
  void *v14;
  BOOL v15;
  CGDataProviderDirectCallbacks imageOut;
  uint8_t buf[4];
  OSStatus v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NUAuxiliaryImageRawBuffer auxiliaryImageType](self, "auxiliaryImageType") != 12
    && -[NUAuxiliaryImageRawBuffer auxiliaryImageType](self, "auxiliaryImageType") != 11)
  {
    Width = CVPixelBufferGetWidth(self->_pixelBuffer);
    Height = CVPixelBufferGetHeight(self->_pixelBuffer);
    BytesPerRow = CVPixelBufferGetBytesPerRow(self->_pixelBuffer);
    DataSize = CVPixelBufferGetDataSize(self->_pixelBuffer);
    *(_OWORD *)&imageOut.version = xmmword_1E5062410;
    *(_OWORD *)&imageOut.releaseBytePointer = *(_OWORD *)&off_1E5062420;
    imageOut.releaseInfo = (CGDataProviderReleaseInfoCallback)nu_CVPixelBufferDataProviderReleaseInfo;
    v11 = CVPixelBufferRetain(self->_pixelBuffer);
    v12 = CGDataProviderCreateDirect(v11, DataSize, &imageOut);
    +[NUColorSpace linearGrayColorSpace](NUColorSpace, "linearGrayColorSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUAuxiliaryImageRawBuffer cgAuxIdentifier](self, "cgAuxIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CBC710]))
    {
      v15 = +[NUGlobalSettings forceMeteorPlusLinear](NUGlobalSettings, "forceMeteorPlusLinear");

      if (v15)
      {
LABEL_13:
        v6 = CGImageCreate(Width, Height, 8uLL, 8uLL, BytesPerRow, (CGColorSpaceRef)objc_msgSend(v13, "CGColorSpace"), 0, v12, 0, 0, kCGRenderingIntentDefault);
        CGDataProviderRelease(v12);

        return v6;
      }
      +[NUColorSpace genericGrayGamma2_2ColorSpace](NUColorSpace, "genericGrayGamma2_2ColorSpace");
      v14 = v13;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }
  *(_QWORD *)&imageOut.version = 0;
  v3 = VTCreateCGImageFromCVPixelBuffer(-[NUAuxiliaryImageRawBuffer cvPixelBufferRef](self, "cvPixelBufferRef"), 0, (CGImageRef *)&imageOut);
  if (v3)
  {
    v4 = v3;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_190);
    v5 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v4;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "VTCreateCGImageFromCVPixelBuffer() failed: %d", buf, 8u);
    }
  }
  return *(CGImage **)&imageOut.version;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;

  v3 = 0;
  -[NUAuxiliaryImageRawBuffer dictionaryRepresentationForAuxiliaryDataType:](self, "dictionaryRepresentationForAuxiliaryDataType:", &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3
{
  unsigned int v5;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *v9;
  void *v10;
  int v11;
  CGImageMetadata *v12;
  void *v13;
  __CVBuffer *v14;
  CGImageMetadata *v15;
  void *v16;
  id v17;

  v5 = -[NUAuxiliaryImageRawBuffer pixelFormatType](self, "pixelFormatType");
  Width = CVPixelBufferGetWidth(-[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer"));
  Height = CVPixelBufferGetHeight(-[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer"));
  BytesPerRow = CVPixelBufferGetBytesPerRow(-[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer"));
  v9 = 0;
  if (v5 && Width && Height && BytesPerRow)
  {
    -[NUAuxiliaryImageRawBuffer cgAuxIdentifier](self, "cgAuxIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CBC718]);

    if (v11)
      v12 = -[NUAuxiliaryImageRawBuffer compatibilityMetadata](self, "compatibilityMetadata");
    else
      v12 = 0;
    v13 = (void *)MEMORY[0x1E0D75130];
    v14 = -[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer");
    v15 = -[NUAuxiliaryImageRawBuffer metadata](self, "metadata");
    -[NUAuxiliaryImageRawBuffer colorSpace](self, "colorSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentationForAuxiliaryImagePixelBuffer:metadata:colorSpace:compatibilityMetadata:", v14, v15, objc_msgSend(v16, "CGColorSpace"), v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (a3)
      {
        -[NUAuxiliaryImageRawBuffer cgAuxIdentifier](self, "cgAuxIdentifier");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v9;
    }

  }
  return v9;
}

- (unsigned)pixelFormatType
{
  return CVPixelBufferGetPixelFormatType(-[NUAuxiliaryImageRawBuffer pixelBuffer](self, "pixelBuffer"));
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (CGImageMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(CGImageMetadata *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (CGImageMetadata)compatibilityMetadata
{
  return self->_compatibilityMetadata;
}

- (void)setCompatibilityMetadata:(CGImageMetadata *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)cgAuxIdentifier
{
  return self->_cgAuxIdentifier;
}

- (void)setCgAuxIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cgAuxIdentifier, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
}

@end
