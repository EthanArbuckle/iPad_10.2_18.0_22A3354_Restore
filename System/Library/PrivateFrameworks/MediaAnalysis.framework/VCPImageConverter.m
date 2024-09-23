@implementation VCPImageConverter

- (VCPImageConverter)init
{
  VCPImageConverter *v2;
  VTPixelTransferSessionRef *p_isa;
  VTPixelTransferSessionRef *v4;
  VCPImageConverter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VCPImageConverter;
  v2 = -[VCPImageConverter init](&v7, sel_init);
  p_isa = &v2->super.isa;
  if (v2)
  {
    v2->_pixelFormat = 875704422;
    v2->_rgbFrame = 0;
    v2->_yuvFrames = 0;
    v2->_cgContext = 0;
    v2->_rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    if (VTPixelTransferSessionCreate(0, p_isa + 7))
      v4 = 0;
    else
      v4 = p_isa;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (VCPImageConverter)initWithPixelFormat:(int)a3
{
  VCPImageConverter *v4;
  VTPixelTransferSessionRef *p_isa;
  VTPixelTransferSessionRef *v6;
  VCPImageConverter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPImageConverter;
  v4 = -[VCPImageConverter init](&v9, sel_init);
  p_isa = &v4->super.isa;
  if (v4)
  {
    v4->_pixelFormat = a3;
    v4->_rgbFrame = 0;
    v4->_yuvFrames = 0;
    v4->_cgContext = 0;
    v4->_rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    if (VTPixelTransferSessionCreate(0, p_isa + 7))
      v6 = 0;
    else
      v6 = p_isa;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  CGColorSpace *rgbColorSpace;
  CGContext *cgContext;
  __CVBuffer *rgbFrame;
  __CVPixelBufferPool *yuvFrames;
  OpaqueVTPixelTransferSession *rgbToYuv;
  objc_super v8;

  rgbColorSpace = self->_rgbColorSpace;
  if (rgbColorSpace)
    CFRelease(rgbColorSpace);
  cgContext = self->_cgContext;
  if (cgContext)
    CFRelease(cgContext);
  rgbFrame = self->_rgbFrame;
  if (rgbFrame)
    CFRelease(rgbFrame);
  yuvFrames = self->_yuvFrames;
  if (yuvFrames)
    CFRelease(yuvFrames);
  rgbToYuv = self->_rgbToYuv;
  if (rgbToYuv)
    CFRelease(rgbToYuv);
  v8.receiver = self;
  v8.super_class = (Class)VCPImageConverter;
  -[VCPImageConverter dealloc](&v8, sel_dealloc);
}

- (int)resize:(int)a3 height:(int)a4
{
  const __CFDictionary *Mutable;
  const void *v8;
  __CVBuffer *rgbFrame;
  __CVBuffer **p_rgbFrame;
  CVReturn v11;
  int v12;
  __CFDictionary *v13;
  CFNumberRef v14;
  __CFDictionary *v15;
  CFNumberRef v16;
  __CFDictionary *v17;
  CFNumberRef v18;
  __CVPixelBufferPool *yuvFrames;
  CGContext *cgContext;
  void *BaseAddress;
  size_t BytesPerRow;
  const void *v24[3];
  CFMutableDictionaryRef theDict;
  CFDictionaryRef pixelBufferAttributes;
  void *value;
  int valuePtr;

  if (self->_width == a3 && self->_height == a4)
    return 0;
  self->_width = 0;
  self->_height = 0;
  value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (value)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    pixelBufferAttributes = Mutable;
    if (Mutable)
    {
      v8 = (const void *)*MEMORY[0x1E0CA8FF0];
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA8FF0], value);
      p_rgbFrame = &self->_rgbFrame;
      rgbFrame = self->_rgbFrame;
      if (rgbFrame)
      {
        CFRelease(rgbFrame);
        *p_rgbFrame = 0;
      }
      v11 = CVPixelBufferCreate(0, a3, a4, 0x20u, pixelBufferAttributes, &self->_rgbFrame);
      if (v11)
      {
        v12 = 1;
      }
      else
      {
        v13 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        theDict = v13;
        if (v13)
        {
          valuePtr = a3;
          v14 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          v24[0] = v14;
          if (v14)
            CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CA90E0], v14);
          CF<opaqueCMSampleBuffer *>::~CF(v24);
          v15 = theDict;
          valuePtr = a4;
          v16 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          v24[0] = v16;
          if (v16)
            CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0CA8FD8], v16);
          CF<opaqueCMSampleBuffer *>::~CF(v24);
          v17 = theDict;
          valuePtr = self->_pixelFormat;
          v18 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          v24[0] = v18;
          if (v18)
            CFDictionarySetValue(v17, (const void *)*MEMORY[0x1E0CA9040], v18);
          CF<opaqueCMSampleBuffer *>::~CF(v24);
          CFDictionarySetValue(theDict, v8, value);
          yuvFrames = self->_yuvFrames;
          if (yuvFrames)
          {
            CFRelease(yuvFrames);
            self->_yuvFrames = 0;
          }
          v11 = CVPixelBufferPoolCreate(0, 0, theDict, &self->_yuvFrames);
          if (v11)
          {
            v12 = 1;
          }
          else
          {
            cgContext = self->_cgContext;
            if (cgContext)
            {
              CFRelease(cgContext);
              self->_cgContext = 0;
            }
            CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)v24, *p_rgbFrame, 0);
            v11 = (CVReturn)v24[0];
            if (LODWORD(v24[0])
              || (BaseAddress = CVPixelBufferGetBaseAddress(*p_rgbFrame),
                  BytesPerRow = CVPixelBufferGetBytesPerRow(*p_rgbFrame),
                  self->_cgContext = CGBitmapContextCreate(BaseAddress, a3, a4, 8uLL, BytesPerRow, self->_rgbColorSpace, 6u), (v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v24)) != 0))
            {
              v12 = 1;
            }
            else
            {
              v12 = 0;
              self->_width = a3;
              self->_height = a4;
            }
            CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)v24);
          }
        }
        else
        {
          v12 = 1;
          v11 = -108;
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&theDict);
      }
    }
    else
    {
      v12 = 1;
      v11 = -108;
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferAttributes);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&value);
    if (!v12)
      return 0;
  }
  else
  {
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&value);
    return -108;
  }
  return v11;
}

- (int)convertImage:(CGImage *)a3 yuvFrame:(__CVBuffer *)a4
{
  __IOSurface *Property;
  __CVBuffer *v8;
  uint64_t Width;
  __CVBuffer *rgbFrame;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  size_t Height;
  _BOOL4 v27;
  __CVBuffer *v28;
  int v30;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  CVPixelBufferRef destinationBuffer;
  CVPixelBufferRef pixelBufferOut;
  CGRect v35;

  *a4 = 0;
  Property = (__IOSurface *)CGImageGetProperty();
  pixelBufferOut = 0;
  if (!Property
    || (CVPixelBufferCreateWithIOSurface(0, Property, 0, &pixelBufferOut),
        CVPixelBufferGetPixelFormatType(pixelBufferOut) != self->_pixelFormat))
  {
    Width = CGImageGetWidth(a3);
    LODWORD(Width) = -[VCPImageConverter resize:height:](self, "resize:height:", Width, CGImageGetHeight(a3));
    if ((_DWORD)Width)
      goto LABEL_28;
    destinationBuffer = 0;
    LODWORD(Width) = CVPixelBufferPoolCreatePixelBuffer(0, self->_yuvFrames, &destinationBuffer);
    if ((_DWORD)Width)
      goto LABEL_27;
    if (pixelBufferOut && !VTPixelTransferSessionTransferImage(self->_rgbToYuv, pixelBufferOut, destinationBuffer))
      goto LABEL_24;
    rgbFrame = self->_rgbFrame;
    pixelBuffer = rgbFrame;
    unlockFlags = 0;
    if (rgbFrame)
    {
      Width = CVPixelBufferLockBaseAddress(rgbFrame, 0);
      v30 = Width;
      if ((_DWORD)Width)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)rgbFrame, Width, v11, v12, v13, v14, v15, v16);
      }
      else
      {
        Width = (uint64_t)self->_cgContext;
        v25 = CGImageGetWidth(a3);
        Height = CGImageGetHeight(a3);
        v35.size.width = (double)v25;
        v35.size.height = (double)Height;
        v35.origin.x = 0.0;
        v35.origin.y = 0.0;
        CGContextDrawImage((CGContextRef)Width, v35, a3);
        LODWORD(Width) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v30);
        if (!(_DWORD)Width)
        {
          LODWORD(Width) = VTPixelTransferSessionTransferImage(self->_rgbToYuv, self->_rgbFrame, destinationBuffer);
          v27 = Width != 0;
          goto LABEL_19;
        }
      }
    }
    else
    {
      v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v17)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
      LODWORD(Width) = -50;
      v30 = -50;
    }
    v27 = 1;
LABEL_19:
    if (pixelBuffer
      && !v30
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      if (!v27)
        goto LABEL_24;
    }
    else if (!v27)
    {
LABEL_24:
      v28 = destinationBuffer;
      if (destinationBuffer)
        v28 = (__CVBuffer *)CFRetain(destinationBuffer);
      LODWORD(Width) = 0;
      *a4 = v28;
    }
LABEL_27:
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&destinationBuffer);
    goto LABEL_28;
  }
  v8 = pixelBufferOut;
  if (pixelBufferOut)
    v8 = (__CVBuffer *)CFRetain(pixelBufferOut);
  LODWORD(Width) = 0;
  *a4 = v8;
LABEL_28:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferOut);
  return Width;
}

- (void)convertImage:(uint64_t)a3 yuvFrame:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "Failed to lock CVPixelBuffer (%p, %d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
