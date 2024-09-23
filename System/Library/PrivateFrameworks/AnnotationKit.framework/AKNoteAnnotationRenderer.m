@implementation AKNoteAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  CGRect v3;

  objc_msgSend(a3, "rectangle");
  return CGRectInset(v3, -1.0, -1.0);
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -1.0;
  v4 = -1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPathRef v15;
  const CGPath *v16;
  id v17;
  void *v18;
  int64_t v19;
  void *v20;
  id v21;
  id v22;
  const CGPath *v23;
  const CGPath *v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v7 = a5;
  v25 = a3;
  v10 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v25, v7, v10);

  objc_msgSend(v25, "rectangle");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v15 = CGPathCreateWithRoundedRect(v26, 1.5, 1.5, 0);
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v25, "fillColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v17, "CGColor"));
    CGContextSetBlendMode(a4, kCGBlendModeNormal);
    CGContextAddPath(a4, v16);
    CGContextFillPath(a4);
    objc_msgSend(v25, "fillColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[AKHighlightAppearanceHelper attributeTagForNoteOfColor:](AKHighlightAppearanceHelper, "attributeTagForNoteOfColor:", v18);

    if (v19 == 763000
      || (+[AKHighlightAppearanceHelper borderColorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "borderColorForNoteOfHighlightAttributeTag:", v19), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.2);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v22, "CGColor"));

      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v28 = CGRectInset(v27, 1.0, 1.0);
      v23 = CGPathCreateWithRoundedRect(v28, 0.5, 0.5, 0);
      if (v23)
      {
        v24 = v23;
        CGContextAddPath(a4, v23);
        CGContextFillPath(a4);
        CGPathRelease(v24);
      }
    }
    else
    {
      v21 = objc_retainAutorelease(v20);
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v21, "CGColor"));
      CGContextSetLineWidth(a4, 1.0);
      CGContextAddPath(a4, v16);
      CGContextStrokePath(a4);

    }
    CGPathRelease(v16);

  }
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "rectangle");
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

@end
