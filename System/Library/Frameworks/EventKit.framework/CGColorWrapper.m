@implementation CGColorWrapper

- (CGColor)color
{
  return self->_color;
}

- (CGColorWrapper)initWithCGColor:(CGColor *)a3
{
  CGColorWrapper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CGColorWrapper;
  v4 = -[CGColorWrapper init](&v6, sel_init);
  if (v4)
    v4->_color = CGColorRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)CGColorWrapper;
  -[CGColorWrapper dealloc](&v3, sel_dealloc);
}

@end
