@implementation CAScrollLayer

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 == 480)
    return CFSTR("both");
  if (v5 == 369)
    return (id)*MEMORY[0x1E0C9AE50];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CAScrollLayer;
  return objc_msgSendSuper2(&v7, sel_defaultValueForKey_, a3);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAScrollLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)scrollToPoint:(CGPoint)p
{
  double y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;

  y = p.y;
  x = p.x;
  -[CALayer bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = CAInternAtom((const __CFString *)-[CAScrollLayer scrollMode](self, "scrollMode"), 0);
  if (v14 == 257 || v14 == 68)
    v7 = x;
  if ((v14 | 0x200) == 0x244)
    v15 = y;
  else
    v15 = v9;
  -[CALayer setBounds:](self, "setBounds:", v7, v15, v11, v13);
}

- (void)scrollToRect:(CGRect)r
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;

  height = r.size.height;
  width = r.size.width;
  y = r.origin.y;
  x = r.origin.x;
  -[CALayer bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = CAInternAtom((const __CFString *)-[CAScrollLayer scrollMode](self, "scrollMode"), 0);
  v19.origin.x = v9;
  v19.origin.y = v11;
  v19.size.width = v13;
  v19.size.height = v15;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (!CGRectContainsRect(v19, v20))
  {
    if (v16 == 257 || v16 == 68)
    {
      if (v9 + v13 >= x + width)
        v17 = v9;
      else
        v17 = x + width - v13;
      if (v17 <= x)
        v9 = v17;
      else
        v9 = x;
    }
    if (v16 != 580)
    {
      if (v16 == 257)
      {
LABEL_19:
        -[CALayer setBounds:](self, "setBounds:", v9, v11, v13, v15);
        return;
      }
      if (v16 != 68)
        return;
    }
    if (v11 + v15 >= y + height)
      v18 = v11;
    else
      v18 = y + height - v15;
    if (v18 <= y)
      v11 = v18;
    else
      v11 = y;
    goto LABEL_19;
  }
}

- (void)_scrollPoint:(CGPoint)a3 fromLayer:(id)a4
{
  -[CALayer convertPoint:fromLayer:](self, "convertPoint:fromLayer:", a4, a3.x, a3.y);
  -[CAScrollLayer scrollToPoint:](self, "scrollToPoint:");
}

- (void)_scrollRect:(CGRect)a3 fromLayer:(id)a4
{
  -[CALayer convertRect:fromLayer:](self, "convertRect:fromLayer:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CAScrollLayer scrollToRect:](self, "scrollToRect:");
}

- (CGRect)_visibleRectOfLayer:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;
  CGRect v15;

  -[CALayer bounds](self, "bounds");
  -[CALayer convertRect:toLayer:](self, "convertRect:toLayer:", a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a3, "bounds");
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  return CGRectIntersection(v13, v15);
}

- (CAScrollLayerScrollMode)scrollMode
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1E0u, (const CGAffineTransform *)3, v3);
  return (CAScrollLayerScrollMode)v3[0];
}

- (void)setScrollMode:(CAScrollLayerScrollMode)scrollMode
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = scrollMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1E0, (const CGAffineTransform *)3, v3);
}

@end
