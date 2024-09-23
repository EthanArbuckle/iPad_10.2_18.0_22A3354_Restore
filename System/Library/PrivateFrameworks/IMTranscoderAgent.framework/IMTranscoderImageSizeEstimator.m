@implementation IMTranscoderImageSizeEstimator

+ (id)newEstimatorWithURL:(id)a3 uti:(id)a4 imageSource:(CGImageSource *)a5
{
  IMTranscoderImageCMPhotoSizeEstimator *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  IMTranscoderImageSizeEstimator *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!UTTypeConformsTo((CFStringRef)a4, (CFStringRef)*MEMORY[0x24BDC17C0])
    && !UTTypeConformsTo((CFStringRef)a4, CFSTR("public.heif-standard"))
    || (v8 = [IMTranscoderImageCMPhotoSizeEstimator alloc],
        (result = (id)objc_msgSend_initWithURL_uti_imageSource_(v8, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v10, v11)) == 0))
  {
    v13 = [IMTranscoderImageSizeEstimator alloc];
    return (id)MEMORY[0x24BEDD108](v13, sel_initWithUTI_imageSource_, a4, a5, v14, v15, v16);
  }
  return result;
}

- (IMTranscoderImageSizeEstimator)initWithUTI:(id)a3 imageSource:(CGImageSource *)a4
{
  IMTranscoderImageSizeEstimator *v6;
  CGImage *ImageAtIndex;
  CGImage *v8;
  size_t BitsPerPixel;
  CGFloat Width;
  size_t Height;
  CFDictionaryRef v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFDictionaryRef v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)IMTranscoderImageSizeEstimator;
  v6 = -[IMTranscoderImageSizeEstimator init](&v36, sel_init);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a4, 0, 0);
  if (ImageAtIndex)
  {
    v8 = ImageAtIndex;
    BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
    Width = (double)CGImageGetWidth(v8);
    Height = CGImageGetHeight(v8);
    v6->_originalSize.width = Width;
    v6->_originalSize.height = (double)Height;
    CFRelease(v8);
    if (v6->_originalSize.width != *MEMORY[0x24BDBF148]
      || v6->_originalSize.height != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v13 = CGImageSourceCopyProperties(a4, 0);
      v19 = v13;
      if (v13)
      {
        v20 = (void *)objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x24BDD9588], v15, v16, v17, v18);
        objc_msgSend_doubleValue(v20, v21, v22, v23, v24, v25, v26);
        if (v32 != 0.0)
        {
          v33 = v32 / (v6->_originalSize.width * v6->_originalSize.height);
          if (BitsPerPixel > 0x27)
            v33 = v33 * 0.5;
          objc_msgSend__normalizedInputFactorForUTI_bytesPerPixel_(v6, v27, (uint64_t)a3, v28, v29, v30, v31, v33);
          v6->_normalizedInputFactor = v34;
        }
      }

    }
  }
  return v6;
}

- (IMTranscoderImageSizeEstimator)initWithUTI:(id)a3 originalSize:(CGSize)a4 fileSize:(unint64_t)a5
{
  double height;
  double width;
  IMTranscoderImageSizeEstimator *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v17.receiver = self;
  v17.super_class = (Class)IMTranscoderImageSizeEstimator;
  v9 = -[IMTranscoderImageSizeEstimator init](&v17, sel_init);
  v9->_originalSize.width = width;
  v9->_originalSize.height = height;
  objc_msgSend__normalizedInputFactorForUTI_bytesPerPixel_(v9, v10, (uint64_t)a3, v11, v12, v13, v14, (double)a5 / (width * height));
  v9->_normalizedInputFactor = v15;
  return v9;
}

- (CGSize)_newSizeForMaximumDimension:(int64_t)a3 originalSize:(CGSize)result
{
  double width;
  double v5;

  if (result.width >= result.height)
    width = result.width;
  else
    width = result.height;
  if (width > (double)a3)
  {
    v5 = (double)a3 / width;
    result.width = (double)(int)(result.width * v5);
    result.height = (double)(int)(result.height * v5);
  }
  return result;
}

- (double)_nominalBytesPerPixelForUTI:(id)a3
{
  double result;
  int v5;

  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC17C0]))
    return 0.35;
  if (UTTypeConformsTo((CFStringRef)a3, CFSTR("public.heif-standard")))
    return 0.18;
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC1820]))
    return 1.8;
  v5 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC1780]);
  result = 0.7;
  if (!v5)
    return 0.0;
  return result;
}

- (double)_normalizedInputFactorForUTI:(id)a3 bytesPerPixel:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v9;
  double v10;
  double result;

  objc_msgSend__nominalBytesPerPixelForUTI_(self, a2, (uint64_t)a3, v4, v5, v6, v7);
  v10 = a4 / v9;
  if (v9 == 0.0)
    v10 = 1.0;
  result = 2.0;
  if (v10 <= 2.0)
  {
    result = v10;
    if (v10 < 0.15)
      return 0.15;
  }
  return result;
}

- (double)_estimatedBytesPerPixelForJPEGQuality:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v8;

  objc_msgSend__nominalBytesPerPixelForUTI_(self, a2, *MEMORY[0x24BDC17C0], v3, v4, v5, v6);
  return a3 / 0.9 * v8;
}

- (unint64_t)estimatedSizeForOutputUTI:(id)a3 maximumDimension:(int64_t)a4 quality:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;

  if (self->_originalSize.width == *MEMORY[0x24BDBF148]
    && self->_originalSize.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    return 0;
  }
  objc_msgSend__newSizeForMaximumDimension_originalSize_(self, a2, a4, a4, v5, v6, v7);
  v14 = v12 * v13;
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC17C0]))
  {
    objc_msgSend__estimatedBytesPerPixelForJPEGQuality_(self, v15, v16, v17, v18, v19, v20, a5);
  }
  else if (UTTypeConformsTo((CFStringRef)a3, CFSTR("public.heif-standard")))
  {
    objc_msgSend__estimatedBytesPerPixelForJPEGQuality_(self, v23, v24, v25, v26, v27, v28, a5);
    v21 = v29 * 0.6;
  }
  else
  {
    objc_msgSend__nominalBytesPerPixelForUTI_(self, v23, (uint64_t)a3, v25, v26, v27, v28);
  }
  return (unint64_t)(v14 * (v21 * self->_normalizedInputFactor) * 0.85);
}

@end
