@implementation IMImageUtilities

+ (CGSize)imageSourcePxSize:(CGImageSource *)a3
{
  void *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFNumber *Value;
  const __CFNumber *v9;
  const __CFNumber *v10;
  double v11;
  double v12;
  unsigned int v13;
  int8x16_t valuePtr;
  CGSize result;

  valuePtr = *(int8x16_t *)MEMORY[0x1E0C9D820];
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, *MEMORY[0x1E0CBD248], 0));
  if (v6)
  {
    v7 = v6;
    Value = (const __CFNumber *)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0CBD050]);
    if (Value)
      CFNumberGetValue(Value, kCFNumberCGFloatType, &valuePtr);
    v9 = (const __CFNumber *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E0CBD038]);
    if (v9)
      CFNumberGetValue(v9, kCFNumberCGFloatType, &valuePtr.u64[1]);
    v10 = (const __CFNumber *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E0CBCFE8]);
    v13 = 0;
    if (v10)
    {
      CFNumberGetValue(v10, kCFNumberIntType, &v13);
      if (v13 >= 5)
        valuePtr = vextq_s8(valuePtr, valuePtr, 8uLL);
    }
    CFRelease(v7);
  }
  v12 = *(double *)&valuePtr.i64[1];
  v11 = *(double *)valuePtr.i64;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (CGSize)imageRefPxSize:(CGImage *)a3
{
  double Width;
  double Height;
  double v6;
  CGSize result;

  Width = (double)CGImageGetWidth(a3);
  Height = (double)CGImageGetHeight(a3);
  v6 = Width;
  result.height = Height;
  result.width = v6;
  return result;
}

+ (void)sampleImageEdges:(char *)a3 usingRect:(CGRect)a4 forMostlyWhitePixels:(unint64_t *)a5 mostlyTransparentPixels:(unint64_t *)a6 otherPixels:(unint64_t *)a7 sampledPixels:(unint64_t *)a8 bytesPerRow:(int64_t)a9
{
  uint64_t x;
  uint64_t width;
  uint64_t y;
  uint64_t height;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  int64_t v19;
  uint64_t v20;
  unsigned int v21;
  char *v22;
  unsigned int v23;
  char *v24;
  uint64_t v25;
  unsigned int v26;
  char *v27;
  unsigned int v28;

  if (a3)
  {
    x = (uint64_t)a4.origin.x;
    width = (uint64_t)a4.size.width;
    y = (uint64_t)a4.origin.y;
    height = (uint64_t)a4.size.height;
    v13 = (uint64_t)a4.origin.y * a9;
    if ((uint64_t)a4.origin.y < (uint64_t)a4.size.height)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = &a3[4 * x + 1 + v13];
      v19 = 2 * a9;
      v20 = (uint64_t)a4.origin.y;
      while (1)
      {
        v21 = v18[2];
        if (v21 < 0x32)
          ++v16;
        if (v18[1] < 0xFBu || *v18 < 0xFBu)
        {
          if (v21 <= 0x31)
            goto LABEL_12;
        }
        else if (*(v18 - 1) > 0xFAu || v21 < 0x32)
        {
LABEL_12:
          ++v14;
          goto LABEL_13;
        }
        ++v15;
LABEL_13:
        v20 += 2;
        v18 += v19;
        ++v17;
        if (v20 >= height)
        {
          v22 = &a3[4 * width - 2 + v13];
          while (1)
          {
            v23 = v22[1];
            if (v23 < 0x32)
              ++v16;
            if (*v22 < 0xFBu || *(v22 - 1) < 0xFBu)
            {
              if (v23 <= 0x31)
                goto LABEL_23;
            }
            else if (*(v22 - 2) > 0xFAu || v23 < 0x32)
            {
LABEL_23:
              ++v14;
              goto LABEL_24;
            }
            ++v15;
LABEL_24:
            y += 2;
            v22 += v19;
            ++v17;
            if (y >= height)
              goto LABEL_28;
          }
        }
      }
    }
    v17 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
LABEL_28:
    if (x < width)
    {
      v24 = &a3[4 * x + 3 + v13];
      v25 = (uint64_t)a4.origin.x;
      while (1)
      {
        v26 = *v24;
        if (v26 < 0x32)
          ++v16;
        if (*(v24 - 1) < 0xFBu || *(v24 - 2) < 0xFBu)
        {
          if (v26 <= 0x31)
            goto LABEL_38;
        }
        else if (*(v24 - 3) > 0xFAu || v26 < 0x32)
        {
LABEL_38:
          ++v14;
          goto LABEL_39;
        }
        ++v15;
LABEL_39:
        v24 += 8;
        v25 += 2;
        ++v17;
        if (v25 >= width)
        {
          v27 = &a3[4 * x + 3 + (height - 1) * a9];
          while (1)
          {
            v28 = *v27;
            if (v28 < 0x32)
              ++v16;
            if (*(v27 - 1) < 0xFBu || *(v27 - 2) < 0xFBu)
            {
              if (v28 <= 0x31)
                goto LABEL_49;
            }
            else if (*(v27 - 3) > 0xFAu || v28 < 0x32)
            {
LABEL_49:
              ++v14;
              goto LABEL_50;
            }
            ++v15;
LABEL_50:
            v27 += 8;
            x += 2;
            ++v17;
            if (x >= width)
              goto LABEL_51;
          }
        }
      }
    }
  }
  else
  {
    v17 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
  }
LABEL_51:
  if (a5)
    *a5 = v14;
  if (a7)
    *a7 = v15;
  if (a6)
    *a6 = v16;
  if (a8)
    *a8 = v17;
}

+ (void)sampleImageEdges:(char *)a3 usingRect:(CGRect)a4 forMostlyWhitePixels:(unint64_t *)a5 otherPixels:(unint64_t *)a6 bytesPerRow:(int64_t)a7
{
  objc_msgSend(a1, "sampleImageEdges:usingRect:forMostlyWhitePixels:mostlyTransparentPixels:otherPixels:sampledPixels:bytesPerRow:", a3, a5, 0, a6, 0, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (BOOL)persistCPBitmapWithImage:(CGImage *)a3 url:(id)a4
{
  id v5;
  void *v6;
  const void *v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  uint8_t buf[32];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v13 = 0;
    memset(buf, 0, sizeof(buf));
    IMClientPreviewConstraints((uint64_t)buf);
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v6 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&buf[24]), CFSTR("CKAnimatedImageScale"), 0);
    objc_msgSend(a4, "path");
    v7 = (const void *)CPBitmapWriterCreateWithPath();
    if (v7)
    {
      if (CPBitmapWriterAddImage())
        v8 = CPBitmapWriterFinalize() != 0;
      else
        v8 = 0;
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v8)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "CPBitmapWriter success %@ at url %@", buf, 0x16u);
    }
  }
  return v8;
}

+ (BOOL)persistPreviewToDiskCache:(CGImage *)a3 previewURL:(id)a4 error:(id *)a5
{
  NSObject *v8;
  __CFData *v9;
  __CFData *v10;
  BOOL v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = a4;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Persisting preview to disk @ %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (!IMSupportsASTC())
  {
    v11 = +[IMImageUtilities persistCPBitmapWithImage:url:](IMImageUtilities, "persistCPBitmapWithImage:url:", a3, a4);
LABEL_8:
    if (!a5)
      return v11;
    goto LABEL_9;
  }
  v9 = IMCreateASTCImageDataFromCGImageRef(a3);
  v10 = v9;
  if (v9)
  {
    v11 = IMFreeSpaceWriteDataToURL(v9, (uint64_t)a4, 1);

    goto LABEL_8;
  }
  v11 = 0;
  if (!a5)
    return v11;
LABEL_9:
  if (!v11)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 9, 0);
  return v11;
}

+ (BOOL)isCroppingAvoidanceEnabled
{
  return -[IMFeatureFlags isCroppingAvoidanceEnabled](+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isCroppingAvoidanceEnabled");
}

+ (BOOL)imageIsSubjectLift:(CGImage *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGContext *v9;
  CGContext *v10;
  double v11;
  double v12;
  size_t BytesPerRow;
  unint64_t v15;
  unint64_t v16;
  CGRect v17;

  objc_msgSend(a1, "imageRefPxSize:");
  v6 = v5;
  v8 = v7;
  v9 = (CGContext *)objc_msgSend(a1, "_newBitmapContextWithTargetSize:");
  if (v9)
  {
    v10 = v9;
    v11 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v17.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v17.origin.y = v12;
    v17.size.width = v6;
    v17.size.height = v8;
    CGContextDrawImage(v9, v17, a3);
    v15 = 0;
    v16 = 0;
    BytesPerRow = CGBitmapContextGetBytesPerRow(v10);
    objc_msgSend(a1, "sampleImageEdges:usingRect:forMostlyWhitePixels:mostlyTransparentPixels:otherPixels:sampledPixels:bytesPerRow:", CGBitmapContextGetData(v10), 0, &v16, 0, &v15, BytesPerRow, v11, v12, v6, v8);
    CGContextRelease(v10);
    LOBYTE(v9) = v16 > v15 / 5;
  }
  return (char)v9;
}

+ (CGSize)uncroppedPreviewImageSizeFromImageSizeInPx:(CGSize)a3 maximumSizeInPx:(CGSize)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (a3.width > a4.width || a3.height > a4.height)
  {
    v5 = a4.width / a3.width;
    v6 = a4.height / a3.height;
    if (v5 >= v6)
      v5 = v6;
    a3.width = a3.width * v5;
    a3.height = a3.height * v5;
  }
  v7 = ceil(a3.width);
  v8 = ceil(a3.height);
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGImage)newUncroppedPreviewImageFromImage:(CGImage *)a3 isScreenshot:(BOOL)a4 maximumSizeInPx:(CGSize)a5 minimumSizeInPx:(CGSize)a6
{
  if (a3
    && (objc_msgSend(a1, "imageRefPxSize:"),
        (objc_msgSend(a1, "shouldCropImageOfSize:maximumSizeInPx:minimumSizeInPx:") & 1) == 0)
    && (a4 || objc_msgSend(a1, "imageIsSubjectLift:", a3)))
  {
    return (CGImage *)MEMORY[0x1E0DE7D20](a1, sel__newUncroppedPreviewImageFromImage_maximumSizeInPx_);
  }
  else
  {
    return 0;
  }
}

+ (CGImage)_newUncroppedPreviewImageFromImage:(CGImage *)a3 maximumSizeInPx:(CGSize)a4
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGImage *result;
  CGContext *v11;
  CGImage *Image;
  CGRect v13;

  objc_msgSend(a1, "imageRefPxSize:");
  objc_msgSend(a1, "uncroppedPreviewImageSizeFromImageSizeInPx:maximumSizeInPx:");
  v7 = v6;
  v9 = v8;
  result = (CGImage *)objc_msgSend(a1, "_newBitmapContextWithTargetSize:");
  if (result)
  {
    v11 = result;
    v13.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v13.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v13.size.width = v7;
    v13.size.height = v9;
    CGContextDrawImage(result, v13, a3);
    Image = CGBitmapContextCreateImage(v11);
    CGContextRelease(v11);
    return Image;
  }
  return result;
}

+ (BOOL)shouldCropImageOfSize:(CGSize)a3 maximumSizeInPx:(CGSize)a4 minimumSizeInPx:(CGSize)a5
{
  double height;
  double width;
  double v10;
  double v11;

  if (a3.width < a5.width || a3.height < a5.height)
    return 1;
  height = a5.height;
  width = a5.width;
  if (a3.width / a3.height < 0.166666667 || a3.width / a3.height > 6.0)
    return 1;
  objc_msgSend(a1, "uncroppedPreviewImageSizeFromImageSizeInPx:maximumSizeInPx:");
  return v11 < height || v10 < width;
}

+ (CGContext)_newBitmapContextWithTargetSize:(CGSize)a3
{
  double height;
  double width;
  CGContext *result;
  CGColorSpace *v6;
  CGContext *v7;

  height = a3.height;
  width = a3.width;
  result = CGColorSpaceCreateDeviceRGB();
  if (result)
  {
    v6 = result;
    v7 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 4 * (unint64_t)width, result, 0x4001u);
    CGColorSpaceRelease(v6);
    return v7;
  }
  return result;
}

+ (CGImage)newThumbnailForTargetSize:(CGSize)a3 imageSize:(CGSize)a4 imageSource:(CGImageSource *)a5 mode:(int64_t)a6 scale:(double)a7
{
  return (CGImage *)MEMORY[0x1E0DE7D20](a1, sel_newThumbnailForTargetSize_imageSize_imageSource_atIndex_mode_scale_);
}

+ (CGImage)newThumbnailForTargetSize:(CGSize)a3 imageSize:(CGSize)a4 imageSource:(CGImageSource *)a5 atIndex:(unint64_t)a6 mode:(int64_t)a7 scale:(double)a8
{
  double v8;
  double v9;
  double v10;
  double v11;

  v8 = a3.width / a4.width;
  v9 = a3.height / a4.height;
  v10 = fmin(v8, v9);
  v11 = fmax(v8, v9);
  if (a7 != 1)
    v11 = v10;
  return IMCreateThumbnailWithImageSourceAtIndexForMaxDimension(a5, a6, fmax(floor(a4.width * v11), floor(a4.height * v11)));
}

+ (double)scaleFactorForThumbnailWithSize:(CGSize)a3 constraints:(IMPreviewConstraints *)a4 targetPxSize:(CGSize)a5 shouldScaleUpPreview:(BOOL)a6 maxUpScale:(double)a7
{
  double width;
  double result;
  double v10;
  double v11;
  double height;

  width = a3.width;
  result = 1.0;
  if (a6 && !a4->var3 && (width < a5.width || a3.height < a5.height))
  {
    result = fmax(a5.width / width, a5.height / a3.height);
    if (result >= a7)
      result = a7;
  }
  v10 = a3.height * result;
  v11 = a4->var1.width;
  height = a4->var1.height;
  if (width * result < v11 || v10 < height)
    return result * ceil(fmax(v11 / (width * result), height / v10));
  return result;
}

@end
