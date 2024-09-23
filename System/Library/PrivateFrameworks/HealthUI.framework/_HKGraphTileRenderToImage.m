@implementation _HKGraphTileRenderToImage

- (_HKGraphTileRenderToImage)initWithSize:(CGSize)a3 scale:(double)a4 invertedYAxis:(BOOL)a5
{
  double height;
  double width;
  _HKGraphTileRenderToImage *v9;
  _HKGraphTileRenderToImage *v10;
  unint64_t v11;
  CGColorSpaceRef v12;
  size_t v13;
  void *v14;
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)_HKGraphTileRenderToImage;
  v9 = -[_HKGraphTileRenderToImage init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_scale = a4;
    v9->_sizeInPoints.width = width;
    v9->_sizeInPoints.height = height;
    v9->_invertedYAxis = a5;
    v11 = vcvtpd_u64_f64(width * a4);
    v9->_widthInPixels = v11;
    v9->_heightInPixels = vcvtpd_u64_f64(height * (double)(unint64_t)ceil(a4));
    v9->_bytesPerRow = 4 * v11;
    v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    v10->_bitmapInfo = 2;
    v13 = 4 * v10->_widthInPixels * v10->_heightInPixels;
    v10->_colorSpace = v12;
    v10->_bufferSize = v13;
    v14 = malloc_type_malloc(v13, 0xAB70C2uLL);
    v10->_rawBufferBytes = v14;
    v10->_drawingContext = CGBitmapContextCreate(v14, v10->_widthInPixels, v10->_heightInPixels, 8uLL, v10->_bytesPerRow, v10->_colorSpace, v10->_bitmapInfo);
    v10->_lastRenderedImage = 0;
  }
  return v10;
}

- (void)dealloc
{
  CGImage *lastRenderedImage;
  objc_super v4;

  lastRenderedImage = self->_lastRenderedImage;
  if (lastRenderedImage)
  {
    CGImageRelease(lastRenderedImage);
    self->_lastRenderedImage = 0;
  }
  CGContextRelease(self->_drawingContext);
  self->_drawingContext = 0;
  free(self->_rawBufferBytes);
  self->_rawBufferBytes = 0;
  CGColorSpaceRelease(self->_colorSpace);
  v4.receiver = self;
  v4.super_class = (Class)_HKGraphTileRenderToImage;
  -[_HKGraphTileRenderToImage dealloc](&v4, sel_dealloc);
}

- (CGImage)drawToImage:(id)a3
{
  void (**v4)(id, CGContext *);
  CGContext *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGContext *v9;
  CGDataProvider *v10;
  CGImage *v11;
  CGImage *lastRenderedImage;

  v4 = (void (**)(id, CGContext *))a3;
  UIGraphicsPushContext(-[_HKGraphTileRenderToImage drawingContext](self, "drawingContext"));
  CGContextSaveGState(-[_HKGraphTileRenderToImage drawingContext](self, "drawingContext"));
  if (self->_invertedYAxis)
  {
    CGContextTranslateCTM(-[_HKGraphTileRenderToImage drawingContext](self, "drawingContext"), 0.0, (double)-[_HKGraphTileRenderToImage heightInPixels](self, "heightInPixels"));
    CGContextScaleCTM(-[_HKGraphTileRenderToImage drawingContext](self, "drawingContext"), 1.0, -1.0);
  }
  v5 = -[_HKGraphTileRenderToImage drawingContext](self, "drawingContext");
  -[_HKGraphTileRenderToImage scale](self, "scale");
  v7 = v6;
  -[_HKGraphTileRenderToImage scale](self, "scale");
  CGContextScaleCTM(v5, v7, v8);
  v9 = -[_HKGraphTileRenderToImage drawingContext](self, "drawingContext");
  -[_HKGraphTileRenderToImage sizeInPoints](self, "sizeInPoints");
  v4[2](v4, v9);

  CGContextRestoreGState(-[_HKGraphTileRenderToImage drawingContext](self, "drawingContext"));
  UIGraphicsPopContext();
  v10 = CGDataProviderCreateWithData(0, self->_rawBufferBytes, self->_bufferSize, 0);
  v11 = CGImageCreate(self->_widthInPixels, self->_heightInPixels, 8uLL, 0x20uLL, self->_bytesPerRow, self->_colorSpace, self->_bitmapInfo, v10, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v10);
  lastRenderedImage = self->_lastRenderedImage;
  if (lastRenderedImage)
    CGImageRelease(lastRenderedImage);
  self->_lastRenderedImage = v11;
  return v11;
}

- (CGSize)sizeInPoints
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeInPoints.width;
  height = self->_sizeInPoints.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)invertedYAxis
{
  return self->_invertedYAxis;
}

- (unint64_t)widthInPixels
{
  return self->_widthInPixels;
}

- (unint64_t)heightInPixels
{
  return self->_heightInPixels;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)rawBufferBytes
{
  return self->_rawBufferBytes;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (CGContext)drawingContext
{
  return self->_drawingContext;
}

- (CGImage)lastRenderedImage
{
  return self->_lastRenderedImage;
}

@end
