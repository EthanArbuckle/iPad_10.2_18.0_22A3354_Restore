@implementation CALinearMaskLayer

+ (id)defaultValueForKey:(id)a3
{
  unsigned __int8 v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("foregroundColor")))
  {
    if ((v5 & 1) == 0)
    {
      {
        +[CALinearMaskLayer defaultValueForKey:]::color = (uint64_t)black();
      }
    }
    return (id)+[CALinearMaskLayer defaultValueForKey:]::color;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CALinearMaskLayer;
    return objc_msgSendSuper2(&v7, sel_defaultValueForKey_, a3);
  }
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  return 0;
}

- (CGColor)foregroundColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE6u, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (void)setForegroundColor:(CGColor *)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE6, (const CGAffineTransform *)2, v3);
}

@end
