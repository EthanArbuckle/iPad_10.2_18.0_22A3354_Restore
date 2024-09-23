@implementation EQKitBox

- (BOOL)canContainBoxes
{
  return 0;
}

- (id)containedBoxes
{
  return 0;
}

- (CGRect)boundsWithRoot:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19[2];
  CGRect v20;
  CGRect v21;
  CGRect result;

  v4 = a3;
  v5 = v4;
  memset(&v19[1], 0, sizeof(CGAffineTransform));
  if (v4)
    objc_msgSend(v4, "transformFromDescendant:", self);
  -[EQKitBox height](self, "height");
  v7 = v6;
  -[EQKitBox width](self, "width");
  v9 = v8;
  -[EQKitBox vsize](self, "vsize");
  v20.size.height = v10;
  v20.origin.y = -v7;
  v19[0] = v19[1];
  v20.origin.x = 0.0;
  v20.size.width = v9;
  v21 = CGRectApplyAffineTransform(v20, v19);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  return 7;
}

- (CGColor)color
{
  return 0;
}

- (double)height
{
  return 0.0;
}

- (double)depth
{
  return 0.0;
}

- (double)width
{
  return 0.0;
}

- (double)vsize
{
  double v3;
  double v4;
  double v5;

  -[EQKitBox height](self, "height");
  v4 = v3;
  -[EQKitBox depth](self, "depth");
  return v4 + v5;
}

- (double)layoutHeight
{
  double v2;

  -[EQKitBox height](self, "height");
  return fmax(v2, 0.0);
}

- (double)layoutDepth
{
  double v2;

  -[EQKitBox depth](self, "depth");
  return fmax(v2, 0.0);
}

- (double)layoutVSize
{
  double v3;
  double v4;
  double v5;

  -[EQKitBox layoutHeight](self, "layoutHeight");
  v4 = v3;
  -[EQKitBox layoutDepth](self, "layoutDepth");
  return v4 + v5;
}

- (CGRect)erasableBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[EQKitBox height](self, "height");
  v4 = v3;
  -[EQKitBox width](self, "width");
  v6 = v5;
  -[EQKitBox vsize](self, "vsize");
  if (v6 >= 0.0)
    v8 = v6;
  else
    v8 = -v6;
  if (v6 >= 0.0)
    v9 = 0.0;
  else
    v9 = v6 + 0.0;
  if (v7 >= 0.0)
    v10 = v7;
  else
    v10 = -v7;
  if (v7 >= 0.0)
    v7 = -0.0;
  v11 = v7 - v4;
  v12 = v9;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
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
  void *v17;
  int v18;
  double v19;
  CGColor *v20;
  int v21;
  CGColor *GenericRGB;
  CGColor *v23;
  CGFloat v24;
  id v25;
  CGRect v26;
  CGRect v27;

  y = a4.y;
  x = a4.x;
  v25 = a3;
  v7 = (CGContext *)objc_msgSend(v25, "cgContext");
  if (v7)
  {
    -[EQKitBox width](self, "width");
    v9 = v8;
    -[EQKitBox vsize](self, "vsize");
    if (v9 > 0.0)
    {
      v11 = v10;
      if (v10 > 0.0)
      {
        -[EQKitBox height](self, "height");
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
        objc_msgSend(v25, "selection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsBox:", self);
        v19 = v11 + y - v13;

        if ((v18 & 1) != 0 || objc_msgSend(v25, "rendersDebugRects"))
        {
          CGContextSaveGState(v7);
          if (v18)
          {
            v20 = (CGColor *)objc_msgSend(v25, "highlightColor");
            if (v20)
            {
              CGContextSetFillColorWithColor(v7, v20);
              v26.origin.x = x + v15;
              v26.origin.y = v19;
              v26.size.width = v14;
              v26.size.height = v16;
              CGContextFillRect(v7, v26);
            }
          }
          v21 = 1;
        }
        else
        {
          v21 = 0;
        }
        if (objc_msgSend(v25, "rendersDebugRects"))
        {
          GenericRGB = CGColorCreateGenericRGB(1.0, 0.5, 0.5, 1.0);
          v23 = CGColorCreateGenericRGB(0.5, 0.5, 1.0, 1.0);
          v24 = EQKitBox_ContextScale(v7);
          CGContextSetLineWidth(v7, 1.0 / v24);
          CGContextSetStrokeColorWithColor(v7, GenericRGB);
          CGContextBeginPath(v7);
          CGContextMoveToPoint(v7, x, y);
          CGContextAddLineToPoint(v7, x + v9, y);
          CGContextStrokePath(v7);
          CGContextSetStrokeColorWithColor(v7, v23);
          v27.origin.x = x + v15;
          v27.origin.y = v19;
          v27.size.width = v14;
          v27.size.height = v16;
          CGContextStrokeRect(v7, v27);
          CGColorRelease(v23);
          CGColorRelease(GenericRGB);
        }
        if (v21)
          CGContextRestoreGState(v7);
      }
    }
  }

}

- (CGAffineTransform)transformFromDescendant:(SEL)a3
{
  uint64_t v5;
  __int128 v6;

  v5 = MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  return (CGAffineTransform *)-[EQKitBox p_getTransform:fromDescendant:](self, "p_getTransform:fromDescendant:");
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  return a4 == self;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 1;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;

  if (a3.x < 0.0)
    return 0;
  y = a3.y;
  x = a3.x;
  -[EQKitBox width](self, "width");
  if (x > v7)
    return 0;
  -[EQKitBox depth](self, "depth");
  if (y < -v8)
    return 0;
  -[EQKitBox height](self, "height");
  return y <= v9;
}

- (id)hitTest:(CGPoint)a3
{
  EQKitBox *v4;

  if (-[EQKitBox containsPoint:](self, "containsPoint:", a3.x, a3.y))
    v4 = self;
  else
    v4 = 0;
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

@end
