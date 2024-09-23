@implementation AKArrowShapeAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v4;
  const CGPath *Mutable;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect BoundingBox;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  v4 = a3;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a1, "_drawPathForArrowShape:inContext:inPath:", v4, 0, Mutable);
  BoundingBox = CGPathGetBoundingBox(Mutable);
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  CGPathRelease(Mutable);
  objc_msgSend(v4, "strokeWidth");
  v11 = v10 * -4.0;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v30 = CGRectInset(v29, v11, v11);
  v12 = v30.origin.x;
  v13 = v30.origin.y;
  v14 = v30.size.width;
  v15 = v30.size.height;
  if (objc_msgSend(v4, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v4, v12, v13, v14, v15);
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v15 = v19;
  }
  v31.origin.x = v12;
  v31.origin.y = v13;
  v31.size.width = v14;
  v31.size.height = v15;
  v32 = CGRectInset(v31, -1.0, -1.0);
  v20 = v32.origin.x;
  v21 = v32.origin.y;
  v22 = v32.size.width;
  v23 = v32.size.height;

  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  id v5;
  const CGPath *Mutable;
  CGPath *v7;
  CGPath *MutableCopy;

  v5 = a3;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a1, "_drawPathForArrowShape:inContext:inPath:", v5, 0, Mutable);

  v7 = CGPathCreateMutable();
  CGPathAddPath(v7, 0, Mutable);
  CGPathRelease(Mutable);
  MutableCopy = CGPathCreateMutableCopy(v7);
  CGPathRelease(v7);
  return MutableCopy;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  int v11;
  const CGPath *Mutable;
  uint64_t v13;
  void *v14;
  id v15;
  double Alpha;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  AKTSDShape *v23;
  id v24;
  id v25;

  v7 = a5;
  v25 = a3;
  v10 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v25, v7, v10);
  v11 = objc_msgSend(v25, "hasShadow");
  if (v11)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v25);
  CGContextSaveGState(a4);
  Mutable = CGPathCreateMutable();
  objc_msgSend(a1, "_drawPathForArrowShape:inContext:inPath:", v25, 0, Mutable);
  objc_msgSend(v25, "fillColor");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v25, "fillColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v15, "CGColor"));

    if (Alpha != 0.0)
    {
      objc_msgSend(v25, "fillColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v17, "CGColor"));

      CGContextAddPath(a4, Mutable);
      CGContextFillPath(a4);
    }
  }
  objc_msgSend(v25, "strokeColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (objc_msgSend(v25, "brushStyle"))
    {
      v19 = objc_msgSend(v25, "brushStyle");
      objc_msgSend(v25, "strokeColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "strokeWidth");
      +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", Mutable);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc_init(AKTSDShape);
      -[AKTSDShape setStroke:](v23, "setStroke:", v21);
      -[AKTSDShape setPath:](v23, "setPath:", v22);
      -[AKTSDShape drawInContext:](v23, "drawInContext:", a4);

    }
    else
    {
      objc_msgSend(v25, "strokeColor");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v24, "CGColor"));

      objc_msgSend(v25, "strokeWidth");
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if (objc_msgSend(v25, "isDashed"))
      {
        objc_msgSend(v25, "strokeWidth");
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      CGContextAddPath(a4, Mutable);
      CGContextStrokePath(a4);
    }
  }
  CGPathRelease(Mutable);
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v25, a4, v7, v10);
  if (v11)
    +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  const CGPath *Mutable;
  double v11;
  double v12;
  double v13;
  CGPath *v14;
  BOOL v15;
  CGPoint v17;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a1, "_drawPathForArrowShape:inContext:inPath:", v9, 0, Mutable);
  objc_msgSend(v9, "strokeWidth");
  v12 = v11;

  if (v12 <= a5)
    v13 = a5;
  else
    v13 = v12;
  v14 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", Mutable, v13);
  v17.x = x;
  v17.y = y;
  v15 = CGPathContainsPoint(v14, 0, v17, 0);
  CGPathRelease(v14);
  CGPathRelease(Mutable);
  return v15;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  const CGPath *Mutable;
  CGPoint v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a1, "_drawPathForArrowShape:inContext:inPath:", v7, 0, Mutable);

  v10.x = x;
  v10.y = y;
  LOBYTE(a1) = CGPathContainsPoint(Mutable, 0, v10, 0);
  CGPathRelease(Mutable);
  return (char)a1;
}

+ (void)_drawPathForArrowShape:(id)a3 inContext:(CGContext *)a4 inPath:(CGPath *)Mutable
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  id v33;
  double Alpha;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;

  v40 = a3;
  objc_msgSend(v40, "startPoint");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v40, "endPoint");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v40, "arrowHeadLength");
  v16 = v15;
  objc_msgSend(v40, "arrowHeadWidth");
  v18 = v17;
  objc_msgSend(v40, "arrowLineWidth");
  v20 = v19;
  v38 = v18;
  if (Mutable)
    CGPathRetain(Mutable);
  else
    Mutable = CGPathCreateMutable();
  v21 = v12 - v8;
  v39 = v10;
  v22 = v14 - v10;
  v23 = hypot(v12 - v8, v14 - v10);
  if (v23 > 0.0)
  {
    v24 = v23;
    if ((objc_msgSend(v40, "arrowHeadStyle") & 2) != 0)
    {
      v25 = v24 + -0.1;
      if (v24 >= v16)
        v25 = v16;
      v26 = v12 - v21 * v25 / v24;
      v37 = v8;
      v27 = v14 - v22 * v25 / v24;
      v36 = v22 * (v20 * 0.5) / v24;
      v28 = v21 * (v20 * 0.5) / v24;
      CGPathMoveToPoint(Mutable, 0, v26 - v36, v28 + v27);
      v29 = v22 * (v38 * 0.5) / v24;
      v30 = v21 * (v38 * 0.5) / v24;
      CGPathAddLineToPoint(Mutable, 0, v26 - v29, v30 + v27);
      CGPathAddLineToPoint(Mutable, 0, v12, v14);
      CGPathAddLineToPoint(Mutable, 0, v29 + v26, v27 - v30);
      CGPathAddLineToPoint(Mutable, 0, v36 + v26, v27 - v28);
      CGPathAddLineToPoint(Mutable, 0, v37 + v36, v39 - v28);
      CGPathAddLineToPoint(Mutable, 0, v37 - v36, v39 + v28);
      CGPathAddLineToPoint(Mutable, 0, v26 - v36, v28 + v27);
      if (a4)
      {
        objc_msgSend(v40, "fillColor");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          objc_msgSend(v40, "fillColor");
          v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v33, "CGColor"));

          if (Alpha != 0.0)
          {
            CGContextAddPath(a4, Mutable);
            CGContextFillPath(a4);
          }
        }
        objc_msgSend(v40, "strokeColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          CGContextAddPath(a4, Mutable);
          CGContextStrokePath(a4);
        }
      }
    }
  }
  CGPathRelease(Mutable);

}

@end
