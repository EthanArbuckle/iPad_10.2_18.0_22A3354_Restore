@implementation IMPreviewGenerator

+ (id)UTITypes
{
  return 0;
}

+ (id)metadataExtension
{
  NSObject *v2;
  id v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = (id)objc_opt_class();
      v3 = v6;
      _os_log_impl(&dword_19E239000, v2, OS_LOG_TYPE_INFO, "%@ Tried to get metadata extension for an unsupported object", (uint8_t *)&v5, 0xCu);

    }
  }
  return 0;
}

+ (BOOL)generatesPreview
{
  return 1;
}

+ (BOOL)writesToDisk
{
  return 0;
}

+ (BOOL)generatesMetadata
{
  return 0;
}

+ (BOOL)shouldScaleUpPreview
{
  return 1;
}

+ (BOOL)shouldShadePreview
{
  return 1;
}

+ (double)maxUpScale
{
  return 2.0;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = (id)objc_opt_class();
      v11 = v14;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "%@ Tried to generate preview for an unsupported object", (uint8_t *)&v13, 0xCu);

    }
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 2, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = (id)objc_opt_class();
      v15 = v18;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "%@ Tried to generate preview for an unsupported object", (uint8_t *)&v17, 0xCu);

    }
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 2, 0);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = (id)objc_opt_class();
      v11 = v14;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "%@ Tried to generate metadata for an unsupported object", (uint8_t *)&v13, 0xCu);

    }
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 2, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

+ (CGImage)newCroppedAndRescaledImageFromImage:(CGImage *)a3 constraints:(IMPreviewConstraints *)a4 targetPxSize:(CGSize)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  __int128 v15;
  double v16;
  double v17;
  size_t v18;
  size_t v19;
  void *v20;
  CGColorSpace *DeviceRGB;
  CGContext *v22;
  NSObject *v23;
  CGColor *v24;
  NSObject *v25;
  CGImage *Image;
  NSObject *v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE buf[32];
  uint64_t v32;
  uint64_t v33;
  CGRect v34;
  CGRect v35;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  height = a5.height;
  width = a5.width;
  +[IMImageUtilities imageRefPxSize:](IMImageUtilities, "imageRefPxSize:");
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend((id)objc_opt_class(), "shouldScaleUpPreview");
  objc_msgSend((id)objc_opt_class(), "maxUpScale");
  v15 = *(_OWORD *)&a4->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  *(_OWORD *)&buf[16] = v15;
  v32 = *(_QWORD *)&a4->var3;
  +[IMImageUtilities scaleFactorForThumbnailWithSize:constraints:targetPxSize:shouldScaleUpPreview:maxUpScale:](IMImageUtilities, "scaleFactorForThumbnailWithSize:constraints:targetPxSize:shouldScaleUpPreview:maxUpScale:", buf, v14, v11, v13, width, height, v16);
  v18 = (unint64_t)fmin(v11 * v17, width);
  v19 = (unint64_t)fmin(v13 * v17, height);
  v20 = malloc_type_calloc(1uLL, 4 * v18 * v19, 0xEB22610AuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = CGBitmapContextCreate(v20, v18, v19, 8uLL, 4 * v18, DeviceRGB, 0x4001u);
  if (v22)
  {
    objc_msgSend(a1, "_scaledTargetRectForSize:andThumbnailSize:", (double)v18, (double)v19, v11, v13);
    CGContextDrawImage(v22, v34, a3);
    if (objc_msgSend(a1, "shouldShadePreview"))
    {
      v29 = 0;
      v30 = 0;
      +[IMImageUtilities sampleImageEdges:usingRect:forMostlyWhitePixels:otherPixels:bytesPerRow:](IMImageUtilities, "sampleImageEdges:usingRect:forMostlyWhitePixels:otherPixels:bytesPerRow:", v20, &v30, &v29, 4 * v18, 0.0, 0.0, (double)v18, (double)v19);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v29;
          _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Sampled edges: white %tu other: %tu", buf, 0x16u);
        }

      }
      if ((double)(v29 + v30) / 5.0 < (double)v30)
      {
        CGContextSetBlendMode(v22, kCGBlendModeSourceAtop);
        *(_OWORD *)buf = xmmword_19E3814C0;
        *(_OWORD *)&buf[16] = unk_19E3814D0;
        v24 = CGColorCreate(DeviceRGB, (const CGFloat *)buf);
        CGContextSetFillColorWithColor(v22, v24);
        v35.origin.x = 0.0;
        v35.origin.y = 0.0;
        v35.size.width = (double)v18;
        v35.size.height = (double)v19;
        CGContextFillRect(v22, v35);
        if (v24)
          CFRelease(v24);
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Crop image if necessary", buf, 2u);
      }

    }
    Image = CGBitmapContextCreateImage(v22);
    if (!v20)
      goto LABEL_17;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[IMPreviewGenerator newCroppedAndRescaledImageFromImage:constraints:targetPxSize:]";
        _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - %s Failed to generate image context", buf, 0xCu);
      }

    }
    Image = 0;
    if (!v20)
      goto LABEL_17;
  }
  free(v20);
LABEL_17:
  if (v22)
    CFRelease(v22);
  if (DeviceRGB)
    CFRelease(DeviceRGB);
  return Image;
}

+ (CGSize)thumbnailFillSizeForWidth:(double)a3 imageSize:(CGSize)a4 scale:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v5 = fmax(a4.width / a4.height, 0.75);
  if (v5 > 1.77777778)
    v5 = 1.77777778;
  v6 = a3 / v5;
  v7 = ceil(a3);
  v8 = ceil(v6);
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGRect)_scaledTargetRectForSize:(CGSize)a3 andThumbnailSize:(CGSize)a4
{
  double width;
  BOOL v5;
  double v6;
  double height;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGRect result;

  width = a3.width;
  v5 = a3.width / a4.width <= a3.height / a4.height;
  v6 = a4.width / a4.height;
  if (v5)
  {
    v10 = a3.height * v6;
    v9 = (a3.height * v6 - width) * -0.5;
    v8 = 0.0;
    height = a3.height;
    width = v10;
  }
  else
  {
    height = width / v6;
    v8 = (width / v6 - a3.height) * -0.5;
    v9 = 0.0;
  }
  v11 = v8;
  v12 = width;
  result.size.height = height;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

@end
