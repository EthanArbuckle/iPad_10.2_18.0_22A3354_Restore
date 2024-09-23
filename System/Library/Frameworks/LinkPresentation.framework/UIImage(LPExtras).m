@implementation UIImage(LPExtras)

- (uint64_t)_lp_CGImage
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

+ (id)_lp_createImageWithCGImage:()LPExtras
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", a3);
}

+ (id)_lp_systemImageNamed:()LPExtras
{
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lp_imageByApplyingSymbolConfiguration:()LPExtras
{
  objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_lp_hasTransparency
{
  void *v1;
  uint64_t v2;
  CGImage *v3;
  double v4;
  double v5;
  _BOOL8 v6;
  void *data;
  CGColorSpace *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  vImageConverter *v14;
  uint32_t bitsPerPixel;
  vImagePixelCount width;
  vImage_Buffer v17;
  vImage_CGImageFormat f2;
  vImage_Buffer buf;
  vImage_CGImageFormat format;
  vImagePixelCount *histogram[4];
  _BYTE v22[2048];
  _BYTE v23[2048];
  _BYTE v24[2048];
  _QWORD v25[257];

  v1 = (void *)MEMORY[0x1E0C80A78](a1);
  v25[256] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(v1, "_lp_CGImage");
  if (!v2)
    return 0;
  v3 = (CGImage *)v2;
  if (!CGImageHasAlpha())
    return 0;
  objc_msgSend(v1, "_lp_pixelSize");
  if (!sizeFitsWithinSize(v4, v5, 1024.0, 1024.0))
    return 0;
  *((_DWORD *)&format.renderingIntent + 1) = 0;
  format.bitsPerComponent = CGImageGetBitsPerComponent(v3);
  format.bitsPerPixel = CGImageGetBitsPerPixel(v3);
  format.colorSpace = CGImageGetColorSpace(v3);
  format.bitmapInfo = CGImageGetBitmapInfo(v3);
  format.version = 0;
  format.decode = CGImageGetDecode(v3);
  format.renderingIntent = CGImageGetRenderingIntent(v3);
  if (vImageBuffer_InitWithCGImage(&buf, &format, 0, v3, 0))
    return 0;
  data = buf.data;
  v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  *(_QWORD *)&f2.bitsPerComponent = 0x2000000008;
  f2.colorSpace = v9;
  f2.bitmapInfo = 3;
  memset(&f2.version, 0, 20);
  v17 = buf;
  if (vImageCGImageFormat_IsEqual(&format, &f2))
  {
    v10 = 0;
    goto LABEL_9;
  }
  v14 = vImageConverter_CreateWithCGImageFormat(&format, &f2, 0, 0, 0);
  v6 = (_BOOL8)v14;
  if (v14)
  {
    bitsPerPixel = f2.bitsPerPixel;
    width = buf.width;
    if (buf.rowBytes == buf.width * f2.bitsPerPixel)
    {
      if (!vImageConverter_MustOperateOutOfPlace(v14, 0, 0, 0))
      {
        v10 = 0;
        goto LABEL_23;
      }
      width = buf.width;
      bitsPerPixel = f2.bitsPerPixel;
    }
    if (vImageBuffer_Init(&v17, buf.height, width, bitsPerPixel, 0))
    {
      v10 = 0;
      goto LABEL_24;
    }
    v10 = v17.data;
LABEL_23:
    if (!vImageConvert_AnyToAny((const vImageConverterRef)v6, &buf, &v17, 0, 0))
    {
      vImageConverter_Release((vImageConverterRef)v6);
LABEL_9:
      bzero(v25, 0x800uLL);
      bzero(v24, 0x800uLL);
      bzero(v23, 0x800uLL);
      bzero(v22, 0x800uLL);
      histogram[0] = v25;
      histogram[1] = (vImagePixelCount *)v24;
      histogram[2] = (vImagePixelCount *)v23;
      histogram[3] = (vImagePixelCount *)v22;
      if (!vImageHistogramCalculation_ARGB8888(&v17, histogram, 0))
      {
        v11 = 0;
        do
        {
          v12 = *(_QWORD *)&v22[v11];
          v6 = v12 != 0;
          if (v12)
            break;
          v13 = v11 == 2032;
          v11 += 8;
        }
        while (!v13);
LABEL_26:
        if (v10)
          free(v10);
        goto LABEL_28;
      }
LABEL_25:
      v6 = 0;
      goto LABEL_26;
    }
LABEL_24:
    vImageConverter_Release((vImageConverterRef)v6);
    goto LABEL_25;
  }
LABEL_28:
  if (data)
    free(data);
  return v6;
}

- (BOOL)_lp_isTemplate
{
  return objc_msgSend(a1, "renderingMode") == 2;
}

- (id)_lp_imageForcingUserInterfaceStyle:()LPExtras
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a1, "imageAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "imageAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
      v7 = 2;
    else
      v7 = 1;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTraitCollection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "_lp_CGImage");
    objc_msgSend(MEMORY[0x1E0DC3870], "_lp_createImageWithCGImage:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = a1;
  }
  return v11;
}

@end
