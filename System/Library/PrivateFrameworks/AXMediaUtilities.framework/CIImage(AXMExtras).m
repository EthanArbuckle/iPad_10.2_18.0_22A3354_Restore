@implementation CIImage(AXMExtras)

- (uint64_t)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:
{
  NSObject *v5;
  NSObject *v6;
  uint64_t result;
  NSObject *v8;
  NSObject *v9;

  switch(a4)
  {
    case 1:
      switch(a3)
      {
        case 0:
          AXMediaLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
            goto LABEL_20;
          goto LABEL_21;
        case 1:
          goto LABEL_25;
        case 2:
          goto LABEL_23;
        case 3:
          return 8;
        case 4:
          goto LABEL_22;
        default:
          goto LABEL_8;
      }
    case 2:
      AXMediaLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:].cold.4();

      switch(a3)
      {
        case 0:
          AXMediaLogCommon();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:].cold.2();

          goto LABEL_23;
        case 1:
          goto LABEL_23;
        case 2:
          goto LABEL_25;
        case 3:
          goto LABEL_22;
        case 4:
          return 8;
        default:
          goto LABEL_8;
      }
    case 3:
      switch(a3)
      {
        case 0:
          AXMediaLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
            goto LABEL_20;
          goto LABEL_21;
        case 1:
          goto LABEL_22;
        case 2:
          return 8;
        case 3:
          goto LABEL_25;
        case 4:
          goto LABEL_23;
        default:
          goto LABEL_8;
      }
    case 4:
      switch(a3)
      {
        case 0:
          AXMediaLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
LABEL_20:
            -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:].cold.2();
LABEL_21:

          goto LABEL_22;
        case 1:
          return 8;
        case 2:
LABEL_22:
          result = 6;
          break;
        case 3:
LABEL_23:
          result = 3;
          break;
        case 4:
LABEL_25:
          result = 1;
          break;
        default:
          goto LABEL_8;
      }
      break;
    default:
      AXMediaLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:].cold.1();

LABEL_8:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)_imageOrientationForInterfaceOrientation:()AXMExtras isMirrored:
{
  NSObject *v6;
  BOOL v7;
  unsigned int v8;

  switch(a3)
  {
    case 1:
      goto LABEL_8;
    case 2:
      if (a4)
        return 5;
      else
        return 8;
    case 3:
      v7 = a4 == 0;
      v8 = 1;
      goto LABEL_11;
    case 4:
      v7 = a4 == 0;
      v8 = 3;
      goto LABEL_11;
    default:
      AXMediaLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:isMirrored:].cold.1();

LABEL_8:
      v7 = a4 == 0;
      v8 = 6;
LABEL_11:
      if (v7)
        return v8;
      else
        return v8 + 1;
  }
}

- (uint64_t)rotatedImageWithInterfaceOrientation:()AXMExtras displayOrientation:appliedImageOrientation:
{
  uint64_t v7;
  uint64_t result;

  v7 = objc_msgSend(a1, "_imageOrientationForInterfaceOrientation:displayOrientation:");
  result = objc_msgSend(a1, "imageByApplyingOrientation:", v7);
  if (a5)
    *a5 = v7;
  return result;
}

- (uint64_t)rotatedImageWithInterfaceOrientation:()AXMExtras isMirrored:appliedImageOrientation:
{
  uint64_t v7;
  uint64_t result;

  v7 = objc_msgSend(a1, "_imageOrientationForInterfaceOrientation:isMirrored:");
  result = objc_msgSend(a1, "imageByApplyingOrientation:", v7);
  if (a5)
    *a5 = v7;
  return result;
}

- (id)mergeWithImage:()AXMExtras withSize:withMetrics:
{
  objc_class *v8;
  id v9;
  void *v10;
  CGImage *v11;
  void *v12;
  CGImage *v13;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGContext *v18;
  CGImageRef Image;
  void *v20;
  CGRect v22;
  CGRect v23;

  v8 = (objc_class *)MEMORY[0x1E0C9DD90];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithOptions:", 0);
  objc_msgSend(v9, "extent");
  v11 = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:", v9);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", 0);
  objc_msgSend(a1, "extent");
  v13 = (CGImage *)objc_msgSend(v12, "createCGImage:fromRect:", a1);

  BitsPerComponent = CGImageGetBitsPerComponent(v11);
  BytesPerRow = CGImageGetBytesPerRow(v11);
  ColorSpace = CGImageGetColorSpace(v11);
  BitmapInfo = CGImageGetBitmapInfo(v11);
  v18 = CGBitmapContextCreate(0, (unint64_t)a2, (unint64_t)a3, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGContextSetInterpolationQuality(v18, kCGInterpolationHigh);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = a2;
  v22.size.height = a3;
  CGContextDrawImage(v18, v22, v13);
  CGContextSetAlpha(v18, 0.5);
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = a2;
  v23.size.height = a3;
  CGContextDrawImage(v18, v23, v11);
  Image = CGBitmapContextCreateImage(v18);
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", Image);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (Image)
    CFRelease(Image);
  if (v13)
    CFRelease(v13);
  if (v11)
    CFRelease(v11);
  if (v18)
    CFRelease(v18);
  return v20;
}

- (id)addBorderWithBorderSize:()AXMExtras
{
  void *v4;
  CGImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  size_t v10;
  size_t v11;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGContext *v16;
  CGImageRef Image;
  void *v18;
  __int128 v20;
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", 0);
  objc_msgSend(a1, "extent");
  v5 = (CGImage *)objc_msgSend(v4, "createCGImage:fromRect:", a1);

  objc_msgSend(a1, "extent");
  v7 = v6;
  v9 = v8;
  v10 = (unint64_t)v6;
  v11 = (unint64_t)v8;
  BitsPerComponent = CGImageGetBitsPerComponent(v5);
  BytesPerRow = CGImageGetBytesPerRow(v5);
  ColorSpace = CGImageGetColorSpace(v5);
  BitmapInfo = CGImageGetBitmapInfo(v5);
  v16 = CGBitmapContextCreate(0, v10, v11, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  v20 = xmmword_1B0EFFF40;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v7;
  v22.size.height = v9;
  CGContextDrawImage(v16, v22, v5);
  CGContextSetStrokeColor(v16, (const CGFloat *)&v20);
  CGContextSetLineWidth(v16, a2);
  v23.origin.x = a2 * 0.5;
  v23.origin.y = a2 * 0.5;
  v23.size.width = v7 - a2;
  v23.size.height = v9 - a2;
  CGContextAddRect(v16, v23);
  CGContextDrawPath(v16, kCGPathStroke);
  Image = CGBitmapContextCreateImage(v16);
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", Image, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (Image)
    CFRelease(Image);
  if (v5)
    CFRelease(v5);
  if (v16)
    CFRelease(v16);
  return v18;
}

- (void)writeImageInAllOrientationsToDirectoryAtURL:()AXMExtras metrics:
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = 1;
  do
  {
    objc_msgSend(a1, "imageByApplyingOrientation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveToURL:withOrientation:metrics:", v9, v7, v6);

    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 9);

}

- (void)saveToURL:()AXMExtras withOrientation:metrics:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0
    || (v23 = 0,
        objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v23),
        (v13 = v23) == 0))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v14, "setDateFormat:", CFSTR("MM-dd-HH-mm-ss"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate:", v16);
    v15 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "extent");
    v19 = (int)v18;
    objc_msgSend(a1, "extent");
    objc_msgSend(v17, "stringWithFormat:", CFSTR("image_%dx%d_%ld_%@.jpg"), v19, (int)v20, a4, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AXMWriteImageToURL(a1, v22, v9);

  }
  else
  {
    v14 = v13;
    AXMediaLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v14, v15);
  }

}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "unhandled display orientation. AXMPhysicalDisplayOrientationUnknown / default", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "unknown interface orienation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Orientation unexpected: AXMPhysicalDisplayOrientationPortraitUpsideDown. If you see this assert, please file a bug with PEP Accessibility and your device type. ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras isMirrored:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_ERROR, "Unknown interface orientation. assuming portrait", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
