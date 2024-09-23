@implementation NSData(SafariServicesExtras)

+ (CGImage)safari_readingListThumbnailImageDataWithCGImage:()SafariServicesExtras
{
  CGImage *v3;
  size_t Width;
  size_t Height;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGColorSpace *DeviceRGB;
  CGContext *v13;
  CGImage *Image;
  UIImage *v15;
  CGRect v17;

  v3 = a3;
  if (a3)
  {
    Width = CGImageGetWidth(a3);
    Height = CGImageGetHeight(v3);
    v6 = (double)((Height - Width) >> 1);
    v7 = (double)((Width - Height) >> 1);
    if (Width > Height)
      v6 = 0.0;
    else
      v7 = 0.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

    v11 = v10 * 192.0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v13 = CGBitmapContextCreate(0, (unint64_t)v11, (unint64_t)v11, 8uLL, vcvtd_n_u64_f64(v11, 2uLL), DeviceRGB, 0x2002u);
    CGColorSpaceRelease(DeviceRGB);
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = v11;
    v17.size.height = v11;
    CGContextClearRect(v13, v17);
    CGContextSetBlendMode(v13, kCGBlendModeCopy);
    CGContextDrawImageFromRect();
    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
    v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(Image);
    UIImagePNGRepresentation(v15);
    v3 = (CGImage *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
