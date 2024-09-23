@implementation CRKCoreGraphicsUtilities

+ (id)imageDataFromImage:(CGImage *)a3
{
  __CFData *v4;
  __CFString *v5;
  CGImageDestination *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = (__CFData *)objc_opt_new();
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = CGImageDestinationCreateWithData(v4, v5, 1uLL, 0);

  if (!v6)
  {
    _CRKLogGeneral_16();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CRKCoreGraphicsUtilities imageDataFromImage:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_8;
  }
  CGImageDestinationAddImage(v6, a3, 0);
  v7 = CGImageDestinationFinalize(v6);
  CFRelease(v6);
  if (!v7)
  {
    _CRKLogGeneral_16();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CRKCoreGraphicsUtilities imageDataFromImage:].cold.2(v9, v17, v18, v19, v20, v21, v22, v23);
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  v8 = (void *)-[__CFData copy](v4, "copy");
LABEL_9:

  return v8;
}

+ (CGImage)createResizedImageFromImage:(CGImage *)a3 newSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  size_t v7;
  size_t v8;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGImage *result;
  CGContext *v14;
  CGImage *Image;
  CGRect v16;

  height = a4.height;
  width = a4.width;
  v7 = (unint64_t)a4.width;
  v8 = (unint64_t)a4.height;
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  BytesPerRow = CGImageGetBytesPerRow(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  BitmapInfo = CGImageGetBitmapInfo(a3);
  result = CGBitmapContextCreate(0, v7, v8, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  if (result)
  {
    v14 = result;
    CGContextSetInterpolationQuality(result, kCGInterpolationHigh);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = width;
    v16.size.height = height;
    CGContextDrawImage(v14, v16, a3);
    Image = CGBitmapContextCreateImage(v14);
    CGContextRelease(v14);
    return Image;
  }
  return result;
}

+ (CGContext)createImageContextForSize:(CGSize)a3
{
  double height;
  double width;
  CGContext *result;
  CGColorSpace *v6;
  size_t AlignedBytesPerRow;
  CGContext *v8;

  height = a3.height;
  width = a3.width;
  result = CGColorSpaceCreateDeviceRGB();
  if (result)
  {
    v6 = result;
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v8 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, AlignedBytesPerRow, v6, 0x2002u);
    CFRelease(v6);
    return v8;
  }
  return result;
}

+ (void)imageDataFromImage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_218C99000, a1, a3, "Failed to create CGImageDestination with data", a5, a6, a7, a8, 0);
}

+ (void)imageDataFromImage:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_218C99000, a1, a3, "Failed to convert CG context to image data", a5, a6, a7, a8, 0);
}

@end
