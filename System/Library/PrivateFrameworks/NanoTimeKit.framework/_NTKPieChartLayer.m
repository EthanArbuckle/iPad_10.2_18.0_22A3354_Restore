@implementation _NTKPieChartLayer

- (_NTKPieChartLayer)init
{
  _NTKPieChartLayer *v2;
  _NTKPieChartLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NTKPieChartLayer;
  v2 = -[_NTKPieChartLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_NTKPieChartLayer setProgress:](v2, "setProgress:", 0.01);
  return v3;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("progress")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____NTKPieChartLayer;
    v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (id)actionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("progress")))
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKPieChartLayer presentationLayer](self, "presentationLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFromValue:", v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_NTKPieChartLayer;
    -[_NTKPieChartLayer actionForKey:](&v9, sel_actionForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double v6;
  id v7;
  CGColor *v8;
  double MidX;
  double MidY;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[_NTKPieChartLayer progress](self, "progress");
  CLKInterpolateBetweenFloatsClipped();
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (CGColor *)objc_msgSend(v7, "CGColor");

  CGContextSetFillColorWithColor(a3, v8);
  -[_NTKPieChartLayer bounds](self, "bounds");
  MidX = CGRectGetMidX(v13);
  -[_NTKPieChartLayer bounds](self, "bounds");
  MidY = CGRectGetMidY(v14);
  if (MidX >= MidY)
    MidX = MidY;
  -[_NTKPieChartLayer bounds](self, "bounds");
  v11 = CGRectGetMidY(v15);
  CGContextMoveToPoint(a3, MidX, v11);
  CGContextAddArc(a3, MidX, v11, MidX, -1.57079633, (v6 + v6) * 3.14159265 + -1.57079633, 1);
  CGContextClosePath(a3);
  CGContextFillPath(a3);
  v12.receiver = self;
  v12.super_class = (Class)_NTKPieChartLayer;
  -[_NTKPieChartLayer drawInContext:](&v12, sel_drawInContext_, a3);
}

@end
