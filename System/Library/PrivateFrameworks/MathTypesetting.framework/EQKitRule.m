@implementation EQKitRule

- (EQKitRule)initWithHeight:(double)a3 depth:(double)a4 width:(double)a5 cgColor:(CGColor *)a6
{
  EQKitRule *v10;
  EQKitRule *v11;
  CGColor *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EQKitRule;
  v10 = -[EQKitRule init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_height = a3;
    v10->_depth = a4;
    v10->_width = a5;
    if (a6)
      v12 = (CGColor *)CFRetain(a6);
    else
      v12 = 0;
    v11->_cgColor = v12;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitRule;
  -[EQKitRule dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitRule height](self, "height");
  v6 = v5;
  -[EQKitRule depth](self, "depth");
  v8 = v7;
  -[EQKitRule width](self, "width");
  return (id)objc_msgSend(v4, "initWithHeight:depth:width:cgColor:", self->_cgColor, v6, v8, v9);
}

- (BOOL)isEqual:(id)a3
{
  EQKitRule *v4;
  EQKitRule *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = (EQKitRule *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else if (-[EQKitRule isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitRule height](self, "height");
    v7 = v6;
    -[EQKitRule height](v5, "height");
    v15 = v7 == v8
       && (-[EQKitRule depth](self, "depth"), v10 = v9, -[EQKitRule depth](v5, "depth"), v10 == v11)
       && (-[EQKitRule width](self, "width"), v13 = v12, -[EQKitRule width](v5, "width"), v13 == v14)
       && CGColorEqualToColor(-[EQKitRule color](self, "color"), -[EQKitRule color](v5, "color"));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitRule;
  return -[EQKitBox hash](&v3, sel_hash);
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  CGContext *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  y = a4.y;
  x = a4.x;
  v22 = a3;
  v7 = (CGContext *)objc_msgSend(v22, "cgContext");
  if (v7)
  {
    -[EQKitRule width](self, "width");
    v9 = v8;
    -[EQKitBox vsize](self, "vsize");
    if (v9 > 0.0)
    {
      v11 = v10;
      if (v10 > 0.0)
      {
        if (self->_cgColor)
        {
          CGContextSaveGState(v7);
          CGContextSetFillColorWithColor(v7, self->_cgColor);
          if (objc_msgSend(v22, "rendersDebugRects"))
            CGContextSetStrokeColorWithColor(v7, self->_cgColor);
        }
        -[EQKitRule height](self, "height");
        v13 = v12;
        if (v9 >= 0.0)
          v14 = v9;
        else
          v14 = -v9;
        if (v9 >= 0.0)
          v15 = -0.0;
        else
          v15 = v9;
        if (v11 >= 0.0)
          v16 = v11;
        else
          v16 = -v11;
        if (v11 >= 0.0)
          v11 = -0.0;
        v17 = objc_msgSend(v22, "rendersDebugRects");
        v18 = y - v13;
        v19 = x + v15;
        v20 = v11 + v18;
        if (v17)
        {
          CGContextSetAlpha(v7, 0.333);
          v23.origin.x = v19;
          v23.origin.y = v20;
          v23.size.width = v14;
          v23.size.height = v16;
          CGContextFillRect(v7, v23);
          CGContextSetAlpha(v7, 1.0);
          v21 = EQKitBox_ContextScale(v7);
          CGContextSetLineWidth(v7, 1.0 / v21);
          v24.origin.x = v19;
          v24.origin.y = v20;
          v24.size.width = v14;
          v24.size.height = v16;
          CGContextStrokeRect(v7, v24);
        }
        else
        {
          v25.origin.x = v19;
          v25.origin.y = v20;
          v25.size.width = v14;
          v25.size.height = v16;
          CGContextFillRect(v7, v25);
        }
        if (self->_cgColor)
          CGContextRestoreGState(v7);
      }
    }
  }

}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  int v4;

  v4 = *((_DWORD *)a3 + 6);
  if (v4 == 2)
  {
    a4.x = a4.x + self->_width;
  }
  else if (v4)
  {
    return 1;
  }
  EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, a4, self->_height);
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitRule height](self, "height");
  v6 = v5;
  -[EQKitRule depth](self, "depth");
  v8 = v7;
  -[EQKitRule width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f"), v4, self, v6, v8, v9);
}

- (double)height
{
  return self->_height;
}

- (double)depth
{
  return self->_depth;
}

- (double)width
{
  return self->_width;
}

- (CGColor)color
{
  return self->_cgColor;
}

@end
