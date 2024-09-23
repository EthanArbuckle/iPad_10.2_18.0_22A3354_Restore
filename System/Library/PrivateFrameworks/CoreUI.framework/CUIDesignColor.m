@implementation CUIDesignColor

- (CGColor)cgColor
{
  return self->_cgColor;
}

- (CUIDesignColor)initWithColor:(CGColor *)a3 blendMode:(int)a4 displayGamut:(int64_t)a5
{
  CUIDesignColor *v8;
  objc_super v10;

  if (!a3)
    return 0;
  v10.receiver = self;
  v10.super_class = (Class)CUIDesignColor;
  v8 = -[CUIDesignColor init](&v10, sel_init);
  if (v8)
  {
    v8->_cgColor = CGColorRetain(a3);
    v8->_blendMode = a4;
    v8->_displayGamut = a5;
  }
  return v8;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)dealloc
{
  CGColor *cgColor;
  objc_super v4;

  cgColor = self->_cgColor;
  if (cgColor)
    CGColorRelease(cgColor);
  v4.receiver = self;
  v4.super_class = (Class)CUIDesignColor;
  -[CUIDesignColor dealloc](&v4, sel_dealloc);
}

- (int64_t)displayGamut
{
  return self->_displayGamut;
}

@end
