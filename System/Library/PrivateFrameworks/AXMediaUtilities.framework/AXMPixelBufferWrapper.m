@implementation AXMPixelBufferWrapper

+ (AXMPixelBufferWrapper)wrapperWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  return (AXMPixelBufferWrapper *)-[AXMPixelBufferWrapper _initWithPixelBuffer:orientation:]([AXMPixelBufferWrapper alloc], "_initWithPixelBuffer:orientation:", a3, *(_QWORD *)&a4);
}

- (AXMPixelBufferWrapper)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("use wrapperWithPixelBuffer:"));

  return 0;
}

+ (AXMPixelBufferWrapper)new
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("use wrapperWithPixelBuffer:"));
  return 0;
}

- (id)_initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  AXMPixelBufferWrapper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXMPixelBufferWrapper;
  v6 = -[AXMPixelBufferWrapper init](&v8, sel_init);
  if (v6)
  {
    v6->_pixelBuffer = CVPixelBufferRetain(a3);
    v6->_orientation = a4;
  }
  return v6;
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    CVPixelBufferRelease(pixelBuffer);
  v4.receiver = self;
  v4.super_class = (Class)AXMPixelBufferWrapper;
  -[AXMPixelBufferWrapper dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (CGSize)unorientedSize
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
  Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (CGSize)orientedSize
{
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = -[AXMPixelBufferWrapper orientation](self, "orientation") - 5;
  -[AXMPixelBufferWrapper unorientedSize](self, "unorientedSize");
  if (v3 >= 4)
    v6 = v5;
  else
    v6 = v4;
  if (v3 < 4)
    v4 = v5;
  v7 = v6;
  result.height = v7;
  result.width = v4;
  return result;
}

@end
