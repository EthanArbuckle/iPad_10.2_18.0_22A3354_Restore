@implementation CUIImage

+ (id)imageWithCGImage:(CGImage *)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCGImage:", a3);
}

- (CUIImage)initWithCGImage:(CGImage *)a3
{
  CUIImage *v4;
  CUIImage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIImage;
  v4 = -[CUIImage init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    v4->_cgImage = (CGImage *)CFRetain(a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_cgImage);
  v3.receiver = self;
  v3.super_class = (Class)CUIImage;
  -[CUIImage dealloc](&v3, sel_dealloc);
}

- (CGImage)image
{
  return self->_cgImage;
}

- (CGSize)size
{
  CGImage *cgImage;
  double Width;
  double Height;
  double v6;
  CGSize result;

  cgImage = self->_cgImage;
  if (cgImage)
  {
    Width = (double)CGImageGetWidth(cgImage);
    Height = (double)CGImageGetHeight(self->_cgImage);
  }
  else
  {
    Width = CGSizeZero.width;
    Height = CGSizeZero.height;
  }
  v6 = Width;
  result.height = Height;
  result.width = v6;
  return result;
}

@end
