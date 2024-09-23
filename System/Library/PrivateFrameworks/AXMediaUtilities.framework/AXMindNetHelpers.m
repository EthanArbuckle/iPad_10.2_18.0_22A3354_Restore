@implementation AXMindNetHelpers

+ (vImage_Buffer)createVImageBuffer:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  double v7;
  double v8;
  double v9;
  CVReturn v10;
  NSObject *v11;
  void *v12;
  __CVBuffer *v13;
  uint64_t v14;
  __CVBuffer *v15;
  void *v16;
  vImageCVImageFormat *v17;
  void *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  uint32_t v22;
  uint64_t v23;
  vImage_Error v24;
  int v25;
  NSObject *v26;
  vImage_CGImageFormat pixelBufferOut;
  uint8_t buf[4];
  CVReturn v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "pixelBuffer"))
  {
    *(_QWORD *)&pixelBufferOut.bitsPerComponent = 0;
    v4 = *MEMORY[0x1E0C9AE50];
    v5 = *MEMORY[0x1E0CA8F70];
    v31[0] = *MEMORY[0x1E0CA8F78];
    v31[1] = v5;
    v32[0] = v4;
    v32[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extent");
    v8 = v7;
    objc_msgSend(v3, "extent");
    v10 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)v8, (unint64_t)v9, 0x42475241u, v6, (CVPixelBufferRef *)&pixelBufferOut);
    AXLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v30 = v10;
      _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_INFO, "Pixel create: %d", buf, 8u);
    }

    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)&pixelBufferOut.bitsPerComponent, 0);
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "render:toCVPixelBuffer:", v3, *(_QWORD *)&pixelBufferOut.bitsPerComponent);

    v13 = *(__CVBuffer **)&pixelBufferOut.bitsPerComponent;
    if (*(_QWORD *)&pixelBufferOut.bitsPerComponent)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:");
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = *(__CVBuffer **)&pixelBufferOut.bitsPerComponent;
        v3 = (id)v14;
      }
      CVPixelBufferUnlockBaseAddress(v13, 0);
      v15 = *(__CVBuffer **)&pixelBufferOut.bitsPerComponent;
    }
    else
    {
      v15 = 0;
    }
    CVPixelBufferRelease(v15);

  }
  objc_msgSend(v3, "pixelBuffer");
  objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKey:", *MEMORY[0x1E0CA9038]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = vImageCVImageFormat_Create(0x42475241u, 0, 0, (CGColorSpaceRef)objc_msgSend(v3, "colorSpace"), 0);
  objc_msgSend(v16, "objectForKey:", CFSTR("BitsPerComponent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  objc_msgSend(v16, "objectForKey:", CFSTR("CGBitmapInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v20, "intValue");

  objc_msgSend(v16, "objectForKey:", CFSTR("BitsPerBlock"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "intValue");

  memset(&pixelBufferOut.colorSpace, 0, 32);
  pixelBufferOut.bitsPerComponent = v19;
  pixelBufferOut.bitsPerPixel = v22;
  pixelBufferOut.colorSpace = (CGColorSpaceRef)objc_msgSend(v3, "colorSpace");
  pixelBufferOut.bitmapInfo = v18;
  *(_OWORD *)&pixelBufferOut.version = 0uLL;
  v23 = operator new();
  *(_OWORD *)v23 = 0u;
  *(_OWORD *)(v23 + 16) = 0u;
  v24 = vImageBuffer_InitWithCVPixelBuffer((vImage_Buffer *)v23, &pixelBufferOut, (CVPixelBufferRef)objc_msgSend(v3, "pixelBuffer"), v17, 0, 0);
  v25 = v24;
  if (v24)
  {
    AXMediaLogElementVision();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[AXShotflowHelpers createVImageBuffer:].cold.1(v25, v26);

  }
  if (v17)
    CFRelease(v17);

  return (vImage_Buffer *)v23;
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
    if (+[AXMindNetHelpers setCIContext:]::ctx)
      goto LABEL_5;
    v5 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
  }
  v6 = (void *)+[AXMindNetHelpers setCIContext:]::ctx;
  +[AXMindNetHelpers setCIContext:]::ctx = (uint64_t)v5;

LABEL_5:
  v7 = (id)+[AXMindNetHelpers setCIContext:]::ctx;

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

@end
