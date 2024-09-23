@implementation AAFImage

+ (id)circularImageData:(id)a3 withDiameter:(double)a4
{
  return (id)objc_msgSend(a1, "circularImageData:withDiameter:crop:", a3, a4, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

+ (id)circularImageData:(id)a3 withDiameter:(double)a4 crop:(CGRect)a5
{
  CGImage *v5;

  v5 = +[AAFImage circularImage:withDiameter:crop:](AAFImage, "circularImage:withDiameter:crop:", objc_msgSend(a3, "aaf_toImageRef"), a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "aaf_fromImageRef:", v5);
    v5 = (CGImage *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (CGImage)circularImage:(CGImage *)a3 withDiameter:(double)a4 crop:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v12;
  CGContext *v13;
  const CGPath *v14;
  double v15;
  CGImageRef Image;
  NSObject *v18;
  CGRect v19;
  CGRect v20;

  if (a3)
  {
    if (a4 <= 0.0)
    {
      _AAFLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[AAFImage circularImage:withDiameter:crop:].cold.1(v18, a4);

    }
    else
    {
      height = a5.size.height;
      width = a5.size.width;
      y = a5.origin.y;
      x = a5.origin.x;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
      {
        v12 = DeviceRGB;
        v13 = CGBitmapContextCreate(0, (unint64_t)a4, (unint64_t)a4, 8uLL, 0, DeviceRGB, 1u);
        CGContextSetInterpolationQuality(v13, kCGInterpolationHigh);
        v19.origin.x = 0.0;
        v19.origin.y = 0.0;
        v19.size.width = a4;
        v19.size.height = a4;
        v14 = CGPathCreateWithEllipseInRect(v19, 0);
        CGContextAddPath(v13, v14);
        CGContextClip(v13);
        v15 = (double)CGImageGetWidth(a3);
        +[AAFImage tranformedRectForImageSize:withDiameter:crop:](AAFImage, "tranformedRectForImageSize:withDiameter:crop:", v15, (double)CGImageGetHeight(a3), a4, x, y, width, height);
        CGContextDrawImage(v13, v20, a3);
        Image = CGBitmapContextCreateImage(v13);
        CGPathRelease(v14);
        CGContextRelease(v13);
        CGColorSpaceRelease(v12);
        if (Image)
          return (CGImage *)CFAutorelease(Image);
      }
    }
  }
  return 0;
}

+ (CGRect)tranformedRectForImageSize:(CGSize)a3 withDiameter:(double)a4 crop:(CGRect)a5
{
  double v5;
  double height;
  double v7;
  double width;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v5 = a4;
  height = a3.height;
  v7 = 0.0;
  if (a5.size.width <= 0.0)
  {
    v10 = 0.0;
  }
  else
  {
    width = a3.width;
    v9 = a4 / a5.size.width;
    v10 = -(a5.origin.x * (a4 / a5.size.width));
    v7 = -((height - CGRectGetMaxY(a5)) * (a4 / a5.size.width));
    a4 = width * v9;
    v5 = height * v9;
  }
  v11 = v10;
  v12 = v5;
  result.size.height = v12;
  result.size.width = a4;
  result.origin.y = v7;
  result.origin.x = v11;
  return result;
}

+ (void)circularImage:(os_log_t)log withDiameter:(double)a2 crop:.cold.1(os_log_t log, double a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "+[AAFImage circularImage:withDiameter:crop:]";
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_1D51A2000, log, OS_LOG_TYPE_ERROR, "AAFImage %s invalid diameter %f", (uint8_t *)&v2, 0x16u);
}

@end
