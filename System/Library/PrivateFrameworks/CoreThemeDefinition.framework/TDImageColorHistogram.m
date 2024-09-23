@implementation TDImageColorHistogram

- (TDImageColorHistogram)initWithCGImage:(CGImage *)a3
{
  TDImageColorHistogram *v4;
  TDImageColorHistogram *v5;
  vImage_Buffer *p_imageBuffer;
  size_t Height;
  size_t Width;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TDImageColorHistogram;
  v4 = -[TDImageColorHistogram init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    p_imageBuffer = &v4->_imageBuffer;
    Height = CGImageGetHeight(a3);
    Width = CGImageGetWidth(a3);
    p_imageBuffer->data = 0;
    v5->_imageBuffer.height = Height;
    v5->_imageBuffer.width = Width;
    v5->_imageBuffer.rowBytes = 0;
    v9 = CUIGetRGBAImageBuffer();
    if (v9)
    {
      NSLog(CFSTR("Failed to initialize image buffer for color histogram computation [err: %ld]"), v9);
    }
    else
    {
      v10 = CUIComputeImageColorHistogramARGB();
      if (!v10)
      {
        v5->_isMonochrome = CUIColorHistogramARGBIsMonochrome();
        CUIDeallocateRGBAImageBuffer();
        return v5;
      }
      NSLog(CFSTR("Failed to compute color histogram for input image [err: %ld]"), v10);
      CUIDeallocateRGBAImageBuffer();
    }
    return 0;
  }
  return v5;
}

- (BOOL)isMonochrome
{
  return self->_isMonochrome;
}

- (double)intersection:(id)a3
{
  double result;

  CUIColorHistogramARGBIntersection();
  return result;
}

@end
