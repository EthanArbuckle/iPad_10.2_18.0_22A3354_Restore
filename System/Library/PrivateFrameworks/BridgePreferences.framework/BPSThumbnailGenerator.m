@implementation BPSThumbnailGenerator

+ (id)scaledImageForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  id v8;
  CGImage *v9;
  double v10;
  double v11;
  double v12;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  size_t BitsPerPixel;
  CGColorSpace *ColorSpace;
  CGImageAlphaInfo AlphaInfo;
  CGBitmapInfo BitmapInfo;
  uint32_t v21;
  CGContext *v22;
  CGImageRef Image;
  void *v24;
  CGRect v26;

  height = a4.height;
  width = a4.width;
  v8 = objc_retainAutorelease(a3);
  v9 = (CGImage *)objc_msgSend(v8, "CGImage");
  if (a5 <= 0.0)
  {
    objc_msgSend(v8, "scale");
    a5 = v10;
  }
  v11 = width * a5;
  v12 = height * a5;
  BitsPerComponent = CGImageGetBitsPerComponent(v9);
  BytesPerRow = CGImageGetBytesPerRow(v9);
  BitsPerPixel = CGImageGetBitsPerPixel(v9);
  ColorSpace = CGImageGetColorSpace(v9);
  AlphaInfo = CGImageGetAlphaInfo(v9);
  BitmapInfo = CGImageGetBitmapInfo(v9);
  if (BitsPerPixel == 64 && AlphaInfo == kCGImageAlphaLast && BitsPerComponent == 16)
    v21 = BitmapInfo & 0xFFFFFFE0 | 1;
  else
    v21 = BitmapInfo;
  v22 = CGBitmapContextCreate(0, (unint64_t)v11, (unint64_t)v12, BitsPerComponent, BytesPerRow, ColorSpace, v21);
  CGContextSetInterpolationQuality(v22, kCGInterpolationHigh);
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = v11;
  v26.size.height = v12;
  CGContextDrawImage(v22, v26, v9);
  Image = CGBitmapContextCreateImage(v22);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Image, 0, a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (Image)
    CFRelease(Image);
  if (v22)
    CFRelease(v22);

  return v24;
}

+ (BOOL)writeScaledPNGForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5 withPath:(id)a6
{
  double height;
  double width;
  void *v11;
  id v12;
  void *v13;
  UIImage *v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.png"), a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scaledImageForImage:desiredSize:scale:", v12, width, height, a5);
  v14 = (UIImage *)objc_claimAutoreleasedReturnValue();

  UIImagePNGRepresentation(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v15, "writeToFile:atomically:", v13, 0);

  return (char)v12;
}

+ (BOOL)writeScaledCPBitmapForImage:(id)a3 desiredSize:(CGSize)a4 scale:(double)a5 withPath:(id)a6
{
  double height;
  double width;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  height = a4.height;
  width = a4.width;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.cpbitmap"), a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scaledImageForImage:desiredSize:scale:", v12, width, height, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v14, "writeToCPBitmapFile:flags:", v13, (int)a5);
  return (char)v11;
}

@end
