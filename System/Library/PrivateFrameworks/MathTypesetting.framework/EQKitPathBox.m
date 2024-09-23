@implementation EQKitPathBox

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7 drawingMode:(int)a8 lineWidth:(double)a9
{
  EQKitPathBox *v16;
  CGMutablePathRef MutableCopy;
  CGColor *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)EQKitPathBox;
  v16 = -[EQKitPathBox init](&v20, sel_init);
  if (v16)
  {
    if (a3)
      MutableCopy = CGPathCreateMutableCopy(a3);
    else
      MutableCopy = 0;
    v16->_cgPath = MutableCopy;
    v16->_height = a4;
    v16->_paddingLeft = a5;
    v16->_paddingRight = a6;
    if (a7)
      v18 = (CGColor *)CFRetain(a7);
    else
      v18 = 0;
    v16->_cgColor = v18;
    v16->_drawingMode = a8;
    v16->_lineWidth = a9;
  }
  return v16;
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7
{
  return -[EQKitPathBox initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:](self, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", a3, a7, 0, a4, a5, a6, 1.0);
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5
{
  return -[EQKitPathBox initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:](self, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", a3, a5, 0, a4, 0.0, 0.0, 1.0);
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5 drawingMode:(int)a6 lineWidth:(double)a7
{
  return -[EQKitPathBox initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:](self, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", a3, a5, *(_QWORD *)&a6, a4, 0.0, 0.0, a7);
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_cgPath);
  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitPathBox;
  -[EQKitPathBox dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  CGPath *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGColor *v12;
  uint64_t v13;
  double v14;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[EQKitPathBox cgPath](self, "cgPath");
  -[EQKitPathBox height](self, "height");
  v7 = v6;
  -[EQKitPathBox paddingLeft](self, "paddingLeft");
  v9 = v8;
  -[EQKitPathBox paddingRight](self, "paddingRight");
  v11 = v10;
  v12 = -[EQKitPathBox color](self, "color");
  v13 = -[EQKitPathBox drawingMode](self, "drawingMode");
  -[EQKitPathBox lineWidth](self, "lineWidth");
  return (id)objc_msgSend(v4, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", v5, v12, v13, v7, v9, v11, v14);
}

- (BOOL)isEqual:(id)a3
{
  EQKitPathBox *v4;
  EQKitPathBox *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  CGPath *v19;
  const CGPath *v20;
  BOOL v21;

  v4 = (EQKitPathBox *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else if (-[EQKitPathBox isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitPathBox height](self, "height");
    v7 = v6;
    -[EQKitPathBox height](v5, "height");
    if (v7 != v8)
      goto LABEL_13;
    -[EQKitPathBox paddingLeft](self, "paddingLeft");
    v10 = v9;
    -[EQKitPathBox paddingLeft](v5, "paddingLeft");
    if (v10 != v11)
      goto LABEL_13;
    -[EQKitPathBox paddingRight](self, "paddingRight");
    v13 = v12;
    -[EQKitPathBox paddingRight](v5, "paddingRight");
    if (v13 == v14
      && CGColorEqualToColor(-[EQKitPathBox color](self, "color"), -[EQKitPathBox color](v5, "color"))
      && (v15 = -[EQKitPathBox drawingMode](self, "drawingMode"), v15 == -[EQKitPathBox drawingMode](v5, "drawingMode"))
      && (-[EQKitPathBox lineWidth](self, "lineWidth"), v17 = v16,
                                                        -[EQKitPathBox lineWidth](v5, "lineWidth"),
                                                        v17 == v18))
    {
      v19 = -[EQKitPathBox cgPath](self, "cgPath");
      v20 = -[EQKitPathBox cgPath](v5, "cgPath");
      v21 = v19 == v20 || CGPathEqualToPath(v19, v20);
    }
    else
    {
LABEL_13:
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)p_ensureDimensionsAreValid
{
  if (!self->_dimensionsValid)
  {
    -[EQKitPathBox p_cacheDimensions](self, "p_cacheDimensions");
    self->_dimensionsValid = 1;
  }
}

- (double)depth
{
  -[EQKitPathBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_depth;
}

- (double)width
{
  -[EQKitPathBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_width;
}

- (CGRect)erasableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->_erasableBoundsValid)
  {
    x = self->_erasableBounds.origin.x;
    y = self->_erasableBounds.origin.y;
    width = self->_erasableBounds.size.width;
    height = self->_erasableBounds.size.height;
  }
  else
  {
    -[EQKitPathBox p_cacheErasableBounds](self, "p_cacheErasableBounds");
    self->_erasableBounds.origin.x = x;
    self->_erasableBounds.origin.y = y;
    self->_erasableBounds.size.width = width;
    self->_erasableBounds.size.height = height;
    self->_erasableBoundsValid = 1;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  CGContext *v8;
  CGColor *cgColor;
  CGFloat v10;
  objc_super v11;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (CGContext *)objc_msgSend(v7, "cgContext");
  if (v8 && self->_cgPath)
  {
    v11.receiver = self;
    v11.super_class = (Class)EQKitPathBox;
    -[EQKitBox renderIntoContext:offset:](&v11, sel_renderIntoContext_offset_, v7, x, y);
    CGContextSaveGState(v8);
    CGContextTranslateCTM(v8, x + self->_paddingLeft, y - self->_height);
    cgColor = self->_cgColor;
    if (cgColor)
    {
      CGContextSetFillColorWithColor(v8, cgColor);
      CGContextSetStrokeColorWithColor(v8, self->_cgColor);
    }
    if (objc_msgSend(v7, "rendersDebugRects"))
    {
      CGContextSetAlpha(v8, 0.333);
      CGContextAddPath(v8, self->_cgPath);
      CGContextEOFillPath(v8);
      CGContextSetAlpha(v8, 1.0);
      v10 = EQKitBox_ContextScale(v8);
      CGContextSetLineWidth(v8, 1.0 / v10);
      CGContextAddPath(v8, self->_cgPath);
      CGContextStrokePath(v8);
    }
    else
    {
      CGContextAddPath(v8, self->_cgPath);
      CGContextSetLineWidth(v8, self->_lineWidth);
      CGContextDrawPath(v8, (CGPathDrawingMode)self->_drawingMode);
    }
    CGContextRestoreGState(v8);
  }

}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  CGPath *cgPath;
  CGPoint v6;

  cgPath = self->_cgPath;
  if (cgPath)
  {
    v6.x = a4.x + self->_paddingLeft;
    v6.y = a4.y - self->_height;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v6, cgPath);
  }
  return cgPath != 0;
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
  -[EQKitPathBox height](self, "height");
  v6 = v5;
  -[EQKitPathBox depth](self, "depth");
  v8 = v7;
  -[EQKitPathBox width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f"), v4, self, v6, v8, v9);
}

- (void)p_cacheDimensions
{
  CGPath *cgPath;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect PathBoundingBox;
  CGRect v9;
  CGRect v10;

  self->_depth = 0.0;
  self->_width = 0.0;
  cgPath = self->_cgPath;
  if (cgPath)
  {
    PathBoundingBox = CGPathGetPathBoundingBox(cgPath);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      v9.origin.x = x;
      v9.origin.y = y;
      v9.size.width = width;
      v9.size.height = height;
      self->_depth = CGRectGetHeight(v9) - self->_height;
      v10.origin.x = x;
      v10.origin.y = y;
      v10.size.width = width;
      v10.size.height = height;
      self->_width = CGRectGetWidth(v10) + self->_paddingLeft + self->_paddingRight;
    }
  }
}

- (CGRect)p_cacheErasableBounds
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGPath *cgPath;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect PathBoundingBox;
  CGRect result;

  v4 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  cgPath = self->_cgPath;
  if (cgPath)
  {
    PathBoundingBox = CGPathGetPathBoundingBox(cgPath);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      v3 = y - self->_height;
      v4 = x + self->_paddingLeft;
      v5 = width;
      v6 = height;
    }
  }
  v12 = v4;
  v13 = v3;
  v14 = v5;
  v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)height
{
  return self->_height;
}

- (CGPath)cgPath
{
  return self->_cgPath;
}

- (double)paddingLeft
{
  return self->_paddingLeft;
}

- (double)paddingRight
{
  return self->_paddingRight;
}

- (CGColor)color
{
  return self->_cgColor;
}

- (int)drawingMode
{
  return self->_drawingMode;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

@end
