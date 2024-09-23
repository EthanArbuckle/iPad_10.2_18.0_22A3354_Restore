@implementation CUIPSDImageLayer

- (CUIPSDImageLayer)initWithCGImageRef:(CGImage *)a3
{
  CUIPSDImageLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDImageLayer;
  v4 = -[CUIPSDLayer init](&v6, sel_init);
  if (v4)
    v4->_image = +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDImageLayer;
  -[CUIPSDLayer dealloc](&v3, sel_dealloc);
}

- (CGImage)cgImageRef
{
  return -[CUIImage image](self->_image, "image");
}

@end
