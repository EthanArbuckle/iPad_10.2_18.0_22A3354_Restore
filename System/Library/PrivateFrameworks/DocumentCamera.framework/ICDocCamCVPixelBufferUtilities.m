@implementation ICDocCamCVPixelBufferUtilities

+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3
{
  CGImage *result;

  result = (CGImage *)CVBufferGetAttachment(a3, (CFStringRef)*MEMORY[0x24BDC5410], 0);
  if (result)
    return (CGImage *)objc_msgSend(a1, "createImageWithCVPixelBuffer:colorSpace:", a3, result);
  return result;
}

+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4
{
  return (CGImage *)objc_msgSend(a1, "createImageWithCVPixelBuffer:colorSpace:copyMemory:", a3, a4, 1);
}

+ (CGImage)createImageWithCVPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4 copyMemory:(BOOL)a5
{
  _BOOL4 v5;
  OSType PixelFormatType;
  CGBitmapInfo v9;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  void *BaseAddress;
  const void *v14;
  void *v15;
  void *v16;
  CGDataProvider *v17;
  CGDataProvider *v18;
  CGImage *v19;
  CGDataProvider *v20;
  CGDataProviderRef v21;
  CGDataProvider *v22;

  v5 = a5;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 32)
  {
    v9 = 16390;
    if (!a4)
      return 0;
  }
  else
  {
    if (PixelFormatType != 1111970369)
      return 0;
    v9 = 8198;
    if (!a4)
      return 0;
  }
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    if (BaseAddress)
    {
      v14 = BaseAddress;
      if (!v5)
      {
        v21 = CGDataProviderCreateWithData(a3, BaseAddress, Height * BytesPerRow, (CGDataProviderReleaseDataCallback)sReleaseCVPixelBuffer);
        if (!v21)
        {
          if (a3)
          {
            CVPixelBufferUnlockBaseAddress(a3, 1uLL);
            CVPixelBufferRelease(a3);
          }
          return 0;
        }
        v22 = v21;
        CVPixelBufferRetain(a3);
        v19 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, a4, v9, v22, 0, 1, kCGRenderingIntentDefault);
        v20 = v22;
LABEL_14:
        CGDataProviderRelease(v20);
        return v19;
      }
      v15 = malloc_type_malloc(Height * BytesPerRow, 0xA023D790uLL);
      if (v15)
      {
        v16 = v15;
        memcpy(v15, v14, Height * BytesPerRow);
        v17 = CGDataProviderCreateWithData(v16, v16, Height * BytesPerRow, (CGDataProviderReleaseDataCallback)sReleasePixelMemory);
        if (v17)
        {
          v18 = v17;
          v19 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, a4, v9, v17, 0, 1, kCGRenderingIntentDefault);
          v20 = v18;
          goto LABEL_14;
        }
      }
    }
  }
  return 0;
}

+ (id)coreImageForPixelBuffer:(__CVBuffer *)a3 colorSpace:(CGColorSpace *)a4
{
  CGImage *v4;
  void *v5;

  v4 = (CGImage *)objc_msgSend(a1, "createImageWithCVPixelBuffer:colorSpace:", a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
