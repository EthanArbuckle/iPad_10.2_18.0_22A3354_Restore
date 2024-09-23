@implementation AKPolygonAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double x;
  double y;
  double width;
  double height;
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
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "strokeWidth");
  v13 = v12 * -4.0;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  v40 = CGRectInset(v39, v13, v13);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  objc_msgSend(v3, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  if (objc_msgSend(v3, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v20, v22, v24, v26);
    v20 = v27;
    v22 = v28;
    v24 = v29;
    v26 = v30;
  }
  v41.origin.x = v20;
  v41.origin.y = v22;
  v41.size.width = v24;
  v41.size.height = v26;
  v42 = CGRectInset(v41, -1.0, -1.0);
  v31 = v42.origin.x;
  v32 = v42.origin.y;
  v33 = v42.size.width;
  v34 = v42.size.height;

  v35 = v31;
  v36 = v32;
  v37 = v33;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
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

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "strokeWidth");
  v11 = v10;
  objc_msgSend(v9, "originalModelBaseScaleFactor");
  v13 = v12;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (CGRectIsEmpty(v26))
  {
    objc_msgSend(v9, "rectangle");
    x = v14;
    y = v15;
    width = v16;
    height = v17;
  }
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v28 = CGRectInset(v27, v11 * 0.5 + v13 * 2.0, v11 * 0.5 + v13 * 2.0);
  v18 = v28.origin.x;
  v19 = v28.origin.y;
  v20 = v28.size.width;
  v21 = v28.size.height;

  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "strokeWidth");
  v10 = v9 * 0.5;
  objc_msgSend(v8, "originalModelBaseScaleFactor");
  v12 = v11;

  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return CGRectInset(v13, -(v10 + v12 * 2.0), -(v10 + v12 * 2.0));
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPath *Mutable;
  CGFloat v20;
  const CGPath *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat MidY;
  CGFloat MidX;
  CGFloat v29;
  CGPath *MutableCopy;
  double v32;
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v36;
  CGAffineTransform m;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect BoundingBox;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "strokeWidth");
  v11 = v10 * 0.5;
  objc_msgSend(v9, "originalModelBaseScaleFactor");
  v13 = v11 + v12 * 2.0;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v39 = CGRectInset(v38, v13, v13);
  v14 = v39.origin.x;
  v15 = v39.origin.y;
  v16 = v39.size.width;
  v17 = v39.size.height;
  v32 = CGRectGetWidth(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v18 = CGRectGetWidth(v40);
  Mutable = CGPathCreateMutable();
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v14, v15, v16, v17))
  {
    v20 = v32 / v18;
    v21 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:", v9);
    BoundingBox = CGPathGetBoundingBox(v21);
    v22 = BoundingBox.origin.x;
    v23 = BoundingBox.origin.y;
    v24 = BoundingBox.size.width;
    v25 = BoundingBox.size.height;
    memset(&m, 0, sizeof(m));
    v26 = -CGRectGetMidX(BoundingBox);
    v42.origin.x = v22;
    v42.origin.y = v23;
    v42.size.width = v24;
    v42.size.height = v25;
    MidY = CGRectGetMidY(v42);
    CGAffineTransformMakeTranslation(&m, v26, -MidY);
    CGAffineTransformMakeScale(&t2, v20, v20);
    t1 = m;
    CGAffineTransformConcat(&v36, &t1, &t2);
    m = v36;
    v43.origin.x = v22;
    v43.origin.y = v23;
    v43.size.width = v24;
    v43.size.height = v25;
    MidX = CGRectGetMidX(v43);
    v44.origin.x = v22;
    v44.origin.y = v23;
    v44.size.width = v24;
    v44.size.height = v25;
    v29 = CGRectGetMidY(v44);
    CGAffineTransformMakeTranslation(&v33, MidX, v29);
    t1 = m;
    CGAffineTransformConcat(&v36, &t1, &v33);
    m = v36;
    CGPathAddPath(Mutable, &m, v21);
    CGPathRelease(v21);
  }
  MutableCopy = CGPathCreateMutableCopy(Mutable);
  CGPathRelease(Mutable);

  return MutableCopy;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  int v12;
  const CGPath *v13;
  uint64_t v14;
  void *v15;
  id v16;
  double Alpha;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  AKTSDShape *v24;
  id v25;
  CGAffineTransform v26[2];

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
  v12 = objc_msgSend(v10, "hasShadow");
  if (v12)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
  CGContextSaveGState(a4);
  memset(&v26[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
  v26[0] = v26[1];
  CGContextConcatCTM(a4, v26);
  CGContextSaveGState(a4);
  v13 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:", v10);
  objc_msgSend(v10, "fillColor");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v10, "fillColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v16, "CGColor"));

    if (Alpha != 0.0)
    {
      objc_msgSend(v10, "fillColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v18, "CGColor"));

      CGContextAddPath(a4, v13);
      CGContextFillPath(a4);
    }
  }
  objc_msgSend(v10, "strokeColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (objc_msgSend(v10, "brushStyle"))
    {
      v20 = objc_msgSend(v10, "brushStyle");
      objc_msgSend(v10, "strokeColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "strokeWidth");
      +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc_init(AKTSDShape);
      -[AKTSDShape setStroke:](v24, "setStroke:", v22);
      -[AKTSDShape setPath:](v24, "setPath:", v23);
      -[AKTSDShape drawInContext:](v24, "drawInContext:", a4);

    }
    else
    {
      objc_msgSend(v10, "strokeColor");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v25, "CGColor"));

      objc_msgSend(v10, "strokeWidth");
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if (objc_msgSend(v10, "isDashed"))
      {
        objc_msgSend(v10, "strokeWidth");
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      CGContextAddPath(a4, v13);
      CGContextStrokePath(a4);
    }
  }
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v10, a4, v7, v11);
  CGContextRestoreGState(a4);
  if (v12)
    +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
  CGPathRelease(v13);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  const CGPath *v10;
  double v11;
  CGPath *v12;
  BOOL v13;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform m;
  CGPoint v18;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:", v9);
  objc_msgSend(v9, "strokeWidth");
  if (v11 <= a5)
    v11 = a5;
  v12 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v10, v11);
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v9, 0);

  v15 = m;
  CGAffineTransformInvert(&v16, &v15);
  m = v16;
  v18.x = x;
  v18.y = y;
  v13 = CGPathContainsPoint(v12, &m, v18, 0);
  CGPathRelease(v12);
  CGPathRelease(v10);
  return v13;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  const CGPath *v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform m;
  CGPoint v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:", v7);
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v7, 0);

  v10 = m;
  CGAffineTransformInvert(&v11, &v10);
  m = v11;
  v13.x = x;
  v13.y = y;
  LOBYTE(v7) = CGPathContainsPoint(v8, &m, v13, 0);
  CGPathRelease(v8);
  return (char)v7;
}

+ (CGPath)_newPathForAnnotation:(id)a3
{
  id v3;
  CGPath *Mutable;
  double v5;
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  Mutable = CGPathCreateMutable();
  if (objc_msgSend(v3, "pointCount") == 6)
    v5 = 30.0;
  else
    v5 = 0.0;
  objc_msgSend(v3, "rectangle");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MidY = CGRectGetMidY(v28);
  v12 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v3, "originalExifOrientation"));
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v12, x, y, width, height, MidX, MidY);
  +[AKGeometryHelper verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:](AKGeometryHelper, "verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:", objc_msgSend(v3, "pointCount"), objc_msgSend(v3, "verticallyFlipped"), v13, v14, v15, v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "pointCount"))
  {
    v18 = 0;
    do
    {
      objc_msgSend(v17, "objectAtIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "akPointValue");
      v21 = v20;
      v23 = v22;

      +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v12, v21, v23, MidX, MidY);
      if (v18)
        CGPathAddLineToPoint(Mutable, 0, v24, v25);
      else
        CGPathMoveToPoint(Mutable, 0, v24, v25);
      ++v18;
    }
    while (v18 < objc_msgSend(v3, "pointCount"));
  }
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

@end
