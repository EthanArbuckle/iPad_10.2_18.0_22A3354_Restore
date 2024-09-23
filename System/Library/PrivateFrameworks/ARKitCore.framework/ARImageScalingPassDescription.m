@implementation ARImageScalingPassDescription

- (ARImageScalingPassDescription)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  ARImageScalingPassDescription *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)ARImageScalingPassDescription;
  result = -[ARImageScalingPassDescription init](&v6, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_pixelBufferFormat = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ARImageScalingPassDescription size](self, "size");
  v6 = v5;
  -[ARImageScalingPassDescription size](self, "size");
  v8 = v7;
  AROSTypeToString(-[ARImageScalingPassDescription pixelBufferFormat](self, "pixelBufferFormat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p size=[%.1fx%.1f] format=%@"), v4, self, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (unsigned)pixelBufferFormat
{
  return self->_pixelBufferFormat;
}

- (void)setPixelBufferFormat:(unsigned int)a3
{
  self->_pixelBufferFormat = a3;
}

@end
