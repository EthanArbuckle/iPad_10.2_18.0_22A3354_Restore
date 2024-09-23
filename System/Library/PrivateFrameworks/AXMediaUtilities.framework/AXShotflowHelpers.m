@implementation AXShotflowHelpers

+ (vImage_Buffer)createVImageBuffer:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  double v7;
  double v8;
  double v9;
  uint32_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  vImageCVImageFormat *v14;
  void *v15;
  uint32_t v16;
  void *v17;
  void *v18;
  uint32_t v19;
  uint64_t v20;
  vImage_Error v21;
  int v22;
  NSObject *v23;
  CVPixelBufferRef pixelBufferOut;
  vImage_CGImageFormat buf;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  pixelBufferOut = (CVPixelBufferRef)objc_msgSend(v3, "pixelBuffer");
  if (!pixelBufferOut)
  {
    v4 = *MEMORY[0x1E0C9AE50];
    v5 = *MEMORY[0x1E0CA8F70];
    v27[0] = *MEMORY[0x1E0CA8F78];
    v27[1] = v5;
    v28[0] = v4;
    v28[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extent");
    v8 = v7;
    objc_msgSend(v3, "extent");
    v10 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)v8, (unint64_t)v9, 0x42475241u, v6, &pixelBufferOut);
    AXLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      buf.bitsPerComponent = 67109120;
      buf.bitsPerPixel = v10;
      _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_INFO, "Pixel create: %d", (uint8_t *)&buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "render:toCVPixelBuffer:", v3, pixelBufferOut);

  }
  objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKey:", *MEMORY[0x1E0CA9038]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = vImageCVImageFormat_Create(0x42475241u, 0, 0, (CGColorSpaceRef)objc_msgSend(v3, "colorSpace"), 0);
  objc_msgSend(v13, "objectForKey:", CFSTR("BitsPerComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  objc_msgSend(v13, "objectForKey:", CFSTR("CGBitmapInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v17, "intValue");

  objc_msgSend(v13, "objectForKey:", CFSTR("BitsPerBlock"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  *(_QWORD *)&buf.renderingIntent = 0;
  buf.bitsPerComponent = v16;
  buf.bitsPerPixel = v19;
  buf.colorSpace = (CGColorSpaceRef)objc_msgSend(v3, "colorSpace");
  buf.bitmapInfo = v15;
  *(const CGFloat **)((char *)&buf.decode + 4) = 0;
  *(_QWORD *)&buf.version = 0;
  v20 = operator new();
  *(_OWORD *)v20 = 0u;
  *(_OWORD *)(v20 + 16) = 0u;
  v21 = vImageBuffer_InitWithCVPixelBuffer((vImage_Buffer *)v20, &buf, pixelBufferOut, v14, 0, 0);
  v22 = v21;
  if (v21)
  {
    AXMediaLogElementVision();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[AXShotflowHelpers createVImageBuffer:].cold.1(v22, v23);

  }
  if (v14)
    CFRelease(v14);

  return (vImage_Buffer *)v20;
}

+ (id)setCIContext
{
  return objc_alloc_init(MEMORY[0x1E0C9DD90]);
}

+ (id)setCIContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    if (+[AXShotflowHelpers setCIContext:]::ctx)
      goto LABEL_5;
    v5 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
  }
  v6 = (void *)+[AXShotflowHelpers setCIContext:]::ctx;
  +[AXShotflowHelpers setCIContext:]::ctx = (uint64_t)v5;

LABEL_5:
  v7 = (id)+[AXShotflowHelpers setCIContext:]::ctx;

  return v7;
}

+ (shared_ptr<CGImage>)getCGImageFromCIImage:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  CGImage *v8;
  __shared_weak_count *v9;
  id v10;
  shared_ptr<CGImage> result;

  v5 = v3;
  v10 = a3;
  objc_msgSend(a1, "setCIContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extent");
  v7 = objc_msgSend(v6, "createCGImage:fromRect:", v10);
  std::shared_ptr<CGImage>::shared_ptr[abi:ne180100]<CGImage,void (*)(CGImage*),void>(v5, v7, (uint64_t)MEMORY[0x1E0C9CDA0]);

  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (id)resizeImage:(id)a3 byX:(float)a4 andY:(float)a5
{
  id v7;
  void *v8;
  CGAffineTransform v10;

  v7 = a3;
  CGAffineTransformMakeScale(&v10, a4, a5);
  objc_msgSend(v7, "imageByApplyingTransform:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)resizeImage:(id)a3 to:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  double v13;
  void *v14;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "extent");
  v9 = v8;
  *(float *)&v8 = v10;
  *(float *)&v10 = height;
  v11 = width;
  *(float *)&v12 = v11 / fmaxf(v9, 1.0);
  *(float *)&v13 = *(float *)&v10 / fmaxf(*(float *)&v8, 1.0);
  objc_msgSend(a1, "resizeImage:byX:andY:", v7, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)resizeImage:(id)a3 toWidth:(unint64_t)a4 andHeight:(unint64_t)a5
{
  objc_msgSend(a1, "resizeImage:to:", a3, (double)a4, (double)a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)createVImageBuffer:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Could not creat pixel buffer: %d", (uint8_t *)v2, 8u);
}

@end
