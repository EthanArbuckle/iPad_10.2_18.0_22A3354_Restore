@implementation IMEmbeddedHardwareJPEGTranscoder

- (IMEmbeddedHardwareJPEGTranscoder)initWithImageData:(id)a3 imageSource:(CGImageSource *)a4
{
  IMEmbeddedHardwareJPEGTranscoder *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  void *Value;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  __CFDictionary *imageProperties;
  BOOL v32;
  objc_super v34;
  uint8_t buf[4];
  __CFDictionary *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)IMEmbeddedHardwareJPEGTranscoder;
  v6 = -[IMEmbeddedHardwareJPEGTranscoder init](&v34, sel_init);
  if (v6
    && MGGetBoolAnswer()
    && objc_msgSend__isJPEGImage_(v6, v7, (uint64_t)a4, v8, v9, v10, v11))
  {
    v6->_imageData = (NSData *)a3;
    v12 = CGImageSourceCopyPropertiesAtIndex(a4, 0, 0);
    v6->_imageProperties = v12;
    Value = (void *)CFDictionaryGetValue(v12, (const void *)*MEMORY[0x24BDD96C8]);
    v20 = objc_msgSend_intValue(Value, v14, v15, v16, v17, v18, v19);
    v21 = (void *)CFDictionaryGetValue(v6->_imageProperties, (const void *)*MEMORY[0x24BDD96C0]);
    v28 = objc_msgSend_intValue(v21, v22, v23, v24, v25, v26, v27);
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        imageProperties = v6->_imageProperties;
        *(_DWORD *)buf = 138412290;
        v36 = imageProperties;
        _os_log_impl(&dword_21DFB1000, v29, OS_LOG_TYPE_INFO, "Input image properties: %@", buf, 0xCu);
      }
    }
    v32 = v20 <= 0x4000 && v28 <= 0x4000;
    v6->_canHardwareScaleImage = v32;
  }
  return v6;
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
  v5.super_class = (Class)IMEmbeddedHardwareJPEGTranscoder;
  -[IMEmbeddedHardwareJPEGTranscoder dealloc](&v5, sel_dealloc);
}

- (BOOL)_isJPEGImage:(CGImageSource *)a3
{
  const __CFString *Type;

  Type = CGImageSourceGetType(a3);
  if (Type)
    LOBYTE(Type) = UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x24BDC17C0]) != 0;
  return (char)Type;
}

- (BOOL)_decodeImageToIOSurface
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v3 = objc_alloc(MEMORY[0x24BDBCE70]);
  v9 = (void *)objc_msgSend_initWithObjectsAndKeys_(v3, v4, *MEMORY[0x24BDBD270], v5, v6, v7, v8, *MEMORY[0x24BE12118], 0);
  v10 = CMPhotoJPEGCreateIOSurfaceFromJPEG();

  if (v10)
    self->_canHardwareScaleImage = 0;

  self->_imageData = 0;
  return v10 != 0;
}

- (BOOL)scaleImageToFitLargestDimension:(id)a3 outputData:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  __IOSurface *ioSurfaceRef;
  __IOSurface *v18;
  __IOSurface *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  IOSurfaceRef IOSurface;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  id v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  int v64;
  id v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  __CFDictionary *imageProperties;
  int v72;
  NSObject *v73;
  id EXIFJPEGData;
  NSObject *v75;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  __CFDictionary *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return 0;
  *a4 = 0;
  if (!self->_canHardwareScaleImage
    || (int)objc_msgSend_intValue(a3, a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6) > 0x4000)
  {
    return 0;
  }
  ioSurfaceRef = self->_ioSurfaceRef;
  if (!ioSurfaceRef)
  {
    if ((objc_msgSend__decodeImageToIOSurface(self, 0, v10, v11, v12, v13, v14) & 1) != 0)
      return 0;
    ioSurfaceRef = self->_ioSurfaceRef;
  }
  pixelTransferSessionOut = 0;
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], ioSurfaceRef, 0, &pixelBufferOut);
  VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
  v18 = self->_ioSurfaceRef;
  if (qword_2553B3FC8 != -1)
    dispatch_once(&qword_2553B3FC8, &unk_24E1FF638);
  off_2553B3FC0(v18);
  v19 = self->_ioSurfaceRef;
  if (qword_2553B3FD8 != -1)
    dispatch_once(&qword_2553B3FD8, &unk_24E1FF770);
  off_2553B3FD0(v19);
  objc_msgSend_intValue(a3, v20, v21, v22, v23, v24, v25);
  FigCreateIOSurfaceBackedCVPixelBuffer();
  VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, 0);
  CVPixelBufferRelease(pixelBufferOut);
  pixelBufferOut = 0;
  IOSurface = CVPixelBufferGetIOSurface(0);
  CFRetain(IOSurface);
  CVPixelBufferRelease(0);
  objc_msgSend_targetJPEGCompressionValue(self, v27, v28, v29, v30, v31, v32);
  v34 = v33;
  if (v33 <= 0.0)
  {
    v34 = 0.899999976;
  }
  else
  {
    v35 = 926232686;
    if (v33 == 0.75)
    {
LABEL_25:
      v51 = objc_alloc(MEMORY[0x24BDBCE70]);
      v57 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v52, v35, v53, v54, v55, v56);
      v50 = objc_msgSend_initWithObjectsAndKeys_(v51, v58, v57, v59, v60, v61, v62, *MEMORY[0x24BE12120], 0);
      goto LABEL_26;
    }
    if (v33 == 0.800000012)
    {
      v35 = 942682222;
      goto LABEL_25;
    }
    if (v33 == 0.824999988)
    {
      v35 = 942814579;
      goto LABEL_25;
    }
    if (v33 == 0.850000024)
    {
      v35 = 943009907;
      goto LABEL_25;
    }
    if (v33 == 0.899999976)
    {
      v35 = 959459438;
      goto LABEL_25;
    }
  }
  v36 = objc_alloc(MEMORY[0x24BDBCE70]);
  *(float *)&v37 = v34;
  v44 = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v38, v39, v40, v41, v42, v43, v37);
  v50 = objc_msgSend_initWithObjectsAndKeys_(v36, v45, v44, v46, v47, v48, v49, *MEMORY[0x24BDD9220], 0);
LABEL_26:
  v63 = (void *)v50;
  v64 = CMPhotoJPEGCreateJPEGFromIOSurface();

  v15 = v64 == 0;
  if (!v64)
  {
    if (qword_2553B3FF8 != -1)
      dispatch_once(&qword_2553B3FF8, &unk_24E1FF6B8);
    off_2553B3FF0(0, 1, 0);
    v65 = objc_alloc(MEMORY[0x24BDBCE50]);
    if (qword_2553B3FE8 != -1)
      dispatch_once(&qword_2553B3FE8, &unk_24E1FF790);
    v66 = off_2553B3FE0(0);
    v70 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v65, v67, v66, 0, 0, v68, v69);
    imageProperties = self->_imageProperties;
    v72 = IMOSLoggingEnabled();
    if (imageProperties)
    {
      if (v72)
      {
        v73 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v79 = imageProperties;
          _os_log_impl(&dword_21DFB1000, v73, OS_LOG_TYPE_INFO, "Out image properties: %@", buf, 0xCu);
        }
      }
      EXIFJPEGData = (id)CGImageCreateEXIFJPEGData();
    }
    else
    {
      if (v72)
      {
        v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v79 = 0;
          _os_log_impl(&dword_21DFB1000, v75, OS_LOG_TYPE_INFO, "Empty image properties: %@", buf, 0xCu);
        }
      }
      EXIFJPEGData = v70;
    }
    *a4 = EXIFJPEGData;

    if (qword_2553B4008 != -1)
      dispatch_once(&qword_2553B4008, &unk_24E1FF7B0);
    off_2553B4000(0, 1, 0);
  }
  if (IOSurface)
    CFRelease(IOSurface);
  if (pixelTransferSessionOut)
    CFRelease(pixelTransferSessionOut);
  return v15;
}

- (double)targetJPEGCompressionValue
{
  return self->_targetJPEGCompressionValue;
}

- (void)setTargetJPEGCompressionValue:(double)a3
{
  self->_targetJPEGCompressionValue = a3;
}

@end
