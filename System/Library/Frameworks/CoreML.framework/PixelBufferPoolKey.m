@implementation PixelBufferPoolKey

- (PixelBufferPoolKey)initWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4
{
  CGFloat height;
  CGFloat width;
  PixelBufferPoolKey *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)PixelBufferPoolKey;
  result = -[PixelBufferPoolKey init](&v8, sel_init);
  if (result)
  {
    result->_frameSize.width = width;
    result->_frameSize.height = height;
    result->_pixelFormatType = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PixelBufferPoolKey *v4;
  PixelBufferPoolKey *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  unsigned int v12;
  BOOL v13;
  NSSize v15;
  NSSize v16;

  v4 = (PixelBufferPoolKey *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PixelBufferPoolKey frameSize](self, "frameSize");
      v7 = v6;
      v9 = v8;
      -[PixelBufferPoolKey frameSize](v5, "frameSize");
      v16.width = v10;
      v16.height = v11;
      v15.width = v7;
      v15.height = v9;
      if (NSEqualSizes(v15, v16))
      {
        v12 = -[PixelBufferPoolKey pixelFormatType](self, "pixelFormatType");
        v13 = v12 == -[PixelBufferPoolKey pixelFormatType](v5, "pixelFormatType");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  double v3;
  double v4;

  -[PixelBufferPoolKey frameSize](self, "frameSize");
  return (unint64_t)v3 ^ (unint64_t)v4 ^ -[PixelBufferPoolKey pixelFormatType](self, "pixelFormatType");
}

- (CGSize)frameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_frameSize.width;
  height = self->_frameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

@end
