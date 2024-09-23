@implementation CUIColor

+ (id)colorWithCGColor:(CGColor *)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a3);
}

- (CUIColor)initWithCGColor:(CGColor *)a3
{
  CUIColor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIColor;
  v4 = -[CUIColor init](&v6, sel_init);
  if (v4)
    v4->_cgColor = CGColorRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)CUIColor;
  -[CUIColor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  CFStringRef v3;
  uint64_t v4;
  CFStringRef v5;
  objc_class *v6;
  NSString *v7;
  objc_super v9;

  v3 = CFCopyDescription(self->_cgColor);
  if (v3)
  {
    v5 = v3;
    v6 = (objc_class *)objc_opt_class(self, v4);
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), NSStringFromClass(v6), v5);
    CFRelease(v5);
    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CUIColor;
    return -[CUIColor description](&v9, sel_description);
  }
}

- (id)colorUsingCGColorSpace:(CGColorSpace *)a3
{
  uint64_t v4;
  CUIColor *v5;
  CGColor *v6;

  v4 = MEMORY[0x1A1AEDE3C](a3, 0);
  v5 = (CUIColor *)v4;
  if (v4)
  {
    v6 = (CGColor *)CGColorTransformConvertColor(v4, self->_cgColor, 0);
    CGColorTransformRelease(v5);
    if (v6)
      v5 = +[CUIColor colorWithCGColor:](CUIColor, "colorWithCGColor:", v6);
    else
      v5 = 0;
  }
  else
  {
    v6 = 0;
  }
  CGColorRelease(v6);
  return v5;
}

- (CGColor)CGColor
{
  return self->_cgColor;
}

@end
