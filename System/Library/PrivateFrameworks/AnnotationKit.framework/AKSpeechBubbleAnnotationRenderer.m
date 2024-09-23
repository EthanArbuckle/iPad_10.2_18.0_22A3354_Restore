@implementation AKSpeechBubbleAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "pointyBitPoint");
  +[AKGeometryHelper expandCGRect:toContainPoint:](AKGeometryHelper, "expandCGRect:toContainPoint:", v5, v7, v9, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v3, "strokeWidth");
  v23 = v22 * -4.0;
  v49.origin.x = v15;
  v49.origin.y = v17;
  v49.size.width = v19;
  v49.size.height = v21;
  v50 = CGRectInset(v49, v23, v23);
  x = v50.origin.x;
  y = v50.origin.y;
  width = v50.size.width;
  height = v50.size.height;
  objc_msgSend(v3, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v28);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  if (objc_msgSend(v3, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v30, v32, v34, v36);
    v30 = v37;
    v32 = v38;
    v34 = v39;
    v36 = v40;
  }
  v51.origin.x = v30;
  v51.origin.y = v32;
  v51.size.width = v34;
  v51.size.height = v36;
  v52 = CGRectInset(v51, -1.0, -1.0);
  v41 = v52.origin.x;
  v42 = v52.origin.y;
  v43 = v52.size.width;
  v44 = v52.size.height;

  v45 = v41;
  v46 = v42;
  v47 = v43;
  v48 = v44;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
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
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPath *Mutable;
  CGPath *MutableCopy;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "strokeWidth");
  v10 = v9 * 0.5;
  objc_msgSend(v8, "originalModelBaseScaleFactor");
  v12 = v11;

  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v21 = CGRectInset(v20, v10 + v12 * 2.0, v10 + v12 * 2.0);
  v13 = v21.origin.x;
  v14 = v21.origin.y;
  v15 = v21.size.width;
  v16 = v21.size.height;
  Mutable = CGPathCreateMutable();
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v13, v14, v15, v16))
  {
    v22.origin.x = v13;
    v22.origin.y = v14;
    v22.size.width = v15;
    v22.size.height = v16;
    CGPathAddEllipseInRect(Mutable, 0, v22);
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

+ (double)pointyBitPointWidthAngleGivenControlBasePoint:(CGPoint)a3 forAnnotation:(id)a4
{
  id v4;
  double v5;
  double v6;
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
  double v21;
  double v22;
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  v4 = a4;
  objc_msgSend(v4, "rectangle");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  v14 = v13;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v6, v8, v10, v12);
  objc_msgSend(v4, "pointyBitPoint");
  v21 = v16;
  v22 = v15;

  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v21), (float64x2_t)0, v22)), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v14);
  +[AKGeometryHelper angleBetweenPoint:andPoint:](AKGeometryHelper, "angleBetweenPoint:andPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x)), v17, v18);
  return (v19 + v19) * 180.0 / 3.14159265;
}

+ (void)basePointsOfPointyBit:(id)a3 withUpdatedProperties:(id)a4 firstPoint:(CGPoint *)a5 secondPoint:(CGPoint *)a6
{
  id v9;
  id v10;
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
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;

  v9 = a3;
  v10 = a4;
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    objc_msgSend(v9, "rectangle");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v9, "pointyBitBaseWidthAngle");
    v20 = v19;
    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("pointyBitBaseWidthAngle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("pointyBitBaseWidthAngle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v20 = v23;

      }
    }
    +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v12, v14, v16, v18);
    +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v12, v14, v16, v18);
    v25 = v24;
    objc_msgSend(v9, "pointyBitPoint");
    v43 = v12;
    v44 = v16;
    v29 = *MEMORY[0x24BDBEFB0];
    v28 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v26), (float64x2_t)0, v27)), *MEMORY[0x24BDBEFB0], v28, *MEMORY[0x24BDBEFB0], v28, v25);
    +[AKGeometryHelper angleOfVector:](AKGeometryHelper, "angleOfVector:");
    v30 = v20 * 3.14159265 / 180.0;
    v31 = v18;
    v32 = v14;
    v34 = v33 + v30 * 0.5;
    +[AKGeometryHelper pointAtAngle:inCircleWithCenter:andRadius:](AKGeometryHelper, "pointAtAngle:inCircleWithCenter:andRadius:", v33 + v30 * -0.5, v29, v28, v25);
    v36 = v35;
    v38 = v37;
    +[AKGeometryHelper pointAtAngle:inCircleWithCenter:andRadius:](AKGeometryHelper, "pointAtAngle:inCircleWithCenter:andRadius:", v34, v29, v28, v25);
    v40 = v39;
    v42 = v41;
    +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", v43, v32, v44, v31);
    if (a5)
    {
      a5->x = v38 * 0.0 + 0.0 * v36 + 0.0;
      a5->y = v38 * 0.0 + 0.0 * v36 + 0.0;
    }
    if (a6)
    {
      a6->x = v42 * 0.0 + 0.0 * v40 + 0.0;
      a6->y = v42 * 0.0 + 0.0 * v40 + 0.0;
    }
  }

}

+ (CGPath)_newPathForAnnotation:(id)a3
{
  id v3;
  CGPath *Mutable;
  CGFloat v5;
  CGFloat v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v3 = a3;
  Mutable = CGPathCreateMutable();
  v23 = 0.0;
  v24 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
  +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:](AKSpeechBubbleAnnotationRenderer, "basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:", v3, 0, &v23, &v21);
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "rectangle");
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:");
  objc_msgSend(v3, "rectangle", 0, 0, 0, 0, 0, 0);
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:");
  v5 = v21;
  v6 = v22;
  v7 = 0.0 * v22 + 0.0 * v21 + 0.0;
  v8 = atan2(v24 * 0.0 + 0.0 * v23 + 0.0, v24 * 0.0 + 0.0 * v23 + 0.0);
  v9 = atan2(v7, v7);
  CGPathMoveToPoint(Mutable, 0, v5, v6);
  if (vabdd_f64(v8, v9) >= 0.0005)
    v10 = v8;
  else
    v10 = v9 + -0.0005;
  objc_msgSend(v3, "rectangle");
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  CGPathAddArc(Mutable, &v17, 0.0, 0.0, v11, v9, v10, 0);
  objc_msgSend(v3, "pointyBitPoint");
  v13 = v12;
  objc_msgSend(v3, "pointyBitPoint");
  v15 = v14;

  CGPathAddLineToPoint(Mutable, 0, v13, v15);
  CGPathAddLineToPoint(Mutable, 0, v21, v22);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

@end
