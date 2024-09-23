@implementation MFHardwareJPEGScaler

- (MFHardwareJPEGScaler)initWithImageData:(id)a3 imageSource:(CGImageSource *)a4
{
  id v7;
  MFHardwareJPEGScaler *v8;
  const __CFDictionary *v9;
  int v10;
  int v11;
  BOOL v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFHardwareJPEGScaler;
  v8 = -[MFHardwareJPEGScaler init](&v15, sel_init);
  if (v8 && MGGetBoolAnswer() && -[MFHardwareJPEGScaler _isJPEGImage:](v8, "_isJPEGImage:", a4))
  {
    objc_storeStrong((id *)&v8->_imageData, a3);
    v9 = CGImageSourceCopyPropertiesAtIndex(a4, 0, 0);
    v8->_imageProperties = v9;
    v10 = objc_msgSend((id)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x1E0CBD048]), "intValue");
    v11 = objc_msgSend((id)CFDictionaryGetValue(v8->_imageProperties, (const void *)*MEMORY[0x1E0CBD040]), "intValue");
    v13 = v10 < 8185 && v11 < 4093;
    v8->_canHardwareScaleImage = v13;
  }

  return v8;
}

- (void)dealloc
{
  __CFDictionary *imageProperties;
  __IOSurface *ioSurfaceRef;
  objc_super v5;

  imageProperties = self->_imageProperties;
  if (imageProperties)
    CFRelease(imageProperties);
  ioSurfaceRef = self->_ioSurfaceRef;
  if (ioSurfaceRef)
    CFRelease(ioSurfaceRef);
  v5.receiver = self;
  v5.super_class = (Class)MFHardwareJPEGScaler;
  -[MFHardwareJPEGScaler dealloc](&v5, sel_dealloc);
}

- (BOOL)_isJPEGImage:(CGImageSource *)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CGImageSourceGetType(a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC530]);

  return v4;
}

- (BOOL)_decodeImageToIOSurface
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0D0D560], 0);
  v5 = MEMORY[0x1AF432870](self->_imageData, v4, &self->_ioSurfaceRef);
  if (v5)
    self->_canHardwareScaleImage = 0;
  v6 = v5 != 0;

  return v6;
}

- (BOOL)scaleImageToFitLargestDimension:(id)a3 dataConsumer:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  __IOSurface *ioSurfaceRef;
  int Width;
  IOSurfaceRef IOSurface;
  id v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *BaseAddress;
  void *v19;
  void *EXIFJPEGData;
  CVPixelBufferRef destinationBuffer;
  CVPixelBufferRef pixelBuffer;
  IOSurfaceRef buffer;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBufferOut;

  v6 = a3;
  v7 = a4;
  if (!self->_canHardwareScaleImage || (int)objc_msgSend(v6, "intValue") > 4092)
    goto LABEL_3;
  ioSurfaceRef = self->_ioSurfaceRef;
  if (!ioSurfaceRef)
  {
    if (-[MFHardwareJPEGScaler _decodeImageToIOSurface](self, "_decodeImageToIOSurface"))
    {
LABEL_3:
      v8 = 0;
      goto LABEL_23;
    }
    ioSurfaceRef = self->_ioSurfaceRef;
  }
  pixelTransferSessionOut = 0;
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], ioSurfaceRef, 0, &pixelBufferOut);
  VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
  Width = IOSurfaceGetWidth(self->_ioSurfaceRef);
  IOSurfaceGetHeight(self->_ioSurfaceRef);
  buffer = 0;
  objc_msgSend(v6, "intValue");
  pixelBuffer = 0;
  if (Width < 4093)
  {
    FigCreateIOSurfaceBackedCVPixelBuffer();
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, pixelBuffer);
    CVPixelBufferRelease(pixelBufferOut);
    pixelBufferOut = 0;
  }
  else
  {
    destinationBuffer = 0;
    FigCreateIOSurfaceBackedCVPixelBuffer();
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, 0);
    CVPixelBufferRelease(pixelBufferOut);
    pixelBufferOut = 0;
    FigCreateIOSurfaceBackedCVPixelBuffer();
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, 0, pixelBuffer);
    CVPixelBufferRelease(0);
  }
  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  CFRetain(IOSurface);
  CVPixelBufferRelease(pixelBuffer);
  v12 = objc_alloc(MEMORY[0x1E0C99D80]);
  LODWORD(v13) = *(_DWORD *)"fff?";
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E0CBC780], 0);

  LODWORD(destinationBuffer) = 0;
  v16 = MEMORY[0x1AF432858](IOSurface, v15, &buffer, &destinationBuffer);
  v8 = v16 == 0;
  if (v16)
  {
    if (!IOSurface)
      goto LABEL_18;
  }
  else
  {
    IOSurfaceLock(buffer, 1u, 0);
    v17 = objc_alloc(MEMORY[0x1E0D46080]);
    BaseAddress = IOSurfaceGetBaseAddress(buffer);
    v19 = (void *)objc_msgSend(v17, "initWithBytesNoCopy:length:freeWhenDone:", BaseAddress, (int)destinationBuffer, 0);
    if (self->_imageProperties)
    {
      EXIFJPEGData = (void *)CGImageCreateEXIFJPEGData();
      objc_msgSend(v7, "appendData:", EXIFJPEGData);

    }
    else
    {
      objc_msgSend(v7, "appendData:", v19);
    }
    IOSurfaceUnlock(buffer, 1u, 0);

    if (!IOSurface)
      goto LABEL_18;
  }
  CFRelease(IOSurface);
LABEL_18:
  if (buffer)
    CFRelease(buffer);
  if (pixelTransferSessionOut)
    CFRelease(pixelTransferSessionOut);

LABEL_23:
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
