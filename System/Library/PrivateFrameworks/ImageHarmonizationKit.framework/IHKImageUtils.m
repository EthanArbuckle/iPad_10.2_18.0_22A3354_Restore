@implementation IHKImageUtils

+ (CGImage)CopyCGImageTosRGB:(CGImage *)a3
{
  CGColorSpace *v4;
  CGImage *CopyWithColorSpace;

  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  CopyWithColorSpace = CGImageCreateCopyWithColorSpace(a3, v4);
  CGColorSpaceRelease(v4);
  return CopyWithColorSpace;
}

+ (CGImage)convertCGImageToBGRA_sRGB:(CGImage *)a3
{
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *v6;
  size_t BytesPerRow;
  CGContext *v8;
  CGImage *Image;
  CGRect v11;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  BytesPerRow = CGImageGetBytesPerRow(a3);
  v8 = CGBitmapContextCreate(0, Width, Height, 8uLL, BytesPerRow, v6, 0x2002u);
  v11.size.width = (double)Width;
  v11.size.height = (double)Height;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  CGContextDrawImage(v8, v11, a3);
  Image = CGBitmapContextCreateImage(v8);
  CGContextRelease(v8);
  CGColorSpaceRelease(v6);
  return Image;
}

+ (__CVBuffer)convertCGImageToBGRA_sRGB_PixelBuffer:(CGImage *)a3
{
  unint64_t Width;
  size_t Height;
  size_t v6;
  const __CFAllocator *v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v11;
  const void *v12;
  CVReturn v13;
  __CVBuffer *v14;
  CGColorSpace *v15;
  void *BaseAddress;
  size_t BytesPerRow;
  CGContext *v18;
  std::runtime_error *exception;
  std::runtime_error *v21;
  std::string *v22;
  __int128 v23;
  size_t v24;
  char v25;
  char v26;
  std::string v27;
  std::string v28;
  __CFDictionary *v29;
  CVPixelBufferRef pixelBufferOut;
  CGRect v31;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v24 = Height;
  v25 = 0;
  v26 = 0;
  if (!Width || (v6 = Height) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid dimensions requested for CVPixelBuffer creation.");
    goto LABEL_15;
  }
  pixelBufferOut = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v29 = Mutable;
  v11 = CFDictionaryCreateMutable(v7, 0, v8, v9);
  v12 = (const void *)*MEMORY[0x24BDC5668];
  v28.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
  CFDictionarySetValue(Mutable, v12, v11);
  if (v11)
    CFRelease(v11);
  v13 = CVPixelBufferCreate(v7, Width, v24, 0x42475241u, Mutable, &pixelBufferOut);
  if (v13)
  {
    v21 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v27, v13);
    v22 = std::string::insert(&v27, 0, "Failed to create CVPixelBuffer. Status = ");
    v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v21, &v28);
    __cxa_throw(v21, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v14 = pixelBufferOut;
  if (Mutable)
    CFRelease(Mutable);
  if (CVPixelBufferLockBaseAddress(v14, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    goto LABEL_15;
  }
  v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  BaseAddress = CVPixelBufferGetBaseAddress(v14);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
  v18 = CGBitmapContextCreate(BaseAddress, Width, v6, 8uLL, BytesPerRow, v15, 0x2002u);
  v31.size.width = (double)Width;
  v31.size.height = (double)v6;
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  CGContextDrawImage(v18, v31, a3);
  CVBufferSetAttachment(v14, (CFStringRef)*MEMORY[0x24BDC5410], v15, kCVAttachmentMode_ShouldNotPropagate);
  CGContextRelease(v18);
  CGColorSpaceRelease(v15);
  if (CVPixelBufferUnlockBaseAddress(v14, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
LABEL_15:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return v14;
}

+ (void)rescaleCVPixelBuffers:(__CVBuffer *)a3 dest:(__CVBuffer *)a4
{
  VTPixelTransferSessionRef *v6;
  uint64_t v7;
  uint64_t v8;
  std::runtime_error *exception;

  v6 = (VTPixelTransferSessionRef *)operator new();
  *v6 = 0;
  v7 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
  sub_23ECBDCC4(v7, "Session Creation");
  if (*v6)
  {
    v8 = VTPixelTransferSessionTransferImage(*v6, a3, a4);
    sub_23ECBDCC4(v8, "Image Transfer");
    if (*v6)
      CFRelease(*v6);
    JUMPOUT(0x24265E1B4);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "PixelBufferTransfer internal inconsistency: null session.");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

@end
