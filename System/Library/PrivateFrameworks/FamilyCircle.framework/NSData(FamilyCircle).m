@implementation NSData(FamilyCircle)

- (uint64_t)_faCircularImageDataWithDiameter:()FamilyCircle
{
  return objc_msgSend(a1, "_faCircularImageDataWithDiameter:cropRect:", a3, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (CFTypeRef)_faCreateImageRef
{
  CGDataProvider *v1;
  CGDataProvider *v2;
  CGImageSource *v3;
  CGImageSource *v4;
  CGImageRef ImageAtIndex;

  v1 = CGDataProviderCreateWithCFData(a1);
  v2 = v1;
  if (v1 && (v3 = CGImageSourceCreateWithDataProvider(v1, 0)) != 0)
  {
    v4 = v3;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, 0);
    CGDataProviderRelease(v2);
    CFRelease(v4);
    if (ImageAtIndex)
      return CFAutorelease(ImageAtIndex);
  }
  else
  {
    CGDataProviderRelease(v2);
  }
  return 0;
}

- (double)_faTranformedRectForImageSize:()FamilyCircle cropRect:diameter:
{
  double v7;
  CGRect v9;

  if (a5 <= 0.0)
    return 0.0;
  v7 = -(a3 * (a7 / a5));
  v9.origin.x = a3;
  v9.origin.y = a4;
  v9.size.width = a5;
  v9.size.height = a6;
  CGRectGetMaxY(v9);
  return v7;
}

- (CFTypeRef)_faCreateContextWithImage:()FamilyCircle crop:diameter:
{
  CGColorSpace *DeviceRGB;
  CGContext *v16;
  const CGPath *v17;
  double Width;
  CGRect v20;
  CGRect v21;

  if (cf)
  {
    CFRetain(cf);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (DeviceRGB)
      v16 = CGBitmapContextCreate(0, (unint64_t)a8, (unint64_t)a8, 8uLL, 0, DeviceRGB, 1u);
    else
      v16 = 0;
    CGContextSetInterpolationQuality(v16, kCGInterpolationMedium);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = a8;
    v20.size.height = a8;
    v17 = CGPathCreateWithEllipseInRect(v20, 0);
    CGContextAddPath(v16, v17);
    CGContextClip(v16);
    Width = (double)CGImageGetWidth((CGImageRef)cf);
    objc_msgSend(a1, "_faTranformedRectForImageSize:cropRect:diameter:", Width, (double)CGImageGetHeight((CGImageRef)cf), a4, a5, a6, a7, a8);
    CGContextDrawImage(v16, v21, (CGImageRef)cf);
  }
  else
  {
    v17 = 0;
    v16 = 0;
    DeviceRGB = 0;
  }
  CGPathRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  CGImageRelease((CGImageRef)cf);
  if (v16)
    return CFAutorelease(v16);
  else
    return 0;
}

- (__CFData)_faCircularImageDataWithDiameter:()FamilyCircle cropRect:
{
  void *v12;
  CFTypeRef v13;
  NSObject *v14;
  __CFData *v15;
  CGContext *v16;
  CGImageRef Image;
  CGImage *v18;
  __CFData *Mutable;
  CGImageDestination *v20;
  CGImageDestination *v21;

  v12 = (void *)MEMORY[0x1D179A08C]();
  if (a2 <= 0.0)
  {
    _FALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NSData(FamilyCircle) _faCircularImageDataWithDiameter:cropRect:].cold.1(v14, a2);

    v15 = 0;
  }
  else
  {
    if (objc_msgSend(a1, "_faCreateImageRef"))
      v13 = CFRetain((CFTypeRef)objc_msgSend(a1, "_faCreateImageRef"));
    else
      v13 = 0;
    if (objc_msgSend(a1, "_faCreateContextWithImage:crop:diameter:", v13, a3, a4, a5, a6, a2))
      v16 = (CGContext *)CFRetain((CFTypeRef)objc_msgSend(a1, "_faCreateContextWithImage:crop:diameter:", v13, a3, a4, a5, a6, a2));
    else
      v16 = 0;
    Image = CGBitmapContextCreateImage(v16);
    if (Image)
    {
      v18 = Image;
      Mutable = CFDataCreateMutable(0, 0);
      v20 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
      if (v20)
      {
        v21 = v20;
        CGImageDestinationAddImage(v20, v18, 0);
        CGImageDestinationFinalize(v21);
        CFRelease(v21);
      }
      CFRelease(v18);
    }
    else
    {
      Mutable = 0;
    }
    CGContextRelease(v16);
    if (v13)
      CFRelease(v13);
    if (-[__CFData length](Mutable, "length"))
      v15 = Mutable;
    else
      v15 = 0;

  }
  objc_autoreleasePoolPop(v12);
  return v15;
}

- (id)fa_dictionaryFromPlistData
{
  void *v1;
  id v2;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a1, 0, 0, &v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if (!v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v1;
    else
      v2 = 0;
  }

  return v2;
}

- (void)_faCircularImageDataWithDiameter:()FamilyCircle cropRect:.cold.1(os_log_t log, double a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[NSData(FamilyCircle) _faCircularImageDataWithDiameter:cropRect:]";
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_ERROR, "%s invalid diameter %f", (uint8_t *)&v2, 0x16u);
}

@end
